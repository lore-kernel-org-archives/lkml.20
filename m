Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4A46EF6A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521133; cv=none; b=ASOq3vgu+PA4z4IM7PEPjhhMEYXGv5C8zVSeZdWTC4Pv1b1VX7YnAiOL+R7Q66aVV/Gxgo2d2rBVUA/Kp5YI3D2UqZzn0GNR7iRn7eG5Nn1Q+tnR/KD3DfVdsPViVKNmFMTXqKKViiBNiu+A3pp2G3OQvFD7buW9WUXSzsXnfvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521133; c=relaxed/simple;
	bh=+JoWXVHWyI7TlPa+9cw6z/PFWR63vOBpU6sQfh2sHhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGkHLGr/C/6MZr8qTizvYdrfn1BxmG0DaiOMrSnxeaAszy88mvIYFELMZmKRiQZy/2IYZiEiWeigwG/bRitRgxAGrHmMgm5VVAwANjg8aOSBiqGyLNhRLV2Zw2Bq80YGtTnSk79nXkKs2NwkMudDURAfA1aLbAUr5e4H1aXjeVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a16o5eDT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a16o5eDT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d7200b2e15so9664435ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521131; x=1789125931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=;
        b=a16o5eDTzZrN5bEwo/Uo2vMzjdHMjI8PQf4wQ6RNyhAvUCP6/HEm67MsRDk4bOnKqI
         05qx0G6XcpB4+i0iJgAfJqHihUWAW7zRRor/yw3sFhoQ7cmJZqQs/Pqq0wwGbNGP1AqN
         ue2+olHPpf4YIT2Bjyy07edTFxKAJNy+E3WxSFa65iY0dbwVxYa4EMlOl6fVvXrRwUxw
         QaZ8OC2MZEzm/WgKWBH3gmgB/F1NKQHZGq3VCr8aCbmPZQT/ywOa2Q2BKgwYfksejWHp
         7xTtMRwzOPrAPALcNDEuzLzuaYvxuhSQQQDp/rYOSCnwuPTJZOvRYeLBD7qEWyEt0XVn
         2+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521131; x=1789125931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=545O0WDL5qNzN0FtnQz+2XQixX5ANxvieXurE5YLToc=;
        b=CEdTKs5NoUENKz8W0LW4hbrfEeW0aRu90cNJ4Zps7gW952uEzl73OVM6ZmeCUJfYRO
         znBSb0t58tRMf0tv/7q7RyV8jWRbW+SBDzUGs7gnjoU6hl/Y0HoVezhUrbeuc4u+3H0E
         JSPCuqWwnz1I927MREN+x1VBm1XhAVZh5VItNscgMHZoa0NBf2V+seg07pBMsAFDc5Oz
         gl7BfuOW/PVtpjUISkd8u3Zm0keoRhuDdCp8NgOayon6MDQg7k7oYf7Jd+xebcVBS+Hn
         hH66NfGuKFUQcs1qC1ECYkQfDVwxbLBGhxSWz/zEAUyg7GGqNpXF74M113LC4/ResTiT
         D75g==
X-Gm-Message-State: AFuF++makyWzMYDLYATQKOqhDfs//kACPk2HB8nl0KiSIfHPf8Re7z/0
	7+nfSZntZ0VWrPiNyQuiopd9pY8kbltbHYrwU4YU4lty51xUNpgR9Dyy
