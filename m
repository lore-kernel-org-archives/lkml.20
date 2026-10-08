Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933B3C4553
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442063; cv=none; b=bWDner8E/D81qNOsZAI32yysX66D3Y3GgddwmQFk+yRPNa0mFLLEAWemTqvcItSoF+ohMmg6iPpmd6MSvkV5RzBXtqhqbZArpzRvPkdRZj4W+YqnXValHCiP/6IT5QOmBoH75qhKel/SuhjBBDt+orlHVxzgMRRtYGl0kSEb3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442063; c=relaxed/simple;
	bh=E+esblg9glXlDI5Gc75GxNxdOWu8vG3UzOZCx/Uj7KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIFJDLZr8X6uBoCMYww9pHXQrvAok0W6Ba3EpCtTUrad3Hvhj9J8B1ROPseV+8WfN1W0QS7qzHizqvb1FZul6TO+pbm8Z2LhJj42kToKu0WU5yy89dJmtuNJ3pfX5dMMeUbAnkGk/hyB6EwJ3R/JnlhNTj5RnmJnPYYNjq/XCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrF1ZJ6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GivAKPv6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrF1ZJ6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GivAKPv6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BWCF1157678
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=; b=NrF1ZJ6iZNzELCe+
	n3pL0uNC7TTGnVOz3igxCW7SFdPuCn8oSMRtiQVq4biNTBfVfWIuQB9OoErnqsVR
	Z/mKHuc24eAUZLaVoY+FGC2kaDGxHNiuQ4OCpG6SD9eueKBimA+KRXH5NFtuCSvX
	Sh3ItMO7hlu/5bAdlGwsDTvTmjrfvxBLUbaXg/QxX6OTjOOKaVY5w51yJiqnFKfb
	C2fvXRq1DfV458pHcsMh/BMeaIjdjptKmZ/WAgvoyE/Eh4XN43OGZaLD4qJsKd34
	xhMn3650qNKqLqwxs+oeLGUp/ppUWThJgK3nV/IzK5h5b7aAOlB4EnDUf6SbElee
	Ly5qNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51hfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:47:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso4172945a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442061; x=1792046861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=;
        b=GivAKPv6SB2XukdRhPMYNFEZAVN9Nfurz93Syk1IDJHaLROn7nlLkqu5UauC87/2gp
         Wqk4dbqKujP9Wic9hWuS+rJlht3D2Gxc+BqopFsgOejZNlc5jSEJzrtwOI/R763Ozpsp
         jO6z/6CRTfbat/SAc13Ed3TkrwgdJINjS+g1e4Dm3YXWTWd+R+G2aw5+/1zYigOPj3Ig
         69MdADwBwAlNvnMqVKOKbXU+0DxWLJkfNfrQLrcJsFur0SF6XfmBkvkie/IKCpCxVUMW
         aVIZ4g+q/wuyNnRlSQzY+SmB5e147hNLUdlhq0uQsuVkYchIDCDnY3Z0i/Jt5OIwX/Zc
         wlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442061; x=1792046861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=;
        b=Xcv7ikk10HXnq5wXoXfejzJwciyAiVTP2YuKUZgsWIXk0NS74Q/R8ZX0CcUg7rPqlX
         X2NfvONHr67zDE2SDl1m80up6+YkTLr5N6aGpzVzplElmbzJLUTHWqHAXYJ2we35HhCz
         eZExcSI7KigXcoynDBCZrISd50CtV6eOCYS9lQ16M8HHNExKhKLR4aQUMhPTOzQun40c
         T3bY0DxEv8OoU5SiKaq4tJvyhp0Nmtm7uQwMUu9FaONnpC7m7ey+4HqYGbeRUdEX46/y
         QB1g2qeYWfx5BVeJLN9CdopzLq4LOd0f1aPdHWtz0sueC8O0BFtGIV/RMmddDCDFxyJS
         LIfA==
X-Forwarded-Encrypted: i=1; AKwUvBz2PUL3xYJU9U9rFlZMWmeMUw7T4Qpubsti10S3/7LQJFfjRZm6yNxD+s0mxeKOd/H8uJIJvoSPTlEgutY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAp++NhvzFNK2bXFLNQcm9r5v1vwFw73C3InM/eZ484RB3cBfV
	3gxPuvMfEBxcHvHZihYVSftGjDAMimZ5Yb/TWg0yCIeYDpuk0nJLw0xSWA8ye+S9cQMFoJP+40E
	wSvlA/V/miymml4XiU5xQW31CL0jtT202/44Mhvl2jH42Mzr5nBYjC/2plPZzgdDghs0=
X-Gm-Gg: AYBFou0U4KiHpIRCshrPbE3emgdl4ZiODtYxD2sOTNnw4+RGyK0dz0mB54bBZPjD8OV
	Q++W6fj7jtdQBBTe5e/LfSDaHMqZJsa5bWIoKxzIiqAlk+Qpo2V2WqLhhJenMOoeo7ssW+VPm8O
	pKmI+BWR9egB02R5bH/LJK8DvKWT7+bYXsDDY51JNnaEB1c3h8PUDQ9WYHCLY0orsDjosoUa1WZ
	sXxg5i5roMJh2B2oU1D8rgF+YVv4pHI7BCpUC0+CExjVtDpSNKZ7eoHt7H3b1mBO7SpcZXO226n
	5qsJCRHPd5YLQ6Eue7RLYYpLJrPPV5ZGgQGunQw9sCwhucrvrJb+yuOcH8E4bekbMmD2de+BBEO
	5DcrMTa5+/Ev2hJIH5AuwNVdoG9PTjCVF2TRQKvshvGhLnm5yJnabMf8=
