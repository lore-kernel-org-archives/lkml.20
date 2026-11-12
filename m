Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527318;
	b=eYBg0hxLUZzIpkMWEaqBItz2aN1G1tg2JeT1AJnUd0mYGToheqPXqLTZmaONRV32zxAY
	 sZfgCTuLJpTNqOb/SWNLLtNxZ4WRcXqbvQx5Rpuseppblva6ATpRXWcZwPR+pymqJ898D
	 lP9e++sGCKQxYBTt/EQRgRizpfjlGAVlb9glJySst9tCfCsL7xQ2JKLAtP5GbSFAiWB27
	 03Wyg3FD2im/+q0hSCWCXSt5i5S+9K+ySOBKOG3toJ0/5PAH+nR6dVQeJ45TNK1hk49iq
	 x9rlbxMy0XqMKTSXgBIpiDbFyptPh+2y9O4WZC3ZeSJK7A+XhXSDdKGcp8FNGfBCTxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Hn6L2mjuuY8L7ksf+3636Qq4s9yZejuxiPPFGbGY4mY=;
	b=V/vZyXthHdZFuc9URIRKzFeJh2krp3Qplob50Q+Qa2yG0PwRnRM9irwCu8dapXyoCRK4
	 7JUxBqXZ1tOWr/cYa5FMWnnbL7fZ37DBQUscztxlrXl0YLomgclbTSUb8SMwa21DB8tqH
	 v0ZrBBQe2EiAgkoZkKOaGTPBlOYZGT+Gkb+EjOBebiuG0mCKyVwdL3Wpa+DIMH7kD21Ee
	 KYPovAY9lFiHTwQbYi5KOyKLB2GDMOw2uuVX1Ku/T4jB7uinvgVINc1HlsCXcs0PLesnq
	 4+1QwmUGHjVDKctIgoUN9Y7ruTLSw4GzC/zVp4WxEgD44bJWvEbPkb026jkiH6udu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykYOaP38;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC8D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykYOaP38
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b31ca7e0bcso5346087b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794527317; x=1795132117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hn6L2mjuuY8L7ksf+3636Qq4s9yZejuxiPPFGbGY4mY=;
        b=ykYOaP38RbysHVRuDXMf7gCP6CbNgxLylAph97sQaNcx4/fPLUchb49DsmFhiZvI7x
         Dd8UM+HS/8uilEig+b4JYIXdIG4voNsjuwDhs5z/BTANDqJrQXz3o5MnxxF+qeH07yL1
         EJeUqG51zY3ReaRt1CJbAbrWyXhlVMvPeZy19ZL3kV9myLp7x9GF1bQr5zDVJLcbZrpZ
         dvxVHntLIBmmkLfjP6n77sZ+m8+GdF36AtYt+dktD10qOp+s+lfCWF7QHspjq8X6aRXr
         z55nqH4d6xPoDVDuKOUI+nh4BUFicoBJKY3+tUuoSOKydQfEoh+iGlnbdmExMvI0uXpb
         vXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527317; x=1795132117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hn6L2mjuuY8L7ksf+3636Qq4s9yZejuxiPPFGbGY4mY=;
        b=kaRGJzoRVAsCpiltCf+CsVsY/LeIgkiYGL0tIUYVWiIpXPjqVK94aopLilIFehkRyt
         i3+cxeagvxyBqGtus2xxHKecZ0Rl28RlnOhd028QRb9+4BBD8L5boIWFdO39BHp9piUT
         I2H7xF6rkiJCemJ6/tS02kxTTl6WxFgB3SZ7r8CXbgtZZnhKitbSJ3IQIjSnYoFSCtbD
         C4txHXhZ2sta2/AZ7SjNliZP71N5921jCpTVg+KlSCZ2I50yfZhj7It4oq0XF3frVxkV
         iJwEp2leZh3YAsQmgIT7QFyzfVBaxRJ4t7ACxJqTDrFcIvZWLrcexdoTIu8797RKfoXZ
         REvw==
