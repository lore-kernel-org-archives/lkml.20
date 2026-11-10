Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348507;
	b=l2o0SovzRr3CGARwy3geTSxPj6Ec/cvoDk9fZ4BpResHJAFJaqNxGkzsSXDdJLanfY6K
	 8L+UKZy40CYsXyT1QmPLfQZ/advaWd2RhjhmHwB4/Qns9JOJRSjcSCjxJos1pbm2D/T8T
	 4ASbIM6o4JscQ099DXEx6Q5UWfwXTaYLtbjx3g3MwL37MNUcEcYvL+72WNNVqcWnkCug4
	 Uys1cn6+uX2RhniLEXhOMpdwZBvJxDCysTe2dqRsiK2LUPWrQ1tCq8Cjz8ZYwI3Vdp/sE
	 Vfhiopl45k8Ac7sJEqZ/EEoEeiHOROOSJ8sbAtj6jCuaQeVwRXXDzeqm48bpgYp7r1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XS8KwxxTSM/GHbNZjo0jXubef4iD9k9Unh4LZDXen94=;
	b=mPKDqamiBCtz3JNL6Sh7n9fKv6yWqLXhkYkwypbRmUvqKmgYCeJ+JXCqcUoRm8f3bM1G
	 WW2OtjdDyx+iuH6cy/FMAvGoWns5QyUxZshzxdNp4s21y/VRqu/K+9lgiemhCNkJGgcmE
	 H0Svf1ucC7SB6vzg1fY2Pe7wHU539TZozJHZhRgwK5u44x5FZnmLUvj12GqZHSWLAdMOj
	 CcAiJ0JdEcU7+4Q/0OxRhMSYOAbDyL0kRm6vu7mVHXi+I8vQt+St6CHvmI09EpfGZsReQ
	 lER+IJM/s0MOpuAc7xakFKqZFHgEQ54EFGe7amTAR1jTzxD3nEYBhMhfyJ1MRQGrFQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQ5PYVGw;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2042860A6F45
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2042860A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQ5PYVGw
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so3436291c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348506; x=1794953306; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XS8KwxxTSM/GHbNZjo0jXubef4iD9k9Unh4LZDXen94=;
        b=oQ5PYVGwUBoUDJpIJj4aHAcFG7K/HRxhucwRwmAEHKqb/4rz3qWpyqhQvcVY4l0AAK
         4K3jsksP1rGFEVaoc7kRxf7c7npthZxpz3kJgT/m2OKCfu3spO9kzmwIANkeI3FnTadF
         48YKZ/cUYYR4q3H89QC/DBOXPjcrNcS9se8QprSswbJEmVA90dNnmTy5WvjJ0XFP2BJr
         6y1hVLP83LgrzgQaqYJQkvLbefSWkfZflICqISP21hz25XbaNQ2ZeDFE69SPRZAXmfyu
         C6POs2CXiqO7XV/ttIwed6U2MyatVUUQkEgtumQCjOHr/vsl86pMi2i1M21sYpPLxfcV
         y5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348506; x=1794953306;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XS8KwxxTSM/GHbNZjo0jXubef4iD9k9Unh4LZDXen94=;
        b=YP0hO1o0Oig21ZMgyejqwPKv95NgNdyhPiUiRsEBy8iWefWmwocbcnY2bBt6u6DOHZ
         Jp/sWVKND8k17C/WRhnaJgcSXaEsO67XwszNhxtBVfVS0UJa5ONDDFp2bJLtAnwS8YwG
         qZ1kn8XjWvg3h7AAXhvOQU6nLkr1SSGxJsBwyO8cMzK8MuUQYWJxAJVOUiwsv3AmXfHM
         XQNbRbY2v9hXjg4IfWLeP2qL8LCFVFj3/GRiktJmtTHkqCgx52gJJd7DbkNHU2+o9dMP
         /pYOM2couqZfFWJr+c+PHHaIPNFOjf7xPfkqr4dhOkjzl0DAyYQ7IDSBH74Y8Z9YTsTj
         i35Q==
X-Forwarded-Encrypted: i=1; AL+hErErCWNa/W5kyFpzXMv0jwUDWTJS/CsVqxUEE00c974uE60vXHjyV+FuVHcE2tsgXMZEugmEg/vXY/X6hM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JcHWeAWDKmBs9V3s/7sJSde4/hN76TqRVg4B1s6wBNBzvecrt
	+BXCYPDb52bTtzmA1FWxHmCWqvt96i6rKZW1Y1JkLkF66ggq3j2o4esaao19K2FrGA+Ar2XEpp3
	qAvwrIVtAyQ==
X-Received: from dlec11-n2.prod.google.com ([2002:a05:701b:428b:20b0:1a7:17d1:fc4a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2302:b0:1b3:b53e:b4cd
 with SMTP id a92af1059eb24-1b3c030ae16mr295689c88.21.1794348505769; Tue, 10
 Nov 2026 14:08:25 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:47 -0800
In-Reply-To: <20261110220803.2503416-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027231513.816148-1-irogers@google.com> <20261110220803.2503416-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110220803.2503416-5-irogers@google.com>
Subject: [PATCH v3 04/20] perf rwsem: Add down_read_trylock() and down_write_trylock()
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
2.56.0.542.g3ef89b7020-goog

