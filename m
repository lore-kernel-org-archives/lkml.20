Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616169;
	b=5BydjJuLAgdFaqfxP8B7hzhv4ukxV1PJuR3N3M2DFYNwPDl+7YfxcgQAL+RKO5Z/Tjkv
	 GfN3mjDkqQMu8zC1+ssIUlNNUJycsZgZ+oSFw5WQuCJACfyeDXCA/lpW1J0mrmRhwkLDU
	 uMWoiDBjvt5+W0Ft1dmTgGle2fFeRlIDde10W3Xkrma6/zmP/fGE8MWJATZwareDb2Yhg
	 axUkuOpRNwnuOB4aOIRDrkk3mrnithwtLAgBDgPyRrxAkMmg1v+sEsClEGVsgTH4v2hE0
	 DJcj8n65A0Zq6DvdewaJdjxV0rZV0jRFGaVbWLYeg3NwPeM0osj5HtWXFQkySgdY7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
	b=s47FDK9JNXnERnVSjCV9RUyP/bP12+URHwWpa+40ecqk5huIeS4UUZQmXY5x50owEULI
	 tfyvQV9wiyY1TvPMo/RPhvfZ6bmCZS4N10low/42kfIAbhSPqhASmu46rD9VdnrT5F2Ec
	 nXeVRtYnHLeHc9fUF83MfC+wVfWdM19ByPhpUQTaFRHai3/kidrYM+eKLMM0f8LA987Cr
	 agWH31/Yn8HJMO9mkMyhtzqMbBy4isFG6RsVKi39dSFbAYxxCzsec+tB1MuFVraclAQ1d
	 5imqyW8KN8GTeYq1WEcbIp00jacH4Gi3FX0qwYOH7DGyOqZcNp6bkyvqaf7zeZwTnAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD38606A858
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD38606A858
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1632466143
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=; b=cn5HKJchFxnD2Pb3
	abSbABmjYOkN3fOGFff63kYAWGD68+t3hx9kIbyiCSyrHtNkQAmm0RSn0VXCKdi6
	q55s+pVoDqdKMKbmX7YxIn63fcSWLZRPvFZLWtvHkLBFcPhANL7b/G4TaZhTkTuh
	Ukeu5LaJXSGGEOU7lLtnyJ4raYvxyY5fHbBg+aYEtyGFkp1OWlktO40gzKYdQQ85
	9a2WlhR0pFbYsZXth3Z57uoThPwgOdH5A2/u+zIK9jgHSZyvwqCu2tjYOuk5+hAo
	J29UO62luPIJZE/NnTzo3BHjXudEVKzQ4T+Pn+gEeGeIK8HskTmqiLpccbhHuyS0
	8cZPcw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhcn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:47 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so4275787b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616166; x=1794220966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=HuNUEXFIvM0nrdaNNLZwxSR2+KktEwiFpBnFE7jqzvqyjlgxFLAr11EtDqJiFGS62k
         K2y+GYC02cURoRbbBGWL5uolqOuY6AyQwgBRWtBuXaDYQY70vdm+mzGGjGm45gDOkavh
         ycVh77HURppRBhThcCIN3bJIEcDs68QDP53TvrR+r0k8y1vXj2p7s0CwQqKirCUD0Oe1
         FMZd6fbPKg7+B7aGJI39buzUsezfJ263RseYYqHe7jSszazHxlLa1ENtVhdFnkolxxCt
         U+TNqBt0Idl8rbh3IC0EI0gJmHGKmW+UnIB6s27LJ9fzt2hJsLZu6+3hyi4Tz6R9fjuQ
         n/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616166; x=1794220966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=VHnImTeNlGZCvMRD74h9HnEhSk8hVqSRum+9Yb88UIVXWu9W2aUzFBV6WRlSXAnLWe
         Mnj379T8pHluELv9to9C0hYdimERxPWhBqvbAN0xkeunzTGOiQDxR5cC5WYXSKxhUd3/
         Ayb9brgEUyppE9XTkKy+Zs9rk+06ci4gb5tuAUR3GXDLUdTcLVAr746iLGq1isJUWFb0
         lmtlPWHLPQkWfGKckSheZoehsMUgkb4wt+kV6iI9w1fUt0Ju1+e4Jwk5YVsz9pQ3OIOm
         qgQFoy9bKD5I7JFPOfJw7qX84CjlGvCey5NHyB2JO+Rzyxacn5I0jz3/Xn87nugdc55y
         AQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDi9oqotm/vS5uqLOYwGfB2LHksiO9Hwr16lfFNHg2+D+FdgEKEE9QB4jxFmECBsyyZP8hC6UwRQmy9KM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5uoijNUeevyHbcO4x3xPb+k3c7lTwxbhl2gVeAeMKYW3LJaWO
	FVOvG4lZe8cTN7Z+2UK0elvjiIpQuPigJH7loXKtxdQNBmY5EgnXW7ti/o59eDUIVoQkxZJ2FJT
	njQeFY0flytUMyi79s+J20kbDhgDlOXUkG/mAVsPsBguEzjlBmr7YqYqquNOQFu0YtCc=
