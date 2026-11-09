Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183331;
	b=NrWhHmeMRMcwmCJOqCsX5CJO90ju5eZotD/jeQLMKhT2l+tFgfSyvovp7J3m08AsZ9Ej
	 SWBirVzbhKzbecep70zCH778J2OIXnJFwkj2Rvr+91Gd0nKP2DXhn6JI2ytiUVLGvunGZ
	 7Dzfz6qzj6Tvov48ejW36bekPR8rj8UJ7V+MuMAn290NRpAmP8vih7SWMwpit2yFBLGxj
	 rNslvfpmSxAcEx9/1pY1DYTNjyWVaf+MDCIAPyuTLQFFZFLn3hipseaSK2L3fPLMH9oaG
	 Vm/x1EwQfFAp7O5AJ4NBYMIcUfVU06h0q+jrviGwXH3Qh+eBYAU9VOI7D2UceN5cxiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OR3TN6D5wgUchbFwNlU+JvD77sO0GZh2ONOhHMGv92c=;
	b=WXgA5s8oI9msbWHy1Z46u1X+E1nS5wFqLQPuMgfgWHvxtrXw/QFLFuqGbVlnVjMKj8du
	 knIGcXuNPwgC8XhBEhV+I1Dfc5wIQ9hvs/UH7K5nnIW0q0AHXp/M953mrl+91wlECTUb8
	 PQl7EyGoTqaqqIOLm55YOxnC3gCiM+C4x/RhedIY+UOO++MlASziOJHdO6ZR+XyT7qdbZ
	 3NpZnWi8GlqHKcYWxb5gP2NZfkfWssevVnxT9lPWXljcbnso3mrvuE0Cl6ynQE0Pf+nmC
	 Z9lkSJ/sfD+IT8xnw5Hn5Rfqfjga1YrFLaZdh7tX43Zn1xX0fE43JsoLHo8RK2X1Gag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEGmYEvQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=im8UVjze;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3346F606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3346F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEGmYEvQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=im8UVjze
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ke4ZN1485541
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 00:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OR3TN6D5wgUchbFwNlU+JvD77sO0GZh2ONOhHMGv92c=; b=QEGmYEvQKKSh00JI
	ekUPAQgKfDiAQPfidFNR+DwuB41iJWobHJdb+gAO03yue/wLpJaAWTO/mYJxoSu4
	MuRVv0b+CQ3Ok9y2DvxU6KAMEAIbxeF0LTheaCGNiF4flBDe3oAPebLND56JWYeJ
	tQz5Y/33OFhfJY9HTTE435T+M1rM3Dr6kdtpug/4nGe1MxFHtY7FhU++bXvriMck
	aL0KPhCJvGAB/WZUQzd4nJIthiFBYIqDggKWDLPK1/VydTWQrFtoaJgkv6HFYWn6
	cw2IuUba3jZEtg/qCmIoF6FCn+NZkgBTW3blg50+XMaVWRmmPdLpxe0WSq84iV+d
	NTJpqg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99ktp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:15:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso1049581c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183330; x=1794788130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OR3TN6D5wgUchbFwNlU+JvD77sO0GZh2ONOhHMGv92c=;
        b=im8UVjzeGW4ziHu3wyt3C31Oi9bZEryCGyfaqzRO+LP8ah3ZKZ/MN97BJSxhMdAURI
         kKPnzKt1YQTPQdiMLelBROGGds8WAR6hIX8ixPpzc3SwJxY9Alc1Sz22Kbbj/tviZK5N
         AllXTdN8Y3SqCdlt1Qbq9AoluPMvTogXf2HgtL5Fqq/uzyOy0lEgvRaJi9GlPe7z61ZI
         Xk/3fnI4AHWXpWVu+RKKtL7tqk1QCz1BdkFHlbSArrpQ+rjE0iPQZb6t1GuNxoOQGzOB
         xTFufvjLaNDF0x7enoUoze0Mfm2GnN7bJxwmoDY8sIyEFZ28iuawZb7ngooehA0EMAvZ
         F4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183330; x=1794788130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OR3TN6D5wgUchbFwNlU+JvD77sO0GZh2ONOhHMGv92c=;
        b=2lTscZUhiZZUwf5NIfBcboI20kOAfcDKiIpM4pagc23E9YcwGiwK00TxcRPhwGYTmf
         QCfLarlPBU1tPc8XdH2JELGp66uihMrJ7aPE8MutNmEzlOS8j66YvjrYf5UbETNyQlqP
         UJmNSnJGJ0WqOYId6StjVwAD9nc9ZRv01blNijy1JnXWW/6O8f5oKd2yM6L/c7vHpuw5
         u1ubQKOuBqj4n/pZfn4tmOLvESdzUe+BdhdeqUO547fR90QQnOP1ED0tpMsTbw+GSOvS
         cuSZd+6adu6v7qvzyuSACzIx3ke6xcCRPPUaNZ3GCh4BAUs2W1G0cih4VH1ViCK7U6C4
         Oi4A==
