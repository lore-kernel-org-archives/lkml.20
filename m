Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086651;
	b=rs3LeSbBFrBM85HiQwiJ2BJYKZLukbwNxPaSC+UsP8huVbAaZUhAq1eCOntcPslQ6pEC
	 G7L2BltQjm67OWS2OJVsYiur80aPyDCi2hLJDwvExjtTAuGiKlmAE1b8OHI0Usjc7ESfV
	 fA98wXNyHznev6bIFxQPDOhRDtTviUx9AOQpI+afJjrWfXEWacRjzAMeOvbaEWdsU7865
	 sWNArTsXynt4+srm/VBjPU+LN2YcSBqGAc8ds/LKDSEILwrvnM8neenjJpeV+tPAUex4W
	 kTKr9TcC+z7KYPiwCctz9laZxpJPulvtK0UnQlcIr4XSCcxlHnMnM/FVNjYeM93kYDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086651;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+29yArDCdFelsSw6+eilN/PClZkfKC+UVplJMN2Zd4E=;
	b=IqSzpOgLvjZuE1bIQ7nx7uuS4BU/6Pi9mTkwC6++xLfEAKQDF8lJkjojoOPIHSiaZ1/R
	 7tnOFSrT6wXnjpE2vhu2bawS1bqBHs18BWEQfMR2cjH+10ff+eUb+G8BRbOJ9e/NvtV/a
	 yrYzJsy/fwRkRnQ/63NZJzQTB9QCe/7Vrz3foaPTShcwjoqLhbr+v7H41sFXMHsWLVPWV
	 WELnUjXDplYdJynjtXr0bWXustuUhnl0/q4jRKhdsYvWci6uPnyAwxXYGr74Lxur9aQl4
	 V2Eqzoio04GN/teHZkOZWyHQmEi9ftDLiF5bDJht1VFKH7ZFSfT4aJ8BJVfqMm9oOSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BFD606A321;
	Tue, 27 Oct 2026 07:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082F54BB;
	Tue, 27 Oct 2026 08:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793086510;
	bh=LuZw3twwubyd1xRHjyBg1PG1GSitNssD581FJ4JnyuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mm6bHsNqAcqxPbiF/11HH6vnpPGk0M1lQo9FyVRelcQlcevCBsBiocrKBL+1ejszp
	 coGGi4RiaD1NdlqShjhn+umFUoEzPy3SiDIn1IcSa5m8bo9059HhLj0pBcXYU/HBIx
	 AqHULMr0q3giHvDcN0ZlaIFLFexyuTidRYch99sM=
Date: Tue, 27 Oct 2026 09:37:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <20261027073720.GD2005298@killaraus.ideasonboard.com>
References: <20261024185058.20410953@foz.lan>
 <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <at-a-2wTtf7bJQwU@kekkonen.localdomain>
 <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
 <20261027005656.6ce24b82@foz.lan>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027005656.6ce24b82@foz.lan>

On Tue, Oct 27, 2026 at 12:56:56AM +0100, Mauro Carvalho Chehab wrote:
> On Mon, 26 Oct 2026 08:53:07 -1000 Linus Torvalds wrote:
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

You're forgetting that this affects not only Intel-based machines with
raw sensors, but a lot of Arm laptops too. We would end up selecting a
vast majority of sensor drivers unconditionally. If we want to go that
route, a single option to select all camera sensor drivers would be
simpler.

-- 
Regards,

Laurent Pinchart
