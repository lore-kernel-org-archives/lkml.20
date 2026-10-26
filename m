Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016178;
	b=ez7A9Y8IabPThQLg9t+Y38a8j+T4WGqBT3LOeSlU+rrbbHeeuzup9bTYmDyhPFVouXNG
	 cwny20NxR3qF9cvgy45xMAhpfmmDE6pxV0S7OkofXsRczJXkUoUx6bZ9IoWxIISbcCSIt
	 lqEF2CjP7s6KwjBk/jh524j/f486QHDHmXE1N7APW3HVS7y1H8d/5ksmwlJJh4Emrodfw
	 2z1wh9Wt472RTKJF36qAl8ZyTg2u7TI4Prd1pk0LpR21WeDs+/BEESIoSfMKlp0hXJ/WK
	 81H9872q3NwGRPCTwkOJsD7Q1ZGtSiTKsFxVbBhtenfZYe/ZzjVq9cZQsOeDyREFcUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RFJJleyh4O8FR2L0iIk2GYhVD/sdkcXc7KlKPVTmZgw=;
	b=1rK80FUnkKubTurzj9TPRNWxKtLzvN4hptpc4LeBQCgU2UDKprWkmJh0bGX0fezwz74v
	 STWNIHmePZFxgcKYMTsBEMdoOPZ7Pzz/4VzqJHkkT5fLYDvdZq9emsz4yJ2c4uI6cpjby
	 bMjFGHMOIWx/KKUt7AGA3gjL2JGnIMzTmrEvXj5h2J8s6hEsSrpZjFxuXzlHGNXakG/Ij
	 21u9Cihbg/vm9mL8cE+XuWM5JzvhAAr7KLhnOCZSA3XmWWfq+pcrCfi1gChlIClDVgH2H
	 jvjUnKBd2SAvWzLYie/5GfNEuiX35z51CYpwYiJ1c4IhjDTBa71FPrkOygqUDYGKUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4rJlASm;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28960A2603
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F28960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4rJlASm
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so784676a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016176; x=1793620976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFJJleyh4O8FR2L0iIk2GYhVD/sdkcXc7KlKPVTmZgw=;
        b=K4rJlASmdIPv97DMDWcrB0zJXkoTNtE9QO7B1Z3zl7VbKMDzMDyWZ1myWlENx1HWFX
         bQvYnQDesVorMvowUBanQwTmhNbS/JkknAE5OY5CehAktnSYyk5P8pOJgiwt8HcWwmed
         5vN/U7/Ai/QpxJ0Js0V9VtCIiGUG7hsyCyBoSSjCYYqrhbAh0az82USZwtYuz4QWHnyK
         aRImYgnbVwZlAClW7z4LJZREsB8h2GnuGvg9+2qqZ9dhn+as4raWRVUyvpTCV2ZvVBDK
         qUdUr+urP/xdQayVLGiAMAOnlGgR+tVsF47U6DCykZRDOyvn6Hf4byPa/DuObRHstU9m
         SHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016177; x=1793620977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFJJleyh4O8FR2L0iIk2GYhVD/sdkcXc7KlKPVTmZgw=;
        b=khBuNl4A//YdYeOUOA0lWJwiiAH0fPt5Ht85phiW8++Tj7ehTBUFx0r+94C6uObIdh
         vbLcwPJaZMzmG+kRKgHE1c34WmNfdrcMu5Tz8TpkWY9IqiIalbxM4k0fAzBtrs7HAN70
         JWVtQloly08k/bC2iu1LKs0M6rTcXP9imJX+8qFmJxKcbfuu99aNiiozeQOZBC3Rsk3D
         obLAdaRiYbnU3NvnWIn0Y8EbGtDmlS9nkKJh/HanLy8iGD/mcr6YZLFPoI4O2h6dowQx
         QYgyyoKNr3zTHlBwHBXi3NlT4mhcw9wadUjG3tzWoJn1wyQuQItR0fn+b7QVTB0NbGzH
         qL5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdndrUWjMDpkOwmu/3iMLJpdv1jgHhKIu86w1HjPiMqHD4zb+rIlQ+h1LqXsE6GUKXwGWP1VlqOIxbBxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/6Gv0dEFdZ9dNQ9qPA4WsAEyXnii5fhI9/XvdIV+O+j0ebWjB
	ksuWqbcvehjywD7w6UtVzk6Kfjikp8SREHGcNqrVnSUc8Vz+j3M8cDjL
