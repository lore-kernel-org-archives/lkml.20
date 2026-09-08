Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF552FE50;
	Tue,  8 Sep 2026 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876000; cv=none; b=JPDH4A6Nsfc1KlivRczD7toQDqwWe0QM3IeOwxOZciarJdut+E7tBQpvMkZWyZO0tvD80qXUxsHd3rUVkOHLqc0W762gsrLuUM+UFgD/EJ3eFmyTJ5/JGpGD9dpXGmEArXk1kK7wHAyvGs4rAjSwl9kH3xP/iTM7fKoZWpY2cSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876000; c=relaxed/simple;
	bh=jD0cM7p+54y67H5BoqsAB8Z8ZP1xOOXL1QBUpmp5eqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gn0/rzGsdrFyfBzG8GPYhTubu8+c8aIruyJZlr9KdKFEFk2UxsJzec8UhZZpwNrdfhzdn573KJ/zzJdssB/6djw6OF0Hp9nEh139bCzu8ahDoiY0QRpv0Py00fQOS8j+p8S42RmLMxFMt8ELYvytmay2I5n4V7Jg/qhlwMOK+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=woFMSLeA; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="woFMSLeA"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=;
	b=woFMSLeAghhxAzZ6H71b75YnVKqS6FHDCQYI9AjrOOloWvDolEzuufaXfTySFCNYUd/Bdu
	uCZjCJRGqhrXBg1wrqovDZegUuUHajFlH23pzbUAcVJBorwBSWLlVCFq3WwKJrpP1fQ9uf
	Sk1cAKoJPHhDj4ir2Q8yvDFumDHrHU1VR/ik655D1m3rUGo+7fTtoIQaxUV90cODrizlVK
	0iLxS28peLIOtPjb7PYZHUZ0IW3EFp58suLUS4GEYIZJ3HRNftO2PbdonneVwtDNhgWxuE
	MvPETE+jo40AhsoIPD1vmdDdNY5IsBSe0pfmNGTQWpk+xMK+bU+N9s9dh4fb+A==
Date: Tue, 08 Sep 2026 15:51:50 +0200
Subject: [PATCH 3/9] ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID
 pin configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-3-4d0e8a75db79@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=iCuZlno55Yjn0MkpffeLuEkr+4wHGhog/vQ/6EFeyBM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsFOl8dqEt1/mTc+6FBC4OljVTXHnkymXRG8/Tm3r+
 JyVevtTRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETcjBgZ7rGpqvXytFdeOPjz
 r/eqKm61R57fmn21jTRncMy5U/frOcNvlu/vPBdVidvnLHBNvGSxcWHhueUil8/z7DhTuXzXmkP
 8XAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Add the missing MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID pinmux entry so
the USB OTG ID pin is correctly routed and OTG can be used.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 65c5f4450c36..0658584c9f11 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -357,6 +357,7 @@ MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 
 	pinctrl_usbotg1: usbotg1grp {
 		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
 			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x1b0b0
 		>;
 	};

-- 
2.55.0

