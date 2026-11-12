Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479432;
	b=yznv1jeWkw68hlJcB3zlCN2Zyuq5DPO0b48Hh1y1Dmja1DesVuN2D7MqonzVPDdF5wNk
	 LcBQTSuAQPeZoO1K1+gU6zggEwhrsvHpzWf3Ib7j6ltu1YqC4IK1gaBg2IB6i1O4IMEJy
	 HjXDX34qEkP+84J+j/3DjjcTaH9deMV/FUIkBWaQSQwtNHkh7tcaPoTMRiTDqD/2c/wVa
	 Ww2tKpjfOmXCsoVj8J17FEZ6QT6sZD/fmUtlKDUoJ/oPcPLczIDNa0L4k2wH+K962VvvT
	 X2xpVAflvKw46GD+QXYpRTtNx5A95LnCdyP+pIRDTCA4dMXj5TXWahZL0kuXJG9dLIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479432;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WFX6bgBRRPyJHfxGkgp6XiWBhWSgx47ulNmmY353EFM=;
	b=wuSp8Jyj9WtRQyh3G4Ak4OO8eBagiUROV35Tmlxt32uRxY+NUvuhb/kCG8m1P3O67EzJ
	 5EySq3yuVPRUuGPX/FEK5RjbpNRuGHMADOgZ3c1xLiPv/zxFXx1cpCSiCmbvPQ2iLZgxZ
	 c/IF+oqs+y5a+KJHcNnVrDKGFASsq8kvaV1eVtXWDUIHyAWUyyHZFrjqyFrgVx+rX1IF/
	 eZ2asDqkuOio/CDoBb/Xk33Ghq+spAMIJC9seiTiIaMFcfiX5pWPSADHRD7aJSlZ7eVnW
	 4uO5PINghcgPU1e+SLD0JpFv+JhAqQu8Qn1dh23nS26qFpUjbcAhthzekSZeR2qSNvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qn0bBsHX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C63606A321;
	Thu, 12 Nov 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qn0bBsHX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794479431;
	b=Nje40GYF/QIaB/JIfcCZ/hLAKWrz76MdaXK9izWNWaHYMoonfuvP8S6RdzjN0KLLkvRx
	 mXPS6U84MaB3aAnjwwyGe9GJSQ3A5dPVEfYNIGHxCAagaurrj2malLn6GLdVLDZFPiUyo
	 d0tAV/PSSUNamwfs0iAl/ODYMfYbbNEI4eBiSfbIcI9m3KB4r6zrnRZRKWPAWKsP/Oswv
	 lf1CWaMDzXOH02NgA7LGhqz78A0bhhnA4L9g86qS7IoDkIWZp2unfNE/7AaQKasMdz0jF
	 5vMjpWe9n9lOHb5qUV5njeJplcr7sfc0ofsckTpqasuHgq+jSv8AK/7F9hIEQKzw46g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794479431;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WFX6bgBRRPyJHfxGkgp6XiWBhWSgx47ulNmmY353EFM=;
	b=OKF8nujO6CWoIvrUV29r/wCEqyCtItLrPXGyhhv22vxRcw3ojk3adbUSkhLGj0LexAie
	 qHAEpXRan9vPe49H4ekIL5ZaFtuFz4xW/LvrD2PzjEsVEQt+WcGs3jqJumBmdAVEIWwbi
	 Ut8w7nRx83N7krMKUa2A9bJCcbj0x8Yzjaj/IavKXvy1pyuK3rYh8SUEwEo9YQxFt8XTU
	 XD7f50J5JU7pd0P/8s2r/v8/MYNIcQuxn2a/wSYDRwwqsquX22ezyRgbEjLGXOBJ+yn3O
	 zIDsVbuv3JBsAS79eauJO7TuQ19+RYxPqucN3KbH7ew6BDrmzIv55SUqmgm0FbI2Rwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F6F11F00A05;
	Thu, 12 Nov 2026 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479431;
	bh=WFX6bgBRRPyJHfxGkgp6XiWBhWSgx47ulNmmY353EFM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Qn0bBsHXweW9k+uD4NOXOqNaKCYB0HYUDW5KVVTQWlgBVD99hGHCOPbVK0Z1nAJnK
	 ovcJ11wkOtJUHUhHIpPtIonDHvIH5K+RZ9hEMzB33wzMOLM+Xj7umq1ib8is+vBs0z
	 +cw6KEblh3Gazi6wFgUkQMVmuCM20WkZxsTu/e/jqksbHDuvt9xJTRCZhpg7vbmucK
	 agiMopFM/Kt2KGkIYVmfAO3DKltMWaZQSg/OIPRQigajcxirf/bD4oNPDyQwrQzvhf
	 L2KiU46WerE7FAqJ5oVbb+ofBuIrJBplIkSe/hIRIuzPnHskLK9FVbLenGM7M31dSs
	 6QpeozkFx7+Gg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 829FA49459;
	Thu, 12 Nov 2026 10:30:30 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Thu, 12 Nov 2026 16:00:25 +0530
