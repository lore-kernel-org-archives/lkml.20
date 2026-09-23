Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BAD566C49;
	Wed, 23 Sep 2026 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176712; cv=none; b=J/brJyGOwvhRV/kzUebq/gjv1out6+dG5nGnSfbwJ6abP5sBOKHCyR+Yp1CNaQhHdcu4qUes65eoQGd6+Yq6eKfwaZg7/qszhFyiyaEQnwfV3pRWy6r1GG/4MGyk+boh41UHa431K4IY/4MNXK+fS4IDEwRsb8jkVmfUZCrPauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176712; c=relaxed/simple;
	bh=TlV97CFzCy+zHgSgBmv0VZ2aS6sqcxAu7F6eX2JccVc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mmCF3dhz8oIJbuIfjWtjKxPsx9K/2JtjmBQYMNiRwWv/RtvtGIt8RAAruK2n1bMkvRhNV0zdy3uVwUdASYmnDE0t8ZyJuFbBwkY7GHNdA0CrZCiJvnh+3/BZHhYpZoH0ft5NJBWjNjhhX6vAZe0VcrinWdw+NbmBcBsfkHxTHDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn24C4VO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn24C4VO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45BC4C2BCB8;
	Wed, 23 Sep 2026 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790176712;
	bh=TlV97CFzCy+zHgSgBmv0VZ2aS6sqcxAu7F6eX2JccVc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pn24C4VOZcVbAqF4VkMY9n8vgiXn/2s+ZxuIs7dZqbX5HNqvXfhi1rOsJMy+oBAtN
	 ZECMawQpWD4fK8XhzwyKslGlOBZeVOjf8ERticPrmcx8TerrqFV82tn0e5UscZ8FfQ
	 yqclJXym8dvK/uII8NEBS6MkOwJJK0bGEj+1IlbrXlF+GegGQffxvlv0eYZDkcOPdI
	 gubSQxAubUiTPLwpPFLvzH94mFGuQVE4IIcwj1Vzy8i+Z+UnoLN0JDGq6M+Az60q+8
	 qjgGTta97R8clONAbnFoKTDfb3Aefl/lfd8fcpLHRWXE065pPk+KyQto1BVX3sWqjX
	 ExZd/g9wpFLfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E84C98304;
	Wed, 23 Sep 2026 15:18:32 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Subject: [PATCH v2 0/2] media: i2c: Samsung S5K3T2 image sensor
Date: Wed, 23 Sep 2026 17:18:30 +0200
Message-Id: <20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jmbc20BYyuuIdhUWCQaqBNpxAN4
 e4WXLt8yfvvr8AULDHcshUCLZatmxKoUwbtYKYHCdslBoWqxKtCMXuOgcwouHjpqITSjdadaVD
 LAtLKB+rt+yje6x/z3DypjXtmNwbL0YXPcbnI3ftfX6RA0ZU5XnLsc5S68sFFN51Hgnrbti+ZT
 vSowAAAAA==
X-Change-ID: 20260920-upstream-s5k3t2-23b33dab0315
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176710; l=2089;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=TlV97CFzCy+zHgSgBmv0VZ2aS6sqcxAu7F6eX2JccVc=;
 b=MD8XgFMfa+kJpxPIZKSc0hDijOqamjpBQzVrIwT65kd5VCKkVKeUOo6U81Nh4i9/MCvaRx/MX
 Nd4DM2xfoOjBGpi+rbjKUWmRemjpZ70o+M9ddnuNDiI1tmR9Y8plImP
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me

This series adds a binding and a driver for the Samsung S5K3T2, a
20 Mpixel CMOS image sensor with four MIPI D-PHY lanes.

The sensor is the front camera of the Xiaomi POCO F3. That phone has no
device tree in mainline, so this series adds no user for the binding.
The driver was written and tested on the phone with the Qualcomm CAMSS
driver.

Tested:

  v4l2-compliance on the sensor sub-device, 46 tests, 46 passed
  capture in all three modes, eleven runs, no kernel error
  the sensor returns to runtime suspend after every run
  exposure and gain sweeps checked on the captured frames
  Bayer order checked for both flips

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
Changes in v2:
- set_pad_format() now stores the new mode before it updates the
  controls. The VBLANK handler reads the mode, so it used to program the
  frame length from the mode that was active before the call.
- A negative return from pm_runtime_get_if_active() is no longer read as
  active. Runtime PM can be disabled for the device, and in that case the
  usage count is not taken, so the old code could drop a count it never
  took.
- The PM ops use RUNTIME_PM_OPS() with pm_ptr(), so the ops and the power
  callbacks are dropped when CONFIG_PM is not set.
- Link to v1: https://patch.msgid.link/20260920-upstream-s5k3t2-v1-0-d640740f4013@proton.me

---
Armandas Kvietkus (2):
      dt-bindings: media: i2c: Add Samsung S5K3T2 image sensor
      media: i2c: Add Samsung S5K3T2 image sensor driver

 .../bindings/media/i2c/samsung,s5k3t2.yaml         |  101 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5k3t2.c                         | 1360 ++++++++++++++++++++
 5 files changed, 1480 insertions(+)
---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260920-upstream-s5k3t2-23b33dab0315

Best regards,
--  
Armandas Kvietkus <armandas.kvietkus@proton.me>