X-Gm-Gg: AYBFou1dwhrFGWina5i7hL66Q1Xrhk+83fw2rrnHYRhUX3gpSvtFwRvh+HqFCZNrhVF
	OTVY9RCAUn3uCeZiqXWBMZJ/85tsuwtsCRsNYUUT1edGblz6s9ZrVe2hCAHiGpgL19Tsc7k1/dV
	kFFdtCaXcPS9pYQgit1Imw3WK4dp2JkbI4u4hGN3qWzAbJSxA3isOT1gLkArwUa1Mng4piwOwiN
	pIyRaEfODehTaRQLRCwzgq1YUznFA7/OGjgvbGdm+/RBzxQGIqUjOkWueOw0H9YP2oflfq346fh
	52zHiXLJ2s8XwOqF5ugzLAsMAQnTb8idtV99cquTJvQwKlpWZF/vJNYNIgT6WeJTw0gwaQhYjOh
	hTJo5kSqW37ArpM0twRh7QE00VUBhBCFeij+z6OFYDVbTjy9Tel05MJ31jS9953EjfGCwgADWlk
	4CrZnRcTMxkoEzZuA2haTle6gjNPf0NCSJLqNz3g6bzU7o7qde9NoMJg15eoBdYPc0ajISiADQn
	Twfp0J3mr0vOFE=
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr9759398a91.0.1788521130565;
        Fri, 04 Sep 2026 04:25:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8970969eec.15.2026.09.04.04.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:25:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] ARM: fix typos in comments
Date: Fri,  4 Sep 2026 16:55:17 +0530
Message-ID: <20260904112522.1426-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904112522.1426-1-hemanth.selam@gmail.com>
References: <20260904112522.1426-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/boot/compressed/head.S     | 2 +-
 arch/arm/include/asm/uaccess.h      | 2 +-
 arch/arm/kernel/cpuidle.c           | 2 +-
 arch/arm/mm/cache-l2x0.c            | 2 +-
 arch/arm/mm/context.c               | 4 ++--
 arch/arm/probes/decode.h            | 2 +-
 arch/arm/probes/kprobes/opt-arm.c   | 4 ++--
 arch/arm/probes/kprobes/test-core.c | 2 +-
 arch/arm/xen/hypercall.S            | 4 ++--
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6..e117f2b4dea9 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -955,7 +955,7 @@ call_cache_fn:	adr	r12, proc_types
 		/*
 		 * On v7-M the processor id is located in the V7M_SCB_CPUID
 		 * register, but as cache handling is IMPLEMENTATION DEFINED on
-		 * v7-M (if existant at all) we just return early here.
+		 * v7-M (if existent at all) we just return early here.
 		 * If V7M_SCB_CPUID were used the cpu ID functions (i.e.
 		 * __armv7_mmu_cache_{on,off,flush}) would be selected which
 		 * use cp15 registers that are not implemented on v7-M.
diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index 1593cf3b9800..9805001f9d72 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -24,7 +24,7 @@
  * These two functions allow hooking accesses to userspace to increase
  * system integrity by ensuring that the kernel can not inadvertantly
  * perform such accesses (eg, via list poison values) which could then
- * be exploited for priviledge escalation.
+ * be exploited for privilege escalation.
  */
 #if defined(CONFIG_CPU_SW_DOMAIN_PAN)
 
diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index fba1f8bb03b5..784457ac7b2b 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -79,7 +79,7 @@ static const struct cpuidle_ops *__init arm_cpuidle_get_ops(const char *method)
  * cpuidle_ops are tagged __initconst and will be unloaded after the init
  * process.
  *
