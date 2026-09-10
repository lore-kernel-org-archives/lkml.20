Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988457C703
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068128; cv=none; b=uPqNmJD0qTfLRGL58VT9wxF35PSuc+71jwpCRtb+DAsdfCJYJWYoFqJCxHEJQMLhemZ6LdQtsK9JSFX93ylJ4yOaHD0Ym5Pjh3vwDfU2Q0TYCATOX/n0pDOQnfRx/JvJuD8s7aTHnQIGIaGqPifT1xEvxLrX2bw1BUiLRTMOQrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068128; c=relaxed/simple;
	bh=fz5lgnF+eMteCzfC7DTWcXSVct3k6f5dGJkct9t+RTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OafOBZ/pgQOyE1YMdXluecKl4JmpfqQFc8gbMhV82VTLu1j/ggSmAfkjFqtEGOCems4vvl74XhbTNdSQdY49xkDvVHp/PlEsnk4gRqAXpBCz45Zp8U4wWp+jAR7vt+/Uu3IJEx5pdjz0INFl3MGDUrAEWtFj7EZTKuF9rK5NYqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3BI5/Hs; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3BI5/Hs"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-85a50f6a7f7so355817b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789068125; x=1789672925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rv/ofRiUuewkw6zCaw4zHN2Yd5sOfGP7dsRjht7dkwI=;
        b=b3BI5/Hsa/47pte57MPERaih8E7CTVki6DmkRYJXCCJcglOUwWCjwKPAeMEYpaEIJa
         xg6zqQ8ZZ3ubYKadEJ3oYhnV/fAnTO9NuOM0GaAGloGmGVZfxrJPotsh+XUTCei+AuHl
         dtMU7hP/kcO/PUTHBsRsgHIuFWEJcM7WswmPqR8cSsszKtxmmWMroZwLbErRRsV82vCJ
         esLuVUafaS+qVz1rPASR9yqWXqd0mJQBKvDtq8CBiil2f/1uh2pAeQlGSTbd0m5cq5++
         1fjvY6ox2Tqbwa9REzaFFrhXYOhps0iVUg4kTJLP3DLNCkXdlk0WhCO1w79IOmPspnrP
         JL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068125; x=1789672925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rv/ofRiUuewkw6zCaw4zHN2Yd5sOfGP7dsRjht7dkwI=;
        b=FYa0d95s3OKiSWJeonwJfrMedsJp6S0KzrzXve6UoDLZNW+ryzYc7KfGiN3oZ5cNcH
         ihVGKl62GpFhxb2fhz0bPGHxOEoX/B4barLfuLuF5X/9P1+XNE9mb4XgTw3g4qamnd28
         kHpnDuEg8qmKieZrVHE2K1XhdXMxWZNiddofWbY3WjEX4FFsFSOseYj077t+n+CnVByT
         bEtepc6wpiy2y+gSsKfVMC5A1PhIwp0IME0jeaDbiXN8aQUZCHP+gn/ClaN8Yb9O2s69
         MHzAaED+1KIy3wYfVAeW8M/PWghbMtvTZt8MS7xy1umUzASs883XRXZYOCeb2kxXm2QI
         a5Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwxapM99oXel4e0e/MZAm0HaoVfeKSikkwc8EDChplPFbDd7bhvc3Oz2a+LwlVz65dHMmzPvXSCeZn6SKM=@vger.kernel.org
X-Gm-Message-State: AFuF++kGU/RIdev/lkVHxGQ/n47uHgQ9bkIIDXQso3KO7RhG7VezNjg0
	bSqkIGV97tXQ6tUF5YsJwfrQD5M1p3nlfz//2FW/gvaT2xuSfh0dqktg
X-Gm-Gg: AYBFou30tznzwUPwZxshLhiiEcuio3UOtDJ0o1vxQrDJHrMzYY9w4iINqLjtdJkyMrC
	8ZQvdnnxEmtKzAlvHIcaCp0A6MdDDsfDLh3+nuA7Dc2itouQTwKx8rENWvP4j2wkCWpvNZmx5bc
	zKsW2hTJY/5aCAK4CcTCWD5ZKwFkwwiCuKNHMS2avo4gbC1IVxOQAN4vHyN0rFNQyQd3BzCczuQ
	a0vb1HTdlq2508JmKDWCnT85HJjnVYdNGygRWm5poptfMXezmGEvn5lD7v4CrFsjHKyqhBcaSPa
	6+a0DLz5+q7Ubrpx600qsvj1MQVOTexnLlgIaP2CyYw464YbzV5tworClFm1qwun396oUSoQ9NS
	LG0a9RPdwdirECDiuUmiKEVr7Yu9d4sWZEiEcU8LdsJqDO976exgbG2vnTjylMnE2hXiEwBNa4N
	cG1V5ifOZUAXSAztfQXnjI19haGaNEo3/kb7vXKorDhklyQ+QNSGDXEg==
X-Received: by 2002:a05:690c:c70b:b0:883:14e0:ab4f with SMTP id 00721157ae682-884b387abbcmr3618977b3.69.1789068125333;
        Thu, 10 Sep 2026 12:22:05 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486e2ecb6sm3612327b3.21.2026.09.10.12.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:22:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:22:01 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [PATCH v3 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <aqMDWRRKMW7uYoGa@gmail.com>
References: <20260910063813.56419-1-marcus.yu.56@gmail.com>
 <20260910063813.56419-3-marcus.yu.56@gmail.com>
 <aqJzXvxHEWi2Ny1g@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqJzXvxHEWi2Ny1g@ashevche-desk.local>

Hi Andy

Thanks for the thorough review. Just one quick clarification inline.

On Thu, Sep 10, 2026 at 12:07:42PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 11:38:13PM -0700, Chang Yu wrote:
> 
> ...
> 
> > +}
> > +
> > +static int as7343_read_label(struct iio_dev *indio_dev,
> > +			     struct iio_chan_spec const *chan, char *label)
> > +{
> > +	const char *name;
> > +
> > +	name = as7343_channel_label(chan);
> > +	if (!name)
> > +		return -EINVAL;
> 
> Why? Can't it be taken from DT?
> 

These channel labels correspond to the physical optical channel
names defined by the datasheet. Each name corresponds to a
pre-defined range of wavelengths. They are fixed internal properties
of the chip, so IMO hardcoding them in the driver is more
approriate.

> > +	return sysfs_emit(label, "%s\n", name);
> > +}
> 
> ...
> 

Best,
Chang
