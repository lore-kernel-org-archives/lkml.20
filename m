Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850804;
	b=5mxwPLf4CMCl7h12wOMyIvwoLS9BGHWVo7C+baXwVWlX8HHzMUCdEl/WiPYwwA59n3YB
	 s/1aG47Wxb6+DGw4kPg7IRURfqKVHRKQ+Ep67EceG9iPHDKM5CeKBIg1D8Cm/CouPRkkG
	 1m74YTxsnKxmS6ufaaZDqpufSt77IjXtxdjt5gS0ogI4/3jjLFvXIKbdvgbQEC9TEU6Iy
	 yw5s7Fr+nUcnyM2pjm3LEuIU89cblY1EjolKFqp10To4mbLhUekbbe9F1I89SCXIhFhXq
	 76ByiIeaJMuhUGmsQ70eFCIqbilgAxVUGCO8xnOPAjLoKifIx8BhmAWKCjPgUEMHTuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WSwHlQDyP7wkj805UeQxgqOCUOA9IwLfucPHoVu5Fz4=;
	b=rM1adjgGrPDB7j6TSD70vU3wXLLNPe4LF3HjisYw1pfE1gTpVlEd5klv4n1iLJQi6bou
	 QfiJjGyvzoGA2Qfqvwvt3lNHCn88LDV40g+mk0mop8fqgr1tK249lBvzD3R8cVhZv1JDt
	 RDk1d5GWT3Zf2Tfwqc3lsvRSZyjJ+1HLtAqyHnAi8WuNgmUfyglM9LW9GkekjCgM7usuf
	 Sm76KoUIN3T5jZTF9RhZfDeDy8JSlyqabxORw3xBDdD1vqbMwtb9EM2L4/VWGKxWj/+Yn
	 VoZYashJn4FhG8JFdTZ2t3LWL0kZfMaoiZ8XjJrb+vLzUSkUW/rn4g16gDqIjaS/HnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pAmCf9RH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F4606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572F4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pAmCf9RH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso72665e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:40:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850802; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLZHsuAlY8Q3lNBxmg1GTIUniwlEHBR1OIv8uCoAt0YNU/4bEzOPDSzoCnhkCuUjng
         CJqbM63QcchDtwnjoqYqBBmwMGJvphwBMSc6QCrM8MZG7TXYPuIB3xuCEze/fBfZVm2N
         +DCVHcQJzxfyMJrPaTe4cEbEq4F+ZKGMSE0ux3d9RbF3XqsemrQGjvyjZPckmGruGgLZ
         QB9BmPXPIzwWa9/FOuA9RI7huK25A0ci+xF+eCtpd/O7jaSyr/3EwflEiVgIc8aGYcFX
         y+rw+MyWDjyjTu2T/HEJkSHbnxIJzc0MIvT7o06GYGU2tJIbVlOx13it8wxcC+ubHN0P
         4OzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSwHlQDyP7wkj805UeQxgqOCUOA9IwLfucPHoVu5Fz4=;
        fh=R6wizUqN3lnFoXb5kYO0jbODkfRUM244zcV/3K8Dy2Q=;
        b=CLO0lGfH6vt2pziSYHVdjihlc+Sf3FYjstpn3zRvAKncJUerSUtcfFZNV1aanVAYwW
         snFQZI6bG2HxVsgxAz4EUBVpK1zW5D1pTuAgeRUBunns5zPH/pxWKpPoPNVa3LQiAsay
         zRbRxIAoySHZQ7TXnwhPahaZKjsL1g3eWgCxKrD54Vg9YrcSjwJvi5qgRVfkGebVJ4gL
         9GLCNInm0KCOfMvySt5PmnH74v++dQpgFeqUzwPWw19kA7tShCjXTH2FLq170vuaIQZD
         YwZRkza9v0hR2s4m230WbA851hJ+z4BMjfkfQ9dMEM0qBfPfOOl4QYTRBYq2HXTjC49T
         lCuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794850802; x=1795455602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSwHlQDyP7wkj805UeQxgqOCUOA9IwLfucPHoVu5Fz4=;
        b=pAmCf9RHbl2KwUyAAVewo2WjbZRAh2HOr7FNyPBl4l/12kNZfD2LhakZ5nnxyT5HhD
         FgjcUOmkskgWf5f5EGxJqU3w0YL6QAJv8omqnF9CvY+xEvh/MSvotKnY0WSC2+K1pF0w
         wJE3Q8orKiH4HHin1LUveC5aORu3GlWyQOzO1OdXtIWzeleFyYBfmt+3sUXj3rsotZW1
         yKKy3rts8VM4Ugl3Xk7w3JGfLlM8F8UFz3fLC/Nm3CRERqIVPhJ3D961lhd8/QNU3N9s
         CIR4BBjZ2sFifwtRHL7tM+zUGQAEderELWl9WlYTbqKCsAdHHw1lcFL4sNCLasFO6t5P
         UfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850802; x=1795455602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSwHlQDyP7wkj805UeQxgqOCUOA9IwLfucPHoVu5Fz4=;
        b=lbnkif8iW5BGOvpwIX33KVY5REhZgTz+3Ngb0b3OKcB/ACBw15vaLphD2jFURVQM4D
         UkMbwn0eBqKvM9B+kN5Uen3Y7sSqxljWCOVes2YDCOvUAgykpcVfZVAQIo0qn3vWOPIt
         32l92/ceGb+R7vSduWydyrAK+9sBVHTUkpdrOb5PChgQSgbiRQa4Xf4jjfWM75yN0XMz
         xLs9a+ZdvvS2KWsNAw3Zgn0soWprItvJf6JRZ1lBGtMfJ7Hhrym4cTuxObkARv+SaF6k
         KR972iL4/04puZkJuR0v4jlWXYjeNGdk9qUdkburRvxWVtZVh2+TovciVqMUr/aWfEBY
         UHWw==
