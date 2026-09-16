Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEED367F3A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520911; cv=pass; b=a5srrXDyizIJ1EXskpi1uUdXfMbTpEgQgtiG9y5f96RJkKLSjLnNvKl75tRjAsE84LIGoWPv64VFr+psXd5tF4gBj/dK+iIZed66bbQlvc7rRMRVrNpSFaMfuTQ+Ir37Z+cJmWxdKwAflx51qYWv6g3DVxRRMyVir+2RsNQXx84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520911; c=relaxed/simple;
	bh=pYo5MUiipoah5pkoRlLFbEKe/6tGvitC23nJ9bG1J2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYll9kbWjMR2MuibFcKEG7wDfxOOrv64mrqAlbs3ObT4yNXwb6Feqy5F7+dRNY9pcARrQDiAkObSHGddl8ih1Y9SbH7m+dkTwQ9Gw8M7OMcoey0v5GTCT/9bDR4wx2UMGExvm6F6/K0VJ80lktrpAj7OgWMtxyrY9GIPpijg9cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=huBJ9YWO; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="huBJ9YWO"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ec395so2670301cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789520908; cv=none;
        d=google.com; s=arc-20260327;
        b=cLMCb/VmRHKNKqwF9wVbUmDXXQoyV34tBmwz1Tn5YEvlIYe7G6whJAYfG60XLSGE8E
         L3QhD7wnZ17DKJuEsUc1dtyGoOBHHDL0N/QIAzBhSNijt4QFAyUCMHVXwjGgWnXUIW9K
         WXIaKz0f0/whzAXh+YloGeno6HB+nYINQWXhuelnDJdxjWvouRwSawonDn5fnaN/cdeU
         1yrWOhhBOxEMK4TdnfCWW9UnlKzrh6PFupS0jmzLFCdVvhiov7rgU7X1F6+32b8JDI4l
         Bg9U+N2ERIy45vlv+wLGfQoRlKA3AwV+GcoPaSzQTT7sJTpvoWV4Eg1vvKRSapJPo8gW
         Vtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m4M7zdARfug31UnKWM8isw4Yko/JdRnQ8MlH/mLSlpE=;
        fh=JemQk2F/3yD3MXUcRyReWnAFbXyQUuSJB/0hJ1CXKWA=;
        b=Q3ix8vPonT3cexS9wn08e/3f60wr01wwRVErhz/D4ujejD1DLmanqQ5R0sD293Zmyj
         RJL4FrEQ2T5MDm+/LYYFfHLRsUfBwGTMdJT2vcJQEJx1eRW+XXvwOpi52+2QAK4Ez/gb
         ycgMtUg1R71KN+T6LUUZNCwF9QciWU4Oj/hQRR80B7eKVuOLu0LCIFslAxeI/KZpWsWo
         j5nR6kRUgB2UL2Ewf+ohJTJ/A5syEsG/U2Oqmr1GdeFJ7PJlnG0VhgTRi+fwVLfdg5Eq
         zgs343jDi4dyr+QW9KtCU6FlZhkDcNFXuN3Z+qFlBAeuDY0+0JUfuvdxWAIQYSz4NQzh
         GXKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789520908; x=1790125708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4M7zdARfug31UnKWM8isw4Yko/JdRnQ8MlH/mLSlpE=;
        b=huBJ9YWOZyLIvvB2XHhfBqBuSIGuFmSoCfeBvAwxij27xMNfqKvJaiEbp4Rj+5Aix3
         TqeJ7uiU0FXhrSACkd5hsUroXcwhwDD+lhj9x0VztuO3Zrb4+UmWQm0Fl8wU2EjxjIfW
         RfBqygBBXg5cjeIiwBRw/yVwPPggoy1Ly2Ak2FPM60UPJ6EcYPaQodhjjPmax72ywRB1
         1+0okRc8RM8EuWfEdu6HLX/7pZEBAyihGFzKkRTFQquv+VghGy0aMnQp43eytfJe00w9
         2xMriilQ2mtHBa3F7oW6W6vyq4mkuf6ngsNBn2+JQ1YMN6r8DNVMhghGQjImokNm/01m
         JGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520908; x=1790125708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4M7zdARfug31UnKWM8isw4Yko/JdRnQ8MlH/mLSlpE=;
        b=ah6luFWiiFaULu35e1hjfIbL2+xqPqI3Gws46zfmwNkEKJznukzpq/bNBewtRx+c5d
         Nf0u0C0m1lA6xbGwjQ+KT7/xfWEIYRiVlaf787dUd4BRdWsU1j9asxpxD/PBSCcwlTSF
         omjRahvOGm6WS1QO5+pZtUmfzu+FTPHSz5n6Gxd728jx5LmVHAt01+WfyWxIhDTyaxHa
         1d5kwKHt39wWYdSFds1cJ4myZCsZSPqC1mVaEeXfU9DvtXcKoF+daY4W5IbanlaX4Aha
         msNxkTRpfLFRt7nRdMspG5i8iMg4wdmV2POWz6UmoYF3jCFuUUt694hVSG4fm+wi75Db
         KNgw==
