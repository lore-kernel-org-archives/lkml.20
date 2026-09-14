Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66873469847;
	Mon, 14 Sep 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390661; cv=none; b=hkseH3tvZwZD5Q9Z41SBd2q+3IS5ubTF1Zr8n+ixcTP3OwPKoZ/yOjEnKb34pipCGcWNwYd/0QFCpf3zNsO25MbQX+1DtFiZ1m+zr0+ISb3kZMUxEBuwdDkQt2JyMBaTuU54y6okWEbYr57MxFhZNLvPbwoOCViwAaHziAXRDJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390661; c=relaxed/simple;
	bh=o6xZ4qp5cjwHrSyG5iTMapiGJhW82l8AkeYHejPXGjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1xKLtEtY1fxzIJhUcEs0cBpXHC3KFbZ+m3ts/LAOO9M4hqR+V4xLCvBJ0qcew9FWTvEakh18i4YzfJPrzeiICx/+zbXkApxERST7HmGOyq+YfnD9OShB8mSYdLybNerZ5bJZZLUFSnVz/A+b7N8SPfsfdkLvD1eQiWbXeCCy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InbmALLi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InbmALLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FA61F000FF;
	Mon, 14 Sep 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789390660;
	bh=IpLjXJxZ9W0XIGvK7WoCkmK87VUijJonkDdh/G0UZUM=;
	h=Date:From:To:Cc:Subject;
	b=InbmALLiKwaM2hIhsea+zHGINniiYwz/Gx5BApezQjwV7f2H5JOj31ORvJZhPEPIf
	 kNsvDYA82qHsYm2D7hwzitNu9ZnrRQPV323HWjVd7A4CrhW2IcD2j6XsI7ZMm/JBqY
	 TdI3ssvRyAJKXSDuOVug57EBAXaIRb+e1tdZBzKXfvgQkpDR6kSMVAyKE13ZwxZdfm
	 fRhYsZTrazh7alJFcOxZfNsHlJtLCAR1ciuN+C8lWJz76DGfP761nHakNhd5OMAyl6
	 2Zs7aIg/j3s+mQwEKXF6J2ZyVuoIWJHFQpevyhBmO/6lIlnhUkmGm7OHKYvR7UkHpC
	 qr7Qg9OOpSGBw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 712FA1AC52F1; Mon, 14 Sep 2026 13:57:36 +0100 (BST)
Date: Mon, 14 Sep 2026 13:57:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Tom Chung <chiahsuan.chung@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <aqfvQDZ288iSPpR0@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aguZEfv3VuFbuoCC"
Content-Disposition: inline


--aguZEfv3VuFbuoCC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h

between commit:

  32fbec62a3e9f ("drm/amdgpu: dm: Convert to atomic_create_state")

=66rom the drm-misc tree and commit:

  b40f65c12577b ("drm/amd/display: Cover crtc destroy callback")

=66rom the amdgpu tree (there are furher fixups later).

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
index ad516aeb9798e,91fdd262c2d2d..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
@@@ -49,7 -49,8 +49,8 @@@ bool amdgpu_dm_crtc_helper_mode_fixup(s
  void amdgpu_dm_crtc_destroy_state(struct drm_crtc *crtc,
  				  struct drm_crtc_state *state);
  struct drm_crtc_state *amdgpu_dm_crtc_duplicate_state(struct drm_crtc *cr=
tc);
 +struct drm_crtc_state *amdgpu_dm_crtc_create_state(struct drm_crtc *crtc);
+ void amdgpu_dm_crtc_destroy(struct drm_crtc *crtc);
 -void amdgpu_dm_crtc_reset_state(struct drm_crtc *crtc);
  int amdgpu_dm_crtc_count_crtc_active_planes(struct drm_crtc_state *new_cr=
tc_state);
  void amdgpu_dm_crtc_update_crtc_active_planes(struct drm_crtc *crtc,
  					      struct drm_crtc_state *new_crtc_state);

--aguZEfv3VuFbuoCC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn7z8ACgkQJNaLcl1U
h9AGAAf+IeVOgBbdzlr+B6IivziNzA4G2zaY1IYS0SaMGP7wyI+5whJAmEt+UY9U
yVEqsrTeI0SM+zPNNq1FEUzeefrMVt9HNr/gEB5R3os9YtJtuph7fv9JlMt7ZV09
yd8PvVctE+n25kA43k0xa3Vy7TdfZmEYT8FCUYlxZUZIe95HfrYeLPuSgfumJZYC
Grm7qyYW/yKJluH05oqr1CCnluoixuuu6JdiZD2zSTesLcyRqYyMQl5rqJZM/Utn
hdpJAovz7Sorwn1WZsNZDbDZ/vE1V44zf+OVXhIG4c4YSAycJEbfCHbbg+hLg0VA
9QMDb/u+abu1bcUs+lA7fwtWmBed3g==
=hwgP
-----END PGP SIGNATURE-----

--aguZEfv3VuFbuoCC--
