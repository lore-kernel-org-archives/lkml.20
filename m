Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423312;
	b=oRIMf2SAW+DMWjHIrXTqaIypT7KDYicL4Hh56SNxrgNR7FvDSmtdQY/DLfG8nMR5VZzO
	 sqXMoKM08Bz7SDlh8K9czsBDK3m/Io9cVs4uLvNh8rsI//ZkNmClQaIXP29wPpd2WL57J
	 jNBI8Qy7En8x/RZAgfTEbRDOdVZn0l5IUNUpiIVFiocD3tC8zxJxh8q6+S2nLgU1CyoAh
	 5bgefl7gBnC+N3X4j5dp/SIj1ZGWb/Q8BbrG73SS+2Ub7c83gjbG2bAxrKPVY8KMBY2B0
	 KTwQV+CagKxou5vCKPet3I/20YwS1M+T9mNKgcWN48KYuxPEkLodlGZIbd0jafWWbbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=09q/0iBwzQnusWfsQDP8VzXzU6qhw6PdbTeHiI84DZo=;
	b=OBM+j8U89ZLWUby/mFONrc8Zyo+E3XvRiG7ip0YSepIBHu/0T+ZgJqpyWVGcyiEnbUYF
	 FL1FNXWXWw9ldGqP9PvrMNpKs/YdRhRHoen8Yo0SMZGKwKeRfoNtPfciVDAR9SBa39GBG
	 ZUY1d2c93G65CloaIgTYZUPRV0b/ZHoKvdahW6sjjxMHM/tVhzXIcimMvJa9nh6Bc5OfY
	 xhWLwU7a+n23Ancy+kaQ640l5xtfNBXqvNQhQbVVrjpr9bpFBKg38WqDld8foHgvAVbdx
	 X0C9shB6RrI0jK+cZPOM9Xl/1nlogHLPi4PJBk8J1KRagxBOOEHyR5lf3emPuGImzQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BZxMeqSy;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43945609CECA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43945609CECA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BZxMeqSy
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dd059478dcso1314958eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423311; x=1793028111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09q/0iBwzQnusWfsQDP8VzXzU6qhw6PdbTeHiI84DZo=;
        b=BZxMeqSyHw1y80ZpE+7SKu/0wXvAIOP2ZQXBuB9LvBw5vhAkeBD4sx46ejdlC3rVos
         Qs74yzruFTb6P0Z6TXSBOroWRIR+DYJNP+61SERGpZCXEfDCudFtLUGscCq1nAy/mYo7
         Gly4NKDm9F5U36fYJWcWzxnNKndZG2S77eQuPEH92dqCkyvg9NMs+90fNwzs/3ZYEzL/
         oqrEK9WlvWRNpbSbXBS+qzLT2Y/HeE28gdLTOCjMHNXp9IRF2lW+RVq77nEvlujS6pAR
         5mZgEZ0PVFPTiCN8Z9RKgQ1uXOSJQ+Bn8513CosHh9Gg+WJU2+DHGsXy9Dw2W0vPFc1f
         JIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423311; x=1793028111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=09q/0iBwzQnusWfsQDP8VzXzU6qhw6PdbTeHiI84DZo=;
        b=X0RUJSYAP61Y4AgWTQiurqu1W8TKT00Q6nfU55T0eTm4/0EkOjAaU5Q3bYZRXk1EdX
         omDgbh3QQOMZjYdxgh6CQ2XJB2JKHoeWOp9Qey4bpQ6tWQ8oussBNF2omTxbILBCd1c8
         DRGwK48y+/2Z+TO6eI7cqKNNOhyx6M0190E/TxjgpBqRYT70XAtaefPuoZj79c+aE6ao
         b0UqR/TwPGX5qvCM8lbximGOUlo0Uhrx8y61e4nasfYGYIp0ZcZt2Au3EvAbeeDQ3ZeB
         ALWfOXUZBbzJ5Qb4g2zSNlwCEQ4Z8j/Re1f7Tww+Dz1cKDZYq1YoAR8qAYgScfdawT2i
         tCYQ==
X-Forwarded-Encrypted: i=1; AKwUvByGQD478RvxwBJrJmOkssM+jMIQfS8sw2WtHV1eC7nOTwl+4kZPgIY7LdMipbr4mkVPvFNcEl/tCx+NRgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYICXxyXzlxf34tFhVt4NO6jxJg0wn9ogMFimfugz2TRe1/gfGus
	5F4gnDSfCtxaTk0ZEUZFGd4B7OSnMbFw+S+Y44deLdw0wkbmSqXkDmxQ
X-Gm-Gg: AYBFou0h4iUyZxbMvB4mv0yVVbYl+5ELlDqrFeMfN4KGPD/bCZvQ69e3PhrnfzWopMl
	H08WO+uyz1jevqVoSzuNXmxDVBmzUdovoWPVe8g0IROyQJ/KMM3sScNe2Vq944DlhR81IulVbKi
	e8EEjPlVmVZbj0UKUkbYfdqeHWt1zMPdFwfxBc9/eW7S/4XGRlYMP4gl4KJBRmhK9STjD5CCM0u
	XWryXbAo/2s13Dno98uCc/3GaVLPtWxuFTqd8qng+HSha3wr88uif2N8OpALYRizOaVIDAr2OlI
	NyGzvgFKqLfs6TE1kmgWCQ+aNUfjmchAy9dib3U2ExrUeA0Bb5tzIwP/OEv8oQGWp7CaN7OXdnN
	IlFIJ+j2nfY2cCjD6yK0PZ8B2lCCjaOJTtsCX8bXmTMhA1kq/9UyZJsn+2yHqXYUnVtP0nSikfI
	eKeqzzeN9Z4J9h30OGL6kdcJVF5KvQxEvI+oJiERsOVuVjpGw6uM1l9A/yKzf4mn64vp87J2dUy
	1Kd8Nhk2QptxQWXB2K7+d2Dqm6w
