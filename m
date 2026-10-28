Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200901;
	b=3o5LMtpiDQ/ugS2XW/sseykZu5ASD4HOrkWo1qPTQOagMPUkjh5fhbg6brMElHGg/YD8
	 N990+6y/jONwfHU7ElDhL+WyS0sLctYl8IxzJo+B2lejFNkslL2fR2wFwZY0dMQDnIaQi
	 rOhw7jEOZ17RIKODR6mYdIOHI6WLPLEr9CmRgp87njBuK99Sfn9Tctb25nKm9P1b6sfaB
	 MNi3Iild8Su8Rs2aM2QQLWp5flREK3tVx2SGyT3Tfhr+IxbyiA3Btgp/TGADpKHT9o8vr
	 qPo8izZlbqsQr2BlNSvBbgNwCQO6yuTf2GJuVYAkK63oxt0Lj/jwuLuCVU1gOrDeTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=qYRan1dZL1mXVpfh+R3CzZHGI6WsWHeTc6+RwakjkrVgv3N3RbvppPfQmTg/2t7fo1Wn
	 9wcurzgscw9o1bNlwNgpl5HcR3OgK0/BRT3KOWqlWvSLWSqoEcVQw2uLumQl6boBJrgpn
	 p1ckaPTFrl22gEW7RjqQy8ZvkSq0CgbIfUe+q6lBbWCL82oZCMe4GSqkdoVgxPfbEFdYV
	 JAsFVFR3BbcdENKJk1IQ8x7jiIU22+8dR3C5AhklBw4rcrl0S4B1Iq8rOgH2E1fV/sM3H
	 /qO1goOUA8kAvwxOAjMTLHCT9KdII1hTv9S3jlLtrbmq07lji/8x3H2hu95aCROaeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFAcekdb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VqqxQPM7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF1460A262A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF1460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFAcekdb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VqqxQPM7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAWbV2569710
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=pFAcekdbJO0/E/fi
	vzeG2CEw5DMHakRWk+rWkpUZPeNOYmRoT4IyvxAu+bz/iKOlC8g2Mt9NXP/a3QPm
	Kw6iNpJcpn6s9v6bx8AgRSpg3DCEV35BZ2bfFvNWvWxVTojBnypLPMZqpuZ1bCw6
	4ZrJhU3ljGCzKXqFLmDrrjou3b+W9B6iEs2GblD5dfkohGVgccRKxxRZS5aOxF1W
	t2IAPbGfHwfON5rPh7+9uowdz1R7kDe5aCLeV2bn4KqvMzzZOFpWFKPE4l6cGl0H
	8wpOaVcrA7uwxdK3wD3MMCQb2haXXXRBxWZGvQZYBFgLND7AtS3egPQrt78CMLkx
	Ew5MvQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv8pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f2615dd0so1683641d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200899; x=1793805699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=VqqxQPM7IG4SU7iuamMFOaoHC5iH8P4cU14RyNViVlms04L4wEKCvcyGRdylCnF0BM
         F31fCYH9DzS+WTrb+0L/96Ap8UIJeT2eL6srTlklRCnZ9kQxv/QUWYvZGl39zYaa5V+m
         LHgyJkf35did3yqNSuGie49ibmgru8nOirjUMV1aBww1o6izvNTvYKJpbdCnWgYhR+4t
         qfeZd7p926E7czr1COVyNkPM7X4Rng+h6hgpSzjMpLn4L2dNMfZXlqsMU0Ej4//J4PtO
         lv8KEzY0QyE9Fsok1dTMhe8/RvwUOogWPYUtbYczWxtuwEbGz6VLdPETbdoDNV8oGHWj
         DjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200899; x=1793805699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=EdL8vxAj/j5XsGBGnAQ0MC9B69Rd53MF8eG+MXocJ8Td3osNYytk7uKe+Ri67+NYr+
         Kq+GRYo7bTv/xcoI58HZHw7UC/57tzftPKVrjyRkxTvq4GB5iYd88pjhKlJvL/h+gdyl
         FrpTE+770fTKTX8GtEoBIBqXXz3tCB01MHwnmJACyAH9t3Ecw1Rg01i1j5aNhDGBY9b+
         UH4P/u0z6VucLs1TUk7g+LwAs62UGGrH5MAODNLI8Dky7hNukRyoXrRptZYfm3NJDMvY
         onfZKAvZ2oWcwF2gmMqPVcrhAMHyhKsVp6gY0NRvZ071Y2serrV+Fjj4hI3/zLSPUknl
         zEIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcOB8sMxvFhqO5KIP3mKCxKWP9cboeaUmUN19OCjqS17vf95u3//H+izZwuoZKra3C4wjyqZm8mP4dQfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAQRceCgoL8vRp3/xVomRHONetjygK4rixDzFlKa5tnDmJp8rR
	6C3tID0v/zHDhCZ27LVjNVAVt7UzvXdr3G3532/J8WLbtJbTRodM2BGyOMYDflW0c7lw7FJWqL+
	Ory4w5rx5Y/BOATShctwK0ayGjOUnmb8sZMD/P+UHWNmuYW1cyURwugxjkG1sT7SP5KM=
