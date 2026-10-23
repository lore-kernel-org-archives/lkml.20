Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.155.65.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725480;
	b=ekGS7cKdnA08kEZoG6KUIDe3FtrEmU7t0azDsB0HhCrPtM/RYlj9olQlHfJw6OPwnRbn
	 z/EP/kobDcVzYyiHDTU++cUvZ/jykYiyA00JI12T/Hoa/rpZcozG4ZC8qQBhB98qla2sD
	 TZWYAFt7sqnkcgXNC6lwa+Rfz7OFW1op/62hvDp7gIWSEOzlFTCQxk4VJbt0h31C2lAc8
	 grLIykUPdCTs0Y7ON6V3P6QkD7tKcJ2SRFtPg8H+y2vTkrmcPOO7ll2j/iZF2RF2GfSsz
	 TkMFaCxPiU5BQLQPAeYUrKR2Gz03VT/vYwIXOFQmyXvtp1G7pRklsUHFSBCykZZuxPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725480;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-SPAM:X-QQ-RECHKSPAM;
	bh=faZ7OPhae0cnA4n3Vnubg+puoq94cIP3kvpouANmSNg=;
	b=hH7HDjLnV0tVrriwN6iIRtHZb0UhQ2H8/cBS1TiiN6YC0lj2iPVVpWR/eFGJoGQK2HS2
	 rOxI++3PrPzrfDfl2bmZ4I4toB8gHPUxAXMfA+kqB8rVidugwgxWFaYEDgrAheze1q+z2
	 Oc73Pu3APVw49Lbejccg3OkyFg0/vROM/C5HLaQ4ZOUkUbNf5J88I3SYIYUa7ifSpaBug
	 ixa+104uTvNUf1X483QYSf+Ak7AOqGRgI1bU7IH1UqDSFuEHho4rtMb3JNVC9v+BLNxR3
	 8f+jU7IHxDOcUGq+FZoGpfmhkdPRqP9wSR0RNEPB8FfKtpMVhoq3WTBJtXzN4nZt8Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WaXDkxod;
	arc=none smtp.remote-ip=43.155.65.254
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936E606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8936E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WaXDkxod
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725397;
	bh=faZ7OPhae0cnA4n3Vnubg+puoq94cIP3kvpouANmSNg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WaXDkxodaEiqL8sAWrJrq86ilEz4yvajk1GSvwe6iQ7wEX1KBhyt7kLOhM+lXFr9K
	 SGj40BGavri2HlQ9hSm/eM3em+xs/EetA2W1tYje1dreJU/Yji9Py4rjiKUDJzyqpw
	 hWrhDvD08OHfjkt6gEE33VDypCsqibIqAO1EdP1Y=
X-QQ-mid: esmtpsz11t1792725393t2e5943da
X-QQ-Originating-IP: vaSnVDp18tSFzmk+YrBsxCVYAX1wYYkUR2abaTEL72I=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15586454989663408673
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/24] perf tools: Add Nexus RISC-V Trace decoder
Date: Fri, 23 Oct 2026 11:15:03 +0800
Message-Id: <20261023031505.2020925-23-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NR7rQfQxodwUkJJZcM6Di0i2yoIsRqW8DorjoYjQrUAroOFp10xiYq0O
	H4u7gAZcyC0d01pumgVAEH8XVZS5OvHpdYFGUWOMKH2Bf5FN+lLtBI3Nchh5F4x/YV89OhS
	wPNahic4cvuUQ+CuXj1Z/XLpHRMLDoaUwvPajSgheUG/kxozWJmKPVbmRRd9sDw5LURlmyE
	LyjMv60brjfxh8E7/qr3cNL0clI2xifEgUu4JpOGsd02nYDlmzc5XsOOra6KXcKrxn08gqe
	CqnYBeRiZfZiOaeUqovFYtG7CYcQR8ED/ZVZiczS80JkdQM2brZHU7DpcLV0LrFNI5EaNF7
	8krqcFdV08rP9xyBeq3BBeZQaEgYO7fE4P9rEaygDooF9Qt6cPfFbWkfSUaQsjidSE5uYrf
	ntm8H3YEF6uUOy4dxWRVMYXA9jNJvOpkdTvaKQA1SKriXXC9KLVl+GeXycasYucZkjLS6c/
	q34/YapLYY5ck+s9/knQ444culuTV7smEUatC8IzMRi86yVbKpJ58FEtg+nE1SCqcfRvNi4
	XXkir2i/5639g/zw//sQQLlmfOW3GzhXeppQaUVR5YHZmE9aBkzpRxZOQ3pCsULTOD6fawi
	0jdjN2qmI7FDU7tiVnnUdMQvucv2SYfXAcuMQsrUOnrYD9ETXToDJAiFCRmrSbXJ75tAKas
	x6EyFzSvO+nRzT4yfc3W1O7qkqspOyhLGdngp5rV9h+unZtnFeoh/6+8b1sbmJFkZr1nCwE
	zGcq8r1ys0dQsbkhUXUiChj70z8dRr+LU+4XjvImXc/tSNzAAZECTCEp+b0RmFXbLjFiK7k
	w7zN8rKNlieW+/sfOcOwJ1RonEIlarmcmyczm8fDDtVBMEjurAPaRhbBnUhZZHl71rZxGKm
	9kvIwb/RQ8LZJ6l2ZGXAdSV8ahIr+VpVRf2dVnFzFB8iTVU/DRjyo//rH906HJ49dm+jdF9
	FPFfz2ug3UFQsaIJCYOIdxVP2Am8CizzmjHAlnFTJEo32Ac5xkWknJ3J5vpnqKCyfF9Jlll
	qGQNcl6eHG7ceQIPxSxpz5dK0dwYmRNgCd571pbpU5UR7Is0cBncJCGcHpzDCSUhhF4RWiM
	q0/QYgbJ8k6hnLbSR5d9tWX1UQ+VrslY1qiPL4s5R0B
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

Add support for RISC-V Nexus Trace decoder based on the reference
implementation from the RISC-V Nexus Trace specification. This includes
a CoreSight frame deformatter to remove the trace formatter overhead.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 tools/arch/riscv/include/asm/insn.h           | 645 +++++++++++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/rvtrace-decoder/Build         |   2 +
 .../util/rvtrace-decoder/rvtrace-decoder.c    | 423 ++++++++
 .../util/rvtrace-decoder/rvtrace-decoder.h    | 122 +++
 .../rvtrace-decoder/rvtrace-ntrace-decoder.c  | 910 ++++++++++++++++++
 .../rvtrace-decoder/rvtrace-ntrace-decoder.h  | 124 +++
 7 files changed, 2227 insertions(+)
 create mode 100644 tools/arch/riscv/include/asm/insn.h
 create mode 100644 tools/perf/util/rvtrace-decoder/Build
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-decoder.h
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.h

