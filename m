Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283474;
	b=wYDkYfqGJpduYwoQHl2juFxOrZf6jjBVVxsx0TYqj+yCTWZVKKegIelRsaZvE6J0M6Mm
	 aulkd02NET56FdpzG9qIbMaAQVfXbhzXX31+hCCaeSLCeUiZsQq2L4m6q6/0NVKmuKtIv
	 yfakLRwF4PNx5MT3Z5bLeonRm9QB7t+y8LaEMYYU8VcAxRtHLqudt/UwZUTQQ/eNaD7FA
	 fFCxes8YvFoshyWmol+53bVPOg5IXKCBRssKaNphYcuOhRtXPBXZg77sgAGsUcVfzCTVD
	 55ant/Wq0j18B6per3NJ+hlN4gsZPuoGrTa8p/YtBhHPhxnFSWc6rbglKQeh6TnkXEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283474;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ZGzPxtLEIASh5v8GJvNps6xy+CY7bnAktG1HiW2ABhc=;
	b=HKR6xGHaf0XmZGfGBYFb7Q4MossHhSdHKiU2Ed9oH4h8XeGdmvZXkbQRnobmy6kAAGcE
	 yVKyYNIadBhWUdV83jSnhROvKcD9kxhkPEbaoq1AJ6w36R6gUec9ZZoCQxZI6joeaB6FQ
	 9sfk1ZtGM2pjUZpIO6eqR6MVmHNUaxYTyw6pU/V63uLubXvIbGGhdKEpV3v1rCvwxdoBN
	 E2uWkTdnBw2tnDO0pfqBUA/u01JbTV+i5gu4XsHyywtPJmnv07uKguRPgLUeCxp7VV+pd
	 innbhWzKZWNC+P2E8A8lt0RrvrvYZKrU1GkJltZkQiVp0VKJu3kR9iOObWVhDIH+8Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LC95WxYV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F5606A31D;
	Thu, 29 Oct 2026 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LC95WxYV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDB51F01825;
	Thu, 29 Oct 2026 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283473;
	bh=ZGzPxtLEIASh5v8GJvNps6xy+CY7bnAktG1HiW2ABhc=;
	h=Date:From:To:Cc:Subject;
	b=LC95WxYVZywPVHOZD/8qJ0ugk/2tvuhkhKkyhHCBck9tW9Qqvigy0gLzt/bxNoNqi
	 IOjPBT9cObu5cIjE9ObGeQym3xati08UOEsSj9KNK92h7oF7FYk7DiN/07uSb9xj7T
	 PyrFIEf9COYcWw1eNUYR+u7UGL4Fvxv074XURQF5wz+ZcgSfKuh9MwvBvEm62FUKNk
	 MkLfXtUn+PQq8zHHjoxDQBJWj3h1NTC/QOfqXJeX6wMBsLTQ1mG1q14Jh3ljUe21W0
	 yHDee8e6aIPZPTBMM91kFUIFSCD4iDtPySzgWkB42AJygURXiPuKo13Z4epJauRbez
	 r5jDSgB37eidA==
Date: Thu, 29 Oct 2026 14:17:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <auNVjjjxWnmPOLUj@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="3wPxrIIxSqRRX/oS"
Content-Disposition: inline


--3wPxrIIxSqRRX/oS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  tools/testing/selftests/Makefile

