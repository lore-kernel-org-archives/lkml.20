Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793112686;
	b=XVgvjew+eH46kFD4re32kHJ2rITUmVUyvhZqwmkVjpR8rOWdSGqTp6rLjJD0yf72NOm4
	 YgHeqxm1muFEL2U4T0R/XQN2G4TIzh37AVqBwZIOJR6G9RyHXG+3Uplbwl/9XthT3g161
	 ERQ2CWZ+0TP0CwLj4nAEqYLsHeEoYRSosrAxXmBAYR3BCtBiUlq4mITDK/67Qk7ivoSDh
	 vbS4VWKPmaEbiLWN8Tb3QZ9/kgi0DD90XDa3iGecDSuGFWbSMlwOqENA2P4Molp8TQ28U
	 YEiwOfR+tvTl5MmjFwG3IIMAJ/8jZowLShq4n2C1/Zjja33LersvQ4Fo5Kjf8L9UfnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q5eafELa+V5NFx6iTzvVAm3Sz+wK15BmvIlXPQ4Fwxk=;
	b=45a51u/9nwyJ9+M80mrWa/G46XkA+h+TC+xQcENM0d/kvCY1B35rUfuipQtG17ueXLYe
	 61voKD0N7G9a8YrwTeiaLz3VW2HLct3Pxz4Pxqpnipz5x3i8gppAsqwZUy4u9KqWlv3eR
	 kVYHloiM/aLLeBiLiGaYTMxmApS54lJQ/FcrtXECHVaFEDJt3LD0KJOQfEZcDz33kDaMf
	 ZV4YUXXJHECQGA5wAxiQ7MhZJ/lZRxMQ8VrEvBnl50NNYyxoVneFeJlQL8EHs2+Ux4wVj
	 fLqjB+95mfflDGdtvmbVOLQeKCN36Rz9lTrbuCClMHzY9B1m6Ru/QhCbThgDxajAZqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OM77Vlqe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OM77Vlqe
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9cf928dc9so5292855ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793112685; cv=none;
        d=google.com; s=arc-20260327;
        b=g14vQiV3aqCBqPOxwVXuLwMaOFufX1C/6dHjnWfY83VM+upcoqLqasIslL3kV7il9g
         /wgRBUtOXYAZNaytWk2Fhn5FpOHH/vFc0bB/gykCEQHnvZzm2P3uAQeSMDvo6w156ykp
         Aa1tN8S0uvuAhlFP/BxpdG386jQTRZIg/GQWYUfNHp1QLcyDp4+RA5wfPH2kgN0k169k
         SBiVxO/Rd+ARZbAxXyyBU4xaKksDz+gU3zdgAdjrJHAPxSw1gK2CJaBN5t54ramJSGH5
         WWCUbTPq7lXOV8mK+STLP5FHEdAjbaUPaHVhyxBcEdRgBcyqmhclgK1at8snp2CoHpB7
         u+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5eafELa+V5NFx6iTzvVAm3Sz+wK15BmvIlXPQ4Fwxk=;
        fh=DGVYpuSZ/s7Uok0INVXGe85PG1Y8mIF7oEou9CFkm78=;
        b=Jr4kVtX/xFF3om6rp2aoQ9+Cjwnk8l1V/pvj/VViE1ZQJCdiC6h2R4LzGdByk7WdcH
         8utt9813YdM/lPTpMxcWxASEDeWzOmteD4T2I9SJaw/mpJyYLwlb+XKQWNi5vQ4XW36a
         J2lHdaK4Lb9kwfPDlSRk9rZZJm3IRJpJuj19D9IhVI8UsmXIXBpn1ZkKKHIEoWLrjumz
         0bDqL/+KpMqq154yJRlMhUTEbTvkXohLA2bWt2ugJo02smyvTZxlDRtVEHsQkL26v3ze
         hwt08xuJOiFqCyGrturzmAk4lSr+WjbXDmaY1fGoAn2KwYEPW7CbKCEXwh6QHs5C6JqG
         MYwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793112685; x=1793717485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5eafELa+V5NFx6iTzvVAm3Sz+wK15BmvIlXPQ4Fwxk=;
        b=OM77VlqeaLDJbeHc1wTvMpQ5uJlGgx+UKCRieoIpT/RZGh6kjMcfwmK71tb17qUZos
         V3Kdwphtb8h9kvHVp34dV601tdOKDg+UkTBMA4WlgoL5Zh+S4zYmPbxDiex1dcWeipID
         efk0gVX1naCf31RADDYg1V99MOCzQ2s9DAIBjLNiI+wPUw41SWKfiMh9MLy7ThDCfalv
         4VMhH/mFew+YnDt0YHpzG8ik9GYcabJl0pCm3bZBIHhP8qxSD6zR4UvdNgFh11le7n1D
         CPwRkx1tGNSrZ5DQd7NkyqIojHsCWZlz/ZiELelsHuwcPjbhHAzrU05KTNWXHOxIAr5B
         aNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112685; x=1793717485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5eafELa+V5NFx6iTzvVAm3Sz+wK15BmvIlXPQ4Fwxk=;
        b=LndFHYFPyKINK05inRyq2KQO52621wnTmL3DPIPkjtiFkGpgUwBOTEIShz7QZIzBBX
         JNDVasi/bymSjrappNdjfdFs2XGkyqTRiImAwo7d+bpQhwnaluN+nUZgjtQWK9c3Y/Zi
         C35rUL3wxarbXfQfhhUG9DJBaUiZciJyDmav0DbLfq71cVwaoOKjURKZpM/2MO4jeSA3
         bbZuU0658QE2Xm8LnC6N0kNo0ufgnLf81U6qUAzSP0JX9+AG1scvW6D9XkL3jueoh8ju
         x/56hZrGVaPnXTUL0vvWqbleQuLxysRE9TFsbktalA0hYVQc2KYHgK22lZMgGpVmv7Qb
         PinA==
