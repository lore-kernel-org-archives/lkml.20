Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199694;
	b=24D57aPi9Oe83vn3Jjof15hLgoNg5gh5tMFVZcc6mmKTPCCejdOqM5mlpnqizxsqxW+r
	 6p8TFJF+0fTYqZZFn53Q08YC9gED5ozOUM6n4z0BYsunxmgA0W/w1akcUY8EuVUvzHoj0
	 9KqHI0KGrnEVylrpWJ99NGW1oXTQuUgLEOXl9L8oNA/oNZPRCYcwx9/cbqpeBFvuNUhz2
	 ugWqtVsbgMLoS4NEaY15lULhzfgQPP+0umbQSUCV687Yallr1vvrEhaAovXiPMWD4i7Ie
	 sueIDx4NqthDyIeINs7LEfL/VvJ/HQDqSR2gDt5x1dlPJhjhtNON6Te3p8FaakldPKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OHKjjVSxc0=;
	b=bpG+X2aHphs84qd6JY9P4bBcuPyABhoJdxWJeiKhVlugUIzyDDq0mx9kSMZ4e0YOtRuy
	 6Z6X1Fo7urVcboSJtO8PXLzpbpgH82GvB6ufDCaFV80qIO0c1GKk0GxTEvgkMzyI9Lt8B
	 tgtYivOerIE6ZJq7+OYEmFSZ9QWW5c8BL8PsQMhQRSycx9rKZYAVdpKFFcpEHSP9MbYgH
	 kuMr00yk1fXKHPkDIOK74WyQj3SukvPhJ2neyEQL5Cd7vQ9IT7hC3J6A0VWyye5pIe5f7
	 yP0slDyTySB5cf7146GQJjG++XGR+biY9JW3F81HcAGXUA5SuUkQYumOUY4x12FXL7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocEuvsfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RIM1zgF0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA28606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA28606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocEuvsfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RIM1zgF0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3ue994580
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OH
	KjjVSxc0=; b=ocEuvsfsZ+/Xc/e36P8+/3bUH807NE4Rv3ziCka8UEl0ZQ71+mR
	GjjrAiEfmlXMWOnbLc1RqZZzDK2wD75Eo9sOIL1zkzHYSfHw4JHFcKTmD+JWMXI0
	Y9wvlkYNe15QIrL2QYQBhERwsUrxHoyaxjQiCSzTiOX4ONZGDCVARHYEoqZ+InSy
	MkJgpsU5aevHhuXzGBupQQdxmyOVhnUAXuL9or8QfR7t7dajUtn3kPOi+xDcf4HJ
	S6iUhlYyhRqJUWhj7PpMfNII/23m1fuYAlUly4uFqxluNcCJuZmEcOWOE5b7NFC/
	d4EMlsvXPUiE2Kg1HFWu5w0Ro7hzvTCCE1g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttnqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:01:33 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-466d41a1d9aso1478833fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199692; x=1793804492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OHKjjVSxc0=;
        b=RIM1zgF0uyIb29A/XqoGhAKKc7jjkIBjli6UFujB/AK4NgGq+J8Zrx5mEKNB9RowYV
         cZWW33nJ24yP5vYG9dC3a095ri9L0dDQ9elD8JwtGdup6nTAVZ0oElSu0YXbAjP1lr7c
         RptBNVNiTLT5DSsjINblMldDRO0unl5sfHjRO1sP8JnO9RWRL5ArizZ7mtozbcp3loxu
         5b36zqN3P9GDIBQBcZvrkwuknzN/Woe8uYGGzbwR0RdA2TZcSyQHJCvuVBoedxP+IKZC
         mtwB17ih9Av7vM0+D+dzuf34GHAKsefq+QWAsV4ZnirkKJCcBqsEapEOz6D7O19dI6E8
         GQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199692; x=1793804492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaztAnaqSfIDZNJ6wRsfUsX/DhqfBQ+S6OHKjjVSxc0=;
        b=osGLlerXhr08VyYZmXRg2OMPLOWPj6zQcnpL4NhkCi7P1CkAaow1Rfe0Fm4ht/PzCv
         Ifr+7zJxtlrLmYFP0goHeNXnyGovLIq+o4mYlHuw8NLETqim2uV4OnDluaQ3rXyc1vl9
         gH2dnNkWPu3rYyvbYbFmKjh72wcoofiuC+bzpLz+lkRwb/7LzZ6t0FInPp2E0gBwjQ+M
         YBzZnyyTjrSIdQ6AacdD42m3kQR7VxtCSk15wtJg0f/AeLkjRz9g81HR7otweNJ+OE/o
         05MzFzW/KE+aWXBei88h24TxsWjftFqH88+qZ5KMIqPLa0A1lIJDh4BTTCOvEw9dE51l
         MtdQ==
X-Forwarded-Encrypted: i=1; AKwUvByuLFiUUjUh4V8Ug/Gn/0DbzbQ9HdBNPPY4ptvXflsSAR1m+zn51TjlVclfRDUYlDQWiiBQzLiBWW1v9+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh83hm5zCEe/uxrYN12yFXBwJI49E/toUVoznIJQB1RAYynlsA
	T/H021Oeu89c7xAQhlz0cwMF5+9hWP03QrzKnop671djEyf5ogKVFOMW6mUdsmryidfjSYQ9lyn
	Lkge3J3KrqVrtFspu/AKFdAMXq8aN6zAWkJl6kqXhVFt6Sn+gu5gwMVk/QXEb3mXKqwI=
