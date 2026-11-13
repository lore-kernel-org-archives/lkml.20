Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538239;
	b=z013eKpxVrBCzn4nsX/YMTH666HIcAcGGcoOtV4WFHhcbnbxAqi7NJ3XToXxrOevAxsT
	 9xfGFLuIEVKiaNgVKukXx9FRlsIAzJXykE3OQqdYWVLrDlONHv38m1qYfXLBFaMpPtbGw
	 neBVMpbzQmhT8wDXSNQ76LIcxGswDY1xHh8g9aV2YyX7CI+6SlgnhUskSm4VpgjP5d9Lo
	 pQcAAm8++0CnW/3ZyhgPtCfE28rVt8MpMMP5Iml5LAmyE7SpfAI9Ja2TzR45WGIcsoyay
	 CfqQJRcksUKYzXnzDPb5qruHEjISDypBeHXOJ1KWb0caW6UzjHp1QZr2ZV8l+VGCBlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
	b=4rBY857H+k00T9gHlqdC00uA3yr5G7a/wRX+aPXs7Sh3UegiQqMV1FaAfrP3a6qjy141
	 wQeMAOCVAiz9MEArVYFxoOdZPKtaqN6udwJeoNUM6risLPs65Q7gMWWJ1c1zk1ufr6sGa
	 rnzbzvxIpxRbByE0qajLEOrqUTF98jeOWL92OqUB+NGrVi/OyFOlCRcCbmX1SvP2vgfWe
	 nqhWFi1yOzmMvsX9tAsOb5eJCHcImxrlzCydHFTNza6hILMvfTmIR1iqICv7V++wnsAqZ
	 Va9Gn5tOv6bqk3OI9y+9Dgq1Z3/TSLwlV3pzIDuqxLijHjiqAHatlHaf7l3YkTWEVuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMIY8L5r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275E606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2275E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMIY8L5r
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KJPQ1534473
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dMaPPvChjPIWoGHE0eNbrKwZq4Y
	Rj+KhWx6ukFPAMbnpJ97J97ve250cZF8L17bcLjLyWFvlq1LNrmLXFqdiXr3B4ew
	ustXxhpuy6W01y337tQJRng3EDzf+m/afUxgIiCknQx8MsjY3XqZ2u8yKi1eUrFC
	A8ZR9Or+E629kp1UlSrwAK9sCg4CffflQlxH7xRbisZL9WFA5QwExUCriJmBuHz5
	0c3p9JVUL7lbg8LC7i0WJnEqSJdktT59vUluLU5PPSMK0AeOOaPqaDrhNJs7yQ9N
	5iFtO5cAGQybaOxrS9MYqTSxdN4k9XXeGUllfkQygsAvlzT1lWHrFhI2vjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1ba575-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:50:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso4433835ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538238; x=1795143038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=HMIY8L5rQTkrLfl354ACvCphqeTBTrMppMstoN67WwX9jhOUs8gucPchMbbq1GovXA
         8KBJ2NrLygq9wa+17Gbf9xPXXzYUpwKKFFcz6Bqvc8W4RhzSeInAYualuvGt6GeJMvdu
         xQdaoF27qttC4i4FD2tVuPRRKE/qRBi5UaBgH+77t8pPnsxhQhPxgFNgo8AgMBqzxbyb
         YOJPov4zyndTx4DhM/mFnapB40WOH3s77zGR5YgmZmW4SdXCf3McGd6ljfJWwTtNVt7m
         QCRuuqEn+Z/CgFx3o5AQSvcrkezmWznb5nfUg7c4ZBBOvgJqJ/nT1Bkfm5CSTCzmgQ+G
         fVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538238; x=1795143038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=KZdmXEXk7ywZjbg6maBXegr+QitvXahdWyjbf+an3NxKoyZsjFle4YIVhAJRqml2g2
         ed6FIN1ECze30Y+WLOujmtsEIvDesOO9MlwuTg8+aStn46Ju2DsDBrJuZp1EzZkFm1Vv
         C/Oqr3ZZcWOpMZBVEV4/sCBxFo+blv7Dbm0lmpmnrSKki38fhxouXceO3mK8lSt0XD7r
         GwO6x8rtQhCgE81nqf253wYwS/2d3mmLocJ5tq2PGSoexkYg3DoihqSVncV8BFU+L5dS
         pniWNpfht9Oy7EiUyvEC2MIlzEi8YKzyba/Ngzl8RJoUJ1EzG5o2Xkzk4mEcqIE7IPUN
         JVKg==
