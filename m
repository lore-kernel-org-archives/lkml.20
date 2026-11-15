Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794786011;
	b=5lU9X++DYiYqtgpeLxkOMOfkiH1cSL4Fh4yp2V3eCHGWYi+UCn63CAXA/QeWlDOCpeD+
	 TLX+Byr/pezusNoRe15mUot0AAzQeZUHvDF+dh0GDKA3eUaHSWy8nEgVyzn1bwARBUOpi
	 pIWV8Ja8td4bAtuoNlmRC61aFOOlfsesvPueJMkK+K7cND7f4jj79f9sip/9ZzbeuEwPB
	 SXwoULjtgSMWtVdVOV7cv7hVSZspk7r6x6zBspGbMbGEbXTy4HCg74x6lMh+TNYfxmJPD
	 YbxpVKts7voWsWd/94nYxxP2ZAYHDNibvj2Hq5LsOwseDxIypP2Q8fXznU9MzLJvn9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/WFY1Aa0rGDcg5SZYf13pEO+y4GAGpssafPS9WSoXdU=;
	b=vVliop10UAPCB3zL33dXNnamGQqrYDSmgKp8qcssFTExnK48vg26Gg+HglTFJTENyQAP
	 /Do5Ao5nkJE6m/9Ei39cnKRx49LJADJtr63Izc+sf2ov9LvVW6A+SOeRfEMPP7Yrfmvx/
	 wU2/xdeg3m2/CkQKTefh2t5kadSPWy6+nRtVyiE5aEpKv8nUIeOW7kCDjEeKJHtOvKohB
	 aqH5D4bwIpxdd7MUb/06HLLc88RmPCbQRoP3u8JtBrES1TT1SP7c6uyDtyFPVQjDe16op
	 tuLnNw1GDiuJMBJgKYIBWAf/GcjpE+FTjqmvnGQpVYVpju7ZoVCcjbUn4BUlNoR7zxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9XqRbuT;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE926606A337
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE926606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9XqRbuT
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2163997a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786010; x=1795390810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WFY1Aa0rGDcg5SZYf13pEO+y4GAGpssafPS9WSoXdU=;
        b=c9XqRbuTnEbw5VwHAOvCkia8YwNiRigcFLm7zpQT5y8AYY25mg0yl3HvGwSpnyPTE7
         OjgIvALW/jDWbXQHyBLhmK5kzTjKfP2FdUj1zXr9Wltl9vP2TiK7OO8lOEtkV3MzzQdP
         R4je8rP2Xlb723liiKA/LCs4w/HbAH1BbPH6Nv79ih/t12mntyl25hi3Za9Wq2EyYA/B
         B8J5GwTm5uuOgQMGsvobp1uezn27lm3TRriM1v1Bv+pXSLsYvpvq1tR++Q2VfJuLYwU+
         IrhqDRE9BXpLVImFL1Xxphq8LQWxxnbcLdH9+B3e4J6NkEMJtLFmhvLwIfypfJsR/1He
         AieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786010; x=1795390810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WFY1Aa0rGDcg5SZYf13pEO+y4GAGpssafPS9WSoXdU=;
        b=DcUFYnxflISf6lTdzOrFsQ6EHtFIFzywi6tPTvu8Fps0YrddB+A2RP+n8jbY1YHGr5
         IgzMFnrbfsAuMPyMLwTL/C0VSRfUD5y/5bvLOFlfAOa+UwB/WFSvnz70SjM81uI7L5UZ
         rL4NP6G6vD0ni+mQtrQxkPjgqinpPSkweRPJpZX7Igre4juFQYN0k+C5HvBhBTjVJxiQ
         VYE2GbMOKaOF94XkK8av9ieDyxAVzzTvNEAQxV4jOM1Nvh614L65ClehYAFpsI0n1UYX
         zYpU0mybVt5+aE0XxIh8CrIjSmmGYNXmKi6O4IqcVGqRRHYW//zPfCm4soaOuqvbkPFH
         3Y8w==
