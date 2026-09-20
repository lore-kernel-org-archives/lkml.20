Received: from mail-vs2-f20.google.com (mail-vs2-f20.google.com [74.125.227.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE4223C368
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912450; cv=none; b=YpLPzCeVYFCuK9V6UDSUOk9XD+cFzSBVdsosIwuVvyD+XBTLro1zzpfWPbFA49Z2q/nv8v++SG34+QenDFR9B9mjJDDrp941lhEfRI8/LbEzAOL48VJgY6x1xffJaOaFRJZ2O485Y52pRYfZadV32drmxHnqdo9nRH3zawMox0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912450; c=relaxed/simple;
	bh=bKwYVkrmDfOiCn0RbUwR1jM7zZCEOlXsuam3M+gE/Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qexTmbeedpKb45Pw4W3H79TgajDd2GgRZVOp6gWKXJ30x5Q6lMinCYYO7SdwbJGd16QkuYRG9GPYZBt6nNJho7aozH58fclB6KfTy4XAlI2apGLX76F4+IZ01roTDWTm+x3Dtk4208NzfI2Kj7tz0UjfpNg2zkEK3+gcqMJwhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn3CBsFt; arc=none smtp.client-ip=74.125.227.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn3CBsFt"
Received: by mail-vs2-f20.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so735097e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912447; x=1790517247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQuT88WnETujv7Cx8XXl2BU6f/YuGMS2DDmfJOe+QIQ=;
        b=Vn3CBsFtwXGndUssp0jfqEwk+SsLO/BDcIRbeIkro413cMKtuCsXlxHI01xzSOqgVw
         hoRQKRUCuQM6Fc6FqNFxI70mVUXDchIzLhyVhRJdazfZgOhnBz3vZZgvnfh7dPyXeyw7
         FX3SrPUB234NqGnAabcncd1sZPlq9ziTNCpCXtE9sc1JBKo6CF84WeA+ueBz638vQpck
         xKKBoZqAODiAsIML8QCfOF7/pYxRaOFbaAh9TghoOFQAc5We0ncnLPPa9SmuvgnNuW8m
         r0ZKUNXV45AUUEeAjCrmfZhOa8nVUwm2v99DciIElU3v8aufVPSFEf/F5M0gGv+eIl7y
         8q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912447; x=1790517247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQuT88WnETujv7Cx8XXl2BU6f/YuGMS2DDmfJOe+QIQ=;
        b=kI0vjNs5p0QDbhJw6eazYheXE/pri2Y6rbStVdBNb3Gu3OUrkgBju/XnDi3pca3Ggd
         e+ez89N+kaTwwzBDhprS7exTV66ttA0n4XANAsjdKS5uzHTGF+W7FbbZyspdzfKgxofZ
         5677qoPbToJrLTJj3HuFk39vTaWBMOOsmrNjxyAWPZyyW/L8KenEzV16oHv1LgPO9zbM
         jxNBAnRarzMekhc7owTo97ku+5GQUTJgLJazZwbIfgLOb0bLwJ9DuqKRYLXrm58UfvPA
         vxLp6X3yfvOiC36ElayLg6cyncmZ6Vgr+nongS/3XudW5UWetENQKdOA3dfsL9SMRsnJ
         Q4JQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5Si2lt+ocm4HZKFGK+ODm7Y9UeXIZZDwo2m8GdWCCIQ77Z/IzGpC8lusR26beP2StFlcEFTlo6NyCViM=@vger.kernel.org
X-Gm-Message-State: AFuF++kixPKBuK2uRDrudY8TLlKVlchlj8V7rmGLkzXgolcrL/cQrHF9
	RWHnXxUPP6+aAzSNi35/LHTMn8sOHoQey5kJNzLqEcec5lxP1AHXDtus
X-Gm-Gg: AYBFou1fwJPmfgzg12jQP1ljaM0UwKsImlBCV0Zx0nziMjEMdmzvCRtEzD9oyFZ7G/w
	OLkdlyTgBxGlaJU7Q7WOkytA/7n8l1/HDg4fIwe7pepTNMdSRlGxEeS2Sx5zOhVM6en9GKYcZRe
	+YPilfrtCXfS8s9AhwbZ9gRT+peq3ZMy3qiVlC7b+uBRQeXl6aNDzC6HyQCCRPUqD84SYqle/C9
	zbKKUvZp9t+x9oXQSQhMyItFVe+CaPHk1qgxL9qf7/VKuSEE2VFVgqwozj2v/bA9RtMHWqy1zqL
	MSVHkpDUZT2/RQndEZHUaO501MFW+VHUlK6uA/3kYDEtxOqYkEe669l8Wa1TuFQsd9AzhbPP1Ax
	RUbcv1XlxBZGBHtsbsrfcHpaE9Uxu2sVLQF9F41ufAZoj+BMiEWW2S84/kOE0hrdMzf7Sd/nvJI
	bl0S1c3U/gmFAP7Dg7JQJXmYSwryRNAr3swcFJSPPeMUeSjxivEx0JjSscpO/onll9ce+DRbb01
	sbV9Q==
X-Received: by 2002:a05:6122:3488:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c9b5885d0dmr3654103e0c.1.1789912447448;
        Sun, 20 Sep 2026 06:54:07 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c18d1314sm4604485e0c.3.2026.09.20.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:54:06 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:55:14 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] iio: imu: inv_icm42607: Simplify IIO channel
 macros
Message-ID: <aq_lwtGT8G-BTLM2@debian-BULLSEYE-live-builder-AMD64>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-2-fd9373f123c9@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-inv_icm42370p-v4-2-fd9373f123c9@axis.com>

On 09/17, Kanak Shilledar wrote:
> The INV_ICM42607_ACCEL_CHAN and INV_ICM42607_GYRO_CHAN macro had a third
> parameter of _ext_info, drop it and just point the .ext_info field to
> the respective inv_icm42607_*_ext_infos. This reduces the repetitive
> calling of inv_icm42607_*_ext_infos struct in the IIO channel spec
> struct and makes the code more easy to follow.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c | 23 ++++++++++-------------
>  drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c  | 23 ++++++++++-------------
>  2 files changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 0b3f035c2da0c..8f61bc9014526 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> @@ -17,7 +17,7 @@
>  #include "inv_icm42607.h"
>  #include "inv_icm42607_temp.h"
>  
> -#define INV_ICM42607_ACCEL_CHAN(_modifier, _index, _ext_info)			\
> +#define INV_ICM42607_ACCEL_CHAN(_modifier, _index)				\
>  {										\
>  	.type = IIO_ACCEL,							\
>  	.modified = 1,								\
> @@ -34,9 +34,14 @@
>  		.storagebits = 16,						\
>  		.endianness = IIO_BE,						\
>  	},									\
> -	.ext_info = _ext_info,							\
> +	.ext_info = inv_icm42607_accel_ext_infos,				\
>  }
>  
> +static const struct iio_chan_spec_ext_info inv_icm42607_accel_ext_infos[] = {
> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_ALL, inv_icm42607_get_mount_matrix),
> +	{ }
> +};
> +
Moving iio_chan_spec_ext_info declaration upwards looks like a spurious change.
If moving the declaration upwards is really needed, the commit message could
have a phrase or two explaining why.

