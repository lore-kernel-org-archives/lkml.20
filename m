Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179625304CA;
	Tue, 22 Sep 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070418; cv=none; b=eF4zvw6j9ZZlnD8EcVYK0J1ceb4QfwvK6TBhn3wnSFEj/Jx81e0v6aE6tG9fReFvZzmKu3zfjfPoWyJsSPjSVFbiuKxwoSBbW/eIvfFEcU+5hkg8vECcWrXH3ktHIOat4CXwpJmtq3cZeYOwPZNikTllGxox7MtRJJhEb+bQSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070418; c=relaxed/simple;
	bh=8khDPyYupIHXRNHQF4OHtOktpy4VcI4LPI1BHYWSzWo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=d+mxd/38bkbq4w5JdUGqz7mT6jLfxnFVTgA+0u7z17j1mCfiYIOBWcHHuEYB3imYaDSGY/OzXhYH4KqvhUWCwVzdWSukly1mp0+ww6zcysblHHh9jDukNk7e/7fJZupUlYHCj0BI+bRcS5hd2aEWs2p2K9hUwTOZ7C/A7jn26Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Jdr2SRSK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EpbmRVAJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Jdr2SRSK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EpbmRVAJ"
Date: Tue, 22 Sep 2026 09:46:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790070413;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6/f/YZ3dO9EaR3txZ/keMnidhg6orJKifgdtpiFhyc=;
	b=Jdr2SRSK/I8dfHITW0wD3tCQYIuh5uiMSxbVB0mHWxFLi/6R0TIo8mT6XScMMsTMy46XT/
	bEpsdSJ5hT1BBoly4R9Ph6XblD5YAC8JTwKw8k1cwvrAGobzhzaA3HSQCbwECrLtCaFP52
	hELCu0NSWe3eQvdGmiowc0I/rfcv8zp49hgcy/O+9xGcmPafXgvqBA76Nz57e+Ewhg6pUQ
	JpuNDs4dSukPFHWBwr2lSqTw1PximFiOfF0cl2NvhRq9rilwINJFbLK8WB9Oonf27RRsPr
	C5608H/3EL4PixObsdDUaXQ0X5xVHqhKiRlcj7jSggK/aP7/xOvIGUM4qLRG+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790070413;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6/f/YZ3dO9EaR3txZ/keMnidhg6orJKifgdtpiFhyc=;
	b=EpbmRVAJwg1OhYtaAyGcx5Kd114XFqGJ2xSu3l+ion/7oYMJ1dCJi3lQ3+mvfd9yYBuxHR
	PkO3rEGh43GMaABA==
From: "tip-bot2 for Chen Yu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/cache: Skip kernel threads for cache aware
 scheduling to rubustify the code
Cc: Chen Yu <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,  <stable@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3C058f0c6ea7b991c177a17de347fa3157f25489a7=2E1790035?=
 =?utf-8?q?273=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
References: =?utf-8?q?=3C058f0c6ea7b991c177a17de347fa3157f25489a7=2E17900352?=
 =?utf-8?q?73=2Egit=2Etim=2Ec=2Echen=40linux=2Eintel=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179007041190.2819794.15518402002103730983.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     65efcccddc83d6a19e8a2e2a6117811e39e589bf
Gitweb:        https://git.kernel.org/tip/65efcccddc83d6a19e8a2e2a6117811e39e=
589bf
Author:        Chen Yu <yu.c.chen@intel.com>
AuthorDate:    Mon, 21 Sep 2026 17:37:26 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 22 Sep 2026 10:50:49 +02:00

sched/cache: Skip kernel threads for cache aware scheduling to rubustify the =
code

Kernel thread should not be covered by cache aware scheduling as
it borrows the statistics from the user space thread. Filter the
kernel thread in account_mm_sched().

In theory a kernel thread does not have any valid
cache group, so !grp should gate the kernel thread.
Add the PF_KTHREAD check explicitly here for safety
reasons, to guard against future modifications and
to pair with task_tick_cache().

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware l=
oad balancing")
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: <stable@kernel.org> # 7.2.x
Link: https://patch.msgid.link/058f0c6ea7b991c177a17de347fa3157f25489a7.17900=
35273.git.tim.c.chen@linux.intel.com
---
 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 974a7df..57360f5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1907,8 +1907,14 @@ void account_mm_sched(struct rq *rq, struct task_struc=
t *p, s64 delta_exec)
 	/*
 	 * init_task, kthreads and user thread created
 	 * by user_mode_thread() don't have a cache group.
-	 */
-	if (!grp || !grp->pcpu_sched)
+	 * In theory a kernel thread does not have any valid
+	 * cache group, because sched_cache_fork() is not
+	 * invoked for a kernel thread - !grp should gate the
+	 * kernel thread. Use the PF_KTHREAD check explicitly
+	 * here for safety reasons, to guard against future
+	 * modifications and to pair with task_tick_cache().
+	 */
+	if (p->flags & PF_KTHREAD || !grp || !grp->pcpu_sched)
 		return;
=20
 	pcpu_sched =3D per_cpu_ptr(grp->pcpu_sched, cpu_of(rq));
