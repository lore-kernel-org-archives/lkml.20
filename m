Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687E2F30
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949926; cv=pass; b=h8lhedNw5hXEXLBlP7USL9CjYZ/4lHzK7V6dJHhgJnpUr/JcjmzkPRtPO07fJyI27mn1jlwUP8DomXkXIRvQo4zK+RN6xAzFEw2ffrmzbOeD9H8xAGaDBC/zTY0LKw3CWSbPZWAk1rah0Pg2RrnhyF36F3LpOcXceuTxj5rwxVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949926; c=relaxed/simple;
	bh=K4eV73nhExrMmVJJwg4JvXGOZWeE5bY1ZR0VT+YyaiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6vpJG38DWOnro9JmHzAlnyFS6GTMaK/xYICm+weZoQCmP3dAxUNo1WPE0jNvtHFFEtRpVW/weDiZMMq8F8HcRVoHUoAcMgD5jr2Rh/EVMx3NU+TCAaUIm/5SRt55DLqxLWisXyGEkPB6OCw9kP3QhobOvhpssSfldaIXOKLIXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRREvpLH; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRREvpLH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so348041a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791949924; cv=none;
        d=google.com; s=arc-20260327;
        b=FdTEfljWU+vj1B+QLKRNF8cx2Iog3Tr4LsEBMOiO/UP46DnJNfeoZyH3/0Y0029Jwq
         5Tcu2YpKvXfoxPGTWPrDvX4Eorr+8jeF6CcrPJNnTCcjVJIRCiYmwkYBXg7MysJ4qa/f
         eEMC3WJF632ry4fZ4xwh0NrTWj+5uMR2Rzt0jQK0y3nUHWWwCdpyBf562IGL6ARCX/7n
         19CP+MvPludbt0P9/F9VZ+1k6GbB6f5lcu1Q9u6r9JijDYv4ZvZhpiVVE+uNwt6tKZ2k
         zo9UB+Qo+6zYFsijkxsJWV9wtZge1mifDIoP7y91BxqjexOkfIwJt7PuiRNha/ySJ2GO
         fYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4Gi0hXu1XV7WfEP9MnFSR4Oym8KhfEpdqdt31DK2+0=;
        fh=2WG4Wm4bfwb4olH/viCmaATKdihVJ0C1w67NOWORItY=;
        b=WvyzpWHW9Oqu/BqMVf5zf6wJqMiNYucMHpPBFIXdkg4EnyZK4Tu0J5pWw/pTU1EkmR
         gm/CmVSFjvkJ4gMAHREJjGB6Cim19Md8Q+ktWdYUfJ8uqbPUd2/ZjhRDgW7NZ1g/FYE9
         X7Y5rBHeDsjqh5/dquVjtR2ntXb+mnOKeoJv1RfVHv7Wby9mI50yoxYHgvuzeDrcLMpD
         eAVqykc8T0ggJFuUDC7qEO8SnETuzd7T2uiGfTf1P8vOTwKWauW+1dakTxJH5IrNBrP2
         8oK0VQGapTSk+fgYdcITLWId6GEBooOTVDsYL1wvy6oppxjM2kriwVadBJAtVVUqqYeC
         VWhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791949924; x=1792554724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4Gi0hXu1XV7WfEP9MnFSR4Oym8KhfEpdqdt31DK2+0=;
        b=fRREvpLHgCCSws+4SJdQD1HAVJH9w6gpvAw5fbtx26p6JnV39hUHd6pDgflVk9A8cH
         Mgc4HKGhl6Eo7Qm8o+ST4IHj0eLY+2XXKqvu9e2E/gw8ptOqwWewJI7k9eIjwsMzB3T3
         LU8JwbsflSgwZLW3ghCdxmTSEDpOtYxaNX4h++lA/7js+D8aUCu4gRs1TdOMVfu+S3Qz
         XvgWpPYjj2WyQb4SYtlYizwfC2rIsqJfPvX1jWR/XLFEwGnHsQLPPP49hWRUqd55Ev0T
         jsMjQmHhHyJuIQOzIzM4jtpEAv9kk97/qSIcg3HQT/bQFtxyHq7MHmuvErduDPEJSEJD
         gJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791949924; x=1792554724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4Gi0hXu1XV7WfEP9MnFSR4Oym8KhfEpdqdt31DK2+0=;
        b=l3jywlcvoAuisgno10d7dj/9coIJs0AHuWr0jeZWMP5oTDB5/FavulWrdAzm4sQoHi
         nDVnChntXsyeLgoC82xa29uBjrAs+W8e6rOujfFWyMdtrK9bzs+AaWsO91Qnw55uG5Fp
         9x9+F+c17aaO/x7gk6JppYhOHAZjYF37BG389BTm03ketaDriK6r45kP2AfLz5BAuMM8
         ArpwmryrVlBRxdsWOfAU/gPczXlkTnMpzoUMBpf58wST6i7Cyuq9HT62ES/SvwdrGg4C
         bmLi9Owdj2qdWacvbAkiaZRwi1yKRPZDLcA37johLocT7ZRB7IsOc64bmY/2kzv59i3s
         btpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWUtL1koqMV09Nvvm07AI3tuLA+sHZ76tgpR5I9T/Und8Syz3LW+ZmXNrRFJjcokEcL2O3mvhkX0tarGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIerJkVkghgTfut9bkCBSnO/UYmkJdAm1QEF75gFJfEsLpAG0Lz
	ShQggMLwbXvUz3pwVJ4fdv40XXvXKT0MmzcGhYZhJotjeDylEGm6QxPGfGGhz7DVboeHuccmYN5
	endfDoxjvn9dysKTMCCn8Qa37Z8nCG3U=
