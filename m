Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574856;
	b=bilR4n0kSuB6G/oVskDqxpIo++Pl27D019XCzc4CiuJA/qEX6bf/t4NZd4Y7t4Olb338
	 sOnTOJQEWS2VPmMfedx6G5hpQvYXSG4bfCJG7RKKqCLaFwE+w1jKTHe/zffI+EbmYNXvN
	 kdwQMYh1HSnz8kNvQN8MQtTG8HcD37P0h/PJEWiLrB05n7XKODu9kZ/fAc+OXUp27Djqz
	 pnqm9bieqDGReCncP6N6c9WxgbDD1drDf4kG67Pivyvor47W6HtPy1ufWEdKHYkxbTZbX
	 cKhERmZJDjraRkrD8kGhBaWLTpLP7HIcvyhb51ZI4UFNcWQPuPng+HhcBvLtPFx0+DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
	b=eJxPe0O9sJIEk1a0xxzYNpnb7tGbs7ctiaBBvEoBRTBjHrZSWXM529FPXehRoR+ry6Ig
	 /d4A3I34d8KzYqOxrL21emqj8WcP5nzihVC344SHkto6kJl7Le9RDx4Ct2qfrmDySEwNR
	 mG9HjWzJ9qhpruBicQNN7siz2psnzEFg9hw/YjcnRwYB3r27pvi6I+5F0BHu+3Lm8aI/3
	 D6LqZLivHls+PFTRdZ1LKW4Fci8iskdgjHehNRjwonhhBFGQz4rJnJIO15M6v/9deRx8S
	 4IH2St5zzk3bXSkemykRhHEUIA4DupsP8TVwgKw37kGYLMIYTcCH8Rw0LWA9DeNKHFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5E606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE5E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jnm00dpe
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1848608a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574854; cv=none;
        d=google.com; s=arc-20260327;
        b=YOJUpQbhSemNa6Ih0xcVZymAS75kaXZ471lMQYJxfIVYBglc0rOXPcb/u5+mbwoiYU
         ji1VoKpebmrca604suEvrp43M54yyaV5pTDvt2ziuQiSEZjbn77FK9m6lhGMX/K84zro
         sM2O1wdsvCojRFllmwg/X6A8981qxYBBimSNXxT1BNJ/PBv5HGP39SbfIXRCKAafQCAp
         kVelDdEWtT/Cf1ZDDRrpqyeoGvylwcikh19HgNGRm4rn8J9J5XE0rDfjG/at97AmLvcq
         sOcnr+LjS4oqx/QnW7g/L+G8BkWdzWqy1oFtCCdJTEOrztUIajqUL28ow+CHJaI7ILYo
         nbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        fh=sdZqIpEU5lSUd8HxGFQPb/3Pgb728iIaZdxEU/s+OQY=;
        b=NaN89ao3FC1xdaO68Jw1hi1IpKpmaTvH3m39LeolMMi3fQehVFnwypcCiALJD66VwF
         yjzbAVtIHfKZSPd8rI7K669lYURDU1To8CPaL55dHZU5OXCRQEEkniwmWCTEevwiRZHa
         ZD0slURo5bAW1lJlI/YpnLYRIZReww8WcX407GKBGxFwH33i8be9TfQywgoYXKly4iGr
         zXBb2wJ31Y4aNCo17KcrihtAHUpcX90NlN4Kby9AcG6H4PWuAZtqHYtodSYQ+G+TQZg8
         8/JznfvM/pg3+EDXI7tCyVtXy5yb4wyyCM8FRnY8DITYcl57Y/hdof91FEjptJwFTM/5
         3XTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574854; x=1795179654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=jnm00dpexQcSPfGZxQphnKBSd17bh5Upe1ySHaJZjd3SRylcfmGBl4dkJu33zlmYFS
         IK8hqMGUDl1UCPZ8ZrJ7+cPX+7adIw6uvi7+1wSF1E4uPoOASKQqKtMVltRdHOGxuoLJ
         HJBALf2AkIm/5Oc/99i93CWinzFErZvMrVFB0BPMBtf/hNO6A+9FDjSO6bCdzdapFF/1
         NbOfWZ0Vyez1mjQJ1sEMXA3/cp4OI8aKne4ycJkA00biNQ8w1FHmhwmQ6FK4ZHWkNKPh
         k1yv9/YvgPomizwtcLEFLtNVP650OM0e1LeUivUAFjAeZyDo+gcaD4K6as03xcz+n65y
         Yedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574854; x=1795179654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vHVRb+XQ9sS2KuwAx8Ypuf6s4A1tTt5ysFHn77oys1M=;
        b=LsW152dxibx9EjFShIBm1h8COsvzcNF8xDx1bK7rebJqe283klZDJAU6QWLRyD9EP3
         bjA4KB+kdncRX5GgISvFtVWoPK6aXfTRR7hmR1sSheCZoViIafooO0YUDh1mgWqZcPRn
         2xh6XUlmd82XaelUJFfgM58iqUsfE4OFviJ47JpWxFMMUIgHgvWEUCbnFOEp2yKlhLSG
         ECYsX+d2EGMnbEhfRqam6fdJpDxyy1Ti3D5edOBWF15NRDs4o0SHsNnbg0UBkCg8QX8f
         l1UZbArY2kro8xbzqKT0KrkgChdW6s5ys7xIbJx3iTiQSlMJNjo4N3LFawJRLkBUYyyD
         hbPg==
