@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZI_BDS_Travel
  as select from zdt_bds_travel 
  
  //composition [0..*] of zdt_bds_booking as _Booking
  
  association[1..1] to zdt_bds_customer as _Customer
  on $projection.CustomerId = _Customer.customer_id
  association[1..1] to zdt_bds_agency as _Agency
  on $projection.AgencyId = _Agency.agency_id 
  association [1..1] to /DMO/I_Travel_Status_VH as _TravelStatus 
  on $projection.Status = _TravelStatus.TravelStatus
  association [0..1] to I_Currency       as _Currency 
  on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id as TravelId,
  agency_id as AgencyId,
  customer_id as CustomerId,
  begin_date as BeginDate,
  end_date as EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  booking_fee as BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  total_price as TotalPrice,
  currency_code as CurrencyCode,
  description as Description,
  status as Status,
  createdby as Createdby,
  createdat as Createdat,
  lastchangedby as Lastchangedby,
  lastchangedat as Lastchangedat,
  
  _Customer,
  _Agency,
  _TravelStatus,
  _Currency
}
