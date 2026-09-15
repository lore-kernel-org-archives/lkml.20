Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AFF4C4F55;
	Tue, 15 Sep 2026 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497719; cv=none; b=EGwCxp1YprYtXcBL5rs/dANA9GDyt5OxWa8EbpFsebdW/Q4N1EPC3jwSoq5KlqCB54ermsFzHAX8ZNp444w2uO72cvZjYjKBP2LWT/qQVLcLQc5Cv0epa3BZgPxS0oVcrfmCvWSL6jYxNgKtuK/hx9WvqDn+z9o0oXwuCKemgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497719; c=relaxed/simple;
	bh=mEStmBbbIJljA3B4tqoaTA5cEqGFcwq7G00MhbTrt3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk0n0djQB1T2qA6FmPcVHrecT73xruye7Sw2uWX5+w+M7z7fugQ4ykgfFzGlWNIKEqeT4XITzmmo/KwVZvPv7/+1QaCM9JofM9Jhm+53le3q/kLcGiwSsR3aDlhDuwzf5ZjGvTOit0GKWaeWH6qcWRG+DMcZzWsfx1PXA2bPT8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGlaDx8N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGlaDx8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A6F1F000FF;
	Tue, 15 Sep 2026 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789497717;
	bh=mEStmBbbIJljA3B4tqoaTA5cEqGFcwq7G00MhbTrt3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VGlaDx8NbjqTtnZXPdsbW1tWEv3JAgM8UshbpeAUryKdFEp1n7R3KD6EMbV48r0oP
	 dT5OSCtoGjb7mzeMlTNzeCvStcJ2gTtAVB3aCfdSQdjPqdA5QY4/VZ/1vIvfffoot0
	 99cK/jEUEwFCgAxMXK6BtNcn+bGP0anG1u3aTqXYPInkPE72OP/Rd7npzVMnhoIumf
	 7OUnmnn8qXy1cm5Yu0JenC5LHK6nV8kLTlJnD2wLbsjD8PA4v4/JUIOFRxt8+rmHpC
	 tQCNX92Q68sZpTEGGIQXzBC8+mnD1xo4NrsXXFt9ZssjN6joxOTuvVnjTzLCr5Gwwt
	 T7flzIees61PA==
Date: Tue, 15 Sep 2026 19:41:53 +0100
From: Mark Brown <broonie@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Krishna Iyer <kiyer@crusoe.ai>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	SJ Park <sj@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm tree
Message-ID: <cf1cc1ec-89f0-4d82-b7d0-2d17754a3287@sirena.org.uk>
References: <aqlI5oRGnTQDCgQu@sirena.org.uk>
 <20260915105413.53146d2718de082bdff61706@linux-foundation.org>
 <0c4ebe5f-724f-4621-8803-826fbb7e841f@sirena.org.uk>
 <d3793c34-75eb-4e95-b325-1c3fdb57c8c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OdYIhBMjHmOfdwWo"
Content-Disposition: inline
In-Reply-To: <d3793c34-75eb-4e95-b325-1c3fdb57c8c5@kernel.org>
X-Cookie: Void where prohibited by law.


--OdYIhBMjHmOfdwWo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 08:23:27PM +0200, David Hildenbrand (Arm) wrote:

> I think the problem is that

> akpm/mm-nonmm-unstable

> is based on

> akpm/mm-hotfixes-unstable (and akpm/mm-hotfixes-stable)

> Which only go into the MM-next tree.

> So if a commit in akpm/mm-hotfixes-unstable changes (and a stale one is in
> mm/for-next-fixes), it comes it through two trees in different forms.

Yes, rebasing a branch that's being merged elsewhere is going to cause
issues like this.

> Likely we'd need a separate akpm branch for NON-MM hotfixes ... or I'll take
> care of all MM hotfixes through the mm/core tree.

Either of those should work well, I can easily add an extra nonmm
hotfixes branch - let me know if that's what you decide to do.

--OdYIhBMjHmOfdwWo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpkXAACgkQJNaLcl1U
h9Dgygf6A8gaqNuxPGANKiLHyZgl1bMVMnTLM7ZFjR9KTck1Rz2yrc1hd0EzKj8C
zhtZK7s6+dvbZy4xLzv25yKiOIu/0NOI3uqBVTfdcKGJpttDw+OKcddAV3LMFw/r
m0vsODJzoxOYJaCJgQ/SBJTi3mX06ATo02fjkNI2c2E1vXsecehqsprrh8+oCWvQ
qTSjFX5dpFwPS6mu9b5jE4s2IYmlQD2OPVkArNlELyCMcdtpz3+aPwF7hx1NsZYs
xmF7ON+6gWslrH9RZ8lQX1cYrGxP9O/gFyC2wk+5fIeW8NpOdbOgzpJLmOP2zk0P
aRfctZYbGUy8gq5pvtK733nSALrJ5w==
=29KR
-----END PGP SIGNATURE-----

--OdYIhBMjHmOfdwWo--
