Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1355414A1F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361102; cv=none; b=cKt3BSjYvj2YhkWHnb/sG2CHvWFG7pWkiYvqrEiFK/oW7iHKRR+x09Hy9UqQZwLxCXsewtTO4r/r3PT0cxZEjj2Bq9Gs8Thv1aQGcUEExnY0sHYsqGoLEja79CiK/Wzu1TdQ+9iaM7ltY3Ks0nU1kAGg0ytudH32JfTRBfF64QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361102; c=relaxed/simple;
	bh=1o5z+qlLCr6WNpmebs43isCJRcBKwDf+btaUTUGqPuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khUwfAQHS3IGSXNleUtJ4e2n3vC15+ZuJpD6XkUkGnKPR1wgrLLAyyItNKfULBlZeYtQ+1slLJn2Su+ovKAqkAE2hHfc6gduf64pjRmE8KwCbOKVQCCJfHavXibvLdWZAVvn04fhWgFv3zkUd8cQvXHmVE2v2bgD8l6nmAE8HNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar4w6/l3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar4w6/l3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so18513a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792361100; x=1792965900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+DBlUmYYanLk/fUhQLoMO5TIIqVDKMx0kXtXYJ5c+o=;
        b=ar4w6/l340RLtGsbX4M1KFY1vgPAR8qdXLhDTq366U4TSgT5qeobV5T1X9jMad4O1Z
         Z7VBZtr9tUrD+XvLlZtq9c+JFROkJeQfBt2lv4BzZZS19j8/0bZstbFBazEuPo+DaKUq
         jdLA4IF96bEDODNAses2J+HBLGIx0jLHmoMrb3EhmGRCx+ed5xBSVm28afpBPxMwNJbG
         mLweIFgAFRn9OrEa+95TrwjKFt71DH7lKdLpkLlMixAaBaJJ0E1vC30lXWC5tQMJghMB
         epIYZeXGRwET7OhvMjh+gDMp2E0M7wigMF2lzBJaXgYibd2pC/9B8QoxGmJxu8iKtgc6
         ah6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792361100; x=1792965900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+DBlUmYYanLk/fUhQLoMO5TIIqVDKMx0kXtXYJ5c+o=;
        b=HwnQwmr3Tmz0qYhD2LlHQOvbczvOb5zcwwQu1GGoLZecekaQgdvgmd4M2HXWUdFOIX
         siWU5ZlO8OSFNz96ltYsSu98/5gGF4cXUJ4AyNUC3Y0wfixYUGX3GfMdl/xKaatf6VFj
         dfXWyovIESdEYhCBrN6KpZenIKoaxouNR+esXqorL/Btjzjy1yjbMXG20k50rw9Yr9Y0
         TwPwBstmMBsYhhEFryjGAwhR8btxV6B9o6yeCD7PsaADfmSl17Cnm8waYKhigWBGylXL
         RJuhPPynwejgj941XVjsEKD7ay024BVamwcDFYGNOf6Y0zUmFEPyt5Aa62iTtf2eOumm
         9XtA==
X-Forwarded-Encrypted: i=1; AKwUvBwiX67fa8CCItZnJTRJcbGWm62xcOoheBbTBkAtzf0Hz9BTRz84BWOfvddN6EQTyFL1mbMzNn3PWOI/IQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1wMKjgnzCS4RvHVJKAM49mbNo458Sjuw6EhShaE1kg0wSHYjr
	aLNpTxUeuTCiA8XhYAikK7wLiR6CuGgyzsqbfcSObBxu3H6kRWqNXNTC
X-Gm-Gg: AYBFou2MZxleU0MpLA8IhzSu7xjsfKLfULx10UltaqkGyfU9/lMuqQgwz3LtTJE0sM6
	ILzABjuEQTYAUr46cUvTEnKeAP+KcW3samLquhcF+VsuxmBsFPonmX/Rn2Kta6i54qMAgpPcJZ1
	gjiY6HWh/E50/TIITplKzWf0Q83T0OBeCzFau7IEDytBYRRIGgPOq97p4qUIGOgXm2JlBqOkuiI
	fUqg9wTFai6GlqrFT3SHgtoSes8k2NqVWqq5MJOjMZZOJIq1TN3XG79S+dsmyXQS+XAi96EInI9
	8KGMMbbJKw7Xq0n3TP2Uv0rdDoDEG9KXjNIqUaNlMXiVyXwr+X5pbDg3xgi5p+4zIG9ItH6HM0D
	hDoGs8F7WGw3/oywogQSpwBZ2lDNg9F2llh/vKHB0WkEiQMUbdRESte9IybxPqwYyCH4FxpUDwh
	zTrL8TlgHUzTIayWJ1u6BdhHAi+pfAeHVIZ2h+EWN1Frw060L+LHvfOogMHHRKUlwczIFwgRu+E
	VtGhBOp
