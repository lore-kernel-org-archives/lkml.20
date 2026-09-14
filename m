Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA5B442369
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384254; cv=none; b=iN81n71yDGj6zeAJyjzu1+5vmpGoaLInMJlQLEJUDF5N2eN68PiZtpKmzBi/B8n8+MQoiflTRLumWh5gd2cfK11f9LVDy2iDifzBf+ZyBRHlbZYwxGlwhvGnddsAw4oNmZrihDP3IMJNxmDkh5e682WDBM6/FJz2QU0wiw6uZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384254; c=relaxed/simple;
	bh=H4TP3EC6KBgdGJJJEm0KqwNmi5g+/3vPNAA1KyGchec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1smDl7dW4iBW6GhuBZHSGaEkFGSsneoBa7AEEyso51yG1RlBAkPVUhPwrGZLEUB6y2mKDJpJzfZ0PSVeoMELQLcTUNOo6Jha6+ZZVCv00lu41/Ui/MbCAGOELScreX/DZfp/q2gIkkONo6bdeLwUSIXL4Mv449DLiJCK4HRm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiX/cOj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aA/ApYFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiX/cOj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aA/ApYFV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlvTR3860362
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UoCtpVKH5cs3OFxWJtQCCwztxR5dzJkfZll38di1ep4=; b=aiX/cOj3HkaTkS2K
	SRSAZGqK1jNd/bpsq/B4VIpu5uMqgabnM9vG/Spd3QoaGpAsqkzLwh3RwWCr3c2y
	JnVisIPZixbkUr3LxHrhdZKGLlrW/u4qjNrkGg+NfFmRH65UexQFliHvcKvH9q9c
	j0s+LVvYKzWtbzPeXk31UI47C2T/N3+7xrTzUFG8kLsM9Psl00MRFub4Jng6BDSJ
	bGr73zMWEZL23nYCfWs8wVOqrQuzMJfsOKXhAVVT7tsG0F+f1HlPW0rXOdHeYRd/
	q8ZGWpJ0dsgLBWeec/ag0K+1/Cvo4RjKMP/ALtQ3flCJQcQAC1WCDROSKn5r5z0+
	DjFMeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0q3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91051512080so54588206d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384249; x=1789989049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoCtpVKH5cs3OFxWJtQCCwztxR5dzJkfZll38di1ep4=;
        b=aA/ApYFVtaSHNMib2nj7KTaa1X6SN7iCmettvDI5EEpKfPMLhO7g+1AavfI129/P2w
         9qadyy0cjh/oaio1MUJC8suNS5dQWS2ElK9tgHkVK7QmbrcXadNfpq/aJtAYEyBwGpMZ
         B7WftLrLWyd1SqMoHkvn/JzP3YWXKcazXXoFX3hQjqTF8L9ghbiZnza9HPJhxSUh+ejM
         P/p5AXV//aQsRkLZzHi0H5BEko7z/fmqA3JgXE+c8W1pCWmBGcmrxACqUOMQPN7LyMqG
         I6xROVMxETwrWphWJNyMEWs5+9MFjq3JQ/HTKbK3x8n+QkavqOJLfr0H3R0F9a6I/LAP
         8vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384249; x=1789989049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoCtpVKH5cs3OFxWJtQCCwztxR5dzJkfZll38di1ep4=;
        b=TTB+4ex8J+ZjGeyR+1wsU45yaLETI37Q3+G+7KytQ9JhNFIjxbnrDuo2jXmAwLaHzh
         PkI+L/E6aVV6NJb+/R2OCSHXVMhX9V8reR9slSPyPzbvuQ/P9Ud0co3tPisNrWKEOrJL
         HxUMlqKRSEBRNoiRvlfqIjLaA/zNue7gaiWBd5Y8uix0h0qgPYpK5m3Avy9vKJN1UNfq
         R/VvtEle3yg+90Zofy52O7qJblPZPfZ2QKQjXFoRp2/nRxN/v3sGhxa1LKF+KNmNi9Gm
         f0ao/o8DqXMJYxS8oduKUmpofTQ/gmb9741kIZekZaq6I7n+Yg3EHoGAyrJaHqLpfywI
         Hqrw==
X-Forwarded-Encrypted: i=1; AKwUvBwdtz/hOTb1/kkaLTKk6YXcARMSN0XTCDys/4/eRtTuTTW3XYX67vHSJBAAFLEuNNiG1A37DPelSlAaGr4=@vger.kernel.org
X-Gm-Message-State: AFuF++l4OTBRqIj9xB6LQhTfMjx59he1S3mxhxYRoCxCC3b4ae6lXZWc
	LdMkhfH4+aDzyW5PVFvEM5m8rJUHJz9HmUBGlvg2ksuGHU/5/vghZxJiCGtaJwDw/cqZw7JwrfD
	qljqvNu/HuWCDd7l+CCIv5RsCy/N8RDGKP6YvTPSOQDHEcmRJ6Wc2UFt15c4koUHoM6A=
