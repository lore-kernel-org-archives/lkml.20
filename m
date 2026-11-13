Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567827;
	b=KJnRztFWYBIH5gVbmwxSp+rsQwmX2YrLIqJPcqR/A7uTpLbNmAMIh3TGxxTyr2WFP21c
	 4Ked1z32XIGqGX39mIcoW8972WAEpOE9dKm3cYmP9w5NGj6Cbi9YXgo/+JIGUnVLncV3Y
	 BZVAr/KrVmEUbA37usNZEiqthqjlBpKOoauUn13ujoJD04JA0znTqrOFZnJoeAMErWhOs
	 O1+4ke17x2CjYjRA8G/orC+gCX4NUbpS+xfSq6tP3qx/O9ayUwWppw/NNcKSJuQD9nMDC
	 BEWKuLuK1pXebZPOtwu6LJG/urpnVaImmkpoKF29eVy1PfsojrVEM//6Lm4nu8ojykQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
	b=5b+emmqZ0eL/WjlzYfDln7sGWtHXmGXoXDFK/FayA8VxVYV0Q5R6yPaLTg6w2iwLH/O2
	 5Wrg89NO/eX55nbwSTU2/93WlnU9s4F2VFnvLs1Nx8/ELxQX7+swCU+VBHDHYkCXvtf8I
	 RPgHizJRy0etInf1pO2KnVG5Cr/Uwz4n0RfQb1ySjCGqbExMykPCJYmCYLlOBLaj4Emyr
	 XJp96vjswwDu6whYMJ9C1ylD+mhj8Gh+Y9a0fzuIBSaNyQmGO/HqhN+9++w7VQDzW4XGX
	 wKRPA+vP5wezVf5NPueBV4dTcNXkrC68KxuL8K48EpYlefoLEWzAlqFy40U56Mjr/CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0EA606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0EA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uO1PZR9z
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1546820a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567825; cv=none;
        d=google.com; s=arc-20260327;
        b=rbO80WI0jUxnwqCO4CJUUOuRsf7w4Fo8dRnlqwC90kTjpSiZc4WOGLUw1lDROkPWX7
         eRIm2eCos9wuoegJ99nqPaakWF0qT5edRiqbiVSqqdgE4AYS8mBSf2fqSM7qE9B6Y5TV
         vAyIS+I4x33fCwEnF8jzxTPS/d7nwRohp6Ryk4goSpt97M/hR37ZP8OwHQEDea2dSRF+
         sFu37XBrL2IsHhyo/mp0cYpKaD+NSdO4mZb67HksXBNanBFkSkCAAJ4BtIH3MfeMPug+
         K0Nd/gkWSCA7aHqED51UcJuM4NWd6KMDSPTb4r13/KPr4cP/v8w5Jv3p056FnWMlwTO0
         ax8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        fh=gPvnV09FQvTHJGUSVeDuLasyKxbuZLnq1mDjrsoKY74=;
        b=lWZ/FzL7xVhhFXVe113Z6qNWpusU3mPvgdTQ+LwQgGG32JfIGaq2fYvXrT93zwySv6
         BxFupfVkEf5cL2KxR0HFkHwREMfZNg4aqUdmVpx27hMAa9nfu/pbtpryqLzbpjfuBNzU
         lsy1HbQ887TjvedH0qU/vMD38tfAzNCxgWHdrwhpnTADAoXv5V3Xn7SaUI0ERpVRc30c
         fFP3MMyS7RmtRVxFdJ/ABjH572XtfI3Ci35dtQ33185u9wdyeEXNdKMHlAhzp3RHg1gu
         +Dq0k2X2dSne7lfpDownPfg8RLhECWYo2keRIvIB9D+FLTv/DUXxCr6kIOxMq4YLP1vH
         4Y6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567825; x=1795172625; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=uO1PZR9z6dSSdZdruiUCP+ylb+AYRNL3Bg9MtPyNPpe8quBN5+x0kSfhdc6XsXvP2l
         1EWqQ7J0agbDYHQH0axqwgMEmrDrhg1Oc3m0uRsq4mARWFpqfAlD8wPuiR+2zD/3uQAc
         qgBCiukndMVmJs/IVJpM4hd8qCyxWsLVVoqfyR4MHzajp1b/LSldKdhNuz5xTQf6BwtW
         G7ZtYItfHSpGNE6iBtAws9xro9RsQwnAsuAKn7ImZtuJ2ZhVdKtgkjXPgc1xO9XBrdh1
         DQ+AxJpHhiSmL+tPFg8JVylQURvnnB2fa73o0q3biC5HUIGOevOCFFQGY0cLG1WYTKPB
         RWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567825; x=1795172625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WrGUC4aP2CzOib9bfxPwXz4WnawgPNUWDRuOBMHlbso=;
        b=Kyzfz1oLYmbFrq/kUZ7SRKO3GFQebkwFqGHZ2tQjlcL1PE/pHoVVPS0ZAVyz7dgJy9
         hJT6qQKeuZxvdHI8oaX61bF/xCHKYbe3tuyu1pQthQjlH0L6mFUqMWw7GOc6qoY0ioGg
         qKLAn9GqAW21AzpAOGI8aRwc2OZ1vjlJ4Bcomsz9HsP+zw8Iig9x+Cz2n42EnVV7ZJy+
         LFh4+tUdH7CAxJA7EhMM0QQRntwZlmBjG5+GOu/DIDffKrNeqgScJ6HJbWmUFGe2bGBz
         tArO81k6TuRfZxOCYSOpESr3lY0k4pG1+HKwByjTs4xqEHHZjTCMJYUJOxsZN9XNljwI
         k5JA==
