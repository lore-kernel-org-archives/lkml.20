Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D4738947F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725489; cv=none; b=e/LX8s6u4jZQ84/URa1GhbaSxrpCuhsyQs/eHFLoYReJekBOCiXOaNQNXJkWm8BSmoeQ3FuzMSaM4eeQDgMWV/juV2vEebJymrzIQOWNIegna8Unlrk117H2Gyajxxpt6+9Ky8SnJbsCfar0xRGBSRDqLPyMC5HTw57oN1mBUn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725489; c=relaxed/simple;
	bh=II7QDiq2jwtaTJv1NtjrjjWlOFL+SKyC+x4kRxGPEPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfwTE+/xbA713VvmKI6ljOsw3CFgafAba/X2u7FUD9MFwz7q6/7GS7tiuY13ZYIchO+tUn6cHRfQk9Oo7jk7p6VAQ4Y9W+z6kfTEZxMm99UaVzd5jodnNdIFzX0VDfsFjdd2XrIq6hnnI8eWSZLf3IGM3+eukfk/125oW1jIe0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoHqLS/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEpCzKuz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoHqLS/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEpCzKuz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dsZh139301
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4kZNrUwWokoKECv3iGlIDrJIK3q6uAjX8lV89l0HjA=; b=OoHqLS/Knik5+M0y
	6/4jA+g7JLSjimQ9lyfnviGuvuD4/8ieW1/mz+Nl0pyl3Wzkzcl88thPDudKnQ+P
	mo74hbANUT0hyDwDsojPbmReR8y1D7ga/o98exTd6nciWDtiNULuDyjf7l/X6bQI
	hVG7TeS5z6hailzPqvICOO5q2s4IBmT0V1fi6cmZRWXcKY9Z1MzAHaUZ7gBXF6lK
	/cyilDbrKcMv6eogDShZgikWG3NMPEsu0krnJOtETXX7/LpDfd8YnlnZpV93xzjv
	eBBhBGN7+3+hvRDwhxxMYiSXDausHrzvTmiA505NJKntvjcTGsoqHcI+GPAIX1as
	XO0U0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bs396-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d3a12589so149256a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725485; x=1790330285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4kZNrUwWokoKECv3iGlIDrJIK3q6uAjX8lV89l0HjA=;
        b=OEpCzKuzCq4SLIHMn2Np7TYvv2bMM+WtY0VLBUv2P9D7eLnEzLLBaG9D7ZUiGH+j3C
         m2QjA2dImv174K7jEenvy1+yUuq2NEhWKLNInIZt6yK/lix/m3dyQixTJtlDKWdpC2C8
         CrCl8Qd6rTfSHRvX7r2gWeIOT9j1/ue86WRf01Dd20HxrpMSvsD2qi/S9tSub5ddLSgN
         oHbZNDggxdahPqj+oQ+eTzgHDHt4qBLpNFqowkUEcjG4sBr1Hys/l+MDhJb+dUuYiqIu
         u5dqss7k3atonDAa8zNqg6kP20tQMxSdpx6wHMCyLkLFLQdYMKjvEctnHANtMLGSnkjt
         XAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725485; x=1790330285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4kZNrUwWokoKECv3iGlIDrJIK3q6uAjX8lV89l0HjA=;
        b=brCW32J7toxvXiTv1HG17fa1Ws7XNSKAF2iRvl4PnV9JN0tKAqtUZMsydjOeOUuHX2
         ndKY0RUpe8d79ZrOi6Nyf76XaYuCD1f9fO3RHjpA/s5JnKWNzkqvbdjuo86pUt+XDLxP
         JGrgyL6L56hhyQvsMQRRWN4gy3XQNCVdcXQ/n7djA/yCnIvuutRqcJQtNj2ORLoaxGAv
         /+lnfpbn/0LspLBsa9b17dRJDct0UygldSAi5pPqAPI7GG8H4HR8ViK0vWQZFQddSMVP
         DPbbGy+IpsD3V75X/nIDwfkkCR8DEYE8JPxWm49CM3HOe5XCJVli7faacKt7XGyUvTHw
         rjxA==
