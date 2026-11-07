Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019220;
	b=abE9Kbvo5wNH+emqT4pzjbWYwSzDZgrvCqGwmdMurxr9/CQD94udIJaSdE+M9TUR52M3
	 wLgtzmz+QDidB1lYsNaELPfzt+DKJq41PjDfaw/8MassmNK6edOdGkdaJse0EYQd7B+G2
	 JRglh2RU+B65T2RM8PzxAvUF7ad0D7+bpEOUTWpYJYf0Bo4Un1Glq1+0ByRX8jaMrSdIN
	 ipHyMw/XLc6eMlfOf96TsrJD+D1I+GSjkaa6Qai4MY3GZ6IarBbAc/MkDdfT8MNYB0DTQ
	 75tT2XA9xSAgjyaVJSc0T1ZxBoP8KG79M5r3ENgGOVdPBBv/uIEe04mlinkRZQI3G9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QUPdidpUUsqYD9lA1DSIxpA+Qv+zvKKtEyXbdM4HL6k=;
	b=biVzHC+dW0AJbRVCTgwFOnXFQ6XPDHeK1rgxNFrXT+ohhaB71zsYA8cMw2bcPIrpWyTx
	 v+XnQ6zIphR9xeMW1lYwk91z6QSOF3ie+q98pACI76g4A6yWOBIhzEzke73TVgRMaE8fT
	 Y94eKhdsTzxuRnvWgzhcJCkDyQBDPdla+Z1tdyLwHCZficdJrSjAguZKGpbpL0YuPqjB0
	 6cWYOUEjdY7NHuCI3jucLp1LoG9ce58+NHKThNQ2zCZ1n13wH3IrNjpxrqRLu1dDMFKvy
	 lb3ewR2dWk+N7sRXI/38prqVCalvYaevrB1RcX8mR1NFHoPCFqMOb8tETUW/Z7Pk5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TblrE9gS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z0/NAEGD";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FF606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467FF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TblrE9gS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z0/NAEGD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72BpdQ2138083
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 02:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QUPdidpUUsq
	YD9lA1DSIxpA+Qv+zvKKtEyXbdM4HL6k=; b=TblrE9gSh6xghEsFcfaKI05o2kj
	sJBVjr2aWsiK6pQnsDXYm1GfTmJdGd3AJ38hPcNH6eLIolxxbUkU74w+IF35HmCO
	/jQ3zhxj0eyNiBVs2xj1iRpPF6rQrxLbujDShqhuqnZZq10SfGb+D88GZTnBFya2
	rUuJXYqx6rwbWNTEhPwx+Yzgz6OTuRqU0ow3qIQ0WdwLkqX1TEHNr4Cb6CWBGfp2
	LR2BZhUb6aNTMNO48nzCFbLP64DtVGe3lh0UNrWvulyXOwlb4y8qxJS60ih39kc1
	exdfBTuSXEmFck8A3LdriWJn7482BBN7OxWHdoUfb4MKY8pzO5TogKW9TVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06r2kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:40:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2665044eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019218; x=1794624018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUPdidpUUsqYD9lA1DSIxpA+Qv+zvKKtEyXbdM4HL6k=;
        b=Z0/NAEGDxMq8t6PjR+8lxvcMcTmGFhv+yYUGeWL+Cm0jv5tYvZmIuCHroZiPTKxVey
         v7Us2opYKh9rZGZn9vVa/R9Nlck1XQQu4wqgenGAm293ww2DzMA02/e403hZl1jXx2Cy
         RMxWdiSOinrA6Xp0bhMNufNZ9/7mhLX6n4ffmsVRVYZzDOVvJWfqHSubMH1ajegXqeGf
         fa+l3MRe1ksQnG/qCNC+WcOLnl4J3Nxv71uVlC/QJ3qyDy6DPsEI0KVgts4eqdEb7Ovo
         riqoQ5yZtnBA9fhi2y5k1AsccktNBuDIrvBEsq73HpkerG/Sz76hEUQYcIESJQflyzZE
         1Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019218; x=1794624018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUPdidpUUsqYD9lA1DSIxpA+Qv+zvKKtEyXbdM4HL6k=;
        b=dFEQfvaX8dHdBzd51DDqszXaY6gV9RAEK4u6rvQBF5unpIbent0fg7S2el+jJgu97I
         Xyv6rPPfX52iBbj417vh8MnT5J6dgQF/aZna58BrV+a9gPm86g4JAMiKT7BYRjx7GQ7x
         VSj+3sCa9IgUpccnu0Ry8q/IUuFaA7BtlmD19G5430F4Tuemm/bzFKVl9F0+QalJN3gu
         Njt+bOFzbeEOxBzhs4ucZbx+/lqB/NqG3M95JqWC/OS3gDdQDFSepma4iJuZZnUu8bWq
         /GzIzidJkbgeN0wQIUzBTmmRQZZpV2C7JhGiEFL3ZdlQvFTflkicHQSunZgiccTn3xqI
         FIvg==