- * Return 0 on sucess, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
+ * Return 0 on success, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
  * no cpuidle_ops is registered for the 'enable-method', or if either init or
  * suspend callback isn't defined.
  */
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..0eaaf99d3d11 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1381,7 +1381,7 @@ static void aurora_pa_range(unsigned long start, unsigned long end,
 	unsigned long flags;
 
 	/*
-	 * round start and end adresses up to cache line size
+	 * round start and end addresses up to cache line size
 	 */
 	start &= ~(CACHE_LINE_SIZE - 1);
 	end = ALIGN(end, CACHE_LINE_SIZE);
diff --git a/arch/arm/mm/context.c b/arch/arm/mm/context.c
index 4204ffa2d104..95d477cab0f5 100644
--- a/arch/arm/mm/context.c
+++ b/arch/arm/mm/context.c
@@ -76,7 +76,7 @@ void a15_erratum_get_cpumask(int this_cpu, struct mm_struct *mm,
 
 #ifdef CONFIG_ARM_LPAE
 /*
- * With LPAE, the ASID and page tables are updated atomicly, so there is
+ * With LPAE, the ASID and page tables are updated atomically, so there is
  * no need for a reserved set of tables (the active ASID tracking prevents
  * any issues across a rollover).
  */
@@ -243,7 +243,7 @@ void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
 	check_vmalloc_seq(mm);
 
 	/*
-	 * We cannot update the pgd and the ASID atomicly with classic
+	 * We cannot update the pgd and the ASID atomically with classic
 	 * MMU, so switch exclusively to global mappings to avoid
 	 * speculative page table walking with the wrong TTBR.
 	 */
diff --git a/arch/arm/probes/decode.h b/arch/arm/probes/decode.h
index facc889d05ee..b09c44ba1030 100644
--- a/arch/arm/probes/decode.h
+++ b/arch/arm/probes/decode.h
@@ -250,7 +250,7 @@ enum decode_reg_type {
 	REG_TYPE_NOPCWB,   /* No PC if load/store write-back flag also set */
 
 	/* The following types are used when the encoding for PC indicates
-	 * another instruction form. This distiction only matters for test
+	 * another instruction form. This distinction only matters for test
 	 * case coverage checks.
 	 */
 	REG_TYPE_NOPCX,	   /* Register must not be PC */
diff --git a/arch/arm/probes/kprobes/opt-arm.c b/arch/arm/probes/kprobes/opt-arm.c
index 966c6042c5ad..a3aed8c01c98 100644
--- a/arch/arm/probes/kprobes/opt-arm.c
+++ b/arch/arm/probes/kprobes/opt-arm.c
@@ -210,11 +210,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *or
 	 *
 	 * So the maximum forward branch should be:
 	 *   (0x007fffff << 2) = 0x01fffffc =  0x1fffffc
-	 * The maximum backword branch should be:
+	 * The maximum backward branch should be:
 	 *   (0xff800000 << 2) = 0xfe000000 = -0x2000000
 	 *
 	 * We can simply check (rel & 0xfe000003):
-	 *  if rel is positive, (rel & 0xfe000000) shoule be 0
+	 *  if rel is positive, (rel & 0xfe000000) should be 0
 	 *  if rel is negitive, (rel & 0xfe000000) should be 0xfe000000
 	 *  the last '3' is used for alignment checking.
 	 */
diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
index 2de28088dac8..531fec3621b8 100644
--- a/arch/arm/probes/kprobes/test-core.c
+++ b/arch/arm/probes/kprobes/test-core.c
@@ -125,7 +125,7 @@
  *	.byte	ARG_TYPE_END
  *	.byte	TEST_ISA	@ flags, including ISA being tested
  *	.short	50f-0f		@ offset of 'test_before'
- *	.short	2f-0f		@ offset of 'test_after2' (if relevent)
+ *	.short	2f-0f		@ offset of 'test_after2' (if relevant)
  *	.short	99f-0f		@ offset of 'test_done'
  *	@ start of test case code...
  *	0:
diff --git a/arch/arm/xen/hypercall.S b/arch/arm/xen/hypercall.S
index f794dac9859a..b8b6192e310e 100644
--- a/arch/arm/xen/hypercall.S
+++ b/arch/arm/xen/hypercall.S
@@ -32,9 +32,9 @@
 
 /*
  * The Xen hypercall calling convention is very similar to the ARM
- * procedure calling convention: the first paramter is passed in r0, the
+ * procedure calling convention: the first parameter is passed in r0, the
  * second in r1, the third in r2 and the fourth in r3. Considering that
- * Xen hypercalls have 5 arguments at most, the fifth paramter is passed
+ * Xen hypercalls have 5 arguments at most, the fifth parameter is passed
  * in r4, differently from the procedure calling convention of using the
  * stack for that case.
  *
-- 
2.48.1

