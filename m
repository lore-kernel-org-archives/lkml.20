Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3246AA80;
	Mon, 14 Sep 2026 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390587; cv=none; b=iGgvaL9Wz7h/3f3OiEKK1CEkr6PSYHP/BbMdia0yVj2hNRg4OX0T/Vo64JdDHoIO4lsItf5iMMsUNCZGH3fsw4mnGDDCQ7GE0ems+bPoEJsA2tmGxndYU70oK18j0rKXPcptCz6A8TZvKzUZZzPJz3ooerdytnXvn5EuzKKfZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390587; c=relaxed/simple;
	bh=LtG6Z0UcKIE+I7QFa4TbKDRJH9Pd+VynmqlW6aEZDIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELg7flMjzan50nCRnQbXpQKsmThaD4wARmajk5RFmio/GEt9ZOcq8eF/qZTma3qUjP4Mqg0ESCTV84ikPfU197KMALy5GXmu3VxKNcCFcMLgxrvHJSYQjB2SsJr3xkyn3IxsPH3UR7hTlAoVtuebITQHBanoJVP7dQ31rhz8PWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt8hIwbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt8hIwbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60931F000FF;
	Mon, 14 Sep 2026 12:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789390585;
	bh=y2hnxf2Keo0PBOeAUaEZlu8CdfyWCrVmr9eIS7X4hYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wt8hIwbSZus+fvs8CtHzY7u8+16zlmJ2Oj62kQykSFjqiiYwtLng3EQJBmO0D+gR0
	 JhxnSPLOOVHR8h4p/kjK1E6A5EkPm34ySsAmka2nksNin1AA7tR8qPzGlsWUGJK1bt
	 xf9snNxZZiP2FlnEXJv6ZoZcO2tZVcg4Kkk37aazt/yzm9Zi53GsKGDVfSiqRjBhb3
	 PkhI/M+PABgd0mCFtLgnez2X6hmIv5cxODVHTuoJSTqy2nyACtGqGvByZbEw0NO10g
	 4hhtCgBi+R0uZHTMf4OAAdOP2j+mf/8+wro5die7C4AYW1ygb1PLab5xOO5xA/m4nT
	 XdqGPnCKeCh7w==
Date: Mon, 14 Sep 2026 14:56:21 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqfsMbQWdqq_TG_b@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vbxhj5n7tlefdqq5"
Content-Disposition: inline
In-Reply-To: <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>


--vbxhj5n7tlefdqq5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqfsMbQWdqq_TG_b@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
 <aqXOgqne-v4GtglY@devuan>
 <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>
MIME-Version: 1.0
In-Reply-To: <DLDZ6A0QS5NY.E0Y1TPNME1IN@memeware.net>

Hi astian,

