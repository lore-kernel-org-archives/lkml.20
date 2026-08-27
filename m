Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2707A384CC3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803133; cv=none; b=Mc3K35erwOLlDltHJ5OoQaqRy7ayY6wCN32suRY81ObqnjS5M7fszK0CHy6jHrgDmYZS676rRvdaSXtw4w4RqNZNkTJDE8Ttc14lcm5fWkEGA4riywVHH6P84BjbSOFoDal+WIEbKGW2Qw1FMaKYp6/SRwlgXvLi2cMUy1e4qD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803133; c=relaxed/simple;
	bh=BzqgNjOdN0qWM98KhttEMRv4SJhBp4Q8vk+Bnvl2unQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LC44IxGisNQY1rUdbpUb5KbDMLjRFpecoHzjlxK0+hk4IeOfg907h04zCSS7U2h1Z4jaPqjkmr0YwX9Qbg1rVXr9Xeb+c40F2XhqK7lQHptQ3AZCyobujcBTcUMmEzViKvcpTk9M7AnwzI+OJ9svmisXk6USFGN8HMxlQ4XdtKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xf5CW7Pl; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf5CW7Pl"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f4dedd67b8so290214a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803128; x=1788407928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDTVl8cWfdTr0o46le//A8VK9qr8kHkjMhgj3GG9T/8=;
        b=Xf5CW7PlFI6Ws8j3JYQcE+FC78l4ExlOK+TomvRgwJqcmHBPJo4B8RIrerwtb0ymAc
         ITZWgI2Xt30ErNw3xVPg1bu7fSDxd0plcaK5Pm5K39pQEPKcRyO8ix0nOKkCLtsU2WYa
         Hb13OOrnUGW44pO+ogGRkAky3yTJTm3TMmqAwsQ6vIY7QLN7oY9RBJrcYqTpLiUFuS2Q
         ZFEEJ14LuEnyjHlPtoHKV/+fZfB42aopGwU6lmCbtcHOTmJV9KQFtFT13GRRAzlr8tcu
         MF+XljN8zQm0Uf2zXWbM3ylXny+UX38sjNtRZivQz+OWzMkhr794BxkWmVDlxnoLFCxY
         H+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803128; x=1788407928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDTVl8cWfdTr0o46le//A8VK9qr8kHkjMhgj3GG9T/8=;
        b=buJcf6VjFzcVs+1C3qFjwDF4c2x6HpvjkPZS+tpfknLX4i8f5dspCz4j/4Crkg3iAa
         vY0wsWjet22QBW7F30AyJACB/aay+VDWNNvHL/gbuP3DnBhsLVJi/ENJ6GLv3yyQjnKx
         f/p/m4lXeWf3pKo0naiQDWAvBU9iP6imv3WffkuJiVKAjQ9QFEKJZjKRJoGCvOVC3S7x
         Fs9Mlbqk2wSGe3cPPsHVD/HoI5UX8s+CWajIXFTSYdsnffjuqtmkdnhLHx9DZnTz6OaZ
         MLw+SSq8PsTrG4zjMhCE6eoqA8tTuiwh8rM6hqi7DyUdMKBKgwMV2fk30eAdK3+6g+t0
         kAtA==
X-Gm-Message-State: AFuF++lXIPVQRD00lKpQ73jhon16DdTmnffv8rd+4Cx9LQloGAW8kzdJ
	EIZLpJlADfS5mji+nDEr3Y/ZUjTeZI6srNfHq0DLqjZ4gno13reXElIv
X-Gm-Gg: AR+sD11O82P3tn7iEH2JzyQxGhZe1KOTi5Y3fWo+OJnFTJ4yqmdJUN4he5ToL6jyWeY
	TsnTNjr6V+4G6oQnuL22bgPPwzsHogXtCZ8gJMgquJRs5WpFOIFAWNonhKrfKq2Pgcyq+LYHug2
	0woaSHgvJAyrP9S89unYe2wSYTZcK0WAnvPvd4vz4ULFpE/ekMGwyr+Zn+Te5N+ixkLoCFTzInL
	nfqJBRkacngsYC3f9OAarR3khKwCANav2fvDRKOShWsdwjtArZkhacmn4XdmqHmJxYC6diRgS5n
	jSD0pi4dDrmOvkm1FP/6472u9OI908tS53q7pt8XW0n8d5nxU15Bk++C3EclH9lLyfgKnXv1PmD
	JYEsRB2s70HTcLI1vZ9xb8vdQdUJogMhL1ZXxLc8DxjuVhdpMqB8v9bDhhKrVCSTuZGI+U+ocuZ
	06brnKX8gRNT2i+/zG5tYwUS28t70/OQZRxULHuU1rzQTZ+IXs8xHI728cuatHzkBYTku6LIzV2
	fw1vc4nua9TPAhSetWHCiN8LSDg7CXe0HISeGp5YcIjMH+HMNibqlqSBIXEO9lF2/ZcNhnlJqdu
	qJaSzE+jmaYfFffUlTA=