diff --git a/tools/arch/riscv/include/asm/insn.h b/tools/arch/riscv/include/asm/insn.h
new file mode 100644
index 000000000000..6c020afe926b
--- /dev/null
+++ b/tools/arch/riscv/include/asm/insn.h
@@ -0,0 +1,645 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef _ASM_RISCV_INSN_H
+#define _ASM_RISCV_INSN_H
+
+#include <linux/bits.h>
+
+#define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
+#define RV_INSN_FUNCT3_OPOFF	12
+#define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
+#define RV_INSN_OPCODE_OPOFF	0
+#define RV_INSN_FUNCT12_OPOFF	20
+
+#define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
+#define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
+
+/* The bit field of immediate value in I-type instruction */
+#define RV_I_IMM_SIGN_OPOFF	31
+#define RV_I_IMM_11_0_OPOFF	20
+#define RV_I_IMM_SIGN_OFF	12
+#define RV_I_IMM_11_0_OFF	0
+#define RV_I_IMM_11_0_MASK	GENMASK(11, 0)
+
+/* The bit field of immediate value in J-type instruction */
+#define RV_J_IMM_SIGN_OPOFF	31
+#define RV_J_IMM_10_1_OPOFF	21
+#define RV_J_IMM_11_OPOFF	20
+#define RV_J_IMM_19_12_OPOFF	12
+#define RV_J_IMM_SIGN_OFF	20
+#define RV_J_IMM_10_1_OFF	1
+#define RV_J_IMM_11_OFF		11
+#define RV_J_IMM_19_12_OFF	12
+#define RV_J_IMM_10_1_MASK	GENMASK(9, 0)
+#define RV_J_IMM_11_MASK	GENMASK(0, 0)
+#define RV_J_IMM_19_12_MASK	GENMASK(7, 0)
+
+/*
+ * U-type IMMs contain the upper 20bits [31:20] of an immediate with
+ * the rest filled in by zeros, so no shifting required. Similarly,
+ * bit31 contains the signed state, so no sign extension necessary.
+ */
+#define RV_U_IMM_SIGN_OPOFF	31
+#define RV_U_IMM_31_12_OPOFF	0
+#define RV_U_IMM_31_12_MASK	GENMASK(31, 12)
+
+/* The bit field of immediate value in B-type instruction */
+#define RV_B_IMM_SIGN_OPOFF	31
+#define RV_B_IMM_10_5_OPOFF	25
+#define RV_B_IMM_4_1_OPOFF	8
+#define RV_B_IMM_11_OPOFF	7
+#define RV_B_IMM_SIGN_OFF	12
+#define RV_B_IMM_10_5_OFF	5
+#define RV_B_IMM_4_1_OFF	1
+#define RV_B_IMM_11_OFF		11
+#define RV_B_IMM_10_5_MASK	GENMASK(5, 0)
+#define RV_B_IMM_4_1_MASK	GENMASK(3, 0)
+#define RV_B_IMM_11_MASK	GENMASK(0, 0)
+
+/* The register offset in RVG instruction */
+#define RVG_RS1_OPOFF		15
+#define RVG_RS2_OPOFF		20
+#define RVG_RD_OPOFF		7
+#define RVG_RS1_MASK		GENMASK(4, 0)
+#define RVG_RS2_MASK		GENMASK(4, 0)
+#define RVG_RD_MASK		GENMASK(4, 0)
+
+/* The bit field of immediate value in RVC J instruction */
+#define RVC_J_IMM_SIGN_OPOFF	12
+#define RVC_J_IMM_4_OPOFF	11
+#define RVC_J_IMM_9_8_OPOFF	9
+#define RVC_J_IMM_10_OPOFF	8
+#define RVC_J_IMM_6_OPOFF	7
+#define RVC_J_IMM_7_OPOFF	6
+#define RVC_J_IMM_3_1_OPOFF	3
+#define RVC_J_IMM_5_OPOFF	2
+#define RVC_J_IMM_SIGN_OFF	11
+#define RVC_J_IMM_4_OFF		4
+#define RVC_J_IMM_9_8_OFF	8
+#define RVC_J_IMM_10_OFF	10
+#define RVC_J_IMM_6_OFF		6
+#define RVC_J_IMM_7_OFF		7
+#define RVC_J_IMM_3_1_OFF	1
+#define RVC_J_IMM_5_OFF		5
+#define RVC_J_IMM_4_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_9_8_MASK	GENMASK(1, 0)
+#define RVC_J_IMM_10_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_6_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_7_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_3_1_MASK	GENMASK(2, 0)
+#define RVC_J_IMM_5_MASK	GENMASK(0, 0)
+
+/* The bit field of immediate value in RVC B instruction */
+#define RVC_B_IMM_SIGN_OPOFF	12
+#define RVC_B_IMM_4_3_OPOFF	10
+#define RVC_B_IMM_7_6_OPOFF	5
+#define RVC_B_IMM_2_1_OPOFF	3
+#define RVC_B_IMM_5_OPOFF	2
+#define RVC_B_IMM_SIGN_OFF	8
+#define RVC_B_IMM_4_3_OFF	3
+#define RVC_B_IMM_7_6_OFF	6
+#define RVC_B_IMM_2_1_OFF	1
+#define RVC_B_IMM_5_OFF		5
+#define RVC_B_IMM_4_3_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_7_6_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_5_MASK	GENMASK(0, 0)
+
+#define RVC_INSN_FUNCT4_MASK	GENMASK(15, 12)
+#define RVC_INSN_FUNCT4_OPOFF	12
+#define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
+#define RVC_INSN_FUNCT3_OPOFF	13
+#define RVC_INSN_J_RS1_MASK	GENMASK(11, 7)
+#define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
+#define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
+#define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
+#define RVC_ENCODE_FUNCT4(f_)	(RVC_FUNCT4_##f_ << RVC_INSN_FUNCT4_OPOFF)
+
+/* The register offset in RVC op=C0 instruction */
+#define RVC_C0_RS1_OPOFF	7
+#define RVC_C0_RS2_OPOFF	2
+#define RVC_C0_RD_OPOFF		2
+
+/* The register offset in RVC op=C1 instruction */
+#define RVC_C1_RS1_OPOFF	7
+#define RVC_C1_RS2_OPOFF	2
+#define RVC_C1_RD_OPOFF		7
+
+/* The register offset in RVC op=C2 instruction */
+#define RVC_C2_RS1_OPOFF	7
+#define RVC_C2_RS2_OPOFF	2
+#define RVC_C2_RD_OPOFF		7
+#define RVC_C2_RS1_MASK		GENMASK(4, 0)
+
+/* parts of opcode for RVG*/
+#define RVG_OPCODE_FENCE	0x0f
+#define RVG_OPCODE_AUIPC	0x17
+#define RVG_OPCODE_BRANCH	0x63
+#define RVG_OPCODE_JALR		0x67
+#define RVG_OPCODE_JAL		0x6f
+#define RVG_OPCODE_SYSTEM	0x73
+#define RVG_SYSTEM_CSR_OFF	20
+#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+
+/* parts of opcode for RVF, RVD and RVQ */
+#define RVFDQ_FL_FS_WIDTH_OFF	12
+#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(2, 0)
+#define RVFDQ_FL_FS_WIDTH_W	2
+#define RVFDQ_FL_FS_WIDTH_D	3
+#define RVFDQ_LS_FS_WIDTH_Q	4
+#define RVFDQ_OPCODE_FL		0x07
+#define RVFDQ_OPCODE_FS		0x27
+
+/* parts of opcode for RVV */
+#define RVV_OPCODE_VECTOR	0x57
+#define RVV_VL_VS_WIDTH_8	0
+#define RVV_VL_VS_WIDTH_16	5
+#define RVV_VL_VS_WIDTH_32	6
+#define RVV_VL_VS_WIDTH_64	7
+#define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
+#define RVV_OPCODE_VS		RVFDQ_OPCODE_FS
+
+/* parts of opcode for RVC*/
+#define RVC_OPCODE_C0		0x0
+#define RVC_OPCODE_C1		0x1
+#define RVC_OPCODE_C2		0x2
+
+/* parts of funct3 code for I, M, A extension*/
+#define RVG_FUNCT3_JALR		0x0
+#define RVG_FUNCT3_BEQ		0x0
+#define RVG_FUNCT3_BNE		0x1
+#define RVG_FUNCT3_BLT		0x4
+#define RVG_FUNCT3_BGE		0x5
+#define RVG_FUNCT3_BLTU		0x6
+#define RVG_FUNCT3_BGEU		0x7
+
+/* parts of funct3 code for C extension*/
+#define RVC_FUNCT3_C_BEQZ	0x6
+#define RVC_FUNCT3_C_BNEZ	0x7
+#define RVC_FUNCT3_C_J		0x5
+#define RVC_FUNCT3_C_JAL	0x1
+#define RVC_FUNCT4_C_JR		0x8
+#define RVC_FUNCT4_C_JALR	0x9
+#define RVC_FUNCT4_C_EBREAK	0x9
+
+#define RVG_FUNCT12_ECALL	0x0
+#define RVG_FUNCT12_EBREAK	0x1
+#define RVG_FUNCT12_SRET	0x102
+#define RVG_FUNCT12_MRET	0x303
+
+#define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
+#define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
+#define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
+#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
+#define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_ECALL		(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_EBREAK	(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_MRET		(RV_ENCODE_FUNCT12(MRET) | RVG_OPCODE_SYSTEM)
+#define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
+#define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
+#define RVC_MATCH_C_EBREAK	(RVC_ENCODE_FUNCT4(C_EBREAK) | RVC_OPCODE_C2)
+
+#define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_FENCE		(RV_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_J		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVG_MASK_BEQ		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BNE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BLT		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_EBREAK	0xffff
+#define RVG_MASK_EBREAK		0xffffffff
+#define RVG_MASK_ECALL		0xffffffff
+#define RVG_MASK_SRET		0xffffffff
+#define RVG_MASK_MRET		0xffffffff
+
+#define __INSN_LENGTH_MASK	_UL(0x3)
+#define __INSN_LENGTH_GE_32	_UL(0x3)
+#define __INSN_OPCODE_MASK	_UL(0x7F)
+#define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
+
+#define __RISCV_INSN_FUNCS(name, mask, val)				\
+static __always_inline bool riscv_insn_is_##name(u32 code)		\
+{									\
+	BUILD_BUG_ON(~(mask) & (val));					\
+	return (code & (mask)) == (val);				\
+}									\
+
+#if __riscv_xlen == 32
+/* C.JAL is an RV32C-only instruction */
+__RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
+#else
+#define riscv_insn_is_c_jal(opcode) 0
+#endif
+__RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
+__RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
+__RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
+__RISCV_INSN_FUNCS(c_j, RVC_MASK_C_J, RVC_MATCH_C_J)
+__RISCV_INSN_FUNCS(beq, RVG_MASK_BEQ, RVG_MATCH_BEQ)
+__RISCV_INSN_FUNCS(bne, RVG_MASK_BNE, RVG_MATCH_BNE)
+__RISCV_INSN_FUNCS(blt, RVG_MASK_BLT, RVG_MATCH_BLT)
+__RISCV_INSN_FUNCS(bge, RVG_MASK_BGE, RVG_MATCH_BGE)
+__RISCV_INSN_FUNCS(bltu, RVG_MASK_BLTU, RVG_MATCH_BLTU)
+__RISCV_INSN_FUNCS(bgeu, RVG_MASK_BGEU, RVG_MATCH_BGEU)
+__RISCV_INSN_FUNCS(c_beqz, RVC_MASK_C_BEQZ, RVC_MATCH_C_BEQZ)
+__RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATCH_C_BNEZ)
+__RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
+__RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
+__RISCV_INSN_FUNCS(ecall, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
+__RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
+__RISCV_INSN_FUNCS(mret, RVG_MASK_MRET, RVG_MATCH_MRET)
+__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+
+/* special case to catch _any_ system instruction */
+static __always_inline bool riscv_insn_is_system(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_SYSTEM;
+}
+
+/* special case to catch _any_ branch instruction */
+static __always_inline bool riscv_insn_is_branch(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_BRANCH;
+}
+
+static __always_inline bool riscv_insn_is_c_jr(u32 code)
+{
+	return (code & RVC_MASK_C_JR) == RVC_MATCH_C_JR &&
+	       (code & RVC_INSN_J_RS1_MASK) != 0;
+}
+
+static __always_inline bool riscv_insn_is_c_jalr(u32 code)
+{
+	return (code & RVC_MASK_C_JALR) == RVC_MATCH_C_JALR &&
+	       (code & RVC_INSN_J_RS1_MASK) != 0;
+}
+
+#define INSN_MATCH_LB		0x3
+#define INSN_MASK_LB		0x707f
+#define INSN_MATCH_LH		0x1003
+#define INSN_MASK_LH		0x707f
+#define INSN_MATCH_LW		0x2003
+#define INSN_MASK_LW		0x707f
+#define INSN_MATCH_LD		0x3003
+#define INSN_MASK_LD		0x707f
+#define INSN_MATCH_LBU		0x4003
+#define INSN_MASK_LBU		0x707f
+#define INSN_MATCH_LHU		0x5003
+#define INSN_MASK_LHU		0x707f
+#define INSN_MATCH_LWU		0x6003
+#define INSN_MASK_LWU		0x707f
+#define INSN_MATCH_SB		0x23
+#define INSN_MASK_SB		0x707f
+#define INSN_MATCH_SH		0x1023
+#define INSN_MASK_SH		0x707f
+#define INSN_MATCH_SW		0x2023
+#define INSN_MASK_SW		0x707f
+#define INSN_MATCH_SD		0x3023
+#define INSN_MASK_SD		0x707f
+
+#define INSN_MATCH_C_LD		0x6000
+#define INSN_MASK_C_LD		0xe003
+#define INSN_MATCH_C_SD		0xe000
+#define INSN_MASK_C_SD		0xe003
+#define INSN_MATCH_C_LW		0x4000
+#define INSN_MASK_C_LW		0xe003
+#define INSN_MATCH_C_SW		0xc000
+#define INSN_MASK_C_SW		0xe003
+#define INSN_MATCH_C_LDSP	0x6002
+#define INSN_MASK_C_LDSP	0xe003
+#define INSN_MATCH_C_SDSP	0xe002
+#define INSN_MASK_C_SDSP	0xe003
+#define INSN_MATCH_C_LWSP	0x4002
+#define INSN_MASK_C_LWSP	0xe003
+#define INSN_MATCH_C_SWSP	0xc002
+#define INSN_MASK_C_SWSP	0xe003
+
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffffff
+#define INSN_MATCH_WFI		0x10500073
+
+#define INSN_MASK_WRS		0xffffffff
+#define INSN_MATCH_WRS		0x00d00073
+
+#define INSN_MATCH_CSRRW	0x1073
+#define INSN_MASK_CSRRW		0x707f
+#define INSN_MATCH_CSRRS	0x2073
+#define INSN_MASK_CSRRS		0x707f
+#define INSN_MATCH_CSRRC	0x3073
+#define INSN_MASK_CSRRC		0x707f
+#define INSN_MATCH_CSRRWI	0x5073
+#define INSN_MASK_CSRRWI	0x707f
+#define INSN_MATCH_CSRRSI	0x6073
+#define INSN_MASK_CSRRSI	0x707f
+#define INSN_MATCH_CSRRCI	0x7073
+#define INSN_MASK_CSRRCI	0x707f
+
+#define INSN_MATCH_FLW		0x2007
+#define INSN_MASK_FLW		0x707f
+#define INSN_MATCH_FLD		0x3007
+#define INSN_MASK_FLD		0x707f
+#define INSN_MATCH_FLQ		0x4007
+#define INSN_MASK_FLQ		0x707f
+#define INSN_MATCH_FSW		0x2027
+#define INSN_MASK_FSW		0x707f
+#define INSN_MATCH_FSD		0x3027
+#define INSN_MASK_FSD		0x707f
+#define INSN_MATCH_FSQ		0x4027
+#define INSN_MASK_FSQ		0x707f
+
+#define INSN_MATCH_C_FLD	0x2000
+#define INSN_MASK_C_FLD		0xe003
+#define INSN_MATCH_C_FLW	0x6000
+#define INSN_MASK_C_FLW		0xe003
+#define INSN_MATCH_C_FSD	0xa000
+#define INSN_MASK_C_FSD		0xe003
+#define INSN_MATCH_C_FSW	0xe000
+#define INSN_MASK_C_FSW		0xe003
+#define INSN_MATCH_C_FLDSP	0x2002
+#define INSN_MASK_C_FLDSP	0xe003
+#define INSN_MATCH_C_FSDSP	0xa002
+#define INSN_MASK_C_FSDSP	0xe003
+#define INSN_MATCH_C_FLWSP	0x6002
+#define INSN_MASK_C_FLWSP	0xe003
+#define INSN_MATCH_C_FSWSP	0xe002
+#define INSN_MASK_C_FSWSP	0xe003
+
+#define INSN_MATCH_C_LHU		0x8400
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
+#define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SH			0x8c00
+#define INSN_MASK_C_SH			0xfc43
+
+#define INSN_16BIT_MASK		0x3
+#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
+#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
+
+#define SHIFT_RIGHT(x, y)		\
+	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
+
+#define REG_MASK			\
+	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
+
+#define REG_OFFSET(insn, pos)		\
+	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
+
+#define REG_PTR(insn, pos, regs)	\
+	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
+
+#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
+#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
+#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
+#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
+#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
+#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
+#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
+#define IMM_I(insn)		((s32)(insn) >> 20)
+#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
+				 (s32)(((insn) >> 7) & 0x1f))
+
+#define SH_RD			7
+#define SH_RS1			15
+#define SH_RS2			20
+#define SH_RS2C			2
+#define MASK_RX			0x1f
+
+#if defined(CONFIG_64BIT)
+#define LOG_REGBYTES		3
+#else
+#define LOG_REGBYTES		2
+#endif
+
+#define MASK_FUNCT3		0x7000
+
+#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
+
+#define RV_IMM_SIGN(x)		(-(((x) >> 31) & 1))
+#define RVC_IMM_SIGN(x)		(-(((x) >> 12) & 1))
+#define RV_X_MASK(X, s, mask)	(((X) >> (s)) & (mask))
+#define RV_X(X, s, n)		RV_X_MASK(X, s, ((1 << (n)) - 1))
+#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
+				 (RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 1) << 6))
+#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 2) << 6))
+#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 2) << 6))
+#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 3) << 6))
+#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
+				 (RV_X(x, 7, 2) << 6))
+#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 7, 3) << 6))
+#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
+#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
+#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
+#define RVC_X(X, s, mask)	RV_X_MASK(X, s, mask)
+
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_INSN_FUNCT3_OPOFF, \
+		   RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT3_OPOFF)); })
+
+#define RV_EXTRACT_RS1_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
+
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
+#define RV_EXTRACT_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
+
+#define RV_EXTRACT_UTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
+
+#define RV_EXTRACT_JTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
+	(RV_X_MASK(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
+	(RV_X_MASK(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
+	(RV_IMM_SIGN(x_) << RV_J_IMM_SIGN_OFF); })
+
+#define RV_EXTRACT_ITYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
+	(RV_IMM_SIGN(x_) << RV_I_IMM_SIGN_OFF); })
+
+#define RV_EXTRACT_BTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
+	(RV_X_MASK(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
+	(RV_X_MASK(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
+	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
+
+#define RVC_EXTRACT_C2_RS1_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
+
+#define RVC_EXTRACT_JTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_J_IMM_3_1_OPOFF, RVC_J_IMM_3_1_MASK) << RVC_J_IMM_3_1_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_4_OPOFF, RVC_J_IMM_4_MASK) << RVC_J_IMM_4_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_5_OPOFF, RVC_J_IMM_5_MASK) << RVC_J_IMM_5_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_6_OPOFF, RVC_J_IMM_6_MASK) << RVC_J_IMM_6_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_7_OPOFF, RVC_J_IMM_7_MASK) << RVC_J_IMM_7_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_9_8_OPOFF, RVC_J_IMM_9_8_MASK) << RVC_J_IMM_9_8_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_10_OPOFF, RVC_J_IMM_10_MASK) << RVC_J_IMM_10_OFF) | \
+	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
+
+#define RVC_EXTRACT_BTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_B_IMM_2_1_OPOFF, RVC_B_IMM_2_1_MASK) << RVC_B_IMM_2_1_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_4_3_OPOFF, RVC_B_IMM_4_3_MASK) << RVC_B_IMM_4_3_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
+	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
+
+#define RVG_EXTRACT_SYSTEM_CSR(x) \
+	({typeof(x) x_ = (x); RV_X_MASK(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+
+#define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
+	({typeof(x) x_ = (x); RV_X_MASK(x_, RVFDQ_FL_FS_WIDTH_OFF, \
+				   RVFDQ_FL_FS_WIDTH_MASK); })
+
+#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
+
+/*
+ * Get the immediate from a J-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
+{
+	return RV_EXTRACT_JTYPE_IMM(insn);
+}
+
+/*
+ * Update a J-type instruction with an immediate value.
+ *
+ * @insn: pointer to the jtype instruction
+ * @imm: the immediate to insert into the instruction
+ */
+static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
+{
+	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
+	*insn &= ~GENMASK(31, 12);
+	*insn |= (RV_X_MASK(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
+		 (RV_X_MASK(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
+		 (RV_X_MASK(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
+		 (RV_X_MASK(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
+}
+
+/*
+ * Put together one immediate from a U-type and I-type instruction pair.
+ *
+ * The U-type contains an upper immediate, meaning bits[31:12] with [11:0]
+ * being zero, while the I-type contains a 12bit immediate.
+ * Combined these can encode larger 32bit values and are used for example
+ * in auipc + jalr pairs to allow larger jumps.
+ *
+ * @utype_insn: instruction containing the upper immediate
+ * @itype_insn: instruction
+ * Return: combined immediate
+ */
+static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32 itype_insn)
+{
+	s32 imm;
+
+	imm = RV_EXTRACT_UTYPE_IMM(utype_insn);
+	imm += RV_EXTRACT_ITYPE_IMM(itype_insn);
+
+	return imm;
+}
+
+/*
+ * Update a set of two instructions (U-type + I-type) with an immediate value.
+ *
+ * Used for example in auipc+jalrs pairs the U-type instructions contains
+ * a 20bit upper immediate representing bits[31:12], while the I-type
+ * instruction contains a 12bit immediate representing bits[11:0].
+ *
+ * This also takes into account that both separate immediates are
+ * considered as signed values, so if the I-type immediate becomes
+ * negative (BIT(11) set) the U-type part gets adjusted.
+ *
+ * @utype_insn: pointer to the utype instruction of the pair
+ * @itype_insn: pointer to the itype instruction of the pair
+ * @imm: the immediate to insert into the two instructions
+ */
+static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype_insn, s32 imm)
+{
+	/* drop possible old IMM values */
+	*utype_insn &= ~(RV_U_IMM_31_12_MASK);
+	*itype_insn &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
+
+	/* add the adapted IMMs */
+	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
+	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
+}
+
+/*
+ * Get the immediate from a B-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_btype_imm(u32 insn)
+{
+	return RV_EXTRACT_BTYPE_IMM(insn);
+}
+
+/*
+ * Get the immediate from a RVC B-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_cbtype_imm(u32 insn)
+{
+	return RVC_EXTRACT_BTYPE_IMM(insn);
+}
+
+/*
+ * Get the immediate from a RVC J-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_cjtype_imm(u16 insn)
+{
+	return RVC_EXTRACT_JTYPE_IMM(insn);
+}
+
+#endif /* _ASM_RISCV_INSN_H */
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index d25140a0d64f..342b4f75457b 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -150,6 +150,7 @@ perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
 perf-util-y += gtrace-decoder.o
+perf-util-y += rvtrace-decoder/
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/rvtrace-decoder/Build b/tools/perf/util/rvtrace-decoder/Build
new file mode 100644
index 000000000000..dc447eec372a
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder/Build
@@ -0,0 +1,2 @@
+perf-util-y += rvtrace-decoder.o
+perf-util-y += rvtrace-ntrace-decoder.o
diff --git a/tools/perf/util/rvtrace-decoder/rvtrace-decoder.c b/tools/perf/util/rvtrace-decoder/rvtrace-decoder.c
new file mode 100644
index 000000000000..e4b54fe8f51a
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder/rvtrace-decoder.c
@@ -0,0 +1,423 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 IAR Systems AB.
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/zalloc.h>
+#include <linux/types.h>
+#include <errno.h>
+#include <api/fs/fs.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "../debug.h"
+#include "../intlist.h"
+#include "rvtrace-decoder.h"
+
+#define BUFFER_SIZE	1024
+
+/*
+ * Shared by the per-source staging buffer used during CoreSight frame
+ * de-formatting and by the contiguous de-formatted output.
+ */
+static int rvtrace_buf_append(struct rvtrace_defmt_buf *b, const void *src, size_t len)
+{
+	if (b->size + len > b->capacity) {
+		size_t new_cap = b->capacity ? b->capacity : BUFFER_SIZE;
+		unsigned char *p;
+
+		while (new_cap < b->size + len)
+			new_cap *= 2;
+
+		p = realloc(b->buf, new_cap);
+		if (!p)
+			return -ENOMEM;
+		b->buf = p;
+		b->capacity = new_cap;
+	}
+	memcpy(b->buf + b->size, src, len);
+	b->size += len;
+	return 0;
+}
+
+static struct rvtrace_defmt_buf *rvtrace_get_buf(struct rvtrace_defmt_buf defmt_bufs[],
+						 unsigned char id)
+{
+	if (defmt_bufs[id].buf != NULL)
+		return &defmt_bufs[id];
+
+	defmt_bufs[id].buf = (unsigned char *)malloc(BUFFER_SIZE);
+	if (!defmt_bufs[id].buf)
+		return NULL;
+
+	defmt_bufs[id].size = 0;
+	defmt_bufs[id].capacity = BUFFER_SIZE;
+
+	return &defmt_bufs[id];
+}
+
+static int rvtrace_defmt_buf_append(struct rvtrace_defmt_buf *defmt_buf,
+				    struct rvtrace_defmt_buf *out, unsigned char data)
+{
+	int err;
+
+	err = rvtrace_buf_append(defmt_buf, &data, 1);
+	if (err)
+		return err;
+
+	/* A Nexus message ends when the MSEO bits of the last byte are '11'. */
+	if ((data & 0x3) == 0x3) {
+		err = rvtrace_buf_append(out, defmt_buf->buf, defmt_buf->size);
+		if (err) {
+			pr_err("Encoder: failed to write nexus data\n");
+			return err;
+		}
+		defmt_buf->size = 0;
+	}
+
+	return 0;
+}
+
+static size_t skip_frame_syncs(const unsigned char *buf, size_t len, size_t *fsync_count)
+{
+	const uint32_t FSYNC_PATTERN = 0x7FFFFFFF;    /* LE host pattern for Frame SYNC */
+	size_t skipped_bytes = 0;
+
+	while (skipped_bytes + 4 <= len) {
+		if (*((uint32_t *)(buf + skipped_bytes)) == FSYNC_PATTERN) {
+			skipped_bytes += 4;
+			(*fsync_count)++;
+		} else {
+			break;
+		}
+	}
+
+	return skipped_bytes;
+}
+
+/* remove coresight formatter frame */
+static int rvtrace_data_defmt(struct rvtrace_defmt_buf defmt_bufs[],
+			      struct rvtrace_defmt_buf *out,
+			      const unsigned char *buf, size_t len)
+{
+	int err;
+	uint8_t flag_bit;
+	unsigned char data = 0;
+	int cur_id = -1, old_id = -1, new_id = -1;
+
+	/* 16 bytes is output by coresight trace formatter */
+	while (len >= 16) {
+		/* some linux drivers (e.g. for perf) will insert FSYNCS to pad or differentiate
+		 * between blocks of aligned data, always in frame aligned complete 16 byte frames.
+		 * we need to skip past these frames, resetting as we go.
+		 */
+		size_t fsync_count = 0;
+		size_t fsync_bytes = skip_frame_syncs(buf, len, &fsync_count);
+
+		if (fsync_bytes > 0) {
+			if (fsync_count % 4 == 0) {
+				cur_id = -1;
+				old_id = -1;
+				new_id = -1;
+			} else {
+				pr_err("Incorrect FSYNC reset pattern\n");
+				return -EINVAL;
+			}
+			buf += fsync_bytes;
+			len -= fsync_bytes;
+			continue;
+		}
+
+		flag_bit = 0x1;
+		for (int i = 0; i < 15; i += 2) {
+			if (buf[i] & 0x1) {
+				/* it's id */
+				old_id = new_id;
+				new_id = buf[i] >> 1; /* get new_id */
+				cur_id = (flag_bit & buf[15]) ? old_id : new_id;
+			} else {
+				/* it's data */
+				data = buf[i] | ((flag_bit & buf[15]) ? 0x1 : 0x0);
+			}
+
+			if (IS_VALID_ID(cur_id)) {
+				struct rvtrace_defmt_buf *defmt_buf =
+					rvtrace_get_buf(defmt_bufs, cur_id);
+
+				if (!defmt_buf)
+					return -ENOMEM;
+
+				/* it's data */
+				if ((buf[i] & 0x1) == 0) {
+					err = rvtrace_defmt_buf_append(defmt_buf, out, data);
+					if (err)
+						return err;
+				}
+
+				/* buf[i+1] is alway data when i != 14 */
+				if (i != 14) {
+					err = rvtrace_defmt_buf_append(defmt_buf, out,
+								       buf[i + 1]);
+					if (err)
+						return err;
+				}
+			}
+
+			if (cur_id != new_id)
+				cur_id = new_id;
+
+			flag_bit <<= 1;
+		}
+		buf += 16;
+		len -= 16;
+	}
+	return 0;
+}
+
+/*
+ * Common processing for both dump and decode: de-format the raw AUX buffer
+ * into a contiguous Nexus byte stream (in memory), then dispatch to the
+ * format specific parser based on 'type'.
+ */
+static int rvtrace_decode(struct rvtrace_decoder *decoder,
+			  enum rvtrace_decode_type type,
+			  const unsigned char *buf, size_t len)
+{
+	int err;
+	const unsigned char *data = buf;
+	size_t size = len;
+	struct rvtrace_defmt_buf out = { 0 };
+
+	if (decoder->coresight_formatted) {
+		err = rvtrace_data_defmt(decoder->defmt_bufs, &out, buf, len);
+		if (err) {
+			pr_err("Encoder: failed to remove coresight formatter frame\n");
+			free(out.buf);
+			return err;
+		}
+		data = out.buf;
+		size = out.size;
+	}
+
+	switch (decoder->format) {
+	case GTRACE_FORMAT_NTRACE:
+		err = rvtrace_ntrace_decode(decoder, type, data, size);
+		break;
+	case GTRACE_FORMAT_ETRACE:
+	default:
+		err = -EINVAL;
+		pr_err("unsupported trace format %d\n", decoder->format);
+		break;
+	}
+
+	free(out.buf);
+	return err;
+}
+
+static int rvtrace_init_packet_buffer(struct rvtrace_packet_buffer *packet_buffer)
+{
+	if (!packet_buffer->packets) {
+		packet_buffer->packets = calloc(BUFFER_SIZE, sizeof(struct rvtrace_packet));
+		if (!packet_buffer->packets)
+			return -ENOMEM;
+	}
+
+	packet_buffer->size = 0;
+	packet_buffer->capacity = BUFFER_SIZE;
+
+	return 0;
+}
+
+static void rvtrace_free_packet_buffer(struct rvtrace_packet_buffer *packet_buffer)
+{
+	free(packet_buffer->packets);
+}
+
+int rvtrace_packet_buffer_append(struct rvtrace_packet_buffer *packet_buffer,
+				 struct rvtrace_packet packet)
+{
+	if (packet_buffer->size == packet_buffer->capacity) {
+		packet_buffer->capacity *= 2;
+		packet_buffer->packets = realloc(packet_buffer->packets,
+			sizeof(struct rvtrace_packet) * packet_buffer->capacity);
+		if (!packet_buffer->packets)
+			return -ENOMEM;
+	}
+	packet_buffer->packets[packet_buffer->size++] = packet;
+
+	return 0;
+}
+
+int rvtrace_init_stack(struct rvtrace_stack *stack)
+{
+	if (!stack->data) {
+		stack->data = (u64 *)malloc(sizeof(u64) * BUFFER_SIZE);
+		if (!stack->data)
+			return -ENOMEM;
+	}
+
+	stack->top = -1;
+	stack->capacity = BUFFER_SIZE;
+
+	return 0;
+}
+
+int rvtrace_stack_push(struct rvtrace_stack *stack, u64 value)
+{
+	if (stack->top == stack->capacity - 1) {
+		stack->capacity *= 2;
+		stack->data = (u64 *)realloc(stack->data, sizeof(u64) * stack->capacity);
+		if (!stack->data)
+			return -ENOMEM;
+	}
+	stack->data[++stack->top] = value;
+
+	return 0;
+}
+
+int rvtrace_stack_pop(struct rvtrace_stack *stack)
+{
+	u64 value;
+
+	if (stack->top == -1)
+		return 1;   /* Empty */
+
+	value = stack->data[stack->top--];
+	return value;
+}
+
+static void rvtrace_free_stack(struct rvtrace_stack *stack)
+{
+	free(stack->data);
+}
+
+struct rvtrace_src_context *rvtrace_get_src_context(struct rvtrace_decoder *decoder, int srcid)
+{
+	struct int_node *node;
+	struct rvtrace_src_context *ctx;
+
+	node = intlist__find(decoder->src_contexts, srcid);
+	if (node)
+		return (struct rvtrace_src_context *)node->priv;
+
+	ctx = zalloc(sizeof(struct rvtrace_src_context));
+	if (!ctx)
+		return NULL;
+
+	ctx->srcid = srcid;
+	ctx->nexdeco_pc = 1;
+	ctx->nexdeco_lastaddr = 1;
+	ctx->prv = 0;
+	ctx->v = 0;
+	ctx->timestamp = 0;
+	ctx->context = -1;
+	ctx->resourcefull_icnt = 0;
+
+	if (rvtrace_init_stack(&ctx->stack)) {
+		free(ctx);
+		return NULL;
+	}
+
+	/* Add to RB Tree */
+	node = intlist__findnew(decoder->src_contexts, srcid);
+	if (!node) {
+		rvtrace_free_stack(&ctx->stack);
+		free(ctx);
+		return NULL;
+	}
+
+	node->priv = ctx;
+
+	return ctx;
+}
+
+static void rvtrace_free_src_contexts(struct intlist *src_contexts)
+{
+	struct int_node *node;
+
+	intlist__for_each_entry(node, src_contexts) {
+		struct rvtrace_src_context *ctx = (struct rvtrace_src_context *)node->priv;
+
+		rvtrace_free_stack(&ctx->stack);
+		free(ctx);
+	}
+	intlist__delete(src_contexts);
+}
+
+struct rvtrace_decoder *rvtrace_decoder_new(struct rvtrace_decoder_params *params)
+{
+	int err;
+	struct rvtrace_decoder *decoder;
+
+	if (!params)
+		return NULL;
+
+	decoder = zalloc(sizeof(struct rvtrace_decoder));
+	if (!decoder)
+		return NULL;
+
+	decoder->data = params->data;
+	decoder->coresight_formatted = params->coresight_formatted;
+	decoder->format = params->format;
+	decoder->srcbits = params->srcbits;
+	decoder->mem_access = params->mem_access;
+	decoder->decode = rvtrace_decode;
+	decoder->current_src = -1;
+	decoder->src_contexts = intlist__new(NULL);
+	if (!decoder->src_contexts)
+		goto err_out_free_decoder;
+
+	err = rvtrace_init_packet_buffer(&decoder->packet_buffer);
+	if (err)
+		goto err_out_free_context;
+
+	return decoder;
+
+err_out_free_context:
+	rvtrace_free_src_contexts(decoder->src_contexts);
+err_out_free_decoder:
+	zfree(&decoder);
+	return NULL;
+}
+
+void rvtrace_decoder_free(struct rvtrace_decoder *decoder)
+{
+	for (int i = 0; i < MAX_ID; ++i)
+		free(decoder->defmt_bufs[i].buf);
+
+	rvtrace_free_packet_buffer(&decoder->packet_buffer);
+	rvtrace_free_src_contexts(decoder->src_contexts);
+	zfree(&decoder);
+}
+
+int rvtrace_decoder_reset(struct rvtrace_decoder *decoder)
+{
+	int err;
+	struct int_node *node;
+	struct rvtrace_src_context *ctx;
+
+	if (decoder->src_contexts) {
+		intlist__for_each_entry(node, decoder->src_contexts) {
+			ctx = (struct rvtrace_src_context *)node->priv;
+			ctx->nexdeco_pc = 1;
+			ctx->nexdeco_lastaddr = 1;
+			ctx->prv = 0;
+			ctx->v = 0;
+			ctx->timestamp = 0;
+			ctx->context = -1;
+			ctx->resourcefull_icnt = 0;
+			rvtrace_init_stack(&ctx->stack);
+		}
+	}
+	decoder->current_src_ctx = NULL;
+	decoder->current_src = -1;
+
+	err = rvtrace_init_packet_buffer(&decoder->packet_buffer);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/tools/perf/util/rvtrace-decoder/rvtrace-decoder.h b/tools/perf/util/rvtrace-decoder/rvtrace-decoder.h
new file mode 100644
index 000000000000..27c27d5fc3b8
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder/rvtrace-decoder.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#ifndef INCLUDE__RVTRACE_DECODER_H__
+#define INCLUDE__RVTRACE_DECODER_H__
+
+#include "../gtrace.h"
+#include "rvtrace-ntrace-decoder.h"
+
+#define MAX_ID        112
+
+/* check an ID is in the valid range */
+#define IS_VALID_ID(id)	    \
+	((id > 0) && (id < MAX_ID))
+
+struct rvtrace_defmt_buf {
+	unsigned char *buf;
+	size_t size;
+	size_t capacity;
+};
+
+struct rvtrace_stack {
+	u64 *data;
+	int top;
+	int capacity;
+};
+
+enum rvtrace_sample_type {
+	RVTRACE_EMPTY,
+	RVTRACE_RANGE,
+	RVTRACE_LOSS,
+	RVTRACE_ERROR,
+};
+
+enum riscv_privilege_mode {
+	RISCV_PRIV_USER_MODE,
+	RISCV_PRIV_SUPERVISOR_MODE,
+	RISCV_PRIV_MACHINE_MODE = 3,
+};
+
+typedef u32 (*rvtrace_mem_access_type)(void *, u64, enum riscv_privilege_mode,
+				       int, size_t, u8 *);
+
+struct rvtrace_packet {
+	enum rvtrace_sample_type sample_type;
+	u64 start_addr;
+	u64 end_addr;
+	u32 insn_cnt;
+	int cpu;
+	enum riscv_privilege_mode prv;
+	bool v;
+	int context;
+	u64 timestamp;
+};
+
+struct rvtrace_packet_buffer {
+	struct rvtrace_packet *packets;
+	int size;
+	int capacity;
+};
+
+struct rvtrace_src_context {
+	int srcid;
+	u64 nexdeco_pc;
+	u64 nexdeco_lastaddr;
+	u64 current_pc;
+	u64 timestamp;
+	enum riscv_privilege_mode prv;
+	bool v;
+	int context;
+	int resourcefull_icnt;
+	struct rvtrace_stack stack;
+};
+
+struct rvtrace_decoder_params {
+	void *data;
+	bool coresight_formatted;
+	enum gtrace_format format;
+	u32 srcbits;
+	rvtrace_mem_access_type mem_access;
+};
+
+/* What the decoder should do with the de-formatted trace stream. */
+enum rvtrace_decode_type {
+	RVTRACE_DECODE_MSG,	/* print the Nexus messages */
+	RVTRACE_DECODE_INSN,	/* reconstruct instruction trace packets */
+};
+
+struct rvtrace_decoder {
+	void *data;
+	bool coresight_formatted;
+	enum gtrace_format format;
+	u32 srcbits;
+	rvtrace_mem_access_type mem_access;
+	int (*decode)(struct rvtrace_decoder *decoder, enum rvtrace_decode_type type,
+		      const unsigned char *buf, size_t size);
+	struct rvtrace_defmt_buf defmt_bufs[MAX_ID];
+	int current_src;
+	struct intlist *src_contexts;
+	struct rvtrace_src_context *current_src_ctx;
+	struct rvtrace_packet_buffer packet_buffer;
+	struct rvtrace_ntrace_msg msg;		/* most recently parsed message */
+	struct rvtrace_ntrace_msg saved_msg;	/* previous message, for RepeatBranch replay */
+};
+
+int rvtrace_packet_buffer_append(struct rvtrace_packet_buffer *packet_buffer,
+				 struct rvtrace_packet packet);
+int rvtrace_init_stack(struct rvtrace_stack *stack);
+int rvtrace_stack_push(struct rvtrace_stack *stack, u64 value);
+int rvtrace_stack_pop(struct rvtrace_stack *stack);
+struct rvtrace_src_context *
+rvtrace_get_src_context(struct rvtrace_decoder *decoder, int srcid);
+struct rvtrace_decoder *rvtrace_decoder_new(struct rvtrace_decoder_params *params);
+void rvtrace_decoder_free(struct rvtrace_decoder *decoder);
+int rvtrace_decoder_reset(struct rvtrace_decoder *decoder);
+
+int rvtrace_ntrace_decode(struct rvtrace_decoder *decoder, enum rvtrace_decode_type type,
+			  const unsigned char *buf, size_t size);
+
+#endif
diff --git a/tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.c b/tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.c
new file mode 100644
index 000000000000..f72e5baa323e
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.c
@@ -0,0 +1,910 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 IAR Systems AB.
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/zalloc.h>
+#include <linux/types.h>
+#include <errno.h>
+#include <api/fs/fs.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "../debug.h"
+#include "../color.h"
+#include "../intlist.h"
+#include "rvtrace-decoder.h"
+#include "rvtrace-ntrace-decoder.h"
+#include "../../../arch/riscv/include/asm/insn.h"
+
+#define RV_REGNO_ZERO   0
+#define RV_REGNO_RA	1
+
+/* Definition of Nexus Messages (subset applicable to RISC-V PC trace). */
+const struct rvtrace_ntrace_msg_field_def rvtrace_ntrace_msg_defs[] = {
+	NEXM_BEG(Ownership),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(FORMAT),
+	  NEXM_FLD(PRV),
+	  NEXM_FLD(V),
+	  NEXM_VAR(CONTEXT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(DirectBranch),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_VAR(ICNT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranch),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(UADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(Error),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(ETYPE),
+	  NEXM_VAR(PAD),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(ProgTraceSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(DirectBranchSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranchSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(ResourceFull),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(RCODE),
+	  NEXM_VAR(RDATA),
+	  NEXM_VAR(HREPEAT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranchHist),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(UADDR),
+	  NEXM_VAR(HIST),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranchHistSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(HIST),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(RepeatBranch),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_VAR(BCNT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(ProgTraceCorrelation),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(EVCODE),
+	  NEXM_FLD(CDF),
+	  NEXM_VAR(ICNT),
+	  NEXM_VAR(HIST),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	{ NULL, 0 } /* end marker */
+};
+
+/*
+ * Look up the rvtrace_ntrace_msg_defs entry index of a message header whose low 8 bits
+ * match 'tcode'.  Returns the index, or -1 if the TCODE is not defined.
+ */
+static int rvtrace_ntrace_find_tcode(unsigned int tcode)
+{
+	for (int d = 0; rvtrace_ntrace_msg_defs[d].def != 0; d++) {
+		if ((rvtrace_ntrace_msg_defs[d].def & NEXM_DEF_MSG) == 0)
+			continue;
+		if ((rvtrace_ntrace_msg_defs[d].def & 0xff) == tcode)
+			return d;
+	}
+	return -1;
+}
+
+/*
+ * Return the bit width of the fixed-size field at rvtrace_ntrace_msg_defs[def]. Fields
+ * marked NEXM_DEF_PARAM take their width from the decoder's srcbits.
+ */
+static int rvtrace_ntrace_field_size(struct rvtrace_decoder *decoder, int def)
+{
+	int size = rvtrace_ntrace_msg_defs[def].def & 0xff;
+
+	if (rvtrace_ntrace_msg_defs[def].def & NEXM_DEF_PARAM)
+		size = decoder->srcbits;
+	return size;
+}
+
+/*
+ * Feed the byte stream one byte at a time. The parser accumulates
+ * MDO/MSEO bits into 'msg' and returns:
+ *
+ *   1   a complete message has been parsed into *msg
+ *   0   more bytes are needed (or an idle/partial byte was consumed)
+ */
+static int rvtrace_ntrace_msg_parse(struct rvtrace_decoder *decoder,
+				    struct rvtrace_ntrace_msg_parser *p,
+				    struct rvtrace_ntrace_msg *msg,
+				    unsigned char byte, unsigned char prev_byte)
+{
+	unsigned int mdo = byte >> 2;
+	unsigned int mseo = byte & 0x3;
+
+	pr_debug3("0x%02x ", byte);
+	for (int b = 0x80; b != 0; b >>= 1) {
+		if (b == 0x2)
+			pr_debug3("_");
+		pr_debug3("%d", !!(byte & b));
+	}
+	pr_debug3("\n");
+
+	if (p->resync) {
+		if ((prev_byte & 0x3) == 0x3) { /* MSEO==3: message end */
+			p->resync = false;
+			p->field_def = -1;
+			p->field_bits = 0;
+			p->field_val = 0;
+		}
+		return 0;
+	}
+
+	/* Skip long runs of idle bytes (0xFF). */
+	if (byte == 0xFF && prev_byte == 0xFF)
+		return 0;
+
+	if (mseo == 0x2) {
+		pr_err("ERROR: MSEO='10' is not allowed\n");
+		p->resync = true;
+		return 0;
+	}
+
+	/* Message header: the first byte's MDO is the TCODE. */
+	if (p->field_def < 0) {
+		if (mseo == 0x3)
+			return 0;   /* skip idle */
+
+		if (mseo != 0x0) {
+			pr_err("ERROR: Message must start from MSEO='00'\n");
+			p->resync = true;
+			return 0;
+		}
+
+		p->field_def = rvtrace_ntrace_find_tcode(mdo);
+		if (p->field_def < 0) {
+			pr_err("ERROR: Message with TCODE=%d is not defined for RISC-V\n", mdo);
+			p->resync = true;
+			return 0;
+		}
+
+		msg->field_pos = p->field_def;
+		msg->tcode = mdo;
+		msg->nfields = 0;
+		msg->fields[msg->nfields++] = mdo;
+
+		p->field_def++;
+		p->field_bits = 0;
+		p->field_val = 0;
+		return 0;
+	}
+
+	/* Accumulate this byte's MDO into the current field value. */
+	p->field_val |= (u64)mdo << p->field_bits;
+	p->field_bits += 6;
+
+	/* Emit as many complete fixed-size fields as we now have bits for. */
+	while ((rvtrace_ntrace_msg_defs[p->field_def].def & NEXM_DEF_FLD) &&
+	       p->field_bits >= rvtrace_ntrace_field_size(decoder, p->field_def)) {
+		int width = rvtrace_ntrace_field_size(decoder, p->field_def);
+
+		msg->fields[msg->nfields++] = p->field_val & ((1ULL << width) - 1);
+		p->field_def++;
+		p->field_val >>= width;
+		p->field_bits -= width;
+	}
+
+	if (mseo == 0x0)
+		return 0;
+
+	if (rvtrace_ntrace_msg_defs[p->field_def].def & NEXM_DEF_VAR) {
+		/* Variable-size field: the whole remaining value. */
+		msg->fields[msg->nfields++] = p->field_val;
+
+		if (rvtrace_ntrace_msg_defs[p->field_def].def & NEXM_DEF_ADR)
+			msg->addr_bits = p->field_bits;
+
+		if (mseo == 3) {
+			p->field_def = -1;
+			p->field_bits = 0;
+			p->field_val = 0;
+			return 1;	/* complete message */
+		}
+		p->field_def++;
+		p->field_bits = 0;
+		p->field_val = 0;
+		return 0;
+	}
+
+	if (p->field_bits > 0) {
+		pr_err("Decode: Not enough bits for non-variable field\n");
+		p->resync = true;
+	}
+	return 0;
+}
+
+static int rvtrace_ntrace_msg_sprint(char *buf, size_t size,
+				     struct rvtrace_ntrace_msg *msg, int msgs, int bytes)
+{
+	int len;
+
+	len = snprintf(buf, size, "MSG #%d +%d - %s TCODE[6]=%d",
+		       msgs, bytes,
+		       rvtrace_ntrace_msg_defs[msg->field_pos].name, msg->tcode);
+
+	for (int i = 1; i < (int)msg->nfields && len < (int)size; i++)
+		len += snprintf(buf + len, size - len, " %s=0x%llx",
+				rvtrace_ntrace_msg_defs[msg->field_pos + i].name,
+				(unsigned long long)msg->fields[i]);
+
+	return len;
+}
+
+static int handle_error_msg(struct rvtrace_src_context *ctx, const char *err)
+{
+	pr_err("\nERROR: %s\n", err);
+	ctx->nexdeco_pc = 1; /* 1 means, that last address is unknown */
+	rvtrace_init_stack(&ctx->stack);
+	return -EINVAL;
+}
+
+static int rvtrace_ntrace_insn_info_get(struct rvtrace_decoder *decoder, u8 *info, u64 *dest)
+{
+	u32 insn;
+	struct rvtrace_src_context *ctx = decoder->current_src_ctx;
+	u64 addr = ctx->nexdeco_pc;
+
+	if (!decoder->mem_access(decoder->data, addr, ctx->prv, ctx->context,
+				 sizeof(insn), (u8 *)&insn))
+		return -EINVAL;
+
+	*info = INFO_LINEAR;
+	if ((insn & (__INSN_LENGTH_MASK)) != (__INSN_LENGTH_GE_32)) {
+		if (riscv_insn_is_c_beqz(insn) || riscv_insn_is_c_bnez(insn)) {
+			*info = INFO_BRANCH;
+			*dest = addr + riscv_insn_extract_cbtype_imm(insn);
+		} else if (riscv_insn_is_c_j(insn)) {
+			/* c.j offset */
+			*info = INFO_JUMP;
+			*dest = addr + riscv_insn_extract_cjtype_imm(insn);
+		} else if (riscv_insn_is_c_jr(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT;
+			/* ret => c.jr x1 */
+			if (RVC_EXTRACT_C2_RS1_REG(insn) == RV_REGNO_RA)
+				*info |= INFO_RET;
+		} else if (riscv_insn_is_c_jalr(insn)) {
+			*info = INFO_JUMP | INFO_CALL | INFO_INDIRECT;
+		} else {
+			*info = INFO_LINEAR;
+		}
+	} else {
+		if (riscv_insn_is_branch(insn)) {
+			*info = INFO_BRANCH;
+			*dest = addr + riscv_insn_extract_btype_imm(insn);
+		} else if (riscv_insn_is_jalr(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT;
+			if (RV_EXTRACT_RD_REG(insn) == RV_REGNO_ZERO
+					&& riscv_insn_extract_jtype_imm(insn) == 0) {
+				/* ret => jalr x0,x1,0 */
+				if (RV_EXTRACT_RS1_REG(insn) == RV_REGNO_RA)
+					*info |= INFO_RET;
+				else
+				/* jr rs1 => jalr x0,rs1,0 */
+					*info |= INFO_CALL;
+			}
+		} else if (riscv_insn_is_jal(insn)) {
+			*info = INFO_JUMP;
+			/* j offset => jal x0,offset */
+			if (RV_EXTRACT_RD_REG(insn) != RV_REGNO_ZERO)
+				*info |= INFO_CALL;
+			*dest = addr + riscv_insn_extract_jtype_imm(insn);
+		} else if (riscv_insn_is_sret(insn) || riscv_insn_is_mret(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT | INFO_RET;
+		} else if (riscv_insn_is_ecall(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT | INFO_CALL;
+		} else {
+			*info = INFO_LINEAR;
+		}
+		*info |= INFO_4;
+	}
+
+	pr_debug2(".nexdeco_pc=0x%lx .insn=0x%0*x\n", addr,
+		  (*info & INFO_4) ? 8 : 4,
+		  (*info & INFO_4) ? insn : (u16)insn);
+	return 0;
+}
+
+static int rvtrace_ntrace_emit_icnt(struct rvtrace_decoder *decoder, int n, u32 hist)
+{
+	u64 a = 0;
+	u32 hist_mask;
+	u8 info;
+	int done_icnt = 0; /* Number of done instruction count */
+	struct rvtrace_src_context *ctx = decoder->current_src_ctx;
+
+	if (ctx->nexdeco_pc & 1)
+		return 0;  /* Not synchronized ... */
+
+	pr_debug2(".PC=0x%lX, EmitICNT(n=%d,hist=0x%x)\n", ctx->nexdeco_pc, n, hist);
+
+	/*
+	 * Adjust ICNT by what was handled by ResourceFull message[s]
+	 * before this message (message with normal ICNT field).
+	 * NOTE: ctx->resourcefull_icnt maybe positive or negative!
+	 */
+	if (n >= 0 && ctx->resourcefull_icnt != 0) {
+		n += ctx->resourcefull_icnt;
+		if (n < 0)
+			return handle_error_msg(ctx, "ICNT adjustment ERROR");
+
+		ctx->resourcefull_icnt = 0;    /* Make adjustment 'consumed' */
+	}
+
+	hist_mask = 0;  /* MSB is first in history, so we need sliding mask */
+	if (hist != 0) {
+		if (hist & (1 << (sizeof(u32) * 8 - 1))) {
+			hist_mask = (1 << (sizeof(u32) * 8 - 2));
+		} else {
+			hist_mask = 0x1;
+			while (hist_mask <= hist)
+				hist_mask <<= 1;
+			hist_mask >>= 2;
+		}
+	}
+
+	while (n != 0) {
+		ctx->current_pc = ctx->nexdeco_pc;
+		if (rvtrace_ntrace_insn_info_get(decoder, &info, &a))
+			return handle_error_msg(ctx, "failed to get insn info");
+
+		if (n > 0) {
+			n -= (info & INFO_4) ? 2 : 1;
+			if (n < 0)
+				return handle_error_msg(ctx, "ICNT too small");
+			done_icnt += 1;
+		}
+
+		if (info & INFO_CALL) {
+			u64 ret = ctx->nexdeco_pc + ((info & INFO_4) ? 4 : 2);
+
+			if (rvtrace_stack_push(&ctx->stack, ret))
+				return handle_error_msg(ctx, "failed to push value to stack");
+		}
+
+		if (info & INFO_INDIRECT) { /* Cannot continue over indirect... */
+			if (info & INFO_RET) {
+				u64 ret = rvtrace_stack_pop(&ctx->stack);
+
+				ctx->nexdeco_pc = ret;
+				if (n != 0) {
+					if (ret == 1)
+						return handle_error_msg(ctx,
+							"Not enough entries on callstack");
+					continue;
+				}
+			}
+
+			if (n > 0)
+				return handle_error_msg(ctx,
+							"indirect address encountered in ICNT");
+
+			break;
+		}
+
+		if (info & INFO_BRANCH) {
+			if (hist == 0) {
+				/* This is calling as DirectBranch */
+				if (n == 0)
+					info |= INFO_JUMP;  /* Force PC change below */
+			} else {
+				if (hist_mask & hist)
+					info |= INFO_JUMP;  /* Force PC change below */
+				hist_mask >>= 1;
+				if (hist_mask == 0 && n < 0)
+					n = 0;
+			}
+		}
+
+		if (info & INFO_JUMP)
+			ctx->nexdeco_pc = a;   /* Direct jump/call/branch */
+		else if (info & INFO_4)
+			ctx->nexdeco_pc += 4;
+		else
+			ctx->nexdeco_pc += 2;
+
+	}
+
+	return done_icnt;
+}
+
+static u64 rvtrace_ntrace_field_get(struct rvtrace_decoder *decoder, const char *name)
+{
+	struct rvtrace_ntrace_msg *msg = &decoder->msg;
+
+	for (int d = msg->field_pos; rvtrace_ntrace_msg_defs[d].def != 1; d++) {
+		if (strcmp(rvtrace_ntrace_msg_defs[d].name, name) == 0) {
+			int fi = d - msg->field_pos;
+
+			if (fi < (int)msg->nfields)
+				return msg->fields[fi];
+			return 0;
+		}
+	}
+	return 0;
+}
+
+#define NEX_FLDGET(n) rvtrace_ntrace_field_get(decoder, #n)
+
+/*
+ * Switch the active source context to 'new_src', allocating it on first use.
+ * Returns 0 on success, negative on error.
+ */
+static int rvtrace_ntrace_switch_src(struct rvtrace_decoder *decoder, int new_src)
+{
+	if (new_src == decoder->current_src)
+		return 0;
+
+	decoder->current_src_ctx = rvtrace_get_src_context(decoder, new_src);
+	if (!decoder->current_src_ctx)
+		return -ENOMEM;
+
+	decoder->current_src = new_src;
+	return 0;
+}
+
+/*
+ * Fill 'packet' from the active source context and append it to the decoder's
+ * packet buffer.  'ret' is the instruction count produced by emit_icnt.
+ */
+static int rvtrace_ntrace_emit_packet(struct rvtrace_decoder *decoder, int tcode,
+				u64 start_addr, int ret, int src)
+{
+	struct rvtrace_packet packet;
+
+	if (ret >= 0) {
+		packet.sample_type = (tcode == NEXUS_TCODE_Error) ?
+					RVTRACE_LOSS :
+					(ret ? RVTRACE_RANGE : RVTRACE_EMPTY);
+		packet.start_addr = start_addr;
+		packet.end_addr = decoder->current_src_ctx->current_pc;
+		packet.insn_cnt = ret;
+		packet.cpu = src;
+		packet.prv = decoder->current_src_ctx->prv;
+		packet.v = decoder->current_src_ctx->v;
+		packet.context = decoder->current_src_ctx->context;
+		packet.timestamp = decoder->current_src_ctx->timestamp;
+	} else {
+		packet.sample_type = RVTRACE_ERROR;
+	}
+
+	return rvtrace_packet_buffer_append(&decoder->packet_buffer, packet);
+}
+
+/* Reconstruct an address from the transmitted F-ADDR/U-ADDR field */
+static u64 rvtrace_ntrace_calculate_addr(struct rvtrace_decoder *decoder,
+				   u64 fu_addr, int full, u64 prev_addr)
+{
+	u32 bits = decoder->msg.addr_bits;
+
+	fu_addr <<= 1; /* LSB bit is never sent */
+
+	/*
+	 * After shifting the LSB back in, the most significant transmitted bit
+	 * sits at position 'bits'.  Extend it (0 or 1) all the way to bit 63.
+	 * This is sign-extension in effect, but the spec notes it is NOT a sign
+	 * bit -- it is simply the value of the skipped identical bits.
+	 */
+	if (bits && bits < 64 && (fu_addr & (1ULL << bits)))
+		fu_addr |= ~0ULL << bits;
+
+	/* Update (NEW or XOR) */
+	if (!full) {
+		if (prev_addr & 1) /* Not Sync */
+			fu_addr = prev_addr;
+		else
+			fu_addr ^= prev_addr;
+	}
+	return fu_addr;
+}
+
+/*
+ * Per-message handler result.  Each handler fills these and the dispatcher
+ * emits a single packet from them.
+ */
+struct rvtrace_ntrace_result {
+	int icnt;	/* instruction count from emit_icnt() */
+	u64 start_addr;
+	int src;
+};
+
+/* Common prologue: switch to the message's source context. */
+static int rvtrace_ntrace_handler_prologue(struct rvtrace_decoder *decoder,
+				     struct rvtrace_ntrace_result *res)
+{
+	res->src = NEX_FLDGET(SRC);
+	return rvtrace_ntrace_switch_src(decoder, res->src);
+}
+
+/*
+ * Common F-ADDR/U-ADDR handling: reconstruct the address and make it the
+ * current PC.  'full' selects full (sync) vs XOR (compressed) update.
+ */
+static void rvtrace_ntrace_update_addr(struct rvtrace_decoder *decoder, u64 addr, int full)
+{
+	struct rvtrace_src_context *ctx = decoder->current_src_ctx;
+
+	ctx->nexdeco_lastaddr = rvtrace_ntrace_calculate_addr(decoder, addr, full,
+							ctx->nexdeco_lastaddr);
+	pr_debug2(".nexdeco_lastaddr=0x%lx\n", ctx->nexdeco_lastaddr);
+	ctx->nexdeco_pc = ctx->nexdeco_lastaddr;
+}
+
+static int rvtrace_ntrace_handle_ownership(struct rvtrace_decoder *decoder,
+				     struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	decoder->current_src_ctx->prv = NEX_FLDGET(PRV);
+	decoder->current_src_ctx->v = NEX_FLDGET(V);
+	if (NEX_FLDGET(FORMAT) && NEX_FLDGET(CONTEXT))
+		decoder->current_src_ctx->context = NEX_FLDGET(CONTEXT);
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_direct_branch(struct rvtrace_decoder *decoder,
+					 struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), 0x0);
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_indirect_branch(struct rvtrace_decoder *decoder,
+					   struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), 0x0);
+
+	rvtrace_ntrace_update_addr(decoder, NEX_FLDGET(UADDR), 0);
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_prog_trace_sync(struct rvtrace_decoder *decoder,
+					   struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), 0x0);
+
+	rvtrace_ntrace_update_addr(decoder, NEX_FLDGET(FADDR), 1);
+	decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_direct_branch_sync(struct rvtrace_decoder *decoder,
+					      struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), 0x0);
+
+	rvtrace_ntrace_update_addr(decoder, NEX_FLDGET(FADDR), 1);
+	decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_indirect_branch_sync(struct rvtrace_decoder *decoder,
+						struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), 0x0);
+
+	rvtrace_ntrace_update_addr(decoder, NEX_FLDGET(FADDR), 1);
+	decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_indirect_branch_hist(struct rvtrace_decoder *decoder,
+						struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), NEX_FLDGET(HIST));
+
+	rvtrace_ntrace_update_addr(decoder, NEX_FLDGET(UADDR), 0);
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_indirect_branch_hist_sync(struct rvtrace_decoder *decoder,
+						     struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), NEX_FLDGET(HIST));
+
+	rvtrace_ntrace_update_addr(decoder, NEX_FLDGET(FADDR), 1);
+	decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_resource_full(struct rvtrace_decoder *decoder,
+					 struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+	int rcode = NEX_FLDGET(RCODE);
+	int hrepeat = 0;
+
+	if (ret)
+		return ret;
+
+	if (rcode == 2)
+		hrepeat = NEX_FLDGET(HREPEAT);
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	if (rcode == 1 || rcode == 2) {
+		int rdata = NEX_FLDGET(RDATA);
+
+		if (rdata > 1) {
+			do {
+				/* ICNT is unknown (-1), what will process only HIST bits */
+				res->icnt = rvtrace_ntrace_emit_icnt(decoder, -1, rdata);
+				if (res->icnt < 0)
+					break;
+
+				/* Consume, so next time ICNT will be adjusted */
+				decoder->current_src_ctx->resourcefull_icnt -= res->icnt;
+				hrepeat--;
+			} while (hrepeat > 0);
+		}
+	} else if (rcode == 0) {
+		decoder->current_src_ctx->resourcefull_icnt += NEX_FLDGET(RDATA);
+	}
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_prog_trace_correlation(struct rvtrace_decoder *decoder,
+						  struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+	int hist = 0;
+
+	if (ret)
+		return ret;
+
+	if (NEX_FLDGET(CDF) == 1)
+		hist = NEX_FLDGET(HIST);
+
+	res->start_addr = decoder->current_src_ctx->nexdeco_pc;
+	res->icnt = rvtrace_ntrace_emit_icnt(decoder, NEX_FLDGET(ICNT), hist);
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_handle_error(struct rvtrace_decoder *decoder,
+				 struct rvtrace_ntrace_result *res)
+{
+	int ret = rvtrace_ntrace_handler_prologue(decoder, res);
+
+	if (ret)
+		return ret;
+
+	decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+	return 0;
+}
+
+static int rvtrace_ntrace_msg_handle(struct rvtrace_decoder *decoder)
+{
+	struct rvtrace_ntrace_result res = { 0 };
+	int tcode = decoder->msg.tcode;
+	int err;
+
+	switch (tcode) {
+	case NEXUS_TCODE_Ownership:
+		err = rvtrace_ntrace_handle_ownership(decoder, &res);
+		break;
+	case NEXUS_TCODE_DirectBranch:
+		err = rvtrace_ntrace_handle_direct_branch(decoder, &res);
+		break;
+	case NEXUS_TCODE_IndirectBranch:
+		err = rvtrace_ntrace_handle_indirect_branch(decoder, &res);
+		break;
+	case NEXUS_TCODE_ProgTraceSync:
+		err = rvtrace_ntrace_handle_prog_trace_sync(decoder, &res);
+		break;
+	case NEXUS_TCODE_DirectBranchSync:
+		err = rvtrace_ntrace_handle_direct_branch_sync(decoder, &res);
+		break;
+	case NEXUS_TCODE_IndirectBranchSync:
+		err = rvtrace_ntrace_handle_indirect_branch_sync(decoder, &res);
+		break;
+	case NEXUS_TCODE_IndirectBranchHist:
+		err = rvtrace_ntrace_handle_indirect_branch_hist(decoder, &res);
+		break;
+	case NEXUS_TCODE_IndirectBranchHistSync:
+		err = rvtrace_ntrace_handle_indirect_branch_hist_sync(decoder, &res);
+		break;
+	case NEXUS_TCODE_ResourceFull:
+		err = rvtrace_ntrace_handle_resource_full(decoder, &res);
+		break;
+	case NEXUS_TCODE_ProgTraceCorrelation:
+		err = rvtrace_ntrace_handle_prog_trace_correlation(decoder, &res);
+		break;
+	case NEXUS_TCODE_Error:
+		err = rvtrace_ntrace_handle_error(decoder, &res);
+		break;
+	case NEXUS_TCODE_RepeatBranch:  /* Handled differently! */
+	default:
+		return -EINVAL;
+	}
+
+	if (err)
+		return err;
+
+	return rvtrace_ntrace_emit_packet(decoder, tcode, res.start_addr, res.icnt, res.src);
+}
+
+/*
+ * Decode the N-Trace byte stream.
+ *
+ *   RVTRACE_DECODE_MSG  - print the messages
+ *   RVTRACE_DECODE_INSN - reconstruct instruction flow
+ */
+int rvtrace_ntrace_decode(struct rvtrace_decoder *decoder, enum rvtrace_decode_type type,
+			  const unsigned char *buf, size_t size)
+{
+	const char *color = PERF_COLOR_BLUE;
+	struct rvtrace_ntrace_msg_parser p = { .field_def = -1 };
+	struct rvtrace_ntrace_msg *msg = &decoder->msg;
+	struct {
+		int msgs;
+		int bytes;
+		int idles;
+		int errors;
+		int invalid;
+	} stat = { 0 };
+	unsigned char prev_byte = 0;
+	bool was_resync = false;
+	size_t pos;
+	int err;
+
+	msg->nfields = 0;
+
+	for (pos = 0; pos < size; pos++) {
+		unsigned char byte = buf[pos];
+		char line[256];
+		int done = rvtrace_ntrace_msg_parse(decoder, &p, msg, byte, prev_byte);
+		int cnt = 1;
+
+		prev_byte = byte;
+		stat.bytes++;
+
+		if (p.resync && !was_resync)
+			stat.invalid++;
+		was_resync = p.resync;
+
+		if (done <= 0)
+			continue;
+
+		stat.msgs++;
+		if (msg->tcode == NEXUS_TCODE_Error)
+			stat.errors++;
+
+		rvtrace_ntrace_msg_sprint(line, sizeof(line), msg, stat.msgs, stat.bytes);
+		if (type == RVTRACE_DECODE_MSG) {
+			color_fprintf(stdout, color, "%s\n", line);
+			continue;
+		}
+		pr_debug2("%s\n", line);
+
+		if (msg->tcode == NEXUS_TCODE_RepeatBranch) {
+			cnt = msg->fields[1];
+			*msg = decoder->saved_msg;
+		} else {
+			/* Save previous message fields */
+			decoder->saved_msg = *msg;
+		}
+
+		while (cnt-- > 0) {
+			err = rvtrace_ntrace_msg_handle(decoder);
+			if (err)
+				return err;
+		}
+	}
+
+	if (type == RVTRACE_DECODE_MSG) {
+		color_fprintf(stdout, color,
+			      "\nN-Trace: %d bytes, %d messages, %d error messages, %d invalid messages",
+			      stat.bytes, stat.msgs, stat.errors, stat.invalid);
+	} else {
+		pr_debug2("\nN-Trace: %d bytes, %d messages, %d errors, %d invalid\n",
+			  stat.bytes, stat.msgs, stat.errors, stat.invalid);
+	}
+
+	return 0;
+}
+
diff --git a/tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.h b/tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.h
new file mode 100644
index 000000000000..4575e631ba5e
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 IAR Systems AB.
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#ifndef INCLUDE__RVTRACE_NTRACE_DECODER_H__
+#define INCLUDE__RVTRACE_NTRACE_DECODER_H__
+
+#include <stdint.h> // For uint32_t and uint64_t
+#include <stdbool.h>
+#include <linux/types.h>
+
+/****************************************************************************/
+/* Instruction information */
+#define INFO_LINEAR   0x1   // Linear (plain instruction or not taken BRANCH)
+#define INFO_4        0x2   // If not 4, it must be 2 on RISC-V
+//                    0x4   // Reserved (for exception or so ...)
+#define INFO_INDIRECT 0x8   // Possible for most types above
+#define INFO_BRANCH   0x10  // Always direct on RISC-V (may have LINEAR too)
+#define INFO_JUMP     0x20  // Direct or indirect
+#define INFO_CALL     0x40  // Direct or indirect (and always a jump)
+#define INFO_RET      0x80  // Return (always indirect and always a jump)
+
+/****************************************************************************/
+
+/****************************************************************************/
+/* Nexus specific values (based on Nexus Standard PDF) */
+
+#define NEXUS_FLDSIZE_TCODE                       6 // This is standard
+
+/* Nexus TCODE values applicable to RISC-V */
+#define NEXUS_TCODE_Ownership                     2
+#define NEXUS_TCODE_DirectBranch                  3
+#define NEXUS_TCODE_IndirectBranch                4
+#define NEXUS_TCODE_Error                         8
+#define NEXUS_TCODE_ProgTraceSync                 9
+#define NEXUS_TCODE_DirectBranchSync              11
+#define NEXUS_TCODE_IndirectBranchSync            12
+#define NEXUS_TCODE_ResourceFull                  27
+#define NEXUS_TCODE_IndirectBranchHist            28
+#define NEXUS_TCODE_IndirectBranchHistSync        29
+#define NEXUS_TCODE_RepeatBranch                  30
+#define NEXUS_TCODE_ProgTraceCorrelation          33
+
+/* End of standard values */
+/****************************************************************************/
+
+/****************************************************************************/
+/* RISC-V Nexus Trace related values (most 'recommended' by Nexus) */
+
+//  Sizes of fields:
+#define NEXUS_FLDSIZE_BTYPE     2 // Branch type
+#define NEXUS_FLDSIZE_SYNC      4 // Synchronization code
+#define NEXUS_FLDSIZE_ETYPE     4 // Error type
+#define NEXUS_FLDSIZE_EVCODE    4 // Event code (correlation)
+#define NEXUS_FLDSIZE_CDF       2
+#define NEXUS_FLDSIZE_RCODE     4 // Resource full code size
+//  from PROCESS fields:
+#define NEXUS_FLDSIZE_FORMAT    2
+#define NEXUS_FLDSIZE_PRV       2
+#define NEXUS_FLDSIZE_V         1
+
+#define NEXUS_PAR_SIZE_SRC      0 // SRC field size is defined by parameter #0
+
+#define NEXUS_HIST_BITS         31 // Number of valid HIST bits
+
+// Address skipping (on RISC-V LSB of PC is always 0, so it is not encoded)
+#define NEXUS_PARAM_AddrSkip    1
+#define NEXUS_PARAM_AddrUnit    1
+
+// End of RISC-V related values
+/****************************************************************************/
+
+/*
+ * Field definition flags packed into rvtrace_ntrace_msg_field_def.def.  The
+ * low 8 bits of a fixed field carry its bit width; bit 7 marks a
+ * runtime-sized (parameter) field such as SRC.
+ */
+#define NEXM_DEF_MSG	0x100	/* message header: low bits are the TCODE */
+#define NEXM_DEF_FLD	0x200	/* fixed-size field */
+#define NEXM_DEF_VAR	0x400	/* variable-size field */
+#define NEXM_DEF_ADR	0x800	/* address field (variable + addr semantics) */
+#define NEXM_DEF_PARAM	0x80	/* field size is a runtime parameter */
+
+// Macros to define Nexus Messages (NEXM_...)
+//  NOTE: These macros refer to 'NEXUS_TCODE_...' and 'NEXUS_FLDSIZE_...'
+//  It is also possible to NOT do it, but it provides less flexibility.
+//
+//                          name   def (marker | value)
+#define NEXM_BEG(n)         {#n,    NEXM_DEF_MSG | (NEXUS_TCODE_##n)   }
+#define   NEXM_FLD(n)       {#n,    NEXM_DEF_FLD | (NEXUS_FLDSIZE_##n) }
+#define   NEXM_FLD_PAR(n)   {#n,    NEXM_DEF_FLD | NEXM_DEF_PARAM      }
+#define   NEXM_VAR(n)       {#n,    NEXM_DEF_VAR                       }
+#define   NEXM_ADR(n)       {#n,    NEXM_DEF_VAR | NEXM_DEF_ADR        }
+#define NEXM_END()          {NULL,  1                                  }
+
+#define MSGFIELDS_MAX 10
+
+struct rvtrace_ntrace_msg_field_def {
+	const char *name;   /* Name of message/field */
+	int def;	    /* Definition of field (see NEXM_... above) */
+};
+
+extern const struct rvtrace_ntrace_msg_field_def rvtrace_ntrace_msg_defs[];
+
+/* A single decoded N-Trace message */
+struct rvtrace_ntrace_msg {
+	u32 tcode;
+	u32 field_pos;
+	u32 nfields;
+	u32 addr_bits;	/* transmitted bit width of the last F-ADDR/U-ADDR field */
+	u64 fields[MSGFIELDS_MAX];
+};
+
+/* Bit-level N-Trace message parser state */
+struct rvtrace_ntrace_msg_parser {
+	int field_def;		/* index into rvtrace_ntrace_msg_defs of the current field */
+	int field_bits;		/* bits accumulated for the current field */
+	u64 field_val;		/* accumulated value of the current field */
+	bool resync;		/* skip bytes until the next MSEO==3 terminator */
+};
+
+#endif
-- 
2.34.1

