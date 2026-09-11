Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD8E443C20
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141322; cv=none; b=Y1vcNfgAZSpF8o6kRjJjjXAlkNlOO0TUm8MxaIF5LJ5iMbHvkuav8NnuZLqsiXoEIktXKBCzhm1DfnYluG5oWLw7fr9O2B0J6f13b/A0w8i3de+32WMMrWGTPW/K0DgNLDSKzYryVtAXWNmHpsbIlyCGqdr1lP/KPDIXnho7Ubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141322; c=relaxed/simple;
	bh=pHbCp/BMag/nnpNzMxAMuj5uUap5oH5CLoIai3Pt0L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GiBPULGW6cqK2FVwLcPgaZ1KdyX1i5EvL2j9vPAxULqbGBeT76r2cMNuzOrnVcBx2Jl9jYzjS/ag8x+NhRQ9Jj2GeygS0o/W64v40m0cu6gNxTsLK2K+pONTM4SGAqVMBVx1GVHmeLur/KBgsqLngSY0Ug33hSsNJ5QrSJiAUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=uG44yyeS; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="uG44yyeS"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4c14d66d922so549426b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141318; x=1789746118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=;
        b=uG44yyeS2p/eswpm9iO/SEecQ25QuCzgS3aUtbAGyWkopEBCZjHUWByJwLnUJV3agY
         70iXi8ihypvBrjWzdi4OwlyGl0k5pTDcC6c1Qwo+dh3/up9TfE/W4hQS6RoW8yItkLUw
         11UpwLSVx+iQqOT/wUCPy/BjnFKAtaYlujGfHOzxPHq1MenRifRGL45J5oFz7m5FDILM
         NI7gGt2oNoj2d0sfjbaLfKmI9SDumoScj6L6mxGSnx0SfaV2jxz4vo/DFnB9Dtane6BL
         rgpezV4fhaVCRM/R6/bCLyKyP3zoB+vPF6J0QaTfPdO6IMBtUBbwdeVGyAaxk2PSjRlJ
         FnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141318; x=1789746118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RcGks6YdaJ2UkXyVy3FKEoUGQQvU1qrezFrY/Mkmuw=;
        b=Lb5VTNKpz3NRNdGNDZQCbhcNT31tuI0pYmhxcDhU5YJpQHSW8++/+lqS3aYeUBuRRB
         qqRCSG6V68B85Fq9hfs9txBhaYyXvOn/uTOhekk9gv3IiZ19IHIxnokzfwrO/SGMx4It
         Vm6NcUkSIl9j0dd8g87vZciKT7xjNhcX8IDm8v1z8OULtyLnpjQ1v8YbL0oiFRtfIFAg
         SeyL6Cmizz+JFd86aXh7nV2j7ZOFC3KnrAqyRyF1aWrEqxLS3RusVWsTQaYIqQeN6JVm
         gZkiBaexHcuSHJW/SXok+BEZkfpNwW/RbfUtvG1o4PCyxd+3mo49ySza0KOqBOWdo1C6
         /rkg==
X-Forwarded-Encrypted: i=1; AKwUvBxYcwn7pF7Ym/qirGYN5LJjlH1/6yZYV6HCr6qp8NoyREHT/9BMHONwVpiIIO/2E86pfPgj6dHBerhlPg0=@vger.kernel.org
X-Gm-Message-State: AFuF++n/mdwO6cS1btnQq3FgsmYUKNwQGs3a8iXiyWMNmW0HtTAszNgz
	litMt4IEOpOeqpBGa41aQYZifaBCr/Y7021/S6ucby3qYKKUL0ZtcG0pmL1HUK8S05Q=
