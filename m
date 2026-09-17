Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08685013C3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648012; cv=none; b=myW3YksDxWb2cXh5nAfX9IpBD/ehH/jSOlu1b2P2mAvDKNZXzM6xKps5EVh2GjK4bVtFTrwojEr2dmHsxJZXq5iNDa7DJgqha9fZj6XuZYO2g27hZhnPMOsnmh7ZBpR9u9a23mgn+ewx8QUhSmvJdkekvCEFvEAEhQ/aUfKrOkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648012; c=relaxed/simple;
	bh=c34PmATKX7HJZ8CFFmEFy9pekuCN3k6Yqq9JkOd7bLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgpBT+Hus9pYaLHbPZ13xcg3NmOUUdp4Quz9BoJBlvGiE7FPWAT6+LG2Q4LM7xInArKpqjAxtuyyS3xU6geZ0hhvZhiPab4NHMurPSNTz74fZIeszmxKrRP6ysENyopOfQI/hJ7SsKOLeyibdCW7Q8UJu8IuSqtGoPz8J430Jyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6/PP/En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYW1elUw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6/PP/En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYW1elUw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZZZH1257819
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Keor29M37/WrX1rWIERWan+exH4m2x3okekxAnZW8Y=; b=E6/PP/EnHwlumjVS
	Sr4sCBAotVcah94KqPf2Ah6pV9jSvlvFv5wMjuMb/kV1+K7OJcrIip2N67sxs5cF
	jlzjYy+xUpm5grFrHRJ2JkrnD8Od3VMWwze9Tw+W2K/VfmYRT7dqTSRdYFg8PdkM
	Ca6io3lTLjndJem+EUagmY0EFYEBPCCptkwsMzRzlfu6M299h7E59xqx/j7c1iu6
	BykZyQi4XgaeC7D08Ej1NhwxB1/iwII7NPPKXIWDENbY43qlXlLiq8wCUnyT/zcd
	HgCUsGCYqyVqW94UnPHgT2keFrqORj31QfmA3oE2JeXr+YpuLvoFD59t9S2iRqRc
	2jcoSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgqc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso1543501a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647990; x=1790252790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Keor29M37/WrX1rWIERWan+exH4m2x3okekxAnZW8Y=;
        b=BYW1elUwluC0/dSeNcUSFONoy6IUrQyuib6YV956m84HLsaKYeVjXM6jqmyuy+ZvXO
         a600xhGZ1piLfXFBUatk3SYTA8IBsR8LcU9WaseRJ/YKLzvqd2j0hjzQdDIDyNF1IuJZ
         Qpt04d6EurI38/PbpVqXQIab1DKHejfdUvY3kSMudaojN7d3KlqieM7gmGOXnnOsytp4
         oj1j80CNHR5K+Yh4fH5lOi3lrUOmYZA98MXp8ndFeEWAqexztIWnQ6yegyxrtfDIzUko
         fRyj1ZzeV0Dlsyq5ofKxUP4rEXnvOKKRP/QOHfCHHJloKM51yGeTi65fmsRJa74lkqWT
         GvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647990; x=1790252790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Keor29M37/WrX1rWIERWan+exH4m2x3okekxAnZW8Y=;
        b=XomtN470Vp9ljUegNI8P0SNrrlpCiJe0BrcSSupcGU9Ez52FEHYE8ztSesY/mRoAnO
         7VMKVtFd50w85nrpTi8ER9PlkFU4Db8Fhu7ZLjhxm6Z5+Zr/PH4rSr3QgQvMIHszS57N
         8Rv8cE4NfePeaSgDdM80fHgBksuGiUSSSKcA8rSxroZ2olADBDZx4teTCLLpq8MgwURU
         SLNAw7vOvjcA0K5pQLjsMNUyn1LOZcXN8bGGGHvwur7GutjQ1aiHIPcVcNequeDnYs7E
         7FYp6JRGZvmao/KSBXOdjqq/Ob9grkWloIolHiiB4TXd3p/73GE8vyOd5IodeewEfHu1
         NZug==
X-Forwarded-Encrypted: i=1; AKwUvBw9Yf85ADUeaXM8dSqOeE1uaeXZ5ZdBjJ/F5y8ya0/XIhxys6epcOCQWvd1o1QhVTsc3qRiUNRpHqd1GSk=@vger.kernel.org
X-Gm-Message-State: AFuF++kDA110TF6mqzrm9OPGnqn9aZaV4XqlJPJhXeiKTMh77lXBYlgs
	n9N/8DVbM6zKetEj0+qqFa4G5yNE/Q5/hyg4mTEKLFJnNsV9TJDTKuCCf5SBGkiAKQzZkR/KFGM
	o+nkmXbOusjdV98NernK/16FVLQ5KhqG4cmdO99c6I98DKBdPAZXuejNSg7oZxCPm12Y=
X-Gm-Gg: AYBFou3xwnwQK3nhoIQcH9vBwlBXzyhDolazpX3s6TDBbLZLDA73mj8F4I6eJgoCp0n
	xs7ovPEkEUORlRybwFpTNiALVoOyLA5SQUkNhfWjUaGmP1AffPtV3DiSYv2w9jXogJVqYShHqaQ
	wWn5GlzxnhscSByU7PXJbbGEA8LPup6ODK8md6ZX/rZkxp46okcm0KiaEUEmnXyMBp6TjwSbqBp
	Jb+lQc6LKOex+zVG6pa/c98ER/eamCqkFagCVnM17gf+6+b74MoxKDIL4pHpC/js9APBIfJ7li3
	54DY1varivvzF6UoxgagKPBaE7l6laM0gFMTolm6V/BPYJPp3rwyGGgJgBLKd6oz+PyTnSNqufI
	fFOqyGmy4PdVQroh3TDR+0X2NUnDJvJc19vY=
