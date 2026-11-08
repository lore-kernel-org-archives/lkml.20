Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128827;
	b=h8i/GgigEwSC9KQv5HGC8DLzepY6bAJqFffTsACN91tJe5xDcq1N0oBR+paWQeRaA/d5
	 8Iux9+cRCnb/oFe5blv39DZ7xK+KvIcYDTiy/3n4vkxJ57+xFVCLX0G567eeu5Mes8PpT
	 8xOBD9B6LoDPssgJrSMnevxvbTTJJsuWK9Zld+AfLGmjcKH41XrblwTfzlKiVb16SWzHF
	 MM/WwBMkdWcJTaecBPFbOsHE3lBclitmtsicE/Hri+gXAyUuXoHzuM5gIcJwEpV/n8QvB
	 X8k2UmoLB9WAovdTXAxWz7yxOf2MPUGBx2rNe5pDxvZKvnPwmX/JONWhB6w+BPn86oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128827;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=u7BobgN2xmb+FOFl82l1E1yEOqYDN5X7f+5agA9S/EM=;
	b=CdKStZFFgaqpdrIqJBvJhBXF1LqLgJyr2PTV+943PQrJBGMyOF0mH/eV7D5gg+usg20l
	 IXQg7IuFWDVhLvKgWhqSnq9ITKxm/1LkYgW6kytOtWZGOV63TzZTivF9L1xf6UCwUxR8T
	 oRbEK96YUrJqi9el6XhYmS5qbyUt38QXaFth1GfUE8fOh7RfUUwlkwvDmeznSQ/UK3ZRv
	 EBr2I8l2MCPyAvSsWmymwhYOIpsR9hcPgdQLzy4pdEUxlGi93jD/JJITwNF3/0lTUNAQI
	 sRGaQbuIQIIcJlaC1IvSeyrMwz84C1dmyogPw8iChjyOu3hzdwgLzEDnRx8wmH3hlyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rkfRcBw+;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA48606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rkfRcBw+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794128808; x=1794733608; i=efault@gmx.de;
	bh=u7BobgN2xmb+FOFl82l1E1yEOqYDN5X7f+5agA9S/EM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rkfRcBw+HpA3R2alMHpzGxoK9FUjtXBBfFMphkn7MVjJmGQfzM/iUJUNdLChPTCK
	 jQOxwsfAY+x7FDB83Eg2HuLE2yXuTdc7xtj+21JbWcN2rAAdv/8Fg4QN6B0YTrmJ7
	 qQVqOr4//N3OWPooA/Bjme95nqUmbXsTSSRPNzCAQM5/ZTlItgK2eNhyNoBZjVpUJ
	 OsiRNHVHrPfR91WgmCdNvi9n/50Eda6untrQ89aVPdkVFVpme45c9qiJs7tn/37yA
	 BEuGOUdDdzRi5Fdz78soTzpRQtrSUeK7GE/YmwG/xQIHVAnGn5L4U+UcwX3h8r2Sk
	 Zew5S+OWjXnuAviYtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fii-1wSkOO0h0y-01646S; Sun, 08
 Nov 2026 10:06:48 +0100
Message-ID: <62ef3ad4ef9e32c6ce997c6c2ac3480ecd77ddd8.camel@gmx.de>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
From: Mike Galbraith <efault@gmx.de>
To: Vincent Guittot <vincent.guittot@linaro.org>, Chengfeng Lin
	 <lin2530632123@gmail.com>
Cc: Tianchen Ding <dtcccc@linux.alibaba.com>, Peter Zijlstra
	 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	 <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org
Date: Sun, 08 Nov 2026 10:06:46 +0100
In-Reply-To: <CAKfTPtCJVBpZNm7bVUSQZ01Q-iStNZvdz6BiNw1NN9+7y0+=mA@mail.gmail.com>
References: 
	<CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
	 <37fb82ff-ed5d-41d7-91b7-afe4379a636c@linux.alibaba.com>
	 <CANGjgdkx8DJLjD-j86p7pUqY+uNukSHqHyOFuMfK5YqSAX6knA@mail.gmail.com>
	 <CAKfTPtCJVBpZNm7bVUSQZ01Q-iStNZvdz6BiNw1NN9+7y0+=mA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Provags-ID: V03:K1:qle/uCeyQP6UauwuzSTi7duUo9zPb9XO7iowXftyCguyQawtBai
 QCjTpRhYYDagEj6gx746GAjxyVzfEi7eo35eD14N2AF+LIv9ho2UmQztHRafICbuPIS8J71
 ZdcwIb8IPawkx+L5UL9aCKfNvEd7Snrfu/VIb8a74Il9YT9EveGnEnG/sSRU2l5k2/lEqfB
 Oa5XlxHxpw1tKV/EqLMFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AQI+stEAV8k=;Dw/QfaG5dll6fvVd9F/KBlnWJx4
 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
 EjOSh3fVl65QTcupLWQ==

