Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5389B48E0DB;
	Thu,  8 Oct 2026 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450982; cv=pass; b=YT4jtJonI/hDGxJiA1oGlt0gfQxUTAUZdDDqDWWHnFpkHPDvOO5Hk2kDqW66zVJHmMAULCSpeTbgsgikEBo+cBdL1qxYjEbuEjnKWjRjzxI/8fhW8HBGt9Yp69toKPzmsFj2cv1HFSVDjrVNJnu7A7HRtcBJ+5eJwvJEOKOBe+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450982; c=relaxed/simple;
	bh=jd/pc1OWjyiywuvg4Cn5RWmjvoXoOOrzbGiGfZnRFSo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aunwNsLgn3vn9Mmdn45IYsfbWqCT1UcrXq5+omQmSNuqtjczuY2vVVlaC/APByylikS6foJFC8FjrSQZnIG3iVbl7j2KHi20GXUOmdouZeer+VKYwbcEURrOVfHyi9yP2IF6ArOuOOqDL4nuUwIr9wPJChRucRqAaZEp6PWZSgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=US6sD5XV; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="US6sD5XV"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B734D2004FC;
	Thu, 08 Oct 2026 11:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIIIBNZEG4EYad1vmHbD/D7jSqDeHQoRh0K9YrKhhjQ=;
	b=US6sD5XVw7wOJGTpw1O8kjg56uxtS6LlwtEikiY0mZwIEfaAVetDNPTylHlGLjmfGkM5YG
	8ybNLZUKfGMAuImt8Sv4viOVzVDCKYm0zhdH8ELMV4wH2LhsAMmijhOxSlvZI4xsdG3k5q
	gTkRCwsDReG+ZeNlLTKVkV8AAr1UQQ1HxxaHigvE2oHcvPinfFYzrj5H2r1FJN7bntE8Iz
	Qex6tYMQ7EcOS8qRQjFSMkDKFdanpwBIizxGbU1bOuMr5JFalsv25zbLjqpeURGQY53CZU
	D7Tmg+uuFe3IDWngwIkHyzHIaEbEJV/FbB+4sjH52re4JCrZZMARadMYOGTTQQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791450969; a=rsa-sha256;
	cv=none;
	b=WSQ8kP/NYanC0etRlqTPSwVD6pBi84VlMI8Dvp1qUOad6CxtAi/9BXK9ComBeOaZktapLa
	+HlHALf6WcM5T9Rhv1uv10DN/oSQULJuxFVzqK/aW1ceHHXf2KOFND2Y3bWab8y2P5skaB
	SRJ9zWiAtmyTUIU70vcaVhNhUHsbMkpDdbYtxU/okP3dsX1FfebVCCPvWn/XuGnh2LTAr4
	s+8bfb8VFEnrS5XRIZRNnFI3LUAoNfVQ2ykvnQMin+dT2ca9V6dxV1e+HsmrVVq2zcM4bD
	AN+7tjsKayC4e5TZSWwdpNErAbzLTAfFekB8bT4Uwq5eIZ/FxMUCSLfphUs8dQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIIIBNZEG4EYad1vmHbD/D7jSqDeHQoRh0K9YrKhhjQ=;
	b=Z95BCJiTtM+fyQpFm3XAiDB3v+sDhmcxeYk8vBYF3+3sYBqEJBde1VAKwJfmb1uHL79k+U
	wnBv/lVxkv9WBB/H4qY8L4a2Fw0RjZz0JrwDQuu+qu+kMh7HmLegMgvpGp1M34Lutn1iJC
	fTSe8dAqADCQ+47LVVgSQS8BMmx5SCreHpZ4Od1iqd8j1CGBbqwpr5irZoRrZRXVvupo9f
	OUPNZGdv+WzIMUMgLWpCYEGDgE1F/izs1Tqrp8nM6LtaaC+KFIJGEmU8cZ5yDj8cS2Hict
	CCEmedD3nyT5dVPmrZSw6moYHoykGHKIaVURsoEZJXmxPJ6WSMRm+Linvga7ww==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v9 0/3] arm64: dts: imx8mp-skov: add new 7" variant
Date: Thu, 08 Oct 2026 11:15:58 +0200
Message-Id: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53SPU/DMBAG4L9SecbIPn+GCcTCyMCGGBzn3LioS
 RQnUVHV/44ThlYiS7pYOuvVc/64M0nYR0zkaXcmPU4xxbbJRfGwI752zR5prHJNgIFmAhSdDGV
 0aLvoaTye7LGj6budaDUkehiHdvQ1NbHJq6hKX0rFnCg8yVzXY4inpdUneX/5eH0jX3/baSwP6
 Ie5zRysYxra/mc50sSX+PbuE89BzkCpCoSWonjusNmPQ9828fRY4dJ7gqsuwWzQIQcRSlMEDxn
 nq7q46obxDbrIwcrIYFAEC4VY1eWtrjfoctaDZ95aMJ7Bqq5u9E0vo3JQm+CcQmRl0Ku6vlfXO
 RicDYbnGygdVnVzrz4HvbOOSam51m5Vt1fdii2/apeZQS2UVFC6/xN5uVx+AaVxd5+QAwAA
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3380;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=jd/pc1OWjyiywuvg4Cn5RWmjvoXoOOrzbGiGfZnRFSo=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bx+HAb7u6whJPrp1x/tv6fb1C779xTyk8Ejsg/4mTrF
 T084WFXRykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIlwWTD8U5RRYor5a/PphEHd
 hoVf5riX9j154JzztMnt866/H2//+8/IcFG1ZPrLjZbL33J6H3E9HjvnuUMgm62Op8vaco6pt+U
 N2AE=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.
As the already upstream boards and this new one are almost identical,
convert the other device trees to a base devicetree and apply the touch
controllers and panels via overlays.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v9:
- fix dtbscheck error
- squash new compatible into 7" devicetree patch
- Link to v8: https://patch.msgid.link/20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de

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
Steffen Trumtrar (3):
      arm64: dts: freescale: imx8mp: skov: fix sort order
      arm64: dts: imx8mp-skov-revc: convert to overlays
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 10 ++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
 7 files changed, 135 insertions(+), 100 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

