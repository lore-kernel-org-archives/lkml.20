Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF63D0C1D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581471; cv=pass; b=nd5ORiBTyuBdlL98jdW5qy/mVKo0ek4Nw086wrs/+Tq/T5rc45yWTJmr/Ub6IvbrC4kwqCsso7wG1h9cUh9nB8nvDnUFvkVl66Gms7/nIBbrotO8Ye6ShckqybD/b6vih1Ng9knKOlid34Xs6dLRIBZHfS63zRWo2TY+iGAd7s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581471; c=relaxed/simple;
	bh=1xhAE6ezmRxUA6TJk9sZqOg8TgkDXQBqjMLtprDj8YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxExZTM14xLVxwMJ3UH/uu6Iwvkf/FAOU2HMdYuJzz8c25FEDAjTyAqmVoTIdRYVDjRWzBbpFavUBiDEvVVJ+VhYXo8bJk2s1lUoVnGmwHgwjf8QFFCsC9XPexr9aslqFTux2zorOk3IAfbkHWYhdfSowop5M8DfFqXZO7AgUMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3ZtgxD/; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3ZtgxD/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so18164f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789581463; cv=none;
        d=google.com; s=arc-20260327;
        b=MRtwQ/f7UuY7mhx00XVn6p4SNX4H18qVdBtAdMDdxTF90DWusaJKBLSz0NsEq5/tOJ
         cchtHQdn6IonEySOt7LHPCPAeVj0EEhOMzZdUrCHHhrvLeyx/jAqN+V+YpWfqnvfcSmu
         iNxQwvonuejhAGHM6iNXozm4uFhDQ85ylHWzoP1yMFr3I1hymiZglzUG5R6ihBq3He2t
         xOfOY5KhYyZOsUGWNT9xQg/0MBEQf9MymI09YEv4WAN3nITC/y/D5JtpQYr+GRpfaZq5
         MF6M/AF5aDhdeyomU5jphFlrWD3nSenXm/Oqst+V2t7W/twADieYPWnuUgyHJKzIT7bE
         Y6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piUp6O5lAl2RX9l2AlFEQ020z6l8Avom06WyPaBHokg=;
        fh=Wm8BjuruJZY2PF4vkgsQYF41A2XDiQoHK9ROyuUp7Ro=;
        b=dXmopR49P2uT4iWkno5/qYLS5TL+KMciokMsi0fPRwH/KQoi1uKM6MZeSffes5+ryJ
         LDn0nNoJ5ufq3jBbdSqPgOZbTlaMWO04IQkaWk1VDsg4YgUSzzNuRqetBbkneL0eHzZV
         3UO00CAteCu77APOAVowe/V770p15FujVnshP0PsethyZeC5BfveE0j8JfS1sZVaXw35
         yW4LRoNwDbWYk8o6SMqYZX6wcRFoHQgrk2yHMSjQYwInQzuRz2UKcCYZ0Ln2U+empz1s
         ZpaB337bgUVI3CE3rkx+5OWhJlP/QG4GLAVhlmwfZgw/zrTP+yGD9w+WG2qbN2Gm+nL8
         eD5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789581463; x=1790186263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piUp6O5lAl2RX9l2AlFEQ020z6l8Avom06WyPaBHokg=;
        b=Z3ZtgxD/XQt2G3SgO/eCYBjfaOtOvnSWWAbqVvhss/l/NJiyUln9+RyB62v8p7jqcY
         iGwq3W2ughUWXQTph/xGI/rIYlKgKKOlbD5fHAswPapXNdq5Sq1D3g4cmzyjhPXkkWsA
         WAhcGZ5pIoW8IYyBwCUypgR7U747zXnFwJHZlhufWoW7TMh1bAErFYQ8M15vpxGPfuC2
         9PibIunuPmPjq/C0vpNC/tFmHlwBW/t20w6qWj812/z8ACZDRReY2xZvtxaxJpj/4hi5
         TVIkSZmJHx0pEz4Frgw1FyjtTDtly073357ZT3/KV5YeZFUbeLmfrTcGAzqKLx7rP/Di
         p2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581463; x=1790186263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piUp6O5lAl2RX9l2AlFEQ020z6l8Avom06WyPaBHokg=;
        b=jtEp/E7Noh7VzcZK7NhOHUvsW1Z8/xPqw7m14udzMivux517FQBLzG0/+5vn32SS/P
         1eCOv8aLWovv4xxDUG5izqtFziD8y+UjqscUkD9G5zdT1V0VsMcfxIS9HmfQ8JSoVgmw
         EJupyFJBgBC6KnndTCYUpET90JMC6NKHsDd6N05xoL149SZogaXRPUSSBY5sw8UuE/D2
         ar+VbVKZS8Av1+YPw76yuZNAKUlZF4NEk+G3YQyFvx/DhyJuLZkH036pnonIPpZCxofL
         8frUavTRGJWG35+6Tb9ncWG16dE+y+KaZ4YxBpwwNgZnOlJ1dnmWa7GA4v/BqQVie394
         kHwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQxxifRvQ/IB53cXFX2lF7duXWw49BP8q63yB+eGMK+mLsAF1nkDhzYkCVJDiobldKUdAa9QZBANootHo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMWe0fd7ddpGSp0ukVWopoThaw9TPF1qGiqaxql5gHPve2hCJv
	bBOYToE1f2ZWUVQPv8MVH7fzXp43OTFVwhofyB8ET9VJBggDpu22mwsSK7bTCJMI/F098v0UBgS
	WEvwbx8110x0QlHjEPFgCcdCG1y7FGA3tRNTURIk=
