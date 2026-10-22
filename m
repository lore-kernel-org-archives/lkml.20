Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701023;
	b=L8nzIeL087E0T7V6MSTcVWkdNXZrYs0Mdjfx7ZlSKhNTJfcQIW5e9m0Fn8lMdOi2tXVt
	 dx+EjhB6mD2pOxZcvxghYlbV7qJ73rxiTpymqf0TQCsSircjEYRr1ZfoB1YStUhonbza6
	 a7fT0PiYDVq8j4lxNDEqIcXWlwEsfOUfSoFiAnzB4aps+bGlId7erPRt9pslzZ08Loto7
	 XqQSlmZWHHL35aRQknvB1ACZMTtCA1YXTAfxogkYVv4JDzYdm5u7kQAj1Lk2l2MtFYxdb
	 rkh7+LYKi/KiVzYNZh+/zXdY3SJqxr8LXoAslgSrSl7+Yg0Lc+W/X08fmXTmqUIcGpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jncnN8hNB149YV/7QR6pbWspMiNEL/g00PLfD5StrJE=;
	b=1hkVBZxE9lO3X48BXrc+ICgK06HXQR0uHVC8ZCV6xXMVlrkAvEEQPLLYjz92G6sugI1C
	 xzLhCqjVtNgK+wjId3ygO5ZI4CsQdL983W/2bIaSjeB+1MeArOHcSwYZJkrcYHerCkobP
	 J1gSGuDokU1TWVoGbgdtHg8thZDTo3WhS7qlAfnbxPxlnqNnYnrV4FAL8j9XVJ0mHHVbf
	 /wQ8+s6yqt/tnzPEoFHG/j0LIDCbt131qYW3S6ilsQVogzDj6evQZIM5nJUruZcOwsE6M
	 nqmTRssL9nkd/bNJvbJ3eqLtnfCV6Bz7DImBlwayZ4e90VeXGgCY1zUnLHqM6RBVZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=al2a4dDN;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA246606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA246606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=al2a4dDN
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so1210233c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792701022; x=1793305822; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jncnN8hNB149YV/7QR6pbWspMiNEL/g00PLfD5StrJE=;
        b=al2a4dDNtnNQKDJTNaWoOW/tX5Wu00kFM/0d+1ZnH73GlJT+0lOGpoW6Y5NJP76/B3
         FJQ3w+agnI1YkkgU8a13Nc63DImxppMQLZvbFy/rcGLeUK9PSRDdn1X5WhhCjVu8Za1P
         mu4cdknjbAiqmnwrGEx0uBflO3BxeqE2A28g3EkVToNWYOjhWmUUKJ1vtp+8SPtisA6h
         2qZP8F3rLVhZ8iyN3H7OMRgLtWbMayLzrevPhLAheL6MO0Zf+Ta+bV2ly8MTRUkv+t9l
         aLcPxtN3IZ9l2XZKqiTKhQGM7GNXwJbo9qNt/251YGAKzr9YOXCrTMoeItEA71GYVZAp
         Q5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701022; x=1793305822;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jncnN8hNB149YV/7QR6pbWspMiNEL/g00PLfD5StrJE=;
        b=AlF0E61OWAeflIeeZ/4zVEf6MGUZUejTjHrpKAP0Gpt4q6hfQVhEWOUyLa0GVS3vlv
         YJ5h9/m0YpoT90InwpQ6oV7pQUKYmyj0wR9Cqnj1ak24kQ6K3epkAJd+h8GjSL6uWj15
         t5+2zSOhjDygHVv3Pdnhj4Z/uNrSoD0cZVQbDQVLYhK6sYlKS9poZRxhOMDXZxFK7cAC
         p4XR9qpusPeIpQyJHkfq7YWBI6R82U7QR/J3lsyawR41W//L4wj5f2ZH6g11UC6oYtS/
         Hf0rVm/WtPjZVrvxVO+jtQa0J5AIbZN9TUrN1JoXOMtYn5bKj/+DkSbZpZjYvF5bYAxq
         lzoA==
X-Forwarded-Encrypted: i=1; AKwUvBzXY01N4ECoeQYe7OdnHlBr2HviRHWGhgvbbnyNtTHOEzcJxxzu0rOK2kDkfZT/1J9faELTKA3++Bo0Daw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjODqqu1Sjez862z7a/2jIL97M36F8RAjFpMYvgThufAXN7G0o
	F5fcOT6G74no230SgEdpZVD4E6xRWIgxqTW0IxSjeN50na4DW6LQSGnAdHcV1OhbNB7CTgTETFH
	LTQ68FNGQhQ==
