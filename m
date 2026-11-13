Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574794;
	b=ifEypE9uvEVwJPMhjqLrPI6mnXqwCfamSKv2FLYQWCselxZ9kWXl930yoAfPE5OUUOZa
	 wR5jTva7djmit3bSAd/83hH2pisJylw0Wlk+CivJNAevgAoKhUAhWVM1ofstl0UDrn7TI
	 YKKoXJyQJhbb6gm+0sL0L5w/OEXF2yhHwuLHM06JEwgrEo5lhhGZjlLDIDbbwGwprKHbM
	 8rnGwfaZOXNTSPk69yynsLvyh1GzctmjvYm6TC5ZsxwdEOxTScEERJ3xYymguVwPjDtJL
	 wzzafiLajuVLJB8c5ijbsHvi5WwwB8H1tFegTmQQLnhOvNCtfgjBF1Jvjm+omMUYwLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
	b=1aKEaf/0znFWhK61mmfF1G9eUx7mb0n/b43Q8UeD8N5T5/Cf8NE3tIV5KsD9oF3m70jx
	 TSQqq7KHd80VEarzeK+OI0tRQxxQbeHOXGZKh122noQZ3m3tlwz7wNEeNT3YBvUqU+S2+
	 d7fZdbS7HQzrV4jlXiB3e5JF3oxd1zgGn+LehPqwPlnemeD3vMsXB53OUS0srvZYuDMef
	 EaoBj5MCZExmXB1VzaGUUfFw4L3GxF9jBwbUfayE+TtpZgvUCwEUAPtwKJfui5/nc5ej3
	 En+dnNr15i795PITzaIAPTVGNt5chNOGOPU1o7BI+9xbiKNxDRmpXDPaMoGfapP0bLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E19606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E19606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50933bdf4bso242225066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574792; cv=none;
        d=google.com; s=arc-20260327;
        b=p176o+VgC6MhaXIcLAceybr1hrgPO9Lm0HYj1zAXi88X+k+O29Nji9J4YRz7j8kEtE
         jI532NTXeAqVT+jOZZ1ryvqn2aAY3/pfMuGmcZ/b/XpMbNyP4uLRGPJw6ptJ7smbo+BG
         3cCIbXyAcIkG3n41X8D0OfmK2R+cgKZvUrGwtN818PVaGAe+E+36Cio9rZ26NrvJdb6X
         6TYpM8oay0UUaZjtOdQNlcOWzIR518FtDNKyYNnpa6CDPoJVwnl8RAUeKZde6j2zOkvi
         itOhfud+xusjfDvTTHwi6KPrftzpWTby/kRUnModYgdndvYZDWyb81jEIv9PiCG1p5ws
         ZUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        fh=SSCrSZnovb9YLexxjom8shMRS/Cw3YPRx0jcwWe6aZs=;
        b=PnGtI/bRTPBRahyHVwSm7WRSMbOFINUlIr99BxtE1+rHAugwkk8faQovrMIZILkTue
         /JwndomtXUu2lW+fdsZPRPJ/wQOzOAII+8NWtrZyrSAyXOQn31wSV/4LiXfFJxBII7Wr
         d4g/8cU9d+J5AHPl9vtpZEA62cEcnz2zHk2IF8pRMf5Iz5DlBsbEX9d7x+lAVMLV4Ial
         +rtJkcszZAR3O8/Jof75gicvJe6BbTZtJthuzRVxdSAH3C6ZcD2KW4O9s+BiCSqGh/Ke
         AN76CMna6dkcilE2HZIh1bGvrUV9DvYEahroKAL9nR0CrSyrMPE52cNWK61u6XrXXpup
         8RqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574792; x=1795179592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=AkroMdRTCJEU56zCl5mRMi6rrvafd2Mh879g64RVhOfD34YxgOzOtrBsT8yx4NkQl8
         gSv1yRzVbhdBh7graboeUHyOjVxnWYWXqTxrq5bwqTXLdODgtOJ2GOfvja1i9wZBs4H9
         fcb9zmhVDOC+WUd7SGVWyfxFQP93w/xQqb2FnisylYb2rXsRhjc4CRnja+NBnS2rKhXF
         cLontnuKm89vJ8lgs810EU0/SMd4hbxtRDKKGG1T7m/yNzjT4qqUkxsmm7hHJo35Whfx
         tDrQsm7X93e0qnvrkO6hPhp7RxKzDVtK1uhz9g5bxTs3CjlOANpOM/WN/oFPwtcbJAz3
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574792; x=1795179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=ptSwQij8pIWCBHOQH93UOzAFSGNf8pkD2fRCvtjFANMKSy5rxarOmwY43BoIDRTMfk
         CGrmFfP76tBsU6tW4iwbKgMkixZKzBsWGmYilNtDgflTN3N6JaxmkFoT7qFPx/ELmcSU
         1Rz0vHWV+xgDv7sfh5sCDVU2oamagG+eUrGNNxLlEJhYtjSb7xkExeHiCZfAommym2Yc
         18IVwJUV50Nx3iVYqBFRnn/dCrgUyb2gm6Sbm1b6jCk7UhuoJ9c+c8ts7mx5OqWSrkgx
         6qW1GcAj9SGVya+OTDYP207cp3kTCTyd3UV89wZ/i4pIDIncQ1FWDDgWp+bY6RZJYr+D
         5Mqw==
