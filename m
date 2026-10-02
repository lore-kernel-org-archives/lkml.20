Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BEB4F93C7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959629; cv=none; b=pREWUBOHyuHdjd46Cn+lw2MNoUMu9W/LgJtN074ndp0CoiPIgpnCjlj0O3W3g5DIxuoBUcKWaImixj1sUVMdl1dee+woBnbUjTPpJiBBiwYzO6tnV1jpwgoDau3QcXe/Jhldhk33vcKXkEJy9kh8PdHv0PDdahI6Qn6RsaBoi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959629; c=relaxed/simple;
	bh=qXl2gep3eoTQz7oE7Ru6w94gVRcmfeFDulr6gx1m8sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQmPcAk3vKre+PkZlI6cKjGwE/Zc9GmptpUP9JQf+5GPQXZlFyrhD5ECJWx2WJNuB8/KJL8kEKL9sqKoBU73UNe8JL48gY5PmClFPk3K7G1JglGF78tPfD9pdxd5BsXAmbrqwTX/GX/tbLuVpLXW2LxijfBfetwvFyuGbm/FV4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AQiehyQ/; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AQiehyQ/"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FZLMR3243722;
	Fri, 2 Oct 2026 16:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3Gvp5ou0+F6hhFiic
	tfosHLijedKe2DjLAQQPlO3Yro=; b=AQiehyQ/RLN8hgzVvybi2aRJg1qQSGgda
	U0tkat3k6zyOD/L65sgI7v/uq5ruLjCFNj260CT0CfT+OXZoUApfBYKQbd1WjQkX
	Q4Ze0yaMmIuHzxobsFs/TKZssyjO9YwEBFoyUUqf4fBMIib128fFqpaMjK2WWqN0
	NNGDr9C8Dy5J02fzyWYhbHTpSy6umuGJ1sGbHgzvu+3MKSU7v+L3VZ2bcZnifdzz
	nu4sIwy92/uIqIYHpdxt2xSeOlxYkCmun/Hp8Te9ZH2Kis2TUc3vlSUcai2fXkq7
	o4Cl23bKMTpm9qBCYyLB9Tiw15/+8rz3SBzEy430s1vNRbBaJ33BQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5qrtbbp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 16:46:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHlms1429264;
	Fri, 2 Oct 2026 16:46:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4pn0y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 16:46:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 692GkfuY36176172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Oct 2026 16:46:41 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F2592004B;
	Fri,  2 Oct 2026 16:46:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97D6120040;
	Fri,  2 Oct 2026 16:46:37 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.216.180])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Oct 2026 16:46:37 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        ritesh.list@gmail.com, peterz@infradead.org, boqun@kernel.org,
        will@kernel.org, jhladky@redhat.com, paulmck@kernel.org
Subject: [RFC 2/3] powerpc64/preempt: Add need_resched bit inside preempt_count
Date: Fri,  2 Oct 2026 22:16:18 +0530
Message-ID: <20261002164619.1455143-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002164619.1455143-1-sshegde@linux.ibm.com>
References: <20261002164619.1455143-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX1ht3HzGD0+mw
 sqaoVMNPl48nLT7vKWHoh2jzBNALIcDh6vvBx9HioZNG7vC4hyd4tcx+0JQinGL/rb41Fq8kQSN
 ELUoAVXjU6ar2BM+KaGQGIXfJR9XpQpeQG9nBX2UpDqBiWgnzm03Wrg/nsWSX/l1ZtTpejXDteC
 n6kODcDH2jPRxLcKxWl4PFP2FU1yVJg9MGroUvTiraFupNvKA/0ygCH3S1iu3NKebKV/BE8lZWa
 810anrX3h+PkE2OO2XFBtChYfJuqq8QqBzntCFheU8wAu/dz+iKx/qKOaZ4Qpgf++WqWqjDsiAs
 pC8yCWwuBdvcmGB/hyd6iO5c2WQMnWcO08I+9t1SMmmuKIBVEgrFHCqWCgL+TNqHCoYw+0gG6X1
 yA5rVQpMNe9vFRBXDkKTL/fVfqQZIMltSuGW/KHdaRaao8f6YE+x2sCe3bxDL+ZtIwaYDYQ8/KG
 prPHiy+EAoX5l+v783Q==
X-Authority-Analysis: v=2.4 cv=SPbXx+vH c=1 sm=1 tr=0 ts=6abfdff6 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=jEDKg6MMcPES391McfIA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: RWuH2EKhBAgqVGP-VK86SjGXJ4Cq13ZE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfXz4mi18j8B2L5
 yYH9PbU0y+DZgjYs6/jHGJm5+BpS0U+mqpvEv78rUyI52aOfoscvDkjuuRdRTMT0gXXpCE4NhZY
 nWbFOLBfgJ7rujoxvkAnEqaNX+ZrFj4=
X-Proofpoint-GUID: KnyrYjTOr9VsY5M0P2PCrgO-Z5igNFI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020066

Current implementation doesn't make use of the PREEMPT_NEED_RESCHED flag,
since this can interact badly with load/store architectures which
rely on the preempt_count word being unchanged across an interrupt.

On PPC64 which is 64 bit and the preempt count is only 32 bits wide,
one can simply pack it next to the resched flag and load the whole thing
in one go, so that a dec-and-test operation doesn't need to check tif.

