Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA83D3002
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749927; cv=none; b=ck7uV/L1wzojlS/q25U558mGyfufzBWFrLIlyQ+b3HKgZ1QtkzFERVTxkjxA59xl+qNGDtpY8HlNkgA3NpFNe/XepSfj/16akvazjpakfVcp90dkAFzmRM+ukVQiT8dxJgzn9Vg1PTcIdj/RcI0qIGZGLInvYEcqX4LlZorUoVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749927; c=relaxed/simple;
	bh=bbARdkrRuUy1baGyZrTM4q3SSSMqbiE+i9qs4b/uJ6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfjTXLNVcHSeJv8RIc4rSH3xrS9OALf7OB8ouPFm0PDrv/PA91DtswQbt1Avg8LO2jaDfnQaPGXFFf9/lIPvczOrbbPNX59bdnMIyZmYUjkZVDro9U4n2ufkqRoFWP8vRt7tXpAzrqfSHsFYrtN0bWTYJH/P7cHUTo6gBQ5Ui5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBPxUjfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aydyW3wu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBPxUjfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aydyW3wu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3VYOE1887251
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=; b=FBPxUjfwOungg+Ai
	tTTiEp+VUThgBQP/kBObXGPkhwsC+GbHr48RRUpjnAstwJGQLPILoPE/mx+S6e6A
	a4wxSdkNa5lDE/m2O2dud/TYpu7+7v/69xCyDnL9uKKHzVRDnAbx0MehwJKN/buR
	5iZ6A/adW/rPyhjxyEuIsMvoYz9v/+4yUV7NmSp7ivl2PBwW97ywgE7IRGjZeKmV
	/mW/zM9EVAhZEFA2ddeLP7fAcMlBzVtUtcXza8m+QeS8XFoIbGkSWVMJ3S8Aa2Oq
	50JmZ8w22kyT4HhHwtQadzmAw8HYGk714STjeFNZDpQFvbKVNQH9hMR/87NailQ5
	3K0qsA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn0n2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2040329eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749919; x=1791354719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=aydyW3wua6YwKxhAW1GEyEoJd71IoraznwmMVw49vnWYUqVgHg8k7mIXsBToKpP9Mw
         YDHi5QE/0ykgABYVBKrdE1hmmIdET4gaqOvuj/WtbuH92E0rw3hVTAEAEOClwhf1lgib
         lsPH9gBKDx/QtG6ooDdH7xWUWuThlbeTcKJMD+V4xDnEGRuuoCoV66gcSEx9YUYmTLA3
         ovGbL8dQcF/KNccZXAxCu8/8Cz+2GRWm+oMndKSVUGKf5Lxh7dIIu2kAYDzu7Zdsk+DF
         rwNIH3/wFczyRXB1kXo1EpoT9zqhhYMSbk+T90DJFOeSTW/2LoDUhQEbE2a7Yzygb34c
         +WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749919; x=1791354719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WX171eKHyAOX5IQWYlUG58Bh7sPJmrfdP8AK/4hxd8=;
        b=214hY5SnGBI8yibeWr8ukg7VSUrgQ7dW3hMztaWhwvLXsgLJ4P8pu1e2+sfjbAawnl
         rV0hVsQnQ+LOT44598yNaeVHj20yUZNRBJUMeZx9J1uON6IRroOJco12iTp37hx6rG/c
         WJdpdJ9WeF53w9UkFBQDK5YTJHBOygU/uq9nk4di9fOZe6BUG4Sz8LJvGH63cz5+8KZt
         dOpriGxrBNFhyf44k+R4dTR1L/vYo383qqWUvVRKXCDRA14V90lhrw2u5wXG8MA8TGcu
         jYiBd11cLhss8Jvr2mJ+U9aNnYTbmSDeh9XG/nEpLrc34ezZkEkjGz7rGhQtvqcMHuFk
         bUCg==
X-Forwarded-Encrypted: i=1; AKwUvBy1jQQ8iiGF0+IbHEqUKri/KypI73RUMge1PWXDna/t1+8besxbw8Hx0KcsGEKqtB4pxO/G9lphzJNRwr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmSNUYo5dneP//PN3FbLmKFEFhrI8y1vEtaNRAxgzZ23zPhG3t
	3Akpg5w/lGkcco4Dg1Evc7T/0bzYJc31lTR+fnXxvPAyDT4M2hfpEft3XUXpNgD2YMgGwb0o7x/
	AiA4313oyRMP1BMIFJT0KpiGrazM5EcUjyxMt9iKqNCPOjfAzpPIEJ+AdnT7vj8Rc1v4/cdwgtw
	ErWA==
