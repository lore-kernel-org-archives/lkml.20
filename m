Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC034DB6D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964474; cv=none; b=HtBg7BcoXc96ofY3VTWITOAnxrq75y9Nos+3Ngn0EzqjcRyd1o1JzK4MhHqI6sSjGM22gdCT/Ghq6UaCtOjJxK8pnMSpLqxse83kyQvRGTrKYdIvULgDVra3cC4X7zQ5gBKu5B+/GUk1Qn0O8ZoTGn0FZCnqDpKaTG3nfR9ajP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964474; c=relaxed/simple;
	bh=P4g9wk0r+w0bkacik7EVO4K1hKVv0sivx3BRd2XSMF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzYuC8q8EoIDSNJNAMuNuf5x8UkmhGd7lsmtWlfe02dcwC9K/UkRJ2N0UvGrDo3TDEUj/OM45K+vyvb7LuCAQCpI00iJJ0OVIgXmQ2JYRYhWk+lzdrjbMH10pK9BG0UVhrFhIeCXVgWGWc2Pr8JMqdx7yLuJ755U981BKsw2HlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL9ov4Ul; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL9ov4Ul"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85e68bdbcc1so16143877b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789964472; x=1790569272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQ0elthYnoZqHxAMp2dBpGepvqv2PKVVkk0yksLm1/o=;
        b=fL9ov4Ulfyn2XFcj4T1WWuw+8E14TK9Eo6osoTvhRwZ336xAuo4MVWaCe36CRzGSFt
         6y9k28Bz8mVxOhzmI773OBs5a5RkB1sxQ6Vx866kMNw8oyg5JdQp0M1m8M6v9WJG3Mf0
         jcPLLbzT525+2/ctquQRqzutXC1ElP88DUMvaWzNwdjk6gAnG2om3gQx5xm+IOvYY/mh
         oQo5hKfwp6DFSMTAnynKXEXkJ1gRUseq5m4g7ZOt2nah9NO62UunFFeO22GHFOnwXWH+
         KeRzNpk8QQTTaspFyv0zkclSBtpJhbggcyq2kYWHiRAarigGsTMHTQ0TzMertUbXJk65
         EWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789964472; x=1790569272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ0elthYnoZqHxAMp2dBpGepvqv2PKVVkk0yksLm1/o=;
        b=YrcCnn+BTkizPPB5YmFkSRm0KhWMJYcIUB5PnnA44054UD+wgTv2gQnd5SnG9lUaxb
         SRfnYv4x276Exokn4JC4V8HyeGxeIp73UpAnRXwuvc3JuIT0527rhA1hht8WJ/zZ28zl
         RnF7OqwODphc+D7iECDWY03YwZoxJsYD2lekIXZzfyNDWIbQ1gy0HQTcrBBhuGPyZmVl
         GJ3IajpI+FgFXWp2tMi5bt+b7tznVsgWdIQI0uR0smcwQ13pVcnnHVIOnCsZZ6tKRtod
         ApcyECDsr96dAoi/S1io2jAPZ9fRpGOo02dd1Jdcdnof9u9E/9CoIWzmXF6JZbPmp6E5
         mXAw==
X-Forwarded-Encrypted: i=1; AKwUvBysAimGJqTGhHXckkUbtb8IKOXRFyPyqtAYSacWAEvpoahUkaBSjljinwFpxe5zfio+zKDRHBmRGLKUfUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mAqEkgieoZl08G999Gw4qXXyMzcgPbYvL4PqKg/zBacMBDX+G1
	9Gf5Qyicn+p5blDvuw+h65qCsFp082krrg1rIluQZDfMoRyudjvXkQ9z
X-Gm-Gg: AYBFou0F2KQiBBWDaC77fRyTwWXcB/AqHdzT7xcMAj/4YKF89EIW/3HdTpvEmc47vzQ
	OtHK70jCxC2oegVVaUS0W++Cz2DVB1nUXl47iF11YMvnM9KC+O1dT7S22qGQ3WSavmXrNN8QnCt
	dmAdDJMtw8WYL7Dbj5pWlq0MT+sCv35vHPsLafSsAEjNI/lFk/BrAkQIfvkX8MTkd6zCFlYEia6
	7A6mNOni9HWPe2Qq/oGsWllYKStZRMFxsG8J1HuCibdcDVeT6SJWIl7p5x0nx01udw6AXHfRB/v
	9/plLD+pjf50VtapG5YEErAz8L/ejmLb666V0Wunk07sMiez2TdrzEL0R4Nag8Ydb0b6BkZUX5L
	YTYQzG71mo7RMcCpOmKlBCyAllZPZMWDdXI5COVc+1heqlTsD2r8aLJG1P48jy1pOe0ec870Hly
	hQJ49RJDg67DvavB97UzxBUztnsxTC8bh4KWmk/5wiThpQMLY/vKWOFbuOwi9kI2u1
X-Received: by 2002:a05:690c:f05:b0:89a:63da:cbde with SMTP id 00721157ae682-89a63dacce0mr24128807b3.36.1789964472278;
        Sun, 20 Sep 2026 21:21:12 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a48aa9036sm21828867b3.44.2026.09.20.21.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:21:10 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:21:08 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <arCwtKsOW4iTimCO@gmail.com>
References: <20260919235145.48273-1-marcus.yu.56@gmail.com>
 <20260919235145.48273-3-marcus.yu.56@gmail.com>
 <178986397173.706584.14464234266525982696.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178986397173.706584.14464234266525982696.b4-review@b4>

On Sun, Sep 20, 2026 at 01:26:11AM +0100, Jonathan Cameron wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> > 
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> > 
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements when the device is suspended or torn down. Power is
> > never cut (PON=1 always) to preserve register values.
> > 
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
> > 
> > Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> > Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> 
> FWIW I believe the sashiko feedback autosuspend is incorrect, but
> probably good to sanity check that by proving device and just checking
> the calls in dd.c are sufficient to put it to sleep after the auto
> suspend time.
> 
Yep. Did a quick test on hardware. Autosuspend kicks in correctly
without any user space initiated reads.

