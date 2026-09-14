Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A8411FA1;
	Mon, 14 Sep 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375262; cv=none; b=gGbHVvPjzhDbAi6+T/kDt+Yxw7TS1804PuZvFAI9DGDUEeHL34uNozhUiNo1YE9LSkh8iFBbTfoHx0aTQ41Ua8MeALPG6R9wM0hj0y4gvO32Yn5swY1kvKAsdBaMNyXgxlN1yo3xzDYwOTakPw5SDpTPTzszoJVtvj5BAHW8pJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375262; c=relaxed/simple;
	bh=KQEtZ8nZptaMvldtSk9ZHKjNUaBiwDDrzs1q02ay9Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUouqCVhZX+bvul/byVUUviRd8h86TrutDBfhMhe/DwfOmgC8HZZOVpH8L9CFtp2GKXNby/SsPyVbAk9hkaj5Uh5Z/ZzmpwFHGojus300Xefo8RJu/oRk+HFqtPNa0KN+ZDb5QAiWkn0mLlHnzVYYpQA0nGLQx9gbKO1evyuKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=UCOMoXcj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bx3qDIag; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="UCOMoXcj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bx3qDIag"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 66798EC05DD;
	Mon, 14 Sep 2026 04:40:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 14 Sep 2026 04:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375244;
	 x=1789461644; bh=gGNuYks9l8k6RKHlJoOk84pwpKQUzci+L+rdDp6XAgo=; b=
	UCOMoXcjKmYD2m94fFit3OJazyOvGTIhgBBiRAr9ABckNObQyUcBLSS1iDGo8CEB
	AfMsKKGRlfQezciTFiwWO1AdlO8aM16bdUU5LtGXeSDX/TYRl5a2OeyIT9hovKEF
	wIabNn2UsRnn/vTUX6erhUHzM5mS4XK1JNkePi0fhzRY1fTWhPd2r4UgKruoR/HA
	x5j+AklXz2LILMX+DSXW5e2uu6POgbWRtD1keP0uQLJtBIW5T+1K/B49LXU1Vr1a
	54VK0QT53SNnWgdBUFOPdE+FU0fqerBQ3hrzcXJI2eHITF4w4rJNZuPYWcSSZiRc
	mt41tzc8DxYjV/7rUQe80w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375244; x=
	1789461644; bh=gGNuYks9l8k6RKHlJoOk84pwpKQUzci+L+rdDp6XAgo=; b=B
	x3qDIag+XGhm6Xen0m9AznhH6a3oeFXjnQwMIlheBEsPUlk4954qyMBgR1lOQGP8
	8q1Eg03nHO0GFJk1TEtVI5GjF9RiT6i+i7D9JlDWS3NobKReN/m6axW4cAXFGNgs
	eds3NYI9h2WAccSH3IzZBgWQa9ru2XA7hGByY7jEomLotOVEFDSVABfUyIjztVWT
	ifLerZNJZGx8qp6mBZL6iKpezvcI4O9IzPI1VwZuyc3eVsjx2t5E177XrU8WskZ2
	gNMXx1+OjJaBNDNm428vZwN7tbWi4JOBQMQQ8XurOzqZJIkjasFNiQ/qz67Gyn2K
	NwWhDLtNY4aVORAq5Y38Q==
X-ME-Sender: <xms:DLOnakVr8qWFLm64imxNBETjc2KDJJ5idq4RO54A8RGfnouGrl3eeg>
    <xme:DLOnagy7pfApijhgZN7n7iHb9aaWohhKU4m7Mab94BuFtquXlik7zMZRP1HzNTbFO
    YO4ng9ouDp_S3qx02eDROB4Z8hO3aYJ5m01gkwPV-mWdGMTBAZzk_IN>
X-ME-Received: <xmr:DLOnaj8uKL21JlSvBox6DGzgMSg7Z-WROzBRu8OtzOUa6CCRuwJtJF6Hjpe6jQaSiPaHzoJnyuAeU5iJKyW19EIg5sjPHaqlnYT-wg>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUDO
    mZSf5ieyc384TBYHAJiC0+L2HDaefkeOewdUYU5+K2fiLw9NovyDRVICv1RagdOjI0mqed
    xMoAPqzO7I5QedrLLyT6+10qQPfpO2pUCunDkH5nBsAFlG2piSNk/N9bpYlbmj5IMVv4jN
    eWKEW+yyvtLuYbUKjYWbcHX0Zhgi7TUAQ0/0yWJhfV/pmtQc2RSqqNU+UlUHznWH2iJflV
    jMbR/p3G7MH0fLs4NzlUHlxWayXo8yL8HSkcyUqqsP3zDXdtoCEc26dUxnMu+aIfsEZZ/v
    lfLnoUBHeRDBdtdYOtGBCdmAJjqRP2iU65LsiwA71EejVjJHsW2xNxDec0Yg
X-ME-Proxy: <xmx:DLOnat_QNEoGlw6BRzNUtT4gCTbG2G9no4ppp-csGL2zU-knIu7FJQ>
    <xmx:DLOnaqWMB_PoxPVEdA8dH-Hg2AzYUJUIhHCpjSfgSf_Cr5hnFynS0g>
    <xmx:DLOnaifzk_czq7ab23MOEb5pJ21TCXf8653cKzVg_MM8TK7eXb7pFg>
    <xmx:DLOnarasMiB_iDPLe7WbunBM8vqrhRAHRjFZ79E6rGDh93sSQEcOfA>
    <xmx:DLOnamWNQbNuoIKk9FecEtoOWpLrdEELADGKX6jzho7I3VsIqC_BKJpU>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:43 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:33 +0200
Subject: [PATCH v2 03/13] arm64: dts: apple: t603x: Fix child-name-order
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-3-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=KQEtZ8nZptaMvldtSk9ZHKjNUaBiwDDrzs1q02ay9Lo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5klT7WLpe43mZ2q/OSky6yPyb0WRg7xapEGSk3JM
 cfduj06SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATCQih+F/VsA9NUWdRc45W+wW
 Rn1TDqm8LMW2bRIfP59x7OuS3oo8RoYNnOu7Otd9DbwiOu3o8rynsv/33dYpi5lgMPN1S90mhsv
 sAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Reorder child nodes by name to fix dt-check-style warnings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi      | 34 +++++++++++++++----------------
 arch/arm64/boot/dts/apple/t6031-base.dtsi | 26 +++++++++++------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 0bfa8db59db4..0b5824c9f1bf 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -15,6 +15,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -220,23 +227,6 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -537,6 +527,16 @@ pinctrl_aop: pinctrl@374824000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t6030-pmgr.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index 6df3be68d740..667f32e9e606 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -11,6 +11,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -285,6 +292,12 @@ l2_cache_2: l2-cache-2 {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
@@ -294,17 +307,4 @@ timer {
 			     <AIC_FIQ 0 AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ 0 AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-	};
 };

-- 
2.55.0

