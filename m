Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3425F4B2023;
	Thu,  3 Sep 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443999; cv=none; b=LVG9RQJl2TFzOCbzSIxNzpp3f3DXzOP0TV2bHazU8Yj8eqiseuCONr3tbKkPgrDiwVyGEzBCNTnLIZLLyx/n2pjp85P6r6+7O8FaDNYvav1/A3MdPzCZTBr6iEG9siXWlYdPUocR6F+fH5T8DMwVDdxDqgRr/daqnfvM7Uq+dcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443999; c=relaxed/simple;
	bh=gV+6atf6ncS6fsyXv7xAArWLeduGgxbT0Q5oOMKjwo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpJNPpX+KNX/2qKTWAj//AlJQtU0zsWGLQ6OzJWvJa2vdIIbLU9nam/r9kmJOaeiJDD9bkeqS3d0cqSVGJa3gW5eW79FApdXQPhOk3ZrNv0BuzN1CM4sO2jFdYktw9K3MObmJ9uAWCBUgP8nilhmSt8I7pVLUn86rQ7bTpeKHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Iz68H69E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Niv5AA8a; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Iz68H69E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Niv5AA8a"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id E9F9DEC02A0;
	Thu,  3 Sep 2026 09:59:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 03 Sep 2026 09:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788443978;
	 x=1788530378; bh=A28Wf9L2n/V5TpFU7VZJAIMyJkq07hXUIHCEXp8fTXU=; b=
	Iz68H69EnfhOQ5deFEYWWoXcHd50Xg6xueW2CVicAbp+9G+UCJgqkwA1gO3zDSVf
	k0HJ3Zv0iwA7RkR3rdepnUgKjKgdrps+Hwv/0+LYt8HmICTw+OZW9pAAvJhvbxDh
	tShoGCOWt/uTZPYCJK4W6CVAd2aRHgxCIgAgq85o9SdGG/N2v7PZ3LCBV8+BMdyx
	xXXGyn38gyx5qoqhLi3AhvTR+hntUGScsbShPDyN/zKLs3J1xQXr5m8mWzG8xgMU
	/dSIQniynK2L6GF4sNczCEtLAzQC+oYolFApoJAHXP2SbeUf06twoXzJS8CeT9jZ
	4GlmUfCBz7fZYwrUY2+ZkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788443978; x=
	1788530378; bh=A28Wf9L2n/V5TpFU7VZJAIMyJkq07hXUIHCEXp8fTXU=; b=N
	iv5AA8a8AMYYr3hOhmnQ06dsz/TmblGH3Z8AuPtNyWGRc50cPach08bI2FJI8bN2
	eabmbVKt27jcJoR+Zdb2O7XaQXsdZ3oGVTizE9F9VutTUxp5Zh56yvbME21mT1Hs
	FeOQUExAMH5dHuLuduS5xh1zEyONg1zKd/R4eWGTE7WshNDr/ahFOYcRdPF0cLJq
	8+mPQC3esmRSeRFv5mul+P2BE1c91wKGC8pMlbDWBsyEV/NtuadtpvNEJqKzfJK8
	Kc/1lOQ+oxz6IW9akVFISL0eAWDbCPd6mUWMzgUs1vrQdIqTbKbkTwcNWDIfKjVI
	rmuVG3YGhr2KckzRnKTJA==
X-ME-Sender: <xms:Sn2ZaqrZ8TnE6Vx-ce3YtO4AiS-bywPD_HHZmSFhHYiQ-HbTotbT6w>
    <xme:Sn2ZakfUccdQYygr2Crfv_b_0rXZUldvEQ4YObQWts1OaloNWTxq2opFj3vkJIsXD
    aeb_GlH5FcPq7Cn4kuds2WUol1_QetMQsoieTDDIWvALBCE9p8Vp3g>
X-ME-Received: <xmr:Sn2Zaqll9Duvv-EAYyTR_QFE8V-iOHpjVsOWLOQC_JZSRls9gQIZ03qL7M6cfOZhWAuGw-c_yt-4KvcJ_q9p81zCEJaUBEh1IJLggQ>
X-ME-Proxy-Cause: dmFkZTEIYzIeAqti25ZE1E1v/teuEWoWHdBGF9H6h1LlXnmo2R4EOE7VsCk1odudTIRvm6
    eFOD5Mzpiu++QVbazB15zOz7x78D6TrVj+MRoE6GWdsrgwhGvsWp//oRGZgcNrTQHmsZsD
    6EMECrQXWGNUBjE6Lz2aC6Mm6PlUUg6prWJ1te6HWPd/TwVQfquQNgxNGqHmAtfmOH+Mib
    5jimAPqGOjLutrFHdJgt6a4HXl0HbB79QwoEalQxPR6LIK/aiy80/UOn42xgHOI6oc8jpF
    BjB4vrjIQnYLCBx2i6bYEv1/2tiG2Nk0dSzRkL7vamhK7Swptm44Mzpwg9NHc32FMWNSp4
    g7uwTX4KIDW7PUSFkW4dMflX1iseksjWuY9f/peQBNfrARFlUDFxwh/EythR3SxK3EAWVj
    iqUgUMs286yISj2hOSVMQRCX5xuMxutt69qKsV4RvKPyUh3ud+tgbPkIQis4M5UWUQCFW4
    nNyQevgOj/XA0w+WQ+ai3Dm+K0gP8Y3hTkrFwvR6mI21rXG71AWVcSpLXLnWJQx9AKqcyw
    eIuJxzP8koP5D0LS1PxFkV08vn4UU+d7s2dUkDImTa58GYYj3MSkgIzf9mvL9kyIj0kz79
    KPT8cdnf/5ZbQL88li6mt1vaSTEVRMqVt1SiqubscMIgbaO0IbZaQPdWvQaQ
