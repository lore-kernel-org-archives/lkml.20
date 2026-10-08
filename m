Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC1A46AA67
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448048; cv=none; b=EKQSIcUcRYlSFacZzaOFcmI3kEAHfdJpUF0n+EmAO84E7MQOebJbWn2A6K01FEol5GxKyW83buG/+tUaMSXV/thz33rHTEV2psiQa8XTPUeoFDh/e610UnndIzRQZZ77A7Dl43Ywl77OzV6YsPyq6k0/CwbAz7XL5kN/xiq1kVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448048; c=relaxed/simple;
	bh=UOrkDJYQJYd6kOzydkNyLHija7UYmYMjcdt3XAcLsl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AaGWCld1M0ZUIhENI5HWBJdLcRwqvjMxvlAYoknk20ypqnuWdrcoRDcYz7uZSdT3j+J2bCL3i7CEeMl50riqzf22MGBFvO/JYxwzLwD058zbAPzT20/NW2JxTklCWj8Sw6LmGbISGfiTKbKPXunCRQOiAomHF/Xv8HRlWEUiENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4RH6Y5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOfVPLWr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4RH6Y5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOfVPLWr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L30U2067989
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmJP0GhDQoD1XIG/rVhRjfc8NwcRuCcO9rBQihU1/4M=; b=Q4RH6Y5NSFXGSz4c
	/p4UtanJxLL2eUR+WShFDo0we5KjaOCmSiIYJC2aboW8A0c/es+UalxeqQcMgsP6
	+g523rgmxNU0f5cH1n6Q8wZSqwDVPHekl/FcbfilUwlw1sbvb6FARN6EzaoF/wYp
	oHGOGqpyRv4bmlRs0tVFehg9OZa4AUhu5S00cH9RiIOoqGUjj+HfKYYiq5+HnBzP
	RP63Bfi8qnZ0qsWiL181jJzzQd+mY4CQV/UqNebTzKXkJyzx7YujRKG0/b5VQUlP
	FLJQTr9tbMoz5ok2rkggdJxUF48z1/iZxRg4XIKSBbrz+BD1Xm+xibptM6M2cvOh
	fmV7hQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hwk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:27:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338974c0ceso128854911cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448045; x=1792052845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmJP0GhDQoD1XIG/rVhRjfc8NwcRuCcO9rBQihU1/4M=;
        b=QOfVPLWrBw7lQs+BPMkjA+GebAu7+ht/4M6c/hQvrJ9rT1ItwCobFXsqyrNPfgNfwx
         i66EUdmmstiRly3T3xCqsutF8/O7o+wpwIT5Mgs4T402HlIqZP8kDV9rvtQUkqXAzt2x
         +oRfjWRPcAOIaofe1s5GTb2XVAbybkOwc384mUQYTkRlLWSymBnBta9iLbqjIyt0Kc5b
         Nq04sJUmhPtpu0ow6iV38KHK1qGEvT5epBfJzHU+UBxSa1df9GfFIO7Or9FvzCPGY0Wk
         ANeaMNJqvbQlDQE/oEudD9J76QJ8qPmuK28OQUWqr7l6Jky20eaGhIXVtW2I2SyqYVxk
         iscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448045; x=1792052845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmJP0GhDQoD1XIG/rVhRjfc8NwcRuCcO9rBQihU1/4M=;
        b=KWAOU7mtk1V5OTp2AuHA9xw1NznzFeK4ElBWps7tIrWhV3sYiQuUOwiMu6djEujURS
         z8cVyLmzPTzHCrbe2S7V714AtJH9E88pXukyIGJA26E4dVo8Uc3LRFTSBbcPKO4sjhO4
         CVww/ifEo14uSI0RsKn7YcROnlDb8mD3MzDnP1TeUelpR2U5kbyNHt50O9YDOPO9tpqA
         ISbLQYdXm0L7RipdIn+xkzQ4yUgmQdSa9145FTfdmt/9VvdYXpOA/DaTTC5VHz4f8Y3d
         dcvYfKyqNcqRV50xXgdofGT3zJbbwMQCfDAEBM68KnXWfsXyn7wkwHGWjYUBRcMHH1Pp
         heQg==
X-Forwarded-Encrypted: i=1; AKwUvBzenOmAWGZi16HY9p2RjgVApNYlfJh1Tf3J5XyuKEVDT7oksz9kcY8GAwbAnWkmFaaaqjjv+JshsXEGJf0=@vger.kernel.org
X-Gm-Message-State: AFuF++lq0t9pJ+p9IVR/gMHZh4/bSnIH8iYjNOCjLbX4R9W/43TSf1+I
	4fT6J3HtKnyKXVvWEVw45VqDweb5e0tWL7bJDmEwZ6rfguDVJd/EHSEEnmAUwVJiuU1YFIh5g0z
	LbIK2YStFxClkxNI4eacOLLXPzojGXlSPQUhH0lMNkz15Hn+ic6iaGEAgx2yhdDrVSmo=
