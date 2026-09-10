Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE894A843F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047081; cv=none; b=lMvqulkxnCjuq3776wtShUlDHB+fB+hd2KcpzCH9QDcVxNaxH30iUxMbGEtxqFSoXcRjdFOOTPUgGiJvClwkOeQiU84X3N+II2IL1165WKAqYXo7FPKMPS1WCRCskXPdxZLcEtf7i7/BtHL+b1g/GwaVet+MNHnbkyfWQU15nSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047081; c=relaxed/simple;
	bh=smnPHEb2sonKTd2Yno1Km5oiFJeSbI6f+7d5N3CqVg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJWRjk7joguaT/yPTh1p0n991JlTo9kYNAGPVd7rH8DM1NMpySPTqHmpERw8zQYLX1Ho8weTfRPVI1nIjqbtqV/ZeRCH8+s5UfvfZjAYO/jWCq3rl1rTIeUJa/a9fKdJsDEufilEfw32a029LWeFUkKFN2BBGbtjlWkBe9jin1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3t7Ys1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aG0+cjOf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3t7Ys1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aG0+cjOf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7o3F781276
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVVhWSV/E/WVMG2TGEQxlMfERoN6F6OlRNbD0FFcBoo=; b=A3t7Ys1j/gfoQFec
	0PIj0bVoVxBN3E2rtCpdzVs2sYV6+4sqgCmrvHMkVWHhAFJE7QaW4BBk+pY/wOOv
	a0IoFBICDUwJpZObmd9XaNQQPweoZZf8IuglvlPUUIomlEGWYj9Zcacnn9tLQ6l/
	o2gMP3Me9a2Hy9vhZSIQTm1Okr1f7YdAMBGPN37/cLtcyaLgSNurtthd+UcPIcis
	IdQc5Qy9EgZ2WMnAO+59i5bM2EDkZgvY+xaWToGGBHWG6lZJl2ok09unxl0hs7zo
	Z20K3bSddceT489cB9yMFpwd5rV9T9t88/cxs/l1zVUDIBtFIn5VD+ZQ5JnyImiH
	YQXPrg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9b10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4f0a1f4f2so9363458a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047077; x=1789651877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVVhWSV/E/WVMG2TGEQxlMfERoN6F6OlRNbD0FFcBoo=;
        b=aG0+cjOfukTxWkGs8obdUd/lUcomrUQaRTK90oleySEt2zAcJWap77xEimGqoa8dPl
         Z9AdujxuwCiWk3GxJh8q9r04ASDFZqec2U/UnJa7p1rADR+Oy2lFiLYL5JsMo7UdkqlV
         d4SBWPBOFyIdWwfq49mieLDGMsUNnCqOdoWvTnMjYti5MV3jF32fPdYJEMyTxdayXpEs
         Ca0w+Yf6ZIOpFMnZllKqt3K25s8J6DD0p/hgh2uqiTZPWzFfZhq1FlAZmTzpKivitWRr
         nv+3ke135M9q2mRAq2E9utsrT86MBs2icd5x4CJc6n6te/rffvm97q9gJasTjPGg5kxT
         9LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047077; x=1789651877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVVhWSV/E/WVMG2TGEQxlMfERoN6F6OlRNbD0FFcBoo=;
        b=W2Z7mW2m8y1XftAdcCKb9Etd1qpLYRUTdCkeL1O8uB0Yt4tVxbdNMEVVGisI5iskV/
         hSGBjjxLVqCPqRR+HJSv80WFLS3WRtJZzXyPRjmFCN4QEEobKUkKqYRcnzAGM04TL+jK
         C84KStmt0MzT+9hjZfL4yTtANx+UbsLlofW9QtY0Fla5GHrMyVf/nYeoFiAOPKaplY+r
         DclFOxf934hsJ98D7nGKkoAJGTlbzsSURi8pjF7BgLa2JWNfZsAJAFHiqmWsRVe38gAX
         /h+0YR6ggRzYBe9cILSm+xzk8kZXuvk1QJ2IxHkLW0yjoJamMXjDyidN4BgeYzmoUO4s
         ogSA==
X-Forwarded-Encrypted: i=1; AKwUvBwELJnToRieuQZOpd0O3Z8y9IDpNmpAk2QKWRIdmejroecZ+15jXYiPNrUpp4d9BJtB2MLA7z+seMpgqhs=@vger.kernel.org
X-Gm-Message-State: AFuF++ltVfzg5oBB1oYxaSv1EZUiA7sNWbtLw2Dg4jQTApaugGtMxIuu
	1XUiusQ96cW+B7AA8v9KCsarnbIDYjeLP6JD1zZ5wblLusZ6A5IdDOGa//Ax4cC6A4egIflTFGo
	Gp2CVPLFynWQt+zYTlXhb01Gw/OYspzOPCk+iA6krzCb/33lAw2llEfAR9vi2ajCAjDg=
