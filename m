Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328760;
	b=MuCOWiwY5Tpv580nmCTGaJcNIrS/AM5e89CwggN5eZsRwLQu4SfqT8qLrDIoj0q41Pfu
	 AwpP6WnKonsA2HTNzpTD9fCHdsy5RVC6Mf5IYsOWa+WWBUgeKaz+8uLqQFQ+oz7XNb9GS
	 IOW5jiyBr/RT6Auar68xXs0gSvSTniMNqalnc2G3zIF0fkCffwCDDWQ6XCXBLDXwRCb3D
	 owiGCQ2xvEf5pcp2//kRVUpJ0xW50GFxavtOFwwW+c30272mZ3WsIeTiLUXiIjPcOeJ5l
	 nMONfhehA9VC7zOaws8GzOdQd1xL7GiJC+FonKFfhVMOPh7qJ7MlHD5QmRVilcxe1xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
	b=CK1AcTFg8pthdYxXAFbyJWjWbB4sK1z8mZ5mrJf691pK9Qrj6O2YkBJVM3pV0/4kzvSm
	 rR4AJyRYsURT7rR78IJEeb87IdsutbiyBOWPkOveWhrY1wou3Qy3e97wyJZCYBp2PZksC
	 3xAMT8ZQQ2E3BsTK1CqsORfI7D5h9JFURe3I0DQJM0JJGGFhG4v4dUnVc7bkjINw7+Eod
	 eo/qWL2Jpe7YZR5CH/3a/otpTLPS2ij5mHc/scLoS7ndPuirZQgcneOfsWYRY3hgemb5f
	 WOVuubIOX27N29w14AJ8pxxiVPPaPPoXIdjwwcHqqqYexubqrahz5clTiDDccIkvdCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7956606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7956606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF07fI3376589
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OTjfUEF9zyB
	1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=; b=LdG1wONloFJ3yDPFOfHzrDhmiPP
	x0mOVAulupDhxkhMim1C2ueTSZbASbj/7Z3AA3U/yBMK3iXJexUVhDE2PBEM/YUg
	32lKZzziSPzUQldzoy0lwtdjkSbdgFH4sdKzVDZIwiyIqYuyob3uGJbGaMns5iyQ
	lzyhScHJJrOPB6ahoE9rXIMwJfULZbXT5dMqd5YtfjognIA4f/vCUqznq4pjKdMm
	vwNHlKKXJsnG7x91hL8TzZWSqV5rCwwWiAVnVBOCczH/HJDWyCp6AZTgXOPCsyg3
	fmdaM8SVEg+DYr7ViUgTVfCPil8AyaMAfVlQetFZ8vw97KceSNK6KgEfMwA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84a7bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso423075137.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328755; x=1794933555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=bDOzzW3YqodKZb/51Nn8mDdDpIP0CRjEYSKscVJZ/HrnPlMWqSfzRxGgBP0beIDHki
         ZmV79PNBx6twmC15MsuX54brrVBA/3c/mdlN2TZnjK9AQaf8vSCc6rzt2ldxs9UiJjjv
         9a0d3GUZ/ciUutk/7tJZyUEK5LLaHTTDCa72MTBKUp1ZGOVeKUOTPyNJWFSYDjJLSh3u
         tdBVjbBfkhbt6A7Qg7RUhYpjru4YTZZJ8vivZmzadf5sSjBQVjaQRS8uWHCtJH9JtAHk
         idQcRuSqla2nhiQVHOGGOB6lhRKCvPb+r544zXG8sDUA4GUD+EQ0bj/+rj9GF1274vAp
         65Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328755; x=1794933555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=j4orzbhSINVjXPPPjKXvh7UyTNL21MSL90km6usOLAIlAXtqs9OSv0vbb8J3jf74Oe
         IwJ9qSlqBkYOPnNEGbv4oz7pwwonJqnVXFDGra5R8YURv7atO7x/x0s8uAWlRAAhzBll
         DhwHjouo4wCgZimTc7yKbnuDdkf69dsipR5CUOpeIhzT0+o/UutCQUFpyMANSxKrgiOQ
         Y5rnGUrbFX9ccS4NZhMk/VzDoL8JRdmKLmqmk8wu47H459OBBQGFDhG8dOKUwd4afvMb
         TQzNlbfgwMw55tIQ2ZA2ykjNZgMMUO9u3hLHCMptgR5OrRc4mbGpY7wJMoA7K/Bc/HeG
         0atw==
