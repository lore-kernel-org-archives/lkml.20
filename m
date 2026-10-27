Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793059471;
	b=y7xw36677VHPvbIea4xLK5KHjCS10boMRmvNj3jTDTdZUlO3EbJ+r+hqFHQ6kWuprDid
	 yHG6uUBYLjpX8TRM+/GxulM27jFohsPdc4dUzv64IBu4j+OSKnfbFhqIWO6lKHuFrpErv
	 gvpyBvyQYVEw/eNgomf9hkIbaEWVL+aaPbMPS3zVbByGnLdGi0Lssi3lrZYU4hakj3VA9
	 AqDPsZZlK7vSYh3tFWsKbWtf+MmVmSE/CLRwM5D9spFtd16eGGX0xMbBdedt+EbpPMBW4
	 O2yNFop3UNqL0EVXGcmYU5i1pDNrrJOTBOVlKvSoh+HjPeDyWAy8QMp2PbiKHA6Liuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059471;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ZOHch2AmqXMqZdqDWn3RFjQbiJzddizdcbqQ8vsH1U=;
	b=WqFGkyQqCdtYxYb1yoVnCjK1OcL1m4IMKzcPmQLfiTtCBKkKhLdK7e/xlI8+QU0TZIKT
	 3gm6GBTx3rt76y03BE59CZHvIjpVzs2m6SK64A3MnhhbVvNtffKs0zyFvSrjBT6Vm8STq
	 NMZveXOWZiaqdP+qdqBa1R/Ltg59kg/aPPmVXc/yNPQBHzP31kVgCSUWYYixUE0Ukzhv6
	 oWlMvxATDTUgQeCtgDflRVjtxJzgfuTE4ezqkXEqayDVjzYjLynqXO4b5BI1i09PCVo/B
	 agxFid8CbTj8mOcPJn0OB1sF4A18FRMq54yI9e3TMjJsiBWPp8kGP7O9+KlVTpiyTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EL36OXiW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C8606A31B;
	Tue, 27 Oct 2026 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EL36OXiW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671E21F01825;
	Tue, 27 Oct 2026 00:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793059471;
	bh=1ZOHch2AmqXMqZdqDWn3RFjQbiJzddizdcbqQ8vsH1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EL36OXiW5AARx0AQxa6nUBL4ebsw8YX4eKxo5NQRcCoLXigVT9lpNROmMBTegjQav
	 s+aSXZKRRBo8aT55KS15R+vctCyD1s/nxmwGhTnuQ29edqGMAxsG2B8uezeQabciu8
	 AdeMznDrjzVoZPe5+ukcjc92Tck6rqzFmIPPxUB0UfxbU7Jys6v4QEX3YLyURE4svh
	 MpdpPFYwl8dZ68F/GGHlq58WmrqB9eICH9Zz2r8OGWTCfpgt8QFwvZlsC4APxRCwsG
	 a9QuIu2Z0Qxx3TMF7MEJoOWoWKcctowUiVrb37t0xTgK8OW0z/km82rWh7J6wnFgRy
	 bOuvf5WTPEOSw==
Date: Tue, 27 Oct 2026 01:04:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil
 <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <20261027010426.126d96a8@foz.lan>
In-Reply-To: <20261027005656.6ce24b82@foz.lan>
References: <20261024185058.20410953@foz.lan>
	<CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
	<at-a-2wTtf7bJQwU@kekkonen.localdomain>
	<CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
	<20261027005656.6ce24b82@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 00:56:56 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Mon, 26 Oct 2026 08:53:07 -1000
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Mon, 26 Oct 2026 at 08:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:  
> > >
> > > The patch in question puts camera sensors and related chips in line with
> > > how the rest of the drivers are selected elsewhere.    
> > 
> > .. and other places could probably be improved too, I agree.
> > 
> > But this made things *worse*. Much worse.
> > 
> > The thing is, at least hide them behind some "embedded camera options"
> > that in turn is hidden behind "EXPERT" or something like that.
> > 
> > Don't make *normal* people who build their own kernels have to see or know.
> > 
> > Let's say that you have a laptop or something that actually uses one
> > of these sensors for a webcam, then it STILL does not help to ask a
> > user
> > 
> >  "Do you want a driver for the Analog Devices ADV7170 video encoder"
> > 
> > Because (a) that chip legacy and likely not in any laptop anyway and
> > (b) even if it was, no laptop user is going to *know* that.
> > 
> > See what I'm saying? You literally make things worse. Don't do that.
> > You're making the kernel Kconfig script ask insane questions. They are
> > insane because you cannot reasonably expect people to actually know
> > the answer to the questions.
> > 
> > In other words: don't ask questions that you know the user cannot answer.
> > 
> > There was a REASON why those menus were hidden.  
> 
> I agree with Linus on that. You're basically rolling back a feature
> that simplifies a lot the life for normal users: let Kconfig choose
> options that only a media expert can answer.
> 
> Now, I understand why it is tempting to do that to help with IPU
> support: camera sensors can now be easily interchangeable on new 
> Intel hardware.
> 
> If you look on some drivers from the old days, like bttv, saa7134
> and cx88, they had similar problems, but they still do support
> autoselect mode.
> 
> For instance, drivers/media/tuners/Kconfig has this:
> 
>    config MEDIA_TUNER
>         tristate
>         depends on (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT) && I2C
>         default y
>         select MEDIA_TUNER_XC2028 if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_XC4000 if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_MT20XX if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_TDA8290 if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_TEA5761 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
>         select MEDIA_TUNER_TEA5767 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
>         select MEDIA_TUNER_SIMPLE if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
>         select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
> 
> which is meant to support the most popular I2C tuners.
> 
> In the specific case of IPU (and atomisp, once moved out of staging),
> the right solution would be to have something similar to it, e.g.
> something like:
> 
> 	config VIDEO_INTEL_IPU6
> 	select VIDEO_OV2680 if MEDIA_SUBDRV_AUTOSELECT
> 	select VIDEO_OV2685 if MEDIA_SUBDRV_AUTOSELECT
> 	...
> 	
> for each sensor that might be possible to be used there. Another
> alternative would be to do it the reverse way, e.g.:
> 	
> 	config VIDEO_OV2680
> 		default MEDIA_SUBDRV_AUTOSELECT && VIDEO_INTEL_IPU6
> 
> or, maybe even better:
> 
> 	# Make setup easier by identifying PC MC-based drivers on a single place
> 	config MEDIA_SENSOR_AUTOSELECT
> 	depends on VIDEO_INTEL_IPU6
> 	default y
> 
> 	config VIDEO_OV2680
> 	default MEDIA_SENSOR_AUTOSELECT
> 
> Placing MEDIA_SENSOR_AUTOSELECT on sensor drivers. We may need
> similar code also for other I2C drivers that could be used on IPU.

In time, the "indirect" approach of using config foo with a
default is due to drivers like this one:

	config VIDEO_OV2732
	        tristate "OmniVision OV2732 sensor support"
	        depends on OF

which requires dependencies, so we can't simply use select directly
on drivers that aren't dependent of OF (in this example).

Long term, such indirect approach usually is usually easier to
maintain.

Regards,
Mauro
