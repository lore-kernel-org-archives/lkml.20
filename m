Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569D525A8D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906250; cv=none; b=eSY+QFyjv/xK1zXSZ5404GPNf/qW+8Gldx7KyaCb9zL7/PoEuc+qbwWsRnDjNdrFpGTFoopQhciFD/3Up89glEP5H+Y7j2/JpYIgfxXGOpAk0sdBXFfFVmU5jtx6V0L1t/hOPWnSoMsukK147Dr+ytTr+W8G7ZflCskKQGgXXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906250; c=relaxed/simple;
	bh=s3OP53YM6UZgPmvmVgBzyu1lpGp55DXcoNc1/Px6XC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msE7Qdrh/QWCnufQRjRg5xqOJfZKmg8Zyhds/M64VUwiAKsN/kBI1hSM//4aTUudWFgRZK8+wgleL9lJfXejXZIqedY0RZPNJOyBxZ2djUJOsTL5BzsJ8zlFdWvphTFrIkRMI2L3YIrpRfmuvmet0rAZ/BuC89a1zQfsThnpge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmIcc1Kp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmIcc1Kp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E436E1F000FF;
	Tue, 13 Oct 2026 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906249;
	bh=W78kZ1CgDdZuzUUrohZw5Ufe8Bw47xYePQvZ2XNrxog=;
	h=Date:From:To:Cc:Subject;
	b=mmIcc1Kp+Y0fZD6dh1Yl8y75+thxzWmWBDMiPRf5EsZxXFcfm8kDG/W9FQNfTleTf
	 xXZaGp8M34aRDQ7b/XMTGEPkNeHJbbygsx0A85D07bvYhg3dCRoKd89lZoiZObuZm6
	 KmIGHmtGPLppUHGaLjuPxGtZIGudKFBwcaUxRJKPz0sODpZoSJYL+AU1iphLck/rME
	 Lmbe918vElF5r2cF23lSr1/B1dI/5SwkKldXlXBQmKbs7ssPy0zJI7mP2hfla1xG/V
	 7j2Z3FdooccB/b7SzBteLBDMd5kaEKLbxTyYoWHVsSUp1HsdTAcj1tPrXTvKIoQ4mK
	 Lk7msLV3dqlPg==
Date: Tue, 13 Oct 2026 16:44:05 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jic23@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL][4/4] standalone cache drivers for v7.4
Message-ID: <20261013-crewless-glade-be3d2efb5be7@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s93d3e/JLXkayGaG"
Content-Disposition: inline

--s93d3e/JLXkayGaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull 3 bugfixes targeted for v7.4 due to their low priority.

I think one of these may have fallen on the floor due to being late for v7.3
and deferred in patchwork [1], so my branch is still based on v7.2-rc1.

There may be another driver appearing here, via the arm64 tree, but I
don't expect any conflicts at all if it does, since nothing here touches
makefiles/kconfig etc.

Thanks,
Conor.

1 https://patchwork.kernel.org/project/linux-soc/patch/20260813-cope-smugness-dd4de191bdda@spud/

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ cache-for-v7.4

for you to fetch changes up to b2f3a170ae968fac6270e89ce5738685bd2e530c:

  cache: Make cpu_cache_invalidate_memregion() error out if there are no handlers (2026-10-13 15:43:48 +0100)

----------------------------------------------------------------
standalone cache drivers for v7.4

Three low-priority bugfixes for issues in the hisi hha and sifive ccache
drivers as well as the core code.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Bence Csokas (1):
      cache: Make cpu_cache_invalidate_memregion() error out if there are no handlers

Pan Chuang (1):
      cache: sifive_ccache: Remove redundant dev_err_probe()

Pawel Zalewski (The Capable Hub) (1):
      cache: hisi_soc_hha: use named initializers for acpi_device_id

 drivers/cache/hisi_soc_hha.c  | 2 +-
 drivers/cache/sifive_ccache.c | 2 +-
 lib/cache_maint.c             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

--s93d3e/JLXkayGaG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5RxQAKCRB4tDGHoIJi
0g1RAQCmFfHxNZAvKNULY1uTIe9+JHRW8p8jnPgbW81o5PbcxgD7BW4RVP+hbFAX
gDe7VeWsqRIPAb35g1xCqRKPrcbb4gI=
=DyBl
-----END PGP SIGNATURE-----

--s93d3e/JLXkayGaG--