X-Forwarded-Encrypted: i=1; AL+hErGIcavZ/lPdlJTvyzByEFMy+BbmNtZXKC6Lsmftchakwz0rcs0JCGpBG0Z9u4VyvgPMVZUHcR6D6BlfDa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z82MiZidIrrXXZ0MZTwqCgbMwb6ivT6SjPS4+TRI6qvvWbTD4E0
	wkMFs7q1v+Zv0OQ1HKbgUH8hPx9wmUaySDanBj6LybZIaW7MnA5UmP0Mvt/akxZOt3LiuTI0o9z
	VXjgaxTii5jvXrm07B56ag5CXU7d1nLMZBWVc6zcSZKYiyMsY01Z7k7LhywjqJJykCOc=
X-Gm-Gg: AYBFou32Qqr44pV6WVQB0kGtOgf6Ok5hOf/R4C03s709CNXbMmReKbDCeFbRM2J4mrt
	Mty5Ms7sCI6IZt8bB3Z1ohnzgOpCcT1MLqbShP3Yeaz6QRe10FAjXMO+7w06tIAqCEsEa5p+mB4
	DgvMl3xbH3tvkEGjJk9+Li+XP8EeObfKqIf7kZAyfyhsgC18DxPLEe+i14WJwfdLAmkdS8Xy2uh
	3cToEV2+HvzJLUBFEBUXDUR8/Ax+XaGwKHxEETb7aUr+xTt5b4VLZxVotAUcg2bI8ETbpYpW+mw
	gGOEO/ssuUPftkK3qFC5mK4ylSogTtYBtzeI7T7JY3bpEpL72aleZU5E/GQ3wIEupRwr4iI6OIA
	lYT88D5DSqlFs4/HKZuTdJT5dVKWcQGDTyBDw7u849PPcaXrAyORI3YNnu29wEtQtNSd2PoKeqw
	==
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202061137.0.1794328755020;
        Tue, 10 Nov 2026 08:39:15 -0800 (PST)
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202039137.0.1794328754273;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:13 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 18:39:02 +0200
Message-Id: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX18PKAbACb11i
 XVZpRXdLTEEsqaR7myJP3aKr9p2+gMRfgT5Mi6oxltJZjQwVI1IPfXWnQBWo7UXq+iyn4QNV2sz
 4j3xzlXwLXPCaB/sRH19rWQrDNnGxdkNI0sOxMVU60OxOV/cbhlBb/mXoJ4P3cpO6tbAQ+1+gsI
 anw3Itxl3Z8ECDaV/2gr3Y/DOSKsGgTLIHGkzxN/yDZG0YFMgTxMs+RJGvHuLziiqj8dRJyM2lH
 dAZIkhDNK3B9JJvmIkM4nFNXh2dM6CkIaaGzqtiaJZEnkV3G5S6MfHLsuTeXX28JZkf94iavAOT
 4YaGp6S5mprUz++Xomspt65PHjYqNM+OYiXqPo9Rb3o/+ireyCQLv8dwt700Lehz02ug75ojz1I
 KhaG4KM1NRq/kyB6c7TKBaEt7s0cPAuOXucV/x04MH5T91TVQBDQXRyyqjAa7P04SOsaIBt8OJw
 zJqdogbrZWGiOuRVtXw==
X-Proofpoint-GUID: _VkIAMqZm3_7YKLdMa53NtGoSq-WyDTC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXydK56nWdPEV7
 yf6jXLHWoumw7dB3iIejC+B8sEO4iTU144bV3bdSDtX4uLU5QnIWvnjs2EHxQEGCtB2BXA8fVKs
 YfJYKkI91ilTk0wh/MLcaLH3ZTNfJxM=
X-Proofpoint-ORIG-GUID: _VkIAMqZm3_7YKLdMa53NtGoSq-WyDTC
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af348b6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=ODZdjJIeia2B_SHc_B0f:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..112580f3df10b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-jpeg-enc
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: camnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - operating-points-v2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: MX power domain
+            - description: MMCX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: mx
+            - const: mmcx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "titan_top", "mx", "mmcx";
+
+        clocks = <&camcc CAM_CC_JPEG_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+        clock-names = "core",
+                      "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi";
+
+        interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names = "camnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-peak-kBps = <262560>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-peak-kBps = <524760>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-peak-kBps = <978600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <480000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };
-- 
2.34.1

