Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B6912CDA5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889052; cv=none; b=AOJxTXHjNcZLrZEdUgYvkd9pgPiEiAkVXGJl9lB59nFVP5SqJSh87Xys6Q7xgprmWsykxUU3g1bzGHx8SbWUZ9tW7crdorIt2tX8eA/qYp40VB0lflXAYwCb3DqhHUPIEbLV64F5VeDOe1pvnnVgQLwiZfd8Xzgmc5dkvayGBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889052; c=relaxed/simple;
	bh=ZxM8zSf7CqdmXuIw7I1lt4kWkn9q00mmypAdP3McCHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAZIUgH5F2O78xaUXU14QrBxUO7O9wBeVXO5oexJLQc66JCFYvW4lW9jsepppGzqT+Tg4hdt40GO3EOvKBIyfLNJJHvUyqT/oJsC5kv+sL2aFoVYEkejzhdd8+YTHaH0qux11rX+ixs62rAfxFYLXFMPE3ohGin6IJZtkYxDgnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ViKFNWRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6IHKSGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ViKFNWRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6IHKSGc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3JmEc2145437
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ACTv52GtA+8
	KSN/sdUfNAb1t/LkIrWgLHUNF/frjgDg=; b=ViKFNWRIgE/7Ed1hGz38AXpUDtk
	9rZfvit7kaYiROwRSr4xPN+gqGpWxSM3MYvJcgGPNeQLK0N4Y0XZyDMUL4Cst9IE
	F8t9sRwuMu2kNBf6qjJxF7wOwdJu1HJS9zzz1LzMzlmGKviHHlYl6F3u0NLXuuX5
	Hli/Lw7MeKy7C2uQJhmNVBv+oTq3JJBMV2TQz1y2xBChKUgv7vELC62jHZPMIKfr
	/+bZgk4L+cW/QWRtltevJOH0Ly1HJU0F6r+PWJYCLX6vXpzsH3QcoVLvUPszRlrC
	w1XinQ4MLj6nJe1EQssuEh8KZo1T9yQGr7Q5gqnlGCa1hWmmhjXqXCv/zoQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0jh13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso912742a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889046; x=1788493846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACTv52GtA+8KSN/sdUfNAb1t/LkIrWgLHUNF/frjgDg=;
        b=c6IHKSGclrSzilHhZ0BOekijIcH3C0cTto3VdSg1+JuAQCpvS7cUR9vGzcg8eZ6X4u
         uteclIO+muoy7eRCj0Inp9l5UAxtKotTo/D9vf6orLtTpzfqFu7Rte9OtRa3aWbtCQB4
         8S4NUJuDQaGVoNVZl9IqtgdMCmM6bW9w9jHWcLAAFqsr8mVYKhIqnaZ/r8CC5RjcVEel
         NbsFj0MaAjo1VnwmHiyhL/TsCIMJG7Ehbk2WV0czjnogSb+H7Vy+lgTEqwHHAM1LSMh5
         +0Wv2Z4sphmdffwOqRlQiX7GEu4z1nHBR2MOE2MbNbDxFDDviOSC02MqVyp32y0mRoA4
         PBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889046; x=1788493846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACTv52GtA+8KSN/sdUfNAb1t/LkIrWgLHUNF/frjgDg=;
        b=huZrIq7E3O42TNdVebLPtUUdWQInjZRRiXBDO1HLKM5NVsc1mwsfH0zISBrq4dx+H8
         3WzJFfYhUVJARV+wgPql7l9bo/zdyL9sWxwFwWCq7TXsR/cUgLvua4Z9iV/ZmS5LKv6F
         LrA5+AQlzTMt3SpmOAkh4ZiBZG81I8GNIeV+2K38jOY6Av1ufT8pJLbil7iiNHrwYGYa
         53BXbixyzasUnD+W0yV+M7oBYvk4Zkgb1EDjrDTaaKV813oYtxW7dqxFB2v5nADT89L8
         0IAw/R9MNXqOAGu9aJ2X1a/t8ApWDosmQ6S2kjUJt5EBpdmWpkannFbMrnclC/akGaVG
         77Ew==
