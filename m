Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093A4AB1BC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047093; cv=none; b=BSvPu601rjq8vpFeLfH6079TfEhzoEkamUm5HL4UnXuSP0rWj1/jJZoXpNT9gS2IIql7d9Far+Z9PFJuq+XHpSdKkFMPfBlVj7+P8mvqIw6FDJEeA7Wf36SGLkpS9XBVe/R60IQzVpgV85lTkXRRK0rqxa9kaS6GOdQZv3wHw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047093; c=relaxed/simple;
	bh=mfVfQspIwvVEROL7FidIXXcTzJw8GqiIIALDje8vYZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfV8E5lz4wmU2y0O3kFC8ZhHHrcGO1vKxxC3kuQAGwiKNKalNpL3p2bSIeeZ4nOI2My0QE+ZPRed95mLPBOh0rHPuVV2WR9lFNAnajWQTntxL2k+NhXJhr7AwgU+oTKQWpcgh+isqGqZcWOIUyb0RDv2i8VAnPbafuZH5I3llEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJ+V3ucq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APuqCC3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJ+V3ucq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APuqCC3V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hoM1732402
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAag7BBKEEyCroQRSVad40+GMYxEM1aPjJiEmOtAIH8=; b=nJ+V3ucqurt9L0xN
	HnFNqJgDDhPUkj6F7pdYyhU4MeFvXpwNS5tRUBqsmKtNCQOZCxoyXlc4vU1XnYFX
	75+c0F/3Tr4cwJkYQ7r5RDVNoiNrVWTiFUWJnpM29Wz/dl8d++JOkP/0r5qxsTXP
	Y8P0kIeFeHFBZnEsA+p8ezz2y7QUq+/WcRhHuA90rKL0mDu/zjg4Xp3cTrwWiMsO
	Dno7QUnsW1WFxnrqcvLmhiOdvenRjyUTpMVzuS8SZHvtR6hra7nn5A1Emiw4OJlG
	7pBPweBb+1oGyZW5j69vMkG9AD+HiW/apsizjeDKFJw1WWH/lg6HqhekrLUZc5Ii
	tslQyw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydm15h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:30 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c07dcbe60eso36435eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047090; x=1789651890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAag7BBKEEyCroQRSVad40+GMYxEM1aPjJiEmOtAIH8=;
        b=APuqCC3V0PDC4f0zfnjZUF6uMfr9k+F0Zyr2NQdrfJ3PDLbCGmcSoF3ZG6M3Z5AoKY
         3nTeCqDeR1ytikcXF4aCzIjhaEg/T/oSJcjys4xGs/VWsBGCh4hFROoKSO9SseN3bU1i
         zofZK+wRDW1AzuTY9ziFgEIYj3GSF5eBJZYwhwASWYbqKzIgfVGsZfoprVOBUFXMGH+i
         HnqEEr+O3jWzDrICHOZ1L6Jc1CEq/miNw/ZuxXyRm9K0sEOiDeQFrMiEaNcxil0JZgCM
         FMT2QhuIFhTS3oodCwjawgfSCI/66evASF6ODfKVIzMAMZ0xWF+ipU0Sxq2IOa9Z6NzP
         FV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047090; x=1789651890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAag7BBKEEyCroQRSVad40+GMYxEM1aPjJiEmOtAIH8=;
        b=SuxuHCo3JsDQw9gK9PaoTZXHycthJEAfr0B0IHoVgJP1RihQbJkH3Jc+nj2/R+iDS4
         uMsdPjLn5uYO1GjiXCZwW4VTD1zmWYe23TPyKYwS/nHLq2M/00pDrAYIPc0rqL10c+kC
         Bf90mKTgj5eMelemxeuhZ7BHbWMIZ8bYZfarPHN7axB5c5muydLLdKHOz8fZxZNStuos
         xyMLot4KMNih1ZM+jn39FwYDry78Ls+Gt06i4mUC1nT2p33kF/NFp1jUBhvLIETdy1Wq
         6aQXaSaHknkhJyhjd1pGsWdBZeqZXyaEY18JI3nbXMs9KgfPdTLexgd2foAbPjIelOag
         hWMg==
X-Forwarded-Encrypted: i=1; AKwUvBxboyZMCzFk+2lgZfDZIlZalqPEHWvF2sI8eWanPfOcK86zbl2UnTKLae9tVyjnJKg9jk3cdvUIzddV6yM=@vger.kernel.org
X-Gm-Message-State: AFuF++n0oZQ6akQOwgOpnTUXixvCW3zEI6z24bVLkPxXoiPUQSnWUMr/
	CqY+MDz7PlQ9ohDt7t8Uza+0BDhRPlx59hA7c5aWMtyf1TPJkgi+ZrBMvIuh0glyGl490bfaG87
	dgcoPFON+Fb+kMkpmSFm+F/b4Myo50WCr2xa0uGz6JhqXizufvnM+4yZYeAhYIPbW1nQ=
