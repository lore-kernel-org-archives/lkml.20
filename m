Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669413AA1BB;
	Fri, 18 Sep 2026 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711638; cv=none; b=PVUfDZqhWFsGZzsgHnLhvlRIvsMulaCNtoa4ovFqbC5Rj3DUBxBElq6ow9iCq8ErLEF9mj6ZCLG9q6iI8LGwm6io7tYL9Py4DZOH306Y/nVWwX+WvAQx/KeghjqOEwqthPIU4bwF02FjsUFdk+QGIcbSqApXD953c2wuOB6uCLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711638; c=relaxed/simple;
	bh=bbsVHa9zCLHZMNMACh5lzpuPIke0niU4PJob2wVHPVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pDiyCDQsTfGq/wm25kB3rwJZB1NzY69mCH/G3EefMOmjWR/bru/QSyj4wRaIqGl//tsESuThj7wmPyhFsH3oBqzdKpEiFAHkneCnxwkKEY9D3KYqWYuwbWTqvGIxo2ElOwRYbRVt/tKT9txGl3ValX8W1V9+ekZTwd+n8FLlk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A2118200210;
	Fri, 18 Sep 2026 08:07:05 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v4 0/4] media: rockchip: Add JPEG decoder driver
Date: Fri, 18 Sep 2026 08:07:00 +0200
Message-Id: <20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATVrGoC/23OwQ6CMAyA4VchOzvTdWwOT76H8YBbgWkCZCDBE
 N7dQWI0gePfpF87sY6Cp46dk4kFGnznmzpGekiYrfK6JO5dbIaAGgwKHhr7tJVv+aOl0pHl4LQ
 xYAuttGVxrQ1U+HElr7fYle/6JrzXC4NYpl8s3WKD4MANCGEQ74UCuLRUl68+NLUfj47YIg74r
 6gdBRdF54VRWS5R611F/pRM7P0ioyKVkVaetAOHG2We5w+FNBx5QQEAAA==
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789711625; l=3149;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=bbsVHa9zCLHZMNMACh5lzpuPIke0niU4PJob2wVHPVE=;
 b=qoVboP9nYX8ejrVSVDE7yA2yLI2/xT1fgEsAoJACRtDT6n5FvHwRfNn2edQ0GGm1g6gTuICXM
 dwFQSkjKZ4pAqFVYYF3CXW8OUzgAPTq9RwKYI9RClzffYueVMZThN66
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

This series adds support for the Rockchip JPEG decoder hardware. The JPEG decoder
is an in-house IP which is integrated into various Rockchip SoCs. The driver is
tested on a RK3588 board but reportedly works on RK3568 as well.

An earlier version of this driver was posted as part of the Hantro
driver [1]. That turned out to be the wrong abstraction, so it was split
up into a series with the Hantro fixes [2] and this series with a
standalone driver, which started over at v1.

[1] https://lore.kernel.org/r/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de
[2] https://lore.kernel.org/r/20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v4:
- Set and read the source change flags under fmt_lock
- Check the runtime PM state in the interrupt handler
- Use dma-buf CPU access around the grayscale chroma fill
- Update the review notes in the driver patch
- Link to v3: https://lore.kernel.org/r/20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de

Changes in v3:
- Rename binding to rockchip,rk3568-jpegd.yaml to match the compatible
- Link the earlier Hantro based series in the cover letter
- Enable clocks from the runtime PM callbacks, use pm_ptr()
- Protect capture format and crop with a mutex
- Clear bytesused on capture buffers returned without a picture
- Revert padding the capture buffer to the MCU width, it broke 4:1:1
- Add notes on review questions to the driver patch
- Link to v2: https://lore.kernel.org/r/20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de

Changes in v2:
- rename clocks from aclk/hclk to axi/ahb
- Add missing Signed-off-by
- Fix suspend/resume path
- Pad the capture buffer to the mode's MCU width, not to a macroblock
- Reject a frame header picture size outside the supported range
- Set the capture payload at decode time, not at queue time
- Trim comments in the driver
- Link to v1: https://lore.kernel.org/r/20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de

---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,rk3568-jpegd.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   15 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    3 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  230 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2385 ++++++++++++++++++++
 10 files changed, 2782 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

