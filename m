Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6336F8F2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750218; cv=fail; b=imaF2i/3c/S7cvRp8Lx/lnByDwLxT1WrZTao4p5rOXVgP6DRt8l3MJtG/kvsLJ+qVZKT9f4zc+58CuNx+un2hGrMK1opVIHBmBag2anhtKokRoDJnyeZyZpmBTFJSCq21Ly0d9SZGWUshddCyBJbSxwieddZFxHCqpgaTKS0mDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750218; c=relaxed/simple;
	bh=kzDPSc/lZdqjvXcHbemF5wZiymWImhb8GFz8kkkH11s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJsrHvqbvV+0MInjZtelL97VRXDlcF+7HgHAh3bYlf1OcjcMvc+88mUsQKhHqOvqFp/d+ngZjo/qQjLDxVGqY+OdwW5Ukt2gGafzeDACaROVoAJSE2lQE3G6N1I5Rpe/Z43fm7+6g+Nh+5jhTDPkFLNjEPvzyB9lkcYk9i8oh1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D9E481022;
	Wed, 30 Sep 2026 06:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm6BMWKRjpYP; Wed, 30 Sep 2026 06:36:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEC7780AFE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.9.71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790750208;
	b=HMetY7rxg6E0y5e43V4/0+556gxqbr8q2z4A4mo5Zho2UbCFJApPIoq3RCn9k18/NNfl
	 5GcKFnc8yahBQbLk+W/6/IgynHM6sJN1XWvIqzyrGQ7QEeZHYi0/4ffY90vJ2kBBuIANu
	 mIgg4IvPNcN7XFF+zZf8DAyYddJSH/gU6cN8lXxEcOz3TercKE7Kutj440V1wwxTDxTEe
	 E0zxsTArANGheBwRpQzj+4IJQiXxhqgASIKBhANElWG/bfz3/MyWKArobd8PiIhadIGXd
	 vmVEdWxHh0cbHr4FO39bOnLK1myP47kS1K99zc2evTEa9znb2TBtOPSNYG1d980ChGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790750208;
	h=X-Comment:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/f72Z+MEWNGWysprS0ii85w3IitLDtyI12UnQpvPMAI=;
	b=qzpVxkOdZW7x+zOiAt8kqKUhHV4Jn86ppzwPm4J0LLbNCfcBUP5ddpveFMIKyx8B6f5I
	 41Q2lQW6JpgiZ+e4bC4IUiyUA8u+2XnaKtjC2dQcqJMKllAXeTvMNcCCjdIg+uqOdapiO
	 AMUwPF7coBAINFkwrHvjDnD/KTK1BS2LRKohn/7Q77uwSCQ2zeoyykkGkfCNBjdsaDM3N
	 KAK6xm77UKvwqUeq2EjqCvAjUiH5ERQOOF6K1y0bbgwRJ6bJ/neMR2dZKO2c/4bDUwXZh
	 1SxZyq2IMa2pZfiJsvvEe4JgkJcFL/6yVUMe+FCmU2i/+hOQnhcoPowHVY62anKEmTw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.9.71
X-Comment: SPF check N/A for local connections - client-ip=140.211.9.71; helo=p10-linux-brads.localdomain; envelope-from=root@p10-linux-brads.localdomain; receiver=<UNKNOWN> 
Received: from p10-linux-brads.localdomain (p10-linux-brads.osuosl.org [140.211.9.71])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EEC7780AFE;
	Wed, 30 Sep 2026 06:36:47 +0000 (UTC)
Received: by p10-linux-brads.localdomain (Postfix, from userid 0)
	id D59A04407F3; Wed, 30 Sep 2026 06:36:47 +0000 (UTC)
From: Bradley Morgan <brads@mainlining.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH] arm64: scrub vector and pointer auth state on task death
Date: Wed, 30 Sep 2026 06:36:47 +0000
Message-ID: <20260930063647.1356613-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a task dies its SVE, SME and FPSIMD register state, and its
pointer auth keys, stay in freed slab pages until the allocator hands
them out again. init_on_free=1 users get this wiped for the whole heap
but the option is expensive, so it is off in most builds.

