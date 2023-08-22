with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,
        -- add a comment about something here to trigger a new run
        --`amount` is currently stored in cents, so we convert it to dollars
        -- test adding commit doesn't trigger ci on regular draft run
        amount / 100 as amount

    from source

)

select * from renamed
