Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747082;
	b=MMf9IHWM9wGwsuYRPB8yYVGUavD1EWFXHOmLA+OALa2cTPK5ngSQZf/4luumKbCnles7
	 DG0CdCgnTW+DEzpcX9u47K/oAn9K7tUQ88ocIVnEd5/EtBMnBVOoUYdfn75RCmXTQM+1R
	 17X4eZj5vwfjn3/iz2Tde8zptWifrkrkVzq/YeXB7NVujgysON47lRbxeNSqzLbvJI+KG
	 /bXcHJpESdI7Ys3Q56gdgKXT4KVEiA8kmlbcuLyIIM4PSxtIfXJ7e9v2hDKyix5o6Ssp7
	 eitm78jzOTPYq3dA4vaZ8PfKKWA0iIsnsw/zKp+0RAQj8xtiBYtVCM6fthm/S5ABA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
	b=styLFRuY3kaltRBCDOxMXyGuFbEeGZUmH5T8mhFVSZ8ungUAUFq2RqNed6FVpvhiekyC
	 8N+cGg2/sEey6u5yqaBdsKJH/fHcYas5WcfhZZ2dS4E5PGeo/7jZNg5q1viDykXrCBd9E
	 eyfoyN8e10vqBV+O4SJgvLIevcpl6VyxL4IgLcl65uhDd8FaFV7k/9gA0guvU1DOd424G
	 0fHA29UG62l7IjfVuZGlVrOqLR35T8RaC89iRzYx7ZDFlDTfrCj1cMPPnF3YUuBa76j2v
	 r2KOnsejNLOh9p+k0IV7qgOHs6F03Q0goFtW9Osi5hZO89la6Ny7XCsiGf/3sPNBu9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gS3DtNMp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C59606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gS3DtNMp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso6684705e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792747081; x=1793351881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
        b=gS3DtNMpVSAhRKLz/tO31/qW1Tzg+CpzolIJbnfPCQqQhCPskhnR67AHmvHStKqN/R
         J8x0Wa+nSdPYcJ9V/6oKnZ2LB6Ccc52tI10KRfK/VZ8/CEuDy4VYK4KnnK/pJYt699C1
         Rx0GwdA8qfU/5PAy0ef+tOhp06JEsfDPt4NL4QQqJpDunFr/oYu6V5VxUZiGfaDygrQN
         PqzJSJK/IF5owlKtIVT1tWdvhO0uz6pzCk5wgQCn25M9s2v0AdnRrK3MskJmF2bccnXK
         +MJD7m3z+bUHECxczgtCxes5DQOElAt1OsoqfjXiptxebUrBZytcmUC5rzfcl/TBSQJU
         GTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747081; x=1793351881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
        b=JW+Yksc/oVSKq3BVRMbrfddFFdYhJ17bzRGpL/rWhfd9MiiRjyL4m39IrKoKzu1WdC
         S05XSFG5Pr0NrmqbW+2McaDyj5K1SZkReSi9kOImsXQLFRosqHUSqdlW+R4klTpRY+Gl
         vHwQqX8n4ZpAV1knqcngESViLa/sgrwrAQECCjHSdDzTacLVJeVqGPtIXt6wchmNzFWV
         Ifz8c6hnaGMkifqwNEVwrkM1xX3ohLFqfs1OboOIHAOdpZEvTRVyXPT+jdV0Si66h6UV
         qYf5f1p7fp5X/WLYidcYEBYn6MX1PEG6399WZJGnnQ4fTpP8IcS6HszmBpGqD15Bjn4B
         RPeA==
X-Forwarded-Encrypted: i=1; AKwUvBwmWTiU6//zrcl2T9yRU7gW7wlmxByUnciSrjK1nBMVaJLlOHb/0Ijv9OcdnHddBnG+FtPX5XPtCV1zG0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDJtTI30aEK2icmqM+w/5HvS0pIr8vImC6gUDzyH80JXptv/UH
	DizoXQAT9Of8pezKULSD5g2ouP7iMaxxDcWSDK7nVetkQ7haWLUQQlNPJHn8Klag5ak=
