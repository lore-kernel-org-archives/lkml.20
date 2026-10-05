Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E64E2F1E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220670; cv=none; b=FRjbHjFhSziRka2t8pfnc6LK2pguW2qnE7+1lJfY6zpjvnuPO+ATRZAlVrkNfjW9nJp+6sZOPet8w3MJKYnftjPogyoDzXPpqgMBoSZ7juw7ku0mFabNmeyDLFwuB7ZbFUiP7WDJbzhpZ72rLWqWpL4pTOC0ZG0voJghjaQCBAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220670; c=relaxed/simple;
	bh=9oP9VQ+JM/9PdWJ+5+ZGbwB85sJAY1eTAyp/fwZIqqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFShccywQ1FF+z+gF9EfeXmup06ur7DFNiAdHEcMTiJogfpJAwWFszlZqu6ZzXl7NrmRlAgF0NWmLxSrZS1ahMEwNAfMYGPX8SekBoSRy9qhQtbt1yIE1KO41F+JluvfVBHIuncpUTlDZ+GQ6mIN84AHYGEn7lXgcJ91xtr4NdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ns7XeNDB; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns7XeNDB"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so940431a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220668; x=1791825468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=ns7XeNDBEiEeUI6DMxj/Lo+OKLE2ftneMsq1CGeZTzWJRXOKh56hBIMnCvzzCvJgU+
         u5szmqm6erw6fCCc8Hs3KGvR8Rak60TxHSEBaYSSTzVoxI0+Bn/DaNuBq/vuk2hUI7sC
         T5gEDkLnnar+fyq/sr0SrB45DqULc6J6418sm+qEfA2KDhHo8+7F1c3XzDp34qkSXmIv
         xawx4JmY4YmKW0vvV/nFuajInG/3W7b7gFEnLEDxoQ+SLTVndRg9AsGhL9HADg0H1kSh
         sJXr4JDrKcW4xhkCgvQpoAnBFmO9OzrHMXCg+Fz6tKWihM6jzVqWYhTYtkPdCIdRo/gp
         i7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220668; x=1791825468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=JJmXmNlm4ZX1Wllsh5rWjbdwsXO6K9T8/4AYzPfuXUn5RhHXJspPOhmx4D6xN7+FRe
         7udRGVqj2JfD1XcnSFDbQSqvFRHNuQhnFj49sdOAR7xqAEhycTTrAybVjGdq998q10fP
         tmCP85wSF2bLx8jTygpyYDQmYMJYJ+fYpckn+5Y9naf+QXgIXcN5xizRZYoC9kkRv1Os
         Ozg6D81eH8SV9+PKdYSwsrsI1RoPa9Vx8RFmIUS6Cn3ftZj2LJMk/kPSWGNZTHgoHR8a
         VfPdNiNIrRH0cCL42N0eQmoCs4Uz3y+rvi1V/pHkziwDbRR/WjDJV5wBf4B+4IanxCkh
         N1ww==
X-Forwarded-Encrypted: i=1; AKwUvBz1jw1k2jsP2cW5BengcZzn8jXNeKFSSxiQIZpeMgfq7zHOiwESZioANvW9Ans3DbbgTckNUx9hFAk+888=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxkcrSixvx6C04gvIqkTY2qUDr1fpRBOmKIVCLx4duQ8nlaW51
	3XA6w+WLnWgTSmdDaUoVGWHcIwPfGdjg9VHy8MtOTPh8sXlLeIe2SGbP
X-Gm-Gg: AYBFou2UzaL2DrWENXc+TSrDY9dvff4L6eX3mkxQPDU3rmsSR0BTEjxwoSlknXNbdoM
	Aj20poyS/5insh+plO1YS/UdME/Hj7hRGtuw944cWuBRxOtXMHwm3vYkS39x7JOgRkRQW9s8q2B
	/JYDEa20jxpPzjeTNGszfL6R6xCU0lC++FiLr6zkcDyFZmyUT1MnmZkQ+WR9nqmxLkRKkjPH1V1
	0nr5nJZuEbT4S3LECq/vo8oYlwpgQceeovuOsyphtVRvmjw0GcMvrzNGyCb9FL8dXTUPe7pOQus
	PgTzUUPO6hvaR2Vt4ln0abphjcqGM/zls60ChGMs2wGZK4k+g5PcQbqw5xXDkc6j/M380zBKZCT
	1qpbmp8CGT0P2wtNwGMC37WzUpNBDOB7fzwWEHEaWg0RqtNQ9PtNoMm0l2wtlKnTDUYAmmfDPs8
	C7kU1I95W7PC7pioubKvIPC7uT3Dfri8/a/Ks3yzPmh5tah6AYVVZZ04s6UCiUkQrAcCKszIk2f
	AV5M2mR/YsVL4rILx4ZxDJIEOJr2k9CasuyV8lO
X-Received: by 2002:a17:90a:2ce1:b0:3a6:dc2f:f087 with SMTP id 98e67ed59e1d1-3a6dc2ff4ffmr2745576a91.53.1791220667397;
        Mon, 05 Oct 2026 10:17:47 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:46 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 09/15] rcuscale: add hazptr scale type
Date: Tue,  6 Oct 2026 01:15:23 +0800
Message-ID: <20261005171529.1378809-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hazptr reader and synchronize operations so that synchronize
latency can be measured alongside RCU and SRCU.

Use a small set of objects so readers do not always protect the
same target.  Each reader protects the object selected by its CPU,
while the updater round-robins through the objects.

Use hazptr_synchronize() for both normal and expedited scale
operations, since hazptr has no separate expedited operation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 70 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 1097ec15879c..5aca31c3c01d 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -39,6 +39,7 @@
 #include <linux/torture.h>
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
+#include <linux/hazptr.h>
 #include <linux/sched/debug.h>
 
 #include "rcu.h"
@@ -418,6 +419,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
+
+#define HAZPTR_SCALE_NR_OBJS 8
+static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
+static atomic_t hazptr_scale_sync_idx = ATOMIC_INIT(0);
+
+struct hazptr_scale_state {
+	struct hazptr_ctx ctx;
+	void *addr;
+};
+static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
+
+static int hazptr_scale_read_lock(void)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+	int idx = smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
+	void *ptr = &hazptr_scale_obj[idx];
+
+	state->addr = hazptr_acquire(&state->ctx, &ptr);
+	return 0;
+}
+
+static void hazptr_scale_read_unlock(int idx)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+
+	hazptr_release(&state->ctx, state->addr);
+}
+
+static unsigned long hazptr_scale_completed(void)
+{
+	return 0;
+}
+
+static void hazptr_scale_sync(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static void hazptr_scale_sync_exp(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static struct rcu_scale_ops hazptr_scale_ops = {
+	.ptype		= 0,
+	.readlock	= hazptr_scale_read_lock,
+	.readunlock	= hazptr_scale_read_unlock,
+	.get_gp_seq	= hazptr_scale_completed,
+	.gp_diff	= NULL,
+	.exp_completed	= hazptr_scale_completed,
+	.sync		= hazptr_scale_sync,
+	.exp_sync	= hazptr_scale_sync_exp,
+	.name		= "hazptr",
+};
+
+#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
+#else
+#define HAZPTR_SCALE_OPS
+#endif
+
 static unsigned long rcuscale_seq_diff(unsigned long new, unsigned long old)
 {
 	if (!cur_ops->gp_diff)
@@ -1110,7 +1176,9 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		&rcu_ops, &srcu_ops, &srcud_ops,
+		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

