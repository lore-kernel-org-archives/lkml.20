Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF79F4611CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755705; cv=none; b=XbCeLexIm4aX+jAwHFIGXgZMafcAI7lNCGIg+A22T2IPS2YGSPSgpMhnzn0Go9GartHQYHOirEz+P9q9zHyRx8EiT8r6kBAnklvCHfqcw5ehYwt6pdOrZYCBTp4qlaIGu0m4odgWhPOo7h3ss/womlabuRKr0tCeaKK5bil2mUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755705; c=relaxed/simple;
	bh=EPKvKkROJPEyEuRE/ipg5dktsURogb/Hz9TNKB/MyKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSpSJNBUqp2d9ntnhTCST3utEBR9f/Ya65lQVeThVgmIKoI6jpv83ZRmEDqMKtVI3Y4Lhj6MEmhP9q5Qkp/aVxgQMLfDYfyVxB/pPR1Y4Y4WZf+AwuA+UZB6csnA9/KC94NEGmvtNk7TYzq6cgvdvCZlQ5+AEzaM2/su8Df04Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gf/pneb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WH/ZXI4q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gf/pneb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WH/ZXI4q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWkV2119372
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mERjziZP9prCoKtq1eMN8rj15+xaQ2Rdsci+eQDqeBw=; b=Gf/pneb49IheYwce
	hoeTP+ENawogkdNciSPZOA0OAkkVBahuOc8DAqwP3WzDKVtn4n/OdwPbmHCbaZtv
	NP8nOmEQBykebiK3GjTp4FpfbM0U9X2+1Cj4in7Aed6R14smyf5c3NlzhypnVBBu
	TAh5qxgrAlfVpc6c7tgvldFiKzfHdkiZMndjz3ntDlPXhy/0/jt4V44KuLcdWTgA
	M5kdBuEmgXKRPpVKI/XzJb8vYxuMXun2s4dqWBi4mjqJJ701amIeKNxLe4+PXAo6
	/uT6JGJ3lRED9yFPqCvXgrut7HFoKMfxWLTCejEaSrUkVORmDSGvhQoCjg/0RRDg
	Xgl77g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhehp0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:08:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso1029124585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790755702; x=1791360502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mERjziZP9prCoKtq1eMN8rj15+xaQ2Rdsci+eQDqeBw=;
        b=WH/ZXI4qhpysNP97auNKFjrwOypZaQoJgwyLRN7Ru1w9VyPXe9cNxl8Y5KIoGlc4GZ
         XtTOqiCkDVh9pD2zdIRiqY2nCvm6mRBlh+kCOutCGaCTbh0VtqCPxmNPs/DL9iDwI83S
         g5eGjpxa+P0G19cVV4cWuOyiUefVqGNmKVkyRwZV6oJSh4FUUjdzWzrtzEliSk4E3RSs
         k1SC1Vdhbtt1M29K1AA6SEAgJyWiGS4AzuW11GXM9QARp/aub62qEmd7TSFNL4wMLOJi
         x2y6PXpFcc5AsHKFLhwTUBE8R82YK/4K+ut48l9oDDzwq5oI3bD0V2xTMIkquQHyxgTz
         Y1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755702; x=1791360502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mERjziZP9prCoKtq1eMN8rj15+xaQ2Rdsci+eQDqeBw=;
        b=uGVPz/C/ywN6o9c6zE0/ZvUrNRozBgKUEtNV1kvLNHwNjuIN+f8V6jLvkpS3cERAd3
         592M9VVME3XbYvifXvnj6w6drU9dHYvZgyuS/C4kTMc5aRvQjEtC0FqgdXb7awh8zjEZ
         l77fo/lHL11k/sNDZ0Jb8+QVn9P23eGhJ8vP/V25tQnHCSjGb9RaZkTPVHrK9l3clxiF
         0Ct7rx0nb8ONF+XHTtHi9KfWaYNtlRMYW/U54eMUXXcSy4p6z6WoLW2n4yefyuMsOuX+
         HnP/yt1zW/KGJHEe8ACZ/OYqxYShPOrsyOEv7YbTzjosUDL2+F4AabUnXXuV427rUO3B
         UwpQ==
X-Forwarded-Encrypted: i=1; AKwUvByrb7ZhaRALuqy2reBXZc76cm/AgmKR8SVuPl2paR8sNp4ZBhHOt8LNpvLIKkTqs0gVSW0C2DJafet/buc=@vger.kernel.org
X-Gm-Message-State: AFuF++mb9YHvKhDaugquycGzwMVLo9GC1oIMWEebLtyR2FXKmuOGPZV+
	0Lf445P4hv8LXBn5H3CGyFA3dC0jtvH1riqnA180JTx/u9V1YsAs6bxA3GZnOiIRt4Oy6Lkxn9u
	eSCcBLWBc8A7K5GFPhM1ZWQFwEqDTtZH68BxI30v95Wshcs0C3yEOwmJFhMZ0A7OnxqA=
