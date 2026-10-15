Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E353FD5A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077623; cv=none; b=kza07vE+ftNxfblCtmomPhxHairrtLG6eOkDvIySRo1Lc7H//98Sge+65p2V7Aiug9TZAp5x/1sCTRgsWjQgC5Ec4dNtNc6tUcT+1pUJ+mo9dG7FBLJyRtDnKxDthN1DzPaDSBq09SZnNW2KFHf9Jy1DXCtYKwVa37xZTaWZ+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077623; c=relaxed/simple;
	bh=OjX1ssYSRgIYegjZbrTmi9PNdcpPB0TQFrmlThWg5lI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0aWXWnCDvn2Iy/mXYs/j0eN9bEp1pdaohHwnuK0NOsssDNsa6pZsC2oRFKUXf6j8nLTwIflGj1WeyTXRDzfeS2jHN8Uw90zeABqj0OyM7XSaDNMgRdhiVDA73eCD2ju7U3Qm6Negtl2KserH7gS7YYsc9x1u3JL7gr9Wm+KRwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb9Byiin; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb9Byiin"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-824329dc1ecso3594016a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077617; x=1792682417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mha7gBqe+FHTzNhXa015mlIzphM9boxhmgV8ZQMkPHE=;
        b=nb9ByiincjtpQVbIh/uv1EeMty5ujEoaChNT0evUyWx2pshiKDjXrOQM1PDxv92NUu
         YwQk0GKyREgAHVyAFLRvk8MJJNx8GIB62Jx+9iji+iSTBLFS2aq/pHglzf2BbxQWg1qL
         bmoFg3O5ccfcggYSSRln4Vg4Fakv1VEH/N0nFT5n4+Z4SAxGQIzOSr9z/7fBzFcZOTDp
         fnN5OT7H/bAqrH9c1013hob/lhJ3Xr8zG+S9Fj6XPTcpwGJM6fI331GcqMMZigIdB9Nh
         ZgrHLHo0OSVhgnzD3keu2BZziwvCx2IGbD5rMjZvzYgWTsaoBAOcIs62/KPRve1l+dOy
         is6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077617; x=1792682417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mha7gBqe+FHTzNhXa015mlIzphM9boxhmgV8ZQMkPHE=;
        b=ieMRUKOfPeNO0fBwu5ZAuaBCrtPh4zUvsrO7MOVHK+JAeRzq+8ENmLvpKC3xLrg+a3
         M8CRIgb2ov2bsi01fKmycDfCgBXNwnbvYMRhkLtUlHwV1hrAga7+Nzsjpn5tMA2ARAOB
         BDJuXi0a0G8dayoNJwdyQLX2PKp9RhmR0vZB+aTSV68GjU1iW/2yhbr0oLt3m2yVQA6p
         ADQgNKNhVYHxesZXZvTHfEXESNbRStGhyAxlFwS90d0QRCyupJUifDDJE8YssWAgytMg
         UJDKjVX5p1fxcTNdphB/5MXcr/q7RiX0M2u7mKkYTPmqVmPYlAlpNla3VydSXUwhJiJl
         QxQA==
X-Forwarded-Encrypted: i=1; AKwUvBx7P1Ta45rtYGa1MZbmPJ/XgZh0rE0pBGSV3BsjI0Rd+OXFM32371o996SVDa2PqpGxdOL4HivOC7kZRCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ9nTZX9mzRHC59omFHUxeO29xNx3LwhV+APTF3cmQczdK7luX
	JgPeEfimBmUXlFci1I+ewgo3kWlyxhY54eLJHO5Rkb37LaL6ENsidjri
X-Gm-Gg: AYBFou0Q1M9zSbNe4ElEuaDA7qAkdMzNYbuQH7aPPKaXW9ydkpfb4HPsaH2J8g+y9WY
	q/9KpOOKZ5Qdmgj9F/4WgVxMwZv/+N3/6mgPSRWaQozYKZhDe9uiqI0Czq7lLlM0dplAkl6hvcI
	UOd3/Q9zPOIPeznwNiY99QavXsuUnTOsQnuNVM//LMSF8LBMNhCZi8MdvXGhuKwhXWmi7RwiSjG
	gBLJbwAAfB9p31toUgkpfUU0L/MuPMS5mSuDbOCFOfOGBQI6oNzATA5zOT/jCqWbxivVTSfkd1i
	Vx0QWwIuhDx1/tWjkN1GUVLFmW47u48OpjhhWCsBde4cQBK/3Fnu+nysCzgu+QI/cz1vOBWayPw
	rFZBJmrx/n9N+taCeuSFsMtNeXJdSvXrcxOEmJstFLHgqk6t7OaAE0U9yHQffg67vIlI5sZkrhP
	ybq227Bg+6LBnN79muWmBralOf/zFyeOI9pIosNXErdjOWfICGdaUmshqNXw0wmFfhJrQ2OuVJF
	H7INEk8OcBryR2XfIwjewiAQUAZo84dyewsKKxRx2cahlLci4E=
