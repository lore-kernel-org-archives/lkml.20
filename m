Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478557;
	b=IRlHjI3QjgVIz3HOjyTqvEtwm3HHKAbgDpGSNMLOWnRiVAJ06lROZRoYypHwctwJgR9E
	 GUfVEoxgsU9h/nHJhDsv/rXlf1yQ5PWnBcfIS8KVqKfy8OftqRr1wmNvb+fmK20vKh0SD
	 IS1nSif4aPDGsallRmfqFAW4a8nRHdKC+AG28C+T8MDrrPnm74eeuJ/hhVde/PT/PzuU/
	 XrCr03WyQJkgPV3i+wRZEPUO7seJiFufwJEv0Y1XxIvpYZ03gETl7dSPAwecfczRS1f3C
	 t2RKtz3RIoUayfdCtAOhtQwKXgIrH+ZPAl6OWWQSQSeMrDz0vLhipKhT3QRhYARUubQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478557;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
	b=1mX9Pm/j+5FF4+35diH1niuZ0z0DLf8Ct9FDNmKBln6V7MyjyoLnn7zOgtxFcWPDvYeM
	 xrxySZ41/6H9p3LjXYlEjDEmrxtB4spE8Ic83UwicTAtklao8YyzghSpDLXeUjxr1V4i4
	 31i+X1+dq9MA4ovmV7ARdzbGefWHbuNfmxec5W/TqocoTs7gmeOaTD8nYsHp9pvzwxfcR
	 kvijsGQYqMYhNBtfbzWCKeAyqj+rxqmNqi0UD0ylJ3LyzCOnioUdUii4tJbM8SUw5TKRp
	 up6ongdHCzc3HfLU04c5oLl6bc/fpYLCsuM3IZ8jb+ZjLgM9zmK5l86MwyrfRiQnEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fzmqt7oK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STW2KqLq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2330606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2330606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fzmqt7oK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STW2KqLq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8ucHv4149291
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=; b=Fzmqt7oKnOcfFg2u
	ewzqXgKKfY296D6RBHlr7RPnrOCjgyuFJnbMJqhtiEJQWIJBTquuOKWIYGdBcwot
	INFto1MfBzgi19DZZPHb0y0z9C1zYCmBUx70VgrUgS7cFxaKyDLdeH1pfFedbjSf
	i9dg2DBH1hCX2MTlbZef7q8nvqOO70v4NGKtKGIZe76ZSwVpvfYoOciD9jL2Duts
	3iCpK2mkIi76LYki8HF9r9jbPqHjuwI3K0/Bg3hqLCa5J3aiOP1BeDVOhkV6ptQh
	G7pE7dwjRtZ/+RgsqHyBvuVAJM6MdQ+0ns20RyFcDT2ZyRYrQb5hlkuB6q0BsZYo
	D4zh8g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62xmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so3467165b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478554; x=1795083354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
        b=STW2KqLqOztywiCCS3HM/5CkZC1TphJA0S6mo/W5O1wXA20QU/BxB3lrfVfcclmodt
         b9/z5lIThM3gLmeh0f5dFhfhy9zt0obpjdzJKttabHHblefbLLjEnuEnbiPxUKRE0JYT
         WSHHf1RB/wZIGwxHmEdARrdQhoO4aRv7K1HJN39FECqjdhNIW7jRBg63xWHXNCjjMrzU
         EhkvI5DLh4iinHEEBsKgGmk1D8+7tGQTv2XSYNwqZdQ9XhP4J283Tdihdf45akeCROAl
         4UEsstIXrHGA5xPw7ekcv21eM6akJCiSc2gDKKB1iHkezdDnT7llYgyinqah35iWO9lq
         gtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478554; x=1795083354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
        b=WOf/On77E1FcKQTD9Q2I97aux1EN/YkOvN5wlKupiCA+hBd1N9RJAZSqLrmdZqARcv
         W9FhATGBLLPFagYDoNMtUJNEtfPXKae6dgaVoFocDaS5pmnzHYC0kNadwjNDZr1rdJg0
         Y/yeBEHAAZbTe4mzx4uQ5KvuCSSnSrX4pDbISBjtd8HF7S86N6Pp/NtEuBCWC/O8a3A2
         gPYO4llDHoxKdRmCn3RRVBgSxDSuW7/L6cZT8d56Jnn2PlvVQcxU6HFyEb/vZkuCLJCo
         d2tRLkZHGhiBArgVRVan76hAczGulAMtNKpXWJ6+ClJSpvfcQX33PzoFRA8GWq7QEbMU
         2rYA==
X-Forwarded-Encrypted: i=1; AL+hErFPT13l1JsockAGtQGfip50krkC2mKV5kuiioM8PWkdWoYl3ijz0DfQ3gtkas5QqHOiUcvsMOkSM90Xk1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+h5jVddTXVL7XKRi7bhbS6QppaIjat2qAqkuaDKs8QXKG2yDmJ
	YgiIVipms49XtvKt4jxfTD136Qb+bYfQ1dw8pk+/k4rix8koqsa0ma0dDyfAaHgCiPWyMrp2AIs
	kWkfab4hUNU4Y/U6KUYsuvrI/2hlSlXvwrUc7+TyU4jEB4M+Jy9rDdn/d3GsLCepFKPk=
