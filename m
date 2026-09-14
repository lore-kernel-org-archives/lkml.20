Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9213941443C;
	Mon, 14 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375269; cv=none; b=Pfx05MzrzF8+d9YmjPO+KTC9r2MdQx/Vkii3WJKumgnVV7uRURkaW9qR4M8iO9lpEcTmg1Ckx016AZ69uGAHldnNjWNxWRmz9QGt6R/CYmzv3kmWavGveIQWfD7+siaAT66gY0tWGdRYNDMz1bKVxsv0g9crH1+9Th/ag41/Kjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375269; c=relaxed/simple;
	bh=1baPjQaZ3lRGHLwVs5BL2CEaexGqyGoKEzwUUYbRUh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpBk5ccpT+m75dMHilKGk0Pura/4eJ6IkoTApsNXQK94HJmFdC35ZixN9q75aPgBHd7z1bb15p8b5s0+J24AutoCPYXkgeHH3LLKn/pJ+PUC/EDynoX58mgS7wYFUoSy4t8110fdGaW9Bg67ZyXubmr1q5jdhPkKgRLcB2jOLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=H/ddflny; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dJ131Ni2; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="H/ddflny";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dJ131Ni2"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DBB2140011B;
	Mon, 14 Sep 2026 04:40:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 14 Sep 2026 04:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375259;
	 x=1789461659; bh=udDyoigq11uB8rCsHk7XbWP+tZUO240AMWYiFrGzuJk=; b=
	H/ddflnytL6at09RqxTtsuxIjkeSMpJL4/Ad9YYn/aNKdnlc57vZ6UNLFoSn4VC/
	UTk11G2Gd+Lnu6WyD3cRAx7yDkD2G/zlpNBDHSG42oI77s4Y6ilhNvaC4mrT9w+o
	/w/jYfAZvWaYY1/iRl1Fai39lh8RFxp6jNKF8JPhJmDqAXCy+9oOJV1OnyOGXDuT
	zq6BTj3YACSwZ13gyRFzior3EzuGvlyd7njYSD7IiGTq4sj0fpQmM1RrTPwsXHq/
	ri/t5OmrLvSZKrP6cdSEVvX/bIS7hz/etJv2FtWXQvf/w674rIqo35ttvkV6L9me
	G62wOdvP1UlvGzPzrWBSJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375259; x=
	1789461659; bh=udDyoigq11uB8rCsHk7XbWP+tZUO240AMWYiFrGzuJk=; b=d
	J131Ni2lbOnXF3niV1hp277KEqf1NVOPNMN6s+Gxx/UyylNUYCt9y7q6wI0ViyFe
	eL0mfksw5KTE3fHz1rDy3nS3AUawBBR2HJAwXbl45zbXyZXpGWD7c0Ab+8128j64
	CP27fvnDdnrKJ9ygXIzjOEIFpeYSwrAIbAnV4hiQuOslOYcpS5nWUYPlNKd2eR4z
	jxgVhHUJkf96RBxiglsVHGJaNgAe4zFVMG4N5LhJegVb0m2Rnx699SgutIUMRX2V
	X6oNvLpRbFzjj+OWYWIngUfzY3FeUPSVgVXiGyMKaYxR8QI9gyg9ra7BCuk58SQR
	FXCstuZbexXTK3eTmkdYw==
X-ME-Sender: <xms:G7OnaqSqrbnq39IHapuBzdmwr-Z80o3jTNWIzLqXgqpScPVlV8U2Wg>
    <xme:G7OnavfB6ybNUxlyZsvMk46mAY6pLCi7TG9dnjsGVHaG47BGJ9fTWSvYCPtMJwDMN
    uOG-41obacB6AlR6N_ganyhXr62JPDAOTsqHMzLjc6uHDaUwFBpNlaC>
