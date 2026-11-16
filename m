Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814896;
	b=xSSl++DGv9wZDFHlb3hDnX0CpnUaVIPpZIQwfhRE1xIPsm2m4YfrM708vWifRRrL5OS8
	 Ni6I4NBwNwdvZH2oLsOshp6kasnVNjJxAUrxNyTYkxuWi2/Qt8OglPToC0c2fAyYUX/ya
	 iWAEaJF+kc1Ms+f/40Uwd0mcm9GMd2U4ZRPr5/rvvQTiXM0LkjFraXNdI12L1ACxFdD4G
	 3XTqCtR/4rYQtw6oxLLwStXMXZeEd25nsPMwggo9He15HEI+L+r030odYmsJ92xit2RU+
	 C/eP3Jw7g+EtcNcFiFpjK0uPysbGoPrSs7clDLk3T3Dz2f8cewrOO2AiKM/1FbqYp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=hpYX+flklRMTsUHG9zoTsUxHMOzGF8yCEUIr+AKyt/y3/fT92X+5zvL8SGFF+4CtK0cA
	 0BN7rDAqldGCLfio7nSpfB6NXrSzwaGHvAnCbR7fgNRS2Ircut5SKZuhQfmK8hh7Ia2oC
	 sC6OYUMIwy7QH61ngv9CWBUfkNAjdIkMUtolLrwT6kJeg+lFrLCd6qqre60+ErP3nBITH
	 G8UhhAyc9l256RU3pOQuGSJoUt5MBAAYpPMgEYDIaQTGjHY+VCf7gUfabpa0PXbv2dAnN
	 i8bpL1UwBDPaGkQsc4nj1/QV9F/mvv8U8uNB8XbSmUN5KM4DrZu2hHtW2wtdfkrig0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7CUUPEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0E9Bxxq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD71606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD71606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C7CUUPEI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q0E9Bxxq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ev6a3192341
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=C7CUUPEIpzkmWzJd67yoayePQmQ
	YpDCEcP8KXhTUTSy762GDvDTMugc/2sNZFLaAnRAra2zWfmQgY+BEbobMNnzSWPw
	aEqISYNOhevd75v/gBNiA8IAFQ99Eafty4mT7WAwzx7CulDXLU1yzMAzU0aOyFGO
	TRK3NS99nmhO725wfEgb7or/p9fzCCjV0GbEijrmKpXLKLv76p9dmPj53OgM+/Mc
	HwO5Sozjo5Cv67ELgkWenXvsV6Y3J8tc9TEUHXocHaXGa9UCzb+Wldu6zMJ0s1Y6
	bV2/TJswx9fDRMK39O0ESE8gVSZfFOhrNk1z1Or9iehcaq2ADzQDSTC4GIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj45drk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so2104907eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814893; x=1795419693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=Q0E9BxxqQG2qT2TV6yqxg+t0ERple/0yE9rohv/tbFxMb25ra0rHDTWKJX53lJQOr7
         NAGZ9K2MuN/TR6MOCEVPuCJ3NyvHJWEtcAMPXva24DFdSsv2j/WAAXIBIgzpQG2f3ESe
         qntmqWna7xAO/iNgHHvQA+i9jWZpEPoLNiPlU79k1hJSfuQX/huJPotvu65llDyFnOGz
         lVtTsszo7cDQ2l02AOl/rKNvLT8lt+CWbU4101vMEXR8XwvgdeNpPNFPyczNzh9bKeRw
         OC6eKLUxmjp9iSQLRBrQDs0GrVswA+DJ9sQkRs9I+DeikEGrwd8x0WjNuXjBAXWGdUl8
         v6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814893; x=1795419693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=HyKujuRtO7Hgc/WY74XkWh8uAFkuFWorcUcxd0t5I1uGTD8d9YkOmIp4YTBC9n1Ia3
         CNpxCcxVMje9Ce/cV+0uXy76ytKpfVjnYbZYzGPX+1DsWqbP9OjJx84Mxjm0y4iOTARQ
         uu8SQIIMD8Zfz7MyOi/rUldTaMzl14KuQiCzD2dVHu8r/wXxNjgp/0x3iuXVlDCJH4VY
         mzhUNcJuogJbwbxVBhO5FJ7KglIvkSDArvAdi8zOy4jabyNCFqhJ7HuSjGzgNIoRw5ii
         6O3Q9S+vLACODvRxThQXXhwaURghhnnEwh6rafSB3t8i5SJuMzMJets3XB2cd2XYFSg3
         F15Q==
