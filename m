Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828892;
	b=r/2HXICB916vaFF1un4x73MzYRSC33CYkPqrTixCkCiw8qcE8X1tJwfvwjoCyJj65iEZ
	 8HO4kidlFPW6ZVi5WUJdqeNiNGwiH1JYVRWRoB2JsxFltB6OgMG7sD+wtF5ghyz2HufaW
	 aDhJ6lyHMxWY4+ZEX0qJI2Hynj7pLMErLlAREFdm2VcLB0Yp63MnarRnENCKzt5caTHz4
	 36VSzUFIfxlm4wpL+8BS5gY82VwF3eY4cKM2m7tfMy4fbqJnNECF3qE68olHRQ52nGuK8
	 aKevEFa4pCJiGbWzfvCI4eDZKECGXBzl8cxzfdmet1mV8QDqFbw/LCx6fK4aGhMb0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
	b=1y6oSgB3uXAuZbcYQwTdz19PnpYFVRHNVWe/vOvpLNMcgnTrY0QqZkxY/yMzGpj255i/
	 kXaaAQhStaBOCO8cLhOntrbWuknBGDgP8h3I1/UbwkXLChJ0i31ySqVd7V2xHEJh1s6kL
	 sNHwtpldbg9wrntsR1FsoP+Pq1ib9S+uIxluDlT41ZR+Y7ALNChX/hOKUcKFiPaBGLyTK
	 Se72wiuRh8d5Zmnhe6j3N1iInRIN9e0Qcu8kww+lgAzb+clZBcpKrDkuq4Bysbfwo99FU
	 p+0POh2fxByeGZYZYZvJymc51GSxBA6la3N7YwfJU0Ze5jrrbq1mM8eCKjHBSd2A22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2QX+32Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gQG/wRoO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F7606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2QX+32Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQG/wRoO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLZ9G1465834
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=; b=Z2QX+32Y9/8Ixjps
	svM98CT7t5nw8ZiK3q6x0xO2l/iDYJE8ktbl2uCG5wSDEa0hn1SCcOup2LVclavB
	nRO4Sb1fsmByzbRybkNmer9HNSC6zHPbGT98DvohpPOkmqsObH3+9gwt5mY39PUg
	A3CimrVpsK7eq2F3Fd8T0rM1u+Y9QBzVVeOl1rkJemmGgqLyJebzqwNvUGXS8goI
	lA0dYZ+RnWjNFa9+OXi8DNyJuiHuI3ghuiM3hkuJrE2jazUtCU36z7a+aqHlAwR/
	x2sFX8a4O0GmQ0ROAlEeLquVxUnlHXcL8YElvcuHH2OygFEwJE193bXyTqLU4kOd
	kkSR5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2ghp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:34:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso3242367a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828890; x=1795433690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
        b=gQG/wRoOhlna4BgUQLnLC3GW6qAdmCaxtKJ5mHeqiYMj1B2uBRmJ2SrfuKNCMHYE/W
         72mpiI0lMujz3FlA+rFzTbpM54vXltVq3yElt6eoEpXuBIm+KCPxAEXuDDJ6gQRiJ+oe
         KGB3P01asLfDqxW1PVOBhZfLWAIB1opKTmoQ7NWg6MCgoUSAMv0J9pmHrl6/GIE7Vj40
         MDTAd3y5NTA0qzH1wHp5a09MIrbrkcK+U+E32Yf8AfVQ7+DGhyY18CBQR2v1mHyeusvU
         q6YoEvYjPmif8cQEBeh9aC8t4MLudkwKF8Qr8Jlqwn2s1hghBVPx/XkNL1Gj8EIydMbS
         A/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828890; x=1795433690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
        b=QsZunSqteuWHmC/MYSvOtGn5K3cR2eRcDQ57jVE6oRF3KAhVMpJBoyLjhQNZy3LOlp
         +kvt2SQ2VxoQ5ioogNrQohc9Y9FiLbyIsg4rBgTgl1cvtbjehu9SBbq17svjMGNgpWS+
         trYkInzxsuseCZ5BWZl1vckMPIJ9DZHIM/SNvylvvMUdZFo7e1rcSNOE3ATIMxYc7Ltp
         WCvPWPP25HlEhUnZ+i/NArD2hHEfqroRvFdCCqW2+HWLNyMZYuOST8Klvu/29LQj457O
         dbU6WqScoW5dAf5IsYtDhxLvmf/jeUaPCcPmH2r0+Ty8RoaSRngVOv2qOG8Tz9n1Psjl
         wcGA==
X-Forwarded-Encrypted: i=1; AL+hErEGMZjLHPs/nf6thC3dhpd2kyRjx0R4ae5YJ6eq0l1lwcwuw8vXl6cCLio+CoQfFfxFGD4UQg/c4dHq1Ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kTXacxrDxBL02nSJ4Q9SmIa4GFokB24XJnzO4F6x5SQppZKTP
	xTdapokgB3n2PvfV9foTTm6Z5X41AZPNSTaf6a3C5CZPILwT4Yo6SPAA6UHUddAexTqKdWq4Mme
	e77tV9z17Phz51zxCJSptdawV2VmE9AZLK0fW5AmM9LxM77vHYGnWvD0T1yNIFeoo/zg=
