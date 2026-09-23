Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F604BEE27
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164078; cv=none; b=Q2k6yjuhtH4Cn3AKzfBZu9N8+AjUDRxZLFOXMG/AFnJ10mZ6Q7D8tNGySPAnF6iXGKmZEISSAzNPsDiU13wsnhA2prLiC8usp9fSDJo8IYrPgB3GgKMNC4v3zN4HIFhNP2gk4IKW5MNFn0zwoaksGL2v0YcuKXiu/c6+iBDi+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164078; c=relaxed/simple;
	bh=EGGo7R9QTy7gdC+X6I6W7gTPw7Vu+5q0a/31r3OUtmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iD+ccZPxRXczDCEFe86amu3k/oNlrDpP0jCgvwB8pUS/9oDnjcTwTANatnXcwqqGtTpm0RwuZtRLYuov5r58rNAXVrHGcLAHVdjIpXiarKodZAFWV2ttvDdfDf0ruHjkUAVJA8tt8yzgUGBC6GRM9Odul0OY9GNJnbkx/jmP3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=PgU5xVYm; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="PgU5xVYm"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 899F2240104
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164059;
	bh=Ll3bdjdwyApVAippyrGuNHUcJWXRQNFwtW3g+Z+tm0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=PgU5xVYmUKjaObEFzn+jcgMtbSANWdXrhY3cHkR+l0EiC9bn27GlRSxwV696Om0l1
	 ZYRPVBJBgrTkpMIG/A82cUOD+R/qf7knVhi0zk2KIyiStFr6wDlZ7HA70ETD2Zv08q
	 5Ts+M/DZdW65fe46Fgz+RQHozBKCgtYfs5LdcgUFwd5WauW4Hg/8DzMSRPwjLKHqkw
	 7oSN9bF2El5h6SN0lCem1SODwwF+HomEMs0gDZfTZj8s0HISS8x85XoxKJSD6yb7HZ
	 JS7lXNuyIm/dMPWK0GzbCkw4ZjKXTDMjYxP/jei7xZm2Guxt4YFyeX4ynG4VV3N3QF
	 W7iu0waW3HHnw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqZvs6DWsz9rxK;
	Wed, 23 Sep 2026 13:47:37 +0200 (CEST)
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
Subject: [PATCH v2 1/2] arm64: dts: st: add sdmmc2 pins_b for stm32mp25
Date: Wed, 23 Sep 2026 11:47:39 +0000
Message-ID: <20260923114714.140842-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
References: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a second variant of the SDMMC2 default and open-drain pin groups,
with the same pins and bias as the _a variant but faster output speeds:
very high on CK, high on CMD and D0-D7. These are the OSPEEDR values
given in the STM32MP25 datasheet for 120 MHz and 166 MHz operation.

On the STM32MP257F-DK, the eMMC returns corrupted data in HS200 mode
at 100 MHz with the _a groups, and no CRC error is reported. With the
_b groups, four consecutive 1 GiB reads return the same data as a read
at 50 MHz.

The sleep groups are shared with the _a variant.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 68cc89cbe754..d9fd1ae632c9 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -681,6 +681,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_b: sdmmc2-b4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_b: sdmmc2-b4-od-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
 		pins {
@@ -704,6 +749,19 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
 	/omit-if-no-ref/
 	spi1_pins_a: spi1-0 {
 		pins1 {
-- 
2.55.0