X-Forwarded-Encrypted: i=1; AL+hErH1JJ+waU4EjtRMAD78VL2n2V2WBZJ/xsJy2KXaeapwIXZ1X7F5MEaVdwna6eZli0bHt2LX9BXMSqvlPlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TUiK5Vvp0cmtzF6FwyDM8qNZcxyglmI+hTx0GXr6/VSBXQrVn
	G0HVLcVJBzo1bK3f78Ge2rvfINCLjUAmMivDqX8OKgMkjKRZVGjXhvvv
X-Gm-Gg: AYBFou1LBpYSxHPcavuC0m1g7qRfFJA6OIdwi7D7RBQDfPslXewoaMLFQ3A4y8oMcS2
	VxCvYY7R1m3vtfRic14ZVLAI2EsZqG1poXbSwFnPZKDaB8W+LRXdjTiLHbtbKaxc0ycsVooI3jW
	+LBGUMm6kbI7dl6R6c6rDkmg+wh5Q2ytl3BdJUFYDGXNk1d+CMg37hBNZYcsYZ0Uji+pElFaMkp
	N6eeJKqDxnSSQp5ot/ScDA3HtRYUNPqRwSkFWCCsnuNsQHIUMMvtSHePvXzOoe1GN8fCrgOFSNZ
	RKmAoy5De2eZ7R3o2MQLcQtihgz0berAcSZ0pN0+QcTlelHZF2ucy+p2b+0P5Aq7GIyy9wHMGll
	GPGFrQpXaXsFOrF17/6eKbyO+vO+vKY8f6bsW2j6qME9SFC4l10vEtiVnlyEeBeeiZSH1QOIarq
	XiSLkkn4y2FN2J+jqbol6TLiZSa8Ja3kg4bW26D0TkGSIXibazp2rQF+9kueGYf6otCdAnpAiHS
	NVlwWKtTqZP27UlDeRZWzzjwHrJC9e3yRWH5xFkNjIOlFuEU6lFMFe3X7IXrtmzWAEvq8jnO//y
	OuX1egASf3UQa84yjoNHt9WwWqZa0QCbMqDO2xtFZN0teQu2Wioq5EpIj94t
X-Received: by 2002:a05:690e:40c:b0:67c:6d5b:b497 with SMTP id 956f58d0204a3-67d897871d5mr541729d50.64.1794527316699;
        Thu, 12 Nov 2026 15:48:36 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:46::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4339c3sm629840d50.3.2026.11.12.15.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:48:36 -0800 (PST)
Date: Thu, 12 Nov 2026 15:48:35 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, 
	ljs@kernel.org, mhocko@suse.com, muchun.song@linux.dev, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, weixugc@google.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC v2 0/1] mm: add source selector to memory.reclaim
Message-ID: <avZOsc-jTr7n8Q_y@devbig011.atn3.facebook.com>
Mail-Followup-To: Li Zhe <lizhe.67@bytedance.com>, 
	akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, ljs@kernel.org, 
	mhocko@suse.com, muchun.song@linux.dev, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, weixugc@google.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261102070440.16262-1-lizhe.67@bytedance.com>
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
Content-Disposition: inline
In-Reply-To: <20261102070440.16262-1-lizhe.67@bytedance.com>

On Mon, Nov 02, 2026 at 03:04:39PM +0800, Li Zhe wrote:

Hi Zhe,

Sorry that I got to this so late. I must have missed it in my inbox
somehow!

> memory.reclaim is a useful proactive reclaim interface for memcgs, but
> tiered memory makes "reclaim N bytes from this memcg" underspecified for
> userspace controllers that manage memory placement across tiers. The
> kernel reclaim path may demote some folios and evict others. Without a
> way to declare where reclaim pressure should be applied, userspace can
> only reclaim from the memcg as a whole and observe one aggregate progress
> value.

Does this series do anything to distinguish demotions from evicting?
If not, I'm not sure why it is mentioned above.

