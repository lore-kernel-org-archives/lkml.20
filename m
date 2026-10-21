Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595307;
	b=4PkPh51CzBXEoBRZX9bhJIwpTOMacj4Geo4ROiXGw07MKb+/PbsWLXjqFwP7Dsnafivn
	 LjzON23spjQLpfXSJystbA3F3c7+2hkO/anfDfZbnaUeKDCt2vE5tp26lkHwssGt12R3Y
	 +BFk7bPAbIfg6Y21cLmAMgdtR3aVhBzebO3mtPeLw9UIIyTo1EMGi7xZFosPj2KFBJm1m
	 tJYLJ3qBJZxP8rcOrg0fxLhGGTTR5d/ucwt0yAs61GDVkJO3JAgVK82SuS75uTrRGqM+t
	 gvruSEXvcdqwPl+awXsuF+T6EyiwFkhvIE78C0LqNxUc2OdapFe457lTon974gX7t3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=itK4eAdx2fdxxYbm49nIimMLr3z5wgugOWc0Ad0uaXI=;
	b=gKQ4bDYhhjsk2eWg3PKgE0DJBw/ogIzadY4Erjn2n8VYKLhm3s/r6ETmbdlNet1uSA9F
	 pweZLTJVFiK6c7vTwzdmAYCegHIxYjfFHtdvp0mWcp0zGGAa4+CSJJzabefQJQsebSuVa
	 25FAKZmT3tgjjemYhLdoZxXwZdmMiroMu7zuZQVD8TBEbJkE/7z/dWeLB1KAw/O5Au8AF
	 1a03xNhAWqJIhIeyk8ruBDIkwmvLSlWLHBYMulpOKWGfdbu9Da7h1mkrAxuDiEZZO/8I0
	 jAgUUy5W5BXLTynpX7UmYFHrLU6YwFPN9jBeg1e+9TNQLBFb+X3VYf1VoI0aeM++HaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e5MgW+4v;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A760A4AD4
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0A760A4AD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e5MgW+4v
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so5943715e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595305; x=1793200105; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=itK4eAdx2fdxxYbm49nIimMLr3z5wgugOWc0Ad0uaXI=;
        b=e5MgW+4vdOnTIZ6FJMZlX7eV5NMokOEmVNpb7CWk2Bmpn1wy8QoRG1Wm21neqOXy9M
         buOb8kpUCQnO4aKDtCOJFwYDVRKt5OQB83LsFyaEgQ4QRkduypp/smai0nXVVvw4wsgB
         bFhIRvvmLsgC0NpqLbfMlLptR/C5xaSjWt36ReQfrqDQa5LqZfSyI+Lgsrvj2bvxqTlG
         DxDa2xnQDnXrfxfLDT3cp1tHTI+AbXP9e+spD0eAxJ9+IB0MnuumkXtgh23TDr2lbWZF
         ItdKfO0mAB0xT8O1RxvaIjKxS1a3jcqR/2DYpuElFelq7epjodbsORqjz8b8Wphi6tMj
         lYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595305; x=1793200105;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itK4eAdx2fdxxYbm49nIimMLr3z5wgugOWc0Ad0uaXI=;
        b=VTrhg8GjHg0NhK92g82cXRC6RIT4Sk1/PR+yJc3ladY1ut2cGDTVcb66ZrYKfQCwK1
         tF6vqBUIrUtKJqYsNGtveCzX/lhWKQSEMk6dms69UWJwEcAgEDqwYUdaIKQdtl+8szP/
         wmIEcD15nBQDnsnIGLFqb6MeE5PofmhiNFYWWfjL1cdbzteRmJM0gXSZHK1m7IrWh1a5
         GzK7vrILb0F+QzN583aNSCzpEFXKCpw2Vx538kB3a2qo2vA/2Gx5Etvj4VS7KG4/9zfb
         527EJa5bVIyLVGXFR1ICo+leDRMzMBKNtZu2TRuyIn8h3AlyMLxgPCh1bW86Pb0cFZge
         gIEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfvWbM+kVSrwoflZ6Vm+KxreZC//rNLohs7ap30Or1tAWCA+C+bhts79JD+ubukgaoV1FPfgrCuXhJbXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8GZbk4Iy+LqE+FT7ar31kf1KGtOIG+SvwKOvoYAehVNuQvegb
	es/tiZ4hFzQU5E5MFg84IAwQqsaXKGlNK//9GigXQUDH+7w1613GYdPLd3mg15na/JbI2ctX7rA
	Lz9ReqFg=
