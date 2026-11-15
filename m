Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774013;
	b=RGLXxdGTgPtvUTHxw4HHW9O2Q+iZrqqMFU94HNKkHLzNLjXlLEbdZNyHYHSLnASN1XFq
	 NkyVg9p7ePqYL/tidk4nLhRI43PIl+Y66ehoTfg/9X0OFwhCuSPIRffxrfWsz8U4tNIA9
	 QTHNowfbv8XLfslU6dcP1Se3pIEByDTTTCLN6QUJoTyc7+8Cd7fDYcUuFaKnbsywZuJLv
	 vjepYMRGy+TSaTi+HPREr1ii7/FBS5vWfjBuSHlvJLegcBbS0ehBL1Q4J04VEIBF2Xtaw
	 wN7USGhClPwuBrto6AE4nt5/Prtv0qIfL6LeHp7SjLERXDRN8zeZaAdhRcszWcbJVVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774013;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6Paw/b+RIc+aKTS7OUv3PBvek0+fzrgyRmq3Dz6yZ1c=;
	b=LruIPRrZp1QSgsc0wezf5D9Vy7n9aP+BSnPT5+mDXQF4wJUdm/Pjwte5OnIPDRLMcrU5
	 THq4HcXXSyOZPgHJyw1JDQkccYuJpJ9i25DxTdrYWwWSZekpMf6oTOJuA3+pFjWjx+ttB
	 RbkzLSS8e0MjS7/YSRVg0qtJwtSMhjv0l/rmhui0MsTCvEPNG+CyTtMVgJJdbNjibFdAt
	 V3tfLMCE6TMJhVKm2D9XdJICdLGHeL9KWc0F0sG5qa5Tgz0zUt5tTO4sxMNKbomHzrAXB
	 wEm1UDSfw0i3rX+o1+iXldkt8in8sJ9B0SxULn/62V3TkmQN44w4UNV/1Cq0mZti8HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Evkl4KDr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA260A2614;
	Sun, 15 Nov 2026 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Evkl4KDr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774013;
	b=ibtqU7IvfTCrnE8ti3MXnH0YSqCTeXtmCbE9FhCw+XDcTPAKzaKD5bLuNnZ4jUaga/ZY
	 98TUPWv6B6VriMQjT3BlqNQlZN1aCol8jEvsXdVoW6GoJSbC2NcMOkiC7UWzPgLPVT5ZU
	 nemoBs4jSrlX8BURym81GBQZ5jB+FAeJxKlgpHjD6CaU+EZmdqARfMPzzMA+goY2N4kib
	 pdvtcfQ3NS5fa4W9YIvN5Uyc/3xtMo1HdofoebO0btiUeg223W3YXqlZJl8xBwEnEYKS4
	 +J0rcwPaC3oFeKf4Q5lk17mViR0h/40LY+sya9MYEJLztVNyWTOVYZnHSZKSzuZcuMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774013;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6Paw/b+RIc+aKTS7OUv3PBvek0+fzrgyRmq3Dz6yZ1c=;
	b=b9E88iKeQh1vi6rQcK4UfAfVUOBY7FjId5Dy4HXTotp5uunz5XJkCpgWEA2TfC3brA7E
	 48s+6rrvNNet9y8ok/RTrbUb+rQrM/SfHXaNm6eBJ3kyRBhlIO4YtM7L4e2h+mDxGJuu6
	 EL27NCYcdFu9l/jKZ+6G2KcJC9WDRpbqPSNCTIGRGxg9UXbShLZLQrTIJ0bI2Y8P1EG+H
	 s7mU2Y06HzOqv55/w7pQR4lauAzJGe8Y3Qiv0O4gr9vuP3H94caiXiA0SE2DqpP6rSEUr
	 wkI0ujaM7ccsVp2mxB2TKXjeijbTV7ItcacRhUsHg3chQp5Q8Xa4/1FWP6cxCoIfYgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 885B31F000C8;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774013;
	bh=6Paw/b+RIc+aKTS7OUv3PBvek0+fzrgyRmq3Dz6yZ1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Evkl4KDr502uxke1EVDeV12/dz4Ek19c89wRfwJad2YfrHGu0dW5rFNoL5BdNBKiR
	 W3dhM0nkDLihhb9XNxqcGI49Xhsn20YNg4c3QamuYlnhnSeduiq2DIjSQ66kWdhxkI
	 NChU8h/F4Osqm2iGrYH+Tlz0kc2ICgyCljDiSZk79wSaYquqQjTE+xBRqH+otaO4tn
	 5zTQC+xEIgGs1jMiNfMTnexwhBm0M7r5N4zWnCEHUJaSjutnX+Vh5Vl/gGQrx9B6rF
	 Z/ibQty9xbhQUh9Nq0Gfy49Ec8SL6ctGJry70zgekggAfAkaVb4fBf7offOyMJvPSH
	 rCXTleObJoLnQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 095E54A1CB;
	Sun, 15 Nov 2026 20:20:11 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:18 +0530