> There is prior history here [1]. The old nodes= proposal tried to let
> memory.reclaim scan selected NUMA nodes, but the discussion left several
> ABI questions unresolved:
> 
> - nodes= did not clearly say whether the mask was a source selector, a
>   reclaim domain, or a demotion-target constraint.
> - The implementation did not apply the mask to the whole reclaim path,
>   so demotion could allocate outside the mask. If userspace interpreted
>   the mask as a domain or target constraint, the ABI did not provide
>   that.
> - Selecting top-tier nodes could become an implicit way to request
>   demotion without uncharge. That would make userspace depend on a
>   particular reclaim policy and could make future policy changes hard.
> - The separate completion-accounting question remained: demotion can
>   count as reclaim progress even though memory.current is not reduced.
> 
> This series takes a narrower approach. It adds a typed source= key which
> declares only the resident source to which the existing memory.reclaim
> path should apply pressure. It is not a demotion target selector, not a
> demotion-only goal, not an eviction-only goal, and not a change to the
> existing completion accounting. Leaving source unspecified preserves the
> existing memory.reclaim behavior.

Right, I was a bit confused why you presented not distinguishing between
demotion and eviction as a problem, since this patch just preserves
the existing behavior for reclaim.

> In that sense, this series extends node-scoped reclaim pressure to the
> memcg memory.reclaim interface. The existing node memory_reclaim
> interface can apply pressure to a node, but it is not scoped to a
> particular memcg. This series lets userspace apply the same kind of
> source-scoped pressure to a cgroup's resident memory on selected nodes,
> while still using the normal memcg reclaim path.
> 
> The typed source= form also follows a direction that has recently been
> discussed for memory.reclaim. In the zswap proactive writeback series,
> the interface was changed from a one-off zswap_writeback_only key to
> source=zswap so that other reclaim sources could be selected in the
> future [2][3]. This series uses the same extensible key shape, but
> defines a different source class: resident NUMA nodes. source=zswap
> bypasses ordinary reclaim and performs zswap writeback; source=nodes:
> <nodelist> only constrains where the normal memcg reclaim path applies
> pressure.
> 
> The main benefit of this series is to give userspace a steering knob for
> per-node memory placement control. A tiering controller can still build
> per-tier policy on top of it by translating a tier to its node list, for
> example from /sys/devices/virtual/memory_tiering/memory_tierN/nodelist.
> It can then apply reclaim pressure to the nodes that should be relieved.
> For example, it can apply pressure to top-tier nodes so that, under the
> existing tiering policy, cold folios can usually be demoted to lower
> tiers. Another controller may first reclaim from lower-tier nodes so that
> later top-tier reclaim has room for demotion. A controller can also
> reclaim from terminal-tier nodes when it needs actual charge reduction.
> 
> The existing memory.reclaim interface cannot express this. It applies
> pressure to the memcg as a whole, so on a multi-tier system the kernel
> may make progress in a tier different from the one userspace is trying
> to control. That makes a userspace feedback loop for tier ratios
> ineffective: the controller can observe that a specific node or tier is
> over its desired resident footprint, but it cannot direct the next
> reclaim request to the corresponding source nodes.
> 
> This version only adds source=nodes:<nodelist>, which is the basic
> source selector. More convenience selectors can be considered later, but
> the tier use case is already expressible by resolving a tier's current
> nodelist in userspace and passing that nodelist to
> source=nodes:<nodelist>. Starting with the node-based interface keeps the
> ABI smaller while preserving the source= namespace for future selectors.
> 
> The remaining issues from the old discussion are intentionally left out
> of this series. If userspace needs to control demotion targets, that
> should be a separate target/demotion-policy ABI rather than folded into
> source=. If userspace needs a strict "bytes actually uncharged"
> completion mode, that should be discussed as a separate accounting or
> goal extension because it would change the observable meaning of
> memory.reclaim progress. This series only adds source selection for the
> existing reclaim policy.
> 
> Testing:
> 
> I ran a simple userspace feedback controller on a CXL test machine. The
> machine had nodes 0-2 as the DRAM tier and node 3 as the CXL tier. The
> basic matrix used node 0 as the DRAM source and node 3 as the CXL
> source for the target memcg, with fio and stress-ng as the load
> generators. The controller:
> 
> - read anon/file bytes from memory.numa_stat by node;
> - aggregated them into DRAM and CXL resident bytes;
> - targeted a 1:1 DRAM:CXL resident ratio for the target memcg;
> - selected the side above 55%;
> - wrote memory.reclaim with source=nodes:<selected nodes>; and
> - slept for the configured control period before the next sample.
> 
> The controller loop was approximately:
> 
> while running:
>         stat = read_memory_numa_stat()
>         dram = resident_bytes(stat, dram_nodes)
>         cxl = resident_bytes(stat, cxl_nodes)
>         total = dram + cxl
> 
>         if dram > total * 0.55:
>                 source_nodes = dram_nodes
>                 excess = dram - total / 2
>         else if cxl > total * 0.55:
>                 source_nodes = cxl_nodes
>                 excess = cxl - total / 2
>         else:
>                 sleep(period)
>                 continue
> 
>         bytes = clamp(excess * gain, min_step, max_step)
>         write(memory.reclaim,
>               "$bytes source=nodes:<source_nodes>")
>         sleep(period)
> 
> The requested reclaim size was proportional to the excess bytes, with
> per-workload min/max bounds. I tested 1G, 5G, 10G, 20G and 50G
> workloads with 1s, 2s, 5s and 10s control periods. A run was considered
> within target when max(abs(dram_ratio - 0.5), abs(cxl_ratio - 0.5)) was
> not greater than 5 percentage points.
> 
> Basic feedback-controller matrix, final deviation from the 1:1 target:
> 
> The 1s, 2s, 5s and 10s columns are controller periods.
> 
> The file-cache-CXL-high case used fio under numactl to create about 25%
> DRAM and 75% CXL page cache. It reached within 5% by at most the
> eighth control cycle, and all 20 runs ended within 5%.

