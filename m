Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112026;
	b=TRrUKtjLN48RGt4dr6UX4Lk5BkBOgtjs/l+bOOmjv0t66D5pap/aX6u3+LWKTOo+0Szm
	 flcgDFtAG+VTriouBA2niirC4k9LkgqfbP8Rv8l6aRp8uBg0cUMme740eml5vdtKi+W8S
	 Tx1o7V0PhcRgbLhXaunVIgGJVbAb7U5OviNwVCQbYtX1a12WPfFzdHRiG98MxFUSKcBJ6
	 mGLJvK/vRdr5WE7tpuTnmKaKvCtJ3QxkKi++Xkix6lQ8yG+/IB93xMXeb0lFKe7Ga6V4b
	 X9mYYtH4HUyQ+9eQHrxL3j5Tb4U6xSYywCHlUDmfdlXXB7aM9rEb46+0YITo035i/7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T1E/r4jGzpmWVwuykcjDGwY++XCWizWnAfM22Qf0RY4=;
	b=LCKekJP8326TAKzP4nrKGikyzwvEUM/IZX/CKf+zM0ZBUv3m6e682XkBiShaj9SXv9dl
	 THNLmZ6wk/53T0ZbFacpNIMZXz3/1auqud5B2RqPD096kCPMSTWiZZrjs1S7z7jFTqv76
	 TEKtncvI4niccyueagPuqY/RJR5ys88Zj9nj8t1OFBX0l+xhKmptfI7up/+yU+kuZAFq9
	 L+5bF0L8SioEBeN4kM+hDkU1TcPd50qws5DqdSyf8dLv4C6m4fKQlgIDRNEhF/uiDucP1
	 TRYnLpI87gJnMUBLG1s68HNmcHcz5hT5Locn70xuNvsCWufBQUAtx3ITVabBi1AZ2kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hkV/NtVt";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E02606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkV/NtVt
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso611283eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112025; x=1793716825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1E/r4jGzpmWVwuykcjDGwY++XCWizWnAfM22Qf0RY4=;
        b=hkV/NtVt+9hXtT9TZ9RxA6SHUJvK+GPTgc7A8PHd3EKBSKD3xBsljRYWpxqzEYgQCY
         bL4seHN3+U1JnaHXaX3LX2BNV8JPAXAzLWzUWSui5RMzk9bXwZoDtvDxC0FoVcVXsCuE
         ASPqN4tjjGCxsD1kDzfEVaj+mHUzAQCadoyg3ydo8f0zRLD7+Xd8EJKYvhNjF8r+zjSD
         NGtaTbWD1DtZcWTAO7ma3n/NxUfx8uFoLjuUsw3xZ6JqaaO1elRU8hP9zjxOok7z4Gds
         gwfmurKxf6SwF9qTedwOh0cEu7yTSI1J9+syn8RS88M7plXs4SsoCbQgRLplbaNxb8ya
         uoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112025; x=1793716825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1E/r4jGzpmWVwuykcjDGwY++XCWizWnAfM22Qf0RY4=;
        b=peZIq81jO8JS+vLYm9MTKMQ03xTft/uPEpT64fWM/PGfR8vLUax3e+YWgyH4DEIaS/
         dF+sLgDeblV4HxXfJBb+Jgrn6ptlcQEFu2+ZoMSk13mQ1MYlCwCpzMEEyVEQTH87CMg0
         2fBZeSoAKq2I/h9+rpv9sm8qhKmuOCVGNtuvyiP1dxSvsaRgEApnwAJ2VkGMAAEyrmqy
         jw+S6meMhvfy+QSZk+ab5cPq2pvgDFoaRhFiAW2mzykJbt0MBIVUgznmV+FL0cfE31s6
         e7iNY8amafSoywaJxpK/jTqwM007bFWqAZ4Uzvp/nu6KRf/tcp4VQGDrw+9+D2MiaDTY
         vg0w==
X-Forwarded-Encrypted: i=1; AKwUvBx8iVHUtB3GRRFqwt7OnMPhPCtiuBqfwl/GEeFxWisbXwC6qahjxyVDnoXODUHZY9hlmSZVr+ujt5KlOU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWFb83d6BJ/xcA7K3BftaE1rSojxOQb7HzwUT4n1JFzy0c2+9N
	llXRe0lug1z8YTCze3Gv7pAaDyfzOOwSNqF+YnpUIOgx6H/RP2SUXcTS
X-Gm-Gg: AYBFou1T3oRjKm12FtDTP/Tebyy8yy/iExUWbkO2SICZh8nm4qZQ9TKbMHe7vvMKfbT
	IFQ2WwwfTg5bCTUPfnth15tUiq2ZR+n9cf35xRDm79QrcdRncRpEaJhxKFXOBYHDKtipxAMidTE
	AhslDT6NB4GRrX9xsKCb9jO0OtH2nbey/3ka5tlOhdyUbNTYe/S7Vz/7cJZJosfP4UtXe2b1b4Q
	B9+hgKiExXGC9dRvABADT7Yeeh/E1+vNmm8Q43Icf4ieYDoZzYXJcR0nkvBZImSmh9ntknbDsKE
	AtjY3KdHd/Um1jUyxyaMBDg34NJEdFKjTNN17VlxbjtSX1++whJJuRQbC1BsI6KDCBkvrQ8CilN
	H5ZQXIh7NUI68TMPA1YYIaTg3rLv3FS4OIkd+/rEipVsA2jIiINt3sdbsJoz4d+iyBb8uM9GVaY
	sXfxP1RBfdXkSRbp0bmkPBBicoIIdaDoaPiBE6Nr5oH6IMH57unZNq43BuW8xoy1gtN5iAH5X2c
	S7cM+DHltt+CaRV3mnwdLW++4OV565zj4p4Ga/gvznnmRuZbrow/lfjBhsKRCCnvI+P5jJNdvid
	6/cjkjtQ6oEmZ9fAmA==
