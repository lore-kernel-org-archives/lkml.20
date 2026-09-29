Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EED3E411B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697246; cv=none; b=De6jPjzDRNMoIN636DA0Y7aHqM/t/mdKyi+phSZRISxQxHJiJNx1f05d3zNHDMws47giNZmcb806tyd1Js3xxN0WdX9jMV/0npztSbYSmu5bAKW7f8ldYyXH68Pp016km1wQ0yXYDrEI51eQVtbmPzB1YMEiA8ZMlPxIoxgxxSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697246; c=relaxed/simple;
	bh=b7qjIVyOku6hu6LyNfCPtWgZndMKkxd+Br9gOrjZ7Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjSo2yDRzYwh1IPDAp+x0Mxq3hJyzqm97ruTuBEzH2qSnjzBlnONHKEkp3ofdKk4bC3w6zFrx+ZNUANHoUEbxnYQhOFo2xRpi6HF0BcwdJPpzaq6kugpZEOF3nySGckZ9tMdAMebk45HbzjI7/LAvNUohbrGMItioXXkbIK5Dck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faMz/t5p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAfWxLt5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faMz/t5p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAfWxLt5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeJI613340
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vRJsgAKKrDG
	OLxrGuM0vfOx7jpmMqVamRv92qa0W5ts=; b=faMz/t5pzhOzZjBomBKsTvVsoWK
	SvAV22QU6esxfRY3/Y8UGArH69DUqw6tGNvvTWKwWwwjA9p/lN/uYytl8+vJKmoT
	OiF9MqQB/dik3i8rRvoRsqhsKhfqpTUblXvYyUADy73Ztn+m4NpjnCS2MLTLMkVS
	r/BOJrn0oCS+WjIS9PNcynsBbc3Mr1WivGDwZwFboEnR6bbnCxFqFKvPeltdlxTi
	+oRqIAntCgkWU+BA0DsFw327PMrdyNUvP81GOC12VGBbRAEEKfZCCKuDLHXxOofi
	SPSGS75FKPE/SqlHvO5qvRogPThYEZKEvFa1sGTrxWpwGmkVy3xJoZXh+JQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew3crr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:54:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1060877eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697242; x=1791302042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRJsgAKKrDGOLxrGuM0vfOx7jpmMqVamRv92qa0W5ts=;
        b=KAfWxLt55n0mMubS1z44V+j5LhIQVrWXkupZwUKQcs5bp08BPOLz7dJ+v1ugAWi0sp
         rXryop5Zqe287wCUrpkMBhg3lrYpbiD3rhjTcL8GNTaDk+qi8c7OgNc6Co4dlR2QkNmm
         Aoj5cgxKsh6RYhzsAdRxsm14jb1SAF1p7dpoMJohG5X9QyIgozsZLFIrdN2tmC4uR4OW
         2O3PuLHhkbVefLNHuiMGhAlnTNt1ryyAnIeAwZNNYpUehdlHNe0ijg69SoXO/8h/3DS7
         mbSmjtHGkzaxFDTAETRh/p5lv9W8LO9CasDhB8mqw6YRuy50Si9YzJsf4O8/TNgAzq9w
         MleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697242; x=1791302042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRJsgAKKrDGOLxrGuM0vfOx7jpmMqVamRv92qa0W5ts=;
        b=ByguhxYOdj1ZCBi+wwuSOzUdClcLgPie6Fh4isI1jYFlY9WI7JG5njUk6+Hklj0PG+
         MaZaGNyfnYgGuzbPi85jaq47SAA+LbEgkWwiuKKMEQbx66+NgsP7Yc4Qr+GYIKJ3OhNB
         cMTgUOdjORAEC2176XLOhHAxEFVI1ywQeNNd/kJ+PypMRtol7RHLSV0Le5lzrm/qHULM
         AEgNALyyphR+GTKBZ2OmQqOKrmvlmv+8Q6LNfrRDbXgeQSz717CPpP9cXmDJWGF18Rhn
         BoU5N22gTpzGcbEvKfx0LqyZR59geD2doFOZ6tZ+esacNf+op/48sJQn2Pdack5h05ko
         j8iQ==
X-Forwarded-Encrypted: i=1; AKwUvByocWnkbxKT8uJbfugBAI8LtF1Yb1Jfnw8i5muJFSNkKUOeAiPMgl6r4O1C6OsrOM0hvop4mARReoNM3r4=@vger.kernel.org
X-Gm-Message-State: AFuF++nR/lZjuLT0W9U9Yk7u72cr+ln+KZKSezRFrnaXFH3Il816YQm+
	ExOcUsnrovL97vlAzb9f9MPl1uvy7Hdye3OYKEzBzfDER5kqkRKghQiLzsr86byRgnfHlaNu10S
	9WaqrFxpiOVsaJLWk3dQDURnz6yOpw5/BGjD9R2ooMaKdisvc1BTg01kdi7oLxlllbFY=