On Fri, 2026-11-06 at 17:43 +0100, Vincent Guittot wrote:
> On Tue, 3 Nov 2026 at 10:46, Chengfeng Lin <lin2530632123@gmail.com> wrot=
e:
> >=20
> > Hi Tianchen, Mike,
> >=20
> > Thanks for the suggestion. Disabling DELAY_ZERO also improves the
> > 15-worker pipe-handoff case here.
> >=20
> > I tested the same v7.3 kernel image across three fresh boots with
> > DELAY_ZERO on, off, and on again. Both 333238da9a19 and DELAY_DEQUEUE
> > were retained. I ran context_switch1_threads with -s 15 and -t 2 or
> > -t 15, keeping the native CORE affinity on the same eight P-cores.
> >=20
> > Each entry below is the mean of nine runs, using the native 15-second
> > post-warmup measurement window. Throughput is in millions of handoffs/s=
:
> >=20
> > =C2=A0 Workers=C2=A0=C2=A0=C2=A0=C2=A0 On A=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Off=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On B=C2=A0=C2=A0=C2=A0=C2=
=A0 Off vs. mean of On A/B
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 1.156=C2=
=A0=C2=A0=C2=A0=C2=A0 1.159=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.158=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.17%
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15=C2=A0=C2=A0=C2=A0 9.172=C2=A0=
=C2=A0=C2=A0 10.425=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.165=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +13.70%
> >=20
> > The largest within-boot CV was 0.60%. The 15-worker on-again baseline
> > was 0.08% below the first one.
> >=20
> > GNU time's counters from the same calls, covering the whole invocation
> > including warmup, also show a change in switch types. At 15 workers,
> > the mean involuntary share of context switches was 0.36%, 41.48%, and
> > 0.36% for on/off/on. These results are consistent with your handoff
> > explanation and Mike's point that the added accounting changes
> > DELAY_DEQUEUE's behavior, beyond the cost of the update itself.
>=20
> 333238da9a19 ("sched: Update time before requeueing delayed entities")
> fixes a bug in how the lag of a delayed dequeued task is accounted.
>=20
> Let take the example of 2 tasks TA and TB running on root
>=20
> Without 333238da9a19:
>=20
> - task TA=C2=A0 starts to sleep and is delayed dequeued with a negative l=
ag
> of -1 usec
> - task TB becomes the current running task
> - During tick, update_curr() updates TB and moves forward its vruntime
> (and avg_vruntime) but it is still behind deadline/vprot so no
> resched().
> - TA's vruntime is now behind avg_vruntime (i.e. its lag is positive)
> - task TA wakes up just before the next tick so TB has not yet been
> updated for the last ongoing tick (up to 10ms)

If only these longish term ineligible survivors are the issue, perhaps
we could do something like below, and turn "cache cold" sleepers loose
to migrate, and only requeue the markedly shorter term still "cache
hot" sleepers?  That way we get some LB benefit instead of grief from
the problem children, and sleepers still get the most important benefit
of DELAY_DEQUEUE (I think), namely short mutex et al sleeps that eats
away at heavily threaded applications ability to compete with compute
on an equal footing.

Repurposed Q/D hacklet against Peter's ttwu series...

       627675b9c524 sched: Add ttwu_queue support for delayed tasks

...below.

---
 kernel/sched/core.c |   24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3895,7 +3895,15 @@ static bool ttwu_queue_wakelist(struct t
  */
 static int ttwu_runnable(struct task_struct *p, int wake_flags)
 {
+	unsigned long thresh =3D sysctl_sched_migration_cost;
+
 	if (sched_feat(TTWU_QUEUE_DELAYED) && READ_ONCE(p->se.sched_delayed)) {
+		int task_hot;
+
+		/* XXX hack alert */
+		sched_clock_cpu(task_cpu(p)); /* Sync clocks across CPUs */
+		task_hot =3D task_rq(p)->clock_task - p->se.exec_start < thresh;
+
 		/*
 		 * Similar to try_to_block_task():
 		 *
@@ -3920,7 +3928,7 @@ static int ttwu_runnable(struct task_str
 		 */
 		p->wake_cpu =3D smp_processor_id();
=20
-		if (ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELAYED))
+		if (task_hot && ttwu_queue_wakelist(p, task_cpu(p), wake_flags | WF_DELA=
YED))
 			return 1;
 	}
=20
@@ -3933,8 +3941,18 @@ static int ttwu_runnable(struct task_str
 	update_rq_clock(rq);
 	if (p->is_blocked) {
 		if (p->se.sched_delayed) {
-			dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_DELAYED | DEQUEUE_SLEEP);
-			return 0;
+			/*
+			 * Deflect tasks that can migrate toward wakeup balancing logic,
+			 * but only for longish sleeps so we don't inject the additional
+			 * dequeue/enqueue overhead and migration chaos at high frequency.
+			 * XXX pinned sleeper must go too if bug blocker is actually viable.
+			 */
+			if (/* p->nr_cpus_allowed =3D=3D 1 || */ rq_clock_task(rq) - p->se.exec=
_start < thresh)
+				enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+			else {
+				dequeue_task(rq, p, DEQUEUE_NOCLOCK | DEQUEUE_DELAYED | DEQUEUE_SLEEP)=
;
+				return 0;
+			}
 		}
 		if (proxy_needs_return(rq, p))
 			return 0;
