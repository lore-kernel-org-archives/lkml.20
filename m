Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595893;
	b=KhDmMIYnSJFGRLXjRu0jVfqlkXOIjWi83V9jjaz8vD2X/h2Do06OQttMAoPhGGebhiJP
	 Ya3/DfX4RlM4ifJqdpmitfzMVbPgms9m5umRKd+L6L3Mn5P3avZT3qn5eJzkq+GUT+2eV
	 VFoahUWGFtc/0WbphUpuCXsLO2QmqDMwk5/eNku4Gvi+5epVnJ/oHH+Ez/5FgmNaWiLxF
	 1MX5po2YpdQhp/1SbdizmlLyrufNk38ocM+AE5yxMAFQ3axRlzJy70qtrc/0tf1gFHsVm
	 3J10axlcPykeI9+pEOqg6SH39etHtkR4Pxt97FrZcNhJ/o1CEV307EuVNQHaYrpOLPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
	b=E1v6kb/EZLywYvvKvI9RpIUiOFc1HkASDF6GfTmAtAfoEsZt+LQOkQOJFMbRpwyzF1tA
	 /g0/w1ZhPD2DlHKvkqOfhoZ/mrly1ufkSXiNjNf67awSanc7h9pXX7nRhD/s4/+V0m+Uf
	 8WPebo2TOAiWVd+uJomgxe8UUbd9fahvowKJWbBp9kLjasVjhJHntDWTsFJykk183rCU1
	 fJ5uJVtMxIPetnJ9Hvd5jhdJ6e4OisU3Ldh+lnGouK3m6h6tq6G/Y5Hge6LdwJjSUMc8D
	 CODQwAArpXFIgU2CDD2uj5h2hMclK3zVopthK5rpjUpJu+QW9SR1J6XBV4GfXeYwVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCT7th2c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+RFShZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A6606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074A6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCT7th2c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+RFShZk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDgF1313587
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=; b=VCT7th2cma/uVca/
	uojpbudS4KLgTuvw7R5iopML3QM7QRwHtf8I6Ykd84Pn4qC09tGEfgfHMwP2qcli
	QMdZ1eIDvq9SdQP7wbVCRX1pRADJZh2BNMSrAFKBOX/OO2hVw0a2P45RwPxDdhAC
	Mw94LACE9fis3ZKWXaM9M1ljFG8OMfklBpmxiUtUxOat6uH2ATTXFpUiSQUV8nVQ
	9LjV4kNh1a3YoCjQxytKFMPcmX4+JPjx+rsLKamIUeuEea1weRYmUh6a7LNZulbi
	V0Y5v+T5JhMPGqNLhiolFD2C/52TxULFuM8ETENnsWcIyF6esV5eNdPpM/NIsz/5
	HRNYQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03vnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:18:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-366c279b454so1697094eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595890; x=1793200690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
        b=V+RFShZk+jNzA8VMCm6yyy5Tg8QkHVsgEuyrMlvajhDqPN4xNUf6hqw0tkUMZwDP9e
         9kWoNlg3iGnqrFl2xphONoOVNQoRXqT8o4J141MIov/Rx7U4hm4APLZlJ+YlcToY2Ew7
         9o5+1kUSLVErbFBNIs8a3DqxTIGiY8/0LxodzWNvhqfAHwzk7h5vbTz7DtZczzqWoQWh
         YhCrkqh9pdpY45IULrpN26FeUK9gVfIPN3stvXqPVwOfDC0wHQkQe0DhloMlCX3u0guG
         cQEvL9nRqiMG2YHym96LWJYuMsnMFhfVhXH7dEsGtwQuFMJoKrfctAN8gVy/2wpLsVA1
         9juQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595890; x=1793200690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
        b=ZX0sgRPddZv/KJk1ttQKZiK/di1hVF/HISkD2Zu+FTexoifEUg9NL9dhiMSV4e0aeh
         CoBZUCwWOW4GMf8RNlwrag41uDcQMLFxgM7C9j+Nrya+1HTKiViEc8wacGH8o1EmMcea
         bfx5zbm4VIeGFaxewyygyct362hLT34J/fy6rzBnYy1UmYMULh1Ytlfvt9aAmI9A68T2
         PWEaZCXCvBVZs+3+hvnVclVrdokOdhz8NMXZ+Qcykiu0Jvql+dSdJjJ/R2b92EEQYeob
         e2tBM1Q/CY620nt9YqrUWSHkeissJhQwOrh40XQBeAlh+/sCUXLtaaSiTPPaA1cMqwZi
         TJGw==
