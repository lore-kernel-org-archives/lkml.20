Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973309;
	b=wxnX/sKB7EIHXLj/cXuZaYLdnZpwf2IiIS2pmak21GA+tK5UNh1FsEYoxcHI1GM+W+Yx
	 mFX2IsK/v5NEqNLtlJIRMRxDqqEy5zKZpMnDhu7brfLj1bPjgDQvaldxggz1DpWM+Ul21
	 npuvBNeSwxF8LOceh0X5FLVLubCts5RUf6xDiVzjHgmjxgjlMXybS3RjBG5Kj9EjbBT4t
	 W6324Oa30ZN+Az5jPZSCNW7mpITsif7UOdD5zogZPXSfIO7gUPP3DkEU3wNdsn5zYbSHW
	 3xrkHG3e3S3v8z2aW1hO+xIeeFfDFVBRuTrGLzhDEn3wx39ijwuvnh/OjyTZzG9r+aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973309;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:
	 X-EPHeader:X-CMS-RootMailID:References;
	bh=QWsQgLiwnkC/ulnhSGJ/u2XyKoE/N56d2d46C2Nra3g=;
	b=hbcd35hRY5QCP6bFxDZGRwkoJY7cFVdf31QqU35qYlcw+ShK8oJ+ACdqIHCK40JiZZzc
	 8KdOpWJ24YZSHPSOtSRyE1RsWJsb1yQYzVC7lenGgKZUBXKXIoz591w/sfnCLuN8d41Rw
	 eO/4o6UI9qUqO9mx7t7xzQkjVuCtJXxKCqQwxs1qw5idD35JFUowWKYQQP050twswvwTO
	 MYgpWZGtWAzBTPVFrbuW+gpKNTin5k5MY6HsiucRhX34Imv0pVi6yTnH4B1i7sKl6CXW3
	 o+PBAe6eovHKDbRrmLbgRr4UmplKNsLi5yyrDfZcJqWXl2qjiL3Te2FYu1NdU8Ymg3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KE4SEBQ2;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AEE606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AEE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KE4SEBQ2
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135505euoutp01694a0352ebffb4beda10118e44dbd661~leTeEOK3w0202602026euoutp01V
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106135505euoutp01694a0352ebffb4beda10118e44dbd661~leTeEOK3w0202602026euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973305;
	bh=QWsQgLiwnkC/ulnhSGJ/u2XyKoE/N56d2d46C2Nra3g=;
	h=From:Subject:Date:To:Cc:References:From;
	b=KE4SEBQ26l6lxX381jqVk0oL+gySE9u77Wui03TMdem8UBwYWvzyU/dukgMGiGr5h
	 ayqV4bmD7lwcvLyE5IGn7GOrS5QMvJyHZgzHm9aKtJOV2IxgsQddru8Aw2r2cQCLPU
	 xdYnhkOQbMutJnmQlelaZUqY9YIXC+N5oY/N59oU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb~leTc9VSqF0517605176eucas1p1d;
	Fri,  6 Nov 2026 13:55:04 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135503eusmtip2ef623fe1ef475ee1b18554c6ad6b987c~leTcEUONE2093020930eusmtip2_;
	Fri,  6 Nov 2026 13:55:03 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v7 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Date: Fri, 06 Nov 2026 14:52:58 +0100
Message-Id: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrb7WoC/3XOwQ7CIAyA4VcxnK1hsAHz5HsYDxO6gXGwDCUuy
	95dtkQTDx7/Jv3amUQcHUZy3M1kxOSiCz6H3O+Ito3vEJzJTRhloqBMwc3KoqDgvA9gTe9gsBM
	ojpVuG1Fy5CSvDiO27rWx50tu6+IjjNN2JVXrdANpzeoPqO/YeIjoDaQKKCh2LY1CroWWp9j08
	em7gw49Wb0kvsb/p5LITMu5rIUqTS3xl1mW5Q2WKpyw/gAAAA==
X-Change-ID: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, 
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3883;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=o256jFXr6zL1bPuxFl+13GnEJ0mu3QrvYdJuIVka6jY=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vWPOLnuiU2bNPI1Dofp/3uuK2tQet5NvWtGb92D9h
	21Ncwy/dZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJKE1lZFgVuve2wErlg7xr
	z+ZmvBZYt0t5v/VqXRbxd9u3yBwW//iF4X/xmZ2/3u5yeVH6mn/BisSzEnY/gh8xbu5uFZq5c7f
	Lq4vcAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
X-EPHeader: CA
X-CMS-RootMailID: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
References: <CGME20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb@eucas1p1.samsung.com>

This series adds the HDMI PHY driver for the StarFive JH7110 and shares
the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
HDMI PHY.

Up to v5 it was part of the JH7110 display series [1]. It is split out
as Vinod suggested, so it can go through linux-phy on its own; the rest
continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
Nothing here depends on the display series. The display series depends
on this one: its HDMI subsystem binding references the PHY binding from
patch 1, and it needs the PHY driver at runtime.

[1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
because it sits behind the HDMI controller in a shared register block.
Patch 2 factors out the pre-PLL config format, table lookup,
determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
post-PLL and analog config stay SoC specific.

Patch 3 should be a no-op for Rockchip - same writes, same order, same
values - and RK3228, whose pre-PLL is at different addresses, keeps its
own register code and shares only the lookup. I have no Rockchip
hardware, so it is build tested only (arm and riscv). A Tested-by would
help.

Patch 5 adds a MAINTAINERS entry for the binding and the driver, as the
other JH7110 PHY drivers have.

Testing
=======

Tested on a VisionFive 2 v1.3B together with the display series, using
modetest: all 42 modes the sink advertises work, with pixel clocks from
25.175 MHz up to 297 MHz.

Every commit builds for riscv and arm.

Changes in v7:
- Point the binding example comment at the hdmi-subsystem binding's new
  location in bindings/display/starfive/, where the display series moved
  it
- Rebased onto v7.4-rc1
- Link to v6: https://lore.kernel.org/r/20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com

Changes in v6:
- Split out of the JH7110 display series (Vinod)
- inno_read() returns the regmap_read() error and recalc_rate checks it,
  instead of a failed read turning into a zero divisor (Vinod)
- Bound the pre-PLL and post-PLL table walks with the table size instead
  of relying on a sentinel (Vinod)
- Lowercase hex in the JH7110 pixel clock table (Vinod)
- New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
  the display series' entry
- Rebased onto v7.3, collected tags
- Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

---
Michal Wilczynski (5):
      dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
      phy: Add common Innosilicon HDMI PHY helpers
      phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
      phy: starfive: Add jh7110-inno-hdmi-phy driver
      MAINTAINERS: Add StarFive JH7110 HDMI PHY entry

 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
 MAINTAINERS                                        |   6 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-inno-hdmi.c                        | 358 +++++++++++++
 drivers/phy/rockchip/Kconfig                       |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +-----
 drivers/phy/starfive/Kconfig                       |  20 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 587 +++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h                  |  88 +++
 11 files changed, 1144 insertions(+), 144 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

