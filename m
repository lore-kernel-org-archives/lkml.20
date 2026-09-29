Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156349CF4D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674335; cv=none; b=aCJR72Lux26vf0bmj+IYWaPiQPcs++/LYrr+uYejaippBElrJ6KnLRdHqcNoaWn2x3lI/hb9ukv/49WFuX41CLrcxLfnLE7+RlDzzM3nj1M1kSGmSKiMugyT4jNC59WN6jlQT5BJFqbZH/e0trlNryjQtStpYpQMrr5Hn3pCujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674335; c=relaxed/simple;
	bh=DTjSlV6Ex5aB5PkWfcFbdvjY6j3SyeF2W6Lop83NDnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwEt63PMk1xdOaYHYod8T/IpstItjbjlMRkoiW5osjgSDbDu/52RodsA9OGwfxEwiS0fwr2UbC42Wp3izjJBl1IBfwmrfRQPdVv+aYJfG/1OECq+LhcvijW3XVT0MXcK3tmiHAguQf64nL4K5jNpGn94Aj68lZ1ZCYFd9JcCmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVsIotOD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVsIotOD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso9347775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790674331; x=1791279131; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3rrKkxMUYz3653irVlWjfKST08JJhw2SgEUVXi66Jg=;
        b=ZVsIotOD6ABIvrQ+WX0uSGykXPQ4G6nUZ8sVVqdhph2TrsLBvfzvWGIGq6UUdcpOkp
         sulZFzPv0FqlW0pPxtZoREWEQOhkSyGXTrjJUlbBaZ0iK7pbrXKat+JNkNuj5+i8+8tB
         cTIQVDAYJtP6KKTeLjPIARhb5B0CZnmm0dCPRHnnSfKHIbv3ryn4orNjOZ1X35l/2hiE
         6B33Crdf9jvUeIjBODEdNz2XnNHQ6456uTRLrydegJxdlkzZJ4/GznifpeHzOtxVY3zo
         J486M0rR2WG1+jABOHso0lGHgqOkNqLauJzYitWp/6qi/ik0oK/kwlDSJmgZjzc7F/WF
         bJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674331; x=1791279131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X3rrKkxMUYz3653irVlWjfKST08JJhw2SgEUVXi66Jg=;
        b=OHnnZ2f8KCvupE/FNU/Z8bXXGDfantvCnr4neoK6QOrLimvj2b6LPI15HPSymQVL7B
         7t2NAc4gxuR1RV7aB8JRkWADyIUvn2h+M7I461sZsfQ72rOFAwuHEsJ95wct/ANigmNB
         LM9Z04yMssTQgTgwEZPaU6PKsrfKPA9gi3HIKLRnjz3NHpCDSaGx5cGSGs712hm+8PDf
         +FrjNV94oO0OVYxxuMq/dr5cyNQOBGqwuP3HhWK5LTIFkEckT5rTsKSzP1MtklVHI8JR
         4woG0YVU7lcZFV8yMCRZUP2IzWQtRmaK1+ArHxXKbNaArIKm6kddkx5P4HLVDaJ18FIM
         lxoA==
X-Forwarded-Encrypted: i=1; AKwUvBxcQccDpmsOpB0YbOXl5lyCf+qviVfDn33AOCZrUHbz0+VDJQ12/O+IgibIt7RtYeAICCNax20wRqgmza8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQd172aRo7Wv+tXN9LZ3fyPiwvWdjSli4Wjt5i6/jaCsn8uMzz
	8puYdvlsjrs2UvW/+/yHqs49HcXqwtvtNU4gJ39Gsrn8I8u7S3VrKG7tCza7CKakUcw=
X-Gm-Gg: AYBFou2wvjXCBUAl+i50ggvJceMiuFUCe3HmDXcD9MlP+Y4epJEB374iYNWQzg9MwtV
	+Pg7oRnrBBzvqu9HJ/GiY7IV+yeImTr5qi354MHbMtdKoRMJuFvI44PISVwlDWrMvYIxGDYY+aD
	uOH8NGq2lKB6qSuL0lFVLwijWB1Cehk3b1Er9IBrXofC+D4ERsBbSh2dIxBtm+1WRZRNYT36KEZ
	HYZo4EMQNUU9ngRYgBsu+mwzN8roOgLwB05lqGpsBXXq98Z5iX67/AhUHLycQnLap2vnG+emsVo
	iDK9zMKAt9svLqhuVuOWIxj81+6CuBOfOhupMKOaKquHfskYkCXnd2Br/OuDqbbk8gmxitPxgWp
	YQH5vEjnAOMqHnY1fuBJSL4yn70Fftn2GQKVMuLFW0XYumHjKepg7NFZVlNsD/+QnoQ3bj6Zh1K
	r3H2qXhvEIydDVzKStdETEA8v/92rMcP8/lSW5d8K3BJXWTgpoNsPBAnzeWASsyUUxEepULNhlJ
	K78l4RDJQ==
