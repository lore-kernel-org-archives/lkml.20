Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AB8425CF0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208139; cv=none; b=O21h37gz/cViss4PxrHmZbNGlCIuV9tjuLw01Xz1L1FXQ9j+SJI1jevuWm8ypjJTWVSinLN1WyFBzEzPuex3iDcy2E7pjhFAJeDmG+XQ4BuqbNQXzcrT3dzAwWJPh3+D0gMfhBIo8PYgA54MMNLmDmu9w3J6ytFU+02/yxqgznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208139; c=relaxed/simple;
	bh=48SRyTLQwb6N0QIS0UsPI0LsEuN5TTV58p7/i+2YBbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sx/kFbry2AgQn5gWzY0VtNTDe3GZ8/VQSIXkVeBYp+1xmt6D7BA53YWynPYX4XWCJuL+SzSXl5GYWgPh9I/kdg8GQdRuJLrFMybUmhyM7XfxV80quMmHjWmNESDP+E0N1+Ksx9qp+V6HBBMLMFyHejh5BCogofyeKgEl40/OUlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9P10Eq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDK5+LEW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9P10Eq/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDK5+LEW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C8531X3019605
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvGdQtR+Qwoj5VESRUaaVEODegCn4Sli4jhlqF7Rgls=; b=h9P10Eq/EjHe7DFE
	AHgtUu+UIQ9wbQglsmtTmEED1LS3t9Jq2HDfhzSlGFoAMdZWvziEZf+Xbuz1CSkl
	uHzWeZY3qegkmYQkSu4W9Tjjkp+sOq0Hcl59jMrptzK4lNfhTlNmvUA9k83gkFNT
	Z3+6pocgFldsyLB5gwj5JFlGAT/xQC/OxwM6k1ZTxoyI1ATMNZDUQE5AUcvuBO4H
	/C+arjehUGRr+Kpi87yn0uq5DuuxCnZAzX39PSee4MeIdkcK7af2wBMmeb1P3K/6
	9YbX89jsZyIjFZMnCBSsTaCyufqdm3usdlxa9Ig5MDKkZ/vwBqGXW9bfkARkjh+N
	/lPZZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dgp8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so3077154a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208135; x=1789812935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvGdQtR+Qwoj5VESRUaaVEODegCn4Sli4jhlqF7Rgls=;
        b=HDK5+LEWsSIbi2SfLCzMdDsRjFQ28FuGKgS7XmWTaNVj5eGNCdtYrdI4Gz09bHBPxu
         oPWkmbhbYoF5AohvLm9DYPi+u4bR+x+LvJowc4ZiM6RuS4/VVmnYLAMgGfJNcfRtIthw
         EAjKeHnDjkztD+XHRgAb7M/Wdpwirvfl6bLI+tX6nEKxx6SUuKiPcrv10PO3bh1ZRg0C
         kcvpw6CiAhQ/Qft3SdDqJcMN6S1gYVsyo2Nfk0LSNKScILHZSsg1whT/vA1viQA4pNJE
         vbXzsxC/046fA59YRkzBBoHug0CRtG3XXA08FN6OfaYv6ChaHezUh0HqTSrN0K7znbLb
         8WFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208135; x=1789812935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvGdQtR+Qwoj5VESRUaaVEODegCn4Sli4jhlqF7Rgls=;
        b=n+LbxKjGzlVLTq6FxBLpj4odmm6b8p4VQxz6a0KvG3cCeoK7UZdPWtn/5v7aDhh44w
         uNky7o7A9hUBNJdQDqM7ouDXa3+1vYNiHUiWbytlxcltDZ5uSSkzIJvkqK6NpqbIRCSj
         93C+8P6WpRetY9zWEVDVpz8X155Y++Qnb6u9EaouvzYxkUD/PM1+vv1pjQ2898Dl9C6j
         F8zygPHE+9HhAtMQqZEz0oXZF6JEL5SHlBdAn67X9Obz3ZHzRJweLCzznRUGoqH7BG6A
         YYWyBSya6xpXH3TCO/jDlXBXrS+GuweG0zG9qOMFc/I5H5VAbuseuTFQOX8FsgxEMiJg
         dzpw==
X-Forwarded-Encrypted: i=1; AKwUvBx+PCFcZLCNJnMP8mlgPxDZzo94gVrSbS/733CsiabIqiWltVLOnga37Dox8oOYnCjs7oMf6PC5Y6v5++0=@vger.kernel.org
X-Gm-Message-State: AFuF++mMYOcitofl1mgRJ6j1XHAHOo1MwkexcFaElzvQOyHrcAYQOqsk
	n/n0EocAFexZeMxApoxNJk/ajAa2KYk1mg2rqUQrk8QtVNUZ/jYbf5I+7bPHxz9+7OoSzHzXLd0
	t8ziztcr3HSB0m+HMx/n3qMnNGBfq5mvyeuPTYpdLU81naACBnW0Z6cd4gtMzrTj32g==
