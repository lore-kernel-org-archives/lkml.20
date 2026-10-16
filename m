Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92995446855
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144570; cv=none; b=hrQrlHTNq74VJsP1/hmSo3sFEra/T/QJWaIwUevWdUhkrcqjO7MvnOzEgUrOYk6+T7NrKLfB0PS0D7rhm3q+isQMXzZuHQo5qLjfmWMPDlyBFXMYW+DBVdcc5gngqEiHIOqnI6vcgt1qYMzWMRFmDQ3QbQYyqtzyPVxjSYppOGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144570; c=relaxed/simple;
	bh=irE7GonX6ny4fGccac7bbMArZoICX8Rj0Tkd0VnU+zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+WjEtdy0zrePLvJJkDEVbGIJ3/2xLdL0ir6jJfnp0jJbcWY5DOOGyzttGCV/u42M+JA07wmvmWlGDJZFOwB/js5CQ9opS60j/a5dvqyHFIjpb8rm5oW2V8+KxsIYbHUzZ8QcF+P45V9qbaVL745CmwqAMcq9yn9Voq3Vw25STA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DacILHoL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DacILHoL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso3989220f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792144567; x=1792749367; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SHXvb7ZJZ/nj+we0A7ArnjWFOABlIOsAgK93EA2rjc4=;
        b=DacILHoLKRJvZkifiYle124f+bFmxeBWVXU67bMY6VXroOyTs7LavadZh0Yf+TtdGs
         V/JVcS/eWs5MROFiLTchCcgVkHO+pGNUQ1J5TQ6LkjF+Bg83iT6qOK70AQDMH/y6wrHv
         M5HD1y24T5lgM6vKw9KwEXwWt04Ic/C2TVZOqrtcvNGlQJpTMDtKjnKBmAU8oEd8Vps1
         B2448nuxSCXBrVTxOkCpQUPTjgN3isQQ+rpurhnOGVRVNI4C+cZYbFbSNfPyceUkWb0n
         pe8je4SzwRrE+X4WOiqqwsbTjfvFmnNt9MjSJ8KqfZNBXZdFrlLfABYNNwv2iRZxj6Ke
         x+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144567; x=1792749367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SHXvb7ZJZ/nj+we0A7ArnjWFOABlIOsAgK93EA2rjc4=;
        b=iEdcoKw8EU6FIMiCgK96dCEaLWDhK3UVA6a1E59Fep/Kr3plgid7xoN+kznydqKWFx
         A7m6rZnE4OdbPP7ICmnGu2IP/BNbFwMXybtrjnzcKGTX4wWMnPVGs8QBFz9QvVVuPlN1
         nK77iY9JlM+Qr717NABja9bAsoKEZ0PSabqJtxmSKrKgs8qDuN3BGIifHo6e7eroG/D2
         4i+DA47ZZbelVrUwk724UKJnL+qfrLhj5iHakVhyCPqZhoJj4l5qmgqdJ1PS8532cdW/
         puGWGTLgXgtoGgf4lAe6ohpfDI4U8istC41Ccnl7n3KhsXEH8+b+VdyVlTLIsECIRTxy
         IMbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKV5YH348cYHaEhgZ7l6k9MjI3eA+ixNatLb7HRyIA0I5w5lzx60f/cnrL7+et1ipLRxJPARxV5iS+PR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBU/30AUctVb/9l1/Z7PJ1wzguiGqzqkwSJUAgUVbP2Yl7T/U5
	xKFLMwmb4Em2UP0EHzBNwL1qCr7vS8gId+52g7macmWmWtcvF9dwKOtADd+azSPbmrrdsB0lcM9
	AfAB/6ng=
X-Gm-Gg: AYBFou0Mw84zJ6rcfK+7JV2fziW3NR5uSNZjlwlb/s2os2Z8hvPO0DqD49xa3AafzHY
	/PpmVlH8rC/QuL52a3QRPMYFaIYB44EITl9H5xFICkBu1NHIsyLQMPXmyQrHL7GMU0vWQOiSYID
	X35fxIPsX1kVQXB0rIhoLNtfvOywP5qq4pLkWp0ufWBjyaLOsyPXtJ6nj96Tpc6RJH8xBGxVK/M
	J/ANtA4YB5j0jCUgj/hfZjjz3Br0pBFKtrMtHN/hh/77oO5Ssq1NDxIDMcxgX4PoWAFkSMv9QmP
	w2U9/5tYrG4qMq1wMno2feKv3E9EQflkQ8lY8QCECRlSXMLdOMrA45oMLer/qxkl1V9XPm3d13a
	JuPyUJ5UD/mkrEjkxUXqbqbZprBHrozlggfeydLW6fuVdc2byQGHczrMkSgWG9VQj/G0PaUTF77
	+m8oNgcAB/peeINmF6YYq6O2/4XmfhdNTamCjCh2shI43vtgl8XK0vK/0Jfc761gsJcrC4V2xdi
	aCeUlKUjXM=
