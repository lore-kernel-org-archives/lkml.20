Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746744;
	b=kUVkFHIBxxsAtio9zXqp8tqiJckzWZWOT7pyck/m2a5So84Uo6xMSaSfu03Qfygj0Vyf
	 uyGFKG1Ja7vbVXNf0TDcAixRPaXnd+dxDjQ9zZlGDUFPogRFc6XbfTDR77FjCSqJWiGD3
	 0WPlKoFkjLVV/JSMEuFiMDXo3fptBOKe+A+AnAkloqHQjL4qTtVy52vyPnTjOCSRuN761
	 Pip5i71J5BDjeu6RVjJF7HMzXRQnkCMdwFJtQipVPQEvSRnwoDg8h1YvEws2ZbTyTDYHc
	 a1kXg2L/hN3r/G59PJqcHALNuCFJYbjlMuyUvZAPGr7NfEKfTwJ+Tf7WIFoF3NMbJww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746744;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rXNf2nVXLw07Z+Tq54WzTWnqfB5q9taavfBVWJs1XKk=;
	b=uz/8+U3zGQ1Zbl2qe04tOIn4qxWdFOyjEuLBrWo1G+iNUoJztuhegyjbXYt2EQCovS8z
	 7Rcf+9FtN+L+OiII9TeoUfigD7jFBLPbzkRBkAlBrEsHkl04A5CpiEm96SnMc7utHTALv
	 Uw3ZNjoyFJkA5Gc7+PevUpaWSUOXKHMXcmDGqWS8z3y67M3m+sE0Uy+xNqSNc6zNyxiRV
	 S5gW6fkaeE0qCSR0IYIs+sajFgzCQua5gDiHN2IB+DeUPYXsbFzZS+no3n3tjLMuVJpgx
	 tgMSg4z2wcdtC8g+dfwmIbEl4ACDWEaRCdeFHfLBvr4FJUZYs40hGIR6IE1EM1/qKGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+SHuIQ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED15606A329;
	Tue,  3 Nov 2026 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+SHuIQ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50331F000C1;
	Tue,  3 Nov 2026 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793746743;
	bh=rXNf2nVXLw07Z+Tq54WzTWnqfB5q9taavfBVWJs1XKk=;
	h=From:To:Cc:Subject:Date;
	b=H+SHuIQ2156qhK6EBYbAEAvNkyCcQtCMop52HmwZVEUOzGSYjmp1sBif1oaBx29+S
	 SKct/E4j1dreEv16S/LVblWL2gcCBSOZhYLyMNDkzOSP1LoUteOwy5qSpDhQYDYnAD
	 /xNAjcwCX0nkAceiwUi/7R6OdH1v0eQ4HSeO1RRwZkRD6moS3wqqiApJviFoPw60sS
	 xOWektrpfMyjEhw5WBDCwy52zN0LGMRbmbCnMAhwImPccGGZXPE7ZaA8fBo42+aQA/
	 lryTyeNJ6ic4LGqH11KfYiDhMDroXYFD1msn8b8zKjg+gTZR+rVVxPKA8pookOvaj0
	 wCddDWFvNz/kg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil'
Date: Tue,  3 Nov 2026 16:58:44 -0600
Message-ID: <20261103225845.984564-1-robh@kernel.org>
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

The 'qcom,ipq6018-wcss-pil' is not documented nor used by any driver in
the kernel, so remove it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Alternatively, remoteproc/qcom,q6v5.txt can be converted and this
compatible added. I have a WIP patch if someone wants to pick that up.
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 49 ---------------------------
 1 file changed, 49 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 0701517275d4..e8870351c34a 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -823,55 +823,6 @@ frame@b128000 {
 			};
 		};
 
-		q6v5_wcss: remoteproc@cd00000 {
-			compatible = "qcom,ipq6018-wcss-pil";
-			reg = <0x0 0x0cd00000 0x0 0x4040>,
-			      <0x0 0x004ab000 0x0 0x20>;
-			reg-names = "qdsp6",
-				    "rmb";
-			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
-					      <&wcss_smp2p_in 0 0>,
-					      <&wcss_smp2p_in 1 0>,
-					      <&wcss_smp2p_in 2 0>,
-					      <&wcss_smp2p_in 3 0>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
-
-			resets = <&gcc GCC_WCSSAON_RESET>,
-				 <&gcc GCC_WCSS_BCR>,
-				 <&gcc GCC_WCSS_Q6_BCR>;
-
-			reset-names = "wcss_aon_reset",
-				      "wcss_reset",
-				      "wcss_q6_reset";
-
-			clocks = <&gcc GCC_PRNG_AHB_CLK>;
-			clock-names = "prng";
-
-			qcom,halt-regs = <&tcsr 0x18000 0x1b000 0xe000>;
-
-			qcom,smem-states = <&wcss_smp2p_out 0>,
-					   <&wcss_smp2p_out 1>;
-			qcom,smem-state-names = "shutdown",
-						"stop";
-
-			memory-region = <&q6_region>;
-
-			glink-edge {
-				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
-				label = "rtr";
-				qcom,remote-pid = <1>;
-				mboxes = <&apcs_glb 8>;
-
-				qrtr_requests {
-					qcom,glink-channels = "IPCRTR";
-				};
-			};
-		};
-
 		pcie0: pcie@20000000 {
 			compatible = "qcom,pcie-ipq6018";
 			reg = <0x0 0x20000000 0x0 0xf1d>,
-- 
2.53.0

