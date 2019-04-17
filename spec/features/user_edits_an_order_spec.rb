require "rails_helper"

feature  "User edits an order" do
  let!(:honey_bbq_flavor) { Flavor.create(name: "Honey BBQ") }
  let!(:sweet_chili_flavor) { Flavor.create(name: "Sweet Chili") }
  let(:wing_order) do
    WingOrder.create(
      customer_name: "Gene Parmesean",
      city: "Boston",
      state: "MA",
      quantity: 100,
      ranch_dressing: true
    )
  end


  scenario "successfully change wing order" do
    visit edit_wing_order_path(wing_order)
    check "Honey BBQ"
    check "Sweet Chili"
    click_button "Place Order"


    expect(page).to have_current_path("/wing_orders")
    expect(page).to have_content("Honey BBQ")
  end
end
