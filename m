Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898063;
	b=W6FCtB2D5RBzA3qnEBFYpvSDyIkHFrse7TRzaJq0evok3vCpEWJDvQorTPbhrJ847L5U
	 Uvk9EwZ7sqUueO4ecfKa/ghK9D5nKB/2ui/rCkEi1yEqFfH/vkScHH8vDWsSMTsU6Fm1J
	 zAlXXfmTTiLN94QA3ixariwKfwxctXB7eVTq4smPQ8IfQjjYpf2siBanChl6eQ5rKnT/H
	 E/pTCmNpl6lzf7cMk/00q1qnUlIUGj+nzOsTUEITHiW+8SVx7VjglNqCqlPlA8RW+ady9
	 jkEC/ChFoo8f1D29kG8cNjXlyrlYSA6eVRwruogcFzGND/cfcDXcOjz4m3pYvN3UetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MrA1moz2TdzwU1HhVnodMnxNSc5SLuFCl3xcVF1pB6U=;
	b=Wy/BoXweLF6b+mjbze74rpd74YjaBd6Sgo3f4ywqrRszt9vUgWk2R/a5govWe22kOyqm
	 CahDLQJ19NPXYlzTbAA2yKjTuNIw3gQ6pKGlJONjTFnxSTBQJadUK9ue7XOnX1DBBkvJV
	 IYDlTXHZlxzo6gy09MYZxevu8iyvjYWJ5+YCft9MnwPUCOzk7IphnyRIj7u/PJAlFNkY2
	 QXit+N6Dwq2DZs/lALho0ADtVhBp5Gwike7JBxdG0AQRuk5r46fsSUvUygwRi8Icqyj25
	 y2r7oG7KjKWZap0cQLPkGdGbAc2yMX0VG6ybyORYjk1/GtiPtHaNyq1O4JAnxGSFW1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yjn-systems.com;
	spf=none smtp.mailfrom=yjn-systems.com;
	dkim=pass header.d=yjn-systems.com header.i=@yjn-systems.com header.a=rsa-sha256 header.s=google header.b=gnS9MeDQ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32DB606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yjn-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yjn-systems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yjn-systems.com header.i=@yjn-systems.com header.a=rsa-sha256 header.s=google header.b=gnS9MeDQ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1213226f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yjn-systems.com; s=google; t=1792898061; x=1793502861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrA1moz2TdzwU1HhVnodMnxNSc5SLuFCl3xcVF1pB6U=;
        b=gnS9MeDQ5/oMZtK5B9KfAOniS3zOjtdSK7e7y8X8JACxrEciOaBFfajbvV2VAZtSN7
         SRES4/42mqTzxuPWv76pyA41ZcwKWCP1ZcVWLRouL0YKLDDaWTVtz4ETWvh7mWwchs+y
         4dk/7dLmN+7dRC8HhPMO1SVroygsfES3bj8H6DboqWe2IqzPo/W/fxtNeoTwRBFmoLJK
         yp9wgXSFHdu5BxmYrq43ZrOwZ78Tql3IOcOglyCb00Mc7YBmMaNPcsEplFznhkYMHkC/
         788kDnDPkI70/p3bcj8u0zP5V9YS5/CMfg7dpQtUXlIM2/B3UvER+8U+ZlcySoECdgiX
         t4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898061; x=1793502861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MrA1moz2TdzwU1HhVnodMnxNSc5SLuFCl3xcVF1pB6U=;
        b=DcM1JOs0wXklZDfQQrgbwrMExrfJzclXhF2bTG1n7kI4ZPis8+CNM0pE+7IqpdiT1r
         Vv0U1y/GpYhb3ic17YEpvAvb97kdSwUHSfrxVIdJjLywIQJwyNN5Yxy63ESBX/6jMRgS
         KZ7yFAiLA3ayn1fe0f+CVfX3RKFFsKkLhPwpDCZJ3JpK42T9Mq6wMm2pO/I3hxE9FnJ2
         7DG5iz4H6MXnKSh//QSLYsJRs/Fq1Rtnjd8+lWoU03nvkRQY03Ijg5VmGAqOXlj13NGc
         mJR1NapTp+4wJZhLsjEkuTmOTOnRpy9Ge/wkJRwksu9fSzZr8kTuQK6rpbNkeB1Cn5oY
         unzA==
