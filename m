Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DC64C9DF1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473820; cv=none; b=As8Y96pIb7BMjCVRi68I05osHA6t+aGANg9KZZBpUrb5v4WnOofQSVWdaXimgPdRbcylTgLeXNOvE6NsBN2+tCWOyjz5Ne1YtF3BLNLEVL6XYcgfKl9mCSk0gHGssr8hRQu6YasLYZYiwHOYpoDfSFKjLFR/pkYTRt9/pqm/Hpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473820; c=relaxed/simple;
	bh=M34RpNu85eWYou4MHB1z0mjdW9jlDQqaminQuSj4T/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIs6VCR4O9Wg9Ij0zAV57gOzRQc7SgZmTr6IMpFM1V49zVo87iuq+iGVzPNnClMlcuXD8QzJH2L14UL0K671bem4gZJAIwp3qkxkC+UGcok449k6ummo1QdszxmTqNtxhVIFHRqfDDAxKaP3I0OvAED6BXxyX8ScUV7tTpZQYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJDmFSsv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJDmFSsv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8875d220446so1689795b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473818; x=1792078618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=;
        b=TJDmFSsvPBLPZq/6uZCoJeRVubaC/WS41L+j9ToouZZPzyvMs5kn3K0ePXX8hMk66c
         8JV8K1i58eZOH4kKpjYj9plLtFcgEwKdxJM0WYjYHxBrMOBxAl4jHhpGlaQ8U0GBUgt/
         Klg/f4D6GTAKJdKDqT8pKIRtIouaSd09l7qz9pyV/fXc/CXH5KVUmFJZCkDuUTfG+1D5
         uQFtb4TVXxBjcRuCUC75ZwImid3B+9nFyV7ezcjvW2ahGdrCmYBxBPWpeyCmjmtYr49X
         sNMT7xwIPQTVzB3ek0ssy1QMi77dNkWWhhn8GaL9H2eNELc2MlWmulzkS1npHkn8o3eJ
         i+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473818; x=1792078618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0g5RUJYsTuTINK7t/PSk6wKRYNvtbwpJDwV+1FAvsQ=;
        b=bRFTtmA83PmwsLX2tuqP/b17ZHImkrNAHJn50V/zH/sCMznr/9l750tDeQar/3X7+v
         tkYA7pE42qYa14HG75fhG1uF3399sef/cfJUzsGlMJCmuD+rFZzGL1PZSOs9hiiWaXlB
         YPSuEuDjhh+HEM/tVWoLc6IJWf8nv8QSKKF5s4XCs+bEVsSCWQiXgvPm2CpBo0gLKc09
         1fhlwbulgaH/rqTw+7mhQRyYY9IhvmEmJJkU0rcMXc50YEXJ61Ra/ZL3ZB1C2psrhvnC
         28j7yTHep3oBmckFJ8JTaA5GH5ClZCCgyePbP+DggWKLjBtTHd8vAEzU1eNa2/d4pOh1
         2HSA==
X-Forwarded-Encrypted: i=1; AKwUvBy+c2i3PmfR8ITHbqSVDOMNrqj4Neu4QbiniybFujCO8c5pgdlyN0UePSV33YVuIPL3KAXu8Z9i9gIoP2s=@vger.kernel.org
X-Gm-Message-State: AFuF++mXAtSq5eBYADhyTWEoQnRCVimuIV6Bt6xVlXdRjxEVZMWH8Xg7
	/luVBVkes4xdHxsIiXI2Akp//vvcsdF0Y2/apN6nMWHHhPaMkdqgG6xK
X-Gm-Gg: AYBFou0JbSbhJtsvsmgENGsdp95iWEsBw3jMPBBLEEx6jB7auD0iw/Oqb5kiJ5MUKOJ
	zKGlZzji6SNgh4i4J+w+yuFlHKB3Vi/+Q8Ty35qf4Zi53v/yucFfyh765wT9T6I/hadJ7cLxC7t
	tz7vf5GFm6fO10Wwi/YkRvaotH/vb43QbLUPh6vLBLCyVTIZZ8bh0LlQHIKTSfkjlMPELwhaex1
	voKDnWnPsn3h47B2JGzqP0Lk0iyHudBM49IguWPrMoO64z0pnDzquMgm+XyxF9dBpMgzWA9E8Wc
	ANMartmUB0eukizI5WKSlARDxof/FcfwTZB9ggzRCdrYNmOfEDoctFC3E4Y2TuuhtAVuYZvjhLD
	qVB5lCsNEzB/1ooWjEhzcX6bGGl4oYDb4ihIN7y5DRulr8R7q0/OD8Cvvvo7cW+eFLn20ND9wCK
	2xqnEOISyIsnHaKUdVxOCIOxFGBisBSPWmXHlOGpvb8Ah2MdZ1zpON1vAejoxUdZClgtMirkXan
	YXYQaK12IX9yeYfzw==
X-Received: by 2002:a05:6a21:608a:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e1340542b4mr4754282637.30.1791473818297;
        Thu, 08 Oct 2026 08:36:58 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd35736f232sm263479a12.26.2026.10.08.08.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:36:57 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Thu,  8 Oct 2026 23:36:16 +0800
Message-ID: <20261008153620.238580-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK356x UART nodes define a dmas property but omit the matching
dma-names property, so the 8250 driver fails to request a DMA channel
and falls back to PIO, logging:

  of_dma_request_slave_channel: dma-names property of node
  '/serial@fe650000' missing or empty

Add the missing dma-names = "tx", "rx" to uart0 through uart9,
matching other Rockchip SoCs such as the RK3308.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd39..098493c04ecc 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -443,6 +443,7 @@ uart0: serial@fdd50000 {
 		clocks = <&pmucru SCLK_UART0>, <&pmucru PCLK_UART0>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 0>, <&dmac0 1>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1449,6 +1450,7 @@ uart1: serial@fe650000 {
 		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 2>, <&dmac0 3>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart1m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1463,6 +1465,7 @@ uart2: serial@fe660000 {
 		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 4>, <&dmac0 5>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart2m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1477,6 +1480,7 @@ uart3: serial@fe670000 {
 		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 6>, <&dmac0 7>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart3m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1491,6 +1495,7 @@ uart4: serial@fe680000 {
 		clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 8>, <&dmac0 9>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart4m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1505,6 +1510,7 @@ uart5: serial@fe690000 {
 		clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 10>, <&dmac0 11>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart5m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1519,6 +1525,7 @@ uart6: serial@fe6a0000 {
 		clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 12>, <&dmac0 13>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart6m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1533,6 +1540,7 @@ uart7: serial@fe6b0000 {
 		clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 14>, <&dmac0 15>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart7m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1547,6 +1555,7 @@ uart8: serial@fe6c0000 {
 		clocks = <&cru SCLK_UART8>, <&cru PCLK_UART8>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 16>, <&dmac0 17>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart8m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
@@ -1561,6 +1570,7 @@ uart9: serial@fe6d0000 {
 		clocks = <&cru SCLK_UART9>, <&cru PCLK_UART9>;
 		clock-names = "baudclk", "apb_pclk";
 		dmas = <&dmac0 18>, <&dmac0 19>;
+		dma-names = "tx", "rx";
 		pinctrl-0 = <&uart9m0_xfer>;
 		pinctrl-names = "default";
 		reg-io-width = <4>;
-- 
2.56.0

