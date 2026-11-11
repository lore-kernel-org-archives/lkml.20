Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369651;
	b=DM1/Wn1KHSby8dnvGrNdcZ5+4c1jfmYQT/TkX8y73n4JelVJdY5XTeKpw9SvnwY5fVw8
	 dAnqNqQJWPCFu3FmwxLRql2sjv65Lqb80lMh9DpejfyeF79BjG4oIwHn7xQQj6kYe3jtd
	 uO1yd1T94Bpzb1vHE+34CBm6ArLxG8/nYcdaI2qCllpt4kXmPH1I/r3BcdOisIMFcy+LE
	 k1KzZe20WEDYiv5oMqtJZeow1OylO67XvEXmwiaRzGzE6A2nlH6dSxTRRc5qW5rgf0rOH
	 zxkcIB+8rM9PGxD95MifvBksWmobt24zRJmk745SXgBEfL0xjJOPcEMMwXtQZfwbh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=upB0ouVtZOf+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=;
	b=GhZjnYnEry692oP0nKwh2an4VKWwJs3MWC4MPC8j3mi5N1KdjJwxdpC2F2N6017l6H+V
	 DLQnCMtEqS69Kj35IyiuDkzBug9FKtgONg044+Orp4MbfqSbMDS9Ov0AGLRTrm+5MCqA4
	 tAiDiQ1ZaAthuPoHB02NjMG+x/YKdbng99l7NTr69miVurTjwVomBlQg0dlLUhu51DhR4
	 LwNTIKvK12ghgiZIGCfaWfdLEC3elb9VttinoMAm5wpUF08D3v+yH6eXk/8pZO46s/QBd
	 ctU0/QG2/St9U+CSciODLuSQHYAE+37CEOPQN/VLhcZxY+GenS66axSSQWWTBlGYu8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QVwU9vAV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c5Ojbi+E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F4606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075F4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QVwU9vAV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c5Ojbi+E
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tefI1569906
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=upB0ouVtZOf
	+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=; b=QVwU9vAV0D2Rmt52iM7GbDK0ZUF
	P8it315DAzJoG2UZWv21dz6PdgDtIgSMBwpSjzGmm9v71hEKvXWPMk820VwGhf7e
	MZGR61Zf6z6aTCvuax4aPc/2lByy66GCL58AmDt487z1synAjrkruDru/3WGXHL6
	XV+HTOv6i1EoZ5kNJsMAKRMG9NVZ4u/KZB7tMuU3ROAlTezkVXNvQcX2fsEi9U9+
	t/pahaME7OFWXpz1aPAnrdnNUEdiObHtUsA9FQa4VQt6QNY5je+RqILnUgmHRGtx
	0I8E+eAdVQzs02+Hz5SEv2GLRVxN8LtvN8tL5J4X4nWoZsR3AmdnXmMTGEw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c9sqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:00:49 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso3187754b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369649; x=1794974449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upB0ouVtZOf+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=;
        b=c5Ojbi+E2LgwumEgCb/6JydZkhh/wIqJqX8yS6tL2RBtNdNIUVM53BLvClvSSnE/6T
         RaXXKuSHOg4uGBi01anpuwuNhsjbV1+YSGr8Jkts5BxlmPUJilUye7MfWHHHWDfZLGz7
         CrclqBszq6lISxwB83e0yWwKArtqTeYR+0w1ZoF1l9IawVnXX2VhUglHMj6Bth1D0yx/
         yVJCAZr5Anhmx3XCFgDfxggZ9SOBYkUpHWdQENlqYwbghGBaMczeVI2jR72wKD/MjIhV
         GAflO3JttWsJPNoYEXSnhJTY6zVKlZGutNsHgmsc1gkVqsUpm4968WwlnyZyDBP0Prbl
         piCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369649; x=1794974449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upB0ouVtZOf+OEcwqHtAfiWAPnhttfHkPRo+6pw5sjU=;
        b=0SBicMwlPcViLEsH6BP2cDgW5jakmcdcF7a4P0w6kIyBhZEoikcym/vVm2vK88r74v
         HJuZ7cFRBsnN68hS9jY0B3f7eECH/Qq/LGQKM1Z1idLljstIi0nM6p69L85I80tM8jwV
         5OY8iEz69FaySXobzmrFvnv23hzKn1R+BI0poRxlrT0l9JFn1E44yD19rmS8sAMsX6Ju
         XjStdQCg9lJoWgTd/1R+oEDdaHgNWpQsVORU33gocp8L6s5H8SQ8/yMCxJYuNLXKTjQl
         U5CprcvCI3aZGpUC/23+qj4sgeOzyQHGJcz1E0EasVVfGl4UUoPqd8/xLp6phKVMFiAR
         34nw==
