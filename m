Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D84E36F5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779953; cv=none; b=THZ6+9EdbNnZPNI+bbMoQjm+Ifchvi0WAMpvQxlCkLoa59CQTmRuiUt4J8SZfoCSNrnpqB3R2DrZqBWcSusB7r1WOa7nNv8LBbfhtcQpLj78hZ3QCY1A93uvXV3EUKq/CpSR16J/Q2eMHnb7STb/7qGeyKyX3cX4oIQSpMftY1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779953; c=relaxed/simple;
	bh=AZzAXwiHHu9XZEBWoWxjc+qlmuW/9zpL5mYJCWh3B90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HmM/Zcm6X17OuHFz/nlmM7DyVmMYy7ZS/DkkBfPv3N8/31Z1pvST1/KwJIK1kMIKf3k9yzPymKVQDsLvPF/cxh2oeB805nNinRKRuosEO8qbzsDxIViukGrU1Awn67a/z1d+GEKMpPFLHf7kZ7EQfGDIo/IRdm5qErJUury1tTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIXx5H4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPHfbWjS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIXx5H4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPHfbWjS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE053l3942413
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5MQzMnZzp1O
	3Wb7yPZlYEZEBfKkuYTfPW2YrtjSZsDs=; b=gIXx5H4nh3APUmWzu3OzN2slN4F
	77R6IZACbUdAfF4Ycfz6vlQcJAzP+ScK9V+egwmyfaepZa2TYtEMNsKwdOarI7vO
	I+JcUpJnlX/N8MKLkvovgH3P0s9+xNyIrHmP45M/1GIw0XDOpby4Rv2kGsuwweYc
	uvB4irExVRAWwyj2VTCI7i/gBd1wdf0PU/5dtOIFWqUPKHb2gUaTvs6Sxf5KspdZ
	krFWPyIF/GxDjejYHmzTQxVvZpi/irLj3NRsHnTJRxnp6B6QZ13IHcHSUjcTWW/Y
	EHz9Wyw6rHfx3FhVowCVZscOJISQhugEhALJIXyg33bGSDDpIASW927vWtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk96v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34afa104860so2738044eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779941; x=1791384741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MQzMnZzp1O3Wb7yPZlYEZEBfKkuYTfPW2YrtjSZsDs=;
        b=bPHfbWjSEo4+pnOusnZW2mNxos2i1tifePa2RYOtEhD5B7nJle7LflwBS36sZ2sPrs
         rnHU5elv6KHh1X+cuwqERw78nRCVn1wgoLnRgyzwEzXXmICaQzw9zuq7CV24Rx4e+URa
         TPWUW7S4nbOFvFrk6cbJZsRzdnqwQLA6PRzzmFjwCZ2a22b0xxf1AMTsV0gSMFisNTGW
         uCFDFPJXgWKEl36w93vEWkNeTsFRbzBMp1LWJ6CGTQzTMVTtvIdZPx0qrYGLvQ0VXsEo
         FjEZowcFbFJXrIz8ue2eLRqziSfQWwLStSxv6QZxSFGQfqRpt/dfGIIFSELX0VsEfKmI
         DrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779941; x=1791384741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MQzMnZzp1O3Wb7yPZlYEZEBfKkuYTfPW2YrtjSZsDs=;
        b=p/5yMi5qMKKt6NTKwrYDW4TQs9zXYRrB2dfCJKFNfIJr9l7501qYKJ0RVv7/mVIeo1
         lbBQDyT6u3/umqoRF1aOFIN0WD2/zG4nqukYK9i+zWgsEP/rB86dex9zPwUCUZkKw0vW
         sTa5TgUCcT69EqLtdmmGb8GLw14UDWSWqnKFynDr66s8j+k8vSaJVsWzOzdVPGyUePEt
         NTzO2fWtcyfsxTEpsPyRQOrn+5NOW9R/mD8nA1hSMv+n17beJFKL+/hopbq6MvukhrQE
         7GIJ9evazWtF/4poq61Cpj6urzhNU0mqSGVOM56mrPIIzf8QJQWcBF7WYwRB74Wv6Rkq
         IedQ==
X-Forwarded-Encrypted: i=1; AKwUvBylDj6D6oL0p8PY4TICN9CFkVMXNZORX6neyqd265Vo2888+/A9FgS/PnHN52N2zuXlg2PLtA2SSvmU6Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbFDTLCh4djFSCQMe/oFi+oCBi8rsZ7+kxbBI4XAiECwPSeG1z
	gEjPJzceTJcZUQmN8wMDtDT08ZE1HjzSDWiWEqNy9iqaH6ptCRhGrPYIyaEKpc/CnBUQhw2Vguk
	bVjXHMOnXVmXiZa2KF+d1o4WgRsObpq2AktF6Lkz5u3gqMWsJ1B5ZPpKVyApH5NOYzXw=
