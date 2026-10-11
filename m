Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03652BCF4C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791683492; cv=none; b=TmdRZBzMoH4vmzDTOzy4+onn/kHgX8aYwjGBOovwBv6wyUMNZY5jrpHj1XKIxk+pDtcD8hj6RcaBW3OBkH8+DNbTNOmBVXAp3djyIiv/XnOPwmR40f+UaDwyUkyaiZ9SvhaprxqK2IwU8xVv/xJR34nUJMR1rtIosaShvm/GrSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791683492; c=relaxed/simple;
	bh=MrTN02vAs49NCSE5jlg3Ma465BM7ipVjuyiZojKVbcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kGiteHusAFrVm4qd3t0P/fWltywdtvzL6ZETQADZyDFEkjgr5exDyWCy+OuDzGuVMgYR/W67c8eYD15qdHkjbRn91IReBVjJAk4eL6sv5rr88BOY/O5jEWXUD736v+sCxa1RxiBqNXNPsXiNVq6JvybVGpycDfPKl9QnA561aKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IlxNZk0e; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IlxNZk0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=S3
	cf8U0bS0lUcJPnDhHSfsYwfaM6SrlqzkpG+nuw9+0=; b=IlxNZk0erDrDRVME2j
	6ZU3QUz5VhYXJ8LMlS87ajqM9wcgBdg9+SPhe4gNHt79pE1tXVx8Dc2iASgNi5/+
	fke5LdE48Qt+NKs2fa5qMQ2UeBi9qExEO19Z3LcSpnO+Va2lwbOKae6hkX9ymxkT
	Wl/FZmZOpMASOf8YF1NVbicig=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDn_xda68pqrQkkDg--.18475S2;
	Sun, 11 Oct 2026 09:50:20 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/wait: avoid modifying entry on failed priority registration
Date: Sun, 11 Oct 2026 10:50:19 +0900
Message-ID: <20261011015019.4056529-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn_xda68pqrQkkDg--.18475S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWftr17Jr13Zr4xWr48WFg_yoW8GFWkpr
	95Gry7Wa1kWry7ta4ftws5ZF4Y9w1fGrW3CF97uFykJrsI9rW0q3sakasrXFW5Krs5Cry3
	ta1jvrZIya1UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjFAJUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RxfvmrK61w6+AAA3B

add_wait_queue_priority_exclusive() sets WQ_FLAG_EXCLUSIVE and
WQ_FLAG_PRIORITY before checking whether another priority waiter is
already present. Thus, when registration fails with -EBUSY, the entry
is left unqueued but with modified flags.

There is no need to modify the entry before the failure check. Move the
flag update after the check so that a rejected registration does not
unnecessarily alter the entry.

Signed-off-by: Hui Su <sh_def@163.com>

---
Testing:
- Private x86_64/QEMU differential oracle: the old path modified the entry
  flags on -EBUSY; the patched path preserved them.
---
 kernel/sched/wait.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index d033f600f48c..93b353fbd0c9 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -54,14 +54,13 @@ int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
 {
 	struct list_head *head = &wq_head->head;
 
-	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
-
 	guard(spinlock_irqsave)(&wq_head->lock);
 
 	if (!list_empty(head) &&
 	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
 		return -EBUSY;
 
+	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
 	list_add(&wq_entry->entry, head);
 	return 0;
 }

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0

