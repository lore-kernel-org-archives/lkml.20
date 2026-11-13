Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567776;
	b=TvvXYvG44OQD6PSdliDP/UeGwjP3WfTPE4+lS6187ok3V995Y+jAYHW01DpMXgozDaus
	 EThXbLm9YaQiOAtabOdiaU/tG/glfuMpk7bRXIJMdHWU/UJ/0zgSlQBUcPhmfb8SFXIzu
	 OHWngBHGsiW/1F6DamKQyxt0jUlTfC0qp2lOsfkDTFP9ZIBxwlHM7xak+6ispDQq5ehcf
	 hSbCjYPoV7MXjbEWiB0c+XQxAMSt3vP88Mf22VeC39wziPflpsBIuaTf8b3WhT7jxptQZ
	 8QdFtOTTU+LrsOxNXaU3+7M3W4AAvyQvuN29oQOe8GkmhDXrscHI0gVv903fD8O+8CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
	b=hgKUxWQrlz3jeXLb2R3f9o53KlXZRkmGgdnon27/Fz1tGhqYO8IJcCJjygjblHW8RwGe
	 Gips/NN75Mrpvwt+3VRsOUfLXQ3/PXLZfSCZ4lH8vVzQfJU+BR1vbc7BZqKS2jGQ7yMQ6
	 zGJj/ZRcuEaIqBw3iWtdjYAV8xlAqnQhr5w1MjRYyVddYsS2XoAVAjmRl03S2U9zNaScn
	 cbU875uHaU/Whn3RELG45Iiun8542UFkbe77PzhPf3G4eXFHo3XJ460SWbyli4NKmEGIo
	 aoPi2kB3HXHvjByKP6Vf3T3Xw0F4YuLXFomki/rDx0BZKcfNMcxfkf/xKyKadG2V3Xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E60606B241
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E60606B241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JwUO2hvV
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1549126a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567775; cv=none;
        d=google.com; s=arc-20260327;
        b=S2ihJFBJzrfu0HMQm2Vhy6uww4cbuBJ5zT+j+v6Vh8Udnmgl72aI4d9y3KUZyAZBFv
         VrFg0CtKAAT02nKLyM0Ms8dcQtQ9Sx83y3H/0j9L+U0R/g0Z12kTy5mIUGtoxpVeiu8E
         tmTzZdMe3oSrpyxqJMbt/GqnAWViMCiRdCaB5BdFNBzxN7bcH3JR/9zDEtmJFc0LTkCU
         uulFWcbaa2Qzi3Bm1Gj9lNrf3OBCXubTbM9PAGjyz62K4cn5IaMCxIoO2R+IjdQI9M0E
         QccQHD/2VtIsup58SR22GryPa9kk2VE9afN8Q/m7cOfxwrYbtcTthALykkzM8N2m2Rwk
         wd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        fh=05TkSrVqDILYFWFix6ejdyZx9TaO+qcSaE8pedCpHno=;
        b=H1L9sE0CzxauXShFPlaQ8n2He0ZDLcgNtFCuw44SAaW4c40RHS8dofjKYLc1z/HY/B
         0sn7sXmsKNF0QZhAgihdpMH3g5JB61aXzn45GHMTuzRdRUQI7ht+ohbR7bt1VQpQ+Fo/
         AcfqQuoyn6FJo3wKTRC46ECBcEX6Yy1de8SP1tY6klKGin1OCsDcLQowsXkkgxwa0y+Y
         NF+ko/bnI3r7bYY0fKxFNQ0mEEeaC97gO+WYbc8y56TkcpVNF6EeIH0Yn0Mzv6Ez5tYN
         OhKk3BGnD2wYNm9RUrLlhZNCsRKPnAMcD/LAvyhiIKasfp/T8TMB6VvN9MQyGkeS/K/K
         ELxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567775; x=1795172575; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=JwUO2hvV/ppxAEDkH/xdfzNFsOCy2nUrg0ZFHAtKdpe5gps/G6RPPA9pKq4aXnNwly
         oZhmwpq0Z3TSi2r4/g1eyDRmUf3WQvjKa86mjB0TvIGOiRuPPhYk5/+RymLXdtEiTIS8
         JvVaSLafA6RqJmAQEKd0fDEeXldwwMvY1Em98dMSnjvSFnsUBfkDluLri3+1fuvzDjjL
         XW4z+VHppZGjccnha4auuROdpE2ZV91UQ64JVsjuUS1y4ELJ/ZKX5hkWFlllr0XG+/JY
         eEA1IcCu69ZJOzG7zBmGhpMqzl/UXCVWflfmtyvaRXbDhmk0hR2dQnoMjqg0uBKiJOV+
         SJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567775; x=1795172575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=CTjZJDr7Mic9Cb2O9NuSK781X4yParmz5pi3YjOAmNtesJzPB7L6UUQnWuX80yG4LL
         Yfdy/nuYswX3DyL3n7OxFP2nRWhKS5ZqXEUgB3dgGCxzPKlGrvIko7DaUbUZlEnhBQPb
         ypr4Q1ioYTb+Dvh7QvwQI+E/UmF7mVRdLie55gCysu0BjAaessBpFac0aJ9fdSE9TWvI
         ZgdF/vT3sXLAneibXkEejjUwTiCbWrJc06Q5kgmoFEQ8CZfmbMv0Rzl/YaDigIqTQ7Ip
         XctR01QU5H1MZybvettm94v9z4HLdty8llLKWyzYTzxsJ6lKJ7OiNBAtW1DtzWKppq/S
         X6QA==
