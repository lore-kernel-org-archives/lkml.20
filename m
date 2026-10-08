Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598CD48EC95;
	Thu,  8 Oct 2026 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450984; cv=pass; b=uqGZj56DF4b2c6Xelk54zdDAZ1s6/BGUEz9CDSZgzgpBSiZ4gn4GilTteMl4UncFjXS2YK49mmzlRRcKsuK/6yZMRqUnxlt7mdZqc40LpwwKGIRcuztMiuNPtDFj2grwpdykMSAW+Zo+WzMHJEWbga6GwR67oQHadDKDl4MWC4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450984; c=relaxed/simple;
	bh=8fA+PcBqCWGEj0dJDDjO6qBFZFaRQnYFP6vrrHwXRlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsiLfWxsYL22dbIi03GuGcvwodzPE3emZ3PzwCCIQMC1mZ4ldSlcXnsT8zewGgGjOUKUNQJW4m7+W8X+tDArlqQA4ExXUrG/HVSTVu/Q6ZQSeJxtNH7PrQumBAXSAkThaHurTqKeAStQk3rE2nxfliuB/P05Es+dUatqCFyYi0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Y1Yiio78; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Y1Yiio78"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0FCCF200582;
	Thu, 08 Oct 2026 11:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4OdqquRkr6UmIvev0wHEbWO3nZAjp+PtnezGPRgzOo=;
	b=Y1Yiio78FKUWT5PqDICsj87JHuQ/9IUnAOENLD8AkAIwceLaYGhz1uf77oxWXPiGydupND
	o4PsYIdxkslPktgcEdnE7+rUjJblLJ5/v49kaJlUZiG4nKuXULLKyusnQPxz+Nhp1apwMM
	sTf/mCeaalA3zdvlpXRbs8KE8AiLpeMQs71ywfRBoGNnW8lbFgajeAvtSxB7ZYc3EVgNZ0
	wW4F/mccUsN6omzQHmvYwVc2WNrMls9xjMUsxzs8wJm1SjMgW6z9ESG685YfIcDMk2HoBl
	xSKWFPfcUMiu5W/E+ovdvAmGFTPf1N7iImeLD1IATOiQFAOFjkrfx86ww+TXnw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791450969; a=rsa-sha256;
	cv=none;
	b=Avj3vfltkwy+Q+7x3yRblRREjCIDnO9u0mmbfW5a5zH+f1tHTv2adixSIGvHVnFqK0ZI8R
	ihSFPjYJQh5xKUGoH+/0TcHV6S4apbUn0SPDRE0Wzq689LevOCY7ZrI3CiX7BaiNSnIi5+
	2B0ZNyI/aQIwyKOi2b/sE+94YLyj1wRYt/Nv5AN42cQyo0Qe9nqxWaKvM1RK78TrC9USyx
	I+p6dq+fBzl8FVayPBSX9P/YrSn5o+41WjmM5DTyysajLOfhoMd+kTqMqrdIedaZf/mgsP
	bfbq8F0uHibOks5YQHJf69kvI3eaa4azIXyQNaA4Hfnqk9hr//h7JAj662cRKg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4OdqquRkr6UmIvev0wHEbWO3nZAjp+PtnezGPRgzOo=;
	b=C8SABDphPBj+iChaaeaXgJjbtLHdbJLTgHUOkmp2jSL5boWe256V6ucUtBPrmgiqGHBBdF
	+Vy1LTR8naog7qtI5bCj2EhUtu+DxcQ6OlbOtCbxhdaR48+9nb8aYMzVTJ9XttvhkWo0z8
	7KipReyEJg3KlAaLCvTXzBmtMv8Z/kD4Mha2G5NtMFP7svxic/F93fdbYimIoDGDsvRAZu
	5s7Bi9hnJw1lfwaNWp08gK8KF/+g7xvEIoEkfSxkXx76SRFkNWeqRuiNUaVAsu0ECawlNO
	HW0bWEwM1si1fdZirFZZ0BqWdjSUeL/zF5EthW0Hlp1+VVGzq8JyGXi6Z2JKow==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 08 Oct 2026 11:15:59 +0200
Subject: [PATCH v9 1/3] arm64: dts: freescale: imx8mp: skov: fix sort order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-1-11fa90f531fc@pengutronix.de>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=8fA+PcBqCWGEj0dJDDjO6qBFZFaRQnYFP6vrrHwXRlE=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bx+AhVi/dbsy9Ffe9eaz5rafz7H/m3lJ5Vzfzv2Zl93
 yag0Xd5RykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIlwWDL8s37seuJmg7uTo46j
 8HplY/0oZdfiXZevztwwt7tIfP4ybYa/ckuX3tji6f50esDpHV0/U3Sv3/x9qthp4pYtBn+ur3j
 zlBsA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

The imx8mp-skov-revc-jutouch should be alphabetically before the
imx8mp-skov-revc-tian variant.

Sort the entries in the correct order.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf5..49025ae465f22 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -475,8 +475,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb

-- 
2.51.0