> Date: 2026-09-13 06:29:43+0000
> From: astian <astian@memeware.net>
>
> On 13 Sep 2026 00:24 +0200, Alejandro Colomar wrote:
> >> Date: 2026-09-12 22:00:57+0000
> >> From: astian <astian@memeware.net>
> >>
> >> ioperm(2) says:
> >>
> >>   int ioperm(unsigned long from, unsigned long num, int turn_on);
> >>
> >>   ioperm() sets the port access permission bits for the calling thread
> >>   for num bits starting from port address from.  If turn_on is nonzero,
> >>   then permission for the specified bits is enabled; otherwise it is
> >>   disabled. [...]
> >>
> >> The use of "bits" here is confusing/sloppy.
> >>
> >> ioperm is supposed to enable or disable permission to access IO ports
> >> for the calling thread.  In this API, the "permission bit" (singular) =
is
> >> really "turn_on": 0 to disable access, non-zero to enable.  However th=
is
> >> description refers also "num bits starting from port address from" and
> >> "the specified bits".  That seems to suggest that IO ports somehow ref=
er
> >> to "bits" and this API controls access permission to them, which is
> >> bewildering.
> >>
> >> Searching around I have seen that other versions of this manpage used =
to
> >> say "bytes" instead of "bits", which is only slightly less bewildering.
> >> Ports/addresses in the IO space refer neither to bits nor to bytes per
> >> se, they are an abstract interface, like a syscall number/index.
> >> (Architecturally, in some cases, these indices may in fact map to
> >> processor registers which may in fact be portions of a contiguous
> >> internal memory, so in some cases one could correctly say that the por=
ts
> >> refer to "bytes" in such memory, but this is obviously all very
> >> low-level and microarchitecture-specific.  I think being aware of such
> >> details actually makes this description more confusing.)
> >>
> >> Apparently the reason for this confusing description is that for Linux
> >> ioperm is a syscall and the kernel implements this syscall using a
> >> bitmap with 1 bit (permitted/denied) for each port, in a contiguous
> >> sequence.  See ksys_ioperm in "arch/x86/kernel/ioport.c".
> >>
> >> Thus "num bits starting from port address from" actually refers to the
> >> bits of that bitmap: the bits [from, from+num) are set according to
> >> turn_on.
> >>
> >> This kind of implicit reference to implementation details is wicked.
>=20
> To complete the picture: this is not a mere Linux-specific
> implementation detail.  At least for x86 (IA-32) it is inherited from
> the processor architecture: the port permission bitmap is linked from
> the structure pointed to by the "Task State Segment" (TSS) and checked
> by the processor.
>=20
> It is still an implicit reference to an implementation detail.  I think
> not mentioning this bits-and-bitmaps business is better but
> alternatively the reference should be made explicit and the kernel
> bitmap should be mentioned (and for x86 perhaps also the TSS).
>=20
> >> Suggested change:
> >>
> >>   ioperm() sets the calling thread's access permission for num ports
> >>   starting from port address from.  If turn_on is nonzero, then
> >>   permission for the specified ports is enabled; otherwise it is
> >>   disabled. [...]
> >
> > Hmmm, sounds reasonable.  Do you want to send a patch?  Or should
> > I write it?  (I don't mind; just asking in case you want to do it.)
> >
> >> PS: Oh, also, maybe the title should say "set input/output port
> >> permissions" instead of "set port input/output permissions".
> >
> > Same here.
>=20
> Sorry, I've never written *roff before

I've never written roff(7) myself, but luckily, man(7) is much simpler
than roff(7).

> and I don't think I want to spend
> my time learning that... although, I might be able do this by just
> blindly replacing words without touching the escapes...

Indeed, that's how I learnt man(7).  Replacing words blindly is quite
easier than it seems.  I was also scared the first time I wanted to fix
a bug in a manual page, but I found it was easier than I thought.

> Which bring up the question, why not moving to a less hairy source
> format?

This question comes up every now and then.  TL;DR: other formats are
worse.

man(7) is pretty simple, and easy to learn exactly by editing words
blindly.  There are very few macros, and their behavior is trivial once
you use them a few times.

One thing that is very important is that we use semantic newlines.
That discards .md and .rst, since they are meant to be written with
paragraphs as they'd be read by humans.  mdoc(7) is more complex than
man(7), and thus we don't want that.  There are other formats, also
inappropriate, for the same or other reasons.

A summary that will serve for 95%+ of the text written in manual pages:

		.SH section heading
		.SS sub section
		.B bold
		.I italics

	Alternating per word (spaces removed):
		.BI bold italics
		.IB italics bold
		.BR bold roman
		.RB roman bold
		.IR italics roman
		.RI roman italics
	(roman means normal)

	paragraph separator:
		.P
	Indented paragraph:
		.IP
	Tagged paragraph:
		.TP
		tag

	Examples:
		.EX
		this is an example (monospace, no fill)
		.EE

> > BTW, the manual page also says:
> >
> >      This  call  is  mostly for the i386 architecture.  On many
> >      other architectures it does not exist or will  always  re=E2=80=90
> >      turn an error.
> >
> > Is this still true?
> >
> > Another issue:
> >
> >      EIO    (on PowerPC) This call is not supported.
> >
> > Is this really true?  Where this is not supported, I expect ENOSYS.
>=20
> I'll let others answer these.
>=20
> > And yet another thing: should we document the parameters as being
> > uintptr_t instead of unsigned long?  They are the same exact type
> > always, AFAIK.  Or is there any system where they aren't?  If they are
> > the same, uintptr_t will better document that they are addresses.
>=20
> I suppose it depends on the architecture, but for x86 these are actually
> supposed to be 16-bit integers.  I guess they are longs for generality
> within syscall ABI constraints.

Ahh, sorry, it's a port address, not an address.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--vbxhj5n7tlefdqq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqn7vAACgkQ64mZXMKQ
wqkqXA/+IcRbYcOtQfjxsR6QrD0SEv7pNyCuMfw07iJdncuTvuEtdMdhjuUkiH4y
Tw/O08i+n3iP4N/S60rKj8w6Yl8r/4NAP88GKWLXiShrFDnyKjjMQfYu//tbM77C
nu88yWPGFvMm70KCTFmCSeL5j/lNvKRxzP7C5w0FJ1cozqc+e4+Za4DyM6PQcb/g
+4nD9U5+9Eajg6roKt1Qk8Q0cJGXWBkQKGAKlfyvyN+peGWe/A2Efw1bvTnB8lEN
kFhCuhkESxF/WInIfo+D6EE6DfdX/sqZM/FtEcSafu2DAiwmDWgoxA2DCjsAntTE
IjqBi430C309vGFzGq6XeZX69Y642hu0sAHQKbHr5yhzERJwvVTUFyB6vRlEggMX
VaTgyGGk+jk5mf45Ajlu+isRsYaqZDVDOctbYfQeRFGLS8/OUu+piNnHQdspQkj5
tH/JWB43TMuhYw6PBTZ6hT0oxHvJ5Yvbu9Z5vGmlZWBZUCbg5llnOr/+2h89bmQO
UIDBuR+YOwaEHnBFmiWzuBaGdRNWGuKlHY3bbnUGT0YssG+WEiluAHigIqCn2RNz
1/I0Kn3tPodco+1+jRGd7vOUmpHwndRmodqQ2Cgz+iwwzWLVwCz8zd7KPBg4uYs3
9eJcCsHzDoFRQdCFAzOX33ktbbu4HW7nk77LibZgrdHTSNty3BE=
=y9zE
-----END PGP SIGNATURE-----

--vbxhj5n7tlefdqq5--