X-Forwarded-Encrypted: i=1; AL+hErHmpG6+02/bXjvMsIIrRCa7Os0m1pFHn89cy+/HOTEkIx5w8hm4vAu5GN1un3x+UJCQAUh6oKn5nK+a96Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TGBT/dAI6m+cELqLmZwXHneIdeLiRR3v9xerInJyGi2ifqspc
	Hl3mSkKb53mZzm+tgmkWIhnZtMjR/uHIHBQcV6jsFJBUalkQHvbHTojXhIH9xxj9jD7hTY57knK
	zfY8nR5fknlE3KnCHftJQVA9p1PH7ZrLOGtpflWb+RrO5JHXMr3XEGhutMRyYcSRGL5Y=
X-Gm-Gg: AYBFou34R0CM6dgyPTinvniUKTy2vGb/yjELRRrl6aI5jUQRjqPJE6rBccQpgNZRTwE
	ZCPFc+ps0zsTA49pIQ68wLwHvxik6acuSh5qGtHLKgdW+BDdGSPX9vkEIQtIZMOVQZhfMpTyAWC
	uW5d1AjfDYNn3u1bOV1XbY44Ru2xkUjhgQLOwwXL4vsqF2P9w2IxRZg+6nUt5WkExy60qffnUh1
	/vd8rfV20mUQEdbT4fc4j/Rc14MjjQJFDLkdk/DD2wP4edlK55c78kC8+p38sZSL26VUndGUKqG
	gAn/KoLBVGzSc91MkVGKH+iI9qRXAifWossSxDWo2MioUwTwOORMdQWxRrelOCEkeKDVWTGxfGF
	HdWkB4zsHVhrbP6Ao+Vgloao1UiCncVqvLmpEjrbtVSUTyT2/NAqc4Cu5tQ6KVEilSrxgVKQml1
	nxC8N+0vMUJC65JWRr1W8x9zlWj2Ndw9KaxdB87hkIdE7guxWeuvRkZxk3EQGQT13x7eoETFEo2
	w==
X-Received: by 2002:a05:7301:dc2:b0:369:daea:812a with SMTP id 5a478bee46e88-36f76023981mr5665231eec.30.1794019217762;
        Fri, 06 Nov 2026 18:40:17 -0800 (PST)
X-Received: by 2002:a05:7301:dc2:b0:369:daea:812a with SMTP id 5a478bee46e88-36f76023981mr5665174eec.30.1794019217093;
        Fri, 06 Nov 2026 18:40:17 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:40:16 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 6/8] riscv: Add shared instruction fetch and decode helpers