X-Forwarded-Encrypted: i=1; AL+hErGwzLUcbEkrWPt5f6RFJcoUa3eIDxm6IBLXr+CPXgsUPqkHhVe0LqZrCdbQ7a4wpX2owr7cX/U3GSAPbOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AShp4SzFRYtxEOq8YLBl8ok5ZRJ5bqGsYXOFvVAyy6DFeULK9
	c7lMaJYqfJ+C78X2trwerzKP0nyv4XmXc3mr4MR1TWEd+KPUgrFXfhP1b6q+izwVI+Ccv8EC/3w
	mMcSWntjO8VbhpebcbzeiBvIUSJosYf0F9WH733L08Q==
X-Gm-Gg: AYBFou0sRU7TIEruvFMVjxH/eTH7ScXzoOL1QUMotGigldngZpp9G/Pp2qyqfFKfdXn
	t1VaPd6uNaMZkUuDUtXSvWqzD5mtQHRSEqU9iFExYcRDXaHhaS5Cb/30G1UTgzjhRi2Vox7hodT
	FrNFGekJoLpXsferviEjEG+ZtN53e+nHtkZw7Q7DkugMOlmcJBG1EXctdclduS+wwJBJ+VERO6h
	cLjuX+eVdw42vWRRDyXNPfJwtcC5h2FqP6PeetUEKyP+TbGvr8jyW+xAf9vhkyTJV2hZd0Yfshg
	tqfdOwym3UuuECMvb+zsA7a3uVILuUVf/l6EbiRg1vWZw3AoXIyGiJ8Q2u9DUrpt15nwrmtThis
	X/w8WAcOtMiHb7jmi+quUo0394k8KKAh3U/bMJBd/guFGsCy7slIoZx0o6aiNVe2SFut3qA==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr1814259a12.3.1794567825002; Fri, 13 Nov 2026
 03:03:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104844epcas5p4c1cb0c31de8b5b445f7f0060f81cf753@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <927327686.61794567483016.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:03:32 +0000
X-Gm-Features: AclHuK-nQAzdHNmzELAlgOYeQ9PIbGnRzQK2xJ_UxA7DGsqbyIcTqa_Es6uaAxk
Message-ID: <CADrjBPpUSot+jCUBKb4S4A8C5HazvqQbB-+wDvjJtjB5XGCytw@mail.gmail.com>
Subject: Re: [PATCH v3 05/14 RESEND] dt-bindings: clock: exynos8855: add usb
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
> Add device tree clock binding definitions for CMU_USB
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
> index 21928235d131..c68a64eb35c5 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -32,6 +32,7 @@ properties:
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> +      - samsung,exynos8855-cmu-usb
>
>    clocks:
>      minItems: 1
> @@ -143,6 +144,26 @@ allOf:
>        required:
>          - samsung,sysreg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-usb
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_USB NOC clock (from CMU_TOP)
> +            - description: CMU_USB USB20DRD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd
> +
>  required:
>    - compatible
>    - "#clock-cells"
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 67cd97d8fab8..f4261956ab4a 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -222,4 +222,12 @@
>  #define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
>  #define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
>
> +/* CMU_USB */
> +#define CLK_MOUT_USB_NOC_USER              1
> +#define CLK_MOUT_USB_USB20DRD              2
> +#define CLK_MOUT_USB_USB20DRD_USER         3
> +#define CLK_DOUT_USB_NOC_DIV3              4
> +#define CLK_GOUT_CMU_USB                   5
> +#define CLK_GOUT_SYSREG_USB                6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>