X-Forwarded-Encrypted: i=1; AL+hErEGkLZ/3dtluZpkcUOWXwKDm22SDdXzI2SHr6rVKzeXdC1STLbzn6zuEuCrvu4KV9WAmIX5wYLFXBEFoSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iGeIm0dZPt0mizpFEalWfCfc4/ATUEYEJ/3JfAtMXdL7MhY6y
	FONTUHoCxYZFdDdYcDuZs7/6fRVS84A6sRyZIb6+U/Z3wLQ5Zd+AdCIoQAwJTp+D5ipWsuZpvuM
	E9DLc5rI4H8dBD/plfsFI5hsYFMshioByL55RtJWw
X-Gm-Gg: AYBFou3JLhhkMM66hAa7qVPx6XGVVDj6j9b4rmUKx+ui1ZmrxFwtc1oBPEcv3mP1XtP
	1ovaW/gVNNlJaGuG2Eol7+eRwFhe7xPNUKytfcH27OIep4U3msIClVtCOpdgFmh7X6ACZ536CDS
	fm3knd1BKZWUC8S0j9ARW3wH6Mh9JCX13YzgO5BBBNz3SNHL+mr7cacwnjKmVI0Z/g9XVxXCeez
	R1lbzhCFj+kq46wWiHAyHqQedByNOH6oX8/YmvdUGiKdtjYjYuXdairXaSN+ey4n+zPZCoVvGVg
	3FGQ0HoZGoKxurnNN3mxmU3gkp+m7FH0pS/OJa75i5505awntLpQUEvalGRjluP3vxGSuXNY1j/
	83X6knrW8Jy2/TFzY4nu2nuPE2ZjUAxuX1j/ny/qlrS3e9pUOG6hgwCUd7YpDfAQdxKn/TrO7XL
	c5ue0mr1j49ONmQj26hxYwAA==
X-Received: by 2002:a7b:cbd8:0:b0:4a1:fb0b:1c9c with SMTP id
 5b1f17b1804b1-4bb62f74fd6mr2275405e9.10.1794850802012; Mon, 16 Nov 2026
 09:40:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106235904.1092712-1-tjmercier@google.com>
