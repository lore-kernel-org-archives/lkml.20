Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2E53A884
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869892; cv=none; b=Rl00vdPdFtQS616EYmXS9MgeNXnncArtrrqlsKYtiw/hhnRxdWpVrBq7ryf9EFm2KaKOyd32/gx5Iu0iIqwt1+m6f2cyp7vNZAAwjCmOC2ak+gRmd2fsBMAAHEDOyAbM7EzkxLRBZtOJpOdk4/AU7OwhWudjXZVv/Z2BAwCuqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869892; c=relaxed/simple;
	bh=RTKilPGKR/u0oGz3o82GUqPpw20OFeESu5T4jmRMD4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJci3DP2EwHjSY1PadfOcnBOx4ALemqtQv25R0CNk7k3Jmfu3JJ92NakYtgBXnhnttMPvRrbv+wRREV/KkQ+/Y4r3GqObtKHG/ufk8Kv5wBLmzRqCFBdA/K6xzuDPhMJwez2zDa47CZ7xGTLiFviQoF07Ie7XiJKDh+ncpY+9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0ISoZLo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0ISoZLo"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so3276810e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788869884; x=1789474684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NW6/rTE0SPCNPcO3PxE/nF5bbyVKnXeAwSYncVUIL58=;
        b=o0ISoZLoBNmENhYwyx2EgB1QlkWMyO1TbctkgN0pN76HnxqCgpVFY1vMgfSqb2KTzX
         RUNFev51EcpY+PGFEwdz921xHvzq8BM0eDVYqwVe6JesT7QI/VAevOWF0Ldr5AXP/X64
         69P11BGqhyt+xA7oJFRkwvX6FT+/z6SOE+PEkNwlxTWma66p6y3K3mE4EJzpFjLqxZul
         nONB2xM6dprWHbp3KXeBRjsKQTmcRmcq4TEs1vy852pDeXRuqCKekBEDYwAOebgS9/Sq
         0+uGu89zF+suvCTmrh2GYRqTw2GQAbR7k9PrlfHxytLDsymCdWDaaanI9ue5DhCZ+tD2
         XDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869884; x=1789474684;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NW6/rTE0SPCNPcO3PxE/nF5bbyVKnXeAwSYncVUIL58=;
        b=ZlPLTziFovqxPfE6eo/30MOCHGGWOBSb4y/J/r8OiXkKL9IpHAaQ4H5knVEAfoKFUD
         mKa9WuI8sos9kelKai7KMoTSs8xNxYp3fOrYNjsZjGNUI98ygibJqjjT7GTmLL4NszSo
         nPiGfzDjzzgQBO/BxtxqUmz1iXCr6yyYjKNA3mXF8p9E5MHAoFxXXl1dWz0M6iD0hmZN
         yKulMMZhrQAhxhbN49XB2jBf7yrXsK1d+cQGP0WrIX0R2RPKusPfji82Sp/ri2lwpxhs
         8V1pxEl7VESd4SOhRn0uK7lY+5f5kZ2RKm4mSYpJLFmY4MIJNdTBFYNWUhG4PqOE1LF9
         oAsA==
X-Forwarded-Encrypted: i=1; AKwUvBy6oZs8IY57qLFlDbmUKywH3uTFTT2fFl6BNb9wdQYNoCj7ncZUj7hlfcf3TrhCTrxM2TWrnSrnDNxrPpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nEqVU0DSAcSmC5AoRT/Ym1kvv20uHoCSi5sCz5cOxqwVlogOly
	lh+6MI6VGG1hpdhq295mJ07Tx/8lhsTZ15dvG6UscqWJff9RYbrzWk6v
X-Gm-Gg: AYBFou0rPQnhkmgvhXigYTCfC+Ambkzk5v7H8zCj6PoCJKkEhNJPJXtUtlt5lpqvhSd
	CktO4pCRKq5MY2Etw16VE0Cvqc2eB/9q0IasLEFKLdU6J9pQxwWSMp18/Ky/Dxs8aXnn46Ezz7B
	fWxHTT6JYiwBnQ6G6oRbnlt+EopFefC1Atg8vxVSzSPjuCaCB6nUZhjHaJIUo74ozlDJnRN3UIV
	szj04Zy5SOg2Io+uXIrooU1/fQaIoX7rNPhX7oXkVO9J0yy8iwW0jLapvi3wnYP4pGtduNjdXAn
	TNBmGeJVG4Sj6JoFQ1TO3401v3NF3UUMJRAGvjbLyplAlQWyEltZmh37iimX0APvGTWEskfaMtb
	7lYwSE95pZVsYPeY/0nficFxD9MYPAMf4NWnHLJYhvQaVWypXN/CXbw2m+7IoIEKSdvhxNs0trt
	xKIHLZ7w9eI8yse0dyjwRO4Aa18lj3QLrljnoxwmDURFvPTiANGbtruh9k9LtvTu2nBrvBR3d+z
	SO+Aem+AxPy
X-Received: by 2002:a05:6512:159c:b0:5ae:b91d:b2ec with SMTP id 2adb3069b0e04-5b616f01b60mr4175715e87.3.1788869883842;
        Tue, 08 Sep 2026 05:18:03 -0700 (PDT)
Received: from [10.127.126.147] ([5.195.0.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669abd4sm3104468e87.5.2026.09.08.05.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:18:02 -0700 (PDT)
Message-ID: <aaf8a5ef-2abe-4269-804e-4d2dd1bc4d3e@gmail.com>
Date: Tue, 8 Sep 2026 16:17:57 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
To: Xu Yang <xu.yang_2@oss.nxp.com>, vkoul@kernel.org,
 neil.armstrong@linaro.org, mani@kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
From: ivaylo <ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8.09.26 12:59, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> According to Synopsys eUSB2 PHY Databook, FSEL_48_MHZ_VAL should be 0x6
> for supported 48 MHz reference clock.

I don't see this as a justified change. Samsung's implementation of eUSB2
differs from the generic Synopsys interface, as is visible from the 
differences
between QCOM's implementation and Samsung's.

 From what I see for exynos2200, the FSEL value is 0x2 for both 24 MHz and
48 MHz. The differentiating part is that the upper PLL divider is 0x0 
for 24 MHz
and 0x1 for 48 MHz. The current programming was taken from the samsung
vendor kernel driver, which is a reliable-ish reference for the 
differences in register
interface implementation when we have no other public resource like a 
manual.

..now that I look into it though, the 11_8 value should probably be 
field_prep'd
instead of just directly passed as an argument of 
snps_eusb2_hsphy_write_mask(),
because right now it's essentially 0x1 & 0xf00 = 0? I haven't tested 
this path on
my hardware, so it might prove to be a regression in the future?
So:
snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1, 
EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
FIELD_PREP(EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK, config->div_11_8_val));

For this patch though, unless this change is tested on real hardware and 
backed up
by a technical reference manual for this particular implementation, 
CC-ing the
change to stable is unreasonable.

Best regards,
Ivaylo Ivanov

>
> Fixes: c4098f3e6134 ("phy: phy-snps-eusb2: add support for exynos2200")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/phy/phy-snps-eusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index af4fa17ac6cb..3cb18d6ebc1d 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -21,7 +21,7 @@
>   #define FSEL_20_MHZ_VAL			(0x1)
>   #define FSEL_24_MHZ_VAL			(0x2)
>   #define FSEL_26_MHZ_VAL			(0x3)
> -#define FSEL_48_MHZ_VAL			(0x2)
> +#define FSEL_48_MHZ_VAL			(0x6)
>   
>   #define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
>   #define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)

