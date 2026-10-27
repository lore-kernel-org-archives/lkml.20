Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088099;
	b=0Q+ztbtr3A8H2OXe2l/Fa66Nqj0rtZOC13VW/yRLkkEpAp6kUBebvSKVI5UC1eEEEd0M
	 o/J1NfzwOa6QiqWFuEHeDuhZh8Jl0d7axot92jdTqn14WffvywkRGX/+npYNd/UXvi2Tv
	 1L/QUy+0h+6dhwXrTTZMZDidCVNrmU9lt5tXMPKe0o7NY7jXBhXUVAh/FeWRkun9L67aw
	 vGsrm3qTJJPWMx4RaLa7SOUkuq3BxXaLQNZ5D1RyUcKPv/Gd4vppdffUEgZKt7lhlYbtn
	 I//QWtqJiP2Om9SP6HvwwWpq2YLsl8tGbrMLoVjhHMNseJZefq75j7ltQe9lDHYSsYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088099;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X2B6wU/0TW5r/v0Xi/wCgB1SsThxqBX0ECyQ6PM2I5A=;
	b=xH2PqN+n9SvKiWsfjfyaXkSio4zv9zwAcqedSKwHhcWKHhFoV0YAXmirz3VS/rg4Z7nz
	 EQ/XbeDFXtBf2S0+DVB3md8MGC/7nGYZVXuyxvc7BYZoZBBm0i4P1wzwwbH9FwdVEWQdP
	 48yKurPkow3VaAujmPbZ9qtRiAPvX38Y2jdShy3Q87euq6bW5Ca9nWDV4McYxwZOILmAS
	 ao5c2qVmgG0b6vjbQpCA9X4Iaz0rY+8myj1Fu6QD70a8ZS5vRC+vvZsCO09A7PQFkTOUA
	 TeQOfEiYphvrwH3LUxJ51h6U2ciPDvNSNcFbyyyTApXdFBFYnQrilwEWv8n7ximW5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zvc2Nuge;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD3606A31B;
	Tue, 27 Oct 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zvc2Nuge
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527181F01825;
	Tue, 27 Oct 2026 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793088099;
	bh=X2B6wU/0TW5r/v0Xi/wCgB1SsThxqBX0ECyQ6PM2I5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zvc2NugeSG2WXdGZJh+6V+Fz7YWUVaWK3n+l43rC+hDu/ay/tiwP/NH/bQkOPeOz7
	 3aQTKm6E0E/GpgPfswZrx3DU+qyK4SDSyMBrAe/CSc64lwSmJAk53itoySkd1ewzkX
	 bPJhrtfoDBqU7ldmThH8bWQpWei/CN38v0NjCpKmIjUMGM9l4ueyMVLmFtDfqQG5C2
	 kdEWf7T6XLOD2QsvKUjIMo1+zfbTcNwKZuBOMUXCstis/pXLLwuvhDGnvHTINPJB0H
	 PFsrXZAnPjuBfE4L3BU6dplC3zS7YPM48CYXvLoIDJHGTN1C/uCwjhdD2qzqAV4G3u
	 JVB3IJttzK6SA==
Date: Tue, 27 Oct 2026 09:01:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil
 <hans@jjverkuil.nl>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <20261027090134.09b112ba@foz.lan>
In-Reply-To: <20261027073720.GD2005298@killaraus.ideasonboard.com>
References: <20261024185058.20410953@foz.lan>
	<CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
	<at-a-2wTtf7bJQwU@kekkonen.localdomain>
	<CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
	<20261027005656.6ce24b82@foz.lan>
	<20261027073720.GD2005298@killaraus.ideasonboard.com>
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

