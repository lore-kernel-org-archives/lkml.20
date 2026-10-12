Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B94C2241
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826738; cv=none; b=WflLcyT5BXcP0JFABoougR/f7GGaqjjwKrutW55FPS8TWhUXn/baqNo1nmsS/APpsS9NywQh1nvXmScwTb3LDf1KJTFt/NYUknHZ4N4KzSXw+gUrhO17DQjJYemy9otcO0fwNRYI1FyFLHWAf+ydAqnOAtRZVPd/SXBn1d7KmRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826738; c=relaxed/simple;
	bh=bh2gxKmg0564Np81zrJybwevL4dlQ367ebvdSPrYnvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJHQIhbdzgSlDfYyntvHj1NB/OHq8MMcImQHMAYouWo4ozNdcPW40RdUQFhiZoc050+cHIaIAplPc4z/teMIb7EPFv2TUosLvh+R3LQ3V1+NOpqhINnTx+pkGXWLRzm+CIqWokEAbKCBbTlFULfDhdMjFHZDHj5pxT0C+HlazbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVPt5Wmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVPt5Wmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833D21F0089B;
	Mon, 12 Oct 2026 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791826736;
	bh=9a0lqRgEV3VWI3nhJ68+nybh7tySm5osOLiElxFQrAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eVPt5Wmpn16124nzbML1pGOvnwHC5tffbPcJ9JqlpzszxBysHgdH3D7uqBruSK/lj
	 V/9Mwux/f1QKXoI0Pu2ic8Y5a26HR6XO1FdTKCrPTiW3w2+E3Dy/CgrDVVqzhEgv6f
	 Pe8xb5Al5Uw70cvErtfGyx5AuFMTuI8Uv7OTJow+wnRrhZgimzviZOXE5uyJJnxbpN
	 l7wzgH97Ze/Gzg6u2poXSE0nbkBGyeV+bRMZISk9JBsIdJ0vGZ5TfXC/SFzKe9A5Mh
	 hkeB2qR+EDrXI8w7zK8CNqtxtzKxi/JBORSplBs84ghOYHFzWuaxVuTLdQHVGOvIZv
	 T6PeA1eXDUtWA==
Date: Mon, 12 Oct 2026 18:38:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
Message-ID: <51443ef4-fe92-423d-87f2-bfb543271f5f@sirena.org.uk>
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
 <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>
 <asuOoUt8XcOJJmSE@laps>
 <CAHk-=wgAJjTXvGBehCycoObUb45sXdW_-WkLkcd0cZp+fonYHQ@mail.gmail.com>
 <3ca592b2-a411-4353-ae13-06e84021955b@sirena.org.uk>
 <CAHk-=wionXXuNeBs80ECLud+N0s3yi1tyFsvvtfqO1S+1KQLSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WEudpWlNWg79/xxE"
Content-Disposition: inline
In-Reply-To: <CAHk-=wionXXuNeBs80ECLud+N0s3yi1tyFsvvtfqO1S+1KQLSw@mail.gmail.com>
X-Cookie: Times approximate.


--WEudpWlNWg79/xxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2026 at 10:24:56AM -0700, Linus Torvalds wrote:
> On Mon, 12 Oct 2026 at 06:29, Mark Brown <broonie@kernel.org> wrote:

> > Sorry, I was under the impression that the keyring you were using was
> > tied in with the kernel.org keyring

> It is. Not automatically - but when I see missing keys, the first
> thing I do is check the kernel.org repo.

> But your new key had not actually shown up there. I don't know what
> the latency for it normally is, but I think it's all "entirely manual,
> random when it gets updated".

> Right now the last update to your key on kernel.org is from July, and
> that looks like it was just an automated "update signatures" kind of
> thing, not actual new key data.

Yeah, that one was nothing to do with me AFAIK so will have been pulling
sigs.  I'll file a ticket to helpdesk asking for the process to be more
chatty about what's going on to try to avoid surprises and so people
know when the updates are live, I got a "your message is held" then saw
the update had gone through on the list.

--WEudpWlNWg79/xxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNGywACgkQJNaLcl1U
h9CNqAgAhAIDLAPTFeF9trLiJYjXFpZTrsFJeT0HXXt8rYaIMk7prj2h6G+bNi3k
vlfJgcSlUwLs2/8v9Fes7Gya6cjywNGpkHNnygBuU/UCHesytMZ2YF/sFgu0c499
Sx9ehGtDJCSBoGcO3J+1dr5LcgFvWNWhcZl5KLHFNHooH/9X8IsY3oXRvULePYni
Dj2gOJLiDo7+TDW8vxgAts4XGbz6k6PiW9lBsKQAuXw3q5+wPaQ3pd7VW5xxRpY+
7DmXT0dczmHHi5jvSb3g/uoEbAyDpgDNbhfVtCUkQrBxUSV0zxXnJ9SIOGxtqd8h
b+hEtABjEAO7O+YIXvGNTJDto6+sfw==
=vjk7
-----END PGP SIGNATURE-----

--WEudpWlNWg79/xxE--