between commit:

  073d71c5118f4 ("selftests/filesystems: add a test for freezing a shared b=
lock device")

=66rom the vfs-brauner-fixes tree and commit:

  c6c917c1ecb48 ("Merge branch 'vfs-7.4.misc' into vfs.all")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined tools/testing/selftests/Makefile
index 07c3719f8b04b,32dde7b95848e..0000000000000
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@@ -34,13 -34,11 +34,13 @@@ TARGETS +=3D exe
  TARGETS +=3D fchmodat2
  TARGETS +=3D filesystems
  TARGETS +=3D filesystems/binderfs
 +TARGETS +=3D filesystems/configfs
  TARGETS +=3D filesystems/epoll
  TARGETS +=3D filesystems/eventfd
  TARGETS +=3D filesystems/failfs
  TARGETS +=3D filesystems/fat
  TARGETS +=3D filesystems/file_stressor
 +TARGETS +=3D filesystems/freeze
  TARGETS +=3D filesystems/openat2
  TARGETS +=3D filesystems/open_tree_ns
  TARGETS +=3D filesystems/overlayfs
@@@ -99,7 -97,6 +99,7 @@@ TARGETS +=3D net/packetdril
  TARGETS +=3D net/ppp
  TARGETS +=3D net/rds
  TARGETS +=3D net/tcp_ao
 +TARGETS +=3D nfsd
  TARGETS +=3D nolibc
  TARGETS +=3D pci_endpoint
  TARGETS +=3D pcie_bwctrl
@@@ -180,10 -177,6 +180,10 @@@ endi
  # of the targets gets built.
  FORCE_TARGETS ?=3D
 =20
 +# Remember dry runs for the build report before MAKEFLAGS may be cleared.
 +KSFT_BUILD_REPORT_DRY_RUN :=3D $(strip $(foreach f,n t q,$(findstring $(f=
),$(firstword -$(MAKEFLAGS)))))
 +export KSFT_BUILD_REPORT_DRY_RUN
 +
  # Clear LDFLAGS and MAKEFLAGS when implicit rules are missing.  This prov=
ides
  # implicit rules to sub-test Makefiles which avoids build failures in test
  # Makefile that don't have explicit build rules.
@@@ -228,10 -221,6 +228,10 @@@ ARCH           ?=3D $(SUBARCH
  export BUILD
  export KHDR_INCLUDES
 =20
 +# Version of the optional KSFT_BUILD_REPORT format written by these rules.
 +KSFT_BUILD_REPORT_VERSION :=3D 1
 +include $(top_srcdir)/tools/testing/selftests/build_report.mk
 +
  # set default goal to all, so make without a target runs all, even when
  # all isn't the first target in the file.
  .DEFAULT_GOAL :=3D all
@@@ -240,13 -229,11 +240,13 @@@ all
  	@ret=3D1;							\
  	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do	\
  		BUILD_TARGET=3D$$BUILD/$$TARGET;			\
 -		mkdir $$BUILD_TARGET  -p;			\
 +		mkdir -p $$BUILD_TARGET &&			\
  		$(MAKE) OUTPUT=3D$$BUILD_TARGET -C $$TARGET	\
 -				O=3D$(abs_objtree)		\
 -				$(if $(FORCE_TARGETS),|| exit);	\
 -		ret=3D$$((ret * $$?));				\
 +				O=3D$(abs_objtree);		\
 +		status=3D$$?;					\
 +		$(call ksft_record_build_status,all,$$TARGET);	\
 +		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
 +		[ $$status -eq 0 ] && ret=3D0;			\
  	done; exit $$ret;
 =20
  run_tests: all
@@@ -303,7 -290,7 +303,7 @@@ ifdef INSTALL_PAT
  	install -m 744 kselftest/ktap_helpers.sh $(INSTALL_PATH)/kselftest/
  	install -m 744 kselftest/ksft.py $(INSTALL_PATH)/kselftest/
  	install -m 744 run_kselftest.sh $(INSTALL_PATH)/
 -	rm -f $(TEST_LIST)
 +	: > $(TEST_LIST)
  	@ret=3D1;	\
  	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do \
  		BUILD_TARGET=3D$$BUILD/$$TARGET;	\
@@@ -311,11 -298,9 +311,11 @@@
  				INSTALL_PATH=3D$(INSTALL_PATH)/$$TARGET \
  				SRC_PATH=3D$(shell readlink -e $$(pwd)) \
  				OBJ_PATH=3D$(INSTALL_PATH) \
 -				O=3D$(abs_objtree)		\
 -				$(if $(FORCE_TARGETS),|| exit);	\
 -		ret=3D$$((ret * $$?));		\
 +				O=3D$(abs_objtree);		\
 +		status=3D$$?;				\
 +		$(call ksft_record_build_status,install,$$TARGET); \
 +		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
 +		[ $$status -eq 0 ] && ret=3D0;		\
  	done; exit $$ret;
 =20
 =20
@@@ -329,9 -314,6 +329,9 @@@
  		printf "Emit Tests for $$TARGET\n"; \
  		$(MAKE) -s --no-print-directory OUTPUT=3D$$BUILD_TARGET COLLECTION=3D$$=
TARGET \
  			-C $$TARGET emit_tests >> $(TEST_LIST); \
 +		status=3D$$?; \
 +		$(call ksft_record_build_status,install,$$TARGET); \
 +		(exit $$status); \
  	done;
  	@VERSION=3D$$(git describe HEAD 2>/dev/null); \
  	if [ -n "$$VERSION" ]; then \

--3wPxrIIxSqRRX/oS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjVY0ACgkQJNaLcl1U
h9AGWwf9HZN9ZZPN9FVw/Yfr7SjSOcZYvHad64XVnBcKEGdjzTrn84FCOesAA9eR
EORZ8qyltJfqv3n2jB01kfzHA1eA91P3PWRUJtpNRTBqU8OaukVjzMxoii8i0Tcg
m/AIZIzMnQZwCU2lgpc+u2Temyy27EW5JtNiXCddtPjjtr4XAW7tfpy4Ztnk55bm
5akRCmlrg06ijTGIVc7XaLspiyy8dYTmlR2HuRZuAu2mGekVTpY1djvxVKf4hToe
K9HAoF0arkHjb20VVPxFB/wbPm9lycdTpudMRDY9LVMSHwc8fWypYamCliHMo1QF
t6MBA1CJ7JSLpnmNOajkma/IFaC+bA==
=H3v3
-----END PGP SIGNATURE-----

--3wPxrIIxSqRRX/oS--
