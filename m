Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E234040D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826846; cv=none; b=bIvHU6sX1JcbNf4yhw1nJEhEFJyg3oX6UrO/IWIng2FY89m48xRfgIQcjfJYHOR7Zli9AxpozKwy5gE1c5sOnCkEO3/vPHHr7ACJHP4fkgYv8nEdq6MqAMrVbm47Nkm2eIjOrtU1iphnmEI+kXQ2IQOPJaVLRQ7ARetiZVZlbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826846; c=relaxed/simple;
	bh=9+skbwrxcJCBRlg0/7hSGm9foocrdhKeVNcd46aQwMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+JpVu27hBxcnjmsF5fUT79ZnW0mEMVCrvYNeifUdvFihhNuI3HP9IOrf6cRC/M4k8d4TYzp7K20tG6if79Ea9SsH0pMJaIH5zAMSuKMiFRiegpZNBVpsgRSFScj180jGAsphXboeLSYC1+/MNiV2gaO5+pIV4b43pb1hiKrz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WglMZKqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WglMZKqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A7F1F000FF;
	Sat, 19 Sep 2026 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789826842;
	bh=dHZPYU1n/pry3T1H0H1S4ueK+mIKCRtCK2SDlI5Ics8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WglMZKqEzYE6stPatzAphNFE6KCLXKcjpHNogBaSzdRNVtiFbIrrySpwPQ9OGlPHE
	 Lq0QFUK0itwMK8IPpZGJcPR0W6wAbScOoYNcKw9/1EsOemT1RJlNHPX3drV3PyKAGi
	 /OLQ7T6E8eZ5D/PJsYYrmNZxYBNqHQk27ORuv5nZzQwpSPgG4xR9icJi+uns/unIiA
	 NWWxO+ex80ar51BX7qEjLSPy+XG0LnGrCRcrDQWP5MbwoCpDRZnxKyLT+ndAlJwe9l
	 zL+ZBuynJ8SG1MV5raYPj4Iyqo4TpjBoP+Dypm6vPQsAO+y6K32P5XEoXga0PjK+xK
	 bwnVkncxYCpbw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F413AF40066;
	Sat, 19 Sep 2026 10:07:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 19 Sep 2026 10:07:22 -0400
X-ME-Sender: <xms:GZeuapLMfCcjaMozPHpupKvcA9gRk8haJr2scvDxCmnjws8DFAAy9w>
    <xme:GZeual20NbHb2jo4UsL-J9D_qAu4IfPugyOwfxYKYDxlq8DU_C_4rnHFDE_WQWtuL
    we_66I-0Rx0NwwxigfBrhqkQmolc2LHDqza12ytf00PCBBOQ01BpfE>
X-ME-Received: <xmr:GZeuav4tWue5q3ZthVodNHaGN7NL_0kNDAVOAIRibn3xTDtfxRfmv6yeQVbC>
X-ME-Proxy-Cause: dmFkZTEPNfrm1MgcYgcWCYk27v6YNDQEGqREQaTeDxZAYmQzf6vlXDSlTLwYek80GMRwf0
    p+ynnNACZ/uRu42TRJvh9tSl6gGHvyuRvJO98sOouSxFMuqpoliQtBngx9bwnnMHZKRrnW
    azgIKr/kG6jH3a5IrRqojziNGyHYdoGpH+qzqusTcro3ISLSB+mX3XZEpXv7XH5GBA9aeD
    InJPdMpKxVoV05Ewam7ZqCO5sAHKipbGW68F/XN5ssqvZy5Vjj+kvmHZ10Crmp7avj2X3X
    wPeW6dt4L1W+IqhjOsdOH/ly69fS484VvlGFQGjEaTLmp9Q8w4DSlwKNF0Owku2WGpBgsJ
    W5tp2NpeV5em5YPFcJ+VKNzCl1sRVlNGNO9ygkG2OruZ+LX1ZzEZ4wzMeyHVg/dsjEJTZa
    VUEiU4e5YVbhCQBqIwDfZ9kqIrYlHo4jfk+FgHcnfoUAOkOT1KRbR+HE8DXeYasyv5mb8e
    IsVihTV+XwiXI2iYTiRRAv69l4Y6xerJbXoge9ToOjxsNiYBDKp3Aus5uX3wfnrU63MiP0
    KZ6mlrf/yg13M/fF4SfhxqZ+ZTrn3bpR/Vx7cE7Ennj0/+iVwswbbo4jviBwjNu1SDtJcV
    +06nKWlqPkE8Sfd+tm/lgw7hRu6QME1oFriSwHFyeWAleDiNFXIz7ulqB8dg
X-ME-Proxy: <xmx:GZeuau8oLYMkY6cf0JpX1a-GOZ8II4zY68YS9LdbP36IGd6Ts8phug>
    <xmx:GZeuamWDL98VqLtOAiKxB82fyITbpIPq1bq68KVIdQjdzqfeDUjuVA>
    <xmx:GZeuahqrzPwTnNEcm1lUa83vnpMtbOW270Rn8NBBl-uCbdU1Wq5Npw>
    <xmx:GZeuagn0YmDXqN3_uNPTT2iSn9-gyDk8mwdmBLPwLcEoOVihPQswTw>
    <xmx:GZeuap0blyzN85Mt9MYpUBbvSGtaX6QR8chkGuhnRUDlbKp1rUBVR-C5>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 10:07:21 -0400 (EDT)
