Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2704766A7;
	Mon,  5 Oct 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197645; cv=none; b=KSAkxTl/sH5Rzhpq1K3zpcxucUC5X8FKm3kHWHSivjw7IUFbeushINJ/+Pl2v5QBJ29W/UVuemYJ03FqTvBFzpk0Kb5eRpe5jiHOU7VuKwxs90reP6CoOPR8EQVgTeoXZtK1yIAYA5GMQ5j63pJ1CA1xpePPnmAhHEmfVO5CAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197645; c=relaxed/simple;
	bh=Jo1mU8+O8M1j1DxxhL38J2XFwPd5MPGjkNvak8PIuVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gU/9EC8/CTimDpzc12mJ+VzMxr4EPd3jotbQmGno90kwW50ZbYSuCdyAotMpW3fpOwpYa1mjYKz/tmNRn5Gz1Fir151Yh0/czCkH3kBk0siSLXLhYkfeqWZFKk367MFDn4V9C2TtCNHltm65LPMBbe3nAZ4+MWXRBEXqdPEqcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4dCQcsC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4dCQcsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF4E1F0089A;
	Mon,  5 Oct 2026 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791197643;
	bh=PkWMPEeQmQFDxxmbrkJ9DHwD02vrhosTFTc+pj9bTAc=;
	h=Date:From:To:Cc:Subject;
	b=I4dCQcsCpm4V4XE8liVPcNVqb1O5XJFcFRctha3b9XH+CgG1CzPABI5hMvmkMFTVJ
	 gKJugYMNt8FFGWOlnI+pskqkkGCtvOHrm9i5ASsK1wgFpA/aUlhXCJ51wmJMWDhEvs
	 ZeKYQfl5ESRei9RyHRGLCAA4Km3VZ35JCWWDIPAllEzjpLN9qZ0pT5oUvt9bEpJVvx
	 DzqMdEI7pV9OIBzrESKb3MKDJ7nO4LUOaKzKmDxJLOhZZ7qJjmy/R2H89bywXp6e5S
	 Q0nUPb+0IlQckYsMqOufn0KSo202isyZjVxLdbYulRx0dAniwbRPSGVzXxCnOhA4jA
	 2GZWfTtIhufZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BC7101AC57CE; Mon, 05 Oct 2026 11:54:00 +0100 (BST)
Date: Mon, 5 Oct 2026 12:54:00 +0200
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ray Wu <ray.wu@amd.com>, Sasha Levin <sashal@kernel.org>,
	Wenjing Liu <wenjing.liu@amd.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <asOByBk2DUB9J4qI@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e7PHVkRnAXL2h9S0"
Content-Disposition: inline


--e7PHVkRnAXL2h9S0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
  drivers/gpu/drm/amd/display/dc/dml/Makefile

between commits:

  18779dd84515d ("drm/amd/display: Bump frame warning limit for clang build=
s of dml")
  15814c01ac576 ("drm/amd/display: Bump frame warning limit for all builds =
of dml")
  fbc988f236a60 ("drm/amd/display: Fix sanitizer check for the DML frame si=
ze limit")

=66rom the origin tree and commits:

  7e3422ee337f9 ("drm/amd/display: Add dml2_core_dcn6_calcs function pointe=
r table")
  ebf8b0fd8508b ("drm/amd/display: Relax DML frame limit with UBSAN")
  21711b6e66bb7 ("drm/amd/display: Bump frame warning limit for clang build=
s of dml")
  76b9706e7fa1a ("drm/amd/display: Bump frame warning limit for all builds =
of dml")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
index eb4ce5b1ecfbb,91465ac05c971..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@@ -29,7 -29,7 +29,7 @@@ dml_ccflags :=3D $(CC_FLAGS_FPU
  dml_rcflags :=3D $(CC_FLAGS_NO_FPU)
 =20
  ifneq ($(CONFIG_FRAME_WARN),0)
-     ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
 -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
++    ifneq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
          ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
              frame_warn_limit :=3D 4096
          else
diff --cc drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
index 289bac08c82c1,e8bd061be05c1..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
@@@ -28,7 -28,7 +28,7 @@@ dml2_ccflags :=3D $(CC_FLAGS_FPU
  dml2_rcflags :=3D $(CC_FLAGS_NO_FPU)
 =20
  ifneq ($(CONFIG_FRAME_WARN),0)
-     ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
 -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
++    ifneq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
          ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
              frame_warn_limit :=3D 4096
          else

--e7PHVkRnAXL2h9S0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOBuQAKCRAv73Ows9A4
iYBRAQDXmlRyfO8Z5gFoo30c29J/qYNzLn9V8jA40CgY529xqwD8CiQzIIHF09hG
2raGdkXpyzV5a5YZEv/O775dhET0MQg=
=ZkUC
-----END PGP SIGNATURE-----

--e7PHVkRnAXL2h9S0--
