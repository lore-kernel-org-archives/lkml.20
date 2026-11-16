Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827411;
	b=LUUaXT1y8paGBLIt/AWofxQs4hjJw/C2L42FffP0iqazOJwer4n239wuOJM/SW0q8Dkf
	 LTNnPgXxtCz8JEBoiqs3YEKH6/4aU3N1NQu+Ec/+PejZocFUGb3PXwCNLwE9GkxPJOUBJ
	 Yr02l0QSp3/cXRcIZ6K25qDkzAgwtfBivEOoz9XWgNz0HeuoTeyJXH/+10AtFO45kyDPP
	 odBEbr22CIHv3StU5fqDbMjl4hJ1WuUR7sEkk/UXSQf6rFiTmBg6rCvg6cpw2bn2nx5Sb
	 utEbKJqIw5HwZhDbXGVtITViJ/A49Ch02XT78h5p0gm7POFRWi13byWqA3dmAIs0ikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827411;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RVmCKf70eEEgds5H1uF6AGyws+PKbUsScOYwDZol0jI=;
	b=eOxfz8WggR/pE7wgLNV0SNvUU4bJPg9by+SF8YXnZ7Ml3qCK4ivwWVNEH8E/txcgk8Mt
	 0sbRBEG0MDwtrnY3RymR496Jhorrr0UvT3VMYDbMfCEjmbVqnPVjP2igR5XxpItWFr5n+
	 SIihqpSnkQ3ukqR/nAxCqTQcfW5tM2Gnv5VjKNG9J3cRp6OGKmN3/cKMUx+YGUHmG6uhU
	 Wf76ffURDJs30Ukawke+JvIUqiEdvB/7/Q8goG8MnwHllJ3wJV6xHJgBhrdiKFzvLolil
	 srVaHhczVHM7NRAHbfJsygYmAsouDUhGBGyKpDhY/RASw4obDnbC6QOuAzyx2WjtXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2a8x4Ij;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BD6080643;
	Mon, 16 Nov 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2a8x4Ij
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FA51F000C7;
	Mon, 16 Nov 2026 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827411;
	bh=RVmCKf70eEEgds5H1uF6AGyws+PKbUsScOYwDZol0jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2a8x4IjQXkhMC1xZWG1AVMGBMTEmD20nU3hCnUhvZ2vMo4uVoX+r+vCY/Vqi1aM0
	 a1IoeIh1W9cjCBm0tODJqaQmQjhGGoDNvz69Nsgl2n/uILPoLklFL5Tkz5iST4+LXh
	 6b65l6TgLBipCAdAxf9qfyD7N8V84W7lT8kW54Oyx64yxTHLqesRullrtGyFnHgjVR
	 yvsuzCCwjByMQwH53+E8LglmZAn4VUbpKSlYcOZsLXpcnivoAsGcOwGKZyZWvd9pwB
	 xbP6AN/7RPoakTYBSouOUtAeXNnz/4j4gmKYInuyV9Xof84ezPkJW8Gr23jhK8Wu+3
	 s8ZTmOdqoe4hQ==
Date: Mon, 16 Nov 2026 12:10:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yanli Yang <yanli.yang@bedmex.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhirun Liu <zhirunliu@aicsemi.com>, 
	Dijia Xu <dijiaxu@aicsemi.com>, Chunqiu Liu <chunqiuliu@aicsemi.com>, 
	Liheng Wei <liheng.wei@bedmex.com>
Subject: Re: [PATCH wireless-next v5 4/4] wifi: aic: Integrate the AIC8800
 SDIO driver
Message-ID: <20261116-pygmy-partridge-of-defense-e039a8@quoll>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380242.4.1693438763870948060@bedmex.com>
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
In-Reply-To: <179481380242.4.1693438763870948060@bedmex.com>

On Mon, Nov 16, 2026 at 03:23:22PM +0800, Yanli Yang wrote:
> From: Zhirun Liu <zhirunliu@aicsemi.com>
> 
> Connect the AIC vendor directory to the wireless Kconfig and Makefile
> so the complete AIC8800D80 and AIC8800D80N FullMAC driver can be selected.
> 
> Add the driver maintainers, reviewers and linux-wireless mailing list to
> MAINTAINERS. Keep the parent build integration last so that intermediate
> patches do not expose an incomplete driver configuration.
> 
> Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
> Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
> Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
> ---
>  MAINTAINERS                   | 10 ++++++++++
>  drivers/net/wireless/Kconfig  |  1 +
>  drivers/net/wireless/Makefile |  1 +
>  3 files changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7336600952c8..4e327fd62b26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -746,6 +746,16 @@ L:	linux-scsi@vger.kernel.org
>  S:	Maintained
>  F:	drivers/scsi/aic7xxx/
>  
> +AIC8800 WIRELESS DRIVER
> +M:	Zhirun Liu <zhirunliu@aicsemi.com>
> +M:	Dijia Xu <dijiaxu@aicsemi.com>
> +M:	Chunqiu Liu <chunqiuliu@aicsemi.com>
> +R:	Liheng Wei <liheng.wei@bedmex.com>
> +R:	Yanli Yang <yanli.yang@bedmex.com>

So all these five people will be providing reviews, right? Just don't
add random managers names?

> +L:	linux-wireless@vger.kernel.org
> +S:	Maintained
> +F:	drivers/net/wireless/aic/

Bindings as well

> +
>  AIMSLAB FM RADIO RECEIVER DRIVER
>  M:	Hans Verkuil <hverkuil@kernel.org>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfig
> index f4f969fdbc02..964e633898ca 100644
> --- a/drivers/net/wireless/Kconfig
> +++ b/drivers/net/wireless/Kconfig
> @@ -19,6 +19,7 @@ menuconfig WLAN
>  if WLAN
>  
>  source "drivers/net/wireless/admtek/Kconfig"
> +source "drivers/net/wireless/aic/Kconfig"
>  source "drivers/net/wireless/ath/Kconfig"
>  source "drivers/net/wireless/atmel/Kconfig"
>  source "drivers/net/wireless/broadcom/Kconfig"
> diff --git a/drivers/net/wireless/Makefile b/drivers/net/wireless/Makefile
> index fa3100ff3bf7..47b999e8014c 100644
> --- a/drivers/net/wireless/Makefile
> +++ b/drivers/net/wireless/Makefile
> @@ -4,6 +4,7 @@
>  #
>  
>  obj-$(CONFIG_WLAN_VENDOR_ADMTEK) += admtek/
> +obj-$(CONFIG_WLAN_VENDOR_AIC) += aic/

Why this cannot be previous patch? Why Makefile entry has to be a
separate commit?

>  obj-$(CONFIG_WLAN_VENDOR_ATH) += ath/
>  obj-$(CONFIG_WLAN_VENDOR_ATMEL) += atmel/
>  obj-$(CONFIG_WLAN_VENDOR_BROADCOM) += broadcom/
