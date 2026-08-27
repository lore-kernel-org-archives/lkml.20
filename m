Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BFA390219
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803137; cv=none; b=m4szEiu6p4xhAuYabOurR2MWn/UJQlW39MXNzswA+pmygk4r/lEVx1ugo5AJfQYeM8vxOkibuPDCoruoyRUOYPB0r6rMeBM8ZixsO8ckzX8fN5SkMFSRdGa0iZ0Tl0dtVuOxHmerM2+sLte71vH3ab0hBTufIGSmdY5YiIsxWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803137; c=relaxed/simple;
	bh=5rx5ERvKixj7FGUQj37v/bHFSs/DaokMES+BAqJO8D0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kn3zeDhzBlVrPrKclWezXBOQYdxoA8baLCFCcUJc+Woeai5kuBOQZyvUoAJG+Iu0njxFfaJq0ROLBX0RNldROOOIHpoYGIG6417Dn/krE51mJLsg3eN8sZrSNnZIoVs80WYKQKoLiy7FEQBmzJDiULMtO4WPPKEwjblsolX3GIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZTPaNqN; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZTPaNqN"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-45e6d266921so140827fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803130; x=1788407930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcJXoO2PZbvQNti1IoEfyjxaC4/aOEYoKd3T652pnHU=;
        b=BZTPaNqN3UZfv6HK7BgxTF2i9YM4J8iPlf2rVfnH9kLtO2jFGamMOYkSdBaeFFQ6jV
         BrR3HRqzKGAUGUsta5GlwnlEO3iroVlKBOPYhOGKoJaoArVT+A51Y40jSq/uoYoQo58n
         y/7DiAGYeagcujx72Tut8mDv0+7fEQ8pYS07rr7dWcMfvDuW+nDcWjOpA/cPTSxkhdsB
         ejQYjIV4BONfpYCsqRdZ3l0NLvLf9zr07VeEY1IZYbQTVCMIppMmygMp3XWDYxq+Jw0k
         x+fUADtmFgN+WfvznkCDfo5KfXjCNbJ82AmGcfdVDNfNNW0QsvfFiEaJykTa5/+oer95
         fqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803130; x=1788407930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcJXoO2PZbvQNti1IoEfyjxaC4/aOEYoKd3T652pnHU=;
        b=Nj8gaUNfjGdsMqN9kqAVkUP+Mj60p/bm6klDdWQk4wxfkwE+BOks8hyT5pG140tq+c
         1PONBuvPAqeJTSkyZQYcaRtvMvNPfE3nd7ZuoqOrZzDy2Hdg9j7oJvP2nXzpIFbIQlr5
         WGlpBo2qMiaUKU/teeW/7gjdpnw0sGwsSn6uIGdwdoJgxOZwDiHaPD/Oo+THwyuDRbmO
         CGlFoEfp+4Ln7mVCXBgJgH/UmWoH96jRi4MVfhFPw1zB10j7U313tDPThbmJ4/cLLV3Y
         LrkkWNINvbEkRElv9NZLU6xIDDu6CisXK2pvMhUrSh7Ko5vza65kMbhmtuvnAE1uMmDR
         hyGQ==
X-Gm-Message-State: AFuF++l2XQjdUJFSV/ERiLPV4UFRvpe/E/Cuz8oHWknBS2Ipj+MF3M/v
	IyVZEzKuz0Aywt0iV1517RugdU9BjQasdmpwDoLg9+vpING4DKSoE3YU
X-Gm-Gg: AR+sD11Rfd9HP7Hsbq2MXz6nm0FxhBsmjrLPMbEm7zIUVnmKS9vUARSygANPhm/nf/S
	Qh6lYBm+aiHUaTeX4NATegUmpmdKtFG2VZ+2BbFsyHMo+C/9+h/1pijdcPcQ/W2UST3mXUAoB1U
	842WUzOKTcWU7yUsMFFYBvqzrU8p9T1Q3K/H9pDuqPYsa4ijxQdr+Gc6r2vnbW6S0Fc3/2c0NB2
	FpQJz5Db75d++ksO2jKpFb/0GmeKqAGqpUaWf/w+0owwEIjUidaEG+5qlaH5r7W4C5MD1w4D07y
	0H3sW/fjAwrDpePJiYZddCHaa3Qmc/+er+uHu9HKW4hE2Fa/jBzcva4Crgt/4PRMTbUtOgn/UCG
	lyzG5boE8K22dmraxioV2/vglFjpJVJYD++217/iTcpEA410vOWFVCNTb6M6/zwZu2hk+l5yZg+
	vQpexxRwJw1JIfhc+1/uDGVOV4CfWz9SnXxbJtiQSQ9onJsD7DRV6XYk0YIfnJr1ujx+uOzEqfU
	ArNO9AEsI9mYT7CfieZa48aw3teR4Aou1tCsbXqtxWL+knHxUe/A5z6trRx2Ayf4o5dwFS5Pl6p
	wDofmgan
X-Received: by 2002:a05:6870:fb8e:b0:464:f373:b579 with SMTP id 586e51a60fabf-46594ee315bmr13253951fac.0.1787803130005;
        Wed, 26 Aug 2026 20:58:50 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:40 -0600
