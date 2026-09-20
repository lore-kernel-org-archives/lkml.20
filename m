Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C633C2B9B;
	Sun, 20 Sep 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916306; cv=none; b=uMsAXd/3zferLJZTUViwuA29LwaREO2aT73wQElAsy/AGOBNmozXjC8V7ea0171wbTq8owwUPu88RKP9FYWStohe5Xexf/SAiKaXGHiVKnJaibWXwZyAR0JysmLz4wE1lTimGkf6OhZNN8Artg7dO0a3hak/U7/rCOAXbU4zeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916306; c=relaxed/simple;
	bh=OcnOhEG7PexZxJ63qOQ2GyWcWihQ0eDxN/OoJZmu2EM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AWwjiC/Fs4ptQcG83P8LJixK5sR6he9fcXoU0UONF5mzrNH1fVzOxXjqisdYir2NPfzN6IMV5AjaI/zQSqZ3iOuAYeJWj14/JJkGkvH+gDSVgIHU7w1bir76/st4lE+Te+webVV+o0xse5ciuMQm3XEgMapZ2BYyeC4o/OLpoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMw5Okah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMw5Okah"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8771C2BCB3;
	Sun, 20 Sep 2026 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789916305;
	bh=OcnOhEG7PexZxJ63qOQ2GyWcWihQ0eDxN/OoJZmu2EM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VMw5OkahUeWfORCXcbcLgIem0cbi+EGYQ2pikaoIWrLlmoaNgCx4u8/2zr9i3Eax5
	 Jy4xwQ0GBrMmTwdMwxNctSco15Nx6p2WVeR5K7yoslQNG+4gChUHqRutcYXJkczBwl
	 IEOhxD2peQZ5jTO2G2oZC+a34gavL9bLlfVWrDYIx9f12+fFahi9ryihSRCmOBjort
	 ojmEAhmRCEf0afihlAF7Xex2wMhNNXKd2/75LLmXpAbfc48S7BJBxxtZnsYzXNkgic
	 z2D1c1qrb3RR7FtMKuEjT7CI6gdPtSLV2ZtBuCNraYDypIQ6L7D4uwvpgt3sLFCQhQ
	 wG75vrqVUCVzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FBEC982DA;
	Sun, 20 Sep 2026 14:58:25 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Subject: [PATCH 0/2] media: i2c: Samsung S5K3T2 image sensor
Date: Sun, 20 Sep 2026 16:58:23 +0200
Message-Id: <20260920-upstream-s5k3t2-v1-0-d640740f4013@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrBuIMyjUq0gXiU7rVPwhk4gg3
 t3YLr/FewcoB2GFpjgg8CYqy5xRPgroBjd/2EifDWixtk+0Jq0aA7vJaDVSRIPkiXrnLZUV5Go
 N/Jb9d2xff2vyX+7ivYHzvADTVXXlcwAAAA==
X-Change-ID: 20260920-upstream-s5k3t2-23b33dab0315
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789916304; l=1412;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=OcnOhEG7PexZxJ63qOQ2GyWcWihQ0eDxN/OoJZmu2EM=;
 b=kuJhV7vdtN3I0R63sX1vEWBHhmOa1Qz6cwGwnjcb3Ba9spBCpIwBWqDLWGf48YbA/hY00/BcT
 vO6i9H/3vakClchwZYh4rEhUaZkU7nfVJDU8lHCtQcUUGtmN4LuGFmT
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


