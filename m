Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CFF4ADD8A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357730; cv=none; b=QCK34ngv+Yl3M/KNMFmQ3F6YrfV+6S3+aLXD4C4Eez8uGKBRCXklzIvX2SWJCQK4F/VyfI7XkaSILnQNBWbzWuu/kAKB0ftoPX4EWIoE/K/28c5pNk19FFGgXAa5aN4QrSaLvKkDNM2OneHizcj87Jo2X8tCYtVDtVPFAiNtSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357730; c=relaxed/simple;
	bh=fzcoyo69KXGefqxSS7X+PXbTEIdF4MESbyCrnQvBXr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfNZPa1xjEfcaoeRDvuLNNYht6dRR+VoqTgmeoTpDTmKqNzIUc+2YBpMQM4I5ZFZuG3kS6R5N7zjYan08tevfRb/BM6f8ejlPvkMFyZpN9gFr1C3WpQpcLOIg7PIHpDgKtkd5fHuliotu69e/L2HYeiUujPkdDdqoIneOEmHAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jd1jQ5RN; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd1jQ5RN"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e33b917so885831e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357728; x=1790962528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nej2ob9CdbG1DOfUQmIUHXKCzCnebeOZh/kYsDtKROw=;
        b=jd1jQ5RNLXOulslwVfa4fECC5p5ayy6GW+VSH/wYRKtiwr7ugBUQHRTRVla1HFWQka
         bt+wTn+kjHCLcc2q6vC3/UZe6tb5JNKkadyOYLYhJtKIUjZCoH0rSGLHk2wE/0rKGzqn
         HYGWGJF+aGC8ib/RK2PrFHko+zEA+0kubMkIlVk5d3oaQ8bCoV5ovULS/qVJkrvnOZcw
         Y0gLzqQDL1r0h6k5bk6jXZxNYja6d58NpOc55a3OessRSwmnc71mywaTmDSg1q0Xlu23
         Yvj2HSeYDfTDarXIsorgRS8vx8tcZ3CwZzPr8QZB4fogMtkZIHjaPU3J8rH0Evg/cUoB
         Bexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357728; x=1790962528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nej2ob9CdbG1DOfUQmIUHXKCzCnebeOZh/kYsDtKROw=;
        b=nI/7tTigAI3DFH5BUMS18cBGsus6fEL288e1PHUpwezSuYAJW3MJKVClCx4agfegYU
         UXNlJ3OE+tdN52SBZw0gHJR5x82WtnegYO1uFAc8mkZQL8Wua1KSf6yniKUTwSguxm2D
         2yrOwH+iW4FrwQJFMbCXaHhyYRz7Ysufb71f1gzpFleaD8quJARpW+5xbsoRhLQ2joQJ
         iXDWwKCzas0Fph1dr5WEIF7QIY2QPtBltw1WvWE/wlX62cZ2RGTQtT0iId7B3EmrOnnY
         9kbDcKI/SIxnJWkSiuTd59RjVmQX6uYHe2ZSAfsn+wch3qQX/6QxsuhrUJvfQbG7KKpT
         nO4A==
X-Forwarded-Encrypted: i=1; AKwUvBwS3ujNQqWc6cK8g9j8iyYdRUpucC+GJ9orPBGbDKsyqamP8IcrXbbmOXLUXWC44j00CFC6VRIFfW28wIA=@vger.kernel.org
X-Gm-Message-State: AFuF++lbyfahI3lib7bayqlWeLgf1E1jVlrJHFXRrK8icL/W3kvrN6vn
	TuRDxyEbYzH/HdsZKWcTjL+emkIKFk1XQqdKFva9PVTwSGqmPtSOjRzV
X-Gm-Gg: AYBFou3DatLpzGX+txkkMkKLQRMbwIB1AFPYn1hWRhGUw2KMZxDWVGkYTLOsSB/ZnGz
	SlV52hL6eL0vJTWfR9vMKy8TpwA1NcvFYdGgXk703SakcvkukLsdbM7pUZgcU8J7IOx3rxdd2AV
	k8bcDumVuDybBuzgJbcatAJWfPJ/MPzchg6gYXSoztUIfzh19YrSimVDVnYFKoXuG5JmA/r25v4
	oIo4SCcCn83FpXIGBrsRJSAzJZ1H2sVKBgq0J1UPgnPq+xRF+OUZU7j5Sp/touZrgOjjqdOya2R
	YtJ4qRBmnnc5zR97/S7HTI8VyT+HWmu126ZW1quLfcu1G/cbIG+sUANz4dkjrH0I1UrfBwZj375
	cEGmLG4OceYVbl3EHDd08nBEZH7oisg5pSeZ+FNLaW+UI/MesIJDLO8S+lHFGkbzRzmNJkazPRC
	vijeVsfFVS09quLAZMTy4Cd71guXtslN+GzctDdOcGz7FC/Gn4xFVFtb7dMSp6ODTMuG/D7RwDd
	nh6fRFpyxKBuu8qmF48XmCen/2Oz5S6Jw+a7ZmP/QMGOxf7jCioB2XMWCzHOydZjeYo
