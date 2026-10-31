Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793424296;
	b=jyY7+l5Mj4JRS0m5kyq/ch4NEd++O1kMC/jYnllr5hixhjzcknsZJ5GYTOXiIH8QZ96j
	 ZO9SLMyLNwzxXCf0s6bOycNaZ4rFybOA2dJRaLlBZQsdm3VfYz3II1MyQdsGK209T4mZU
	 CQa0SlhUehv6i7DU95PZphCWXwchbBUBI/BKnGP8LTnfidM4F7BJfCIT54KZHXEPadYeH
	 fm7aH04sbulCpPAbF9PBunTJwR39IY2XVocOwrR9ksCzMVwDpj5DVKgDvN3rdTPXIMY0Z
	 WozjV1JSBZmV6C+Qi0My8InB9jLV1H5i4MoQAyyS0RKCPl+11Xg6vgJgMlU4hWTZTWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793424296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K/mSj/o4hlmT8Iped7k5tHtjK801O/RQfZJH+soCWvk=;
	b=RsgERszBi4bu8heLmp2lplboh2NgM/rIgP3ITIy39M5myDOEV+QMu3JYSkSdCFwA1LLA
	 yhSbbmii/iqUhDpW38iozkBOuKw4NmvHpaztsEkGjUzlXcOMxZAwkxR02MzcgX/AMf8eT
	 9+DcS8wiWahEbQ6dZL6elONDOknRjSmNaBQmPZ+YP4Eh/KEDqD4CJqZa9oswNCQks0MmO
	 gc3isFvkN6wobq7Btp6N4s2QkCZHGpUvUL2GJlM+CdmhnCII1v7lzdFEuvGx1EVUOU5l8
	 GCFmzDcUVAFTRDClyMPiqyvk6j5d1JTNji68pboyloKb7GQt3fU6LVfkcNWg/0wUpPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JRaGPRw;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C77606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JRaGPRw
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36661f953e4so2140279eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793424295; x=1794029095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/mSj/o4hlmT8Iped7k5tHtjK801O/RQfZJH+soCWvk=;
        b=0JRaGPRwgsWa1oe81nK3O25BGOImDO243B5p59a2fRL8F/0NO61ssCXwtA9kAkKNsu
         YTPaSgPI2MFYL3k/h0lhSibQB9ANG+OkETyqClxM+t1j0kHfn7y6YfzFrYf7E5JAdo8U
         R5awqm9xgxH25+qtp3TJBlKId28NxohU6x75FxTpS028DatN8zwR2Fso4vowAr3LZnJ0
         d4iWeIJleoOmGOVgGx/Todxiw629n5Vpz+0Z8gTW3EpRG5Lat9jtp2MyJT0+6trHGtVi
         BJv5lq0GywYkyBS7ZfI98CMjjlWMsm8PQmXMvKJn3wtht+GUt5LQuWAPX/3ZL6eppPkv
         hxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793424295; x=1794029095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/mSj/o4hlmT8Iped7k5tHtjK801O/RQfZJH+soCWvk=;
        b=HfblwFk1C5Fa6NAMjtENZeHrBmDs/UPllnjtAAyjdxOzN1JGdXK6Eu4dGiBPinWXWh
         KRbUmNczGWPRFqm1tT/OoQQSuPu9jTSO/2h+tpRPr0zOA1/QTu9yGq1L06bpnS3yjxgz
         Kii4ooB8IxhukHmHyhszNKS9jG6as+uX5yOLtASTU00Lh4K1qedYEBs0HtaRHedwxSBP
         n1oXseJzfhKBWnEXC1IQOFfb0t8SsSN9w2YKtRRUc+qjZnBwzjiPz07lE5sS360zgyRY
         4BPgCICrkYVXw/3Sveot3LT92nBz7NYmDv8rPyLiiAZhMeRo8h3d205Wu6IgmuW36Exe
         BzWA==
X-Forwarded-Encrypted: i=1; AKwUvBwqCqnrNzkXh3hwp+Rzx1E3+GbJcJYSGM+iEP+wZ3Gk8hyi4/v2rno/q0wQp3aVUY2Kl8l1O7GPnzO+Lkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIagFAOB0akW60yMcqk/SVt7Ls1NXdJD+CO7KowdExXCNtCVsz
	+UQ/lTNsmG3TyWAAcySB7xm9bhEkijM8mdpTCScVoEWHpW1QKslDag7Qc04B7T39
