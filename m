Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B614C6815
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951616; cv=pass; b=O+Jn2o7KZZik0qCMM3kH8Hzntwj/48vSJlAR7rZ4MGb6Xi3hKVtyEh7uTDIV8zGH6LhprGufd2r3uAJZXeOr3dhtsKyqBMXP5ctp3C9UnWpa61mgzJUbTGJSrQPhjTfC9g9JTiRd0U1qleMEsZwG1psA0lYIzor0knvQkopnlCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951616; c=relaxed/simple;
	bh=PNbOBNyXkRISuH2zKHNjb70SO7pk9MOzRaXz8icfJsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGzCeImxUVXS8SELdgk+GaedZ6z2VewSKInGqFvXvPkF1PIltMcODsK1rYQL0p7cOitXHrc+ddZRptXi3hhddbtlka8KgYKD0hSJMDHkEZ5SreCnXYFiLjUGmaQXuRG4e828wbjJflTxuH7sp8XAM6VcLNLicozuzmLyveDxHNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrmKBOwJ; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrmKBOwJ"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-980b6159d30so2135330241.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951614; cv=none;
        d=google.com; s=arc-20260327;
        b=EgAKlBp/z7j2M7cjMW2I2kClTgjTjTYhw0IUEMLJwU7sq/H1yVqiqlnuHE4vv36Eig
         AdgvUXiKaXNSPY6K0mSoGS7wxt397AmqDMYHcW/aS75zXVh+CMKKxKUO+oEYAcgQob3f
         EbBBwa+SojEZgk1rsRdMhQE5eWE9gAiaUkAJ9zqmWI078fFm84Pe7VZqdN1LAGeTs42T
         t+fO5pE33RPpFj4B5NFARKfwffMdxqbqKXNUAI6u01LpRZcM8gePOIl80bJPWgPx3pEd
         WH95w9SFCK3b5maT+5z5o1qrUJGmxyuR086mkRzuMt4VM4gHuv6cWY2ix94Rrfw7yLSt
         +wBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        fh=1h8DJCVQOH93djrx6eZopNpHNEbQxYzWAqYyV/Zx7Lk=;
        b=oIjp5S8xS2P80GHGmOtMzHOXjCybj5PrmDWYR8/deRwetkY7A0mdMo3VO3Ws9lnAAJ
         KB9p4OEGIGDWetcJLATWBuUCKXUAtxoGQTqS6nz4WtO5rToVeRNE9yf4JQtgtER5p6Jh
         4kwLvEMd4BOgAc405Wr1KyfSGZGG1Scs7n3TMh9V+qHOZ46rE2ewTzlycWgUVBjpIX5u
         I1igLwFadswmUoBtt3CunMhzIilZpQdzS1MtwEJ2pXYm2m5YKOO7AiafmwiTYG8kwm1K
         9t9MusVbgNFNE6aYldOAmu1u4mAgMJI0+64OqkxebatE/7kV0eOCU8ZzCibhLnrQ8JDt
         0Tzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951614; x=1791556414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=UrmKBOwJD7r+45MqNt0a/8g1jZY8qSEomvYl7QfBvV8EBMT9kRew5q9MpDrDD9Bpqk
         yeB20MD8lwLB9OE4YFHjCxacABO3b/wfK52/hBDvzDUTFvFE+q0ZzuyZNlyDx424lF44
         5e4xW7nymLZWDYyG0skw2xLMMWQpS6pU/KbjdgDPhcqMdQsCgNYVr+P3VZoy7FhYX9Q/
         ylhtD5+bWWKNXYsPx7help9iNcNk8B/p3pqGRDXdh+ztRffT8MPwYJTx4yC5rpzrH3Rp
         XLm/6WWydqOk6WsIErXf2Y1khklK/xWEHnwY0bemZcwwbhjzAVVHckmxyLAa5y8zMsz0
         NkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951614; x=1791556414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMvSO5P24Ym2wFibt0ipNlW23D4EQZ7yzqETy/c1yNM=;
        b=eOJT+LAwl8u6rAzE08iybrJza7PI8aSzMQigBAdrcQMfOZYbnDVMgW9wa29LBllUQp
         SyAVCCn5OvCbUVifjvxHUkgpjbtWCJuuCNVbsPR/0qNxC6VpPVfLAdz+r6204MTchQZW
         wy8lfNgx4/IlpGMR9WZFV0vyefm9LY7NxQM7zqS8q4C9S2bZeKhzd4EIgx2BJGeDBG2P
         52G1RAfZxpiFXsakkUgsPzKQqQiLtYsIJGfTlH1rdeDlouGeyGWEeNgwoiXWr71ElsN9
         WoBdSLPXLIYX0I4mpYZHG/pjyVeBx2GZGF8qszYoz87izdBAXim/LsTKXi8Z5SSv79nB
         J8Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzdkG3FyehGoeVX1nUXWAA94iYBW67qLw8lqqUwW7VB5MczcntpCRyXCUWfgZjUg3G/Z6o13TbTSDK1tvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJcID3TRD0z43TQ+dUu1zvMacaMq6QAnneTqwv1k2Qqpq4JRD+
	U1c81TCSvxJ31IzdTvz7FFbZBVuwKWtx2QQBUTHIt1pb0G6HYKV80VVXvNzWouxuvmo+qTlZjYy
	2ABwCXKKTdb2oufFawy56G5QZV9B6lk1Gsv5MBwXQhw==