X-Forwarded-Encrypted: i=1; AKwUvBzgV/XVUbcQq6giaxmEwN5VO0hcXtqyLTh++2sx2LVo7do9lCh4J3j3HD1aWdmRUBdpQjOyk3eH+7ByMHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYNWGTjZzhlUUUo2s/hJIZTLhTQbbBU01tlTGh2UlDhFyQEDaG
	cC+zbTh8tL3mHtbRDtpQIvpdQNFWhxvy86j70b5p2UkAYrX4RH0+jJm0Lhay3YKcYuwvynA5Xc5
	FDNeLoSAK3/bbnATwyTC2syG5+WNJBED8ilSk3yTs
X-Gm-Gg: AYBFou0OHDvbVJpUufefCWeR0OMtEqpm6q2zJiWY1g/yc17QCCeXj9z62V7xg5CCe5G
	zAS2OJQRCZLAPkuC5kDbe56sSKBLAhizkoyYLVg8jv+bSy/NyUxApca5SexjuYnxhdorvm6ZTIq
	KLfaJR+hFDQjEe1GMKNU62/4tcB6RQnW09x8OTqhzh+v1m1ksTSoSMk6ppQv91lI4ZMBeh3u89C
	9v1/qmFy2aoQJnct4S8xXJ5rRXDjlYPK3aXPnUe51WLt+Rhm6dvY/Rc7C3nD9vvn+vYy8ZO8HCX
	033DhAGGgVTKDcsHDxC6lbwPeY/aJw/C1TN1m+lH7Fni5ZLuc2FzfyLqC78iyZmCaBfK5NaN17v
	9AzIV8L+UCsjO0WxKeVFGkXEoLiLi6Q2Bq3Tp8ev4FrnWv77qOze6EzBJqX3iIZj/0+1jS/c=
X-Received: by 2002:a17:902:d486:b0:2e5:1069:fc11 with SMTP id
 d9443c01a7336-2eae394f120mr17433805ad.1.1793112684688; Tue, 27 Oct 2026
 07:51:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204706.3112215-2-hramamurthy@google.com> <179306532408.3134.10931264635310564601@kernel.org>
In-Reply-To: <179306532408.3134.10931264635310564601@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 27 Oct 2026 22:51:13 +0800
X-Gm-Features: AclHuK9vxM65h254x3YFJdPadOGD3SBm7SMj5eLYuC8AhxOhfVDhb-RpEDerspY
Message-ID: <CAHwYsiqa2WWNHeSUij+g5fAFQJc_AXcKCA0sfCHU8isaJQ=+Qg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/4] gve: Fix race between stats query and queue reconfig
To: netdev-bot+sashiko@kernel.org
Cc: hramamurthy@google.com, netdev@vger.kernel.org, joshwash@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, jordanrhee@google.com, willemb@google.com, 
	przemyslaw.kitszel@intel.com, nktgrg@google.com, maolson@google.com, 
	jacob.e.keller@intel.com, pkaligineedi@google.com, yangchun@google.com, 
	patricion@google.com, awogbemila@google.com, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:42=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message describes the bug wrongly and the Fixes tag