X-Gm-Gg: AYBFou0RLWOPEr30W1QtwnonR38+TODdNzkqb/s9mMDVEjvSte3WjRg6yfYkRmyJO6T
	e7msHQFK6ZDgHFcAcQZGP5dquFoRaWcip7N+7HceMMV5CCd8jyKKgKovcjzAY0QyvhwulVaWUAG
	zyzTuoWM1UjDr5+hG1m/5/S82h1zeLLi2GGUyGfAsIdIrwOpljVG8h5cmcCy7ZebC2nlutNf3Dd
	8QEP/HP6mz4U/VMVKFIAYwHKwfKHhfeWbQBH70wjZUxvH8QercWfXEJJbDMGeFLOc/24+IVo9l4
	f9yV552zsPVUgJoaumbNB0adzV6ypb+o4D+pj5SqQ+hoIoAXpgWWGA==
X-Received: by 2002:a17:90b:3d82:b0:3aa:fc22:8aad with SMTP id
 98e67ed59e1d1-3ab3ac8b5f3mr11797841a91.54.1791949923816; Tue, 13 Oct 2026
 20:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012060152.2930-1-nashuiliang@gmail.com> <179187482010.434549.10175777615206996282@kernel.org>
In-Reply-To: <179187482010.434549.10175777615206996282@kernel.org>
From: chuang <nashuiliang@gmail.com>
Date: Wed, 14 Oct 2026 11:51:52 +0800
X-Gm-Features: AclHuK-QigaFQyr4oN-K-5Hzymz0M8K4GrOu_t49thFofV7F32nSKX735pog8Gk
Message-ID: <CACueBy747kN0Lj+ZW7o43wTKCQJwj8Ycnbzz4HbxOUpH7+ZGvw@mail.gmail.com>
Subject: Re: [PATCH net-next v11] net: reduce ARFS flow updates by checking
 LLC affinity
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, sdf.kernel@gmail.com, 
	liuhangbin@gmail.com, skhawaja@google.com, ncardwell@google.com, 
	roman.gushchin@linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:00=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 4
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new LLC skip in set_rps_cpu() (net/core/dev.c:5196-5199)
>   assumes that `old_cpu` shows where the NIC currently delivers the flow.
> - [Low] The new user-visible sysctl net.core.arfs_llc_affinity
>   (net/core/sysctl_net_core.c:563-569) has no documentation.
> - [Low] The config guards for the sysctl and its only user do not match.
> - [Low] The commit message says the results "demonstrate that filtering
>   updates by LLC affinity significantly reduces driver lock contention=E2=
=80=A6
> - [Low] In this tree, cpus_share_cache() (kernel/sched/core.c:4008-4014)
>   returns `per_cpu(sd_llc_id, a) =3D=3D per_cpu(sd_llc_id, b)`.
>
> --
>
> net: reduce ARFS flow updates by checking LLC affinity
>
> This commit adds an opt-in sysctl, net.core.arfs_llc_affinity. When it is
> set, set_rps_cpu() skips the ARFS hardware steering update
> (ndo_rx_flow_steer) if the flow's previous RFS CPU and the new one share
> an LLC. The rflow->cpu bookkeeping is still updated, so software RFS keep=
s
> steering packets to the CPU the application runs on.
>
> > These results demonstrate that filtering updates by LLC affinity
> > significantly reduces driver lock contention and improves overall
> > CPU efficiency under heavy network load.
>
> [Severity: Low]
>
> Does the data above support this claim? The only number given is the
> mlx5e_rx_flow_steer() call rate, which drops from about 200k/s to about
> 10/s. There are no throughput, latency, CPU utilisation or lock
> contention numbers.
>
> The commit message also leaves out the trade-off. When the hardware
> update is skipped, the flow stays on its old queue. get_rps_cpu() then
> hands every packet to next_cpu with a remote enqueue_to_backlog() plus an
> RPS IPI. After a completed ARFS steer, the packet would instead be
> handled on the queue's own IRQ CPU.
>
> The phrase "subsequent packets take the fast path in get_rps_cpu()
> (tcpu =3D=3D next_cpu)" could be read as local processing. The packets ar=
e
> still moved to a remote CPU.
>
> The opening paragraph names rps_record_sock_flow() as the motivation.
> Since v10, though, the patch only changes set_rps_cpu() and get_rps_cpu()=
.
> Could that paragraph be reworded to match?

