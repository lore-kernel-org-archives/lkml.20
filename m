Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793075;
	b=HMMU8dplfEB1KE2dZCQ/faR+/qoxej92n1qfmB1YaoZWRaStoB0PrZnoAmN/V/+/71X3
	 c8Bm3KU0yTFSNfJ9jmXq0W79vyXW/NeISEiIwlOnRZUhzu6WnIS+NXfSMCz0NYaUiAdjv
	 htUS09C56mJcTtl6o6/kFn0qgWutT74Ze1RZB5oLDKZ+X0VcFZY3Qsex+Piw4LYmoxa01
	 tD7R9EvQchHoHwZZOMg/ymYZlrxs7nWJIpxkwlTYpX36xSdnJ666ko/5g0GVMBIPbN68y
	 CXYKe7zwPm0axanC6ArgJFteSzqm/ddje9fHK9Sc4LPIfnJdEAEKq6Ka+BVOVUU2Gzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dWXsdAIvttM4Irbv7azFKSCXxkx+zrn963XG77q/2/Q=;
	b=m/eRWDGDyegnWNRAxKwnyLQaa4k0xF5Q/9Xh1uafQzi1u06lg/mZa8g9Zf+piyFMrfTa
	 dCSnvfo3QKf/B2xg6ELMV/W/bJHeC1ZxdhQ8xIvhqfeaZ3NqGawUabb2Drx+Kyxkix2Fy
	 heZwCc7/XE5CQqNv6aqcaI8xNvm/VnJixtPm3pjtqn6HO7L/d+L0D0s95Y90mUaqAdUVx
	 IN5OzR/KeT5s45YK+X2bcF0nBtjsHeHg1ATepFZcOnHRjj8SjTuNvlSUMAPv7peP00B4v
	 CYoKjb3Pdf3NI/jSqHiKttZ8JKf2MkvoYeYV7rRuQ9Tu4spHLtAUwptj50ivdOgkruA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nsp2qZRr;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA75B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA75B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nsp2qZRr
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so1597205a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793074; x=1793397874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dWXsdAIvttM4Irbv7azFKSCXxkx+zrn963XG77q/2/Q=;
        b=nsp2qZRrl4d1antHqdLTjsa+8uHUx2qQzFjxiDEVLSLlAAPqiMq9QCeWy+kqoJKT7h
         87B7c8Xin+AZiug3Vic1xnQ7kVfMbdThuVUMGlU1N71wkuue8CIGR528KdcnoEzS+gSn
         Ures4nyOMV/KkkzDXCdHnBRZUeWdVHWWWr75YPssZRmbMhIXB6aaQkVP4VwCPSpmOG/F
         aCgz5zpGsNnhXWf9StHGIHY1fzzK3MSDmAjt0f3x6P+9QyrpkUhda9v45dTCONJ/0T4L
         kZKLQJHExWTw/BbbtISCdRFoRKZGjEZVB51VIEi1iW73VTFagY/zlabakqfzb94/OxXj
         alcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793074; x=1793397874;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dWXsdAIvttM4Irbv7azFKSCXxkx+zrn963XG77q/2/Q=;
        b=BrC2sg4/83bTK38sWelq6aL/xpJQUHxWN6BagzzKRTJlGETlhGpsnwTmUdSnb2prX4
         auOVtN/u0Tzo22ARpCc+g/7F7pRE1CuSqqI1GXC6Rro6Z6h7Xe9STfQXMYMhne+wpgCd
         PuxjZ0F0Jmw4B80BBg7aTLoFuuiLdtum4vjS2ADi4nDi71J0ts2pmaLE2gsJ4trg+LUd
         Ec0mXDMBgPc6arvZi7fkYHtex2llrAISeJfN58d0QcN4kMeYcRPS1Jyv3JEpggMa+8IK
         Ok6YzpPo3KsVlX77YxtvWgOR87fYilgCP9muilcXgvr5ZXL4+o1DUPqBXMQA/qjEOosy
         EOiQ==
X-Gm-Message-State: AFq9FYKQwhM6WDnzJvkm7aeHI0arM5hCRRCW3Tsw0dLFkcxKMHCqR9XQ
	+bLhAQjNgE4+OIEuRsYaYQ93CyxF40MTaJav5/5d491ipNC5jpo8wrspOloqn8KlatAbjPi9EAQ
	H7dkl/yYJkBLoPl1MbpmxBrawqmwYK7FsIQWOnYUQOWyvQyn3ygHyPERQEbUeogPpMlgxjCsAWb
	1eiF4BPhnXDXOA27AVPZ3nikPkGmWARmPwkZRWWW8r8C7H1kKe
X-Received: from pgp10-n1.prod.google.com ([2002:a05:6a02:62ca:10b0:cd6:1e1f:43b])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d47:b0:3ac:b2e6:317d
 with SMTP id 98e67ed59e1d1-3adeaf9f24cmr392468a91.35.1792793073838; Fri, 23
 Oct 2026 15:04:33 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:11 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023220431.1106611-1-jstultz@google.com>
Subject: [PATCH v33 0/7] Sleeping Owner Handling for Proxy Execution (v33)
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey All,
  Just wanted to send out this next iteration of Proxy
Execution: Sleeping Owner Handling.

As always, I=E2=80=99m trying to submit this larger work in smallish
digestible pieces. A quick overview of the journey so far:
 1) Prep patches
 2) Single rq proxying
 3) Simple donor migration
 4) Optimized donor migration
 5) Sleeping owner handling  <---- We are here!
 6) K Prateek=E2=80=99s core-sched fixes
 7) Connor's chain level balancing
 8) Suleiman=E2=80=99s proxy rwsems
 9) Suleiman=E2=80=99s proxy futexes
