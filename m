Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898261;
	b=uhEugguYgVc1KrZ0P6w5My6m1K2W2GSHG9vt6EdoTqiEK65jb0LckNaF26uscoEwJNcC
	 NOusQ6bVpIbGIVQcNrcpfYVKddCsbpj4SjVAGQAybyEPXthEIr9kML3vcx93jiEwyGaek
	 O2ctIaU9gdibHTFnN/8GmbdHUKKTQcSlVjp4oANUiTXJ1v656IuUP5N1sdM+9W19zjiZK
	 bKI/dwFzrVcdwplED0Sh2+THGy5B97iK9ZZnrylgN2IfvY01LBmzSVCcTcpjibk1UYOgW
	 tQ3xxK486eg5Vc98tULKy2l2M5sAn6tacchACFMcNd3qm+tOv/kmi4paIWqbFk3Q55Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=LXT1k8jAslVKFDZ2RgMxN1h69lGYIk9f6OfEe4vviFPwFnxqiLFGAJ9BDoOU/bBSYRcv
	 261b2izgroMUgJycbBfWsJSgTa2A5gd6fb9v3IWf9KHwRLtZBn6tidBQUIrFTDXmQuSkX
	 7yX3jgBJbQN/iRhFyCFqKem9SkPYguzh3l5iJRXjxHSbPaNCoBH+AuPI6X7uRciVT116V
	 5OegNankh2vqLcJ+wJwcFdGhB+38jBRivVS8C3LcWS5+ikWcP/Tp+Va+yd7d5DdxxYRf0
	 a7/rwO60tnbo1v52g1rF4qH0LOpqo5P94RE+wJyrHq/O2fNZoKuTK+2azChP3odMjcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E3606B516
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862E3606B516
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16XYm4172766
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=Gqf5Wgt7FLstbzJC
	lki7X6yL4yu9ukVAl6Y42L6ZfGb0Gw41DEKwlOe5obCT/uvG2fWHSAzSAZN/AFZr
	Zj+F8+1fLxasf9qPF3OUAndrVjl90mQx6ivyFaoBQbPWEYNNca5NQrKMhSPWk4vQ
	xSFuhzu0vR2Z/gIJlL9RuGstdEbVusKLN7nw8NxLIUymaqgQDBTepNNhZe5VNjf7
	DRhVpI3ZzLy+BV8wQKiWj8rFfLIzBstTk1yI2nPckvarCnPf/a/VkDGuDCQGPMgI
	38qx4l7cNZi9K77XL0uCaARoF5KoTh9AqSoIm/OaflfyJ1kPTFi1rZcB2tzizg3x
	4+rzGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so10033671eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898260; x=1793503060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=BLghFkbn5hI0lL/YdwEGP/qC5FE+4IkAk29jj2DWTcl0EI+SyEz06i3LJTAWdflSzP
         NjdYfiQuEzOxqUf0bsICopeZajM3FySO2Wi7wcJKSMjswq32ML6y+haUUhI3aiKy+7aT
         UCl6tihGMgb3L081h++Js7kWFbzYlfEcImaC2qhhiBplZfmr8c9xx7lf7WLIJVrkmlSo
         yZttia/B6Y2yQIyhItQCKO6uWgoSVaz9xo+h7yHydmQry4+vnAFL9jtk2OB+PwKfbuNJ
         6GeOOSuCImQogngBtjqntsfq0wLGQC12GL6ChQ2iYTQiAu7XF04H1m1957wFnAloVvr4
         CVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898260; x=1793503060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=f9aUC27ET92YQHnATq/d9Z5fEZN/AuWQM87uoOhpx4CtcoYL5KXKa7dpJMuCFEEf0d
         +hVpdE44Z5ib1ZOzSSd8eUoe4/vW48P9Th/ZfTQnTT0vOqKgLXwRSeiDfRwbx4uEDPIf
         j1V2xt15OQCnMk9UWUanN+9NcIf3h4NqbItwaqPlatqukwTOAT86JOrjYNEQi1dr3fnZ
         XxhcU4I6SePqQvGHAUpZnXif+F6i7MeZD01u+vpiLYrgDBber3L/FLqmtrrIq1Gh07Yj
         r3D/HF+klG3OFi/rMP0Hgq8jkxwL0oSRcjc0uLV/gHPVjfdUmdJjjxKLG6OcQT4FD+KD
         opcA==