X-Gm-Message-State: AFq9FYLwMV8OsZqVpMAQlQ25FYgl6uCgQtabDWzFRxaucKLgHoQprjUj
	396rNOBVh4zTcSjRGxv38vDsGM/0JMxxmfxFpIlYNT42RjYurymZaAUkt6yKkABrKmvF
X-Gm-Gg: AYBFou0ZyemtZnT0OewZuioIsj9sGFMtBee5SGMBtR8keFu1T2F3vXxo2IMNpRadqXu
	tcllxJr7usoULZTFo/WXO36Aa6JPdyifXh3zpjJQjimGu2v9d9eJUKoNPRL0Lvrfy0BwD/kQKOS
	jJ++yg3lyDaMpq93LwBTpuXyMgT3OJaV314/Yk50qMZokxzzSaiyoQ/7NA6Pyjn2FCf/o0LZ1r7
	qnVgaKvLYdaS+WQDofD1m6zJTzt+dAFe6vNR1r2SrZNFdqcO9c+ZRniEFLe32w3guNguh+hp10i
	zIwyPZG1ZLkuAEngQzpNZ2s8yKcvsdnK0a7uaoFzpQFd/MXIktgmeXLanQtrrs1D9gnloS2JMSq
	SiaHAM0LNnsZGHrwRrixtArbOngkpeDr5pGogl7bDstBSXY1b1pXkuqJGv8sFtEwsR4beHfXHt0
	dAczKD+3Xere4IWD1uRmkPU9VYmG4FrIvuFhy2udwx3piyW4ww5BgBc6Pc4WEdzp/SrVI2EaDPN
	ICZvlT6we8mhCUg/EB1aBYLws1W8nQrXXBTIPqcHH6FMNybtoBqPy1BGdKmaORwcN52a4f5Ic4W
	YgZZ+5Un04N6q3ZGGjPv2cFa9s1duMEH6IzSfXo+oa3D0dvEjInzqmjqg9YS6GtSqxPD
X-Received: by 2002:a5d:5e0a:0:b0:48d:f957:bca4 with SMTP id ffacd0b85a97d-48e3eba18bamr4730813f8f.44.1792898060857;
        Sat, 24 Oct 2026 20:14:20 -0700 (PDT)
