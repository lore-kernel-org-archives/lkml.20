Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D94973A1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455053; cv=none; b=aejQbm+kRhFnuMIm6bdzTJqJi9BVFSE8Xsc5+tNG/g0V9kO+HFpmsr1y+Ltfjyg3fJhp7ftVZdT+DHAFE1+AgqGGymG70TKnwZn+dvQ0htIM46bg3HQCRI63gNBr1WneDmFBhgEJUD2kBGUkUl6yOXZBD53O1Km1MY7n8pgkpXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455053; c=relaxed/simple;
	bh=yjMWVLZbkcI3yXmuSNBVRrgyEk89YUdkkV8MLwaJ9T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bl4h6omuySqO5SSIsfPFPONOR7rmFv16xjQ/WJwcskkWy5RZo0Ia8Ow8wvDfCuzv5hR+DI975sT1zuyUvhNFCYawJnvYeM0ASexXP+xeBawMzImAdrpLyZA4GIcLt9mCj7a0UPBkmCj75Gnzg8aZXymB/MODgNyHjITzN+NQzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4pWKd4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol76Juta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4pWKd4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol76Juta"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KRYt1846371
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=; b=D4pWKd4DhTVWbkI8
	XFp8wqHxyydiz/+/+f22nCxW/R+IOQA/+lQXYmWI4mKTBiGifCGwmb2kOwEqsIF2
	wC3mZgX1Ve5Dr7StMqsI0Fc/5LTDPj/rZHWfLbh/wXBFRa2SifGwrS4ktnEkB/F4
	zP/4tIw0UFKsnzdSQhVRmOdIoszUaisCeSNX05XuTjrX2rFk3S8gmgBUd7dNC0An
	HoqCzi+ljOfX91sUzbSpQTiQ7Cz7AcS5CuSUiijYs8fDioUWQwoMoWrfTBWsvEAl
	LS642/pZbKmutfRfCgKoLmLYn1TFHkDWUkogvUbGZ4RDixNHqB4XEvdHs/gpmc7z
	+B8gXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jhej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso83962015ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455050; x=1792059850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=;
        b=Ol76Jutawn1HoTj4kz+p8IsnZNEZRD9ilVlqxRwVJuncR574hmck4J4YqIeuyN15Kt
         zqsiGvRKUJNsfJKE+K4OBkLJCSq5enKip0sLGqAaTn2ozDSr9A/1dtnS5bRr3ulawk0Q
         QXdmvjJmA8ZndmsJ5o0Sx+WSrxcMtaUSgPT90tu7Iec9F6YAjwSDzh2n4meFQ6PFTs0p
         N3pwevGEFDYfmpJv+NFDbCNOxQe4ivTQgYs77K2Ejrwrzop4EE+F3CZmciuFfTPh7Xw7
         ybpgP69Z1w6m0XnxayQdsvbUrT1rQWzPMi3wxHoj0OgReDutMllbBgY24hSuKzBy3+6f
         Xo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455050; x=1792059850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfcbPJYFIddideSymHcJE0RX/Nsl0L0ARIs00dcSarM=;
        b=wVgZhD1xJutcIR/v3oqgVSAFDIGK+oO7PUySw2ISdAWqQGxsREhjrm/uNi6JPEb1mC
         jLRh5sOTaIIBsVtDhvRzMiNS3pD7UmC9a8OkWazDFWwDqTHIPDsJWU49iu/gURV8RMyK
         bPeG8hiZHM4YwrFygzZ7R+bhZvH18/f+pjP9KbX9gem5+jzQG05D8Mg6PjBI5Ve/d/B3
         knClbqESzouzIfUcH3hXKMQGcBXT7YV0rajVozYTSBnJaMPYCLGIZOaMhPfBx8ghpilP
         Ac3A3Pzyzv6nCahKBRJXIyWmpQRIdgdTezNx5h92atcnNrrJ0q56dPL940y5YRX+iDg4
         kzLw==
X-Forwarded-Encrypted: i=1; AKwUvByUSA+1KbIEfhgFDErCbt6AbS8H1WiIofXwT852D9DcHtGTNJC/67zlEOwF7x3X4e9S46ucSbUiwaqGkkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwOL/efBVy9gY0AW+5bgekQ7p4XYhyUpF2JQp6lQwY+yHou9Td
	5U5rUrbPkBIw20LKBH5oJQTRJxdPfbQnOqHfu8gDifItHxnFBAJbfNtqIkvv40axmsCE4T7w1NE
	wRBg2Vd05hFA44bUBPtHaPIfwLfYUZtCbbRwMSzZoU5glmqwkEotrbyuAJS41G8jp3u0=
X-Gm-Gg: AYBFou2U90eFa9uPcO2OpN01ef1//R5hJ1dvpr9E53taEeZjyKC5Q6UvsR20KTmMkYK
	wgSKXutszxvhmUGbMIby+CX/DozhTQyGHaXfBs/q4JFfOeI3OefT5QlMDjZqUY9jLOr/6aNkWqB
	Qgv2zJKwyb8kSpZfLcEFkOSR2E129XGD6gpFY8jG46jsvRO9qyARH2g3yh6ecV2VTodsxYgSlrF
	qEwzIleum+k3tzxe6BCXRsHeTpGfws/7PdtNJttWY/aS01sETHwlFleHHmBRUAOzuMAhi8mHzje
	hSQ7xqtIuiG97fLEaipYxgxr0ROi7cuFwJ/yznM12g/JLcuhjV6XcSvrcGi22kWmu1B6iW0+9Db
	sk8N+muFgh3CjYqbhGg8zR8KQ/uF1RwkxEeMKIY34dESI154Prrhr0UdsJK9ZPZ1jtK7SFesduH
	lslKle1ISzgkjPh16y7Xp5ww==
