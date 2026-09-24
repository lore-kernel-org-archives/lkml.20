Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE205370AE6;
	Thu, 24 Sep 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228812; cv=none; b=XuSY17ftYbk5ZG8eaB4g5yxWB9hSE3dmF6nEuqCGG44vJj6WDS+dLKQwLo/JhvA+b5paT+I91YIDq1FL9b5MlZvXu0twpsHt6/HCYOXmynd/O6meFXDlbmw67LsdkvHVKo//2YvvKHdqG/6aeJLq3em7Y4YcVXod1+aoF6aCHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228812; c=relaxed/simple;
	bh=1RBMKeIl1TPcqPSqBsrSzVUPns1SAmNi3L4qwb0igeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BACwib8woLUp6AEq0HC3sA5eMA8Gpf9GE19NpcPuSha7GEI/aFdDwuvy6xgebBmi8DtiP8jMY4wDckHqClDBRMjmr4gm96aU33z2MCwqn/bQY1t713QhRJ01b8wLbd1aalQTzeLM6tPpZMLd4dWAu/AFP8aziYkRkr0nGm8JI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWufjpU8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWufjpU8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 494FBC2BCB3;
	Thu, 24 Sep 2026 05:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790228812;
	bh=1RBMKeIl1TPcqPSqBsrSzVUPns1SAmNi3L4qwb0igeg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CWufjpU8+PxGDCuTRofTegP70pvRab8BCcNKcCjGXhcJGOqkOE0HbutsmB9u+gToY
	 5sIg412RPmUBJaWycRSXd8GNTfK4slILTHTPmilHTvLpcdIygmJ1nuXLVeDETa06NL
	 FU8DEw5y1fFPIKBY2pvbb7jvCDCxpBrR3kFgbn7NRCYGtd4huUQ7wQv/90LYVKc1tj
	 LKf5+w98Wzi4e+uOaFF156HIN9+DW6Z6gc3zXDVYkl6T0236PyRh5ebGlugAgjIYA6
	 D+imDcfN5I57J85D0jazWzAlIDldSxwiJhhppKLM6peKgMW3cVXmjij8oZMV1zMHo3
	 HhcTSan2MfEkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0A8C98310;
	Thu, 24 Sep 2026 05:46:52 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Subject: [PATCH v3 0/2] media: i2c: Samsung S5K3T2 image sensor
Date: Thu, 24 Sep 2026 07:46:50 +0200
Message-Id: <20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBQFr9KwFvPh0xpdeQ/jghawaCwNUKJpe
 nehbpoYl5O8mTeToL3VgZyqmXidbLBuyIC7inS9HG6aWpWZcOANHDnQaQzRa/mkoX5g5JRji6h
 kC8hqkq3Ra2Nfa/Fy/XKY2rvuYsmURW9DdP69XiZWdv/riVGgqhFwEGAEMDyP3kU37J+alHriW
 x9/fZ59EMYoiVhDx7b+siwfFEQCowABAAA=
X-Change-ID: 20260920-upstream-s5k3t2-23b33dab0315
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790228810; l=2622;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=1RBMKeIl1TPcqPSqBsrSzVUPns1SAmNi3L4qwb0igeg=;
 b=h7/MbXtwSyiZJkV5CHaCYJo3nngUG78MnXpzyJ5gLgVsqd0g5rEJXVkNH/cuHIk2IM/O555i0
 aA8u1QR0SRVBLX0CLJhwEBbNNO7jfWKyBONWEBEs/ByGjbJsKb3o1cW
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
Changes in v3:
- The check on pm_runtime_get_if_active() is back to the form used by
  every other sensor driver. The v2 form skipped the register write when
  the helper returned an error, so a kernel built without CONFIG_PM never
  applied exposure, gain, blanking or the test pattern.
- The binding now requires clocks and the three supplies. The driver does
  not probe without the clock, and the sensor needs all three rails.
- Link to v2: https://patch.msgid.link/20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me

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

 .../bindings/media/i2c/samsung,s5k3t2.yaml         |  105 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5k3t2.c                         | 1360 ++++++++++++++++++++
 5 files changed, 1484 insertions(+)
---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260920-upstream-s5k3t2-23b33dab0315

Best regards,
--  
Armandas Kvietkus <armandas.kvietkus@proton.me>


