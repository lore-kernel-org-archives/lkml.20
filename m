Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378536;
	b=a08C25QFBm7yYPFwGt47nMwnsYQdZ1ve5HuwDlCD/WctZQINm7POPFYVTi6Jmo3sMRck
	 ADO48L7YWmyfcMR5r47e8vGNfE2PI6bhWfSaNPxwzNtaO4tprxy11gZzJ6e3DtlmS4bQR
	 dvfsWBeic7OjUBK+AcEFhm2FNZ+d3gOtfv5bnS5kF7AZAcDoIUkiv6M6ekxDUhrzuPMop
	 AOaR6H9EtIavNGg4dcQStvkCTMcWsTNivRoHAFVwuWhvUGVlT5aKN7yNLnjRMdUn+cGGE
	 r8jZ5/JMTBOYkOt/5elbnwp9RSjY+3rmlyVd0yCyugKR/hfaVyZjxo6ShR3iv2l0PFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378536;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2ploE/VOi2AUYUkE+k1r3qWF9UTHVjA/86tbWIbW9QI=;
	b=ykf7VrNbdkydWWLsaDB+hMXYjBA1ZDs2ihYwn9NvAdgfYE3svM9NKf36DmZ8WXeK6+H0
	 nG2MMWeiboVk8bq5DPzWJutCC2USnhBL8sLeQbCRmfLv4vKJ0yDW+6Ct3N5+WNTiAAC0/
	 xACVOL71XVedqQ9AUvi+GSs3nHZZKK4PWAcMbR2U3UKbLxM0Bp+/TK5LdZM/uw65zmjR7
	 ipLzksM8JUIkQh034xcQFWJmmi7wZxMtqXnUewFkaYxGSQIuIpmNjWnK6/JW7Avp5NrHo
	 tUKbKpsfZtoV8ej9oQiZTiYfABib28+5ALrJ+9ivfhCe5gp4UKV5aq3YoKYs9FxHlYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aib+l7Du;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF8B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF8B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aib+l7Du
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=aib+l7DukaYnWzq0h9Jvza7Zeo2Pg2C5MJTI/f0VqQtVWWkdPMjLERcWmXjiIrJfOhAw4XEt6SYw1
	 2MdDWdpcS08q+WazUqanXmV8gJTK7qv1l7yc4M9mBnu36hG5A1ejgJ1JC251cAX+sWrkDcDAnqLkwm
	 J8VZLjox27Nl5Jxs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af40b25874-b0ce1;
	Wed, 11 Nov 2026 14:28:54 +0800 (CST)
X-RM-TRANSID:2ee16af40b25874-b0ce1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af40b2531f-d1437;
	Wed, 11 Nov 2026 14:28:54 +0800 (CST)
X-RM-TRANSID:2ee76af40b2531f-d1437
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: tglx@kernel.org
Cc: peterz@infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+7a8157b6d979dc7367e8@syzkaller.appspotmail.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] cpu/hotplug: mark concurrent accesses to should_run
Date: Wed, 11 Nov 2026 14:28:53 +0800
Message-ID: <20261111062853.16835-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

The boot processor sets should_run to wake the application processor's
hotplug thread. cpuhp_should_run() reads that flag without a common lock.
The existing memory barriers order the associated state, but do not mark
the flag accesses themselves, which KCSAN reports as a data race.

Use READ_ONCE() and WRITE_ONCE() for should_run accesses while preserving
the existing barriers and completion protocol.

Fixes: 4cb28ced23c4 ("cpu/hotplug: Create hotplug threads")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 kernel/cpu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 376d297a6292..ab8dae116e0e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -774,7 +774,7 @@ static void __cpuhp_kick_ap(struct cpuhp_cpu_state *st)
 	 * true. Paired with the mb() above in cpuhp_thread_fun()
 	 */
 	smp_mb();
-	st->should_run = true;
+	WRITE_ONCE(st->should_run, true);
 	wake_up_process(st->thread);
 	wait_for_ap_thread(st, st->bringup);
 }
@@ -1045,7 +1045,7 @@ static int cpuhp_should_run(unsigned int cpu)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
 
-	return st->should_run;
+	return READ_ONCE(st->should_run);
 }
 
 /*
@@ -1068,7 +1068,7 @@ static void cpuhp_thread_fun(unsigned int cpu)
 	bool bringup = st->bringup;
 	enum cpuhp_state state;
 
-	if (WARN_ON_ONCE(!st->should_run))
+	if (WARN_ON_ONCE(!READ_ONCE(st->should_run)))
 		return;
 
 	/*
@@ -1087,10 +1087,11 @@ static void cpuhp_thread_fun(unsigned int cpu)
 
 	if (st->single) {
 		state = st->cb_state;
-		st->should_run = false;
+		WRITE_ONCE(st->should_run, false);
 	} else {
-		st->should_run = cpuhp_next_state(bringup, &state, st, st->target);
-		if (!st->should_run)
+		WRITE_ONCE(st->should_run,
+			   cpuhp_next_state(bringup, &state, st, st->target));
+		if (!READ_ONCE(st->should_run))
 			goto end;
 	}
 
@@ -1116,14 +1117,14 @@ static void cpuhp_thread_fun(unsigned int cpu)
 		 * playing.
 		 */
 		WARN_ON_ONCE(st->rollback);
-		st->should_run = false;
+		WRITE_ONCE(st->should_run, false);
 	}
 
 end:
 	cpuhp_lock_release(bringup);
 	lockdep_release_cpus_lock();
 
-	if (!st->should_run)
+	if (!READ_ONCE(st->should_run))
 		complete_ap_thread(st, bringup);
 }
 
-- 
2.51.0


