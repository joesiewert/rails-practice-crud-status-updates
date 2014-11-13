require "rails_helper"

  feature "Statuses" do

    scenario "Create and view status" do
      visit root_path
      click_on "Add Status"
      fill_in "Status", with: "Trying this out!"
      fill_in "User", with: "joe"
      fill_in "Likes", with: "5"
      click_on "Create Status"
      expect(page).to have_content("Status created!")
      expect(page).to have_content("Trying this out!")
      expect(page).to have_content("joe")
      expect(page).to have_content("5")
    end

    scenario "Update a status" do
      visit root_path
      click_on "Add Status"
      fill_in "Status", with: "Trying this out!"
      fill_in "User", with: "joe"
      fill_in "Likes", with: "5"
      click_on "Create Status"
      visit root_path
      click_on "Edit"
      fill_in "Status", with: "Trying this out again!"
      fill_in "User", with: "user"
      fill_in "Likes", with: "7"
      click_on"Update Status"
      expect(page).to have_content("Status updated!")
      expect(page).to have_content("Trying this out again!")
      expect(page).to have_content("user")
      expect(page).to have_content("7")
    end

    scenario "Delete a status" do
      visit root_path
      click_on "Add Status"
      fill_in "Status", with: "Trying this out!"
      fill_in "User", with: "joe"
      fill_in "Likes", with: "5"
      click_on "Create Status"
      visit root_path
      click_on "Delete"
      expect(page).to have_content("Status deleted!")
      expect(page).to have_no_content("Trying this out!")
      expect(page).to have_no_content("joe")
      expect(page).to have_no_content("5")
    end

    scenario "Create with invalid data" do
      visit root_path
      click_on "Add Status"
      click_on "Create Status"
      expect(page).to have_content("Status can't be blank ")
      expect(page).to have_content("User can't be blank ")
      expect(page).to have_content("Likes can't be blank ")
    end
  end
