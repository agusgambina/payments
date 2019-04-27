class PaymentsController < ApplicationController
    def new
        @payment = Payment.new
    end

    def edit
        @payment = Payment.find(params[:id])
    end

    def update
        @payment = Payment.find(params[:id])
       
        if @payment.update(payment_params)
          redirect_to @payment
        else
          render 'edit'
        end
    end

    def create
        @payment = Payment.new(payment_params)
 
        if @payment.save
            redirect_to @payment
        else
            render 'new'
        end
    end

    def index
        @payments = Payment.all
      end

    def show
        @payment = Payment.find(params[:id])
    end

    def destroy
        @payment = Payment.find(params[:id])
        @payment.destroy
       
        redirect_to payments_path
    end

    private
    def payment_params
        params.require(:payment).permit(:building, :unit, :date, :name, :amount, :comments)
    end
end