Date: Sat, 19 Sep 2026 15:07:19 +0100
From: Boqun Feng <boqun@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH 1/7] rcu: Make call_rcu() safe to call from any context
Message-ID: <aq6XFyrR3OiSvKl9@MacBook-0RXW5>
References: <2a742578-120a-421d-9305-5de0b22bda33@paulmck-laptop>
 <20260919003258.3134343-1-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919003258.3134343-1-paulmck@kernel.org>

On Fri, Sep 18, 2026 at 05:32:52PM -0700, Paul E. McKenney wrote:
> From: Puranjay Mohan <puranjay@kernel.org>
> 

Hi,

Sorry for a bit late repsonse.

> RCU's per-CPU callback list is only touched with interrupts disabled: the
> enqueue runs under local_irq_save() (and the nocb locks when offloaded),
> as do callback invocation and grace-period work.  A call_rcu() that
> arrives with interrupts already disabled, whether from an NMI or from
> instrumentation that re-enters RCU, can interrupt one of those and corrupt
> the list or deadlock.
> 
> Defer instead: stage the callback on a per-CPU llist and raise an irq_work
> that re-issues it once interrupts are on, straight to the enqueue so it
> cannot defer again.  The gate is bare irqs_disabled(), so callers that
> merely hold interrupts off are deferred too and pay one irq_work hop.
> Skip it while the scheduler is down (RCU_SCHEDULER_INACTIVE): irq_work is
> not usable that early, rcu_init() already calls call_rcu(), and the per-CPU
> deferral state is not initialised until rcu_init_one() runs later in it.
> 
> rcu_barrier() drains every CPU's ->defer_head before it scans the lists,
> and rcutree_migrate_callbacks() drains an outgoing CPU's.  A drain
> re-issues onto the draining CPU, so a barrier moves other CPUs' staged
> callbacks onto
> its own ->cblist; call_rcu() promises no CPU affinity for invocation.
> ->defer_lock is held across llist_del_all() and the whole re-issue so the
> drainers
> serialize: one that finds the list empty can conclude that everything
> staged before it is already on a callback list.  Interrupts stay off for
> the batch.  Where the arch has an irq_work self-IPI that is what one
> interrupts-disabled region could stage, normally a single callback; where
> arch_irq_work_has_interrupt() is false the drain waits for the tick, so
> several regions can accumulate first.
> 
> The drain clears ->next before re-issuing.  A double call_rcu() on a head
> that is already debug-object-active self-links the staged node, and
> rcu_do_enqueue()'s duplicate path returns without clearing it, so the
> drain would spin.  A re-add behind other staged callbacks makes a longer
> cycle, which that does not bound; a double call_rcu() stays undefined.
> llist_del_all() yields newest-first, so a batch is re-issued in reverse
> call order; nothing depends on call_rcu() ordering.  The re-issue drops
> the lazy hint, since staging records only ->func, so a deferred callback
> loses its batching on CONFIG_RCU_LAZY.  kasan_record_aux_stack() moves to

I'm not sure this is a good idea, because it effectively remove LAZY
support when DEFER is enabled. Since the goal of this patchset supports
BPF and NMI, would it be nicer that we skip the whole defer logic if the
callback is LAZY? Alternatively, you can have two llist (one for hurry
and one for lazy).

Thoughts?

Regards,
Boqun

> __call_rcu_common() so a use-after-free report names the caller rather
> than the irq_work.
> 
> The re-issue runs with interrupts disabled, so instrumentation on the
> enqueue path can re-enter call_rcu(), stage another callback and re-raise
> the irq_work, livelocking the drain.  A per-CPU flag guards it: a deferral
> that arrives while this CPU is draining, and is not from an NMI, is
> dropped.  The WARN_ONCE() is under CONFIG_PROVE_RCU, so a production kernel
> drops it silently.  That leaks the callback and can strand state
> the caller tied to it, since a one-shot flag only the callback clears
> never resets, but the alternative is an unbounded loop.
> 
> A callback deferred past the CPUHP_AP_SMPCFD_DYING irq_work flush leaves
> ->defer_work claimed with its self-IPI lost.  rcutree_migrate_callbacks()
> still re-issues the callback, but the first deferral after that CPU comes
> back raises no IPI and waits for the next irq_work there, or for
> rcu_barrier().  Unqueueing an irq_work is not something the API offers.
> 
> The irq_work is IRQ_WORK_INIT_HARD so the re-issue stays prompt on
> PREEMPT_RT, where a non-HARD irq_work runs in a kthread that can be
> delayed under load.  A hidden CONFIG_RCU_DEFER gates the deferral code and
> its IRQ_WORK dependency, though the rcu_data members are unconditional;
> without it call_rcu() enqueues directly as before.  Under
> CONFIG_PROVE_RCU, warn if the direct path is reached from an NMI.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> ---
[...]
