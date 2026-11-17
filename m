Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900803;
	b=hQU8K7s5tq+fFn6/pDb4j7mWjylZL/sdM37ugiwA6znG+Nh9XtGOLPBBIvNv5BXCEj30
	 Q+BlCvHX2Gnh/nsov4V/dTCTEnySRigrVAPiy7j0/wqhL4OET0xy+Y4H7Ss5+NASM+7HC
	 qwYIKJePQ6RKaKKNWV6hSQc5Eeplt6xbriSnc2T2VX03YB0PlqlnNydBbgbvQTbYyG9Jk
	 l6faaQn7vsvi7y3m0EZLGZ1P6+avWyjM6rv2s62F/kvMSKgcKZTQ3OklF95e+Rtl38ypI
	 NqfGYrup1H2jjufWid9xB6GE6xP/ibI4ubpmb5YqqYYC9oaj+OaPsiKfN3dwkL3fACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=4flVPTF9fzjaaxoGVajxBBQN8Z4jJPnqI5w0BifOzM2y1e5cgbRQP47wzZz+BYSfplW2
	 oAjsqBod0rNVeHPz+T3QvSvOlsdewpZXMhdGDs1umQHxzAldpr9XEMFZJiQJOCRgp95FM
	 uURZfSXFK38hkVutMQ9RdKHJj0iBh/RPvOYbVneJ3wpvxYg+WcUsbq9QsqiIyRUxs7+JA
	 EeSsQMly+0kZD7xJcqOn/HAdC8xb1LF8JDiJ6c1E/lY0InbWgz/Xby/Kh37SvD+D0QtmC
	 WKHEi031eHuoVNqTCx71wWRU46Mend9FH51lyQ6YNHtKun6x9Jg3POk4S38YL0aEEQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KY+yerfM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3E5606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KY+yerfM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LhBv3980679
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=AIA0+3yFYr6iy7Nswix4qKnXpl2
	quVLQcOVke+g2SmYUuONiFX0dvabXwBiROhLFNlGVLcX7J2p6DVOW3Af70XuT5mu
	4m0lwP97HIRmsWf+PFZp8sos+Hc93hsYrDt3hqvqWNTQvU7TjeB+bQ8b9w9mzSsW
	2JRKWSthrWNA5eai8dKCfk3UBzMokuQt/C8tsjj6oXqCMsiTL5EdrZ3Ymrwgzqq3
	QIff81j1r9HOTjcYktoo0IfGymZcT5PkxoKXU/qE9EnG0uVKLd3A+nQAtL1xWCr0
	zPT90strtf9YmpraUhJqKnrLy8rV1BQk9kow+AnBcr3gYpwFZ9NHaCsKY8g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0884-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8488f31d754so3112225a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900801; x=1795505601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=KY+yerfMymD5JUs3uFHHEgNhBZRwCpSzintLTSl2UecT5IQWaz48u3eHX1smIHLenm
         9q7Y74H69GjyQzq2V81SFvMpyQ8iS0i9BEpiowwlcwGHX8VTYNQnb7i4f+g3syAtFwFA
         CpNdol+KUz7EecN+EKCKVhuO1Saf2DqYGl3OV231aA+ErcrV1II5stLf3gl79irpL8hy
         d83IUoAg92+6bdOCEyHW0i4/bKsIdC25lvBLHmzOQYJm6maa74criu5bah5YLsAlZRlT
         JTbp0sHnnhHnUW1vkrp9EEqWTX1hLHZ5oJBxqgKDWfOL9ISZ2Ke2Z7dmLaTFRDvl9f6j
         RHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900801; x=1795505601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=OOfSEoMVGxqH0XQz5eqgDo8cNbn2IrCcTBU8hdmCjrXB6TR6QAJDZqBKQzH1/6pNuI
         0taqrQvBcSbSPy5aMJry/ZTjbdqfaNQA3CYhgNA59hEiL+jQkkuq+mswIrjA/rwMGzbO
         T4Q4DhUvNRi/oLNjO1I/1JtjviCfG9zbKB3PYRN1zQ65xWSYWy7Y+JCBNzm1d7GVdRL8
         Kb4t9x6oxOrUUZrRILcRVOpV7Pzl//evAjitWV/pBJXFeLPyIcdLhcb2t/TYZOjrCZaV
         kyxVYiFfVD9P6d9C6lYmridYluz2oOaZrpfM7KDTwDMS22JAOMfvMYf0oOjiajSbg8wt
         M6dw==
