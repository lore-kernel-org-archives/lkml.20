Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9919F502548
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058146; cv=none; b=kOnsiKgP7FjvjTDHSkA3yNAmUQTaX9FcPQoBAad9KAjUBtH+phbgaKZ24YjatYB9mbB/9CDdweywQBDerI8ayAFFs6+p3z1nx2WdgXcrp32Rmj5+/hW69gdAT4NYasUqsdoAJuh/WtV307HGfRSL7dIMuxbLiufYkSSyVw2a5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058146; c=relaxed/simple;
	bh=Jy6v2m2vqJXLK8QjgW7m+qBuTZEr3IapndMW3EXkAC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFkbXMJlyTQ1PxHwDPueDfkCJE/oQw9UYSTscQa3QzlvYJ0jQVvkhKFcuOqg1fRLMPuJotWlRbk1fd02ILvgvzoee/GsVZVqQv9xWwCMKllzby7CB8hU7X0Y0e6Ax3yVXzFVCE6qkwvRSL0bOoy7+IEI1Dl80bKevJfQUw8NA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUr5eOl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRQDGoa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUr5eOl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRQDGoa7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSoG2662626
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdpJmur1cLwxlK1AYe1iK0UFkAUb6LqrJNBOhmCKcYA=; b=CUr5eOl0ecNhC1ZV
	fGt0OCv+vNt6FcYNmX2qwHHrZnM6Od+//98F/5hJVSvGLFYl1y6KbHS7peMsVYeA
	OVz0yKdPSMamlHqciNGBV5bf7Za1fGrRhvSq1YBx8dwo4lQH9pH2BddF5ShyZYeb
	IPh1Qsq2Wc/nO7o+lFuzyTRPUyWYXiNSRgwf7DOipHZhCsHM4EYdfxMw5hfs7BKE
	FDpW/RG4Sh9PRMsg9oeOErMHFhX1D8tPfPUIgKCmBCZ11pDf4skWFrrH8QfFLIvK
	/5U6XM+W3OlH/8kAHMUws7s529fGB053Qn99cswDsK3WwXdqf5QPgzqNkyww6Xg9
	HgVKcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1drx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso8372839a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058133; x=1792662933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdpJmur1cLwxlK1AYe1iK0UFkAUb6LqrJNBOhmCKcYA=;
        b=CRQDGoa7kc8CjVKx48flgAHMJS6FAf5bKAZTZnIWvoGHEB9UHbzLWO95qH3Nhm2yuz
         1S9whlu/J40+W5Mcyf3JN40t3E7XZNGuDic/PYhIX9f1+NBJzWXumasVwHnP6uFsTbiG
         6k8CxCstq0hrBahhM6CvVjp1g2Zi+TLhezxOHS85nyj/GGsEL3MPnqrGEsTDIQ3Y1Evn
         EvRdXrty7sg0PlkzOwdspy7bNh024Fs/srmmFBpdu+pe/KfIjRipBGMP65PTu0MKsUUv
         9dGpaGFTX4nJFZs00bMRFvEloYdhBONzNHApG3OfVWM7oByqXi411wJjGSE6RpHVyuNO
         79Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058133; x=1792662933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdpJmur1cLwxlK1AYe1iK0UFkAUb6LqrJNBOhmCKcYA=;
        b=DHXHeqgeJr4zzUmDkRl1moKrtnDeqWZEgnCrIdruaPO+zwgAX39aRVTkMJ38F7mg5V
         89CvW4xcIfGVRU9qjFcEOcMLSjZ7TKGoYx843kBgD9D/Kji1hqCzdQfXzdXiAkk+NsSZ
         ZzS9gRI0Y4C6qu43HrBYPHXeTOApXCq77aMiVCJxWySgQcCpx2f6S7RevyFpk9dla7ql
         u4qYuRNGbCfosY404rgX21Q8lM/wsc0bsIYAi1w30M7M4bNv5TK592G9yceLxWQ2vD4o
         OzBRswCrXru2LXorRks9Os6fBr01lBCrHdMa4WV5URRSKp1QVT3yZjl6t/7a4b9jG2Px
         50Vg==
X-Forwarded-Encrypted: i=1; AKwUvBw+XSX0pfIioa2OLxuUuZyGFmWPBIFurQ3iI9fuKmthu8qLqLt/MmDMpx0WOGLidKlZeGTGSAMxDc5LoPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRat4YBcIdIyvEOyIFsiLBniFNIY4yqVNJ7epXGq4nmDNolYwS
	FwuOKu7S6K88uZbnG00d1yPlh7IeuID2vta3MQKh/6LStJFWnouyJgs+bAKeXHkYHlmnym1KflK
	TchN/CU8amYbj41ZzemSDATfykTwXsXFThEtSrVuX9ALCA8fkhh/lAoDwx6EO4668HJ6nEbeHVi
	A=
