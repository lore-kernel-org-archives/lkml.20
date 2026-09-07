Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6D3AD51C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763008; cv=none; b=omWx68kR8oDzbJtmC3WpFrjWvGzX3qF78WD8RoQ9sc0N5B281Yi0uTooXp4EnCUcMMPjlFlGbBmoujwsdq5GwbCfXr9C0Qxu5xEHX4j70YZP1slqbKB70w76n/TdOclu5P4hx3hoZhWAWPriHzID4usL3O6l2ABFRjU9kkhHK+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763008; c=relaxed/simple;
	bh=g925oDHJpCLjUvom101ukrVWFkHEpx+c7c6wk313MJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IysGTaHFFo63IIhew4yZCTpFQZVdoycu08dXtyMf5cRNxloiYvtHhIZBFg2E4h5C99nH0b8QDLS8iKaktYlCZ1YNG+v7z4Ywy4XjyoTa7eHjc4jyADCSx6ZqNobgQxMzIVEaW52wMhkGnr1QOTpdNyDUHZJZqbGcqzb8B7rT0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWH4bzJb; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWH4bzJb"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66cf1f9965dso1940464d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763007; x=1789367807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ocoYZDUBL0oSCHSm39vxqV2yz+NMY7WJASmnMs0VSY=;
        b=pWH4bzJbBxPmc7BFUpJGiHUmBmLRtG4y+BGUfLThl3nsCt3Ia3g7vtbIAfiMSYksKG
         hAqvQPqIYYyXmY3LX0S5tzdRwOSKNqzclgCtRdDu6NNC/DMRwD1qscfaMrrvsFEw8H5d
         VHl94hGYohnIwvKlI2luQFd2Zz2K40KYq6y3ma9pHrU3npqBPGSTyoW9oZqGsXseR413
         RDxMMxwuaB9hjL5SPS/yOeaZSs3iKTMG+PEFCUnuTa/Vtu+xt6HKuCcRRKbCoKlzxQsG
         7j9CiVvBTYQILJ757v1ZOyiT09qxsZD8cTJyqbsOhliPrnh75Z0PXCxJ53ZyuuM+eETp
         zPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763007; x=1789367807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ocoYZDUBL0oSCHSm39vxqV2yz+NMY7WJASmnMs0VSY=;
        b=U7vsxmVN4z9+mTYaOW9inhneXGZEZ8aLpJfY3Yc3IBboeivEoVMylDj2gHhyMTCPs9
         U/pBVomfxHwMuE5AKn+b8NhrDPQibFc4QTexwUEcbacmzv0/xVr4yMrgApwnQnmovgb1
         6Ouq3UycLE7q2f9ktl+O4TKMHJMoBqQ6dHDa8+qq+r+lnA68iex6Esi6wmS/ThfT9nJR
         MiK/YHqynSb2BoUBq783Af9ia42MaG+HGSiM7OB6eQn0ZVbRwB6OXfKwjMk5n9jWNRgv
         9EOMSpEwqSJVpMapXRW2Lg2TQhek9Uv22/wJ5kdRcAJVZdiCMDvXhNcw97Xwsx/ss1/d
         CvRA==
X-Forwarded-Encrypted: i=1; AKwUvBxtcpTcyUvltuKcmS6q92x4V1bBUy6K57M+D2oZ35+7k/LLu5GD+Kabjdf78+b9bi1wanerbGo3NsaNi+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lhp9X0Q01kgpRz5wGhxKzbqolpSMXAP6wddbkorOdAlk2BDNFD
	PfGiJJbdYoEWtE+XsJRHmP4F4k6XA9HEz8sY0lhHELjglHdF8N0ZmwEr
X-Gm-Gg: AYBFou36b+8KWccjMU//QhdkrAo8Lpokpks1AsLgNVY2IJvbt5GncMWpJaheDgqkF03
	ahiNHLOdNwt61QhLahXP7UhDR5gxJyS4iYi6kF6RjKmd+fLk+ajmQRWokCv57EARoiCjsz+zdho
	qmiE1565MgsHYrO8vFM32KN/S1rfnODUe5FhY26bku7xjm9m/kej0eB5SHa3uBwFk6y1hm2Y9Jl
	mBF5c6sG3bJ6jF57EXYerMSN5Kb8S40NROVnijxESt3JHoC58cn6AbjSW5Lm4h9WJChIuSwtwKU
	NdUy9YUFeGMIFDu6k7DagH0msNQ0XjfKtdYoy/URay3nk/IZ9Uvb2u/oTNsDLkoFWYHp3Du7ehk
	eYxvrnwK21GCWPjfTn2+tqLcFwm4Xz8uBYc9XZrb7SKcuEo3higFX1esxqf+avilZ4CwIEg2C0w
	c3/BrYFcxpLmgbvPt6z/DTi3ANPFU6DoXC1IfsUGsQPhY=
