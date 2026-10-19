Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF2492E37
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397834; cv=none; b=j1jF2PAWZuWijHb7RVsZKE4KpNrWYFjElJyjaFcpA3I9L9jIHyleoPR4j2SYAKphBng3o+inBlNy4tUBU7EvQzP2mqpuhy6CaJ4iduXNSC9RHNmLZrKBfuui585zIaUtssnlkyVRsyOyvzOj3R2yc8aVXEMrK0f6OW6PbmSV8tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397834; c=relaxed/simple;
	bh=m/rCMlwixr1HByosXNxYMqI9p3psXYhlmiYi9fJIumk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkFWJXnWACUhAfnkM9cEpmoluEwfI+yuIhTMypdBjKF+2SDTyTYbx9ZdeiekwxvUT9Dkrb+AmixE+XmVeE1+gVfFJ1trWW0Fh+RyTP7AvR0k48zOxiAsIfKKt3PtnB6U1OuNNnaDwJRWZ8yE9B51DkOzhp9C/TXjdaVo0H/MZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwzKj6UW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwzKj6UW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e011d370dso1500868f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397830; x=1793002630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ogw4C7dcjw+LNBurpiZMKM8H9AU9+IbK8T0t+NjfUw=;
        b=mwzKj6UWuI/D6COf9gmIdSBjDx/+UftVGBZ7+px1J6xki3FGzDJ8kVeAHUbye5y0bK
         xDjuz93WS2g+S93nAYVOjGB5DxHyCzWGRGluw/xQUcv7catxshnirpP3QVPTQpdspwYL
         9oBDjfoqnrtIi4RDbbuAl4qIgICf9qrlDZosiPzsFboyf0Bdo8vwn8KZlf6LH+vOIqEU
         YdAbN/9TPlJ7h/D2PAOQ9OszOt9pwtu0YpR5vBksEPLyKjQTOuRh7XA+5KvX99romZuR
         toYtiD7/qqWyZj2vCX57EQaGv2huPFHenKFnttTdTCJRolcJITTPY2TTQyOb36aydF/g
         /tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397830; x=1793002630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ogw4C7dcjw+LNBurpiZMKM8H9AU9+IbK8T0t+NjfUw=;
        b=1KWyekHje17eTRA2cP5E3BMZCiB+S6kdOfujEIHRp8B+vIerVJzmrcen+Yhm7wfwpY
         o8lIsHCZuowUFylOkZ+S0foRefQ21iBSNUbY80vSTpCUSPzDStlX4Qy5Q6ulhtqTUDmv
         iHuA3Vsv0AxP3HTxJEnJJCyPoNw8rBy8fz4NIUyndoOP8MkHkFgScj/jiQ9tT07KImdE
         WVT33Sqk+Fg7CBNJkolB7IVG/3tkRXHhS43/1+X5K9lQsI1mRO53PEYYJhZP+WYrAn8q
         7mUCBBQeuaWuUPBFx0bMRSVJE1WFo+8Q1uYSwJ1azHxAuXETKcFcWvlwgLoYch9BTjDU
         K/sg==
X-Forwarded-Encrypted: i=1; AKwUvBy3YoFi59X0H4dmeUeSyzXduY/DhkFAGao1hTVUqdXcvRmD04jOqbo9vUe8sBc92Qro4cQ9J6SkllP3qoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOYD2W2opKBRs308RHRtr++1lYOffJTKJHHZJCyfFNl+Ip0nIA
	sSzUBe+jfbXMr0ad8ECoNcg5tHVfkX8jdTs/BdKYIPv+NUx6svt6ySSe
X-Gm-Gg: AYBFou3KsMbfqksyyGC0WsAm/bMIbgpCuH6ZMxP2rbsqtpSSaC6ztojGg6Wb+aIXORn
	WU2PxwDCDn0fcgL5HDtsbelfPcNLFQu4K78/+TRFnwv6LzTjHF8kVzYW+i3l2znQDdSMVrpLM40
	6Ol2E6bK6XgP8hyenQfvZajvsVaQ4/fzVpHwYm+ES/fiJHtxcMS25YAyLX/tNd93eKnQTFkE/Kk
	ufSkiOOF0Wbh1LX7GsxhFSKvLa/nSRaueRsENvXPmiUxiUidp7864dXsGwWVAJulRrm+kJK5LJ0
	au0biadIaM2saRexsAvGL4h8fqpLS+Q9yHE2gWyiYoL6TUDBijisOplUZX9uNQXhi+4SmD7nn/y
	77LRdT3sikXToEyJckQwhWNDYH1QyqVvHydnWgenhMi6iA2qlMYmqd1wxsssXoohNa9wobR0+S7
	CmnXqzp2KPpO5NL6WDMXCxNNZKgAZCzYDH4ES3PGOSPRYMV1fYkr4QqJ6Yt2atgsXjtGrTsVsUm
	8B+PYdxq7JchJUPANNyp/ONMwBfOQ==
X-Received: by 2002:a05:6000:1887:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-48e07fb983amr15940466f8f.57.1792397829655;
        Mon, 19 Oct 2026 01:17:09 -0700 (PDT)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm20943116f8f.58.2026.10.19.01.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:17:09 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:17:08 +0200
From: Jan Remes <ciakval@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
Subject: Re: [PATCH v2 0/4] iio: light: tsl2591: fix lux calculation and
 precision, add I2C ID table, report saturation
Message-ID: <atXSBHbOPYYltHUW@mm-ntb-00805>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joe Sandom <joe.g.sandom@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.triska@mycroftmind.com,
	Jan Remes <jan.remes@mycroftmind.com>
References: <20261014141650.259929-1-ciakval@gmail.com>
 <atEdM6wi_FAGFjrr@ashevche-desk.local>
 <20261017031411.05dee323@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017031411.05dee323@jic23-hlaptop>

On Sat, 17 Oct 2026 03:14:11 +0100, Jonathan Cameron wrote:
> On Thu, 15 Oct 2026 21:36:35 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>
> > From my view (haven't checked the calculations, though) this looks good,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> I'm guessing not huge urgency on patch 1, so to keep things simple I've
> applied the lot to the testing branch of iio.git. That will get rebased
> on rc1 once available in a couple of weeks.
>
> If you want the fix to go in faster, shout and I'll do that at risk
> of slowing down the rest.
>
FWIW, I don't think it to be very urgent, as people probably don't use
it on x86-64 (seeing both as it had only DT probe support and that
impacted users are likely to have noticed the oops).

And on Arm, the net result is getting false illumination reading of 0.0,
which isn't great, but isn't terrible either.

Thanks for applying the series to iio/testing.

Kind regards,
  Jan