X-ME-Proxy: <xmx:Sn2ZajZc35LwhQt6o9-uQ7EoGKeQXhPLhvwxESYzG2vxXMbUICIhDQ>
    <xmx:Sn2Zan5dRVKLTZ450pxOsr2t8oO8cLtlbEgu0n4ghyKd78xGJ17PXA>
    <xmx:Sn2ZalDUrvgTxooMdia1pnM67UKz3V0-wR7TDCVDQ_gb3kvMExolEQ>
    <xmx:Sn2Zat9TidhcoIsEAsBIAOu2jlgtjbE_2J69BRDB9DkKwTV8BiO5DQ>
    <xmx:Sn2Zau3JL020k4IYoqdB90lZK0g0YoNQ4_JtdgZQtZkaRCQtI2frkTU_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 09:59:38 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 03 Sep 2026 15:59:33 +0200
Subject: [PATCH 2/3] arm64: dts: apple: Fix style issues for t602x multi
 die .dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-apple-soc-multi-die-style-v1-2-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4167; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=gV+6atf6ncS6fsyXv7xAArWLeduGgxbT0Q5oOMKjwo4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyZtS4/Oi7pe4R4PL/c/vZUSkfo8nvb167cWqy1Z+VO+
 8rK7e9bO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExEv47hNwsP15mtybpebx+5
 h9Vs/fcgL/ji56bPTVeaHMTSOQ/axjAyLJ3l6fz7VUltz4obW8+6MER3/Tn7oILx/BXdpWYKNgm
 32AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The M2 Pro/Max/Ultra .dtsi files containing most MMIO nodes are a
collection of nodes without parent. The proper embedding inside a
"simple-bus" parent only happens in t6021.dtsi and t6022.dtsi.
Fix these dt style issue by using a define for their parent soc node and
bracket those MMIO nodes inside it.

Link: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@kernel.org/
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6021.dtsi      | 10 ++++------
 arch/arm64/boot/dts/apple/t6022.dtsi      | 18 ++++++++----------
 arch/arm64/boot/dts/apple/t602x-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi |  2 ++
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6021.dtsi b/arch/arm64/boot/dts/apple/t6021.dtsi
index 5175797baf62..3cddc1697e14 100644
--- a/arch/arm64/boot/dts/apple/t6021.dtsi
+++ b/arch/arm64/boot/dts/apple/t6021.dtsi
@@ -35,13 +35,11 @@ soc {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE {/soc}
 
-&{/soc} {
-	#include "t602x-die0.dtsi"
-	#include "t602x-dieX.dtsi"
-	#include "t602x-nvme.dtsi"
-};
-
+#include "t602x-die0.dtsi"
+#include "t602x-dieX.dtsi"
+#include "t602x-nvme.dtsi"
 #include "t602x-gpio-pins.dtsi"
 #include "t602x-pmgr.dtsi"
 
diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index 7585fd609d34..0feda70568ee 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -294,32 +294,30 @@ die1: soc@2200000000 {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE die0
 
-&die0 {
-	#include "t602x-die0.dtsi"
-	#include "t602x-dieX.dtsi"
-};
-
+#include "t602x-die0.dtsi"
+#include "t602x-dieX.dtsi"
 #include "t602x-pmgr.dtsi"
 #include "t602x-gpio-pins.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 #define DIE _die1
 #define DIE_NO 1
+#define SOC_NODE die1
 
-&die1 {
-	#include "t602x-dieX.dtsi"
-	#include "t602x-nvme.dtsi"
-};
-
+#include "t602x-dieX.dtsi"
+#include "t602x-nvme.dtsi"
 #include "t602x-pmgr.dtsi"
 
 /delete-node/ &ps_pmp_die1;
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 &aic {
 	affinities {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index c33623f0e27a..05819755a18f 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -6,6 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	nco: clock-controller@28e03c000 {
 		compatible = "apple,t6020-nco", "apple,t8103-nco";
 		reg = <0x2 0x8e03c000 0x0 0x14000>;
@@ -590,3 +591,4 @@ pcie0_dart_3: iommu@597000000 {
 		power-domains = <&ps_apcie_gp_sys>;
 		status = "disabled";
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index ae3d535c5acb..4044c4f21795 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -5,6 +5,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	DIE_NODE(cpufreq_e): cpufreq@210e20000 {
 		compatible = "apple,t6020-cluster-cpufreq", "apple,t8112-cluster-cpufreq";
 		reg = <0x2 0x10e20000 0 0x1000>;
@@ -338,3 +339,4 @@ DIE_NODE(atcphy3): phy@1303000000 {
 		mode-switch;
 		power-domains = <&DIE_NODE(ps_atc3_usb)>;
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-nvme.dtsi b/arch/arm64/boot/dts/apple/t602x-nvme.dtsi
index 590cec8ac804..d1f4267a6cd2 100644
--- a/arch/arm64/boot/dts/apple/t602x-nvme.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-nvme.dtsi
@@ -5,6 +5,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	DIE_NODE(ans_mbox): mbox@347408000 {
 		compatible = "apple,t6020-asc-mailbox", "apple,asc-mailbox-v4";
 		reg = <0x3 0x47408000 0x0 0x4000>;
@@ -40,3 +41,4 @@ DIE_NODE(nvme): nvme@34bcc0000 {
 		power-domain-names = "ans", "apcie0", "apcie1";
 		resets = <&DIE_NODE(ps_ans2)>;
 	};
+};

-- 
2.55.0