X-Forwarded-Encrypted: i=1; AL+hErHrjlHWFri2z/CniX9auYU+TyV8WX4y3H5IBE2vdAfDmwDVUl4haNp8XMNyQlyGi9gs61Sjh4iIH9xk0Ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wxJ30HctxwQOYnJj4fKkSGnGViFv85QSEMkiTK0tiuGKCM4Wo
	ldjR4JSCN7uK+LVXKNh/QBIdqF1YVFI8YYrjh2ysAWVTpFJUawhdtzD6
X-Gm-Gg: AYBFou0SvGakYj0qwax6QRRxKE70mBOAhlKMjLFf5va9ckohiq2LSQBJUzQtkN9NJ3b
	DwJhlK2Z0+Wj9fdb2gWSf+rN1Fb574FOnhW9QJUTBpl3W24WTc7jsjCFCQgqX7WN+p9amcta9OM
	krZacql/6ku9L6w5Xu6DmbDIYX9Q0prNQJ9H6/hS+1VGNHjoqdoafi9jBBW0oCSNfbao2cYvQF+
	3zyGndZ/ZKWuFN2YQzbLAQwBaxXdXvdaHzO72Jr3YrVH28CECBdSsStz9pkoRrxx/c8GZ0niNIY
	7RNaWkUTYDo3+tFmneXAwxaH5aOIwE09uCd5ALgOjKY6HXyd8CTCO9XZHIzRiLRJ2fSyZ/orV5M
	MnS8SQTVnjfK2uV3scInlUfW+RHNZuQQCo8kHeb8GdHBOolx+UfFjtiwmpwHLSeROXG9f84ia6S
	yU3ezpZdqtXOBgNV1vY5wvKgQcVpUdazaXmNhAEPIPJoXOeGBJYqyWwNIGhUrhkkNHwWLfYWOg4
	n6myE7ZWumZ/OWTDE5Qz2eVmX1Vgvmuy3tU3hSwTnzQUcvEMVL6dcqXOESN6TaC8B386CGAs/m/
	k2zmv0IlSw17cOxQl/ZLmi56P9Qji539kSqPiuvLXfH6qN3eCdv5AOO5/Xvlt+KPnd5lvttM4iK
	7k+IcfRV4J7qT/Z8HkICw3jmfDYAPHj9darctDq+StTY8t4norjw9Y65TumNTfjsqkzjvcg71CZ
	8PY1ktLaEQddDloqHgTTOoHcmRUst4G8awFXb5frBI6+lucM1BgJQp4dmemObcaJXVvvpFv4Kqb
	8IMgv3fZmr22jDIvN5VYjs/68CXLZJSAR1M6y6DcgHwGcxxzFxfe/5gsg8GEV8j
X-Received: by 2002:a17:90b:5147:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b1b0818413mr8265941a91.4.1794786009983;
        Sun, 15 Nov 2026 15:40:09 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm18921968a91.0.2026.11.15.15.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:40:09 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Marco Elver <elver@google.com>,
	Taeyang Lee <0wn@theori.io>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf/core: Don't take owner->perf_event_mutex under ctx->mutex on exec
Date: Mon, 16 Nov 2026 10:09:49 +1030
Message-Id: <20261115233949.13685-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

perf_event_remove_on_exec() holds the exec'ing task's ctx->mutex and calls
perf_remove_from_owner(), which takes the owner's perf_event_mutex. The
order documented above perf_event_ctx_lock_nested() is the reverse:

    exec_update_lock
      task_struct::perf_event_mutex
        perf_event_context::mutex

perf_event_task_enable() and perf_event_task_disable() follow it, holding
current->perf_event_mutex while they lock the context of each event the
task owns. The two paths deadlock against each other:

  perf_event_task_disable()            perf_event_remove_on_exec()
    mutex_lock(perf_event_mutex)         mutex_lock(ctx->mutex)
    perf_event_ctx_lock()                perf_remove_from_owner()
      mutex_lock(ctx->mutex)               mutex_lock(perf_event_mutex)

