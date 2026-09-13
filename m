Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537F3C1969;
	Sun, 13 Sep 2026 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302930; cv=none; b=J+7LhPjf0yGG0a/KvFersJuxj69NyMtHf1/PrVl53BvvvNb+M0zdLE8BIw7zjywSOgobCfkDozUaXO87PoG+zOcEESfv5DzsU1xZU8uGkHFwLYaGnEIiH0rS3r6Rxduk2PPYQ4GmxiUJN5LKOBUShXJ96Ew0BmGnx9Wp6lKOODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302930; c=relaxed/simple;
	bh=dUzCkECkA/OkZoSAB4OMJbUdtyMQr7Up7oJ04mOLJRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ScOOetR8BtaELHGvgCBK6m97hzs2eA7DzxjRHOyPh6FmFsACSteO1FKBHME6gqZ2YH6hp6PRY9hp8RmjjoFJ3TW+zswTRWgh/ljjX0SPH+KiVWraWx544FJPqGP9+5xeaXQRuN2Br9ndLT5XNzhoFTI1Z9hplZ5LP4KZkabnsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5dt+48U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5dt+48U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFBFBC2BCF6;
	Sun, 13 Sep 2026 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789302929;
	bh=dUzCkECkA/OkZoSAB4OMJbUdtyMQr7Up7oJ04mOLJRY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=U5dt+48UBiPCBnlKutt2d1psFd8Zp+7iugbF05T5Mr2W8Hg8mVuk0IEzf2SMy3xMH
	 qfCMSeXj40erxEfeUNMkvp7pg8Fb5xneEa1eDwAZ1MGQrob7ksGX2GbrY5/hAJmdUM
	 3d6x/f1LWh5bCwbiwSVE5bsE8zChEGJ7pTAjyydpj3rNomV3AE7nL1ftrTzEZVlWdZ
	 +2M8k3W+WFwHmYiUH9z2d42l+4zWX7zajzC0s2PtvJQVm3SlV7CdvwHB5Duh8vj71n
	 MNchfQHt+c9ur5eydz5MAvVDhLHg1z8IIp+DxEpVkjsZNmlabzBr70nKugTDQC+PNI
	 dVohkjsxbcBBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB730C88E64;
	Sun, 13 Sep 2026 12:35:29 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v6 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Sun, 13 Sep 2026 14:35:23 +0200
Message-Id: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIuYpmoC/43Pz07DMAwG8FeZcibIcf407MR7IA5J47AcaKekR
 ENT3x1vpw6pguNnyb/PvopGtVATx8NVVOqllXni4J4OYjyF6YNkSZwFAjp4gUHmucqvc1sqhU8
 5xUvXMi1NxkhjAgPaBxS8fK6Uy+UOv71zPpW2zPX73tPVbfon2ZUEmY3OCQB9HPxrrkTPuYob2
 PF/CDLiogk5aac8xEdEbxG/i2hGVPI+4qiU8/CImA2i1C5iGEF+ZkjWDjb8usRuEdxFLCMUkgO
 TYnBqg6zr+gOxUopnzgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789302928; l=3725;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=dUzCkECkA/OkZoSAB4OMJbUdtyMQr7Up7oJ04mOLJRY=;
 b=vNSvWoYdPC+e05hcI+ayjWu4t4rveFXkMu0MAJ+noGK4CapDkDwFiqM8IYPbwwopZkqRSZNEK
 yqHMlTv6SDbDupweA1cFRW2wSLfzWFYBefNCyMazO0LqZaWYOQ+MA0O
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

About the patch 2, following Krzysztof's question on v5: the CPU module
boots on its own, so it is listed as a plain LX2160A board. It is also
a SoM that will support many carrier boards.

But those carrier boards are still work in progress, so they are not part
of this series yet. When they will be, fsl.yaml should get them (not
included with this series, just for comments and TBC):

      - description: Free Mobile Nodebox v3 CPU Module based Boards
        items:
          - enum:
              - freemobile,nbv30
              - freemobile,nbv31
              - freemobile,nbv32
          - const: freemobile,nbxv3
          - const: fsl,lx2160a

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v6:
- dt-bindings: arm: fsl: freemobile,nbxv3 no 1 entry enum for the
  "LX2160A based Boards" (Krzysztof Kozlowski)
- Link to v5: https://lore.kernel.org/r/20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr

Changes in v5:
- read dts-coding-style: many reorder/cleanup including
  comments from Frank Li without functional changes
- Link to v4: https://lore.kernel.org/r/20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr

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

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 330 +++++++++++++++++++++
 5 files changed, 369 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