X-Forwarded-Encrypted: i=1; AL+hErHCrC5qjZdXs4MCyi76SA7RWFMFCur1M0nYkFx3Jbjc4HIdBQOUXZQKTtefBxZmWxSv4JD6N1Xbbi8S9dM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zNZoA66igiIyF54dByJVeyVJhT+QusA36cgemOK5jJ4snnJfP
	Qiy4lwD5rypiggDf02zYbJHwkY8Ld+Y5MShHFs1SElFmUwEl7vAY8JmFKGMxOBssB5qa6heEaHk
	oIjOEgJXBBqW2hMs1C45aB7WJoGPfbiBrbOfEK7gjxQ==
X-Gm-Gg: AYBFou3k/iMd+2xEw1QY7U7RcchyIf5+TPz6GNWCtJRKMZQBeHmq6rc+jpMKXr5yt5w
	bevl8Czi+rX9ZBj4kYgFmztpazc0kI4ttnm7DhGL5n3eVYzLCK4N3v7UCkhkxrwZhILYPE3GfCr
	ArgS3SfXzfP+0f84dX6epnWcJ8w6zfGhULsdpPRlQfks4FUTIsrjhiREaTAfrLkvxQPImr/uKZh
	61oTSlJMg14l94al54Jp3VpjepwBjU9KHSMwf5luC97b3PS6YnWxDWx2oK9TZEunnzJ4gGswoa/
	L84ZqWEcrsmwuBUFR5S9vIBbuppV3fH10/f5P7kiepnKBudfmcRgSTHMIrX5uQnIWiUGbTC7Nmp
	bSiRoYrHV+fnLGUUjLB5HNFmI/jLW8NkmYXMDKz5dSuX1ioriJe5ks1q1d0IW8IjyO0nbirHJKy
	bQ+1lbDy5sdtTT8qU=
X-Received: by 2002:a17:907:3f9e:b0:c46:ca2b:84ab with SMTP id
 a640c23a62f3a-c507bca4549mr587358566b.13.1794574792499; Fri, 13 Nov 2026
 04:59:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-12-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-12-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:59:40 +0000
X-Gm-Features: AclHuK9cm82mhKCf1OM8U8MOAQmGsMU4pcM69WzWfUaEMzCzm0cQud7ofsYoc9E
Message-ID: <CADrjBPpf_-pnzQRYrpqpzWUewgF_U5EbOA1CJprnH1XzQoDuLg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14 RESEND] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
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
> Add required dt node for cmu_top & cmu_peric block.
> This also add sysreg_peric node. sysreg_peric contains
> DRCG and MEMCLK SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 0333b80eba84..2e5dc79d66bc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -10,6 +10,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/samsung,exynos8855.h>
>
>  / {
>         compatible = "samsung,exynos8855";
> @@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_top: clock-controller@13900000 {
> +                       compatible = "samsung,exynos8855-cmu-top";
> +                       reg = <0x13900000 0x10000>;
> +                       #clock-cells = <1>;
> +                       clocks = <&oscclk>;
> +                       clock-names = "oscclk";
> +               };
> +
>                 pinctrl_usi: pinctrl@15030000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15030000 0x1000>;
>                         interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_peric: clock-controller@15400000 {
> +                       compatible = "samsung,exynos8855-cmu-peric";
> +                       reg = <0x15400000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "mmc_card",
> +                                     "ip";
> +                       samsung,sysreg = <&sysreg_peric>;
> +               };
> +
> +               sysreg_peric: syscon@15420000 {
> +                       compatible = "samsung,exynos8855-peric-sysreg",
> +                                     "syscon";
> +                       reg = <0x15420000 0x10000>;
> +                       clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
> +               };
> +
>                 pinctrl_peric: pinctrl@15440000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15440000 0x1000>;
> --
> 2.34.1
>