X-Gm-Gg: AYBFou1gG3zIH7cQgFMuXLLUd29v3r/eirWlx/yQbOUyErDOnZQVTDtUCcaXF6uFDJ0
	eO1A+/7cMMHxQ9Tx6YndLWCkHbt/aOIiLbJs92KGALVgIw8e9vmojnzOpAOjxOsZFE1H7VO5523
	sAeK4V+Hy+BsQACDnceUs6pK/6RqJ/7vJARiK5C7MyVyeBaoNgyWkeGg5wz75MY1kIHcYcD2A1J
	F+a8j2Ju3Fp43XiofKHW0sGG33MLIWc5mxcPU4HUaU2eI9D2xrmF8TDT/PLHxQJx1bpMM1+ljYJ
	Am+VEvn6o5YXrw93QymkyFTq4NiaIz9fsnkbAUaKxEwuZFVtTWOHfZRu7V7viTPiFLkCcgOuXZi
	86cVWO734gUgb+JSLqRRXbVWOVIMuUYleelYloBM9fYKWFJuELZ1l5qN5c2dL/g2QS0i0Qkror4
	/9woEFjgamxwrTQZ3otpLOjYZbaDCd7syCZy7apH7QsdL19qhHlsPCzSHQtkzaSC/ay56gYeSEK
	h/TNn9WWRjSYX6hPzOZ9oi0+kvPPVSmYa90U6rnLF9d6QdnWtLDYrmaHUr9wF8Asks/EaNp
X-Received: by 2002:a17:90b:164a:b0:3a4:ba6b:cc24 with SMTP id 98e67ed59e1d1-3adeb137823mr4733512a91.58.1793016176366;
        Mon, 26 Oct 2026 05:02:56 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba47266sm4750299a91.1.2026.10.26.05.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:02:55 -0700 (PDT)
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
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Mon, 26 Oct 2026 20:02:48 +0800
Message-ID: <20261026120248.2188024-1-zhanxusheng1024@gmail.com>
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

Walk all tasks and take one per thread group: the leader, or the first
live thread once the leader is exiting.  Skip exiting threads, which may
belong to a group that has moved out.

Tested in a VM with memory.max=64M: in each case above the process using
the memory is now killed, and a process whose exited leader was not
moved, or whose leader is alive, is killed as before, with and without
memory.oom.group.

Fixes: f168a9a54ec3 ("mm: memcontrol: use CSS_TASK_ITER_PROCS at mem_cgroup_scan_tasks()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 mm/memcontrol.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4d00748c8a5b..8823c549b6af 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1427,6 +1427,36 @@ static void invalidate_reclaim_iterators(struct mem_cgroup *dead_memcg)
 						dead_memcg);
 }
 
+/*
+ * Take one task per thread group: the leader, or the first live thread once
+ * the leader is exiting, since migrating the group leaves an exiting leader
+ * behind.  Exiting threads are skipped, as one left behind may belong to a
+ * group that has moved out.
+ */
+static bool mem_cgroup_scan_skip(struct task_struct *task)
+{
+	struct task_struct *leader = task->group_leader;
+	struct task_struct *t;
+	bool skip = true;
+
+	if (READ_ONCE(task->flags) & PF_EXITING)
+		return true;
+	if (task == leader)
+		return false;
+	if (!(READ_ONCE(leader->flags) & PF_EXITING))
+		return true;
+
+	rcu_read_lock();
+	for_each_thread(leader, t) {
+		if (!(READ_ONCE(t->flags) & PF_EXITING)) {
+			skip = t != task;
+			break;
+		}
+	}
+	rcu_read_unlock();
+	return skip;
+}
+
 /**
  * mem_cgroup_scan_tasks - iterate over tasks of a memory cgroup hierarchy
  * @memcg: hierarchy root
@@ -1452,9 +1482,10 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
 		struct css_task_iter it;
 		struct task_struct *task;
 
-		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS, &it);
+		css_task_iter_start(&iter->css, 0, &it);
 		while (!ret && (task = css_task_iter_next(&it))) {
-			ret = fn(task, arg);
+			if (!mem_cgroup_scan_skip(task))
+				ret = fn(task, arg);
 			/* Avoid potential softlockup warning */
 			cond_resched();
 		}

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.43.0

