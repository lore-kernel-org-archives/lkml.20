Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA7595759
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171912; cv=none; b=q8rkNAf2bNd2cWFkDP2r3blr7PfLCkBgYG+sAxIPl4yOtuJcBNG18gsxy0YI0EP8TyC7/I7qKRcCJ2nXzEazyA5CJ8etHd9HIhqUnUFOxYA1fi2crF+9uY2vrpGBU0hXBqsLLPNYiDu0ZAEaKNqCDvEu7c0PFzuKi7CU7lXPK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171912; c=relaxed/simple;
	bh=fdF52suTdeR8LGm7JoZ9Yc+IEQ6ItpPYArn7ZheNM1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SSGFfVAE7aoQbR910G/wPYo0zAvlrk2cNkMjDIK+UcCsDbYxyh8kCqIFRUSJOwjoKrDX41fAJSdtSSHi4phh295mp0riK+4U22rhxVmrLOvPq/Yxqc+Kt82I2lhch1Pts8pt3TOo+BnoZLZMC54iuqavVe81KDcSWub94vl3kdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ewAwirzT; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ewAwirzT"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso306183eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171909; x=1792776709; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5CCUC1R4M25rKM1gT3H/lRe4lKcFq/fltsw3UkJoHQ=;
        b=ewAwirzTZnZRnrVXlpHTX2Pl9O8VJ77ppaKb2VkgDpykFe4Uef6s3xkkcR7oqgV3ml
         +Uo+KNSTwfRTkOGBn0gjgjL7WIn7K3/k3KVPx4o1jW73s/8VrrCumRMCdpGQyVErH7dy
         THZ5In3kFpj2CnipDV0RbbTkA8n390fITN6vREDS1IJoN58iQqX3JJuepiLfZYtenUPB
         eMvdi9WLu5X/XxQhGEI1kF3QSkAyB7TFs3naU0KHIEfbGi6cNvJ4pk7+ShTmkdAqBy3T
         9DvSMaOqlizIQfKTDRLFze8ti7K6dW1hXbl4aAgAQ22XPWGD1yQqTdlpeSiUGXhaUCgG
         7vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171909; x=1792776709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5CCUC1R4M25rKM1gT3H/lRe4lKcFq/fltsw3UkJoHQ=;
        b=D6v1mA2kQFfLrSrWOMZIvVkY8fZbpClPgzapvMxI4EGdy+4fUrFk7DDRx1W/qUULZs
         F6oRFNcQGV353zsPicy5Ig64DHJq9eRb53k2mXRI32aa8BnOlBbugrFIzujiH9uKY8FU
         55SSKtMI0+DgV/qFUKLg4+l61+3ZGmBpg8tgSOGAiEXFSTl8ExvK+8QiclonP8qqi6MP
         /5VQTZBg7y6WxmgjtUR4ZTQ+vP8jpMKlQ3Ku6Xj5xeiM3kcSc1jTj4XME7GGchvtVzHw
         IKYR70Gzy8GPjqd1Iw1irl9VlXd4Dcx592pF/9tjzi3IyX0WkYtIFniZzw/xyAAcmcDj
         Cfzw==
X-Forwarded-Encrypted: i=1; AKwUvBzpEIHa3DBJTzNmkx6+F3M6KqKRUXQYUgR3+utKVnxlN2WMjXZCFZcV7cedQgp8XYxtVFwxw+dID0yXCQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZEeFnPsmdORRiR8DxFqNSaY5Q1SiMyn/AZ8cRs8CR+YWPGyWE
	2TrQWIBLrCke0vEuqkgD74x+6JoyodsAcwT4uqpgLUcsllz1mJfOOuxWTeiSyg8zuenUI51buui
	0mx+woVpQpg==
X-Received: from dycnr14-n2.prod.google.com ([2002:a05:7300:e9ce:20b0:353:5cf3:d9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:228f:b0:343:ff9f:26f3
 with SMTP id 5a478bee46e88-361a1270c3dmr734821eec.9.1792171909070; Fri, 16
 Oct 2026 10:31:49 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:31:01 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-13-irogers@google.com>
Subject: [PATCH v3 12/17] perf thread: Expand context analysis annotations to
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
2.56.0.212.g129ede20d9-goog