X-Forwarded-Encrypted: i=1; AL+hErGIdUhFnqj2cvTYF/m6xV9pXABSp5hh8/CKfYDfuXR4U4lI6pmGetky5ou8MTTc3PD62XhihTQIhmKxiFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z85SmO7gUENSQpeWQu5Yv1nw26f0ia8GkSXIE1yKlNSjbPMxHtU
	v3y3YC7tJp9ovi7XtMzV23+qWk9RLYRpAym0a4HgnIKAGWKcwtYxHiWrq/vDOchO53lP2/71dN0
	jJB6zuiMsg3AfdmfOpDsEJ5wfNGbqw8ZIcurDAaJfZORklZ5eGOIOK/qjjweKwgjIPiM=
X-Gm-Gg: AYBFou2UD2WsurdHauHS6WRvWoEnPK7L3uIlYsT40aJxJvw9ilxtCnAygRQPmNvva5E
	sI4GExJpv4hwMurH5zGv1u1n40VT9F2W6p/7gCw7bCN3B/O8xcx0ZawGh4OoQubA34uJYF0r9wX
	9mHOVDJecf1yJeAxFcYNgSG7WsZs2nEdmVb52d46YQvWQvYZb3oi5yguNxDblgin1xjVfyVuPxY
	sCwOVBZmI4Umwt1gagwWSkTsokvJdihqHjjtJ4rX7ACZFacXMaAho1B6CHJJp/HFJiql4A7tqrS
	JYFpxh3HOeNLjUbltCmUHEzyjBjTtqPVgCypsq905+5Hz2sJM2Q4j8QqZ9ybmjdCWQiZFz2C9p5
	27eZXmmigjkwXgT27IycyoAI0aIHk9PUwbNZMd/R0iEX+UgbTjS2W6rIVuy362N05tzmbEpogz1
	riUPcRTHo=
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972555ad.27.1794538237624;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972345ad.27.1794538237107;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:36 -0800 (PST)
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
Subject: [PATCH v17 01/10] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 13 Nov 2026 10:49:26 +0800
Message-Id: <20261113024935.3173715-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af67afe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 1Vvtf-Jl9x_4EfUcIZ2ZQM9mO1Eai7jB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4mAtYd9Qp0y6
 2ApOqm8o8wLda+A5lm5Kk0vXkROeNToHRlM6B4dnPKrRD+KjCCD+L6ne+maO+w3B7L65wDjWNYN
 N0tHpHsvPch/6mlX6p3hyYuf3d8kkOgkuV/2IsE6d8Xf/lfku+ZMUsYlSXjFOV9q2TPdkGcG8LP
 DTHE6IMtOScS5W7Bc/ZHDmyL2Cb6IoYE5kYSNku95kJzkdgIbR7k5tXEgZSNmYWZ5vsj5xb4zmb
 +JITl1FXwWXZTUt2Az/VxRGplkPM3AtZ51uD4VAInjxRaoqiKMBofxNpKQl2Bj9blrL0HRsuknk
 vPfESpBY9GA3s7yWQDcrRpNbER3dpIZEr0woJYN72EdI/aDlae5z+KZXP1fsPned4Ke0xq68plF
 YAhQIF2Xr9Dujho6oMYsH3nv+NX3Vo73/zOgRM24p94336fNFWR8N9lgq7PRFi2lFlhSXgQM2Sk
 4yJDc7jMuaLhvlzEeeQ==
X-Proofpoint-ORIG-GUID: 1Vvtf-Jl9x_4EfUcIZ2ZQM9mO1Eai7jB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX/9G1mvLgJNSZ
 IPEnt5bqAUtD2Gg2aoyidy5lygt5Ez2WA+iUmm9POUAIesAvpIwLxkMT4laxEVjUUKUfhmsdjkU
 n5abX2Bfvr4WNuu6FwgB9zVfnUjXMgM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

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