In-Reply-To: <20261106235904.1092712-1-tjmercier@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 16 Nov 2026 09:39:48 -0800
X-Gm-Features: Aa3M54oxYc8a6LIuSto1TMcfd-6pEIfEVrjDl0LEFJ6mfcOIGgTGdyYmUpGfP1M
Message-ID: <CABdmKX1gdOH8R6qyjw6XN5VdpAZKVR8NZ=R7Y9Db-BEhUrX-1Q@mail.gmail.com>
Subject: Re: [PATCH] mm: workingset: compare shadow nodes node-wide without
 kmem accounting
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jaewon Kim <jaewon31.kim@samsung.com>, Jaeseon Sim <jason.sim@samsung.com>, 
	Youngchan Kim <ycshark.kim@samsung.com>, Dmitry Skiba <dskiba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:59=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> count_shadow_nodes() limits the number of xarray nodes holding shadow
> entries to 1/8th of the pages that could be using them. For a memcg, it
> counts the LRU and slab pages local to that memcg.
>
> With kmem accounting disabled (cgroup.memory=3Dnokmem), shadow nodes are
> not charged to any memcg and __list_lru_init() makes the shadow_nodes
> list_lru non-memcg-aware, so all shadow nodes of a NUMA node are on a
> single list. shrinker_alloc() falls back to a non-memcg-aware shadow
> node shrinker, which shrink_slab() only invokes for the root memcg.
> count_shadow_nodes() therefore compares every shadow node on the NUMA
> node against the pages local to the root memcg.
>
> When most tasks run in child memcgs, the root memcg only holds a small
> fraction of all pages, so the shadow node limit derived from the root
> memcg page count is far below the number of shadow nodes on the NUMA
> node. Since the shrinker has seeks =3D=3D 0, every root shrink_slab() cal=
l
> trims about half of the "excess" shadow nodes. Most refault information
> is thrown away, so refaults of recently evicted file folios are not
> detected. Refaulted folios lose PG_workingset and the workingset_refault
> and workingset_restore stats drop.
>
> In testing on devices with kmem accounting disabled, moving tasks from
> the root memcg into per-application memcgs dropped workingset_nodes from
> ~37,000 to ~900 and raised workingset_nodereclaim 4.6x while
> pgsteal_file rose by ~12%.
>
> When kmem accounting is disabled, compare the shadow nodes against the
> whole NUMA node, as is done without memcg. Behavior with kmem
> accounting enabled is unchanged.
>
> Cc: Jaewon Kim <jaewon31.kim@samsung.com>
> Tested-by: Jaeseon Sim <jason.sim@samsung.com> # Galaxy A18 LTE
> Tested-by: Youngchan Kim <ycshark.kim@samsung.com> # Galaxy S27
> Tested-by: Dmitry Skiba <dskiba@google.com> # Pixel 10
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

I'm guessing there aren't many other nokmem users?

> ---
>
>  mm/workingset.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 1504f91cdca5..87d5e55dd684 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -682,7 +682,16 @@ static unsigned long count_shadow_nodes(struct shrin=
ker *shrinker,
>          * PAGE_SIZE / xa_nodes / node_entries * 8 / PAGE_SIZE
>          */
>  #ifdef CONFIG_MEMCG
> -       if (sc->memcg) {
> +       /*
> +        * Without kmem accounting the shadow_nodes list_lru is not
> +        * memcg-aware. So the count above covers the whole NUMA node, an=
d the
> +        * shrinker only runs for the root memcg, whose local pages can b=
e a
> +        * small fraction of the node's when most tasks run in child memc=
gs.
> +        * Compare the shadow node count against the memcg page count onl=
y when
> +        * the shadow_nodes list_lru is memcg-aware. Otherwise use the NU=
MA node
> +        * page count as is done without memcg.
> +        */
> +       if (sc->memcg && shadow_nodes.memcg_aware) {
>                 struct lruvec *lruvec;
>                 int i;
>
> --
> 2.56.0.455.g6c5a503b38-goog
>