X-Gm-Gg: AZFdTZdXF9Bz7kyPykOZoA8qmzXLUwZ17nxugUyQWwXL/fQsnoAmODwZs/MHyUrxzg6
	4vxQLSMgJZ8na3LZ2fqghDR9F0aWen5uO3swrxPFBWVVj1SjbpLpZ7cta5CRUHvY1v+vX6HPk32
	JXU79P+6nv8HtaVlUsuE6ycsxgm6sDpE4WEjnXMc6OKpzazNLelYt6MJ0Evg0X4RPUc74z8VL9L
	J0Brky5Mt9qu7zvSZ5uBW4RG0yIju7Exhk0REZQ/nuIsSGREJqyvGBkambMYEg99uWxCgc6lgdY
	OxVbrLUA8jc2eiNCqNt8BnwgPDvZVuU8KoIe8bsOvOV4s3mU0NCogH6qukJN363vV+OxH16kPni
	ac623r24RbjiZ+RRYXBej/YeNgmYsUdll2RAno0GxkiygnRGTXSLjwEypJZY77ajIahELJNxLF8
	1V
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6831655a91.30.1794828889741;
        Mon, 16 Nov 2026 03:34:49 -0800 (PST)
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6831633a91.30.1794828889253;
        Mon, 16 Nov 2026 03:34:49 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:34:48 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:04 +0530
Subject: [PATCH v2 1/4] dt-bindings: display: bridge: Add Parade PS195
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
Message-Id: <20261116-mahua-hdmi-v2-1-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=4283;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XqWVS/G6kyEGs7FM3vsOHGEHaxWN/UrO6qm6Co6aCVI=;
 b=WtBTscvQ0DovqRE3dOcQSKtm7PgukaEYc6NSnRNGQ6EeL0dXOyYpjQV5IcW+0oPs2xVZ5B56F
 oeXiTxWZuOTB1Znac4fzZm5gCusQZAZeTeJaJSrWwzttE7+xenJOj3B
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afaea5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8
 a=9e7qC0O8hlTshWeg44oA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX2ufVTwnrYhz1
 ouqPrFlaGIQYdNKEMiWh0r51lvHFJ6CxRayu0rEbQHj297a8g1+jO8FsOWMLMUhu6AxqzAbjuqz
 nSkm7OKDCzJbYT3h9rN7vh9qy/9E4Hg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX6l7tLqbcsu4s
 62wM3rlKTE2Ik9XonUyiTIcUveIlUJ2SdNw8X5UEVCGaTQzxExWBtkcaz37mkNfO4UrgeIUo5fb
 V5zyF+uifp72NyNfvzaqf6KaW//V4bR1LtiHUpXL0R4utUs03A8UaGHIg+e/gnhkuvhipVwjvkH
 RKi09INPYpNyYZjsh9YCoBBwZbQUHwiprpk77/y/3j87dMKQSx5Up9Ro64vkdu3YhQ1AdTbWiZZ
 Wj2HoJPVv2Uy/SGvGiQkd6NWosmbkj9PaItKmRFemv4fBE6qu6u97w+Miwzsd8kSwh1/vrbPsch
 Ae5MqQmBqos/MYDhafxP93W/8ZgxIHrxDFKwAdcO8KSdvs7LBxxkhzrPoQi7XWUK54JHFcYtnQJ
 57MnBS/Mnjd8K2a97NL/CF5kkLMxU0EBSG3cjx0ptXmmiH8JXIbgM2XUKZIdE5En81QnthoiGYu
 SRBnD916fYsi5bfc2hA==
X-Proofpoint-GUID: 1L7k-LzRyQQeUvcqhoIR1xFQR_ZpOkvD
X-Proofpoint-ORIG-GUID: 1L7k-LzRyQQeUvcqhoIR1xFQR_ZpOkvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
its power supplies, optional reset GPIO and display ports.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/bridge/parade,ps195.yaml      | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
new file mode 100644
index 000000000000..b7484caf93b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/parade,ps195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS195 DisplayPort to HDMI protocol converter
+
+maintainers:
+  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
+
+description:
+  The PS195 converts DisplayPort input to HDMI output. Firmware loaded from
+  an external SPI flash handles link training, EDID access and hotplug
+  detection. An I2C control interface provides access to the device registers.
+  Reset may be controlled by a GPIO or released by a board resistor-capacitor
+  network.
+
+properties:
+  compatible:
+    const: parade,ps195
+
+  reg:
+    description:
+      I2C address, selected by GPIO11. The address is 0x08 when GPIO11 is low
+      and 0x48 when it is high.
+    items:
+      - enum: [0x08, 0x48]
+
+  vdd09-supply:
+    description: 0.95 V core and analog supply.
+
+  vdd12-supply:
+    description: 1.2 V I/O supply.
+
+  vdd33-supply:
+    description: 3.3 V supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESETB input.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: DisplayPort input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: HDMI output.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - vdd09-supply
+  - vdd12-supply
+  - vdd33-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-bridge@8 {
+            compatible = "parade,ps195";
+            reg = <0x08>;
+
+            vdd09-supply = <&vreg_hdmi_0p95>;
+            vdd12-supply = <&vreg_hdmi_1p2>;
+            vdd33-supply = <&vreg_hdmi_3p3>;
+
+            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_in: endpoint {
+                        remote-endpoint = <&dp_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..9e1db88ec1c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
 F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
 
+DRM DRIVER FOR PARADE PS195 BRIDGE CHIP
+M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
 F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml

-- 
2.34.1