>  enum inv_icm42607_accel_scan {
>  	INV_ICM42607_ACCEL_SCAN_X,
>  	INV_ICM42607_ACCEL_SCAN_Y,
> @@ -44,18 +49,10 @@ enum inv_icm42607_accel_scan {
>  	INV_ICM42607_ACCEL_SCAN_TEMP,
>  };
>  
> -static const struct iio_chan_spec_ext_info inv_icm42607_accel_ext_infos[] = {
> -	IIO_MOUNT_MATRIX(IIO_SHARED_BY_ALL, inv_icm42607_get_mount_matrix),
> -	{ }
> -};
> -
>  static const struct iio_chan_spec inv_icm42607_accel_channels[] = {
> -	INV_ICM42607_ACCEL_CHAN(IIO_MOD_X, INV_ICM42607_ACCEL_SCAN_X,
> -				inv_icm42607_accel_ext_infos),
> -	INV_ICM42607_ACCEL_CHAN(IIO_MOD_Y, INV_ICM42607_ACCEL_SCAN_Y,
> -				inv_icm42607_accel_ext_infos),
> -	INV_ICM42607_ACCEL_CHAN(IIO_MOD_Z, INV_ICM42607_ACCEL_SCAN_Z,
> -				inv_icm42607_accel_ext_infos),
> +	INV_ICM42607_ACCEL_CHAN(IIO_MOD_X, INV_ICM42607_ACCEL_SCAN_X),
> +	INV_ICM42607_ACCEL_CHAN(IIO_MOD_Y, INV_ICM42607_ACCEL_SCAN_Y),
> +	INV_ICM42607_ACCEL_CHAN(IIO_MOD_Z, INV_ICM42607_ACCEL_SCAN_Z),
>  	INV_ICM42607_TEMP_CHAN(INV_ICM42607_ACCEL_SCAN_TEMP),
>  };
>  
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
> index 5b4683c2dd1e4..8e8d36461e515 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
> @@ -17,7 +17,7 @@
>  #include "inv_icm42607.h"
>  #include "inv_icm42607_temp.h"
>  
> -#define INV_ICM42607_GYRO_CHAN(_modifier, _index, _ext_info)			\
> +#define INV_ICM42607_GYRO_CHAN(_modifier, _index)				\
>  {										\
>  	.type = IIO_ANGL_VEL,							\
>  	.modified = 1,								\
> @@ -34,9 +34,14 @@
>  		.storagebits = 16,						\
>  		.endianness = IIO_BE,						\
>  	},									\
> -	.ext_info = _ext_info,							\
> +	.ext_info = inv_icm42607_gyro_ext_infos,				\
>  }
>  
> +static const struct iio_chan_spec_ext_info inv_icm42607_gyro_ext_infos[] = {
> +	IIO_MOUNT_MATRIX(IIO_SHARED_BY_ALL, inv_icm42607_get_mount_matrix),
> +	{ }
> +};
> +
Same here, why moving inv_icm42607_gyro_ext_infos declarations up is necessary?