X-Forwarded-Encrypted: i=1; AL+hErG927R+gN7fwggYnr0y6NHzPwc9pTiloqK3hY/+OMm/bpQMNHefuHzpe8uaKk/UeF7y1iqU8VDArKfpi4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uz7ZAO38VhrjUka6zwvxh3giatbEz5J4UflL9FZm8kLpGZT2j
	gnXeU7uGGKN/WczfW1uiq2ArnShyg0RFrcDvE7r4vnZ+jWv9f0rfulQGU27iKZ3JCTyUQJGxrFO
	L1g0LcC33q4hagQS9MTqh+VCbhmF7G3PgOtGhpLxAISMHg1V6sB6oP6Kpn1t5iFVirzM=
X-Gm-Gg: AYBFou3GQyo26SXQLFuNINZmre4CxOhamguC7yqWEEB7fAXNGQ/7p+gj0Z8nj+kTi1Y
	IrOl+DuVRwjn+UIg96EVxYP2dVoqjKJHCo6iyml+FvtiLWA60bcBxYV+q5UexIxblRc6uP8eIvc
	6S++asrFNE5GrKtWymWtI0B3fVVUIckDBMl6VjdLjGChNM/jyv+PRFM5kxaMr3MN0qspXmS1Vvi
	6RnTBTH2Vv6D5tdiSA3M9YPwDwxmwSSJ37BKa4B6UcFkYz9dISsB6YuKJdXhlXCVGWjDqEalOVW
	bB3MrSX7uBMe8iyC5CnLafs7DQPFvBl7cndquKcV6ajEr64j7ME26ldEL8OEL5ljbZcfagZqdML
	vL8wirUil+8H1MyiFqlMPxpI2l/u/s7yh4+7x8qioNPIV7lPnKjoLmd4gihX6fGc4uWyPgs8arT
	eGS2/12HpVZgkuDwlOG8vOCelc3a3ynGzy
X-Received: by 2002:a05:6808:16a4:b0:4b9:a8ac:480 with SMTP id 5614622812f47-56b9710037cmr964662b6e.30.1794369649005;
        Tue, 10 Nov 2026 20:00:49 -0800 (PST)
X-Received: by 2002:a05:6808:16a4:b0:4b9:a8ac:480 with SMTP id 5614622812f47-56b9710037cmr964637b6e.30.1794369648518;
        Tue, 10 Nov 2026 20:00:48 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:48 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels
