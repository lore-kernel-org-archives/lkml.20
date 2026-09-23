Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D2B481666
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203497; cv=none; b=AVmhdUrYXhQfsCgkOqPCO+prXqXKJ6BB9aahXDMjARyvQc817TCXOx5EKJZvhAPYYm6trZN4Zity9c7fQ4AaTavIfeeoLiBq4ta+U00GgKGPw3Pi4uE4LKgkAxN/ehQU9gCH1K8wTEHDrDpEOvZWV6qBTnc0QNksxuFrNUeYyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203497; c=relaxed/simple;
	bh=mE077adzSO60826bSPH8AmWIYay5TSVj9G861oBtwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYS8W34nfWl1dqjbgXAuE87wShgC3t//7a9kmnSEK5CJfyPPY8u2NHc387zuEgMCJWcrYTGx7bRP3h7FT4xGKR2da9AfCROwzlXTBLnRt5IAk4rPPnFt1n6s5KGXqjOzC21sZB3596Me/OtL4T3XuhEQlEQS3iJflAHEkPNjqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvhHG0l1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvhHG0l1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so5342445e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203494; x=1790808294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=kvhHG0l11CbSMmLkesMZqC7nHoieLQCeADezEsr8yrPLdnUcmm6VD2gxnNUamGVxqJ
         yNkiGsow/oT8WVtFTz/GmN+r3rk8IvoX9ob5aM3h+mhtlZlryeVsj/GWgS1oiKsKS2ab
         8eWGIWszPCdCsnWK9SyHtqfx2xkB8tk9Bb/7oD0W1B9V4dKRgLFUFX3L0wWANAX8pgC+
         7+nLhg52dEyWIhUcaVuKFGwX80iwxf3kYq5GBywGTJrtS0QKFm0zVdmb9HxCEJ5Ifffg
         HNFry18gpRg1qKtOYiVhUFWr7b1vHAYk6kZDqc+82iAvh1HOnyihTq8nZeNdSN3Mbjug
         yrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203494; x=1790808294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=X92lzXMOqzJjb/K04lw6HzlqZn9muH5Q4tVBWEIASdUpU+WcjcVg8EPRmSpj2XeZGz
         Vh5ko0nPsWAnYzNiJTkqe/J7ltSFZltW4WoQBUAuUwE8bo0Y+VbbdGLurz4TMcsNEft9
         pxWxghZPUoFrlKXoJ5LrXUBODCDED110fk7dR2fWpqp1t+sxGF9z98DdY9D3QzQo+0rK
         PWPb6J9JYW1NUfMwbVNIihhhQ6dgbYYBgQ+ah7yq9eL4xM6daou71qQJdXDE6SbHNPwk
         64RhXobapluKumko8CR4Q6de/k/nTRxoeimYBz19FmJiVv0OI8El1FpsWPyXS/M2S2jy
         rzLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCdUU13FVyw56hgu4X8l7dVyS8kzOtclvtSSE1HWAuCv1SXzCSQNxL7Pf7mERhBJ+KbquPCEV2ye30YzE=@vger.kernel.org
X-Gm-Message-State: AFuF++memyFMUFupk5DF4FEt+cHw1vZjsmK5vwxhqcKPjOo+DMpCiZPW
	FGliPJdl90a3vOfdXF8IWr/SSWCC3bhl+AnGvywsZb4ry6hbQd8ETX/2
X-Gm-Gg: AYBFou04sUNsECAOK76NZvpyW1a7Gp1/1koIE4tDq8+hqnrDNp6AcJoaJH+V113xZk6
	O6C5yJi/g0vqJgZNX8xODhFm3J1o/1w+olpx6qWZbxJtvXsmzIDfVGXSj2ZJOg/H8T9oDR3T9tp
	lL7ExAdsJDVJQr8HNrZ9AN6lrT2KyyZBTSaZ/R60XtKM/j7ll57d6lZHsWoKGcfkUaWKIeXzpLG
	g6qNXSRNBuEqGcpgwziof/sczHYeznfcxEF/nD/MhdkHzxwijMla14VK/EOfhoO50zRO1dC/QPD
	CC/8Yuj9EN/64DQId8LRFF6YGdGzXE3B5qz/FFqJB+WGn9SAvPBcrOJ50P9tv7LBKyduXBWcEu/
	itumdamq1OOEY6pnJh0SUwQW8kB1a8UTrP4Elt9XxJyXgHs7NGRTCn70n81axhWXABdR0bVWq6G
	LK/tvyRXSeD5rdPLYq28m1/vxQyJtKr1MH5ODL0sW1uyj9YWyw6bgg2+rwPt/Gm6uCieEt11X7o
	DlryAMNrFU5LQD0huT+6wHNunc2OC+yog==
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr10255655e9.8.1790203494222;
        Wed, 23 Sep 2026 15:44:54 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9c16dsm31420695e9.3.2026.09.23.15.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:44:53 -0700 (PDT)
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
Date: Thu, 24 Sep 2026 00:44:32 +0200
Message-ID: <20260923224432.190902-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
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
