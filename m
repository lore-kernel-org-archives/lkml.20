Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738882;
	b=topcrB9hxrRR/G7R5Idm35UwkiS/EqMaWuZNhwp760Jb+Q8UCUsxjaWF1b+VY0nE36yb
	 UVtlAdj2MXTkhR8U1yQyCAZ7wrlhFomV+TGMGLb3dNwKxtA6OuOylDMZ9BINqQ0KgPkym
	 mvaeW8IqZ+OWZCoBCRot8nQJoOao4pYIh8oDPaWWVXrQb9uxvdyxT2mWq7I9GzAcLDe8V
	 hoEeVKMfUnSne8n3SxHGTKN1RnMPvNFkSh+4LXl0qsR9PoaDYVc1ndrW9v3sf/2glh1yQ
	 LEsnFq3mrDBVXOtpzSrRL1kV0mWaWIrBLXyPc4Vg+a/Br+xH+OrA31FTG545S0i7cRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
	b=mTKCShn+mROf+hqJTTFQ/TpznkdZD2SC1pS8crxovq+oCjHfzo6C7TO7EuEZ5lBW3Zno
	 LnwAEOf0D8JvgQQZWNQHbNzXEDxVzpcfo96+XIx3ad6FkG54ynbx3YJFbR85XeHbIjZJD
	 twd/Xl7uCqK8JBMMPxLz+Kp1bFuxhWEO9SJeHCjqMxI6x8Pxoz5Su89rQZtlDt4dAqvqg
	 4B9gOckf85xvA7PjBdTnzBMz6lYKkXfwOKfzb9kvtGvKFdzLeRkUxve45wUu4hoJ2/Rx2
	 vtMakryIZqpo7bojiIdjEOK0Geir3k7lkF/1+yvYB0gMmSxPn5MkX4KRqU9kY8nTduQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6Pg3Mau;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLuSimw4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C5606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6Pg3Mau;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLuSimw4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F3lL1869056
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=; b=C6Pg3MauuJR9m3Rg
	nM7VfMaqEJnktOK9ECURmTXmZwy1qnTPK/9EPKAV1PD13LVVc/Phq8BW8a6P1z79
	1uqInJF79LacbA+H0OqSa1r2RlRE34e0ZYyUPNcvnE4cIBo/Rpmu4urJhiu+eHBV
	Uw2GQvx5DdasfZmtwgDWEOI53T1yOO5b/nE656qItGg45sfQsCu+JDIsRg8h0pnP
	qe00nF7XqO9EM1Q7LmpO2QAYnpoaJRYIKuFbb+rpD4Xf+iBLEvi+TbNXobD2hv5K
	74Bh78hlIxnofyin7/AUFPbRX1GzPBTGTR/PCrM/81eIFsRV18TSbC7rpVRasjHc
	j9bxpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjad5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso662037a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738879; x=1793343679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
        b=bLuSimw4nC+VEE7IPyYlu9ZY9BMQuI3/knPhUU3kHqhivZCHfCkXfD73Z+LE6a836t
         y/PKsVy4JI1xc3q10O5bAFxvoAx0AkibCsMKyypSvU1ei41iaMhK68p7HAUA+43FuJVS
         s8uv3oA4e/FUYH6tQphWrWkzWl6Bf5zoIcBYWhT1XQssTb1eCuUBe0GREYu6gzQYZwFx
         p/+pQAU2W9x9SanqlKPfRDa79NLxXwhkqxBKLYuCu4gnwRsoQbW2TmNmFxWMe52ccXB5
         CifOXe0L++JyP77uvRWgeDBFdSghh9VulNr8p49TGlk4PhWKZXNYFjVQC3qHN9xjLECp
         uxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738879; x=1793343679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACcgwhYkC3KUc2WR3EDrO9YGPVQuZ9/nNSNkiIADP0=;
        b=tml0gvC3ClMgowzrmM2+N5HMu5xSF4Cc+Zh7B7YsMkBWR3NOG0zX5IQ98AzKsaUUwR
         Cz2hok3iO5xHwmiz/7OdRwBQ/8HiPrcYsZ0Ou6BGXpmOElLdiqU6YUtEY2b1uT52c3mL
         GTBMvTFDPHE7p92kUYggrqTmtdpgKn92gCnwKTpK2kIrOSSzL5YKAPiVaoWz+Cm43Wjv
         /L16bA++lcZyToHPOvFJH3p/XFHlSIefVnU7vb080KkyId+ikp3xfZ9ELEBjc75rYPje
         MNiC3X18uzRCgQc7UTo+ZabZ0xSldOpb/rRdIiZPtFjeQCUGVzTURa4Q5Jofd8yXavJ8
         ja2A==