X-Gm-Gg: AYBFou1SqQ+WOBuA1CWIRt8LH5V+vpY7Cu//SwykwfKxzaDBrae0PcfyXsnLfFIYohW
	NUOn1uxbqmGCysILUhaRoH/nYsDmFGWrD+cd5X6QD/oKWodMtmL0rM+IQ/BwBv88w59UPk46SIp
	yNPHmG1bMqlfya2xvhvqgm5IM/wkSon5SV0ehHitmjt1JvHuxd5EcyyZCTwknHyVS+smoZHA38E
	0mBvW/fx7ZVDbXworSC0d9qU56Qpw/NkVxlakXhfk3fbw0Obho4bmNHjnWhJ4KDkNdGZkjP9ysM
	sW7d3RvF/ldHW57TIiK9KS1Od57dyg/q/ZAsYH5ezT1491MeWkSDJr+84Y5WCBc9K7cvReWYihl
	yuyqqPMMztlddvw==
X-Received: by 2002:a05:6102:6444:b0:7ba:ea54:65a9 with SMTP id
 ada2fe7eead31-7c0f42731b5mr647395137.6.1790951614035; Fri, 02 Oct 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-4-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:33:20 +0100
X-Gm-Features: AclHuK_nlsYCw4TsUB6KsMMTGZlzaoT0nlgKI-1tdzuxscLcNJSDMijcKeaoSvg
Message-ID: <CADrjBPpXvW1RVGC=mTO9sQncS3w4zAMKekwVa7Vbrq5OszJMwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: exynos850-e850-96: add soc thermistor node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The WinLink E850-96 board has a Murata NCP03WF104 NTC thermistor placed
> near the SoC package die and connected to channel 0 of the CMGP ADC.
>
> Enable the ADC node, define a dummy 1.8V regulator supply for ADC, and
> add the board-level thermistor node linked to channel 0 of exynos_adc.
> Regulator is represented as a dummy one because we lack PMIC support and
> should be replaced with a real one when PMIC support will be implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> index afef32ad4ee2..1abae8b9fa49 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
> @@ -126,6 +126,14 @@ reg_dummy: regulator-0 {
>                 regulator-name = "dummy_reg";
>         };
>
> +       /* TODO: Remove this once PMIC is implemented  */
> +       vdd_1v8_dummy: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd_1v8_dummy";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +       };
> +
>         reg_usb_host_vbus: regulator-1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "usb_host_vbus";
> @@ -166,6 +174,20 @@ rtcclk: clock-rtcclk {
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       thermistor-soc {
> +               compatible = "murata,ncp03wf104";
> +               pullup-uv = <1800000>;
> +               pullup-ohm = <100000>;
> +               pulldown-ohm = <0>;
> +               io-channels = <&exynos_adc 0>;
> +               #thermal-sensor-cells = <0>;
> +       };
> +};
> +
> +&exynos_adc {
> +       status = "okay";
> +       vdd-supply = <&vdd_1v8_dummy>;
>  };
>
>  &cmu_hsi {
>
> --
> 2.51.0
>
