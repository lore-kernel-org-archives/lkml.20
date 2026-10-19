Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA2298CA5;
	Mon, 19 Oct 2026 00:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792371242; cv=none; b=HAnkloc05yan9sxINol2l+DADNJ6sn2YzfB2Sw9i0X9fG0vxsmsJ+5qFitGESA2PAmLwSsXtAW8pSJvR1hWhGieGJI+PQybYLDPF+6t3MhfPK1hovr9tcUvgS/c9YocEisgU+7sru7Ju4VnX92cFsB0p4Z0GUI4OMu1xrUnP6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792371242; c=relaxed/simple;
	bh=/7myM2J3eKux+M1KR+bMS9dK32OfqbiKECSvEDnxFcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkD3W61zcKWCmMI6gOtC0EitEVR+o3/UxA5fpl2aQ8jov5JmSwdS4tjNXBfeb2d4jFzbSkYnTrW+xyYV6x6V4vyr0tkNAVMmgU2hBJ+Q8OTPdGXcxVwkeU64iw7rIe7i1Su+FB1yzNSiHcu22EOpB1vEdd+uJJt8axJ291fnt6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDXcE8lV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDXcE8lV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D731F000C4;
	Mon, 19 Oct 2026 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792371241;
	bh=m17AtbKzYp/CC0ugM0d/6pu2qFU5/b3YN/Q4TZDYD0Q=;
	h=Date:From:To:Cc:Subject;
	b=dDXcE8lVMA2ClftCPqJcC9V9B/TAUp/0uOhhja986FK+KZlTB6Af2fE+sxbOpVTSY
	 3asv7esUWumO0GgKFC3eAkhbrcEz5iNueqrX/G76/VQVQq+nzuierqV28OM3Lbn4+z
	 HyTScc+qX4r3T8twHFjpEv32leLOl8EooVsKolb2RGVrIV0OfspWOH6LWx51RSk/Ub
	 gkWhytkouFDi78THMgd5XGixo0D3WQLbr2Kd8EwuQIiJF92HIGLcyft9Nj5Aemoq5B
	 dqJ2U2TmRQo+xfMX4dsZcOefljgPDZUkZE8b0O0iR6dlSGaOahwP99HTc8ERARckMn
	 TAN/kNXUiVJbw==
Date: Mon, 19 Oct 2026 00:53:58 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: torvalds@linux-foundation.org
Cc: briannorris@chromium.org, jwerner@chromium.org, tzungbi@kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: [GIT PULL] chrome-platform-firmware updates for v7.4
Message-ID: <atVqJsjSUkciF-hv@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cnRE5EHRFwHQBTaX"
Content-Disposition: inline


--cnRE5EHRFwHQBTaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull chrome-platform-firmware updates for Linux v7.4.

Thanks,
Tzung-Bi
------
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-firmware-v7.4

for you to fetch changes up to f2e05ce9763feb1dd7da15afd2cc61df227ee85a:

  firmware: coreboot: Add CFR firmware attributes driver (2026-09-30 20:34:13 +0800)

----------------------------------------------------------------
chrome-platform-firmware: Updates for v7.4

* New

  - Rename drivers/firmware/google/ -> drivers/firmware/coreboot/ and
    corresponding Kconfig names.
  - Separate firmware_attributes_class from drivers/platform/x86/ to
    drivers/firmware/ so that it is available for non-x86 platforms.
  - Add CFR (coreboot form representation) driver to expose the
    attributes via sysfs.

* Improvements

  - Use named initializers for acpi_device_id.

----------------------------------------------------------------
Pawel Zalewski (1):
      firmware: coreboot: Use named initializers for acpi_device_id

Sean Rhodes (3):
      firmware: Rename google firmware directory to coreboot
      firmware: Move firmware attributes class helper
      firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                        |   34 +-
 drivers/firmware/Kconfig                           |    5 +-
 drivers/firmware/Makefile                          |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig      |   89 +-
 drivers/firmware/coreboot/Makefile                 |   15 +
 drivers/firmware/{google => coreboot}/cbmem.c      |    0
 drivers/firmware/coreboot/coreboot-cfr.c           | 1204 ++++++++++++++++++++
 .../firmware/{google => coreboot}/coreboot_table.c |    4 +-
 .../firmware/{google => coreboot}/coreboot_table.h |    0
 .../{google => coreboot}/framebuffer-coreboot.c    |    0
 drivers/firmware/{google => coreboot}/gsmi.c       |    0
 .../{google => coreboot}/memconsole-coreboot.c     |    0
 .../{google => coreboot}/memconsole-x86-legacy.c   |    0
 drivers/firmware/{google => coreboot}/memconsole.c |    0
 drivers/firmware/{google => coreboot}/memconsole.h |    6 +-
 drivers/firmware/{google => coreboot}/vpd.c        |    0
 drivers/firmware/{google => coreboot}/vpd_decode.c |    0
 drivers/firmware/{google => coreboot}/vpd_decode.h |    0
 .../x86 => firmware}/firmware_attributes_class.c   |    2 +-
 drivers/firmware/google/Makefile                   |   14 -
 drivers/platform/x86/Kconfig                       |    3 -
 drivers/platform/x86/Makefile                      |    2 -
 drivers/platform/x86/asus-armoury.c                |    2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c |    2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |    2 +-
 drivers/platform/x86/lenovo/think-lmi.c            |    2 +-
 drivers/platform/x86/lenovo/wmi-other.c            |    2 +-
 drivers/platform/x86/samsung-galaxybook.c          |    2 +-
 .../linux/firmware_attributes.h                    |    6 +-
 29 files changed, 1335 insertions(+), 64 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (57%)
 create mode 100644 drivers/firmware/coreboot/Makefile
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (99%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 delete mode 100644 drivers/firmware/google/Makefile
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

--cnRE5EHRFwHQBTaX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS0yQeDP3cjLyifNRUrxTEGBto89AUCatVqJQAKCRArxTEGBto8
9Er3AP9auzReyp18MlaWGBN20EPuke1HSFtgRzit9sDjr5MgKQD/Tqen83Kw6fOS
30E9etENqXAjaY3b6ggJHAr/3csRFAw=
=IvU4
-----END PGP SIGNATURE-----

--cnRE5EHRFwHQBTaX--
