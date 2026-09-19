Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD4038E8BD
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789802060; cv=none; b=ctiDsxFHh7n0smLStqMhPVetUculLFZNpWElim78jmgeHAjFJB7SsE2TSkWjfTcTlsEY9Tai2U74zeHdNcFcOe7QKLjGMEPeYnAmEuvsVh9QFjNDnV3sAKjyNCw495xcUTo0uP/iQMKVVmwKqspdwsx9tpk/tq4z9Y1Ho6ucKU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789802060; c=relaxed/simple;
	bh=xxuOtiPiuoj92R5V2GMYkJSn3EEzi8JJm8YRDPTc64s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V54EGI5Ohn9xRRh/XSVhL09wrqGNB/9WpDGDA2JT2xBDprt36KHmCuP710abSGNDHIcfgNjQAMQIAFjjXQ6CHLYBRGxuSWYl/h6NlzLMZpoP+oxiCdOTjqFhv9QJS287WTZCpYQUh3UhghYFrAFjKim2ybIb2575QUDNqZWJy7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIr4CMlW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIr4CMlW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so10720815ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789802056; x=1790406856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mXhRu0TF0k/+0wmqGZxLhF/szfVYLA7nm51lWGTN8d8=;
        b=LIr4CMlWhH/bZEAjdl1fiIrfZWB1GU7A5AToar1sXj7aLtszZc46rZHDJ7KNvKsHgo
         Vz1uPuKTQKG47Vs/NCV6RLmHNzSMHnHV+FqR59gJzDdh3NxbIMHnrkohxyud2q0+NnfQ
         eYFiAcDPrWcNPRxabIyv2i60mlhfwHY2Gv+w8hLGtvso0IJIk595blFEpFrRgpSxRakK
         kF56b3FiJI9QF+TT4zHHM3gitrCBhykCq+P1EbyYvk110aWvwXC1AEq8khqhsqS0Hxod
         DVL/YZKE4s7/oNRf7NhpoGcwehw0Racmjq0950Ygq6Pdf8L7LrzDbZS5K3KswAiHxSTz
         Os/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789802056; x=1790406856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXhRu0TF0k/+0wmqGZxLhF/szfVYLA7nm51lWGTN8d8=;
        b=P6YoQgzev6DQVtLnrD4AZA5jb0Le//PR8r3Ska6UhOFBR3QzNiprDto2P7fZrRqT8o
         EFpZiLollXDHvmq5gYlWH0qGJcO3dGThYqe4Xc9juhwar89f9YElX3EmzBEBiRfgMN8k
         wxAdhHR1f8ad+4CrCkU0SMjD6NOwxwNuS+zAD1jC8qjrBJ6Et0bAa03vr6M0I82hqQee
         cNBHQWK+JAE8j08EI2PjeneBiGea3wkzwlhaKsCrTrzZoUILyOXWJ2Ltp6IE/vq075jz
         rTpqILX68v3Kw7oxLtXwz1h4exlG1gASsdKKCc1jGayznGQy0ciELIejv/fqwpjafBqg
         jD/A==
X-Forwarded-Encrypted: i=1; AKwUvBwtcgas4ZebPwz4fir76RM1AZ4BJOPX5YZlMUwyrJKHcpcLmxeKY12WeJxUCVgBzIpY97yK/gGko+2OyiM=@vger.kernel.org
X-Gm-Message-State: AFuF++lACR8oyQcATPM6C3VNtMj46PgKTa+YzETN66HfxatFVuruOrF2
	sNIqKCbSDB8b/tghmClPJtUg2GMnjUqEYp3m9bDZKhSkJ8vbb4i2gh4P
