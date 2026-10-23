Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759177;
	b=JPgQanTX3WX8+7nch3I1P5dt3G8L8ZAj+BSbhCn9gUs+DIewHUgwPduUMlrrar7LteR5
	 XpHCO+BY1Nmk09kx89Cx3d77bjuKEeGCiT2SwnHAVpS/2OQ40+OmBV7BYJuolfZYzCMak
	 ZbsKMRml5UP9Bizn3flQ1C9YiI3rpWhJZjDkmHp3IfEBVjpdwsxZ3NyGTj8ob3h6hD6mu
	 R+UDgaf8gbCYWAaCJ1aY9o3zNIexlXyn5Uug5cpbqWDzwNNS5aGHeL5YELoQh9b08JG55
	 kRkI+06hnwx4zmQxZJ15XCPqp3ha0wkqvG910P5pErLNp0gRIdFxIOVz4yqFpsz7VYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
	b=heXcvKHJnA60B53cbIkV6Y4q/rK54J46GE1+d3fnYHydFHLwz2Lw4hJpIoz92IXCTIyj
	 PQ5UYc5mIzc4+gm3UM44mrWLDdAGfYKh0ZkMSoVzS3GbWDaZyZl/OwuD0/x9JrrLrwkFI
	 CYR3xvgX5tY3cLDQjeYIQT7oh9iIyXZSQVBKD9JoiIkcQgopH6E81+S9mTh82/uyi1Ej0
	 8GGQFVk/pgVPzn65jtGsUzz9dfrpWCedi1pWPvyk7IJ6QMgdEgoZ5DTVNl5/K+w3tZByF
	 vz9sSM03iZIEeaLs16GbiYoF/BcHVJdivVV6vZPD65xw8+qYOKciDUYfLztG6/2YtxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDjc0So0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSr8HrdR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D60606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D60606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDjc0So0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hSr8HrdR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAB0RC1444107
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0k
	upNfIcP4=; b=NDjc0So0HCHmLJaYIPm1SoH/WFgNf/QUmcVPxY3UTo0VvaKig0x
	ga2w1tqw+0Ei6O7Qx5PYy2dc08fO355CWRRDauyXzE4Esfg3cKGK9IsGcEELINBz
	Nikoobc8DUVGmW45UVA4UeAoI7/QjgwXZ2pdZNz1/jvgFz0kXvqMG+FzxLhP+d77
	qeJXYXmIVqqmOTOYA33EselHlLrW11UbJTkPgDu3op07dWGm+9qXhTAMJLf0co8v
	YyfYUCIo1StPihX2Esfyb81sAhyBuJEGaZvuV+absc/3+PJrKUOXLi3QVI9VeFx6
	Bbm0b0/wzcU9Y7yTtF4rSV2rOul3DWnlPxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbkqfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:39:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so169999785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792759175; x=1793363975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
        b=hSr8HrdRvdsR2dvF7o0nC9OaYMO8dFDX4KSppKxZYjYXuRS0EA0J28HjINs6zGwiIA
         WGbDUIB22gIFrnfjj9H1ydAAksw4FivDvQmNSjkFdDgRw3J+4kpGRRGq5Tut4HnfBlmZ
         2QOqzH4tP7XnK79yLH3yhPpBY/QKQNBJayE7XT7YFwYmXqCryOmEDJcriEV0zBN9DWoY
         WFb8vehCPXiUWmAuXUdAYFIX9h5Q4tEr7yLRl1Y+JQJ1b7LAhKnDLAKm+ImqcQkudVYH
         cI1rL9Sps+lgUgBicB4CwA0A7jtmTZ2ukTz0n2lyMjkfIwMVIBZtW5/+97jzr0CkFicu
         nsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759175; x=1793363975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjCoj1TeSYUJTHNSm8LnzG0tBJDF6FzWI0kupNfIcP4=;
        b=tPCTrtbrSm8kQt7d567XYf7kkYjIa9oVsVmcYVO2pjNZvEHLiUVdpmBLTw3P10fp74
         dkfKQSCog1F27+RjFUOKbhYraYsF9WwOkita6JUG80E7MZKoyqb+f3r3ajWUHiZ7M//l
         LPhGoqft1eIkPaAoFbBBKZDJUATph+7UY6zZwApE9bvRfZ7FMq1crY2gf6dbSkiGF70b
         3DQ0wgoIugavcoG58MnzLShCfMPrDwoADvVsj3dZE3Zi6Pm4f6yqUE3v5H7Cvy5avR2f
         filoyd5NkiIZPU3ReiCNxrS1AcynuW+P3+QjpT1ctI/WqUZAOkQ+iRkurhow8pSH1fhE
         egYQ==
X-Forwarded-Encrypted: i=1; AKwUvByTBtPCSM9ABtB2YZp9en3OSCp8JwHVi/RIxqjHytLi3b9Jv1HBNqugcAwHACPEzFVOV69XqoHoZFmpduI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsK62CEG6hTS1uGO4DOHX/2QoU3idgP32FQow6ckHRsjt3/mRu
	U2llOIdqyycibn0DcxmcqbAZC7BQ4KFDh6Z03/Cw4lSl04HXsCU6h5CihIcsbh3+iEktvKnKDID
	2K89nTnWkgQ7x1/rE72NBSzCIetfpnpzEL7QoPRBdH94v6qLV1rbHvy+qwLCeoaP6DGo=