[Adopted from arm64 implementation, including changelog bits]
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/paca.h    | 13 +++++++-
 arch/powerpc/include/asm/preempt.h | 52 ++++++++++++++++++------------
 arch/powerpc/kexec/core_64.c       |  2 +-
 3 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 0aa729c2faf5..a73e214bd6f3 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -164,7 +164,18 @@ struct paca_struct {
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
 	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
-	int preempt_count;
+	union {
+		u64		preempt_count;
+		struct {
+#ifdef __BIG_ENDIAN__
+			u32	need_resched;
+			u32	count;
+#else
+			u32	count;
+			u32	need_resched;
+#endif
+		} preempt;
+	};
 #ifdef CONFIG_PPC_BOOK3E_64
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
index e2785d5a13e0..d17c8acac7bd 100644
--- a/arch/powerpc/include/asm/preempt.h
+++ b/arch/powerpc/include/asm/preempt.h
@@ -8,19 +8,20 @@
 #define __ASM_POWERPC_PREEMPT_H
 
 #ifdef CONFIG_PPC64
-#include <linux/thread_info.h>
 #include <asm/paca.h>
 
-#define PREEMPT_ENABLED	(0)
+#define PREEMPT_NEED_RESCHED	BIT(32)
+#define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
 static __always_inline int preempt_count(void)
 {
-	return READ_ONCE(local_paca->preempt_count);
+	return READ_ONCE(local_paca->preempt.count);
 }
 
-static __always_inline void preempt_count_set(int pc)
+static __always_inline void preempt_count_set(u64 pc)
 {
-	WRITE_ONCE(local_paca->preempt_count, pc);
+	/* Preserve existing value of PREEMPT_NEED_RESCHED */
+	WRITE_ONCE(local_paca->preempt.count, pc);
 }
 
 #define init_task_preempt_count(p) do { } while (0)
@@ -28,64 +29,73 @@ static __always_inline void preempt_count_set(int pc)
 
 static inline void set_preempt_need_resched(void)
 {
+	WRITE_ONCE(local_paca->preempt.need_resched, 0);
 }
 
 static inline void clear_preempt_need_resched(void)
 {
+	WRITE_ONCE(local_paca->preempt.need_resched, 1);
 }
 
 static inline bool test_preempt_need_resched(void)
 {
-	return false;
+	return !READ_ONCE(local_paca->preempt.need_resched);
 }
 
 static __always_inline void __preempt_count_add(int val)
 {
-	int pc = READ_ONCE(local_paca->preempt_count);
+	u32 pc = READ_ONCE(local_paca->preempt.count);
 
 	pc += val;
-	WRITE_ONCE(local_paca->preempt_count, pc);
+	WRITE_ONCE(local_paca->preempt.count, pc);
 }
 
 static __always_inline void __preempt_count_sub(int val)
 {
-	int pc = READ_ONCE(local_paca->preempt_count);
+	u32 pc = READ_ONCE(local_paca->preempt.count);
 
 	pc -= val;
-	WRITE_ONCE(local_paca->preempt_count, pc);
+	WRITE_ONCE(local_paca->preempt.count, pc);
 }
 
 static inline int __preempt_count_add_return(int val)
 {
-	int pc = READ_ONCE(local_paca->preempt_count);
+	u32 pc = READ_ONCE(local_paca->preempt.count);
 
 	pc += val;
-	WRITE_ONCE(local_paca->preempt_count, pc);
+	WRITE_ONCE(local_paca->preempt.count, pc);
 	return pc;
 }
 
 static inline int __preempt_count_sub_return(int val)
 {
-	int pc = READ_ONCE(local_paca->preempt_count);
+	u32 pc = READ_ONCE(local_paca->preempt.count);
 
 	pc -= val;
-	WRITE_ONCE(local_paca->preempt_count, pc);
+	WRITE_ONCE(local_paca->preempt.count, pc);
 	return pc;
 }
 
 static inline bool __preempt_count_dec_and_test(void)
 {
-	int pc = READ_ONCE(local_paca->preempt_count);
-
-	WRITE_ONCE(local_paca->preempt_count, --pc);
-	return !pc && tif_need_resched();
+	u64 pc = READ_ONCE(local_paca->preempt_count);
+
+	/* Update only the count field, leaving need_resched unchanged */
+	WRITE_ONCE(local_paca->preempt.count, --pc);
+	/*
+	 * If we wrote back all zeroes, then we're preemptible and in
+	 * need of a reschedule. Otherwise, we need to reload the
+	 * preempt_count in case the need_resched flag was cleared by an
+	 * interrupt occurring between the non-atomic READ_ONCE/WRITE_ONCE
+	 * pair.
+	 */
+	return !pc || !READ_ONCE(local_paca->preempt_count);
 }
 
 static inline bool should_resched(int preempt_offset)
 {
-	int pc = READ_ONCE(local_paca->preempt_count);
-
-	return unlikely(pc == preempt_offset && tif_need_resched());
+	u64 pc = READ_ONCE(local_paca->preempt_count);
+	return unlikely(pc == preempt_offset);
 }
 
 #ifdef CONFIG_PREEMPTION
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index f3954695e0b5..0f17c75cee28 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -352,7 +352,7 @@ void default_machine_kexec(struct kimage *image)
 	 * XXX: the task struct will likely be invalid once we do the copy!
 	 */
 	current_thread_info()->flags = 0;
-	WRITE_ONCE(local_paca->preempt_count, HARDIRQ_OFFSET);
+	WRITE_ONCE(local_paca->preempt.count, HARDIRQ_OFFSET);
 
 	/* We need a static PACA, too; copy this CPU's PACA over and switch to
 	 * it. Also poison per_cpu_offset and NULL lppaca to catch anyone using
-- 
2.52.0