Date: Sat,  7 Nov 2026 08:09:15 +0530
Message-ID: <20261107023917.40606-7-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfXx5bagGxtrD8b
 u80j2UQ0IOSbQbH/GH6eAj6MRggkF5B+TaKuj3Me8wYEdD1FUF4nJy0XU7NFb2e0sfMSUwHyHnp
 ckPmoPG2Y0uqwv8ceJ3oqwe8s276W7IlGAOhgDsvjHi9J8pJz02bwADQu9sSMkFVtq5Hh0QZT+J
 A6NxXACEFYJWhwcEORgcuTHe5RObyK7tTb95sPzhNm3zaNdxygy/u2obYWWqhvMVlU6ht00EqjC
 0sQUbSQJ+lmGd2woNO8i701gNW/kt7uVtFdcvuJf8vmUEAZJLFXf1PhewQWIC7zqvRCAw7vxxcQ
 QPiYvIppRklTQxWfytZZ6VutcK6QgLogiR6AGarrY2vHR1aLxg4G3MX2oBHZzlZefHup6hCP9za
 KYOLh9HAtmgWEyS0JVr3JTX64eA3HaKwVq3iUh6WT34UxHkaV8SV9ZNfcW+uIrZ7oLcRSWC+o+j
 VfO4/z5jaiO8nsd8yGw==
X-Proofpoint-GUID: 2GlQCh8F12C87c3CTcyPq9yYTvVvjW-2
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6aee8f93 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=XkDl4Et5ty8ZtOCQo2QA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 2GlQCh8F12C87c3CTcyPq9yYTvVvjW-2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX78XDJKTEGmU/
 vpPCr+4O0ijodSTuKIh8u41sZLzPmlvQhV49eQ3gM3vHTqu1knMJ6Q1THMM+by87mpNvlJdSo0X
 3PbZfIGC0zzi5zKvzKMeWz4MWiPFjPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010

Move get_insn() and __read_insn() out of traps_misaligned.c so
breakpoint single-step code can share the instruction fetch logic.

Add helpers to read GPR values and compute the next RISC-V PC for
control-flow instructions handled by software single stepping. The helpers
cover compressed and standard branches, jumps, JALR, and SRET.

Suggested-by: Jesse Taube <jtaubepe@redhat.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS                          |   2 +
 arch/riscv/include/asm/insn.h        |  16 ++
 arch/riscv/kernel/traps_misaligned.c |  52 +----
 arch/riscv/lib/Makefile              |   1 +
 arch/riscv/lib/insn.c                | 279 +++++++++++++++++++++++++++
 5 files changed, 299 insertions(+), 51 deletions(-)
 create mode 100644 arch/riscv/lib/insn.c

diff --git a/MAINTAINERS b/MAINTAINERS
index baf97e8c39f6..db65093d751f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24167,9 +24167,11 @@ RISC-V DEBUGGING
 M:	Himanshu Chauhan <himanshu@thechauhan.dev>
 L:	linux-riscv@lists.infradead.org
 F:	arch/riscv/include/asm/hw_breakpoint.h
+F:	arch/riscv/include/asm/insn.h
 F:	arch/riscv/include/asm/perf_event.h
 F:	arch/riscv/kernel/hw_breakpoint.c
 F:	arch/riscv/kernel/perf_*
+F:	arch/riscv/lib/insn.c
 F:	drivers/perf/
 F:	tools/testing/selftests/breakpoints/breakpoint_test_riscv.c
 
diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ad348d8b8857..01b5bbce1270 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -227,9 +227,16 @@
 #define RVC_MASK_C_EBREAK	0xffff
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
+#define RVC_MASK_INSN		GENMASK(15, 0)
 
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
+
+static __always_inline bool riscv_insn_is_compressed(u32 code)
+{
+	return (code & (__INSN_LENGTH_MASK)) != (__INSN_LENGTH_GE_32);
+}
+
 #define __INSN_OPCODE_MASK	_UL(0x7F)
 #define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
 
@@ -600,4 +607,13 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
 	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
 }
+
+#ifndef __ASSEMBLY__
+#include <asm/ptrace.h>
+
+int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
+int get_insn_safe(struct pt_regs *regs, ulong epc, ulong *r_insn);
+unsigned long get_next_insn_address(struct pt_regs *regs, ulong insn, ulong pc);
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 6e8ae6c66322..541e6a5b8039 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -10,6 +10,7 @@
 #include <linux/irq.h>
 #include <linux/stringify.h>
 
+#include <asm/insn.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
@@ -129,57 +130,6 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 #define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
 #define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
 
