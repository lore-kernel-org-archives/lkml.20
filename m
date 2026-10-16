Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D036654C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120922; cv=none; b=jO522/LgeAV6H+NddYYbZ6mxEMCPfzrHaFC+/1ePtPwYl3fT12QaATxOFGneAUkT54JaI5BGqqvSYDyYrVs4WvyfWLqhZ6apbckftrWbljGXpYTli+iaTLjtPCVMSYZS7qbe+5eVHsCpt2M66DLKGIY5TvZR4c95KnKrL5nbjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120922; c=relaxed/simple;
	bh=dJPjGJ8Rj1VlQxPyjR35h/QvydWoxDZhoPBw5mGTYO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0WxdYSDQGiuCRS6O5iBNDfNNKyb/xZYNGdPO5bmYJ5ab8rXIVW6gEaaS/rfYoQ5Yu5vut0xE3/mJe4zhj7XhMfAyNbOHNJ6NZOVl8WetJuAC7OB6vBtgnYL/HvahD4shRmduv9EPBYMS0fudrE3HNPC6X6APQL3aQLAbmrU6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7S/g4JR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRuaqdMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7S/g4JR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRuaqdMs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNfxIk1635307
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=; b=l7S/g4JRKtxzw3Lm
	tlwbaH9ymNwBtjn+TX5+OlzR+kStZ9BOWa1AoR6Tn/GcHljRRFRen3DE/k9Bl0Sc
	rjVk65HvowuGKy8HYJ3lwR47LrmYiBOk2sf2vYcaWnc6c/ZQjpo+7yg8qa9W+J0n
	dnN/3l9LZC3Y8wBXZCCjo7/PC10RNHIbu3oYO8M8109P8Svu3amCQz2TjPY9K7A9
	h1i6NJKQUMS10bLIL4DSrmxcnSKPFbP8MW4nanb8WRBYOtYulsE/pLxWEDLXcYE9
	x8J7XHz1aTy3YtJ7/KkZYQ1tOnCeS1oSL2pDFeuaAVTqLLHN8puvbS1LEuL5gKhI
	3U9s5g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r10m05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:21:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2607228eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120914; x=1792725714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=;
        b=eRuaqdMsjMS82SRWs7KQysdrUdaiCOlKCXZRDzC3KDQQF8CmqG4Lmsw8cghgIfuwoW
         Y4odAkHQ9ibOS5FOAVU0gg8RQVcl/ZoIJ3CYnv58WQPnvTXeVK1xyB9kkR1N9SVQymhz
         eu78pbwuswBDh0TDE7Es2o4DMxY3hcWcJcEkCBS+61WtYven8meVdFAXCWKxVrMtXhzJ
         QtlrlAqSxafNvlQgZVd5Eur7u1j0rC0Nwn21gHY6wk8dkNea7P9oAGt+xPBgmlPJU0kZ
         CnxI/CRnR0IOMUbswDpIrUdlTVhpRjwo076r021rd7tZHMwdqCDwjFrS3Sp4MAa5btsb
         NM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120914; x=1792725714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq+7PKqldQcvs5CJO0ETAevA2lMbQZ78vlkTg3NcVtY=;
        b=Wu3QcNZWA+WPVNqLiKMA14uUPs2cf3iJJO56TywWvZeMV12jMhyZ7eozYW5QSYOh7X
         /jiltHnRLm/M2+0uH0PRwzVoTV4OyrYFp5H22sUU0E/+lEMTFR45vWDJfhcuOAs0cVit
         jo2antrecqX5igtOZqk/s0WGHsgZV4IJm2644KiY3kOIdNRWrgg2S01UObrq/XAzA1xt
         zpk/kzIbw50a2jU27mI6W8QS9qxqpK+0Ezev5zPjhvpR/VdQn1cYiWjypGscwdqrAqaG
         IfB0Dd4eNCIWIRbTXfOOcbUR+zNYFFo375S30sDJbZBP5XvDjyrppUqdKzB9AADYdu0E
         yGIw==
