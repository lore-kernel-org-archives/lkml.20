Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EFA1E5018
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263320; cv=none; b=jCptaKazTWLwNvXmoN3uDJhcyJriG5/tUd4+fgsrjcdZBD9gAimHDdzgVMWaB+RRaB/gHIp9d3ZhJ+cryhhtQ01G7eDyqiGELo0NsB1Zv5oO2uG89j1y/v8uB7FHDqq3HqKbGE+aNAMGDx3ml7MVQinr10/4ada97lM6K6yYhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263320; c=relaxed/simple;
	bh=Db83873sN3SXgiHC0h9NYbSzB6Bu6ea93IS7nKpR7q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbTXgdSty7DYvFHPmrgOf+xIitznAuYAyIilLOr6iRkU4NwPn81JswDQJy+Bl7APyl95bjatUcmwqbr0RhbjLePc2Jx4xfRZpbahjP/BQ0FlkWTO8lilI2/MdYQ0cn97lAqswv3Wr963B/9hk+4hxPkRuM/QV2fuKajSRQXj8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pzd6slRG; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pzd6slRG"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-857ff9fef54so17061627b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263318; x=1789868118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SghHtqWEl3yUniEKr5HgjMzb/SeKVcYU3LbBYVGh0EA=;
        b=Pzd6slRGjYMOdywhbkAOA2dUKpt+LsZfNt/LS8TuKS9+Hup/Rye/UEJ+jOAyiWoX2H
         8udSO0XigokQZF6h/NcrAZNsaJ9eiIngAOCWVAyh+YWso6ydXmojKSqdilOuCyx1Q07k
         9lgN5UzkYnoNxkI9D5K+prWnp7PxC7vrKmOfXc8Tm1dOK02Kw61OdPDx7Zj5S3eIGVww
         CSFrsIk6NvBIjhYiIEnwPoZRbjG1h0IJy0menVwVcjWOSU9L1gluj4WnFwyQvophVPnx
         pTaSHX9z09dQTfXf/iKSCbVXBVqMTdPMRpe1c4V713JjIsxXFGxzKk7DSNVYSUziDIdB
         Qevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263318; x=1789868118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SghHtqWEl3yUniEKr5HgjMzb/SeKVcYU3LbBYVGh0EA=;
        b=HLN6BDHH5ouOnsM+dsPVULLVxMvv4g4r0qwn2u6Yvng4Ly8CdRlwwqZM1LIT9c/Fuo
         Jq718Zn9oHIceMQNYgm0j8gvKxgfALZbjOmQWeq0g1UXOW0oWkIqUkWRt+my4aOlLRss
         NqRxsm7jcpf3djzg2WWJkUR46Jk7hfs0Dwvk3qkQATr/EuMQsGePZeADD1rPtfZ36jtG
         tSP7bBrziC9pVThceAzO5b1XP+nVie4LDqFzzQdO3+3nX11TtO/3JXsIbA9Nm+uLKW+t
         hVJ0iNtQRw8vDveOyE6JHZZw8zvh1WGSFqfCl9gHUezDPM1nk/UKpCBM12Z24SJZ/qqu
         gacQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCcnM3tJ7qJf+7LnF28hIcbEc22XkdiYk/uPsEhtpeClPeFXWy0EWiZFR4X3ZhYOYYIyT3L30BuTt/JdE=@vger.kernel.org
X-Gm-Message-State: AFuF++ll0QdCYKzBxHZ168cfssCOiqJvjN2Rb9BEjejA3vY3B/WJztpV
	9hWUX52tLHzQ9rGZv6GXnwgBmxdzHWXPtn587zeyHJ7VcOgs21msjxlv
X-Gm-Gg: AYBFou3qaeFD/c3bmUHPFGK0qCE0XlzIhovZ80+819282Ax1ndEYv2fuNIb9x2lWTIC
	mx+qSyAbF2cQNtTm6bwMpk0Shygah7qusU/LjxoIwcCTRaE52z1RztJPSpG+u+d8sJLGwu7UKmC
	x3C+Fp0lZ1KGQ6zkBQDyqXDNdHBEYdGJUDncoar69yHrraGi5+UNS4k/MDFT8131ndEF6mzigTt
	sV3/ywvm5kBI+YBAlJry8N21o0dCvMfvOVpS8pL+3SdQRymKcI8/H+vF3yYPFfY9/Fxgx/38LBa
	uNMgwU7NBcgqJ5hxEsUA/A4VfCnRHa13om09TCAwM5/qnkWPrq7SZ5LiJ8I0hvShmsw04nQUqjz
	UqS/h7Tb3i0fqe/vhUT2w5UOde+X5IBdzbRSQ9TzuktBLfy67cKedIRnDFs086qqBcTzfSmGR0E
	h5zqhsfU+EmrCK4PdNfNFFBrIanxGyQg8L8sqKROpazNjOZYaRZdpwQA==
X-Received: by 2002:a05:690e:1518:b0:671:16e9:6a5 with SMTP id 956f58d0204a3-671245bc479mr2857955d50.26.1789263318274;
        Sat, 12 Sep 2026 18:35:18 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df3180sm2857982d50.7.2026.09.12.18.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 18:35:17 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:14 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: light: add as7343
Message-ID: <aqX90oniPRdsu5jp@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-2-marcus.yu.56@gmail.com>
 <20260913015652.029475d2@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913015652.029475d2@jic23-hlaptop>

Hi Jonathan,

A quick comment inline.

On Sun, Sep 13, 2026 at 01:56:52AM +0100, Jonathan Cameron wrote:
> On Fri, 11 Sep 2026 18:39:11 -0700
> Chang Yu <marcus.yu.56@gmail.com> wrote:
> 
> > +    description:
> > +      The driver current for the external LED connected to the LDR pin.
> > +    minimum: 4000
> > +    maximum: 258000
> > +    multipleOf: 2000
> > +    default: 12000
> > +
> > +  sync-gpios:
> > +    description: |
> > +      Optional GPIO pin that can be used either as a synchronization input to
> > +      start/stop measurement or as an external start/stop signal for
> > +      synchronizing with the connected LED.
> 
> So the datasheet starts referring to using this for some level of sync
> but then only actually treats it as as a gpio (maybe I'm missing something).
> Any idea what that stuff about start/stop is talking about?
> 
> The only thing I can find about this is the device diagram in figure 13 that has the GPIO
> wired to the led driver and the automatic measurement engine.
> 
That's what I got from the datasheet as well. They don't describe how to
use the GPIO pin to perform synchronizations at all.

The adafruit arduino driver
(https://github.com/adafruit/Adafruit_AS7343/blob/main/Adafruit_AS7343.cpp)
is slightly more helpful - the GPIO in output mode signals when the
spectral measurement starts. Unfortunately no information about input
mode.

> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-supply
> > +
> > +additionalProperties: false
> 
> 
