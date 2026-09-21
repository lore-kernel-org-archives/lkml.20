Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C44772B3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984321; cv=none; b=do4pZ8yVgeNtarebkEazmSF+Td0ZG3c4Ya4/kONAzKHR+LC7nsUCRJEnnVSyc2gR59cvoAEeqBz3HIrM982XTiB8pDUDDo+QaL6JgicRvqm3KWajOJgFvdX3N41vOTwQz8ptiwQ7Rgk7UygAdNyo3XSsAH3Tlxx59/GuxIT5los=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984321; c=relaxed/simple;
	bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5GF6lU+O2ixAsBRtprt64KPx7tkZyDyZaMMKti2IiHpB7EyxnMxCLzLlBM7kyAMZ9JgffEsR075loaG9bQ/cWLCLTmarCWq14VHttWy+bSISGGIZFuFPYeX0Z6E9FYrqW14qrzI3xyUykSF0uk21FNd6Je6WeB7z2rG5gmZND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UplmTV/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4eABNRi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UplmTV/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4eABNRi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AilV371658
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=; b=UplmTV/7wuxwGCWB
	AVMFHM3wQfVqweVSD72PmTu1HBoRa9e2DV4jo/ixiRVFaTqUpnXvhGpvDafEzZOU
	uPP0QJtbZtI5yB+6diPIdeEy/D+n91d+tic2EtRnHiO5NNqPaVSetHc6KoJdMObZ
	2AXZstib1dkV3FnCdm4nx26Kp4/UxvqmtSM6lzoV+6YlGvR1/gGShonLd2HVYGHP
	W6q5HG7Q+kB1h81kJsaMtwaei1iZQ3nqNHNDxFDhT+oCef/LbcKVrroaqXHmuNHR
	5r2FcQRFV3fbq4onOKrxFLxq7u6DulWRFC9zERG7BHszOz/6YwpW1LeRMfAi7ECI
	BD6VTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5h74n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so40338195ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984318; x=1790589118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=S4eABNRiXNsz+hOEG+HeCmTL3joKR+ExctmZuxfDyshtRna3RbQd4aS4ZFfzvxm65I
         w75u6NFtpqXbQoqnmSSyUzMZpT6fdCNwFXbiToY/r35xpupDjjjcLKjnIcxBhseyOYSB
         FDX3XCzn0Uhh2MwBCytNqHjeWh8AlgSt49QPFFlPMpgesbZh4guVOFND5+ffIGndtdbi
         6F0424JdOG2zNZoTyytuL7l7bb+hnpNyhQL+BerU2JhBmGFfiO+Eqq7uELeLDC43kNWa
         Oc+eRTCoCK+OjcwdoS2yCvwE1twaAU40kuNKXTFvM+qPIbNSnQNjdsMiPP2pZDOqncgE
         AIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984318; x=1790589118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=zj2AuDivy4G8npfANiRr4ShDXk7pdmTVAzyUuiSC8S5ltZmOVvT1fTe+SGURfJa79b
         I64q1MilbxsHrZuG1xlKd+Yq8WNc/KiuoZXdc7kvyjZcJTXPvZYuaQa72nPWl+f0BZhp
         nNs3tyozIhO7cBnnGhi4yzAeKmsPlbQjPoEdyisNS5xbsPpsqmdHcYGCT/efB3xRCziC
         Y292gLjMx11tNAdofV6axR7IzTj933gHSyQmDikvJnUOyQtG+jBjhS3/ytmj/c9pPxBA
         veAz4iusS0aS+FZuCXfz4YBY6t6T60A4l/bTcS6RPL07aWQInCNmEE7FJ2kZOgPpCx1q
         Nkpw==
X-Forwarded-Encrypted: i=1; AKwUvByVmomuLV68dx6p4A5arIEp7rRg2qPc9oODBFwDL2GyN8PMYQ1ZPUZI5LHWqKaHf4nYvw0M5vhwGzgLRLw=@vger.kernel.org
X-Gm-Message-State: AFuF++mdsueSrD6jHkE88qmghu2GAWmp4QyvIosNPygiaFzWc8Jkht0V
	cBFGGdqycb1hEjsgGQz5aMkADXBvbkmeGMN8uwR7I4i+x+ybYsdaK7XStwTxRrY6gp1QZ3M6seZ
	naD/ygymFtZsKdIBOxo3mypZ3Y8IR4jLi0F1r/iodo2uhuBTPUdMuNkxU+dUCBzPvbBk=
