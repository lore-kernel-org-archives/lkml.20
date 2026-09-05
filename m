Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969F303C8A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571834; cv=none; b=K2PBHtq+59Wt6jsQnEuPWylze/1k4Wq+pHbtAQFSO6fc4bYFo14IdHjlLTIA7lddVcZq2pd9n7qUxDNcoHjUM3OXld0T7GXq3aU2gYRt0lf9xT3jKSztxKwWOdK3eiBe21NstCQnWkKz+jVEMhii307LjBd7Uh/BJmtic8aG+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571834; c=relaxed/simple;
	bh=EP4wlhd1hff0Y5G3evRfbFP30T5A4yZx5Fq/svMeQP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jt9fP2rGWpA1fYX5yKdXapn7Rk5DIh7IkPRNM+wLfWVHGmYBv5pk3UDg0bppkeImNXk6iY2IGFXKxaMLvQD1x1cpUk/UPPWdBmkkWMuGRyW2qgvgAOgaJbzL2mCF0WfavBal0JBSKV9/XWh2av+nqlordq26pv1cAGh/P1TlhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAbVud6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8QkkSTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAbVud6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8QkkSTg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850v8qJ1495876
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 01:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZsRvH9iVzgnD+u/i1PW4Datuj79+G13D8aHzOcPBHvA=; b=nAbVud6iMQTXljCN
	jctHOPAO07aAH9Aoval0BO2f/lsEXZy5Lwv0Tlf8SX8tSqLWYEyjZrhJkAK1jA5n
	xYjGDZ4xhudAZ8NjFPysDdWMw2U0Dgrnz2PKijBKU7omOuGG5RBeuHdq+X76xo+4
	TVGc+u294cEMNxaZUkBRchfAFJCj+QnoMroVuGeetOAaAL8zBNR5TjDMCCWrYTWr
	7nBNcO1uv2B65N7CUABUs0k+IItRVhHEV6uVCOCmVdbKM5v7LpzqWw+ZtTo7gx5X
	lCrtqK9WzdTqBDkGPr4vxvg7IJ0TlnVrkagtHZQT4H3UDMxrnVvkxYTY9zg8DBRB
	r7cclw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0122wsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:30:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399271df9d8so319001a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571830; x=1789176630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsRvH9iVzgnD+u/i1PW4Datuj79+G13D8aHzOcPBHvA=;
        b=j8QkkSTgp7sYwocTcI4aRf3yIS3k9wVXyjSJrkbm72cVpfeo21Vftd+bskTV+kKAjQ
         Dqn6XKMtMiB3xVtDhxWFQOMRxmYuvb4WyyOXWPJygPLC+qs/IOVXAjdXUiw9Ce7y1LWK
         EBBG9rDdbwf3HvCf7ebyfWhBGDSWlsFeiYgBQPfR9+kT6rm12Tr8avIIsCKyEL1NXMc+
         73PwM8N+07bh+fUHzFJT9Vc186Gq0Y79Ory90hEt1cM7KiWeB7Vkggn7Nuu3piiUFHQA
         mfTraXc8W2lsSa1pQCuse/nDaodo+JdlU9UomX0+/LKcc++5L7YuEEcVMtNrPppMa/fE
         Sb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571830; x=1789176630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsRvH9iVzgnD+u/i1PW4Datuj79+G13D8aHzOcPBHvA=;
        b=UY5K4+sYW0gGRQkK0gM2E38zMF7O68yWtmWyzNDLzmBP6vufcGHmxvRdwvOioXdgf3
         DwZaHJUHwQ98Erw6Ce3LJiRNRxAoFKIFeH8ez6xJeQZpaaoB9SG5xM33+aKLwh3yAFb4
         //sur7vwOMn7AXD/mfqydpSRipIwJ/S6wLjtGk9K3pta5hqmmKIceIuoHQc0X4xATIiC
         xgT/yT/E1H3/f4BdVhwaKvADCdo5toEcjG5Tj2ZUVysZvCDU0BoQrkVlpokw6bSX3ffZ
         A8qwCMI79ly4yzkHRfwNTt3t21oFwwSPTK763cRbrpuCxfi4cifjBR6Bxmqg0dnQ7OCl
         +wGw==
X-Forwarded-Encrypted: i=1; AKwUvByluzCp91xEcT3nwaL4tuWtRwmXHjMcsusUP5kgXyqoSRC0csoqXyv+tsLhw7rTzeVXWwWmxMqalgccoNk=@vger.kernel.org
X-Gm-Message-State: AFuF++mCqnrtpTwfKrfIJWoiXSjqn0iONEfbpcxzFGJX0clhYfyP9Z5d
	rveAcPHmDBx4wpaS4BHR/+Ga2bbPRCV4QzdetQOb1TtQsVRxgCFpHNpcgnReVG07fhHFk/UJvhe
	RmbBSH4zW1Hluq7Za2IOrNaqYaPumNMwg5+2aI+4CLYrBJjt7lc2CFny8LSJwkkFSK7Y=