X-Forwarded-Encrypted: i=1; AL+hErGtHRtQans4qRwPz4clLCmuMKRX0QcBm9LjzLd2dUlllqxdo+D1Ac17FDK9W9zyq6rxl9kRd+Km1kaRi98=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YquRjPjHr0yP/GaPp/W26deKU9L+3RgUweZeybPTe7XWSMm8k
	Bqfq01N59S/XTXLYOQLe4VszOLxgun+BQlmLIaK8o1xoHF2nafvuASoNPfTZAcBK+cc8ucdaCU1
	VRmfctBJxSguYv2zSXlaetOp6CafOKpV1EejUBkiK2sKNuyG/0KK5qVMGxFBl2oUq5k4=
X-Gm-Gg: AYBFou1+CMtLCYcYdsD4EKx5N+uL9KVesiCaFPc8eNXJ0778zdamjJncZ1sAeNg21gU
	aijrXWrVT+COz0Pj4kyBT4yAIhKT7464tppnNtbAiPAwE87wx4XjIQUwxF8wpMxDoMJAlkoRGJU
	QixY819HGTo2oYjVMerXGV5LdVrvEsEJV8SZ5HBAQci3DwjZRd1e8rKQqa5mnn7Rn/r6zPLnJ3E
	3GcEH65fXWNYP30MLs5HZPKqAtcI2l71XrqGRUfaeBkxQni7XVFRfJKJ4RxblEeerYIYJU5gC87
	FDOSzR9kwAj/HRnS1IW0f3yXNchdM8Rxh7BkjUnVh3+6tSKBfbihSxZbJ44A1mjqPpHdfqr9qXB
	QqGvfPNCcPVD8iGdotdJg5DhKuLmQYwsqm+yWqzFJ4Qb7LxnCtXTKFcZp1CAra1y+Ug==
X-Received: by 2002:a05:701a:ca05:b0:18d:ac5a:89ef with SMTP id a92af1059eb24-1b39fef0c5cmr4629841c88.31.1794183329264;
        Sun, 08 Nov 2026 16:15:29 -0800 (PST)
X-Received: by 2002:a05:701a:ca05:b0:18d:ac5a:89ef with SMTP id a92af1059eb24-1b39fef0c5cmr4629781c88.31.1794183328322;
        Sun, 08 Nov 2026 16:15:28 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:27 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 16:15:25 -0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
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
Message-Id: <20261108-hp-omnibook-v2-v3-2-f489fd0bdf33@oss.qualcomm.com>
References: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
In-Reply-To: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: 4a6ulQ137Yh7c_TpcdfHZqaEBJb30dak
X-Proofpoint-GUID: 4a6ulQ137Yh7c_TpcdfHZqaEBJb30dak
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af110a2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tojOfLgrslSkcS7XBEMA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX1v7I6pE4gaFh
 6VedOn0mbdq8a+aeTNuAMToD2oqDucNhK39T97YTbFGW7e16McbjLEQSTtc8uqQcQoyM9u7W+7D
 9KFLZg+8cEtI9U70KaDBYrVrsk9w+1/SDfHNuaDYA1webEAyfw/vQ7dJWoCnwCzYgqCvxqH4n7x
 kb3giT4vlD64GiFm7g3ZUpVtu+8UQN/chCo9e1KtL2Us/Odv2FzbWBGYAnjrD7THYB5SRroomxi
 F9acTcIXwaQ93UUoT/lDsfl8O4evwI5XPZnYmhhAZWhz+RyDHdMoP+vO79ruk/tKaXvnX7e4q8r
 KBN19ImohWxu43iV66NWinOctCU3+sv60P/Cxa8vGz+gPPgnYIBQdOnZAJBC83FLgXYpKs8XOHS
 hCZMFhMMpnGwph1EjwWPMJ0gCQrhuEs13aPPRKndDPR27LJQEUOff1tzfp4Uw28I27IivWnhPeV
 waqcARAaTNOQLjUDaBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX9w6wTgow9/zE
 g+0NLCIWZtnQSQY69cimU9oyQkhc4lZ1bIYTzAxVX6EMOVvKwPS2PrBlFgBv1GdF4XrozjKQf1s
 cvc8s7cZvRowKVGnYHtbnJ68wbPGOT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

