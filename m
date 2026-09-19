Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1084A32
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828688; cv=none; b=r91NUesWzqiCsWpNISLLK/qoudH0uix/G8ySPHfC5zWaZST/NFrvCjHsqxSygQ40pb+aM4ft1m8EoVrnuHV6/a4YjsbAfy5Z35M+6FqorS76uKfzjxxQkXMZWZBu3YXa4tX5L0t6AyzOiCpI3+pkNmzONmy8Yr6Q2CjT4TiafhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828688; c=relaxed/simple;
	bh=jN7cGXxoMQjzEX0RXTwk0U4ay3bZcKDm1ac3jD1BmXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBcuOVV0pv0hbtZId9AYmFGEsFx9NYMP14FyujdpXYkwExgRe5Ceq7nJfz2tWbobRFh0k/eXix5iF/28EACM3bHUvM9Xof4LRRwk6rBtTA/hWXVF2Ik8+cqF+68g4TE7wAKU/vz8+5Sxfqx0Cf0mq6iqvlhJs4eDxFTIXhsPgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ng5KeHva; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ng5KeHva"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so816145f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789828684; x=1790433484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6/gGbCzk/OqjK8WB0tNPmKiq0+9IU4ZMakFuMZKwKY=;
        b=ng5KeHvaQ1EtqPyUavQ8HvwZxMDZp2RuzEPEcCeXTJlaQT6MaevSpe2C8lCPPWJOfC
         kOJkPyRxTPnn4ShO4aeA0Zou/87vj9CBkD3IIi6Z+zAQPpBvt+MGvK9oYct/2mMmxsH4
         Wh9WV4bfOIledRwXkOqAaVFmlHZBKYO7rbRZ9am70o9viOX26DyzZZVXw9rqylaxvUJV
         GH95qzFt2NmJLlauDlNpsjZE9hF82dk64t0A3uolQ1+y4Pk/rpxzB7SJ0Kmgi8+860qh
         Dsi9whh1ZWHitwtSNu+lF5R29LFyizjN+vaTq+alMTl9lWb5WdgVX3nwerx3sw0Bc4Oe
         W6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828684; x=1790433484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6/gGbCzk/OqjK8WB0tNPmKiq0+9IU4ZMakFuMZKwKY=;
        b=H6Oh1ZozwApBZHd13KmMee+X0LedZSLc8bo8NQ0p70D0oO/XRGY9GHWaKNV2wUZf8Y
         wTzRMZBPuSFBpB+FBfNn99UOL0ZJ98ySKgliwHjI+iTeJtx1PResNZcZFaiVL20nRVif
         OU5wORHpTRfN5QADTL6u/UaBqj4Jr8IK/3+XegX/AGt3fbT/8iJ3/hbPqHN4W5kNz/RS
         SErkW3J5dduAFurrGx9rLeEg24Ik8RnHBMRV/C+OG1oC5mj2MX90e4O5sy0M/a5XqN4M
         IHpHAYRQfJWmfjkPukXI0DpilkQt8HtGoDdmi5jplHrBq0w4DHEjK2N3xQJA7+udBDR8
         huiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgnscqjXIOtpxFblIAVRd8303JlVrhqx8/GFzbkx/uAdlVFeIt+ZLxaGwDaUJz0zoffehMPOmr212/Tx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mnLfleS3UMPOH/XVfd6ZN07e3Y4csFYBV06rZMyoCwJgglm7SF
	f2WFLzZoJPU7Q7GLVoSpNtsGS/EI+y5U36qn623KC33Qd/za9SprkrzQUgPij0WGk14=
X-Gm-Gg: AYBFou0Rx6N1y+WOBBj/wK4DvYbSqOFeGJAi/7mJcTQ03G95zFdkjvGLp/4qp9byngB
	+8Fmwu6yJvBJD3ZIuzz7tA/G+zeXXRc3//aHPpHwYRBLVDQHunJmMuK00Y8AQ/z+QDZ7VBDVEDo
	JefXbeouWnFH3q1bFRuoCi38aBVPtMiqaRUGtn3LognWn0IgazH6AfDduv2Wlw5omMtwQA0n18V
	astWo52hSdbuDMAvyETpCGYS0jMl4NKpyPiAFvroXCKpGxKM3//wivYo2v7SgyKiqcz6NKcLvNt
	F18R0ufSPCD7SM6Ckjdr9uSgAD5xCGMtKPDS5G+EDuKiN9Iy5HsLAwTC2wNI1LgPBIc2Y/69KR2
	Xi3VZyNosTx2bHvdZ/x9qdfKHiLFFudVEAKSKsy+xo9dSrHeD/SxKHiw4HKa6awxPKrMP79rL1g
	nWLATw5vfvtw0DU30oFHZdADkkK10D4ClAe0KUqrYTQA3bbZ9iodvCpgoYDFDiBi3tQLJ/g/DST
	vwI+hwQEkaxfQM9aSjkBYizy8o0GviFOz8I1cM3fqDrsuOZH0Xul+lZ
X-Received: by 2002:a05:6000:612:b0:487:8b9:66d6 with SMTP id ffacd0b85a97d-4871e26cd15mr8462557f8f.40.1789828684591;
        Sat, 19 Sep 2026 07:38:04 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872458f7e3sm7418006f8f.25.2026.09.19.07.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:38:03 -0700 (PDT)
Message-ID: <c55123de-f466-41c8-b50e-df28ecf3bc18@tuxon.dev>
Date: Sat, 19 Sep 2026 17:38:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: configs: sama5: enable current Microchip KSZ DSA
 symbols
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260814075310.11613-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260814075310.11613-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/14/26 10:53, Pengpeng Hou wrote:
> The Microchip KSZ DSA family now uses NET_DSA_MICROCHIP_KSZ_COMMON
> for the common provider and NET_DSA_MICROCHIP_KSZ_SPI for SPI-attached
> switches.
> 
> sama5_defconfig still enables the removed KSZ9477-specific symbols even
> though SAMA5 device trees contain KSZ SPI switch consumers. Replace the
> stale entries with the current provider symbols.
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Fixes: 07bca160469b ("net: dsa: microchip: common menuconfig for ksz series switch")
Fixes: 4658f2fe8fbc ("net: dsa: microchip: common ksz_spi_probe for ksz switches")

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> Changes since v1: https://lore.kernel.org/all/20260624081216.75559-1-pengpeng@iscas.ac.cn/
> - no source-code changes
> - rebase on the current SAMA5 defconfig
> - route the revision to the AT91 SoC maintainers
> - add the coding-assistant disclosure
> 
> The Kconfig/provider mapping was reviewed statically; no SAMA5 kernel build
> was performed.
> 
>   arch/arm/configs/sama5_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index bd7f0b5f7d66..46e7f554faa1 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -70,8 +70,8 @@ CONFIG_BLK_DEV_SD=y
>   # CONFIG_BLK_DEV_BSG is not set
>   # CONFIG_SCSI_LOWLEVEL is not set
>   CONFIG_NETDEVICES=y
> -CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
> -CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
> +CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=m
> +CONFIG_NET_DSA_MICROCHIP_KSZ_SPI=m
>   # CONFIG_NET_VENDOR_BROADCOM is not set
>   CONFIG_MACB=y
>   # CONFIG_NET_VENDOR_CIRRUS is not set