X-Received: by 2002:a05:600c:524d:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a18e4a95c2mr440428765e9.12.1792144566687;
        Fri, 16 Oct 2026 02:56:06 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:81c2:84b3:f2a9:6a06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm4079692f8f.35.2026.10.16.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:56:06 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:56:00 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <atH0oW5j9pxsTty4@linaro.org>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 09:35:24PM +0200, Daniel Lezcano wrote:
> Add thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> Add a passive thermal zone for the keyboard area, which is the main
> thermal constraint under sustained load. The EC reports a thermal alert
> at 57.85°C, so use this value as the passive trip point and allow the
> thermal framework to throttle all CPUs and the GPU when the threshold is
> reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> An earlier approach used staged CPU cluster throttling in an attempt to
> start thermal mitigation before reaching the target temperature. Testing
> did not show a significant improvement compared to throttling all CPUs at
> the EC thermal alert threshold. It also introduced a latency imbalance
> between the different CPU clusters, which could negatively affect
> workloads depending on where tasks are scheduled.
> 
> A more optimal solution would require a significantly more complex,
> system-wide approach, accounting for the workload distribution and the
> available power and thermal headroom across the CPU clusters and other
> devices. Such an approach would also require kernel mechanisms which are
> not currently available. Keep the thermal policy simple here and use a
> single passive trip, which at least ensures that the system is actively
> mitigated before reaching temperatures that could ultimately lead to a
> thermal shutdown.
> 
> The mitigation temperature is derived from the platform behaviour when
> using the balanced power profile available under Windows. A separate
> change will adjust this trip point dynamically according to events
> reported by the embedded controller. Name the trip
> "keyboard-ec-alert" so that the EC driver can identify the corresponding
> trip point in the device tree.
> 
> Also add a 73°C critical trip to shut the system down if the keyboard
> temperature reaches an unsafe level.
> 
> Add a thermal zone for the back cover with a 73°C critical shutdown
> trip.
> 
> Describe the SoC, SMB, SDX, east and west board temperature sensors as
> monitoring-only thermal zones.
> 
> Thermal camera measurements were also used to compare the reported
> temperatures with the physical temperature of the chassis. The measured
> values appear to primarily represent temperatures inside the enclosure
> rather than the user-contact surface temperature. No unsafe external
> surface temperature was observed during these tests, although this should
> not be considered a substitute for formal platform thermal qualification.
> 

Thanks to Mark, I was able to get some info on the location/purpose of
the thermal sensors in the T14s. As you noted already here, the sensors
are primarily focused on specific components inside the enclosure rather
than user-contact surface temperatures. Below I added some suggestions
for more accurate names for the thermal zones. Perhaps that helps to
optimize the thermal control further.

> Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
> channels used by these thermal zones.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..2d0a434d2248 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -502,6 +502,81 @@ platform {
>  			};
>  		};
>  	};
> +
> +	thermal-zones {
> +		backcover-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

dram-thermal or memory-thermal (or maybe keyboard-thermal if you want to
give it a user-surface name, although that purpose seems to be
secondary).

Next to DRAM memory, on the top part of the mainboard, facing upwards to
the keyboard. Unrelated to the backcover.

> +
> +			trips {
> +				backcover-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};

Is this critical temperature is appropriate for the DRAM temperature?
Windows seems to have 115°C here as critical trip point which is maybe a
bit too high.

> +			};
> +		};
> +
> +		east-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;

gpu-pmic-thermal (next to GPU-related PMICs close to the SoC)

> +		};
> +
> +		keyboard-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;

fan-thermal or heatpipe-thermal (or maybe backcover-thermal if you want
to give it a user-surface name, although that purpose seems to be
secondary).

Next to fan/heat pipe, on the bottom part of the mainboard, facing
downwards to the back cover. Unrelated to the keyboard.

> +
> +			trips {
> +				keyboard_ec_alert: keyboard-ec-alert {
> +					temperature = <57850>;
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
> +					trip = <&keyboard_ec_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		sdx-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;

wwan-thermal

> +		};
> +
> +		smb-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;

charger-thermal

> +		};
> +
> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;

cpu-pmic-thermal (next to CPU-related PMICs close to SoC)

> +		};
> +
> +		west-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;

typec-thermal or usbc-thermal

Next to USB-C ports, bottom part of mainboard, facing towards the back
cover.

> +		};
> +	};

There is also ssd-thermal @ SYS_THERM7
thermal-sensors = <&pmk8550_adc_tm ADC5_GEN3_AMUX6_THM_100K_PU(1)>;
as I mentioned before.

Windows uses the EC sensors for throttling, although given that we don't
have interrupt support for the EC yet, I think it is fine to initially
use the PMIC sensors.

Thanks,
Stephan
