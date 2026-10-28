Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214001;
	b=dGf6zOUeZqJCH86D6EfewioL9Q9hXk4ugmV/ySFaIRQiAaIT8QT6YEfKZVaiMPI2Vu5/
	 PUZ+hE4S+UGuM0bXIiJ7sQ6hzEKv0k890Hlt1swNPoyTxi31P8rRKUhn9+wOGhebUd3Iy
	 XcFcTAN43/MdY4V/FifUgEZxpMW1+gbQUACNTs4aMveDZhzkNV8MdDVzCBU3ETrb8iJMm
	 GIcDLLGfoVIJUjhC2tNtWQdQau/MT7W4BV4miPe/fIjNbDKwuMh52zaUiB360L0A/VO59
	 Waq/8/5AmbHvG9Jy2pr1Sxxg4JlW1nWaNWDPv2Y1F7fv6w1zfWPfTy3DUivmqe0Qsog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
	b=twBqvfMng68WfBUXc/aAmWJPScJUuU0ociUinJrDM1n0JmAChMxOY8lLD/H+EtKEvKgD
	 pBQ76aXqE4B3dfmgl9LlHxIt+qzzUmpS3scfdlwrJD/QUumiDmdFoRnTzWvJjWyqHsWLj
	 SZIhShJ+Ar5wxXoRyBGwV6IXFFFDDjKt3IQj1NkCul3wg79XUo32lf2zEHNxMO0qcqJS+
	 mU4fUVEZhluKQoCSxlFqx1v6bAxxVG4aI/ZsnXi0afgtL8GJIPeSRpVo+a8T0he6EI84v
	 djrtYprPzihdunK040nyF7WD4FoW4hciQNAEKo3IJa2fr4k0TCgTPj4PDtz0yui1TBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ep/MW92A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QbnUjBNi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD1B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ep/MW92A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QbnUjBNi
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPI7r1026776
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kz1wdYhqxOh
	UGYZF5lOTha66reQmCoEbGUOxnWTSoQM=; b=ep/MW92AMSe70dcCsvjJGLIy8P8
	hERNk/Gp0UUP/A2xMSGQrwIcWj7Qi5eBb5vRgaIMQhAiToPri8NiEBYSfr+POUPn
	A2mj1UfuRSjnDJfn8aDsMD7a7nOezhJP6pZOcxjhmOn78iEWbBYCheNG1QxNO4v1
	0FL3f/sFdKTSwAYeI/t4HZtptRyqdPMjyfJikN9WzOnJoNqs2wwLBGgWLufd8LLW
	AnHxH3QQM4JmR7GLQCC+4bDLD7iRKPh6RIDOtam7ZvRG+COuQn7puNg9b2O4H8tG
	oOQnP+wzwhpgIoZ+8wrtPy+jRUmsacpJU+BObyJeXGspjdsTnBjgIKmIdcA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb28djm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so1764081eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213999; x=1793818799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=QbnUjBNiFsSBCyO/udqY+9/jwuab3LUhg50xg4ZhATK4TshbXNVpZ3KBJqum4dI0D6
         AYBCTMpboRPOBHi+on7e646/qCslOFh42/BteFNzYG1bUobkPMaWbHyO5qzUPVkz6GLH
         NMjpwHFld1MmYuNAlCUSsrvAmYeGOtjfiXIm7CyWRWz5UzeGuah0NOuXPzAsgzoXPX8z
         rZQEJHaHoC9/SEITNmUlG+LrWfqvtJWRMELXBUePVxYguQDa7AY22k3ZQ65OUPchLt89
         Lo2JEtskx58pY4pTP0JdcWMJJ4SsIyE1XhHZHQbosdtCm8u3/LmNOkkqCZDM9Tva+Xsd
         AMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213999; x=1793818799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kz1wdYhqxOhUGYZF5lOTha66reQmCoEbGUOxnWTSoQM=;
        b=xVbGm334LpfFYEhGJyquCohR6LjdVbE3ctHlXJCfHs7HiUaxo6tO3RnYTgavWtAyg5
         OkzXvb+5Mso9uhZKzaVmpuxvTFSRzTe4XhHlnlOF/GY9N5/ofmHnYcpGT46SVOFfvqDt
         6nNnMd1x0hbhguDwl3etCnD84j+nWl9IjP7JkLV5iIBkJN/ADJ3kDsI0FtLMOMu6u2sB
         rYa1/CwHsG3pOYMVIhPfG5zQxTC2PoBDXLxZ6QiTqYU+OXsXS1G7OExdnayhoM9bEAze
         r2l7me3vKd9S+rDHpigVZeQ+9vgOpVup6o3l1xCuJbcyTG0fFsIOHCROvwUGgJZo/ViH
         JgHw==