>   points at the wrong commit.
> - [Low] Baseline decision: not valid for the final state of the series.
>
> Pre-existing issues:
> - [Low] Baseline decision: not valid for the final state of the series.
>
> --
>
> gve: Fix race between stats query and queue reconfig
>
> This commit adds a stats_lock spinlock to struct gve_priv. The lock is
> taken in the stats readers (ndo_get_stats64, the report stats worker and
> the per-queue qstats callbacks) and around the priv->tx/priv->rx updates
> in gve_queues_start() and gve_queues_mem_remove(). The qstats callbacks
> also return early when the queue arrays are NULL.
>
> > Fix a concurrency bug where network statistics queries race with queue
> > reconfiguration or interface teardown, causing a Use-After-Free (UAF) o=
r
> > NULL pointer dereference.
>
> [ ... ]
>
> > This issue was discovered and actually triggered by the
> > drivers/net/stats.py selftest. When an interface was brought down,
> > querying per-queue statistics via Netlink caused a kernel NULL pointer
> > dereference in gve_get_rx_queue_stats():
>
> [ ... ]
>
> > Fixes: 2e5e0932dff5 ("gve: add support for basic queue stats")
>
> [Severity: Medium]
> Is the crash in this trace a race?
>
> gve sets dev->queue_mgmt_ops, so netdev_need_ops_lock() returns true.
> netdev_nl_qstats_get_dumpit() takes the instance lock through
> netdev_get_by_index_lock_ops_compat() and
> for_each_netdev_lock_ops_compat_scoped(). The struct netdev_stat_ops
> comment in include/net/netdev_queues.h says:
>
>   Ops are called under the instance lock if netdev_need_ops_lock()
>   returns true, otherwise under rtnl_lock.
>
> Every caller of gve_queues_mem_remove() also holds the instance lock:
> gve_close() via ndo_stop, gve_adjust_config() via ethtool and XDP, and
> gve_handle_reset()/suspend/shutdown via netdev_lock(). So the qstats
> callbacks can't overlap with teardown.
>
> The trace looks like a NULL dereference that happens every time instead.
> netdev_nl_stats_by_netdev() sums the queues even when the device is down:
>
>         netdev_stat_queue_sum(netdev, 0, netdev->real_num_rx_queues, &rx_=
sum,
>                               0, netdev->real_num_tx_queues, &tx_sum);
>
> and gve_get_rx_queue_stats() then computed &priv->rx[idx] with priv->rx
> set to NULL. The new NULL check fixes that. The spinlock in the qstats
> callbacks makes no difference on this path.
>
> The lockless readers that do race with gve_queues_mem_remove() are:
>
>   gve_get_stats(): ndo_get_stats64, reached under RCU only from
>   /proc/net/dev via dev_seq_printf_stats()->dev_get_stats()
>
>   gve_handle_report_stats(): runs from gve_wq

This patch fixes both the consistent NULL dereference (as shown in the
trace) and the race between stats query and queue reconfig. The
spinlock in per-queue stats callbacks is just to make sure everyone
who reads priv->rx / priv->tx takes stats_lock. We will update the
wording in v4.
>
> The priv->rx check-then-use in gve_get_stats() dates back to
> f5cedc84a30d ("gve: Add transmit and receive support") from 2019, which
> predates 2e5e0932dff5.
>
> Should the Fixes tag point at the older commit? Stable trees without
> qstats won't otherwise pick up the ndo_get_stats64 use-after-free fix.
> Also, could the commit message keep the qstats NULL dereference separate
> from the ndo_get_stats64 and report stats race?