X-Forwarded-Encrypted: i=1; AKwUvByGaXKl0sfrXD9WyPKyHXIWnjUZY8pUN1N5HA8eNk4TBnymSSeKg2s61t1Ihp7e50sb03qcPo5EDH6RL0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPKQienvppi6KhtgHD6JipV5oeWEf2oFwD6Y/c2HS2MjF4G811
	q5tQlVSWt+C4Bzwp6D3AhJ9/2Fq2juzgqq2/ZDWkPINxS8Tr5/a//qFL++iV6POeO9jtn8jzCrO
	5UJqcENUAS/aE4+3xmoSG0DZc6FhkbSoEyfFsSn34zJcovuJfl8lBDZ6YW37aRb3N9FqkPMYMlH
	c=
X-Gm-Gg: AYBFou0tcoP4Lwz71oCC8lapcaeZDuAM7eiddxz5U0dzk1E26V4Lugz0YwZDJtmEQwp
	KUXP1TjaSexb0tWMQyvaC9Iy8+2FC9CIfPDRGRkuLiHf4rziolaBICy5ntn5p5QmEfR+TO3hjta
	sUzgDkyafRbLdZXGqFdczR8oKtbjYiCXIGaskUIUoj30lx7d+2KNFIet7sfkP3pyGl7mIkk8TPh
	ukBVl1pqCEb8C2NK7wreqW2Gc4sBM9t2cejbq5aLX38C75uuIE4aa0iNsiFvDn0nq0O/qLLerUQ
	ezTMukOga/B9Y20bj6xuD56Vd7oo23JrK/dC6/oYn0o2OQejHb9s7peLeTFa+dBPYAjjln7r25r
	meLcIAJC6s9kAqK1kM8nKzcCejPq0VVq9
X-Received: by 2002:a05:693c:864e:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3674d047ca9mr4050830eec.23.1792595889880;
        Wed, 21 Oct 2026 08:18:09 -0700 (PDT)
X-Received: by 2002:a05:693c:864e:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3674d047ca9mr4050779eec.23.1792595889325;
        Wed, 21 Oct 2026 08:18:09 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:08 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:30 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=5076;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=H8TzP8Dj675+nLSJdklFvA6bI8Vose0C+tpoATsgYZ0=;
 b=gjweYPGF24ry4jA6y8Z6u1TL36AQ/mMo/BMNOi42WJjw+p+cvuBIIelhqWQc4yeMFToRPzINU
 5h0j+QlRai6CLulxPqZaUoBOOZQB63dTFto5IYfcjf/nAdXTKISvadr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8d7b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX23+7Rc3p3Tmr
 Nqd0tGgwJzATO+rK+JZxibAJjEAXTds/3YVsBwh1SJYbCBc7c/Zi8yYAS6OUE34671y0Anq4xK/
 tnH2cPjpdFhoE7wO0ML5QeOqSJMuAiHRPo2oTXJoxvcU1CYYlnkohY7seTEFkjThSs/SgUroZFl
 xv83mHCeLHeUWoti7f8NP8zMRyZSTCHde6aSYSuz+RWMfgbl0w3QUiVrPFxWY6CwekGbMGkbfH7
 eiyC/S5xG0suod92mpvWcVeeKAB2F3mmc1kV31YUWr3Z0jBSNHhoMQqoCw5uJasEkFfTzXfwfMk
 3MbD0+MpIumq5rUY5BPFF3TTzUnIwtkiKBEeT1EcYKIPuQ7YjLDkI67QJTqsR6/1udn9gZmA4Cy
 y5cYJkg6TLw4DDiHrXs4Ogf6y788/5UE2WE893rh4/ZGOD2IZRxkZj1oT4uDrCs8NVbJPlyOJU/
 mX1glDtfkWHrbpzVgCQ==
X-Proofpoint-ORIG-GUID: nc_Zeu3HcOtSMfrU-wBWCgmFehtkyU0g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX0NQjy71FD3G2
 wWd01G6fWiwS5COYA+eEV+wwzKzJFmp4nMojeOxHurEl1vPhtxLBdk6oOmHJIfs5gsXxda5M418
 tWKmu2Stg705WUXXxeryrYL7iqo8/mg=
X-Proofpoint-GUID: nc_Zeu3HcOtSMfrU-wBWCgmFehtkyU0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 614152913cbb..f0551bd2d8e2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -473,6 +473,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-lyra-evk-lvds-auo,g133han01-dtbs := \
+	talos-lyra-evk.dtb talos-lyra-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtbo
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..3edb56937446
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	bklt_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
+		clocks = <&gcc GCC_GP3_CLK>;
+		pinctrl-0 = <&bklt_pwm_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&bklt_pwm 0 100000>;
+		power-supply = <&vreg_disp_3p3>;
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_disp_3p3>;
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A — odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B — even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&tlmm {
+	bklt_pwm_default: bklt-pwm-default-state {
+		pins = "gpio59";
+		function = "gcc_gp";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index ec5c10a40521..20967c294543 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0