X-Received: by 2002:a17:90b:2804:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a8a19270c5mr3450676a91.21.1791442060741;
        Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a8a19270c5mr3450658a91.21.1791442060236;
        Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:39 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:12 +0800
Subject: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442022; l=7058;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=VRx8aZC4+R/lliq1ecNgi7KxlRqXWCW+Hr/b1wE9+y4=;
 b=Mp0GCgrijdwOmFrCyPUiLdPtAuQDzMPXaDHW9ovkFNm/ztl2jH1wiOts3kOy//givHCEej4ow
 MjqX6aZEUHbDubSsRQvpbaHHPZ4REz9iB7HhWVRY/7qezHXcBgEaU4w
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 4FJECUcmPULrCfnWkf7YgFIukL0Ml04A
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73c8d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXzIVu9mqkjTma
 M+0IDzmzUSqGBRDQek1vp+o3+Jw+NEmq7/N9BYLDP90e9LZnk6109clI2ePnRJiGMrMYVLbWV4e
 H6GiOGJPkkaTvuI247dbIiz7dwuUNqc=
X-Proofpoint-GUID: 4FJECUcmPULrCfnWkf7YgFIukL0Ml04A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX8jRGrWqcTuI7
 uMLndAKAzaOMaTZaUXMPPcdIljA0KF0muekaXuHl7RSyDcFMps89BsRpgg5hlD9UChkDGbDvHUF
 90f2EeAOeXpDNCxeEu6pnMhMVWiLjv1umPj6WwALGFhOZHmMSjkZdybjUQPeVuGmGRoNRh+RH3P
 tL5yn0yoi9gAGykxk/NxPeyXV60t8W8Zm7S8985We8BpWwq7HynNbFsRKrOe4hxtA30dOhre2TS
 7EMKN/ZbyWl2KrW8NzXkkvwlyANdch8I9oGYRs3fR3J9eBUr3y8q69dSysQc56nVIuefVF+IyTB
 NanhyDFhXjA5SqFY+FfQVdcaC1KeLqRuOK1HuIgtKfYLCZTLolFiZYhaz7Ex5WF+lGS8su3RWFL
 ue9CQ3klAMgg7h7y7UqzT68dcb2GlTg5/ABqs4Bu6CuDAhTtfNvhuQ/2M7NJ77sMm11waBB6mGB
 E3Cn7HGCmTlvCYmjV2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller, cache controller,
or IOMMU. However, it's certainly possible a design does not have that
association or has a mixture of both, so the binding illustrates how we can
support that with RIS child nodes.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema field
  order, type constraints and yamllint spacing; fix example reg addresses,
  add arm,mpam-device phandle and remove TODO comment ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..3c7b13a23ff2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    oneOf:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: error (optional)
+      - description: overflow (optional, only for monitoring)
+
+  interrupt-names:
+    oneOf:
+      - items:
+          - enum: [error, overflow]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NUMA node identifier for the memory resource this MSC controls.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^ris@[0-9a-f]+$':
+    type: object
+    additionalProperties: false
+    description:
+      RIS nodes for each resource instance in an MSC. These nodes are required
+      for each resource instance implementing known MPAM controls
+
+    properties:
+      compatible:
+        enum:
+          - arm,mpam-cache
+          # Memory bandwidth
+          - arm,mpam-memory
+
+      reg:
+        minimum: 0
+        maximum: 0xf
+
+      cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
+          parent device's affinity is used.
+
+      arm,mpam-device:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with
+          different devices in which case 'arm,mpam-device' should be used.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupts: [interrupt-names]
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x10000 0x2000>;
+            interrupts = <1>, <2>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    mem: memory-controller@20000 {
+        compatible = "foo,a-memory-controller";
+        reg = <0x20000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        msc@21000 {
+            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+            reg = <0x21000 0x1000>;
+            interrupts = <3>;
+            interrupt-names = "error";
+            arm,not-ready-us = <1>;
+            numa-node-id = <1>;
+        };
+    };
+
+    iommu@40000 {
+        reg = <0x40000 0x1000>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@41000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x41000 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <2>;
+                arm,mpam-device = <&L3>;
+            };
+        };
+    };
+
+    msc@80000 {
+        compatible = "foo,a-standalone-msc";
+        reg = <0x80000 0x1000>;
+
+        clocks = <&clks 123>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x10000 0x2000>;
+            interrupts = <7>;
+            interrupt-names = "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@0 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                arm,mpam-device = <&L2_0>;
+            };
+
+            ris@1 {
+                compatible = "arm,mpam-memory";
+                reg = <1>;
+                arm,mpam-device = <&mem>;
+            };
+        };
+    };
+
+...

-- 
2.34.1

