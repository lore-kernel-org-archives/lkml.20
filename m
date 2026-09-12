Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950647CA9D;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219963; cv=none; b=i4zoq5EIwLobSHx/PZugz2L7lw6BoSHUu69AOUPuy6DE6wSzwVEDJgFPGJt5uZVFXddpetmA2l49dskliTtZuWADDJra5dL6uvwRi5PXYw56XpBfoXbORM2aaB3y7aICv+GP/SmGXT/ucf8nOhxuXwludYSubDIuo7V61AKsy1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219963; c=relaxed/simple;
	bh=OrWt6rMcj6X1ajmEcZpTCRWUVCtmz1KcB9KqCUg4L08=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gqmC7lVwJ7DmBA62WJD2QdN4tGNPw05q9HfCQHWlKatyHbXa+QKpo2VeaaPxOmHzWfEzp+/UGp14cOrqHOKeql6GDeG0ufoupnEJ2ozsSLT8RL3Jlh5XK9VmbkSeK8VeC6aVD3TIdFv2MBTlnj34WJq9io496RSpdjdwOCcvlIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MANaxdac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MANaxdac"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6329EC2BCF5;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789219963;
	bh=OrWt6rMcj6X1ajmEcZpTCRWUVCtmz1KcB9KqCUg4L08=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MANaxdac1idLyNbcmHIk3DuXNNb4dYVZeQcKbafSUcOZ21NORXoj92ksCZN8zSZo9
	 +gr+OV6pDwmM3QcXDogYL6UrhFtTtjjN/MYOpQZM7EdUF+pKAKVDHoFirA1ccEesgr
	 yhglXC6hMDAy83YdXzLja1qgPUZxNixuVFe5ytHsjtX17b0ngRifyqsM6jcFIlIA45
	 OFyDCdUS8e7CQ49BE2qIDCj2szdXdDENaZZGOTAEhUIe2dWhkfNS3Us422cVHGEYGZ
	 Pnqko8mlDVVcFGX2dESrhvV7r45OIwwmUTkwVOr5VEf65nTPw6WegIlyobQapuBuwH
	 TjDHfQqjhoMjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4131FC88E5C;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v5 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Sat, 12 Sep 2026 15:32:35 +0200
Message-Id: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNUpWoC/43PTQ6CMBAF4KuYrq2Z/gDVlfcwLlo61S4E0mKDI
 dzdwgoWRJdvkvnezEgiBo+RXA4jCZh89G2TQ3E8kPqpmwdSb3MmHHgJZ6ioawN9d7EPqF+0MUM
 S1PaRGoO1BQlCaU7ychfQ+WGBb/ecnz72bfgsPYnN059kYhSok8JZAK5Mpa4uIJ5cIDOY+H8Iz
 0hppHZWlEyB2SJijahdRGSEWaUMrxkrFWwRuUIY20VkRnh+prJFURV6dck0TV9f4CssiQEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789219957; l=2820;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=OrWt6rMcj6X1ajmEcZpTCRWUVCtmz1KcB9KqCUg4L08=;
 b=u/fmjZZEnrnpwQPJPqOgX1QDr5zvJVm6nT8vRCIisliHgtt4il7bFesIn6VRknz++VO83xHxp
 AJ6MYWXyaOCBb1aN+EvXLzp+OHkVMfmh8iprjWWCtFyA1VTBb1b0TuU
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

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 +++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 330 +++++++++++++++++++++
 5 files changed, 374 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