The vector registers are not idle memory: userspace crypto runs
AES-GCM and Argon2 through SVE, so key material ends up in
sve_state, sme_state and thread_struct. On task exit and on the
exec and vector length reallocation paths those buffers are
dropped with a plain kfree(), and on task death the register file
copy embedded in thread_struct is not wiped at all. Anything that
reads the freed slab back (slab bugs, cold boot, a leaked page)
gets the dead task's keys.

Scrub it. kfree_sensitive() already exists for this exact job,
so the freeing sites just switch to it. The register file copy
and the pointer auth keys embedded in thread_struct cannot go
through kfree_sensitive(), so arch_release_task_struct() zeroes
them directly with memzero_explicit().

Scrubbed state:
  - sve_state, sme_state allocations, freed on task death, exec
    flush and vector length change
  - the uw.fpsimd_state register file copy embedded in
    thread_struct
  - pointer auth user and kernel keys embedded in thread_struct

This is a cold path. The cost is one memset of at most a few KB
plus the register file per dying task.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arm64/kernel/fpsimd.c  | 12 ++++++------
 arch/arm64/kernel/process.c | 16 +++++++++++++++-
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..c149c12ba9f9 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -737,7 +737,7 @@ void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__always_unused p)
 #ifdef CONFIG_ARM64_SVE
 static void sve_free(struct task_struct *task)
 {
-	kfree(task->thread.sve_state);
+	kfree_sensitive(task->thread.sve_state);
 	task->thread.sve_state = NULL;
 }
 
@@ -846,13 +846,13 @@ static int change_live_vector_length(struct task_struct *task,
 	 */
 	fpsimd_sync_from_effective_state(task);
 	task_set_vl(task, type, vl);
-	kfree(task->thread.sve_state);
+	kfree_sensitive(task->thread.sve_state);
 	task->thread.sve_state = sve_state;
 	fpsimd_sync_to_effective_state_zeropad(task);
 
 	if (type == ARM64_VEC_SME) {
 		task->thread.svcr &= ~SVCR_ZA_MASK;
-		kfree(task->thread.sme_state);
+		kfree_sensitive(task->thread.sme_state);
 		task->thread.sme_state = sme_state;
 	}
 
@@ -1195,7 +1195,7 @@ void sme_alloc(struct task_struct *task, bool flush)
 
 static void sme_free(struct task_struct *task)
 {
-	kfree(task->thread.sme_state);
+	kfree_sensitive(task->thread.sme_state);
 	task->thread.sme_state = NULL;
 }
 
@@ -1687,8 +1687,8 @@ void fpsimd_flush_thread(void)
 	current->thread.fp_type = FP_STATE_FPSIMD;
 
 	put_cpu_fpsimd_context();
-	kfree(sve_state);
-	kfree(sme_state);
+	kfree_sensitive(sve_state);
+	kfree_sensitive(sme_state);
 }
 
 /*
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..c1d5d7c0fd3f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -344,6 +344,20 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
+
+	/*
+	 * Wipe the register file copy and the pointer auth keys, they
+	 * can hold key material the dead task used.
+	 */
+	memzero_explicit(&tsk->thread.uw.fpsimd_state,
+			 sizeof(tsk->thread.uw.fpsimd_state));
+#ifdef CONFIG_ARM64_PTR_AUTH
+	memzero_explicit(&tsk->thread.keys_user, sizeof(tsk->thread.keys_user));
+#ifdef CONFIG_ARM64_PTR_AUTH_KERNEL
+	memzero_explicit(&tsk->thread.keys_kernel,
+			 sizeof(tsk->thread.keys_kernel));
+#endif
+#endif
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -397,7 +411,7 @@ static int copy_thread_za(struct task_struct *dst, struct task_struct *src)
 					sme_state_size(src),
 					GFP_KERNEL);
 	if (!dst->thread.sme_state) {
-		kfree(dst->thread.sve_state);
+		kfree_sensitive(dst->thread.sve_state);
 		dst->thread.sve_state = NULL;
 		return -ENOMEM;
 	}
-- 
2.53.0