These results are really confusing. What does the % mean here?
% deviation from a 50-50 split? I want to review the code but I want
to understand what the test is actually trying to do first.

In any case, I think the important tests to demonstrate the code are:
- How does this perform when the entire system is under pressure?
- How are multiple cgroups simultaneously present on the host dealt
  with? Are they also able to manage an effective split? 

> size  1s     2s     5s     10s
>  1G   3.96%  3.96%  4.45%  3.96%
>  5G   2.65%  2.75%  2.65%  2.65%
> 10G   2.65%  2.68%  2.65%  2.69%
> 20G   2.65%  2.66%  2.66%  2.64%
> 50G   4.31%  4.31%  4.31%  4.31%
> 
> The anon-DRAM-high case used stress-ng under numactl to create
> anonymous memory on DRAM and used swappiness=max so that the normal
> reclaim path could demote or reclaim anonymous memory. It reached
> within 5% by at most the seventh control cycle, and all 20 runs ended
> within 5%.
> 
> size  1s     2s     5s     10s
>  1G   0.15%  0.02%  0.16%  0.02%
>  5G   3.16%  3.13%  3.14%  3.13%
> 10G   3.13%  3.13%  3.15%  3.12%
> 20G   3.12%  3.13%  3.12%  3.12%
> 50G   1.88%  1.88%  1.88%  1.88%
> 
> For comparison, I also ran the same controller and workloads without
> the source=nodes selector. The controller still chose the side above the
> target and computed the same request size, but wrote plain
> memory.reclaim without a source constraint.
> 
> case                  final <=5%  reached <=5%  worst deviation
> file-cache CXL high        1/20          1/20     50.00%
> anon DRAM high            20/20         20/20      5.00%
> 
> This shows why the source selector matters for placement control. In
> the file-cache-CXL-high case, plain memory.reclaim could not reliably
> control the target ratio without source=nodes. In the anon-DRAM-high
> case, plain memory.reclaim worked well. This is likely because, in this
> setup, the whole-memcg reclaim walk reached DRAM nodes before CXL nodes,
> so it already applied pressure to the over-target DRAM side first for
> this workload.
> 
> I also ran a disturbed case with external reclaim and demotion activity.
> The target memcg used stress-ng under numactl to create about 25% DRAM
> and 75% CXL anonymous memory. NUMA demotion and zswap were enabled, and
> watermark_scale_factor was raised to 3000 so background reclaim became
> visible in a short run. A ballast cgroup kept DRAM free memory low, and
> a separate CXL-heavy cgroup kept reclaim activity present on the CXL
> tier. The result below was measured on the target memcg.
> 
> During the matrix, pgdemote_kswapd increased in 16/20 runs. The
> CXL-free-down/DRAM-free-up/pgdemote pattern appeared in 13/20 runs.
> Even with that external activity, the target memcg controller still
> drove its own DRAM:CXL resident ratio toward 1:1.
> 
> Disturbed case, final deviation from the 1:1 target. The 1s, 2s, 5s and
> 10s columns are controller periods:
> 
> size  1s     2s     5s     10s
>  1G   1.18%  1.11%  1.11%  1.42%
>  5G   2.14%  2.06%  2.14%  2.14%
> 10G   2.13%  2.10%  2.15%  2.11%
> 20G   2.15%  2.23%  2.15%  2.43%
> 50G   4.87%  4.87%  4.89%  4.87%
> 
> All 20 disturbed runs reached within 5% by the third control cycle and
> ended within 5%. This does not make memory.reclaim a one-shot footprint
> guarantee, but it shows that source=nodes can act as a useful
> feedback-loop actuator.
> 

