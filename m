Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768190;
	b=uZ0BwqcUKlKQ9hcGuGXwzvQcyPINfTXyEXBWPblPGD6dEVN5CxoU6X+UUWStY+mv1lpt
	 wQI+NH2jBNluVTnZb82dtGuBLlihHxBHhNlAVm7GKqIKxP/lRWn/ks61CgzH3pLi7KnJ4
	 u1b35A7NWdUwWZrOpywiz2LcscENWlw4gTiLb7+ATSlTeyvUd49ER1tZC8ASBgUp9TwUw
	 qROhuf+xz5CsWc/Nd2/gFlLsdOEHx/HqmPXLmcAtjY9LPEhke//VJVemzKJnFHPKo5zZq
	 fmuP72ANC5ICiUPie1Qgtri9/6mPgGMDeyF23G+KeKRZ4qMnH8Zn2akk/jmGXfJPaeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=gGVD3aKMtVzj/IsH/nVBXkX4Fmrd+PIeZEzxAquFqbPICUTveZHs0WAhITdLlYRZLvKa
	 yYj6Y0RihgiQuOsiFTEI8LM5Z/S3hCVzm4OP6CHbDx2ZWanq4xvwd6Rp8ueFP/1wDqJvS
	 8YgbihD4z96VImrozxpuZveds3xvYYNdWb84z+6G/xQfbYfST8bsUweCkpVOOHXzPG8ri
	 xmJGkwBKjXZY0zLSRwyy6Kvzs+goi+psqAmx0JX/97l/UOutdRGbUzVoWlbWFqWaYwWwr
	 e3T8TVKXMZopbpozxrbCXDICgD0byICldXvdXQs+zQSzzOYZP/CcvOYMsfZ2XOO7Mog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZGBaYEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GrsqeFx5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652F606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3652F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZGBaYEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GrsqeFx5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6omK2676495
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=NZGBaYEIXE0N1yD1
	D2c0Z9sI5DPzXOPxazuibbY3cewSAgRt3Z2XcH8HuLNR9IWzayhD3kYeY1PMNk7x
	rn7G0PMp+Jk2FIUpHSZIx1V2GdfleFpEoRisY7M3Jess6mFtjzA+OVC60ulJ1qMK
	T2mHfIZZNu+Vt+TB80uaW4FZ90aLZZwryB11ZIqUx658pbmKjWSYMrB51pImh9CH
	FiP6ZTqorHJHE4rsVHJX7iDJxhADRvnQB6m7A3bZAlnMu8LPZe0pwmiZJcCUgA9J
	E+OB6rv93zZ0dMyEhTJirgiN4+FOXK2yEmyFV/VIyNnQspqAwArp4VlG71p/MKqw
	//t9Kg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvp00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso124799785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768179; x=1793372979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=GrsqeFx5407mP5oVwzwCP3NTiKiCPRit/1JLvOoqxVnzyhjEBSkaSJ1cxwVhhAqvqb
         dM/oaZsF1NkBBl8KbRs0SpbCE1WVg2s86c5NI7iqT15h625/SdSjn7P6Qr/uFGj5Jia7
         IvJmnjsERilcvT8rBVvUw8f21H2FaXnS7V4UhijcWWkVCt4EKPoYkSbhmMOH2ZKnjk0Q
         QoEMHrxpyBrt6DxFpuhwN541fA/9hChdwdxLHrKMqy+eyQiyLcHP4LaOxDd8Ff9JqoX+
         8sR7avx57RIZGDoY6pm4vogycx5WbgBI6TtvcMvzdXc5yeIqSnsogFK0Gxt/qONfOIKQ
         YMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768179; x=1793372979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=NkX29+BxTrnjPMSQ7Vl6hgXeEACKeUTOOibficicqxYkLYJ+694UOQHCXmT8KLfeJO
         6kb0wOLBSn65TJPFOgmZ99WRH54OxBuYfZiIqEPdfs1zqwzsqEf5CHU586JnxPk40ZwO
         JXKmysh3LzCFaqPp9nUTj5BFxiTJP5bFgPl0X+ZGwvA3249LNt4E3CgCagMx6cfme8gV
         WhxyFqyEF9Y7LSg49mX6m9L8fTPaNQc0QkEgLQdgEWw+sRcHhrLB0cy8jyvCl8NfXq1q
         3bojWTPKDQknyhYwB2LHEZfNJuFJHVz3oDVSl80a8KppcGTUKMf95UVrVvTf9vfmIjjY
         /lcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp8k5A4MZgFQHfG0l9onosiPIYGDDcdhTiSYnRm3UuEjt295eWsM8Ytz4XaVyRdhi1TCmHjhdeeUe5M34=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNHKf5zsWDswvodYf0tV98NTbQxFwPxHxkrLBYzZqAKbimaLrK
	scDi5rL0aCMMio8BzoxW1Rc2k4OImdokDWskaSjYtByl+6WcKIfBr16N76i+JfvMtS2hLy1dL6i
	GKlbHNIF//ko7lIuQ36Mn+OdM3pEAsq4s0/8bA5oeJV1J8RmZpyfeXVnMYZn1UbYXlmI=