X-Gm-Gg: AYBFou0H18vYGkm7B0p/l2WyO1vdnd5pWcTnB5oBZVCBypOqQYUjrdvhwW0f2uhTvVQ
	9QDesbJT2lFqcT/ecsFBFADcXiDVPiMfxSK6CzXgWUsodG0ugoPNKerQtVNgStA+Jj/bz8XabzV
	9PEH2YTFoiwWtnch7/ZB55mjtLfiU2rualD25s2L7OZcHxPxZrz13759XOWxyzcmSNq8Gl89XQW
	nn/L0R8xdP8aSO1dVV+CajWdPll7NoL69OvJ1ikm+Es9i71TcefrFiehbu7KLOxPB7OiPmMkgO+
	gBZ3oJeqKzstGsE3Utk0Jaz5enJdfvvtvQmUV4Lif6NORkisP03ldKttoq8J1qNISZIGSdxDyes
	/XKUgAbHziO36kI4AE+W78OPxMQpA+ckQiDQvJdGwzbWJxS5U6zyeYSw=
X-Received: by 2002:a05:693c:87d6:20b0:34c:6942:8a47 with SMTP id 5a478bee46e88-34cdb8e6084mr1938457eec.8.1790779941357;
        Wed, 30 Sep 2026 07:52:21 -0700 (PDT)
X-Received: by 2002:a05:693c:87d6:20b0:34c:6942:8a47 with SMTP id 5a478bee46e88-34cdb8e6084mr1938430eec.8.1790779940718;
        Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 1/6] dt-bindings: soc: qcom: Add QPaCE binding
Date: Wed, 30 Sep 2026 07:52:10 -0700
Message-Id: <20260930145215.3380977-2-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G2fpWx6ARO16qU3o3d980Z2V3BIsknUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX/nfaYWXhzVzn
 9uw9ZTww3wKvFT0mPNWvdhYO23x7km687oN/XmeoEX5X5bzBjyNQxhl8528WgZ58FKGaVXyp97C
 F3j4zfc/iI24m9tsyUDdShfbKZOHxMVBzzQ3O5nepXWyIatO12sg8Xiqa8hlYXHnowVhFRQ8acZ
 Nqu7PodLnkwNZXNj7sD9lUy8aYoED8m7GDGoqR28Fg1PaK6QzyKYcETHwL9EQW37FQseJArN79C
 mX2bZqTWBuhBAKY5sVVvumLs2H6dadZmUUiNE8EUgyEoeEzC4OFRABmvuTmHYiWgBDDDBcupoUT
 cDeJtVqrBqmQQpqsE0ShZnPezc92SzMUqnwhlRzWOu71xMXlRd62PRHOpgfF45trrE8iF47f9Dg
 kpjonP158YY7jj1EKh+jrkAujrCWw2xB2I41NzOUbdFu1kZjwCHHFNWK3f1EGhnaqbWLIVdpa2B
 VBmKtTnpUUgVG/sS8lQ==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd2226 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=P4ADLzTW1IxIBgx77pIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX/f2CnSJF2x3J
 3Gi1j81K6MXzsRRbRwDB9OAcuuxpjpjKYo4K3erzIKHVdXaEQZKFqhaG4N1HibMsVcKShtiykOi
 X5UFkk6hSEK45xqCw/axMLuYMnZ7FTI=
X-Proofpoint-ORIG-GUID: G2fpWx6ARO16qU3o3d980Z2V3BIsknUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300059

Add device-tree binding documentation for the Qualcomm Page Compression
Engine (QPaCE), including the resources needed to describe it in SoC device
trees.

QPaCE accelerates page compression and decompression for use with the zram
block device.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,hawi-qpace.yaml    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
new file mode 100644
index 000000000000..b7ae50f34f16
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,hawi-qpace.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Page Compression Engine (QPaCE)
+
+maintainers:
+  - Georgi Djakov <georgi.djakov@oss.qualcomm.com>
+
+description:
+  QPaCE is a page-oriented hardware compression engine found on Qualcomm
+  SoCs. It is composed of a number of compression, decompression and copy
+  engines and exposes both a low-latency urgent path for synchronous
+  single-page operations and a high-throughput ring-based path for batched
+  asynchronous requests.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,hawi-qpace
+
+  reg:
+    maxItems: 1
+    description:
+      Single contiguous register window covering all QPaCE sub-regions
+      from the GEN registers base through the EE registers.
+
+  iommus:
+    items:
+      - description: IOMMU mapping for compression engine read DMA
+      - description: IOMMU mapping for compression engine write DMA
+      - description: IOMMU mapping for decompression engine read DMA
+      - description: IOMMU mapping for decompression engine write DMA
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: qpace-mem
+
+  interrupts:
+    items:
+      - description: Ring completion and bus error interrupt
+      - description: Urgent command completion interrupt
+
+  interrupt-names:
+    items:
+      - const: ring-and-bus-err
+      - const: urgent
+
+required:
+  - compatible
+  - reg
+  - iommus
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        compression@31400000 {
+            compatible = "qcom,hawi-qpace";
+            reg = <0x0 0x31400000 0x0 0x80000>;
+            iommus = <&apps_smmu 0x1c20 0x13>,
+                     <&apps_smmu 0x1c24 0x13>,
+                     <&apps_smmu 0x1c28 0x13>,
+                     <&apps_smmu 0x1c2c 0x13>;
+            dma-coherent;
+            interconnects = <&gem_noc MASTER_QPACE QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "qpace-mem";
+            interrupts = <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "ring-and-bus-err",
+                              "urgent";
+        };
+    };
