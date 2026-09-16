Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D23485CDA;
	Wed, 16 Sep 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554055; cv=none; b=T/JJqXd14SLHEK9/bvXvjaIeG/NYAdQIEyx7+wuHmPQSSJIq1sUQxMNO+toxnzivOAqDoE7rVjMRbPIK++OcSkoNwM4RoMh6obTe/2icRb+UZVcUbsBNsPAa90hR9t+INtHKR3aZDreuYL0XiNYNMg1QG5Rl3On1iTChQZAMLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554055; c=relaxed/simple;
	bh=TdIp7DG+ACmACB9vqF8clHvKQaY4dkde44IUUgk6af0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d05434gq9uFKHHzfajEU0h5uwFY5gETFZWFXgiu//K2SLIHoxj1vP8+2ZOfqqTdtj7mNV6Pigk2OBFTcDx9faSP8jXOLufVR3F8LO4kPMN7Ck2paCkzIA43wpybA/tw1f19OgAQAinaBrb6k6yzemCrnirg2y34tn6A+ezw5zOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1yobHcj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1yobHcj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AgZ2823494;
	Wed, 16 Sep 2026 10:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VhbHHMWfVen
	Ewg6cXydhdCoNazkq8JLNGuh1Z57Fzlc=; b=o1yobHcjctt3HAnb7HZ+Evu9uC7
	+yiXFXzoX86UWJr2cVdOiWoK/fv8xr2IZmTB23kO+A3A5AQn4/wX+SsL0GnMWYSA
	dX1qRiVSril9PfV1Dg4mvs3EvjU5MdssrHA9OwepHINg4ibxC80uKZR4Lh6chHJC
	WGco6LgpbULWIL4DFIO1D84sLrSgQfZoPcgDhLDqD2Etgtw480T1Z/74MX1jSIHT
	p4pYvBR8oGkIpuhS+f4dJw5kgZzxob87KSPRljzpLAd6u5n5nLMA+uu9uWOu5FNV
	qQ3U1UWcRB6i+2jq8X6c7PTbgqxrqMHzC7SbYSbAKlrzQ093QsHrwXqEVxA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfja3v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:20:31 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68GAKTvZ1172517;
	Wed, 16 Sep 2026 10:20:29 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 68GAKSma1172494
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:20:28 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 661A4492EE; Wed, 16 Sep 2026 18:20:27 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs
Date: Wed, 16 Sep 2026 18:20:23 +0800
Message-ID: <20260916102023.2054761-5-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6d6f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=EM5WzatUieOqsTOJ-ZQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNSBTYWx0ZWRfX5IrHIktFaUUN
 6DUmoU3v+5SLQXwU4mZR0Bab9zLKUrlHksfjF86uOfe2YIRlRTxvGmkyL1/YloBqsSm6seHI46X
 ArJLM0F3RlyzUJvMbgXxaBLSpSmm0HVikc8hQucRF2+RyVgtuYIl/t0ayx5B+1Pbm7O3SXY3Qy2
 DZ5Om7ISFlUvScmWJUBagpOvFz2hQRw6ag6KGDefGiPha7e6kXzr/aMaY7Qf7725oSYhZZxIfaL
 V6FwMf9+9gzUFjpPlq31bVMz7bqdbEZ3BOPYOtE9DnOvyR75NvY/YqF9m4/6hhK2OAr0tUVGNDt
 jjAy63pHf//FZNXLiVaZuMgjYGiodj30/3y6Z714Cw1bvNzbc2fl4b+2kJJ81nr30hecb0dpevr
 7dhrUhMNxa/U9WXPhygTZ32oAnKXPkwPduq9gsIXVlYG9QFBElRAuWEwFfgeNMj/eOPaxgOVRhu
 uzU/uWf5pv8QTuUCXIw==
X-Proofpoint-GUID: gMZ5NNgNnqPCj-xhjPGzbEy6aRl7Xpeb
X-Proofpoint-ORIG-GUID: gMZ5NNgNnqPCj-xhjPGzbEy6aRl7Xpeb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNSBTYWx0ZWRfXyLw9IhvaeUIu
 Cu3zcBPPBhoGj1fy23uBcOySyNr5fKVrdJPwfPtMV+aXAi+3EAaBxRiCKtIsHrxonQ5rxLI7nqT
 dJCWQiwTDucGaAzeUWNhUx4dfwe/aWo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160135

The QMP PCIe PHYs on SA8775p require dedicated qref and refgen voltage
supplies for stable operation. Without these supplies, the system may
occasionally crash.

Add vdda-qref-supply and vdda-refgen-supply in the board files
(Lemans-EVK and Lemans-RIDE).

Fixes: 94d7d37f6ac3 ("arm64: dts: qcom: lemans-evk: Enable PCIe support")
Fixes: 76326da895b8 ("arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on daughter cards")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..11fb11b161fc 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -851,6 +851,8 @@ &pcie0 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -868,6 +870,8 @@ &pcie1 {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..c312fbd6ac48 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -983,6 +983,8 @@ &pcie1 {
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
@@ -990,6 +992,8 @@ &pcie0_phy {
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
 
 	status = "okay";
 };
-- 
2.43.0

