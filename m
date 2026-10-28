Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215377;
	b=tDKvq+SFdRHBgh+xMbmy4hVRB2d88Z49/xdhCsMfY093VlThA1HKrxitO1vGyvFrOWua
	 Ruh0P48IR/IBvN+DFT1keDAeBjuL0KpNs++YGP0NtcjVO8k4mY6qj+SKiy55L9Cz8rWqS
	 GEqFLupeFBROmN11zJiF98OPKlZesQUwDMhXQ3ZXh0BEYakhbSzJHCxiZ8eXphv4BqW53
	 kO/ehGKFLSANTLVblOgN3E/+lhsiPaHID5LxwvbeFOiUcDIC+UEgvVPvojvDLKMzyKAS3
	 Z+4gFkzIBUSA7HUYmhmhzDfzl7FTBXkQfPeY31ymqB7aV2SAHVu3N4Fr7lyNrgEqK2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215377;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YgW7z2/wWcYNE6vFIw6PaupAVuPE4rl6qJWBPo/OcK0=;
	b=Ma+xWt9zX85pypOXDMwoyqZK7rfMbpnzkA0NoIDEYuYvJJGmEjzO+8CWTQ5bplLrxc+Q
	 qraXXKyiqW7bkgcLJWMB5LxcaHh5fu6h+tKgv3cJjDKdWYEb/80MUHXWKoypr/WLRAjHp
	 fUUNonzcW/rrjrdLpj0IaTvZtvtNTStJ3a+Lt0dsDWFoSO9CyX96zZ/0UCoEqXHgVy99U
	 zp+qBP20Iyr/846BnFnlxeQ0KoqZloixslgBqh/r1Yu1Vwd8OIClSM493F6tVHWYqsuFd
	 fe+gtqhHywGrn6RjskY/G+kRvsNwkernds2Tp7Mh/4mXcglz3sCZWZYYSDAo86vxD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6wxM0rA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA3606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6wxM0rA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F491F01825
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793215376;
	bh=YgW7z2/wWcYNE6vFIw6PaupAVuPE4rl6qJWBPo/OcK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S6wxM0rAqLqBuFeZ3SV02XilYqZM/o515ZY52fY+JVmJmZ69Vbu79sLZiio1E6GUL
	 pDYS3JNoHMHxuNHPdwYCQb+DnktnC4ejR9J2QEH7HpyyJtdHXhZsoDdixLOgrZjtZd
	 FnqwtveB5J4kD//vs7YwvaZZJU8utON4j4/IfKR9WJSFtdr/l+jVcLmxtG48j6aJ/D
	 yUTjqCDjh5iSiXxW+KBng/6nUDvtKBo5drcL85W+Ax5zNn8X5kOESN8gu9m1YemjPq
	 taG1xj1LLamdLbnnB47cpwXglwARq/zDjugSV9R7i+NnPf3mS21QY/reXsSQ/0Tk1o
	 iIB5hXDJarnpQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so990466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxB9vsOsxRt//JZIGz4ODpU/PCHeS7jFDduAle5KnodYGWc9EWWN7/uyOQ6Vo3gLbGOksTsPiKFfPorFvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTXe+2YYYh0t9xYCt4PtdeY4ry/4EZEiqpUbq0ZZ0UMn5xK8M/
	r9z/qvft5I4a0C63x3z1dbI2qrpweSoat9ZOj/jXY/ysRSZd9or1gZ1ujAEZQnVNH7MjhUaHlWV
	pEXslkRhOH2UNTDWiJmfYff4BuuTyAYs=
X-Received: by 2002:a17:906:c112:b0:c41:9a35:17a2 with SMTP id
 a640c23a62f3a-c49d14eac79mr39390166b.31.1793215375607; Wed, 28 Oct 2026
 12:22:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