X-Forwarded-Encrypted: i=1; AHgh+RoIBINd2T1EWpXOHJlU1ay4YWuCoRm+W1nAN/e8D/0gTOw5fZkK5PwjLVjHMpNfPpl9qHmQj9V38BRIonc=@vger.kernel.org
X-Gm-Message-State: AFuF++nwXoEiSge/XvpHXSnpXhYFcoKn6b408OslWF8V3uGaFbu6xv97
	nQe/sU9CmjRQFCEkrAS4LnC9CwX0hWEKmhOnl1/eN3kykFNrGiZrE27fAOibcpFKO91T8XS9LkZ
	mhFMKjh/wf++mcMsfRzWrLEnxhfIGIOGB+mkKaPUPm6l1F5rZvatBzS4iuB3Szkn23jA=
X-Gm-Gg: AR+sD10ZgVR+qXJa7s66sonNv8cxp6YN4z8v3X4LKxsuVy/+l0G19sK4ZsasrBq3o0I
	zrlqEcLC18UAqbI1VOdicjszB1tPp8b7+CgE8qGZH4BPE4I5lzlr2sY5VrqMUJ0+pXDb18tFXkQ
	zwS2V6lnsIaCiBjwu8uIL75FNDAFfuh5p8cFf5/TM5YjciX1iNTvX+9Uv/NDHNB57AKJUWOXwX2
	/mdJantm4fCyqkfOzTVjt754Zyb4+WsSjj6CO9PkH7uah2SLXWr+2Z3tOucvDuwK11m3+NUbSBX
	DgK6aHV3GDg1m+8yCpvncpHPGhSqsk9WbZeLSfdkikhRfTtWABe2Q5HvodzsnGQfvQcXOkJSmcJ
	PT49zoHYY0ta8Q49KChbRgWmmTb88OGr6YabBzOROqrG0SVY/ATB9mW4Xwdxk
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr8175308a91.12.1787889045163;
        Thu, 27 Aug 2026 20:50:45 -0700 (PDT)
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr8175123a91.12.1787889044202;
        Thu, 27 Aug 2026 20:50:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v13 2/6] arm64: dts: qcom: Add device tree for Nord GearVM variant
Date: Fri, 28 Aug 2026 11:49:54 +0800
Message-ID: <20260828034958.3165-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX2yQnOW1g/3Vm
 lZyTY7hBYGKZ17RubwcZIicx2MU22DZqiFql+Uan/YpOz7eWrhVZU4cfPTmoi9jTLM4WekBwcZg
 iYb1cbQZTVwOCon4x4IFUuggEKa2ZF5YFKtkrO+NtnmFUh38bms+0L6WpS8rT+gnlcQh0mmRR1o
 LpxZRa+2aDAjd8lwwQ+KY7dVWwSGib/JzrRHUHGAiZQ1OjMp1kJxIQ/KJKvxj0YWxmeUt3ttzVJ
 i4GZxqn9Oe2hZ2w9wlx4tWxP01TxtSDOhhe4UQ5MLU7o2x/eivApFPPnZTqpYJPs3tU5ty0kP8O
 aA1vcMK0+15KSZ6/WIirZxnyDo3ZU4TKuLaohnJwiqmVBxEg2DjMudqXsCdj4Y0tUcmkiCTIa9/
 0vJtzhh/Y87aWwRJTNEurBwY3X7t544tfHlWKGsLAoFRFXdx1HDmGIvOetoQs2QnHMo6KBZX/mZ
 uQ7D70pznBDCp/pNXUw==
X-Proofpoint-GUID: YF9GNWKGc8JIz6c14NuJGT9zN4GK6IKa
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a910597 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=C7SS7-jxath9lZw70LYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: YF9GNWKGc8JIz6c14NuJGT9zN4GK6IKa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX3oHcDvoUfj2R
 xCsOyL98KI5XTM9PWR/13xlpyR1jrakxgKgEU+f5M6RPW1dvjo5RD2L7fCSMiEmK6EU4LgKPe7j
 JSUuxn/dQu6+HHBqdqC2/HQQGAIza+8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add SoC-level device tree include for Nord GearVM variant, where a VM