X-Received: by 2002:a05:6820:8593:10b0:6b1:3756:f77a with SMTP id 006d021491bc7-6b1a0389cdcmr9677806eaf.4.1787803128002;
        Wed, 26 Aug 2026 20:58:48 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-467367af2bfsm900825fac.6.2026.08.26.20.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 26 Aug 2026 21:58:38 -0600
Subject: [PATCH 6/8] lockdep: Free unused reservation slabs to buddy
 allocator at late boot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-lockdep-memblock-v1-v1-6-e2db855391ec@gmail.com>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787803120; l=5965;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=BzqgNjOdN0qWM98KhttEMRv4SJhBp4Q8vk+Bnvl2unQ=;
 b=MDUgGiEKUryrVrUZTIzcm+YR05qsgFsIkE6zi/LCIGQDrkqmFmPPCH9mkQ5wfUrkqM5PcB3V8
 OGWx/1mTYZZAEucbtYQYVoA70FFWI/xHZwNw4uGsbkAS1/2izErx2M1
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

During early boot, lockdep reserves a generous slab pool (e.g. 64 slabs =
4 MB) from memblock to guarantee uninterrupted initialization. Once
the kernel reaches late_initcall, the boot locking storm is complete,
and lockdep's steady-state working set is known.

Add lockdep_post_init_trim() as a late_initcall_sync handler. Calculate
required runtime headroom (default 100% headroom over boot usage, with
a floor of 32 slabs, or custom lockdep_slabs=N / lockdep_headroom=M%),
and return all excess slabs to the buddy page allocator via
free_reserved_page().

Also register a reboot notifier to log total lifetime slab consumption
and remaining headroom on clean system shutdown.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/locking/lockdep.c      | 71 +++++++++++++++++++++++++++++++++++++++++++
 kernel/locking/lockdep_proc.c | 23 +++++++-------
 2 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index b2dc7619a5e3..3fb6c07cea36 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6992,6 +6992,77 @@ void __init lockdep_init(void)
 	       sizeof(((struct task_struct *)NULL)->held_locks));
 }
 