X-Gm-Gg: AYBFou22VH7PL0KhViSG76vWLth3l21Z4nK9oqJmJ92zHdRMR9qivG1UiW1wee4DINX
	Lc7zHhG+u1PW52gvd2z76PHfk3Aif2Jk5Xzowq1Usorq4D1wkRdFkHrDGIig9jZWOcYQaEcZmCt
	N9sRPwogVlJcAUGBGTulkxN2ypQHN9y7f1hWQuLjh5YQukpfWjV3iQRiNYRdtCDtoU8B3VmDH6i
	o0ZxHZ1CBptHUjedNnWYFHEoeOP/6WJnu4rlQJS6l+pBYCjpp7a3GeTRYuUQXqXRESSx+edCGwT
	PiGGMBc54QLzqoGp1SyreCNEpW4fRgvdHEhR/iSOcpKEJMznwtdpDYc9jcbYCSDp7qnlAv+N5zd
	hHMoYOvdVMX0tvv1xnPCB9QkyrtjgWkwc8Ta8Td2HffnvENw6XbzXHIWi5c8b8+LO4Yee5ED6TQ
	uqFQZrikG8Qyhlp9zsmjvRYzxzdFFw3+f/sPcNTFySdyRi6qg+ch7uEq8aHNQFUk6hwZPdERJcC
	g==
X-Received: by 2002:a17:902:8b8a:b0:2dd:b238:6aa6 with SMTP id d9443c01a7336-2ddb2386c2bmr45456425ad.11.1789802056361;
        Sat, 19 Sep 2026 00:14:16 -0700 (PDT)
Received: from [192.168.101.188] ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm4117755eec.14.2026.09.19.00.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 00:14:15 -0700 (PDT)
Message-ID: <b74672e2-1d70-47bd-a88e-0c19e5cd0af9@gmail.com>
Date: Sat, 19 Sep 2026 15:14:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Teclast P85T tablet
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918165414.1129076-1-iuncuim@gmail.com>
 <20260918165414.1129076-5-iuncuim@gmail.com>
 <76bb45b4-816c-4a4e-a526-b394cbbfbb69@arm.com>
