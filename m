Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40899233943
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160991; cv=none; b=EdOP0Kil/PE/PeF3FbeYq5IggJywrefRVKwKEjLGqSqs5H9OVqExujnhppSkKBgsylgkx1rQXSTW3Uc6vR7Z5wqqcII7179FMT5OeT9Ya3nkW00lt35tYN3rF15K9ebJV1GHBmcU6MWcSu6tzsCwHT8ClZCreHdxli6V8RwUUWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160991; c=relaxed/simple;
	bh=cJ8dfAUymUi5/b4KAsqaDEF0/Kqegqnkf0HQS5fuWYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQopLwBSclDrWwdLB5betPPOOoz7bSj1RJbOuY7m3kNk9M/X8OqaqdiGxjU4wadCjg/JB49RJnzvjdaZbUshB0WgIzPG7rsD398OpSBPuLfrdXYEnm47sFINZ8ORiuyTOV9Fz1o8KPVcS9wAEhEzcpN5+FUlPIEeQIoBHta6Uww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRyWkFYZ; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRyWkFYZ"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7c03744ef27so361193137.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791160989; x=1791765789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JnCZgK6LbunIjGmFBSscnbMfeG5EqkEuWOG6i+CFlcI=;
        b=gRyWkFYZYirjoNRocFXy8Ydb3hEWu99h4NHqjxSMUcFsNiJWrvTx1juVd/NJZXjj1w
         e2nVpFrtI0gGVOTia9g+eNHG96BsQavqN2+rXX2b+cNxv2ARk9c87bj7vPbavW4Mb7Im
         yjIZ+XlYUzinBaAhckO5nfeDYmY/audGRo/VviANEU8/pU9Fqzu1DgE6DXxTjdsAO6fs
         W8CUR2QE22ziKrydwQIvTeODtIeSGVFSy7jJd+xTdtkxZ9Sc7Ua/eHTrzYqysl7gWPZ4
         Ftx4UClfZ00gktBN4FkNQvqHEdwCVnLS/3pCu0jx4LNMuCyyzUqenAG6nPrwT+vh8Skf
         Z3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791160989; x=1791765789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnCZgK6LbunIjGmFBSscnbMfeG5EqkEuWOG6i+CFlcI=;
        b=cdT/uHFMT0kgpg+28jqAkyQON7mSIYQZax4b7STr49qbLRKIZp7LSOvUY9elE5aAyd
         E7GGT3A+1D4UMHILcEo4frgXwZCEXhxxGeT7jwY9xvNz93JQL/QIyfyeT6RwkkDr+u2g
         0HzeE0HVYJV2OGeCZOmyZko9c9/AEwWt0hyE17mkuR6nA4gvZg/zlNvrLTaGBrN549cR
         xIMKUMLn4vatBD77NM7hLB7F6WeDEfd5lY0h8o8DZzHmqkAPi00X1gpQHuhghqqjXRmp
         X29k9gQ9lrEwj4DPHTNGq+qjXTLfzLs5LeD3Rh969eTAZtA/lr1R0TcfC+/sL/MFok5k
         Wwkg==
X-Forwarded-Encrypted: i=1; AKwUvBxR2GQCwoRgRBYrkb29AO95zHZ2GxDmoOSS0mth63zqi5WhWLTns8vQ3CI5CMOYeSyhwV+cRgp/yfwsFA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/mANp1yP/eejNRwyXVlri4jO+x8ukvEcZF3S4dT+ayrfLUc2O
	o8jvGL1GHJIzLA7VD4YRmhFITl2ROPHxrnuTtLVDazGHaFv8+OJEn58k
X-Gm-Gg: AYBFou354WFLkElwB/ar85j1NanBax7f07rls4Xyo2mwT7CpeORIYryLmA4yR86qepK
	95uUMuYGqbuXhS/E18mbT62/o8f2wd7isOooh7vxQ7/PlcYT6YkS9Rr5KFtQKpn+seTfj0h7OHe
	TO1NZF/1M9sTL6++CiEHcLzCuVZ9+ZuQnHbKgy4a875dQ1lXd0LiGUVR2gVBxgS/RiI+YojzLMv
	hzT1cC9E6aNWH4Bcg84uwsFMtDo7ck2V2uwzFNBOXCBvlmYBrRvnC0VHn74iONoanSxBKiVZF0U
	xm0ikM+i5k78E0D7behH0LztQtspMSVVv3SSO4S2Vhub8XlRcAJuhcVyOeV5fFpT/9ZM7qHfh6w
	eLX5s5d7lWnEwcfHkR7kqwhMWuKzDTml2bU74v20HtlXMh6D2PLMp5Qd0N+svnO+XAMh/DW1Gff
	6bwpbCUPltYdd10q2+bb+DIEhj3frkL8qMEHQCMWSrZXcNEPyuYfWIgJ3kuBgIOrslXU4Z1LB/j
	BC64A==
X-Received: by 2002:a05:6102:41a4:b0:7b2:508e:3d40 with SMTP id ada2fe7eead31-7c244b9b1d6mr1275758137.15.1791160989089;
        Sun, 04 Oct 2026 17:43:09 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c10002f77csm8504297137.10.2026.10.04.17.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:43:07 -0700 (PDT)
Date: Sun, 4 Oct 2026 21:43:20 -0300
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
Subject: Re: [PATCH v5 4/6] iio: imu: inv_icm42607: Add support for
 ICM-42370-P
Message-ID: <asLyqO50cSIil_WW@debian-BULLSEYE-live-builder-AMD64>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-4-c65281b745c9@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-b4-inv_icm42370p-v5-4-c65281b745c9@axis.com>

On 10/02, Kanak Shilledar wrote:
> Add support for the Invensense ICM-42370-P MEMS MotionTracking 3-axis
> accelerometer with built-in temperature sensor. This device is almost
> identical to the existing Invensense ICM-42607-P IMU, but lacks
> gyroscope. The device supports I2C, SPI and I3C. Implement only I2C
> support for now, and provide support for raw sensor reads via sysfs.
> There is also a built-in temperature sensor but it can not be turned off
> similar to the ICM-42607.
> 
> While at it, change so dev_err_probe() is returned
> when the WHO_AM_I read fails.
Not a hard preference, but the WHO_AM_I error path update could be a separate patch.

Nevertheless, looks mostly good to me.

With ID tables ordered by compatible according to Andy's suggestion,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
