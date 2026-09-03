Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C958C4B1B33;
	Thu,  3 Sep 2026 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443993; cv=none; b=ERbhQhJPNNMXEMNSpts+ER4RJYRC27US1vZd+LxlqXC0reiAu5KzBbXsVOthmJ1WYzl1+kGd3BOq9KHjDp9jMG1nVB5j6hOQjucjXvr7H5tueQhLiD6BKEgbEEDIYpnr7dvESUWEjKYyTZe0oHHtaLVP5bIOmzYdTbTFyyBeOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443993; c=relaxed/simple;
	bh=SQINWDUj6JgqHfaw6SAgmrPkNaAA7STObGtyHJjbY9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BKBtQ+6mpLAThOHhpwoBGfiXaeogPJLcVjoX83YfM8VgkjqessNCBkZ3iIDYVO5HIdh0yV4Q+jU1ic+E/Nw9k5l4s1WbowLWh8gdHhOt4qDP22fOxbv1ChGowjhz8grMkbLXazUt6+uJ2IklCQOEsCi/FldZz1zsDtL3dC2dXIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=YRERS4gp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AMpWVWj1; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="YRERS4gp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AMpWVWj1"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE53D14000F5;
	Thu,  3 Sep 2026 09:59:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 03 Sep 2026 09:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788443976;
	 x=1788530376; bh=sBine+VGUispbbJYZQl5o9VIXDJ1/236RlFhB9q5Dow=; b=
	YRERS4gp1KBcvCaGkUKZBp7zjpVA+cG+9OUxMgTbOfm/WoDiTstBqw56c3289NeZ
	M92RLGyomtGVpwTL4YxXuIqT6+L0OLerXIeW9FHupdV0c3z6ywr2MrwIKdB4WHil
	By5es/KEY5M1apYLY3WP++hvzBTVWFZObiGvnHIFsPnfN+MSurj4j3uTvUOH52Et
	oXCa1oYlwBdvTy3CYZA+pzvEv6dEh2CxjXvPOHDqCDBMFi05CNMPUympf45LuaKb
	XCj0HJFuq3pbK0uwGbz2ZeM4HJXbrk0umOPOj9ZpkdBEHzohJnPCGFJo3qmkec6S
	+pQv2gv0ZqowjIPRWzbZog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788443976; x=
	1788530376; bh=sBine+VGUispbbJYZQl5o9VIXDJ1/236RlFhB9q5Dow=; b=A
	MpWVWj1hRvqDXXew8MzRZZVYD8SFyQEOnS9lt/MJds7Psb3maGib26VoO5Jy0oF5
	eJ4fpom9MmD+2r+HqECtymslUDdDjnRv5+8fQ0OHA48fZKyTUWue7WxKqVH9+pw4
	hS92PL56HJ6HWuiqIB4n/mEX0uNMluaLbVom4OzD7iW+dws2DEZt5KehFvDAwYJP
	N9XLEadmD1y2en6ZijtMhAePktHNxraHVgSHbewEwvbzHkHOsq0H+Su9j682466+
	Uw5T+bn7PcOQglkC2Yv0H6V8jac+8VDGNZrA4n+E4beWhurJbI5YB2LQLBd+Z0vm
	nPnhLvcY3sx0kfPWcCRKA==
X-ME-Sender: <xms:SH2ZaiwEXjxSFOwaSiJCraec91L-TZ4Fd45mK1Jjrgf2t7RwMZd5JA>
    <xme:SH2ZaqG5iOkypIk-M1loVQInnl8UmG_Zn_apRUhJvsg2Kpj_Z9Q5r6B9cPmJJgNz5
    rHdVjczg9QqcPSGkZdUiNkGLBGw1yoI6FzGXRDWXJA-Wwiv-YXYSF8>
X-ME-Received: <xmr:SH2ZavvouswJ_msP8cGDcJCW6xwjFBh6TEppxS-RlramO1mkAPv3AnUz8m-sT8wo6GpkHc64Aok_62Lh4lyYjlQw7baCj6OnHw8rAg>
X-ME-Proxy-Cause: dmFkZTEIYzIeAqti25ZE1E1v/teuEWoWHdBGF9H6h1LlXnmo2R4EOE7VsCk1odudTIRvm6
    eFOD5Mzpiu++QVbazB15zOz7x78D6TrVj+MRoE6GWdsrgwhGvsWp//oRGZgcNrTQHmsZsD
    6EMECrQXWGNUBjE6Lz2aC6Mm6PlUUg6prWJ1te6HWPd/TwVQfquQNgxNGqHmAtfmOH+Mib
    5jimAPqGOjLutrFHdJgt6a4HXl0HbB79QwoEalQxPR6LIK/aiy80/UOn42xgHOI6oc8jpF
    BjB4vrjIQnYLCBx2i6bYEv1/2tiG2Nk0dSzRkL7vamhK7Swptm44Mzpwg9NHc32FMWNSgg
    JNGMm0QIFdpV3zmtRwiL5r8q4JFGlJYZ2NHFazmJ9QzzHHo0fp3rl1q0kCUtF4kascevAr
    8E5p5n6bgOe1J9acd6dGPXMfxbDWZ/DrS7cS/2DcYPpQ6i3MEu8rP3tDU36tz3lb4YbQpL
    goPy5iJ/zuOt1m/tO+u7nZCJchZTaDBfgYQfXh20FUGzhKJyNRPrIqAWlpW7QGt/sb1uLY
    9rc7uwbipixJBeLPcQrOnRi0x2xwywP7SB9/Rz26yOFjuvX59Ob6w8If0e+JR92L/VyCxO
    ednM4qBvBV4NONU5+I6H7O2OMhSkAo9YnOp7jg98p3I59nybH9KLYRilEimA