X-Forwarded-Encrypted: i=1; AKwUvBxyx5W3jIJ2cXHXmm0iOSzrvlRiGaIcAp2yefuGPkCpVk2tV83QzWlefeC8wdSi4z6wE5bi2qT9BqxwZRw=@vger.kernel.org
X-Gm-Message-State: AFuF++npNAA12uP5gOLxg17agVwQ7mvOcYisPO0OFSgNLiXHhH0PEriV
	yoelwf+vIZJWa1P9inTBVuzwGHQoSHf5oVoYNlPgbR2F8bQ0nA4l97jJZ7pd1ANxhUZ84rys5TM
	T+N+khb39x18OfH14Tmy7FgKcGKpqL34ldtmmPFHz
X-Gm-Gg: AYBFou2+pClNox+lOGnMNeBiUjj/axl81GDDUSdhS8oK560MsylEGM5X6spJi9g5ls+
	BzS0XUyQtfBjRyvz9B5kZjUZEE+akQtrasVzbe4t3xDu9rE/FRdThYJlCXwfqhKLgnlIXtgso/s
	i2rGAWXd05/c+zbnP7m63L1JC5zO5S+XB6ptvA5L/WNKgbLLjUi6DalHsQPsIP2x5JReLijZR/5
	o8sEfwc7Adk/07/TnCnjcbxULMC1gm9105d74opV6r9axBV6xWfAzu02DGH9ZNVwZZVhwuWzndF
	sZBAKqpl3JyfbYXEuWAi/eTSbpRtAMANKNuupRuWoQFwNAAy5iRKNFXRjFMsRkyTpz+vKdT/03a
	7QvlabKfRnCJhQHzwm1ACgSjDUrRHKlFoH95LuZdhFGalJWKtdq1K86YBGedtETPDLFVyz2eelb
	iJNlrqyxTyiSVfxVHw38d9JTUoBfHD6EM=
X-Received: by 2002:a05:622a:1bab:b0:530:f8f6:4ded with SMTP id
 d75a77b69052e-5327f1af971mr13191081cf.56.1789520907636; Tue, 15 Sep 2026
 18:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916003430.3612956-1-kris.pan@intel.com>