X-ME-Received: <xmr:G7OnajcG0saXcmVyiwMyxlyQ9ibF-XkuYk37qgV_JUHXpGEWniDMgMIkdKRs_rCq_GWXkRtawXbaeZZQM6KL-9yftLKyB5NskLazUw>
X-ME-Proxy-Cause: dmFkZTGTKY//RUR5EgjNbSpcd3VVyHi7/RyZZoSH75sSjgM30+UMh0SnsYKjQljj3zB5sH
    UfXSIJXXAUSEPTXl3x5Pe7T/YIndxdissUCd+4R1d0nftRIrhDo1ZQaSJwH2QxYEcZjR6q
    e1HSRCovBuObDp7yvtbJu0MeL0TzRLJi/WjnPbfUseVNsYil7chlvegBuYUJmT7prpLoO5
    9KBYbuj3PPvZPnU/frjB0pX1g3DRpbM/YNiNklFelr4yqg27xxhYMIdtJwD7hUpgzK9cSv
    KRK6VlgNVAcaqJfEMRnUBHVIz+eN0YLgQlErlN1OImZXUK+mDrswsAndDkuJm87YyrVFtp
    Zc/noVkza4VfMBwt4kV4HCObZRHkuNIP9N3okWa6ueOQbDNWacx71FAwCXumTVseOvLYp1
    5kBxHAZimNoG9WedkGtus4Yn3z5S7d/L/y9hpuINtLbSopPBQMmGpD35rHhxEXh3WPikEX
    8aolg4wYCwPPCkzHCcKu1c1etc+fBYAKzzwPPvLhLyOo5chayRpoN5Y6oGFXID+jSxNz/K
    bHWMgoockrq4m4MT9iTGaMhA1NwIVFS0bHVOJ9wLi0gi8dTa5ZWWrktWkSLE99/ihSGlzm
    0j+116CSHnhjYJyZS0tj+eFxIhCFmuAg+thN9t6gQMENDU6gmrgwPMOzG20w
X-ME-Proxy: <xmx:G7Onah1TBL21qK54zzqIhOpohZ0fxg7KMffaKN46SC2Qa7YRuvUdiQ>
    <xmx:G7Onaj9EJBm2Ax_IeJZJ0HQT4ie40EwOvBVQoGv_iyayaeXrzYAX4A>
    <xmx:G7Onau7DoKUAbY5rWiIfDhVy4iOsuWx7gKMq3eZpx5gBl9QUx5dNwA>
    <xmx:G7OnajurFLaKeE_yZnVOF4AJTIVpWZaaGuW2zbL2bvxwWit-E36ylg>
    <xmx:G7Onapv9ReQbG-1fl8odEeVAHZNgcSWbIZcyqRwhtCfoPfUiGfgLwZsu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:59 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:42 +0200
Subject: [PATCH v2 12/13] arm64: dts: apple: t603x: Break overly long lines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-12-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=1baPjQaZ3lRGHLwVs5BL2CEaexGqyGoKEzwUUYbRUh8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm1l+v11p9P5T41/vWXGqwpmiGq4fQtXOHBc+bBV5V
 qJgmb9aRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkkr2dkeCqXylda/MT00G1H
 tvat8UVzL2TbMc7d2HXhm260SKniA0aGoz5XTv36kmZWx1N+ftvn04c0921t3GrC8thT8moC27N
 +fgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes "[line-length] line exceeds 80 columns (N)" dt-check-style issue
with N > 84.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi           |  9 ++++++---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi      | 12 ++++++++----
 arch/arm64/boot/dts/apple/t6032-j575d.dts      |  3 ++-
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |  3 ++-
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 71b75a59f695..524e532830e2 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -372,7 +372,8 @@ serial0: serial@289200000 {
 		};
 
 		pmgr_gfx: power-management@290e80000 {
-			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0x90e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -433,7 +434,8 @@ i2c8_pins: i2c8-pins {
 		};
 
 		pmgr: power-management@350700000 {
-			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x50700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -474,7 +476,8 @@ pinctrl_nub: pinctrl@3641f0000 {
 		};
 
 		pmgr_mini: power-management@364280000 {
-			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x64280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index bd73d691f0d8..1624651c1d92 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -8,14 +8,16 @@
 
 &SOC_NODE {
 	DIE_NODE(pmgr): power-management@292280000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x2 0x92280000 0 0xc000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
 
 	DIE_NODE(pmgr1): power-management@292800000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x2 0x92800000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -45,7 +47,8 @@ DIE_NODE(pinctrl_nub): pinctrl@2a01f0000 {
 	};
 
 	DIE_NODE(pmgr_mini): power-management@2a0280000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x2 0xa0280000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -99,7 +102,8 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 	};
 
 	DIE_NODE(pmgr_gfx): power-management@408e80000 {
-		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr",
+			     "syscon", "simple-mfd";
 		reg = <0x4 0x8e80000 0 0x4000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index e83fdb5d8c86..12991546d4bb 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -27,7 +27,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 			power-domains = <&ps_dispext0_cpu>;
diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
index c9af6103487a..bbee373044f9 100644
--- a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
+++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
@@ -32,7 +32,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer0: framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 			power-domains = <&ps_disp_fe>;

-- 
2.55.0

