Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52A47605C;
	Mon, 14 Sep 2026 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393627; cv=none; b=IgsjZEzlwzlGTQBXjGP6AG4eHQPu66fDf7hCmD4m3NttwZlg+ClJ7OnzifVglRyB0BFGFPKFvd10okifsLyKjKbF+MCtN0yGV6gE0si1oSV2ukkr5jHIS7WjB+V6AGDXHQvFSvPF29K5tpJAXdT+5WdkZHhM5/Uv5XEq20vI7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393627; c=relaxed/simple;
	bh=chhiIqRF5ou6bRD72rL6njTnM3BrKLWkzdLpOfMFweg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWnytvwSHqNyvetK7rP96Haz5twTg1czwMv8EiOM3zgdK08b9mtO/CyhjAPni6NkcCEFYK2n4NwVk6mAcdMHlGc50yi77NtmlfZny6zA8M0EfDIUKErQtw5Njga8AA10dEBTrJOuwI6g8J780kCqfoCDOf08cH67ErpfpdYzgdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=oU00nPDT; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="oU00nPDT"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5L/XcuxQLLZLXrKN2g2/0ioV+GT9Ym5AO4xWn00BwKE=;
	b=oU00nPDT8pygQUeitTPc/oOUjztd4RRiMrYBU1E9NgaMH86ZSQQujE9qg8N+lpXn63sRHi
	hr8Qrw8fMkl1UboquDjythkKKmdml12yVpupkQ6ICa5mQYP7Z7uUz6UznsZVBcBj/pLCMn
	NRaTFGvwEBlkMixC7cEp+24eMGt61DOByjZa8nAP8M5STQ+wGy1zPuLoJFfTldPFHC0A+I
	bhk5g65oNeqVqz1EpPTk/hTcrlufnBYUfa9IGI+GP0rnLI7rKZY6w3styiUAjBfjmP0mtl
	DbeepTKxl2QROnLeZctJwPqQsutYnemPGRO/3lcN7gWgk2SBYMW+fjERuKI2Mg==
Date: Mon, 14 Sep 2026 15:46:13 +0200
Subject: [PATCH v2 5/9] arm64: dts: imx93-kontron: Make USB-C connector
 "device-only"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-5-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=nBXNsn5j9wvYH8NLcZ6PDt1KYldwEPOzwtDvyon9Z9k=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1PbEpX7H7CnrDz6fPVMy2V2x87Z8V9eZ/HA9bvoL
 8UrhlmvOkpZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACZyM4Hhf+TsrCD9LfOra9Yo
 LWZtTCi2bDgyU37PlEt1330ubTixyIeR4bDf6Z9sHBsKneacj7B1Ob5nQbIsW0nmUguv8xvX5O5
 Zzg8A
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