X-Received: by 2002:a05:7300:2301:b0:347:8d01:164f with SMTP id 5a478bee46e88-369e84b15ccmr22877138eec.19.1793112023769;
        Tue, 27 Oct 2026 07:40:23 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm34727318eec.20.2026.10.27.07.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:23 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@I-love.SAKURA.ne.jp,
	tj@kernel.org,
	mkoutny@suse.com,
	cui.tao@linux.dev,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v2] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Tue, 27 Oct 2026 22:40:16 +0800
Message-ID: <20261027144016.2582880-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

mem_cgroup_scan_tasks() walks with CSS_TASK_ITER_PROCS, so it sees only
thread group leaders, plus a dying leader that still has live threads.
Moving a process whose leader has exited, by writing its PID to
cgroup.procs, moves the live threads but leaves the leader behind, as
cgroup_migrate_add_task() skips exiting tasks.

The destination's OOM killer then cannot see the process.  If it is
alone there, every attempt ends with "Out of memory and no killable
processes..." and the charge is retried indefinitely, and
memory.oom.group kills nothing; otherwise another process is killed in
its place.  The source's OOM killer still finds the leader, reaches the
moved threads' mm through find_lock_task_mm(), and kills a process that
has left the memcg.

Walk all tasks and let one task of each thread group in the memcg stand
for it: the first one that is not exiting, or the first one that has not
exited yet once the whole group is exiting, so that an OOM victim stays
visible until it is gone, as the leader does today.  Exiting threads left
behind do not count while the group has live threads elsewhere.

Tested in a VM with memory.max=64M: in each case above the process using
the memory is now killed, and a process whose exited leader was not
moved, or whose leader is alive, is killed as before, with and without
memory.oom.group.

Fixes: f168a9a54ec3 ("mm: memcontrol: use CSS_TASK_ITER_PROCS at mem_cgroup_scan_tasks()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2:
 - Do the whole check under RCU and walk the group through task->signal;
   v1 read task->group_leader, which a reference on a thread does not pin
 - Keep exiting threads visible while the whole group is exiting, so a
   concurrent scan still finds an OOM victim and aborts
 - Pick the representative among the tasks in the scanned memcg

Tao's Reviewed-by and Tested-by are not carried over, as the check
changed.

The walk visits every thread again, as it did before f168a9a54ec3, but
the check stops at the first thread of a group whose first thread is
live and in the scanned memcg, which is the usual case.  A group can
still be visited twice, or not at all, if the task standing for it
finishes exiting during the scan.

v1: https://lore.kernel.org/all/20261026120248.2188024-1-zhanxusheng1024@gmail.com/

 mm/memcontrol.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4d00748c8a5b..cdb8ca4d4625 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1427,6 +1427,38 @@ static void invalidate_reclaim_iterators(struct mem_cgroup *dead_memcg)
 						dead_memcg);
 }
 
+/*
+ * Let one task of each thread group in @memcg stand for the group: the
+ * first one that is not exiting, or, once the whole group is exiting, the
+ * first one that has not exited yet, so that an OOM victim stays visible.
+ * The leader is not enough: a group whose leader has exited can be moved
+ * without it.  Exiting threads left behind in @memcg do not count while the
+ * group has live threads elsewhere.
+ */
+static bool mem_cgroup_scan_skip(struct mem_cgroup *memcg,
+				 struct task_struct *task)
+{
+	struct task_struct *t, *dying = NULL;
+	bool live_elsewhere = false;
+
+	guard(rcu)();
+	__for_each_thread(task->signal, t) {
+		bool here;
+
+		if (READ_ONCE(t->exit_state))
+			continue;
+		here = mem_cgroup_from_task(t) == memcg;
+		if (!(READ_ONCE(t->flags) & PF_EXITING)) {
+			if (here)
+				return t != task;
+			live_elsewhere = true;
+		} else if (here && !dying) {
+			dying = t;
+		}
+	}
+	return live_elsewhere || dying != task;
+}
+
 /**
  * mem_cgroup_scan_tasks - iterate over tasks of a memory cgroup hierarchy
  * @memcg: hierarchy root
@@ -1452,9 +1484,10 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
 		struct css_task_iter it;
 		struct task_struct *task;
 
-		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS, &it);
+		css_task_iter_start(&iter->css, 0, &it);
 		while (!ret && (task = css_task_iter_next(&it))) {
-			ret = fn(task, arg);
+			if (!mem_cgroup_scan_skip(iter, task))
+				ret = fn(task, arg);
 			/* Avoid potential softlockup warning */
 			cond_resched();
 		}

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

