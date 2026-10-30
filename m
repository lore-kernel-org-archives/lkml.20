Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359710;
	b=O4JWEytlvCE9SuIc72hlINYsic0LFbq/Ijj28Sg0y7oDtjFvJfY5apxIfJxDMWB1J6AB
	 IXu8S93NE+Az0VSRFabYWgD1z1LjBXd0MkmryyMHn2NmWmvkEUGZLHgbJb5sGrksKHzTC
	 eukuEkDE5b1jbCc7OKM3qGbuBouMJWJa7i0d6AiIlSmkW/fWp93BiRhDpK6E2uafkfSFJ
	 jRnprPTSEajp8wd9RSYeYY2bNNA1bGGex5hFN7tWyKUV+u9NLFwCCtOMSRjHglaj0zv7K
	 CaSFCt9ltQ6JX/wvqvJ3Iw0opj2Jn1/stB9AHX0s+ojVkVwVFJ68dYl6G3jZDt1WVEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=lMjuRXSTMpW2V62hMx3llGDBVgXdTtcOA3x1U5gYAK4=;
	b=UU/UoRecG7IBIHdSKEa0ik4ujSHZG5o+GO2wq7BeK/fHtZRkjvy3daJVX6xiwOWxAXST
	 RqlSGWZ8HHt6KHYaikDjQyWUdSISOTVphyQ2AwBF3wpjhcd1cfOxBrJnY5kwFq7zx1SMT
	 qTr58jdK4T3Tj9tjSXvbWYcSQnAG0YgRJ9dmYqSdK+zTMk3GzXOJZMEqIhUnpN1lRBHlh
	 mlSnaL70xFRgJ1IiqAaP1NAJjD+Ytcg+ytC72TtNFFmDUUSiEuGxCZEYTeNjYV9YL6L9a
	 TLy6u48Zbph3YnU8DV3NKQbJFjzilU1PPFqvkeV6pwb8VpCwVQy42eH0lM31YCdpPfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NMNtkeiJ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34ED606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A34ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NMNtkeiJ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso6622415e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793359708; x=1793964508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMjuRXSTMpW2V62hMx3llGDBVgXdTtcOA3x1U5gYAK4=;
        b=NMNtkeiJUG+Rwn4MaN0WVlaKzU8G9baYv9qXcpyTCNKQeIHF0G53ws51QdtkFRCkPN
         YWq2FmGSiyhl4bUtOiRUSKtKu57j/+ZAlX2Oawx7/NeT+711onyJZQzWl7x9fCBYOCZh
         p5L0nV0MdniPURcTgFBpNWNv8oJ47Jv3FSlYl64yqRTQouqvBeTjKNFLnml3M1kPMcup
         eJIMT2026DY+tkpSfJDDkNHswlyv4jGDeHtxhUfEurPMLmuvAm7el6QS2qdF7Lr9xe9I
         5a1ZL6Hk1EjfKaeWnkhVGpm2o7Bkak8dB1x7oBi1tkk2upqHde5+b1BxILTM6XhCNyKR
         oTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359708; x=1793964508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMjuRXSTMpW2V62hMx3llGDBVgXdTtcOA3x1U5gYAK4=;
        b=U+JZZME6WVu3BMyYDCquL9J4yF3wBoONqXRhsjAaoeV9eLkHHFL6P3Jy+PNlV6ynwA
         hjlAZV+gpqMrJ/EcFT7fsMfYmYk8AYGp3okw9ByozpQnnrM3Tf4t6NlvBem6/+ff24+e
         1j/an8davUpb9BFj7nSlJ+OaqKtIgtl6O9hyKeCvixZyEI7e/mtXC3aU90dUK4CLSo7X
         4hS1AhEFsQrifpU8N1kpdcHjeVze4637uv9nZoOytBm0j/ynBt3knjlTQQ1rTaNhxZGX
         Keyx39D+mfOGLAh6FweGTFK3go0e2kSCfneIEAcxn7oUNENnobBcgGkRfDTBBoxvm+YH
         3Zog==