Ok, I will rewrite the commit message.

The dominant cost in our brpc workload is the spinlock traffic inside
ndo_rx_flow_steer(): with threads migrating constantly, the old path
repeatedly paid a steering update and its arfs_lock acquisition, while
the packets themselves still took the software RFS path with an IPI.
For migrations within the same LLC, this change keeps only the IPI and
no longer touches the driver lock.

> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index a6951ea08961e..434ad5499906d 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
>
> [ ... ]
>
> > @@ -5179,6 +5180,24 @@ set_rps_cpu(struct net_device *dev, struct sk_bu=
ff *skb,
> >               if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
> >                   !(dev->features & NETIF_F_NTUPLE))
> >                       goto out;
> > +
> > +             /*
> > +              * ARFS LLC Affinity Feature:
> > +              * Reduce ARFS flow updates by checking LLC affinity.
> > +              *
> > +              * Frequent flow table updates can trigger constant hardw=
are steering
> > +              * reconfigurations (e.g., ndo_rx_flow_steer), leading to=
 significant
> > +              * contention on driver internal locks (like mlx5's arfs_=
lock).
> > +              *
> > +              * Skip the expensive hardware steering update if the flo=
w's previous
> > +              * target CPU and the new one share the last level cache:=
 cache locality
> > +              * for the application is preserved either way.
> > +              */
> > +             if (static_branch_unlikely(&arfs_llc_affinity) &&
> > +                 old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
> > +                     cpus_share_cache(old_cpu, next_cpu))
> > +                     goto out;
>
> [Severity: Medium]
>
> Is old_cpu a reliable sign of where the NIC currently delivers this flow?
>
> get_rps_cpu() passes in tcpu =3D rflow->cpu. That value is read from the
> hashed slot in the flow table of the queue the packet arrived on. It only
> records the last software RFS target for that slot, and it may have no
> hardware filter behind it. For example:
>
> - ndo_rx_flow_steer() returned rc < 0, but set_rps_cpu() still did
>   WRITE_ONCE(rflow->cpu, next_cpu) on the arrival queue's slot.
>   mlx5e_rx_flow_steer() can return -EPROTONOSUPPORT, -ENOMEM, or -EPERM
>   while MLX5E_ARFS_STATE_ENABLED is clear.
>
> - The tmp_rflow collision check or the !q_tag_ptr check took goto out.
>
> - The slot still holds a CPU left by an earlier flow that hashed to the
>   same rfs_slot(). store_rps_dev_flow_table_cnt() sets RPS_NO_CPU only
>   when the table is allocated.
>
> - The driver flushed or re-created its filters.
>
> In each of these cases, if old_cpu and next_cpu share an LLC, the new
> check skips ndo_rx_flow_steer() and then reaches:
>
>         WRITE_ONCE(rflow->cpu, next_cpu);
>
> On later packets tcpu =3D=3D next_cpu, so get_rps_cpu() never calls
> set_rps_cpu() again. Hardware steering is not retried while the
> application stays within that LLC. A new flow that lands on a stale slot
> in the same LLC would never get an ARFS filter at all.
>
> Before this patch, every CPU change triggered a new steering attempt, so
> a failed or missing filter recovered on its own.
>
> Without a filter, the flow stays on its RSS queue, which may be serviced
> in another LLC or NUMA node. Every packet is then handed over by software
> RFS. cpu_rmap_update() ranks queues by sibling, package and NUMA node,
> not by LLC. Nothing guarantees an LLC relationship between the receiving
> queue and old_cpu. Doesn't that contradict "cache locality for the
> application is preserved either way"?
>
> Could the skip be limited to the case where this flow has a live
> hardware filter, for example rflow->filter !=3D RPS_NO_FILTER &&
> rflow->hash =3D=3D hash? Another option would be to compare next_cpu with
> the CPU that actually services the receiving queue, rather than with
> rflow->cpu.