X-ME-Proxy: <xmx:SH2ZaiDy-LzbLbSCZuc9PuUVPLrQ70QgtGsLYYudX_V_TiY14QatJA>
    <xmx:SH2ZaiBukluwgcazG2TVPQWU87dfg0flzGZiXdjcwu_N67_Wq8_pJw>
    <xmx:SH2Zakp1yPzTB0ekBSXCHNLYcrz4nePlaBXcDo3MAqNFrDUOo_zfWw>
    <xmx:SH2ZalF6i9DpCpegcajV9MrN2GBZgVl6uW2z19VZ3yfjaUnfMdq2TQ>
    <xmx:SH2ZaheKizGr2j8PzWiGrIGQoG9LNZhnGX9bmA93qYHG68KW0MOWpD69>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 09:59:36 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 03 Sep 2026 15:59:32 +0200
Subject: [PATCH 1/3] arm64: dts: apple: Fix style issues for t600x multi
 die .dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-apple-soc-multi-die-style-v1-1-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4174; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=SQINWDUj6JgqHfaw6SAgmrPkNaAA7STObGtyHJjbY9I=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyZtS5L5FZOv3ch8X2f/IpDfwv7LFPEJSTWznbbJpka3
 6xltVyzo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwES8HjIyLGqcf9axWKHSZCdb
 hIuh397CnEciZ/+aH1MLuK+5WEGUneF/6ivB7e8C5tXujblzbN+pn4V5Mi22ji8jtVOviFSHP9j
 ACgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The M1 Pro/Max/Ultra .dtsi files containing most MMIO nodes are a
collection of nodes without parent. The proper embedding inside a
"simple-bus" parent only happens in t6001.dtsi and t6002.dtsi.
Fix these dt style issue by using a define for their parent soc node and
bracket those MMIO nodes inside it.

Link: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@kernel.org/
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6001.dtsi      | 11 +++++------
 arch/arm64/boot/dts/apple/t6002.dtsi      | 18 ++++++++----------
 arch/arm64/boot/dts/apple/t600x-die0.dtsi |  3 ++-
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t600x-nvme.dtsi |  2 ++
 5 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 4fb934d7e71f..e0acf2ba078b 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -35,18 +35,17 @@ soc {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE {/soc}
 
-&{/soc} {
-	#include "t600x-die0.dtsi"
-	#include "t600x-dieX.dtsi"
-	#include "t600x-nvme.dtsi"
-};
-
+#include "t600x-die0.dtsi"
+#include "t600x-dieX.dtsi"
+#include "t600x-nvme.dtsi"
 #include "t600x-gpio-pins.dtsi"
 #include "t600x-pmgr.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 
 &aic {
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index 0f81fc612a2a..91ce9a665cab 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -254,30 +254,28 @@ die1: soc@2200000000 {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE die0
 
-&die0 {
-	#include "t600x-die0.dtsi"
-	#include "t600x-dieX.dtsi"
-};
-
+#include "t600x-die0.dtsi"
+#include "t600x-dieX.dtsi"
 #include "t600x-pmgr.dtsi"
 #include "t600x-gpio-pins.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 #define DIE _die1
 #define DIE_NO 1
+#define SOC_NODE die1
 
-&die1 {
-	#include "t600x-dieX.dtsi"
-	#include "t600x-nvme.dtsi"
-};
-
+#include "t600x-dieX.dtsi"
+#include "t600x-nvme.dtsi"
 #include "t600x-pmgr.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 &aic {
 	affinities {
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 49b23f3da980..122a566e75d1 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -6,7 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
-
+&SOC_NODE {
 	nco: clock-controller@28e03c000 {
 		compatible = "apple,t6000-nco", "apple,nco";
 		reg = <0x2 0x8e03c000 0x0 0x14000>;
@@ -537,3 +537,4 @@ port03: pci@3,0 {
 			status = "disabled";
 		};
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index 9676d5127039..7ab60873faf1 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -6,6 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	DIE_NODE(cpufreq_e): cpufreq@210e20000 {
 		compatible = "apple,t6000-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
 		reg = <0x2 0x10e20000 0 0x1000>;
@@ -331,3 +332,4 @@ DIE_NODE(atcphy3): phy@1303000000 {
 		mode-switch;
 		power-domains = <&DIE_NODE(ps_atc3_usb)>;
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-nvme.dtsi b/arch/arm64/boot/dts/apple/t600x-nvme.dtsi
index 7dff738d317e..3a8e2299eac4 100644
--- a/arch/arm64/boot/dts/apple/t600x-nvme.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-nvme.dtsi
@@ -5,6 +5,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	DIE_NODE(ans_mbox): mbox@38f408000 {
 		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
 		reg = <0x3 0x8f408000 0x0 0x4000>;
@@ -40,3 +41,4 @@ DIE_NODE(nvme): nvme@393cc0000 {
 		power-domain-names = "ans", "apcie0", "apcie1";
 		resets = <&DIE_NODE(ps_ans2)>;
 	};
+};

-- 
2.55.0

