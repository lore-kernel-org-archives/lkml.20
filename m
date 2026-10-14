Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125E33F5BC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006540; cv=none; b=OTfFue0nHgJASvVS9bney3G9OibogKU98ByorgaFALYA2gQLOrTnSZAwYtCcyF4XzV7V5Uoy1yv8Megvy3UlWrfkRVI1wkzWgVzcmnhTVa5R4qZUmpEJoMxHL1nDo2VTnm5ZQ217aS8KNVACM5XAGwQLAcPEcpcRah3DEBf3jsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006540; c=relaxed/simple;
	bh=Ui1dR+HW9r3TrNBMCqytOQtnZxBQ72d+7Ju5LMdSVwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qBvaHw1ZQs7pq+4VqQ8KSBuBnusToamNu31VxiqHqrZLw3tGVE3ItluvhsXRb0aFqekTt9uWFp2UbiPTFM4zKzLpb31hEzatE0o6G3POiHJ8T+phNGvwNH8laQ270e+EWvKAFCet+uTFZaMouLwefWyYKu5NLhNhGY1VX6jqOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BagkBRP3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfD2Nv9K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BagkBRP3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfD2Nv9K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJrd152402
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nvdpGxbjJs8cHdfNMlq4bw
	73ybRY9Ryx4fghjxFv41Q=; b=BagkBRP3zD25QElnbLcfT+Z9lad94TaiDKfXsM
	eRvmqCyJPpCqat1oKwgCeT6iazSLQEIvbiTA6mEu1RqAIaCbGFSXAdcywG3DZSGe
	8OjnLuQFnMPKCnajNNyyhjKMvbtUHjnYCgvTYCUiTP78VDLfRWBtliTW3iXBq+QX
	M2e8y0DuEl4ib4baBTAAXtWTl5FWMhzUkOD1cf0fqIXjjhzlowk45lLmR0sjrQCc
	itwPdQLGDJJ554o+3hK5ir7FARbEISK5r1mrSE1Q7vbB9EYGUCViIMQdOsob8PXc
	ueLC+5aSjCJKLpVYznRZQgUytMAmtX7s469Fyb1AToBwoV0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aejbjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:35:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53390e79a19so11714521cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792006537; x=1792611337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvdpGxbjJs8cHdfNMlq4bw73ybRY9Ryx4fghjxFv41Q=;
        b=KfD2Nv9KNU/ViG79zU38ApKAJ0vsOy2i0LdMPWdW+d84a1T6SnOFscJOHuttlMJQNw
         DU8PlbfruoH+IAjZLUSBecvOL8wZHYXmaBVenMksNJOBhrhsJXKOekrtwC6Ld8Wq81Mt
         qWNyUkiUfA9/jeXME8kIlos2BB0VBRab5nquq4NA6dwN/JLOG+yMPIGSFreba9t2tNZI
         lKG18iHrjcoVb5pJR+oAI1GBDkSPclskQmmYIza5SAr9WJ3t9u+BHgRB3PYKaTI9H/qV
         LZ+IXCYgMKZdNyj1GJHaOy2rNq+qW4wmxniUxCfIJY+lQBeuAcrGGMv2NNu0xDww8GGg
         m8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006537; x=1792611337;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nvdpGxbjJs8cHdfNMlq4bw73ybRY9Ryx4fghjxFv41Q=;
        b=htPjrBM/CLDlymikeM4Ct5UVhUS7h0J5ErQvTRGN04Uz58fQmAaADjNIA4q7Ut2Q+/
         eApYLhaanA99zgEcPv2UNKv5Qix2b5MIAOOftNcH3CaQOTzTnZ35Vn8mM5j17LETlnYr
         PYQagEKyqLQD1Bcpc96S++ZDMYZj42gs8nsGCQ92Er8YIwP/npbSAuy6taqzGmTI0xcz
         9DzbWth9thxeC9wOqxpmo49fuck5ufzPc01WGo65gS8xguqXFA3j0BObQTStkOlcBXEX
         mkQGalVZFt2xZZqkqhdwgDDDOsCWAXTYmoW0aaz211mhrNacdl7fpyqlCzGzRJ8GDVta
         jcxQ==
X-Forwarded-Encrypted: i=1; AKwUvByt0VPrC93c0i0Q5WAc5EBdmv13V3GOnERijfHmI4Vy9CkLc6IPaHep5XgWmqAKxgG3ZKafq+2b+bUFc0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY4UKwU9zOBqCG+zNx1UpkwF6JWcF+JPL1VFf8KviuHMoMuIBR
	eHPJ0kpAHG4EGoKZXUy/fKdLThRdxn+/CMN49IEcL53c0USpIKKrw/Zz68DrBhxSfzk68RLnJd0
	SWndz7JW9PSxzbCAKdbM57T7L8p5tTeHNPtf9T5npwwQn2uWJ2dtVos/W3l46PjqBQOE=