X-Gm-Gg: AYBFou0bpXyEoDHfzd0KtbEOCJ/idwwSaoJk/H7rfcWWpCCPwKS/uU9Ue5div/Dw5TL
	/koeKtl9BADEpPVhpiOKgyKw2TBVTTFXhr/AUTjz9OFNwQFO35/THxiViCzH8tJSC0PnoMY0bns
	cTZ1tdQNdsHa43ooKyEDAuzKBlmRrYTvegIaYIzbQlqjs18rjhv6f6nm9GUnVa9XAzEy+P2RqjZ
	0Zrpg7+rWB6ZYGHwFXOKlu4QK0ZelFu4XK5W7iI0cJHCWAbWQSWVXrzY2LLnzJL6PZomtfvb85C
	ILuij6uKO0oydyrcLase+3+s+GeJCFFo83Mh1HuWyrfoS6oS341TEU5E9KDIXhx3KNjyl7zApaF
	alL9FRcTEaiSrxA4URSDyKrtezbZDO5hLTYaCmyWg06nv1piyXYFGxWGrR/nzv1TJLbrgpN8avp
	Z4XQsFl4hQQ3usUUJAPCq0tagiMFyFUoOkiKxViePegdTKfjbh+/76gduhclvO
X-Received: by 2002:a53:c78c:0:b0:672:a678:da59 with SMTP id 956f58d0204a3-67a7bf245d2mr1555989d50.108.1793200898932;
        Wed, 28 Oct 2026 08:21:38 -0700 (PDT)
X-Received: by 2002:a53:c78c:0:b0:672:a678:da59 with SMTP id 956f58d0204a3-67a7bf245d2mr1555956d50.108.1793200898271;
        Wed, 28 Oct 2026 08:21:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:49 -0700
Subject: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xvpX1OEPlb0KU7l1CctRSLLa3XNa-X4n
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae21304 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX49vo+3TCnb4j
 rPGKsYbhMPqxdcVfGs1ue9hWRLWwr7fI9pD8dIseSR0GQ+uBEnJwrxrf09gefmRjJ2x1tUJCyut
 wUI8rRpHHN5J6GxCNqCVO6veGCUJ+ncGKMd8jzZqW7A/0ClbdEl+rQnhmeOPlseD1gI729p/GLL
 9x2xrWn8YckdZ6TXcZ8lr3ahbOilEXC6JJ24QYT9Bnkij2+3fTjs++TRtYWLY/zHm0vkaXqqesp
 IDAaZuZ5ehmo5x41Dl2jgCMywhFvYv9jlqlL1Jzc2447cn3hQZaSSAaEas54eC8xXsTotpwbZ+v
 d5Z62lsxJalqHT+NLELWeIjKNLVV15olJls+hhEKLkXBv87fd1QNAgPh5+wv0DTdRmIqHEDquKw
 Orjm7FZcvAmDYg8onJWXgcdMAQ3Ymk4eHcSx/JLzO3QEGWW3rYfBh/lFMhzDFHOBe7zBM3QGTS7
 RQEFBf+ieIySYUmXJbA==
X-Proofpoint-GUID: xvpX1OEPlb0KU7l1CctRSLLa3XNa-X4n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwj+9l5WVzdOE
 ehrvTUS1zfvVGW3zczJ5WzLnBXfG+iTE4ZAbZZ2lTmsRpVrgl0wVPo2SVJUAWGAlmqsKilTm17L
 +VJkF9Mu+Q8TWti4/LwbIKKM1gDNceM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