X-Gm-Gg: AYBFou24h0/KcqePvegRj5VQ/xoiMBGJvyU//1Nk0zScgxVpxdX3ZusswQezPKWXSuk
	TlZ29VlbjJh3KKWXCQvJJoxAYNX/P+x/oEBtfNlZhRMI5DtC3rvwTavDGsEa+8iI2zCy/BMq9aN
	wC1MCL/JErMq5O3OnIDas4RFzXaJrSRy2xIfQIZuCnSJi0+GhGU9l2ObYLboNZv6j0JXq3wfQZi
	8iXHT6R3q9aitML0vr2NXtbs+gaZGzR1ndqmrJuyStr9TlSzBTVK0yRSdlA6vOH+SI5WmPbon2o
	rbljBE8Hz80EtHLQBaOQQ/RJs7I5YbqDJGXrkxVzIwHCSt4EuweoGx2MGy5MmkhAaTKa58OO9GH
	ID1pNqeYUBs09gDbec4nOAwaLda/2j8aTQro=
X-Received: by 2002:a05:6830:3c90:b0:7fa:ac4f:774 with SMTP id 46e09a7af769-7faac4f0eabmr22496366a34.19.1789047077202;
        Thu, 10 Sep 2026 06:31:17 -0700 (PDT)
X-Received: by 2002:a05:6830:3c90:b0:7fa:ac4f:774 with SMTP id 46e09a7af769-7faac4f0eabmr22496298a34.19.1789047076481;
        Thu, 10 Sep 2026 06:31:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:19 +0530
Subject: [PATCH 30/34] arm64: dts: qcom: talos: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-30-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2875;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=smnPHEb2sonKTd2Yno1Km5oiFJeSbI6f+7d5N3CqVg0=;
 b=FC9CdBkcCr7O4UMQCaXcr4cXdaS46KIFshv7ImXObW15Hio68OMI+xoWeMeQYDiwkNuLiTd8R
 C8m6GZj9hdAAZ8N/By8hq14o3LvRWa3Hm24c4vX95iV/YuJvkTHrTdb
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXzZo4Ef5OJlSe
 Wp02qNnDh8hESU6KBPteKmaRLHhCNVpw4RQB0KM3uItWisQb1jGp87BS+KfKWCRm6xA2A9bWZPq
 bFeeO01xJ3djSTdmxcRU6Fg17+l85/8=
X-Proofpoint-GUID: RXoy2ff8ilT97x9NpuSDv0xHG-NbSJlS
X-Proofpoint-ORIG-GUID: RXoy2ff8ilT97x9NpuSDv0xHG-NbSJlS
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b126 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXygs8nH4/fX4p
 SseOOMtCx0URrPORNLxEzMKWhx527fHUuQwothjM+YNaxNP4/QmdMu15wz66DJbV0NNE7tvnJ7o
 MkVjyaTTf+McQOmwGSEuXNw4LemJWb8nqZAdjagw0eRM49/HhEESAPbqTOu+iovCi2inngGL92Y
 IMKz3scesfny1HGPFVftos+oEBVSmCw9HFxAFqXk55pmleFmOf8T3htNwM4k8TZZnNx6h+R3G20
 hbi6OnxOBvgT6Y3I2DCeEAFDaKSYRDlLcSXHyKEMsmN2LpWPpcIZ3ncOQTJVmKkLPdga8GhTpgl
 U260hoclY3dQXOPdKghz7fxS63OsQYaDHf7uraIADi/OO4UsA9bJGwpASsUHNFMVXU0avYjX8OF
 DMIf329pLtGhydxKB3mNfFmuF5V1AGDjqCZY01X2KJRTf8Pgjj1YGM0xxTqklaBWF1rAUkkzT4w
 d2dFx/OtPrwPZMtsibA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie_port0, and
move perst-gpios/wake-gpios from the &pcie controller overrides to the
&pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 8 +++++---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 8 +++++---
 arch/arm64/boot/dts/qcom/talos.dtsi         | 8 ++++----
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 43f110ba3a7c..4edd2b1bb03a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -444,15 +444,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 198f656bddf1..715bbf29ac68 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -366,15 +366,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..a22f78f5a5de 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1367,9 +1367,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			max-link-speed = <2>;
 
 			operating-points-v2 = <&pcie_opp_table>;
@@ -1397,10 +1394,13 @@ opp-5000000 {
 			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-				bus-range = <0x01 0xff>;
 			};
 		};
 

-- 
2.34.1