Received: from yjn-Zenbook-UX3404VA-UX3404VA.. (p200300dcbf1819005b3565a866058f95.dip0.t-ipconnect.de. [2003:dc:bf18:1900:5b35:65a8:6605:8f95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm9190717f8f.44.2026.10.24.20.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:14:20 -0700 (PDT)
From: York Jasper Niebuhr <yjn@yjn-systems.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kees@kernel.org,
	gregkh@linuxfoundation.org,
	franzen@sec.in.tum.de,
	ardb@kernel.org,
	York Jasper Niebuhr <yjn@yjn-systems.com>
Subject: [RFC v4 3/3] Selfpatch-SLR target annotations
Date: Sun, 25 Oct 2026 04:14:18 +0100
Message-ID: <20261025031418.183946-1-yjn@yjn-systems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025031011.183364-1-yjn@yjn-systems.com>
References: <20261025031011.183364-1-yjn@yjn-systems.com>
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

Adjust the existing structure layout randomization annotations for
Selfpatch-SLR.

RandStruct and SPSLR can share most of the existing randomization target
set, but they do not have identical requirements. Split the relevant
annotations where necessary so that a structure or a portion of a
structure can remain randomized by RandStruct while being excluded from
SPSLR.

In particular, fields whose offsets are exported through asm-offsets
cannot be randomized by SPSLR. These offsets are emitted as constants
for use by assembly code rather than as ordinary C accesses which the
compiler can instrument. Following such constants into inline or
external assembly is inherently outside the compiler's responsibility,
so Pinpoint cannot generally determine where they are eventually used
and turn those uses into patch sites.

Flexible array members must remain at the end of their containing
structures. Limit the SPSLR-randomized portions of proc_dir_entry,
group_info, neighbour and sem_array so their flexible arrays remain
outside the randomized region.

Keep fields referenced by kfree_rcu() outside the SPSLR-randomized
region. kfree_rcu() uses offsetof() in a static assertion, so these
offsets must remain compile-time constants. With defconfig, this applies
to time_namespace::ns and neighbour::rcu.

Exclude uts_namespace from SPSLR for now. init/version-timestamp.c
produces an rpin for it, but that source is compiled into both
init/version.o and init/version-timestamp.o. Since both objects are
linked into the final kernel, this currently results in duplicate dpin
metadata.

Exclude dax_operations from implicit SPSLR randomization. Otherwise
dm_dax_ops becomes a data-pin target and keeps DAX functions alive even
when CONFIG_DAX=n; those functions in turn reference code which is not
built for that configuration.

Signed-off-by: York Jasper Niebuhr <yjn@yjn-systems.com>
---
 arch/x86/include/asm/processor.h  |  2 +-
 fs/proc/internal.h                |  7 ++++++-
 include/linux/cred.h              |  7 ++++++-
 include/linux/dax.h               |  9 ++++++++-
 include/linux/sched.h             | 21 +++++++++++++++------
 include/linux/time_namespace.h    | 10 ++++++++--
 include/linux/uts_namespace.h     |  8 +++++++-
 include/net/neighbour.h           | 10 ++++++++--
 ipc/sem.c                         |  6 +++++-
 lib/tests/randstruct_kunit.c      |  6 +++---
 security/selinux/include/objsec.h |  2 +-
 security/selinux/ss/hashtab.h     |  2 +-
 12 files changed, 69 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index ec9db0dfa0df..ea87678a8bb2 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -204,7 +204,7 @@ struct cpuinfo_x86 {
 	/* Address space bits used by the cache internally */
 	u8			x86_cache_bits;
 	unsigned		initialized : 1;
-} __randomize_layout;
+} __randomize_layout_randstruct;
 
 #define X86_VENDOR_INTEL	0
 #define X86_VENDOR_CYRIX	1
diff --git a/fs/proc/internal.h b/fs/proc/internal.h
index 04bd6c9e65a7..5b499983d700 100644
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -29,6 +29,8 @@ struct mempolicy;
  * subdir_node is used to build the rb tree "subdir" of the parent.
  */
 struct proc_dir_entry {
+	randomized_struct_fields_start_spslr
+
 	/*
 	 * number of callers into module in progress;
 	 * negative -> it's going away RSN
@@ -63,8 +65,11 @@ struct proc_dir_entry {
 	umode_t mode;
 	u8 flags;
 	u8 namelen;
+
+	randomized_struct_fields_end_spslr
+
 	char inline_name[];
-} __randomize_layout;
+} __randomize_layout_randstruct;
 
 #define SIZEOF_PDE	(				\
 	sizeof(struct proc_dir_entry) < 128 ? 128 :	\
diff --git a/include/linux/cred.h b/include/linux/cred.h
index 6ef1750c93e2..e632fdec1cc1 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -26,10 +26,15 @@ extern struct task_struct init_task;
  * COW Supplementary groups list
  */
 struct group_info {
+	randomized_struct_fields_start_spslr
+
 	refcount_t	usage;
 	int		ngroups;
+
+	randomized_struct_fields_end_spslr
+
 	kgid_t		gid[];
-} __randomize_layout;
+} __randomize_layout_randstruct;
 
 /**
  * get_group_info - Get a reference to a group info structure
diff --git a/include/linux/dax.h b/include/linux/dax.h
index fe6c3ded1b50..e8efe93c6751 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -35,7 +35,14 @@ struct dax_operations {
 	 */
 	size_t (*recovery_write)(struct dax_device *dax_dev, pgoff_t pgoff,
 			void *addr, size_t bytes, struct iov_iter *iter);
-};
+}
+/* Must be excluded from spslr so 'dm_dax_ops' in drivers/md/dm.c is
+ * not needlessly retained as dpin target, which keeps some DAX
+ * functions alive even with CONFIG_DAX=n. These functions call other
+ * functions that are not actually compiled into the kernel with the
+ * config not set.
+ */
+__no_randomize_layout_spslr;
 
 struct dax_holder_operations {
 	/*
diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..3936c681d96c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -849,7 +849,18 @@ struct task_struct {
 	 * This begins the randomizable portion of task_struct. Only
 	 * scheduling-critical items should be added above here.
 	 */
-	randomized_struct_fields_start
+	randomized_struct_fields_start_randstruct
+
+#ifdef CONFIG_STACKPROTECTOR
+	/* Canary can not be randomized because of arch/x86/kernel/asm-offsets.c
+	 * Pinpoint plugin could recognize context of instrumented accesses
+	 * and e.g. hijack asm instructions that want to use them as constants.
+	 */
+	/* Canary value for the -fstack-protector GCC feature: */
+	unsigned long                           stack_canary;
+#endif
+
+	randomized_struct_fields_start_spslr
 
 	void				*stack;
 	refcount_t			usage;
@@ -1080,10 +1091,6 @@ struct task_struct {
 	pid_t				pid;
 	pid_t				tgid;
 
-#ifdef CONFIG_STACKPROTECTOR
-	/* Canary value for the -fstack-protector GCC feature: */
-	unsigned long			stack_canary;
-#endif
 	/*
 	 * Pointers to the (original) parent process, youngest child, younger sibling,
 	 * older sibling, respectively.  (p->father can be replaced with
@@ -1680,6 +1687,8 @@ struct task_struct {
 	struct unwind_task_info		unwind_info;
 #endif
 
+	randomized_struct_fields_end_spslr
+
 	/* CPU-specific state of this task: */
 	struct thread_struct		thread;
 
@@ -1687,7 +1696,7 @@ struct task_struct {
 	 * New fields for task_struct should be added above here, so that
 	 * they are included in the randomized portion of task_struct.
 	 */
-	randomized_struct_fields_end
+	randomized_struct_fields_end_randstruct
 } __attribute__ ((aligned (64)));
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
diff --git a/include/linux/time_namespace.h b/include/linux/time_namespace.h
index 58bd9728df58..794247475dcc 100644
--- a/include/linux/time_namespace.h
+++ b/include/linux/time_namespace.h
@@ -22,16 +22,22 @@ struct timens_offsets {
 };
 
 struct time_namespace {
+	randomized_struct_fields_start_spslr
+
 	struct user_namespace	*user_ns;
 	struct ucounts		*ucounts;
-	struct ns_common	ns;
 	struct timens_offsets	offsets;
 #ifdef CONFIG_TIME_NS_VDSO
 	struct page		*vvar_page;
 #endif
 	/* If set prevents changing offsets after any task joined namespace. */
 	bool			frozen_offsets;
-} __randomize_layout;
+
+	randomized_struct_fields_end_spslr
+
+	/* Referenced by kfree_rcu which uses offsetof in a static assertion. */
+	struct ns_common	ns;
+} __randomize_layout_randstruct;
 
 extern struct time_namespace init_time_ns;
 
diff --git a/include/linux/uts_namespace.h b/include/linux/uts_namespace.h
index 60f37fec0f4b..7588c83fab05 100644
--- a/include/linux/uts_namespace.h
+++ b/include/linux/uts_namespace.h
@@ -8,12 +8,18 @@
 struct user_namespace;
 extern struct user_namespace init_user_ns;
 
+/* Currently, uts_namespace can not be randomized with spslr because
+   init/version-timestamp.c produces an according dpin. Since this
+   source file is compiled twice to init/version.o and
+   init/version-timestamp.o, and both objects are linked into the
+   final kernel binary, the final pinpoint metadata contains duplicate
+   dpin records. */
 struct uts_namespace {
 	struct new_utsname name;
 	struct user_namespace *user_ns;
 	struct ucounts *ucounts;
 	struct ns_common ns;
-} __randomize_layout;
+} __randomize_layout_randstruct;
 
 extern struct uts_namespace init_uts_ns;
 