X-Forwarded-Encrypted: i=1; AKwUvBwYhCLaXlpXyKIV2qtCV8Mn7rj350eAkKhra0fahudVnLhlmEppWup3V2PtL/2VYeBSKsL2XmyWOmUyMu0=@vger.kernel.org
X-Gm-Message-State: AFuF++maLK+qbfUredT9ZuJ9EySls/Dr0BgNqih3T6UqFHbLIeUUm7l3
	J+kIQyAMFNFmtb411OkqwyTQUA8vO1NLBmto/kDhUzeJGVcsRV6aaozNvnjqGKX5pVlTGbpAffv
	Yu3RYk1dOxLVnPf899hqNZc3ISF+kY9E7Rgyjj0PL5widWm1wpfj0HnLuGi74zq3yhBU=
X-Gm-Gg: AYBFou32VrrSv1yBaqEZoGRPkvCcXzp58T51iDKcprVs6rGxGKH9Z6MDWmu7Tvl8dEI
	M6Jnv99y+T/g/5jNQMMSCkpWJjJgQsAgk97rzXpK3GeQuWBgoQ8gktO4NTXuUeu8PZu66VvXzyi
	QDHnKL3kEpsAThfPyrX+fUOXBhzxkrgDehnsL/hSZ+HNf/4RKslL6sWqIqc4AmM7MoQ1fSxDWLG
	mBlCXL/MpvsaJt8uFK09Fl9qnU9SEndGfB+L9C/n7i5yttvuQLwCM9ixa/oFkklPTN49jrtZLJf
	x/1xVXvmvGCS6nRldkp2TjvxVJis7NLpVpXqouGtoej0EQwe5ZCj/jYCCedB0zCkqF4Ot1/JZcO
	ynFIj9rP1NArFfi55Unj8UTA0U5rDpw0=
X-Received: by 2002:a17:90b:28cc:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39e59a2b8d7mr2990137a91.6.1789725484663;
        Fri, 18 Sep 2026 02:58:04 -0700 (PDT)
X-Received: by 2002:a17:90b:28cc:b0:398:bada:832b with SMTP id 98e67ed59e1d1-39e59a2b8d7mr2990057a91.6.1789725484029;
        Fri, 18 Sep 2026 02:58:04 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:03 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v3 1/5] dt-bindings: arm: ras: Introduce ARM RAS error sources
Date: Fri, 18 Sep 2026 15:27:42 +0530
Message-Id: <20260918095746.3347893-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
References: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX0Okwg/Bb5ZuN
 oyG/87/y0U6zJ2SITx7ozcOC9fPArAq7Nr9ZVG/NVOp8h/Ui2t9hB5Gxbh5H+Frw5wKxnamxfMs
 kqZDPIZRxMLD7ldz2ktB0owLwipGgBLjGTde0rQHVldR5qOQsHmBeQ00lVhjJrx6d/Xp55ctOQi
 5/PWI4Nlvty0vAay4MOH7fevedIUSVwlCrvD5WY1ju+QXbyd6TOQf0PH1HAtzcqlZZy6q3kcL6m
 MBDsVkHAIDUwcyBPC7KhmKB7PejiKyZTJq889K8Ux7RTeYv8+RYIOM5ih1cOUBinwujqSsbX5js
 1BGhJlzVG35fpWq3hswdafuadqNoZeMWk3CtV135bYLqNRYxlKBwu5lIgkfi4IJnyFJfjd3VsMp
 FDgVnX3gnhTHTJbPq91SfQfnnKoiDcG4KDl9KJrTTc7+jorAUYLojmDpr0YYaeFtc6DyMKgzRme
 S7Ec7ulGOSycMm81gmw==
X-Proofpoint-GUID: i1vyR8jqjbbOkomJOB--uIKKE15MlwvC
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad0b2d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Lrng1kJLq-4Mmy5ilNsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfXwefY6xXQrSc+
 N8oPApcekiHzWcSWJqABdtIh/qVcABhtSWUeh4PG1cIKxGd8oYirSvD1R4KSdJDsNj70nypogl8
 oJWkHNto0zbtzImQnUeTHz8aQhF7JFI=
