Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005103B42FE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018164; cv=none; b=AFbHn6bTZBMAKFeoES51q123ZpRi5BMlsLg9nPPBNsFV+wlCAPHKrnNl9KLTi6DiyeNEyRFYfjgaTcuhgyMVx0++b//b+KU9zc8FWsM3lzxxW9g/y2Mur4w20jZ1LGNX4IsWYpuN6o+HVLC3dnRGR73e3hYmRvveiix+bceOp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018164; c=relaxed/simple;
	bh=0RvO/plpip4syT5kbpIZkDomdGnuLPZqLYCZFbUnxcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZD5l5iwbAJTxgl0vRzTzUx2jCZTgR2YHdllsYH0/Ld+MTXm9YtPtgrWcAfln96ghUx6Smbuw5fuliPbQmFJitj88gXN41IS6NIT4WRWkVBAAyAVCgd3AaRPvtoLUUQxFen4UXzCk6goXzxGVb4hiHMm2JQbWvlxLVqJ0KCIn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZXkUn7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWGJCpmT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZXkUn7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWGJCpmT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933dV3Z3190659
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdD67+I6/Uq4HtTQcp8Gd6fh3yw1GRjMoy9IsKOHUEY=; b=HZXkUn7AA7ee3vJ+
	F9wphF6rFZoDVTldSrb1MO4iZi54IGHe9ge7LyuFWOs0Mzs9Dh2+SENy/v5mdPsa
	x3+wpVeNExBdySmKVvqqHAN1Erre3JL0weMx4wf5DtcNHXzJFGXn2yfyr7akGtvw
	d4pumJGhD8luzX2fykrfQM9+nTebKUl4y+EqpLuxs/sCpmCrJ4WEGXXiToacwtmT
	Z9KdUgV8+b4QgggSnU9rVuIwIivOAxTyYwhjqEjIShvr8yFnjhnGgGcRBH8CTSZW
	8pDdC6z2Uw6cJL0Td76LdtyQWzoBOK3cXSOxmRjR/7vwsvgRb1C3ptq/KzMgaiPn
	oRAPZQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06rgfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d80ca2184so496995eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018158; x=1791622958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdD67+I6/Uq4HtTQcp8Gd6fh3yw1GRjMoy9IsKOHUEY=;
        b=AWGJCpmTRr4Ar7lUmia7WkNUHhuum8T/9VGo/904zVITiHFyxMnsbkUy2hQwdvvRsL
         sCPCn51vAjoiCjYL+3etUkuYQ6PKR26J0j5Py+AEtTkXkvZaYrlRGXb9iG0nJj6daRbv
         TiW2tjWGqy/4haKldq4AEBwZHphfno2ENIiManOBOyeldDOf3K5P9hyA6AKB/z9oTv5i
         OroZfIZ1Ae5Nkkl4B9p4A8O50qNjQIWkvZ8krVkvsT1OdF4vgLMx/8xZF4BP6KUWDorg
         7gAVgPNOhpQ4LL/eMj8VJ2x78n133egXCtLvT84yMlusyjhYCX+qeWnsFE/UT5nLvM9b
         m+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018158; x=1791622958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdD67+I6/Uq4HtTQcp8Gd6fh3yw1GRjMoy9IsKOHUEY=;
        b=ZBei6m4leoxqEB0JudLOTS0U9jhbMYi4sRSRGZniXOphm+H4BVs90n9vW0PAnzHzcK
         F0MYQ0q8X0LjgCpHPNeBzi+uG2JcSCeyOWYTKTTOPoCxyt71CjjSOI7XYYOZvLxITms4
         gP/fYCCxLXX9QezdXtXA4gJLVGrP+JlmbCiKPCRJ3vXiq7anWGPSajfq3CyVQSevNd0S
         MM/BRrVq0gCOLUBf21hzAKdyw8p3OA0SY3UxLZI7KrcHwgBuFbv21Zin5bSgQdEOFJs8
         M1Wqs4x8pazmNES+OUa0W8AnXModvfP+dk70SlrL2OPWU784P3wyYjbAh2uRXLPytJCO
         Hfnw==
X-Forwarded-Encrypted: i=1; AKwUvBwKawnq63SjxZBa4CDtOQM4J8LcCCwMQx8KsgXBSv79UKImA4tm+g4OhoaRlJHa/PM5sBFPtdkgdI9gBlI=@vger.kernel.org
X-Gm-Message-State: AFuF++kP5efcTleDTQLafi7MNKV3LnXLimueDRjMlZv51pNtUpO8v1nq
	iNxZaV3+sLEHplBDJxxBy7wZTbEE21/4MSR4F29nGAn6+z+fPknVkgAx1fmQwROZpKsGXatzjY7
	sreC/vSrPPig50PuKf+UnEpHhET0AGKtUfdjSqoI+GYY+SRZ8tD9h/U5PccnZwoNNK5I=