X-Forwarded-Encrypted: i=1; AL+hErE6yr6u5Ckz0luYLC6c1ldeil/CxVh9iCus0e7ltqoy3HUt4VS6eotyKwjnKcuXxTVX9/+CzHfJhI5AryU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VDzYiuxChW/wV+OcQ22L2frUxlfWHsrLaKfsVXsBHbj0uK07f
	mubL2P9WU0MOhFPpHcMxdjmcg7neXUOrUi2bJ88ShMOdexGxFRQGWELJ91RG0KgCD8gAWmlPaWH
	AjoteJmSkg1nKIIlELo353/asV8/aR4x93iwuyk12Pw==
X-Gm-Gg: AYBFou3S7oo9sAU0/t9FVco3eHmu+x7Qg/qfZVnNqM5H5rhNDENkJ6BQQlxSiJo8O78
	b/H1DxrbgjrLWQ1yurmvk7xV2aVP8NnhfQSowq0KIAD8i9YG5V/1neM1btfP4oL9OVv6HRpAp5k
	JcPmfiAbAVomGIV7X+hX+QRDePX9erq92P1fmDBl25aAhZl+NOQRq/fKWeQdIfkuvwyuHJFRpEJ
	iTKeHGB/7DMwzcPr+UaXRozWsqNhEswmBsOwlbgLobLdvPvIcDQFuy/OC4nWXgi0vRia4z4HiAU
	cQhu/pucTd2LPaWxfzV4dFi9ROo8SHQxNMfWMvHcRGBN/TJg0r0fhRecHCnulZk85KVdfQ5nYqS
	phLoWND23+qyz/HPGDlntHPSx1UAyw2ygBCoQMB1Ubkb780ld2yEuv7TIVY35hEYaG3G6hw==
X-Received: by 2002:a05:6402:13d1:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6b7c0c7fbb1mr1715682a12.36.1794567774860; Fri, 13 Nov 2026
 03:02:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:02:43 +0000
X-Gm-Features: AclHuK-cUPGFMqYQ4aV0p1o7MZtl5WXavbyl1lomUd6smnM_F6LSvDHUWLAhm10
Message-ID: <CADrjBPq0nD1ENZySUVZvG8gWGpYrf1464MMau9VswjfosHU6Wg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_HSI
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 53fc8040e173..21928235d131 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -28,6 +28,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,exynos8855-cmu-hsi
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> @@ -52,6 +53,26 @@ properties:
>        Phandle to system registers interface.
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-hsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_HSI NOC clock (from CMU_TOP)
> +            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: ufs_embd
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 5d8b38a744b5..67cd97d8fab8 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -214,4 +214,12 @@
>  #define CLK_GOUT_WDT0_PERIS                8
>  #define CLK_GOUT_WDT1_PERIS                9
>
> +/* CMU_HSI */
> +#define CLK_MOUT_HSI_NOC_USER              1
> +#define CLK_MOUT_HSI_UFS_EMBD_USER         2
> +#define CLK_GOUT_CMU_HSI                   3
> +#define CLK_GOUT_SYSREG_HSI                4
> +#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
> +#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>
