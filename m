Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805A3750D7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044885; cv=none; b=D8qRKn1B++yORKs7mWW1F1q4yqvDAgeVJYtW8r7bmARA6p81mIjHiK1Y3O6PbUFLJidC5sMN3rxd7vFNOzo04Q9Xil1dG/wMFJ9LhnR4sNUnTkGjrSrj31AltG+FTe+7nx2BvYliXCbXH/+QTSFMDMvAmOCJR0Hy0LrwtpI4lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044885; c=relaxed/simple;
	bh=1SHVv20VwQ5QyJQ5wABWmCxOsUWU6j0AQkR1QB2hJqY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Bb6k+s7ILI+37xrvQuhTdfPeDnrtgbipyi4mblVfHdwr9jMCD+MK7UTE9gjL7YjLywhAX6Gs8vFpjoFtUFGIHSTfxycCOPtiSfdHLQCB+i4s0ivTxTrstcdSQyqx+aXprW+N74S16VIAFg1Nh1mJcWuHDlzNFuYThUGa1rHI1TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FkEjVGJ4; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FkEjVGJ4"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db3d832827so47958545ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790044883; x=1790649683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AKQaj+GIk7IJiFTZtoMlMBjwT30WdaYJiFNLV8/DU0k=;
        b=FkEjVGJ43lwoLdDpGpVmQ0aTai5yC14YAULbnepd+Rn8+rPLKuRQ24swYq5r7cG9P9
         0+9ROydpBpqho0LAIeolBhDU/C/wqfN/u0v9RD8jALhoOX9erT33GUtEMGn1WvqYGiEa
         02kx4e6fxFbi6YcRRfzV8kXWinEIqHjDk7TyZ77aiLK/zDZXrVK4KTE8k2stnWammEpz
         9slB+g8w4FDpoSLOC4nLdohsWy0lvPVEimG42/c1ymUTr8dL9mceyFWZYyTYqHkJX4Kr
         ULsDF1J/b5/6amI5KYhAzgTqB3NNQy81nOewQirZDqvjM2JTybp7GZgTEtgCelAenxOH
         xtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044883; x=1790649683;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKQaj+GIk7IJiFTZtoMlMBjwT30WdaYJiFNLV8/DU0k=;
        b=SoZWpbNNlF+LGimM2MTJwGkWZAjJxVW0A/VZHFduFNJj/HAw2hZ4pKiViiT6prezQ5
         Btxe//iwBmD0TWfqoS2sdEjIBNIm/vUEWTYSnmurPWAnpNdsL24IENG+IpTxE8fcn0qh
         WrtPbg1KPlX0OESXfam70U+MPqvY+Qn4A/+8S5BMaJMouq/PIxRzGMlY/gv619V+Q+1h
         XJu1IBBp5/PgsM3BoXrzfoVynQfk6sjhgPPSJnI5M8h8eWKTX4d3AoZgltzS13mwWaXH
         BtpPH/xDKpMvdkErg8N1vNYkmPVKFEoyOLml58wZgprl6r3seh6JhH+VyixzBdTpk3K9
         plZA==
X-Gm-Message-State: AFuF++m+ZOR8U2pwBG8dUG0vjvuGtwwJel6elChHD3YrzjuuSdNPMThn
	ktBvxZYO10+QCEkW+UYiVfWLTWs1paRcIoTUF0ju+fgJsBmQzkfgYvlqghO9D8IOs3j3Taf3WEW
	hUpyZGx83fBWotypscrTfUlyB7vDie06ZviiDdOgKTcq7lCYEIGI4+7BIuXebBKL+WcYxgtNADB
	g0sqoIX597lIgR/FaeUzZTVPjFtIG3uXOjWPJ4CjVLRfBN7TLl
X-Received: from pllw23.prod.google.com ([2002:a17:902:7b97:b0:2db:1c75:39b8])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2447:b0:2db:5c0a:f184
 with SMTP id d9443c01a7336-2ddb1b78d26mr171049705ad.17.1790044882577; Mon, 21
 Sep 2026 19:41:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 02:41:10 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922024117.1514332-1-jstultz@google.com>
Subject: [PATCH v32 0/2] Sleeping Owner Handling for Proxy Execution (v32)
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, 
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey All,

Just wanted to send out this next iteration of Proxy Execution:
Sleeping Owner Handling.

As always, I'm trying to submit this larger work in smallish
digestible pieces. A quick overview of the journey so far:
1) prep patches
2) single rq proxying
3) simple donor migration
4) optimized donor migration
5) sleeping owner handling  <- We are here!
6) chain level balancing
7) proxy rwsems
8) ...

Peter kindly picked up most of the simpler patches I had
submitted in the last iteration, so this mainly leaves the
sleeping owner handling patch, which addresses what to do when a
task is blocked on a mutex whose owner is sleeping. Since there
is nothing we can do to boost the sleeping owner at that point,
we instead deactivate and queue the waiter on a list attached to
the owner. Then when the owner wakes up, we will activate the
waiters on the same runqueue, so they can then boost the owner
to run.