X-Gm-Gg: AYBFou3/L7olQ3gA+swzrJfZxrFfg8jwXHLAYZsyqzfhmsm2kYGFQxJqrQbfWO8+VXl
	JJXKYncMFrb2zZL1yYqz+dAaaKcNSh2w/ovLz0IDoCcIlbEz6o/k+ENyQmisOiLO7j+w0ogaFFn
	H5ZRZVBBnteYgyWm42hSgSMMLwk35AfaSBsZrWPCcChe9VIWLdDeLT3g9GNvfdWnEi+YgSANf1C
	yTLDigyMugMkBga7uPRuK/6bU2qRO/8DjwjU7wSHM/Gc094VlHLCrr0IKibdwR8jhAb+zJIgssx
	0B1wTvJJhikH+t5mylIyR7oGQ9brlWbQVnS3kU4hpcjnM02oCLxec9/g3Vr1YlnZb5TueJHUjtU
	LNyNbrBIKa3al0+CrKoRIlqAAqe8f5S0vU3O40tn2gEtVCy1lDQHNjKZ/SHiTWPJNF4o+
X-Received: by 2002:a05:622a:353:b0:533:2717:6221 with SMTP id d75a77b69052e-5357556fcdfmr84547041cf.31.1791448045052;
        Thu, 08 Oct 2026 01:27:25 -0700 (PDT)
X-Received: by 2002:a05:622a:353:b0:533:2717:6221 with SMTP id d75a77b69052e-5357556fcdfmr84542461cf.31.1791448034710;
        Thu, 08 Oct 2026 01:27:14 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:14 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:26:58 +0800
Subject: [PATCH v4 1/3] dt-bindings: media: Add qcom,x1p42100-camss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-purwa_camss-v4-1-bcf11bf2c650@oss.qualcomm.com>
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
In-Reply-To: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=9089;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UOrkDJYQJYd6kOzydkNyLHija7UYmYMjcdt3XAcLsl8=;
 b=9kjEl7pDBTbgt0mNLNwDRpuCQto20wqmxdlEqLKPb8Na/5A500aezbOC7NOauthysZc7T9/Z0
 mnnrogDarFRAR4KoecVo4K0GMVOZWM2Oiggwlqat5HxTgsUnxtoKVgY
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac753ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2DfPVCEIPBpRJJTYYFsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX9QoOQaYcp7MV
 IcYcwezwHH9idwRot3q62LTarvDt1hsvGK4hLcbTtP++uFc+vbkVPS52MHm/+AjS8pCnvOAahdz
 Bxdh/qlXbFA1lTypuJH0SYRZdjSJ/0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX2WLM7bUA9jl+
 1TGZtjCX5w47sLmtLRE2gK5BEINQ27EBAc1HIAFY97aZkMXNFESMLo3AwmPx8Jz5fxa5a9UqzxB
 25Q2ltkAAEzX5i0PQtE5jjiuxU9P02fzTx9BZgOlpSX9B9rJIrZU7Y8F5nfNPHAhV1DAzpmX2TZ
 7KQT4kx1PYppAjd1AOM92rIgHY503jhDN6QVtvU8y7r4C8FpWLY3fD7BCtTKNSgJYPYupJHDC+W
 DJkOmNiUYOQcZypwKNKzSAlRHEqayWf5gWmmR04rUFFg+aU8Q+u1AQGH1FfGA2hpKCuCGR1nDZb
 O7YM5XwiyXDyievF39jB7KIxJddWKiWPsJeJaSfzUARwFMZkouQ+03lhRiHia0WwKy6PRfbqWUZ
 RCSeRv08RaORkNqgCD5bf5IYjkvR8LmZwhAbxG35+9Pjh2fwI+4tBVy7naDWtQFb3HpK8aXoaUF
 I+FRrfAVkS+KxyaPmcw==
X-Proofpoint-ORIG-GUID: _jsGXn7YgAQXmAhIwrFZzwTg52Srk6jG
X-Proofpoint-GUID: _jsGXn7YgAQXmAhIwrFZzwTg52Srk6jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

Add bindings for the Camera Subsystem for X1P42100.

The X1P42100 platform provides:
- 2 x CSIPHY
- 3 x TPG
- 3 x CSID
- 2 x CSID Lite
- 1 x IFE
- 2 x IFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c5ea7a7d9fe5025bb15cbddd85b915d136083447
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
@@ -0,0 +1,263 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1p42100-camss
+
+  reg:
+    maxItems: 12
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 14
+
+  clock-names:
+    items:
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected read
+      - description: S1 HLOS IFE and IFE_LITE non-protected write
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports, one per CSID. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[01]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb7000 {
+            compatible = "qcom,x1p42100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0acc7000 0 0x1000>,
+                  <0 0x0accb000 0 0x1000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

