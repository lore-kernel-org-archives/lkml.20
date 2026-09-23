Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85849486436;
	Wed, 23 Sep 2026 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173622; cv=none; b=iK5Rj1BjU1MtwMS7fLiFUC32dXZ/56+rAGr/CjfIlw3OmfTjMPsFohcgc/2ls1MDgbl0QhWvbpiW0mdq9f5NWQKw48NDr4m7IDTyc/IBMjcquYjxBEZlf8FjzrLkXBJCA1ZJv3SWDlCfNEY7PgDH8gqtcPPVQpCaBVzkK7MLpS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173622; c=relaxed/simple;
	bh=xl8hQ66Pea/KzBDheOEGmZmQITAobwEiu7RYkGDtv70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1Z7xTN5NZ+5OCl+I4Cn2NwV1QWKAo/nILDRW8HB1MMaH0YI5AGjTKxlaHYMn+baCOGnKTsK5J7DPh0Kj9c+96PqoZOAXeprn6V7wvOVRRP5pnjuk24b+KgVn6kE6X0BuhBKSfZCJo9wAtOz8wL974CTjCUmjX+oX6/4p+YaKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXaDYqCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXaDYqCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4C91F00893;
	Wed, 23 Sep 2026 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790173620;
	bh=nawV4SD5a4zB9zV9vsePBxNLyUewNTusmc3h5j7J9As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aXaDYqCUT0tJfiAH8aX1Gm2k+6bH77sGQoWSzdN8ojnjKN9Y/QAC4wwUWbCY8b2os
	 REq0lM5zBHgAHFv+kCcdiUn09MW2FrRraDdGZq2eIEMsXSFXzmBtX7SFwP7wJimBcx
	 a90AdR9Fp95EX32uhl4uwaLaP4MO362K0PHC5ADHP8xzQwURfqrlFfd5yr3YKIslRp
	 vVCUPqXU+QNNlYFnfD6bHKjcYRbxS2snhufWfpagF25Q8IJx8O9zxq4BQyrvTYdFLT
	 fA9QbINJOdkHsGG1VqHP++OMeUmSz4S0fdrLXfBIkpvO4PqczoY+ymXAEsawBjW506
	 EyL17IIGEFrJw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 722DD1AC573B; Wed, 23 Sep 2026 15:26:57 +0100 (BST)
Date: Wed, 23 Sep 2026 16:26:57 +0200
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <arPhsTaiqXPgCqAU@sirena.co.uk>
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RRPwIJI3+1SFcBYM"
Content-Disposition: inline
In-Reply-To: <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
X-Cookie: I've been there.


--RRPwIJI3+1SFcBYM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 09:45:38AM -0400, Alex Deucher wrote:
> On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:

> > neither of which have had any response at all.  It really seems like
> > there is some room for improvement in your processes here, currently
> > that's three drm trees all held out of -next with the same fairly simple
> > build issue.  Can I suggest at least check to see if the code you are
> > trying to merge is in -next, the drm merge was done after amdgpu had
> > been held out of -next for several days.

> I sent the PR out on Thursday and you reported the issue on Friday,
> then the weekend happened.  It was investigated and fixed, however

The actual merge still didn't happen until after I'd reported the issue,
and then as ever things are now starting to propagate through the other
drm trees.  It seems fairly obvious that there is room for improvement
here, for example people could check that the code they're merging has
at least made it into -next.

> Dave reported a different stack frame warning yesterday so we are
> trying to make sure that is resolved as well.  In addition we've been
> trying to figure out why our clang builds did not catch it in the
> first place.  All the patches should be available momentarily.

OK, that sounds more promising than what had been visible to me.  It
would be helpful if you could be more communicative regarding these
issues, the drm trees and over the past couple of releases especially
the amdgpu tree take substantially more of my time than the rest of
-next.  Between the frequency of the issues, the length of time they
persist, the way your process will obviously trigger such issues and the
near total lack of response to my reports it really never feels like
that time is valued.

--RRPwIJI3+1SFcBYM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz4a4ACgkQJNaLcl1U
h9A94wf+M1lPDJdAyRTU3lKbKctG1Bm/P7odZ/y2RC9cBn/9A7R0J+j7m1rIH8hd
6vkuE+Vl+QmN/H5wkUP0ZZU4el4RfQOOhVO2ZnIHreVZ1T/dkUysILuhRwZqmQ0b
oKGju9tjSpVEdVAxmtvC7oEqffSIaJbPOSGl0s2inO5qiGTH/o5woutA1Zn3zwQZ
rQjkvJ0bX1La7aLLBaBdMlaUj8xj9zOn2ds7JAMgw3RjjStuWnsVCgPYxGL/9Iqu
kTQGu2BTvpwXYrj7cANAie9IOZwXgY7T3h0OZ0JXKw35IQ6SOU0iE+LYJGCu2BoW
0NgHp8YgdYWEQaKR/6QpQJ7Xz5Gu+w==
=LAB6
-----END PGP SIGNATURE-----

--RRPwIJI3+1SFcBYM--