10) ...

The main feature in this series is the sleeping owner handling
patch, which addresses what to do when a task is blocked on a
mutex whose owner is sleeping. Since there is nothing we can do
to boost the sleeping owner at that point, we instead deactivate
and queue the waiter on a list attached to the owner. Then when
the owner wakes up, we will activate the waiters on the same
runqueue, so they can then boost the owner to run.

But since the simple sounding things hide subtlety, this ends up
being a pretty complex bit of logic. You can effectively get
trees of waiters, and it's possible to have tasks in the middle
of the tree be woken up. Then handling wakeups as they cascade
down the tree properly is also a bit complex, as there are extra
lists to manage the recursive style work without actually
recursing.

K Prateek sent an interesting alternative approach:
  https://lore.kernel.org/lkml/20260826062901.2137-1-kprateek.nayak@amd.com=
/

But after talking with Peter on this at LPC, we agreed to start
with the =E2=80=9Crelatively simpler=E2=80=9D(ha!) approach first, and then=
 take
a later swing at using K Prateek=E2=80=99s approach to optimize it.

In this series (against linus' HEAD) I=E2=80=99ve also aggregated fixes
from K Prateek, Shubhang Kaushik, as well as included some
initial proxy-chain cycle detection logic combining parallel
efforts from Zhidao Su and Hui Su. Additionally there have been
issues fixed in the sleeping-owner-enqueuing change, reported
by David Stevens as well as other partners.

Thank you to everyone for contributing bug reports, fixes and
improvements! I really appreciate it!

New in v32 of this set:
 * Fixes to PSI flag handling logic that proxy-exec could break.

 * Fix from Shubhang to use rq->donor for sched_tick_remote().

 * Extended K Prateek=E2=80=99s optimization to activate on NULL owner
   to do the same for null mutex/blocked_on.

 * Fix to set TASK_RUNNING when we shortcut return-migration to
   immediately run a task.

 * Fixed chain depth limit for find_proxy_task() to avoid
   deadlocks if there were a lock cycle, from Zhidao Su.

 * Further chain cycle-detection logic, using Brent=E2=80=99s algorithm
   to catch cycles faster from Hui Su.

 * Additional fixes to activate_blocked_waiters() to avoid PSI
   state problems

 * Fix for a potential crasher caused when the call to
   do_activate_blocked_waiter() is significantly delayed, which
   could cause proxy activations to the previous owner=E2=80=99s cpu,
   even if the task had been otherwise woken and then went back
   to sleep - potentially allowing execution outside of the smp
   affinity mask.

Additionally I=E2=80=99d appreciate any testing or comments that folks
have with the full Proxy Execution series! You can find the full
Proxy Exec series here:
  https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v33-7.4-p=
re-rc1/
  https://github.com/johnstultz-work/linux-dev.git proxy-exec-v33-7.4-pre-r=
c1

New changes to the full patch series in this revision include:
 * Small fix for Suleiman=E2=80=99s FUTEX_LOCK_PING logic

Issues still to address with the full series:
 * Address and integrate feedback from v1 RFC of Proxy enabled
   futexes

 * Maria Yu raised a subtle difference in how the nr_iowait
   counting might be attributed with proxy-exec: potentially
   proxy-migrated donors that become blocked on sleeping owners
   could increment/decrement the value on the owners cpu rq,
   instead of on the donor=E2=80=99s original cpu rq. It=E2=80=99s unclear =
to
   me what the impact of this would be, if at all, but it is
   potentially an observable difference with proxy-exec, so
   I=E2=80=99m going to take a swing at addressing it.

 * Reevaluate performance regression K Prateek Nayak found with
   the full series earlier.

 * The chain migration functionality needs further iterations
   and better validation to ensure it truly maintains the RT/DL
   load balancing invariants (despite this being broken in
   vanilla upstream with RT_PUSH_IPI currently)

Future work:
 * Expand to more locking primitives: Binder PI is something
   else we=E2=80=99re exploring.

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
series really is due to them - while the mistakes are surely mine.

Thanks so much!
-john

[1] https://static.lwn.net/images/conf/rtlws11/papers/proc/p38.pdf

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Cc: zhidao su (Xiaomi) <soolaugust@gmail.com>
Cc: Hui Su <sh_def@163.com>
Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Cc: kernel-team@android.com


Hui Su (1):
  sched/proxy: Detect cycles in proxy walks earlier

John Stultz (2):
  sched/psi: Preserve sleep-persistent PSI flags on off-CPU sleeping
    dequeues
  sched/proxy: Set TASK_RUNNING when shortcuting return migration

K Prateek Nayak (1):
  sched/core: Activate blocked donor when no owner is found

Peter Zijlstra (1):
  sched/proxy: Add deactivated (sleeping) owner handling to
    find_proxy_task()

Shubhang Kaushik (Ampere) (1):
  sched/core: Use the scheduling context for remote ticks

zhidao su (Xiaomi) (1):
  sched/proxy: Break cyclic proxy chains by deactivating blocked tasks

 include/linux/sched.h      |   7 +
 include/linux/sched/task.h |   1 +
 init/init_task.c           |   6 +
 kernel/fork.c              |   6 +
 kernel/sched/core.c        | 404 +++++++++++++++++++++++++++++++++----
 kernel/sched/stats.h       |  24 ++-
 6 files changed, 407 insertions(+), 41 deletions(-)

--=20
2.56.0.257.gf7497c7d27-goog

