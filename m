Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD4524AE8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905056; cv=none; b=YKwETU8HqbndIM/RKum4f0yxWqYjnxa9v6zNIXp3kIi2Kr3KcCZv0pWzG1/7VUrJhcm8hPqkW1izV3jTZKWhaKvn11tyFjDmmcpjUxnpqt/cuY6Hc/pn5K1LOy1MHxtv4nfoVZcPj05uE5SyjVTKihUrLWbeUQYEvWEGqq7nQ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905056; c=relaxed/simple;
	bh=tDYc4LyjD6gKm4WiB3I9XEk0oHgTI1z6LLCXQMm3LNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ETyRTFoRFATsXlOi0v9d9BTKeQjqog3UwNmi9wTT3Dm/IwGCmIffkoU+2bNrUub4nBXfqV8zQU3zulMMnxiHARb1kVZZ9JWpaB6veNc/OCO3uafTuteANvSGTaMyuI0FtYqFEOZFy0a3x1LG99GGUBNYH0Rz3KVMtPTTKqXJ2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j4shkthP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j4shkthP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9CC6B4E4120D;
	Tue, 13 Oct 2026 15:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 607EC60362;
	Tue, 13 Oct 2026 15:24:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D96511D716D0;
	Tue, 13 Oct 2026 17:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=II89p1/CaHa/QDRUunppqOGjp6XPh18gWZeTksDa6tA=;
	b=j4shkthP7zf9MpmOJX6+E0GedWVcq/X2FW+dXsueWm0nNWq5Zli1cifAkxfWz2e2sn8ZGZ
	RYyZIzRsbKEPxnINrFWm57/xwXeRC2geFaUzM2WjeZmGAhxyk9reXjR1N0kJMzHjxcMhuN
	NiZzkP2tA3qs9bmKoxxC1jDjfj3WseRtw/yRW46bwLI1nHwbX9RxQ9oLN26dQigV0VzwZM
	HggbbgdyvhgnJiO6xkVKF6mRPb4jzDHhXdlN5DSaY4Sl5sJmGVQgo1YaoYTGyXIZ2P4Ftd
	7XbB6QLd/KtmPyQjGnEIZPYvvOnF51iBP5TPhD1Qua8KYmaOfjJ3mgd6Rf5tow==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/3] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers
Date: Tue, 13 Oct 2026 17:23:53 +0200
Message-Id: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQQ7CIBBFr2JYiwFqauvKexjTADPUMVoM0EbT9
 O6Crlzq8iVv3p+ZRQyEke1XMws4USQ/ZKjWK2bPeuiRE2RmSqhatKrlEG7c0YN71/WYOhMIsmR
 GugIP2AeMJcHbxinlGi3BWpZj94D56j10PH04juaCNpV6Mc4Ukw/P9yeTLN7Po5PkgltrdlgLB
 VrDwXifrjRsrL+xMjup/8Iqh2vQ20pC42QjvsPLsrwA2mddQUkBAAA=
X-Change-ID: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Replace the deprecated *_of_get_bridge() calls with
of_drm_get_bridge_by_endpoint() for all drivers which be built without
CONFIG_OF.

Some of those drivers had a build failure for configs without
CONFIG_OF. This series used have fixes for those failures plus other
patches to convert all other such drivers to
of_drm_get_bridge_by_endpoint().

All the fixes are already applied, so since v3 there are only the
improvement patches not yet applied.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Patch 1: re-add comment, updated
- Patch 2: fix bridge reference leak in error path
- Patch 3: new patch suggested during v2 review
- Link to v2: https://patch.msgid.link/20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com

Changes in v2:
- Fix bugs in patches 2,3,4
- Fix removed function name in patches 5,6
- Mention lkp reports in patches 2,3
- Add review tags on patches not modified since v1
- Link to v1: https://patch.msgid.link/20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com

---
Luca Ceresoli (3):
      drm/vc4: dpi: stop using deprecated drmm_of_get_bridge()
      drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
      drm/vc4: dpi: inline vc4_dpi_init_bridge() into vc4_dpi_bind()

 drivers/gpu/drm/vc4/vc4_dpi.c | 41 ++++++++++++++---------------------------
 drivers/gpu/drm/vc4/vc4_dsi.c | 17 ++++++++++-------
 2 files changed, 24 insertions(+), 34 deletions(-)
---
base-commit: c1e2ea83145afeb5a693cff3b32c0e52b0608649
change-id: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