In-Reply-To: <20260916003430.3612956-1-kris.pan@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Sep 2026 18:08:16 -0700
X-Gm-Features: AcwNN1UzQ2BdrLaFeTdyBBCSkdOGFrCNh9JYc1_EEFM8OStgTATLsBN7ecxDyDQ
Message-ID: <CANn89iJLvByHKcsjcNnCRjCE153TttYJfgmungFKWNhruwZD9w@mail.gmail.com>
Subject: Re: [PATCH net v3] net: iterate online nodes in skb_defer_free_flush()
To: Kris Pan <kris.pan@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	atomasov@redhat.com, oliver.sang@intel.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:37=E2=80=AFPM Kris Pan <kris.pan@intel.com> wrote=
:
>
> skb_attempt_defer_free() only queues skbs on the current CPU's node
> (numa_node_id() of a running CPU), which is always online, so the
> flush loop never needs to visit nodes that are merely possible.
>
> for_each_node() walks node_possible_map.  On machines where the
> possible map is much larger than the online map -- e.g. a POWER10
> LPAR with 32 possible but 1 online node -- the flush loop touches 31
> cold, always-empty per-node lists on every softirq pass.
>
> Use for_each_online_node() to iterate only node_online_map.
>
> Since the flush now skips offline nodes, also drain the per-node
> lists in dev_cpu_dead().  A skb is queued on the alloc CPU's list at
> the freeing CPU's node index; if that node is offlined before the
> alloc CPU flushes, the skb is stranded.  Likewise, skbs queued on a
> CPU that later goes offline are never freed, since its softirq no
> longer runs.
>
> Loopback UDP throughput in a QEMU guest with 32 possible / 1 online
> nodes (bench_udp, 8 senders, interleaved runs) improves by ~5%.
>
> Fixes: 5628f3fe3b16 ("net: add NUMA awareness to skb_attempt_defer_free()=
")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Suggested-by: Adrian Tomasov <atomasov@redhat.com>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Closes: https://lore.kernel.org/oe-lkp/202512112119.5b9829a-lkp@intel.com
> Signed-off-by: Kris Pan <kris.pan@intel.com>
> ---

pw-bot: cr

Missing atomic_long_set(&sdn->defer_count, 0) permanently wedges defer_coun=
t.

I suggest we fix the pre-existing bug in the net tree, then later in
net-next you send your one-liner patch?
(s/for_each_node/for_each_online_node)

My LLM (Gemini) came up with this  (untested) patch.

commit 24094a55ca66a5507ea6eba395e469146ede7cc1
Author: Eric Dumazet <edumazet@google.com>
Date:   Wed Sep 16 00:12:57 2026 +0000

    net: flush skb_defer_nodes in dev_cpu_dead()

    When a CPU goes offline, dev_cpu_dead() drains its softnet queues
    (completion_queue, output_queue, poll_list, process_queue, and
    input_pkt_queue), but leaves net_hotdata.skb_defer_nodes untouched.

    If oldcpu goes offline while holding pending skbs in its
    skb_defer_nodes lists (e.g. below the sysctl_skb_defer_max >> 1 IPI
    threshold, or if the IPI races with CPU teardown), those skbs remain
    stranded until oldcpu is brought back online. If any of these skbs
    hold page_pool fragments, page_pool_destroy() will stall indefinitely
    waiting for inflight pages to be returned when a netdev or driver is
    torn down while oldcpu is offline.

    Additionally, if smp_call_function_single_async() fails in
    kick_defer_list_purge() because the target CPU went offline, reset
    defer_ipi_scheduled to 0 so future IPI kicks are not blocked when the
    CPU comes back online.

    Also, if oldcpu was the last online CPU on its NUMA node, drain that
    node's slot across all CPUs so no skbs deferred from that node remain
    stranded on idle remote CPUs (or if the node itself is subsequently
    offlined).

    Finally, in skb_attempt_defer_free(), re-check cpu_online(cpu) and
    whether the caller migrated CPUs after llist_add(), flushing the node
    list if so, to close the preemption TOCTOU race against CPU/node
    teardown.

    Fixes: 68822bdf76f1 ("net: generalize skb freeing deferral to
per-cpu lists")
    Fixes: 5628f3fe3b16 ("net: add NUMA awareness to skb_attempt_defer_free=
()")
    Assisted-by: LLM
    Signed-off-by: Eric Dumazet <edumazet@google.com>

diff --git a/net/core/dev.c b/net/core/dev.c
index ecfbd72d5d1a41d60e2276e9d78160c063fa347c..a3492d675138658f1f7bb4e6c48=
a306dbc3efb1b
100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5376,7 +5376,8 @@ void kick_defer_list_purge(unsigned int cpu)
                backlog_unlock_irq_restore(sd, flags);

        } else if (!cmpxchg(&sd->defer_ipi_scheduled, 0, 1)) {
-               smp_call_function_single_async(cpu, &sd->defer_csd);
+               if (smp_call_function_single_async(cpu, &sd->defer_csd))
+                       WRITE_ONCE(sd->defer_ipi_scheduled, 0);
        }
 }

@@ -6900,25 +6901,35 @@ bool napi_complete_done(struct napi_struct *n,
int work_done)
 }
 EXPORT_SYMBOL(napi_complete_done);

-static void skb_defer_free_flush(void)
+static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 {
        struct llist_node *free_list;
        struct sk_buff *skb, *next;
+
+       if (llist_empty(&sdn->defer_list))
+               return;
+       atomic_long_set(&sdn->defer_count, 0);
+       free_list =3D llist_del_all(&sdn->defer_list);
+
+       llist_for_each_entry_safe(skb, next, free_list, ll_node) {
+               prefetch(next);
+               napi_consume_skb(skb, budget);
+       }
+}
+
+void skb_defer_node_flush(struct skb_defer_node *sdn)
+{
+       __skb_defer_free_flush(sdn, 0);
+}
+
+static void skb_defer_free_flush(void)
+{
        struct skb_defer_node *sdn;
        int node;

        for_each_node(node) {
                sdn =3D this_cpu_ptr(net_hotdata.skb_defer_nodes) + node;
-
-               if (llist_empty(&sdn->defer_list))
-                       continue;
-               atomic_long_set(&sdn->defer_count, 0);
-               free_list =3D llist_del_all(&sdn->defer_list);
-
-               llist_for_each_entry_safe(skb, next, free_list, ll_node) {
-                       prefetch(next);
-                       napi_consume_skb(skb, 1);
-               }
+               __skb_defer_free_flush(sdn, 1);
        }
 }