X-Forwarded-Encrypted: i=1; AKwUvBzEkN3KYZMAjmyvCnb8an70TB4eb1PvSt6pjyRF9kYYc3JgxEdVB5cBva340oTWBJlZMX+x7ZFQC06Dp1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKycmvgs6iBOXW2eT0ls0G/TKBaOKoGd3U6OVCIv2MIcvy1O6qi
	2KE0TPUU3wQrXz6tjFnbiJ67nR9EMoeqq99iefETT4MQPe/kXCrfbuOnRKxYTpDAsL2ijZuGtnO
	0v0Rr5Tqe/MqNzQlQPqqkymTFGbnTm4r26wSpyScPn9M5OmZVFDMXmsydj5+5kEyCX/c=
X-Gm-Gg: AYBFou3LnZxEXoJMcWA2L+T08iurjCd5jmD7N5TmS1G2A9RqXlkajPjjB5EyRuEQUUC
	+SsbrzhvHUK2bdbOXTVo9v0kYf7wawufrwbN2U6tjN/qPIy2RBbezdeMsxPUZqavfx/wta6z9xH
	wlicRxrWWJ0jfSWl343DB8ILjbXL90QhsT72DfgRtz9urz/xpT/q2qvIvAnu2u0c9x+gtLL3P/+
	oIQKtt7GaVQmQ9rXbL6wVmVp5mnxriEJQtOSMkoh860cZqzQoPa9suQgIrjVKmiZJsMOcTkektA
	nZs+otoEVbMMDjoVKMVt8q3bFUVbkZBxMkrKvALFclALidS09BzVrQP1LfBFC6KQMTxAhnmLnLV
	ZI3dT6OGZUaCPbkzQ78gTchW/N3hT61Kx2N2jH8ecxeyGdzXePBXzvXd2UkOhXiTruA8vR2Bu0d
	u8dSaOMpl0uw==
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202335eec.24.1792898260096;
        Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202289eec.24.1792898259504;
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:33 -0700
Subject: [PATCH v22 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261024-kaanapali-camss-v22-14-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXwJlwiZfJRkKA
 nJLxAm/OdiQtpsRRO0ixQax5rKTaPsPDWtGOztWyo14cwZ1q1AsZ5LvIcJe5GKFaFxPMC8pzsgn
 yD76kXzXTfMb8sfJQzXGoE2Eo+Vcazs=
X-Proofpoint-GUID: BNAOMdeBi6o5rxNQgpzUfswolJAdmPu9
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74d4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX7Z3TvmfArZPC
 CRN1eYSTKYWfFwnge28toaqYEm99h6Ah72YuwazvofONZaU3eR8VpMDCApaEdOACmEvrn3fVV/x
 zQcztVm2q4y4Xwifci6DZ63czgmgvKAWNjUdvgheS+RXoreZvImBanQGFIOyw8vpjJDkfJhu1hR
 n1G9oM4eWZ12UttAdHUDd24NdXdq8xhQK7QGKas/qQGFp/VYlxZbWMQdaD4nVAXILJYwpcRDiMH
 KkkBKmJdYEdoPyw4raKS+vtQcNd1HJpAxuIgJ1zuLfFUoBI5lqvs4rT9pdtkM+VnvFIspELclsv
 1GVlgTVkDJFoGSq8cVE5ReTljN6GYxg2vicQ8g9TGoiZucIgZ7dvITbAQrXhOi4X79/o2dhL0B5
 3afo2fuMf0rHJVIpIrZRvSzYPOOmbLcwU8bgaAgexcP3u/UtQYamM/OEHowB4QQGTzpYY2DU0rV
 gwZjGmzrbhx6wOQK3uA==
X-Proofpoint-ORIG-GUID: BNAOMdeBi6o5rxNQgpzUfswolJAdmPu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