Content-Language: en-US
From: Mikhail Kalashnikov <iuncuim@gmail.com>
In-Reply-To: <76bb45b4-816c-4a4e-a526-b394cbbfbb69@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/19/26 04:08, Andre Przywara wrote:
> Hi,
> 
> many thanks for sending this! I haven't opened my P85T yet, so have no 
> serial, but seems like it's worth it ...
> 
> On 9/18/26 18:54, Mikhail Kalashnikov wrote:
>> The Teclast P85T is an 8-inch tablet that was announced in 2023
>> based on the Allwinner A523 (sun55i) SoC.
>>
>> Hardware summary:
>>    - Allwinner A523, 8x Cortex-A55 (2 clusters)
>>    - 4 GiB LPDDR3 DRAM
>>    - 64 GiB eMMC
>>    - microSD card slot
>>    - AXP717 and AXP323 PMICs
>>    - USB-C port wired to the USB2 OTG controller
>>    - combined WiFi and Bluetooth module based on AIC8800 (SDIO+UART)
>>    - 800x1280 MIPI-DSI panel (not supported in mainline yet)
>>    - Silead GSL1680 touchscreen
>>    - MiraMEMS DA280 accelerometer
>>    - AXP717 battery/charger
>>    - USB-C OTG port (also for charging)
>>    - secure boot, but takes any key
>>
>> This initial submission enables only what mainline supports today:
>> both PMICs, battery/charger, GPU (Panfrost), eMMC, SD card,
>> SDIO WiFi (can be used with out of tree driver), USB device (without
>> otg function), UART0 console, UART1 Bluetooth, I2C0 touchscreen, I2C1
>> accelerometer and the RTC with the external 32 kHz oscillator.
>>
>> Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
>> and LRADC keys are deliberately left out, as those blocks are
>> not supported in mainline yet.
> 
> Super nit, and just to ambush Krzysztof ;-) :
> the correct wording should be ... as those blocks don't have a binding 
> yet. Since this is a DT patch, you are in DT land, and must not speak of 
> the kernel ;-)
> 
Will be fixed.>>
>> The tablet uses secure boot, so it needs a signed TOC0 wrapped image to
>> boot, but it has no key hash burnt into the efuses, so it accepts an
>> image signed with any key. U-Boot support in progress.
>>
>> Later, a tablet with an Allwinner A537 processor and 3 GB of DRAM was
>> released under the same name. This version is not supported by mainline.
>>
>> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
>> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
>> ---
>>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>>   .../allwinner/sun55i-a523-teclast-p85t.dts    | 420 ++++++++++++++++++
>>   2 files changed, 421 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523- 
>> teclast-p85t.dts
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/ 
>> dts/allwinner/Makefile
>> index aa21f58a4..7025ba959 100644
>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> @@ -63,6 +63,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic- 
>> rg35xx-2024.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
>> +dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a523-teclast-p85t.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
>> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast- 
>> p85t.dts b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
>> new file mode 100644
>> index 000000000..38a9c98ec
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
>> @@ -0,0 +1,420 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Mikhail Kalashnikov <iuncuim@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sun55i-a523.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +/ {
>> +    model = "Teclast P85T";
>> +    compatible = "teclast,p85t", "allwinner,sun55i-a523";
>> +    chassis-type = "tablet";
>> +
>> +    aliases {
>> +        serial0 = &uart0;
>> +    };
>> +
>> +    battery: battery {
>> +        compatible = "simple-battery";
>> +        constant-charge-current-max-microamp = <800000>;
>> +        voltage-max-design-microvolt = <4400000>;
>> +        charge-full-design-microamp-hours = <5000000>;
>> +        energy-full-design-microwatt-hours = <19250000>;
> 
> Out of curiosity: where did you get those values from? I was trying to 
> find them for the P80 tablet, but to no avail.
> 
constant-charge-current-max-microamp is from Android DTB: 
pmu_runtime_chgcur = <0x320>; and pmu_suspend_chgcur = <0x7d0>; — 800mA 
should be safe.
Other values (charge-full-design-microamp-hours, 
voltage-max-design-microvolt, energy-full-design-microwatt-hours) are 
taken from the battery label.
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial0:115200n8";
>> +    };
>> +
>> +    ext_osc32k: ext-osc32k-clk {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <32768>;
>> +        clock-output-names = "ext_osc32k";
>> +    };
>> +
>> +    iio-hwmon {
>> +        compatible = "iio-hwmon";
>> +        io-channels = <&axp717_adc 3>, /* vsys_v */
>> +                  <&axp717_adc 4>; /* pmic_temp */
>> +    };
>> +
>> +    reg_vcc5v: vcc5v {
>> +        /* board wide 5V supply from the USB-C connector */
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vcc-5v";
>> +        regulator-min-microvolt = <5000000>;
>> +        regulator-max-microvolt = <5000000>;
>> +        regulator-always-on;
>> +    };
>> +
>> +    reg_pio18: pio-18 {
>> +        compatible = "regulator-fixed";
> 
> So this is some kind of placeholder, I guess, because we don't know 
> which rails the various 1.8V voltages really comes from?
> But chances are its consumers are really provided some PMIC rail, and 
> not getting the 1.8V out of thin air.
> See below for more ...
> 
All regulator values are taken from Android reg_summary. The pio-18 
regulator:
pio-18                           5    4      0 unknown  1800mV     0mA 
1800mV  1800mV
2000000.pinctrl-vcc-pf        1                                 0mA 
0mV     0mV
2000000.pinctrl-vcc-pc        1                                 0mA 
0mV     0mV
2000000.pinctrl-vcc-pe        1                                 0mA 
0mV     0mV
2000000.pinctrl-vcc-pg        1                                 0mA 
0mV     0mV
Your observations are valid — these should be replaced with the real 
PMIC supplies as you suggested (cldo1 for PC, cldo3 for PF, bldo1 for 
PG). I will remove the dummy regulator and fix the supply mappings in 
the next version.

>> +        regulator-name = "pio-18";
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        regulator-always-on;
>> +    };
>> +
>> +    reg_vmmc1: vmmc1 {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "vcc-wifi";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        vin-supply = <&reg_aldo3>;
>> +        gpio = <&r_pio 0 7 GPIO_ACTIVE_HIGH>;    /* PL7 */
>> +        enable-active-high;
>> +    };
>> +
>> +    wifi_pwrseq: pwrseq {
>> +        compatible = "mmc-pwrseq-simple";
>> +        reset-gpios = <&r_pio 1 1 GPIO_ACTIVE_LOW>; /* PM1 */
>> +        post-power-on-delay-ms = <200>;
>> +    };
>> +};
>> +
>> +&ehci0 {
>> +    status = "okay";
>> +};
>> +
>> +&gpu {
>> +    mali-supply = <&reg_dcdc2>;
>> +    status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c0_pins>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +
>> +    touchscreen@40 {
>> +        compatible = "silead,gsl1680";
>> +        reg = <0x40>;
>> +        interrupt-parent = <&pio>;
>> +        interrupts = <7 9 IRQ_TYPE_EDGE_FALLING>; /* PH9 */
>> +        power-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
>> +        touchscreen-size-x = <1786>;
>> +        touchscreen-size-y = <1128>;
>> +        touchscreen-inverted-y;
>> +        touchscreen-swapped-x-y;
>> +        silead,max-fingers = <5>;
>> +        avdd-supply = <&reg_cldo2>;
>> +    };
>> +};
>> +
>> +&i2c1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c1_pins>;
>> +    status = "okay";
>> +
>> +    accelerometer@26 {
>> +        compatible = "miramems,da280";
>> +        reg = <0x26>;
>> +        interrupt-parent = <&pio>;
>> +        interrupts = <7 11 IRQ_TYPE_LEVEL_LOW>; /* PH11 */
>> +    };
>> +};
>> +
>> +&mmc0 {
>> +    vmmc-supply = <&reg_cldo3>;
>> +    cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
>> +    bus-width = <4>;
>> +    status = "okay";
>> +};
>> +
>> +&mmc1 {
>> +    vmmc-supply = <&reg_vmmc1>;
>> +    vqmmc-supply = <&reg_bldo1>;
>> +    mmc-pwrseq = <&wifi_pwrseq>;
>> +    bus-width = <4>;
>> +    non-removable;
>> +    status = "okay";
>> +
>> +    wifi@1 {
>> +        reg = <1>;
>> +        interrupt-parent = <&r_pio>;
>> +        interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
>> +        interrupt-names = "host-wake";
>> +    };
>> +};
>> +
>> +&mmc2 {
>> +    vmmc-supply = <&reg_cldo3>;
>> +    vqmmc-supply = <&reg_cldo1>;
>> +    bus-width = <8>;
>> +    non-removable;
>> +    cap-mmc-hw-reset;
>> +    mmc-ddr-1_8v;
>> +    mmc-hs200-1_8v;
>> +    status = "okay";
>> +};
>> +
>> +&ohci0 {
>> +    status = "okay";
>> +};
>> +
>> +&pio {
>> +    vcc-pc-supply = <&reg_pio18>;
> 
> So pretty surely this is cldo1, since that's supplying the eMMC pins 
> above, which are on PortC.
> 
>> +    vcc-pe-supply = <&reg_pio18>;
> 
> Couldn't find any clues about PE, can you just leave this out for now?
> 
Agreed, dropping it for now.

>> +    vcc-pf-supply = <&reg_pio18>;
> 
> I don't think that's right: PortF is technically muxed between VCC-IO 
> and VCC-MCSI, but since an SD card is supposed to always start 
> negotiation at 3.3V, it cannot be fixed to 1.8V. And we don't support 
> the MUX (yet), so 1.8V probably leads to SD card overclocking, since the 
> kernel believes it can use 1.8V speed modes?
> Anyway, I think this should be cldo3, since that's what the other boards 
> use for VCC-IO.
> But please check that the SD card still works after this change. Also 
> worth benchmarking it with this version, to see if it exceeds the 25MB/s 
> we are expecting with 3.3V I/O voltage.
> 
Fixed to reg_cldo3. SD card working.

>> +    vcc-pg-supply = <&reg_pio18>;
> 
> This must be bldo1 then, since PortG is MMC1, so the vqmmc-supply from 
> the WiFi above.
> 
Fixed to reg_bldo1.

> With those you should be able to get rid of the artificial 1.8V regulator.
> 
>> +};
>> +
>> +&r_i2c0 {
>> +    status = "okay";
>> +
>> +    axp717: pmic@34 {
>> +        compatible = "x-powers,axp717";
>> +        reg = <0x34>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +        interrupt-parent = <&nmi_intc>;
>> +        interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +        vin1-supply = <&reg_vcc5v>;
>> +        vin2-supply = <&reg_vcc5v>;
>> +        vin3-supply = <&reg_vcc5v>;
>> +        vin4-supply = <&reg_vcc5v>;
>> +        aldoin-supply = <&reg_vcc5v>;
>> +        bldoin-supply = <&reg_vcc5v>;
>> +        cldoin-supply = <&reg_vcc5v>;
>> +
>> +        axp717_adc: adc {
>> +            compatible = "x-powers,axp717-adc";
>> +            #io-channel-cells = <1>;
>> +        };
>> +
>> +        battery-power {
>> +            compatible = "x-powers,axp717-battery-power-supply";
>> +            monitored-battery = <&battery>;
>> +        };
>> +
>> +        regulators {
>> +            /* Supplies the "little" cluster (1.0(?) GHz cores) */
>> +            reg_dcdc1: dcdc1 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <900000>;
>> +                regulator-max-microvolt = <1160000>;
>> +                regulator-name = "vdd-cpul";
>> +            };
>> +
>> +            reg_dcdc2: dcdc2 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <920000>;
>> +                regulator-max-microvolt = <920000>;
>> +                regulator-name = "vdd-gpu-sys";
>> +            };
>> +
>> +            reg_dcdc3: dcdc3 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <1260000>;
>> +                regulator-max-microvolt = <1260000>;
>> +                regulator-name = "vdd-dram";
>> +            };
>> +
>> +            reg_dcdc4: dcdc4 {
>> +                regulator-min-microvolt = <1000000>;
>> +                regulator-max-microvolt = <1000000>;
>> +                regulator-name = "vdd-dcdc4";
> 
> IIUC the AXP717 correctly, DCDC4 is used for battery charging, and it's 
> only available as an output rail when no battery is connected?
> Regardless, since I see no user and the kernel would turn it off anyway, 
> I'd just leave it out here.
Agreed, removing it. Removing this regulator has no impact on functionality.

>> +            };
>> +
>> +            reg_aldo1: aldo1 {
>> +                /* camera sensor AVDD */
>> +                regulator-min-microvolt = <2800000>;
>> +                regulator-max-microvolt = <2800000>;
>> +                regulator-name = "avdd-csi";
>> +            };
>> +
>> +            reg_aldo2: aldo2 {
>> +                /* camera sensor IOVDD */
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-name = "iovdd-csi";
>> +            };
>> +
>> +            reg_aldo3: aldo3 {
>> +                /* supplies the I2C pins for this PMIC and the WiFi 
>> module */
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-name = "vcc-pl-pm";
>> +            };
>> +
>> +            reg_aldo4: aldo4 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-name = "vcc-pll-dxco-avcc";
>> +            };
>> +
>> +            reg_bldo1: bldo1 {
>> +                /* WiFi module 1.8V */
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-name = "vcc-wifi-1v8";
>> +            };
>> +
>> +            reg_bldo2: bldo2 {
>> +                /* WiFi module 1.8V */
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-name = "vcc-wifi-1v8-b";
> 
> So this looks weird: is it really for WiFi? What happens if you allow 
> the kernel to turn that off? Does the system survive, but just Wifi is 
> gone? If yes, then this is a trick here since we don't have a nice way 
> to specify *two* supplies for a WiFi module?
> Just asking because the other (LPDDR4) boards use that rail for DRAM, 
> which explains the always-on there.
> 
According to Android reg_summary this rail belongs to WiFi:
axp2202-bldo1      1    3  0 unknown  1800mV  0mA   500mV  3500mV
    reg-virt-consumer.14.auto-bldo1   0       0mA  0mV  0mV
    soc@3000000:rfkill-axp2202-bldo1   0       0mA  0mV  0mV
    soc@3000000:rfkill-axp2202-bldo1   1       0mA  1800mV  1800mV
axp2202-bldo2      2    3  0 unknown  1800mV  0mA   500mV  3500mV
    reg-virt-consumer.15.auto-bldo2   0       0mA  0mV  0mV
    soc@3000000:rfkill-axp2202-bldo2   0       0mA  0mV  0mV
    soc@3000000:rfkill-axp2202-bldo2   1       0mA  1800mV  1800mV
but this appears to be incorrect — disabling this regulator causes the 
board to reboot. Keeping regulator-always-on for now until the real 
purpose of this rail is determined.

>> +            };
>> +
>> +            reg_bldo3: bldo3 {
>> +                /* camera sensor DVDD/cameravdd */
>> +                regulator-min-microvolt = <2800000>;
>> +                regulator-max-microvolt = <2800000>;
>> +                regulator-name = "vcc-csi";
>> +            };
>> +
>> +            reg_bldo4: bldo4 {
>> +                /* camera sensor DVDD */
>> +                regulator-min-microvolt = <1200000>;
>> +                regulator-max-microvolt = <1200000>;
>> +                regulator-name = "dvdd-csi";
>> +            };
>> +
>> +            reg_cldo1: cldo1 {
>> +                /* codec CPVIN, SD/eMMC 1.8V IO */
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-name = "vcc-codec-sd";
> 
> Just a nit, but "sd" doesn't sound right, with 1.8V. Just put "mmc" here 
> instead.
> 
Agreed.

>> +            };
>> +
>> +            reg_cldo2: cldo2 {
>> +                /* touch panel supply */
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-name = "vcc-ctp";
>> +            };
>> +
>> +            reg_cldo3: cldo3 {
>> +                /* SD/eMMC VMMC, codec VDD, UART0, g-sensor */
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-name = "vcc-io-mmc";
>> +            };
>> +
>> +            reg_cldo4: cldo4 {
>> +                /* LCD panel supply */
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-name = "vcc-lcd";
>> +            };
>> +
>> +            reg_cpusldo: cpusldo {
>> +                /* supplies the management core */
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <900000>;
>> +                regulator-max-microvolt = <900000>;
>> +                regulator-name = "vdd-cpus";
>> +            };
>> +        };
>> +
>> +        usb-power {
>> +            compatible = "x-powers,axp717-usb-power-supply";
>> +            input-current-limit-microamp = <1750000>;
>> +        };
>> +    };
>> +
>> +    axp323: pmic@36 {
>> +        compatible = "x-powers,axp323";
>> +        reg = <0x36>;
>> +        #interrupt-cells = <1>;
>> +        interrupt-controller;
>> +        interrupt-parent = <&nmi_intc>;
>> +        interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +        vin1-supply = <&reg_vcc5v>;
>> +        vin2-supply = <&reg_vcc5v>;
>> +        vin3-supply = <&reg_vcc5v>;
>> +
>> +        regulators {
>> +            reg_aldo1_323: aldo1 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-name = "vcc-aldo1-323";
>> +            };
>> +
>> +            reg_dldo1_323: dldo1 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-name = "vcc-dldo1-323";
>> +            };
> 
> Are you sure we need those two? The other boards don't use them. And in 
> general we would need some explanation for always-on, either as a 
> comment or by using an explanatory regulator-name.
> 
Android declares them, but no consumers are shown. It seems the device 
could survive disabling them, but I'm not entirely sure how they should 
ultimately be declared. All boards do this a bit differently.

