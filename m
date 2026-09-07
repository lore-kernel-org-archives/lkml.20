Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F571459AC7;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801227; cv=none; b=Iutlm2ejpVwYdsoKZ1vQfrHEz6DFp4BtJ+E26NeAutHByjbsa4IKDOu2SFp3BKZpr924vIaXJwWYKCZg8J2jt/G4FMDL81Doe6ph1jlY42LIKoM/8Ij/hMU4MhDBMZA714Kdzeh3/3adjCgV3Rimm/v4sEE7Vi9CTPZvEQT1K6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801227; c=relaxed/simple;
	bh=YMwqtk5kFFVk6NmGC1FOGANY0SgL0Bc9vtiSDOAw7LU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mPa1lC9KzpXaTQ2NupgQJtDc2EdDoQ45raXNjatEsIY7Z6z7TwELA1ao1Hb55tRE1HdbPyAAGSPXmR4Ju5k0YUabcZnhLEy+BkNL9Cfkx7OL+UbplIuBQitKCVS+yEElokqgWbGTzCt+ilIMTmLmGxDRw8N8Q23b6sekPMmD4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zq3fT03B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zq3fT03B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B85BC2BCC7;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788801227;
	bh=YMwqtk5kFFVk6NmGC1FOGANY0SgL0Bc9vtiSDOAw7LU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Zq3fT03BfjWHlgUc/9Mri7kh86YhT2KEytjCPrpfqMZ+RV1gedghY0c06WwwbgS3h
	 J4JemTl0VNAIrH+ZcSJt1kNvLivqGfnSZ71q0b0P/qYRE7a9CSL41ewjKRF9L5c++7
	 KZn8183+CaULlB6+oeNruIYwoqEd99ZR0ttLKndvuoxpz46LVdm04qEUMJf5Pw5d9w
	 2zbKHqvQUBmWZMtb8PypW3nkNqHda6JJXSofTYJb5ffNEFdmHlF9PNUKkP2SWoNzJ+
	 kF0hnkQk42N1e5XdIX/5FzJF5ATmWx7Mnp3pO9tPa8s5oFogkZfAaFixdyjG74uD3b
	 DsiWugiAEQhEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A1EC79FA1;
	Mon,  7 Sep 2026 17:13:46 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Mon, 07 Sep 2026 19:13:38 +0200
Message-Id: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLwnmoC/4WNQQ6CMBBFr0Jm7ZihEKmuvIdhQelUurCQKTYY0
 rtbuYDL95L//g6RxXOEW7WDcPLRz6GAOlUwTkN4MnpbGBSpC12pQzcLvpe4Cg8vDGZLDdo1ojE
 8Wmqp0YOCMl6End+O8KMvPPm4zvI5flL9s3+TqUZC1zbOEiltOn13wnx2An3O+QupSTIDugAAA
 A==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788801225; l=1868;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YMwqtk5kFFVk6NmGC1FOGANY0SgL0Bc9vtiSDOAw7LU=;
 b=bYN/0gd6/toQ6bC9ZCpsN95CU244lpKKLYbnDuxSpx1DPNG+tTql+s37Tx+3ijWiWcrauz+Ce
 kcbUZquphNuCFoRBDQCZ01dH6Sy39Zp2a+j4HyVvyVGAO3pLAqZxAny
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

XXX Dependency:

the DTS uses gpio hogs on the QorIQ GPIO controllers, which
needs the commit
  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
already in gpio/for-next and that will likely arrive in v7.4-rc1.
Until it lands, dtbs_check reports the five hog nodes, the rest of the
tree validates clean against the current schemas.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
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
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 ++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 342 +++++++++++++++++++++
 5 files changed, 386 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


