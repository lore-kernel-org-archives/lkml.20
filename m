Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC14AFE17
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648100; cv=none; b=XJjU8o3Dkj+3BljvnQgR68n/RE/+u9UB/I/8+tsN03UpLQ7bnHJcAyFX5N74/ihfkOpfAIrH/c5jfWcs29ZWPkiR//VPWcJ+IAgLdgXrpe5JlatJDoHRCJVz8oixb8Gj0zxNthyw9PMZREznjBX7iTpb/58Lg4pw0544kEIHaQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648100; c=relaxed/simple;
	bh=olTaIVcPcxSF+UJRn0PedfbY2FR2T/VrbrYs3msL6as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDk402GhZkcgnXeTZH2oDpMfcI2b/IARyzeTro1WqlkmbH5gSuWQABfzw7nzWB5JBbGJTlXoqvE5g2TB68t9YcT7syyxgzthgnHuuv5Jom+RuF+9laF6FfmaBK/uQOutYz/JvDJwAT1hSl+VCveusCI1GxCcbKmjmBeoHN6igg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFW0ikIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0whx9x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFW0ikIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0whx9x8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPkle3710196
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeRubGyRWf68+TZx5tYzkJxFlgm3yd8fS1Sy0YmfLNU=; b=gFW0ikIpREoo3Xsf
	IJbtoVrY/gK5nAQ26cFNEXxDMsVzkehuZI2DJt/fn1MjgDu/Zt0D3wYJbiHBTGx0
	QrKZeReWneipKmOgg0fgguDYt5n6dM0XIHJN9QBVblsanWW/KbfUQaDBT0eVYr8X
	owXvpFDg1O8aS5HHB7RVRwGgtkXKZ78TjTY34Al5OwRkt6iqFjiwTVG/2LjM7HoC
	YKSYnsrmeayo54SkhoDWqMD+NrFsUn+zUBSRDNp+9N1K8UdIsOjx7GTpZwy+8aUj
	K0LF1EE+RLEGqB2rQpX2oIic+vqeOkVBUrOjB0GwlB/lEeR0GcsFMqEUNXG1syTW
	MSuk/g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjh76k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14fed306427so2898577c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648096; x=1792252896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeRubGyRWf68+TZx5tYzkJxFlgm3yd8fS1Sy0YmfLNU=;
        b=E0whx9x8b6Jml7JdbYKamgG1k0KVzDxTrGOV01fP3js1RixPx7cgvCFpMWppV9MU68
         9zbhE6DWbtUT7kh2clp1IbV7wrqLZspDbUAuUxYp4GjqoxPMY48A3NiIyuHzEelmZYa6
         mAJ7h0DyCCrFh9zcDS5R3fwyux0v9reyeDRp7k4r+h1vSi4W4rs4rm4AzNxNNGVmpivR
         wDFr13kNmuOQW7uUNyLGk1/DMjHoROWvf7M66gdJ6lZy1NeaIRKO+ocQVKB9QypdaUKW
         TWDLXQXfQDqbyeTmL1Dz3luSwdLzsy+D1wPeeQBhZTjiDWGH6kUt0SNjJD4KXcoWUojj
         AmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648096; x=1792252896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeRubGyRWf68+TZx5tYzkJxFlgm3yd8fS1Sy0YmfLNU=;
        b=eT6Q9SKD9I7bo6y+J0nNCnDVLflSlYLSnZsMiRdWYOIid2l1FnC8NLB5YlOqh5REbD
         fHawiuPbQKEWHCmYo000YObtv6NRq2sJDXhcH+IR+hQFTxHz2pSG6oMGuhF8qS8Vsn0a
         uRLgRH1/eXaM3LrI5nNJqooke8WxFbxIB4P5G9e/B6A5b49gicT0aMEuo4v5vMcPStZO
         jPfmL9Qj7vCffO7arszb7NpPsu0kfVCbw72rK26QQDrTEeETC9m1x1YM+E1aIIKtgvPj
         fXUVE27xPBC2/dTYCzjU34Fn8FRZX9G816CcEj1aAea/BOrYDg9d1RjxQhnoNYyPcMwF
         tONQ==