X-Gm-Gg: AYBFou3wC64WQX3lthUyKiP/XLuG/mFSTwQJydZQ8gdyfBSGrN9y9UqfdjqNBHjaQ2O
	DerdxO5HoJNvDV6ynqFoAJeCtH/BN/DxDRu3brckag+oqL057uATcGVjxZLPmdK6OnqxJgIBKdQ
	wJAuYpeIiHzEMIxNBYude9M0GwFjNqPW+zWK8eA7nP5ttztHd15zVHsW7FSd4NcbzrO4NRjZSaM
	sLDZJ1l6X9sOuPm4G5NcUFI926FEbIHzV7TtTwkMsOf6SVHi0mSwSNLYRnnxa2PaWchnINZqBEk
	+rYpEHf9VOqnwMV9qMPAPDsMmDEpnAnB0yOvh52AlqT1yW0LGKwtYU4BoEYH2WRlX+Mwn6aJDfz
	lGa2Ixr0ZuGE/VhlPba371ApU58x5HODLr2n5Owdn1Q3XHYYJQRrLrRTi1VRc4anfV4lfbuSiky
	R/b74oPmIzUGLNrI2IxD9cdLu6szKcuUb3hmRUCDOSIjLvAISvri81c/2DSm83hmzXnvmvGEtkD
	W9b/hy5YGD+6mmwBC6pjYA/5Uiia56VbQb1VabKoCQlufPEw10m1+du7YKqTvvKSIU=
X-Received: by 2002:a05:600d:84ca:10b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a2150f1826mr12043165e9.23.1792747080587;
        Fri, 23 Oct 2026 02:18:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:a88e:f1a2:fd42:7693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm60827045e9.9.2026.10.23.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:18:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:17:54 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <atsmQqSOuqp1LKw8@linaro.org>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
> The ThinkPad T14s needs thermal mitigation under sustained workloads to
> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
> monitoring is not yet supported, so use the board temperature sensors
> exposed through the PMK8550 VADC to provide mitigation now.
> 
> Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
> the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
> the keyboard, while the fan/heatpipe-area sensor faces the back cover.
> These are internal board measurements rather than direct measurements of
> the user-contact surfaces.
> 
> Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
> Celsius, derived from observed platform behaviour with the Windows
> balanced power profile. Map the passive trip to all CPUs and the GPU,
> with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
> Name the trip "backcover-ec-alert" so that the planned EC support can
> locate and adjust it.
> 
> An earlier approach using staged CPU-cluster throttling did not show a
> significant improvement and introduced a latency imbalance between CPU
> clusters. Keep a single passive trip to provide timely mitigation.
> 
> Add 73 degree Celsius critical shutdown trips for the DRAM-area and
> heatpipe-area sensors. Retain these baseline thresholds pending
> sensor-specific hardware validation. The reported Windows DRAM threshold
> of 115 degrees Celsius has not been established to apply to these VADC
> measurements and does not justify changing the shutdown thresholds.
> 
> Thermal camera measurements indicate that the readings primarily reflect
> internal temperatures rather than chassis surface temperatures. No unsafe
> external surface temperature was observed during those tests, but they do
> not establish qualified critical limits for the internal sensors.
> 
> Expose the remaining sensors as monitoring-only zones and enable ADC
> threshold monitoring on the corresponding PMK8550 VADC channels.
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Link: https://patch.msgid.link/20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..21f4569068e1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -502,6 +502,88 @@ platform {
>  			};
>  		};
>  	};
> +
> +	thermal-zones {
> +		/* Sensor near DRAM, facing the keyboard. */
> +		dram-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				dram-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		/* Sensor near the GPU PMICs. */
> +		gpu-pmic-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the fan/heatpipe, facing the back cover. */
> +		heatpipe-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +				backcover_ec_alert: backcover-ec-alert {
> +					temperature = <57850>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				heatpipe-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&backcover_ec_alert>;
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
> +		/* Sensor in the WWAN area. */
> +		wwan-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor in the charger area. */
> +		charger-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the CPU PMICs. */
> +		cpu-pmic-thermal {

I'm a bit confused by the node order here. It's not ordered by the
thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
ordered alphabetically either. Or is it still the old order from the
previous revision?

I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
order would be our typical rule.

> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the USB-C ports. */
> +		typec-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
>  };

Anyway, for the changes itself:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for fixing the names!
Stephan
