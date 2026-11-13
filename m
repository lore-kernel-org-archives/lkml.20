Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579583;
	b=z4RspEpzRTwz/wWYovQ2BKYfoZ9Irx8LNSrFxzmYYGtxnInM5cUAP6RVt94CJXhItjiK
	 SwLU3N/QBJHbUBHM7hG+2lIdwgP/tYtON1lFXj1o26Yqqj6ZgvRkV3CJn884SoPuRPFwZ
	 s9ysFuKGQ1/ugWrM3vXUMO28OoaTAbD3tcnuDqbCHZEcAPyILo5VL/qx9BIazBuNAlVag
	 cOchttTQ+JWLtu214u/QG73JZwpK1vE4fWUgVN7OYK/binE8o5fMbINSNfE887WASEPYR
	 Z5KNmoN8u+Vz3baVaPxBhoRvlhO/pHL8tZJ3iwmdphg73zK5e+IdRyqsEemIjvinYGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
	b=JuiiN06pOxG8AzUFdMEwlhPOaLbCBfq9Yw7T3xi8tn4M2T+GJdZthtYZLIwLH2jdHSGq
	 pbo2iZsWZBmKhNl9HbfZHWE99UjmB+Hfo9JSWA8ERixztHCCgIov88qtgDy4J6DrfQRHI
	 nQzmRc0sxxAyHYD+VGt/msY1bELtInDiNb7yBhakbd3pMo7BjdDnqXDhQbHRRZel9vHTU
	 tqr6RgDufOQqLY/4BOn493jS7xsY3X9rYCPnb6LY+OSKz9tQx46ah8tgBOhnMVIW5+EuD
	 0sSMBHrMspNvcdt2mrteAQUBrct2RsFzs9HVcF3ctqwHcY5S57Co/l9pWZdKdDwybEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F0606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98F0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso2687903a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794579581; cv=none;
        d=google.com; s=arc-20260327;
        b=CZiY9M63M4M263yNABIV5g5oLVX6uysxNGkvv6t07CLTUg3lEJR7lRi1IfaWKRcO9G
         BSwpbNs3p73ksxOZnZfE9c4tGmLqTQs5VUA5LB8DZCMPRmu8QzX2cE2qPLhxAk621zfo
         ivsQov+8q9vs8rN6Cq+OCtnzOF8kcmclwBG97jnpv6wd7dkcUfbHRFJ+CmtnRnX9DAnL
         8pQfWwQclmleOIYo49rimgrjTvN3BaVo+NG3JSuOStTjhEN/OKXHYO0AnVQLKwGMCanj
         FpDbk+xNRvVwa8N7bFlKzwPAIiKa+490AuZ/XGFC3jFpao4Oil+XVnjdk8biz+avlgO3
         mi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        fh=lQsRLnxUre8CVpwruV/0Y1p0FsxVFGWDHGl2EPihCDA=;
        b=M6yLWTZSR7Gw1wC71oGRRXD58NuYoel+LodGGKKKtcQc5DGrPcp05CNi2ASkc9cZAk
         Q54n6rLV7GJGVQRmhOwaiLFr8ZY+Pc/45BeHHPeOLxUY2yrRU19STZvFSxUfBpXaCM8K
         jp6MZPQrJdqmp6CM0n2l66/E7KZmays88I+LfGAUB27QUtiJztCrXGoKvoB+COV1koDa
         k9rwawu/H/ANjRcBxX1GxZ7LIF6VE/anGfv0zjtn34oEMSVjtrYUt+w3Z9KNXJv5gHjY
         5jcnjyotL7tWft0/CpCYcbLAIhvWsgY6iB/zik0jGAT0/321jN6ycyQ8ZG9ULoHZydBl
         RySw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794579581; x=1795184381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=CuGpuG2KrPPwcJdQD8Mt4QLipSoESTVXmGWzGuhZt8UmoCgk+cMoOBoU5i9VRwNi4w
         rh2Zg3s0Qlf8jDtUgOWkJovpMlnNGIKgGnRxk15hcW02DhYIdQd7kHVNzO4nP2kmBYuY
         JO5na0F2kV6uQXP1SDKHOaTGx8kevs75jbmgy7joxXBX0QNEok1leCrTJA8Nu7gZ255a
         7CBFWO2oXC4Q8ggcij+pFbu5AYxoSXoDL73541MhIxQko8FsqYlhTe4A3Ma59QcjXblC
         qu0eJh3jxnWjLKplHD9g2cxma+qPJBK817xqdFV81tftlroFD3zKtakJjJNPfITIznsI
         Gx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579581; x=1795184381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=dSiRH/q9n36ITn1HhqhS6dJhpGPTvnnPuWZkb71BKYdb7jYvWfetJ7jHxznFwszrIY
         XSs9gbibgHzve7UcIq2djr4qmRKRSZzi+NfiNc7CGHCYCPPpNVh2O7KL8cmJ+wdBalWJ
         eeFhu5p8zonwxiTrU0TKynBUBGDwv4s/xpWgGnlTtPl4W2qEf4G0C92MNfFtd4jFeepj
         FESMCRgMfJzCzLn4lXF3/I0PYvzQwx2GoKI5fHpjWxf1AlKINxAMv1YsZ+LfN49Z8S3Y
         a0kVtYqqHeKYUkwWoq//2mad3AxBOCVKIWnSmkh4AKjgM39np2tXFtA3mB6U7d1rD7FA
         lvYw==