But since the simple sounding things hide subtlety, this ends up
being a pretty complex bit of logic. You can effectively get
trees of waiters, and it's possible to have tasks in the middle
of the tree be woken up. Then handling wakeups as they cascade
down the tree properly is also a bit complex, as there are extra
lists to manage the recursive style work without actually
recursing.

Atul Kumar Pant, K Prateek and Peter and all provided feedback
on the last set that I=E2=80=99ve tried to work into this one.

Additionally, K Prateek sent out his own take on this change
here, which is very interesting:
https://lore.kernel.org/lkml/20260826062901.2137-1-kprateek.nayak@amd.com/

There are definite benefits to his approach, but the patch
series needs a bit more polish and it feels a bit more subtle to
understand. So I figured I=E2=80=99d iterate again on my approach and
send it out.=20

Peter: Hopefully you can provide some input as to which approach
you=E2=80=99d prefer?

I did include one of K Prateek's fixes from his approach in this
series, as it looks like it should go upstream regardless.

I'd love to get further feedback on any place where these
patches are confusing, or could use additional clarifications.

New in v32 of this set:
* Rebased on current -tip/sched/core

* Added K Prateek=E2=80=99s =E2=80=9CActivate blocked donor when no owner i=
s
  found=E2=80=9D patch

* Add fix suggested by Atul Kumar Pant to double check is_blocked
  in do_activate_blocked_waiter()

* Integrated a number of style/formatting changes to utilize
  guard() sent by Peter

* Fixed potential race in proxy_remove_from_sleeping_owner()
  with owner changing, as found by Peter

* Dropped extraneous call to activate_blocked_waiters() noted by
  Peter

Additionally I=E2=80=99d appreciate any testing or comments that folks
have with the full Proxy Execution series! You can find the full
Proxy Exec series here:
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v32-7.3-r=
c-tip-sched-core/
  https://github.com/johnstultz-work/linux-dev.git proxy-exec-v32-7.3-rc-ti=
p-sched-core

New changes to the full patch series in this revision include:
* Integrated Suleiman=E2=80=99s proxy-enabled FUTEX_PING patch series,
  recently sent to the list.

* Updated to include v13 of Andrea=E2=80=99s sched_ext + proxy-exec
  patches

Issues still to address with the full series:
* After the nr_wait imbalance was addressed, Maria Yu raised a
  subtle difference in how the nr_iowait counting might be
  attributed with proxy-exec: potentially proxy-migrated donors
  that become blocked on sleeping owners could
  increment/decrement the value on the owners cpu rq, instead of
  on the donor=E2=80=99s original cpu rq. It=E2=80=99s unclear to me what t=
he
  impact of this would be, if at all, but it is potentially an
  observable difference with proxy-exec, so I=E2=80=99m going to take a
  swing at addressing it.

* Reevaluate performance regression K Prateek Nayak found with
  the full series earlier.

* The chain migration functionality needs further iterations and
  better validation to ensure it truly maintains the RT/DL load
  balancing invariants (despite this being broken in vanilla
  upstream with RT_PUSH_IPI currently)

Future work:
* Expand to more locking primitives: Binder PI is something else
  we=E2=80=99re exploring.

* Eventually: Work to replace rt_mutexes and get things happy
  with PREEMPT_RT


Credit/Disclaimer:
=E2=80=94--------------------
As always, this Proxy Execution series has a long history with
lots of developers that deserve credit:=20

First described in a paper[1] by Watkins, Straub, Niehaus, then
from patches from Peter Zijlstra, extended with lots of work by
Juri Lelli, Valentin Schneider, and Connor O'Brien. (and thank
you to Steven Rostedt for providing additional details here!).

Thanks also to Joel Fernandes, Dietmar Eggemann, Metin Kaya,
K Prateek Nayak, Suleiman Souhlal, Christian Loehle, and
Andrea Righi for their substantial review, suggestion, and patch
contributions.

So again, many thanks to those above, as all the credit for this
series really is due to them - while the mistakes are surely
mine.

Thanks so much!
-john

[1] https://static.lwn.net/images/conf/rtlws11/papers/proc/p38.pdf

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com


K Prateek Nayak (1):
  sched/core: Activate blocked donor when no owner is found

Peter Zijlstra (1):
  sched: Add deactivated (sleeping) owner handling to find_proxy_task()

 include/linux/sched.h      |   7 +
 include/linux/sched/task.h |   1 +
 init/init_task.c           |   6 +
 kernel/fork.c              |   6 +
 kernel/sched/core.c        | 342 ++++++++++++++++++++++++++++++++++---
 5 files changed, 338 insertions(+), 24 deletions(-)

--=20
2.55.0.1082.g2b9226bbc0-goog

