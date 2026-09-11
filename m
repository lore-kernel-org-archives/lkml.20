Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D41A489FC1;
	Fri, 11 Sep 2026 13:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134273; cv=none; b=TZ+fAmdizqG1+zVUZDTE8XKrMXsZW3spEStvnNQM9cavOiT/FfatAX9BacTBUiwTcr0n0d+ywWe5usjdNyGnl8xxU/k5QcCfydW+MpG1/ZklxLUxDpJqigcl8lkGozUS6GtOwLHxhQfEAIlHAnuKnpgbmtdESKxv+2HxS2mCY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134273; c=relaxed/simple;
	bh=YeYAtuD/sLM4sPqo5BWasoU8wnLpTPHhI2k10ajfJlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAFExr/VS6lIzc+dAlph0Dp6iCrYaG6KKdGBPM5JI+Iz/z6wIGtrWXdSzNMwfiCPucDeETEmugsQE58B8uJF74dszG1BoPmgSJlKq8Tim3Cee3vcDsf9oPyFmOXGfMTI4mIGl56CoD1OinlRpjL9gWCKiQZ389sXQ2igQP0NCCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=RSTz/0gA; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="RSTz/0gA"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 645B31FFA6;
	Fri, 11 Sep 2026 15:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789134268;
	bh=87iJ8eoqZ3OPjJLYPFsUWmmff1ZXOWQWTIDzAIwLa2g=; h=From:To:Subject;
	b=RSTz/0gA+qVD2TkRN/w0AOOqP5mSRoWI1xWj8h4KhN4ELdP1BREkv1ckj771WzcWu
	 jWnZ5ZBbqUDiul0YwaRF7jg9kg56X/o9b84uE9aX0AVL5+JfwjoqcOt4IlAurZDRWD
	 coxkNt38kC5mcvDiuG3jEXL/8ngzEAuBUE+xA1gXlO53cFTC3s0H93FxAy+7EUBf8C
	 BgTUILscT1U0Vr5l97H2yN2Up1QZY81jPSsz8v/6h0vkFuIS1q06CNEAKxlUXH2nZm
	 PH+CMxSB+qtmGYhcNc8mqd+66npeUKc9ee5181+g3WhhAr1bOyx6rGGlLI3yfgm9St
	 B09Yy8umRY+3w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx7-colibri-iris-v2: drop no-op delete-property
Date: Fri, 11 Sep 2026 15:44:09 +0200
Message-ID: <20260911134410.178847-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

usdhc1 never has a "keep-power-in-suspend" property set anywhere in
its inheritance chain, so this /delete-property/ is a no-op left over
since it was introduced.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Assisted-by: LLM
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
index 1111111..2222222 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
@@ -106,7 +106,6 @@
 /* Colibri MMC/SD, UHS-I capable uSD slot */
 &usdhc1 {
 	cap-power-off-card;
-	/delete-property/ keep-power-in-suspend;
 	/delete-property/ no-1-8-v;
 	vmmc-supply = <&reg_3v3_vmmc>;
 	status = "okay";
--
2.45.0