X-Forwarded-Encrypted: i=1; AKwUvBzTXyh58e5SKDHxasjwFyFX9sTCYWjjYmgPupy7NgG+Del20Gw+aT8AVLMb3v58ACD9GLnuLtc5aRdSf1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiX99qB16l+29RHgfJSFfem+vtykW0v73M8UDaRNd9J1DNYQVc
	saCvcLLD4g7nlAbFgJifjjtLIfYNXjo/vaSVEBn/KcHWaEfWnZ92yK/eoZ37tuZ7td4YY7GzQ6C
	TXSudFl/Fwc7/0BicllK+tVsMmJD9aUIKDv8VlATpW757d+lmfGJmcYt33xACDk6oAv8=
X-Gm-Gg: AYBFou1+2UTas2TJR+CDdsaHXroLCDUen4wJMg9Bruo4rj/lqYox/+JZHDpoYt9Xh0D
	R3OOI0ppR6Jd/iLgTRvWUkHqPmHYm8JfHwQLIwUzsphJX2f9QZ3jj6C2CBESL+y4QBnTmEDtb+2
	XU6yKneZ8QNE6UcbArCSOck2fi5wDF3X5Rn9qtFmCQ3d8N7qFQHfK72kcgUjP6BK+xdraSrnQW9
	HU88yimdc4lvDt5442OA1ByWRRzsfhlCjSz50SYoCEKrkOS/loOz0LEUKQT+pQ+biuAw1uTTAwq
	QhDa7zrzIGU44HjyrW0cgjMIukVKBWG0L3RmoJQC3G0owqK8j0pC80AAmGjgAjxRvurecXJmdF9
	+rMhk3kvP0CV8/yav5TPxxWi0mxTGtrgCIq1Sd5dZJ1WItOlWP0k3VsRT/w9NY6LJuL+e9+LGVQ
	Z6ojGo5IghhvvfLfhgudT2dA==
X-Received: by 2002:a17:90b:17c5:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3adce0cfd32mr1195295a91.63.1792738879354;
        Fri, 23 Oct 2026 00:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3adce0cfd32mr1195233a91.63.1792738878394;
        Fri, 23 Oct 2026 00:01:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:04 +0530
Subject: [PATCH ath-next v3 01/17] dt-bindings: net: wireless: Add QCN6432
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-1-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: MTnddnjg1cpyta0Xlgydmb2MV-KWNFyM
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb0640 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX873/UahZYZ8+
 emymPE61H2M3nXZKWzjlm60Cfjc4khoMcRmsjEW4SA2pKHNvGRJVf4W7pq5tu3gwjRiNz3DAEVh
 KvzzwpWyRbacaL6l9BcRBieu3Jv5PoQ=
X-Proofpoint-ORIG-GUID: MTnddnjg1cpyta0Xlgydmb2MV-KWNFyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX46MMqA/xX9xm
 bq/9mqawrTYInGECkqhUIo4pnZvNfohLmHgJIi8iAljuu+AXlsJuaDoWq7tyu7vF9X71EptTGWz
 Szx+o7BiuYuT2fZTu2wl2ioNay9pktVad1VV0baGTst9EZ3HNL2vnk3+Uc9gPh68M8/xQuXO3I7
 PYwE9yS27eOwFYvPurBnhwJlqpl/lMYuUuOnPUrHPxBoRkilqtqtX6H2AiOj+ioeRuNsdHFOjJg
 uZz78isQKK3AOnCb9d2curgDyFPBLM7rqL38CKKgeItvpxdIg9sHIb6GeWlczmmwtJdUaRMzEQf
 di0QkHVPPlyuXJO6j5NJ7DebbNAVL0TlyzYSUgUmU3dZSYSqV4loISYc+HlHl+LRlSe5L+2mvgS
 Z/QkrTTw5aF0HuZL3xgu/M+iRVWCLRfcp/y0R25Solb8EiAIyNxooC4js3o2XxV3DmJTbTwPtyx
 NGHujch703zQpSqVvHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
wireless device.

QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
platform device, even though the Wi-Fi hardware interfaces over PCIe.
Document the compatible string and the resources, including the Q6 remote
processor phandle, MSI interrupts, SMEM states and memory regions.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
new file mode 100644
index 000000000000..96e164620574
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies QCN6432 wireless device
+
+maintainers:
+  - Jeff Johnson <jjohnson@kernel.org>
+
+description:
+  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
+  associated with the WCSS Q6 subsystem. The device is represented
+  as a platform device and uses MSI interrupts for its Copy Engine
+  (CE) and Data Path (DP) rings.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcn6432
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
+        compatible = "qcom,qcn6432";
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