-#define __read_insn(regs, insn, insn_addr, type)	\
-({							\
-	int __ret;					\
-							\
-	if (user_mode(regs)) {				\
-		__ret = get_user(insn, (type __user *) insn_addr); \
-	} else {					\
-		insn = *(type *)insn_addr;		\
-		__ret = 0;				\
-	}						\
-							\
-	__ret;						\
-})
-
-static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
-{
-	ulong insn = 0;
-
-	if (epc & 0x2) {
-		ulong tmp = 0;
-
-		if (__read_insn(regs, insn, epc, u16))
-			return -EFAULT;
-		/* __get_user() uses regular "lw" which sign extend the loaded
-		 * value make sure to clear higher order bits in case we "or" it
-		 * below with the upper 16 bits half.
-		 */
-		insn &= GENMASK(15, 0);
-		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		epc += sizeof(u16);
-		if (__read_insn(regs, tmp, epc, u16))
-			return -EFAULT;
-		*r_insn = (tmp << 16) | insn;
-
-		return 0;
-	} else {
-		if (__read_insn(regs, insn, epc, u32))
-			return -EFAULT;
-		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		insn &= GENMASK(15, 0);
-		*r_insn = insn;
-
-		return 0;
-	}
-}
 
 union reg_data {
 	u8 data_bytes[8];
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index f668b98970bd..84cdd35afa42 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 lib-y			+= delay.o
+lib-y			+= insn.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
diff --git a/arch/riscv/lib/insn.c b/arch/riscv/lib/insn.c
new file mode 100644
index 000000000000..fc44e2aa6f5f
--- /dev/null
+++ b/arch/riscv/lib/insn.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/uaccess.h>
+
+#include <asm/insn.h>
+#include <asm/ptrace.h>
+
+/*
+ * fetch_insn_u16() - Fetch a 16-bit RISC-V instruction parcel from memory
+ * @regs: Register state used to determine the access context
+ * @insn: Pointer receiving the instruction value
+ * @insn_addr: Address from which to read the instruction parcel
+ *
+ * Fetches an instruction parcel from user or kernel memory, depending on the
+ * execution context indicated by @regs. RISC-V instruction parcels are
+ * stored in little-endian byte order, so the fetched value is converted from
+ * little-endian to the native CPU representation before being stored in @insn.
+ *
+ * The conversion is a no-op on little-endian targets and performs the
+ * required byte swap on big-endian targets.
+ *
+ * Return: 0 on success, or a negative error code if reading user memory
+ *         fails.
+ */
+static int fetch_insn_u16(struct pt_regs *regs, u16 *insn,
+			  unsigned long insn_addr)
+{
+	u16 val;
+	int ret;
+
+	if (user_mode(regs))
+		ret = get_user(val, (u16 __user *)insn_addr);
+	else
+		ret = get_kernel_nofault(val, (u16 *)insn_addr);
+
+	if (!ret)
+		*insn = le16_to_cpu((__force __le16)val);
+
+	return ret;
+}
+
+static int fetch_insn_u32(struct pt_regs *regs, u32 *insn,
+			  unsigned long insn_addr)
+{
+	u32 val;
+	int ret;
+
+	if (user_mode(regs))
+		ret = get_user(val, (u32 __user *)insn_addr);
+	else
+		ret = get_kernel_nofault(val, (u32 *)insn_addr);
+
+	if (!ret)
+		*insn = le32_to_cpu((__force __le32)val);
+
+	return ret;
+}
+
+/**
+ * get_insn() - Fetch and decode a RISC-V instruction
+ * @regs: Register state used for instruction access
+ * @epc: Address of the instruction to fetch
+ * @r_insn: Pointer to store the fetched instruction encoding
+ *
+ * Fetches the instruction at @epc and stores its encoding in @r_insn.
+ * Both standard 32-bit instructions and compressed 16-bit instructions are
+ * supported. If a 32-bit instruction is split across two 16-bit instruction
+ * accesses, the halfwords are combined into a single instruction encoding.
+ *
+ * Return: 0 on success, or %-EFAULT if instruction access fails.
+ */
+int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	u32 insn;
+	u16 half, tmp;
+
+	if (!(epc & 0x2)) {
+		if (fetch_insn_u32(regs, &insn, epc))
+			return -EFAULT;
+
+		if (riscv_insn_is_compressed(insn))
+			insn &= RVC_MASK_INSN;
+
+		*r_insn = insn;
+		return 0;
+	}
+
+	if (fetch_insn_u16(regs, &half, epc))
+		return -EFAULT;
+
+	insn = half & RVC_MASK_INSN;
+	if (riscv_insn_is_compressed(insn)) {
+		*r_insn = insn;
+		return 0;
+	}
+
+	if (fetch_insn_u16(regs, &tmp, epc + sizeof(u16)))
+		return -EFAULT;
+
+	*r_insn = ((u32)tmp << 16) | insn;
+
+	return 0;
+}
+
+int get_insn_safe(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	int ret;
+
+	pagefault_disable();
+	ret = get_insn(regs, epc, r_insn);
+	pagefault_enable();
+
+	return ret;
+}
+
+/**
+ * riscv_get_reg_value() - Get the value stored the given RISC-V register number
+ * @regs: Register state containing the saved register values
+ * @regno: RISC-V register number
+ *
+ * Returns the value of the RISC-V register identified by @regno. Register
+ * x0 always returns zero, as required by the RISC-V ISA.
+ *
+ * Return: The register value, or zero if @regno is zero.
+ */
+static unsigned long riscv_get_reg_value(struct pt_regs *regs, unsigned int regno)
+{
+	return regno ? regs_get_register(regs, regno * sizeof(unsigned long)) : 0;
+}
+
+static unsigned long riscv_jalr_target(unsigned long base, long offset)
+{
+	/* JALR, C.JR, and C.JALR clear bit 0 of the computed target address. */
+	return (base + offset) & ~1UL;
+}
+
+/**
+ * get_next_insn_address_compressed() - Calculate the next address for a compressed
+ * RISC-V instruction
+ * @regs: Register state used to evaluate indirect jumps and conditional
+ *        branches
+ * @insn: Compressed RISC-V instruction encoding
+ * @pc: Current program counter
+ *
+ * Determines the address at which execution should continue after processing
+ * the compressed instruction in @insn. Indirect jumps use the value of the
+ * instruction's source register, unconditional jumps use the encoded
+ * immediate, and conditional branches evaluate the relevant register value.
+ *
+ * For a branch that is not taken, or for an unsupported compressed
+ * instruction, the address of the following 16-bit instruction is returned.
+ *
+ * Return: The next instruction address.
+ */
+static unsigned long get_next_insn_address_compressed(struct pt_regs *regs, u32 insn,
+						      unsigned long pc)
+{
+	unsigned int rs1_num;
+
+	if (riscv_insn_is_c_jalr(insn) || riscv_insn_is_c_jr(insn)) {
+		rs1_num = RV_X(insn, RVC_C2_RS1_OPOFF, 5);
+		return riscv_jalr_target(riscv_get_reg_value(regs, rs1_num), 0);
+	}
+
+	if (riscv_insn_is_c_j(insn) || riscv_insn_is_c_jal(insn))
+		return RVC_EXTRACT_JTYPE_IMM(insn) + pc;
+
+	if (riscv_insn_is_c_beqz(insn)) {
+		rs1_num = RV_X(insn, RVC_C1_RS1_OPOFF, 3) + 8;
+		if (!rs1_num || riscv_get_reg_value(regs, rs1_num) == 0)
+			return RVC_EXTRACT_BTYPE_IMM(insn) + pc;
+		return pc + 2;
+	}
+
+	if (riscv_insn_is_c_bnez(insn)) {
+		rs1_num = RV_X(insn, RVC_C1_RS1_OPOFF, 3) + 8;
+		if (rs1_num && riscv_get_reg_value(regs, rs1_num) != 0)
+			return RVC_EXTRACT_BTYPE_IMM(insn) + pc;
+		return pc + 2;
+	}
+
+	return pc + 2;
+}
+
+/**
+ * riscv_branch_taken() - Determine whether a RISC-V conditional branch is taken
+ * @regs: Register state used to obtain the source operand values
+ * @insn: RISC-V branch instruction encoding
+ *
+ * Evaluates the branch condition encoded in @insn using the values of its
+ * source registers from @regs. Signed comparisons are used for BLT and BGE,
+ * while unsigned comparisons are used for BLTU and BGEU.
+ *
+ * Return: %true if the branch condition is satisfied, or %false otherwise.
+ *         Unsupported branch instructions also return %false.
+ */
+static bool riscv_branch_taken(struct pt_regs *regs, u32 insn)
+{
+	unsigned int rs1_num = RV_X(insn, RVG_RS1_OPOFF, 5);
+	unsigned int rs2_num = RV_X(insn, RVG_RS2_OPOFF, 5);
+	unsigned long rs1_val = riscv_get_reg_value(regs, rs1_num);
+	unsigned long rs2_val = riscv_get_reg_value(regs, rs2_num);
+
+	if (riscv_insn_is_beq(insn))
+		return rs1_val == rs2_val;
+	if (riscv_insn_is_bne(insn))
+		return rs1_val != rs2_val;
+	if (riscv_insn_is_blt(insn))
+		return (long)rs1_val < (long)rs2_val;
+	if (riscv_insn_is_bge(insn))
+		return (long)rs1_val >= (long)rs2_val;
+	if (riscv_insn_is_bltu(insn))
+		return rs1_val < rs2_val;
+	if (riscv_insn_is_bgeu(insn))
+		return rs1_val >= rs2_val;
+
+	return false;
+}
+
+/**
+ * get_next_insn_address_standard() - Compute the next PC for standard RISC-V
+ * control-flow instructions
+ *
+ * @regs: Register state of the current context.
+ * @insn: Instruction located at @pc.
+ * @pc: Address of the current instruction.
+ *
+ * Determine the address of the next instruction to be executed after @insn.
+ * The function evaluates control-flow instructions whose target cannot be
+ * obtained by simply advancing the program counter:
+ *
+ * - Conditional branches: returns either the branch target or @pc + 4
+ * depending on the branch outcome.
+ * - JAL: returns the jump target encoded in the instruction.
+ * - JALR: returns the computed indirect jump target using the instruction
+ * immediate and the value of the source register.
+ * - SRET: returns @pc, as control transfer is handled by the trap return
+ * mechanism.
+ *
+ * For all other instructions, execution is assumed to continue at the next
+ * sequential 32-bit instruction and @pc + 4 is returned.
+ *
+ * Return: Address of the next instruction to be executed.
+ */
+static unsigned long get_next_insn_address_standard(struct pt_regs *regs, u32 insn,
+						    unsigned long pc)
+{
+	unsigned int rs1_num;
+
+	if ((insn & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE)
+		return riscv_branch_taken(regs, insn) ?
+			RV_EXTRACT_BTYPE_IMM(insn) + pc : pc + 4;
+
+	if (riscv_insn_is_jal(insn))
+		return RV_EXTRACT_JTYPE_IMM(insn) + pc;
+
+	if (riscv_insn_is_jalr(insn)) {
+		rs1_num = RV_X(insn, RVG_RS1_OPOFF, 5);
+		return riscv_jalr_target(riscv_get_reg_value(regs, rs1_num),
+					 RV_EXTRACT_ITYPE_IMM(insn));
+	}
+
+	if (riscv_insn_is_sret(insn))
+		return pc;
+
+	return pc + 4;
+}
+
+/* Calculate the new address for after a step */
+unsigned long get_next_insn_address(struct pt_regs *regs, ulong insn, ulong pc)
+{
+	if (riscv_insn_is_compressed(insn))
+		return get_next_insn_address_compressed(regs, insn, pc);
+
+	return get_next_insn_address_standard(regs, insn, pc);
+}
-- 
2.43.0

