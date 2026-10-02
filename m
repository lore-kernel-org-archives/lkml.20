Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0D24DA9C9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952232; cv=pass; b=RIJP2pmoG9AkmLmgoXdBkqGNK0G2N8Q/yuQK2QSUXYEmhXXhe4XbWLR7er7V+YTWL1Yarl8bk5HzEvVN6MnbqHsuVULwokpoSXKBq080n3t6RuophQGDJavfcT0YrPHIWyj5VIv98XJlSYdzaOZ0L7RsHpny/K8hvzVUTZoGR1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952232; c=relaxed/simple;
	bh=ciy5AYs5s8nztyVhIOwmEsvrjTLJIlrAEhcvpdlNER8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+N5H3mwl/z06SeHnXkpefS0aISczQMuzToyh93bqdCvYX5utk8vENhwjXIdt9qXoYLRYhTQ6BfxwSfNcRMAoALfMJDxvwF3im4aZHIy475hYcEcTDU7wfjkg0/2Tq1Tn7es2Kgp7todv8nc7xK0QccTEXgk6EwQ3coYB7zNmXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCF3L400; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCF3L400"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7c0632898c9so570079137.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952222; cv=none;
        d=google.com; s=arc-20260327;
        b=VXF1IQ8zgloFljLQCFgcw2VAqR6RsyJ5b0utzZtCEhJs9E+PI5+pZnOfkedjN+U8sv
         MT+7rVKi7kC1RMhGqneaU7aZhcNRn756BbjYhSyNlQC97ZuWMMo6SyVx+c3pTM3EmV0T
         N/9hAQFlh+IL33F5pWYVkvBsaPM2anIj5c1cT8uU4WTAMCTy9+U+gNLKr/tnPvcpF2oo
         O1UssaxMh+lneCjEePLpbFeaP2VBWnpPCZmm/23/GgdTVZl0HdIIXqPlTMYeTU8aJ8bx
         qsKdWty72Aif9kPwDJYEAx1qXi/VQatUDnZfRQmdG4ONwNcaMRpdjdaiLOKQCacVVKeg
         ZyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        fh=3WeDuLxNBdNPEl9RyvjXhtEAKT/u1UTbT/xLspLoRCw=;
        b=oShfCQsv8R8SDM9mS300miksKTmfB7aBNUtSBOz84Hmc1sUIkaxlsA7L76AnWSndcB
         2/bFTJ/amiz3t0tyaYxU36XJwCTLbOYjUeS4ulY8D9if2tzGIW6ejR2gXk67cAKdtiZy
         u3Fw0tcB8sKzJy4aXyPEuloCsv+DmSSmQyV43GpDdA/sXENyGPrLo1mJ+cr4IWbfA4EN
         bzebDW6SOzzO8xfjb+qEq5I+5W/9viagF/q/PSJkkmKOokEbRVOpmfNTjnnmCupxllmr
         rmEpHA6EXxyXt37NpBNUprZ0fJ8LDH6gJMeDnnXIKyONM5i6FCgZS46ebEHfKT/rbKPZ
         3rZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952222; x=1791557022; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=uCF3L400Mw41pP+ID6dTCrQn/Ou4FPEJbBHdeII18Hoz2k1k4rre1rJFIAO6bUlwre
         z6gRPhTpXcPlz3nq0557AFvFh64IkDhE8gu0hkTjEtYc2AALo8ve7aHeBWZgT9kS+qGm
         Aahd4jObOdGpUC05G+dt5DQuF+dhHOuKKmZ6W24WpocQRINW+cTk76pKa47/8kSJj8hq
         vlvzoyk+5wxSfN4jV0Sl34fdQ36egSdDouJplkpNq5THjyyVeVWZqvL8by+BiUPNF7Xw
         3PiJS7vaaBE6zz6Q9K+202iOt1HVPlA/GK7GXLGJs75ihgepxby2XEeWJJsV23G3G3Nd
         ThfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952222; x=1791557022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=o0BN1TL4KY+63G2/jigNItodIMOh4yWYH2SMnxzOqPN561ZB3WyMSAQr9reQB9AHkB
         USMqJ6W7eJcpJ8cuqxZnLxscgkC9V9ktPcwz0GZZCYwmHcu5cf+4gdKzRHXaCbZdWzk7
         +t8VnaKyB/vczyygotJSI9XcqieQqhiYwiMtcUzfjy2UhGDRJJsAbArMW6GSKk4fJbKo
         rcRCtj4dI5fCMNM1pwdqlZLabGxcOjyRhTddlxKZU+yORaXldHFDw8PK6fCncQ0i4JhD
         QsrDH0AztnRFhbtoHbhOcV3u3FrzPRhZ/vqRnfwyuObM8SVi1U8MVFgjn7vTpkoekymf
         ckpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZfN52oHbby/uiCShpLpwfClMWllQg8YN/SjaMBPADU9lTQsR/WBymR2Rw3VqtbJC7f1is9D1ZOp5pRtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNyIml9ch8M3SfO42bcoTvkgINFxXL8clCjslNWteBHxJcOhQy
	k6VsRHk0wMIStD6gbLiroqgBArOsbIhwDt5YxAXP1Q6Npl8SfiwBfIbinJuJ663KUiwj2wsBmGe
	vaOKMUKDb7ZDsbyNvmhTPwr//l3XFcbQZehd49Cl3bg==
X-Gm-Gg: AYBFou2g7M+BdHXzwDuQdePZB7W+sUYfOxHnadoDDZB9oc0n7VmDVYgK/fTFmvUJ/1O
	WD1ncrJ8Jfwy1QUsMCSc+84biQ5Gp/SwTiiMQDZnRcyFWaIaCMuYP2Gww1cTqLPE4b9rDSVuOO7
	lyGVcdC5H6HYF4JYtlWDTe8+iAm9aqbbwZ/09BexLzd9kCfaoSwrMRgU4ngu8gSTl6tQ/N0MGzD
	VPWSjJsf82Rw8wlz+cE2z5Ys6MS6AInnmRN5KDVZIGefWB7fAlsAwjwW8dySc1hBms1+k1/EDwu
	Jf+W55nXWWKh1qcKkUJJ/Vb3b9DfQZZOUNhHKoWZ56F2nOxDZh6esISBTO93ikBC0mJcFI2Revl
	HLW7pLVWOCXAMHv2Fl4CzJ/Vd
X-Received: by 2002:a05:6102:f9b:b0:7a1:f980:e936 with SMTP id
 ada2fe7eead31-7c0f51a9b92mr610476137.18.1790952222091; Fri, 02 Oct 2026
 07:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:43:29 +0100
X-Gm-Features: AclHuK-HUUsrOdFljkk42xven02N-tiuZrJ__yBG6xUzcagLPJ7c3UWcflomjnQ
Message-ID: <CADrjBPqi3RWdUy-S2Vn2-E6h0OGhrFPWEcKcarswivOdPzFTKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 03:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 = {
> +       .initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name = "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
>                 .compatible = "google,gs101-acpm-ipc",
>                 .data = &acpm_gs101,
>         },
> +       {
> +               .compatible = "samsung,exynos850-acpm-ipc",
> +               .data = &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
