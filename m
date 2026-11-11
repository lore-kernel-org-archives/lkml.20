Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421238;
	b=OHEhBGtpsPcF+hhlTCsMmIR30kFXY9HDIW0HoeUnIqicw4zMOYIkWwve1ygWAFJLH5ns
	 n96H+8EBPZbX9AZ0+WGySh50qcrK8a6b9JLsVuYsGmTnpOxpCQVZ5I8xlNX/H90JkwMLu
	 Z/pyJVWFW9fNAWgyyzbK5JTqaNHX3wyMiE4IZVsu7M53k9XEbB16/+9I217V+8JXZue1c
	 c3nn5F1ZXsf5wdpNiwcY0TDEl8KPPD2qIu/VNC5VgMyofmLkvRJ/hxRLJgoOlhk6wi0ig
	 BAb6r8C87o13FTNrh9IpMcJsM1CeMGLN3Wmg+RPWNRfwXWbh1avnSiQqV8Q0G/rS/fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fOYd5ZaOeADhD4tIe7KmLNJoUGjDoAdQhQUbMCR5XZg=;
	b=p6w1PPpJqanlPWxP/i2kRp6xoJM0cLi9VPGVQP9abkDktHrr6P2I7pfZII+HMuuMKo8g
	 gr8ReJm3bjFQRsiK9JDH8N9+5MOMbB7WADVU/wEfG0s8tmSLfpXLvzslbTVsWUy5t0Po8
	 ohhEjWptlxdW+c+L6rAIU+5rZaGggbUOntPl1hVMk/vYxFRdy2kMtv92Ct8K/rTtq0/PC
	 XIBfBzTCRy9Ypj46fCW5PwWqskvvSa3npmg6zIfc95O4H6wXuRYct3D0+nbusnESAhv7G
	 r9KJ9Gy4IxiQNdz3PFMc/+4a2HxzLPlP0kiPvuRUdX+jNIeMifqhqVec/kbKVGX9m4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HeBshIKC;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9941A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HeBshIKC
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so5130687c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794421237; x=1795026037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fOYd5ZaOeADhD4tIe7KmLNJoUGjDoAdQhQUbMCR5XZg=;
        b=HeBshIKCZ3c1YhzQ39PfZ6aMIiTWxve1gcL/S0yWtxWipXjQctQgyI1sgENUCcIon6
         5qNh5/RSVxEtuf8ru4y2TVLSy7O8bYvfwt7ZfMeEiJuNFNnIzeIGaXAsG9gIwkcCkRJ3
         WkK2bcUf33rZ3lADYtzCT/pysuWuy9U6rhURQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421237; x=1795026037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOYd5ZaOeADhD4tIe7KmLNJoUGjDoAdQhQUbMCR5XZg=;
        b=xRR82Eyvaz2ZhTIMW36KtT3k2oDU12JVYC9QKorob/BUaJ1uMV5YyNo+Lp2AuoimpV
         eW0TPDB16RCORb/d7zAuEWxaTsJ0bYXudRtA/j4c9GoKUkpUDKUuLjrb3Bu95sH61WPG
         Q6V3/vLXvhSXFaYcpwdk9mu6F11ZQKimVD6dqg/+RdWUHHSQlkE2LGqpw96/3/+sV0GH
         1lvu9As1X3gek2MRYqxAp+bXQ6X1NcGnnc+SlnY5CVwAZPemjpna0b04NWAfF15OxUr+
         c8KT8ZqEV3SPFEXW4pu604rBv4SeW1lsQUBvClhGC5mGvdDKiA0oc3y9rvqRY2q5SqqK
         pUoA==
X-Forwarded-Encrypted: i=1; AL+hErGnDJiS6VjzHnzETJhqHYLm0R2XbVF34AIgg0K93HLztmRWx7HTSmqJY2szekXtB92+Dw2GfwWdRf0J9YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i81pnFve60rYYviNxL5b9Go7iEowE/FmhCamUuczz6AE2tRDk
	Xf5cucmKOmmQgX88b1VTKAtTs9yaR4uWmBku+3VMZ9Bln4Az/YahT1Ji+JcjLj+t6w==
X-Gm-Gg: AYBFou1cn6V6nPyeev/ki2t4W/DZrYP4WXytz1yYr5bI1jEhS/4RxhnX7Y6eoY80jgA
	gSXckYqY4DTZVdSdrqgFVhQsOMoUEVdYjYwGE9E+GAY2o86rFDGvanuyuBZmK2/PFpT2RlnpHLT
	fLxTsOozq+wJsjomJ6zSehYbofrR8UuEDkK3u/f+a9Q2IXhkek5sXrxIjPufBQvPy/NjEguOxOJ
	LXM1Eybsi5MCQtVzRTx3RSeF56a3VtcAT+SvrsX+gEOpc7kTZ+xLf1stSD07UG2aeeJDJBTjTGi
	dZCrT+neJ0a22JquPy/KWNhGptPUCf+vOXfWOCFLG7SljonkKwJjYe8WnQ8Sfz+PxjY0w+GE455
	uhd09zREc5dguHKFLqukqHuUtLfUdOZG5ygu2NHfnUZC/8Vg2fXU4uZxxDfLUrqViK2ce6hrdFr
	+2frbnpKVJd+nio5j3UWTvdNpziQmjtDwLmXGiehWirMq9GB+IE+osHqUKkrNPK3L9Bfrp4InNx
	ITcLVPjSYnbPe7pwj2NBRSYdlXLYW6CPF6yM1K6MGVUDdjV5DxuUohSqZNI7BcUZc2+nUGReBOI
	vxse/fnHy5uphmZhdv3bxwIyVlWx5TjW3RvxGXtMynvFom5N94mkfjjZqGT8+aqhFjI=
X-Received: by 2002:a05:701b:2504:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b3c0346852mr2790013c88.38.1794421236627;
        Wed, 11 Nov 2026 10:20:36 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:1fca:3f2:2d78:dd60])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5b4efc2sm15239325c88.15.2026.11.11.10.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:20:35 -0800 (PST)
Date: Wed, 11 Nov 2026 10:20:34 -0800
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-pm@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v3] iio: gyro: bmg160: Discard
 pm_runtime_put_autosuspend() return values
Message-ID: <avSx8m0KegrXO8D4@google.com>
References: <20261102014830.679216-1-jic23@kernel.org>
 <auj9j3sbYa4sVoil@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auj9j3sbYa4sVoil@google.com>

Hi Jonathan,

On Mon, Nov 02, 2026 at 01:16:02PM -0800, Brian Norris wrote:
> On Mon, Nov 02, 2026 at 01:48:30AM +0000, Jonathan Cameron wrote:
> > --- a/drivers/iio/gyro/bmg160_core.c
> > +++ b/drivers/iio/gyro/bmg160_core.c

> > -	data->ev_enable_state = state;
> 
> This is an unexpected (to me) delta vs v2: you've stopped setting
> data->ev_enable_state here. I think that's a regression.
> 
> This is also one reason I think it's unwise to make so many changes
> together here. One person's "churn" (to apply several patches to similar
> code) is another person's "hard to review / easy to make mistakes".

Gentle ping on this one. I'd like to advance my
pm_runtime_put_autosuspend() series one way or another. I'm willing to
respin this one for you if you'd like, even if I'm still personally
hesitant to make so many of these changes together.

I'm also open to going back to a minimal series -- that only drops the
return codes, and inlines functions that are trivial candidates.

Your call.

Brian

> 
> > -	mutex_unlock(&data->mutex);
> > +		pm_runtime_put_autosuspend(dev);
> > +	}
> >  
> >  	return 0;
> >  }