X-Forwarded-Encrypted: i=1; AL+hErGtBmGW01I0WvVzLx09DuyEJxn1zkcfR65xVAG5vg6+IJ5O4rQlZS8HRdHU5n6ZcvcNCRZiHuoCQR2Vae4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/46XqthKpArMDsgga7xKLMWMUoTeSh54XaLICcdjRkm3QgjNW0
	W10vCIea/h0PH3BGPdNftkvjowFIgirUzDBP3HPRQu9CgW6g02a4wK0mRP5nU1uM3I+2X9y6Sd2
	r4OUV6ZccG6aXZPj9laE/Pm0fHOVlR9wckh8535Xzgw==
X-Gm-Gg: AYBFou3qWxu7kCr9yUndZQGtjxQs5gQs5J6AybeT+T0WZi32COv31fBpz3MTfNudURd
	XF/ikL7BBPtpMcEN0GgaWaveQ51PH6c4V1gTH5dP5pwR1h2ehat/krHM2sq/4vxQ4xddy0hUisF
	56tcNCNVMyYR9Xe64b65TX/kHPxQJGiPMpnWhmZE/7Q2a5B30ousQ/9sOqGijcgxYyceA22EIjm
	EQ2mSyRSbgbjOWEZ6eVP6P0gnqk/R16jm8aOVxxKkHy2L30db1c9Zn0hvCOCTVrsOHdC5xv4T7T
	gl650Utfa13wyrQ7Dmy9S5C3Veb3FxRrqTv2UILQ5oxQCpiwn0pS0fv/nITpugJEQFWd+NFsyvY
	AO5i6yy7idQS7yy95RBDr1EPftyYMJBVt56SblJULJNV2AV3w5JG1in0vmaQe3lZaQ8OrSw==
X-Received: by 2002:a05:6402:a6cb:20b0:6b7:aca7:2264 with SMTP id
 4fb4d7f45d1cf-6b7c0be4e2amr1723925a12.9.1794579581264; Fri, 13 Nov 2026
 06:19:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-1-selvarasu.g@samsung.com> <20261105121401.1661711-3-selvarasu.g@samsung.com>
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 14:19:29 +0000
X-Gm-Features: AclHuK9BtJmzcgRQKlrlAtXVpG8_cOgWPWRM5bnocNCGOV2wnBohhrKZoowVukc
Message-ID: <CADrjBPruky8SZYpX=MgsMjiKGUJhOhVu9j3Z+9JgJbizmcxSjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform driver
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 12:14, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue.
>
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..069b265c9808 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>         { .compatible = "spacemit,k3-dwc3", },
>         { .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>         { .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
> +       { .compatible = "samsung,exynos8855-dwc3", },
>         { .compatible = "starfive,jhb100-dwc3", },
>         { /* sentinel */ }
>  };
> --
> 2.17.1
>
