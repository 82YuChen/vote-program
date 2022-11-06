class CandidatesController < ApplicationController

    before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]
                                #    except: [:new, :index, :create]
    def index
        @candidates = Candidate.all
    end

    def show
    end
    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            # flash[:notice] = "候選人新建成功！"
            redirect_to '/candidates', notice: '候選人新建成功！'
        else
            render :new     #如果沒填會在同個頁面，且保留其他資料，再次回到new.html.erb
        end
    end

    def edit
    end

    def update

        if @candidate.update(candidate_params)
            # flash[:notice] = "候選人檔案更新成功！"
            redirect_to '/candidates', notice: '候選人檔案更新成功！'
        else
            render :edit
        end
    end

    def destroy
        @candidate.destroy

        # flash[:notice] = "候選人檔案刪除成功！"
        redirect_to '/candidates', notice: '候選人檔案刪除成功！'
    end

    def vote
        @candidate.vote_logs.create(ip_address: request.remote_ip)

        # VoteLog.create(candidate: @candidate, ip_address: request.remote_ip)
        # @candidate.votes = @candidate.votes + 1 #(increment(:votes))
        # @candidate.save

        # flash[:notice] = "投票完成"
        redirect_to '/candidates', notice: '投票完成'
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
end