Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0899C3B4EA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483202; cv=pass; b=BKqfCi3S0NzTj5chxhBTZqut73XwfBzOW/+K5aaRCY8b5+RZaN3NpWjGaWm0wkgH3yQvdZv3tfStffcYOpjzioRZvmaR1QgTvy+XdxBgRzwsHmsWw9/N61RKhAV18SiKVK/FUDl35KxCXRLANT94z/e8wTU2gVNUJq++Q2QPGXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483202; c=relaxed/simple;
	bh=bxAXDKKvJla3W1iIKPwj/ImYJtcT6TODMkzHew3uDnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMW5qRCqwH6HcP8SLeSegj6KBpcU8pxijrLQdLhtaKUyd0TcyNvLcHI7dDYPbRNKCKVbqmtdkQf29GdUA2+uIzqkXysmrbn/6dU+0D313bscdEiNSIH0j8rabKafdJcCF802e78Q/P6qkUSdqj2tOTKe0i9HAYBIBKeXnbMnyWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsfwtDDv; arc=pass smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsfwtDDv"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso722296a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483198; cv=none;
        d=google.com; s=arc-20260327;
        b=ATxHfiAlJ1v4ZACnS9aMYLqF7Kx8tan9ZYzkPwJ2IJMw04jQLk6WEFqnwTqb3Cz3oJ
         dCApSY0zcyro8Qjns25XFEXH1NNSDw79OeO8lblg5yj4SDQ7OiXhqLQTTkpZP0kJrEZu
         8D99H5dCs7bhIHroxuh6rd6MPw36T2zmL6sGCqZroSW9C4btDf3Zuo1Baway43V8QUvT
         WUbQVrlqDO3CNxnHie5mfGxJDmd6Ym0Zt+CiuKa1jZsFeQxCLrwS9iNFwbj/2m+OAGiR
         +puvTx9fpBwxCKHY7gjq/o9UQjB3pdjhyt0q8ibV16R1uS6apxtx8+m0QZ4ozEg4QhCj
         a3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        fh=bVdlkfWVeUswuftSWvg5quu4muBwZkM3iQQUQzvA1yE=;
        b=qxtPdeMEZgaviSr59fQfY+qysdUlzhQuyprrHcOc6Ze5S/e4wa7Wl3h5tyLs+qnbGu
         d1euRIxDYB2NPkAucUQOCHVBNNIUQMl++67n6YLO2I0c6lbFrgfTWGMk/k97khgFtihr
         PXKj7LpaW4bbD5ZhwBmGSa4Hx/03js1kJCqt//1ymdvbN7Pcn3B/+Zqe/a8LuN79FAsw
         aCJLyJqVqsO/Oc33QFhXwx+zz8qVHOnw62zIhlvshFlRAVGDPGR8V0oq+pBiCnCeut8l
         hvGXx2iFL1UMnY+lMevNab9RGnC2TFmn07lAe97gQTjiiECIT41ptyRyU8+m2dJM9YEX
         2Ciw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483198; x=1790087998; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=HsfwtDDvtnLaXd4IM5o8j+x+NH3OWLAiok1HXT7Wx6pKsPHwC3EFLXeGfKsjuA2Yo9
         09hcNWo0ov8EZRG/dc9I7GaCfMVXcABmOV2oqy+lnlrG4rg/pRFeKazbQRCUoozhF6mM
         fS0pQZOLLqgtI1X2M0On+TKyJqnPHu9BTxM6GVWvwt3Kg4IXnKaZCfN1XqV/MOB5qatw
         /RxAPExpFX+5NJY7QVEAkux1MRBvb0SvnK/4eefbDL2W+il+C+vDJu8AW+/+MamrDf4W
         Ug5meXddV3I8wewZDdSVOB367kQSZTvQirq+NGhZGdHkEUr8VwK4bO38o+xW4m0iGtrR
         kIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483198; x=1790087998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=lKSoldayuANh+tB/3st9UcirHXDkb0iKoYzrjppL2dBLpsgF15XPfhZEwzDxX1J64H
         JDpN6yxtO5C7JWjzc3YWryTJF60RhR/G/2TcegkUbLwmY1gW/fWmxHaUH9qceEDYtQ+G
         klvZmzqR4kUbHHzPto4HiBf30vu31Tf96NQc2f8zlwvZsffF2a2zx1GS+ahU5LxmzYAC
         aDkmCls31dKs9iPR2ZdpGIQRQixlkGvrQbPHDIOXNOBvA/d6Lj580sUsYJA+5WhiaMaA
         Ik3XIGASdS2SigwWpHv8ur9p57vF9AoFdI+sGn5tcv7Tq6cFlNKSaSf5n/7DXuU/tnZY
         grUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx36zkiLZcfZM2H8y4FmwC++WXOAry8WIOno7HIX5/mP7R1wMh62n+V/xGbQnfpUBkinW8t0XuRCS3h9t0=@vger.kernel.org
X-Gm-Message-State: AFuF++nb3L+SHw771saaFhXNOyuhUnF2rOzBpNHYqFgPcFYHLMWBHs8N
	uSOdzjGMnazuZ/i8MXINJLLSluZ0jITBr8+Pi9Hy43RT4XIxYvRnuEo2T1wpJux/cXPErXDlXZe
	/GfpuvFS1vLXLJ21XD5lG5FmT99cLkwtr+SALwlaAqA==
X-Gm-Gg: AYBFou2d33uk1hPrMgvziDWhev4c5GO03gch1dt22AgRsckblcvdtYXbNEBS3mw4Fm0
	PYl6+aHWraBDEkbI3PLByZPdxNT/UcXS0wRvHn5EfUDyQs6gQ8KTUVse/sXSKqsrXcpmliAwae0
	h3hNkIaY6Sg2vf5lPhFedZyB30/WI82DWSzWJn0wjIPOu30Rxxav6ZWWVZDlD3NLbR58WGk89Sr
	o0pdA0XibWBEgacUA1xqtb7pNuC8qfX+K8VbDHvW0176kHirfkJfe0neE2u2pzwqKGCWMepytS5
	P3raE9GLP7aFxiGhF0/K/Con6hkVsJtJ4Gyl3tbKy9DUexMBUqacJwKDFDxQAKo8U9I2c1nrZnw
	lTLCi8nG+U/kjwQ==
X-Received: by 2002:a05:6402:20ce:20b0:6aa:1112:62ce with SMTP id
 4fb4d7f45d1cf-6aa11126963mr2247651a12.17.1789483198039; Tue, 15 Sep 2026
 07:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:39:46 +0100
X-Gm-Features: AcwNN1UWbY0jLS0AasFyFQBRa0-ZrbV9B9Ct3OZ1vkaXc7hzdPFBJ52yoD3W0ms
Message-ID: <CADrjBPoEmxv=f9DmRx2Zn9cB40+V9DpruayEHFkAznbNeu7D_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required, that is why "mmio-sram"
> compatible can't be used for ACPM purposes because it requires child nodes
> to be declared, which are not needed and make no sense in case of ACPM.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram
>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>