X-Received: by 2002:a05:690e:4853:b0:66f:c1bc:4019 with SMTP id 956f58d0204a3-66fc1bc492fmr2668552d50.70.1788763006713;
        Sun, 06 Sep 2026 23:36:46 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48d6ea5sm7811628d50.7.2026.09.06.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:36:46 -0700 (PDT)
Date: Sun, 6 Sep 2026 23:36:43 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>,
	Chang Yu <marcus.yu.56@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: light: add AS7343 multi-spectral sensor driver
Message-ID: <ap5be0ipNiS5lUI5@gmail.com>
References: <cover.1788586814.git.marcus.yu.56@gmail.com>
 <521c26094635bae6376d92f3cecf84c911d5a740.1788586814.git.marcus.yu.56@gmail.com>
 <20260905084258.350fdccb@systembl0wer>
 <20260906011145.4a0f4933@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906011145.4a0f4933@jic23-huawei>

Hi Jonathan and Joshua,

Thanks for the thorough review. Just adding some clarifying comments inline
for what I plan to do in v2. I should be able to send over v2 within a few
business days.

On Sun, Sep 06, 2026 at 01:11:45AM +0100, Jonathan Cameron wrote:
> On Sat, 5 Sep 2026 08:42:58 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > Hi Chang,
> > 
> > Comments inline.
> > 
> > Josh
> > 
> > On Fri,  4 Sep 2026 22:53:26 -0700
> > Chang Yu <marcus.yu.56@gmail.com> wrote:
> > 
> > > This patch adds a driver for the AMS AS7343 14-channel multi-spectral
> > > sensor with I2C interface.
> 
> ...
> 
> > > +
> > > +	/* Set 83.4ms integration time and x64 gain for now */  
> > 
> > Good for an initial draft, however you'll definitely have to
> > implement the write function for this to get merged into mainline.
> > Skimming the datasheet shows that there are more integration times
> > possible, not to mention that you can also set the gain etc.
> 
> If there is a sensible default / initial value that works most of the time
> (short value probably to avoid saturation) then controlling this isn't
> a requirement for merge.  It's a nice to have though!

I'll defer controlling integration/gain to future patches then. x256
gain and 50.1ms integration test are the defaults recommended by the
datasheet. It is also what adafruit uses in their arduino driver
(https://github.com/adafruit/Adafruit_AS7343/blob/main/Adafruit_AS7343.cpp).
They also seem to work well enough when I was testing on hardware.
So I'll use those values in v2 for now.

> 
> ...
> 
> > > +
> > > +static int as7343_suspend(struct device *dev)
> > > +{
> > > +	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> > > +	struct as7343_data *data = iio_priv(indio_dev);
> > > +
> > > +	return regmap_clear_bits(data->regmap, AS7343_REG_ENABLE,
> > > +				 AS7343_ENABLE_SP_EN);
> > > +}
> > > +
> > > +static int as7343_resume(struct device *dev)
> > > +{
> > > +	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> > > +	struct as7343_data *data = iio_priv(indio_dev);
> > > +
> > > +	return regmap_set_bits(data->regmap, AS7343_REG_ENABLE,
> > > +			       AS7343_ENABLE_SP_EN);
> > > +}
> > > +  
> > 
> > You have suspend/resume functions, yet you're missing a
> > devm_pm_runtime_enable() in probe. 
> 
> There is not requirement to do any specific combination of power management
> for an IIO driver because what is necessary is very dependent on the usecase
> a particular developer has. So runtime pm is a nice to have only (as is the
> suspend / resume stuff we have here).  May well make sense to use the same
> for both types (there are macros to ensure that).
> 
> > Additionally, you could enable
> > the autosuspend function as well (note, you'll have to wake the
> > device before reading, there are macros that simplify this though,
> > see PM_RUNTIME_ACQUIRE_AUTOSUSPEND)
> 
> All nice to haves indeed - but not strictly necessary. Many drivers
> don't go that far initially and it is fairly easy to retrofit this stuff
> if someone cares.
> 
I'll fix up the suspend/resume stuff per Joshua's comments. But I'll
defer autosuspend to future patches. I'll mention this in the v2 patch as well.

Best,
Chang
