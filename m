Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180175;
	b=vuq6wkwkf65vEtCCpYWI1lBy4iElJ2lLj7tZrC2/LO5ak5px1OI0po1dkoyC9U998Uc+
	 mpMI3uJKio/0WLoNHO05lbdpxjzGvpwj58G660LThpGv73tzeNZk0Rg76RXf6oj45GBrW
	 AMzSeQAVYGZatUrYCwpjkF4FBZhuqTJOIcZdyYIE6N7IKJQbNI3mTuDrj90Neo6hk9GFn
	 WGTVqkmgANmqTWhfGkkW0IJkxz3puUREO1eEe/i3gF20JFgFtF25oKTMlsnUmnK/66Zg8
	 uPpknY/L3O7/BW397qsTko+QHsoQp94ZQG/0mdU8rynQcxXBwml8iHhA4Ei7PkzSklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180175;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MQQcfGC2Ilc1OespVBhWEoaBQ+gETSQ+qh9Dq7aOk9c=;
	b=Fg5CRQEuGSL24KddoybwARIJLhJCPywO5uthQF/4ItDJQ+GaOxeGxXSV9meVxYlwBTIO
	 A1qRXvcNWWDsVpKaFNV2zjWM0VfBkBMQond29Dx4RsJWuF56PJqHvCgPYVyazhytipqfn
	 vvxFPYC3mNvgG8GVb2h7J5q5a7ACj0Y86OegHEKs/wLz2o4J8BazJJSiHFg2aaFrX5WU7
	 T5SfstiKr16ZnzDqC4ONqm9IzdiJxyfpxIOAKOwcjK+GN8IeCBMFEWclY2ynGwusJLnBc
	 knHDLjVE1ILNlLB8NWC5C5AigKqs2V8i22btYQtk7Wu0bMPl2rZtmzVjlsaYHbSwO+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCY3HloE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39314606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCY3HloE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037BF1F0089F;
	Sun,  8 Nov 2026 23:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180175;
	bh=MQQcfGC2Ilc1OespVBhWEoaBQ+gETSQ+qh9Dq7aOk9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCY3HloETMR2yXdlnOtAUJMolpXg11mKKpg+3w3g21Nfob53ThwiQz7kebC8/FXTi
	 8jdWEEjgLrYQnyCiSiBwWmnlWKn5G5n6IqomnFRQlW/JrDREh0rkCGndsWFhbULIDN
	 ir+/MZxl4edQ6Omh81NdGovT2V60pVP4IvEtXslbmc0xfNjYmVzwUkFDPjlP5PpdN6
	 5ORqo8ex569GG1RLi8f/ytR8PgN0q6nTI1iUSy5Ixsg2J31tHxZkar10LbaK2/l7rm
	 kE3/HBqlKpIlKRLjYW5B3VJyW1UZGxpq5KJAaulF8ROGxNgoxf3RnrRINFYk53F46U
	 KoMT2d6wVRENg==
Date: Mon, 9 Nov 2026 00:22:51 +0100
From: Thorsten Blum <blum@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] m68k: amiga: Use clamp() in amiga_mksound()
Message-ID: <avEES-c4bUBUFtUf@kernel.org>
References: <20261108134501.404852-3-blum@kernel.org>
 <20261108134501.404852-4-blum@kernel.org>
 <20261108225848.2b643170@pumpkin>
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
In-Reply-To: <20261108225848.2b643170@pumpkin>

On Sun, Nov 08, 2026 at 10:58:48PM +0000, David Laight wrote:
> On Sun,  8 Nov 2026 14:45:01 +0100
> Thorsten Blum <blum@kernel.org> wrote:
> 
> > Replace the open-coded period bounds checks with clamp() and remove the
> > redundant comment.
> > 
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  arch/m68k/amiga/amisound.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
> > index 5ae1f017b39b..5b9d265b2cac 100644
> > --- a/arch/m68k/amiga/amisound.c
> > +++ b/arch/m68k/amiga/amisound.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/timer.h>
> >  #include <linux/init.h>
> >  #include <linux/string.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  
> >  #include <asm/amigahw.h>
> > @@ -81,17 +82,10 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
> >  	timer_delete(&sound_timer);
> >  
> >  	if (hz > 20 && hz < 32767) {
> > -		unsigned long period = (clock_constant / hz);
> > -
> > -		if (period < amiga_audio_min_period)
> > -			period = amiga_audio_min_period;
> > -		if (period > MAX_PERIOD)
> > -			period = MAX_PERIOD;
> > -
> > -		/* setup pointer to data, period, length and volume */
> >  		custom.aud[2].audlc = snd_data;
> >  		custom.aud[2].audlen = sizeof(sine_data)/2;
> > -		custom.aud[2].audper = (unsigned short)period;
> > +		custom.aud[2].audper = clamp(clock_constant / hz,
> > +					     amiga_audio_min_period, MAX_PERIOD);
> 
> That requires that amiga_audio_min_period be less than MAX_PERIOD.

amiga_audio_min_period is an unsigned short and can't exceed MAX_PERIOD,
which is defined as 65535.
