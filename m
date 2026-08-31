Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CC3D34BC;
	Mon, 31 Aug 2026 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164295; cv=none; b=juQ8eP5b/eTsDs2B+nWFmysgkw32GzrKMZh83njRTY2sUVXzSYevo8IKznP5y5saxGX8YPRxix0FZ81NRDmybM0cntan+eu7T1CZK6hmm9hOiOxYtv1W76cfihWZtrshLkRrLAQM5DGbk6f1PoskIaLGjOYK+gSZ7kZiV4pOyog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164295; c=relaxed/simple;
	bh=Jwaigwxg+oOUl4+0PNzsgeyS37Xy8CqmxzYbZoDBLCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hg802xmwqG81fwqOLxM+mym/OFRlx+r5SJCLUln2BOfed4d0sBAqMz3ilsIiYPVuxYzR64Fc1TErTCHIH9hallBii6BYkZxRAJkCZSVnsGtdh7hVr/A6hpoYtqBbgV+mivl2qcCkzasAz+JSdmf1klPRZwu0A6wwfpxf8t6yElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5C7D820098F;
	Mon, 31 Aug 2026 10:18:02 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 31 Aug 2026 10:17:37 +0200
Message-Id: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53QPU/EIBjA8a9yYRYDD6910rg4OrgZB0rhypkrT
 Wmbmku/u7QOd4ldegsJ5J/fA1xQcl1wCT0dLqhzY0ghNnmjHw7I1qY5OhyqvEdAQBIGAo8KE9z
 HNlgczpM+tzh9xxFXfcKnoY+DrbEKTV5ZVdqSC2JYYVHm2s75MK2jPtH7y8frG/r6O05DeXK2X
 8YsYR1SH7uf9UojXfP900eaQ0pAiAqY5Kx4bl1zHPouNmF6rNw6e4SrzkHt0CGHDkpVeAsZp5s
 6u+qK0B06y2GluFeOeQ0F29T5rS536HzRvSVWa1CWwKYubvRdPyNyKJU3RjhHSi83dXmvLnPoj
 faK5hcI6Td1da++hNZoQziXVErzT5/n+RdQR7A+MgMAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=Jwaigwxg+oOUl4+0PNzsgeyS37Xy8CqmxzYbZoDBLCM=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9ZUi5036zNCPxWuut++8N/umysUfz5ni6mpeb79rNlRC
 eez4lMvdJSyMIhxMciKKbKoLKzgE/X44Bk5TYQLZg4rE8gQBi5OAZhIZi8jw5qru+5P11gUeq3h
 A39C/BODTdyz7T+kxO1RZVl773aq6TWG/xV+h86zH62TTJn0RC5r55+Ml92MDq0B943sls94n6L
 /iwUA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v8:
- add #address-cells and #size-cells to i2c2
- fix touchscreen resolution
- add missing binding includes
- Link to v7: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de

Changes in v7:
- address more of sashikos rightful feedback
- Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de

Changes in v6:
- address sashikos rightful feedback
- Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de

Changes in v5:
- convert to overlays
- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

Changes in v4:
- fix Makefile sort order
- add touchscreen fallback compatible
- fix lvds_bridge comment
- Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de

Changes in v3:
- rebase to v7.2-rc1
- Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de

Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Søren Andersen <san@skov.dk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (5):
      arm64: dts: freescale: imx8mp: skov: fix sort order
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP revC Touch
      arm64: dts: imx8mp-skov-revc: convert to overlays
      dt-bindings: arm: fsl: add compatible for new Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 11 +++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 58 ++++++++++++++++++++++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 46 +++++------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 44 +++++-----------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 45 +++++++++++++++++
 6 files changed, 140 insertions(+), 66 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