X-Received: by 2002:a05:600c:3513:b0:49e:816a:9bae with SMTP id 5b1f17b1804b1-49fe66f7198mr283609425e9.28.1790674331237;
        Tue, 29 Sep 2026 02:32:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:e613:f8b0:9fed:6cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8fa5bsm74550505e9.6.2026.09.29.02.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:32:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:31:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <aruFjEq4AfcIOxa3@linaro.org>
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 08:18:18PM +0200, Daniel Lezcano wrote:
> Add the thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> The keyboard area is the main thermal constraint under sustained CPU
> load. Add a passive thermal zone for it and progressively throttle the
> three CPU groups as the temperature approaches the 53°C limit. The
> groups are activated at 49°C, 51°C and 53°C respectively, with a
> 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> The cooling maps limit each CPU cooling device to state 6, which
> corresponds to approximately 1.9 GHz. Testing showed that the system can
> sustain the workload with all three CPU clusters capped at this
> frequency while maintaining the expected performance, making it a
> suitable upper cooling state for thermal regulation.
> 
> Several configurations were evaluated while tuning the keyboard zone.
> Using a single 53°C trip for all CPUs allowed the temperature to rise
> quickly but resulted in a stable operating point around 54.3°C, about
> 1.3°C above the intended limit. Introducing staged cooling before the
> target significantly reduced the thermal overshoot. A 49/51/53°C
> configuration kept the steady-state temperature close to 53°C, while a
> later 49.5/51.5/53°C configuration improved the heating response but
> shifted the equilibrium slightly above the target. Based on these
> results, keep the earlier 49/51/53°C staging.
> 
> Also add a passive back-cover thermal zone which uses the GPU as a
> cooling device at 64°C, together with a 73°C critical shutdown trip.
> 
> Describe the remaining SMB, SDX, east and west board temperature
> sensors as monitoring-only thermal zones, and enable ADC thermal
> monitoring on the corresponding PMK8550 VADC channels.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 5cc6a63d1ef6..9407868864ad 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -10,6 +10,117 @@ / {
>  	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>  		     "qcom,x1e78100", "qcom,x1e80100";
>  
> +	thermal-zones {
> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		keyboard-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;

I believe this is "towards back cover next to heat pipe" on T14s, not
"keyboard".

SYS_THERM1 is RT8502 and you can find that labelled on the top bottom
right in this mainboard picture:
https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg

In the T14s, the mainboard is mounted 180° rotated, you can see the same
part of the mainboard in the top middle here, above the heat pipe,
facing towards the back cover:
https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg

> +
> +			trips {
> +
> +				keyboard_alert0: trip-point0 {
> +					temperature = <49000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};

If I'm reading the Windows ACPI setup correctly, it starts throttling
much later. The main thermal zone used for throttling on Windows is
TZ40, which is thermistor 2 read through the qcom-hamoa-ec interface
(b94000.i2c, 'i2cget -y N 0x36 0x2a b'). TZ39 with thermistor 1 looks
like the SoC thermistor, so TZ40 could be the EC equivalent of
SYS_THERM1, i.e. RT8202 also visible in the mainboard picture above.

On Windows, TZ40 is configured as follows on my T14s:

Passive throttling starting at:
 - 3310 dK (57.85°C), power mode "balanced" (current default for EC)
 - 3330 dK (59.85°C), power mode "performance"
 - 3230 dK (49.85°C), power mode "low power"

Cooling devices:
 - CLS0.CPU0-3
 - CLS1.CPU0-3
 - CLS2.CPU0-3
 - GPU0

If we start throttling earlier than Windows, I would be worried that the
EC will not reach the trip point for maximum fan speed, and we'll end up
overly throttling the device.

> +
> +				keyboard_alert1: trip-point1 {
> +					temperature = <51000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard_alert2: trip-point2 {
> +					temperature = <53000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				keyboard-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&keyboard_alert0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT 6>,
> +							 <&cpu1 THERMAL_NO_LIMIT 6>,
> +							 <&cpu2 THERMAL_NO_LIMIT 6>,
> +							 <&cpu3 THERMAL_NO_LIMIT 6>;
> +				};
> +
> +				map1 {
> +					trip = <&keyboard_alert1>;
> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT 6>,
> +							 <&cpu5 THERMAL_NO_LIMIT 6>,
> +							 <&cpu6 THERMAL_NO_LIMIT 6>,
> +							 <&cpu7 THERMAL_NO_LIMIT 6>;
> +				};
> +
> +				map2 {
> +					trip = <&keyboard_alert2>;
> +					cooling-device = <&cpu8 THERMAL_NO_LIMIT 6>,
> +							 <&cpu9 THERMAL_NO_LIMIT 6>,
> +							 <&cpu10 THERMAL_NO_LIMIT 6>,
> +							 <&cpu11 THERMAL_NO_LIMIT 6>;
> +
> +				};
> +			};
> +		};
> +
> +		backcover-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <400>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

If the keyboard-thermal above is "towards back cover next to heat pipe",
I'm not sure what this is. I've been trying to figure it out but no luck
so far. Maybe someone would need to sacrifice a T14s and take a look at
the mainboard markings after removing all these thermal tapes ... :/

https://download.lenovo.com/Images/Parts/5B21P83377/5B21P83377_B.jpg

If this sensor is equivalent to EC thermistor 3 (TZ41) in ACPI, then
Windows does not use this for throttling at all.

> [...]
> +		smb-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		sdx-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		east-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		west-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};

FWIW, there is also ssd/wlan-thermal (SYS_THERM7)
thermal-sensors = <&pmk8550_adc_tm ADC5_GEN3_AMUX6_THM_100K_PU(1)>;

Thanks,
Stephan