X-Gm-Gg: AYBFou0grtD/butcLm4SFNpGgi6D+CMdRf6TTpnlm5zs3GgdEd6yARJXwTNnnG4sHTi
	fgAa8SRWtIKVUdnYvPaDYNgLIeKg5tr5CeZ5hR/SaKJhyc3jZ5TsBv5dY0HszxkiwJRsA5JAH67
	d2Or1ZMDTvZWL9Yp5nVjn8wCCbnAWxojMZPWTqZLS/tc4dWnZ3Evjaf5UEhaIbs8uXJKyTam18T
	cOo/DU8gpH9qI3mKyluF/TgO4c8NA0VOqSJZIHfNoRqgYRiPOYCKZvhrqS5UA/wkizx1OLSPnBz
	s9/kvNymlg6f6Y5DnS6xoZmo+j7v9GgGrmkfmSP57g1QqjIc2fHLO9q0kMHQMr2lFGoyhkkl3aq
	ckq9uOoIOxEaIyjYRFMyvCL1Q0TxTHbSSlHXByN7GtGqhnpRi0Hu1ft5/kWYX37ga4n/4
X-Received: by 2002:a05:620a:470e:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93cac149674mr42272185a.32.1790755701975;
        Wed, 30 Sep 2026 01:08:21 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93cac149674mr42268585a.32.1790755701432;
        Wed, 30 Sep 2026 01:08:21 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca833347csm62238585a.43.2026.09.30.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:08:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:08:05 +0800
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-sk5jn5-v6-1-517c9b34008a@oss.qualcomm.com>
References: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
In-Reply-To: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790755692; l=4575;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EPKvKkROJPEyEuRE/ipg5dktsURogb/Hz9TNKB/MyKk=;
 b=BbzvUyAR11+IMuu6/wLp82hfCQXQvRxyKcwOWsS661vqeCmhEncrO6xNPbNNKRbIajJCTHH5a
 xzcy4aIgiIKCDpult+2difzNhCGpkHMYzYoZFnCZfNmtHthJcZCBM0Q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: gZPGysBFKVbaTctudZN2tbLvoP9pUNvZ
X-Proofpoint-ORIG-GUID: gZPGysBFKVbaTctudZN2tbLvoP9pUNvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfXyZZFwOZDlMH8
 S5TmgbxcgnhZwvPKH6cORwe+SQWklbFwki4vojFHstfWzlu2Rkl6hYSzwsZI9CA+FXuzIQNf1q7
 +zVN87NO1BlnPORPRPgIfz+XcCgpvff8iKiOPNG3352rgBHlqaaU3MxamTDjvFU0ATI7oExDZhn
 3Wr0ipb17xvqmNDBb/2DDss/XDMBi0sjtKeuzzVhetONeEsVgix5rx+J81xu/jWXPqOatTrewqc
 BkFrbKLmLp6hpDlw8spKzvPHv2h/OPe8nBjaIun1ysLFssGjmIhzthwnu3HwQ+Ao+axjO0d8p7Y
 IoYpg9hQ3my39HIS+jPjv7gOcwi3NASNGjVXaEsL40x47ZjOb0Fp9PDJmcbPwGEHv4U69Z5hvCN
 IPdL7l22oKfxY7lenAKXXfGDS6DAkFiRze4Fzwv1gVOqj/OxnhlJOB7UgNcuExjcc/ZB3OKiGqD
 1WaoTugDbbw4ZrmYsAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX+9ZG2c/kqEYm
 NPPNnx3kVAp6d/WKwdshzqqJY+M5vzhXPG9JdShGaTPIrORbs4IbvdpM/YQsFWEbf4iJ6jlrXTz
 X4HNdENRtE68VXAS3pW8ASGBAyHIxAc=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcc376 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=xYdTjhl2YIFMzPZYPIkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300032

Add device tree bindings for the Samsung S5KJN5, a 50 MP 10-bit RAW
MIPI CSI-2 image sensor controlled over CCI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/samsung,s5kjn5.yaml         | 117 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fedb274679cd125483961fee7ac922f2c5efa755
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KJN5 Image Sensor
+
+description:
+  Samsung S5KJN5 is a 50MP 10-bit RAW MIPI CSI-2 image sensor.
+  The sensor is controlled over I2C. The full resolution pixel array is
+  8192x6144, data output format is RAW10 transferred over 4-lane MIPI
+  D-PHY interface.
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5kjn5
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK/XVCLK input clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  vddio-supply:
+    description:
+      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2 volt
+      I/O operation.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.0 volts.
+
+  vddm-supply:
+    description: MIPI voltage supply, 1.0 volts.
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.2 volts.
+
+  vddio1p2-supply:
+    description:
+      1.2 volt I/O voltage supply (VDDIO12). Required only for 1.2 volt I/O
+      operation.
+
+  afvdd-supply:
+    description: Autofocus actuator voltage supply, 2.8-3.0 volts.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@10 {
+              compatible = "samsung,s5kjn5";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vddio-supply = <&vreg_1p8>;
+              vddd-supply = <&vreg_1p0>;
+              vddm-supply = <&vreg_1p0>;
+              vdda-supply = <&vreg_2p2>;
+              vddio1p2-supply = <&vreg_1p2>;
+              afvdd-supply = <&vreg_2p8>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <1248000000>;
+                      data-lanes = <1 2 3 4>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2d137a3399408c53a9285686c24f42580292a9ea..7b8538078c7010b1fb8a77dff906cf9bd4bf0642 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24772,6 +24772,12 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 F:	drivers/media/i2c/s5kjn1.c
 
+SAMSUNG S5KJN5 CAMERA DRIVER
+M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
+
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>

-- 
2.34.1

