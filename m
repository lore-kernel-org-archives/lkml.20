Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5143802D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832215; cv=none; b=n0roEp1ZUfQ278v3vcokrbR4DBD47oxmmfiDcv9boZXohO0escXzZKe5VXWDhuFPyYFQrlLzqJ/QY5pJgwFgmmgjoazKOoGvLYPY3Ixoc8gTeBI/MFlcjLiePN4Cfrw46H+D4hWWh9zdEfDlwfL1L1k2oKikLOPwt6mpJ1H4deU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832215; c=relaxed/simple;
	bh=a7AiH9yPvN1A0yGeVDvmwiPG+fZZyNs8urMXRbNjYbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzKMeIY4YCkgg57GeRQsf+BfIGm6hStrrspy8vDUA7QThXe8tI8SbJeBSeI31pbLUvbVujnNadaoXeL1HUc9ddYg9BXyJOdO+C22+5aDZ8+Gm19kOz/0BUXzCpA3mX406cpL4tRXdQLtYhSt59T0ByCUpc8+CkWgIx3XHyBwbxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7vI8qUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ue7tNSlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7vI8qUQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ue7tNSlu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gXHH1512006
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XxsVc+GOQv
	zjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=; b=j7vI8qUQEtd9b2ruCBCEx42+akU
	jHkO5xfDE+CR1wvDL8mVMiL2TnaXqXry0yzK7GtF62kJfDsXheiM/VJidAel3Iar
	r4vOX1nzNQsSZHhNY4JEKEmIixSzHYsuWrm+EqW8IyDQ9spF8y9IPmS4QIffFX6k
	YMxg3ox4yV7PmZPCYTUs0WfF9UezRqceAlOHz+zGZkvrlgTjKfuTTp5bpXOQX9CH
	DVegnez8WnmLG79PKMctD8+gTdTqSg+i0jcqYgxDyMhr/ABTvUHDInhfj+qWOS51
	mkFzy3ryHKhBSSTsukJHAhAMrhxfvtG4r/I3dfwFlZ+9VMUsuTvlZJUZBXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh595v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:23:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so58677235ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832213; x=1791437013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=Ue7tNSlu/onmCMIRX2B6+l+hTeeg+egt8sG56nivbWbs/0+6b3wkpAvxRDoKZwExh+
         +KHHaBKHaDFIWhk/mKi2r5LKspUm54zbhpycECv625iyyRHi16mveW9OGCwlj4r1EvL1
         Nl/Rz0aeNvUP4FLihKY6595Vy4y08fY0MidprNzS1Ik+LBcM7yUmyRKvLvCt2sCCmLuA
         vbSDkt7ehriquiTyCN8OcxomladeSyFwkdSyk3jcOUK1XLv0dsUHOrxFp3Hnia3Y2eb3
         opHZPjqQF4uzWX0gDtSFx67/Hh6yh35lGXirVkkAT9L9EK7sgPpOPZlu+dLC1yfLQ1s/
         DYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832213; x=1791437013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=vJiuAM/uMxZv54Gpb3bcHJmaH038p5uLng5ARy/2UFT8pYHekmcGBDYigKDiaXoj0z
         HxkWZ6xAKqwuH7qwqTwZq1aZaJJPuok3G8/z1r59pkqCRlnKZaSDszoVeXJAs2wmLfIy
         ZZaUr/85r9gyFF4MeRonpsD2LnE0xlMK1ENagdZDUclbglhA4P8Jg+zR/2FQ4aDUIjxZ
         KYbx9OAcszN8xPtHVxRxTqaePVhA8xtxHnNcA8Omqf0VnRRs9/SH2oA+LfJnn2bypaXE
         P+DJ4XfnmOk91pcmnOoz3cY4IO+5dMAdPS24C6lTX6qKZIqU5/GWMGBU3exusOFZ/kfc
         fgeg==
X-Forwarded-Encrypted: i=1; AKwUvBzC+qJT3yjpenCmqmuOPt3Z/j8uFEbrgDQJRk6r0hg7H968nRyHSx7clVd7ps8eDZTt0qNpXlSQ9Rl5GuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxhvKwL7SrOBaGpmYt4TOWuQcdcmkvseJnZUL1F8sY7RhDqHMP
	5u03/NkDiZwgYKK3td7JsjK0/B2CQ+aiROQ1WlnT1YimnRFKhC0AHW1dot5D0XMiIfWH/C+iGua
	LYGjGZ5sPV2YqYC7O3RbOS+WL72xzB2EsmrkIggnk48fxMFmQc8H4+io7+B5tfiZ00mA=
