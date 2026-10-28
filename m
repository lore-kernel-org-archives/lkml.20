Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188207;
	b=Gy0BeclutnxnZml6QDORo1mvrpSXAb3WXUrRsRnRm4dSNbY/cA3UDWg7KeBX6hBmGuKW
	 LfxXdSDuPLO8HFDImfaeN7u1xNIoukQRSGS3aIuD7lWYNC1hzUSD7c3fBqLOVvDZeLRSo
	 5+9C/0eey4OAv0H8dzi1/GmKpskwHz8MvVdMXNQwg43rPxJtfBHYgC7gC4Eymw2qChhTV
	 yXCR+5hVKU4cM3eVQ/G0anjnXiLl0k9+qT2nZUpsO/jkEhRtmZ0qfsb9uB+Nl74c+a5aV
	 PKYMtiNGWbkkcZfHBJZ+cGKNUtW7WJAw599SRwqY9mL8PMYHA3D67OHX6RLlrfEZwwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188207;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=yMTEMw0kkFxlB7MDaas1Eud3c6Am0YZwhPAxvxQm0gU=;
	b=x9kE/dgO8FYswEMuoNxzZP0pz+1iySQYWgxVVxYtxRPnHjCc1LNjpc/aktTGl9UnYsha
	 osZZU3F4b4RfLcmn7kCX4vuqdklFubi6AEkFaDdSzfU92/X63fQ9q7oBfvEM9mh6w6z0x
	 adkvijF2YcqdOF1+hEvIlAWX+Gbwu5LDCpZloOB53HDAFogJG8lAa2HuD6cP9CZq5DNAH
	 ilDceSsCOWlF4h0G8P/sapu1Gphw4BVfFNK15icCd5yLS1n5kiBFFHToCMEh/o+uE6cgT
	 HAboV4qIOHQQg3Ndsz7S0Cy7JCzVDEy3l8JVu4Ot8qJAUAnKQddo0GxcV+vdANgbwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0gXv8GB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE0606A325;
	Wed, 28 Oct 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m0gXv8GB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CE41F01825;
	Wed, 28 Oct 2026 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188206;
	bh=yMTEMw0kkFxlB7MDaas1Eud3c6Am0YZwhPAxvxQm0gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0gXv8GBPIIa/nDG+K3ewNg+78qY3cyN9imTJURo2kcQXjmuLw9L9oBlFPT8Hds0E
	 3t/9+zVGOh+epI9UMG51uOh+dtgJBnxR1V7SH4nZycFeszBSGvA6+KFjQsB4VB7DEQ
	 EC7gRsyrJzd/0y33tJjbJG8Cbb3UPaoVUIE99Lc5WFe05+xqpfaPQMxzMjiGrZ7aSd
	 AaJGQoiCStXZb4YljtB2eziVPLKegMIy5LVaI5wDeYMUFx/S2MryV9x0cgMSjMTJp7
	 MRi07+xr7/2ZmKZsNRbEaJM+wm/ViesPGO26p+ditScQmKJTvzft0cSFxiE1X5/u5V
	 vu1ikPjASlBbQ==
Date: Wed, 28 Oct 2026 11:50:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: Missing signoff in the clk tree
Message-ID: <0597d845-8f49-434e-b595-da20c0c46068@sirena.org.uk>
References: <ar_0GFOb5hZfhHHx@sirena.co.uk>
 <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk>
 <atZqw7pdZjMwahdf@sirena.co.uk>
 <at9drMPrv1IvPovj@sirena.co.uk>
 <CABx5tqKQs2LFNEW7ZTwFqD66Mzv7EM+fSbqWkZ8chaWfXhheOA@mail.gmail.com>
 <at-YqCa-RGEv7IJ4@sirena.org.uk>
 <CABx5tqJnZi9KT67RU47PLqR8tQWV-TL3Y4SrUyzWvF0B7AE68g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rb9cMFsGeEColCRL"
Content-Disposition: inline
In-Reply-To: <CABx5tqJnZi9KT67RU47PLqR8tQWV-TL3Y4SrUyzWvF0B7AE68g@mail.gmail.com>
X-Cookie: Pushing 30 is exercise enough.


--Rb9cMFsGeEColCRL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 07:57:40PM -0400, Brian Masney wrote:
> On Mon, Oct 26, 2026 at 2:15=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > Yes, you need to tell me about it - there's a separate list of contacts
> > for the various trees in -next since there isn't a 1:1 correspondance
> > between them.

> I fixed the clk-next tree (via clk-pile). Sorry about that and I
> definitely see now why not to rebase the tree, especially with two
> co-maintainers!

> Let me know if there's anything else you need to do regarding the
> contacts for next, or if this is enough. Also just a heads up that
> Mike stepped down so you can remove him. It's now me, Jerome and
> Stephen.

Thanks, I've updated the contacts for the clk branches.

--Rb9cMFsGeEColCRL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh4WkACgkQJNaLcl1U
h9BFowf/fMeKXoLeIa7oNVSpJwfzkPJD9RY0TzVQhNoDtSQL+clJu2C/4f7K7maZ
gAgs6wsVqk3GqL4OotIbk/ScVkWQ3r7jNWeJbvgjmnhmdAOvbXQQLYmlm2XwIdNs
sPOiX3Y/D5C6hy9K2naVHk1DCZnzPEyoI6DZoLEzQJz2Qv+r0RgOlPBVpEHQJMY8
dPTyJ1pPgrqlKuu8FwFROxPz//HKpb4GUPf5P72iHR1LD1S8iW3+8IsmDnmT+keD
TILvOtaBQ86hDWEadWQ6o4rEtX7MF9pOmaLhxBeVwcRieiqvLrFT5MYOk2xy/dcu
9XHArpECTCMPwcaNAsOXueht+tI42w==
=oiXS
-----END PGP SIGNATURE-----

--Rb9cMFsGeEColCRL--
