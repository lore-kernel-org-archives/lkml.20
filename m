Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827C4EC66D;
	Wed,  9 Sep 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949640; cv=none; b=D8oVPv9uj7xojNKePUH9tB5e6q/NG0oeIEmXNlM+y+Jtm0KWn8zyNheR7gAEkZ4g5awPi+STTKRa/IZKT8X8ejJ0Ne9NYlOhF3+0K5XVwWX6fpWxsHPamdMfVQYk5d0ZQBONlVnLBv0ZzobHMw/VX4rgPe4Oue8fg+DiIAorX7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949640; c=relaxed/simple;
	bh=LyVLfrWs0Xm/qq/cJD1v6SmzVevdsuJAbErKmw6ENM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7ljB9ZeqMZSvbKcdffLETd5U9mbKLwjS2DZaZJHE1cqgEGGILOjD84m9c5m7R+cSts/yZXlUD7ULrhbZ8lpbDU2vc23CJVrKnL4fG5+R/1Cx9KDvEqejRLo4U8Sgsjfu1c5+aHRE7/lA0LZ4vTfXBCEHTtflYxT1S9t2k5WQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=sxtQH3dZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wJxUKfEk; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="sxtQH3dZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wJxUKfEk"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 4EBF11D000A6;
	Wed,  9 Sep 2026 06:27:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 06:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949638;
	 x=1789036038; bh=po2e3KDEsipz88LwEd+sIL9aNLzOy8JRusjq+8OekPk=; b=
	sxtQH3dZWxO0OFWXNQe8CnV+mnIJX4PcJohIcOoECCvo1WbuFUPWlmaNL47LUla/
	WB7Os5OwxIF4CTgGdc1KXNMNERe2ikD6yh9P/wh3tIavB9/agh1B71pdU1P0drZy
	AZnQDr12idTJct1/4tWlX5XwpOovrI3kmE+Kz/ioArN+B1F6MIiHAPypku/Yw9+X
	JvjyWHlnwtWsw85avLWjMpvPGD24PLID7ywXXrgHIw6tpiOAKtH0gcvEsyBN5i+i
	zi7Q/7w7k+/O8bPwgl3xTsyyatev+v+uCeOm5x+LFlPZT/EZIfQkXI+EXNwIwLlv
	g2SJvtTkg+GJ5jaB6in60Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949638; x=
	1789036038; bh=po2e3KDEsipz88LwEd+sIL9aNLzOy8JRusjq+8OekPk=; b=w
	JxUKfEk7ShSn7M4AFDgxU87m3mrEuDemru7QKNbc1wEHiJ0BSFcz5f4Hm1jvX/Hk
	v1glF0zmu51myH5wbKyRjbG4poWP3LzOPiVYqPqWS/I/xCKJbb78J503+u9FydZ1
	83eO4BKgKEaZ6mua91+cg3RUxWIgMpEEn2QnqK5etanXaQt0v5p5RoPmbeCkJzD8
	KlJroJ52o9G82ghVsGDaDUS1nBHtJgEaaExwlyU5zIVo4TE4xfCg+AAO7rp5gSYW
	3D/C9qcRfYx0odVyLY1UUPrgebkuWrIejbFCjdgbheFdwqYQ0nbkfG5SAlIOS3/5
	f530GH5rptT5T+9Quj8PQ==
X-ME-Sender: <xms:hjShauSlxIZn3mObSgNjW3AJjqYOVsDqY7rg6JbrfDHnCN34U4mKfQ>
    <xme:hjShajc8cD5MipyOXgmJjADYHShu6d_-ZrdAYTSuwMxRNbQCnbM1Rm6lwPE7beM75
    6RPuPT_ZRBZNTyhjhI4OPE2Dka6HP_4uiSJiH7MnqMZ04T4AzwcmyN2>
X-ME-Received: <xmr:hjShaneTDwPGnfD02i-lpf_gdjyTbcC8cu9RiXuoBGm-tx5Y97ZfZqT6JenroCrr5091lzHA3clvEP7G4Gld-qyIxWJVj-Jns4XHSw>
X-ME-Proxy-Cause: dmFkZTGOMXbzgK5txvMjH8pKfUibVc8i3pE/XnEQJYqlH+3gKudOe1y/SXxlX/ZnEXhfCE
    oFzDUWl6lza06RFl7GlhSirYdwItZEWkhfQyYw6raKRYxQzQGzqE4Ds63ecPgQgOlAIldJ
    Xu+CKf/tQDWy9y/QuKlsOFGiXxA3JxxZtW/0MbEeTIzsbzQl9pAuiItLITF5KPgHeVog4R
    Evy9tmohtCieqFchkLad9n/hNRlTvE9KWdEzv7VntuJq0Fb2XBl7ym0L/uIGETqWf5RfCP
    dZAhc/IhmaUafYYCV2/mt7tdwpZiHEkO0z7bQR3fA/EPiAewcvFUeCuWC1hByYDUYNnPBu
    yh2LNuD+dzAFB5Cqfq6AFfuvuUEEWOGRqH5AOuh8EjY7iF7YAIH9WamkdGTTG904FAnVmd
    D9vZvQDAVZ5tgDeuqWM3G9/ZLaPOBKkK97RWHZUjyAL1qWofSLf3z8YkaiuV0S1nZNOoQ8
    o6w0mHa1joXzZ95+EjFkH0DqMNJIuY+NUOFQouJNdu5Ag2AXvQ5CuTTbY+R8K0ZCav3FbG
    RJlHryxvqKvhSLR1GXzmUuxyz4I4oQ24T+KbaWcitduxjniVoyNAo9OspaOjNdHijggdK+
    tLa8RRaabzS5V/P8njxxzu5hvJDm5/6U/7azhG/9mAO0SUwi5BwvWUuYTn8A
X-ME-Proxy: <xmx:hjShal33IGfh7Kf6yMICd-_uy-K6B8fwTDYVew7GT6kCPtTDr7dwxA>
    <xmx:hjShan-z5y0_xT9vGCLR7Xge8yIBesb9yrcBEb4MbfSGqFi-iS_vAQ>
    <xmx:hjShai6iyiFSgd4mPiwfn0qxIrXxjulBuQK3hOBK5tw4sbtet4VsjA>
    <xmx:hjShanvMlZSP50oy8cTXmCX-OIlOg36Pj2tNbvDIm9h9cReuWQaeew>
    <xmx:hjShakkzIiIwWiTWPobaKqzx7fTvCl_-D7-xSq57fEPgrWMwye-fLx8h>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:17 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:00 +0200
Subject: [PATCH 04/13] arm64: dts: apple: t8122: Fix child-name-order
 dt-style-check issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-4-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=LyVLfrWs0Xm/qq/cJD1v6SmzVevdsuJAbErKmw6ENM8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpWzd/xellGwIVdu4kHL650Jx34v/LrAOGTKpLlS/
 RaaoVfMOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAFxkDsNf2WvmXpMfX3bR8NIq
 2rIh81zlIkeVlHRTObZZUoknG/dfZfinV37PfuKao87ut1n1GOt2XuC5pCvMWtasx6R2iq+B1Yk
 RAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Reorder child nodes by name to fix dt-style-check warnings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index de09989c5663..481f68a570ec 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -20,6 +20,13 @@ / {
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
@@ -165,23 +172,6 @@ l2_cache_1: l2-cache-1 {
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
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -451,6 +441,16 @@ pinctrl_aop: pinctrl@2f4824000 {
 				     <AIC_IRQ 352 IRQ_TYPE_LEVEL_HIGH>;
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
 
 #include "t8122-pmgr.dtsi"

-- 
2.55.0

