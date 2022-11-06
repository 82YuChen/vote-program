class CandidatesController < ApplicationController

    def index
        @candidates = Candidate.all
    end

    def show
        @candidate = Candidate.find_by(id: params[:id])
    end
    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            flash[:notice] = "候選人新建成功！"
            redirect_to '/candidates'
        else
            render :new     #如果沒填會在同個頁面，且保留其他資料，再次回到new.html.erb
        end
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end

end