diff --git a/include/net/neighbour.h b/include/net/neighbour.h
index 8860cc2175fc..fd0e452bcfe8 100644
--- a/include/net/neighbour.h
+++ b/include/net/neighbour.h
@@ -138,6 +138,8 @@ struct neigh_statistics {
 #define NEIGH_CACHE_STAT_INC(tbl, field) this_cpu_inc((tbl)->stats->field)
 
 struct neighbour {
+	randomized_struct_fields_start_spslr
+
 	struct hlist_node	hash;
 	struct hlist_node	dev_list;
 	struct neigh_table	*tbl;
@@ -163,11 +165,15 @@ struct neighbour {
 	const struct neigh_ops	*ops;
 	struct list_head	gc_list;
 	struct list_head	managed_list;
-	struct rcu_head		rcu;
 	struct net_device	*dev;
 	netdevice_tracker	dev_tracker;
+
+	randomized_struct_fields_end_spslr
+
+	/* Referenced by kfree_rcu which uses offsetof in a static assertion. */
+	struct rcu_head		rcu;
 	u8			primary_key[];
-} __randomize_layout;
+} __randomize_layout_randstruct;
 
 struct neigh_ops {
 	int			family;
diff --git a/ipc/sem.c b/ipc/sem.c
index 5ec41de7e85b..e3aafb88318d 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -112,6 +112,8 @@ struct sem {
 
 /* One sem_array data structure for each set of semaphores in the system. */
 struct sem_array {
+	randomized_struct_fields_start_spslr
+
 	struct kern_ipc_perm	sem_perm;	/* permissions .. see ipc.h */
 	time64_t		sem_ctime;	/* create/last semctl() time */
 	struct list_head	pending_alter;	/* pending operations */
@@ -123,8 +125,10 @@ struct sem_array {
 	int			complex_count;	/* pending complex operations */
 	unsigned int		use_global_lock;/* >0: global lock required */
 
+	randomized_struct_fields_end_spslr
+
 	struct sem		sems[];
-} __randomize_layout;
+} __randomize_layout_randstruct;
 
 /* One queue for each sleeping process in the system. */
 struct sem_queue {
diff --git a/lib/tests/randstruct_kunit.c b/lib/tests/randstruct_kunit.c
index f3a2d63c4cfb..2987c1642376 100644
--- a/lib/tests/randstruct_kunit.c
+++ b/lib/tests/randstruct_kunit.c
@@ -41,10 +41,10 @@ struct randstruct_untouched {
 	DO_MANY_MEMBERS(unsigned_long_member)
 };
 
-/* Struct explicitly marked with __randomize_layout. */
+/* Struct explicitly marked with __randomize_layout_randstruct. */
 struct randstruct_shuffled {
 	DO_MANY_MEMBERS(unsigned_long_member)
-} __randomize_layout;
+} __randomize_layout_randstruct;
 #undef unsigned_long_member
 
 /* Struct implicitly randomized from being all func ptrs. */
@@ -87,7 +87,7 @@ struct randstruct_mixed_untouched {
 
 struct randstruct_mixed_shuffled {
 	mixed_members
-} __randomize_layout;
+} __randomize_layout_randstruct;
 #undef mixed_members
 
 struct contains_randstruct_untouched {
diff --git a/security/selinux/include/objsec.h b/security/selinux/include/objsec.h
index 2f21568251ff..437a3ce98fb5 100644
--- a/security/selinux/include/objsec.h
+++ b/security/selinux/include/objsec.h
@@ -53,7 +53,7 @@ struct task_security_struct {
 		struct avdc_entry dir[TSEC_AVDC_DIR_SIZE]; /* dir entries */
 		bool permissive_neveraudit; /* permissive and neveraudit */
 	} avdcache;
-} __randomize_layout;
+} __randomize_layout; /* WTF? */
 
 static inline bool task_avdcache_permnoaudit(struct task_security_struct *tsec,
 					     u32 sid)
diff --git a/security/selinux/ss/hashtab.h b/security/selinux/ss/hashtab.h
index c641fb12916b..2362e5f575ac 100644
--- a/security/selinux/ss/hashtab.h
+++ b/security/selinux/ss/hashtab.h
@@ -21,7 +21,7 @@
 struct hashtab_key_params {
 	u32 (*hash)(const void *key); /* hash func */
 	int (*cmp)(const void *key1, const void *key2); /* comparison func */
-};
+} __no_randomize_layout_spslr;
 
 struct hashtab_node {
 	void *key;
-- 
2.43.0

