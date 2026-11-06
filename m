Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953530;
	b=gaNBcuXtFwmKDjFfGWMdAD7Er/ME3ZGTJxpUbpSYHjFrgVRHa8WA+JImESsQonHoVvcb
	 wDXkP5bma00lgLM8KUVDEMCKqyVnVWiKlCB0amY+gsSCkQeXJSI8wCl95bDAdRckUvDoc
	 rtwpu1OUmpPHA5bpNcDYNs19Te8UfvcVtRNb3oZTU6czKe3ANfLS2AHXBFW8cuzRybub/
	 qLv0rHMKBqJdLvMBgleEToAd+BYqMuxIAuYEsfqn+ty1roCgrXGUOwvtBG6FMRZJX0mOd
	 6EO9DghKTWtVF7uPczQhCEZE4as6x4jhm46UJV7C/idrpSYWc5PgNr/0hHBYB0oZ4VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
	b=ts9KtEPGWsfKLs/7DcnU9PYR1ExAnRosw/i70Ch8Q8rwjTURiXGQDrHUYgsIWVAOAFts
	 ALxlfSNfyd7d8UJLTY1IV1Bnko956NJVUvi38rPUu/fvixH9h+1u/e5HEFbrsYxn/QJHU
	 +d4b9DTJJPjCD2J2aKfaNVCxBToiCg6Re6fZjVQi4lRd5gkgT7sFGE9ilFlyHi7+FF2h5
	 ttDKB+N3W1vODCZ0aY91sljuxyzcU88jf1b52texQBL4DAFgXmvQf/zBOZIBf4loV7fVk
	 E51jQPBxnKtO87oFuclW8a1v5MJp+Hoa4lZjjdEfOChAMwvoJYVrEbjOwkR7axs5bcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SnZnrjcJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9A1NRFN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30729606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30729606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SnZnrjcJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H9A1NRFN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RR9e3907032
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DGUYjHTjpo+
	IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=; b=SnZnrjcJH7gyC98opyIQcuwbE1U
	2CqP1qBUXXbPG+cOUi+67jiswCMjSFDKSyM6p134aUUd8hdQ06lIx6vu+e2370CJ
	sHCuDcPXEJFw7xQYmgJYMCuDcezHhj+ksHHCBttIgJjvxDXN+K/O/fev4Q5VUItR
	YzzVnweXdK/GpLQZiaYlYyCYC5/lCpCFaL4NidksoGCIp+1i/1iLBoLhrs1v7pyC
	Et2S5pUZxVaNUTp3GzzQ/Focl+boHzF3MgLnA6b/iTFLEIHblSHUC+0mEb2+vc8D
	C3WbTql67C1TQmlv3oZWbeBFqEH5Q9Cb+IkEr2HRHqoQC3ucRX01Kt3aXDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasty0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so78876085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953528; x=1794558328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
        b=H9A1NRFNsWWmhVRZLJNS+r35fSR1kK4ugsL7Av3iTGpcplGwXa4kdOn01rRPixSqry
         DhHt1v1bJdLQZP0rdS8xyRYniio9DM3cd8ZqTbC+4t3QzlHckmOZ4aX8LhxagnRamVpq
         fkGhP5VKJDGMMszRGRmm1azanQQvJ6v9yejxsuMc+BCcLZduiO2rhKBNPoCT9aKSx5is
         jnj8IGUVzFbKy9Awu6qrhw9oOcGVJdqVV8ft9p5ZtB+lnrLc2WJQZCoMg6IFQDbIXF2Z
         OoR3IHLqJ3A9VWq1Ua+WlPFIbr3jwxpozRaF0xmO5mc3ES3tRofxR9YyGfjJP6BapK/G
         7trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953528; x=1794558328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGUYjHTjpo+IWPuzXYUg1pKNIujYxjg18MSLVzvlJcU=;
        b=SHu7VJoBKOSl7fH+DBt/1bLQ3WB5zZHSYZFrGSt3iuSZNqe266NpgEA/+okQIEFrbx
         53uiy9ejIRZSDoyxL8dtAdqZneHvGYj6q/DdYjNJI/bb38FkApcn8uU9TzrrHrnGWzoq
         snbvS1+SMDJ8Grxv+XdhozGk7tngDmpRSzBUAMdOUagwxQRfMjmX6h4OJvaW3UDFblDd
         bQF6HJQjgV12NVwp7b21u/M+oxfp0A9reZGDs1xOSGi4IxAmge3N/fAHy2QQsGkJrQfI
         Ax8FWfrt9h6Nq/W4NMUalCataETCNNWeOoUaa2d1EH6ymEAm8RaKKwbZQ7v/5K06lX9n
         TTww==