X-Gm-Gg: AYBFou3G7nyx5QMQWG+OBrTkR0OTIL640B8vJ+mjZSkgEka7qgXuscyYtyxpRh2Zjik
	3juMG8HxMVI8nH50VRak6dah9XL/3XvUZaXvqRrGLbF1ah4Um3Jx+4LrncsRw3FiOXvg2niHPqC
	G7xu7MoySeBlZ0SxOH4W0DT0Di3t/dnP5nix/+QKjPcYYWKOumQ6ZDXFZJ8iRBuQGYVaIaQl5Fz
	cy6XtPN+0sfF8MncLiQTPkUmnsRDYAJd5m+GO6cQUbvKHjq1aAwfVMWUlL/0Umrr48POggGObQ0
	TtQQUT6rZEjqCRweaUyoMzGQj7IF0RedGTUH9CHJb3rZ4L3gnfdIH+rNTlaTFBiw9Z6Q29VP0MZ
	cLrbPFdtKl4DoKQ7xjQ0opmyiZkojCLySzkRUPQZqcvoxuxwOUPQrq06TLnJrDiZl5xRy
X-Received: by 2002:ac8:5996:0:b0:530:5411:ef3 with SMTP id d75a77b69052e-5310d02cd99mr26522281cf.41.1789384249005;
        Mon, 14 Sep 2026 04:10:49 -0700 (PDT)
X-Received: by 2002:ac8:5996:0:b0:530:5411:ef3 with SMTP id d75a77b69052e-5310d02cd99mr26521561cf.41.1789384248488;
        Mon, 14 Sep 2026 04:10:48 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4787eesm91720226d6.21.2026.09.14.04.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:10:48 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 19:10:24 +0800
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-sk5jn5-v4-1-386e84cfb2b3@oss.qualcomm.com>
References: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
In-Reply-To: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789384240; l=4575;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=H4TP3EC6KBgdGJJJEm0KqwNmi5g+/3vPNAA1KyGchec=;
 b=qBqRY+jVu+TwTcdKMPvrpZ1NsXhSNEbny57d9vDEMIjT/5VBb7MbzK8ZgZyb7/XSlHKSsV5bU
 dCFrTYR3bWYBbrNzqUObHwvv4cFuP3j8DOil775C5opT3NMvSFKMrZs
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: H5CDDrJwGr25bDhI4soP4GrBW-4n9tnM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1OCBTYWx0ZWRfX979QtHQWMGIu
 viAoKaGQVazJPYG+KKAcJOs2ji8/26NNF7oz1KYXlNP+xLlt7n8DVdJaG1vH3FmeukAiJyabSDG
 NZwt9Zn2dxDP7OMU7hysbg2atq8kh3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1OCBTYWx0ZWRfX4uWw7jyQIeUb
 FBRChgBk+NYghbkbZ7vBBl29Ew7TNymqQE1Azc7mR/469VpnnRmM5hHhAjMW6qs09sSHQxlD8TD
 4oSm2OvlAKJxhlXP7FOHbGlNVyfHjFHzQOdgD3ciFlQs0dbmrRwBTrrMKKyC0ZnZ0Gc9NZ6nyJR
 1rEtaYjvB/nbXQxd9Z1dGQseTJfPwIF78HuGxrv6E/um6lpxDKeZS5HLvk54qU2i1epwk0NYhFv
 FOHkj/+ZgjQy1ya10MUhTMxtp8BqifKPMRr3k4XyYlldYCvZ2XtJA7aobESCY42+6d4Tsmvi3eH
 u19vVLjJWE2bZqSEDSHqC7erGk0mUivBs0pXZzvjNutvstC6DvuIzO5pydlb1mA98lyQSl4XU6J
 wvdQDbFRA164CWlQsLqiLJ/7rasozj6jjLQJl4IQdPRM/lO+COX6KTkDcXpsVVsU1iZXubpEjvL
 lKF082kj5L9PPpIGcLg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d639 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=xYdTjhl2YIFMzPZYPIkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-GUID: H5CDDrJwGr25bDhI4soP4GrBW-4n9tnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140158

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
index 207a6e2db70c8e90a23f56e93af7b90459ba895c..12591e0f1ec2464a34cb6faa91b055f2a47c69d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24582,6 +24582,12 @@ T:	git git://linuxtv.org/media_tree.git
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

