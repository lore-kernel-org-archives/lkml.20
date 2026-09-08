Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A03E6DE8;
	Tue,  8 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875609; cv=none; b=PE0a9an2NFvolfZqJEfBtEaUrAdJyBOqUP/JPcVTdUSetshWzCQN4GampTpeThYA4725epjHPxR578ANIUZCOTnF0YwPbpAz71BXlEAkXv1fcRBPTX9xZmCp0HV5xWSvW64PVBxQ7VomRuuKghMxbDvTrEhCFDdkh6mS4ZepDKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875609; c=relaxed/simple;
	bh=chhiIqRF5ou6bRD72rL6njTnM3BrKLWkzdLpOfMFweg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqVAo49YpT2F3FkHZ7fajPcpBcUB98m4id5Ttak8hY5MlUrcD8VF2DeTSwcs9p064Thbgm74YOGFd8Td3vGjJABJnM65vYfRSCR5RDPgAx/T1fjCRiPk2ye0ShjaIOyiF7KFpHsnYLbEwdIBNoc2GrV4wiwHtLlCrlqfanv8Ywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=iaAyeTrN; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="iaAyeTrN"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=;
	b=iaAyeTrNCJLJQ/j1QOdrJeo4ecxauVYTE6q2lNJwsWzui/TbmSEGNFzvIm4jWcoi7KwgiF
	JSWv6zSeLZd9L+orB9++8d69scpw+fhl5Y2YSgc9TX/hQz9BFIYTOr6IyQnif09M//l0Xe
	QyiWozek7suUN87L2D3fP8dM4FVIAg9hj4Oo0ag/aJoWDrDKP+n7vFA3abBrdD3yKaWMrp
	nS6BvFJ3oa3bRDusZ6RfFXIyYW9LkjNJiGNwEhIpdz88hxjSYQLbl6QEB/L+2LwtG0naV2
	Q63NMlZC5O/7FY9IuLEjQQHMSXEQFSxF7rrri42xaJEwJR6+zUM6VqshEZV+TA==
Date: Tue, 08 Sep 2026 15:51:52 +0200
Subject: [PATCH 5/9] arm64: dts: imx93-kontron: Make USB-C connector
 "device-only"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-5-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=nBXNsn5j9wvYH8NLcZ6PDt1KYldwEPOzwtDvyon9Z9k=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsHPxhE4np20PVp2LeD3rid+cPmkx84+fm9xyhC8Kz
 Xt1NIW3o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCLOsxkZrm5dtvJziNeqI0+P
 XP8zcdW5yd+enQzs1+Y34ftdc/LPwhJGhiNzPQ2XXLnVM7UwSufh3oauZnYtJoa0NUzZTkk1G+b
 lMAMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Oualid Derouiche <oualid.derouiche@kontron.de>

The dual-role support was broken on early prototypes and has been
removed in later hardware revisions. Reflect that by setting dr_mode
to "peripheral" and removing properties related to dual-role usage.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 4620c070f4d7..0277640d7c4c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -158,12 +158,8 @@ &tpm6 {
 };
 
 &usbotg1 {
-	adp-disable;
-	hnp-disable;
-	srp-disable;
 	disable-over-current;
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "peripheral";
 	status = "okay";
 };
 

-- 
2.55.0