X-Gm-Gg: AYBFou1r/UU+v1OFPrxkEEpeTl1EzbUeTE17/Uv4LOT/OLGVeDmqsFP/15wVkYR3xp/
	VGif+sZAxU/6trBcPQGd1Jleytigh49f1vmEV96w1ZCl3nZhdI05OFDiDDab9adgMbGcpa6X7YL
	sT6K0R6bDiMT21QhfCzhmc/DLwQS4tsv66lx3VHI+jZ72Y1CG/xEa87X7mI3YkmkvMl3NivPr29
	l9DfNPKea4rBI02sojI8ZXFfN5JjI7wXmFRegXvMIPvQhcQouHEUWxwNIoqdQXjA4y64x5lbyx5
	E09/Vd1569ARgbe3Vxw7qSS0fVjviQz1NDKnZk8TmEli89mcl3+9dNu+1dLRa10IsMXjqgsjJxp
	vKZFMfKnNOdps1A0AcPdcbI0uQlqUznXPz24uVt0h3X5vt5U1Stksq942emg=
X-Received: by 2002:a05:701b:4245:20b0:130:7246:10aa with SMTP id a92af1059eb24-146ce4915ffmr13689363c88.12.1790697241348;
        Tue, 29 Sep 2026 08:54:01 -0700 (PDT)
X-Received: by 2002:a05:701b:4245:20b0:130:7246:10aa with SMTP id a92af1059eb24-146ce4915ffmr13689316c88.12.1790697240492;
        Tue, 29 Sep 2026 08:54:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:54:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 5/7] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support
Date: Tue, 29 Sep 2026 23:51:50 +0800
Message-ID: <20260929155152.1898666-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfXxPab1WpSJD7Z
 gOx3a+eNMJfYr+2XB4yXPjEMvNBzizQAAtvMFinwM/TNluAEqIPq80n+gs+odyLsc1Sl/qyZBEq
 ZsgzBt9/6umPossveGGmHvw5a2w8Et0=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbdf1a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hucZloQI8G6bWT6_XmMA:9 a=U2nuDi6JAHPDsfF0:21 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX6tqoHertcUOS
 ZyOhIFe1OGV6LnAQ3hgGPx+NZwStU5qMBQDEKlP7UFLXhSol0rDwQFjsllWAJjpiaYkX2eNYmZv
 rMH8d3R2w+GXrbIQrou8jnEWktfeAL/PicpWp+P3FNxd6ONmMGfrR8n5hDAFVapD0BSsZcj/97k
 xu/radgdKFsPAlCqLSP+FcpGxa017tt/nLtrKnjwa6tE066u2nvKwb3OE0qpu0RFZ0WQSZmQnPE
 gN5pvT4hBBoFoYA0ZcxqlPsV/cwF4FANHoEsYPbpaxWuJxgQum4Qwjcz1bwTYLOMJZV5o+XpQWy
 E2I4Gdjey2MChtcr4KzHp2C40Tlh7bXC+ExPEnfRGYZ2+9Tl3XPwHUZA1ST9WSy0uAhJMOGGmqt
 qElymv+HAHENbG/MaYKtKEqWrk5jfztg5ZvWB1WHzOdStrx65TTkzTEx3KSeF2lbsmEmeAoYVV3
 Whh3IC+uphNxb+hyegA==
X-Proofpoint-GUID: 54EgKJCOd9rpYQJBqYgmyHS9X4nv4-fg
X-Proofpoint-ORIG-GUID: 54EgKJCOd9rpYQJBqYgmyHS9X4nv4-fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

The Nord platform is supplied by two families of PMICs on the SPMI bus:
eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
Add one dtsi per PMIC type, following the established one-file-per-PMIC
convention, and include both of them from nord-rrd.dts.

The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
after their board designators. Each one provides a GPIO controller, an
ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
temperature through a DIE_TEMP ADC channel. The monitors use the
qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
each is hooked up to a thermal zone.

PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
existing pmm8654au ompatibles while the file is named after the part
actually populated on the board. It provides PON with a power key,
a RTC, and a GPIO controller. The resin is described but left disabled,
for boards that wire it up to enable.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts        |   2 +
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi  | 543 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi |  54 ++
 3 files changed, 599 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 0b0acd33a2e1..47978df0af92 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -9,6 +9,8 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