X-Forwarded-Encrypted: i=1; AKwUvBzAEphZlVNtkKFKd12/bV5i99st+Ms/fwsfaQjNjvIoo6PUKTLXUtzfJE3RTJiYqC65VcZL7FFg3M9+J0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA+d5VZHvx+tNnpM9TrD6nVw1UkNvhZORQ5nTxPG97BmMovTbS
	ndM7YFDowqpZ6Ps1pgIMTdDI8oss+GcnHQdCDjTpgIWRuKSQvJ1JMpRs5V4SqlwMFTtyeMYdi3E
	GfJ3iIThYxFpkzPlIW9511qLl2ml2uBAYAZBKhRU0AZkPtfiK+PywPUqmYjqlHpplOzw=
X-Gm-Gg: AYBFou1bfev6ddz5amF8UdXfqBjCgHSvAwRa/5ajZ48Zao5rQbR847z4c6Yb4x+rPkE
	+Xf7n0TTohZg9/d0INfoVzjzH0MQ8iGwoUhAJcK8qY2w5M7JH7C64xvbygk40VYxt2llD5yM+cq
	PolQotFEc7NwsdjGaw0NNWjEKQl9Ko1ZYcLRZ5Xs+VtfjwEgQeOlN95VKj4GMiHL8hunfJSDpLD
	icW4/nhKS/1u7GkOcP2Jl/ldTM28xzXeYiOkHIC6OE/dDAzSUSMEIffY0CRpjlc9/oDn67UiTsk
	gTt3XE82kZJPw3EpGvOpCYqdn4VnAza4DXOVqLzAATAxhlcU3J/JyxHCEdd1Vr8v99VMZdCi61O
	2dccCabN7uxrVP/BHES0QEdj3nXUqmFSCP+SizSQrVy60PUAN5+N0C/DAS/jDXGHhuXw1vyq+k5
	1GYJ5GmEYfQxEPivXI7JJjZA==
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr29159194eec.23.1792120914186;
        Thu, 15 Oct 2026 20:21:54 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr29159167eec.23.1792120913628;
        Thu, 15 Oct 2026 20:21:53 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:21:53 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:38 +0530
Subject: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 6bGzs1ZStCZCcX6VmFq8khcB5JDISba9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX/FX/NKiRbtxp
 rah9XYt5v9sYkbrtoham+JsZPDwwadc9DTlJcJqNk4CzuOtW88BopzdbRGja1tqcfUk8CklOpCt
 gOpHDad+bXGA94ZOJMv8ejT9sJhZ5iI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXwhN0zEr5U+7k
 VT0rllN9iE52LnSP9UUaWJ86veXVjb9KGq+lmGepNyQ6/6rD0QV8D0zvIfpXKl4BVTwxovOacBz
 pj+mHM0hK3kwoXyFdyHyLEKBK/pJo40z3rWDDu5n11Wmqp7UetJDyVGqxEaakIPkxvDVOKt7SMF
 pm2Dh8kXLlux7rnng5XFiDVWh0aEvHd2pkwJw9QojC/0baOOcbPAagc0e0+2vf4CeaOjR99lH2i
 FSxcOFjfItK1MN1AClqjpFMrYQaXJFSEZ9V2Y1U0zNLfCnGluhfOM4A+ryFHctOAWqB/5okfoUB
 oNNbtVrBdTyTPYwROL72Y+EtcMqqlv7eQp8vP31/yep1y4eYKiD0Fm3J/76LVWvAyOfK0dnNl2G
 l4d1Y+wfYl6zx+n4Z5CYGPpD8UlPFT1pXS1/T51fPtd0aMU1dIdEbdeA7yozX8kOqBbdlnbD8SV
 eRbEfIpOHh/yqRyBV8A==
X-Proofpoint-GUID: 6bGzs1ZStCZCcX6VmFq8khcB5JDISba9
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad19852 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Zbx1xPUqErz4vskW_SEA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

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
index 000000000000..291d96aefc2f
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

