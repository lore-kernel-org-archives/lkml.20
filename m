Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433800;
	b=OE8vWCCOaT00+FoGF+Y5mE91JiQ6mxz0rn7gDgBmV+K/WRdyOqKE4Lj6yynzb6aDstYJ
	 bH6y77deU1DaDFx1+13zy2TgQg8OO1V3faxdNzty0A6ecA2tpyQuR3lh2LlJdy52mt0hp
	 6WNu0zaB56vsUscETjwoBzLBApES74RIZqtSxxE6Jx1nBoAln3skB9hzBvSrA5OFQxfj1
	 btrXbLB2fNA4xiqtclTftchbdFvwG7Gt4c9rD4p3vskG5Qy4nWlOjxkP4vihB6XcHmIre
	 Mk+k8wYdMvifhd5t3KhrwFHmDPU2kt+HG+DjTe5b4B3Bbt8xcH5EuBIw0EcXNgySARw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433800;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version;
	bh=QLnwO4MoI59YlE37UQUX4GKT7rytytrJhxJMWuOktUg=;
	b=ekJ7nMmXM+qe29TmTK2jPz5pn6uXBWJam/1O4J1DLQ5/Dy5+uybGkbc6SyllOfUYMjc6
	 SPb83UFvbR/9hpEyzBAvFaLDY5dalU81mSRaKIkdy/5k6H+j3xpFJQlBwfLTguVrocoDg
	 Yro9E5Om05Vmx8vkCNepdqAZtyZ+7cPWwNJkA66w6nyLLOn4MWI0i5x5JVA877S2PX6QT
	 GEST1wlOITSELQLH9Dj4Lho7CWBmt/R3kGFC5eCGQ5ENr8jzxqAfuHLfknvgjUczKSz/C
	 hADMcGfG/6qaP9o1vH/+GvJogT4TRfn/j6b4R8vjDjuD/FkEg/yJKL6Gn57QLxyZzyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=nKPnzg7B;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=nKPnzg7B
Message-ID: <1350c2fef9f74d5654041c99d255a22885fa0ec2.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1793433797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QLnwO4MoI59YlE37UQUX4GKT7rytytrJhxJMWuOktUg=;
	b=nKPnzg7BOMzneDUHbMuVa42BY98BJWwutATII86dZx6miAq6AkI3skq5e+otvw+25pHDA5
	tAjkBvkeNBTqjFWRQn1ukIPP+BInJw5xJGUvifWU9PAXAYHAZnA/ia0XU2WhDywvEowCTz
	wmsiPt9jsI/FTnWxPfEhiB2//UjzlHA=
Subject: Re: [GIT PULL] Scheduler updates for v7.4
From: Stian Halseth <stian@itx.no>
To: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar
 <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Frederic
 Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Date: Sat, 31 Oct 2026 09:03:16 +0100
In-Reply-To: <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
References: <atSiuBt4n03_iQNW@gmail.com>
	 <CAHk-=winC2u2D1FAX5grfq9F=bxmARxhuiQ4MvHAiJFu3iF6gw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7E7bYzTu4AkGLWJ8NNDW"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-7E7bYzTu4AkGLWJ8NNDW
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, 2026-10-30 at 14:05 -1000, Linus Torvalds wrote:
> On Sun, 18 Oct 2026 at 00:43, Ingo Molnar <mingo@kernel.org> wrote:
> >=20
> > Please pull the latest sched/core Git tree from:
> >=20
> > =A0=A0 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-=
core-
> > 2026-10-18
>=20
> So this seems to trigger for me on my laptop. Not every boot, but I've
> seen it at least twice now:
>=20
> > Stian Halseth (1):
> > =A0=A0=A0=A0=A0 sched/cputime: Don't account idle time twice after dynt=
ick-idle
>=20
> where the new WARN_ON_ONCE() triggers at boot, resulting in a splat like
> this
>=20

Sorry about that. Paul Menzel and Breno Leitao hit the same.=A0
Nothing is accounted wrong, the warning is just wrong, and the fix Thorsten
linked drops it:

https://lore.kernel.org/all/20261025100202.2584654-1-stian@itx.no/

Since this is getting more attention, I'll send a v2 with a better commit
message and the reports added.

/Stian

--=-7E7bYzTu4AkGLWJ8NNDW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCauWgxAAKCRDoeAEuJe36
VgJxAQDoAmTMd/21lVgHkbsuu+/bgTUcKMruHRzJ5SrjlP3SzgD8CcGN79lZnZwb
/HdfJQhM5K5+Iggz7O1bxyJ4mbLvNwc=
=uEQr
-----END PGP SIGNATURE-----

--=-7E7bYzTu4AkGLWJ8NNDW--