X-Gm-Gg: AYBFou1K3CTvtmBz2BzztTDakt/gCyjkG1kpk/6uyd54AsIFxKgrUzf5aPqq3zhvB1W
	CIzVm+HARiJCS1ZG1rYy5/J+OWXt2ol0kg9+3oO9Jx1lyDJU0hnpS54C79mQ2SjjgsAaVss7im2
	JXqYjvj4CmxfX4J8HvU3L7inZYNb5YNW/ARbdWvrweQajWscGtV3SrwjPbJFC1p6F9S7SnkhBp2
	I4AbUoOLEgAim6dxm1wNoem8F/nMhYVArpNnEBUBISmEeXWo7wT6HnwOKOJAys/1HL+K+Q2KKtQ
	/Odok7cmFzoIuAx1sBYzfEfR3/kVPogSvF2Y+DAHVxj9y5XZSOndLVPne6D3GIeTEg3iSXCGgAX
	FdGY0Ta06a8C2I7hiRlxuS/FUsuU+1CFcGzdpnw2X3JIty8dJZSpy65MJIsZyCZIpa9Evh7f30X
	dW9XoOOJ1RJn6Tj81i0reI+5tOsUIZBIR1I/cmZi9grXLS47PNl6VLm2U1DrU=
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043870b6e.4.1793616165703;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043848b6e.4.1793616165250;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:44 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:23 -0800
Subject: [PATCH v24 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261102-kaanapali-camss-v24-15-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: FpfIxB6jcrQxzVDLg9Dan_REVO6tRCb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX02kDe8VmVPnd
 68UsfqE+83GmOLypBAQLhUtUrC0pVKpQ2bBI6Miss0GRlpOfCnnLUh/wVWZl7cDdImEzoAIHC1B
 hNphsMBj0ndWbFIl8+ka4pvF0ztvLYXGnon17mZd1KBWR/cJ0U6X0nP4jlpCO7BlAz5naVzapve
 yefy1qwo71b51dWHoCH8khEQMsb10r0pBkK88giiyI6/Sb3JZyMfHn2yg5e6DtzgCi/IYHkGlzW
 +CG2BHubT88esU5pjaazvPYeeYtD0gNimrHU/5OaqWA13zW4ZwDwmeRGPaZYSjoD/Vr8idL0NfI
 s4ICSRJ+bUDRK/TI7ZzM0ewCiQ1ttiZNjZ8j/wBWaXJftBp3C2oWlNK8oyqw3LUj38l/mQlOQyJ
 6Pk8ZSXGKqISx40jMAuuVXUu6pfVJ3HxAnFQmwPbV4+2rC/uxvOPVmdPBR8Y738fALH8C0zGzB2
 cCkUmJOLCQjAu/nmH+g==
X-Proofpoint-GUID: FpfIxB6jcrQxzVDLg9Dan_REVO6tRCb3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX+zi4pw/GpgsY
 j5M0Q+dioZ+i6rxmuzlbTMbRtLKWqs1JvXM4vYFIyL2KJi3k8Q80c9LnYC/Grx2o4RBWSZvfGlu
 dZQG6Vvivzud4XtUdffjoMUMx2KgkRw=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae86927 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

