Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622391;
	b=aDzHq81KdYje8h+EViRmKneDzOk/VYhycWzlZ7Sw9r5gTVUk547MFZUkoU7LURfSU6Vm
	 h1J0qcx0HqlQXKhL0p0nnhh56kM8C+yy1fjvU3R3WF6jWZ8Uw36VllXBeToA16GeOoLbD
	 cxfuH2Crniuh85w0jK/KE0St0AWWffBKUeIOVmOEdIOrY36yeYj0kffMMcy4Ox/bI4Gtw
	 AIUBF6VfFxi+GhbHeOUbvqmZMIak/knu53HG1n4JyDbpB9juJsCYR6u7jmyQz79GMijOB
	 jt0sFabIuMJOultdHgtXMW2qKWt6c9FdA5KcGNOAUrJki2eG2sq9q/qx+VZJNIietKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
	b=WsHQSDNl/kfYH/tzHsxAyOo9yAsPYwVdV/to+JWVpb732JSLA4ieviYI1U2pqVGZTslq
	 xJOGcPvxivuB/HWhNi4wmZI/KFtLaZrsFAOdBY9y531LHpTM7SBoyvdUYmOUWTWPRwlQf
	 J6DSsXSB6tVsH3Hp/0SHD5kLny1PcS9nkhNtg5c6TZMmRQUmkUTlCyzJWUSk6R0t54j2I
	 zshYUY1hXlG3Ax3dyXxt9IUg5CVZB26sNI1T8TX7wAvFhZ6im4OHAxE3nI75IA3G24Dgd
	 pVXz8IdhJDqSkP8d0V1IPoSEDsAKZpMPClSTZSPdUClXHkCycV3/FTbxiFFDM42Ae+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QrkSUu1o;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB2606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84AB2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QrkSUu1o
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so402789eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622391; x=1793227191; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
        b=QrkSUu1oc0yB/C4//BJ6F5QjhuoXw7CTMGJqxbMSBI19oS3Dc/6MkR8bTMDgmrFD43
         jw4/AUIN+R56Pi2tcO/kx2q+6u0BGaoXTTV+h/C2Wa5CO4qksQEK19JpGJVgPGy+BmMI
         A/iAZTFJ6m1ZaFMDtFlZAeiboG6WyBiQH0oguyr953XEo8RdyM3BPBmo74/PEysb9l1i
         oiBQm3S6k6xwAoH3dXws3tVG3nw71nHwQpL7A5ksBRtLLMVvJQHnhiTxcLNZaeg2oY2B
         d9idBohoO4G7sUs2PH9Fn+klWgf8rFQBRQS8pSuTD96ZZqXykCdmCOyTAZupF7Ykyy7P
         9wQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622391; x=1793227191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
        b=ltBlo4y5X8fydFOnDkkOp1GaaWukOWvxmFxE73+4ZDlNpEmFnYiE/fHDaOPMc89zIt
         xqaJbp0H7uq+2k0plufc6b27vAxgVRZdvfkpcoEqinhF2N8pHaTDjpVAyHwjKerQT7I/
         gsUZgrYWHTx8cbZzLdAUgCl1jZKgZnzbz4UjaqcVv2fkS4g/XHFhdC5OH7ErwsqQ471n
         jii8RXp0SP+YDIKolKiaQt4m3Lnau9zsArnW1ZUgmZHwLLE3aq2/QdCh2RwT5KUZBp4B
         qvTbMPM6D+eVqIXRVfLjLf1JCIHW4JJRCpRhZg0DtyXf5yCSSHYRRWg+/e9E6MlYUS4I
         wvSA==
X-Forwarded-Encrypted: i=1; AKwUvBy99zSKi3AbIp4qkgIQf8LNNPok7tvkwCxS1Z/yvfX8c71dz16ZhYNi3k1I/DicWjhKI+sYlVGCDZPDroM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt2jxHdWWinIfR+ppFQbNjr2xdcMgsJd+T9NRD+kA7OpKmYcAG
	XK66ntgsV5QIMrjfaGFEk5ykgLTOzz4GiUmJWeH5T783gdX+xVDFfxQ5UYDSkt+1sxgr2uS71zd
	hYtujimscRw==
