Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567334;
	b=BEn/XqGHx6/Vk9NuNMqWIke1602410CxTeaeCnPypvwnBHZNh848FgijeXMDtMSKVeFc
	 wsZ8ccrF+NaSLBoO0BCnK3ndZfRChyqq5acBeA92EuL5bF8x/Q283E8hIdgWrDJOvcdyy
	 k29cqUhXQOWdS+O3ylKfaZ/rCt94SButDRQ5WgI4PqmZPhNrnt7z2ogw+YAWVsqwnk+Yw
	 wjeTbt+EGRyQ6e0pfAgPoiij6SK4ueb7HkVfvW6XnF8WIg/75fqjx/ljJNfiQKvpm1ISX
	 f4K0ZfcU3xggf4/2jtQ1rzM4mpRxTzA/G9f/XM1nZ5RXjwdDEU4wCEogk+2UqJSt7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0LajcSDcSDnUBz0TY9mR1whL0ggreYGeeuB6GwKwmU0=;
	b=epL7Jval6ZavkvnFBnNEM5N7JwTxuZrzXH5yOYC7PY0sGvw4CM/HNV4SpwJrXIkeaNfy
	 0gMwodaja9jxM1U0Nltt9kz1Ap/Ezmrjdk4ut3jdFCrdS0gfQSjDP6eMNNCxZPXt6+Jj1
	 InxDtQhtpYCvs+aQ9MUkwN7NyoUdryl4mkZRpJ2ktIcyV8RRdSIaHzMFpxmqGSkN81eNf
	 mePJYIsfgJuWvNhxTYxZOWboXCEakCucmq7SLN7jh026s1oXFvKR08kb6faZUGVB6AE1E
	 p/1nuhX8vr7uKqUaIxToLzCXe1FSzWaty/3QZgDzsoGlK1sWNfrpPuKqa6orTFzXeNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHq8C2ua;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57A60A2638;
	Fri, 13 Nov 2026 10:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E57A60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHq8C2ua
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VHCv3653112;
	Fri, 13 Nov 2026 10:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LajcSDcSDnUBz0TY9mR1whL0ggreYGeeuB6GwKwmU0=; b=OHq8C2uaeIb+Ygtm
	JcOZ5FASdUP+3iZmld39dqEIXVvvK2yGJX+FG4y/WYuuUHWIcKM5g0+xuvnA9IcC
	DbR9Ytjor+VG6tUE9UikUKwb77bAVdvrhajdWEaabSpxXR8AAx1V12N6lIlxlx6m
	80Nu2NTsphyb0hzL+Ai/r5bR4b++xBCRwPQQFr/Ze7k8yHl+7M/VmesU1skbJ6FN
	AtAPBgr/GlYYryTwsv/tgoxRmz7wHpAnP7zv7q+2bhaoPPMd4WvNdAtfT2Zj0yPP
	X6DYZh4RM9wuvoxpE/fCxHMRufgjjQgYe9QwGYMipHiiolJPrtKEmMRd5h/mXiFJ
	9egE7A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwan1c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:25 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtNCE2811648;
	Fri, 13 Nov 2026 10:55:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6ADAtMi92811621
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:23 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id C859BA70; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:25:14 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: lemans-draco-evk: Add hdmi-dual-dsi
 overlay
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-draco-evk-display-v1-2-28a19c6aea87@oss.qualcomm.com>
References: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
In-Reply-To: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=2392;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=OdTlCGfmZZQFFqzpLLNjnNooTH0Zp/+2bRhNb/9eEbM=;
 b=uVBKcB+eXsAJZPkK9QJeMW4m7ZujovCgKA3EazNtkysUN0Ry+2Z+9K2ADVYPzFW+9xkpV8mew
 UzcyumhBlP7AA4yjGXa3v1yewvVw0Q684VEflsHjMSnNw2eLuRCOF3n
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6ec9d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=70My5vc_s_PNq7TzDvwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tnEjY7DMXDnPbxS2yDwvThfNiMeWJuhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfXxPrFEh/Qy5rC
 wJqp31oJf0sgVJgahyBzPHGVmys/XAXz4UMOaFa/JYOwcGOk2OHtZXhC82zf1vDO1B67U6QGlDI
 T00hG3GCi8plyFgN+ANvg8Zap7jrIk2a7g6jwsyFM8F9IDNmwfxl6lB4/fke17m/MRmpKzLdc6w
 HmQYMeQQxwa0igBE0mI76EY9fmQ7/hliYNCwBI/cFikGUg3M9wYPTNENXGgkNL/PU8RNCOFXWK0
 jV6a1DblsmTDbDutfvmK9lustbRToXR0YhMAY+w9ZfnpcDx0McJxkWt8o25Km0IIRA/Eoer1xyC
 D6TaDqf+9TEcKLNOBn0Y7e0Rbu0kyQkt/Fg7ad4CjJelRf/87C2HwAb+tqPBWLmGGkOyG2a2Oi9
 BhQvWkCOCnnL2wWqjsIwNVUR4kHKfMJODPr2/a+pmw34rbwrO+Edl7xa+x1bTwGpUgJwQmoMYXp
 VlvlVgS0hbRGApNa0mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfX2FNcLSwcx7Xi
 Z/QZJi4RHIjZmH+R+j4H+JvXr2tRe7fFq8Yb51sdV/OqoX96WkPfkllz5AQwktdUj2CNlVY7XK2
 Xk3wgFbmtOgg5iUHWoyEKkw/loyScmM=
X-Proofpoint-GUID: tnEjY7DMXDnPbxS2yDwvThfNiMeWJuhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130043

Enables dual-DSI mode for the LT9611UXD HDMI bridge on top of the
single-DSI base DT.

Enables DSI1 with dual-DSI clock parents and power supplies, and
reconnects the LT9611UXD bridge port@1 to mdss0_dsi1_out. DIP Switch
SW2.5 need to be ON for this to work.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 +++
 .../dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso   | 38 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 23fd910b2c95..3262604ffb05 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk.dtb
+
+lemans-draco-evk-hdmi-dual-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-hdmi-dual-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso
new file mode 100644
index 000000000000..ea72bfcd8224
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-hdmi-dual-dsi.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+
+&mdss0_dsi0 {
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+};
+
+&mdss0_dsi1 {
+	assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+					<&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+	qcom,dual-dsi-mode;
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi1_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in1>;
+};
+
+&mdss0_dsi1_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&hdmi_bridge_in1 {
+	remote-endpoint = <&mdss0_dsi1_out>;
+};

-- 
2.34.1

