Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766534C33D7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164078; cv=none; b=WcpuulTKYYUz2VKdIaIoenlU6luWSAjfK4HkEWp99Y0QHby2wsKgpYnPujd4YnWXd6ywSqGkmc+doDYt/+J0+MmUtIrOGnioWVrRGhZKCpfgcsh7E0oUf5e7yjxx7lKjW8Zhi1kfWeYvODuYta0CQNtiI/ZXqkqdAH+bkfed4yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164078; c=relaxed/simple;
	bh=0rzGTxtbxOtdvxpjN62ySevHmVMDNqoepujK8ZN2dz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqERYMbCVEDZxAZwwaB8xWv5OY1STSnf5YF2alHhIasFh57TxYPYUQ9iX6BkBIE5J/wz9Z4yL9mcSw0e6luVZ8fuItOtRzRRvq3HqVXftcepAe6GDEwhNm/wq4NbKfyVZeIj/X4wEV7g6G7wIQRi5BsiwTfvAG0ehMUV9tYiRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=O9x+SGVx; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="O9x+SGVx"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AF864240028
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164060;
	bh=kDt4WyxgQNcRXLafMjpuldGxED7+3K9ipqHfql1hMXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=O9x+SGVxx6GMsazDpF7WbXnnL2DhDu1H81xxEnmZ036seD3fhTQ8FPHwmYXwybDRx
	 pJkdtD8YkmA83v1zelF8NRfEsATQEC8bz6uDXw60+BVQNSAMsXRT0WkK7yzaHwDWEe
	 oDkBJXC03EDXoM5ZBvcDbOZOKOxBaTADdKO6aqmMTbRJSlJ399zX7bL/TlHmb17vre
	 9kMc96M+oY0NibE7LviuAegYF6FDL8a7MrWmCOoKUXhaay+Uib37jjRmu6KMNw6Mai
	 YKwVM6dKPdU7z6jNWpTUbwiE7WDLtvq7YVs5L2eSt83MFwJd1LhdpvzDctYNDVnsA4
	 DkEaqiQaVa6JA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqZvv0x16z9rxG;
	Wed, 23 Sep 2026 13:47:39 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 2/2] arm64: dts: st: enable eMMC on stm32mp257f-dk
Date: Wed, 23 Sep 2026 11:47:40 +0000
Message-ID: <20260923114714.140842-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
References: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the 8-Gbyte eMMC v5.1 connected to SDMMC2 with an 8-bit bus on
the STM32MP257F-DK. VDDIO2 is tied to the 1.8 V rail on this board, so
the DDR52 and HS200 modes are used.

Use the _b pin groups, the _a groups do not give reliable reads in
HS200 mode on this board. Tested in HS200 mode at 100 MHz.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..a7ad91d5beed 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -21,6 +21,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet1;
 		serial0 = &usart2;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 	};
 
 	chosen {
@@ -279,6 +281,23 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_b &sdmmc2_d47_pins_b>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_b &sdmmc2_d47_pins_b>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+	status = "okay";
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
-- 
2.55.0

