Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393318;
	b=ijtfGxYrA3dK+6Lq4MVwDEvvB+mbzh7NhWJU+w/xGRieZv9z2dUvJKuCXnmt4OeLaGYN
	 NZgl+sfEntyp2NJEEbiQaJ+TOmKWAAK9lkfp7X+JVqD1Zmlm1te25hXnB+9KwIx49Fl8C
	 1/3oAbp+AFmEUarreVShkVoTvnOF6x5rIpI/UhbBfsFjOjAd/tj4LGu+z61RaUHlZoJMv
	 caTAL+RP8KK3VruyYwi49bToV34n8/4bfB+1MMVr9dUyMx0XefGoW48V0f82UugvqyRhO
	 3dJTZk/mGRL08vDJnFR6089yMqMO1IkijVROh7emAprA4n46+iCQ/U1my3MlM06fj2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393318;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=TgQ7hXdkByCGCOliNqOdN2SjJtFki1KoO0/CiSZjdvo=;
	b=AccsYCae9yLLSxvxMXYV3az0v7ew406qhFhxu6obzokLAl7W9PBj8loXoqft/2k+U7KX
	 CAwLp/PkODgH5xA8Xr0NdMLCoFaTIemWKJICnBx5Ndrx97To2PqoFE5hNIDdjVaws1t0l
	 Mcd4pPjbpHgMW3yW6LwHtI2Gv8EDu8wwLt21Bf8AYb93bSJF9pgIAA9APFvcyzCqdotXG
	 IllqzAec/NaOIZrXAI56Veanl/f+5MuZ7FLWP1h1mgIYUTOpsc7bdR3ErC5P7sPxO2C9E
	 vPh9dRSj2QpohgmbXrbDzk6QFqiAwIOv94gJmdFjTmVobci2cyuwR6VOTmNbGAGVkCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=LP8tSlu+;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=LP8tSlu+
Message-ID: <91c28133c5e72b847f5bd8aff460747a960cdc32.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793393305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TgQ7hXdkByCGCOliNqOdN2SjJtFki1KoO0/CiSZjdvo=;
	b=LP8tSlu+IqFzoJdBkG0HhSdbw9DkXnTt3VUVX/4E4gXg5rSE4arnqfAiEFyJyavlP4ZS21
	Mj1EonUpT+Pme1bfhWegjbwooSLJUEnlbGPzMNYGcEwLcf7A94XtBwjUf4ehEynBF9X/QT
	HAfHrj8Pk/TI8R2DjslcmxiU8jgMZm8=
Subject: Re: [PATCH] sched/cputime: Don't warn when the tick period starts
 after idle exit
From: Stian Halseth <stian@itx.no>
To: Breno Leitao <leitao@debian.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Thomas
 Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 21:48:24 +0100
In-Reply-To: <auTCQauaU733PY5z@gmail.com>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
	 <20261025100202.2584654-1-stian@itx.no> <auTCQauaU733PY5z@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fBrMgaiyKksbq+afWISX"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-fBrMgaiyKksbq+afWISX
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Breno,


On Fri, 2026-10-30 at 09:14 -0700, Breno Leitao wrote:
> On Sun, Oct 25, 2026 at 11:02:02AM +0100, Stian Halseth wrote:
> > I could not hit the window in a KVM guest, but instrumented, the guest
> > showed the sched timer armed 5.9 ms after now at HZ=3D250 right after a
> > jiffies -> hpet switch, and tick stops saving a ts->last_tick more than
> > a tick ahead. The fix boots without warnings there.
>=20
> I am seeing this on my testing real hosts:
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocksource: Switched to clocksource tsc-e=
arly
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ------------[ cut here ]------------
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WARNING: kernel/sched/cputime.c:481 at
> kcpustat_dyntick_stop+0x15e/0x1d0, CPU#2: swapper/2/0=A0 [warn]

Thanks, that is the same case that Paul reported.=A0

The first idle period of a CPU right after the switch to tsc-early. Your
registers have tick_start 49844000000 (RAX/R14) and now 49843761206 (RBX), =
so
the idle exit came 239 us before the start of the first tick period, and
R12 is that difference.=A0

I don't see anything accounted wrong, and the warning is the only problem.
Thispatch drops it.

If you can confirm it goes quiet on those hosts with the patch, maybe you
could provide a Tested-By?

/Stian

--=-fBrMgaiyKksbq+afWISX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCauUCmAAKCRDoeAEuJe36
Vg3yAP9hoHhweoi138jZEHyTNu9FtmScD+EwL5HuhR8qBfxhnAD9HVE80dp4odG5
4yg54AojocAPTz/DoNg3hDDP1DDaPgo=
=UZ+1
-----END PGP SIGNATURE-----

--=-fBrMgaiyKksbq+afWISX--
