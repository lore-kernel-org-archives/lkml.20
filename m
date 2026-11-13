Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590295;
	b=kss26w6LoHwTG/csPXdzE9FO5FPn9yPsve0T2xGYeAklpL8wqgVTh9fPkGwP8S7V1FQN
	 h1pjkOuTy9/Gr48n8R2TzcsztpX5UVqAZQLHcrAe7a0uf3ddSNFR9lfSDjT7p1xUuDJDY
	 nLX0FP+9916lnhEN/R6tuOc7MqCVWheQ4pSzsNzkvQxHWZfe0Lmn9Y5GwHQwmstUjsTR5
	 ZXFT0dDRNbJP7IuJ6ndOPT4bUNINJ0/25VwQFbI396+6UxCkPEIOLWta079JvYsm/0lu0
	 HE4cZUrOeFLuX3fwDo3xgblBwMkrHn7+Ik9tnMiKL/LvA4Pck4ZfXkGLdcZSesSgxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FqXrkekpazBGo74ROnhtZH/D/ijqIvj3BVMdkvQVaV4=;
	b=RXQ6VAqwhu2KXxYPIF1aNz+47is8V7WvXRYLC1iK/h2Fwy4zziT/BPr83a++PJ2sqKmo
	 Ka5kujbPEpOPtOERd/FDl8loCaWs1b8ZLOSnNDQqsJNYwRLzWPgY1aYXflWNx40vDnA1+
	 UQQuwgrixKCtejYljtaq7nTkGtydBFCztf/+ABOUthwNRwr9z5UdcJqrGEPJGMBTX+ikT
	 e4YRztDcf2glFYSz8cuCbmxTYlNbjW5FjPLvg+FeXR7TtSlp6B5ZjKjAMPbMioGwkZaiL
	 6wdUP7dVpBO+I2hiQ8RYmFbinc9J17uo7e4BJrxbkd17qFw3ckdDMh/h7JH+oyU5mhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UMyk5pVl;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D80607B599
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D80607B599
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UMyk5pVl
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4adc1aca8c2so1371184fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590294; x=1795195094; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqXrkekpazBGo74ROnhtZH/D/ijqIvj3BVMdkvQVaV4=;
        b=UMyk5pVlrfLZcmWajc9eoQ5rqc8ncqPc1DnN4iLD5fs01dI25x1QkSlq9L5TCL1Uur
         PEYxbFUv/iBEXKfkOWnpnShY52WmxMChZzHyev2tON/wlCgpQ17aPPB9GPF6dlKg29ol
         QdW7/tnSNek87lrNfrOyoFQaqGav+K7EMCr7Yx5xrAPsbRalZrrI/JQRYdTqWqq1gD3x
         sgSrfEgHa+MTbtaw+8XkszlHkXcyyQ4jJ6U/yjnLy8OkujERIvTJJzd3JhvG/fM4MGGL
         kT5fhFALvoyj1TtlhV8nIb731cU4s7K8iQLo8aIza0oiJ3KJ30OtTYps0biT2KvmzkKc
         9IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590294; x=1795195094;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqXrkekpazBGo74ROnhtZH/D/ijqIvj3BVMdkvQVaV4=;
        b=jtqeHUQqY1cN3Zsa9Bh4Npke3M3NSFNFPBKBDu4X8LOjtAZY3/xIeoA5P5pYN4bzE1
         QctbJWS6L1jzTl79rDOzpi2mCAOYlpzlWcfKfYczeV0rHafJ+QZqRBO0Ty9WMYWdF2JU
         JdwKWXfNtFCXt4ig+iNy8RNsnL1z18BcIydnzfhyR/2VePvnuJ1uAdTnoEJkQ7Rh/9nK
         ou7wgO8ffL7it7TLZbT9EAoAxY2KMvKjsulBj+KFgs6VcdTfilC8xgG3t42DZSxGRwu/
         qw0ZwkY+dPFDBAxdYRmj2leBX7OWRYAzTh5t9agMQL1a1DUxMsJ6hiP312laKCApnCq/
         +gPg==
X-Forwarded-Encrypted: i=1; AL+hErGSgPlcu8cZkFjvOZtgDY+A6c40iJUu6nAFA+3Tc87Mk83ha60i7kxwJTXYTRmJhnkO38EhgAnWYPvO/uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hJBRZlaDrpsOje1k6aMDaoGyu5tV46ZrwEWt66C+oKrhNKzZ8
	lMuo5f481Tk6nDDeNNZujeq/SMdQM8FSI53RnclQBMNc2UU78O3/niahQXIjTFsql6jyvmCJUFX
	5kaXXXG825g==
