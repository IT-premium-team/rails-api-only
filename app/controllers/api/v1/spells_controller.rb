module Api
    module V1
        class SpellsController < ApplicationController
            rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed # for destroy method
        
            def index 
                render json: Spell.all
            end
        
            def create 
                spell = Spell.create(spell_params)
        
                if spell.save
                    render json: spell, status: :created
                else
                    render json: spell.errors, status: :unprocessable_entity
                end
            end
        
            def destroy
                Spell.find(params[:id]).destroy!
        
                head :no_content
            end
        
            private
        
            def spell_params
                params.require(:spell).permit(:name, :description)
            end
        
            # instead of just rescue block
            def not_destroyed(err)
                render json: {errors: err.record}, status: :bad_request
            end
        end
    end
end