X-Gm-Gg: AYBFou0qnWb41loDVokyppzSGPVB0P5IFHMNxx7BGresC5GFqOkDeorcJeUo93/5abJ
	gM5PbV+Or1Ha7AkGn4BXpFkKp7VT8zQPeiVuhDLpkFdTTZaPj5++6Bp3XdeMs0AQ0ok0EpjBl9X
	eU4miQX843xblmIwcNeyZMTrj++sUV/pDGJxNFJawnvecXf8w1rRfNZkkRLHhIwawGCJzTd5sPJ
	oT7yh9XCdfipAJUqA997kW8HZEQd2ghg6xykj5uu/0D2LDeMO6KWnI7uxcplS+guLV18cLVTcsF
	GyHsg1asF1G918W+Dq4E9eUuwnZS4XRVtYcXTuV+OWF4xgB1Ny0gc8lbiVt2O6wbE+leNnYpK2L
	1anNMs67h9mNtIhF0yJpQU64TWaAXYIMMbyHPbKOa8wxV4R4C1hEUGeSJ5FEOfDZvtaYTeE4yYA
	==
X-Received: by 2002:a17:902:d54c:b0:2dd:c053:d742 with SMTP id d9443c01a7336-2df4e82e854mr14988985ad.41.1789984318203;
        Mon, 21 Sep 2026 02:51:58 -0700 (PDT)
X-Received: by 2002:a17:902:d54c:b0:2dd:c053:d742 with SMTP id d9443c01a7336-2df4e82e854mr14988625ad.41.1789984317548;
        Mon, 21 Sep 2026 02:51:57 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:57 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:36 +0800
Subject: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=3494;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
 b=7ssA7Wks0KxchVzEmbYB212nWzNSZL7YMqagt64wU/Xw6u+8OVPJOBgb0k+jdIkrbas/LN/fb
 DpiXriSOpe1Amfa+vSuDkkOFK1hxSgd00HI7tfEeLdnV6BAeAi0buSP
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0fe3f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=eQaGosDBtpkPWATo:21
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: IKT6D2ce4cWesLNO7Yw_YMj1dg9xaeqe
X-Proofpoint-ORIG-GUID: IKT6D2ce4cWesLNO7Yw_YMj1dg9xaeqe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXxefs23NDvVGj
 zYKRGoIq28Ki9ZprUAofh4ESe2VrkwmwstGGFoXTELTOOx3rIxCMBjHZtkuvxcP5if4PKim4q9C
 KQD1Vk3h6vPYp0DCWPvnpOJkj0+ydrw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXzkO3UlT4jYkr
 giE7umL/wC+YrLG4lsNvqot76cDLVQWwbTMVptItJkhxTusGGoq88EQsVZ16/nTVBLF2rpZ+TaC
 AwiIO+N+Zd51NpGddgxMoDzssEOfHkd9ZoidzcYm1UNyf217GO15Q75l9/LZFO5dY4EgBrXqhUB
 86KG560GcJNX9M5/ee4m0dfZLy7XZ595YKYSnAaHEaO5OBY+jbp/jO0TpZ/h6k8hjx72bFlNImD
 jhYO5q60Q63zc8krgvfMst7UkQ//cR1o3siru388b/VlG0s5edoDNMCWMxiKP75MNUYjXPeRcQb
 T3qpOCw85JnWqC8TOEpm2gKH+v0fIq3qiZ3VgbaMIS62mtDLBz/zYzuMdcUaB0zxuqyu6ps965C
 xtEVV35wAZgpvYwdKvrCRspT1Qz2npMUjUa8mdvY/Khi3WYElKmJkg/NAc4P4RGrkRVcooJfAIh
 E1U38YGx/1o+uNo/PQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210141

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd075893304a9ab7bbde84eee5547491..5ebd2aa0a520a7c3e08eaff03e3220469cb64f23 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3357,6 +3357,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

