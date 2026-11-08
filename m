Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143927;
	b=RjEtDXuEJIXZMHfei3OCOGlUMzfHfW8PO2apGNUjl4xSV/DnyZbm8hJ4GF3bTEp8NJEs
	 nOuOgVigZSZn9YP/Ca5aGGPe3u31ogSsT3xWbG0iSce5KrTh3D9I8i+cyp8mkRjjDOi+R
	 u2GLXWHT1sxHBobIu79GIfHIrgbD5N4znizohO2z2KCqOcBVsnIQzQC0IqqJTK3xrovGU
	 6Ha/mR7HqBrgeAieOOIYKUTYSvay0CLwa/hg6LFFcZNdvWoeV1xcI1WMnQ7dkj9vlGSmt
	 hdVBU9sGEYArvB8pntbxd9BnSw+qwj4SV4Za9bAr44FHjSUEU3PO+Qaqa4ccrkDZsfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=;
	b=aEIG/euCHD2cLDGo4BoL/qE7GCMtSV0KKhbWOc5zjm5ob9r70N6QhOfJwn5nJCmobuw+
	 D0UnnPffq4KorvZxe9FMtjOVJ3cd4UpZmwu2EosUQ+ey+QbAQs3hjY6Z4EOMmjFjj1Vsk
	 qt+Dt3sXGL0AYUis60d3nYQg6RYYh1x7DxwpXKP9vzOMITuvWj7Ke2GB1n30XNDNCB0PX
	 2Hw9s2yzOhVDKbIqHaWMYLllyAvwCx9Q96A5eyw9+d3/4Cut9kJzdVONx3tR+Cux+JLgA
	 l7VbooGtB2pBxQdMpPB8tL/iXcGaXCWiXXA4E4TvmWVffM7JFm2n8KiFdLOdNyn+TeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKTHRfJ0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Uo7o8Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684FB606A331
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684FB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKTHRfJ0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3Uo7o8Y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Afkew2209012
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=; b=FKTHRfJ0F487PoJa
	LfJ4+rV3+wbTcw8APlMMt3FN4USLTYAoY16cPVZUE3aA/uUlq9G3C5N+97vVnkUP
	o5CLguVQh+L+Vl+eXqvfn7gz64dhQD4jlSptXETKRS7iJWy4kkn+QSIFhdx5I3F1
	dgKSyRDj56I450+c+P45uHKZFz834KymMuzD9tzd+RreUZMPY4hA35dYV3AY01Xl
	8dO831XhtklHHNHV6/31A0zTtdQQa/rym2BEsnMq4xlEUXv5ZXH21JDyjyeAFCgm
	3Q45WCL5CMQ60VKn0KhVkR0Bjyl3DkezVEZnWUsJNf2lS1Z0HJFxth3bzxFc1iiC
	qOAO3w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf39w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:18:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so122267c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143926; x=1794748726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=;
        b=G3Uo7o8Yd+iOgrO1GzgKQlgs5a4DcPhbwq1Iam+hlZqpyDLRkpklXN6UiaZSp8ocBX
         Tx1BwIX9bEWSdd0ho1cOVriw3BuX6Z38VBJMwP21d8ytfHGoxLdEa0xBbsLwhiYUAUY2
         b1cpGsgcn/gBWtVeGzw3Ug2rJ2NrG4gUExwB/gb+qHluUA1KGCr40elKeaC55nE7lVLI
         8+KN9HqbKnkGYyVwqelATzpK9rODdedUAR2MYD5FBTDRwgizrhszXoAqwaXrTUWfd4En
         wz6eJaKeh5u/SEWmmbitUP34F0yM//KqKRMlzSH3Z2wJ5MoxOsNmnHH7VfSxtG0efH+e
         Yqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143926; x=1794748726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jr1K8KQjyiiPf5+tNEOw6AbSX+1As/e48i2X/eRzKKE=;
        b=s8t2zZs3ZJwf4ac1p7QTWFmxiV2idioamGyK+3G+iMDv6/+GGn0C5O8WEA4JnwPAGU
         gvSC9uLNqK9IyzriEV57Ku0fy3Yljw26czZ/bfcxktJ40T/ooFMTkUw4MUAr7EAl+QDF
         TSn8l8pKvqywKqQlcUHekBUvS+kApq/5L7gWc8ZF7mxe1rVuzWosaz8XSXKmpneTL2it
         mjS9eibTvJiMCmJZcAr40cSwP6K5l2hUynHr/N54T7I1CsBXTsYVbXkxAr780iXO+MTg
         SVtthwh/kSyd9DIdodlJ9JQlNKPQY9gLLJP0cNcfYcPxflWiyd2Sq1NVtSd8CClosVCx
         LeOg==
X-Forwarded-Encrypted: i=1; AL+hErHwZozuXv4jILUPPp/8FH1HipNV2/zpKLUJgZo2stEFzdWNe+dx+8zTMXus32Hspuf2d/bJO6tI78VzzWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9emMGJU+zrS+UWh4iKfguU+3+bjO31tFByp4/Jek7XbOt/IDSr
	MoeoLgjAfl4fcDF26GqOmz3f7n06yO9oGMpoqc4bzN2ThvtIyJfv5hrSHOcc1b2VKiHKpq+iF/C
	q7Sg/NihLy9xOUH1PLXShylDiVodhPAqK1UUodIwyhzkKkH1LLGTcqZhmFIxFs5TnFwA=