Add board support for HP OmniBook Ultra 14" Next Gen AI PC
(product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.

Enabled by this device tree:
- internal eDP panel (2880 x 1800)
- 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
- NVMe SSD on PCIe (pcie3b)
- Wi-Fi and Bluetooth
- HID-over-I2C keyboard, touchpad, touchscreen, lid switch
- Adreno GPU and GMU (Freedreno GL on Mesa)
- Audio playback and capture
- Real-time clock
- ADSP and CDSP
- 5MP USB RGB Camera + IR Camera

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 1013 ++++++++++++++++++++
 2 files changed, 1014 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..cd63033b55bd 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-omnibook-ultra-kg0xxx.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
new file mode 100644
index 000000000000..1c5b6859079a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
@@ -0,0 +1,1013 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "glymur.dtsi"
+
+#include "pmcx0102.dtsi"
+#include "pmh0101.dtsi"
+#include "pmh0110-glymur.dtsi"
+#include "pmh0104-glymur.dtsi"
+#include "pmk8850.dtsi"
+#include "smb2370.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+/ {
+	compatible = "hp,omnibook-ultra-kg0xxx", "qcom,glymur";
+	model = "HP OmniBook Ultra Laptop 14-kg0xxx";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c4 = &i2c4;
+		i2c8 = &i2c8;
+
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	chosen {
+	};
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Right side user-adjacent port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Right side display-adjacent port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Left side port */
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in2: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in2: endpoint {
+						remote-endpoint = <&usb_2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_edp: regulator-edp {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_pwr_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e1_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-HP-OmniBook-Ultra-14-kg0xxx";
+
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_l1b_e0_1p8: ldo1 {
+			regulator-name = "vreg_l1b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_e0_3p1: ldo7 {
+			regulator-name = "vreg_l7b_e0_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_e0_1p8: ldo15 {
+			regulator-name = "vreg_l15b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_e0_1p2: ldo18 {
+			regulator-name = "vreg_l18b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/*
+			 * This is also reference voltage for &pcie3b wake and
+			 * reset signals.
+			 */
+			regulator-always-on;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l2f_e0_0p94: ldo2 {
+			regulator-name = "vreg_l2f_e0_0p94";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_e0_0p91: ldo3 {
+			regulator-name = "vreg_l3f_e0_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_e0_0p94: ldo1 {
+			regulator-name = "vreg_l1h_e0_0p94";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_e0_0p88: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h_e0_1p2: ldo4 {
+			regulator-name = "vreg_l4h_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+
+		vreg_l1f_e1_0p9: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e1_0p88: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e1_1p2: ldo4 {
+			regulator-name = "vreg_l4f_e1_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vreg_l1c_e1_0p91: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_e1_1p2: ldo2 {
+			regulator-name = "vreg_l2c_e1_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_e1_0p94: ldo3 {
+			regulator-name = "vreg_l3c_e1_0p94";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_e1_0p91: ldo4 {
+			regulator-name = "vreg_l4c_e1_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&lpass_vamacro {
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+
+			power-supply = <&vreg_edp>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p88>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p94>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p2>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p91>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie3b {
+	pinctrl-0 = <&pcie3b_default>;
+	pinctrl-names = "default";
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	status = "okay";
+};
+
+&pcie3b_port0 {
+	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+	};
+};
+
+&pmh0110_f_e1_gpios {
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/hp/omnibook-ultra-14-kg0xxx/qcadsp8480.mbn",
+			"qcom/glymur/hp/omnibook-ultra-14-kg0xxx/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/hp/omnibook-ultra-14-kg0xxx/qccdsp8480.mbn",
+			"qcom/glymur/hp/omnibook-ultra-14-kg0xxx/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_3p1>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_3p1>;
+};
+
+&smb2370_l_e2 {
+	status = "okay";
+};
+
+&smb2370_l_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_3p1>;
+};
+
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, left woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, left tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, right woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, right tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p9>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p9>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>,	/* EC secure I3C */
+			       <10 2>,	/* SoC debug UART */
+			       <44 4>,	/* TPM SPI */
+			       <65 1>;	/* EC_RESET */
+
+	edp_pwr_en: edp-pwr-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp0_hpd_default: edp0-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts_default: ts-default-state {
+		int-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+	};
+
+	pcie3b_default: pcie3b-default-state {
+		clkreq-n-pins {
+			pins = "gpio156";
+			function = "pcie3b_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio155";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio157";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p91>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	refgen-supply = <&vreg_l2f_e0_0p94>;
+	vdda-phy-supply = <&vreg_l3f_e0_0p91>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p91>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	refgen-supply = <&vreg_l2f_e0_0p94>;
+	vdda-phy-supply = <&vreg_l1h_e0_0p94>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in2>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l4c_e1_0p91>;
+	vdda12-supply = <&vreg_l4f_e1_1p2>;
+
+	phys = <&smb2370_l_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	vdda-phy-supply = <&vreg_l4c_e1_0p91>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	refgen-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in2>;
+};
+
+&usb_hs {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p88>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};

-- 
2.47.3