X-Forwarded-Encrypted: i=1; AKwUvByQlnQoye/PW1lElZKcEu0o3pbmsOQYco9Kpb6gixp/id99HsdRAfjiVWWFafRmKdo3taYf91xDGU8+38o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIim6sK1nPHBF13IclHFpbprkG9RDHAaA9crKuIHugfSr3oZ5bX
	qCy3H9NHgbsoEkWPxN8KVLS4NKvSP5H5oHkbRGI7bhDUhV1VJOpHg/iFILxGjGiafYtymoP01T0
	A9uKxA6fIcXZ3ifaHpqVUcuvz8U1eYKjNmN7w6IwFwBc3sYnlNnov/IM5Bavn/ciFdzA=
X-Gm-Gg: AYBFou0sB1UIEYzTyhkuIcWsBam21uHIDMf2RARHw7862CKfdB9ayj5tvXK4/ZrMfQb
	PpBhBVZP4bR+kEesjNiG6bLXy/Fip1SpheBgrhKTlpnvI2C4utSbCwS5kwQ6jeOr8nkUy5GYKUQ
	1hdb5VxT3uQ6216w8ga4ZnRUwZUDXVEPPdMHyYIh+l3RzHNUXD0ssbm73CUYIIn7HL+Ms/WerFq
	4rYZQt9xnIfb0s/j+mHYUD7cOftv/z5GQ71Z+DQ01J3BJMLaBFSwA8Pi7h+rZgNNtxDy5Yct5UG
	DJyf4ntL6BJqyZ8ow/HXSTmsd1KqJvt5PBKiFE+Ao3ta5TeSt5DO2IKMm6KZA2MAqshPri6sO9Z
	LfmFLlNDLIz8QQ753ECFQTFloGycN3gYlQtRCRukCDhInv76EiNyIrLjwdfPsV7bJnxZ+GLYv4F
	lZ7vADgg2+tQ==
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr6701374c88.24.1791648096241;
        Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4541:20b0:143:296a:3ed with SMTP id a92af1059eb24-16a5ef2853dmr6701314c88.24.1791648095519;
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:18 -0700
Subject: [PATCH v20 13/13] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-13-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX257fKmlSaptc
 X20BN/0clrQTomyPfw4aw7NtcbBht3LQgG6bxqNg2Ln9kcWbJl59USlGvQoPb+jkF+qLZONwUnc
 n4Yu9TBSUzKIfxlYSGaqv3POR1OFBLB+38OvNOrWox5p7CfBWjQwo3EheP0yLBRCcOab7MePoJv
 9Jc7SMqeAukyIjtYNkqgtbGzikaDMAHtYYdDqXgGneEAIGnFh9jQhlD2jvw2GMrV4WNymb4eqyc
 5u1BthgALKWkQqicjCJACo2KF+fge97xr5oVg3jG/oaQXF1D5aEYPqovwF4q8CLSloDHWQfDlbq
 s/rzTv/CR97MfzJhl1CDQSjRiUMtATunlnSQ4jD0zRoIk6FIb7u9hBuXGuYPNE0qERiIh6HPlfi
 Nud/OK2UmpQpvYBHOEGWfZdR40314K6GGNA+PrxQdV8omkewky7TW2HEXT0taPdEQI0nczcjd2r
 2MVF8y6+4kI+Y8Lo63Q==
X-Proofpoint-ORIG-GUID: w14CvBwOGVmndTQ22FsUwxmoUvA33qsO
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6aca6161 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: w14CvBwOGVmndTQ22FsUwxmoUvA33qsO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX95fV0tdOz1iL
 zLYfClV8xBlTshx2yxmXnwdum2DQ8E9FClOPOI16yGnPVwGWaGnTC+C6O6nGVAAB0hwib1XxXVO
 36CkjOWSrg/EcDbI/Z2+4PMnAB1VunA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100063

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 78 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 90 insertions(+)

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
index 000000000000..7b574e2ed373
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,78 @@
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