X-Gm-Gg: AYBFou0cjPGJM9k7sdxg/BcljwQQAeQ4NpzaBsAcbZTBJVOdaFCIioITxO3RIBt7lZa
	cWMGd7dXbeSntm4UQ84LF5WwMelCCDJSb8jxRNgEUcNOCzOblMoEv0tvLmyjDMu2nDQQAHyk7mQ
	9tiJ9qbI84TJOW5G1kt5CF3tBH5cEXmLfHWx/ledZdiHXfStWQU81VWjCcgpU6JDJWI+yqHm+ws
	XneRaEbfO43wW3yzalioWO3ptO0tD3ns7ydn0H2+KgiUeldWw2GVYNS80+Z+K+17Jdyjs0PeXCW
	h7Lzkn3TXt9Vv+x8DIqwX20LW+BW84v1D559Buk9dQCUTEPV8nB4BkNW7G/MK5s03iPFXSb9Z8I
	omt47wGXJOhnW8QOviSVsjfkd93B+gg6i+DoY1nLy4ixfDY7/8IVUG2LXp662yr/HSG2YOIdF33
	gDGZ+q0J2jlswOILZ7ZUr8StPUqeYJzFeSHsL1QuD454oIXlN9ckc=
X-Received: by 2002:a05:620a:4712:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f6f9a2222mr463353185a.50.1792768178256;
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f6f9a2222mr463341585a.50.1792768177528;
        Fri, 23 Oct 2026 08:09:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:13 +0200
Subject: [PATCH v11 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261023-camss-isp-ope-v11-2-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzIA4aSsdVJ8G
 VdajxR8Nz4ZCBe7M7VGZOJZ3RRudv87TZ6PExlwojmIx7Kt3C3HQnpBFnyV/MHEHr2m1gs2jeYE
 1Zsjz8TTTP/KzvTAnP6cs7NRESOS6UA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX+UidOYwk9jqR
 CehsYdcw2QqMr14OT921ZodY0SdurjOFQwCveMeu79uTECllozw2xZqONirkwfIS9H1qi3TwIX+
 LmF1LwE+X0k4v/FFQjki4WwlDLo3+K+i4uA0hTYMRo101eNqhBv2MixuWNmQbYwn4eBCht/L/08
 wOX9cKADSKIWgzOnlqF5gb6Xivo0SUi9zWjEZQkraOUIg8ZOO2grMrMEiO4hYXg6GPtx2HnwAAR
 xMm+6VMmiggQ0faQSAGbpJ5TP+A4rvZeZ0cx0yf7ihBzLw4DKzkA1vTFuvr8Gen/s8WAHFDyxMb
 8w79g75/MtXQa8JPvFSeQcF75ZrN/ZWu83cjcFZkq1TI6Z5CBCs9y+5a2najDyI5OLgLOpLuJgn
 EywKunviuaF/GZZisuloqnY+dgS6dPvyOrXdd9TFdiYoEw8jg6HmimsMHZKAexGYTQZNI0sjvNo
 pFdyZ5qFnWdi0t8I2Jw==
X-Proofpoint-GUID: yLubySWE4sofXKlok6m-9tkOcpckCRit
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb78b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: yLubySWE4sofXKlok6m-9tkOcpckCRit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