X-Gm-Gg: AYBFou3dCHIMXRkAeM50jdY1Gys3ml63GhjxRirL3lS86T2IRWhlvd6MgpbqvGJlw/0
	QnuqIhRXfliqDj5/crtTKKqV9dO2MjfjdED8CNmvnzaX56xmPUKq7U84afKG0GaTKVFl5yySBDX
	dOBXOVeM5yENr6pT9wK1Hti5iH2yQjwj/h15LP2oXi/rpz8VWxAXBpRSO2ddee9+ZVLQ8SqMKlB
	pgRo+QY1v5lEYPAvZ+X45pJyuuYAUx+xvDHIc6/m17uvU3uAvpXZBYbM44VZsdeYvmoMBnniZOL
	H8d4nwvpvohO5Slx/WoCV67D34DGs+c9Ha1OxnvsHkv2OnZ9Xn0k4YNzF3OlCqWFzGeoXNvWmZt
	sa2T5bOmsfYypj1mdveBMbZMmMI9rpmRWAm/1IBYnnPLHLL3z981ghKVnY4RsW773V8xHB2RsYx
	uaVb4rNQrNCwthIY4zDjut
X-Received: by 2002:a17:90b:164c:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39b3d83a8e0mr2702387a91.4.1788571830497;
        Fri, 04 Sep 2026 18:30:30 -0700 (PDT)
X-Received: by 2002:a17:90b:164c:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39b3d83a8e0mr2702347a91.4.1788571830023;
        Fri, 04 Sep 2026 18:30:30 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:29 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 07:00:15 +0530
Subject: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
In-Reply-To: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=4286;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=EP4wlhd1hff0Y5G3evRfbFP30T5A4yZx5Fq/svMeQP4=;
 b=U3Aillio6qxZoQH0zLL3Cx2FL0BYeCo6V5ypn8+nTZsCRAI1ApCr6J+QjPpe5Kd5fKzzG09lU
 7gHnz7YolAbBWbb/kS+e4C7sm2/udI+RMAlXSXYac0QktLSiqxlciAI
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX5r9jT20A1WBg
 Taj4tPCEcErcMG9sR+v6TLbE7jLFr2QtuWkR4tRNAxPxkruWvA/L6fveYRF7V3VFVuy6HP2ZLYt
 Tnlaw0t6BK8vAg80A0Urtjyo3KT7mns=
X-Proofpoint-GUID: DNM1Qn5xMb27s_RkG3vrvjFCFC64W4T1
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9b70b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XDEuxvGYp64Eb9E-atsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: DNM1Qn5xMb27s_RkG3vrvjFCFC64W4T1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX49UnbL08r4kk
 sjKt8U/pdrD1aaNYoLpmzi+W3PUZHIgaUf9lSFH9YWcOyetjlu9rbmJJjSSqWA9TLwG6a+WxWIu
 CWxr7X66kFoKTDe1wk7cdnSOINW64Val4/hyZADH+e3bLdApCvL99fzO5e/YdnLiDhcZ55VBO8z
 WOtGZrPKJ0x8Th8U5XaLM1rfkrMevzti71lh7ATMvxwMeVM/u1OntXyHpya89aJOF/RQYQoEOH2
 0B5iwcuY1O9YPXuhQ1uJLCKfzKwBzP526xhVVU/JiRhAH50XRWjSVj78C0VaBpbXNNvpEyrz6uo
 ovR0zqObTTyVz1LF3bhTh09tYgB/M7RnzxAh/cUk43ATOnqJKCFh3KH3B8XBL79H36+Qcd0CCT3
 eLHs1ty+sYszIzyjwdsGnkDEcwAVayaPRUGf16LTUx0I36bmhppO4mxvcsVdsXrQdQoQmfNRYpu
 vrm01Cs2RzkXca1iZ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050011

The Lemans EVK IFP mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
panel-simple-lvds-dual-ports binding, which supplies the panel's size
and timing internally), and an LCD display bias regulator supplied
through the GPIO expander. DSI power is provided by vreg_s4a.

The overlay is built as a composite DTB combining the base
lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 113 +++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c2ac11133ca..6c119fd77774 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -58,6 +58,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+
+lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..bd3e13c46a1e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Lemans EVK LVDS";
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c1_default>;
+
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_s4a>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss0_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1

