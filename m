Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793081;
	b=SiPkQQfQ/ulkvl9tyPEBPpSxFTgsylpAUoXRrU7G6cDvez5p15nKh1EpjsANXdXEKdml
	 CYTyuaPHxqt6wh2/SyXyx/ehjoopyMOZUhy99M9pTF0FsD2U5332ZWEgXexI/16YnMJXr
	 9MgBBmHlotIZbwKqf2DH4/HHIDdr3LCbmjg3llsssUlwqesz5aEDNbpNPDsbApgv4X6xR
	 mwRtUijhGaj7r1rjS8zHTC1x0qgCkFYCPAYt1TRcgXWJIYeg5KOpyxUfHatp77c00dO3A
	 6RRKS2WAWAD8xagSTyXoUghQy+24ef9igSW7fyEDlhTpqsFT4PC3ikDFUosd4HLloaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cHwv8zAZGMCbvWh8R7tFUkDcKZKUJDm3vAylqF2Rsuk=;
	b=MfVaq50iQjOYG3FKsvMdb1c+c9/rVfPqg40ULOOVYqfge5Jep19cA03bVUHHiRO2hMWX
	 xcTVdyKhA5IJjIv6YMuYbGRsRdMWDjSdV7o+gBMG1oMge8r6asjfG4aotGT0Fk8Xo/m04
	 jEf0u79fS2E40Ix1462oa+LkZk4FBt5TjGPxSmc7hix2SsJ3UCqOs1Ky3qzKV0NzP+Zr9
	 pLmIbnnOv3/4bx02i2DiF5DEzkEkDoP2aip3k16Un0Hb5Bhq/xdAlB/vswLmAjZfq33xU
	 vEocE81VXtDZpUYcmZNJ/p0ZxRTwSKJaNr/KFrlWT9gGmcQn2uOk27Vz7J08aGf+fMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=djlvlIIj;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E425606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E425606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=djlvlIIj
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso1045090b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793078; x=1793397878; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHwv8zAZGMCbvWh8R7tFUkDcKZKUJDm3vAylqF2Rsuk=;
        b=djlvlIIjhS85mYd2crgp3ygLaFqmejcZlbyWWsdmokLHDueJB7JxO4TsffIM7HaIPg
         aod6hqMMc49aEZfIf9U4p6BC72KbxVsQPSMc6o7XLNrEI7IgdV5vV+g6eMEE5ldOFNSh
         9XP1SBXEUhLiCeJgDFW1xRSNyqujPtfcVzz+lUhyWt+DE3eBYlvjL1UxpOvEpo/MN2l9
         ei4NZN78GcmgrUChGIxuQxgOe/mBVhMc6FLgEv15ti83XUnarahz9wtgGD29GmRiKfjf
         SP5SLcNWgDX3a4s+2t89w2l31FAv1/8DPwB1ZaIraCwZE5OdxmdivbVHXAPqLujzdmzS
         6JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793078; x=1793397878;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHwv8zAZGMCbvWh8R7tFUkDcKZKUJDm3vAylqF2Rsuk=;
        b=yGf1ft22aAg9o3gQBe4R06bITaeHCm+3GwWqhP1q2MFSMypv84jW7ZorC+KNPS1fdR
         iG8R49BxnIfkBdy9H4vbfXf8dQ+cqDN+Iau3umAnVMIgl4ZtuJchvNFf2cri3Jra8Woo
         boZs6JkOd9yd3K3j5qflgA8T/hN/9ld9VOb8gaD+5u5CLyVV4YA4auYiQx1l5dA5M/16
         YNo1BkPlXmUUDr1qBxo6Deg7B/pENI5+ndmAA4KTCtvZxRsfSKNJmqphuGbqkU4+6eLp
         OgukJVkAqYsghznRFr3s3snH4UU9voMJ1RCsJIlIqNg4gsECwgCq9fGiY9z43XbuzgfE
         vStg==
X-Gm-Message-State: AFq9FYKhUZ14xEFQ+meZ1r9elH2WEc4u7S2m69rftC9M+JJ1hzfuJxBz
	0pXhgFYLkzezHMyQ15chYSDuDMU+CWmMJ0VmTfJXxhM5GoqN4fECiIWbgJk399zsaW2zqpCwPU0
	jwaB+6LwQ4tRRr/CV3RIadBUFhmItktaWCl9tI1GNXSnqLxRv/Fn0ZbhEZOKzLq3ErTCyvtLFxL
	6J5T28QqfEairEFkAYHiXATjWedHtbWgF1Dwd0xTEl4tjgodLc
X-Received: from pfbfj34.prod.google.com ([2002:a05:6a00:3a22:b0:887:5ba8:7334])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9085:b0:899:53a9:1dd9
 with SMTP id d2e1a72fcca58-8a36944e166mr468799b3a.57.1792793077407; Fri, 23
 Oct 2026 15:04:37 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:15 +0000
In-Reply-To: <20261023220431.1106611-1-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023220431.1106611-5-jstultz@google.com>
Subject: [PATCH v33 4/7] sched/proxy: Set TASK_RUNNING when shortcuting return migration
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

K Prateek's prior patch optimizing find_proxy_tasks() logic to
shortcut and run previously blocked tasks on the current cpu
made me realize while we are clearing the blocked_on and
is_blocked, we are not setting the task state as TASK_RUNNING
before returning the task to run.

So set the tasks to TASK_RUNNING prior to returning them to run.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Signed-off-by: John Stultz <jstultz@google.com>
---
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
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2cb42de255f7a..43ba76b5a3464 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7028,6 +7028,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			clear_task_blocked_on(p, mutex);
 			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
 				p->is_blocked = 0;
+				WRITE_ONCE(p->__state, TASK_RUNNING);
 				return p;
 			}
 			goto activate;
@@ -7065,6 +7066,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			__clear_task_blocked_on(p, NULL);
 			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
 				p->is_blocked = 0;
+				WRITE_ONCE(p->__state, TASK_RUNNING);
 				return p;
 			}
 			goto activate;
-- 
2.56.0.257.gf7497c7d27-goog

