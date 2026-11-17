Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921859;
	b=l4RMwYaONRmJXkAvAeeTpH9rnG8vTCNIlVvWLe7SOHIzj8QcgSc72EXnYDUFpQnNyaVi
	 LwIBc8LyT74BEymheOifhNqqHxrfRSeQ5xEQJsuS7g/j2HaHH6l4JSHUe0x3YUJaysZM/
	 Mq71ipnvcdyy0w03ASfPd77eRzlxwqiwE1RjvnvSbbQiOlk71OPtqQkHPGqCcT7oWnnQS
	 omYdiE8Doy1fA0cYTUbfBPc7I74o8lbKFuNu2FI6DQXUwHwBTXcsjsxli0y+fenwmKBDm
	 oQB1CpOX6DvY6NWZggredQ0eUUlhqxAXsrivD93rOfeT+RrrYoBLsTMBRoBDjUtDm2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921859;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LCW9KCj8fXCtRdp+cQ/OpKbfijxh9Ai6M8Fp+nr/O58=;
	b=JmaSRd8r5717qCnURW5M8TmDmIlJ7FejiTAfsqI9Xkcey8H3Y0SzZ5hUKK1dXO3eZ2JV
	 m0ph2FL7pF38yqYoCGHTSllruRHqizXh+kCo/IuRfx3Z4+HBKPsn4k0/ldwLdhn1XUojx
	 jc509clnkWTXLju8hnQmK/KiMAuOZncOH7OblCdhw1x8vS00AsaIb0UvadmcUr9qJBM4o
	 0DkHf3jzXJEN/vsg+L6XD6NtvJeTpLUEckCVtJw66pLZ3BjOMzaS5kU1QRsr/9ODIrJTy
	 VipZF+fYKhJN6YnVhF7Wue6XnWIrOwbKt89MjWtQWoG5kmd1VUiroX52MtRRgeBNAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKVloJE6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C0606A31C;
	Tue, 17 Nov 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKVloJE6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D761F000C4;
	Tue, 17 Nov 2026 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921859;
	bh=LCW9KCj8fXCtRdp+cQ/OpKbfijxh9Ai6M8Fp+nr/O58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eKVloJE6u12n3aW8MpErcfxIgJZ+c118D0+J7pFUz9pLCKa7kNo1+KK33oMfyFjhI
	 58Mxa3LN/wEw8mF9Np1tWR+oPyaJVQKaKf0qd9WJXXoAKMuEsrCkKpsRt+wcyazt/F
	 bzpKH4tipZErfR9p0SJXTh+243c61Rhr7pxLiHKTXP5f7TcV3SjMgD0CHJC/TkXdwk
	 0qoaB5ENFlvLvMWWnj/eDde+1DMwQYU+SBdLg9PkwD+QqTZbAx+mFUf/z/smkka/jU
	 XsAFNE36XjqUK2WteIRQ2XmZzCBdIwsVHs+jGJwxXvZ8XD8PDKVa3yNIuSvrOD3rVk
	 oUHWvBGeLS/rQ==
Subject: Re: [PATCH net-next v13] net: reduce ARFS flow updates by checking
 LLC affinity
From: netdev-bot+sashiko@kernel.org
To: nashuiliang@gmail.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, sdf.kernel@gmail.com, daniel@iogearbox.net,
 kuniyu@google.com, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 13:24:18 +0000
Message-ID: <179492185829.3136.8645050662806185449@kernel.org>
In-Reply-To: <20261113125643.2255-1-nashuiliang@gmail.com>
References: <20261113125643.2255-1-nashuiliang@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] With net.core.arfs_llc_affinity enabled, the new early `goto
  out` in set_rps_cpu() (net/core/dev.c:5301-5305) can skip…
- [Low] Commit message / documentation completeness (baseline: not
  confirmed as a defect).

--

net: reduce ARFS flow updates by checking LLC affinity

This patch adds a default-off sysctl, net.core.arfs_llc_affinity. When it
is enabled, set_rps_cpu() does not call ndo_rx_flow_steer() if the flow's
previous RFS target CPU and the new one share an LLC. The per-queue
rflow->cpu is still updated, so software RFS keeps following the
application.

> diff --git a/Documentation/networking/scaling.rst b/Documentation/networking/scaling.rst
> index 6c9836000a8d1..d85fe7a9e9bfb 100644
> --- a/Documentation/networking/scaling.rst
> +++ b/Documentation/networking/scaling.rst
> @@ -468,6 +468,15 @@ of CPU to queues is automatically deduced from the IRQ affinities
>  configured for each receive queue by the driver, so no additional
>  configuration should be necessary.
>  
> +When the flow's previous target CPU and the new target CPU share the
> +last level cache (LLC), the hardware steering update can be skipped,
> +since the application's cache locality is preserved either way. This
> +reduces contention on driver-internal locks when application threads
> +migrate frequently between CPUs sharing an LLC. The functionality
> +remains disabled until explicitly enabled through::
> +
> +  /proc/sys/net/core/arfs_llc_affinity
> +