X-Gm-Gg: AYBFou1O5Kpp8wIxUJC+25PzlJCA72t/p6qwpTuTZwZ9CbIL3hLTHTimfC+VVnvxfLn
	XbPXesFF4GwZaKIHs2ucozjPKTopmq5CjIEVf50X1OgQIwf4NLYjTXBYZ6ti4/TOYYjaloegUIz
	NOlPh+b+fLN7j3ebnfjSn+4cxS18bxq0gTfePZdG2y5AID/x26KYqhNvydyqm2MNB75mZOhtXnu
	U9hibevc4iBG3+UWMIPtDsiHE1oqbQBY1u31bzUqvjropvJvUnAeaSxZmsyf/mvCNjbfzDQqyOa
	yj7fQ7EF/wxnZVjDlLMdTKpHRNB/17evlfA7EORe5MwZmdZTbBQuMu5EqB4xc2EulkEisYz9E6I
	JaUTeqSh6A26TxD8hs4s5ILAnAiRROlmV7Q==
X-Received: by 2002:a05:620a:1786:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f627549fcmr851066085a.24.1792759174674;
        Fri, 23 Oct 2026 05:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f627549fcmr851057385a.24.1792759173411;
        Fri, 23 Oct 2026 05:39:33 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b74b:faa1:2e99:5c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3805761fsm4935816f8f.47.2026.10.23.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:39:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        stephan.gerhold@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Fri, 23 Oct 2026 14:39:14 +0200
Message-ID: <20261023123914.8641-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX5lGLy57ZDofZ
 NYCJg1OTTtawkbV0jwARCt0xgjxf0+v0d71KhAj7whucMXxaHu9PllV4H/PTyxiAkbbX6SNrxiv
 80YtNnCMuP38QjCzEyh0Q51m6cmbnXY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfXzyqwJQWpledw
 hmldOi88mAsR4W+vvKuS8L9sQVzaeLaQtJxmrmy+Ne3KsmJzHixrU9Ere3aXrfaKXfbo/bWbwYG
 DzPIpr30iIFPE5T2A0BVosGuW5cUHW1q1n1xWQNE/RQOiiiHK9i3dkkc0lNyr4Htcz8HklUf6ir
 sarqTCk1fWfEmxD1NyhDzLvMSwoiNZfssWVDfqxLAguqd+Ys+z8U3IrNTmwWr9MLeBmh8+etWco
 Tg+PmOqTMMD/U/b8LcqMk0y4+Es10wr/gU1Wom8e6TydbaXLBZVQ4k0LDHGt/CS58ZbogaPKEnJ
 +xbZRklKODz5+OtRsGxMYNhbhMtuAHx2N4esGKeiheMXWnhqwSAgm96H3jSkBBBLw669D5Db/jf
 7f4JdGwfJS21yikZcuxbyH49cm+0FMOkatxmKQo+NGhTS8GTscpFCyP4tvz9kD4LWuDrP5miIs3
 8JAtzqJ66uyS/fl+BEg==
X-Proofpoint-ORIG-GUID: Xvg7x5LNjxM8tfg2oO-wRyYgBAPVEqvp
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb5587 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=W5eknlhPjGTqicOx0vkA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xvg7x5LNjxM8tfg2oO-wRyYgBAPVEqvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230049

The ThinkPad T14s needs thermal mitigation under sustained workloads to
limit temperature rise before thermal shutdown. EC interrupt-driven thermal
monitoring is not yet supported, so use the board temperature sensors
exposed through the PMK8550 VADC to provide mitigation now.

Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
the keyboard, while the fan/heatpipe-area sensor faces the back cover.
These are internal board measurements rather than direct measurements of
the user-contact surfaces.

Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
Celsius, derived from observed platform behaviour with the Windows
balanced power profile. Map the passive trip to all CPUs and the GPU,
with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
Name the trip "backcover-ec-alert" so that the planned EC support can
locate and adjust it.

An earlier approach using staged CPU-cluster throttling did not show a
significant improvement and introduced a latency imbalance between CPU
clusters. Keep a single passive trip to provide timely mitigation.

Add 73 degree Celsius critical shutdown trips for the DRAM-area and
heatpipe-area sensors. Retain these baseline thresholds pending
sensor-specific hardware validation. The reported Windows DRAM threshold
of 115 degrees Celsius has not been established to apply to these VADC
measurements and does not justify changing the shutdown thresholds.

Thermal camera measurements indicate that the readings primarily reflect
internal temperatures rather than chassis surface temperatures. No unsafe
external surface temperature was observed during those tests, but they do
not establish qualified critical limits for the internal sensors.

Expose the remaining sensors as monitoring-only zones and enable ADC
threshold monitoring on the corresponding PMK8550 VADC channels.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..6909458c0996 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -502,6 +502,88 @@ platform {
 			};
 		};
 	};
+
+	thermal-zones {
+		/* Sensor in the charger area. */
+		charger-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		/* Sensor near the CPU PMICs. */
+		cpu-pmic-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		/* Sensor near DRAM, facing the keyboard. */
+		dram-thermal {
+			critical-action = "shutdown";
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				dram-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		/* Sensor near the GPU PMICs. */
+		gpu-pmic-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		/* Sensor near the fan/heatpipe, facing the back cover. */
+		heatpipe-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <500>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				backcover_ec_alert: backcover-ec-alert {
+					temperature = <57850>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				heatpipe-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&backcover_ec_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		/* Sensor near the USB-C ports. */
+		typec-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+
+		/* Sensor in the WWAN area. */
+		wwan-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &apps_rsc {
@@ -1285,6 +1367,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.53.0