X-Forwarded-Encrypted: i=1; AL+hErFzDhQnOFGy3enL2gIbFARAgYsGrd+pmGBtWbs3WlyNdyTsLwblIQzdXDQfRNTf04ztH5VXfhHLgq6O1Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PRn7CoaXxlTqJp9wHkASek5HbmHtYCBe8OxJn01styeUUH1Pg
	XWP5k2u4bAAiQRYcPpL5uoxkNsI0/oS9hTuJGfn9Ilom9Um79Wtga+XFPY0FVOhqjiBjNnCr9q6
	g7ExjEK/OAEo0fM53cbiEYkvzVs+D0afpppCCnEP7BJs8FQG8fXQwf3BiuVLcIhOqybw=
X-Gm-Gg: AYBFou1sISd9BAMvL8iurW8V3zmTgcfOpMznpNdKPUv1hcrIMEuZV2X7v6Pdgy13JGt
	lbo+O2iBto5d0lax3vEoYNBaVjEzYoT5rnvuziIP25yktazwEg50Y83UGSdg1lSDQPEuZjDcyje
	yp0h/RNNRRsitUUiUti9d9rruZ/STX4Qd1mfEXt5Ls5Uo6TrdvMx8p3qKOQcqBWrnl1y43HyQfb
	UNHtc6/beSv8pAte9YXZjBbCug0l0I0coh0A0ouFKeGpOqu6yD26DwdGpxbmzi5mHEIRjXODSNB
	6Pa2AmUyDExznCGtV816Yl7nFz6smZMmCj0fQVWZCbUkIim5DZzaQJwtwu/OWw9kVN9s1Qtnke/
	ptfjBJWdZ3FOAEibjJI1RPJKw7L6wcQa1nVxrtF7t7hhU4vUz+oI5M3zTlXZ7ON4p18/dCET7ms
	oSUS+dtj3sBKGbKdcIOXA5SjXajg+NtZzhEQ==
X-Received: by 2002:a05:693c:87c2:10b0:36c:a3ae:936e with SMTP id 5a478bee46e88-377e093dc83mr12381538eec.5.1794814893300;
        Sun, 15 Nov 2026 23:41:33 -0800 (PST)
X-Received: by 2002:a05:693c:87c2:10b0:36c:a3ae:936e with SMTP id 5a478bee46e88-377e093dc83mr12381500eec.5.1794814892520;
        Sun, 15 Nov 2026 23:41:32 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:32 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v18 1/8] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Mon, 16 Nov 2026 15:41:11 +0800
Message-Id: <20261116074118.822731-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX9jFLE7ctHZMi
 4VdKe4n3q6th6rjKQ4jti5Vu0f426ZVujwU1KNILQ/axbfZ0HE2xXqMnnAUPDR0eCb/X62zabOy
 RcQefgIfvKBWjGt5zJOoQ18iO2IHxTeXguH8bfA5F9vesgo9R9xFIH+VL3Aor4ksHAx5oTSmeQP
 x0LJx3aIhDyTZNiAfIxoF8RfayVgjVr9MVnP0Op9ck7av3GYjoSQjBIeFAi/O/Tb/gtUBr7e/LG
 3y10rRFpyGZLT6fga7OeWHG8avi8c3F6wcqdT023jUpzsH8R0uZ4IQeK6+MwCVK018YdECkl90l
 lTtgrQZmTQbOp3k5In1zI8LVlWsm8j9vkizRnwV1B8UDANhmUBg/SeZ/bVfIb01CjCYQduodKBu
 mG7JrNo4QanXpudTFIj3CwlT2QxTmJe/0Xp2F1+Q1qYZDzXIumMxWxegpr5vvafMMEaIKcqWtyJ
 KLj/2/7E+wNSUqDfB/w==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afab3ae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: F-ta5dZR4tKhao3E9lONniGqniVthIiK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX5VeDtfBx/hzG
 bdtr/6nVuuUr5OTnqDsf/l38F836mm59OxYHMdLykiSUKCu1SddZ6nO/7Phv3b0R7Uo2PuxM7zV
 KChFiicLiMwbb982zzIDr2djEUHY+pM=
X-Proofpoint-ORIG-GUID: F-ta5dZR4tKhao3E9lONniGqniVthIiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1