Subject: [PATCH 10/11] arm64: dts: qcom: molokai: Describe the Adreno 829
 GPU
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-molokai-soc-v1-10-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=4118;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=KV10ej5y8FLKIBJyutRokQTWdFziMzi+9h+0oYQJfbE=;
 b=RmYt54SKvuY4Vl5r+LDManwJ6/CCHWu6VZ18TN5sBbrBnUnoGnMGiu2KaTkplWRTzPOVfq6BA
 HCE/dzGfDZhA4tbUEso0knXYHwWfViSDQDITwKlNqe76D4i50VkCYwF
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The Molokai GPU is an Adreno 829 instead of the Kaanapali Adreno 840. It
has no speed bin fuse and its own set of operating points.

Assisted-by: LLM
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/molokai.dtsi | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/molokai.dtsi b/arch/arm64/boot/dts/qcom/molokai.dtsi
index 82fd31bda1d9..3b9772edd68f 100644
--- a/arch/arm64/boot/dts/qcom/molokai.dtsi
+++ b/arch/arm64/boot/dts/qcom/molokai.dtsi
@@ -12,6 +12,7 @@
 #include "kaanapali.dtsi"
 
 /delete-node/ &gpi_dma4;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &i2c_master_hub;
 /delete-node/ &qupv3_4;
 /delete-node/ &uart18;
@@ -37,6 +38,128 @@
 /delete-node/ &sdc2_default;
 /delete-node/ &sdc2_sleep;
 
+&gmu {
+	compatible = "qcom,adreno-gmu-829.0", "qcom,adreno-gmu";
+};
+
+&gpu {
+	compatible = "qcom,adreno-44030a00", "qcom,adreno";
+
+	/* No GPU speed bin fuse */
+	/delete-property/ nvmem-cells;
+	/delete-property/ nvmem-cell-names;
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2-adreno",
+			     "operating-points-v2";
+
+		opp-195000000 {
+			opp-hz = /bits/ 64 <195000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+			opp-peak-kBps = <2136718>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+		};
+
+		opp-301000000 {
+			opp-hz = /bits/ 64 <301000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+		};
+
+		opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc8295ffd>;
+		};
+
+		opp-496000000 {
+			opp-hz = /bits/ 64 <496000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+			opp-peak-kBps = <5285156>;
+			qcom,opp-acd-level = <0xc8295ffd>;
+		};
+
+		opp-589000000 {
+			opp-hz = /bits/ 64 <589000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0xc02b5ffd>;
+		};
+
+		opp-660000000 {
+			opp-hz = /bits/ 64 <660000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0x882f5ffd>;
+		};
+
+		opp-714000000 {
+			opp-hz = /bits/ 64 <714000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <6074218>;
+			qcom,opp-acd-level = <0x882f5ffd>;
+		};
+
+		opp-732000000 {
+			opp-hz = /bits/ 64 <732000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+			opp-peak-kBps = <8171875>;
+			qcom,opp-acd-level = <0x882e5ffd>;
+		};
+
+		opp-795000000 {
+			opp-hz = /bits/ 64 <795000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <12449218>;
+			qcom,opp-acd-level = <0x882d5ffd>;
+		};
+
+		opp-891000000 {
+			opp-hz = /bits/ 64 <891000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			opp-peak-kBps = <12449218>;
+			qcom,opp-acd-level = <0xa82b5ffd>;
+		};
+
+		opp-975000000 {
+			opp-hz = /bits/ 64 <975000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0x882b5ffd>;
+		};
+
+		opp-1025000000 {
+			opp-hz = /bits/ 64 <1025000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L0>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+		};
+
+		opp-1075000000 {
+			opp-hz = /bits/ 64 <1075000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <14398437>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+		};
+
+		opp-1150000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+			opp-peak-kBps = <18671875>;
+			qcom,opp-acd-level = <0xa8295ffd>;
+		};
+
+		opp-1225000000 {
+			opp-hz = /bits/ 64 <1225000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+			opp-peak-kBps = <18671875>;
+			qcom,opp-acd-level = <0x88295ffd>;
+		};
+	};
+};
+
 &gpucc {
 	compatible = "qcom,molokai-gpucc";
 };

-- 
2.56.0


