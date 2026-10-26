Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793059022;
	b=ki3AIoOSAxk7yq8IDgiyfwgq0FhhGhcZQTewzVOIBw6FEtOwsWCpRjkBZ6koqOYICpl2
	 y/IN3WIX4GU7Ef2L6cjfVB5plVOdcxAve+nc3yWWLTtoJ2s2Pm+z0fx/DuqBKiN/Tka6C
	 in9CJRHUHtDdjcul83IOVIGkirtutjtCWdriVGnK3SILyoqrsfsUEddPfJ7cMUTq2ByKU
	 TPJ2Yon0OG3o7BZSiI9p3Xjw2qBXdPMmhEquTRuhv6gjPlP2FonMSohmFuACoGtKKb5u6
	 yfSVojPj3pB/kUGNlzI8MPSEmUOFNCE8zvnLXi7ohO87BqoMeh5aIgxDp/GNFQcxoNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059022;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cU1a69wB5Ljq9e5VBmksBf9LYbZhe9MdXGIUPBs8Ui8=;
	b=tJeDMxXZIGsHCA2bEWR3stO7TTNbIdgvqxgts+hQB5ptKVQ1vicnk+N8si/FmUK8JDw1
	 69wfbTXtS/Vm7iviI6JLQBeOYTExUDJy/WtE7NiKqeR3DmACj1Eyidvcl+0jeNKlwyrlp
	 jmP7bqXh6UOFQedJrgccXPA/Wyv37jl7S3l9n8mA+Q7ZsvgUiO24tRUr2xfg7qCaPLMcT
	 QjXXWokwfe7M/Tk5qcPYQyZndIYoVfQ/hRLy5WDvn2Xsykp1MxOIDFko0kiY98+oArcrb
	 Q6i8XCragQmalqQbiqpIJaDI332vDaymR8Afnp3GhXt20QH2oBQFgoM5kzo+oBDI6Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YuHN1UD9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAECD606A31A;
	Mon, 26 Oct 2026 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YuHN1UD9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60241F01825;
	Mon, 26 Oct 2026 23:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793059021;
	bh=cU1a69wB5Ljq9e5VBmksBf9LYbZhe9MdXGIUPBs8Ui8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YuHN1UD9+UwmzScWhzArb8inBM6srGncP6zy2cm10/JNSNKNQVCSPI9aat64Ejtdt
	 QX1zK/kRo4b8MaBXCG/uKSYZnUqn72FFYyi2yD+vLzlmzb72kbgCAVHl2IWcGyH+75
	 BlIezlRx4+T8N/7tP0IF7aO7e5aRKe4OH5yyTBYsL5aFKuM6TSbTdtQPvnuMWQc6gs
	 2zCIdZMAi9JyFUO66IG6ckC35mrstRpu0QZPzulnPDm89MQjL6vNy5WN4JNYvBCfYv
	 kcDI5z1JFXAvO54YIzvCa9W079oGcjYSnYjqsA2DCdw2nOt8E3Grn/t341akfKNDcL
	 xfVjq0Q8TTQrg==
Date: Tue, 27 Oct 2026 00:56:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil
 <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <20261027005656.6ce24b82@foz.lan>
In-Reply-To: <CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
References: <20261024185058.20410953@foz.lan>
	<CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
	<at-a-2wTtf7bJQwU@kekkonen.localdomain>
	<CAHk-=wiVxA+1x-eNCp3-e4=emCKXUw9HnSg-ng5A_Ndf6-3mxA@mail.gmail.com>
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

On Mon, 26 Oct 2026 08:53:07 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 26 Oct 2026 at 08:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > The patch in question puts camera sensors and related chips in line with
> > how the rest of the drivers are selected elsewhere.  
> 
> .. and other places could probably be improved too, I agree.
> 
> But this made things *worse*. Much worse.
> 
> The thing is, at least hide them behind some "embedded camera options"
> that in turn is hidden behind "EXPERT" or something like that.
> 
> Don't make *normal* people who build their own kernels have to see or know.
> 
> Let's say that you have a laptop or something that actually uses one
> of these sensors for a webcam, then it STILL does not help to ask a
> user
> 
>  "Do you want a driver for the Analog Devices ADV7170 video encoder"
> 
> Because (a) that chip legacy and likely not in any laptop anyway and
> (b) even if it was, no laptop user is going to *know* that.
> 
> See what I'm saying? You literally make things worse. Don't do that.
> You're making the kernel Kconfig script ask insane questions. They are
> insane because you cannot reasonably expect people to actually know
> the answer to the questions.
> 
> In other words: don't ask questions that you know the user cannot answer.
> 
> There was a REASON why those menus were hidden.

I agree with Linus on that. You're basically rolling back a feature
that simplifies a lot the life for normal users: let Kconfig choose
options that only a media expert can answer.

Now, I understand why it is tempting to do that to help with IPU
support: camera sensors can now be easily interchangeable on new 
Intel hardware.

If you look on some drivers from the old days, like bttv, saa7134
and cx88, they had similar problems, but they still do support
autoselect mode.

For instance, drivers/media/tuners/Kconfig has this:

   config MEDIA_TUNER
        tristate
        depends on (MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT) && I2C
        default y
        select MEDIA_TUNER_XC2028 if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_XC4000 if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_MT20XX if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_TDA8290 if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_TEA5761 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
        select MEDIA_TUNER_TEA5767 if MEDIA_SUBDRV_AUTOSELECT && MEDIA_RADIO_SUPPORT
        select MEDIA_TUNER_SIMPLE if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_TDA9887 if MEDIA_SUBDRV_AUTOSELECT
        select MEDIA_TUNER_MC44S803 if MEDIA_SUBDRV_AUTOSELECT

which is meant to support the most popular I2C tuners.

In the specific case of IPU (and atomisp, once moved out of staging),
the right solution would be to have something similar to it, e.g.
something like:

	config VIDEO_INTEL_IPU6
	select VIDEO_OV2680 if MEDIA_SUBDRV_AUTOSELECT
	select VIDEO_OV2685 if MEDIA_SUBDRV_AUTOSELECT
	...
	
for each sensor that might be possible to be used there. Another
alternative would be to do it the reverse way, e.g.:
	
	config VIDEO_OV2680
		default MEDIA_SUBDRV_AUTOSELECT && VIDEO_INTEL_IPU6

or, maybe even better:

	# Make setup easier by identifying PC MC-based drivers on a single place
	config MEDIA_SENSOR_AUTOSELECT
	depends on VIDEO_INTEL_IPU6
	default y

	config VIDEO_OV2680
	default MEDIA_SENSOR_AUTOSELECT

Placing MEDIA_SENSOR_AUTOSELECT on sensor drivers. We may need
similar code also for other I2C drivers that could be used on IPU.

Thanks,
Mauro