X-Gm-Gg: AYBFou2Q/xvEu50j5NSwEQ+R5zdQQ/kqI2T1GpMCa0VPn8dYQ5yU+pLICNFgt1dBo2h
	VMtnbvPDqgfLb5K5k3YjgjJtHjR8+5FPvQXg7YlRatbxOfzOTdON23P+9o+ujykY0x2haet5NY9
	5E9utq6c1cb88eOCZfDgrc1ks0jgYWtqBRPb2gUHA08MQQfTTZdLIXqY+j9DJAd9ypJiU6rNxxJ
	uk18pio+kWWzRdaB2PVzYleN0aSS1scESfGm8fzD73gTC0cdoFvwm/8SBsEP46xLR4yJLy5kTxL
	YEojYb38CsRkn29gpqFSx6lCkLAKTpzpYKgeYis9F1qEK2sksW9ihVXj9PK2OJKYo5QNLbbklr8
	/6EjzJrAuR1KzV8wvrUUKJPKlfy/JxkHBT6vB3IzewKpDc4OyLuYfrgjaLrL+uTG+JgS9QQg9ow
	Mj/+et+Oq5pKxcY+4dkvfMSU2KNSTLsgTt2swRu0KVhaLOLCMID9I1Wyx/dkcfpuA0ew0X1PxFN
	o0Ou4xJPliAyf9JrQMmfWHQsS9ZKilYEWlZIyQiENxMLL2+UinqsGSduetA9LqP2dUtEv+8rV4f
	Fr/YnaPByT3wDeo7fmSz
X-Received: by 2002:a05:600c:3b01:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a1fdb078e0mr47336595e9.9.1792595305037;
        Wed, 21 Oct 2026 08:08:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd546371sm23977835e9.2.2026.10.21.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-5-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-5-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528987.4070168.12089976339610295834.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9928; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iyZ6jinAGi8dSnQo3jrXffezi2dOUlx5Ox/nZ8RH65g=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsYLVE/s4HF992m1+gel3COc84u2qyuLPZzD89Zp2
 x+VxoMLOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjARjoWMDD+mHJ+iGLEz7sLN
 lb0cDtNPaZjoLDOfItob2G1h1No5J4iR4SfbBrfPGRFcpknT01V6jTwv1reKyov8fcayIc9BUli
 JAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add basic audio driver support for the Amlogic S4 based
> Amlogic AQ222 board.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 360 +++++++++++++++++++++
>  2 files changed, 579 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 0a3f81ea0fb0..d614dcd6933d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>  	       regulator-always-on;
>  	};
>  
> +	vcc5v_reg: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		vin-supply = <&main_12v>;
> +		regulator-name = "VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <7000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;

You are adding that for audio and it needs to be always on ?


