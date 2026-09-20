Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F6B3D9555
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891866; cv=none; b=c49jsSVcrIIBTmxjqSW5WKYY2LA1jMuJdi3/0ZPrnyPpiYKFzdymbBCXyCeHSTefGt6OEXZfk6SIT0hXgCUnVyb0MsXHY2Euei5YPQUjJuxY4ep/PPaehVm06x6vnW0c4EQYD+lp/MrDVwm1RmQ5v5rbJnHmgS4GtuUDLR7riWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891866; c=relaxed/simple;
	bh=+1FbJqH9Li0E12d1uWj2/c3eoZmd8U2YhciglMfl38s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVXBQyFiK0Ntsgm65jp7pMgEztYiyFG7BgtTyeCS8hypPr8sZzzdH/IE0GmFrcflv1uA/k53eJRuF17VEC0xM4gggFUmFJ6ZBOU5MgI9PqyUc1+jAdIgMd5pRCShvYh4VW8zbVv12F9AVp/9BRRSssHSWcr2n7ZZ07Cd0ZRtROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8i8or4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuiNs9oU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8i8or4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuiNs9oU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55XIq2097092
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OydmWMvSwEcGpcu5miJdLO4jDSYGLCC1cD9
	IDIRDI5Q=; b=e8i8or4e6iFnA/TmP+fuGT4euB6DH/mwBgpEGa/GVtzbhtVOqr3
	B5zhb2W0QvNSp4AdF+9KEtZUhlORGMLVhzLik5slcnLVuW11/Ydrj8sNz6AphkfZ
	6VAeijiZSy5JAYbndkqmS+vkF3murpTV6vHCg0WUvqhfcYgjvfRUHyxWxnP0aDX4
	1d6QUIPD94f6jMTgUWQFjGXpgowyiuMiKPhH6SSFuESacDfIkARx89jnyaXjFZFi
	LHIwwLeM/4Meb8ElhXEUZQR3JIofudRJ4HYfXURuqZP7Hu+OX+gD6NoY6j4TS2Jr
	cg/cxvLGwHDTKGOcG1BuKM36VYLZUx9CR4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxtme8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:11:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1877515a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789891863; x=1790496663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OydmWMvSwEcGpcu5miJdLO4jDSYGLCC1cD9IDIRDI5Q=;
        b=JuiNs9oUT9zZizWJZggoif01PScDPOfpDSCFaMJzAAvJuve9uBYFHxjBE/8DPd+62p
         DJ88La1G9BqTLfVqYOurJkxZDNv6VWvFZMMoGqEJEAsjr4J8G7A17OKOBO4HV6azdW1v
         IdTlgTqo+fQW9NNdzEncYIFG62aJJm4+tMGBazPVFvf1bRy5bcUhlYqDhjhwIMlyiXSu
         S6Og9U+4+GkHvOgQ4o4FtlfBKJGVBfy7foJ3rniTHM/3avaGgLADHZcOsyhxPZKpY7tq
         2QfOE8a4COn2fGtPkurbKCvDbpBQcYKh4NOeJcB4xiNrcGI+IRiOzGJ37IKlvgOBnW2f
         O/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891863; x=1790496663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OydmWMvSwEcGpcu5miJdLO4jDSYGLCC1cD9IDIRDI5Q=;
        b=Z2N86nQle+eCIK3Y5yT1/jM0G7USLbslZpAGw/Ro6NbExnx22CjiTxLSRvFzzuO/mP
         PLK8tFyICPKfw16Jgz+hVZ8BEfT8tRRSgmNJna+jeITikG+rtW2nrRvDBHJpbHx+SJwS
         kpKUyEc45QP7dI0cMP6NrzMsMrGsRStqmaVknD7i1L0RwaOadU/RErxwKcx2Ej+hLHWc
         UyU/B8wZ/6bT5JXvPJa/iLN+jf2F+xtxRBbHsByNKIX8Usu9j/Tj2H4wzKdVmwsKdl3K
         g+3e02Vc9/9twRh/wjzWc/Q+u1oWnkZMnOmIGfr2g2/FjrN7PqnYv8WQs3P0Ewz0mqsr
         Yv0Q==
X-Forwarded-Encrypted: i=1; AKwUvBylT4yJbtJIhdFC/SZhM1OavHGQtJlE+xnCXO3JNjVnhGWr/nPduk/5ho3piqtyEabFAUtRJtGI/1ZAiRg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndR32AZ2b/Gp8uGAx4tHjpQrfaKeHsnsI6RGx1iRI4hVdLga2o
	IGSmmwSrtJhEbc3CeOzylobU3W3k+KQLWOF3GG3WF1ArOMppRzUnNoprv6zObOJ1GTDH5o+kc27
	rPq37WORSQbilAFfIyECXzoX/N/VdYh2o9UWDme/Evh58LbxgUNADaf+Ef2DOtiE3tZ0=
