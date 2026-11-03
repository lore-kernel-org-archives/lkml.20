Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745844;
	b=BwuCpJAWeYHQVwoelST1SvQ6xTvSbDyBu17YF5E49oXO1GY3gqekRiRFToDOIN3p4KH/
	 nRg88E+8epVOY9jAlScyCZGvgawqWyIw63/WbuTxyXHuE/zJuBdRX65EPIgDgns0JvH0t
	 zqDatQiucCjUmbJ/lRVGiA3ylEo0//GOT6JALvDj31wQh9nebQdZbvXZ+dKYt6mxf5xhm
	 1qXPg+YoXGgfpQr0kyiR8umnhdalTRXZYwAwaL0ScIVKApQM9GThxb6BxUKk5IvJclZLx
	 M1Zkd4E0lqtb/D3AzY1Z8o11qwEt0Kb9EdGcke+FXiWfpDM/EIN+won6RAH+AdFJK3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745844;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eCpLb2eSBdU7oOnz3uYs19P+wbMVKJaOGnZyAlRZ5JQ=;
	b=MQJQs66hHooo2zIFx84fUT/fIKJyZSHxRdKPS99Edw+2o1gLKWSfZTrT/Cr9u6nY7Cz1
	 6ZxEPLep+qe4b60FvCUVJ1bunBiC3RirmCRUdz94qExyp5ZuzGxs0n5BsCCsv+K+PvVVG
	 jf5bIebmpa5QWD1YJI1SrZ/PeLatqeLBky0iiHSAhL4DFqD7vjn5ptEVOFcRSVX++tXrL
	 yuS8wzbq4Sf1QCtviNQ6bu0Am3UZ58yMjkuGnzKWX23OqaufSUeMR0UgzKyADro7bPHDX
	 /Wk0ccSs8E6oUPID3gFH+kcXByVRPAa8JvywQMYdrFkVPJUzEuvqyCDtRjrb2d+X4ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBr6vEao;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7C606A329;
	Tue,  3 Nov 2026 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBr6vEao
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBFC1F000C1;
	Tue,  3 Nov 2026 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745844;
	bh=eCpLb2eSBdU7oOnz3uYs19P+wbMVKJaOGnZyAlRZ5JQ=;
	h=From:To:Cc:Subject:Date;
	b=aBr6vEaoSaSIlgo+yE1NlG5IxyzfubHlr6a8X5qUV4/pTRXFKDPZ7nBg+zAMGGqfe
	 +A/nPSln2hNiF7yICWJb4QNGaY/boYgyl1PoM8WJHw+PmE0Y51jF8Q2mF2zy/5Kopc
	 wcHFTrwgsQMXjOSfNDytPdObM5Y68mpthtCeZDNyWPr5rQXZhnutZEE9lS02KYswPr
	 tmOiHV2WlWKwRV0NPmw+mgA6uUtnYP0pEg9YvAVyC34zuIM9XSKG/CY9ZjkVfeQxQY
	 24JoyvgVtYfqNbjfXDXo4gHNlkNbHXZZWbWupgyjqyaMgVdhmUkzLq5JbEv74E5do2
	 Kn+nx+B4B83oQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Tai <james.tai@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: realtek: Add RTD syscon compatibles
Date: Tue,  3 Nov 2026 16:43:50 -0600
Message-ID: <20261103224352.862662-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"syscon" nodes must have specific compatible strings. Specific
compatibles were already added to the bindings. Update the DTS files
with the specific compatibles for the RTD1295, RTD1395 and RTD1619 CRT,
ISO, SB2, misc and SCPU wrapper syscon blocks.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/realtek/rtd129x.dtsi | 11 ++++++-----
 arch/arm64/boot/dts/realtek/rtd139x.dtsi | 11 ++++++-----
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi | 11 ++++++-----
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd129x.dtsi b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
index ba50e292bdbb..a7fb8dde1d60 100644
--- a/arch/arm64/boot/dts/realtek/rtd129x.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
@@ -64,7 +64,7 @@ rbus: bus@98000000 {
 			ranges = <0x0 0x98000000 0x200000>;
 
 			crt: syscon@0 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-crt", "syscon", "simple-mfd";
 				reg = <0x0 0x1800>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -73,7 +73,7 @@ crt: syscon@0 {
 			};
 
 			iso: syscon@7000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-iso", "syscon", "simple-mfd";
 				reg = <0x7000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -82,7 +82,7 @@ iso: syscon@7000 {
 			};
 
 			sb2: syscon@1a000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-sb2", "syscon", "simple-mfd";
 				reg = <0x1a000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -91,7 +91,7 @@ sb2: syscon@1a000 {
 			};
 
 			misc: syscon@1b000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-misc", "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -100,7 +100,8 @@ misc: syscon@1b000 {
 			};
 
 			scpu_wrapper: syscon@1d000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1295-scpu-wrapper",
+					     "syscon", "simple-mfd";
 				reg = <0x1d000 0x2000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/realtek/rtd139x.dtsi b/arch/arm64/boot/dts/realtek/rtd139x.dtsi
index e8af39193e75..11113999824c 100644
--- a/arch/arm64/boot/dts/realtek/rtd139x.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd139x.dtsi
@@ -62,7 +62,7 @@ rbus: bus@98000000 {
 			ranges = <0x0 0x98000000 0x200000>;
 
 			crt: syscon@0 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-crt", "syscon", "simple-mfd";
 				reg = <0x0 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -71,7 +71,7 @@ crt: syscon@0 {
 			};
 
 			iso: syscon@7000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-iso", "syscon", "simple-mfd";
 				reg = <0x7000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -80,7 +80,7 @@ iso: syscon@7000 {
 			};
 
 			sb2: syscon@1a000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-sb2", "syscon", "simple-mfd";
 				reg = <0x1a000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -89,7 +89,7 @@ sb2: syscon@1a000 {
 			};
 
 			misc: syscon@1b000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-misc", "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -98,7 +98,8 @@ misc: syscon@1b000 {
 			};
 
 			scpu_wrapper: syscon@1d000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1395-scpu-wrapper",
+					     "syscon", "simple-mfd";
 				reg = <0x1d000 0x2000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
index 43b13d133c32..7f6e7a03f4e9 100644
--- a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
@@ -143,7 +143,7 @@ rbus: bus@98000000 {
 			ranges = <0x0 0x98000000 0x200000>;
 
 			crt: syscon@0 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-crt", "syscon", "simple-mfd";
 				reg = <0x0 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -152,7 +152,7 @@ crt: syscon@0 {
 			};
 
 			iso: syscon@7000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-iso", "syscon", "simple-mfd";
 				reg = <0x7000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -161,7 +161,7 @@ iso: syscon@7000 {
 			};
 
 			sb2: syscon@1a000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-sb2", "syscon", "simple-mfd";
 				reg = <0x1a000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -170,7 +170,7 @@ sb2: syscon@1a000 {
 			};
 
 			misc: syscon@1b000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-misc", "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
@@ -179,7 +179,8 @@ misc: syscon@1b000 {
 			};
 
 			scpu_wrapper: syscon@1d000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "realtek,rtd1619-scpu-wrapper",
+					     "syscon", "simple-mfd";
 				reg = <0x1d000 0x1000>;
 				reg-io-width = <4>;
 				#address-cells = <1>;
-- 
2.53.0

