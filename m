Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122373;
	b=L0lh7cfmGgH71TH35lD+drZsg8Qdg1weyFF67VjC/gJ7nzXjJGWyivWbPGQlsaBexQ6m
	 9SZ9VOPXk5f5B0HJVOHfnpil4iEZGVcknnGg8/ckHHV/j42UUo68hIRgv1RthLal3MS7D
	 EYgelwfez/kBGouiKz2bhfCH2gdhGG+TdYILeP82rn+tc3BZ6y7hDGpArGM6HZLCcqool
	 YVgStLHquTaIegUKHu/SAW8xp1oI3kC5T3Tp2IwGmkuiWA7/xRjoe+hj5E8FNi7PapjYE
	 08rzCVbdurIJsx2Ioy1RLNUrVRFJX5RLjG/ApjfRS7pcWR3A+TIkEGWkf6jo1uJIIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
	b=DzaMN3VsMTyCgfm3hyQfSXNuhcjWrCuLV9D0QkQqN55lEfaXuT/LzU5NTwFEQpqvfass
	 irNlJTqFd2bzmC+cWMyQAEAlRW8NZg/pxl3UEH1IiFYCXNBsoxNOBlKXUPiXCRP7JUt1g
	 QXUs5cATuslHh0azfM/slTTqQdrLiUnR99NpgBg9So1TVBgd9Dgq6NIsAqUQM2Fdut7Gm
	 cUwVSHDXFt7KISZ7FbwMOGU5VHh7s59mFxZaKQDMAalTNnYGQMojZpqOnzIrSJkQyDmoI
	 bwL5G+bDsNChcun2YKx0wYOxgcXAgVGx4EP0Zh0bV8qHyXSH//VQ6o1Qn/M8vn61mhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CBB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CBB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso797795e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793122366; x=1793727166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=IERQJ8SKVi7acDhRQssNKz1tac/IbKaQ1f3zM2O6OFxp7pR62BajqEQCEG9JaHuJ0M
         nQcwhrNTXW9RxyhteLIPA9LNKH3J8QG6lRhv0OL4TUC+apZBNfnCpD+BF0HWr/VmHLKj
         QLLQFq36t5Dn2Lbi3bALdp6V6iWGR0HV+f1uumVypHlLGv2yedaXHJ1JnI/oj9ZLGnjq
         QVjST8/BTNTCaXMtA8cSAV1xFORYJbiv1UzZNmsysoTn46/NG8HHUwfmp1BBp1TrWO6S
         RsL0VSK+XetFWxWIQrF+txjov/HPcyrMrdiw0sWqufM1K3ER+n4eY4ikpmfRoDWv53YC
         TSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122366; x=1793727166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=LWiIqwo30Xc0eA2w5kqsVVdowBFb8e7YGgjod95dCUHBqJG8U/W9BXI+QD/Lmd1SCn
         eGGJiG/2wktJ9XGbgapr88LqhrqUXerL1d2ezTvhmWESg3aBpSCXeFJANxYPjqaJxrKq
         GS+dukzE/JxA3ezo6EllH9LFczetZEGL1OrPVm1EwxtWcSdH2udtYq3aic0CDP+UCUvV
         nL6uM2cV3/wi6ZUMBuUZ8Cfn0fkT0XXxgN/oz7o72KQI/VC9/3Tr9dHh7jhorvWvoa20
         L5gQELv5N6anhtb1MA3OCUSBRF4OxjCAw9VX0MWHagHJaliXV1xxmFkVrhMK5s5RtcsL
         eKHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDPVpGVvdqohhovrEeugMGf/04T0b4h+AH4OV+2VraeaNNym3Y5FGlRYbTlsUE4xp8DdMBgxDe62yxfbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3JqISy2matOKO8jCRepDeGu+zk4v53AQeqTqk1yInrvRxRzNH
	xGFHoOd+rCXTkW+zpwId4kexrw7Jd7nKFyd1HXmsmvK6VTrqyLxJ1dztRyWcmppKcm8=
X-Gm-Gg: AYBFou1k6Iz3UuNWq92FvHUkHG1Vc71qFOm/w2RljNEiApmEsmTPjBhM//70Tzsn73i
	spTnrR3IIQC9NF/CIZ4qi9UzqAo0sqeS/SDs/4FRdSdZj+OU6RGEC1u/qbQaS2ZTYOw28SX+GwT
	2nI1GTbZMybCkHdAyVsBEh+K/mse5QPIqeylUdVGif5+l+IHIWqxBb/Xjo8QQ9gMb+lWOs+0DkC
	ymE4whabE0ISSrrTbqBUw8tDv+cwyBk6s3sOz58CJI0IuFuAggVrE/Fl+DFKfgqbp5CRqKRKghB
	tiWwdJaXyMRQCAwAxSOWZdMHmyjbHwjqQMNPAle+QKX+MJv0jn83TvBn1VWlkjXOgvC+/bm4Oit
	RMyPxTuSMj7FBfM/b6NWiwEkoXGKvFcdMQF5qFySwsyW8+U+9xVjmBIm8ZIwMQ1gXENAuAFLEJ9
	mri75MhX4ijjd+NF0lGp8LJKEkj4LRjionykhukjR+n3aZexp8C2w4gtQz7fA5WWkGz6/Q8Lkvz
	UButZfe9AA4SabxVq2EIJvPFgrMDZGwxOGYiSW98u5xpYm75cMAQ2g=
X-Received: by 2002:a05:600c:4ece:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a35ac9d100mr198532065e9.7.1793122366508;
        Tue, 27 Oct 2026 10:32:46 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92b881f90sm5173585e9.11.2026.10.27.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:32:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 18:36:37 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auDhJbMOQ-qAeBBs@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auDRHk8eaYife2zH@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auDRHk8eaYife2zH@monoceros>

Hi Uwe,

On 17:32 Tue 27 Oct     , Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > Add a hardware monitoring driver to support the fan tachometer on the
> > Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
> > 
> > The RP1 PWM controller block contains specific MMIO registers that hold
> > the current fan speed in RPM. These registers are periodically updated by
> > the RP1 internal firmware based on the tachometer pulses.
> > 
> > Since the Linux PWM subsystem does not currently offer a framework for
> > exposing integrated hardware tachometer readings, this driver is
> > implemented as a standalone hwmon device. It parses the
> > 'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
> > establishes a device link to ensure proper lifecycle management, and uses
> > RP1-specific PWM functions to retrieve the RPM values.
> 
> I wonder if the tachometer readout should be a counter driver? That
> would allow this driver to not be specific to the RP1 hardware.

I suspect the counter driver won't work with userspace daemons (e.g.
fancontrol) which use hwmon as an interface.
OTOH this driver is indeed specific to the RP1 driver: the fan rpm are
read from the same registers range and hw of teh PWM controller.

Regards,
Andrea 

> 
> Best regards
> Uwe