X-Forwarded-Encrypted: i=1; AKwUvBweAPlItyEwmKevOO0UyFOCKg44eDzwjCR4Tomhzdj6eCIc6r8yUn+Ng4J7YX7qmx8dqD/Vf7m9XVhoC9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+qRAjxQUwDcan1xXWiaMLWp3Awkti5zJIJpb1Iqk8pFS1+EqT
	X2JPOw1x3dyc1iWv5UMAOHPhreBLF/BZ9XgrtwPUD9j3POX7825IJvdzw9IOhLQ9BGpuFcjK+vk
	KACkKPEUBX8Rxljq6kF3Gx5LWJallWSBouQjmjXqBMvcHcu8K25CF93bE3+Dx4IS9Utk=
X-Gm-Gg: AYBFou0OZgHuO7oUb3E43hY8aTdN3LSS2eVgBa14yNGRM8vxZ/Gwj7PX8ACqXJ7cJ0A
	MjtwxhGVcJPpAu+5RB7RlU4O1/ppLRLy90MUr2wRqTTHoMgxvVVHbaKge2EbY8+07PohsPMgzpb
	yVDuqik4x13ljCukSrqSGLNQms1GGmx+Izok7fqauwff11W7or+U5HA4YXgoqE1tBQcnVF0nfUX
	GWcKIMKML9TLNFqHCLk/W4CPmf/d1jiWCDsqv3IA8JNX6muRqJ1z3MwpvUTLtSj3vBJ5ejGKChV
	A8BG1m0rjoX3uMFGcqIyI6d0rwYRuoBKJ5jCdSO5X70+EExCkHEDFK29j+cNBFHqv5nPc67yENM
	NTGK3aT7niYtz1VtswPE7tSfvQmrmkkqKb6eBaU7eU7FoyMEuZ1OGhbUa30sJahNXDM5v+UcrPK
	6e297oow==
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976457eec.18.1793213998523;
        Wed, 28 Oct 2026 11:59:58 -0700 (PDT)
X-Received: by 2002:a05:7300:d088:b0:351:29c8:643 with SMTP id 5a478bee46e88-36a20069caamr3976333eec.18.1793213995448;
        Wed, 28 Oct 2026 11:59:55 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:54 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Thu, 29 Oct 2026 00:29:33 +0530
Message-Id: <3d056785e2168de7fdc238d274d3d993e0f52464.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2462f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: WONsja8lwIx0l8nOKXdVQASa3fkq_rfH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX/04Ch+00L5kj
 7Goptj0riDrg7Bhi1Y5KT4rQbV/w70yJeoYQaTnGWI+QWYVLLmp8KAV1x8ciNOEKFlngV2XRWlN
 WQEgCNIEAtJwt8egLPtQplrNX1FfzKE=
X-Proofpoint-GUID: WONsja8lwIx0l8nOKXdVQASa3fkq_rfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX6u5MmQioRBCu
 PKEx0tpl3QH+Xvi4LGKrl8NoFSAQmLCMiko6ek9VfSYoqA+xKKGD07T8NrwWem3OHw4Myj8OPP+
 y/Qr/SyQw8B4WJXggXVgwZfBksnuMrwjODjPhrxAP8lu28nTUxECF8Y2NVJ3rWWKBhsIQ0/6UqQ
 CQkK+kQ1amEk8HIQCYn7xcUM/goM0caDmCsco0pA3aSNooPgzYqUga1fdMVyYOHgavmvf2Qwbbo
 HJeCZTGQlH3zssvjTkwMVtW2ehHYSAdvu4DvDw+R0PVXp3BlftgDXGE/XOej7fUK08ijVCj1H9g
 4azvajMishEZepfq16WhrIK/7I/YHwAML0rAQaQJMbO03ZK9TsAfUvPR/m+D/TW5BBHX9Lt5ECg
 If3SXyrZ6bRgsDY7R95C/2vPzGOI01EmY/SCYPs2bLcPsFioWk8DKLtKBNqtZfMWwvQjdc5uHy/
 ubdhR7YQKCpYPw/VMTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280075

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms. Clocks and interconnects are managed by
firmware through these power domains and are therefore not described.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..50361fe97c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+  Both are SCMI power domains that are only switched on and off, and
+  neither carries performance levels.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: pwr_event
+      - const: hs_phy_irq
+      - const: dp_hs_phy_irq
+      - const: dm_hs_phy_irq
+      - const: ss_phy_irq
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