@@ -12897,6 +12908,7 @@ static int dev_cpu_dead(unsigned int oldcpu)
        struct sk_buff **list_skb;
        struct sk_buff *skb;
        unsigned int cpu;
+       int node;
        struct softnet_data *sd, *oldsd, *remsd =3D NULL;

        local_irq_disable();
@@ -12957,6 +12969,17 @@ static int dev_cpu_dead(unsigned int oldcpu)
                rps_input_queue_head_incr(oldsd);
        }

+       WRITE_ONCE(oldsd->defer_ipi_scheduled, 0);
+       for_each_node(node)
+               skb_defer_node_flush(per_cpu_ptr(net_hotdata.skb_defer_node=
s,
+                                                oldcpu) + node);
+       node =3D cpu_to_node(oldcpu);
+       if (node_possible(node) && cpumask_empty(cpumask_of_node(node))) {
+               for_each_possible_cpu(cpu)
+
skb_defer_node_flush(per_cpu_ptr(net_hotdata.skb_defer_nodes,
+                                                        cpu) + node);
+       }
+
        return 0;
 }

diff --git a/net/core/dev.h b/net/core/dev.h
index b757faead4d1a3e445e54d2f468c38c9e09b6762..04fb0e9a571e03f41cac110a0d1=
dd864d110b339
100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -399,6 +399,8 @@ static inline void napi_assert_will_not_race(const
struct napi_struct *napi)
        WARN_ON(READ_ONCE(napi->list_owner) !=3D -1);
 }

+struct skb_defer_node;
+void skb_defer_node_flush(struct skb_defer_node *sdn);
 void kick_defer_list_purge(unsigned int cpu);

 int dev_set_hwtstamp_phylib(struct net_device *dev,
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a2d7b2fbc006d70e965c820b99d6eb4b3432e7c8..d8bd8ed2489e328d81aabde4114=
c0e878ebe0b63
100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7332,8 +7332,8 @@ void skb_attempt_defer_free(struct sk_buff *skb)
        struct skb_defer_node *sdn;
        unsigned long defer_count;
        unsigned int defer_max;
+       int cpu, my_cpu;
        bool kick;
-       int cpu;

        if (static_branch_unlikely(&skb_defer_disable_key))
                goto nodefer;
@@ -7343,7 +7343,8 @@ void skb_attempt_defer_free(struct sk_buff *skb)
                goto nodefer;

        cpu =3D skb->alloc_cpu;
-       if (cpu =3D=3D raw_smp_processor_id() ||
+       my_cpu =3D raw_smp_processor_id();
+       if (cpu =3D=3D my_cpu ||
            WARN_ON_ONCE(cpu >=3D nr_cpu_ids) ||
            !cpu_online(cpu)) {
 nodefer:       kfree_skb_napi_cache(skb);
@@ -7354,7 +7355,7 @@ nodefer:  kfree_skb_napi_cache(skb);
        DEBUG_NET_WARN_ON_ONCE(skb->destructor);
        DEBUG_NET_WARN_ON_ONCE(skb_nfct(skb));

-       sdn =3D per_cpu_ptr(net_hotdata.skb_defer_nodes, cpu) + numa_node_i=
d();
+       sdn =3D per_cpu_ptr(net_hotdata.skb_defer_nodes, cpu) +
cpu_to_node(my_cpu);

        defer_max =3D READ_ONCE(net_hotdata.sysctl_skb_defer_max);
        defer_count =3D atomic_long_inc_return(&sdn->defer_count);
@@ -7364,6 +7365,11 @@ nodefer: kfree_skb_napi_cache(skb);

        llist_add(&skb->ll_node, &sdn->defer_list);

+       if (unlikely(!cpu_online(cpu) || my_cpu !=3D raw_smp_processor_id()=
)) {
+               skb_defer_node_flush(sdn);
+               return;
+       }
+
        /* Send an IPI every time queue reaches half capacity. */
        kick =3D (defer_count - 1) =3D=3D (defer_max >> 1);
