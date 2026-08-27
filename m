Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7C38F935
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803131; cv=none; b=i8dqN7D0JjGWjklbt5Zz7ysqZE+DiGmx12vTLQFgQxfEekvZNMWbZ4+Hu9RbAM7zTzlY/g+RHt/0VJqRR0SQZo+6gBG2BFOTDFCq11hsUfifiFZ7NVWAFRKzxFImNWFw9u8LhMfAcHxJqmudr9kSrKT/EUNWK+bAqf6Cn2sSPW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803131; c=relaxed/simple;
	bh=kqAGrQKBnvnPgOUp0Is/BsYIX2enC25F2BBLntksDdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2ToV1CVYtOTJmATwRVNiZpL/nthxZgQOpJoKpEEZvrN2oDNe3aoXlaVLxZ5tg0tLyLUF6nCScOrDGL49rbbMHAFqpwIcURHrnCBoHgEJi23UjKSUzZXTDPjmBcU3PnksuFBAsnjQEwJTIFS5H/gMoZCDoH+F5EJQUM9H34Nngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+UJI7Gt; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+UJI7Gt"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-459281bc13bso1608746fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803129; x=1788407929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZxMQK5WtsXLFwQrtkbnqWWj54ZVBmL2OgaA3/jRW4s=;
        b=J+UJI7GtsUnE4UAjjCj4A+YUDvrw9ECyndehe8/209qhTS0NvXuwTS40vEhPrifsde
         N84eaCSmVIMpwx1eVXeKM/cm827RLgvQ8GF9ZFCuiILDNh7OQtiXFlLRMOa9cLWUy/EO
         gzu9iPPLcv+ZMJdqsbEVQsAyr+qASsHkb9G9QXJGJcc6g35GcCiuXY7zVcp6mRo7+dOI
         oqgCQbJt0fItEUOtNZOL4YIe8fkpPFONMyykeVDjdy9xry6lrD/UBudgxqFFS6woG/9j
         9YluZ2wwqAEllTFx10JPmolhCsSffQw15I9+KJHr+DibO1oxB8mQx3ILF0f65Q4DOzm8
         eXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803129; x=1788407929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZxMQK5WtsXLFwQrtkbnqWWj54ZVBmL2OgaA3/jRW4s=;
        b=nTxJC7ZpJ1lj8laPXLsxWzHCVOJl9L+Uw1tnjYJygamnCtmRiLGs2f6tj0CTc/vab9
         OmQqRepFhHvYRQWv3mURlxZOzcwHoi4fiYUbK/iqixMN3ZkQ4KXpmJXqWx38oTN5PiYN
         jUpGCXBLglZ/q7i3v/1zztnuPxslVzEogrRoNaJ3gQVDBnsKM4PoIcw2CHT2rXSwnCHa
         4Tl2spqjf8UUIOVKlKdV+gWJ14/VCczxsZOtFIoHSEGACFwGkXUNytwJPE859cDKijXa
         7p6gxz8MEcPD7UiB3vCUq3C89vT4X0QW5bKnPEy93sI8UB62+qQGzxARsm0BnDYs8up2
         G1Vg==
X-Gm-Message-State: AFuF++khQu57JmA8Kgh2ZugzBcwwVpwmE3EZE1/pLOFnC0QPJM5OhUPH
	onIJ5keIJ80DZiqCQjOxhFP8Yfd9haB5uYhw4eJyO1N29OjabyhNcZRZfqOZhA53
X-Gm-Gg: AR+sD13XXCm8X/HlQXQuRn2ftT5B+Xxrm/dFJov+DfZmGyANiom5XdZP+rB69jOqB5E
	9JFTRF0E1SryrLejxO+vHn98EdawzgT/m/uH31pZGf0wt1JqBcD7Nadw0SJ8g0t8zrY86aBimLX
	bCoEfxhxs7+YiakEW+XHDjMGRnnbxpKGe5xkSkYPMShSMzECP+B2L1bhcAUy8p8DrdkqHaWdImN
	N9ejIT52pkownlL8jAr/aL+yAEQiiVDSvH3Rfetyk1RX13TmHwoZ+EmxkAXnthXVhP6E1QvCcXh
	BB0edfsVhwtimES+aPh/GguFbpEeS3Eb6sCtuMK8VWyUkkkVIY11cQJyg9nHT5VMzDVvFDchaM8
	YpSO1W+2VOseCslBxZJzZIIuL1sAbCJgO0QNvWVtUVxItxOkp4mP7jL47vbamXohrmCNU+Xy7Pb
	Yj7w8g3QGANn23n5t5N/6hBrVYLTyVIqCrB2XItEj5sHnrBNU5bJP2YjBkUjwpd49bn0ItVJLiB
	Bo3dYfAXIwn3+wvWmrx75/YINSD0WnAjfyxf+y9ylV6I/8A/Z5gEiqnq0S8VD2H37LKn1nkp6dv
	x6EFvRjq