X-Gm-Gg: AYBFou207oCJRKwyE9ix+4NR41M/7o+BskCro6SglBsEFTUJ/QybY+kWi4f2tgxMfj5
	mF1KJBoh1W9n2oEyax3T6Mu3JYHstIlW641i+MYjBgUGBgDXXq57ZGQ8HWq83VvXW3cemtbFoVr
	PhFrbs3a0S6IK5wUwzY2PjPtsCCsRo8lBBork45lpwX/o/TLrkBUeOv/2cnidNv3Y5DKFd8mERk
	KWyrDsj0nGsZKtvFaWWQzLnOEve7RXPel9XjPBdsVr4hH6FTZ68LBcaTKbGvculkOO12YLQSV9g
	Gak1KvNCI357/fkAvXAFqiEbds6PdgPp7CXznFytNEef7lQ+0irr/yvwVKiFQBKIJ0hZIkMCB20
	lPrJ8EKToUrMoeaa3olAG8051RDd+Uan9LAw=
X-Received: by 2002:a05:6820:c3c7:b0:6bd:dede:11c7 with SMTP id 006d021491bc7-6bddede236emr4621021eaf.26.1789047089732;
        Thu, 10 Sep 2026 06:31:29 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c7:b0:6bd:dede:11c7 with SMTP id 006d021491bc7-6bddede236emr4620988eaf.26.1789047089133;
        Thu, 10 Sep 2026 06:31:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:22 +0530
Subject: [PATCH 33/34] arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-33-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=4367;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mfVfQspIwvVEROL7FidIXXcTzJw8GqiIIALDje8vYZA=;
 b=yffo2BaI5jMpu2a8ZH+QcYUH1JRjwsiw2YRYdC9opmFeDi49Ev1/Htjl8YXBohDOx142wYYmN
 eIJmD6GTIEgAEXm7oon6g7po1N/FPvfnOVbIs3t5bHvsDqREZW3F+zj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXz6LbcYGRxBnO
 8oN1sUZFiAtpRpF0yme6DJc3b7VFSoqRQ3AlSoJpbKEIZl4o9z7L613fRwX0kCKh+2l4nyFDOHy
 iQzWVpJK3iugl9A4BEDwI9dwxIvSH/k=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa2b132 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: fMBIdQwMluWniWZSEK7DXV-xSiBrLByQ
X-Proofpoint-ORIG-GUID: fMBIdQwMluWniWZSEK7DXV-xSiBrLByQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1vUOhYYHW4SP
 h2JMnumo3VqS+V32ejpLj8rkWcTG4xLLVHXyk+T8Z3OqEy8yTQi/FG3vvHWpZJyocxhGSnLJ4Ui
 OXe5RD5slOJ+fwnm3sWZ8vTjW8IAHsvh5+Kzsdd4wg6cFGS7VO91uWbJmt7pfK0Kxu2TiAo8acV
 mHgIHuvypU2DmDL3tl1wn3XJTZUpEkzfLMzYcNEqFsOkFruS0vw7bxYYvnAwWX7ueHpgrR4MWuG
 yPaLIzINwNzfdp7pzHFz/DOHLJFUfykmtGNRcXnuVh+tdfyL9izJxx3JaJrscD5bxExVz5w6HEe
 aHus6SJw0hBwFwAX3j5Ja1WIgAmv2+528gzkSklzp7r3I+/gt62Xa1153lfOvB9/qQCYNiQ1FSX
 t2SfTlZV9FBqF9PaU3tkhwHuIz1/SPyU2Df/7S/geG0nOa4gfmBH5G5MkRKDHHmsRQjvoA6vcaa
 04gjPMSvoKqstlSsh4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcieport0 and
pcieport1. Add the missing pcieport1 label to the pcie1 root port
node to allow board-level overrides. Move perst-gpios/wake-gpios from
the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
&pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 13 +++++++------
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 13 +++++++------
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 12 +++++-------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 194e114a12a0..6946d83cccd1 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -839,9 +839,6 @@ &mdss0_dp1_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -856,15 +853,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
@@ -873,6 +872,8 @@ &pcie1_phy {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 	port {
 		pcieport0_ep: endpoint {
 			remote-endpoint = <&m2_e_pcie_ep>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 3ecf3d464dd7..a27bab7aba22 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -961,9 +961,6 @@ wake-pins {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
@@ -971,15 +968,17 @@ &pcie0 {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
@@ -995,6 +994,8 @@ &pcie1_phy {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1101";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..7ae08f29d974 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2753,9 +2753,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -2767,6 +2764,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2927,19 +2926,18 @@ pcie1: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

