Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C90400E0D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762861; cv=none; b=Qgm0XOPcUQAYbWq3+OaMtw4dOlIjkLbASPQZ5tCWP4Iu4TZ7xQsIt+ouDScT/ZiE8axuuB0GmmKo3WDRDEmsQK91i0/Eky83k2UgVYGeCHMpzTLR2CaqqgArdXtWbn9igorOICFB/s7w/gfNw8knYl/RKZj+8bnoX/LsQXnSk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762861; c=relaxed/simple;
	bh=sTcoJe5DoruJGaJbA+mDYOnpK2K4WQXqyShMTozDpQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TkEnJCiJrYZeBN8M6F/oRC3xQeK52Qi5gz+9YKof0YHUgIy4epq4j2xtjdIlHzI1ai5yEnpx3VU/g/mloAti02PbXCiSk5jyT9gfFgsPWu9RMfJm4rRY7IiKQZibq3byG+5uLsH3K/z60koR/qrnxBeeSxpZJpWPm2riQSlt3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HeYIGvy2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9FWa0Ey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HeYIGvy2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9FWa0Ey"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l1MU1699614
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 06:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=; b=HeYIGvy2mWNdAiSI
	czcoNGOVG16mlrKAjqWWXvdtiWT82LUzhM+PUYwNTuQ55vGZncGJOGsoM47ot/Y3
	qZ8T6PsshokVl4Og34dHL03eYAOo0hDvZS7klwIrh3XFe3jI0SNgOMk1C6nDgTPs
	7zyX4lTXTzi9Sfx5+/N1UIxeAnCXN1nwif51kQsNN7/LRBDiLg0kH7o4glY7SGp4
	rWwsFIa7eevkRuKVv1ZLf/o1M5rd5FMuzj/Sxe+7hxxpiwiTFldbHKURjnlHFZu4
	+S72GDxVIctHvs8dJLdyiSugk5CZfYdCaN36lebvMVXDp7OIpRG07y6phaRFGocu
	PtMkng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jda4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:34:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so4990896a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762857; x=1789367657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=;
        b=V9FWa0EyNVSH48CUsyXH1f+SikfRMt5s+Ejc98Is7mk3hsjXz5NPbmDKWQXJ4qdlvm
         iTDxeb3SqvnhxEFA9KW3J/kUTU4EoV5REcCVlad3lfDK2SQDtIIpRgBhd/bwSTD9cdYG
         tMAMGR+W8o8G2YwJtyZj3Ki8diF++Iz8X6JazmTt5QOimTvJsazaehho2vlr+4vyKhkt
         U4BVZvOAcLClCYtYLViX5NFPCiHV/6fAVpzjXmQ2jPBUMZBwn3ZNacMng/iuem9K/ZCI
         LGj2j9bj1cv7RVj3pN9UBl1cFWEZ/ABk6cAYWJE9vW5FbtlXJXwq+VnkByD6jQHZjbgP
         kouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762857; x=1789367657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPyvDLh+aC0OEcv55eKGy0rZjUEKC9UNKb9SvdGhdZM=;
        b=i92uAKHTPCLRSoH7Rh0Vyu201cH831/YRMrFobp1ib73obryjNIPxs50F69rKYSZ4B
         8GEDZrv8C1UfZsxJ7dJxB7RmtlXWDRBZ9ECx2wC8Lxid4DOW/HbL2EEWUbgQGlErBZgf
         G2sOfiGULFKmIqulm2zsGDkJeqiNwI9yH3w03yeMdUItxGgp0U/3I+BLpDuOp6TSH1S4
         Jlt0YuRchzAPaFS7+fBg5H7jjyPsHyoyRylP+BnsE/tWAazltbmYpAXcVH5pxp7tQM0k
         4VG/dVpX4LBYAZukBYN/xle/sWFCiVva2sqbAGAKMAAarFf5ij1shV8P6iT0OFET+ysC
         GJNA==
X-Forwarded-Encrypted: i=1; AKwUvBySu2/s6kttZYCVeibMy7s/xbU7ToVU61Cl+az7NK/sGLsBTzkFAZ11fkyYAOogPF3bQmt43KOgn8xNQ/A=@vger.kernel.org
X-Gm-Message-State: AFuF++kmtedVOI4enu+aWQ71m0xFSvxDCv/aLRpjerbNLdbyrp7pWuKf
	1P+LkxMkrJF5HMCTecdXGKilNjNoBhGOmfuxRFpH6dzYJSmzzhxJKLaCIdVsBo7WvQUpektgaqQ
	tJIeFzb/SM3Kt/0VtvvRDcPvN7XACKMNYR+/OD55uMzBk6rkOsM9s7N0yb/2iOibbry0=
