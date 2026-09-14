Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7256445AC8;
	Mon, 14 Sep 2026 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388362; cv=none; b=Z9V3h7v+sHZRy3bhI8uB1ZiMuOzmHxN0HfghOPkZdQTKSp3JnDTwcm8e9JBEARG5gxm2Vto7IVjs2fnj557ShLXare1t4zBQBnoiPZKlgr4DJzKB7XpYDELYSRSxoKYqNIMuRA4iOSrVdwySKZVIo2qBTh1Jkl0Y5i/BRUreiOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388362; c=relaxed/simple;
	bh=5slpKuydx4cE/DP8HicJnI6eOoZv1uHeyTPo9pAk/TY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VdUL5Q6DjP0UhbEhyRsh4gd5CNPC1WAZqbdhKGXnilHP1GprEypD9xxrA/c9RdfRlbI3NJadgYmLrQgVMx7Pr0Hv1pkfHZ9ZkiS4ZbH3vx2b1EKwlb5b+EaSA8CzCT+xWUoOP9E3Zh5hfAK/uSkV851gLs/06g6CmBuj5LJUMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: lucas.sinn@wolfvision.net
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: s.hauer@pengutronix.de
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: mchehab@kernel.org
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C16A12009B9;
	Mon, 14 Sep 2026 14:19:10 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3 0/4] media: rockchip: Add JPEG decoder driver
Date: Mon, 14 Sep 2026 14:19:03 +0200
Message-Id: <20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfmp2oC/23N0QrCIBTG8VcJrzPUpVhXvUd0sfS4nQIVXbIYe
 /fcIAjW5f+D8zsTyZAQMjnvJpKgYMbgazT7HTF96zugaGsTwYRiWnCagnmaHiN9ROgsGMqs0po
 Zp6QypJ7FBA7HlbzeaveYh5De64fCl/WLHbdY4ZRRzTjXQtydZOwSwXevIQWP48ECWcQifhX5R
 xGLolqn5althFIbZZ7nD69WL1f7AAAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789388350; l=2815;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=5slpKuydx4cE/DP8HicJnI6eOoZv1uHeyTPo9pAk/TY=;
 b=lgzC1brKImex1us8oON15MMG75YVn97w5oO9GDBV/cu+7ZO1bDVmF2Em/26AVu3087XmUKUGs
 2+hJkjd9Y75BsTLx6iC54vu15OgVdZTeHdVRaFZAYXcz/Y5U7H2gzEP
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
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2354 ++++++++++++++++++++
 10 files changed, 2751 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

