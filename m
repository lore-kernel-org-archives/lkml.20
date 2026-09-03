Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7034B1B5D;
	Thu,  3 Sep 2026 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444000; cv=none; b=QZKnNLucn1EZCpdZM99yAZzL5rJuj0tyWSjkIVrozn+4+F3ZilctRCjJkI13YgYsiMmOGLqITlQ0yoiof8+JFvkY5cVmd1ifEkuq61k/QojUB8NjOXJjnZ0ro45LuzsxzkjP5PfB1lGelKFU3hU3Y7qsyPFc3mEPS5R3Q10lrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444000; c=relaxed/simple;
	bh=Jmv8TOkTNNbuZrKlY6isB4PxsULVGUqZEwDiBEXAa0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3EjtBcyVfZdhJKlN9nuIpd2igFIk56P9uumaDo2ywm72Kfk9YN6EKgJrdhR8EHPmDjDzSdGloSdJrtEdLxjfdozJxNXR6glwS005Ki7LPiSasbX4NAlWtbu496KdYggPMYgW73K719yBFvGMmdnRiy4t5dfyen/DoSKI1JliFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=JRt7SxMu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lgiPQG2g; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="JRt7SxMu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lgiPQG2g"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C4D1EC0326;
	Thu,  3 Sep 2026 09:59:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 03 Sep 2026 09:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788443980;
	 x=1788530380; bh=ZIy2jDUjDSAzq3rl2IQj+FVKtP8cUbBzF4JE8HwUg7I=; b=
	JRt7SxMuq9IczuoFLeKnV+xmCBKqTyM4Eah5p+CAQI+7ebBIyALZU3f9OzRbgxmW
	TgIqLCT/JAbageB9wCj1rN+vXLzi2EmKT1DZCQ2DcvmvVHo9K/FV+gxU/NSFFIEK
	glOGM96fXaMlR6vPfmmX+dyBA1l2KOSWKNZ8+DOneWXq1azlJvQIEME+UgbucONd
	U4//7F1MPbROzKqsEjm2cQUS/lTYJxCoQvVf+1H0SCimZEnfAzp1ddNIWjwreYUB
	jPcpIYXCSBgtihEM5Hvd7EGmH2JuDrn7D2ms8/qG3HZhAjmUNNJ4gh7OwBUTZXr9
	mD8sxpqTuCppZWXNLiMpxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788443980; x=
	1788530380; bh=ZIy2jDUjDSAzq3rl2IQj+FVKtP8cUbBzF4JE8HwUg7I=; b=l
	giPQG2gYSRNfnkzfUE55GdNC7fCRhfAUNU8krzdp11eIPWNhoXqYII26c0NhLIHd
	S9g0KX8Y9v29PKkoUEwTQh6HC7yqQarphzkUxl4uX/4ETYzkiGOM0HcqwM+yI2z2
	6lepwIW960h1LSWAZG2W+445y6mgC6WeHT90UAulqGfP5rrE/bqk9mY8a8Nx9bHK
	+Pgvnod2rIM+ilBWwu0aCfm3LO0OnbeAlpAd/GOYKC9gGQ43AOAb045ZlWcQja83
	2G9kP43Nn+yoMrAKLvgJm8pzYme18TeysgeAne/edgj3k/SnyXm1HTRtY8oyAJHn
	6aHqs3ECCWiNmoZyXhjMw==
X-ME-Sender: <xms:TH2ZatLfEXgnSKNYRO3QLjfmwj2DMIrnlktiq5NzVL19Uzdtt-YN_Q>
    <xme:TH2Zak9jfF2Ks5ESXjcEEeYs1JHy3sRQKCbDwzAkIHSr3YRFqp2deJ6EYVuJZ6QA5
    Y50YyXqdz4jNwBzIvvlapdGN_TZllotKu8zzc0EiAZ56idbXwHFiQE>
X-ME-Received: <xmr:TH2ZahF8VGYF9gTKy2ukh9gq2lofd_xhF4J17BaZ1ba32cie1aKArTXR42APu4_mkEU8KhGlnHod0V5ch8tu8ZoBKWb_0UDQE-yZsA>
X-ME-Proxy-Cause: dmFkZTFcpYBTRCFgODwx4IUPoR4bJaChIXKsH3afFh2Xpvizaclb5S80INlpKeKv9BXFDq
    yMiKsUELK0YRBY2/3hc4KHy6MZ7+ukA8Bsji12NtSMlKDu7omlMWGJILS+nkqBsvx4lAvX
    QyL6tx71DnbrVejTwb9SC1ubmR5U6JByW6CfEDlo5jadjY6i6Asq9X+Pj0CgCbJDQuypY+
    dE2XudzWCIm/XbuPUNuGXbDz+EMs3E4DYPNedwhjdwXk78b9ptrdC+i1jlA8pr/NGncTN1
    Fmj24k3fFvYxIY4xYrFU6RuwbZ1Q1Kr2Zwb7/7NQQ6F8bGvEw5bv2yW+tAOyzVRvKJw7MQ
    JgliSoBGNOj8OaDuwrWKLIWgn9PU6KGMwRfyAyyUPEpyqobqqna3OofwsXCx7PyjHEMlvU
    K/KCPviyFDP1VEqU/NEB796y39PwPQBjsJU834XVlQ3YnDiEpjy/CJAjd55seZ7+obO8HI
    QgCBZsVJFNvLHhsF5rKmkWy3y8HHO03qaHeJW+CKARmskBlW6rtp9fup8i9dM47oIe5IXq
    K4KTMGSrEMsUBWiSWgZoR17uL/rPNOwVtM2WrqWSLHsIZN84mibSNl+/PXlJ9U9be7l7Ps
    hCMoNvSMD/hZg2DO+9JDMm4CRtKgPzMRUn62Zu0NH1kEiiGdK+v0Pwqn/yDA