X-Gm-Gg: AYBFou3Plgk6RTEMTELLDicPUe3EH07exRIL77dwZ2MEZtgol5+txcR3n4Fx5ZTCC7R
	BBKPCilu0VkSDc/SMUJUgBE+pWzN2Mk0+T9p/zKWpMgK6zvcYLKLlKKOoO5t7cwbGmdKGCgn0wd
	iD4DbJLBZkGVIokOaKEgE+raowCEKWMN4y8hzuNoq8bqvVMDOFQ/CvWUOFoug9tBK8XA79l4grK
	KajZRIHYDG93RPafTwGiLJ8u90sMSLmIR7RIJSJje+LpPRpZlSQl5YS9birsivXT0FoGqwjR3Mc
	b3NS9hTvaMPecjhu8hxYhU4fhz85MvgDuGErrMYbliKTcujO29yGIDqvz1hsCxTQEB51DR7qKbb
	OPdmtMEPodY1OHiqowTJn7ezSw/PWes2KyEsH
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr29029571a91.18.1788762856832;
        Sun, 06 Sep 2026 23:34:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr29029512a91.18.1788762856305;
        Sun, 06 Sep 2026 23:34:16 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:15 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:03:54 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_dts_overlay-v2-2-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=3162;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=sTcoJe5DoruJGaJbA+mDYOnpK2K4WQXqyShMTozDpQY=;
 b=fEgoxoRnGmVyJ0qWPpbfbKMOuFe4N1ntb4b3AYDYqiFdqYmnaSWD3jyxDIcciSE0KZwneZsiw
 gsKe+tASmBqDVINlicgjMfUodvTloj/VgUx2Lt6ZWZU0IY+byNutA4c
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: FoA8CF0zhcU5Q9CFKHgeoxjBgMHlPri9
X-Proofpoint-ORIG-GUID: FoA8CF0zhcU5Q9CFKHgeoxjBgMHlPri9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX3obrzei1abWE
 1ipQZuTow3Q+sUgopukisLX9cnZnG+XcLmkstVMpHP/hQI3ee2yAkGuiKuH1WoOPEuzBlphVQc7
 LQKkCMo7Rw+i8Y1GZEgThvfv9USYCntsbpKniApTJqhcWYra1cElq0BGp0W/FnGFF8NYa821Hmr
 42mzeNPnrumcMww6AP/uRlv1lJrC+Qsn+o19gRClh12zosXBg9WSJ8OVrMU2xPFAKrclOaCKPj1
 Hzj1/s4P/2BSOW+rnnv3QDsCLoJJvx12tw3m6kRs+19WNHAJbv6pWE3ntJpoN+lAeLI28N8nSZv
 tSPRc8QCsC19bjDY0BVMV+u8hf3lg0i0SKKzXOMywMJNivh1LnyngbZy8I2CMPkQ+Q6n1GZgLpl
 BxjB1lOtmTqDALe1/qhXEi1gm0yjsGsWRGrZnkrdggxXE/VsFdPFiMF6xldoYk6jyVj8YDMvf8T
 t2WuSiiRrsaU/GeWiVg==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e5ae9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rHGbxVKOk4E_Aj177jYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX0e6c6rIM1Oye
 NsMhtwLXTIwZy1pKD4FgZxBE/8ySA7pOS1p2eVUDsFoANVOPSdirAvpmzHtggRKXPVRTCLY8ewr
 2fbeAp3dT30vHTZJd/SgUEHkmttf07w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070068

Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
Lemans EVK, using mdss0_dsi0 with 2 data lanes and the panel MCU on
I2C1.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 38554195fc98..d17b46a043ad 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,8 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+lemans-evk-raspberrypi-dsi-7inch-dtbs	:= lemans-evk.dtb lemans-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..14743b3c3863
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_touch>;
+		pwms = <&reg_backlight 0 255 0>;
+	};
+
+	reg_dsi_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&i2c1 {
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	reg_backlight: reg_backlight@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+
+		vcc-supply = <&reg_dsi_touch>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+};
+
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch";
+		reg = <0>;
+
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_dsi_touch>;
+		iovcc-supply = <&reg_dsi_touch>;
+		backlight = <&display_bl>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss0_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1

