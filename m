Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501739;
	b=H30W07mkAZTC1uo+Z1W8FGijn6sBpqXT2pePEAsu6aV9jW4/UacXubYdYQF7voQhgtIy
	 Gv7gRX2ci7uxzSfBD5wyGHyXUm1elfD/+NaJSSs6BFbNHK11t1Sya7IP0+WHRSCdX2zmD
	 3r3CAEJyP/wejKuMR4OYp9YBS8wfk3juuRhj1UrMTGBRIgPJUXlVOly/v/zBGQLdfR/gx
	 8NW5uJqKUlYhmeG/6wq34EjCA+X94Ke6gqqdacRYEDvXbNaZKoEjs8nHZTTvyaHKZTBbI
	 Re895VrWMei62ajtt9cze/TXmVmGrwgpuc6WoICLz4AxQce8e/CP2TLaaNMiL0lYkgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1PfjqpynO03WIyvXgW/PiCt6nsrGlIflwxgquLztZJs=;
	b=Km7dxmeeoj9O6dtgIgqkTn1IIy9fuA3EkxnQCcdt1LryL+qDZ8G+zKtxniJBoVbCXLJz
	 Kepm5BvfFAxHQnoC/sIbjhQ7og2F6Yj/r7+GmHPhENya14cB3eSXiAKHfzq9Z+oUPRZ2S
	 NEn//2ESaUl8YfogvR7JZrsPZFxFPstZFAgCqlTNkxvY7oYSGm72Oc5qIwrn/x6up9uzl
	 6cb/MQGxXkGULOTWz2WWyKJG7fLiff5zu8F5Z/yAVZFtxqiT9Nk3COypKL1UEd8LV4azH
	 t/PQ8/n5AzEXSRC59zbev84F7o1tSJsy0ZCoWSsdP8qW7Tt2JvJe+/vFN6ePrdHeC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TKqulvSd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E3D606A319;
	Tue, 20 Oct 2026 13:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E3D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TKqulvSd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCs6W62262569;
	Tue, 20 Oct 2026 13:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1PfjqpynO03WIyvXgW/PiCt6nsrGlIflwxg
	quLztZJs=; b=TKqulvSdAxxA71Rn0W5EYTJ+0Jlz196FhwU+XFeiciVZVPN3iVM
	KDVaYPqJ8e9wfayklQ082TjiFjH/AY/w7QoLqecX+PfGoz4jkY/AFf027AhQ0mMM
	iwILoRAnGhUEWAfh1Cq1andZIbGbapmhkdEnVZBj+O/bMG+rDlY590NHfmNar+Jb
	kdVnDC78bXgzfsWqSNS4dCjuJNEz9EaQlMl8r7Q3FGLauaETLSxM2Dm/HPuEv8w0
	oChV91cCcz1aCC3OqWDzenwd+X5YwV5qpUkFlTD45tiyzqFjyM3mk+gZrypn4BGa
	yEOkbAqreqdY+Nl/dujzOJthpeybuAd6Few==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjkgr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 13:08:56 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD8rRP2007818;
	Tue, 20 Oct 2026 13:08:53 GMT
Received: from bt-iot-sh04-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 69KD8qqW2007806;
	Tue, 20 Oct 2026 13:08:53 +0000 (GMT)
From: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to wcn3988-pmu nodes
Date: Tue, 20 Oct 2026 21:08:52 +0800
Message-ID: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad767e8 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=AAjP_CEppu18DpECG8EA:9
X-Proofpoint-ORIG-GUID: EkbyV0N_8s8TUHgTEv4edJd8lldKxHF9
X-Proofpoint-GUID: EkbyV0N_8s8TUHgTEv4edJd8lldKxHF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXzVg17ef3REkk
 JJdzcoyYBVKMzYP13Ujz8Q93FmFKktJfwA/ZqZArwPxUQJEdkPQsArMalPjZ1MfQkc9QJWMyUDW
 TBnbwk52Toja+QA59atuBROFbCdsJbY/Wz3OdCzRslelZw2pzVKpJyVUgZIElst6OD7RJtsnK6F
 /jcYp1S88v28bmjlVvX4/XvGWfzjGJM8QDiddrFobV7p7sLgkw6A9gEVBawYN9wKJqXXWIrN77K
 w6w4brSDwrkIGIpUVztHJziETWkMltbhbdjZjK63cIryCH0oYowLG7G1afWGUiOgwBeCFrkHonG
 CXnZphZh9sCm/enYiscC5OSAtG3N+l0K8YiNDGF7iaOUr/HgVRCRQdMAdCuDOoffdxToh2m9+Ah
 9DIKi6HYXlfUlOwoXxPp6ZcXX6bMvbG5IP4ZHojn5B/uNoxHPVWpSV/U6mgocgl/M/iDxxthVb7
 Pstl5w0U4V+lXdGgEig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX4r/0CDmVw+0P
 P03s5U1wmsXFV6BiqtE7ZPrJ0v+8wuwmpjETAkDsquVfuRpJ8aInC9vScenmbLimBnDPOyP2x7Z
 keHC/dN1l81wLE/mKzNvrDWUwVZdctk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
to come up.

Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.

Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index b2747c765755..d442a19d7557 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
@@ -157,6 +158,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 093032527eb2..48729fd44186 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
@@ -85,6 +86,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0