X-Received: by 2002:a17:903:4b2f:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2e5ffc3bca4mr44992395ad.19.1791455049679;
        Thu, 08 Oct 2026 03:24:09 -0700 (PDT)
X-Received: by 2002:a17:903:4b2f:b0:2dd:40cb:a04c with SMTP id d9443c01a7336-2e5ffc3bca4mr44992085ad.19.1791455049031;
        Thu, 08 Oct 2026 03:24:09 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:08 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:53:57 +0530
Subject: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX6P4Yd9kFDUO0
 ZnDjTzGzApwLEZlFH8GxBgPsV+d2ZWxoRAf1QB7fxsP4iU92pnGyCMwVeC3/yOJ8yly32jvvnpF
 /GIXhte8B/Bhnw+2rbzI6YkZ33QrFlw=
X-Proofpoint-ORIG-GUID: VrOFK5HdmXqZFBVgRtUknz96wTCUmzME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXxp1D+WmU0C8v
 Cv1y+oglOLv3jL+0Iyp1e5yl3naOItn6ycefRKi290ErRUIM+7XyB27LB62X+Pdb8J7twq3UdpG
 I2CPTLidVxbx+kXDPrdJR2LtN8rdYR1uy69TC2XcuC1lsySxPNtC3UMlbvITrsTxLFHcbtfQt8w
 o2siA81h+NwRIOjOmQ0J1VlDc+J7eJqXZq5dK1euRl3w8bI2HxhtaRubecBOnPx0Dm04UVlU8xt
 2p1QQWd4ERatXaEMeo+TfWGq0/+EaF+MT9QjEuR+Faf+KIYxn9ixz1Xo/TbWqMDkIlBxq5XccTa
 FjAljzgcS43SRZCKR8zs4MsNxx7ajW47L2U4fVD7oMhYnjkICHOOkJ4F06LjExIMK+M6unV2OaX
 ALM3UKc69aXp/JWNOeOTMAIyggK/5ERI0YWggxllR2pcY9zal2Bxe1LOQo122xO2jqkGX38zGKb
 A63wyvAo+SAAFHpbvnw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76f4a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: VrOFK5HdmXqZFBVgRtUknz96wTCUmzME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
wireless device.

QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
platform device, even though the Wi-Fi hardware interfaces over PCIe.
Document the compatible string and the resources, including the Q6 remote
processor phandle, MSI interrupts, SMEM states and memory regions.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
new file mode 100644
index 000000000000..97d8885333fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies QCN6432 wireless device
+
+maintainers:
+  - Jeff Johnson <jjohnson@kernel.org>
+
+description: |
+  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
+  associated with the WCSS Q6 subsystem. The device is represented
+  as a platform device and uses MSI interrupts for its Copy Engine
+  (CE) and Data Path (DP) rings.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcn6432-wifi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Spawn acknowledge interrupt
+      - description: Stop acknowledge interrupt
+      - description: UMAC reset interrupt
+
+  interrupt-names:
+    items:
+      - const: fatal
+      - const: ready
+      - const: spawn
+      - const: stop-ack
+      - const: umac-reset
+
+  memory-region:
+    items:
+      - description: Q6 memory region
+      - description: Combined firmware data memory region
+      - description: Multi Link Operation (MLO) Global memory region
+
+  memory-region-names:
+    items:
+      - const: q6-region
+      - const: data-region
+      - const: mlo-global-mem
+
+  msi-parent:
+    description: Phandle to the MSI controller.
+    maxItems: 1
+
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
+  qcom,rproc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Qualcomm Hexagon DSP (Q6 remote processor), which is
+      utilized for offloading Wi-Fi processing tasks. This Q6 remote processor
+      operates in conjunction with Wi-Fi.
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Shutdown WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+      - description: Stop WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+      - description: Spawn WCSS PD
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 31
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: shutdown
+      - const: stop
+      - const: spawn
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - memory-region
+  - memory-region-names
+  - msi-parent
+  - qcom,rproc
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    wifi@21e00000 {
+        compatible = "qcom,qcn6432-wifi";
+        reg = <0x21e00000 0x200000>;
+        interrupts-extended = <&smp2p_wcss_in 16 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 17 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 20 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 19 IRQ_TYPE_NONE>,
+                              <&intc GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "fatal",
+                          "ready",
+                          "spawn",
+                          "stop-ack",
+                          "umac-reset";
+        memory-region = <&q6_region>, <&data_region>, <&mlo_mem>;
+        memory-region-names = "q6-region", "data-region", "mlo-global-mem";
+        msi-parent = <&v2m0>;
+        qcom,calibration-variant = "RDP442_1";
+        qcom,rproc = <&q6v5_wcss>;
+        qcom,smem-states = <&smp2p_wcss_out 16>,
+                           <&smp2p_wcss_out 17>,
+                           <&smp2p_wcss_out 18>;
+        qcom,smem-state-names = "shutdown",
+                                "stop",
+                                "spawn";
+    };

-- 
2.34.1