X-Gm-Gg: AYBFou2FX1u7s1Eu8JdiDLJw2T5KDOgbkvqew6Wk82m126bRuy7lWvCDQYULgzHRJL3
	usgVfhHp2cF57KWIgO4F2qjXiDiT85MNs2djvYc5Bi/8SZDmd+ZeoK+H8gXLJapmHQf5UbNa3Al
	kOW6WVyAfrQhl+KUHE8Of48kmBy6bCqJdaCBuBXcga1WqExVO+T4HdqRiE0pyKoHtrDBH6NWTr8
	1vwLZ6Kj2vNUhituOvVfYJUB1xgAtUsOthL74gNXJPRf18hddOWalodl/1SDRBShXWUUiFM6Twe
	pOS+n9QQunl2oPOZ5h/wiEgwJakSJQdnLUKcxyP3pZhicYBqPpIEm+TiTk1LheTn7uRYLnl3L1o
	JQVRPzxjjZ0WhE2d1vRWm0bdWThYBeZBFKjF0VND/NkmIUzcFHFJA/rpczIwilQoo7Ro3nJvaPX
	CsShwG8Z1dn78=
X-Received: by 2002:a05:6000:490d:b0:487:af3:836 with SMTP id
 ffacd0b85a97d-4870d16ea7amr4152204f8f.45.1789581462784; Wed, 16 Sep 2026
 10:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826062901.2137-1-kprateek.nayak@amd.com> <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
In-Reply-To: <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Sep 2026 10:57:30 -0700
X-Gm-Features: AcwNN1VKxzdpcAWsFBXJU1r7CGsDP8gABk_Vjc4rknbvxqTtlKL5mMs3796CxFg
Message-ID: <CANDhNCoVzHqS627Vv55E==VsJfnDMwvEnvYMxBt5Euu8PRUP3Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16][PoC] sched/core: Alternate approach to
 sleeping-owner handling in PROXY_EXEC
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:22=E2=80=AFPM John Stultz <jstultz@google.com> w=
rote:
> The series definitely looks interesting, and it seems to be holding up
> ok in testing.  Though figuring out how to refactor them so that they

Well, I did hit the following last night during stress testing:

