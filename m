Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD0485CEE;
	Thu, 24 Sep 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256170; cv=none; b=gXhkb7JVR3JFJedenSUg64NgjyQZcLJKS+s6rz2LuCYVDx2hfzFIpWsFWt5qiPDrqnHEtyu3rpFIYKroON3ZC6FKLL+8noBXnRR7Xz4GdBjG58G+CGSxtzL4jtcr2sYrUZXHdTDQzqgctGCtSujhEDCl+p09zCf37lfMvILHUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256170; c=relaxed/simple;
	bh=PwqeSbe2g21wY95vHrL5TImbAzcSEHkRY9hGmoF6mB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MR664bRXlbU9jGbtsR63artMbNqRBpyMow9coj4tZLaBuFXEPDb1pKNzinCJoll2kkjWt4p7QZTfARXqvmvw8ZZFRmX3nNsPmn/k87WV24MEi6fCQeE/4Sr7Ev5z9QJTVg9mnVi4IDBBuCw0/ub7O+89yE5Cf6k8m1S8IziI3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=g456k/Hp; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="g456k/Hp"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asFSRPzAeSqh5Upg0pBvvouJIpJ240yq43ylJBSx25Y=;
	b=g456k/HpL8JbzCiYLSwKSwARfDAjU/ie0GWp5WS07QQFjmWdSyTe8F5lX58GZllZDnNkeF
	5LLmzVS9dKmYEaLQ0IwG1Habrpm6iRVcEioKALKaMctDSxLSvTNtGKarDMx0VL4c6p/EzQ
	1arMu6mKIDajOYfHoSbmg3SW5wO3abk=
Date: Thu, 24 Sep 2026 15:22:25 +0200
Subject: [PATCH 3/3] dts: apple: t8132: Fix some line-length-related
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-3-3ec651d75baf@cyberchaos.dev>
References: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
In-Reply-To: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

This fixes most `dt-check-style --mode=strict` issues related to line
length. Lines up to 82 columns are left as-is.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi | 3 ++-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index 09ab380a00e9..108c546545d5 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -22,7 +22,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer0: framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+			             "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index 350ad7b3772b..76e96846c695 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -216,7 +216,8 @@ soc: soc {
 		#size-cells = <2>;
 
 		pmgr: power-management@380700000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+			             "syscon", "simple-mfd";
 			reg = <0x3 0x80700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -234,7 +235,8 @@ aic: interrupt-controller@381000000 {
 
 			affinities {
 				e-core-pmu-affinity {
-					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3 &cpu_e4 &cpu_e5>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2
+					       &cpu_e3 &cpu_e4 &cpu_e5>;
 					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
@@ -269,7 +271,8 @@ pinctrl_nub: pinctrl@3881f0000 {
 		};
 
 		pmgr_mini: power-management@388280000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+			             "syscon", "simple-mfd";
 			reg = <0x3 0x88280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.55.0

