Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94BD47ECFD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203113; cv=none; b=qeqRUN8kR1jdkb5sqE3hMj9BDxsjc2N9LUSPlc2cGQI63252S8Eme9aNRe9ycT3NqnvTFGVXs9t7n5kCMqXEwOJDwG7LhpQG5TobuxP6NxsywGWtgbdlHLbbxI+SvMPcco22yVf/1Sy7k2O3wOKIdoUGZf8MiuwgGPfdjUhSePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203113; c=relaxed/simple;
	bh=mE077adzSO60826bSPH8AmWIYay5TSVj9G861oBtwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEt2xCq7wiwWg6JVucbIglM1culI9Ce2RxhZuJ/zjFsQcwZ5rmYgJhrkjSnbXnsXJtL5e/P3GyJVtUbFPn4DxXdgkdB46QClY9eXnOp2dHHl7GKskH6W32M6m0xLAbKGql1HqY6YABFVcqXc8Y2Gmyp2fsdm84DoFfBPf7MKMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVh6I7Lg; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVh6I7Lg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso8150585e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203110; x=1790807910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=BVh6I7LgJiQpSqUQ8UjSkxOMl7PebDqlC8l36VtPGUP8V9Fo+PAlO0Kr3pIGhRDhSC
         IbXnYW2iOWbKkSZDrW0dU61p+0lelXCCi717NX4inSl2cft//811AvYD5YsyyggFohSy
         nopjBkxXWTKOQG4xBSHZFbrihl+ZFP5AvIzynZJwqyzXlz9TQ0LJ9vz0ccVuAwS92Cv1
         IQb7+3UGRy01Pv3TOrGICBZ2Rg6sOZusXA+tJJ7db0EpWqggRnSMkvs1RyXs7Qw7wHoz
         k5MzH/5XO3eK+o/KZ3GMrVHIZGAunBa8InMqbaaXk8vwWDtlsTndTOdxmH7WH6JH2i5S
         /wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203110; x=1790807910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=y7VXum8OqekOrxensIKoOT17iI7gHY1VVoJvrghtg4IqyzW+JNJ69SzCAq/Bh6a7mO
         1UTEMe+kbDp+zFeb9e5KZG8ljv8SN2vMhlt1rovUELDzPjGM5eVuKTjzPZY13pN+dEmQ
         KKE5pLYSZTwNqS5PMRWSUEOuUa8WNvFxNQgBPoaVXJDYYqFO6SH6cWnenA8DgvI7AlNV
         aoN6P7qi5lXiHz5P7HZTWyLgkyFEnrfLZHzGLTqG+d/1fa2YHWqz1H5gxMur9E8V9UQG
         gUCEqou7me0yd3Pu/pZkuiPDCc9t5dfmwatZgWVJmPJLeZFxc8BRUTT6MarqdFdr5eet
         58lg==
X-Forwarded-Encrypted: i=1; AKwUvBytwFjay+NWxO7Ewumr95uUHRUr5AkWcq/QEVjjSBebpl5LVclAvU8T3aAGEMAK4iOeK5H5eylXuNUpBXo=@vger.kernel.org
X-Gm-Message-State: AFuF++nd73VqffHMHh1I4wTP5kSuorKNQ1h6ihsxCoHpKbHoT7nb6LYc
	HyaTV5AdZPpd6DtnoTtlhARvssjl5lOGdqWFt+sMzWb2kZ9wz9C/KnBiYHIBuQGD
X-Gm-Gg: AYBFou2rhjtMejJGBorq7jW7/KpNWfbAXk16rcxQvNr4xY2F5VGKWMcjn7lfJ8GYIVd
	modeEr/JHRILUTqNUmVOQmHVMr3Qo+f3cVofeFd9N5b6t3Oz8MXMDpuJSdYEBuaKi1Zu1MIV7Ie
	kzYCEH51LOP6dXVCGBmMeObv3QVi+zKEBy8Q2ripZCm492dW2zgJOQyyy6CO01tnB8orOFT1S4H
	FE+kkBWihuaXRj+zB8SW0+5Z/miFReYLlDO3wonkfUbWe47onb0oj96FiCcWfwwhnI9vpXN9NLY
	Tog5Sgz/DNjwfJpQw0el3FWY6//3jrd62Y1Nd6xNYFSzFXrNhoVp9rY4HHOZmw0UxBMFg6hkt8z
	r8KXECsuhNk/cdcdg1n0UH7YwcSXNDCgnKRRBeBSwoVwUdxrRPMEtXgbegGF7Ow9xB0tjDjlVL+
	CGM1qX35OLSs9Um7HHflNElUTSxi6pWDHsHBK7tAlw8zgdOhOPDSlRANVkquVfLtuPVeHtUdA6A
	6jA8QePyrykVTlAm+UE8OYGtD50u0Ie9Q==
X-Received: by 2002:a05:600c:c492:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49fe66c867fmr8606205e9.3.1790203110240;
        Wed, 23 Sep 2026 15:38:30 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b47da1sm20046625e9.0.2026.09.23.15.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:38:28 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: petr.vorel@gmail.com
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	devnull+david.ixit.cz@kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
Date: Thu, 24 Sep 2026 00:38:23 +0200
Message-ID: <20260923223823.190313-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923222521.188197-1-petr.vorel@gmail.com>
References: <20260923222521.188197-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Both devices share the pinctrl configuration.

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 18 ------------------
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..a000c75494f1c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -61,29 +61,11 @@ &mdss_dsi0_out {
>  };
>  
>  &mdss_dsi0_phy {
>  	vdds-supply = <&vdda_mipi_dsi0_pll>;
>  
>  	status = "okay";
>  };
>  
> -&tlmm {
> -	panel_default: panel-default-state {
> -		reset-pins {
> -			pins = "gpio6";
> -			function = "gpio";
> -			drive-strength = <8>;
> -			bias-disable;
> -		};
> -
> -		te-pins {
> -			pins = "gpio12";
> -			function = "mdp_vsync";
> -			drive-strength = <2>;
> -			bias-pull-down;
> -		};
> -	};
> -};
> -
>  &wifi {
>  	qcom,calibration-variant = "Google_blueline";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index f1379857e2742..d54cb47cdf95b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -473,16 +473,32 @@ &qup_uart9_tx {
>  	drive-strength = <2>;
>  	bias-disable;
>  };
>  
>  &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	panel_default: panel-default-state {
> +		reset-pins {
> +			pins = "gpio6";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		te-pins {
> +			pins = "gpio12";
> +			function = "mdp_vsync";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	nfc_default: nfc-default-state {
>  		enable-pins {
>  			pins = "gpio25";
>  			function = "gpio";
>  			drive-strength = <2>;
>  			bias-pull-down;
>  		};
>  
> 
