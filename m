Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962040;
	b=Jq4PKhmh44iuEK+djKfqSCqtLkJ8U4O5GqYjiUGZwP+8ucukstbX3307xpbpn1GjLKR0
	 J+wFYJal8a+NIP9Qfp+S0gTMV7HRVrAcgIbtLdhlMj6pdxWATOsAVai1mFzwvIlWKY8SE
	 YXo9D0e2WSAu/Ow8A1VkZMREctX4DKMMPg3PLbelLGukMGNz8BkXVEPLiSb6JCJU+bnsx
	 0jkVPEYqS0uI3MtP0w2wCkCLkvF5wGZOKWqOPi3spI5iDXFKeKlmyC7O0X/KkomDpl7Q4
	 18QdbJ9NsWMi/396XQxz+bbaKmM/HxNo3RkSlwSATn8OZRN4MTKxO64Ra6WEeqC/Pyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962040;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=TlLop1f5KLIoXxFGbo5pP4WCmCI9XMrzolGtBjxYqxo=;
	b=Ea72+9wi4iT5CLivrNlbrpUaFvK9iierNtHucTKwP82KEMCKOKfm0MCxpilIZHX8toKu
	 99XqSSy42+j+kY5b/IzfEpK7Wc0IIKjQOrk99psE30qtcsc0XakXf6NqnsyU4pvm72PIN
	 rI1Jy9wDG5PX66k5Vywp+5mz8Nodo3bl2CnI7+1zPH6YBz6elH5aSf+iej7cj4a0MDU2s
	 9cKmFX4kUIuOx30ZYRyM6PXcXSYySOnaXbIlegUcAM9LRHjFY1nnl0ctPNQZzMSAH6KJe
	 PnFwagBkoEyr3hVZUCwJ1bHIu7bUCmqFiIt7NDgT2qDl8FP7jUQPWVKcz2+ol7MR9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=dCSUZjxD;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C119606A33F;
	Fri,  6 Nov 2026 10:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C119606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=dCSUZjxD
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07K1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07K1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962029;
	bh=TlLop1f5KLIoXxFGbo5pP4WCmCI9XMrzolGtBjxYqxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dCSUZjxD1QrtEmx1pU2Gc2RTo4R42OPJhTa97VP7hTZnmS6Swf7aBXFQJu8qPa70B
	 dwatHvO2BfEleR7En2RKeVPqmvqxxKUujbeaHWaorhx2y2VrEnGMyOQeV1oYMZxSG5
	 mxNBPws9phn6tbSsb3QXYhZpBF19L+RKVH3LOV0w=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 05/10] arm64: dts: amlogic: meson-s4: add the Mali GPU
Date: Fri,  6 Nov 2026 11:46:54 +0100
Message-ID: <20261106104659.54656-6-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the Mali-G31 GPU with its operating points. The GPU rail is not
switchable, so it scales by frequency only, over the fixed fclk derived
rates the vendor DVFS table uses as well.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 793c7bb9512e..69105c8abf12 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -126,6 +126,40 @@ vrtc: rtc@fe010288 {
 		reg = <0x0 0xfe010288 0x0 0x4>;
 	};
 
+	/*
+	 * The Mali rail is not switchable on this SoC, so the GPU scales by
+	 * frequency alone. Every rate here is one of the fixed fclk dividers,
+	 * optionally halved or quartered by the mali divider, which is what
+	 * the vendor DVFS table uses as well. Its 850 MHz point is left out
+	 * because it needs GP0 PLL, and the mali mux is not allowed to
+	 * reprogram its parents.
+	 */
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-124999998 {
+			opp-hz = /bits/ 64 <124999998>;
+		};
+		opp-249999996 {
+			opp-hz = /bits/ 64 <249999996>;
+		};
+		opp-285714281 {
+			opp-hz = /bits/ 64 <285714281>;
+		};
+		opp-399999994 {
+			opp-hz = /bits/ 64 <399999994>;
+		};
+		opp-499999992 {
+			opp-hz = /bits/ 64 <499999992>;
+		};
+		opp-666666656 {
+			opp-hz = /bits/ 64 <666666656>;
+		};
+		opp-799999988 {
+			opp-hz = /bits/ 64 <799999988>;
+		};
+	};
+
 	xtal: xtal-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -164,6 +198,27 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		gpu: gpu@fe400000 {
+			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+			reg = <0x0 0xfe400000 0x0 0x40000>;
+			interrupt-names = "job", "mmu", "gpu";
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * CLKID_MALI is only the system bus gate. The core is
+			 * fed by the glitch-free mali mux, which is the clock
+			 * the OPP table scales.
+			 */
+			clocks = <&clkc_periphs CLKID_MALI_SEL>,
+				 <&clkc_periphs CLKID_MALI>;
+			clock-names = "core", "bus";
+			resets = <&reset RESET_MALI_APB>, <&reset RESET_MALI>;
+			operating-points-v2 = <&gpu_opp_table>;
+			#cooling-cells = <2>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@fff01000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.56.0

