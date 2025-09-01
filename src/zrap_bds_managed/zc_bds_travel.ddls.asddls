@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'

@Metadata.allowExtensions: true
define root view entity ZC_BDS_TRAVEL
  provider contract transactional_query
  as projection on ZI_BDS_Travel
{

  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{  entity: {
         name: '/DMO/I_Agency',
         element: 'AgencyID'
      }}]
      AgencyId,
      _Agency.name             as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{  entity: {
          name: '/DMO/I_Customer',
          element: 'CustomerID'
      }}]
      CustomerId,
      _Customer.last_name      as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{  entity: {
          name: 'I_CurrencyStdVH',
          element: 'Currency'
      }}]
      CurrencyCode,
      Description,
      @Consumption.valueHelpDefinition: [{ entity: {
          name: '/DMO/I_Travel_Status_VH',
          element: 'TravelStatus'
      } }]
      @ObjectModel.text.element: [ 'StatusText' ]
      Status,
      _TravelStatus._Text.Text as StatusText : localized,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat





}
