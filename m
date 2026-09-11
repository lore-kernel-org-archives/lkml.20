Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965244AB89;
	Fri, 11 Sep 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109840; cv=none; b=fc1csFsRt26BD6Wjta6kpZJmOippwE94BNleUS64fK9homNYEVGRz7pqNwqDzBsuCQIsyxExIcWPCzuHMcd5jQK3xbmnSGCbqMjVX+uwZDaGMLOl/bl7g7pB7BUrlcj6Gal8dHEvDc02qmtewmXuJcQ4SfYGS+cnMDC9wkkpLKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109840; c=relaxed/simple;
	bh=lLKAr0py3XLQO7ZAwMla58ZVBR3dtXv+Ft+PK3PYjUI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hp8krgxzWRK80TSg19bKjMvEp3XKAgvP6N00INJbNgjBqrGM7/6TRurIoKKRipyQCeZscBs3/xf6N6GjiTK78CZJUyTRa1dD4pkG95oTyFfgLmSifD5wjcq4wutH0Bqrpzud562lsRRzxowFAlnVkcIqrGmQwExRovgUjJxliLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMMIS3Iv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMMIS3Iv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8576FC2BCF4;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789109839;
	bh=lLKAr0py3XLQO7ZAwMla58ZVBR3dtXv+Ft+PK3PYjUI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LMMIS3IvaO4WZcUbQdUP2cUNEwchAqiJrJWrWU/8gwTGxSW+M0YTubBFJaHd3mriB
	 PcA/KIWOksmQZqjLR4In7/QtuGxSlA31QyPEuBXVVdjeZ4pijk6KsPdl04yRkLsZ7i
	 vuKHmuofwG9XgLJcSXIC7i76tGbVk48JkqCXhjsc5LgAJbi9Cv9ClvVKkgQUhwr2kK
	 HCniByaAuoRkCgoiqdC8agJCKtTJEfpnXo5UXlGP3LiO2HGJK1rmchGIK6+9ZjnIh2
	 Ez0ydykOEcKMw1/GwWjscRw7BvA1Sw3VVfa52X6s1r3g3zxrsyvuAVD4CnoNR26ZST
	 DmVFwraXp5OoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6187FC88E45;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v4 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Fri, 11 Sep 2026 02:08:32 +0200
Message-Id: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBGo2oC/43NTQ7CIBCG4as0rMUMP6HoynsYF1AGy8K2gUpqm
 t5d2o26MLp8v2SemUnCGDCRYzWTiDmk0Hcl5K4iTWu6K9LgShMOXMEBaur7SO9DGiOaG+3slAV
 1Y6LWYuNAgtCGk3I8RPRh2uDzpXQb0tjHx/Yns3X9SWZGgXopvAPg2tb65CPi3keygpn/h/CCK
 CuNd0IxDfYTEe+I/oqIgjCnteUNY0rDC1mW5QlAVd5iRAEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789085313; l=2593;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=lLKAr0py3XLQO7ZAwMla58ZVBR3dtXv+Ft+PK3PYjUI=;
 b=YLJde1xYLMvUwAFRW+FHU64nXhm9OLL/41ryfeyuJbICrr3Yb6BgxaD9mX4KI4/ez/R3tnMlr
 0RRIsRRxsmlDr0u5yTWhdBz7in6YbZfT3Rirxa1jvtxu6vrOFR53kwZ
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

The Nodebox v3 is a Free Mobile CPU module built around the NXP LX2160A
(16x Cortex-A72, DPAA2).

The same fsl-lx2160a-nbxv3.dtsi shall be used verbatim by the
U-Boot port, sent in parallel to the U-Boot list, so the two trees
cannot drift.

Dependency:

the DTS uses gpio hogs on the QorIQ GPIO controllers, which
needs the commit
  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
already in gpio/for-next and that will likely arrive in v7.4-rc1.
Until it lands, dtbs_check reports the five hog nodes, the rest of the
tree validates clean against the current schemas.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v4:
- dt-bindings: arm: fsl: commit message like the other ones (Krzysztof Kozlowski)
- Acked-by on the vendor prefix
- Drop U-Boot comments from the DTS commit message (Frank Li)
- Boot NOR reset: reset-gpios on flash@0 instead of a gpio hog (Frank Li)
- ethsw-mdio-en: regulator-fixed instead of a gpio hog (Frank Li)
- ethsw-reset#: hog dropped (Frank Li)
- pltrst#: platform without consumer node
- Link to v3: https://lore.kernel.org/r/20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr

Changes in v3:
- Drop the thermtrip hog on gpio1 line 23, should have been clean'd
  before
- Link to v2: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr

Changes in v2: (from Sashiko's comments)
- Makefile: dtb entry in alphabetical order (before qds).
- Move the XSPI1_A_DATA[7:4] GPIO mux group from &fspi to &gpio1, so
  the reset hogs on gpio1 do not depend on the fspi probe.
- gpio hogs: describe ethsw-reset# and ethsw-mdio-en with their
  active-low polarity (GPIO_ACTIVE_LOW), same electrical levels.
- Link to v1: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr

---
Vincent Jardin (3):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add Free Mobile Nodebox v3 CPU Module
      arm64: dts: freescale: add Nodebox v3 CPU Module

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 321 +++++++++++++++++++++
 5 files changed, 365 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