The Fixes tag will be updated to commit f5cedc84a30d in v4.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethern=
et/google/gve/gve.h
> > index b7ce6e8632db6..104468c2c07f8 100644
> > --- a/drivers/net/ethernet/google/gve/gve.h
> > +++ b/drivers/net/ethernet/google/gve/gve.h
> > @@ -957,6 +957,8 @@ struct gve_priv {
> >       struct workqueue_struct *gve_wq;
> >       struct work_struct service_task;
> >       struct work_struct stats_report_task;
> > +     /* Synchronizes stats accesses and queue teardown */
> > +     spinlock_t stats_lock;
>
> [Severity: Low]
> Does this lock cover every place that rewrites priv->rx[idx] in place?
> gve_rx_queue_stop() still copies the ring out and clears it without
> taking stats_lock:
>
> drivers/net/ethernet/google/gve/gve_main.c:gve_rx_queue_stop() {
>     ...
>         gve_per_q_mem =3D (struct gve_rx_ring *)per_q_mem;
>         *gve_per_q_mem =3D priv->rx[idx];
>         memset(&priv->rx[idx], 0, sizeof(priv->rx[idx]));
>         return 0;
> }
>
> gve_get_stats() (from /proc/net/dev under RCU) and
> gve_handle_report_stats() (from gve_wq) hold only stats_lock. During a
> single-queue restart they can read a partly zeroed ring, including the
> statss seqcount. The result is briefly torn or zeroed rx counters. It is
> not a use-after-free, because the priv->rx array is still allocated.
>
> The next patch in the series, "gve: Fix backward stats when interface
> goes down or configuration is adjusted", moves this copy and memset under
> spin_lock_bh(&priv->stats_lock).
>
> After that patch, two writes in gve_rx_queue_start() still happen without
> the lock: the struct copy priv->rx[idx] =3D *gve_per_q_mem and the
> abort-path memset. Both only replace zero counters with zero counters.
> The incoming ring is either freshly allocated (memset(rx, 0, sizeof(*rx))
> in gve_rx_alloc_ring_dqo()/gve_rx_alloc_ring_gqi()) or the old ring,
> whose counters gve_rx_queue_stop() zeroes. Readers would not see wrong
> values, but KCSAN could still report the race.

Patch 2 already moves gve_rx_queue_stop() writes under the lock. We
will add stats_lock to protect the two writes in gve_rx_queue_start(),
even though the readers would not see wrong values.
>
> >       unsigned long service_task_flags;
> >       unsigned long state_flags;
> >
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 2437cd8ba6331..26fdd22644f4d 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
>
> [ ... ]
>
> > @@ -2786,9 +2796,15 @@ static void gve_get_rx_queue_stats(struct net_de=
vice *dev, int idx,
> >                                  struct netdev_queue_stats_rx *rx_stats=
)
> >  {
> >       struct gve_priv *priv =3D netdev_priv(dev);
> > -     struct gve_rx_ring *rx =3D &priv->rx[idx];
> > +     struct gve_rx_ring *rx;
> >       unsigned int start;
> >
> > +     spin_lock_bh(&priv->stats_lock);
> > +     if (!priv->rx)
> > +             goto unlock;
> > +
> > +     rx =3D &priv->rx[idx];
> > +
>
> [ ... ]
>
> >  static void gve_get_tx_queue_stats(struct net_device *dev, int idx,
> >                                  struct netdev_queue_stats_tx *tx_stats=
)
> >  {
> >       struct gve_priv *priv =3D netdev_priv(dev);
> > -     struct gve_tx_ring *tx =3D &priv->tx[idx];
> > +     struct gve_tx_ring *tx;
> >       unsigned int start;
> >
> > +     spin_lock_bh(&priv->stats_lock);
> > +     if (!priv->tx)
> > +             goto unlock;
> > +
> > +     tx =3D &priv->tx[idx];
> > +
>
> [ ... ]
>
> > +
> > +unlock:
> > +     spin_unlock_bh(&priv->stats_lock);
> >  }
> >
> >  static void gve_get_base_stats(struct net_device *dev,
>
> [Severity: Low]
> This is a pre-existing issue and was not introduced by this patch. With
> the early returns above, device-level qstats now drop to zero after
> ifdown, because gve_get_base_stats() still hardcodes zeros:
>
> static void gve_get_base_stats(struct net_device *dev,
>                                struct netdev_queue_stats_rx *rx,
>                                struct netdev_queue_stats_tx *tx)
> {
>         rx->packets =3D 0;
>         rx->bytes =3D 0;
>         rx->alloc_fail =3D 0;
>
>         tx->packets =3D 0;
>         tx->bytes =3D 0;
> }
>
> Once gve_queues_mem_remove() sets priv->rx and priv->tx to NULL, the
> per-queue callbacks add nothing, so the totals equal the zero base. That
> goes against the get_base_stats contract in include/net/netdev_queues.h.
> It would also fail the "went backwards" check in check_down() in
> tools/testing/selftests/drivers/net/stats.py on this commit.
>
> The next patch in the series, "gve: Fix backward stats when interface
> goes down or configuration is adjusted", fixes this. It accumulates ring
> stats into base_net_stats and base_ring_err_stats under stats_lock in
> gve_queues_mem_remove() and gve_rx_queue_stop(), and gve_get_base_stats()
> then reports those accumulators.

This is fixed by patch 2 in this series.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023204706.3112215-1-hramamurthy%40google.com

Regards,
Pin-yen

---

pw-bot: cr