X-Forwarded-Encrypted: i=1; AL+hErHytm1qLiZl0BEf6nI6uud5eK7Ktj3+3hp1eaK1+Gy/XDufIwB/mM0DYy9kr8T//Yr+XPAoTPN3FXZxDRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y7NJkkZuEdPKSDRD5L9DWb2Ql86jmdrIPgytXySoOZcqmB+CH
	VmrZembsalhIvx+IX8uQkTSyv5+tEk2HpLzXvH/chZNN8lMC39GUBo42m9vgnTXfyyLYF9fdMzb
	lCF5aKopIidNsoYuKLAeE/nlbCdF91kuBFBu319afiw==
X-Gm-Gg: AYBFou08HMXyeMUhRNciYTOpzMgFHf9zP+GteekmeG2EOdDxu76MIuxXbvP/e7HQoZX
	2PHSMZHw2NllbitnhwL4m6OJuOGzEx5yO2SUqVRDqU5UFHgChlCKQW4jCFEkT3bm54jfBmQ+0HH
	dpbrfdD3OGYpGByAJFR8aEALAv7odNrPTLxB2R3OdtbW6MtIV5+DedSK+kea1jP5dhs+9Y/dx/F
	EPkvKLssvX3N/kAoLC5YuYuxUh/jxhlg02nqUYY4gBTy+CY0aK/ztI14ADUhYT/giszLOpDbJjN
	2WZt596TH1l0zickd/7i+zDgaNVnp2tiha2tGky8h+FXwzyxS7pgEwNe5oON1tcZ+hEb5VvU8as
	PgAqj3XI4zVy9yQGn/Q28UySWsSGMV6itR3gQXw/eIk77cJCRpgEQNWWM3hcnev6cK/fSjxATJa
	Mf/lWLB010S6lpaBM=
X-Received: by 2002:aa7:d1d0:0:b0:6b6:face:56ff with SMTP id
 4fb4d7f45d1cf-6b7c0c1cecdmr1756365a12.33.1794574853723; Fri, 13 Nov 2026
 05:00:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-13-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-13-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:00:42 +0000
X-Gm-Features: AclHuK-Gujxl0bdCqN1FIJbWWs5SjHt2ToZTIgj-Ln1Yz-sYA3apmJelY48JkxE
Message-ID: <CADrjBPoSV8uOqX2tkVyEdiZi7NEOJAb8JsxkvMqUn9+wF5Jc8w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris
 clock DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_peris block. Also add sysreg_peris node.
> sysreg_peris contains DRCG SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 2e5dc79d66bc..b461de6a7548 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -146,6 +146,27 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               sysreg_peris: syscon@10020000 {
> +                       compatible = "samsung,exynos8855-peris-sysreg",
> +                                     "syscon";
> +                       reg = <0x10020000 0x10000>;
> +                       clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
> +               };
> +
> +               cmu_peris: clock-controller@10030000 {
> +                       compatible = "samsung,exynos8855-cmu-peris";
> +                       reg = <0x10030000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
> +                       clock-names = "oscclk",
> +                                     "gic",
> +                                     "bus";
> +                       samsung,sysreg = <&sysreg_peris>;
> +               };
> +
>                 gic: interrupt-controller@10200000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> --
> 2.34.1
>