X-Received: by 2002:a17:90b:390f:b0:39e:1c4e:5473 with SMTP id 98e67ed59e1d1-39e1e47ab6dmr18810371a91.16.1789647989611;
        Thu, 17 Sep 2026 05:26:29 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:39e:1c4e:5473 with SMTP id 98e67ed59e1d1-39e1e47ab6dmr18810332a91.16.1789647989168;
        Thu, 17 Sep 2026 05:26:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:29 +0530
Subject: [PATCH v2 15/15] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=9709;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=c34PmATKX7HJZ8CFFmEFy9pekuCN3k6Yqq9JkOd7bLs=;
 b=eDJC9WHsWuKZ2A8MN5t1Azo+gIuEfzTCP9hg9oH0Jeto1bi+T5l6TVaVDPT2c6UN1fmeEl0yS
 Zg3Yd+04+3HDB76KsqCBBvXuG0QogSbHEGobS//4ImFOTzcwwUVx+/f
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX2RACuc52g4KZ
 TeYx9HrJun6hkkSqXLQWNPLnROY3miZsgsohnMiMBf1bF+Q6VUwajc9MOPQ9eOyq68+LwGhPWN9
 Z1Ax0VVLiQb0sSZ7QAM0jNhV9GhxP++WdFg9Or0vHE1pUHSn1Y4WDpYRbQ5O3CX07w226KPNPaK
 rg4gR8f2NaQHZRaKQMTMIgh1nAgAXi/d9eLYzPXnczU0BmmbwnSk9rEnvqHEUi3hq3ZaDMLxwu6
 V4Nt+rw9MLl9USYshneuuBlJGPNwPMj7ii1OP/FTmrwNej4o59n1dauyaBkwrGEjRqLawNVF2gU
 hthVC4sEtOQBfqOt/pkFHgTXJrvftT5x8qVIKEg6iZWenFmlY4cGDJdaUpJ3aYMaakeaJmtyJCp
 N2v2oFaVsywms4M3LTboAHEdSWKSoY7E9+/Ge1j9UK/Ev4+Pvnmnp8M6L7uyP2vsNiykqjiwV9B
 geszRf+uKdaSmSMb6Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX8sYwMK69D8HX
 0L9ocFvS1zwIWbZXrCUSlgZQCyYGj8Lg8yqD86/3teBjpq7K2ez4pS1f9PTCAweRtxO/ahc9jct
 LY0TJ/uMFqv8w/8jTPcwlcj/LZV+o70=
X-Proofpoint-GUID: nsMa6qoozFMC6-DG-ZRmPBcCBD585_eJ
X-Proofpoint-ORIG-GUID: nsMa6qoozFMC6-DG-ZRmPBcCBD585_eJ
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabdc76 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0YZnkYH-Kwr_kGOSl84A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       | 16 ++++++++-----
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       | 12 +++++-----
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 28 ++++++++++++----------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 16 ++++++++-----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 20 ++++++++--------
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |  7 ++++--
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |  8 ++++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++----
 8 files changed, 65 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index aaf5eb57ce23..4faedcca3c5b 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -335,9 +335,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 };
@@ -347,10 +344,12 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 };
@@ -361,6 +360,11 @@ &pcie1_phy {
 	vdda-qref-supply = <&vreg_l1e_0p88>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 41b09ab43d0c..42e3e862e6f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1045,9 +1045,6 @@ &mdss_dp0 {
 &pcie0 {
 	vddpe-3v3-supply = <&pcie_upd_3p3>;
 
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1074,6 +1071,9 @@ &pcie0_phy {
 };
 
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1146,9 +1146,6 @@ pci@0,1 {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1176,6 +1173,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 4777c908c4d7..e75e3b878e89 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1087,16 +1087,23 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1113,17 +1120,7 @@ wifi@0 {
 	};
 };
 
-&pcie0_phy {
-	vdda-phy-supply = <&vreg_l1e_0p88>;
-	vdda-pll-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1138,6 +1135,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index eb1de33e5ba5..7b191c9553f0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,9 +739,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
@@ -755,10 +752,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -773,6 +772,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 13cdb5b0ce40..a3ab0bd3fb01 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -987,16 +987,23 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1013,13 +1020,6 @@ wifi@0 {
 	};
 };
 
-&pcie0_phy {
-	vdda-phy-supply = <&vreg_l1e_0p88>;
-	vdda-pll-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
 &pm8550_flash {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index cf4e4e9d9e26..bf0b16d690e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,8 +510,6 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -523,6 +521,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	volume_up_n: volume-up-n-state {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index 9f347bea6c74..a23ebd3cd065 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,9 +584,6 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -600,6 +597,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_flash {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..9bbc31346f90 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2397,9 +2397,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie0_opp_table>;
 
 			status = "disabled";
@@ -2461,6 +2458,8 @@ pcie0_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2583,9 +2582,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie1_opp_table>;
 
 			status = "disabled";
@@ -2663,6 +2659,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