X-Gm-Gg: AYBFou2JHAKIc8CV49WI3rIJwd5dq8n9hG/mX+7DRKa669O+1OqSBYZi05TAi3anqgU
	xgXeM319dUuEFtn/PjpFEu65rVzLkKO43bklDhPK++IqB+XX4CI1dZImCIITo6GEXUR5Y5fP4vY
	EbRYff5eMM1XiAbunsF8iZJKkuELAEKsaPye40gcRBqLyHWP00QkgVEZhcxHN7c6K1LD8uzwG/T
	i2gy9jpNQ2ZkkLf4KBokMsYnnZt+Y+7yhtUK7z8AdzvrYW967yBBXGE7Yv75mRVsTh9NJpJ2lnk
	pPqNi6+sdaiPSorXpMFaXf4aRwcVp9lA1WhuZGdC0djOxwRA9yLbIVdGnFlkjyY217MMxLg0TGp
	Cys5F9Mo1DhYb8dXemPKNQxh2EboPtLg+SS/6HDzPBfo34a8n14auz9qHpPtQvhEqCxn+aBH/Kh
	L7
X-Received: by 2002:a05:6a20:258b:b0:3e2:b400:2b04 with SMTP id adf61e73a8af0-3f2fecdd04cmr5825422637.45.1794478553647;
        Thu, 12 Nov 2026 02:15:53 -0800 (PST)
X-Received: by 2002:a05:6a20:258b:b0:3e2:b400:2b04 with SMTP id adf61e73a8af0-3f2fecdd04cmr5825386637.45.1794478553168;
        Thu, 12 Nov 2026 02:15:53 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:15:52 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:34 +0530
Subject: [PATCH 1/4] dt-bindings: display: bridge: Add Parade PS195
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
Message-Id: <20261112-mahua-hdmi-v1-1-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=3963;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7LNEKtT4mDMRU5sAzssLKLYmcuRayyy/4HBNgkZ2SGg=;
 b=U/AdJ+o45wb9voMrU2x2MRI1ftHCAd8QA/V23fnJsMKleV0BRWd/NRWn4JvLwt39el9WdiRnd
 TVKaAHUSTjhD7TYJe6mGwPBnrsgR2x2fHIzka11OamsKRpe6gDMvKmH
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 6-5oX2BiMrl1sT2B6AjHP8ZR_1jQhxvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXylGoVYdpPJhx
 iJ+uis83GlcmOcroLs3WW6KOdI3MxBvtbD69OBjnTHvkqTjCMTBArxfwJBlDutUC7JzqqFmi48M
 N5lFx3faT54AcTWxXDXDXpJ5D5o7DSWBk8jtXniLUE3rAvvO48x+ZI9DAE/PkxYUk9r1MbGx2Ko
 HxES0kesVEAT7CuaFm9Ea2JbqGky0WEIOYzfxOLbMaD80AAF6fOYfPxizS34z9hYSdWYW6co2G0
 UsdbLcFBbw5MuJVxCMwRNF0gO+yfTnHIJO7g+8i1DiQYaQ0ZFWlrVBav59A2TiZug+uNO/J6M55
 wl+8+EBIHtEufpMbzdUgKBc7jILd5VhHdgNo8aO3hnfEdk2mBSZzOEDju/AT+Yw+kE5LvaMZ2Pt
 wfULUeyn4B+T/LGkG4bo12GBxshMaxrgpqQ3/As1bjCuNobwUSlbYFPQKKzuLNVaganZIk2PL1B
 vxaIfd4B8cuKSZdIyDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXw/+DXYADv2Rd
 Fa1ofUqpY2GgQ2FRKNmVottKbYska78NBQvz2ZxrUKuTyAN8NYz9GQZdlNxbomo/g2Xn+t1fvQA
 SHDcaaUk4JggSVk8RHKINOgqqeEX7RA=
X-Proofpoint-GUID: 6-5oX2BiMrl1sT2B6AjHP8ZR_1jQhxvD
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af591db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8
 a=xQKGsFAfKFO7eTD4QCIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
its power supplies, optional reset GPIO and display ports.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/bridge/parade,ps195.yaml      | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
new file mode 100644
index 000000000000..089191570ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
@@ -0,0 +1,98 @@
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
+  detection. This binding describes operation without host control of
+  the device registers. The optional I2C control port is not required for
+  display operation. Reset may be controlled by a GPIO or released by a
+  board resistor-capacitor network.
+
+properties:
+  compatible:
+    const: parade,ps195
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
+    hdmi-bridge {
+        compatible = "parade,ps195";
+
+        vdd09-supply = <&vreg_hdmi_0p95>;
+        vdd12-supply = <&vreg_hdmi_1p2>;
+        vdd33-supply = <&vreg_hdmi_3p3>;
+
+        reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_in: endpoint {
+                    remote-endpoint = <&dp_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_out: endpoint {
+                    remote-endpoint = <&hdmi_connector_in>;
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