+#include "pmau0102-nord.dtsi"
+#include "pmm8650au-nord.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. IQ10 RRD";
diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
new file mode 100644
index 000000000000..47ea145f4abb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+#include "qcom-adc5-gen3.h"
+
+&spmi_bus {
+	pmau0102_e: pmic@4 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_e_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x4 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_e_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_e_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@400 {
+				reg = <ADC5_GEN3_REF_GND(4)>;
+				label = "pmau0102_e_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@401 {
+				reg = <ADC5_GEN3_1P25VREF(4)>;
+				label = "pmau0102_e_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmau0102_e_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_e_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_e_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_f: pmic@5 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_f_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x5 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_f_adc ADC5_GEN3_DIE_TEMP(5)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_f_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x5 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@500 {
+				reg = <ADC5_GEN3_REF_GND(5)>;
+				label = "pmau0102_f_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@501 {
+				reg = <ADC5_GEN3_1P25VREF(5)>;
+				label = "pmau0102_f_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@503 {
+				reg = <ADC5_GEN3_DIE_TEMP(5)>;
+				label = "pmau0102_f_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_f_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_f_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_g: pmic@6 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_g_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x6 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_g_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_g_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x6 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@600 {
+				reg = <ADC5_GEN3_REF_GND(6)>;
+				label = "pmau0102_g_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@601 {
+				reg = <ADC5_GEN3_1P25VREF(6)>;
+				label = "pmau0102_g_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmau0102_g_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_g_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_g_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_h: pmic@7 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_h_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x7 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_h_adc ADC5_GEN3_DIE_TEMP(7)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_h_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x7 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@700 {
+				reg = <ADC5_GEN3_REF_GND(7)>;
+				label = "pmau0102_h_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@701 {
+				reg = <ADC5_GEN3_1P25VREF(7)>;
+				label = "pmau0102_h_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@703 {
+				reg = <ADC5_GEN3_DIE_TEMP(7)>;
+				label = "pmau0102_h_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_h_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_h_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_i: pmic@8 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x8 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_i_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x8 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_i_adc ADC5_GEN3_DIE_TEMP(8)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_i_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@800 {
+				reg = <ADC5_GEN3_REF_GND(8)>;
+				label = "pmau0102_i_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@801 {
+				reg = <ADC5_GEN3_1P25VREF(8)>;
+				label = "pmau0102_i_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@803 {
+				reg = <ADC5_GEN3_DIE_TEMP(8)>;
+				label = "pmau0102_i_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_i_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_i_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_j: pmic@9 {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_j_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0x9 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_j_adc ADC5_GEN3_DIE_TEMP(9)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_j_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0x9 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@900 {
+				reg = <ADC5_GEN3_REF_GND(9)>;
+				label = "pmau0102_j_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@901 {
+				reg = <ADC5_GEN3_1P25VREF(9)>;
+				label = "pmau0102_j_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@903 {
+				reg = <ADC5_GEN3_DIE_TEMP(9)>;
+				label = "pmau0102_j_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_j_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_j_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_k: pmic@a {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_k_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0xa 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_k_adc ADC5_GEN3_DIE_TEMP(0xa)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_k_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0xa 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@a00 {
+				reg = <ADC5_GEN3_REF_GND(0xa)>;
+				label = "pmau0102_k_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@a01 {
+				reg = <ADC5_GEN3_1P25VREF(0xa)>;
+				label = "pmau0102_k_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@a03 {
+				reg = <ADC5_GEN3_DIE_TEMP(0xa)>;
+				label = "pmau0102_k_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_k_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_k_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmau0102_l: pmic@b {
+		compatible = "qcom,pmau0102", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmau0102_l_mbg_temp: temperature-sensor@d700 {
+			compatible = "qcom,pmau0102-mbg-tm", "qcom,pm8775-mbg-tm";
+			reg = <0xd700>;
+			interrupts-extended = <&spmi_bus 0xb 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+			io-channels = <&pmau0102_l_adc ADC5_GEN3_DIE_TEMP(0xb)>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmau0102_l_adc: adc@7200 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x7200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts-extended = <&spmi_bus 0xb 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@b00 {
+				reg = <ADC5_GEN3_REF_GND(0xb)>;
+				label = "pmau0102_l_ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@b01 {
+				reg = <ADC5_GEN3_1P25VREF(0xb)>;
+				label = "pmau0102_l_vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@b03 {
+				reg = <ADC5_GEN3_DIE_TEMP(0xb)>;
+				label = "pmau0102_l_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+		};
+
+		pmau0102_l_gpios: gpio@8800 {
+			compatible = "qcom,pmau0102-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmau0102_l_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
+/ {
+	thermal-zones {
+		pmau0102_e_thermal: pmau0102-e-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_e_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_f_thermal: pmau0102-f-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_f_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_g_thermal: pmau0102-g-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_g_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_h_thermal: pmau0102-h-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_h_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_i_thermal: pmau0102-i-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_i_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_j_thermal: pmau0102-j-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_j_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_k_thermal: pmau0102-k-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_k_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pmau0102_l_thermal: pmau0102-l-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmau0102_l_mbg_temp>;
+
+			trips {
+				trip0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi b/arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi
new file mode 100644
index 000000000000..1282e5bae591
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmm8650au_a: pmic@0 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm8650au_a_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8650au_a_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8650au_a_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
+		pmm8650au_a_rtc: rtc@6100 {
+			compatible = "qcom,pmm8654au-rtc", "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts-extended = <&spmi_bus 0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		pmm8650au_a_gpios: gpio@8800 {
+			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmm8650au_a_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.43.0