On Tue, 27 Oct 2026 09:37:20 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Tue, Oct 27, 2026 at 12:56:56AM +0100, Mauro Carvalho Chehab wrote:
> > On Mon, 26 Oct 2026 08:53:07 -1000 Linus Torvalds wrote:
> >   
> > > On Mon, 26 Oct 2026 at 08:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:  
> > > >
> > > > The patch in question puts camera sensors and related chips in line with
> > > > how the rest of the drivers are selected elsewhere.    
> > > 
> > > .. and other places could probably be improved too, I agree.
> > > 
> > > But this made things *worse*. Much worse.
> > > 
> > > The thing is, at least hide them behind some "embedded camera options"
> > > that in turn is hidden behind "EXPERT" or something like that.
> > > 
> > > Don't make *normal* people who build their own kernels have to see or know.
> > > 
> > > Let's say that you have a laptop or something that actually uses one
> > > of these sensors for a webcam, then it STILL does not help to ask a
> > > user
> > > 
> > >  "Do you want a driver for the Analog Devices ADV7170 video encoder"
> > > 
> > > Because (a) that chip legacy and likely not in any laptop anyway and
> > > (b) even if it was, no laptop user is going to *know* that.
> > > 
> > > See what I'm saying? You literally make things worse. Don't do that.
> > > You're making the kernel Kconfig script ask insane questions. They are
> > > insane because you cannot reasonably expect people to actually know
> > > the answer to the questions.
> > > 
> > > In other words: don't ask questions that you know the user cannot answer.
> > > 
> > > There was a REASON why those menus were hidden.  
> > 
> > I agree with Linus on that. You're basically rolling back a feature
> > that simplifies a lot the life for normal users: let Kconfig choose
> > options that only a media expert can answer.
> > 
> > Now, I understand why it is tempting to do that to help with IPU
> > support: camera sensors can now be easily interchangeable on new 
> > Intel hardware.
> > 
> > If you look on some drivers from the old days, like bttv, saa7134
> > and cx88, they had similar problems, but they still do support
> > autoselect mode.
> > 
> > For instance, drivers/media/tuners/Kconfig has this:
> > 
> >    config MEDIA_TUNER
> >         tristate
> >         depends on (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT) && I2C
> >         default y
> >         select MEDIA_TUNER_XC2028 if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_XC4000 if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_MT20XX if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_TDA8290 if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_TEA5761 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
> >         select MEDIA_TUNER_TEA5767 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
> >         select MEDIA_TUNER_SIMPLE if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
> >         select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT
> > 
> > which is meant to support the most popular I2C tuners.
> > 
> > In the specific case of IPU (and atomisp, once moved out of staging),
> > the right solution would be to have something similar to it, e.g.
> > something like:
> > 
> > 	config VIDEO_INTEL_IPU6
> > 	select VIDEO_OV2680 if MEDIA_SUBDRV_AUTOSELECT
> > 	select VIDEO_OV2685 if MEDIA_SUBDRV_AUTOSELECT
> > 	...
> > 	
> > for each sensor that might be possible to be used there. Another
> > alternative would be to do it the reverse way, e.g.:
> > 	
> > 	config VIDEO_OV2680
> > 		default MEDIA_SUBDRV_AUTOSELECT && VIDEO_INTEL_IPU6
> > 
> > or, maybe even better:
> > 
> > 	# Make setup easier by identifying PC MC-based drivers on a single place
> > 	config MEDIA_SENSOR_AUTOSELECT
> > 	depends on VIDEO_INTEL_IPU6
> > 	default y
> > 
> > 	config VIDEO_OV2680
> > 	default MEDIA_SENSOR_AUTOSELECT
> > 
> > Placing MEDIA_SENSOR_AUTOSELECT on sensor drivers. We may need
> > similar code also for other I2C drivers that could be used on IPU.  
> 
> You're forgetting that this affects not only Intel-based machines with
> raw sensors, but a lot of Arm laptops too. We would end up selecting a
> vast majority of sensor drivers unconditionally. 

I never got any ARM laptop on my hands but the principle is the same:
For embedded systems, it is important to control each component to
be part of the kernel, but for general computing (PCs, laptops,
workstations), it should be simple enough to not require one to be an
expert on media to be able to build its own kernel.

So yes, the same principle applies also for ARM laptops: if
MEDIA_SUBDRV_AUTOSELECT is enabled, all sensors and other I2C
components that could be needed for them to work should be build
as well.

> If we want to go that
> route, a single option to select all camera sensor drivers would be
> simpler.

Works for me, although I'm pretty sure several sensors there won't
be used on either Intel or ARM machines. I'd say that most of
sensor drivers older than the atomisp driver are probably not
shipped either on Intel or ARM, because either they have very
low resolution for those days or because they were already EOL
by the time PC/laptop hardware started being shipped with MC-based
cameras.

So I would prefer having a MEDIA_CAMERA_SUBDRV_AUTOSELECT or
MEDIA_SENSOR_AUTOSELECT Kconfig option, dependent of 
MEDIA_SUBDRV_AUTOSELECT and use it for the drivers that makes
sense.

Thanks,
Mauro