[11176.672951] WARNING: kernel/sched/sched.h:1645 at
sched_change_begin+0x1b6/0x2b0, CPU#14: torture_shuffle/433
[11176.676650] CPU: 14 UID: 0 PID: 433 Comm: torture_shuffle Not
tainted 7.2.0-rc4-00032-gf14e36dcc837-dirty #138 PREEMPT(full)
[11176.680917] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.17.0-debian-1.17.0-1 04/01/2014
[11176.684794] RIP: 0010:sched_change_begin+0x1b6/0x2b0
[11176.686748] Code: c9 1e 48 89 03 80 7b 1c 00 0f 85 ca 00 00 00 80
7b 1d 00 0f 85 91 00 00 00 48 89 d8 5b 5d 41 5c 41 5d 41 5e e9 1b 63
23 01 90 <0f> 0b 90 41 f6 c5 08 0f 85 c7 fe ff ff 48 89 ef 41 83 cd 08
e8 b1
[11176.693913] RSP: 0018:ffffc900010b3e10 EFLAGS: 00010046
[11176.695962] RAX: 0000000000000000 RBX: ffff8881b9198020 RCX: 00000000000=
00001
[11176.698747] RDX: 0000000000000001 RSI: ffffffff82c8b519 RDI: ffffffff82c=
ad7fe
[11176.701554] RBP: ffff8881b91abdc0 R08: 0000000000000001 R09: 00000000d19=
ffe29
[11176.704561] R10: 000000000000000e R11: ffff88810264cff0 R12: ffff8881066=
94400
[11176.707423] R13: 0000000000000002 R14: 0000000000000000 R15: ffffc900000=
17d58
[11176.710161] FS:  0000000000000000(0000) GS:ffff88823563e000(0000)
knlGS:0000000000000000
[11176.713196] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11176.715628] CR2: 0000000000000000 CR3: 00000001072a7006 CR4: 00000000003=
70ef0
[11176.718462] Call Trace:
[11176.719460]  <TASK>
[11176.720319]  __set_cpus_allowed_ptr_locked+0x146/0x1f0
[11176.722343]  ? __pfx_torture_shuffle+0x10/0x10
[11176.724063]  __set_cpus_allowed_ptr+0x64/0xa0
[11176.725913]  set_cpus_allowed_ptr+0x3a/0x60
[11176.727513]  torture_shuffle+0x12b/0x230
[11176.729014]  kthread+0x103/0x130
[11176.730304]  ? __pfx_kthread+0x10/0x10
[11176.731758]  ret_from_fork+0x27c/0x340
[11176.733220]  ? __pfx_kthread+0x10/0x10
[11176.734680]  ret_from_fork_asm+0x1a/0x30
[11176.736366]  </TASK>

Followed shortly after by:
[11663.223681] kernel BUG at kernel/sched/rt.c:1020!
[11663.226093] Oops: invalid opcode: 0000 [#1] SMP NOPTI
[11663.228669] CPU: 46 UID: 0 PID: 0 Comm: swapper/46 Tainted: G
 W           7.2.0-rc4-00032-gf14e36dcc837-dirty #138 PREEMPT(full)
[11663.234796] Tainted: [W]=3DWARN
[11663.236392] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.17.0-debian-1.17.0-1 04/01/2014
[11663.241196] RIP: 0010:dequeue_rt_stack+0x2ad/0x2c0
[11663.243652] Code: 83 a8 fe ff ff 39 c1 0f 8e 47 ff ff ff 90 0f 0b
90 e9 b7 fd ff ff 90 0f 0b 90 e9 e8 fd ff ff f3 48 0f bc d0 e9 80 fe
ff ff 90 <0f> 0b 48 8d 3d 1a 79 dc 01 67 48 0f b9 3a e9 e9 fe ff ff 90
90 90
[11663.253981] RSP: 0018:ffffc90000c10dd8 EFLAGS: 00010046
[11663.256630] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88810ad=
50080
[11663.260225] RDX: ffff888235e3e000 RSI: 0000000000000000 RDI: ffff88810ad=
501c0
[11663.263862] RBP: ffff8881b99abdc0 R08: 0000000000000000 R09: ffffffff83b=
9a280
[11663.266876] R10: 000000000000002e R11: 0000000000000000 R12: ffff8881b99=
abdc0
[11663.269626] R13: ffff88810ad501c0 R14: 0000000000000000 R15: 00000000000=
00025
[11663.272412] FS:  0000000000000000(0000) GS:ffff888235e3e000(0000)
knlGS:0000000000000000
[11663.276347] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11663.279185] CR2: 00007f03955d60ac CR3: 00000001072a7006 CR4: 00000000003=
70ef0
[11663.282698] Call Trace:
[11663.284061]  <IRQ>
[11663.285116]  enqueue_task_rt+0x77/0x3f0
[11663.287276]  enqueue_task+0x1cf/0x330
[11663.289121]  proxy_activate_blocked_task+0x498/0x640
[11663.291579]  ttwu_do_activate+0x287/0x290
[11663.293582]  sched_ttwu_pending+0x10b/0x220
[11663.295726]  __flush_smp_call_function_queue+0x1f8/0x680
[11663.298320]  __sysvec_call_function_single+0x35/0x180
[11663.300877]  sysvec_call_function_single+0x8a/0xb0
[11663.303287]  </IRQ>
[11663.304376]  <TASK>
[11663.305467]  asm_sysvec_call_function_single+0x1a/0x20
[11663.307994] RIP: 0010:pv_native_safe_halt+0xf/0x20


The only change I made to your tree was passing the rf into
proxy_activate_blocked_task, to use rq_(un)lock() instead of
raw_spin_rq_(un)lock().

thanks
-john