X-Gm-Gg: AYBFou1dI3o1I0SlB9QyLI5VijdytW8/b/+thAdQtgymxCiqLmx/fmx70GjusBinycx
	kS9m+t2XR7w6lLLA9HVJoRjPaJLULOVPY8QPmnYDhA06/R6QxkPU8fdatdicCgJ3n6Hl7nq8+UF
	IVgMM72TJEGTNIS1ugYPECJtZ7en54fo23Ijl8V4AW9TkVeTCHGPiITK53QHELBTwFTUvSiQCiI
	mqP6jTeEYegZp2yja0kvX2bvi9WacQkIktyiyccJJCvrhAPXv2JaBspaTu5c529hTCuU0p8h50t
	dOQOjcFgX7rEF6CXy3zt8oWbXA9GNqCGIZDgWrvsbxTCyi01Q28kuL9w9ExHGN6pbiw76Tznu3L
	GKqxCORVAY8fehlHgmyhksBAeRQE2/CDzYX/c7+0KTXVlBD69uODVT1UXRxpufIYn9IsgrP7MA/
	TzuKL9+sY0fjgqIBynAnP5N76wZjehBq3u
X-Received: by 2002:a05:6870:d14a:b0:45e:d1cd:5e80 with SMTP id 586e51a60fabf-4a8bb4596e7mr1975086fac.9.1793199690650;
        Wed, 28 Oct 2026 08:01:30 -0700 (PDT)
X-Received: by 2002:a05:6870:d14a:b0:45e:d1cd:5e80 with SMTP id 586e51a60fabf-4a8bb4596e7mr1975018fac.9.1793199689830;
        Wed, 28 Oct 2026 08:01:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm2377954fac.3.2026.10.28.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:01:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor channels for Nord PMICs
Date: Wed, 28 Oct 2026 23:01:03 +0800
Message-ID: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: IXZ2FUJ13hQ2lf_9mt_nVLOVEIFhtlkv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX+yEXbDoSxAN4
 ZVdK3Dw0/cBkRTGsmrmNSiHGek97uSWgrzqlDjOW/5cVYiaWm/7R+vO4Zb/jRejAY0J9Gdt+p6V
 PQo2GOzs0RSRrBq4GOT0a/84HEn1DRw=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae20e4d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nZyv9QxdcDg_KAYjFIwA:9 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: IXZ2FUJ13hQ2lf_9mt_nVLOVEIFhtlkv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX7NlAWq1vXkZF
 qzezXeROwlPX1SaC+jmvHKWuCG9YAV+7/nTXiWuf49aSmiQZtrY/q+gjjwEfNYF5TfSTAkqwtKp
 UDzysVgsu2AqEl4PqcVNqXPjzkgU2a98+39ZXNcRPeXn4z4VRBzTnFUUdCWLS58BvMCA8qZJYFY
 l/0NtAQKf3RlNH1uqtxQrjHYMahU4WxRA2Tgx/zTCJkeDbrcoyqcxF5FCSG5KDFL8jB1R6j0ote
 zAJx9lsEJ0B/jypd9iCQg24kpfXQSR+s0P6gPkKdJ1qWYiowGFJeQcVdbj73x/nqldnnyTUDoai
 pfX5xHuMORnxDmjgzxYtjMAsRmZokai9xsTGITH2Yd8o5k9Xj04DBS4qTxSoNwySdRTJDm+bZmj
 gSn0UarCdjWp8IxfUjHhLBn4Nz+3XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610280059

From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>

PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
AMUX thermistor pins are wired up, so none of the board thermistor
rails feed the thermal framework.

Only 3 AMUX pins are actually wired to thermistors on Nord, all on
Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
pins are either DO_NOT_USE or wired to voltage-rail monitors, not
thermistors, so add only these 3 channels.

Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
and a per-channel thermal-zone for each, following the existing
Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
ADC channel.

Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi | 80 +++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
index 47ea145f4abb..6230fed2374c 100644
--- a/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
@@ -31,6 +31,7 @@ pmau0102_e_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x4 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@400 {
 				reg = <ADC5_GEN3_REF_GND(4)>;
@@ -49,6 +50,14 @@ channel@403 {
 				label = "pmau0102_e_die_temp";
 				qcom,pre-scaling = <1 1>;
 			};
+
+			channel@444 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(4)>;
+				label = "pmau0102_e_sdram3_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
 		};
 
 		pmau0102_e_gpios: gpio@8800 {
@@ -243,6 +252,7 @@ pmau0102_i_adc: adc@7200 {
 			#size-cells = <0>;
 			interrupts-extended = <&spmi_bus 0x8 0x72 0x1 IRQ_TYPE_EDGE_RISING>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@800 {
 				reg = <ADC5_GEN3_REF_GND(8)>;
@@ -261,6 +271,22 @@ channel@803 {
 				label = "pmau0102_i_die_temp";
 				qcom,pre-scaling = <1 1>;
 			};
+
+			channel@844 {
+				reg = <ADC5_GEN3_AMUX1_THM_100K_PU(8)>;
+				label = "pmau0102_i_sdram1_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
+
+			channel@845 {
+				reg = <ADC5_GEN3_AMUX2_THM_100K_PU(8)>;
+				label = "pmau0102_i_ufs_therm";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,adc-tm;
+			};
 		};
 
 		pmau0102_i_gpios: gpio@8800 {
@@ -449,6 +475,24 @@ trip0 {
 			};
 		};
 
+		pmau0102_e_sdram3_thermal: pm-e-sdram3-thermal {
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
 		pmau0102_f_thermal: pmau0102-f-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmau0102_f_mbg_temp>;
@@ -501,6 +545,42 @@ trip0 {
 			};
 		};
 
+		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
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
+		pmau0102_i_ufs_thermal: pm-i-ufs-thermal {
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
+
 		pmau0102_j_thermal: pmau0102-j-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pmau0102_j_mbg_temp>;
-- 
2.43.0

