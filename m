Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096391;
	b=PhWG5NWJgpCV9tOruGdLZ+SjKtAQkfmebFzewr22v/pXwMUaMYHx9tPrpZ1Fnb2u70MF
	 SjJY2IT3wgVT+k6MTMvsmnHumPFjAMbXPQiVUidQ8JOynRmM4qt9gcbA5MXA7TKJmn+0c
	 H7VDp1R8XGpV8eG7Sdq4c9VRTYo/G/1dJO+6vJWRrJijqe4altmTj6jJxOWm4s5JblX8s
	 ooaHEWa71AZUi0pXlNwydrd/z11o7Ryk/nDIv0unlrTFjNJUpTuIHtF+itWmDZWrG2sYN
	 4FXQtEopf1lYpNdUKQ/ZeY1QDVeskpmxRZ/w2H+BkStiFNn4Ak5gw30Eg/2FR6O3Y0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096391;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KVDENRhZ025XcoAKLGS5FDsruTv4BkLF+xTlq5jI8Hg=;
	b=AiIjZiFgs62wS37aUYH7zelFlBjn4L//soFyAnNudgTmgjAWU1euhBT+gnvzjp4XJi5T
	 RRe/p8ReVVuObNKr6egpeoFYMzmXY6CnDbeI0NAKpjou3J8vJA0NiC1Kswwajcw8j8jgu
	 yIdCMAn1EIkUtCWYd6chDnrNegm24cABAoUCMoQ1gPYE9lTeEh1g+E3T5spkZ77JxfDed
	 srGoMMZJ3ytwtIQZi+jRrW5cd1Avdg43ENVOzI/iA/5DOI21C8fAXxu8qPoJP2irwKqdK
	 ClY/SAI8cMPralNKRlBBWqR2ZwL0uqziROw02bCaYKkFVONApKRYrYwX62eMxJ9EG3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ivZbEuOM;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CE606A31E;
	Tue, 27 Oct 2026 10:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ivZbEuOM
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B8C0BE;
	Tue, 27 Oct 2026 11:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793096256;
	bh=DQHDc2kx7a6p7GRRfJd9Pw8ZxQRkTNRUOQdiGqXQanI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivZbEuOMcXNA77N0GmNiZix/aGKMdEajwR/uxIwCkIN21MbNSe4wEGMGqGiD1C0nA
	 4HqwvYhTsjoDcs+NkYPgxx0M+lvu1BzCL/YU7IYoNKRWOccTdwEqwO33rcvZumLozO
	 UNn8G+MGXFSc9c1rKQZYqUdP81YVrobEVgHG3Ppk=
Date: Tue, 27 Oct 2026 12:19:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/1] Revert "media: =?utf-8?Q?D?=
 =?utf-8?Q?on't_hide_I=C2=B2C?= or SPI drivers by default"
Message-ID: <20261027101946.GA2106796@killaraus.ideasonboard.com>
References: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
 <20261027100916.4053512-1-sakari.ailus@linux.intel.com>
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
In-Reply-To: <20261027100916.4053512-1-sakari.ailus@linux.intel.com>

On Tue, Oct 27, 2026 at 12:09:16PM +0200, Sakari Ailus wrote:
> This reverts commit 3bf8c26a085c7b00dbec67a919b93fa8b7ad70e0.
> 
> In order to avoid exposing fairly rarely needed drivers to ordinary users,
> revert this patch. People needing these drivers will need to enable
> CONFIG_EXPERT until we have a better solution for this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This is a low-energy short term workaround that will give us time to
find a better solution.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig | 11 ++++++++++-
>  drivers/media/spi/Kconfig |  4 ++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7de2d095c969..11c30252540e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1042,12 +1042,14 @@ endmenu
>  # V4L2 I2C drivers that aren't related with Camera support
>  #
>  
> -comment "audio, video and radio I2C drivers"
> +comment "audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> +	depends on MEDIA_HIDE_ANCILLARY_SUBDRV
>  #
>  # Encoder / Decoder module configuration
>  #
>  
>  menu "Audio decoders, processors and mixers"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_CS3308
>  	tristate "Cirrus Logic CS3308 audio ADC"
> @@ -1210,6 +1212,7 @@ config VIDEO_WM8775
>  endmenu
>  
>  menu "RDS decoders"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_SAA6588
>  	tristate "SAA6588 Radio Chip RDS decoder support"
> @@ -1226,6 +1229,7 @@ config VIDEO_SAA6588
>  endmenu
>  
>  menu "Video decoders"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_ADV7180
>  	tristate "Analog Devices ADV7180 decoder"
> @@ -1585,6 +1589,7 @@ source "drivers/media/i2c/cx25840/Kconfig"
>  endmenu
>  
>  menu "Video encoders"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_ADV7170
>  	tristate "Analog Devices ADV7170 video encoder"
> @@ -1683,6 +1688,7 @@ config VIDEO_THS8200
>  endmenu
>  
>  menu "Video improvement chips"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_UPD64031A
>  	tristate "NEC Electronics uPD64031A Ghost Reduction"
> @@ -1711,6 +1717,7 @@ config VIDEO_UPD64083
>  endmenu
>  
>  menu "Audio/Video compression chips"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config VIDEO_SAA6752HS
>  	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
> @@ -1726,6 +1733,7 @@ config VIDEO_SAA6752HS
>  endmenu
>  
>  menu "SDR tuner chips"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  config SDR_MAX2175
>  	tristate "Maxim 2175 RF to Bits tuner"
> @@ -1742,6 +1750,7 @@ config SDR_MAX2175
>  endmenu
>  
>  menu "Miscellaneous helper chips"
> +	visible if !MEDIA_HIDE_ANCILLARY_SUBDRV
>  
>  source "drivers/media/i2c/cvs/Kconfig"
>  
> diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
> index da3e225d420d..4656afae5bb4 100644
> --- a/drivers/media/spi/Kconfig
> +++ b/drivers/media/spi/Kconfig
> @@ -1,11 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  if VIDEO_DEV && SPI
>  
> +comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
> +	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
> +
>  menu "Media SPI Adapters"
>  
>  config CXD2880_SPI_DRV
>  	tristate "Sony CXD2880 SPI support"
>  	depends on DVB_CORE && SPI
> +	default m if !MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Choose if you would like to have SPI interface support for Sony CXD2880.
>  
> 
> base-commit: f39567cc92272f987c056d8c92f7c93f3fdf53ef
> prerequisite-patch-id: a907c42a90ccc410e6fffdee8c9300233a5cd4be
> prerequisite-patch-id: 82ecd20999da94a7472cd1061a0fdf8cffbac325
> prerequisite-patch-id: 7d09c7afa4c3d4109642db3fd8435b21605854c6
> prerequisite-patch-id: f9e361e419752c2c3b2d845b535e33407c7544f6
> prerequisite-patch-id: 48a068cfdcbf7d53806dd8ff9e48f5de529fc67c
> prerequisite-patch-id: ba262f258d655a87b99432ebce1e579594a16950
> prerequisite-patch-id: 64c1f90be9a61ce4b6ee3988606ab0a24e630d42
> prerequisite-patch-id: 69ddc210ad98238341ef358dfddb0a42f20b9ea0

-- 
Regards,

Laurent Pinchart