X-Received: from ioeu21.prod.google.com ([2002:a05:6602:2415:b0:9c7:5b22:eaaa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:e88:b0:564:3fe1:2f95
 with SMTP id 5614622812f47-56e66063859mr2434950b6e.56.1794590294004; Fri, 13
 Nov 2026 09:18:14 -0800 (PST)
Date: Fri, 13 Nov 2026 09:17:18 -0800
In-Reply-To: <20261113171734.2188066-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110220803.2503416-1-irogers@google.com> <20261113171734.2188066-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113171734.2188066-8-irogers@google.com>
Subject: [PATCH v4 07/23] perf rwsem: Add down_read_trylock() and down_write_trylock()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On-demand memory shrinking (perf_session__shrink(), dsos__shrink(),
symbols__shrink()) can be triggered from OOM recovery inside allocation
wrappers while the current thread already holds a rw_semaphore (such as
symbols->lock, dsos->lock, or machines->lock). Non-blocking trylock
primitives are needed so shrinking paths can safely skip any locked
container without deadlocking.

Add non-blocking down_read_trylock() and down_write_trylock() wrappers
around pthread_rwlock_tryrdlock() / pthread_rwlock_trywrlock() and
pthread_mutex_trylock() along with SHARED_TRYLOCK_FUNCTION and
EXCLUSIVE_TRYLOCK_FUNCTION thread-safety annotations.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mutex.h |  3 +++
 tools/perf/util/rwsem.c | 20 ++++++++++++++++++++
 tools/perf/util/rwsem.h | 11 +++++++++++
 3 files changed, 34 insertions(+)

diff --git a/tools/perf/util/mutex.h b/tools/perf/util/mutex.h
index 5de1065ea2b9..de7dd6d8326c 100644
--- a/tools/perf/util/mutex.h
+++ b/tools/perf/util/mutex.h
@@ -57,6 +57,8 @@
 /* Documents functions that try to acquire a lock, and return success or failure. */
 #define EXCLUSIVE_TRYLOCK_FUNCTION(...) \
 	__attribute__((exclusive_trylock_function(__VA_ARGS__)))
+#define SHARED_TRYLOCK_FUNCTION(...) \
+	__attribute__((shared_trylock_function(__VA_ARGS__)))
 
 /* Documents a function that expects a mutex to be held prior to entry. */
 #define EXCLUSIVE_LOCKS_REQUIRED(...) __attribute__((exclusive_locks_required(__VA_ARGS__)))
@@ -78,6 +80,7 @@
 #define SHARED_LOCK_FUNCTION(...)
 #define UNLOCK_FUNCTION(...)
 #define EXCLUSIVE_TRYLOCK_FUNCTION(...)
+#define SHARED_TRYLOCK_FUNCTION(...)
 #define EXCLUSIVE_LOCKS_REQUIRED(...)
 #define SHARED_LOCKS_REQUIRED(...)
 #define NO_THREAD_SAFETY_ANALYSIS
diff --git a/tools/perf/util/rwsem.c b/tools/perf/util/rwsem.c
index 1d15c0e3732b..9548a3b44f16 100644
--- a/tools/perf/util/rwsem.c
+++ b/tools/perf/util/rwsem.c
@@ -36,6 +36,16 @@ int down_read(struct rw_semaphore *sem)
 #endif
 }
 
+bool down_read_trylock(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+#if RWS_ERRORCHECK
+	return mutex_trylock(&sem->mtx);
+#else
+	return pthread_rwlock_tryrdlock(&sem->lock) == 0;
+#endif
+}
+
 int up_read(struct rw_semaphore *sem)
 	NO_THREAD_SAFETY_ANALYSIS
 {
@@ -58,6 +68,16 @@ int down_write(struct rw_semaphore *sem)
 #endif
 }
 
+bool down_write_trylock(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+#if RWS_ERRORCHECK
+	return mutex_trylock(&sem->mtx);
+#else
+	return pthread_rwlock_trywrlock(&sem->lock) == 0;
+#endif
+}
+
 int up_write(struct rw_semaphore *sem)
 	NO_THREAD_SAFETY_ANALYSIS
 {
diff --git a/tools/perf/util/rwsem.h b/tools/perf/util/rwsem.h
index b102d8143181..53c45990d9c9 100644
--- a/tools/perf/util/rwsem.h
+++ b/tools/perf/util/rwsem.h
@@ -22,9 +22,20 @@ int init_rwsem(struct rw_semaphore *sem);
 int exit_rwsem(struct rw_semaphore *sem);
 
 int down_read(struct rw_semaphore *sem) SHARED_LOCK_FUNCTION(sem);
+/*
+ * Tries to acquire a shared read lock without blocking. Per POSIX
+ * pthread_rwlock_tryrdlock(), succeeds when no writer holds or blocks on @sem
+ * (including when the calling thread already holds a read lock on @sem).
+ */
+bool down_read_trylock(struct rw_semaphore *sem) SHARED_TRYLOCK_FUNCTION(true, sem);
 int up_read(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
 
 int down_write(struct rw_semaphore *sem) EXCLUSIVE_LOCK_FUNCTION(sem);
+/*
+ * Tries to acquire an exclusive write lock without blocking. Returns false if
+ * any thread (including the calling thread) holds a read or write lock on @sem.
+ */
+bool down_write_trylock(struct rw_semaphore *sem) EXCLUSIVE_TRYLOCK_FUNCTION(true, sem);
 int up_write(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
 
 #endif /* _PERF_RWSEM_H */
-- 
2.56.1.703.gf848ed807c-goog