X-Received: from dlea4-n2.prod.google.com ([2002:a05:701b:4204:20b0:189:5eec:837b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4081:b0:195:8fa1:b447
 with SMTP id a92af1059eb24-1958fa1b4c4mr519494c88.12.1792701021167; Thu, 22
 Oct 2026 13:30:21 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:29:56 -0700
In-Reply-To: <20261022203003.1779152-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020205859.1080743-1-irogers@google.com> <20261022203003.1779152-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022203003.1779152-5-irogers@google.com>
Subject: [PATCH v6 04/11] perf lock contention: Extend get_lock_owner() for
 rt_mutex and mutex handoff
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, ddhariwal@google.com, eranian@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Extend get_lock_owner() in tools/perf/util/bpf_skel/lock_data.h to:
- Support rt_mutex locks (LCB_F_RT) and CONFIG_PREEMPT_RT mutexes via
  struct rt_mutex_base and struct rt_mutex___old, masking out the low
  waiter bit (0x1UL).
- Return NULL when a mutex has MUTEX_FLAG_HANDOFF (0x4UL) set on
  owner.counter and is in the middle of being handed off rather than
  actively held.

Also add rw_semaphore.count and struct rt_mutex_base to the fallback
tools/perf/util/bpf_skel/vmlinux/vmlinux.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf_skel/lock_data.h       | 62 ++++++++++++++++++----
 tools/perf/util/bpf_skel/vmlinux/vmlinux.h |  5 ++
 2 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/bpf_skel/lock_data.h b/tools/perf/util/bpf_skel/lock_data.h
index 91d464ac18bd..43d8f5030bc1 100644
--- a/tools/perf/util/bpf_skel/lock_data.h
+++ b/tools/perf/util/bpf_skel/lock_data.h
@@ -104,11 +104,24 @@ extern struct rq runqueues __ksym __weak;
 # define __has_builtin(x) 0
 #endif
 
+struct mutex___non_rt {
+	atomic_long_t owner;
+} __attribute__((preserve_access_index));
+
+struct rt_mutex_base___new {
+	struct task_struct *owner;
+} __attribute__((preserve_access_index));
+
+struct rt_mutex___old {
+	struct task_struct *owner;
+} __attribute__((preserve_access_index));
+
 struct rw_semaphore___old {
 	struct task_struct *owner;
 } __attribute__((preserve_access_index));
 
 struct rw_semaphore___new {
+	atomic_long_t count;
 	atomic_long_t owner;
 } __attribute__((preserve_access_index));
 
@@ -146,9 +159,25 @@ static __always_inline struct task_struct *get_lock_owner(__u64 lock, __u32 flag
 	__u64 owner = 0;
 
 	if (flags & LCB_F_MUTEX) {
-		struct mutex *mutex = (void *)lock;
-
-		owner = BPF_CORE_READ(mutex, owner.counter);
+		struct mutex___non_rt *mutex = (void *)lock;
+
+		if (bpf_core_field_exists(mutex->owner.counter)) {
+			owner = BPF_CORE_READ(mutex, owner.counter);
+			if (owner & 0x4UL)
+				return NULL;
+		} else if (bpf_core_type_exists(struct rt_mutex_base___new)) {
+			struct rt_mutex_base___new *rtm = (void *)lock;
+
+			owner = (__u64)BPF_CORE_READ(rtm, owner);
+			return (void *)(owner & ~1UL);
+		} else {
+			struct rt_mutex___old *rtm = (void *)lock;
+
+			if (bpf_core_field_exists(rtm->owner)) {
+				owner = (__u64)BPF_CORE_READ(rtm, owner);
+				return (void *)(owner & ~1UL);
+			}
+		}
 	} else if (flags == LCB_F_READ || flags == LCB_F_WRITE) {
 	/*
 	 * Support for the BPF_TYPE_MATCHES argument to the
@@ -158,20 +187,35 @@ static __always_inline struct task_struct *get_lock_owner(__u64 lock, __u32 flag
 	 */
 #if __has_builtin(__builtin_preserve_type_info) && __clang_major__ >= 15
 		if (bpf_core_type_matches(struct rw_semaphore___old)) {
-			struct rw_semaphore___old *rwsem = (void *)lock;
+			struct rw_semaphore___old *old = (void *)lock;
 
-			owner = (unsigned long)BPF_CORE_READ(rwsem, owner);
+			owner = (unsigned long)BPF_CORE_READ(old, owner);
 		} else if (bpf_core_type_matches(struct rw_semaphore___new)) {
-			struct rw_semaphore___new *rwsem = (void *)lock;
+			struct rw_semaphore___new *new = (void *)lock;
 
-			owner = BPF_CORE_READ(rwsem, owner.counter);
+			owner = BPF_CORE_READ(new, owner.counter);
 		}
 #else
 		/* assume new struct */
-		struct rw_semaphore *rwsem = (void *)lock;
+		struct rw_semaphore___new *new = (void *)lock;
 
-		owner = BPF_CORE_READ(rwsem, owner.counter);
+		if (bpf_core_field_exists(new->owner.counter))
+			owner = BPF_CORE_READ(new, owner.counter);
 #endif
+	} else if (flags == LCB_F_RT) {
+		if (bpf_core_type_exists(struct rt_mutex_base___new)) {
+			struct rt_mutex_base___new *rtm = (void *)lock;
+
+			owner = (__u64)BPF_CORE_READ(rtm, owner);
+			return (void *)(owner & ~1UL);
+		} else {
+			struct rt_mutex___old *rtm = (void *)lock;
+
+			if (bpf_core_field_exists(rtm->owner)) {
+				owner = (__u64)BPF_CORE_READ(rtm, owner);
+				return (void *)(owner & ~1UL);
+			}
+		}
 	}
 
 	if (!owner)
diff --git a/tools/perf/util/bpf_skel/vmlinux/vmlinux.h b/tools/perf/util/bpf_skel/vmlinux/vmlinux.h
index 94e42b022ab1..b75ddc6846bb 100644
--- a/tools/perf/util/bpf_skel/vmlinux/vmlinux.h
+++ b/tools/perf/util/bpf_skel/vmlinux/vmlinux.h
@@ -76,6 +76,7 @@ struct signal_struct {
 } __attribute__((preserve_access_index));
 
 struct rw_semaphore {
+	atomic_long_t count;
 	atomic_long_t owner;
 } __attribute__((preserve_access_index));
 
@@ -83,6 +84,10 @@ struct mutex {
 	atomic_long_t owner;
 } __attribute__((preserve_access_index));
 
+struct rt_mutex_base {
+	struct task_struct *owner;
+} __attribute__((preserve_access_index));
+
 struct kernfs_node {
 	u64 id;
 } __attribute__((preserve_access_index));
-- 
2.56.0.307.g5fe7bd680c-goog