X-Received: by 2002:a05:6820:a515:20b0:703:4766:16e with SMTP id 006d021491bc7-70357099e1cmr4063847eaf.56.1792423311061;
        Mon, 19 Oct 2026 08:21:51 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6cac55sm9160419fac.11.2026.10.19.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:21:50 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	mhocko@suse.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Date: Mon, 19 Oct 2026 08:21:48 -0700
Message-ID: <20261019152148.3330024-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019141401.11927-1-lizhe.67@bytedance.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 22:13:59 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> memory.reclaim is a useful proactive reclaim interface for memcgs, but
> tiered memory makes "reclaim N bytes from this memcg" underspecified for
> userspace controllers that manage memory placement across tiers. The
> kernel's reclaim policy is aging-based, and on tiered systems aging may
> demote folios before they are eventually evicted. Without a way to
> declare where reclaim pressure should start, userspace can only reclaim
> from the memcg as a whole and observe one aggregate progress value.

Hi Li,

Thank you for working on this patch. I think it's quite interesting.
I have many comments about implementation detials but for now let's
discuss the direction of this series first.

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
> This series takes a narrower approach.

I think this is the way to go.

> It adds a typed source= key which
> declares only the source on which the existing memory.reclaim aging
> pipeline should be applied.

Calling it an "aging pipeline" is a big confusing to me. Maybe just call
it eviction targets or reclaim targets?

> It is not a demotion target selector, not a
> demotion-only goal, not an eviction-only goal, and not a change to the
> existing completion accounting. Leaving source unspecified preserves the
> existing memory.reclaim behavior.
> 
> In that sense, this series extends node-scoped reclaim pressure to the
> memcg memory.reclaim interface. The existing node memory_reclaim
> interface can apply pressure to a node, but it is not scoped to a
> particular memcg. This series lets userspace apply the same kind of
> source-scoped pressure to a cgroup's resident memory on selected nodes
> or tiers, while still using the normal memcg reclaim path.
> 
> The main benefit of this series is to give userspace a steering knob
> for per-node and per-tier memory placement control. A tiering controller
> can observe the resident memory distribution across nodes or memory
> tiers, and then apply reclaim pressure to the source that should be
> relieved. For example, it can apply pressure to top-tier nodes so that,
> under the existing tiering policy, cold folios can be aged and usually
> demoted to lower tiers, or reclaim from a terminal tier when it needs
> actual charge reduction.

To me I think the other interesting aspect is being able to evict memory
from lower tiers out to swap so that toptier always has room for
demotions, preventing swapouts from higher tiers. In fact I think for
my interests this is the more important use case.

> The existing memory.reclaim interface cannot express this. It applies
> pressure to the memcg as a whole, so on a multi-tier system the kernel
> may make progress in a tier different from the one userspace is trying
> to control. That makes feedback control of tier ratios ineffective: the
> controller can observe that a specific tier is over its desired resident
> footprint, but it cannot direct the next reclaim request to that tier.

This part is confusing to me. The kernel curently doesn't observe
per-tier-memcg memory footprint and try to manage it, does it?
( that is what I'm trying to solve currently in my tiered memcg series ; -)
  but as it stands right now, I don't think there is any feedback loop )

> Patch 1 adds source=nodes:<nodelist>, which is the basic source
> selector.

In general I agree with Lorenzo, it took me a second to realize that the
bulk of this series is just adding a nodemask to
try_to_free_mem_cgroup_pages. It might be helpful to just call it
"reclaim" instead of calling it an aging pipeline.

> Patch 2 adds source=tier:<N>, where N is the memory_tierN id
> exposed by /sys/devices/virtual/memory_tiering/. The tier selector is
> only a convenience layer over the same source semantics: it resolves the
> current tier nodelist at write time and then uses the same source-scoped
> reclaim path as source=nodes:<nodelist>.

Personally I think that it makes more sense to just start with a
node-based reclaim interface, and then extending it to tiers. It seems
like the tier usecase is entirely doable with just a nodemask interface.

And in this case, since we're just selecting the sources of reclaim,
tiers don't really matter, right? That is, we don't care if the memory
gets demoted or swapped out, we just care that the footprint for the
tier memcg goes down. 

> The remaining issues from the old discussion are intentionally left out
> of this series. If userspace needs to control demotion targets, that
> should be a separate target/demotion-policy ABI rather than folded into
> source=. If userspace needs a strict "bytes actually uncharged"
> completion mode, that should be discussed as a separate accounting or
> goal extension because it would change the observable meaning of
> memory.reclaim progress. This series only adds source selection for the
> existing reclaim policy.

100% agree.

Thanks Li, I hope you have a great day!
Joshua
 
> References:
> [1] https://lore.kernel.org/all/Y5bsmpCyeryu3Zz1@dhcp22.suse.cz/
> 
> Li Zhe (2):
>   mm: add source selector to memory.reclaim
>   mm: add tier source selector to memory.reclaim
> 
>  Documentation/admin-guide/cgroup-v2.rst | 29 +++++++++++
>  include/linux/memory-tiers.h            |  6 +++
>  mm/internal.h                           |  3 +-
>  mm/memcontrol-v1.c                      |  6 ++-
>  mm/memcontrol.c                         | 11 +++--
>  mm/memory-tiers.c                       | 24 ++++++++++
>  mm/vmscan.c                             | 64 +++++++++++++++++++++++--
>  7 files changed, 133 insertions(+), 10 deletions(-)
> 
> -- 
> 2.20.1