X-Forwarded-Encrypted: i=1; AKwUvBxB6zBEu5ADZpgMfJeMmXggXUSHv6y5KbdmPqepH2hFGCpCqzWf9SYqGVKrIV4eAf+8ByaFYIsqSHCzFw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84yVeeRFXWc6SbdNwaZ1yG3vA0AUbVQDT0UrH/h4gLyQHkgy6C
	mn3ZTH6MiKDlxiZC4W6uc5XoLcdUI/rlGiA42/p8Gnc7Yj22OqG3gK6sW3iQeH40+2tyYesM8SW
	oRwPvHBmn89dxg6buOL/Z0jwZpPahzO7e+PICw+qC+L83RxW+jSdlDLw83T6g4zZPbVM=
X-Gm-Gg: AYBFou2XxfrE+GCLCkxf3MFyBgI0YiQD8iY0AD8dMVVOfMApJmXwr6re+uSFGezTEgH
	ki3IlyFTtd6jNXEZSgGaWKviR5hSIqByusTKZuW+tpcCwqpbTBnl4Amn6s4nXAGUreEHFcka/Yh
	XlMzgtldKYlYGD7JCJTWwKCbsuIvgQU4BDNJ2gRtwwBlW8IlyLC8k0AHdhBNCpty4SoJvd7zZ0F
	8WiAPtJwcSxcndR2/oKvpTwfoextnlO7HCVvsB4NqVzvIaUrtdY+NN7CtrEBpSenbCQ4LaQBoke
	4gYEoGYRC88pDYtFTTEfD68oRd2Z/ZrhkZORsx89gH+/FAO2qQiLKvgG9GZYUvaNycX/V038uys
	jZbVCJfWY8RUzAg5HhwRqE7bWbG1IdCp6EhMpR1hMKxMhSD46Fwv9duuY+EYLcZ2JroSLbQgoJQ
	==
X-Received: by 2002:a05:620a:800a:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-945f3537d9fmr242643285a.66.1793953528337;
        Fri, 06 Nov 2026 00:25:28 -0800 (PST)
X-Received: by 2002:a05:620a:800a:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-945f3537d9fmr242641685a.66.1793953527874;
        Fri, 06 Nov 2026 00:25:27 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:27 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Fri,  6 Nov 2026 10:25:15 +0200
Message-Id: <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX1RlmyKioqElX
 QwCEpt+zwjnT9eKxpnpETaVTZla3olymVpRerGcfHwYTNmL28eq7lp19HkeRoPOdm67+TvjT2XW
 jJ4FN+MEQkAsYrhGLx2Y5DCtDHrRQDvFWMhKk+NUbJxyShbH4ExjOE26HcYdEk2OfTPXFzC9oRW
 K/UIM5QjsLg9p/QbNgmpG8TMCUHndrAkpzIVGF0hh7SwyTdQcQCt4U6Ok1EjK/Bz9B+7eXI4IeG
 Fn6ugokEMy8koeusBQcRMroWVbXD2nMo/U/mb4RJ+WsUykQjFLUybeMhP6g3/twPcK3dQXl1r0S
 QYNEn/B8PV9DBECnMbSuoGDVM6uwCxwnoUPpAPin043FyYmb72ebW0RfaaKbsRdaFlPOegAlDJ3
 DYaJVqNrankZGwPWl8NOwoWye5ZZhM/8/Q6XB03SAg0NZZr74zZQ/E57coiHfQGFzWjZ41Rz3Qq
 WgnZMC2c5cPCRuMNIjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXyqTvXE54OEIC
 Z4TyanNf6ybkjo3sXMPOWYuM8nCk613kPkhuEMiqXP8bnz5saev850dj7y9wotlblnHwt7jSaIw
 7KQir331VGCyKUd2HSB72Jq6b7XArIs=
X-Proofpoint-GUID: Hf9YqU5lwzkiNid0HDgfV24LDpYbGA3i
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed8ef9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=oIy0nRtpyz8z5AVKuhcA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Hf9YqU5lwzkiNid0HDgfV24LDpYbGA3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..86b17575600c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,193 @@
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
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+      - const: camnoc_axi_src
+      - const: core
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
+        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi",
+                      "camnoc_axi_src",
+                      "core";
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

