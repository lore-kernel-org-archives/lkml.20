Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658800;
	b=tLkw/oxd+Ph9wAkC2Wdkay0shoB6D2LIFNqeOTTqvhPRiGzfYRSLfRPxDgwaR/zygVJU
	 DUn3l+iI9jCZWDUi7E/hd3tA34avmzJ543bYpnJa9KZernjBOrWWrukSRvo3fzFq4qwwn
	 QjHkTC507iRuM04j/BWQNrKZie5RyiRqWCeMI1+6QKMs/rTkx3tXLWBVxWVc8wq+psjTZ
	 YahDfLKgQOoV3Yc+HPYXb4HPyf7vTfFyEZI6QpZ27dVkKFzJoPhhc8IOsOOwB7uQ1/kS6
	 dSdTS0gqNMqomWBQWlfMd9Mc+1ceDkBJEPW78CKeOiO/00sQp/RzxZhjqmHj4PoJBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658800;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FIGvM0UwaN65BT0wYtQVF41feUQgPkRPdEQ92h4m6lY=;
	b=jKubK3KO9kxSeSRMzrxkwjkeUVQfuaD6fQnaXJEUQor/dLA6fUQqE2+nCD1SAqfEgt74
	 8B/R81TthS3+YxdQiljZnvEXjc42ZLIepNv8eVoaoRX8qzyGoUIcUVoHEdszlZ1K6Q4GQ
	 dMrTc4zscY9a8M8KJ3eAj0eXCddkfnb2BzAlTKRHdGKb+V4NbL0HGyxtfW7s6egv8Q1FV
	 rCAC9icaZHgsuCLEMkthrE8AxNU1+pt3H7s5Qb5GFYHORcvhAjwLYEJlPSqXMXV9Zt7xm
	 oRR1V54bv5WYvg3R3iCowXYfu6OI2EhAM8HSi/Oswd8i8qppCv6Nq3ECRwjtDZQ7toQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="v3q9/L+c";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0675606A324;
	Mon,  2 Nov 2026 22:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0675606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=v3q9/L+c
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08EA3BA;
	Mon,  2 Nov 2026 23:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793658661;
	bh=hcOlHliRKSdaB8pM8GXWnVePw0nVINC3lhEapMNXOvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v3q9/L+cC8F0c3oTmnGliaiHDPtz2BQT1fYsEcbxAsdmZOR17s672GVxURsXGBl94
	 I9rincg3HmxNrV6iBjPY+ByDA83AkZfde3bZ5ZkFC1xzsMbFc/qDPR768YbNspTYwT
	 nXIMVYKF4JQQc/Gi9Qfn8axWqidohc3urfpgMbBA=
Date: Tue, 3 Nov 2026 00:33:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: iav@iav.lv
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Depend on PM
Message-ID: <20261102223316.GB3548113@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>

On Mon, Nov 02, 2026 at 05:49:46PM +0000, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> rkisp1_runtime_resume() enables the clocks and lets the interrupt
> handlers run. Without CONFIG_PM it is never called, so rkisp1_probe()
> reads RKISP1_CIF_VI_ID with the clocks disabled and every interrupt
> handler returns IRQ_NONE.
> 
> ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,

Why do we need this patch then ?

> and no arm32 i.MX has this
> ISP, so only COMPILE_TEST builds lose the driver. rkcif already depends
> on PM.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Split out of the rkvdec CONFIG_PM discussion, as Nicolas asked [1].
> Without PM, olddefconfig on arm64 COMPILE_TEST now drops the driver;
> with PM it builds as before (W=1).
> 
> [1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com
> ---
>  drivers/media/platform/rockchip/rkisp1/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
> index f53eb1f3f3e7..c825fbacee96 100644
> --- a/drivers/media/platform/rockchip/rkisp1/Kconfig
> +++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
> @@ -4,6 +4,7 @@ config VIDEO_ROCKCHIP_ISP1
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV && OF
>  	depends on ARCH_ROCKCHIP || ARCH_MXC || COMPILE_TEST
> +	depends on PM
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
> 
> ---
> base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
> change-id: 20261102-rkisp1-depends-on-pm-219d94239b56

-- 
Regards,

Laurent Pinchart
