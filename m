Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F036B519938
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687396; cv=none; b=Qbx4o+gPwn/XbOWUE0lSQyam8fpcjVNFbY22Zc3vG2C6cmBYnUxQXEBP/1C2mJp4+O5C0uemRfwHCLRfvY3x/9qCzyOjJdA/0g4O6cDuPkF6JVXXbYKr1vN4ilz8L4NKmVJxXDy0QuLTsUCpgJ9U0bcLhYDoq+NOwE75XI1thGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687396; c=relaxed/simple;
	bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZ2Op5kIESYsn1+UovTE5sAuZGUoI/dk0SEh0dAHDRLmoHwYBG6UsGkZMMBkm6mEfdhpqUdgAsdiB+S8fmNsiO2AozFvSWDtmVhy20KOIso5/vHyuRPHui9SFde6ZTWq22DICEde5iyBg++lU29M3EVuzdZSjC6TFOSaH0A/mDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEw85bs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ivxy9/YE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEw85bs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ivxy9/YE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdtl3936711
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=; b=BEw85bs+KG1Isalh
	t1d1/n4SD8gCQy8hnkey3OEa1vYD+IfG2QYsWFwgumwmPhirXRDztPLxrApn1wn0
	3i4Ns+TPxOa7uWELw77QMKbg0KsXU1xlZoF54YPLm/mvTi5PVDsrvNWEzTu5hrgI
	rrPOWJdH0Wq8bOxYBwdnlk8QX1YeOIWV36Rmus4lWV8YCcAbfzPv736o6hkmvXAZ
	Kd1uF7WLUGCPWw+PirbL8qPv3TQ9OBVwmrIATDjuqsLVKdcN4R16u1wsLzkTeVOT
	TXW7cFDoEiKgIHMRtzhAbuYbQklTjYkTZJivVZ/hnInJba6F1S6n7qjr9jHduonv
	G52Eww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gmgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:09:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-914489c39c4so32034456d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687392; x=1791292192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=Ivxy9/YEWT/J5bkdzrvh0uL4UoUViFhsrf7/klsAqTdGzTXnnMQ6f8fSroxOhEcpgQ
         RP04zmqgwFSSg1qW/adFuZqwm70mvf7Z5Sjj2MPRbiUlHHk6/EIrR56lPXNNAIHPoU04
         /KILjLDDxuTfY6/qZ5wqCdfBkD9cnYOBFwycSOERkS4CHmspAOXWsiufMy9cElw6OwwU
         4zEEZHobWNLs8WMw4WoPeWJsd71+IoHgmI1XhQCX3Gb+PijJiUQ6bosN8YpPB8z9l9QD
         Sij+32HAlru8JDtvJpkuGQDmiBZQCHqk5W4FKrXP81GaU3f3t8+BaQriVIwrwmVXmwfH
         Wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687392; x=1791292192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=Gy9ioyej1nTQo53N7raOytWapkNMVwVKM/Dy8clFhROwkqp6EZ6SAgtm2jA24n69ic
         1rMl5S3suQ5TTq6l61W0xm2095Z9EyMF3fdYDcVgNDawGnxyZTZxyVDbk/ozDuVM+lCs
         c7BzMEjFaBcYvvhUY2fEZHzfVO9VIcqPBQKFhjTQ9VIXZ7PH0DZdJ27/2Gr8BO+E1KlY
         rsfuuWx7cZX8/lh7P2sCJwAakiT5BKgV+EEjTF3DbfPc8oluWF36ZyY2jJsIVazoLytP
         c6cfioFKk96LtQbnQaOGdIGT/s0/THLv9FaTHZdopiuSBoroVJnCw9I2k5g6IYtfOgmo
         m7+A==
X-Forwarded-Encrypted: i=1; AKwUvBx3DpqGtXO+MULAIrPds4yga8DggpCW2UUkwI2YWy9vVBP5flrw8j/qYNZ/bprJIl6CN/XZs1KSzDYww5w=@vger.kernel.org
X-Gm-Message-State: AFuF++k/RTJKrgDXruC8USd3/rLbiroDQ5YxiZtsg9vM7PY7LuJHE70n
	DxffLGPnYouMXi3ogT/cXFThu1Rl/EPdfcJPwtks6xK0MQ/xA9IFISkqSU9McSNctPHkYsYdlCA
	cMX2Xq4rRyB0hU3YnbRt6IviXOr61J6Cfqvvc79hgP9ZzxGsORwENNPiZ//ySZTBqk0c=
