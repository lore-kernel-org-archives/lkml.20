Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845957D238;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884726; cv=none; b=sBxDFrLtAVVUgymRRX/zN2AwFNDuQLxpvLEjxq/kOziKm2463BHP81nzDesNHU+ZC0g/sWN18d9hSXK5YG7nLjosGoUQfXExvDxxFasqkZTSQOoeW0/nLgwI4DhFZM1je2XSjDW8GoqF3BGZl1KPtmw8BNqiXBY8JAY2WsqbFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884726; c=relaxed/simple;
	bh=4+muMEoWw3cPoLSSzPR0U9e4YeLXdeRe95f6AWfkX3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PK/qmz4ZqKlwHbvGdTQfQ4E9b8Cd601RpeLjmz8uvSsRGMhwnRcK7oh4HiSE2F2XFN8wg2F2arSI+ajjypSArITAcN00F4fdefjneAJypPdjrsELgR07pHFy64fetXBlgzHhwtH0PeBPgOhRuN80jJsQhjCHt+5cjjdJAZOo8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNkxQgti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNkxQgti"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B268C2BCB8;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788884726;
	bh=4+muMEoWw3cPoLSSzPR0U9e4YeLXdeRe95f6AWfkX3o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fNkxQgtiaSMERuOU2wVycHc2PThPn+QZNMUB+ZZ7ZnnK+QjsCnOLAxRJAAqeRyNAd
	 8MNOQPZy5xotOdjVxO9eVoPVldHe6tWiaq4MgWa6M4YCAGqoqmcKDo9tV7IwsaaQ0u
	 kBy1fElLHzAp6a4HekEGSxtVHD5Rfgc14ay2QjpU+JTMBdg7aUP2W5D3NnlR/jAE2v
	 BF3qyA+IoRR6EqiRvi2lnJArr+Iovf/RgwNJsT/ZanU28IrtH2PDHgV/sxdPXvLvbP
	 F5snLNnR6mHeBMXa6L6QhmAa0mE98B8lBFIG7ocyJtz+qUhZpYJdc4NbFRYUPL731f
	 a8LkYiESVOCKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2437AC79F99;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Tue, 08 Sep 2026 04:12:42 +0200
Message-Id: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABpvn2oC/43NsQ6CMBDG8VchnT1ztASqE+9hHFp6lQ4CuWKDI
 by7hcVRx/+X3O9WEYkDRXEtVsGUQgzjkEOdCtH1ZngQBJdbSJQ1XrABPzK8pjgzmScMdkkK3Bz
 BWuocVqi0kSIfT0w+LAd8u+fuQ5xHfh9/UrmvP8lUAoKvlHeIUttGt56Jzp7FDib5HyIzUtvKe
 KfqUqP9Itu2fQC73TaL/wAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788833565; l=2061;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=4+muMEoWw3cPoLSSzPR0U9e4YeLXdeRe95f6AWfkX3o=;
 b=67315suM+GsZ6EL42fG/+PWICzlCEB+krrRAUp8QOUeulfHHHg1IGE4H7HryEnn/wABCORfSo
 KZzd4sulMJ2ApjC6eN7Dt+CQ1yew29vmrgy8H5wzKJIxIqUOkvCSywD
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
      dt-bindings: arm: fsl: add freemobile,nbxv3 board
      arm64: dts: freescale: add Nodebox v3 CPU Module

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 335 +++++++++++++++++++++
 5 files changed, 379 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