X-Gm-Gg: AYBFou0ndtQhM2C3dwXWw2B045JWGgjgYVjf12EBKHtzGXAgriPJot+xvJ2ig9WJXlP
	d0I8SLiyG0A2Xe8WA+CesdsDQUr6966zHW4iCWslc7bqPspqxaa/hTlpms+XaTL0C0v4vYrSgH4
	ps4LJq5jFWNKUNxr8IhrdyBM6RGWpvGLgcQ4ry85uSuM6bPeHABQnAqnjsGx9yofrmUr916H6b2
	UKXvqXwUBhbghddu//kn5L9tSNjtdVzUlDd2WSkzONI7DUo/moU77jZDZICms5ceh+v+OlPWV5o
	5HN0hCNJWzg6WLCAHQEyx3mGIHYDQtE4VE0N2f8tyjst7+PSj+qeslU5Hn1vKN7rJuvBGJzDdme
	mJTFcDYtKJCWn//LF/lty+uYdvIcWlIPk4MOtkfQUnIqfmx/bewy0iEBclkVp7uA8LAxXHOP3va
	Q7A7+aE/CMRBZyFiZonoVzhdc0
X-Received: by 2002:a17:902:ccc4:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e2e4b35351mr25899415ad.28.1790832212367;
        Wed, 30 Sep 2026 22:23:32 -0700 (PDT)
X-Received: by 2002:a17:902:ccc4:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e2e4b35351mr25899145ad.28.1790832211858;
        Wed, 30 Sep 2026 22:23:31 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:31 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Thu,  1 Oct 2026 10:52:12 +0530
Message-ID: <20261001052243.3042627-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pIJNqnlqGM6SqoLp6GWDTFOz-pqZLjaN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX2Po2XRr6i7Re
 xyWzoKCemg9EvM8xK650nyW1WJLWJ1L9n/KgRmp4cgdavDNxkpNd+o08TmiXOUGJdHXbp5J7t+c
 xw4idLJsUXcuBXdxoYYyziCHKXxITrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXzdoJuSAsp9B0
 rKE9KVac8o94aVXBBkMscZmqqHxZa4dvsvTcwUEu9dwU8Z8tS5gWbM92CTmTRO2HIq/ZrfxxVda
 E5Wa31xtwgZ1FKUYH4cdfGJv8h3vIfg7vhd2aCfkpCSFhy7iN+UhEtLTPw2WaNgxF4xiucX5MvD
 IjB3krLIvCwwcc2jQdIQ8L5EWugR2IdyReuKI84jSEEgWk6maGgOwEk8kuaOThFb6V28SCbkC/r
 YKXqg6Rl2iMpiOEjXtmZT3/Bnrk/nxTMurrMOO2TzFcpPrOx1IK1fQbe0s7oIkwbzl9kKqhpnBb
 tFmkE6JLPZ6GEy861iHoiGmEJGNUmeBhkn5C7dZLL/LFEOCcs8uzjBol0RarQA7q1oO4an5h86S
 YMSCf3kft3hk2Cel9Yv14Sdc8GnCj50N2SLhnaPMXGEJZuaxJWX0EI6ZDbaygj/+HqIfjpIFiGh
 aSzHWqumjozMCoMNhgQ==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abdee55 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: pIJNqnlqGM6SqoLp6GWDTFOz-pqZLjaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 .../bindings/riscv/riscv,trace-component.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
new file mode 100644
index 000000000000..bb519bc4a163
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,trace-component.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Component
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V trace control interface specification standard memory mapped
+  components (or devices) which support both the RISC-V efficient trace
+  (E-trace) protocol and the RISC-V Nexus-based trace (N-trace) protocol.
+  The RISC-V trace components have implementation specific directed acyclic
+  graph style interdependency where output of one component serves as input
+  to another component and certain components (such as funnel) can take inputs
+  from multiple components. The type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register hence component
+  specific compatible strings are not needed.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,trace-component
+      - const: riscv,trace-component
+
+  reg:
+    maxItems: 1
+
+  cpus:
+    maxItems: 1
+    description:
+      phandle to the cpu to which the RISC-V trace component is bound.
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Input connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Output connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+
+anyOf:
+  - required: [ in-ports ]
+  - required: [ out-ports ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (Per-hart encoder and ramsink components):
+
+    trace@c000000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc000000 0x1000>;
+      cpus = <&CPU0>;
+
+      out-ports {
+        port {
+          CPU0_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c001000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc001000 0x1000>;
+      cpus = <&CPU0>;
+
+      in-ports {
+        port {
+          CPU0_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+    trace@c002000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc002000 0x1000>;
+      cpus = <&CPU1>;
+
+      out-ports {
+        port {
+          CPU1_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU1_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c003000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc003000 0x1000>;
+      cpus = <&CPU1>;
+
+      in-ports {
+        port {
+          CPU1_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+...
-- 
2.43.0