X-Gm-Gg: AYBFou2TYvpccQ5rssNLTaQVtgYhjMYhfuENwJjlg1KgWICeQZUqs5ISo1aMm7KCfHR
	piL8cgtWwWWO29RVVWxMSEZlKTjq86mFwcrJNAh+3czc91Smgpwsx/KYIwxlSaFlA7UhuQG+W+E
	IlZFQSB+sFTOvgkUvkE7ictHtlmwD/My1Z/bfwK40gG/QLBD2YDBSiaOp7W0CNEmI/XgbICocHD
	8HPsvzRoh4CAO/573TIBgXqHO64VBSDY3vokusrbUXLPYOuCP+USeoynwZukeBQKvyh5lDB+D9g
	wIW26oMAmR+VmlhDG5KvMQRzYxreMX+RQ/JXyANgxArSxnFKgE3w9mlxR3K5Wmt/Z4rqimh9tQK
	QcJRlp/7TXYwrJkitzJ1x9yxsFrYvBEu3D1BB65TcZrkTmg25dr7FOeT3Pco=
X-Received: by 2002:a05:6a20:20c3:b0:3d3:ad3c:49a6 with SMTP id adf61e73a8af0-3dd8c51650fmr12136909637.20.1789891863299;
        Sun, 20 Sep 2026 01:11:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:20c3:b0:3d3:ad3c:49a6 with SMTP id adf61e73a8af0-3dd8c51650fmr12136894637.20.1789891862861;
        Sun, 20 Sep 2026 01:11:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a111sm9281268eec.6.2026.09.20.01.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:11:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller nodes
Date: Sun, 20 Sep 2026 16:10:49 +0800
Message-ID: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf9518 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lLTCYSv0VJgAjLIAHVUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExNiBTYWx0ZWRfX2ai3j7jMlZK8
 UyjP8OIIuLXpdh94Uc3GXTnFFQBoJ8ZUX51KAup11kkyX2/Vw/l9nAS3ZtvHW0EpoIFj86Gk7d7
 Jj4zw88iyS6MV3yawmSMDeKV1txPChE=
X-Proofpoint-GUID: _7AfAWw6_rMJ1_wqxH2vh3PbbN8UEPCV
X-Proofpoint-ORIG-GUID: _7AfAWw6_rMJ1_wqxH2vh3PbbN8UEPCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExNiBTYWx0ZWRfX80A8HE0+KcRg
 LsZgc61kAC8f9dJiPMOaWvTuUUMiwqypv750fyJE/uD71YGXhBDiSI6TdUp5sCPJvUq2TCDE1Wt
 RUvyB56EWea/fRH+RJOQUZxuOmc5IaFFpqhT6T/Z5aHvfAqJJU1ghuSx/+BgR7LOcGw5eKSEIbg
 BBn/NqYfbVVVUlSkHqH3GRYEMefoLTYIbqYC2dBEqK2Ydrhbnl8lCuf8ZdIhjyUaTPFaI6b7n4g
 FvZ/zu3oClvcVvqwCeszWzs4Qw7hpjfTMkihso1Jf5ynQ46QM828GJw2yQUi4gSWuwKHt6uRgkD
 m85vsgy4Tos2ys3d92qCwsz7PDs2483Wmj2dPoqAQnuRNwaZwzSGCx5tujD9lzS/U9I78vM+WAk
 qtHQ7JA3uq1Qe3moEuU79DbgHo7fQrATzIXnTaoogtazA+JV1l0ivEX+f6iYOflbiuu2MfUPy2g
 tqsqgtiUOo89/tW8Shg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200116

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the GPU, camera, video, and display clock controller nodes for
the Qualcomm Nord SoC, along with their required dt-bindings includes.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Resend to separate from Nord display DTS series.

Dependencies:
- Nord base DTS: https://lore.kernel.org/all/20260914031412.140856-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 108 ++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e..6dc4c871f41e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+#include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-gpucc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -835,6 +839,17 @@ hscnoc: interconnect@2000000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gpucc: clock-controller@3d90000 {
+		compatible = "qcom,nord-gpucc";
+		reg = <0x0 0x03d90000 0x0 0x9800>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_CLK_SRC>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	hpass_ag_noc: interconnect@5fc0000 {
 		compatible = "qcom,nord-hpass-ag-noc";
 		reg = <0x0  0x05fc0000 0x0 0x37080>;
@@ -877,6 +892,99 @@ nwgcc: clock-controller@8b00000 {
 		#power-domain-cells = <1>;
 	};
 
+	dispcc1: clock-controller@8d00000 {
+		compatible = "qcom,nord-dispcc1";
+		reg = <0x0 0x08d00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_1_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	gpu2cc: clock-controller@9890000 {
+		compatible = "qcom,nord-gpu2cc";
+		reg = <0x0 0x09890000 0x0 0xa000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_CLK_SRC>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	camcc: clock-controller@9ce0000 {
+		compatible = "qcom,nord-camcc";
+		reg = <0x0 0x09ce0000 0x0 0x20000>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		clocks = <&nwgcc NW_GCC_CAMERA_AHB_CLK>,
+			 <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	videocc: clock-controller@aaf0000 {
+		compatible = "qcom,nord-videocc";
+		reg = <0x0 0x0aaf0000 0x0 0x10000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	dispcc0: clock-controller@af00000 {
+		compatible = "qcom,nord-dispcc0";
+		reg = <0x0 0x0af00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_0_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	tcsrcc: clock-controller@f1d9000 {
 		compatible = "qcom,nord-tcsrcc",
 			     "syscon";
-- 
2.43.0