X-Gm-Gg: AYBFou3OuaJvSJOEhXGEKTuyaPCQJa4OTtaJAL/zpnnplmwzW0RLiuK7bI7w7hfsZWg
	RlJaZs2hMFPSPkYRlChIb8puqMWbYqHCgBlHcwGXC3mGkCN1PXdAZkdyVUeFNdHXOP4YE4e1Jce
	O6k5NXfAFdQ5QwxNKNLCB59jQPO0GPBR57qQFLzI/n9jKspLflF1GsB8ll6flxu48M3WP5xu0W/
	54Ml+SfAmlxGOiGOaJJfoTZ6c6MUoULtu8y7HwYImoq0WziDL1TEaPvidkMbt3YCPQnteOtMD9I
	Hzdr3CRFInf1i6B/AfwIfbmbG87Ad34BqmJvuKDnTbI9tfJz4jAljLzZI2tF6VvzPr2c6Jmy4qY
	03Ew3HGSfg8hwB1GBhnRy6nBvafrzZj2UtA==
X-Received: by 2002:a05:620a:171e:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93ebd293de6mr2532693085a.57.1792006537501;
        Wed, 14 Oct 2026 12:35:37 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93b:d7a3:45d0 with SMTP id af79cd13be357-93ebd293de6mr2532688885a.57.1792006536928;
        Wed, 14 Oct 2026 12:35:36 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:73ef:dc06:a718:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1beb77054sm4055445e9.1.2026.10.14.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:35:36 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, stephan.gerhold@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Wed, 14 Oct 2026 21:35:24 +0200
Message-ID: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lhyiLL5JdxZ57QoBfWZmKG9tRCymzV_k
X-Proofpoint-GUID: lhyiLL5JdxZ57QoBfWZmKG9tRCymzV_k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3OCBTYWx0ZWRfX/jZ/rBUiMc8/
 +jhlKYt3GAyUHeioWicFxLneNxkZVBbqcJ1tw/8LJDAKlgJDxZQiHWcSt9g/DUCGZbxv79TkPSm
 dGIsACy3xhtmVmdxRluqatzJYguo3BM=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acfd98a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=GDTQnYEY10f_UI-1qQQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3OCBTYWx0ZWRfX5ZijOiAl8VYr
 KpihGte9HjYOLfmQ4Neqn1Q5oPSbwL9ta9MarlhdexFaCRyK9xl58hDflosQ/ZuRI1IBwiqN33a
 nw3E44BT38yImgSixPl8GeHFFFwiv6x5IdfxVaapAu+oaiypQ/lTd7MAhD2F7s3urow+PFa12mx
 B4DTe/ndk9fvtKSTBdDISI1PK2AtXn8PrfQi1nq14m7yBWRTzaaCCu5NZ7NERL4M5HqvCNTa4l3
 klnIo4cEw8ZvHj48HII6BZ862u5HmTpECn1mzn0kdNoYjItgKKVvTVqrJID7l+kHOcT6qcD2GAq
 0yYCdqcDgw12DvIyWd5OxNPjGFjzWuilrqiQtdftPivdByNB88psUcrn7loN6huZsMslnP+1VGR
 656D4C1OkKELk/j0WXhHh2615xuaXB9pBedegCn9Y+o8tj4YZKjxlxcAM6/uonsJP3ETnWDpaUz
 Q4frmRD6pd8oHr+42LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140078

Add thermal zones for the ThinkPad T14s and describe the board
temperature sensors exposed through the PMK8550 VADC.

Add a passive thermal zone for the keyboard area, which is the main
thermal constraint under sustained load. The EC reports a thermal alert
at 57.85°C, so use this value as the passive trip point and allow the
thermal framework to throttle all CPUs and the GPU when the threshold is
reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.

An earlier approach used staged CPU cluster throttling in an attempt to
start thermal mitigation before reaching the target temperature. Testing
did not show a significant improvement compared to throttling all CPUs at
the EC thermal alert threshold. It also introduced a latency imbalance
between the different CPU clusters, which could negatively affect
workloads depending on where tasks are scheduled.

A more optimal solution would require a significantly more complex,
system-wide approach, accounting for the workload distribution and the
available power and thermal headroom across the CPU clusters and other
devices. Such an approach would also require kernel mechanisms which are
not currently available. Keep the thermal policy simple here and use a
single passive trip, which at least ensures that the system is actively
mitigated before reaching temperatures that could ultimately lead to a
thermal shutdown.

The mitigation temperature is derived from the platform behaviour when
using the balanced power profile available under Windows. A separate
change will adjust this trip point dynamically according to events
reported by the embedded controller. Name the trip
"keyboard-ec-alert" so that the EC driver can identify the corresponding
trip point in the device tree.

Also add a 73°C critical trip to shut the system down if the keyboard
temperature reaches an unsafe level.

Add a thermal zone for the back cover with a 73°C critical shutdown
trip.

Describe the SoC, SMB, SDX, east and west board temperature sensors as
monitoring-only thermal zones.

Thermal camera measurements were also used to compare the reported
temperatures with the physical temperature of the chassis. The measured
values appear to primarily represent temperatures inside the enclosure
rather than the user-contact surface temperature. No unsafe external
surface temperature was observed during these tests, although this should
not be considered a substitute for formal platform thermal qualification.

Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
channels used by these thermal zones.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..2d0a434d2248 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -502,6 +502,81 @@ platform {
 			};
 		};
 	};
+
+	thermal-zones {
+		backcover-thermal {
+			critical-action = "shutdown";
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				backcover-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		east-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <500>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				keyboard_ec_alert: keyboard-ec-alert {
+					temperature = <57850>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				keyboard-critical {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&keyboard_ec_alert>;
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
+		sdx-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		smb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		west-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &apps_rsc {
@@ -1285,6 +1360,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
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