X-Gm-Gg: AYBFou0cNVHzBg2GpVxL8VUGLmQOuySq70xBhcvkX0QOoWR0N+gDuh4vNil/hgbFpdY
	QssoCzajmzJY4/STmPSBYzPgEMINDW43o9VXPr6MJPtIFghjKLPLrtyHB+ETaWprijBAm7S0z4/
	8qar1KMHy2OGJr0xZfzDgcesPldvGvE9iXiyCYFc9s2aaX6Oz9BCt3trPt/m+mQDkyC4LseLJNt
	REOQslYyy1KKFPTKDOGxsOyJowmsBFamHP2U3o+XHE6IHDQBovk8VuauABX5AEmTL2sL4Sg/SSj
	DNFxmMxOLDxE/xwseLw4huEp52umRlzXr0zyCjK66stue0mUWxz0v3sw8Gc25nWBQ/ZWj2g9mBo
	zsj1C1B5llR7jTBy/ZPrmqqVp4OZ3+wOZE58RBYaJ503VMG0+rSgo5nwApnxbLQOk5Evlpt1AzG
	JTw0s9OuoQtQ==
X-Received: by 2002:a05:701b:458c:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-151c2d0b138mr2228924c88.14.1791018158064;
        Sat, 03 Oct 2026 02:02:38 -0700 (PDT)
X-Received: by 2002:a05:701b:458c:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-151c2d0b138mr2228898c88.14.1791018157518;
        Sat, 03 Oct 2026 02:02:37 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:20 -0700
Subject: [PATCH v18 09/11] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-9-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac0c4af cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Rf5Ds3phqlu9M3-Ja7MA:9 a=Pl3c0loyD1WMvPlK:21
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: C8It52gC49rP-R2l-fYI1YJXzDk29mfU
X-Proofpoint-GUID: C8It52gC49rP-R2l-fYI1YJXzDk29mfU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX0hkTvRWydvlV
 IFuoT1Caiv2JkW1c/dqvjakcZ6tGVghHPXV0cjjWFxlr3QKhFM71539izpwOoY9JhcB/CWTgs4y
 IXvzYZ3PLDH8mJzZtwKh64RpX4f7zam0PaVQ7HB9dxMH2JYFkclcCNG1r4Gatul2ye4fGFD6mn6
 HdT3TUiMixm3lIz9ZvIvjKR9TLR/bkNjxQ/99hsFEJtnz1jKFdjH3U955Lq/rOrcX/e+ktUNxOi
 AaqPSUHBdZqRQHEeOtwcdkkayKeCBFNe1K8uU8NryokJnstxV0vcJqufRcXk3RICGHPVgK4lkjb
 sw2j3HSoTgGFkJgCI9UwhddbX283oyzthneas54Z3PAFQoxNfctmKouFJ3q6HSGuimvmiHElXG9
 qd4LrlOfW2m7jXpgTW61p9uHkdKoVkVkBfuAahim+FF/rYvqw0QBp9fe1/chQX/m4t3C9AnVLOw
 yp7daiQ4iZC05wOXr5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXwqQ7p6ZptC4f
 x1nr3fIKW+0nLANyIVeFJDHww8OkbIuZsKA8h/AvQLv9rUfWQzpXIutjDudqZQ0wzWDFyYOn21l
 WFdL81buollrwy3TtFwyS54FdkyTZIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
can be enabled by board device trees.

The camera subsystem contains:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 324 ++++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..7e5106865e7e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -3597,6 +3598,307 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		camss: isp@9253000 {
+			compatible = "qcom,kaanapali-camss";
+
+			reg = <0x0 0x09253000 0x0 0x5e80>,
+			      <0x0 0x09263000 0x0 0x5e80>,
+			      <0x0 0x09273000 0x0 0x5e80>,
+			      <0x0 0x092d3000 0x0 0x3880>,
+			      <0x0 0x092e7000 0x0 0x3880>,
+			      <0x0 0x093fd000 0x0 0x400>,
+			      <0x0 0x093fe000 0x0 0x400>,
+			      <0x0 0x093ff000 0x0 0x400>,
+			      <0x0 0x09151000 0x0 0x20000>,
+			      <0x0 0x09171000 0x0 0x20000>,
+			      <0x0 0x09191000 0x0 0x20000>,
+			      <0x0 0x092dc000 0x0 0x1300>,
+			      <0x0 0x092f0000 0x0 0x1300>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
+		};
+
+		csiphy0: phy@9523000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09523000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy1: phy@9525000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09525000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy2: phy@9527000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09527000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy3: phy@9529000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09529000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy4: phy@952b000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952b000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
+		csiphy5: phy@952d000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952d000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;
@@ -6548,6 +6850,28 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	thermal-zones {
 		cpullc-0-0-thermal {
 			thermal-sensors = <&tsens0 0>;

-- 
2.34.1

