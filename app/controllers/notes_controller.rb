class NotesController < ApplicationController
    
    #before any of this is run, run 'find_note' but only for the 4 methods.
    before_action :find_note, only: [:show, :edit, :update, :destroy]
    
    def index
        #when you're @ index, there is code to go through all notes, this is what defines that (DESC = descending order)
        @notes = Note.all.order("created_at DESC")
    end

    def show
        
    end

    def new
        @note = Note.new
    end
    
    def create
         @note = Note.new(note_params)
         
         #if the note saved correctly
         if @note.save
             #go to it
             redirect_to @note
         else
             #render the new form again
             render 'new'
         end
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
    
    #this is private because we are using it through the CRUD, so we need it in the 'before action'
    def find_note
        # make the current note by looking it up by the ID
        # when creating a new one, the ID gets passed as a param
        @note = Note.find(params[:id])
    end
    
    def note_params
        params.require(:note).permit(:title, :content)
    end
end
