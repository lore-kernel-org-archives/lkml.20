Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D5737E2FE;
	Fri, 18 Sep 2026 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730074; cv=none; b=YfZ9z0dXkEeadE+CREq1UPJu/fPrQWk34Cfr8OOMNFApJp9mLRRImFCp5TAJ5LZdjUcIUAH6/hV1jsncWMhzsRbT8k7qvrwv3tU1C++lMFJG8nmLGnI8vt8w0MVSELetm/ZCiQoJoKfd7EEi+KEYjXNyCCq5o2/ecjdKJJvoj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730074; c=relaxed/simple;
	bh=7vZTX4MAs1EFeOvX0don1be9SLSuAWKvlOEUJfDyxe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpBnmTh0gvfSaIQ3FZoF93m3jlR/BuxV8z9YLMPqrBbTOrUCr9bRLN+BvVihyrmyUnpe1f9A53fgdo8eGBVvEnh7XHvUSaqmwMY0azYtv9dJz/KbSvNpM51ApNBrXbMMi6NLUmOmI4KeEDXyJiS5WEsYnrCP66wjwU1UxHUhry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WskpxSdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WskpxSdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791F31F000FF;
	Fri, 18 Sep 2026 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730073;
	bh=Kuutvxa5QOfFNe/emeep5WZ9K8kyOggGj16iP5pCM6w=;
	h=Date:From:To:Cc:Subject;
	b=WskpxSdYHnnWly4FY2W1f19/eURP/yUxDnKQfnOtrOkFM3K8fPMTg9Q89yG4DZhP7
	 MUvvzh7NfWgg8w7Q4RjXZVNJ5KHD2PAn1OxTbjxKn3uZjWpTnZxdUgsQJ5M2e2w0i1
	 Q+TiU3zX+1NQR+sQgwpjLE53U5HYRxl9UI1rFxXcNJ7eYt9n/xYByoUNmzMmrABjNT
	 RCii7y9dsTYagKyQKcEyPMqBcVAOPqqkzW29DiSS1LHVCPVqpFgz6APPOiyL0r9bkC
	 WAerT0pjufRYNW+lG1NT/zjqhXHHPPanZltMkYg/CQHvVAjNN+Ub2hh15obFnX6a0U
	 kUyZ1wFM934rA==
Date: Fri, 18 Sep 2026 12:14:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lyude Paul <lyude@redhat.com>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <aq0dFhGo62Hbqt4B@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q2wXDt7ErM0nUYQz"
Content-Disposition: inline


--Q2wXDt7ErM0nUYQz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c

between commits:

  12f6eff11ccf9 ("drm/nouveau/gsp/r570: Set GcOff =3D 0 in fbsr")
  adb87c20081e5 ("drm/nouveau/gsp/r570: Enable Gcoff in fbsr again")

=66rom the drm-misc-fixes tree and commit:

  c7abe771e0138 ("drm/nouveau/gsp/r570: Set GcOff =3D 0 in fbsr")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--Q2wXDt7ErM0nUYQz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtHRUACgkQJNaLcl1U
h9DckQf+PiPWQ03VXLT9bpTg1sTG/vNBTQhBxDu8yvSqwnFTdXMy4dfdp5PzdN0s
FtixadN/chjJp5LuvVaDvZvdxYQjX5zolcEgiIVcXRq+f6W5lb+ijIWVGwo8uq+R
GK7DfpXuiElkgqtLkPrQRNv1hdB/LOVgpC/nyTtnCz+q6S+SLy0nf7uwYcSmOU+J
3RMM6CQ4ly3BVBMs0lp/el80HhhJPBH4YyU4lYneuNA6hSJKkjLMt6HSDlvOSY5M
UWQ2dkOIDIYKlxIaoWkCP0W54eJRy0nUiwGjeI5SPh1rAvUOi/xIG8u1nQJZZAc8
cwwHKf4Et2CMk17/rlWPSyweolUJPA==
=SG1x
-----END PGP SIGNATURE-----

--Q2wXDt7ErM0nUYQz--