X-Received: by 2002:a05:6102:5613:b0:7a1:f7e2:aae3 with SMTP id ada2fe7eead31-7af1e6f3a10mr2817620137.21.1790357727527;
        Fri, 25 Sep 2026 10:35:27 -0700 (PDT)
Received: from archlinux (dynamic-190-24-104-85.dynamic.etb.net.co. [190.24.104.85])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afee2d2sm3436422241.6.2026.09.25.10.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:35:26 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:35:24 -0500
From: Carlos Casadiego <cdcp206@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Carlos Casadiego via B4 Relay <devnull+cdcp206.gmail.com@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Olof Johansson <olof@lixom.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: accel: bmc150: check reset write error
Message-ID: <arawwqTgXBuAsX1h@archlinux>
References: <20260924-iio-bmc150-check-reset-error-v2-1-b6dc74d7aaf4@gmail.com>
 <20260925040500.0f637249@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925040500.0f637249@jic23-hlaptop>

I have not verified this on BMC150 hardware.

The datasheet documents the soft reset, but I could not find a guarantee
that the I2C write is acknowledged before the reset starts.

Given that, I agree that propagating this error could cause a regression,
so I think the patch should be dropped.

Thanks for pointing this out.

En Fri, Sep 25, 2026 at 04:05:00AM +0100, Jonathan Cameron escribió:
> On Thu, 24 Sep 2026 09:48:45 -0500
> Carlos Casadiego via B4 Relay <devnull+cdcp206.gmail.com@kernel.org> wrote:
> 
> > From: Carlos Casadiego <cdcp206@gmail.com>
> > 
> > The software reset is required to bring the device into a known
> > state before reading the chip ID.
> > 
> > Check the return value of regmap_write() and abort initialization if
> > the reset command cannot be written.
> > 
> > Fixes: 1c500840934a ("iio: accel: bmc150: reset chip at init time")
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Signed-off-by: Carlos Casadiego <cdcp206@gmail.com>
> 
> Just to check: Was this verified against actual hardware?
> 
> Quite a few devices get going on their resets before sending
> acks on i2c which means you get an error on that particular
> write.  That is often why you don't see an error check on this
> particular operation.
> 
> 
> 
> 
> > ---
> > Changes in v2:
> > - Remove the blank line in the tag block.
> > - Add Srinivas Pandruvada's Acked-by.
> > - Link to v1: https://patch.msgid.link/20260923-iio-bmc150-check-reset-error-v1-1-b8c1ebc4c947@gmail.com
> > ---
> >  drivers/iio/accel/bmc150-accel-core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
> > index 46bb36d9366e..43a39e1ccce5 100644
> > --- a/drivers/iio/accel/bmc150-accel-core.c
> > +++ b/drivers/iio/accel/bmc150-accel-core.c
> > @@ -1561,8 +1561,12 @@ static int bmc150_accel_chip_init(struct bmc150_accel_data *data)
> >  	 * Reset chip to get it in a known good state. A delay of 1.8ms after
> >  	 * reset is required according to the data sheets of supported chips.
> >  	 */
> > -	regmap_write(data->regmap, BMC150_ACCEL_REG_RESET,
> > -		     BMC150_ACCEL_RESET_VAL);
> > +	ret = regmap_write(data->regmap, BMC150_ACCEL_REG_RESET,
> > +			   BMC150_ACCEL_RESET_VAL);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Error writing reset register\n");
> > +		return ret;
> > +	}
> >  	usleep_range(1800, 2500);
> >  
> >  	ret = regmap_read(data->regmap, BMC150_ACCEL_REG_CHIP_ID, &val);
> > 
> > ---
> > base-commit: d8c0f48f0b1583308a98401c0c7b1a65d1d43a6c
> > change-id: 20260923-iio-bmc150-check-reset-error-389b096b0ad4
> > 
> > Best regards,
> > --  
> > Carlos Casadiego <cdcp206@gmail.com>
> > 
> > 
> 