X-Gm-Gg: AYBFou065yTwuS7xIjR94U3oeAvj2AhXr3RHiKjzwPFzNQdVF0kGC1z1vxQVojBCKLO
	N4g+6sXu3ctaLesnCpUfauxDjCOW8w+IKbvFJS19lq1THFi3YNjthX+XS/f7n4e9pZAy2hnjkZb
	RZoLt1GPuswr/KpN0lA/K9F7PI3ebbtkQxQcBRgzQ++AVW7GzweiiEU4wflkjXtLx1AOw65Anho
	tkGn+YW2RP1a1vSl7vV9D8SKpVUUlAs5BoxWR4PDEDrk5Q5sUYhV52+20y5kLzeu1HW5CFfkXhC
	wKecDtrnKjBtS2sWLI66GGPYVxTp9dMFGR9L3nLAwM5bXGcuzEb+E8kGE8eyz6h89j1AmtPOsQf
	eiBeiOLzUI983HBlyvR1mfseBwi6JWKVT6KzhNIZ3B9geqPzw64c=
X-Received: by 2002:a05:7300:3e91:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-34cdb5f6424mr752990eec.13.1790749919212;
        Tue, 29 Sep 2026 23:31:59 -0700 (PDT)
X-Received: by 2002:a05:7300:3e91:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-34cdb5f6424mr752958eec.13.1790749918483;
        Tue, 29 Sep 2026 23:31:58 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:57 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:26 -0700
Subject: [PATCH v2 4/5] arm64: dts: qcom: Add PMIC support for Maili
 platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-4-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=3595;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SHZeKzvusHFNFuYOntdlEiI1S4ayexSEHJ2wrStFqY4=;
 b=oprSuHK50cSe4r2Xsl5Efs2xMwZoDochcJYP04fW1Pm5XGJ/ZJmros7EAWynzythjZvEIWThL
 XF11RJ8RbazCpEc9OTXiaa8Ypy1QFUniukAsmWNoL49jEXrlKfvi7cv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcace0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4ECTE-F74UkuUx1KzIYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: lcMxq2tya9zBfz-DUGn4sI21gwEnwbx1
X-Proofpoint-GUID: lcMxq2tya9zBfz-DUGn4sI21gwEnwbx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX/IXGFtNwy02Y
 avSZnTHZyAjdpNOKi9aGyrlIy8mVSkfNc7vCdaStO6S32l5JwLnRAP6SWnPwLzoaVrGZrDMeyBB
 JyO8mSM2WYT4RFijJrChL6iIjtYG2IW1gVxhfATK2qpWRHfJDCWLitE7pXSboUZgGrhB6qPi8ZF
 2vU8Yb3ON6X3Smc1s2yluMvjW+dVNKe2MUGPv3bEiXM/qvo8sjEfjghKvxSPLbtf3ar3eAc7Zk7
 nENIu2BSPDTQ+l9QrCebQQWnbd79TeW4PNa3mtXALZ3t5insGXSKwwQ7Px9kvi0DmnDK5/SWoi4
 f2N8U2WxLNE/egdPov4zxnMFcJLChk45phdTSm35zhrgsWdFVte+cmvt6ER2ZjlEPkCe07ybMye
 RkZNk8R3Bo7pPFfFxtXWLwfxegix044BwDiIlKMSg1Mr5dDkLZBkIUAzvDe/UIMK+/8aQloy15n
 i1nKr171Hb00XfIJDNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfXzDdvCpm/uX+Y
 0FwvBFi5NQJp0gTNMzdzzs0+XE2IxCHfvfM2RFXtJbwh/xIr0HMtE3bxaxFe5yfwMH/WnHx+EgP
 dwE/uKW7g2zoc39MxUSdXELa53CuF+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Add PMIC files for pmic-arbiter device used on Maili QRD and MTP boards.
Only one PMH0104 chip is used on SPMI bus-0 with SID 0x2 which is a new
usage, hence add a new pmh0104-maili.dtsi. Also, add a new pmg1110.dtsi
to support PMG1110 usage.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmg1110.dtsi       | 57 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi | 57 +++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmg1110.dtsi b/arch/arm64/boot/dts/qcom/pmg1110.dtsi
new file mode 100644
index 000000000000..31b05003b843
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmg1110.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmg1110-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmg1110_k_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmg1110_k_e1: pmic@9 {
+		compatible = "qcom,pmg1110", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmg1110_k_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmg1110_k_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmg1110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmg1110_k_e1_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
new file mode 100644
index 000000000000..2f3906ccaa73
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmh0104-c-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0104_c_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmh0104_c_e0: pmic@2 {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_c_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_c_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_c_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.34.1