Date: Wed, 11 Nov 2026 12:00:19 +0800
Message-ID: <20261111040021.3636059-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
References: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX2CgPkoL5p2Sq
 /v43UNaVqg15hy3jwB8q3zyIdy5KrkJDr9JhY5WWFfrG72Ol0t88NnFMFu19Q2Iks87CdGZJ47k
 pLn9kv/ecoq3HoXbSGyXYgEDOvZSgS20g8z+10b/Wr4yt21Dvo6DUHJw2KAz3bPIeMtb0xSZNYd
 9XR2iUHys1nhRt1wY9bKeYDZ0Yg3F6xfFSSUTtdtHuj2F2J0q7G7xfVGW1nbqIPqdlWF6sEhAWP
 A+tuSnIjUxw7Qy4HAMn8p9uW1NPhGs8VO29Nuu490P94jNcaXDbM7aSsO2gX161hRUHBPNbdoGU
 wovmFxttYBUmydxUrdltRdoMpXwMTi8ZZ+1idLn782ROrGy1DxoxHZZPgLnW7N//twKLIrlgXhr
 KJ1ZMuR6w8WQ4XYcf2A0LzP8D3nIc8jmvFyPavSedyAv+4wFofyl0+p1xMGu4FulFY1uGCBwmPW
 Q196uIvI4aO6zcj1XLQ==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3e871 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TEmDzvwZ9EAiO1TzxhoA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: eZZOvEtmPavGK2gEiAoO2Ey3WGbDZqRQ
X-Proofpoint-ORIG-GUID: eZZOvEtmPavGK2gEiAoO2Ey3WGbDZqRQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX+nNI9NMqNl2W
 YPBjr0muCT8tMcIyc1yMt9iG7cjPU+mETDwXx0+VuOiIinam10yYzwnDXLw9sQTZaFZAw2F27bb
 +FF1IZe9cgEY+G+HNHjjy2Jalxf+A9Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110015

From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>

The PMAU0102 (Kai_MV) ADC5 Gen3 controllers only expose the
REF_GND/1P25VREF/DIE_TEMP calibration channels, so no board thermistor
feeds the thermal framework.

On Nord Ride, three Kai AMUX pins are wired to thermistors: Kai
instance E's AMUX1 (SDRAM3 THERM) and Kai instance I's AMUX1/AMUX2
(SDRAM1 THERM, UFS THERM). The remaining Kai AMUX pins monitor voltage
rails.

Mark all Kai ADCs as thermal sensor providers in the PMIC dtsi, as it
is a PMIC capability, and describe the thermistor channels with
qcom,adc-tm and their thermal zones in the board DT, since the wiring
is board specific.

Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..550cd7fe0ac1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,62 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	thermal-zones {
+		sdram3_thermal: sdram3-thermal {
+			thermal-sensors = <&pmau0102_e_adc ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sdram1_thermal: sdram1-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		ufs_thermal: ufs-thermal {
+			thermal-sensors = <&pmau0102_i_adc ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+
+			trips {
+				trip0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				trip1 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +422,34 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pmau0102_e_adc {
+	channel@444 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+		label = "pmau0102_e_sdram3_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
+&pmau0102_i_adc {
+	channel@844 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+		label = "pmau0102_i_sdram1_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+
+	channel@845 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+		label = "pmau0102_i_ufs_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
index 47ea145f4abb..26c4d126a23b 100644
--- a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -31,6 +31,7 @@ pmau0102_e_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@400 {
 				reg = <ADC5_GEN3_REF_GND(4)>;
@@ -84,6 +85,7 @@ pmau0102_f_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x5 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@500 {
 				reg = <ADC5_GEN3_REF_GND(5)>;
@@ -137,6 +139,7 @@ pmau0102_g_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x6 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@600 {
 				reg = <ADC5_GEN3_REF_GND(6)>;
@@ -190,6 +193,7 @@ pmau0102_h_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x7 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@700 {
 				reg = <ADC5_GEN3_REF_GND(7)>;
@@ -243,6 +247,7 @@ pmau0102_i_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@800 {
 				reg = <ADC5_GEN3_REF_GND(8)>;
@@ -296,6 +301,7 @@ pmau0102_j_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x9 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@900 {
 				reg = <ADC5_GEN3_REF_GND(9)>;
@@ -349,6 +355,7 @@ pmau0102_k_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xa 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@a00 {
 				reg = <ADC5_GEN3_REF_GND(0xa)>;
@@ -402,6 +409,7 @@ pmau0102_l_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0xb 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@b00 {
 				reg = <ADC5_GEN3_REF_GND(0xb)>;
-- 
2.43.0