X-Forwarded-Encrypted: i=1; AL+hErGEFyj71yjQVMkrS2V6yfoW56t5ckzPkeWZWmupwMBejWawfrWyYt0OF+42oflrXBbgGyZ23sUbdsLf0ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EpO+Kp6YteCGIM6XIXRh9ShbyH9t6y75AP5FH48MtcdUibGWT
	xBzZ2+KrPr+COP3xpNE6Ppp2TIqvWNSBXAJRVc9Uh4OLyRgaskS1tBygI4Q9g0HMeWd+oUxewA3
	ya4kXIQxzkYga1w5grEKgd4dZZqYiKy4els4qqxrgsR/PiTycz1mBbsiF8hFPLWdWhXw=
X-Gm-Gg: AYBFou3rwKuMVUPSM5CchsvoGWnLzMw1txD98Tauew5yLyndTxj+lPu34Ku4nmyzuw/
	fgOKq0KtJ7PikokgY0HFLsyGo0AyPCsAvWYf4N1n7Q3laFSQvgqMQBt0CpEj3NHekE5a//Y4qLY
	cU2VAZEQa2JvYOJ3A1Md0oyxCw0LBU/h1/und5z8NeuDjHUaeJYRK6RAHwAG+VPkNj8zPt1cIWp
	sE9DXJwvuZfeKzzg498RcJBzLXbJoz8f/nZJrqfC23jZlL6c+GyLLXGVDZ+orbN17gINscS75D6
	YgBufiHINrjHWSXHjWDTgcJp/LnA6ol3j9V/BVo5BS5nyrhalkz0XhlNn76LLvReM8K1jncdKgA
	EHtlwadRRrqaF6O3r+xLnrZgdSwMYSEx/fE5E3oOLxOmvwOEQnqFJkOCX8Ie92IX3OBvfRAK6Du
	Ql5wNQMdRMDie2Mt0cl0lSfMFf3QHTku+tXw==
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070431a34.15.1794900801173;
        Mon, 16 Nov 2026 23:33:21 -0800 (PST)
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070422a34.15.1794900800721;
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
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
Subject: [PATCH v19 1/8] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 17 Nov 2026 15:32:58 +0800
Message-Id: <20261117073305.3854951-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc0342 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX60WiVGWEkD//
 toi9U8+bpE+ngqoPqLhkl3lyBnaduu4T55yms6/fzuWF6ttsFuaEWqcfXX/X4iqmc5CO9bBFANC
 a1FV3H0z49c6Ef0f7BJ3o2vx8bRtzOU=
X-Proofpoint-GUID: K6tf49HYErJF4DWJzcizjeNjLn_w8Qrs
X-Proofpoint-ORIG-GUID: K6tf49HYErJF4DWJzcizjeNjLn_w8Qrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX/EAsCjXi2ki1
 dFw26rpwzr3+DlnXnLagIxQN86RvvpQUMJJvUucBUEMXVedx4xmWKpXYBsa/XKYJ2O2ZxcDNGZQ
 pwkAyOMeavHtumEYekXIVI580TvA3bRaeXdyzGgZaIf7m2VxBOYDaM9+427R6gxJMqr8VIMJyif
 acQ1GN+ydO1jq3iNu9dXO+Nk8lZ1ex+KdmkiU1986i41BbSIz+FJurFiGxkw7CvHSQ+jqu6YLpm
 /w6xGEuKvSuNFSOOg5wkPCVhFlNG4m+03cnI8Ma/aNlw48x7/K126zzYlUjec1JABO4LkTZ4bxK
 ybhPU71jTIS8JQJgynhNi9xVm5LgKrQfavz3KDxMbvZz65yxsyjW91r4GBL1DX/0D5etOp0vUdR
 CvnOp7KkBpzRNG0JmVRD8doRt8pl5KYd5QaL7V89dySz6q9+gXlVxYcs611zqKsI7nfRxe6Iifo
 Ln7msldOYu7FjjpOYdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

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