I understand the concern, but I would prefer not to add the
rflow->filter/rflow->hash conditions to the skip, for these reasons:

- old_cpu is snapshotted from rflow->cpu by get_rps_cpu() and passed
  into set_rps_cpu() as a parameter.  set_rps_cpu() deliberately does
  not re-read rflow->cpu: the slot is shared between flows hashing to
  the same rfs_slot() and can be updated concurrently, so the
  parameter carries exactly the value that made get_rps_cpu() decide
  that this update was needed.

- get_rps_cpu() has already validated the flow identity against the
  global rps_sock_flow_table before entering this path (the
  (ident ^ hash) & ~rps_cpu_mask check), so next_cpu is known to be
  the CPU recorded for this flow.

- The LLC comparison is intentionally a coarse-grained decision: does
  this CPU change cross an LLC boundary or not.  The fine-grained
  per-flow consistency is already handled further down in
  set_rps_cpu() by the existing checks on the target queue's flow
  entry:

        if (READ_ONCE(tmp_rflow->filter) !=3D RPS_NO_FILTER) {
                if (rps_flow_is_active(tmp_rflow,
                                       rps_tag_to_log(q_tag_ptr),
                                       tmp_cpu)) {
                        if (hash !=3D READ_ONCE(tmp_rflow->hash) ||
                            next_cpu =3D=3D tmp_cpu)
                                goto out;
                }
        }

  which skips the steering when the target slot is owned by another
  active flow, or already records next_cpu.

- Adding two more conditions to this check makes the path more
  complex.

If this trade-off turns out to matter in practice, restricting the
skip to flows with a live filter remains a small follow-up change.