Zhe, it would be great if the commit message could be a lot, lot
shorter. I feel that this is just really too hard to read. And I'm not
sure if there's a need to have a separate cover letter for a single
patch.

Please, I feel like this is really difficult to read. I think the
commit message could be as short as 3 paragraphs and I think it would
still capture everything that you're trying to say. 

Sorry again for the super late reply, Zhe. I'll be more on top of review
next time! Have a great day,
Joshua

> References:
> [1] https://lore.kernel.org/all/Y5bsmpCyeryu3Zz1@dhcp22.suse.cz/
> [2] https://lore.kernel.org/all/20260629112032.20423-1-jiahao.kernel@gmail.com/
> [3] https://lore.kernel.org/all/20260629112032.20423-5-jiahao.kernel@gmail.com/
> 
> Li Zhe (1):
>   mm: add source selector to memory.reclaim
> 
>  Documentation/admin-guide/cgroup-v2.rst |  9 +++++
>  mm/bpf_memcontrol.c                     |  3 +-
>  mm/internal.h                           |  3 +-
>  mm/memcontrol-v1.c                      |  6 ++-
>  mm/memcontrol.c                         | 11 ++++--
>  mm/vmscan.c                             | 49 +++++++++++++++++++++++--
>  6 files changed, 70 insertions(+), 11 deletions(-)
> 
> ---
> v1: https://lore.kernel.org/all/20261019141401.11927-1-lizhe.67@bytedance.com/
> 
> Changes since v1:
> - Reworded the cover letter and documentation to describe the interface
>   as applying reclaim pressure to a selected resident source.
> - Added the lower-tier use case where userspace reclaims from a lower
>   tier first so that later top-tier reclaim has room for demotion.
> - Dropped patch 2, the tier convenience selector, for now. Tier-aware
>   userspace can resolve a tier to a nodelist and use source=nodes.
> - Added references to the zswap proactive writeback discussion, which
>   also uses the typed source= form to keep memory.reclaim extensible.
> - Added CXL feedback-controller test results using fio and stress-ng
>   load generators, including a no-source baseline.
> 
> -- 
> 2.20.1