X-Proofpoint-ORIG-GUID: i1vyR8jqjbbOkomJOB--uIKKE15MlwvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180137

ARMv8 and later processors implement the RAS (Reliability,
Availability and Serviceability) extensions, exposing hardware
error records through a standardised register interface.

Add Device Tree bindings to describe RAS error sources.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,ras.yaml      | 235 ++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h             |  11 +
 2 files changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,ras.yaml
 create mode 100644 include/dt-bindings/arm/arm,ras.h

diff --git a/Documentation/devicetree/bindings/arm/arm,ras.yaml b/Documentation/devicetree/bindings/arm/arm,ras.yaml
new file mode 100644
index 000000000000..8bff222f77c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,ras.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,ras.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM RAS error source
+
+maintainers:
+  - Umang Chheda <umang.chheda@oss.qualcomm.com>
+
+description: |
+  ARMv8 and later processors implement the Reliability, Availability and
+  Serviceability (RAS) extensions.  Hardware blocks that support RAS expose
+  one or more error records through a standardised register interface.  Each
+  error record captures information about a detected hardware error (cache
+  ECC fault, TLB parity error, interconnect error, etc.) and can optionally
+  signal the OS via an interrupt.
+
+  Each DT node described by this binding represents one RAS error source —
+  a hardware block that exposes a set of error records.  Error records are
+  accessed either through system registers (for processor-local resources
+  such as L1/L2 caches and TLBs) or through a memory-mapped register window
+  (for shared or off-core resources such as L3 caches, SMMUs and GICs).
+
+properties:
+  compatible:
+    description:
+      Identifies the class of hardware block this error source belongs to.
+      arm,ras-processor covers processor error sources (cache, TLB, etc.).
+      arm,ras-smmu covers SMMU error sources.
+      arm,ras-gic covers GIC error sources.
+    enum:
+      - arm,ras-processor
+      - arm,ras-smmu
+      - arm,ras-gic
+
+  reg:
+    description:
+      Register windows for this error source.  When absent the error records
+      are accessed through system registers (ERRSELR_EL1 + ERX*_EL1).
+      When present, each range must have a corresponding entry in reg-names.
+      The primary error-record window is named "err-records"; additional
+      optional windows are named "err-group", "fault-inject", and "irq-config".
+    minItems: 1
+    maxItems: 4
+
+  reg-names:
+    description:
+      Names for the register windows listed in reg. The first entry must be
+      "err-records" for the primary error-record window.
+      err-group is the error group status register window (ERRGSR).
+      fault-inject is the fault injection register window (ERXPFG*).
+      irq-config is the interrupt routing configuration window.
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - err-records
+        - err-group
+        - fault-inject
+        - irq-config
+
+  interrupts:
+    minItems: 1
+    items:
+      - description:
+          Fault Handling Interrupt (FHI), fired when a corrected error
+          counter overflows or a deferred error is detected.
+      - description:
+          Error Recovery Interrupt (ERI), fired when an uncorrected
+          recoverable error is detected.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: fhi
+      - const: eri
+
+  arm,group-format:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Layout of the memory-mapped error-record group window.
+      Determines the number of ERRGSR registers available.
+      A 4 KiB group provides 1 ERRGSR, a 16 KiB group provides
+      4 ERRGSRs, and a 64 KiB group provides 14 ERRGSRs.
+      Each ERRGSR reports status for up to 56 error records.
+    enum: [0, 1, 2]
+
+  arm,num-records:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Total number of error records in this error source, including both
+      implemented and unimplemented slots.
+    minimum: 1
+
+  arm,record-impl:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap of implemented error records.  Bit N set to 1 means error
+      record N is present and active in this error source.  Bit N set to 0
+      means record N is not implemented and must be skipped.  The array
+      length must equal the number of ERRGSRs implied by arm,group-format
+      (1 element for 4K, 4 for 16K, 14 for 64K).  For system-register
+      nodes (no reg property) a single u64 element is used.
+    minItems: 1
+    maxItems: 14
+
+  arm,status-reporting:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap indicating which implemented error records require direct
+      polling of ERX_STATUS by software. Bit N set to 1 means error
+      record N is not represented in an ERRGSR status register and must
+      be checked by reading ERX_STATUS directly. Bit N set to 0 means
+      error record N is represented in an ERRGSR status register and can
+      be discovered through the ERRGSR scan path.
+      For system-register error sources (no reg property), ERRGSR
+      registers are not present. Therefore all implemented error records
+      must be polled directly and arm,status-reporting shall be identical
+      to arm,record-impl.
+      The number of array elements shall match arm,record-impl.
+    minItems: 1
+    maxItems: 14
+
+  arm,addressing-mode:
+    $ref: /schemas/types.yaml#/definitions/uint64-array
+    description:
+      Bitmap indicating the address type reported in ERR_ADDR for each
+      implemented error record.  Bit N set to 1 means error record N
+      reports a Logical Address (LA); bit N set to 0 means it reports a
+      System Physical Address (SPA).  When absent all records are assumed
+      to report SPA.  The number of array elements shall match
+      arm,record-impl.
+    minItems: 1
+    maxItems: 14
+
+  # Processor error source properties (arm,ras-processor only)
+  arm,cache-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the cache node (L1, L2, or L3) that this processor error
+      source monitors.
+
+  # SMMU error source properties (arm,ras-smmu only)
+  arm,smmu-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SMMU node that this error source monitors.
+
+  # GIC error source properties (arm,ras-gic only)
+  arm,gic-ref:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the GIC node that this error source monitors.
+
+required:
+  - compatible
+  - arm,num-records
+  - arm,record-impl
+  - arm,status-reporting
+
+dependentRequired:
+  reg: ['arm,group-format']
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-processor
+    then:
+      required:
+        - arm,cache-ref
+    else:
+      properties:
+        arm,cache-ref: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-smmu
+    then:
+      required:
+        - arm,smmu-ref
+    else:
+      properties:
+        arm,smmu-ref: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: arm,ras-gic
+    then:
+      required:
+        - arm,gic-ref
+    else:
+      properties:
+        arm,gic-ref: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/arm,ras.h>
+
+    cache-error-l2 {
+        compatible = "arm,ras-processor";
+        arm,num-records = <1>;
+        arm,record-impl = /bits/ 64 <0x1>;
+        arm,status-reporting = /bits/ 64 <0x1>;
+        arm,cache-ref = <&l2_0>;
+        interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fhi";
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/arm/arm,ras.h>
+
+    gic-error@17a00000 {
+        compatible = "arm,ras-gic";
+        reg = <0x0 0x17a00000 0x0 0x10000>;
+        reg-names = "err-records";
+        arm,group-format = <ARM_RAS_GROUP_4K>;
+        arm,num-records = <1>;
+        arm,record-impl = /bits/ 64 <0x1>;
+        arm,status-reporting = /bits/ 64 <0x0>;
+        arm,gic-ref = <&gic>;
+        interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "fhi";
+    };
diff --git a/include/dt-bindings/arm/arm,ras.h b/include/dt-bindings/arm/arm,ras.h
new file mode 100644
index 000000000000..cd11e360fdae
--- /dev/null
+++ b/include/dt-bindings/arm/arm,ras.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_ARM_RAS_H
+#define _DT_BINDINGS_ARM_RAS_H
+
+/* arm,group-format - error record group register window layout */
+#define ARM_RAS_GROUP_4K		0	/* 4 KiB,  1 ERRGSR  */
+#define ARM_RAS_GROUP_16K		1	/* 16 KiB, 4 ERRGSRs */
+#define ARM_RAS_GROUP_64K		2	/* 64 KiB, 14 ERRGSRs */
+
+#endif /* _DT_BINDINGS_ARM_RAS_H */
--
2.34.1