X-Received: by 2002:a05:6808:4f28:b0:4b3:7b31:8df7 with SMTP id 5614622812f47-50c524711f0mr21604940b6e.14.1792077616511;
        Thu, 15 Oct 2026 08:20:16 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe916sm20246124b6e.1.2026.10.15.08.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:20:14 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
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
	Dmitry Vyukov <dvyukov@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Luo Gengkun <luogengkun2@huawei.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] perf/core: Don't send SIGTRAP after exec removed the event
Date: Thu, 15 Oct 2026 10:20:13 -0500
Message-ID: <20261015152013.106040-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sigtrap event must also set remove_on_exec, so that its SIGTRAP never
reaches a program after exec. But the signal is sent from task work,
which only runs on the way back to user space. If the event overflows
shortly before execve(), the task work can still be pending when the
task enters execve(), and then runs when execve() returns. By then
perf_event_exec() has removed the event and the new program has default
signal handlers, so the SIGTRAP kills it.

The exec_stress test in the remove_on_exec selftest catches this and
fails about half the time in a VM. A process that opens a sigtrap event
on itself and then calls execve() is killed by SIGTRAP in 15% to 50% of
runs, both on an AMD machine running v7.2 and in a VM, with or without
close-on-exec on the event fd.

Commit ffb684f2aa14 ("perf: Fix race between perf_event_exit_task() and
perf_pending_task()") made perf_sigtrap() return once
perf_event_exit_task() has set ctx->task to TASK_TOMBSTONE. Exec only
calls perf_event_exit_task() when the new program is not dumpable, such
as a setuid one. An ordinary exec keeps the context and only removes the
remove_on_exec events, so the SIGTRAP is still sent.

perf_event_exit_event() sets PERF_EVENT_STATE_EXIT when exec removes the
event. If the event fd is close-on-exec and was the last reference to
the file, exec also queues the file release as task work. Task work runs
newest first, so perf_release() runs before the SIGTRAP work and moves
the event on to PERF_EVENT_STATE_DEAD. So don't send the signal when the
event state is PERF_EVENT_STATE_EXIT or lower, which means the event has
been removed. That also covers PERF_EVENT_STATE_REVOKED, where the PMU
is gone.

Fixes: 97ba62b27867 ("perf: Add support for SIGTRAP on perf events")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Changes in v3:
    - Rebased onto v7.3-rc7, which has ffb684f2aa14. That commit replaced
      the PF_EXITING check that v2 was placed after, so the new check now
      follows its TASK_TOMBSTONE check.
    - Peter asked on v2 if this is the same problem as Luo Gengkun's patch:
      it isn't. ffb684f2aa14 covers an exec that calls
      perf_event_exit_task(), which only happens when the new program isn't
      dumpable. With it applied, an ordinary exec still kills the new
      program, see the numbers below. The changelog now says this.
    - Read event->state with READ_ONCE(), since it is read without locks.
      Suggested by Sashiko.
    - v2: https://lore.kernel.org/all/20260930144248.59858-1-danishkhateeb03@gmail.com/
    
    Changes in v2:
    - Skip the signal for every state at or below PERF_EVENT_STATE_EXIT, not
      only EXIT. With a close-on-exec event fd the file release runs first
      and moves the event to PERF_EVENT_STATE_DEAD, so v1 still killed 360
      of 2000 children. Reported by Sashiko.
    - v1: https://lore.kernel.org/all/20260929182935.355892-1-danishkhateeb03@gmail.com/
    
    Tested on v7.3-rc7 x86_64 under virtme-ng (KASAN, lockdep, 8 vCPUs on an
    AMD Zen 3 host):
    
    - selftests/perf_events/remove_on_exec: exec_stress failed in 11 of 20
      runs before, all 20 pass after.
    - The exec_stress pattern in a loop (50 rounds of 30 inheriting
      children): 24 children in 19 rounds were killed by SIGTRAP before,
      none after.
    - Each child opens its own sigtrap + remove_on_exec event and execs:
      342 of 2000 children were killed before, none after. With
      PERF_FLAG_FD_CLOEXEC: 1004 of 2000 before, none after.
      On the bare-metal host running v7.2.6 the same program kills 297 to
      1033 of 2000 children across runs, and 1012 of 2000 with
      PERF_FLAG_FD_CLOEXEC.
    - The same program as an execute-only binary run as nobody, so that
      exec calls perf_event_exit_task() (the ffb684f2aa14 case): no child
      killed and no warning, before or after.
    - sigtrap_threads, watermark_signal and mmap pass before and after. No
      new kernel warnings.
    
    v7.2 fails the same way in the VM. I did not test kernels older than
    v7.2. gcc W=1 and sparse show no new warnings.

 kernel/events/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7846d70be57f..61e9a88adca8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7633,6 +7633,15 @@ static void perf_sigtrap(struct perf_event *event)
 	if (event->ctx->task == TASK_TOMBSTONE)
 		return;
 
+	/*
+	 * The event was removed after this signal was queued, e.g. by exec()
+	 * (remove_on_exec), which may also have closed its fd (close-on-exec).
+	 * The new program has default signal handlers, so a SIGTRAP would
+	 * kill it.
+	 */
+	if (READ_ONCE(event->state) <= PERF_EVENT_STATE_EXIT)
+		return;
+
 	/*
 	 * We'd expect this to only occur if the irq_work is delayed and either
 	 * ctx->task or current has changed in the meantime. This can be the

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0

