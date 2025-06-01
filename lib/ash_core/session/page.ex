defmodule AshCore.Session.Page do
  use Ash.Resource,
    otp_app: :ash_core,
    domain: AshCore.Session,
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults [:read, :destroy]

    create :create do
      accept [:session_id, :name, :count]
    end

    update :update do
      accept [:name, :count]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :session_id, :string do
      allow_nil? false
    end

    attribute :name, :string

    attribute :count, :integer do
      default 0
    end

    timestamps()
  end
end