X-Gm-Gg: AYBFou2DvFe54Ya/YYoVKmzZtZzTNaGavR6iI3+taoGIh+JmSwxnvIWJXBWFEbiYTWo
	vtG9/6Vx1lkn9qcDpAX8GtjPRFQlRaqLqJtqO7TukzHGRaDKjwdCd2spuuvgOy5UVukSR1H+050
	B9+7APjc6Yp2ijqr1Hd2Uwe5dAWeO53LujEty+mXBVTC+BT2D/fXqnHC5hTbR9fQ+SCfr98nME1
	eghvGcUkvY82EXWrXrSWH3vQ20M/r60S2p+/zaC+5+DP6tT55v9PuUEqDdTqteoUngcTJ1ZxBT4
	6sOuBaFNwJU+bSP+8M2sd8Mf0bOvzfUCN5zwfe+qMVrYrri9Kxm4b0r0VqMLFTySFqFK/teetNA
	9eT33Duuj+dEiMGX9/g3RhMRyOdoHHNkvM8+hRALESpJBpV4aB0JbFz2BuzDwCidnwMCiSGtNz3
	xElJzIbq55aOpw0GJla9gEiZpzfd0evdva+GzAb79k2r3+rdiZb1q93U28/Y/+3JQDMHrWhxasY
	JLtJT7q9+FEZ0NtBLrUoflAuHASCnvlaEnx9v1svoQ=
X-Received: by 2002:a05:6820:c446:20b0:69d:a4f0:4191 with SMTP id 006d021491bc7-6c0b9a57494mr2410199eaf.12.1789141317982;
        Fri, 11 Sep 2026 08:41:57 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/15] sched: call into io_uring when a PF_IO_HANDOFF task blocks
Date: Fri, 11 Sep 2026 09:40:52 -0600
Message-ID: <20260911154148.644489-3-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PF_IO_HANDOFF, set by io_uring on a task for the duration of an
inline request issue that may block, and have sched_submit_work() call
io_uring_task_sleeping() when such a task blocks. Placeholder for now.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 include/linux/io_uring.h | 5 +++++
 include/linux/sched.h    | 2 +-
 kernel/fork.c            | 3 ++-
 kernel/sched/core.c      | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/io_uring.h b/include/linux/io_uring.h
index d1aa4edfc2a5..969de22c3d0f 100644
--- a/include/linux/io_uring.h
+++ b/include/linux/io_uring.h
@@ -60,4 +60,9 @@ static inline int io_uring_fork(struct task_struct *tsk)
 }
 #endif
 
+/* called from sched_submit_work() when a PF_IO_HANDOFF task blocks */
+static inline void io_uring_task_sleeping(struct task_struct *tsk)
+{
+}
+
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..310310865029 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1816,7 +1816,7 @@ extern struct pid *cad_pid;
 						 * I am cleaning dirty pages from some other bdi. */
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
 #define PF_RANDOMIZE		0x00400000	/* Randomize virtual address space */
-#define PF__HOLE__00800000	0x00800000
+#define PF_IO_HANDOFF		0x00800000	/* io_uring: hand identity off if the task blocks */
 #define PF__HOLE__01000000	0x01000000
 #define PF__HOLE__02000000	0x02000000
 #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to meddle with cpus_mask */
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..510c8a9aa870 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2190,7 +2190,8 @@ __latent_entropy struct task_struct *copy_process(
 		goto bad_fork_cleanup_count;
 
 	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
-	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE | PF_NO_SETAFFINITY);
+	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE |
+		      PF_NO_SETAFFINITY | PF_IO_HANDOFF);
 	p->flags |= PF_FORKNOEXEC;
 	INIT_LIST_HEAD(&p->children);
 	INIT_LIST_HEAD(&p->sibling);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index eeb55367c0c6..bba1c3b26b7e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -96,6 +96,7 @@
 
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
+#include <linux/io_uring.h>
 #include <linux/thread_handoff.h>
 #include "../smpboot.h"
 #include "../locking/mutex.h"
@@ -7352,6 +7353,8 @@ static inline void sched_submit_work(struct task_struct *tsk)
 		wq_worker_sleeping(tsk);
 	else if (task_flags & PF_IO_WORKER)
 		io_wq_worker_sleeping(tsk);
+	else if (task_flags & PF_IO_HANDOFF)
+		io_uring_task_sleeping(tsk);
 
 	/*
 	 * spinlock and rwlock must not flush block requests.  This will
-- 
2.55.0

