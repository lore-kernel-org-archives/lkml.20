Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025082;
	b=LI++E+xUfQ/n0edynYcqLem+feUrwM3YIjSAORNS8IpNeRMobex2w5ovK3G5y7CHpi+p
	 135VYNSZf6J8mhRfqg1mTaFN6Nl38x779LBo4ObFCyTFtkRkaauHpolEK1PmYi4fyFhkD
	 DQZACQLxiivvaYn0B2UyzBKtqd95AMGAgM6HOtxJbcBI83V7puS9QY1l5C9o5DP7e6t6E
	 2O4aYaBmmqcpIDO1MPUKxsreYCHcPeAVJ+c1fnt89WtmrLr8v5cEoFWDxX0zfkkNT65ck
	 M9CBkWeVoZ63+RmROJxohNKb4a5VWrqM6hlZXgkwH5vaRt3qapVeMnFkDhC6wIyWnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025082;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=7qMmjux5adEL3yMkNPw8M5MOE3+VOR1J8A4rsGDM19M=;
	b=J78zGkuczyk7y6ymdJavIrHV7Vri57gF5NIvvQICsGz6JwG21hBlXYG92gjIb3XEchKI
	 GdwmlVw/vqaVLreU4ExTRKAoNUIDD/K6KDrHIbVclT57F6FJw/mIQqSYVU2Q0MNsbER+z
	 ad5fDlzzv0UbObLKEdolGgdhyLqs/+K6eTNW3hF4LWfOhDoEeFZ+r6UgLqafl214XYKDM
	 q8/hhzBBmiEH0rWMOsTReyYrTpYLPNm+txn0x+fMHdG2SgiDn8yXSqHK1JnDrsiomM7t6
	 dS8VuP5AkYb1zmTn8Kp8YpnPXaYTlt5YUiz52SRzbdkrsSpln65tN9uCfKFhojJcqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=g6Qrt2fF;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6E606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B6E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=g6Qrt2fF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794025074; x=1794629874; i=efault@gmx.de;
	bh=7qMmjux5adEL3yMkNPw8M5MOE3+VOR1J8A4rsGDM19M=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=g6Qrt2fFZU4vbrzOjnMCMREWItyNYpjkk2onPl9UfIAZmiWd13sNJSxMwLW8Gp/B
	 p0rWa7GHFjobIS0tng0BKgFcpVTbGe2Z4p4BPUuFjvFsxWSPXm/A75sno8iuRZWXl
	 c9H4Tu4FbwofgyZfkKuPcDdNrUKC2DnelgLj8gb2foLIQv/ePtDlheQxLLYY1Wp92
	 9mNLB93592KoMF9Wqn5LcjqjOdu9Rql9d2Ccdcw1eM/hxzSlEGxSUY1ta4dtw4Jnd
	 xis6fqTxYyCCCF+fwikpdsOQHlpgKkgjV2nw6uOAJb+c+yLQYd90mbd5hDeb3mD6r
	 2YSRLPhZm+q1NKj9Tg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1wuLqs3kKR-00lePK; Sat, 07
 Nov 2026 05:17:53 +0100
Message-ID: <f2623ff14205adfb92518ef3b7aca053384f4cf7.camel@gmx.de>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
From: Mike Galbraith <efault@gmx.de>
To: Vincent Guittot <vincent.guittot@linaro.org>, Chengfeng Lin
	 <lin2530632123@gmail.com>
Cc: Tianchen Ding <dtcccc@linux.alibaba.com>, Peter Zijlstra
	 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	 <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 05:17:52 +0100
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
X-Provags-ID: V03:K1:qQ8OMw+0USI1IvkuwBOvOe94SKAXF7fVuLN0L1IV8gsEYFH9T2y
 BBKaoxCBf4ykPpZdpGKUK386N7wQarsu41csz7YPC5zYgME59DqVDTX1Hf4uGgD3w3yAulJ
 04STgz50fMm5FOpC5yR6idzCuVNKc8bYUYUKuR4zAJvk8IZVEbwMeFONhryHZLgAPkAhz6f
 Ka1jG2apbUj968J+Ou6+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y0C8BBYDTTw=;cx+1A27h9ID2oqoTmNdz4o/tnFL
 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

On Fri, 2026-11-06 at 17:43 +0100, Vincent Guittot wrote:
>=20

> 333238da9a19 ("sched: Update time before requeueing delayed entities")
> fixes a bug in how the lag of a delayed dequeued task is accounted.
>=20
> Let take the example of 2 tasks TA and TB running on root
...

Thanks a bunch for posting this.  Correctness trumps all else is a rare
speed bump.  The changelog didn't help discern correctness first from
booboo, the more common variety of speed bump.  This does.  I haven't
looked for sleepers surviving for tick scale distances and doing evil
deeds, will almost certainly now do so to at least get a peek at the
bug that also wants to be rendered flat.
=20
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
> =C2=A0=C2=A0=C2=A0 enqueue_task_fair( TA )->requeue_delayed_entity( TA) -=
>
> update_entity_lag( TA ) -> TA lag is cleared and TA vruntime =3D=3D
> avg_vruntime =3D=3D TB vruntime at tick N-1
> =C2=A0=C2=A0=C2=A0 wakeup_preempt_fair() --> update_curr_fair() -> TB vru=
ntime is
> updated with the ongoing tick, avg_vruntime move forward by almost
> half a tick and TA now gained a positive lag of half a tick (up to 5ms
> capped by its slice) whereas it had a neg lag when it slept. This
> positive lag for TA is wrong as well as the negative lag for TB
> - Because of this wrong positive lag, TB is ineligible, and TA preempts T=
B.
>=20
> With 333238da9a19, the main difference is that we update TB before
> updating TA lag to make sure that past exec time has been accounted.
> i.e.:
> - task TA=C2=A0 starts to sleep and is delayed dequeued with a negative l=
ag
> of -1 usec
> - task TB becomes the current running task
> - During tick, update_curr() updates TB and moves forward its vruntime
> (and avg_vruntime) but it is still behind deadline/vprot so no
> resched().- TA's vruntime is now behind avg_vruntime (i.e. its lag is
> positive)
> - task TA wakes up just before the next tick so TB has not yet been
> updated for the last ongoing tick (up to 10ms)
> =C2=A0=C2=A0=C2=A0 enqueue_task_fair( TA )->requeue_delayed_entity( TA) -=
>
> update_curr() update TB
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tehn u=
pdate_entity_lag( TA ) -> TA lag is cleared and TA
> vruntime =3D=3D avg_vruntime =3D=3D TB vruntime at now
> =C2=A0=C2=A0=C2=A0 wakeup_preempt_fair() --> update_curr_fair() -> nothin=
g to do. If
> TB is still protected by its vprot then TA does not preempt TB
>=20
> That's also why when you disable DELAY_ZERO, you get the past behavior
> because we don't reset this positive lag accumulated during delayed
> dequeue. But this is still unfair... If TA has a null lag when is goes
> to sleep, it will wake with this same zero lag and will not preempt TB
> but with a -1 usec lag,=C2=A0 it will gain half a tick of lag (up to 5ms)
> compared to others