X-Received: by 2002:a17:90b:1d50:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3aceeb95f5dmr3676275a91.20.1792361100224;
        Sun, 18 Oct 2026 15:05:00 -0700 (PDT)
Received: from [10.1.2.130] ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm17718271a91.5.2026.10.18.15.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:04:59 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
Date: Sun, 18 Oct 2026 15:04:39 -0700
Subject: [PATCH 1/2] cgroup: fix cgroup.kill for exited thread group leader
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-cgroup-kill-exited-leader-v1-1-c71ad94c20cc@gmail.com>
References: <20261018-cgroup-kill-exited-leader-v1-0-c71ad94c20cc@gmail.com>
In-Reply-To: <20261018-cgroup-kill-exited-leader-v1-0-c71ad94c20cc@gmail.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Serge Hallyn <serge@hallyn.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, 
 Oleg Nesterov <oleg@redhat.com>, cgroups@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kir Kolyshkin <kolyshkin@gmail.com>
X-Mailer: b4 0.14.3

cgroup.kill does not work in case a process' thread group leader is gone
but other threads are still running. This is because __cgroup_kill()
only walks the thread group leaders and sends SIGKILL to each of them
with send_sig(), which uses PIDTYPE_PID:

1. The exited leader is still listed by CSS_TASK_ITER_PROCS as long as
   the process has live threads, but a signal directed at a single
   exiting task never takes effect: complete_signal() does not look for
   another thread to deliver it to, and __send_signal_locked() now drops
   it altogether.  The process keeps running.

2. The live threads of such a process can be migrated to another cgroup
   by writing any of their IDs to cgroup.procs, while the exited leader
   stays behind.  The destination cgroup has no thread group leader to
   iterate, so writing to its cgroup.kill does nothing at all.

In both cases the cgroup stays populated after cgroup.kill, and a
process inside a container can use this to survive the container being
killed.  This also works with a private PID namespace when the init of
the container is the process, as the PID namespace is not torn down
while init has live threads.

Case 1 can be fixed by using do_send_sig_info(..., PIDTYPE_TGID) instead
of send_sig(), so that the signal is taken by a live thread even if the
task found by the iterator is exiting. Note it was pointed out by Eric
in [1] while reviewing v2 of cgroup.kill patchset, and v3 was meant to
switch to it, but the change was only made in cgroup_post_fork(),
leaving __cgroup_kill() with send_sig().

Case 2 can only be fixed by iterating over all threads, so this is what
the fix also does. Once a thread group is being killed, its other
threads are skipped since they already have a fatal signal pending.

I ran some performance checks and the added cost is ~60 ns per every
thread on my laptop (and less than a millisecond for 10K threads),
which seems low. The time to "populated 0" seems unchanged.

The issue was found in crun by Anthropic's OSS Scanner, and crun is
getting a workaround for it [2] (which does what we needed to do
before cgroup.kill was added).

[1] https://lore.kernel.org/all/m1v97x6niq.fsf@fess.ebiederm.org/
[2] https://github.com/containers/crun/pull/2351

Fixes: 661ee6280931 ("cgroup: introduce cgroup.kill")
Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 kernel/cgroup/cgroup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 227d09704ca5..efb7923f0c92 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -4289,7 +4289,7 @@ static void __cgroup_kill(struct cgroup *cgrp)
 	cgrp->kill_seq++;
 	spin_unlock_irq(&css_set_lock);
 
-	css_task_iter_start(&cgrp->self, CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED, &it);
+	css_task_iter_start(&cgrp->self, CSS_TASK_ITER_THREADED, &it);
 	while ((task = css_task_iter_next(&it))) {
 		/* Ignore kernel threads here. */
 		if (task->flags & PF_KTHREAD)
@@ -4299,7 +4299,7 @@ static void __cgroup_kill(struct cgroup *cgrp)
 		if (__fatal_signal_pending(task))
 			continue;
 
-		send_sig(SIGKILL, task, 0);
+		do_send_sig_info(SIGKILL, SEND_SIG_NOINFO, task, PIDTYPE_TGID);
 	}
 	css_task_iter_end(&it);
 }

-- 
2.55.0

