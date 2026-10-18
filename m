Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240E2E54D1;
	Sun, 18 Oct 2026 00:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281617; cv=none; b=tXUgLpwfMmOQf5uMAMfEShWNB86pEkZCpYKNHD9ejHFjRx3G9QoVRQ6VARMwU72Y8JYG5nk1sYS8JFBVSUpaqfwGSWNuG77Zmxj0EB4j5DbaRB1gF7QWxUbbruPM+q9X01s7KFlskkvNM5AEE0T0dO7ELdXsuioiJFtPZNCEDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281617; c=relaxed/simple;
	bh=3m0PA06qi4jPv/nIfqTSlJvhiVR5zkEhCrhYQWXdc8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsnKmgTQuhwDkHsUBWuQAq0iHT7iir/Jz2bqQwierEWk9zftMTjNKDsU908qvZTePlXCT6Ro6LEHMC8TYZZf+IPlBcyffrFerTDcUXRmufJNPQctclc/jtEm0ge2OeMArisDat8WoqcvKaERO0Xp/Nzmvp92nM4inZuu09KSdZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3WxzISb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3WxzISb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6FD1F000C4;
	Sun, 18 Oct 2026 00:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792281615;
	bh=N6M32mEa33bKutMk3aL53Y6aX/BFdZJWD6dchSjXyWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3WxzISbgYjZww2ONxRhoaWVqEzv+aCcwbJi5fDjJMCUNcfgGuk9pg3MN93YIoPuI
	 lSAOcB0U5usa1+Hy6kcm63qMvSCww6U2uiKtzSXrGZOqRWn0G1fz7XZfbG04E6COQ9
	 G7MEI/9nlITb2vgYeMztu4m2kt5wa7ktY7ddz/WAzhyQ7dKoo330QsbBdZKEtdC0Cb
	 kqrGP0R0VXUBLo7aJdBGVujjBCLAwej/PEYD2kyD8ftFpjpBN83SP7/EC5/LyheKns
	 +Y51IJh5CrqJ29Jjkc55Jj2lRsAG4LKd/PQ3w//5wAyeBZzl+3sSh7+6BtG8E2pqRv
	 O8hF/5Mz3/V/w==
Date: Sun, 18 Oct 2026 00:00:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
Message-ID: <20261018000013-GKA112262@kernel.org>
References: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>

Hi Hung-Chun,

On 22:08 Sat 17 Oct     , Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
> 
> On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
> for the fan, the RCPU2 registers read:
> 
>   0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4
> 
> Only PWM2's register has its reset deasserted, which matches one
> register per PWM.
> 
Also match vendor's code, see
https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/drivers/reset/reset-spacemit-k1x.c#L317

> Use the matching register for each reset. No in-tree device tree uses
> the RCPU2 PWMs yet, so this has no effect on current boards, but it
> would break the first one that does.
> 
> Build-tested only (riscv defconfig, W=1); the fix could not be tested
> at runtime, as mainline has no RCPU2 PWM node to exercise it.
> 
> Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
> ---
>  drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

> diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
> index 8f3b5329e..dbd783c13 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k1.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k1.c
> @@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
>  };
>  
>  static const struct ccu_reset_data k1_rcpu2_resets[] = {
> -	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> -	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
>  	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
>  };
>  
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