X-Forwarded-Encrypted: i=1; AKwUvBzI4mxFkhLzEIOiosn9X8RfkTy/pAl7HNYz5pYSc28rHXTIaOmbxNFKK5KhY6c1XQ1VGRMODovrQOeeRnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkK4ZJEE5TvnaRBdRSxQO6MDXQbu4r+EJFT8NcoJvmc/eOI4a3
	AoM69fxrIE+pOVwEqpwDfqzwVqo+oV0A8EQGERwOxH1CHd3pF9Zk7ArMmYlB++J+HMDO0VymRfi
	YDvBBjUA=
X-Gm-Gg: AYBFou2g5nEyntw56hgMUX1sRv9nBaMqMFkuyZfFuUgjOM7ssBcN0QJZgO3r5NOrxHU
	V7WjNTiUyjcriA0sn7+gManHT2W1LWhSRZf8YeOO/hOgqiqRpg00CS4TDMZ0wi3hQAOFWOjxCFc
	sFoFAVnBDO5ubUi46w/hspCTWUx/0GnVfeg5lMVhnJzPwkPz5uLYCypc86+uluxVgcUfqTvDb5o
	NMseaCM6HJwgh7Ddkoh9gtKv0dr+DvgxX4N8jThjjgo3F3PuZFKqEAuDh8sd/SuRLRl1oeth9Bq
	XxWo7ACu4XecQ6g1zavcR/bd7/CnqxMQI90ReAWZJ9KKhp2G69OeLm5144PW0ZHvZM6YQQKHrlF
	GyAoyKqwcOBeY0UcXrnvNG/VJeVcRGFptWdW1TD7cBQ8qfVib04aXBoiOVH3zpaSV0nhFuSq4Bk
	ph3hXD7bxIfEktbs4/yQBnSveB9lQinjiZiWa5RTLptHmA/kPmC7O7L+2JkULbM0lrnGjYAkSdL
	GVJ4CvpNR9GRvEgkuirg4ERcJzsL23IzN+TC8h51227SaxdFuIW9NcNvCQi8WxCCxyCJTLa58Y7
	co0QNgHm9Vmq3NJrrdjKjf5VV5+bNcp2UGOpPaQwRSldP029kjZbjs2HCukSEGDUlWTbanA/C/F
	Govs=
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr37677955e9.15.1793359707695;
        Fri, 30 Oct 2026 04:28:27 -0700 (PDT)
