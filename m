Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018374A3F1B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483593; cv=pass; b=FUA7PIUoVTVUrjJit8Ar0467xVWNJ0Du2LJd3p0cYfRMuiCqshsRKPLlVpuevg5M6fjjk+uIw3lJqYrw+QhBMvObZVBBIP3YFtav/yUCho+2FrB4RDl92JnxTgoglOQcc5ab1ru7hrcIuSlPzmALuYekyVckmY+QrjgbTYs11OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483593; c=relaxed/simple;
	bh=IB17BlzL0mRaevlYv9G6gaKy0+hTRBKqpj9qTU+0O94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xx3fopVcXsA6NvS97qtPdtmfJz4wQKLfu7i6zS0dQbtiWAYntsCtHLP5CmJFaXo0Ht37xVYaGqVfsb6M62rIDGFp86rbaqghgJ6rGfUDEDg4Ad1Z5X4nDoEWxcio6n4EmIO2GFdIwRabZRrR1nJ4b2h5a7ISZ2IkD2v5GnksYS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEvzidqw; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEvzidqw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso4663194a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483579; cv=none;
        d=google.com; s=arc-20260327;
        b=gvoDCyS0o0kBM6PY6sarLsGbjHMZKLbzBGjQEAtqphImc+I2e07OogElru6/KyDCBw
         uTz4AXHCpx7Ig+PmM0uZDEI61Od/iGbEE0pY28VnN1mK0X6YwoGswo4QjprZKf/fevpm
         Lx6Ge7mH1mN75PVeg9JHd8Ng7IogtFjDz0VMDx7ihogI/MQZAjfxMw9+EgukZRRQaX8F
         RoAkPiA+wBGvZb8ZmvE5tZBJuCNBikQHDDGHCgfjeydkz4UGpveDlAFbJkgU/ZfwYYu2
         /p8K9IckV4Fk8sHOZAwu6oFBpogowQreOCy1digoyvH4p5Ql61eRpMfN+YIhErXnocyv
         iZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        fh=lhQhVgNV+IJ2x/w2UyrhcggyFlzbGuqHgLenFnkljJs=;
        b=ADBfFkm6ALmHWoCAZpOFXkE0yXDUkLLPYCGwTGzfNCKox3riZW0v0ibPPlX5ZxekCH
         wD1OBKInG83K/uByUHQgm/Z+mVZSv98TddQe2avXoNq/G25cCwNc1wnLx9oxG6lu0ucX
         H9Y6GF27TeM2XDGptvpd7j2fYAmZCriVvTtlpWIzZlKG/7EGNqwmKHZNl0a/4Pz6uavm
         lINJNwLZ/RybxW0EfZ7RqJJWa8dw5NuapsNSVybLTXMTlT/o3acjYUU1TbqdIXzI/Rjz
         tVHJB9qc11JhJIiWDkV4LCjTUHWyON2cVKjH1/FOn+QVuu539PKnVfuwQuJtOLuElDx6
         EDUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483579; x=1790088379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=oEvzidqwsukw0WQPlBFVQpFzZ4ZYUtjSuti/KYZqYPX05+1v5ll0g1/9wlmgypPFRv
         yyenRv+dw2/ifxXVPnNuL+LdcgepILojZAM6pKhOOzSVKtk/6NSQTsw3+FcwvnkidEt0
         3JyPw2RqWe6NwP1sko2+yab+CfiVpl8MYyftVAevzTTozpwVduyb0V/3zb5uHIgFgI8v
         As9g6/7ELb8cQ7MkIC47ydib8bJxU5i7SdGFLGKqi9hQDexpYFOYBwpE6w/gfQ5TBeuv
         ydZ2a9Xhr1wazG0pjuGpgAZ2/ZCjoNYXjKO//TQgSciRddnwZsnr82dmVM1SMjzEaBUd
         LiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483579; x=1790088379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=HVzj0RhMrUCdvwtNN4W6pYKCkmibUTnydZ7qtiW5UewxWLh/BrnB+VIXK4H2saNlZ0
         nbj/uzeAuylGcyW7KKnQuYjUYgcRo3PoXFalU53CQ13T/zz+JBsvmhIFkaJybYa2znAH
         xiSDbCEshQSkTjgHE354JKhVpeemkwvL+b2eR1dOCkRhP1byr95pcsase6zENZ2zpkxq
         NcHEj30uEcRzI+whK3pkwvI990pLmT23cTf2wmMF0kC6WCt0mjDmLII7BeujR/XGJ9jv
         0tyFAnEm4N41DljJIY57aDmF8Vhe7nLbrGIaWu1vIStgZ50iEidTeHAyalqbyIQOQcwX
         FAng==
X-Forwarded-Encrypted: i=1; AKwUvBymB+Yn+SNT23Qo9qJoieR/8lulV2RUjOy7Ftl1hGd+EHTQo4yjgPn6A8SyP6Zr0gryaLIJbEAscZZYpm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPVvAplZaGdsMV1HIxE3VaALjeDewp6mzkSlExPJHeFYqfTklf
	O61qKKwCeW169WTR6Y3JAmmkVkhY2DJwziAgCjcaT+dnkKASHRI5zDs+e7eWWetw8pn8zg5f8dL
	OHS5R0hM89r36CDvrTdh6FfZ3paqITB51U4Ux3LZXag==
X-Gm-Gg: AYBFou1Yy+96QhruaBrKkuNhoXjDq8f00bktRG0GFadt7FV36FgZvPpATN5k0yASKKm
	d3kpnrrib98Q2Nm30eZ/9dkyNUpz/IdR25F0jx9PQkxDaNo7hPeeFK0/SkkcpIhaJwbjDBqDU2p
	2NkqHccMgdrwISbV4QOvTIrTdgGWUC/KEh39N9n2N0hBxXIMC08+xo1Fkj9qdCrXukM/k+713a2
	QUMLsTzFqguFxINyXAFY9JfCNG1l1NJ4jPUgkPvFMrJ86GyviO2xfeHRN/cppHTGfqWPcTpmO0S
	MzV9XE6AocrsfoW2S2U2ipypc57ZYhfngkfNDYAAkVSgNe3vPFjRKU/nj4iYjFyxPc12q7aNsDs
	WnRGHqg3Mwg36cw==
X-Received: by 2002:a05:6402:541a:b0:6a9:acbb:437a with SMTP id
 4fb4d7f45d1cf-6a9f6264d4amr4709617a12.19.1789483579261; Tue, 15 Sep 2026
 07:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:46:08 +0100
X-Gm-Features: AcwNN1Wim9K-brFBMXY9henHTcNARzZEbkYderuFVS29rKbsh07RWtUUnTNerSs
Message-ID: <CADrjBPpMdKVmPq2Dzbdt_kPHxX1m6nDczefHNRY6ZCPx3DyCTw@mail.gmail.com>
Subject: Re: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 11:19, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (10):
>       arm64: dts: exynos: axis: Re-order nodes to match coding style
>       arm64: dts: exynos: axis: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order nodes to match coding style
>       [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
>       arm64: dts: exynos2200-g0s: Re-order properties to match coding style
>       arm64: dts: exynos2200: Drop redundant blank lines
>       arm64: dts: exynos5433: Re-order nodes to match coding style
>       arm64: dts: exynos5433: Re-order properties to match coding style
>       arm64: dts: exynos7870: Re-order properties to match coding style
>
>  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
>  arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
>  15 files changed, 421 insertions(+), 412 deletions(-)
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
