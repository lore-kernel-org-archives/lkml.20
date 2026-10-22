Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662801;
	b=e7wufsuemnpcVOUgcOFJpJKg/1qEJ5miGCi6BNUgVvSQ+rgSZWCyvL1Qzy8Jr6DLNOaG
	 GkaKTm0iFedp0vUGBlgKLb/mOjwY7opT3MgMImHNqwkozxZ/YwYpAJAWJeJ7XGvY/UklC
	 zkl8PJZ+Awry2/h5hmWsc7mLytQtAM/JGx9jPph2Xnz2T9p+fi4qEKw0ycqjDFqpLYH5p
	 gtCTHGxB6XLZKIBKU1fyHlLYyVEe7xY2F4J+meJb1c24ehKRRn/4Ma7ks56ShExxNvUrx
	 H9iYu42HUKWqpqOZyIz4TwikD+YKQ62qU/jjKTXdpE6hnUa6YWk9rp90ROrPr1q141g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=prQr/G7jAmWg2TrFoI2eyPO/q5JOANgC6w4svDt10+Q=;
	b=sWlnDRh6HJyYuTcq2ix2E+nEykJn3A2Ygl96YBfcWl+HcJLaSiXkr1yQ0JCIOcrFGNGr
	 XFVfgZpFvo0T/ZR74Oj4omR8xMwTykmG3UBwosW0fH5czCDfdILfdMntMkDnn5H/7oRGU
	 GYMOtzxfQvgsbQCzdAsaxne5QX5hpdMbmxOXr0yhxZB1ooKmZs+nKr7Yu67TccqMSnjzS
	 +ktcOXBYKnn+ASXATufC19pnLXtMgsKkyw4nHLBPSLb848jn0NVN8lI3LA3PzfIrQA2Qf
	 8Pw1ViiRjZuQQIunyIrg5cOHfw3o7n3AanWK03QM5jdMGtjvv2xIcP/6M0VtRMrEVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T47jvW2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B97606A31D;
	Thu, 22 Oct 2026 09:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B97606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T47jvW2L
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnMc3194723;
	Thu, 22 Oct 2026 09:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=prQr/G7jAmW
	g2TrFoI2eyPO/q5JOANgC6w4svDt10+Q=; b=T47jvW2LsAphvSXOCwfiTjwwCY0
	qIZUGANudNAXaJxmOe0YP+86YJmIBJ5NJMBTkE5Yn5qwUcd6SoVQw7F7JdptLnhi
	a1xuhJWUGY154FuYH/wHV9NVzwbl0YXU82vc409mMwcvqlH67CYL4+GnLEtoxLcS
	r8+Kuu8TLQaG3GoypQtI0WWP89TvQD3o3i2nJpSX/Wh6RjLkIU262uXg1HXppT3q
	C+FMtg7dGj00lXxYfkqYFBw6AGuulUtjuK+jZ3hdPu2WUNGANshssLkpl5pbiwI7
	HTaa1zb4YBbnIdJJTT0W7I5SPdnSTqEGGzYakcfwuT0geLOvviIA4X2Iv8Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0dnn-22
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:53:13 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9hYe82064240;
	Thu, 22 Oct 2026 09:43:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9hZQp2064252
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id E78EC655; Thu, 22 Oct 2026 15:13:34 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI audio overlay
Date: Thu, 22 Oct 2026 15:13:10 +0530
Message-Id: <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: XwYX0ylcCrd0oJNRA5CDeVgtfJO5nl_P
X-Proofpoint-ORIG-GUID: XwYX0ylcCrd0oJNRA5CDeVgtfJO5nl_P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX9vaekzc+mAWZ
 e+9r0efOkiRGPXLLiWL8JGXsxT1p8Prs8/imOVtXPc/3U013cKef6K/A9inL4qimeT+1zPgQMj3
 vMPwuQHPSCAocPq0t1kV3QexUi098ok=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dd09 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ttgH6qQV0czHaN5LAcgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX44oHTk2UACdA
 xFZOhQBXJlL7FPA/zSR9FKOReK/ztTHKKDj+X3+DukZVADd4+V2oyfZi9XuzoN3ptnldEjjzxDt
 oXqNX7UAV0v7GjOWkSnxWGRawIVdI/OhNZ4Roq2aCghTsKX7nzL12B1DY4u1McfD4oFGu2hVIZe
 uJln/cAhhnp39aKPtooogemBdffk8jFQZNYayZuJ0psSrXuxwrDBAzGQfky6L8sdV6TOX1RNUog
 2KdhJKaFxxyWnGtww4wBEPpLWH+ifkwmIDw2ilw8DAyj+QFUx5FWrIlpbvQJ9nl4F/9/0Q8O4fz
 O2k2FcSMkVXPQS5uJqdRNR9jRmkbOoZS90fco6LgdpT+RHxOlTj877Q1D2YjBZ3L4Rftqu2KuUj
 fDf1Q7kj+Vf8lNesFdWVDuu8uhgFTeKv+dbjUvZzdbRx0660rcSHsdWYPm2OduI/fpFS+DMmMSh
 6k1lzlu4WDnQKcq+WpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Add a device tree overlay for Shikra IQS EVK boards that use the
LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.

The overlay reconfigures the sound card compatible to
qcom,shikra-iqs-lt9611uxd-sndcard, overrides the primary I2S playback
codec to LT9611UXD, disables the capture DAI link, and disables the
MAX98091 codec node.

Add a node label to the sound node in shikra-iqs-evk.dts to allow the
overlay to reference it, and wire up the new composite DTB in the
Makefile.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
 .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..127c5c345eff 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-lt9611uxd-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 69b0c34ec9c4..b920c96aba14 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,shikra-iqs-sndcard";
 		model = "shikra-iqs-evk";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
new file mode 100644
index 000000000000..e308552e9206
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
+
+&lt9611uxd {
+	#sound-dai-cells = <1>;
+};
+
+&sound {
+	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
+	model = "shikra-iqs-lt9611uxd-evk";
+	audio-routing = "VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb";
+
+	pri-i2s-playback-dai-link {
+		codec {
+			sound-dai = <&lt9611uxd 0>;
+		};
+	};
+
+	pri-i2s-capture-dai-link {
+		status = "disabled";
+	};
+};
+
+&max98091 {
+	status = "disabled";
+};
-- 
2.34.1