X-Gm-Gg: AYBFou2y4YAdReMX0lGVhv2XvKr/WyEQl42V8POSXXHNQpSan37sLZwTfBZrslB+IP6
	IO/DZQJrfWS3Rh49s29Uc7pcG2G6RC5nt8UyJH9ruz4hPDWqrq9N6WbeXjGLYramLkXd5xam4ap
	+DNWkOvQC10nkt5Zz7sVBKEK1J+9rA6Jwb3o5TxLSQx3H9MaOodEKpXO5ooJtP3shLMQ0XHh2/9
	4KAswordtIqeKOUeqVy4p1NQxqBlUagj8DCcMeAG+IDJr2RK1thcfdmY3a8Q379tsWlWLiaSraE
	qTrbw40Vaqzu2R9GLFkmcjTVStv2J+QAFiaJurm+UViKEbpTgPJ31GsH1YmFMxSnhEI7OtdMpFg
	0Qu7Rk55uewK0lgLHTIYB9uTm2JC64wupXvL63Uh22wnmpU18xf4d5fMfv5yW2ZZMGj1L9KsnsR
	ChupcFJFlJWTKx8dqfu0xyvvZ4Guh3ZCY1jPzOVHaQjhjBOGSHlOPiy5ubqyQd/zQ/9s1/dMyjS
	xDoEDGODvsKNvGo1V10Uj+/j2UKWNsbcnNi4Kdzelo4bXLL7FhU6kh8z5GGGeQQ0WpWNMx82Sne
	IFppzPAz0Ke+WeJMYOPYdbYPTuALGGmk2ik9vsSW30QpFw==
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr6466317eec.38.1793424294642;
        Fri, 30 Oct 2026 22:24:54 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm12891099eec.8.2026.10.30.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:24:54 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Balbir Singh <bsingharora@gmail.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] taskstats: Avoid counting an exiting thread twice in TGID queries
Date: Sat, 31 Oct 2026 14:24:51 +0900
Message-ID: <20261031052451.78846-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

fill_tgid_exit() adds a thread's contribution to signal->stats before
exit_notify() sets exit_state. A TGID query in that interval copies the
cached contribution, then scans the same thread because exit_state is
still clear. The thread's contribution is counted twice.

Mark a task when its contribution reaches the cache, under the same
siglock used by the TGID query. Exclude marked tasks from the live scan.
Leave a task eligible for the scan if no cache exists, and clear the
marker when a new task is copied during fork.

Fixes: ad4ecbcba728 ("[PATCH] delay accounting taskstats interface send tgid once")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
In an arm64 QEMU guest, holding the interval after cache accounting but
before exit_state changed made a 100 ms worker appear twice in a TGID CPU
query. The baseline reported 208000 us for 8000 us of the querying thread
plus 100000 us of the worker; the change reported 112000 us for 12000 us
plus 100000 us. Natural race frequency and other architectures were not
measured; KASAN and KCSAN were not enabled.

 include/linux/sched.h | 5 +++++
 kernel/fork.c         | 3 +++
 kernel/taskstats.c    | 7 ++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..359ee982323c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1457,6 +1457,11 @@ struct task_struct {
 	struct task_delay_info		*delays;
 #endif
 
+#ifdef CONFIG_TASKSTATS
+	/* Protected by sighand->siglock. */
+	bool				taskstats_tgid_accounted;
+#endif
+
 #ifdef CONFIG_FAULT_INJECTION
 	int				make_it_fail;
 	unsigned int			fail_nth;
diff --git a/kernel/fork.c b/kernel/fork.c
index 33760ece3bb3..76d9abcc5ca8 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2202,6 +2202,9 @@ __latent_entropy struct task_struct *copy_process(
 		goto bad_fork_cleanup_count;
 
 	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
+#ifdef CONFIG_TASKSTATS
+	p->taskstats_tgid_accounted = false;
+#endif
 	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE | PF_NO_SETAFFINITY);
 	p->flags |= PF_FORKNOEXEC;
 	INIT_LIST_HEAD(&p->children);
diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index f31df72f0e9d..dd9054de761f 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -245,8 +245,8 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
 	u64 now_ns;
 
 	/*
-	 * Add additional stats from live tasks except zombie thread group
-	 * leaders who are already counted with the dead tasks
+	 * Add stats from tasks not yet included in the dead-task cache.
+	 * Accounting can finish before exit_state is set.
 	 */
 	rcu_read_lock();
 	first = find_task_by_vpid(tgid);
@@ -261,7 +261,7 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
 
 	now_ns = ktime_get_ns();
 	for_each_thread(first, tsk) {
-		if (tsk->exit_state)
+		if (tsk->exit_state || tsk->taskstats_tgid_accounted)
 			continue;
 
 		tgid_stats_add_task(stats, tsk, now_ns);
@@ -291,6 +291,7 @@ static void fill_tgid_exit(struct task_struct *tsk)
 
 	now_ns = ktime_get_ns();
 	tgid_stats_add_task(tsk->signal->stats, tsk, now_ns);
+	tsk->taskstats_tgid_accounted = true;
 ret:
 	spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
 	return;
-- 
2.55.0