X-ME-Proxy: <xmx:TH2Zan5WyskQLzDGKiZDOfwY8wPF4bRnd9K4PD3wVx8hFbfew7ObyQ>
    <xmx:TH2ZaiaejvvVWyK-x0-_lKpnT-aTFBPeVWJ8PWJ9ILnqeOdf5yzhkA>
    <xmx:TH2ZathL1iewcbjcCgqYyDi_oZTfK-IZD8IGQdigZPiZ6gmtJuwZoQ>
    <xmx:TH2ZasdoG4OZl6Z_5v2mZMnr7E67kByvhTe2wqDv3REV2KpZvfEZLA>
    <xmx:TH2ZajWRgApIX3SW53mXvGJWbumIG_oTLW3Na1ZKMK2ULjM-ox17pI4w>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 09:59:40 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 03 Sep 2026 15:59:34 +0200
Subject: [PATCH 3/3] arm64: dts: apple: Fix style issues for t6031 multi
 die .dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-apple-soc-multi-die-style-v1-3-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Jmv8TOkTNNbuZrKlY6isB4PxsULVGUqZEwDiBEXAa0Y=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyZtS6Ts/3eXwiuW+f5VPSabnLUmeyCHTVuMzd6qYUe4
 deauqi3o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEROv2Fk2PbGYkf9mrcyhwy3
 sH1y2F8rfF7q+6bFkhv67jKY/KyKVGP473pK5JcEv5/phNS9DDUZZdH7RXVFd4aJRcmtja7yt1n
 OBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The M3 Max/Ultra .dtsi files containing most MMIO nodes are a collection
of nodes without parent. The proper embedding inside a "simple-bus"
parent only happens in t6031.dtsi and t6032.dtsi.
Fix these dt style issue by using a define for their parent soc node and
bracket those MMIO nodes inside it.

Link: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@kernel.org/
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6031-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031.dtsi      |  9 ++++-----
 arch/arm64/boot/dts/apple/t6032.dtsi      | 16 +++++++---------
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6031-die0.dtsi b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
index 47d08672a047..cffab6b51d12 100644
--- a/arch/arm64/boot/dts/apple/t6031-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-die0.dtsi
@@ -6,6 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	aic: interrupt-controller@292400000 {
 		compatible = "apple,t6031-aic3", "apple,t8122-aic3";
 		#interrupt-cells = <4>;
@@ -195,3 +196,4 @@ serial0: serial@391200000 {
 		power-domains = <&ps_uart0>;
 		status = "disabled";
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 2e9d3d2e6dea..524a72f5483e 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -6,6 +6,7 @@
  * Copyright The Asahi Linux Contributors
  */
 
+&SOC_NODE {
 	DIE_NODE(pmgr): power-management@292280000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;
@@ -105,3 +106,4 @@ DIE_NODE(pmgr_gfx): power-management@408e80000 {
 
 		reg = <0x4 0x8e80000 0 0x4000>;
 	};
+};
diff --git a/arch/arm64/boot/dts/apple/t6031.dtsi b/arch/arm64/boot/dts/apple/t6031.dtsi
index 0059afe9a844..2ba0768c33bc 100644
--- a/arch/arm64/boot/dts/apple/t6031.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031.dtsi
@@ -35,14 +35,13 @@ soc: soc {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE soc
 
-&soc {
-	#include "t6031-die0.dtsi"
-	#include "t6031-dieX.dtsi"
-};
-
+#include "t6031-die0.dtsi"
+#include "t6031-dieX.dtsi"
 #include "t6031-gpio-pins.dtsi"
 #include "t6031-pmgr.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index bbf19ecdaaec..12171efe8e2e 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -317,31 +317,29 @@ die1: soc@2200000000 {
 
 #define DIE
 #define DIE_NO 0
+#define SOC_NODE die0
 
-&die0 {
-	#include "t6031-die0.dtsi"
-	#include "t6031-dieX.dtsi"
-};
-
+#include "t6031-die0.dtsi"
+#include "t6031-dieX.dtsi"
 #include "t6031-pmgr.dtsi"
 #include "t6031-gpio-pins.dtsi"
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 #define DIE _die1
 #define DIE_NO 1
+#define SOC_NODE die1
 
-&die1 {
-	#include "t6031-dieX.dtsi"
-};
-
+#include "t6031-dieX.dtsi"
 #include "t6031-pmgr.dtsi"
 
 /delete-node/ &ps_pmp_die1;
 
 #undef DIE
 #undef DIE_NO
+#undef SOC_NODE
 
 /* delete non-present DISP power-states */
 /delete-node/ &ps_disp_cpu;

-- 
2.55.0