> [Severity: Low]
>
> Can cpus_share_cache() return true here for CPUs in different LLCs? In
> this tree it is:
>
> kernel/sched/core.c:cpus_share_cache() {
>         if (this_cpu =3D=3D that_cpu)
>                 return true;
>
>         return per_cpu(sd_llc_id, this_cpu) =3D=3D per_cpu(sd_llc_id, tha=
t_cpu);
> }
>
> sd_llc_id defaults to -1. It is assigned only in build_sched_domains()
> and reset to -1 by __sched_domains_free_llc_id().
>
> sched_cpu_deactivate() calls sched_domains_free_llc_id(cpu) while the CPU
> is still in cpu_online_mask. CPUs outside any sched domain, such as
> isolcpus=3Ddomain CPUs, keep -1 permanently.
>
> The new check guards old_cpu only with cpu_online(), and next_cpu only
> with nr_cpu_ids. If both CPUs carry the -1 sentinel, they compare as
> sharing an LLC and ndo_rx_flow_steer() is skipped. That could happen when
> an application migrates between two isolated CPUs in different LLCs, or
> during a hotplug window.
>
> The sentinel handling belongs to the scheduler, but should this new
> networking user guard against it?

The sentinel semantics belong to the scheduler.

> > +
> >               rxq_index =3D cpu_rmap_lookup_index(dev->rx_cpu_rmap, nex=
t_cpu);
> >               if (rxq_index =3D=3D skb_get_rx_queue(skb))
> >                       goto out;
>
> [ ... ]
>
> > diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> > index 473c162736d69..9ce0bbe454c83 100644
> > --- a/net/core/sysctl_net_core.c
> > +++ b/net/core/sysctl_net_core.c
> > @@ -560,6 +560,13 @@ static struct ctl_table net_core_table[] =3D {
> >               .mode           =3D 0644,
> >               .proc_handler   =3D rps_sock_flow_sysctl
> >       },
> > +     {
> > +             .procname       =3D "arfs_llc_affinity",
> > +             .data           =3D &arfs_llc_affinity.key,
> > +             .maxlen         =3D sizeof(arfs_llc_affinity.key),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_do_static_key
> > +     },
> >  #endif
>
> [Severity: Low]
>
> Should this entry, and the arfs_llc_affinity definition in
> net/core/dev.c, be under CONFIG_RFS_ACCEL instead of CONFIG_RPS?
>
> The only reader, static_branch_unlikely(&arfs_llc_affinity) in
> set_rps_cpu(), sits inside #ifdef CONFIG_RFS_ACCEL. RFS_ACCEL can be
> turned off on its own ("depends on RPS" in net/Kconfig).
>
> On CONFIG_RPS=3Dy, CONFIG_RFS_ACCEL=3Dn kernels,
> /proc/sys/net/core/arfs_llc_affinity is still registered and accepts
> writes that flip the key, but nothing changes.

Ok, I will move the sysctl entry under CONFIG_RFS_ACCEL so the knob
matches its only user.

> [Severity: Low]
>
> This isn't a bug, but net.core.arfs_llc_affinity isn't documented in
> Documentation/admin-guide/sysctl/net.rst. That file covers other
> net.core knobs, such as rps_default_mask and high_order_alloc_disable.
>
> The Accelerated RFS section of Documentation/networking/scaling.rst also
> still says:
>
>   The network stack automatically calls this function every time a flow
>   entry in rps_dev_flow_table is updated.
>
> With the knob enabled, set_rps_cpu() now updates rflow->cpu and
> rflow->last_qtail without calling ndo_rx_flow_steer() whenever the two
> CPUs share an LLC.
>
> Could the documentation describe the new knob, its default (0) and
> accepted values, and this exception in scaling.rst?

I'd like to wait for feedback from other reviewers on the knob itself
before writing the documentation, in case the interface or naming
changes as a result of the discussion.

>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261012060152.2930-1-nashuiliang%40gmail.com
--=20
pw-bot: cr