X-Gm-Gg: AYBFou3WtuI3YPRzxznWzBTihWMTvtL33W/vOgHtCNopJVMdfwMsb5taO7Pmr2Rr8J+
	j6rHe8R09yKY7dMVkuO73ieZam0z1d31DoPtz++usYytnsPxvMdJboXzVPEXfGj1IqP7DQeXKSp
	zqnQhP6v3n3fPA029LK3xdVwUtqwaAP1IaznfH0/+jylr+uPyPf8DzErDn6jw5kPyaTtmwZ/jGo
	RPWT++pMXDwTfDgy+sXIAtsg3CCyzP2Upmsn+Mjmg+rkqiOunCm39JKH08jlo3wIXbpi34GsLxZ
	7NHSrtHi0pfSjne7k0qnuZtrJM5MHOxzur2u7Wt8asm7Z9oYtgcRluE4gC+aSnPvMVQT2t9uXqL
	IJbZnYlD+J/L6JZAwTcqGwVVNFyzr+MRKAsSVuXuO1GM/GJ7S5GRRxUQ226bqpmw7w4RS1fHx0S
	FVf8s=
X-Received: by 2002:a05:7022:3c85:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1b39fdac3a0mr1916658c88.0.1794143925777;
        Sun, 08 Nov 2026 05:18:45 -0800 (PST)
X-Received: by 2002:a05:7022:3c85:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1b39fdac3a0mr1916623c88.0.1794143925126;
        Sun, 08 Nov 2026 05:18:45 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:18:44 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:23 +0530
Subject: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
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
Message-Id: <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX+nxaCtlpX6iT
 NznTzARQ21CEVbMdB8rtJ+kIdEaZw/y/7rBzVP+MzVxis+/y7/YQTfs+0gB9u6sGjx+nhDj/dk4
 OZTEy132brpNbCr2eXiNmNfHXeuKVd0=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af076b6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mcFP9djfoIsIUEB4waUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 00em2yP8kuQ6HRtXIdXG_t2Mdfu3wlCl
X-Proofpoint-ORIG-GUID: 00em2yP8kuQ6HRtXIdXG_t2Mdfu3wlCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX85BSNmLs1OhJ
 lhv3rnQPyPrtwExr+uEEADYQk41rQfMGv4R8pfkX1nZy0W8FqikRUq1I5x8wVlsfd2ZH9lsL5UC
 3NsrPSxVwX9hr7DvH+5bb6K3uv8KC3NSueo8lKcxpQG5Is1bJRhG7s7L9idguny48xiQNpb3LK0
 ICwmMpEfgzhHucF+rmxUEe9JZAnm7tj4i0v5neDNqd32B8zdN9GvDSl4W/fBJqG46/yVJfAYCeF
 /An2HLjVC0BHJODH6zDpJFejhixfzwgsDr4oz0Ofw+za8o6XW0F0zzZqpkPnjsBw+fAeijPD3fU
 Atvr5r9kXdpkTTG1MsHFp5oaj9/8RGTYyAnZLxauDPKzc2U7hah0S7ccG+C/QbiPF5YabqBHnwd
 zPfpKe7kDXs+w9CJbSyMUgiTd+dKqQSm0ZCv1+weJG1RBVIYKcYIBFzApTKAzPY3nhNWIEYyCM6
 ZMtcnzWtqs93vbOx20A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080052

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm QDU1000 SoC.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
new file mode 100644
index 000000000000..52a063ec4b78
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Timestamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block captures TSC timestamps for external hardware events. Each
+  ETU slice binds a slice number to an external event selector, and
+  generates its own interrupt when that event is triggered.
+
+properties:
+  compatible:
+    const: qcom,qdu1000-tscss
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: tsc
+      - const: etu
+
+  clocks:
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    minItems: 1
+    maxItems: 16
+    description:
+      Per slice interrupt raised based on an external event mapped to
+      that ETU slice.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 16
+    items:
+      pattern: "^slice[0-9]+$"
+
+  pinctrl-names:
+    minItems: 1
+    maxItems: 16
+    items:
+      pattern: "^slice[0-9]+$"
+
+  qcom,etu-slice:
+    description:
+      ETU slice number for each entry in interrupts, interrupt-names,
+      pinctrl-<n>, pinctrl-names and qcom,etu-event-sel.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  qcom,etu-event-sel:
+    description:
+      External event selection value for each ETU slice listed in
+      qcom,etu-slice.
+    minItems: 1
+    maxItems: 16
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        reg-names:
+          contains:
+            const: etu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+      required:
+        - interrupts
+        - interrupt-names
+        - pinctrl-names
+        - qcom,etu-slice
+        - qcom,etu-event-sel
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1da0000 {
+        compatible = "qcom,qdu1000-tscss";
+        reg = <0x0 0x01da0000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+                 <&gcc GCC_TSC_CNTR_CLK>,
+                 <&gcc GCC_TSC_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+        assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+        assigned-clock-rates = <500000000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ptp@1da0000 {
+        compatible = "qcom,qdu1000-tscss";
+        reg = <0x0 0x01da0000 0x0 0x2000>,
+              <0x0 0x01db0000 0x0 0x10000>;
+        reg-names = "tsc", "etu";
+
+        clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+                 <&gcc GCC_TSC_CNTR_CLK>,
+                 <&gcc GCC_TSC_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+        assigned-clock-rates = <500000000>;
+
+        interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "slice1", "slice5", "slice6";
+
+        pinctrl-0 = <&tod_pps>;
+        pinctrl-1 = <&gps_pps>;
+        pinctrl-2 = <&hardsync_pps>;
+        pinctrl-names = "slice1", "slice5", "slice6";
+
+        qcom,etu-slice = <1 5 6>;
+        qcom,etu-event-sel = <1 3 2>;
+      };
+    };
+...

-- 
2.34.1