In-Reply-To: <20261028113619.38752-1-kaitao.cheng@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 28 Oct 2026 12:22:43 -0700
X-Gmail-Original-Message-ID: <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
X-Gm-Features: AclHuK-nDakba48q3yy7tQAgKOVWr5ALwdirufivl6co7xpMzm3953Jsvm2dlEM
Message-ID: <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on writeback
To: Kaitao Cheng <kaitao.cheng@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:36=E2=80=AFAM Kaitao Cheng <kaitao.cheng@linux.de=
v> wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Successful writeback calls zswap_entry_free(), which removes the entry
> from the LRU and decrements both the sublist and node item counts.
> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
> to decrement the node count again.

I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
LRU_DELETED instead to simply avoid the decrement.

Adding shrinker maintainers.

>
> The affected call path before this change is:
>
>   __list_lru_walk_one()
>     shrink_memcg_cb()
>       zswap_writeback_entry()
>         zswap_entry_free()
>           zswap_lru_del()
>             list_lru_del()
>               __list_lru_del()
>                 atomic_long_dec()  /* first node count decrement */
>       return LRU_REMOVED_RETRY
>     atomic_long_dec()              /* second node count decrement */
>
> Add zswap_lru_del_nocnt() to remove the entry and update only the sublist
> count, leaving node accounting to the walker. Split data cleanup into
> __zswap_entry_free() so writeback can free the entry without performing
> another LRU deletion. Other free paths retain their existing accounting.
>
> Fixes: 5878303c5353 ("mm/zswap: fix race between lru writeback and swapof=
f")
> Link: https://sashiko.dev/#/bug/linux-68d2ca49-23be-4504-9a75-b8526ec9238=
8
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  mm/zswap.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ad01c691a263..d0c98daddf2e 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -719,6 +719,22 @@ static void zswap_lru_del(struct zswap_entry *entry)
>         rcu_read_unlock();
>  }
>
> +/* Like zswap_lru_del(), but does not decrement the node item count. */
> +static void zswap_lru_del_nocnt(struct zswap_entry *entry)
> +{
> +       int nid =3D entry_to_nid(entry);
> +       struct mem_cgroup *memcg;
> +       struct list_lru_one *l;
> +
> +       rcu_read_lock();
> +       memcg =3D obj_cgroup_memcg(entry->objcg);
> +       l =3D list_lru_lock(&zswap_list_lru, nid, &memcg);
> +       if (!list_empty(&entry->lru))
> +               list_lru_isolate(l, &entry->lru);
> +       list_lru_unlock(l);
> +       rcu_read_unlock();
> +}
> +
>  void zswap_lruvec_state_init(struct lruvec *lruvec)
>  {
>         atomic_long_set(&lruvec->zswap_lruvec_state.nr_disk_swapins, 0);
> @@ -781,11 +797,10 @@ static void zswap_entry_cache_free(struct zswap_ent=
ry *entry)
>   * Carries out the common pattern of freeing an entry's zsmalloc allocat=
ion,
>   * freeing the entry itself, and decrementing the number of stored pages=
.
>   */
> -static void zswap_entry_free(struct zswap_entry *entry)
> +static void __zswap_entry_free(struct zswap_entry *entry)
>  {
>         struct zswap_pool *pool =3D zswap_entry_pool(entry);
>
> -       zswap_lru_del(entry);
>         if (!WARN_ON_ONCE(!pool)) {
>                 zs_free(pool->zs_pool, entry->handle);
>                 zswap_pool_put(pool);
> @@ -800,6 +815,12 @@ static void zswap_entry_free(struct zswap_entry *ent=
ry)
>         atomic_long_dec(&zswap_stored_pages);
>  }
>
> +static void zswap_entry_free(struct zswap_entry *entry)
> +{
> +       zswap_lru_del(entry);
> +       __zswap_entry_free(entry);
> +}
> +
>  /*********************************
>  * compressed storage functions
>  **********************************/
> @@ -1119,7 +1140,8 @@ static int zswap_writeback_entry(struct zswap_entry=
 *entry,
>         if (entry->objcg)
>                 count_objcg_events(entry->objcg, ZSWPWB, 1);
>
> -       zswap_entry_free(entry);
> +       zswap_lru_del_nocnt(entry);
> +       __zswap_entry_free(entry);
>
>         /* folio is up to date */
>         folio_mark_uptodate(folio);
> --
> 2.53.0
>