Subject: [PATCH] arm64: dts: qcom: hamoa: Move the PCIe and UART graph
 nodes to the board DTs
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
Message-Id: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3YzE3PxE3ZQS3bTMCt3kNMPUFHOLFNPkFFMloJaColSgMNi46Fg
 Iv7g0KSs1uQRkhlJtLQAsnzSWcAAAAA==
X-Change-ID: 20261112-hamoa-dt-fix-cf1ed78d5cd5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wei Deng <wei.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mani@kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=iCfDZaL8nz6DHQyS69tVEpDrn39W3So5QT0E2mCMxdo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq9ZVFyu6UOClUClpU70LbBWy61mYBJlM9dAtMI
 esfIXKYx12JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavWVRQAKCRBVnxHm/pHO
 9ejrCACm5a7HRjI1e4yu4369/mzDsID7D5YIhQL3rvcD5tEdkqPS1ZNUSzg/k3wWNzgylJs7B7/
 DdiCX6LIQaDIYnD8b8PKGVnWFYJ+DMfBuZPPRpmuBkLseC14epmUCMtPApVC/bGL1V/36w3H+/d
 39+Ke6dxtKgH4KqS9k/Z6rzIKObv6aIr7EeI3zHjHpuJUP+6HTrSVJYS9lUz1ClFN5UihpAwk0i
 Re/srQZyNsctb1jzyqYQfcP4uzid6+uK9rMZkMY9Pxwp3yyNNQcGdyhfZPMje8qE2ZPNTb4SLGG
 DT2KFOayvvAkJ6olkAr/hURjp93HstKnS45UFupGEnbU+YHn
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
Content-Transfer-Encoding: 8bit

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

hamoa.dtsi describes an empty port/endpoint pair under the pcie4 Root Port
and another one under uart14 node. Both belong to the M.2 Key E connector
and only the Hamoa and Purwa IoT EVKs ever wire them up. Every other board
including hamoa.dtsi inherits two dead nodes they never connect.

Apart from the dead nodes, the change also confuses the pwrctrl driver.

So drop both pairs from the SoC dtsi and describe them in the two board
DTs, next to the connector they belong to.

Fixes: 014501d141ed ("arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 10 ----------
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++------
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index d0433cc3623f..dd6920461323 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1033,10 +1033,12 @@ &pcie3_port0 {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-};
 
-&pcie4_port0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcie5 {
@@ -1504,10 +1506,12 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 
 &uart14 {
 	status = "okay";
-};
 
-&uart14_ep {
-	remote-endpoint = <&m2_e_uart_ep>;
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
 };
 
 &uart21 {
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 48f47aa6ba3c..3f773b1409aa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2032,11 +2032,6 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				pinctrl-names = "default";
 
 				status = "disabled";
-
-				port {
-					uart14_ep: endpoint {
-					};
-				};
 			};
 
 			i2c15: i2c@a9c000 {
@@ -3813,11 +3808,6 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie4_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index a811d8ca2dbf..5600c5523421 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1016,10 +1016,12 @@ &pcie3_port0 {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-};
 
-&pcie4_port0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcie5 {
@@ -1524,10 +1526,12 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 
 &uart14 {
 	status = "okay";
-};
 
-&uart14_ep {
-	remote-endpoint = <&m2_e_uart_ep>;
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
 };
 
 &uart21 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-hamoa-dt-fix-cf1ed78d5cd5

Best regards,
--  
மணிவண்ணன் சதாசிவம்