X-Gm-Gg: AYBFou2aG43T1+rWumIwUtkzjz+WE+u4FuzwZVlEsNlbcPWImrdP0JwXW1Fek9ghqf2
	1TDfiAsT8fUhF1XjUqWTvxxloCN87AnzaSmnUuFatop0ynPc0YnZpPQZrQZzETXyWxdVU+nkGJt
	ARIUTVdbOjrlquqxB/V/v4fOC/gDgbRv6+zLYUrWzyYwdDR1J9r3wqVg+BouQfWYi77rgQ42XiX
	T2vOLDZ7DLh+xHWN1jLT3X4wh4ugsGDfQTWpB94C7ljwkoEouB5/IpCEOrCdxsKWKBl9J0+khSX
	nbNJnj7GsF190nTm+KABO0TdPnR176qZ5ZqVx20VzgXhx5GsnCxSnSsTn4ARyusc7aFO8OeusOw
	cAwhiG1uiq1CSIu/6X4MqJIXsb1HmcHyo86ia4nwnMW5e+8Mkvxg87cPytvc=
X-Received: by 2002:a17:90a:d2cb:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39d9c234851mr13405563a91.14.1789208135078;
        Sat, 12 Sep 2026 03:15:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cb:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39d9c234851mr13405513a91.14.1789208134601;
        Sat, 12 Sep 2026 03:15:34 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:16 -0700
Subject: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: ynXgzwClqiFysxBaMVCK0AhRy89nFnCs
X-Proofpoint-ORIG-GUID: ynXgzwClqiFysxBaMVCK0AhRy89nFnCs
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa52648 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=b45o4kL6AAAA:8 a=UjdUaUu09JUVB5va2ocA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=dhdsR-PFWuPJUldTnwXm:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXwWwnGg4nUGga
 Vlw2mLk+2Bi0ix1Eq2CzL9SVcgNSy2zSpvJBifmfKGUclkKh1Zv3X3UlGrM2lOTqV8UeMykTBh5
 tcnmG+rXlZt4uqykxeNgeZSv19gzlCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX9P9sGjnSPgv9
 XHC3Spau/nt6nSnYwbVxD3DTICjwWyTaea7F5TboHThMzOZBcnPimLU/ugdjzexeDNlqR+LkZkS
 w9Fj7+5ij00UQGML+CSPjS2eGS+p7mhyKcnRsK/y2w5O5zDTkAwb8bmwJWt9HnCExB0FM/jNsvt
 g1viahZlD1YZQG41TNFAW0Q4jiUjmbJ+rqrSbt+90bEvtehsoGBcqr7og2cDOwnALju2ClW8EJb
 sXjch2w2Ht23fpVRpPVMia413La2zcsBcFfJxXY8B22bi3G+wDtKmAOBFAyGNCrwF9k9y1+8q/1
 yCVMdDppcAEioXsJSdMELWh4p4SSeYIqmRO/t9Fy9tvKqJVk5T7ckV4U+EaYAK3slbXMUUBjPl2
 uJGsnTMvvIVfEXTRgjnt/b6sb/OGGd7mlcdC+nGqRhE+1/wJO1DbMQUT66Yi1ZSCMLpEKTPqP4O
 hJa3HchRbFB55GzJHJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120146

Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
TEE service group over SBI MPXY.

Describe one mailbox channel per hart and an optional interrupt used as
the availability doorbell for asynchronous notifications.

Add the binding to the existing OP-TEE MAINTAINERS entry.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
new file mode 100644
index 000000000000..8f6ff313fd42
--- /dev/null
+++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group based message proxy
+
+maintainers:
+  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a messaging
+  protocol which is modular and extensible. The supervisor software can
+  send/receive RPMI messages via the SBI MPXY extension [2] or some dedicated
+  supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines a TEE service group which is the RISC-V
+  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.e.
+  Linux) are peer endpoints and the RPMI framework (machine mode firmware)
+  mediates every message. Entering OP-TEE on a hart runs it on that hart until
+  it responds, so the SBI implementation provides one SBI MPXY channel per
+  hart; all of them are listed, in hart order, on a single node.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-mpxy-tee
+
+  mboxes:
+    minItems: 1
+    description:
+      One SBI MPXY channel implementing the RPMI TEE service group per hart,
+      listed in the same order as the CPU nodes.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Availability doorbell raised by OP-TEE to signal asynchronous
+      notifications over the RPMI TEE signal bus. Optional; when absent
+      asynchronous notification is disabled.
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    tee {
+        compatible = "riscv,rpmi-mpxy-tee";
+        mboxes = <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 207a6e2db70c..7d0e550085b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20577,6 +20577,7 @@ M:	Jens Wiklander <jenswi@kernel.org>
 L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-optee-devices
+F:	Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
 F:	drivers/tee/optee/
 
 OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER

-- 
2.34.1

