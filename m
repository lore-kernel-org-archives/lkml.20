Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748244;
	b=hxQeX8rz+4VKnYu2rJMD60zLjP3YBfBf7hKwt93xN2QImxwHns41dY3sLFaYAUOdZYuL
	 4jnTVzDULVhEY5XAcO9BZQiI6FcEUzHCBmlbpGxKpcTXmtVFI3/tngu8G+SdNg/lNqdqp
	 2kRd343dgaYxv814o90SThCunenzggjpbvwcelgdbQiTmfA7GWcRzmQLrbaxPfgAQgifP
	 0arDY50+vwlHYVsQt7cOjVhnGRMXlzdcBMsKlh5ioyUbl7kcVoKGcKisjwC42s03OmL9A
	 YBInNUh65+gO/mXo37yr2dlTORy1yeTYLQFS+L5RNmanf7/P/EdvBMKae3b2uzrbB5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748244;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=pybXVhZhBi2T1QqTyBMkUK4T7YKg68mq8AEQc+l2iHo=;
	b=Zpv+lXiZffwXNvdVccX7DMUzXN+END4xmhBNkYk/c9pzyy6rTIb5R8tT5aEhbz16w7Bz
	 ZcSjFVzpVcKELmE8o2YtI32RXROXC4KB+IzUk9PelIiZ31QD5cdfv7iSatZCZga96TMrO
	 iblCmfCzDIPhSo4dgVnHrG7lmXYpQiUF8g9KPxDmqpQMKyTysTmd0PY0X+ow59Sr+vlr6
	 Otn0if+cDU7utjN0upv3SOQsoYep56avYZbkywls73TgFhgpHp5lU0fbLVQyyXuNKUo0I
	 bsUqtKHRQVFPPmj4AWcISUTVF+LqnTUR8ubtX3C4IgNjwVvG22ST61xpbuS0b3T7CNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="nkCh/YJT";
	arc=none smtp.remote-ip=95.215.58.253
Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989E606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6989E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nkCh/YJT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IJyVqD6O38pH1RxzuuYvD5tOHAW4ZQ52I22UXDLS++w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792748240; v=1; x=1793353040;
 b=nkCh/YJT/9NwdNFsEanOcNFyTA2XDNUftF2osfiVLUK3hmFWQ8ZFu+Z0Wokklyrjq8at4PLN
 +Xjk078k31nvhSmJfqoTbOeC/Qpzw3GngIfJ5bmHsclPSXr0aKrKr5d6sWHfk6Kq2nIXBgsWmkl
 y0ROGQ2SSCAb+svJM+491w5k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92fa53b973cb4534;
	Fri, 23 Oct 2026 09:37:20 +0000
X-Mizu-Trace-ID: 92fa53b973cb4534
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	urezki@gmail.com,
	boqun@kernel.org
Cc: qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rcutorture: Avoid create fwd_prog_tasks for tasks-rude and srcu-atomic
Date: Fri, 23 Oct 2026 17:37:16 +0800
Message-Id: <20261023093716.25717-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

When running the tasks-rude and srcu-atomic tests, the fwd_prog_tasks
kthread is created because the default value of fwd_progress is 1.
however, the two RCU flavors not support ->call():

1. tasks-rude: commit b428a9de9bba ("rcutorture: Stop testing RCU Tasks
   Rude asynchronous APIs") removed .call and .cb_barrier from tasks-rude,
   but left the .cbflood_max = 50000.

2. srcu-atomic: srcu_torture_init_forbidden_apis() sets ->call to NULL
   for SRCU_READ_FLAVOR_ATOMIC runs, but leaves ->cbflood_max untouched.

In both cases, the non-zero ->cbflood_max fools the check above into
creating the fwd_prog_tasks kthreads, even though those kthreads cannot
possibly carry out any forward-progress test:

1. The rcu_torture_fwd_prog_cr() returns immediately due to cur_ops->call
   is NULL:

[   68.022674] rcu_torture_fwd_prog_cr: No ->call(), so no forward-progress test 0
[  129.462046] rcu_torture_fwd_prog_cr: No ->call(), so no forward-progress test 0
[  190.902123] rcu_torture_fwd_prog_cr: No ->call(), so no forward-progress test 0
[  252.343809] rcu_torture_fwd_prog_cr: No ->call(), so no forward-progress test 0

2. The rcu_torture_fwd_prog_nr() is never even invoked, because its caller
   requires cur_ops->stall_dur, and neither tasks-rude nor srcu-atomic
   provide ->stall_dur (only rcu_ops does).

Therefore, creating fwd_prog_tasks kthreads is pointless, this commit adds
->call and ->cb_barrier to the forward-progress check, rejecting flavors
that lack the cbflood_max set and a positive ->stall_dur.

simple verification output:

[    3.062959][    T1] srcu-torture: rcu_torture_fwd_prog_init: Disabled, unsupported by RCU flavor under test
[    2.922323][    T1] tasks-rude-torture: rcu_torture_fwd_prog_init: Disabled, unsupported by RCU flavor under test

Suggested-by: Joel Fernandes <joelagnelf@nvidia.com> 
Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 kernel/rcu/rcutorture.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 968343be4e0d..92ff197f4789 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -4007,9 +4007,8 @@ static int __init rcu_torture_fwd_prog_init(void)
 	} else if (fwd_progress < 0) {
 		fwd_progress = nr_cpu_ids;
 	}
-	if ((!cur_ops->sync && !cur_ops->call) ||
-	    (!cur_ops->cbflood_max && (!cur_ops->stall_dur || cur_ops->stall_dur() <= 0)) ||
-	    cur_ops == &rcu_busted_ops) {
+	if (!cur_ops->sync || ((!cur_ops->call || !cur_ops->cb_barrier || !cur_ops->cbflood_max) &&
+	    (!cur_ops->stall_dur || cur_ops->stall_dur() <= 0))) {
 		VERBOSE_TOROUT_STRING("rcu_torture_fwd_prog_init: Disabled, unsupported by RCU flavor under test");
 		fwd_progress = 0;
 		return 0;
-- 
2.17.1