> +	};
> +
>  	/* SY8120B1ABC DC/DC Regulator. */
>  	vddcpu: regulator-vddcpu {
>  		compatible = "pwm-regulator";
> @@ -129,6 +142,212 @@ vddcpu: regulator-vddcpu {
>  				<699000 98>,
>  				<689000 100>;
>  	};
> +
> +	dmics: audio-codec-1 {

Unused: nothing references dmics.

> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <2>;
> +		wakeup-delay-ms = <50>;
> +		sound-name-prefix = "MIC";
> +	};
> +
> +	dioo2133: audio-amplifier-0 {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
> +		VCC-supply = <&vcc5v_reg>;
> +		sound-name-prefix = "10U2";

Did you just copy over the u200 file or is it really the component name ?

> +	};
> +
> +	spdif_dir: audio-spdif-in {
> +		compatible = "linux,spdif-dir";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIR";
> +	};
> +
> +	spdif_dit: audio-spdif-out {
> +		compatible = "linux,spdif-dit";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "DIT";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "aq222";
> +		audio-widgets = "Line", "Lineout";
> +		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
> +				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
> +				 <&tdmin_lb>, <&dioo2133>;
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",
> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT",
> +				"TDMOUT_C IN 0", "FRDDR_A OUT 2",
> +				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
> +				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
> +				"TDM_C Playback", "TDMOUT_C OUT",
> +				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
> +				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
> +				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
> +				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
> +				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
> +				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
> +				"TDMIN_A IN 0", "TDM_A Capture",
> +				"TDMIN_A IN 1", "TDM_B Capture",
> +				"TDMIN_A IN 2", "TDM_C Capture",
> +				"TDMIN_A IN 3", "TDM_A Loopback",
> +				"TDMIN_A IN 4", "TDM_B Loopback",
> +				"TDMIN_A IN 5", "TDM_C Loopback",
> +				"TDMIN_B IN 0", "TDM_A Capture",
> +				"TDMIN_B IN 1", "TDM_B Capture",
> +				"TDMIN_B IN 2", "TDM_C Capture",
> +				"TDMIN_B IN 3", "TDM_A Loopback",
> +				"TDMIN_B IN 4", "TDM_B Loopback",
> +				"TDMIN_B IN 5", "TDM_C Loopback",
> +				"TDMIN_C IN 0", "TDM_A Capture",
> +				"TDMIN_C IN 1", "TDM_B Capture",
> +				"TDMIN_C IN 2", "TDM_C Capture",
> +				"TDMIN_C IN 3", "TDM_A Loopback",
> +				"TDMIN_C IN 4", "TDM_B Loopback",
> +				"TDMIN_C IN 5", "TDM_C Loopback",
> +				"TDMIN_LB IN 3", "TDM_A Capture",
> +				"TDMIN_LB IN 4", "TDM_B Capture",
> +				"TDMIN_LB IN 5", "TDM_C Capture",
> +				"TDMIN_LB IN 0", "TDM_A Loopback",
> +				"TDMIN_LB IN 1", "TDM_B Loopback",
> +				"TDMIN_LB IN 2", "TDM_C Loopback",
> +				"TODDR_A IN 0", "TDMIN_A OUT",
> +				"TODDR_B IN 0", "TDMIN_A OUT",
> +				"TODDR_C IN 0", "TDMIN_A OUT",
> +				"TODDR_A IN 1", "TDMIN_B OUT",
> +				"TODDR_B IN 1", "TDMIN_B OUT",
> +				"TODDR_C IN 1", "TDMIN_B OUT",
> +				"TODDR_A IN 2", "TDMIN_C OUT",
> +				"TODDR_B IN 2", "TDMIN_C OUT",
> +				"TODDR_C IN 2", "TDMIN_C OUT",
> +				"TODDR_A IN 3", "SPDIFIN Capture",
> +				"TODDR_B IN 3", "SPDIFIN Capture",
> +				"TODDR_C IN 3", "SPDIFIN Capture",
> +				"TODDR_A IN 6", "TDMIN_LB OUT",
> +				"TODDR_B IN 6", "TDMIN_LB OUT",
> +				"TODDR_C IN 6", "TDMIN_LB OUT",
> +				"10U2 INL", "ACODEC LOLP",
> +				"10U2 INR", "ACODEC LORP",
> +				"Lineout", "10U2 OUTL",
> +				"Lineout", "10U2 OUTR";
> +		clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +				<&clkc_pll CLKID_MPLL0>;
> +		assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
> +				  <&clkc_pll CLKID_MPLL0>;
> +		assigned-clock-rates = <1179648000>,
> +				       <270950400>;

2 PLLs only ?
1st appears to be for the 48k family, the 2nd for 44.1k

No 64k support ?


> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};
> +
> +		dai-link-6 {
> +			sound-dai = <&tdmif_a>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
> +			};
> +			codec-1 {
> +				sound-dai = <&toacodec TOACODEC_IN_A>;
> +			};
> +		};
> +
> +		dai-link-7 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&toacodec TOACODEC_IN_B>;
> +			};
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* 8ch HDMI interface */
> +		dai-link-8 {
> +			sound-dai = <&tdmif_c>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +			codec-0 {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
> +			};
> +		};
> +
> +		/* spdif hdmi and coax output */

No pinctrl on spdifout_a, so the coax output cannot work as is.

> +		dai-link-9 {
> +			sound-dai = <&spdifout_a>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
> +			};
> +		};
> +
> +		/* spdif hdmi interface */
> +		dai-link-10 {
> +			sound-dai = <&spdifout_b>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
> +			};
> +		};
> +
> +		/* spdif coax input */
> +		dai-link-11 {
> +			sound-dai = <&spdifin>;
> +
> +			codec {
> +				sound-dai = <&spdif_dir>;
> +			};
> +		};
> +
> +		dai-link-12 {
> +			sound-dai = <&toacodec TOACODEC_OUT>;
> +
> +			codec {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
>  };
>  
>  &pwm_ef {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 2a6fbd530836..2cf9a8f3f396 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -11,6 +11,11 @@
>  #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>  #include <dt-bindings/power/meson-s4-power.h>
>  #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
> +#include <dt-bindings/clock/axg-audio-clkc.h>
> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
>  	cpus {
> @@ -908,4 +913,359 @@ emmc: mmc@fe08c000 {
>  			assigned-clock-rates = <24000000>;
>  		};
>  	};
> +
> +	tdmif_a: audio-controller-0 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_A";
> +		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";

Should they all be disabled by default ?

> +	};
> +
> +	tdmif_b: audio-controller-1 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_B";
> +		clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +
> +	tdmif_c: audio-controller-2 {
> +		compatible = "amlogic,axg-tdm-iface";
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "TDM_C";
> +		clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
> +			 <&clkc_audio AUD_CLKID_MST_C_MCLK>;
> +		clock-names = "sclk", "lrclk","mclk";
> +	};
> +};
> +
> +&apb4 {
> +	acodec: audio-controller@1a000 {
> +		compatible = "amlogic,t9015";
> +		reg = <0x0 0x1a000 0x0 0x14>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "ACODEC";
> +		clocks = <&clkc_periphs CLKID_ACODEC>;
> +		clock-names = "pclk";
> +		resets = <&reset RESET_ACODEC>;
> +		AVDD-supply = <&vddio_ao1v8>;

Board-level regulator referenced from the SoC dtsi.

-- 
Jerome