Neither sleep is interruptible, so neither task can be killed, and the
target is stuck in execve() holding exec_update_lock for writing and
cred_guard_mutex. Reaching it takes no privilege beyond opening a
remove_on_exec event on the target: open one on a child and call
prctl(PR_TASK_PERF_EVENTS_DISABLE) while the child execs.

Lockdep does not report the inversion because perf_remove_from_owner()
takes the mutex with SINGLE_DEPTH_NESTING, annotated there for a caller
arriving through perf_event_exit_task() with a child's ctx->mutex held.
No such caller exists; the only other caller, perf_event_release_kernel(),
takes ctx->mutex afterwards.

Do not unlink the event from its owner on exec. It stays on the owner's
perf_event_list until perf_event_release_kernel() or the owner's
perf_event_exit_task() removes it, as an event of an exited task does.
perf_event_task_enable() and perf_event_task_disable() still visit it but
leave it alone, as _perf_event_enable() and _perf_event_disable() return
early for PERF_EVENT_STATE_EXIT. They now also reach its child events,
which PERF_EVENT_IOC_ENABLE and PERF_EVENT_IOC_DISABLE already do.

perf_remove_from_owner() is then never called under a ctx->mutex, so take
the mutex without the nesting annotation and let lockdep check it.

Fixes: 2e498d0a74e5 ("perf: Add support for event removal on exec")
Reported-by: Ian Rogers <irogers@google.com>
Closes: https://lore.kernel.org/all/CAP-5=fVq=2D6XjVEbAvJz54hG6PcwZZjn-za0hAfK8YV-J+MtQ@mail.gmail.com/
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
Cc: stable@vger.kernel.org
---
 kernel/events/core.c |   22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f5f2261..ec51e6b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4747,7 +4747,6 @@ out:
 		put_ctx(clone_ctx);
 }
 
-static void perf_remove_from_owner(struct perf_event *event);
 static void perf_event_exit_event(struct perf_event *event,
 				  struct perf_event_context *ctx,
 				  struct task_struct *task,
@@ -4756,6 +4755,11 @@ static void perf_event_exit_event(struct perf_event *event,
 /*
  * Removes all events from the current task that have been marked
  * remove-on-exec, and feeds their values back to parent events.
+ *
+ * Top-level events stay on their owner's perf_event_list, like the events of
+ * an exited task, until perf_event_release_kernel() or the owner's
+ * perf_event_exit_task() takes them off. They cannot be unlinked here:
+ * owner->perf_event_mutex nests outside of ctx->mutex.
  */
 static void perf_event_remove_on_exec(struct perf_event_context *ctx)
 {
@@ -4773,9 +4777,6 @@ static void perf_event_remove_on_exec(struct perf_event_context *ctx)
 		if (!event->attr.remove_on_exec)
 			continue;
 
-		if (!is_kernel_event(event))
-			perf_remove_from_owner(event);
-
 		modified = true;
 
 		perf_event_exit_event(event, ctx, ctx->task, DETACH_GROUP);
@@ -5876,6 +5877,9 @@ static void free_event(struct perf_event *event)
 
 /*
  * Remove user event from the owner task.
+ *
+ * Must not be called with a ctx->mutex held: owner->perf_event_mutex nests
+ * outside of it, see perf_event_task_enable().
  */
 static void perf_remove_from_owner(struct perf_event *event)
 {
@@ -5900,15 +5904,7 @@ static void perf_remove_from_owner(struct perf_event *event)
 	rcu_read_unlock();
 
 	if (owner) {
-		/*
-		 * If we're here through perf_event_exit_task() we're already
-		 * holding ctx->mutex which would be an inversion wrt. the
-		 * normal lock order.
-		 *
-		 * However we can safely take this lock because its the child
-		 * ctx->mutex.
-		 */
-		mutex_lock_nested(&owner->perf_event_mutex, SINGLE_DEPTH_NESTING);
+		mutex_lock(&owner->perf_event_mutex);
 
 		/*
 		 * We have to re-check the event->owner field, if it is cleared