>  enum inv_icm42607_gyro_scan {
>  	INV_ICM42607_GYRO_SCAN_X,
>  	INV_ICM42607_GYRO_SCAN_Y,
> @@ -44,18 +49,10 @@ enum inv_icm42607_gyro_scan {
>  	INV_ICM42607_GYRO_SCAN_TEMP,
>  };
>  
> -static const struct iio_chan_spec_ext_info inv_icm42607_gyro_ext_infos[] = {
> -	IIO_MOUNT_MATRIX(IIO_SHARED_BY_ALL, inv_icm42607_get_mount_matrix),
> -	{ }
> -};
> -
>  static const struct iio_chan_spec inv_icm42607_gyro_channels[] = {
> -	INV_ICM42607_GYRO_CHAN(IIO_MOD_X, INV_ICM42607_GYRO_SCAN_X,
> -			       inv_icm42607_gyro_ext_infos),
> -	INV_ICM42607_GYRO_CHAN(IIO_MOD_Y, INV_ICM42607_GYRO_SCAN_Y,
> -			       inv_icm42607_gyro_ext_infos),
> -	INV_ICM42607_GYRO_CHAN(IIO_MOD_Z, INV_ICM42607_GYRO_SCAN_Z,
> -			       inv_icm42607_gyro_ext_infos),
> +	INV_ICM42607_GYRO_CHAN(IIO_MOD_X, INV_ICM42607_GYRO_SCAN_X),
> +	INV_ICM42607_GYRO_CHAN(IIO_MOD_Y, INV_ICM42607_GYRO_SCAN_Y),
> +	INV_ICM42607_GYRO_CHAN(IIO_MOD_Z, INV_ICM42607_GYRO_SCAN_Z),
>  	INV_ICM42607_TEMP_CHAN(INV_ICM42607_GYRO_SCAN_TEMP),
>  };
>  
> 
> -- 
> 2.43.0
> 