X-Gm-Gg: AYBFou0H+myQAbmjxy7TpINlxSxNZbXYS9QbVKBrPm/tVVsKlRbCwBsS4HN8I4JzOLG
	ENzHPv53WjFnLdtvurx+jNrzvVyjJU/2voA2K2mMrC63qMFUCTQ6v8qmilm2GmYYZtq1xZDs9vm
	NOvAFObqtQqSyvQJFA0BIQCb00s5r1BWtgZIO5gku8XWzEft6yX/463bi6C9fMjhfj1iLBLvVKT
	oXteSQT0k56UD7jVV0AKA6zwIrQGrKSgvalPVS81Vwuzs4VwC01KnJ+I2NGibyYR8AeWLZ5CT1A
	Gz2JCHx6qlDLw+SESMVWISnJ+xQbe/YlY4g9o1Fzk5KZX48Fsywmy6+RPR5YAPuuoWXt5gfGr+r
	5pHG3761MBS1BdNikAlOLIhw2MmvuIdhXGvY=
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188849256d6.10.1790687391927;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188848326d6.10.1790687391047;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:09:50 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:33 +0530
Subject: [PATCH v3 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-1-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=4232;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
 b=brzRaFooGdY1AEfjdIk4VK0wyoloSQQm8UmTUeWJ2N69TZZj0UtvAZagT3QB0Cn7SpHEVTffW
 //bQd+CYFXbBAmm8+3wmJCaRDDWk959jeJ0FBJyRFTte8/ftVC0wJ4C
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX8fbpI0YHDzqY
 Pi5D/IUNPIjoIBJZQLKF2sHQ7tUHkdZzzGyk26fWZmp8VL/DmzjnhzX6cwSLjrxTuo7pR4WlsPS
 jkVzB0Rtx4qv2GdMouaz7A9iqxkBaPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwXJwxtNxKHuu
 wF2xHZOBM3JNDmS8xPuX4sgkL8DxHCbcXQKnbVZJbyJVBzwnwGlnfedo6At+mktDiMt/Je41Vpb
 o/VlPGqjS0/H+zghO9eBjXWU7EE6HRu1W7cmJNXZHBEO1FS+SsNjNW2o+ZowVdri89LsaL8eHsQ
 iRySHyRcdmTxDa8r1QcgIxDlG7bCuWRWw/qH4KLQgrG2PPoD2sKkp3fG0C/ZsogJNsrVNwHYyet
 +0a4a3lYGhLDcx3Wce8Rk2475kRLTBn+zJSRWZy0XRZQkGOYhCcrJ5ZkNTxDXLC0Khrex/bC8C7
 PYLGBw1wBkifV/+RTpxbYWMHpvlto1DwmXYycRRRYbi7mk32u+Cf4D/vVX4nNkCU65FRrXIyeQ1
 kOOuFmNXCQi6WpvV64MP7GRCpDAUlfH66d/EFUt5LP6P2Ovn1IlYKQ4V1RLzPKEV8MZNduRxfmu
 dI2IWCoS6X6u2QRGa6Q==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbb8a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ld2rVwEKIzF2t23SoDpO2KHdyhEtRX7u
X-Proofpoint-GUID: ld2rVwEKIzF2t23SoDpO2KHdyhEtRX7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 69 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..a9e3525cf099
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm7250b-bcl
+      - qcom,pm7550-bcl
+      - qcom,pm7550ba-bcl
+      - qcom,pm8350c-bcl
+      - qcom,pm8550-bcl
+      - qcom,pmh0101-bcl
+      - qcom,pmih0108-bcl
+      - qcom,smb2360-bcl
+      - qcom,smb2370-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..48dc437b3889 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -195,6 +195,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..7cc16f7ccd66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22657,6 +22657,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