controls platform resources (clocks, regulators, powerdomains, etc.)
as SCMI server. It currently covers:

 - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
   for SMC-based firmware communication channels
 - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
   controllers using SCMI power and performance domains via scmi9/10/11
 - UFS host controller with SCMI power domain via scmi3

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi | 2848 +++++++++++++++++++++
 1 file changed, 2848 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
new file mode 100644
index 000000000000..5514f9a6f49f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
@@ -0,0 +1,2848 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "nord.dtsi"
+
+&firmware {
+	scmi0: scmi-0 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem0>;
+		/* We expect the bootloader to update the IRQ number */
+		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi0_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi1: scmi-1 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem1>;
+		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi1_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi2: scmi-2 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem2>;
+		interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi2_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi3: scmi-3 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem3>;
+		interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi3_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi4: scmi-4 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem4>;
+		interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi4_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi5: scmi-5 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem5>;
+		interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi5_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi6: scmi-6 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem6>;
+		interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi6_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi7: scmi-7 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem7>;
+		interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi7_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi8: scmi-8 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem8>;
+		interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi8_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi9: scmi-9 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem9>;
+		interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi9_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi10: scmi-10 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem10>;
+		interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi10_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi11: scmi-11 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem11>;
+		interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi11_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi12: scmi-12 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem12>;
+		interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi12_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi13: scmi-13 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem13>;
+		interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi13_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi14: scmi-14 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem14>;
+		interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi14_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi15: scmi-15 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem15>;
+		interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi15_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi16: scmi-16 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem16>;
+		interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi16_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi17: scmi-17 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem17>;
+		interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi17_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi18: scmi-18 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem18>;
+		interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi18_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi19: scmi-19 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem19>;
+		interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi19_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi20: scmi-20 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem20>;
+		interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi20_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi21: scmi-21 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem21>;
+		interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi21_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi22: scmi-22 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem22>;
+		interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi22_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi23: scmi-23 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem23>;
+		interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi23_sensor: protocol@15 {
+			reg = <0x15>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	scmi24: scmi-24 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem24>;
+		interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi24_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi25: scmi-25 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem25>;
+		interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi25_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi26: scmi-26 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem26>;
+		interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi26_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi27: scmi-27 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem27>;
+		interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi27_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi28: scmi-28 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem28>;
+		interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi28_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi29: scmi-29 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem29>;
+		interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi29_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi30: scmi-30 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem30>;
+		interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi30_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi31: scmi-31 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem31>;
+		interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi31_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi32: scmi-32 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem32>;
+		interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi32_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi33: scmi-33 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem33>;
+		interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi33_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi34: scmi-34 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem34>;
+		interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi34_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi35: scmi-35 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem35>;
+		interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi35_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi36: scmi-36 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem36>;
+		interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi36_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi37: scmi-37 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem37>;
+		interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi37_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi38: scmi-38 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem38>;
+		interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi38_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi39: scmi-39 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem39>;
+		interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi39_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi40: scmi-40 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem40>;
+		interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi40_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi41: scmi-41 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem41>;
+		interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi41_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi42: scmi-42 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem42>;
+		interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi42_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi43: scmi-43 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem43>;
+		interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi43_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi44: scmi-44 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem44>;
+		interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi44_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi45: scmi-45 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem45>;
+		interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi45_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi46: scmi-46 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem46>;
+		interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi46_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi47: scmi-47 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem47>;
+		interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi47_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi48: scmi-48 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem48>;
+		interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi48_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi49: scmi-49 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem49>;
+		interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi49_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi50: scmi-50 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem50>;
+		interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi50_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi51: scmi-51 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem51>;
+		interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi51_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi52: scmi-52 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem52>;
+		interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi52_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi53: scmi-53 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem53>;
+		interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi53_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi54: scmi-54 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem54>;
+		interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi54_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi55: scmi-55 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem55>;
+		interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi55_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi56: scmi-56 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem56>;
+		interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi56_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi57: scmi-57 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem57>;
+		interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi57_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi58: scmi-58 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem58>;
+		interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi58_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi59: scmi-59 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem59>;
+		interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi59_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi60: scmi-60 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem60>;
+		interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi60_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi61: scmi-61 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem61>;
+		interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi61_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi62: scmi-62 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem62>;
+		interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi62_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi63: scmi-63 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem63>;
+		interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		arm,max-msg = <10>;
+		arm,max-msg-size = <256>;
+		arm,max-rx-timeout-ms = <3000>;
+
+		status = "disabled";
+
+		scmi63_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
+&i2c0 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 0>,
+			<&scmi9_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c1 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 1>,
+			<&scmi9_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c2 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 2>,
+			<&scmi9_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c3 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 3>,
+			<&scmi9_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c4 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 4>,
+			<&scmi9_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c5 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 5>,
+			<&scmi9_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c7 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 7>,
+			<&scmi9_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c8 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 8>,
+			<&scmi9_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c9 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 9>,
+			<&scmi9_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c10 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 10>,
+			<&scmi9_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c11 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 11>,
+			<&scmi9_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c12 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 12>,
+			<&scmi9_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c13 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 13>,
+			<&scmi9_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c14 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 14>,
+			<&scmi9_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c15 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 15>,
+			<&scmi9_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c16 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 16>,
+			<&scmi9_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c17 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 17>,
+			<&scmi9_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c18 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 18>,
+			<&scmi9_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c19 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 19>,
+			<&scmi9_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&i2c20 {
+	compatible = "qcom,sa8797p-geni-i2c",
+		     "qcom,sa8255p-geni-i2c";
+	power-domains = <&scmi9_pd 20>,
+			<&scmi9_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&qupv3_0 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_1 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&qupv3_2 {
+	compatible = "qcom,sa8797p-geni-se-qup",
+		     "qcom,sa8255p-geni-se-qup";
+};
+
+&reserved_memory {
+	shmem0: scmi-shmem@d7600000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7600000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem1: scmi-shmem@d7601000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7601000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem2: scmi-shmem@d7602000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7602000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem3: scmi-shmem@d7603000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7603000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem4: scmi-shmem@d7604000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7604000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem5: scmi-shmem@d7605000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7605000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem6: scmi-shmem@d7606000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7606000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem7: scmi-shmem@d7607000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7607000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem8: scmi-shmem@d7608000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7608000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem9: scmi-shmem@d7609000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7609000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem10: scmi-shmem@d760a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem11: scmi-shmem@d760b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem12: scmi-shmem@d760c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem13: scmi-shmem@d760d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem14: scmi-shmem@d760e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem15: scmi-shmem@d760f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd760f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem16: scmi-shmem@d7610000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7610000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem17: scmi-shmem@d7611000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7611000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem18: scmi-shmem@d7612000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7612000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem19: scmi-shmem@d7613000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7613000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem20: scmi-shmem@d7614000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7614000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem21: scmi-shmem@d7615000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7615000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem22: scmi-shmem@d7616000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7616000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem23: scmi-shmem@d7617000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7617000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem24: scmi-shmem@d7618000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7618000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem25: scmi-shmem@d7619000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7619000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem26: scmi-shmem@d761a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem27: scmi-shmem@d761b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem28: scmi-shmem@d761c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem29: scmi-shmem@d761d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem30: scmi-shmem@d761e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem31: scmi-shmem@d761f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd761f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem32: scmi-shmem@d7620000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7620000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem33: scmi-shmem@d7621000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7621000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem34: scmi-shmem@d7622000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7622000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem35: scmi-shmem@d7623000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7623000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem36: scmi-shmem@d7624000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7624000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem37: scmi-shmem@d7625000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7625000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem38: scmi-shmem@d7626000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7626000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem39: scmi-shmem@d7627000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7627000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem40: scmi-shmem@d7628000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7628000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem41: scmi-shmem@d7629000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7629000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem42: scmi-shmem@d762a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem43: scmi-shmem@d762b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem44: scmi-shmem@d762c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem45: scmi-shmem@d762d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem46: scmi-shmem@d762e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem47: scmi-shmem@d762f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd762f000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem48: scmi-shmem@d7630000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7630000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem49: scmi-shmem@d7631000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7631000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem50: scmi-shmem@d7632000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7632000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem51: scmi-shmem@d7633000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7633000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem52: scmi-shmem@d7634000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7634000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem53: scmi-shmem@d7635000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7635000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem54: scmi-shmem@d7636000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7636000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem55: scmi-shmem@d7637000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7637000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem56: scmi-shmem@d7638000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7638000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem57: scmi-shmem@d7639000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd7639000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem58: scmi-shmem@d763a000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763a000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem59: scmi-shmem@d763b000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763b000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem60: scmi-shmem@d763c000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763c000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem61: scmi-shmem@d763d000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763d000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem62: scmi-shmem@d763e000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763e000 0x0 0x1000>;
+		no-map;
+	};
+
+	shmem63: scmi-shmem@d763f000 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x0 0xd763f000 0x0 0x1000>;
+		no-map;
+	};
+};
+
+&spi0 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 0>,
+			<&scmi10_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi1 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 1>,
+			<&scmi10_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi2 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 2>,
+			<&scmi10_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi3 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 3>,
+			<&scmi10_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi4 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 4>,
+			<&scmi10_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi5 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 5>,
+			<&scmi10_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi7 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 7>,
+			<&scmi10_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi8 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 8>,
+			<&scmi10_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi11 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 11>,
+			<&scmi10_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi12 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 12>,
+			<&scmi10_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi13 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 13>,
+			<&scmi10_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi14 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 14>,
+			<&scmi10_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi15 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 15>,
+			<&scmi10_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi16 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 16>,
+			<&scmi10_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi17 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 17>,
+			<&scmi10_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi18 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 18>,
+			<&scmi10_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi19 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 19>,
+			<&scmi10_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&spi20 {
+	compatible = "qcom,sa8797p-geni-spi",
+		     "qcom,sa8255p-geni-spi";
+	power-domains = <&scmi10_pd 20>,
+			<&scmi10_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart0 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 0>,
+			<&scmi11_dvfs 0>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart1 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 1>,
+			<&scmi11_dvfs 1>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart2 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 2>,
+			<&scmi11_dvfs 2>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart3 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 3>,
+			<&scmi11_dvfs 3>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart4 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 4>,
+			<&scmi11_dvfs 4>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart5 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 5>,
+			<&scmi11_dvfs 5>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart7 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 7>,
+			<&scmi11_dvfs 7>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart8 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 8>,
+			<&scmi11_dvfs 8>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart9 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 9>,
+			<&scmi11_dvfs 9>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart10 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 10>,
+			<&scmi11_dvfs 10>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart11 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 11>,
+			<&scmi11_dvfs 11>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart12 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 12>,
+			<&scmi11_dvfs 12>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart13 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 13>,
+			<&scmi11_dvfs 13>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart14 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 14>,
+			<&scmi11_dvfs 14>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart15 {
+	compatible = "qcom,sa8797p-geni-debug-uart",
+		     "qcom,sa8255p-geni-debug-uart";
+	power-domains = <&scmi11_pd 15>,
+			<&scmi11_dvfs 15>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart16 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 16>,
+			<&scmi11_dvfs 16>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart17 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 17>,
+			<&scmi11_dvfs 17>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart18 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 18>,
+			<&scmi11_dvfs 18>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart19 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 19>,
+			<&scmi11_dvfs 19>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&uart20 {
+	compatible = "qcom,sa8797p-geni-uart",
+		     "qcom,sa8255p-geni-uart";
+	power-domains = <&scmi11_pd 20>,
+			<&scmi11_dvfs 20>;
+	power-domain-names = "power",
+			     "perf";
+};
+
+&ufs_mem_hc {
+	compatible = "qcom,sa8797p-ufshc",
+		     "qcom,sa8255p-ufshc";
+	power-domains = <&scmi3_pd 0>;
+};
-- 
2.43.0