[Severity: Low]

This isn't a bug, but the text gives the condition only as the previous
and new target CPU sharing the LLC. The code in set_rps_cpu() has two more
requirements: old_cpu must be online, and rflow->filter must not be
RPS_NO_FILTER.

Could the documentation mention these? It could also say that after a
skip, packets keep arriving on the old queue and are RPS-forwarded to the
application CPU.

[ ... ]

> diff --git a/net/core/dev.c b/net/core/dev.c
> index a230ecce9327d..15a5c7caaf8e8 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c

[ ... ]

> @@ -5274,7 +5278,7 @@ static bool rps_flow_is_active(struct rps_dev_flow *rflow,
>  
>  static struct rps_dev_flow *
>  set_rps_cpu(struct net_device *dev, struct sk_buff *skb,
> -	    struct rps_dev_flow *rflow, u16 next_cpu, u32 hash)
> +	    struct rps_dev_flow *rflow, u16 old_cpu, u16 next_cpu, u32 hash)
>  {
>  	if (next_cpu < nr_cpu_ids) {
>  		u32 head;
> @@ -5293,6 +5297,13 @@ set_rps_cpu(struct net_device *dev, struct sk_buff *skb,
>  		if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
>  		    !(dev->features & NETIF_F_NTUPLE))
>  			goto out;
> +
> +		if (static_branch_unlikely(&arfs_llc_affinity) &&
> +		    old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
> +		    cpus_share_cache(old_cpu, next_cpu) &&
> +		    READ_ONCE(rflow->filter) != RPS_NO_FILTER)
> +			goto out;
> +

[Severity: Medium]

Can this skip ndo_rx_flow_steer() even when the NIC is not delivering the
flow anywhere near next_cpu?

old_cpu is tcpu from get_rps_cpu(), which is rflow->cpu, the last software
RFS target. That is not necessarily the CPU that services the queue the
hardware filter delivers to.

The rflow->filter != RPS_NO_FILTER test is also not checked against
rflow->hash or rps_flow_is_active(). The existing tmp_rflow check further
down in set_rps_cpu() does both.

set_rps_cpu() writes rflow->cpu on every exit, including the paths where
no hardware steering happened:

    q_tag_ptr = READ_ONCE(rxqueue->rps_flow_table);
    if (!q_tag_ptr)
        goto out;
    ...
        if (hash != READ_ONCE(tmp_rflow->hash) ||
            next_cpu == tmp_cpu)
            goto out;
    ...
    rc = dev->netdev_ops->ndo_rx_flow_steer(dev, skb,
                                            rxq_index, flow_id);
    if (rc < 0)
        goto out;
    ...
out:
    ...
    WRITE_ONCE(rflow->cpu, next_cpu);

On those paths rflow is still the arrival queue's entry. Its filter keeps
the old filter id, but its cpu moves to the new CPU. For example,
mlx5e_rx_flow_steer() can return -ENOMEM, -EPERM or -EPROTONOSUPPORT.

Consider this sequence:

1. Flow F has filter f steering it to queue Q near LLC-A. Q's entry is
   {filter = f, cpu = cA}.

2. The application moves to cB in LLC-B. cpus_share_cache(cA, cB) is
   false, so steering towards rmap(cB) is attempted, but it fails on one
   of the paths above. Q's entry becomes {filter = f, cpu = cB}, while
   the NIC still delivers F to Q.

3. The application moves to cB' in LLC-B. cpus_share_cache(cB, cB') is
   true and filter == f, so steering is skipped.

4. get_rps_cpu() only calls set_rps_cpu() when rflow->cpu != next_cpu, so
   every later move inside LLC-B is skipped as well.

After that, would every packet be RPS-forwarded from Q's CPU in LLC-A to
the application in LLC-B, with the hardware filter never retried? Before
this patch, each migration retried steering. A retry could succeed once
the colliding filter had expired or memory was available again.

The filter id can also be stale or belong to another flow:

- RPS_NO_FILTER is only written at table allocation and when
  old_rflow->filter == rc.
- rps_may_expire_flow() only reports expiry to the driver. Nothing clears
  rflow->filter after the driver deletes the rule.
- A colliding flow's filter in the same rfs_slot() would also pass this
  check.

Changing IRQ affinity also changes the queue-to-CPU mapping without
touching rflow->cpu.

This seems to conflict with the claim in the commit message and
scaling.rst that "cache locality for the application is preserved either
way".

Would it make sense to also require READ_ONCE(rflow->hash) == hash and an
activity check? Another option is to compare next_cpu with the CPU that
services the arrival queue (skb_get_rx_queue(skb)), or with
smp_processor_id(), instead of rflow->cpu.

>  		rxq_index = cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
>  		if (rxq_index == skb_get_rx_queue(skb))
>  			goto out;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113125643.2255-1-nashuiliang%40gmail.com
