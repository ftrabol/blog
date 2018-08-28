class HeroController < ApplicationController
 
  # muestra todos los heroes en la vista app/views/index.html.erb
  def index
    @hero = Hero.all # obtenemos todos los héroes
  end
 
  # muestra el formulario para crear un nuevo héroe en la vista app/views/new.html.erb
  def new
    @hero = Hero.new # creamos una nueva instancia de un héroes
  end

  def destroy
    @hero = Hero.find_by(name: params[:name])
    @hero.destroy
    redirect_to :action => :index
  end

  def edit
    @hero = Hero.find(params[:id])
    Rails.logger.debug("buscado: #{@hero.inspect}")
  end

  def update
    @hero = Hero.find(params[:id])
    Rails.logger.debug("actualizado: #{@hero.inspect}")

    if @hero.update(hero_params)
       redirect_to action: 'index'
    else
       render 'edit'
    end
  end

  # procesa el formulario de heroes
  def create
    @hero = Hero.new(hero_params) # creamos una nueva instancia de un héroe con los datos post
 
    if @hero.save
      flash[:notice] = 'El héroe se ha creado correctamente.'
      redirect_to action: 'index'
    else
      render :new
    end
  end
 
  private
    # campos permitidos para crear un nuevo héroes
    def hero_params
      params.require(:hero).permit(:name, :powers)
    end
end