X-Received: from dycpq17.prod.google.com ([2002:a05:7301:fd11:b0:351:5787:a37a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:42d1:20b0:185:e68c:904c
 with SMTP id a92af1059eb24-192f2f0ae92mr831963c88.7.1792622390367; Wed, 21
 Oct 2026 15:39:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:39:00 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-13-irogers@google.com>
Subject: [PATCH v7 12/17] perf thread: Expand context analysis annotations to
 threads and namespaces_lock
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate shard and last_match in struct threads_table_entry with
__guarded_by(&lock) and add __must_hold_shared()/__must_hold() to the
last_match helpers in util/threads.c.

In util/thread.h and util/thread.c, add __returns_ctx_lock() to
thread__namespaces_lock() and thread__comm_lock(), annotate
namespaces_list and comm_list with __guarded_by(), and add
__must_hold_shared()/__must_hold() to the namespaces_list helpers.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/thread.c  |  2 ++
 tools/perf/util/thread.h  | 28 +++++++++++++++++-----------
 tools/perf/util/threads.c |  4 ++++
 tools/perf/util/threads.h |  6 +++---
 4 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 616d5bf87baf..af761b1fc5d5 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -149,6 +149,7 @@ void thread__put(struct thread *thread)
 }
 
 static struct namespaces *__thread__namespaces(struct thread *thread)
+	__must_hold_shared(thread__namespaces_lock(thread))
 {
 	if (list_empty(thread__namespaces_list(thread)))
 		return NULL;
@@ -169,6 +170,7 @@ struct namespaces *thread__namespaces(struct thread *thread)
 
 static int __thread__set_namespaces(struct thread *thread, u64 timestamp,
 				    struct perf_record_namespaces *event)
+	__must_hold(thread__namespaces_lock(thread))
 {
 	struct namespaces *new, *curr = __thread__namespaces(thread);
 
diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
index 9d0ce7742c06..a7850eebce4e 100644
--- a/tools/perf/util/thread.h
+++ b/tools/perf/util/thread.h
@@ -48,10 +48,10 @@ DECLARE_RC_STRUCT(thread) {
 	bool			exited;
 	bool			comm_set;
 	int			comm_len;
-	struct list_head	namespaces_list;
 	struct rw_semaphore	namespaces_lock;
-	struct list_head	comm_list;
+	struct list_head	namespaces_list __guarded_by(&namespaces_lock);
 	struct rw_semaphore	comm_lock;
+	struct list_head	comm_list __guarded_by(&comm_lock);
 	u64			db_id;
 
 	void			*priv;
@@ -230,30 +230,36 @@ static inline void thread__set_comm_len(struct thread *thread, int len)
 	RC_CHK_ACCESS(thread)->comm_len = len;
 }
 
-static inline struct list_head *thread__namespaces_list(struct thread *thread)
+static inline struct rw_semaphore *thread__namespaces_lock(const struct thread *thread)
+	__returns_ctx_lock(&RC_CHK_ACCESS(thread)->namespaces_lock)
 {
-	return &RC_CHK_ACCESS(thread)->namespaces_list;
+	return (struct rw_semaphore *)&RC_CHK_ACCESS(thread)->namespaces_lock;
 }
 
-static inline int thread__namespaces_list_empty(const struct thread *thread)
+static inline struct list_head *thread__namespaces_list(struct thread *thread)
+	__must_hold_shared(thread__namespaces_lock(thread))
 {
-	return list_empty(&RC_CHK_ACCESS(thread)->namespaces_list);
+	/* Readers hold the shared lock; writers hold the exclusive lock. */
+	return context_unsafe(&RC_CHK_ACCESS(thread)->namespaces_list);
 }
 
-static inline struct rw_semaphore *thread__namespaces_lock(struct thread *thread)
+static inline int thread__namespaces_list_empty(const struct thread *thread)
+	__must_hold_shared(thread__namespaces_lock(thread))
 {
-	return &RC_CHK_ACCESS(thread)->namespaces_lock;
+	return list_empty(&RC_CHK_ACCESS(thread)->namespaces_list);
 }
 
-static inline struct rw_semaphore *thread__comm_lock(struct thread *thread)
+static inline struct rw_semaphore *thread__comm_lock(const struct thread *thread)
+	__returns_ctx_lock(&RC_CHK_ACCESS(thread)->comm_lock)
 {
-	return &RC_CHK_ACCESS(thread)->comm_lock;
+	return (struct rw_semaphore *)&RC_CHK_ACCESS(thread)->comm_lock;
 }
 
 static inline struct list_head *thread__comm_list(struct thread *thread)
 	__must_hold_shared(thread__comm_lock(thread))
 {
-	return &RC_CHK_ACCESS(thread)->comm_list;
+	/* Readers hold the shared lock; writers hold the exclusive lock. */
+	return context_unsafe(&RC_CHK_ACCESS(thread)->comm_list);
 }
 
 static inline u64 thread__db_id(const struct thread *thread)
diff --git a/tools/perf/util/threads.c b/tools/perf/util/threads.c
index 6ca0b178fb6c..39b3c420635a 100644
--- a/tools/perf/util/threads.c
+++ b/tools/perf/util/threads.c
@@ -21,6 +21,7 @@ static bool key_equal(long key1, long key2, void *ctx __maybe_unused)
 }
 
 void threads__init(struct threads *threads)
+	__context_unsafe(/* initialization */)
 {
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
 		struct threads_table_entry *table = &threads->table[i];
@@ -32,6 +33,7 @@ void threads__init(struct threads *threads)
 }
 
 void threads__exit(struct threads *threads)
+	__context_unsafe(/* teardown */)
 {
 	threads__remove_all_threads(threads);
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
@@ -63,6 +65,7 @@ size_t threads__nr(struct threads *threads)
  */
 static struct thread *__threads_table_entry__get_last_match(struct threads_table_entry *table,
 							    pid_t tid)
+	__must_hold_shared(&table->lock)
 {
 	struct thread *th, *res = NULL;
 
@@ -76,6 +79,7 @@ static struct thread *__threads_table_entry__get_last_match(struct threads_table
 
 static void __threads_table_entry__set_last_match(struct threads_table_entry *table,
 						  struct thread *th)
+	__must_hold(&table->lock)
 {
 	thread__put(table->last_match);
 	table->last_match = thread__get(th);
diff --git a/tools/perf/util/threads.h b/tools/perf/util/threads.h
index da68d2223f18..54fba16657db 100644
--- a/tools/perf/util/threads.h
+++ b/tools/perf/util/threads.h
@@ -11,10 +11,10 @@ struct thread;
 #define THREADS__TABLE_SIZE	(1 << THREADS__TABLE_BITS)
 
 struct threads_table_entry {
-	/* Key is tid, value is struct thread. */
-	struct hashmap	       shard;
 	struct rw_semaphore    lock;
-	struct thread	       *last_match;
+	/* Key is tid, value is struct thread. */
+	struct hashmap	       shard __guarded_by(&lock);
+	struct thread	       *last_match __guarded_by(&lock);
 };
 
 struct threads {
-- 
2.56.0.218.g1ec904b173-goog