X-Received: by 2002:a05:6870:fb9f:b0:448:9d5b:6393 with SMTP id 586e51a60fabf-46599f6067dmr13214306fac.14.1787803128910;
        Wed, 26 Aug 2026 20:58:48 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:39 -0600
Subject: [PATCH 7/8] lockdep: Expose slab pool telemetry in
 /proc/lockdep_stats and initcalls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-7-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=6448;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=kqAGrQKBnvnPgOUp0Is/BsYIX2enC25F2BBLntksDdM=;
 b=uZ7Wd4Ljf/hajAN/9LfeUHolQFsjSym1A2G7yUaBESqdf1Nk/KyZ1IOyQ1xCbiOic1T7KNxRT
 VZARg1PyRvqDcUhCkOrFsgt+JIEwGWPdisQ8y0WJHs77+lp6PcZmx2d
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Extend lockdep observability to track slab allocation dynamics:

0. In /proc/lockdep_stats, display total reserved slabs, used slabs,
   free slabs (headroom), and a per-consumer slab breakdown (lock_classes,
   direct deps, dependency chains, chain hlocks, stack traces).

1. In lockdep.c, add lockdep_report_stage() hooks registered across
   initcall milestones (core, postcore, arch, subsys, fs, device, late)
   to log slab consumption progress throughout kernel initialization.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/locking/lockdep.c           | 47 ++++++++++++++++++++++++++++++++++++++
 kernel/locking/lockdep_internals.h |  4 +++-
 kernel/locking/lockdep_proc.c      | 40 ++++++++++++++++++++++++--------
 3 files changed, 80 insertions(+), 11 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 3fb6c07cea36..b6048e7c8b56 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6992,6 +6992,53 @@ void __init lockdep_init(void)
 	       sizeof(((struct task_struct *)NULL)->held_locks));
 }
 