Subject: [PATCH 8/8] lockdep: on debug_locks_off or OOM, recycle all slabs
 to buddy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-lockdep-memblock-v1-v1-8-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=4293;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=5rx5ERvKixj7FGUQj37v/bHFSs/DaokMES+BAqJO8D0=;
 b=h4GLEdvX2vSDycelajSVWzrtr4X5YrylJFcbesojZF33QpWgLG6zxjve68ZDwetZGiBBE7QUc
 hbDCfRUijcbD5+YvKdREkfLskWN6G5wNNvsipXin5pWF2227TbskGO4
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

If lockdep breaks, by assertion failure or for ENOMEM-ish reasons, we
can no longer use the graph-db.  Since most of the graph-db is now
allocated from memblock_alloc() slabs, we can release them all back to
buddy, and hope that freeing ~1.5MB will help. (v7.2 has ~10MB tied up
in .bss).

0. Hook debug_locks_off() / print_lockdep_off() via an asynchronous
   work item (lockdep_sacrifice_work) to release all held slabs back
   to the buddy allocator via free_reserved_page() in process context.

1. Register an OOM notifier (lockdep_oom_nb) at late_initcall. If the
   system encounters an out-of-memory emergency, lockdep sacrifices its
   entire dynamic slab pool (1..8 MB of physical RAM), reporting freed
   pages to the OOM killer to avoid terminating user processes.

2. Clear lockdep_slabs[] pointers and zero lockdep_nr_slabs under
   graph_lock to seal off subsequent allocations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/locking/lockdep.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index b6048e7c8b56..9f28530b2f1d 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -60,7 +60,9 @@
 #include <linux/kasan.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
+#include <linux/oom.h>
 #include <linux/reboot.h>
+#include <linux/workqueue.h>
 
 #include <asm/sections.h>
 
@@ -638,6 +640,82 @@ static int verbose(struct lock_class *class)
 	return 0;
 }
 
+/*
+ * Release all memblock slabs (used and unused) back to the buddy allocator
+ * when lockdep is disabled or during system OOM emergencies.
+ * Must run in process context (workqueue or OOM notifier).
+ */
+static unsigned int lockdep_release_slabs_to_buddy(void)
+{
+	unsigned int freed_slabs = 0;
+	unsigned int nr = lockdep_nr_slabs;
+	unsigned long flags;
+	unsigned int i;
+
+	if (!nr)
+		return 0;
+
+	/* Invalidate table bounds under graph_lock */
+	raw_local_irq_save(flags);
+	if (!graph_lock()) {
+		raw_local_irq_restore(flags);
+		return 0;
+	}
+	lockdep_nr_slabs = 0;
+	lockdep_slabs_used = 0;
+	graph_unlock();
+	raw_local_irq_restore(flags);
+
+	for (i = 0; i < nr; i++) {
+		struct page *page;
+		unsigned long p;
+
+		if (!lockdep_slabs[i])
+			continue;
+
+		page = virt_to_page(lockdep_slabs[i]);
+		for (p = 0; p < (LOCKDEP_SLAB_SIZE >> PAGE_SHIFT); p++)
+			free_reserved_page(page + p);
+
+		lockdep_slabs[i] = NULL;
+		freed_slabs++;
+	}
+
+	if (freed_slabs)
+		pr_info("lockdep: emergency sacrifice — released %u slabs (%u kB) to buddy allocator\n",
+			freed_slabs, (freed_slabs * LOCKDEP_SLAB_SIZE) / 1024);
+
+	return freed_slabs;
+}
+
+static void lockdep_sacrifice_work_fn(struct work_struct *work)
+{
+	lockdep_release_slabs_to_buddy();
+}
+static DECLARE_WORK(lockdep_sacrifice_work, lockdep_sacrifice_work_fn);
+
+static int lockdep_oom_notify(struct notifier_block *self,
+			      unsigned long dummy, void *parm)
+{
+	unsigned long *freed = parm;
+	unsigned int freed_slabs;
+
+	if (!lockdep_nr_slabs)
+		return NOTIFY_OK;
+
+	/* Turn off lockdep before sacrificing tables */
+	debug_locks_off();
+	freed_slabs = lockdep_release_slabs_to_buddy();
+	if (freed && freed_slabs)
+		*freed += (freed_slabs * (LOCKDEP_SLAB_SIZE >> PAGE_SHIFT));
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block lockdep_oom_nb = {
+	.notifier_call = lockdep_oom_notify,
+};
+
 static void print_lockdep_off(const char *bug_msg)
 {
 	printk(KERN_DEBUG "%s\n", bug_msg);
@@ -645,6 +723,8 @@ static void print_lockdep_off(const char *bug_msg)
 #ifdef CONFIG_LOCK_STAT
 	printk(KERN_DEBUG "Please attach the output of /proc/lock_stat to the bug report\n");
 #endif
+	if (system_state >= SYSTEM_RUNNING)
+		schedule_work(&lockdep_sacrifice_work);
 }
 
 unsigned long nr_stack_trace_entries;
@@ -7105,6 +7185,7 @@ static int __init lockdep_post_init_trim(void)
 		lockdep_nr_slabs > used ? ((lockdep_nr_slabs - used) * 100) / used : 0,
 		freed_slabs, (freed_slabs * LOCKDEP_SLAB_SIZE) / 1024);
 
+	register_oom_notifier(&lockdep_oom_nb);
 	register_reboot_notifier(&lockdep_reboot_nb);
 	return 0;
 }

-- 
2.55.0