+static int lockdep_shutdown_notify(struct notifier_block *nb,
+				   unsigned long code, void *unused)
+{
+	unsigned int used = lockdep_slabs_used - lockdep_nr_free_slabs;
+	unsigned int total = lockdep_nr_slabs;
+	unsigned int free_slabs = total > used ? total - used : 0;
+	unsigned int headroom_pct = used ? (free_slabs * 100) / used : 0;
+
+	pr_info("lockdep: shutdown summary : %u/%u slabs (%u kB/%u kB, %u%% headroom left), %lu classes, %lu chains, %u hlocks\n",
+		used, total,
+		(used * LOCKDEP_SLAB_SIZE) / 1024,
+		(total * LOCKDEP_SLAB_SIZE) / 1024,
+		headroom_pct,
+		nr_lock_classes, lock_chain_count(), chain_hlocks_used());
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block lockdep_reboot_nb = {
+	.notifier_call = lockdep_shutdown_notify,
+};
+
+static int __init lockdep_post_init_trim(void)
+{
+	unsigned int used = lockdep_slabs_used - lockdep_nr_free_slabs;
+	unsigned int initial_slabs = lockdep_nr_slabs;
+	unsigned int target_slabs, kept_headroom_slabs;
+	unsigned int freed_slabs = 0;
+	unsigned int i;
+
+	if (!lockdep_nr_slabs)
+		return 0;
+
+	/* Compute headroom requirement (default 100% or custom percentage) with 32-slab floor */
+	kept_headroom_slabs = DIV_ROUND_UP(used * requested_lockdep_headroom_pct, 100);
+	if (kept_headroom_slabs < 32)
+		kept_headroom_slabs = 32;
+
+	target_slabs = used + kept_headroom_slabs;
+
+	/* Satisfy both: target_slabs >= requested_lockdep_slabs AND headroom >= M% */
+	if (requested_lockdep_slabs > target_slabs)
+		target_slabs = requested_lockdep_slabs;
+
+	target_slabs = clamp_t(unsigned int, target_slabs, used, lockdep_nr_slabs);
+
+	/* Release excess slabs to buddy allocator */
+	if (target_slabs < lockdep_nr_slabs) {
+		for (i = target_slabs; i < lockdep_nr_slabs; i++) {
+			struct page *page = virt_to_page(lockdep_slabs[i]);
+			unsigned long p;
+
+			for (p = 0; p < (LOCKDEP_SLAB_SIZE >> PAGE_SHIFT); p++)
+				free_reserved_page(page + p);
+
+			lockdep_slabs[i] = NULL;
+		}
+		freed_slabs = lockdep_nr_slabs - target_slabs;
+		lockdep_nr_slabs = target_slabs;
+	}
+
+	pr_info("lockdep: boot complete : %u/%u slabs used, %u kept (%u%% headroom), %u returned to buddy (%u kB freed)\n",
+		used, initial_slabs, lockdep_nr_slabs,
+		lockdep_nr_slabs > used ? ((lockdep_nr_slabs - used) * 100) / used : 0,
+		freed_slabs, (freed_slabs * LOCKDEP_SLAB_SIZE) / 1024);
+
+	register_reboot_notifier(&lockdep_reboot_nb);
+	return 0;
+}
+late_initcall_sync(lockdep_post_init_trim);
+
 static void
 print_freed_lock_bug(struct task_struct *curr, const void *mem_from,
 		     const void *mem_to, struct held_lock *hlock)
diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 1916db9aa46b..95b76047918d 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -32,16 +32,17 @@
  * bitmap and max_lock_class_idx.
  */
 #define iterate_lock_classes(idx, class)				\
-	for (idx = 0, class = lock_classes; idx <= max_lock_class_idx;	\
-	     idx++, class++)
+	for (idx = 0, class = idx_to_lock_class(0);			\
+	     idx <= max_lock_class_idx;					\
+	     idx++, class = idx_to_lock_class(idx))
 
 static void *l_next(struct seq_file *m, void *v, loff_t *pos)
 {
-	struct lock_class *class = v;
+	unsigned long idx = ++*pos;
 
-	++class;
-	*pos = class - lock_classes;
-	return (*pos > max_lock_class_idx) ? NULL : class;
+	if (idx > max_lock_class_idx)
+		return NULL;
+	return idx_to_lock_class(idx);
 }
 
 static void *l_start(struct seq_file *m, loff_t *pos)
@@ -50,7 +51,7 @@ static void *l_start(struct seq_file *m, loff_t *pos)
 
 	if (idx > max_lock_class_idx)
 		return NULL;
-	return lock_classes + idx;
+	return idx_to_lock_class(idx);
 }
 
 static void l_stop(struct seq_file *m, void *v)
@@ -59,7 +60,7 @@ static void l_stop(struct seq_file *m, void *v)
 
 static void print_name(struct seq_file *m, struct lock_class *class)
 {
-	char str[KSYM_NAME_LEN];
+	char str[128];
 	const char *name = class->name;
 
 	if (!name) {
@@ -79,9 +80,9 @@ static int l_show(struct seq_file *m, void *v)
 	struct lock_class *class = v;
 	struct lock_list *entry;
 	char usage[LOCK_USAGE_CHARS];
-	int idx = class - lock_classes;
+	int idx = class->class_idx;
 
-	if (v == lock_classes)
+	if (idx == 0)
 		seq_printf(m, "all lock classes:\n");
 
 	if (!test_bit(idx, lock_classes_in_use))
@@ -133,7 +134,7 @@ static void *lc_start(struct seq_file *m, loff_t *pos)
 	if (*pos == 0)
 		return SEQ_START_TOKEN;
 
-	return lock_chains + (*pos - 1);
+	return idx_to_lock_chain(*pos - 1);
 }
 
 static void *lc_next(struct seq_file *m, void *v, loff_t *pos)

-- 
2.55.0

