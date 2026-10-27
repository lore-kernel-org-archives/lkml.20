Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142949;
	b=SRJQNA8BbQHn7ffLCffoux7KfLcE1FKycIyFEQmRt811puKF4uAw6NULl7nCk9mkhLxY
	 uq918zB1Z8+LNO3RtPp4dzNt989AG9kPHtsBCRh//pyo0BvFstClRUMH1QeeqMeO5QNyE
	 X74Gj74px1J5fhFAgtdZ3xfymmpukjZ5zQw9sSH4lyIzQYk5cxObxXRxWNV9D5xyhGyLb
	 NaBHfZrXmyffP53yBRy7SrUmXN5xJFgtKRwrSxJ+NCJAr16UCbcyjoLY5J3IOoaoCzi1E
	 cjeyz6BOVB/VwOxUd/xbpu1Ex3Z5YlTyX+ZmK/Ngv03R6XDP/zV502EDghK7wjK1OQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NkKLsyMxj9EW7cAPdC4Few1MpkVfWGCaxkYuBEFMHvs=;
	b=wdBPyoaQnY1oxv8hqWOL9xHyx5hxQbT8PAX9LN9WhDjkF+yzEqa4ru/4L+QGVimztRb8
	 Imt7FWRSiogU6Xfa/IMS+ffBm4yvfiyBaCcy2lFnQKwXnB6Ry0Z72mpPix7IW2EWxpfdQ
	 fjR6cSKLB1Dt/u5GsILJZ02qwXoSSpNy6ANjyKiVEdrxoOlEol1BT72lZ7NhxqvmwbK9W
	 wnZG7fDaig70AqEplsciWDL02QQaQxHjGVoinbYdhyibo5+N/tClky4fyllfqP4o9uHO7
	 s7OSfoZQbJqpUebxdkKKlp5hYgZlsBSGl8H9op+epKpPpV5ygRa48FdHyxuVXyxNAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XroHQIDt;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6660A2612
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B6660A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XroHQIDt
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so517040eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793142948; x=1793747748; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NkKLsyMxj9EW7cAPdC4Few1MpkVfWGCaxkYuBEFMHvs=;
        b=XroHQIDtmzOLdrNcuY8Ny446dwp+tG+PTosqrdE5GC3r2c8MeMFRA6TFW8rIgQMCZ2
         v/KYjl5k68PVCPKZxrW112QJJcrP2w92POYyQiJQtmUSDZ5mO7qDVH5l34Jao5nAoeHT
         Ju0nnNjuEmstPZ99bPoR+BDCaIQf0ex2Q89wjX87a67x4Cu5eOAemDXTFYZgonutMXt6
         49qdIKb3V3KxXXUII4N/SmzCOJsF1qWrHKTP3egTgZqj+cXViU+R2AeH3Grj8gEYggbH
         njnmFcNvwQvQE3E11OC3wir9RuddDyzLJ2Y9ZibinPhqIQ7FOB8iN6vxLwRRNddspVn5
         uHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142948; x=1793747748;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkKLsyMxj9EW7cAPdC4Few1MpkVfWGCaxkYuBEFMHvs=;
        b=VoF6Yr/VgsTviKTZsGOBX1KVRldsHf62WgbK5p6+Ks55Kn+JXA8yKLNrmsa8byvQKg
         3O02smYXYfIcgmtk6vMOvt4mAAfqz27api4mngcVxTZO+at1scMQBK+8KFvdnq7rB2Na
         OcvowADTlcUy61O0rwSFK1II6kJriiG6Uuhrr4gcvC+zyV3rI5vBv3Q+aFk6zvse5Q9Z
         yLLDJsSptq8X9AhUYMU8ORFD7+RoIGcRRnE+vt0b8JA4DA6KfzlxdYStiwQbyZeKAqeQ
         2HiqcpxHO5Njt2sJ+axJHKTmkSjgaN7mgqIE4ivXzm/dsOrvUQ3sFcAj1fFpVNkhl8rN
         jWsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNewwFGCV4hIkruvw2742L2jW80BcLq3hZqRyOGPB8ax2fUcPWz7WHNrRHPkm8/MyafyRlpQOpZoOXw/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWRLmd2oYlTSKqBcsji7vWYFiSahg3tA5lfp9N0TAqbRdtzmlN
	ECTln0qEblx3LIriZUOnRUzg7GtBWC1HdLEJJZ6skwEWFxEvQYGBklGZ7RHQGpsvrc6KJjuHKl0
	awNsexU1naQ==
X-Received: from dyki4.prod.google.com ([2002:a05:7300:7c04:b0:364:225c:dfac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:618b:20b0:360:e2e6:f849
 with SMTP id 5a478bee46e88-36a20138550mr1401763eec.28.1793142948028; Tue, 27
 Oct 2026 16:15:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:15:06 -0700
In-Reply-To: <20261027231513.816148-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027231513.816148-13-irogers@google.com>
Subject: [PATCH v2 12/18] perf rwsem: Add down_read_trylock() and down_write_trylock()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, haghdoost@uber.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
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
 tools/perf/util/rwsem.h |  2 ++
 3 files changed, 25 insertions(+)

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
index 9d26832398db..37fa08bae5e9 100644
--- a/tools/perf/util/rwsem.c
+++ b/tools/perf/util/rwsem.c
@@ -37,6 +37,16 @@ int down_read(struct rw_semaphore *sem)
 #endif
 }
 
+bool down_read_trylock(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+#if RWS_ERRORCHECK
+	return mutex_trylock(&sem->mtx);
+#else
+	return perf_singlethreaded ? true : pthread_rwlock_tryrdlock(&sem->lock) == 0;
+#endif
+}
+
 int up_read(struct rw_semaphore *sem)
 	NO_THREAD_SAFETY_ANALYSIS
 {
@@ -59,6 +69,16 @@ int down_write(struct rw_semaphore *sem)
 #endif
 }
 
+bool down_write_trylock(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
+{
+#if RWS_ERRORCHECK
+	return mutex_trylock(&sem->mtx);
+#else
+	return perf_singlethreaded ? true : pthread_rwlock_trywrlock(&sem->lock) == 0;
+#endif
+}
+
 int up_write(struct rw_semaphore *sem)
 	NO_THREAD_SAFETY_ANALYSIS
 {
diff --git a/tools/perf/util/rwsem.h b/tools/perf/util/rwsem.h
index b102d8143181..782016c3e01f 100644
--- a/tools/perf/util/rwsem.h
+++ b/tools/perf/util/rwsem.h
@@ -22,9 +22,11 @@ int init_rwsem(struct rw_semaphore *sem);
 int exit_rwsem(struct rw_semaphore *sem);
 
 int down_read(struct rw_semaphore *sem) SHARED_LOCK_FUNCTION(sem);
+bool down_read_trylock(struct rw_semaphore *sem) SHARED_TRYLOCK_FUNCTION(true, sem);
 int up_read(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
 
 int down_write(struct rw_semaphore *sem) EXCLUSIVE_LOCK_FUNCTION(sem);
+bool down_write_trylock(struct rw_semaphore *sem) EXCLUSIVE_TRYLOCK_FUNCTION(true, sem);
 int up_write(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
 
 #endif /* _PERF_RWSEM_H */
-- 
2.56.0.313.g2479322e68-goog