X-Gm-Gg: AYBFou0Z1YF/0DirE30Xh6zPwFUbMMqBfZyPR5B7gwjK2IRWI8oqUvb95lnIfa12+3V
	0wfHgjl5b3jhi3oWdi7SnWzcUK0h9QMCjrM1+wbQOXwiQhPUNRBpVEzqo4dNbULyvNPqbpiNuAV
	H3IxUX8l1JbFoB4HdfTHk7mKqPgy9IXwsU4ark0Wfrzu/mH/Ghb9DtQwKRrIpOZHsEzNLyGxVTT
	ScVpIZadmOtWhgDKtrl+HHFMf4jAf6hyIgm4oK5z2c8COLKWkI3Rc4/jrfdSxOUNWsQzOQimIEH
	nAPW3/DvU3IJq1qEC+V9V5FkC5E7nWAmMHkpuHvqF7UeDTtAHAhXpctae+0ewHOOb6HHosDLIxi
	rVKJBmlZfBRlNToi5YWBY+x7wXAwElY+sOObI
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr14625998a91.12.1792058133102;
        Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr14625966a91.12.1792058132599;
        Thu, 15 Oct 2026 02:55:32 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:32 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:34 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=3871;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=Jy6v2m2vqJXLK8QjgW7m+qBuTZEr3IapndMW3EXkAC4=;
 b=VDvO9b2BErkTB1pKJBRD5nt0KHjG/0FQmM5brWugmp6QZw2dTF5P0DGGr4ji8e9dCEIZ3LeWl
 PdFGDuZ8q1DDN695Hf2flBAKLPacgUJUd2FJlVMXtWmsom1xU7KUl/3
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXzOV3snNeSAO6
 LZs05/sPmE6rVRUowZmPjFi2Gb4rf3fj62PjNfQt5EcIFAAugQb7Vcf+Wba8MuWKe2QKmdFeobl
 Xz8iNe7fuo++dQjsoJvJGdB77r81AuY=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a316 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CcA5yJ8BMwMt8-iLN6QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Vm7OSQnrn_9gHZli7D6BjdCxkGdKBk_0
X-Proofpoint-ORIG-GUID: Vm7OSQnrn_9gHZli7D6BjdCxkGdKBk_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXyOICUIUFX+2o
 awX+yyeASIkvFaC1DeTIE4lma6FhxzVG7a7tWw+nfhowW5/gu2u2b6O5jRvdsWLbY+OEYzfYnzQ
 v6T4pHB9Tm4b379dHadrg8bvdr1LFGkS/VuWhU0zmmtRP3vwrznh6rBHbpVSPjLOA4Lf7xoYNLv
 hFB9drEHOMiXC2Q2vRBe3M8Eq/+WTOahRfXBeHa9TGKfgjo1+ipC+YOLsQlJiwdabdEXRrGMhxw
 NY/tQyaQYu1r1DtEJD1pdn05uo/FBOeK1bhtA7I37NYFgF6FvqBBa6fgo1OmJYyhVklRWYsA1sb
 W0EtrWt+6C3nAzLh+sfTu6MeNkEQzdHGttXBT5vX4GfEbJhbE2AJuzURE5XLkqdmybemZoMLS0P
 SHLMnDhrY3katlpsjkflQoiPf1IcVBwmCT5D8YK1bB8IjDjAzAnyBHmIMYqK1C41Vu7MqGv6f8i
 h54QO5u9KjwzsTqFXwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

Add the DisplayPort controller node, including its OPP table,
controller clocks and power domain.

Connect the controller to the DPU and USB/DP QMP PHY, and enable
mode switching on the PHY for DisplayPort altmode.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 91 ++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..de856c595936 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3565,6 +3565,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";
@@ -3592,6 +3593,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -3699,6 +3701,7 @@ port@2 {
 						reg = <2>;
 
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 				};
@@ -3851,6 +3854,90 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@9ad2000 {
+				compatible = "qcom,kaanapali-dp";
+				reg = <0x0 0x09ad2000 0x0 0x10c>,
+				      <0x0 0x09ad2200 0x0 0xc8>,
+				      <0x0 0x09ad3000 0x0 0x78>,
+				      <0x0 0x09ad4000 0x0 0xa0>,
+				      <0x0 0x09ad5000 0x0 0xa0>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3860,8 +3947,8 @@ dispcc: clock-controller@9ba2000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,

-- 
2.34.1

