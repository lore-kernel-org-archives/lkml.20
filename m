Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB262DB785
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904105; cv=none; b=PgcUp2JRuG0zv0la+AzeyJLvZ6zU4IIlCbn0j8LIj1SgAbJW7CEE6r2HpcduVHUQAP4LEiAKeVYYc4bQkP7760t4V/+deQ3YlTo0kb3hO2rtZF5OGZqo7vLzfN6ru9jQ1VVo6tJbmvEnh107H1Ny72kHWkReQHxgwUTHtxrEZ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904105; c=relaxed/simple;
	bh=E8n20K7HrlkrCFSKt2YLkrmSnlouBebTkNDthA8cSMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fc1v7sSZCQWYwErDdfskVycH0RPwWytgm+UIGGs6f6x9qta0+u1s0H3tb9zcijNhYu7ahPUXxwFwUzllRIJHc3Kqd1CfXLRBHl/6pNpuyFHI9M5BzOHilUU8L1y/r8N8VFYlZwWzaiEd919JyECiWw3Cx62dDlliHD9GyLyeWFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cf9pxbhD; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cf9pxbhD"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-888e95f3e96so886604b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904103; x=1791508903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDZnUp9m5yBjSK1Ke9OCyfq9dHJGEk4MLqLMwtftzLE=;
        b=Cf9pxbhDUh5bIm0vC8XuU8f3U96xJWq2smsEB5gFkXaMMZXymQzPZQc7zNL/7R3tZe
         QgZP7gV7cX0VHq7aEy6GFgq9JN7f8dJ+mIaYkA9fJ5GMggCSBzZyaUVc1H5bcf4B1tie
         Jewt3pi/be6gk4vZj9cV2auGg1sbWSJRehsKAPD0M4wwheugsXMU6lRqVfnpmKgWLNKH
         4urTlXLwxXO0DPiyqDRIf2YkuXkJmgw7sSibQSdVKbaG0xdWQtxX664NB5Xz6ZuuSurf
         hZJNOMymhr5dEEXs+WojsNdjLbtlVqbqSfu0UGtB//xpOQKMvB7EDoX4X6BFWfNftdGQ
         /TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904103; x=1791508903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDZnUp9m5yBjSK1Ke9OCyfq9dHJGEk4MLqLMwtftzLE=;
        b=L/HN5J6R33OuWg+VT7PTxu+NTeoOGcPC/8F1Pz0By1kcVIvi1hLe44vh4/VZe3XXHV
         RJZb+/qXHY9G1vs+EUtK7nRdWEto1b8ZBupyCHBlb1QuTQrp2QSqYBmGDpkpSv76r4bw
         Jp4EDMnolCzFpT9vregTASUTKmhOY0pgAe3lcZ/M21cqzio97MH31w+Q/JVbVUwmuqOB
         fSy63Q8NBjHvn6LoGHljql3WZqKhQEC9xeoNQvOR3y1ET6UqwDrv4nZg8VTXFIb8huCw
         AE42r0q9sTO1LRNjKKvTgKF/oAsCx6D1oKQaEhnnz5YAOoDhKZAB29XA9N/4Bb1VXa5W
         b+rg==
X-Forwarded-Encrypted: i=1; AKwUvBwXXiiAVsERhkUMJ6bkDwe57Ck4MbZhy6frU0yQcuLrrn7POmP4mvrsVRMLyqnNEmSnP/s+zi6gvQomUgE=@vger.kernel.org
X-Gm-Message-State: AFuF++nfnpOUnBCbyoKYJ5l2eXYGwCoB9Mb37+AqyGFt2xCUoC5MdUMI
	GVtC3HTb6Vqs6uYnWKCC6rQ/l2MGNs/DPlYJYSNmF6mzQkAksmYrbxLl
X-Gm-Gg: AYBFou0AhUg7w9K4FU1klW/kHGv6qX5w4s2s1sf5Bb/IChA/o4c/7sgSdWvykSmQhQU
	txTngpNv//oBLiJma2SJdu+MrKs/Q1m2vzynkUIATpfy1LF+QdqD83thlMxV0YxELh6GByD6eVB
	VgUdHls5NTIQMuVERPiyUyK4iBoXSX3i2E6hlnPTSaQO+nObFUMlBbDK2OVcsv3qMU0s5Mcrkj5
	PpcvxgYHF0EuV1scIcEH591u6oDvc0F2puvJ2Kyh8LxH/UOKjOfmzuhDRXnTFAFpfLQnCTK6vu7
	bWqLNV9bzaKKn/KP+QKJ7yyRVEHgQUEHhpvPJQMLHMshopU0PpRz4WM5whZGtL3oE/Wsq09aFQ3
	sPB1iVrQTrSUNf6K0DPRaC1NvuTLZtUjCR6GDpV1N5mIS5dn5T2fx94MvHbMOTb4y22itlQnYlB
	knZVlzJyE03WUgh6kt5N11/N9MDRSE5YkHfqkdBMaGD/OnWmJ1fszdTiBKWnujePPN8KnVa7fWE
	NeKteLQ
X-Received: by 2002:a05:6a20:d74c:b0:3dd:a007:cb2a with SMTP id adf61e73a8af0-3e0bcf7aae4mr1071827637.38.1790904103250;
        Thu, 01 Oct 2026 18:21:43 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f73a11aasm296666a12.29.2026.10.01.18.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:21:42 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: [PATCH] pid: use READ_ONCE() in pid_alive()
Date: Fri,  2 Oct 2026 01:21:41 +0000
Message-ID: <20261002012141.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
WRITE_ONCE() are enough.

Reported-by: syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c382ee653fd70f5cf1bb
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
Compile tested only (gcc W=1 and the KCSAN instrumentation diff); I
could not reproduce the race in QEMU.

 include/linux/pid.h | 2 +-
 kernel/pid.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pid.h b/include/linux/pid.h
index ddaef0bbc8ba3..05a0084dc9537 100644
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@ -264,7 +264,7 @@ static inline pid_t task_tgid_nr(struct task_struct *tsk)
  */
 static inline int pid_alive(const struct task_struct *p)
 {
-	return p->thread_pid != NULL;
+	return READ_ONCE(p->thread_pid) != NULL;
 }
 
 static inline pid_t task_pgrp_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
diff --git a/kernel/pid.c b/kernel/pid.c
index 95b8ccfa82690..adf7216067684 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -411,7 +411,7 @@ static void __change_pid(struct pid **pids, struct task_struct *task,
 	pid = *pid_ptr;
 
 	hlist_del_rcu(&task->pid_links[type]);
-	*pid_ptr = new;
+	WRITE_ONCE(*pid_ptr, new);
 
 	for (tmp = PIDTYPE_MAX; --tmp >= 0; )
 		if (pid_has_task(pid, tmp))

base-commit: ed14a591175bb5f56c2936b082cffb9e4b935e6d
-- 
2.43.0

