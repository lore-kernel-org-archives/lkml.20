Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94429513559;
	Wed,  9 Sep 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949658; cv=none; b=GOTQ84/1WUiFTlDn+p780rZm7ZPkanqxEiUjEsv1DEyUI9CxKNatpoxrdFX6+NGe8WGp23uKOc8Eq40NxsGqtbw5b0OUGjYpQseZBjzD55/CDJiJNO0QKLkc07bspBlUn7bFN+rToAenNO8RYJ13QnsJpxmOfYd81IHvHn9ptoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949658; c=relaxed/simple;
	bh=yjn/G3wEA0fw6JqZtQhagPJ8LmTFCDm+FwVnt48kvyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcRs1j9qZuNBlx+46gwz6m6qGPQAvTVlWEv/uzLPX6xxT1fV87fSjjCWh/ODIeywgK5IMk9Bq0Nyz5Of9lk3Kj05FxM1iT2y78EEw8KZ0+eQegLQTo78cRfa4lOfZ0RDTdh3CnbWccTOdnQkv42O/2oznHra9Cajpk+SVngbqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=JfF1aVzS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lKhQagW1; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="JfF1aVzS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lKhQagW1"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B192A1D00064;
	Wed,  9 Sep 2026 06:27:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 09 Sep 2026 06:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949655;
	 x=1789036055; bh=/w1oCkQcRWXMi2CYKucfh4TOLTgbMkWF0DDIoShrD2s=; b=
	JfF1aVzSFRUyfkEdcLcmBdQcU4sKh2zDOxU5zHJa91i9en4ciRAv3lS8dAfMPGe+
	dBK2IDWUkF+tvXSl3BlW8/oZ8pcaHE2VQT84DHYSXm0aJ6Yrih11GstcSjaj75Cf
	BGUtRl6Db8Ni+bhUtF6mwDwNR7W+dEHLcQnU0NYeiQgxkKX0NIyssp9LkOGDP214
	ZDAIavqAIGdaYPZhuGWB2Ybph5lxtyf3CFReYTNzpjCohTkEyh5Vjfw8OOwErZQ3
	5/gBF6KcQoogtjg0YyYlzlA3xE2lQ69z9urcIbss1DctlOP/h36suSKIxwpVImmF
	F3Ne2rgJ87QedFT+NVnQyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949655; x=
	1789036055; bh=/w1oCkQcRWXMi2CYKucfh4TOLTgbMkWF0DDIoShrD2s=; b=l
	KhQagW1+EbNzZ6ow8n7y1/N+Y2SqcR6RXE9UVV0Q0J3rn1nys1gnzWZ01RdB39K3
	Z/oIKCiVn3/R5qwaJZIk0Sa2Z+Qy/NGb7eTdeAYZlXNwTop5K2F2zFSjtRNSLJOx
	t9ldvvc73HY3DTF/Hw7xLvExyNLnQeCroFGYC6uFl6np2ow7xbDQ+2L0w+3du90L
	kZ3q66YAamU0UGNWpXiI29xqAHp6VetLRXxTi9Zi82xocLndW/o97fB2h1jcUS45
	pWs0KXMeUZCNqmllyFf6k2k18Uo3zL40eAgTn1lS1RDVknBzQZtC+0Gj3N2tT+aL
	bESADn2sTSj0eNFmFmWMg==
X-ME-Sender: <xms:lzShajRGYPoBXka9eivXSBOWd2CBCDZfckc-L7GFDiyrue1rpmG_qg>
    <xme:lzShas-scqz0m-t61lnQDnqCR1mWQC0fsbsFN5p5fOmUEd-5ZqOTBsLJMzzGOoXXh
    eF-1HZ3d2zJt2qXBXWb-ecl4b1xCNB2KYK_L66lNNU8G3jj0TCB9Eac>
X-ME-Received: <xmr:lzShakZQZM7Q8smd25oh_1CFMEs4W5CoucUmCEDPUB3_2Ene-p1DtRqY4DaZpoxXeMsdSMILrCKel6ixnZYm7VBya8l-Q6VbybOG2Q>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjWP
    CUXgzgCWpnd3GsRBvlB2wgj7rM6BftCQE/RG6+x8qPtfcbh5j+zbu5djPaHSITtzYhWs44
    StzdXpjxTWhkcC9wbWGkwgcLXEt/gbH3JfAJj100bsqaA1WGMzpwB4W58Z7IfwpfIDjTUO
    ebLwkbwjZWOmAapcAChAgWkfCoCnzQlm9RWcB9yfudM6jSpPiqqdfbujD/I3UKAq9rBydD
    xZhJ83xRqSsKXEvTlqCNK3HekFuZECaHbBDz+r2pxSXJDXsd/fX0xRw5JVLGBWs5VxQ5mc
    qOeIPLfaQeeO1QWgXuIwJvqI01ibpwlVJRWQXWN77d5hZ2ka/WqR91tntTiw
X-ME-Proxy: <xmx:lzShatqX1RdE6ERn9zpwSRuYPKZdN_jE-uqFklZqmq3kkZ7VpSPLNg>
    <xmx:lzShaoTHpQzAJc9Ji74d6ofWDra7VulZoPim5fOQd8UNDLP_7m7F8A>
    <xmx:lzShahpea7DmyWcqJZxCLATjdHPsIkvYF8V2C7OPG1Y-1k66RFc6XQ>
    <xmx:lzShai2IBbADXV2Of1ZX3gq6tmZSwP8KI58vm-9CMcyDkg64tuKf4Q>
    <xmx:lzShasyHHbN-c2JD30ZvWfkvgu7LNJsDT0iApdWKVetHux6IsyAYZY9z>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:35 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:08 +0200
Subject: [PATCH 12/13] arm64: dts: apple: t603x: Break overly long lines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-12-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4678; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=yjn/G3wEA0fw6JqZtQhagPJ8LmTFCDm+FwVnt48kvyY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJlXLVX049xWaSb6Uz7IR5vVuSzC2kfWfJvnj4X6ld
 U1aH9w6SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cAXOQpI8Od/F075yY/qr31Ycab
 Ot3KV7+vmdR/qd9751KQkdOTGzJCDP/0U0siA/yW6B+4efb2o23RM4MPb60zn3OoJfvbNM/GMkM
 2AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes "[line-length] line exceeds 80 columns (N)" dt-style-check issue
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