Received: from airbuntu (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm44991995e9.4.2026.10.30.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:28:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:28:25 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261030112825.z7k57twgua27p2vu@airbuntu>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
 <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
 <d944d543-1756-43d8-aa08-bcbbf6df712f@layalina.io>
 <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75772ae5-d297-4894-971a-683f92fb87a4@arm.com>

On 10/30/26 10:50, Christian Loehle wrote:
> On 10/29/26 23:43, Qais Yousef wrote:
> > On 10/29/26 15:58, Christian Loehle wrote:
> > 
> >>> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> >>> index 76f3c84ca6846..84301fc49e699 100644
> >>> --- a/kernel/sched/idle.c
> >>> +++ b/kernel/sched/idle.c
> >>> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
> >>>        * lost_idle_time of clock_pelt
> >>>        */
> >>>       update_idle_rq_clock_pelt(rq);
> >>> +
> >>> +    /*
> >>> +     * Due to a race condition when enabling sched_uclamp_used static key,
> >>> +     * we can end up with imbalance where uclamp_rq_inc_id() has happened
> >>> +     * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> >>> +     * the static key flipped. The race condition is unlikely, but ensure
> >>> +     * the uclamp_rq() state is set properly on each entry to idle.
> >>> +     *
> >>> +     * The reset will cause the uclamp_max from uclamp_idle_value() to be
> >>> +     * lost. Since we are imbalanced, hard to know what is right. So just
> >>> +     * cleanup. This should be a transient error state once we recover
> >>> +     * everything should work as expected.
> >>> +     *
> >>> +     * We need to be careful of some paths that can force idle with tasks
> >>> +     * are still queued.
> >>> +     */
> >>> +    if (uclamp_is_used() &&
> >>> +        !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
> >>
> >> just checking nr_running isn't enough as CFS bandwidth throttling (a fun one
> >> recently!) will decrement it through dequeue_task_fair() without calling
> >> uclamp_rq_dec(), i.e. it's clamps must remain valid AFAICS.
> > 
> > I think this and the rt group throttling are false positives. Do they actually force idle or just under contention dequeue the task temporarily to allow other queued tasks to run?
> 
> It forces idle, I can reproduce active=1 and bucket->tasks=0 and the WARN_ON_ONCE triggers:
> 
> [  329.665099] WARNING: kernel/sched/core.c:1845 at uclamp_rq_dec_id+0x10c/0x1dc, CPU#5: systemd-journal/281
> [  329.679279] Modules linked in:
> [  329.682333] CPU: 5 UID: 0 PID: 281 Comm: systemd-journal Tainted: G S                   7.3.0-uclamp-cfs-repro-20261030 #2 PREEMPT_RT 
> [  329.694411] Tainted: [S]=CPU_OUT_OF_SPEC
> [  329.698323] Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Orion O6, BIOS 1.1.0-1 2025-12-25T02:55:53+00:00
> [  329.710222] pstate: 834000c9 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> [  329.717174] pc : uclamp_rq_dec_id+0x10c/0x1dc
> [  329.721524] lr : uclamp_rq_dec_id+0x98/0x1dc
> [  329.725786] sp : ffff800081bb3a80
> [  329.729089] x29: ffff800081bb3a90 x28: 0000000000000001 x27: ffffb54253580c40
> [  329.736219] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> [  329.743348] x23: 0000000000000000 x22: ffff000085462380 x21: ffff0001fb6e2c40
> [  329.750478] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000000
> [  329.757606] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  329.764736] x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
> [  329.771865] x11: 0000000000000000 x10: 006c616e72756f6a x9 : 0000000000000000
> [  329.778993] x8 : 006c616e72756f6a x7 : ffff000085462380 x6 : 0000000000000001
> [  329.786122] x5 : 00000000000000e1 x4 : ffff4abfa8162000 x3 : ffff0001fb6e2c40
> [  329.793251] x2 : 000000000000000c x1 : 0000000000000000 x0 : 0000000000000000
> [  329.800380] Call trace:
> [  329.802816]  uclamp_rq_dec_id+0x10c/0x1dc (P)
> [  329.807168]  dequeue_task+0x54/0x134
> [  329.810737]  __schedule+0x6b0/0x1018
> [  329.814307]  schedule+0x34/0xd4
> [  329.817440]  schedule_hrtimeout_range_clock+0x108/0x11c
> [  329.822657]  schedule_hrtimeout_range+0x14/0x20
> [  329.827179]  do_epoll_wait+0x47c/0x594
> [  329.830922]  do_compat_epoll_pwait.part.0+0x14/0xb4
> [  329.835792]  __arm64_sys_epoll_pwait+0x74/0x114
> [  329.840314]  invoke_syscall+0x54/0x108
> [  329.844055]  el0_svc_common.constprop.0+0xc0/0xe0
> [  329.848750]  do_el0_svc+0x1c/0x28
> [  329.852055]  el0_svc+0x38/0x250
> [  329.855189]  el0t_64_sync_handler+0xa0/0xe4
> [  329.859363]  el0t_64_sync+0x17c/0x180
> [  329.863018] ---[ end trace 0000000000000000 ]---

Okay, thanks for checking.

Peter/Vincent, what do you think? It seems we have a schrodenger task that is
both enqueued and dequeued simultaneously in these throttling paths. Shouldn't
this be fixed? If yes, any thoughts on the right approach? Should we throttle
if there are no other tasks on the rq too? I didn't realize the semantics are
that strong for enforcing the quota.
