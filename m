Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453239;
	b=iWvnFeztwGfMxcrokQ7ATgCnnf/UYsAFO++H/fdDGdYXaYrt+ZEi/pNi5UNaHDWRxZsm
	 y+LegebVZJZKAUmKf1DcwFZURdyHntRKBG1Pu69IcaX8MTVacCW/hJg/sQ663gy8paoCo
	 X9viKYE/KyNhA4G3yaIgQXFyUZi6P/tV6PaS8qzU1hM5yAuI2KW8HfPXHZsRBZHW7fdHF
	 ej+y/B7J0i/qZDpz5ikaxAYuvT1r4CaYYrGvPTFk6nlf7FIHS59kuf6o2Y1vRsgolpJIq
	 KEblCACkZOJ5+POHTe6vufUsGN/njfDARKECq1tx50mtxh6oumPjKW7IAduxENbr8Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453239;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cJE4Qd0aWDx6ISxVK9dIk9/aXK/tsToYLAWDqfOlosw=;
	b=DCdinKPcBw8J6UWhG86k9nxFpPwDZWG1n1eGTZXP4BveBfnL6p9b2iezjIQEhRDgziyv
	 qOmGrvLjM2ORI7LLwDDpsbQyaGjztZ2X+tsrcAfnafZtjSLjJCAHjntNdbzXMcQ5hhugz
	 MWekZ0iUbAwik8Ccu1CJMbhBr2wAUXr+cLReCx4i/MUdgoUxL0TDT2oMlyYHXOSMi7rFt
	 kSHFD6QGiNA01HXa3w/Ch1KUgyece4Gf53gIGnZucuw4JyFiphzPM3HCS+jECHznsrDBh
	 bWjOi3YUuMxPZ/5WPhVmfiY0/82DdX4/Qlw5Zv1B4ZLWtAl2AP9vyfh/jhZ/DMMj6Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfSDoPl8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5669606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfSDoPl8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4C21F000C4;
	Mon, 19 Oct 2026 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792453239;
	bh=cJE4Qd0aWDx6ISxVK9dIk9/aXK/tsToYLAWDqfOlosw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XfSDoPl8OrogpTGTm48nflmKwXCVStmIXlEyiwTF4Cpi+fRs6FhmR2i0QguELPaKt
	 kJ8Rm1go/r2UKqjq47J4XuuHfcWd/VVxmU2TWm/2QwKMiP5B6qlXWu1EhPl18IXizL
	 igzJVI2vvKqZhu3JHRky1amXgFRYkTNYxngNZqIOAXxfoyZ10mzYI2shPYanDx7JeA
	 AlORKIY1H/B4Y0FlCFXYfE/0gYWU33/w90tcDR533/q+m3Q6HdK39XME5TZgey4ZlQ
	 34Kobwh3NZysAD1shOSYTXFOCEKZMbiwb1vwCYvh4YPTWVqv7DloXkd3F4GnqbyUZm
	 kF2XWGcfxN9NA==
Date: Mon, 19 Oct 2026 13:40:38 -1000
Message-ID: <cb60b6a0f8f35957d64c9abf240c2dbd@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC v6.1 2/3] workqueue: Add support for real-time workers
In-Reply-To: <9bb46cf4-7982-463b-8289-06bbc319bba9@igalia.com>
References: <20261001160711.59888-3-tvrtko.ursulin@igalia.com>
 <20261001184848.61776-1-tvrtko.ursulin@igalia.com>
 <3a139a32135c149f51bac4f2bd58ad56@kernel.org>
 <9bb46cf4-7982-463b-8289-06bbc319bba9@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Tvrtko.

On Mon, Oct 19, 2026 at 11:02:08AM +0100, Tvrtko Ursulin wrote:
> > apply_workqueue_attrs() is unrestricted, so a caller can hand a WQ_RT wq the
> > attrs from alloc_workqueue_attrs() and turn it into a normal non-strict wq
> > while the flag stays set. Maybe apply_wqattrs_prepare() should force prio
> > and affinity for WQ_RT instead of restricting only the sysfs side?
>
> I am not entirely sure about this one. It could be done in
> apply_wqattrs_prepare(), but it would end up redundant on the sysfs
> path. Because currently there are two paths:
...
> Am I missing something?

The missing one is apply_workqueue_attrs() called directly with attrs from
alloc_workqueue_attrs(), which is what padata_setup_cpumasks() does for
its own wq. Forcing prio and affinity in apply_wqattrs_prepare() covers
all the paths in one place. Being redundant on the sysfs path is fine.

> > alloc_ordered_workqueue() with WQ_RT passes this and ends up with a single
> > pool spanning all CPUs because ordered wqs use dfl_pwq everywhere, while the
> > doc and sysfs say strict per-CPU. Should __WQ_ORDERED be rejected too? The
> > nested ifs can also be a single condition.
>
> Not sure - Tejun what is your guidance here? Is this purely an
> implementation challenge because conceptually it should work, no?

Yeah, the priority part would work. It's just that an ordered wq has a
single pwq for all CPUs, so the per-CPU affinity can't apply. Let's reject
__WQ_ORDERED for now and allow it when there's a user.

> P.S. The nested ifs could be a single condition but I wanted to mimic
> the existing style so it looks nicer:
...
> I can change if desired.

Your call. A single condition would read fine too.

> > The three stores check WQ_RT and return -EINVAL while nice goes read-only
> > through is_visible below. Can all four go through
> > wq_sysfs_unbound_group_visible() returning 0444 for WQ_RT? That drops the
> > three store checks.
...
> Could do that if it would be acceptable for root to be still able to
> write to them - Tejun?

Root can't write to them. sysfs sets KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK, so
kernfs_fop_open() fails a write open of a file without a write bit even
with CAP_DAC_OVERRIDE. Can you make nice, affinity_scope and
affinity_strict read-only through is_visible? cpumask can stay writable
as narrowing where the RT workers run doesn't break anything.

> > Can we keep printing nice for non-RT pools? prio=120 is the internal
> > encoding, sysfs and the pool dumps print nice, and the example output in
> > workqueue.rst would go stale. prog['RT_PRIORITY'] would match the rest of
> > the file too.
>
> We probably could if we wanted to. Tejun?
>
> Complication would be having to hardcode some priority conversion
> helpers into the script.

Yeah, let's keep nice. It's just prio - DEFAULT_PRIO and hardcoding 120 in
the script is fine.

> > One more thing which isn't in the diff. The rescuer of a WQ_RT |
> > WQ_MEM_RECLAIM wq, which is what panthor-drm-rt is, still runs at nice -20,
> > so under memory pressure the RT wq's work items run as CFS. Should
> > rescuer_thread() use sched_set_fifo_low() for WQ_RT?
>
> I did not think we should care much about latency when under severe
> memory pressure. It should be enough to guarantee forward progress and
> the latency restores back to normal once memory pressure stabilises.

Agreed.

Thanks.

--
tejun
