Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFBC8D9;
	Sun, 11 Oct 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710009; cv=none; b=bfzJNkXz6RGIzzO8Fzdo2E28rZwpxkFMeh3ZyfoAdPXmOYwz/YQ1AGkU3QcU3dSWDIFEok1Cq+QaRH4eyTLCTTV3GQhs1dD0bLpM5TUuNqSAzordtOy5Vv0v08TtygfgQB3pmpbP+fgpao/GG8iMyEwFFEnZrFEtGXcnE3WBTmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710009; c=relaxed/simple;
	bh=3YRk5UGBS0VOOHj9mW933zZqL8ZW8nf7hwX5dyuXdYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nrPS4AXUY8t1BsgJzCQNH8P31fnSmvDDHrwvaP2uYBXWgfLABW2A/KELmuI62mqQLorB5oPx8rp1qWEhIXhH+PVd8YkniXBcxgmq1p2lkLklDNjWg6S87/5WzGgSsOAs6gbQwAZi9KR6cJotkkgGXMMOQO63OL3m339o1exQwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/r/MS1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/r/MS1M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A3CAC2BCF5;
	Sun, 11 Oct 2026 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791710009;
	bh=3YRk5UGBS0VOOHj9mW933zZqL8ZW8nf7hwX5dyuXdYs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=A/r/MS1MwS0wF9A82r4atVt85P087DtelJGdttSc5p8RA+0atwncFzhL5r2JVndaQ
	 G51NbP6r10gg00w7622jlRBqfM3S7/h1G7kYt4rcEEqjHk07i+nO3uk9UYCU9SXNek
	 C6JG0QCU2cb3jVHcHIZtZdJ8FhQ8Mj2qcxMYXzfc93GiRWaGSIeHxZJaln0vUrK4aW
	 gW3PVdUau2IH1wLAWsIiA3Dz78mmY3o5WCsDIbGbIzEbLfi3lg98m8X3cxLv9hPJA8
	 pUwA0rd++Fk0s9XhJwQYWcQr515nQ+G6v0t/c1VpyioJU11rhoy2U58K6/lQuLJgSz
	 axOnGE+Rlhm2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14125CA9EC7;
	Sun, 11 Oct 2026 09:13:29 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Subject: [PATCH v4 0/2] media: i2c: Samsung S5K3T2 image sensor
Date: Sun, 11 Oct 2026 11:13:26 +0200
Message-Id: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ7CIBCG4asY1mIGBurPynsYFxQGRWPbADYa0
 7tL66bRuPySed55sUQxUGK7xYtF6kMKbVOGWi6YPZvmRDy4spkEWcFWAr93KUcyN570FbPkEmt
 EZ2pAoVlRXSQfHlPxcPzsdK8vZPOYGS/OIeU2PqeXvRjv/td7wYG7SsFagVcgcN/FNrfN6kZsr
 Pdy7vHXy+JBee8MogYrvj3Ovfr1WLzRVm+ct2Tldu6HYXgDcADQxkABAAA=
X-Change-ID: 20260920-upstream-s5k3t2-23b33dab0315
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791710007; l=4010;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=3YRk5UGBS0VOOHj9mW933zZqL8ZW8nf7hwX5dyuXdYs=;
 b=W5H5IXa0Ch1yt7cxdYyWgep0m0D6UNc09Zz9lqF7aCYUokobV+OCC8vdGg3/hg6YcBG6OhJIH
 fVU3av8iX+wDPguq+/dQocy6nsgdtowJakMpTgHxmN/tIy0J3GhYN1n
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
  capture in all three modes, twelve runs, no kernel error
  the sensor returns to runtime suspend after every run
  exposure and gain sweeps checked on the captured frames
  Bayer order checked for both flips

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
Changes in v4:
- Use ARRAY_SIZE() instead of the S5K3T2_NUM_SUPPLIES macro.
- The link frequency and pixel rate controls have no ops now, the
  driver never writes them.
- HBLANK and VBLANK are written from s_ctrl. The line length and frame
  length registers are gone from the mode lists. HBLANK is not read only
  anymore, but its range is still one value per mode.
- The flips are written from s_ctrl and are clustered.
- 0x0100 and 0x0101 are written as 8-bit registers.
- The mode is not kept outside the subdev state anymore. The crop
  rectangle is kept in the state too.
- Every control call in set_fmt has its return value checked.
- The fwnode properties are parsed before the control handler is set
  up, and the control flags are set after the error check.
- Dropped the link_validate op, the redundant fwnode and endpoint
  checks, and the gotos in power_on and set_fmt.
- The error labels in probe start with err_, and remove calls
  pm_runtime_dont_use_autosuspend().
- Small cleanups: container_of_const(), local variable order,
  s5k3t2_format_from_mode(), and init_state returns the set_fmt result.
- The link frequency still follows the mode. The question about it on
  v3 is still open.
- Dropped the line about hidden modes from the commit message.
- Link to v3: https://patch.msgid.link/20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me

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
 drivers/media/i2c/s5k3t2.c                         | 1331 ++++++++++++++++++++
 5 files changed, 1455 insertions(+)
---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260920-upstream-s5k3t2-23b33dab0315

Best regards,
--  
Armandas Kvietkus <armandas.kvietkus@proton.me>


