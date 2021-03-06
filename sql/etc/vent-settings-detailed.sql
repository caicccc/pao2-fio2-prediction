
select
  patientunitstayid, respchartoffset as chartoffset
  -- case statement determining whether it is an instance of mech vent
 , respchartvaluelabel
  , case
    -- fio2
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'FIO2 (%)' THEN 'FIO2 (%)'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'FiO2' THEN 'FiO2'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'FiO2' THEN 'FiO2'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Percentage' THEN 'O2 Percentage'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Set Fraction of Inspired Oxygen (FIO2)' THEN 'Set Fraction of Inspired Oxygen (FIO2)'

    -- tidal volume // Vt
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'A1: High Exhaled Vt' THEN 'A1: High Exhaled Vt'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Spont Exp Vt' THEN 'Adult Con Setting Spont Exp Vt'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent InspiratorTV' THEN 'Adult Con Pt/Vent InspiratorTV'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Exhaled TV (machine)' THEN 'Exhaled TV (machine)'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Exhaled TV (patient)' THEN 'Exhaled TV (patient)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Exhaled Vt' THEN 'Exhaled Vt'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Set Vt (Drager)' THEN 'Set Vt (Drager)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Set Vt (Servo,LTV)' THEN 'Set Vt (Servo,LTV)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Spont TV' THEN 'Spont TV'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'TV/kg IBW' THEN 'TV/kg IBW'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Tidal Volume (set)' THEN 'Tidal Volume (set)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tidal Volume Observed (VT)' THEN 'Tidal Volume Observed (VT)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tidal Volume, Delivered' THEN 'Tidal Volume, Delivered'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tidal Volume, Spontaneous' THEN 'Tidal Volume, Spontaneous'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Vt Spontaneous (mL)' THEN 'Vt Spontaneous (mL)'

    -- extubation
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Extubation Date' THEN 'Extubation Date'

    -- respiratory rate
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Set RR' THEN 'Adult Con Setting Set RR'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Set RR' THEN 'Adult Con Setting Set RR'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent Spont Rate' THEN 'Adult Con Pt/Vent Spont Rate'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Backup RR (Set)' THEN 'Backup RR (Set)'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'RR (patient)' THEN 'RR (patient)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'RR Spont' THEN 'RR Spont'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Resp Rate Total' THEN 'Resp Rate Total'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Spontaneous Respiratory Rate' THEN 'Spontaneous Respiratory Rate'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Total RR' THEN 'Total RR'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'VS RESP RATE' THEN 'VS RESP RATE'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Vent Rate' THEN 'Vent Rate'

    -- triggers
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Flow Sensitivity' THEN 'Flow Sensitivity'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Flowtrigger' THEN 'Flowtrigger'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Pressure to Trigger PS' THEN 'Pressure to Trigger PS'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Trigger' THEN 'Trigger'

    -- end tidal co2
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent ETCO2' THEN 'Adult Con Pt/Vent ETCO2'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent ETCO2_' THEN 'Adult Con Pt/Vent ETCO2_'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'ETCO2' THEN 'ETCO2'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'End Tidal CO2 (mmHg)' THEN 'End Tidal CO2 (mmHg)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'End Tidal CO2 Status' THEN 'End Tidal CO2 Status'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'EtCO2' THEN 'EtCO2'

    -- weight / ideal body weight
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent IBW in Kg' THEN 'Adult Con Pt/Vent IBW in Kg'

    -- oxygen saturation
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent SpO2' THEN 'Adult Con Pt/Vent SpO2'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'SaO2' THEN 'SaO2'

    -- oxygen flow
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'LPM O2' THEN 'LPM O2'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Liter Flow (1L or More)' THEN 'O2 Liter Flow (1L or More)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Flow Rate' THEN 'Oxygen Flow Rate'

    -- minute ventilation
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent MinuteVentil' THEN 'Adult Con Pt/Vent MinuteVentil'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Exhaled MV' THEN 'Exhaled MV'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'MVe' THEN 'MVe'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Minute Ventilation Set(L/min)' THEN 'Minute Ventilation Set(L/min)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Minute Volume, Spontaneous' THEN 'Minute Volume, Spontaneous'

    -- mean airway pressure
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mean Airway Pressure' THEN 'Mean Airway Pressure'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Mean Airway Pressure' THEN 'Mean Airway Pressure'

    -- other pressures
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Peak Insp. Pressure' THEN 'Peak Insp. Pressure'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Peak Pressure' THEN 'Peak Pressure'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Plateau Pressure' THEN 'Plateau Pressure'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Plateau Pressure' THEN 'Plateau Pressure'


    -- ventilator waveform settings
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilation Slope' THEN 'Mechanical Ventilation Slope'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator Compliance' THEN 'Mechanical Ventilator Compliance'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator High Tidal Volume Alarm' THEN 'Mechanical Ventilator High Tidal Volume Alarm'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator ID Number' THEN 'Mechanical Ventilator ID Number'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator Mode' THEN 'Mechanical Ventilator Mode'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator Resistance' THEN 'Mechanical Ventilator Resistance'

    -- pao2/fio2
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = '3. PaO2/FiO2 Ratio' THEN '3. PaO2/FiO2 Ratio'

    -- peep
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Auto PEEP' THEN 'Auto PEEP'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'PEEP' THEN 'PEEP'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'PEEP/CPAP' THEN 'PEEP/CPAP'

    -- I:E // IPAP // EPAP
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Backup IInsp Time (sec)' THEN 'Backup IInsp Time (sec)'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'B1: IPAP' THEN 'B1: IPAP'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'IPAP' THEN 'IPAP'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'IPAP' THEN 'IPAP'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'IPAP' THEN 'IPAP'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'B2: EPAP' THEN 'B2: EPAP'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'EPAP' THEN 'EPAP'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'EPAP' THEN 'EPAP'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'EPAP' THEN 'EPAP'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'I:E Ratio' THEN 'I:E Ratio'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PD I:E RATIO' THEN 'PD I:E RATIO'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'T Peep' THEN 'T Peep'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'epap' THEN 'epap'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'ipap' THEN 'ipap'

    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Set I:E' THEN 'Adult Con Setting Set I:E'
    -- WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = '5. ARDS Eval (M or DNM)' THEN '5. ARDS Eval (M or DNM)'
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'A2: External Room Alarm' THEN 'A2: External Room Alarm'
    -- head of bed
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'HOB Elevated 30-45 Degrees at All Times' THEN 'HOB Elevated 30-45 Degrees at All Times'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Head of Bed Elevated' THEN 'Head of Bed Elevated'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Head of Bed Elevation' THEN 'Head of Bed Elevation'

    -- inspiration
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Insp Cycle Off (%)' THEN 'Insp Cycle Off (%)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Insp Flow (l/min)' THEN 'Insp Flow (l/min)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Insp Time (%)' THEN 'Insp Time (%)'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Inspiratory Flow Rate' THEN 'Inspiratory Flow Rate'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Inspiratory Pressure, Set' THEN 'Inspiratory Pressure, Set'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Inspiratory Time' THEN 'Inspiratory Time'

    -- vent mode
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Bipap Delivery Mode' THEN 'Bipap Delivery Mode'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'CPAP' THEN 'CPAP'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Mode of Ventilation' THEN 'Mode of Ventilation'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Pressure Control' THEN 'Pressure Control'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Pressure Support' THEN 'Pressure Support'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Respiratory Device' THEN 'Respiratory Device'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sigh' THEN 'Sigh'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Support Mode' THEN 'Ventilator Support Mode'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Type' THEN 'Ventilator Type'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Volume Guarantee' THEN 'Volume Guarantee'

    -- oxygen delivery device
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'O2 Admin Device' THEN 'O2 Admin Device'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Admin Device 2' THEN 'O2 Admin Device 2'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Device' THEN 'O2 Device'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Delivery Comments' THEN 'Oxygen Delivery Comments'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Delivery Method' THEN 'Oxygen Delivery Method'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Delivery Status' THEN 'Oxygen Delivery Status'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'RETIRED O2 Device' THEN 'RETIRED O2 Device'

    -- NIV
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent Mask Type' THEN 'NIV Pt/Vent Mask Type'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent SpO2_5' THEN 'NIV Pt/Vent SpO2_5'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent Spont_Rate' THEN 'NIV Pt/Vent Spont_Rate'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent Spont_TidalV' THEN 'NIV Pt/Vent Spont_TidalV'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Circuit T_5' THEN 'NIV Setting Circuit T_5'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting EPAP' THEN 'NIV Setting EPAP'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Heliox_5' THEN 'NIV Setting Heliox_5'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Leak_' THEN 'NIV Setting Leak_'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Set_RR' THEN 'NIV Setting Set_RR'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Spont Exp Vt_5' THEN 'NIV Setting Spont Exp Vt_5'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Total RR_5' THEN 'NIV Setting Total RR_5'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Non Invasive Ventilation Comments' THEN 'Non Invasive Ventilation Comments'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Non Invasive Ventilator Type' THEN 'Non Invasive Ventilator Type'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Non-invasive Ventilation Mode' THEN 'Non-invasive Ventilation Mode'

    -- RSBI
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'RSBI' THEN 'RSBI'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Sedation Scoring Ventilation Depth' THEN 'Sedation Scoring Ventilation Depth'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sedation Scoring Ventilation Depth' THEN 'Sedation Scoring Ventilation Depth'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Total RSBI' THEN 'Total RSBI'

    -- SBT // weaning
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Reason SBT Terminated' THEN 'Reason SBT Terminated'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'SBT Method' THEN 'SBT Method'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sedation Wean' THEN 'Sedation Wean'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Spontaneous Breathing Trial With Pressure Support' THEN 'Spontaneous Breathing Trial With Pressure Support'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Assessment Criteria Collaboration' THEN 'Weaning Assessment Criteria Collaboration'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Minute Volume' THEN 'Weaning Minute Volume'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Negative Inspiratory Force' THEN 'Weaning Negative Inspiratory Force'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Performed' THEN 'Weaning Performed'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Respiratory Rate' THEN 'Weaning Respiratory Rate'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning SBT Readiness Add''l Info' THEN 'Weaning SBT Readiness Add''l Info'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning SBT Readiness Criteria' THEN 'Weaning SBT Readiness Criteria'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Start Time' THEN 'Weaning Start Time'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Trials Additional Comments' THEN 'Weaning Trials Additional Comments'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Vital Capacity' THEN 'Weaning Vital Capacity'

    -- sedation // needs to be classified properly
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'WUA Patient Response/RASS Score' THEN 'WUA Patient Response/RASS Score'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Wake up assessment interventions' THEN 'Wake up assessment interventions'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Wake up assessment outcome' THEN 'Wake up assessment outcome'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Wake up assessment performed' THEN 'Wake up assessment performed'

    -- ??? not sure
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Measured Ve' THEN 'Measured Ve'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PS' THEN 'PS'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PS above PEEP' THEN 'PS above PEEP'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PULSE OX RESULTS VT' THEN 'PULSE OX RESULTS VT'
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Peak Flow' THEN 'Peak Flow'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Position at lip' THEN 'Position at lip'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Postion at Lip' THEN 'Postion at Lip'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Rise' THEN 'Rise'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Rise T' THEN 'Rise T'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'SET INSP TIME' THEN 'SET INSP TIME'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Secured by' THEN 'Secured by'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sedation outcome' THEN 'Sedation outcome'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Trapped Volume' THEN 'Trapped Volume'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Treatments' THEN 'Treatments'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Type of Treatment' THEN 'Type of Treatment'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Unable to Obtain PEEPi and Vtrap' THEN 'Unable to Obtain PEEPi and Vtrap'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Vti' THEN 'Vti'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'f Total' THEN 'f Total'

    -- ETT info
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ET Tube Repositioned' THEN 'ET Tube Repositioned'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion Date' THEN 'ETT Insertion Date'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion Time' THEN 'ETT Insertion Time'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion date' THEN 'ETT Insertion date'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion date' THEN 'ETT Insertion date'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion time' THEN 'ETT Insertion time'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Peptic Ulcer Prophylaxis' THEN 'ETT Peptic Ulcer Prophylaxis'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Rotation' THEN 'ETT Rotation'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Sedation Vacation' THEN 'ETT Sedation Vacation'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Position at Lip' THEN 'Endotracheal Position at Lip'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Tube Moved to' THEN 'Endotracheal Tube Moved to'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Tube Placement' THEN 'Endotracheal Tube Placement'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Tube Placement Checked' THEN 'Endotracheal Tube Placement Checked'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Secured at-ETT' THEN 'Secured at-ETT'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Secured at-ETT' THEN 'Secured at-ETT'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tube Size-ETT' THEN 'Tube Size-ETT'
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Type-ETT' THEN 'Type-ETT'


    -- **************** **************** ****************
    -- **************** PRE-PROCESS DATA ****************
    -- **************** **************** ****************

  , case
    -- fio2
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'FIO2 (%)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'FiO2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'FiO2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Percentage' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Set Fraction of Inspired Oxygen (FIO2)' THEN respchartvalue

    -- tidal volume // Vt
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'A1: High Exhaled Vt' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Spont Exp Vt' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent InspiratorTV' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Exhaled TV (machine)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Exhaled TV (patient)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Exhaled Vt' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Set Vt (Drager)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Set Vt (Servo,LTV)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Spont TV' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'TV/kg IBW' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Tidal Volume (set)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tidal Volume Observed (VT)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tidal Volume, Delivered' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tidal Volume, Spontaneous' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Vt Spontaneous (mL)' THEN respchartvalue

    -- extubation
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Extubation Date' THEN respchartvalue

    -- respiratory rate
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Set RR' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Set RR' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent Spont Rate' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Backup RR (Set)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'RR (patient)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'RR Spont' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Resp Rate Total' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Spontaneous Respiratory Rate' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Total RR' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'VS RESP RATE' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Vent Rate' THEN respchartvalue

    -- triggers
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Flow Sensitivity' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Flowtrigger' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Pressure to Trigger PS' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Trigger' THEN respchartvalue

    -- end tidal co2
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent ETCO2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent ETCO2_' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'ETCO2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'End Tidal CO2 (mmHg)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'End Tidal CO2 Status' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'EtCO2' THEN respchartvalue

    -- weight / ideal body weight
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent IBW in Kg' THEN respchartvalue

    -- oxygen saturation
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent SpO2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'SaO2' THEN respchartvalue

    -- oxygen flow
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'LPM O2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Liter Flow (1L or More)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Flow Rate' THEN respchartvalue

    -- minute ventilation
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Pt/Vent MinuteVentil' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Exhaled MV' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'MVe' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Minute Ventilation Set(L/min)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Minute Volume, Spontaneous' THEN respchartvalue

    -- mean airway pressure
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mean Airway Pressure' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Mean Airway Pressure' THEN respchartvalue

    -- other pressures
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Peak Insp. Pressure' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Peak Pressure' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Plateau Pressure' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Plateau Pressure' THEN respchartvalue


    -- ventilator waveform settings
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilation Slope' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator Compliance' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator High Tidal Volume Alarm' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator ID Number' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator Mode' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Mechanical Ventilator Resistance' THEN respchartvalue

    -- pao2/fio2
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = '3. PaO2/FiO2 Ratio' THEN respchartvalue

    -- peep
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Auto PEEP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'PEEP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'PEEP/CPAP' THEN respchartvalue

    -- I:E // IPAP // EPAP
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Backup IInsp Time (sec)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'B1: IPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'IPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'IPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'IPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'B2: EPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'EPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'EPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'EPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'I:E Ratio' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PD I:E RATIO' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'T Peep' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'epap' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'ipap' THEN respchartvalue

    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Set I:E' THEN respchartvalue
    -- WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = '5. ARDS Eval (M or DNM)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'A2: External Room Alarm' THEN respchartvalue
    -- head of bed
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'HOB Elevated 30-45 Degrees at All Times' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Head of Bed Elevated' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Head of Bed Elevation' THEN respchartvalue

    -- inspiration
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Insp Cycle Off (%)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Insp Flow (l/min)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Insp Time (%)' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Inspiratory Flow Rate' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Inspiratory Pressure, Set' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Inspiratory Time' THEN respchartvalue

    -- vent mode
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Bipap Delivery Mode' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'CPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Mode of Ventilation' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Pressure Control' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Pressure Support' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Respiratory Device' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sigh' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Support Mode' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Type' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Volume Guarantee' THEN respchartvalue

    -- oxygen delivery device
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'O2 Admin Device' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Admin Device 2' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'O2 Device' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Delivery Comments' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Delivery Method' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oxygen Delivery Status' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'RETIRED O2 Device' THEN respchartvalue

    -- NIV
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent Mask Type' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent SpO2_5' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent Spont_Rate' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Pt/Vent Spont_TidalV' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Circuit T_5' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting EPAP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Heliox_5' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Leak_' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Set_RR' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Spont Exp Vt_5' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Setting Total RR_5' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Non Invasive Ventilation Comments' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Non Invasive Ventilator Type' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Non-invasive Ventilation Mode' THEN respchartvalue

    -- RSBI
    WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'RSBI' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Sedation Scoring Ventilation Depth' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sedation Scoring Ventilation Depth' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Total RSBI' THEN respchartvalue

    -- SBT // weaning
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Reason SBT Terminated' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'SBT Method' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sedation Wean' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Spontaneous Breathing Trial With Pressure Support' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Assessment Criteria Collaboration' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Minute Volume' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Negative Inspiratory Force' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Performed' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Respiratory Rate' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning SBT Readiness Add''l Info' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning SBT Readiness Criteria' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Start Time' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Trials Additional Comments' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Weaning Vital Capacity' THEN respchartvalue

    -- sedation // needs to be classified properly
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'WUA Patient Response/RASS Score' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Wake up assessment interventions' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Wake up assessment outcome' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Wake up assessment performed' THEN respchartvalue

    -- ??? not sure
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Measured Ve' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PS' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PS above PEEP' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'PULSE OX RESULTS VT' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowSettings' AND respchartvaluelabel = 'Peak Flow' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Position at lip' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Postion at Lip' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Rise' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Rise T' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'SET INSP TIME' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Secured by' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sedation outcome' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Trapped Volume' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Treatments' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Type of Treatment' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Unable to Obtain PEEPi and Vtrap' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Vti' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'f Total' THEN respchartvalue

    -- ETT info
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ET Tube Repositioned' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion Date' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion Time' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion date' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion date' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Insertion time' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Peptic Ulcer Prophylaxis' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Rotation' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'ETT Sedation Vacation' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Position at Lip' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Tube Moved to' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Tube Placement' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Endotracheal Tube Placement Checked' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Secured at-ETT' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Secured at-ETT' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tube Size-ETT' THEN respchartvalue
    WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Type-ETT' THEN respchartvalue







    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'AIRWAY TEMPERATURE' THEN 'AIRWAY TEMPERATURE'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Additional ET Tube Comments' THEN 'Additional ET Tube Comments'

    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Alarms Checked' THEN 'Alarms Checked'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Alarms Backup I:E' THEN 'Adult Con Alarms Backup I:E'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Alarms Backup PC' THEN 'Adult Con Alarms Backup PC'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Alarms Backup RR' THEN 'Adult Con Alarms Backup RR'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Alarms Circuit T (Celsius)' THEN 'Adult Con Alarms Circuit T (Celsius)'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Alarms Hi Press Alarm' THEN 'Adult Con Alarms Hi Press Alarm'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Heliox_' THEN 'Adult Con Setting Heliox_'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting INO' THEN 'Adult Con Setting INO'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Adult Con Setting Sensitivity' THEN 'Adult Con Setting Sensitivity'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Airway Attachments' THEN 'Airway Attachments'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Apnea Ventilation' THEN 'Apnea Ventilation'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Auto Release' THEN 'Auto Release'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Autoflow' THEN 'Autoflow'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Automatic Tube Compensation' THEN 'Automatic Tube Compensation'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'B3: Est Mask Leak' THEN 'B3: Est Mask Leak'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'B4: Mask Size' THEN 'B4: Mask Size'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'BS' THEN 'BS'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Backup Vent Active' THEN 'Backup Vent Active'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Bag/Mask (attached to O2)' THEN 'Bag/Mask (attached to O2)'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Base Flow' THEN 'Base Flow'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Bilateral Breath Sounds' THEN 'Bilateral Breath Sounds'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Blood Glucose Controlled' THEN 'Blood Glucose Controlled'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Breath Sounds' THEN 'Breath Sounds'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'C-Flex' THEN 'C-Flex'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'CCU Ventilator Weaning Protocol Started' THEN 'CCU Ventilator Weaning Protocol Started'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'CCU Ventilator Weaning Protocol Started' THEN 'CCU Ventilator Weaning Protocol Started'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Care' THEN 'Care'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Care' THEN 'Chest Tube Care'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Description/Status' THEN 'Chest Tube Description/Status'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Drainage Color' THEN 'Chest Tube Drainage Color'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Insertion Date' THEN 'Chest Tube Insertion Date'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Insertion Status' THEN 'Chest Tube Insertion Status'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Label' THEN 'Chest Tube Label'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Location' THEN 'Chest Tube Location'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Position' THEN 'Chest Tube Position'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Size' THEN 'Chest Tube Size'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Suction Amount' THEN 'Chest Tube Suction Amount'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Chest Tube Suction Type' THEN 'Chest Tube Suction Type'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Clean Vent/Ambu' THEN 'Clean Vent/Ambu'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Compliance' THEN 'Compliance'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Cough Description' THEN 'Cough Description'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'DABP' THEN 'DABP'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'DVT Prophylaxis' THEN 'DVT Prophylaxis'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Dyspnea Assessment' THEN 'Dyspnea Assessment'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'HR' THEN 'HR'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Heat Moisture Exchanger' THEN 'Heat Moisture Exchanger'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Humidifier Temp' THEN 'Humidifier Temp'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Humidity' THEN 'Humidity'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Lung Sound Location' THEN 'Lung Sound Location'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Lung Sound Location Modifier' THEN 'Lung Sound Location Modifier'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Minimal Occlusion Technique' THEN 'Minimal Occlusion Technique'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Minute Volume Leak' THEN 'Minute Volume Leak'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Alarms Hi Press Alarm_5' THEN 'NIV Alarms Hi Press Alarm_5'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'NIV Alarms Low Press Alarm' THEN 'NIV Alarms Low Press Alarm'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oral Care Complete Every 2 Hours' THEN 'Oral Care Complete Every 2 Hours'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Oximetry Notification' THEN 'Oximetry Notification'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Patient Leak' THEN 'Patient Leak'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Patient Position' THEN 'Patient Position'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Post HR' THEN 'Post HR'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Pulse Oximetry Comments' THEN 'Pulse Oximetry Comments'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Primary Pain Quality' THEN 'Primary Pain Quality'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'RT Vent On/Off' THEN 'RT Vent On/Off'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Reason WUA deferred' THEN 'Reason WUA deferred'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Reason not indicated' THEN 'Reason not indicated'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Reason not met' THEN 'Reason not met'
    -- WHEN respcharttypecat = 'respFlowPtVentData' AND respchartvaluelabel = 'Resistance' THEN 'Resistance'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Respiratory Parameters' THEN 'Respiratory Parameters'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Respiratory Phase' THEN 'Respiratory Phase'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Respiratory Signs/Symptoms' THEN 'Respiratory Signs/Symptoms'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Respiratory Summary Comment' THEN 'Respiratory Summary Comment'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Skin Integrity' THEN 'Skin Integrity'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sputum Amount' THEN 'Sputum Amount'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sputum Color' THEN 'Sputum Color'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Sputum Consistency' THEN 'Sputum Consistency'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Static Compliance' THEN 'Static Compliance'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Suctioned patient' THEN 'Suctioned patient'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Tube Feedings on Hold' THEN 'Tube Feedings on Hold'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Unit of Measure' THEN 'Unit of Measure'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'V60 Mask Leak Value' THEN 'V60 Mask Leak Value'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Checks' THEN 'Ventilator Checks'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Heater Temperature' THEN 'Ventilator Heater Temperature'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator Population' THEN 'Ventilator Population'
    -- WHEN respcharttypecat = 'respFlowCareData' AND respchartvaluelabel = 'Ventilator set up date' THEN 'Ventilator set up date'
 else null end as new_label
from respiratorycharting rc
where rc.respchartvalue is not null