+static void lockdep_report_stage(const char *domain, const char *stage_name)
+{
+	unsigned int used = lockdep_slabs_used - lockdep_nr_free_slabs;
+	unsigned int class_per_chunk = lock_class_PER_CHUNK;
+	unsigned int entry_per_chunk = LOCKDEP_SLAB_SIZE / sizeof(struct lock_list);
+	unsigned int chain_per_chunk = lock_chain_PER_CHUNK;
+	unsigned int hlock_per_chunk = chain_hlock_PER_CHUNK;
+	unsigned int trace_per_chunk = LOCKDEP_SLAB_SIZE / sizeof(unsigned long);
+
+	unsigned int cl_w = nr_lock_classes / class_per_chunk;
+	unsigned int cl_f = ((nr_lock_classes % class_per_chunk) * 100) / class_per_chunk;
+
+	unsigned int en_w = nr_list_entries / entry_per_chunk;
+	unsigned int en_f = ((nr_list_entries % entry_per_chunk) * 100) / entry_per_chunk;
+
+	unsigned long chains = lock_chain_count();
+	unsigned int ch_w = chains / chain_per_chunk;
+	unsigned int ch_f = ((chains % chain_per_chunk) * 100) / chain_per_chunk;
+
+	unsigned int hlocks = chain_hlocks_used();
+	unsigned int hl_w = hlocks / hlock_per_chunk;
+	unsigned int hl_f = ((hlocks % hlock_per_chunk) * 100) / hlock_per_chunk;
+
+	unsigned int tr_w = nr_stack_trace_entries / trace_per_chunk;
+	unsigned int tr_f = ((nr_stack_trace_entries % trace_per_chunk) * 100) / trace_per_chunk;
+
+	pr_info("lockdep: %-8s [%-9s] : %u/%u slabs : classes=%u.%02u entries=%u.%02u chains=%u.%02u hlocks=%u.%02u trace=%u.%02u\n",
+		domain, stage_name, used, lockdep_nr_slabs,
+		cl_w, cl_f, en_w, en_f, ch_w, ch_f, hl_w, hl_f, tr_w, tr_f);
+}
+
+#define DEFINE_LOCKDEP_LEVEL_REPORT(lvl, name)			\
+	static int __init lockdep_report_##name(void)		\
+	{							\
+		lockdep_report_stage("initcall", #name);	\
+		return 0;					\
+	}							\
+	lvl(lockdep_report_##name)
+
+DEFINE_LOCKDEP_LEVEL_REPORT(core_initcall_sync, core);
+DEFINE_LOCKDEP_LEVEL_REPORT(postcore_initcall_sync, postcore);
+DEFINE_LOCKDEP_LEVEL_REPORT(arch_initcall_sync, arch);
+DEFINE_LOCKDEP_LEVEL_REPORT(subsys_initcall_sync, subsys);
+DEFINE_LOCKDEP_LEVEL_REPORT(fs_initcall_sync, fs);
+DEFINE_LOCKDEP_LEVEL_REPORT(device_initcall_sync, device);
+DEFINE_LOCKDEP_LEVEL_REPORT(late_initcall_sync, late);
+
 static int lockdep_shutdown_notify(struct notifier_block *nb,
 				   unsigned long code, void *unused)
 {
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index ccd7343af672..6fb776618ac6 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -223,7 +223,7 @@ extern unsigned int max_lockdep_depth;
 extern unsigned int max_bfs_queue_depth;
 extern unsigned long max_lock_class_idx;
 
-DECLARE_2D_RADIX(lock_class, struct lock_class);
+DECLARE_CHUNKED_ARRAY(lock_class, struct lock_class);
 extern unsigned long lock_classes_in_use[];
 
 struct lockdep_slab_usage {
@@ -240,6 +240,8 @@ struct lockdep_slab_stats {
 	struct lockdep_slab_usage usage;
 };
 
+void lockdep_get_slab_stats(struct lockdep_slab_stats *st);
+
 unsigned int chain_hlocks_used(void);
 unsigned long lock_chain_count(void);
 void lockdep_get_slab_stats(struct lockdep_slab_stats *st);
diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 95b76047918d..76e32fca8c54 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -380,17 +380,37 @@ static int lockdep_stats_show(struct seq_file *m, void *v)
 			debug_locks);
 
 	/*
-	 * Zapped classes and lockdep data buffers reuse statistics.
+	 * Shared Memblock Slab Reservoir Statistics
 	 */
-	seq_puts(m, "\n");
-	seq_printf(m, " zapped classes:                %11lu\n",
-			nr_zapped_classes);
-#ifdef CONFIG_PROVE_LOCKING
-	seq_printf(m, " zapped lock chains:            %11lu\n",
-			nr_zapped_lock_chains);
-	seq_printf(m, " large chain blocks:            %11u\n",
-			nr_large_chain_blocks);
-#endif
+	{
+		struct lockdep_slab_stats st;
+
+		lockdep_get_slab_stats(&st);
+		if (st.total_slabs) {
+			unsigned int free_slabs = st.total_slabs > st.used_slabs ?
+						  st.total_slabs - st.used_slabs : 0;
+			unsigned int headroom_pct = (free_slabs * 100) / st.total_slabs;
+
+			seq_puts(m, "\n lockdep memblock slab reservoir:\n");
+			seq_printf(m, "   total slabs:                 %11u (%zu kB)\n",
+				   st.total_slabs, (size_t)st.total_slabs * 64);
+			seq_printf(m, "   used slabs:                  %11u (%zu kB)\n",
+				   st.used_slabs, (size_t)st.used_slabs * 64);
+			seq_printf(m, "     - lock_classes slabs:      %11u (%zu kB)\n",
+				   st.usage.lock_classes, (size_t)st.usage.lock_classes * 64);
+			seq_printf(m, "     - direct deps slabs:       %11u (%zu kB)\n",
+				   st.usage.direct_deps, (size_t)st.usage.direct_deps * 64);
+			seq_printf(m, "     - dependency chains slabs: %11u (%zu kB)\n",
+				   st.usage.lock_chains, (size_t)st.usage.lock_chains * 64);
+			seq_printf(m, "     - chain hlocks slabs:      %11u (%zu kB)\n",
+				   st.usage.chain_hlocks, (size_t)st.usage.chain_hlocks * 64);
+			seq_printf(m, "     - stack_trace slabs:       %11u (%zu kB)\n",
+				   st.usage.stack_traces, (size_t)st.usage.stack_traces * 64);
+			seq_printf(m, "   free slabs (headroom):       %11u (%zu kB, %u%%)\n",
+				   free_slabs, (size_t)free_slabs * 64, headroom_pct);
+		}
+	}
+
 	return 0;
 }
 

-- 
2.55.0