>> +
>> +            /* Supplies the "big" cluster (1.8 GHz cores) */
>> +            reg_dcdc1_323: dcdc1 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <900000>;
>> +                regulator-max-microvolt = <1160000>;
>> +                regulator-name = "vdd-cpub";
>> +            };
>> +
>> +            /* DCDC2 is polyphased with DCDC1 */
>> +
>> +            reg_dcdc3_323: dcdc3 {
>> +                regulator-always-on;
>> +                regulator-min-microvolt = <900000>;
>> +                regulator-max-microvolt = <900000>;
>> +                regulator-name = "vdd-dcdc3";
>> +            };
> 
> Same here. The other explain this with the RISC-V core supply. So if in 
> doubt, just copy that ;-)
> 
Understood, will add the comment.

>> +        };
>> +    };
>> +};
>> +
>> +&r_pio {
>> +/*
>> + * Specifying the supply would create a circular dependency.
>> + *
>> + *    vcc-pl-supply = <&reg_aldo3>;
>> + */
>> +    vcc-pm-supply = <&reg_aldo3>;
>> +};
>> +
>> +&rtc {
>> +    clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
>> +         <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
>> +    clock-names = "bus", "hosc", "ahb", "ext-osc32k";
>> +    assigned-clocks = <&rtc CLK_OSC32K>;
>> +    assigned-clock-rates = <32768>;
>> +};
>> +
>> +&uart0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&uart0_pb_pins>;
>> +    status = "okay";
>> +};
>> +
>> +&uart1 {
>> +    /* Bluetooth HCI, 4-wire with RTS/CTS */
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>> +    uart-has-rtscts;
>> +    status = "okay";
>> +};
>> +
>> +&usb_otg {
>> +    /*
>> +     * The USB-C port is the primary power supply; VBUS control is not
>> +     * wired in mainline (AXP717 has no drivevbus), so the port can only
> 
> So does this mean that OTG would work, but the current mainline kernel's 
> AXP driver doesn't support the required functionality? Is that this 
> BOOST thing?
> 
Not a BOOST. It should be drivevbus, I think.
What I see in drivers/regulator/axp20x-regulator.c:
case AXP717_ID:
    regulators = axp717_regulators;
    nregulators = AXP717_REG_ID_MAX;
    break;
case AXP803_ID:
    regulators = axp803_regulators;
    nregulators = AXP803_REG_ID_MAX;
    drivevbus = of_property_read_bool(pdev->dev.parent->of_node,
            "x-powers,drive-vbus-en");
    break;
AXP717 don't have, AXP803 - have. Or I am wrong?

>> +     * act as a USB device powered from the host side.
>> +     */
>> +    dr_mode = "peripheral";
>> +    status = "okay";
>> +};
>> +
>> +&usbphy {
>> +    usb0_vbus-supply = <&reg_vcc5v>;
> 
> Doesn't that contradict the above? Can you remove it and peripheral 
> still works?
> 
Yes, that's wrong. I made a few mistakes; ohci0 and ehci0 need to be 
removed, usb0_vbus-supply is not necessary and usb0_vbus_det-gpios needs 
to be added. In that case, the port will function as a device.
[494444.461021] usb 5-1: new high-speed USB device number 4 using xhci-hcd
[494444.601117] usb 5-1: New USB device found, idVendor=0525, 
idProduct=a4a2, bcdDevice= 7.03
[494444.601568] usb 5-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[494444.601579] usb 5-1: Product: RNDIS/Ethernet Gadget
[494444.601586] usb 5-1: Manufacturer: Linux 7.3.0-rc3-1-MANJARO-ARM+ 
with musb-hdrc
[494444.603790] cdc_eem 5-1:1.0 usb0: register 'cdc_eem' at 
usb-xhci-hcd.5.auto-1, CDC EEM Device, 66:e5:c3:4e:de:ed
[494444.625190] cdc_eem 5-1:1.0 enu1: renamed from usb0
[494445.906598] usb 5-1: USB disconnect, device number 4
[494445.908605] cdc_eem 5-1:1.0 enu1: unregister 'cdc_eem' 
usb-xhci-hcd.5.auto-1, CDC EEM Device

> Cheers,
> Andre
> 
>> +    status = "okay";
>> +};
> 

