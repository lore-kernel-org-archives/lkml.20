Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222268;
	b=n6qbEvRJr0v+7L7iU/+oBWKwknqilUtXl55YHMEV8rrmMNLCE61fLfPQs7CftxbKjoFa
	 FUj8vhcCu2SOYDr7Z5W2EJ5eOFOz53ExmxixIC1xryKZTkahS5fSY7yfLAHPhjixFfpBt
	 qe62+Z2u6COR/Ii9NP25E9MjuIrfXv0G6kP87zmy4FTQd+WiuvKnML3BpSYnkJi8Fp20u
	 tsQGYN880w7iisZQZaVZm9mpM/jkEiyQ0xCT2c6ctIde8WsL8Dgest6ytXmc9AWj8P8X9
	 Jllqd7aIeLZoeb4fZCPftsVeMfrapeqmiyH9nx2POvU8gM3nGjZBHNCKg5UmdYSRHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222268;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bFVSr8+8dATLg31dFwamym4P8jCwvwh5p0Hyb/YVr0k=;
	b=YJ8VzIfumU1VjqqrrElhcwaUDpnM7UGNzt4z2lJUWvXIjw6i7x6taHeE8LQn4cyfCb4s
	 xwi77GSlbuxCRkWfTFz3jJtKJfm7iirz6MQjOTSWIBkXAxaGNrQOAq2o7JusO5KxjvU9w
	 i1fLvNd6usc69p4M0yz7gtSImZ2XobwggVP3A4e8xknpl8TyQCtSJfJ+MB9ojEUGUHVAM
	 na3dnvkTWle0N8YYOaagQoQT/IUMuFqjxHymVyp4UISR8q3ip1CfrHQi9w2H/apduVfAx
	 i0Ix9oSDBiUeTUYhngcLPYniQI/diD8vO4+7KkQgtFUv9Bz4geYviSee/DTghlrNnDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tj+joqL6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A15606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tj+joqL6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8003E1F031E0
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793222267;
	bh=bFVSr8+8dATLg31dFwamym4P8jCwvwh5p0Hyb/YVr0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tj+joqL6wKJmqqbANZoAIxrmtm7nGAhMwaykibzHQ6SwQI3be6yhR0QwwOU/lVVFY
	 2LRwIGCccN4aBTKTerRlAmeAAAu0EUyN2LnUbhrSgmilCJQUUDIpPbqEetkZzGuf7r
	 t23ogMGKSrD2ieCBm89Ef6saioRYQpKQDarS1ce64rJErCXAWVLQJDO2iIQBoXwbxa
	 al0x73GtbSfi6VEYIm9Gjrax+9bm45XpV17N1swjGuGPLEIJCF6SINbqKFo5M9RDDc
	 3MmwRpcXFdu/A4ufZXGlx5NzQ/EkWXLoqiqKzALWzO5BBdSFJoiQCXaWaIjEQxzpl0
	 q42A/VuvoqV9w==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so229584166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBeiclLBlVYZ4S+6kRj1JqsGlcpEw74XOZ1RI/9mK7W2UGzrWSHQnblyvGJPaFlRBffjHApxRe3TCo4oQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIafMZIZdI/Qbw5tn10JDDOTdE76K9v5fFGzXKIG8++tKcjkXAD
	XtmtBuEKicHjdHmIzAvpLXj2Cq9zGJ+i9vY2imwMStXLUYYD2WOhDHzOormvWzmUNisCYDP+MjD
	c+z2StIeKhZ2KGWA5V31KuePhownxGI4=
X-Received: by 2002:a17:906:eec8:b0:c35:babe:ab44 with SMTP id
 a640c23a62f3a-c49bd9fe12cmr335775266b.0.1793222266258; Wed, 28 Oct 2026
 14:17:46 -0700 (PDT)
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
 <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com> <auJkvb-Lq0M5Enkz@cmpxchg.org>
In-Reply-To: <auJkvb-Lq0M5Enkz@cmpxchg.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 28 Oct 2026 14:17:34 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNFMV2Wi=+hnDsQe9nxoe5No3UdG638kJ5M24XU-bchyg@mail.gmail.com>
X-Gm-Features: AclHuK8kQ6KNTXFyuww-ujqEcIlqhs23cMzI_g9QvaCWbv51tToUuJHizYKTb-s
Message-ID: <CAO9r8zNFMV2Wi=+hnDsQe9nxoe5No3UdG638kJ5M24XU-bchyg@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on writeback
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kaitao Cheng <kaitao.cheng@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:10=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Wed, Oct 28, 2026 at 12:22:43PM -0700, Yosry Ahmed wrote:
> > On Wed, Oct 28, 2026 at 4:36=E2=80=AFAM Kaitao Cheng <kaitao.cheng@linu=
x.dev> wrote:
> > >
> > > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> > >
> > > Successful writeback calls zswap_entry_free(), which removes the entr=
y
> > > from the LRU and decrements both the sublist and node item counts.
> > > shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU wal=
ker
> > > to decrement the node count again.
> >
> > I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
> > LRU_DELETED instead to simply avoid the decrement.
>
> It bugs me that it's the walker, not the callback, that adjusts the
> count. That composes poorly with the normal list manipulation API.
>
> How about pushing the accounting into the isolation callback, which
> can then simply use __list_lru_del()?
>
> The tradeoff is that more things need to be passed into the isolation
> callback, but that seems reasonable. It does make the change noisy,
> however, and we might want something like Kaitao's change as a
> backportable fix first regardless.

I actually had the same thought initially, why is the walker updating
the counts? Then I reached the same conclusion that it would be too
noisy :)

I didn't look closely at the code but I agree in principle that it's
better if the callback is responsible for updating the count.

>
> Thoughts?
>
> ---
>
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binde=
r/page_range.rs
> index b0c797523bc2..157256e52dd0 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -24,7 +24,7 @@
>  use kernel::{
>      bindings,
>      error::Result,
> -    ffi::{c_ulong, c_void},
> +    ffi::{c_int, c_ulong, c_void},
>      mm::{virt, Mm, MmWithUser},
>      new_mutex, new_spinlock,
>      page::{Page, PAGE_SHIFT, PAGE_SIZE},
> @@ -684,8 +684,10 @@ fn drop(self: Pin<&mut Self>) {
>  /// Called by the shrinker.
>  #[no_mangle]
>  unsafe extern "C" fn rust_shrink_free_page(
> +    lru: *mut bindings::list_lru,
> +    l: *mut bindings::list_lru_one,
>      item: *mut bindings::list_head,
> -    lru: *mut bindings::list_lru_one,
> +    nid: c_int,
>      _cb_arg: *mut c_void,
>  ) -> bindings::lru_status {
>      // Fields that should survive after unlocking the lru lock.
> @@ -728,7 +730,7 @@ fn drop(self: Pin<&mut Self>) {
>          };
>
>          // SAFETY: The item is in this lru list, so it's okay to remove =
it.
> -        unsafe { bindings::list_lru_isolate(lru, item) };
> +        unsafe { bindings::__list_lru_del(lru, l, item, nid) };
>
>          // SAFETY: Both pointers are in bounds of the same allocation.
>          page_index =3D unsafe { info.offset_from(inner.pages) } as usize=
;
> @@ -746,7 +748,7 @@ fn drop(self: Pin<&mut Self>) {
>      }
>
>      // SAFETY: The lru lock is locked when this method is called.
> -    unsafe { bindings::spin_unlock(&raw mut (*lru).lock) };
> +    unsafe { bindings::spin_unlock(&raw mut (*l).lock) };
>
>      if let Some(vma) =3D check_vma(&vma_read, range_ptr) {
>          let user_page_addr =3D vma_addr + (page_index << PAGE_SHIFT);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 1bf37023fed6..2e858c05e30b 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -345,13 +345,14 @@ static void ttm_pool_type_give(struct ttm_pool_type=
 *pt, struct page *p)
>         mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
>  }
>
> -static enum lru_status take_one_from_lru(struct list_head *item,
> -                                        struct list_lru_one *list,
> +static enum lru_status take_one_from_lru(struct list_lru *lru,
> +                                        struct list_lru_one *l,
> +                                        struct list_head *item, int nid,
>                                          void *cb_arg)
>  {
>         struct page **out_page =3D cb_arg;
>         struct page *p =3D container_of(item, struct page, lru);
> -       list_lru_isolate(list, item);
> +       __list_lru_del(lru, l, item, nid);
>
>         *out_page =3D p;
>         return LRU_REMOVED;
> @@ -387,13 +388,14 @@ static void ttm_pool_type_init(struct ttm_pool_type=
 *pt, struct ttm_pool *pool,
>         spin_unlock(&shrinker_lock);
>  }
>
> -static enum lru_status pool_move_to_dispose_list(struct list_head *item,
> -                                                struct list_lru_one *lis=
t,
> +static enum lru_status pool_move_to_dispose_list(struct list_lru *lru,
> +                                                struct list_lru_one *l,
> +                                                struct list_head *item, =
int nid,
>                                                  void *cb_arg)
>  {
>         struct list_head *dispose =3D cb_arg;
>
> -       list_lru_isolate_move(list, item, dispose);
> +       __list_lru_move(lru, l, item, nid, dispose);
>
>         return LRU_REMOVED;
>  }
> diff --git a/fs/dcache.c b/fs/dcache.c
> index 37d021d22a7d..ce8063c2f5a6 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -556,24 +556,26 @@ static void d_shrink_add(struct dentry *dentry, str=
uct list_head *list)
>   * LRU lists entirely, while shrink_move moves it to the indicated
>   * private list.
>   */
> -static void d_lru_isolate(struct list_lru_one *lru, struct dentry *dentr=
y)
> +static void d_lru_isolate(struct list_lru *lru, struct list_lru_one *l,
> +                         struct dentry *dentry, int nid)
>  {
>         D_FLAG_VERIFY(dentry, DCACHE_LRU_LIST);
>         dentry->d_flags &=3D ~DCACHE_LRU_LIST;
>         this_cpu_dec(nr_dentry_unused);
>         if (d_is_negative(dentry))
>                 this_cpu_dec(nr_dentry_negative);
> -       list_lru_isolate(lru, &dentry->d_lru);
> +       __list_lru_del(lru, l, &dentry->d_lru, nid);
>  }
>
> -static void d_lru_shrink_move(struct list_lru_one *lru, struct dentry *d=
entry,
> +static void d_lru_shrink_move(struct list_lru *lru, struct list_lru_one =
*l,
> +                             struct dentry *dentry, int nid,
>                               struct list_head *list)
>  {
>         D_FLAG_VERIFY(dentry, DCACHE_LRU_LIST);
>         dentry->d_flags |=3D DCACHE_SHRINK_LIST;
>         if (d_is_negative(dentry))
>                 this_cpu_dec(nr_dentry_negative);
> -       list_lru_isolate_move(lru, &dentry->d_lru, list);
> +       __list_lru_move(lru, l, &dentry->d_lru, nid, list);
>  }
>
>  static void ___d_drop(struct dentry *dentry)
> @@ -1308,8 +1310,8 @@ void shrink_dentry_list(struct list_head *list)
>  }
>  EXPORT_SYMBOL(shrink_dentry_list);
>
> -static enum lru_status dentry_lru_isolate(struct list_head *item,
> -               struct list_lru_one *lru, void *arg)
> +static enum lru_status dentry_lru_isolate(struct list_lru *lru,
> +               struct list_lru_one *l, struct list_head *item, int nid, =
void *arg)
>  {
>         struct list_head *freeable =3D arg;
>         struct dentry   *dentry =3D container_of(item, struct dentry, d_l=
ru);
> @@ -1329,7 +1331,7 @@ static enum lru_status dentry_lru_isolate(struct li=
st_head *item,
>          * another pass through the LRU.
>          */
>         if (dentry->d_lockref.count) {
> -               d_lru_isolate(lru, dentry);
> +               d_lru_isolate(lru, l, dentry, nid);
>                 spin_unlock(&dentry->d_lock);
>                 return LRU_REMOVED;
>         }
> @@ -1360,7 +1362,7 @@ static enum lru_status dentry_lru_isolate(struct li=
st_head *item,
>                 return LRU_ROTATE;
>         }
>
> -       d_lru_shrink_move(lru, dentry, freeable);
> +       d_lru_shrink_move(lru, l, dentry, nid, freeable);
>         spin_unlock(&dentry->d_lock);
>
>         return LRU_REMOVED;
> @@ -1389,8 +1391,8 @@ long prune_dcache_sb(struct super_block *sb, struct=
 shrink_control *sc)
>         return freed;
>  }
>
> -static enum lru_status dentry_lru_isolate_shrink(struct list_head *item,
> -               struct list_lru_one *lru, void *arg)
> +static enum lru_status dentry_lru_isolate_shrink(struct list_lru *lru,
> +               struct list_lru_one *l, struct list_head *item, int nid, =
void *arg)
>  {
>         struct list_head *freeable =3D arg;
>         struct dentry   *dentry =3D container_of(item, struct dentry, d_l=
ru);
> @@ -1403,7 +1405,7 @@ static enum lru_status dentry_lru_isolate_shrink(st=
ruct list_head *item,
>         if (!spin_trylock(&dentry->d_lock))
>                 return LRU_SKIP;
>
> -       d_lru_shrink_move(lru, dentry, freeable);
> +       d_lru_shrink_move(lru, l, dentry, nid, freeable);
>         spin_unlock(&dentry->d_lock);
>
>         return LRU_REMOVED;
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index b2984fb7b35c..c8afe8236805 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -148,8 +148,8 @@ static void gfs2_qd_list_dispose(struct list_head *li=
st)
>  }
>
>
> -static enum lru_status gfs2_qd_isolate(struct list_head *item,
> -               struct list_lru_one *lru, void *arg)
> +static enum lru_status gfs2_qd_isolate(struct list_lru *lru,
> +               struct list_lru_one *l, struct list_head *item, int nid, =
void *arg)
>  {
>         struct list_head *dispose =3D arg;
>         struct gfs2_quota_data *qd =3D
> @@ -162,7 +162,7 @@ static enum lru_status gfs2_qd_isolate(struct list_he=
ad *item,
>         status =3D LRU_SKIP;
>         if (qd->qd_lockref.count =3D=3D 0) {
>                 lockref_mark_dead(&qd->qd_lockref);
> -               list_lru_isolate_move(lru, &qd->qd_lru, dispose);
> +               __list_lru_move(lru, l, &qd->qd_lru, nid, dispose);
>                 status =3D LRU_REMOVED;
>         }
>
> diff --git a/fs/inode.c b/fs/inode.c
> index 1cb6293b237a..675f4a8b9d95 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -929,8 +929,8 @@ EXPORT_SYMBOL_GPL(evict_inodes);
>   * LRU does not have strict ordering. Hence we don't want to reclaim ino=
des
>   * with this flag set because they are the inodes that are out of order.
>   */
> -static enum lru_status inode_lru_isolate(struct list_head *item,
> -               struct list_lru_one *lru, void *arg)
> +static enum lru_status inode_lru_isolate(struct list_lru *lru,
> +               struct list_lru_one *l, struct list_head *item, int nid, =
void *arg)
>  {
>         struct list_head *freeable =3D arg;
>         struct inode    *inode =3D container_of(item, struct inode, i_lru=
);
> @@ -951,7 +951,7 @@ static enum lru_status inode_lru_isolate(struct list_=
head *item,
>         if (icount_read(inode) ||
>             (inode_state_read(inode) & ~I_REFERENCED) ||
>             !mapping_shrinkable(&inode->i_data)) {
> -               list_lru_isolate(lru, &inode->i_lru);
> +               __list_lru_del(lru, l, &inode->i_lru, nid);
>                 spin_unlock(&inode->i_lock);
>                 this_cpu_dec(nr_unused);
>                 return LRU_REMOVED;
> @@ -974,7 +974,7 @@ static enum lru_status inode_lru_isolate(struct list_=
head *item,
>
>                 inode_pin_lru_isolating(inode);
>                 spin_unlock(&inode->i_lock);
> -               spin_unlock(&lru->lock);
> +               spin_unlock(&l->lock);
>                 reap =3D invalidate_mapping_pages(&inode->i_data, 0, -1);
>                 if (current_is_kswapd())
>                         __count_vm_events(KSWAPD_INODESTEAL, reap);
> @@ -987,7 +987,7 @@ static enum lru_status inode_lru_isolate(struct list_=
head *item,
>
>         WARN_ON(inode_state_read(inode) & I_NEW);
>         inode_state_set(inode, I_FREEING);
> -       list_lru_isolate_move(lru, &inode->i_lru, freeable);
> +       __list_lru_move(lru, l, &inode->i_lru, nid, freeable);
>         spin_unlock(&inode->i_lock);
>
>         this_cpu_dec(nr_unused);
> diff --git a/fs/nfs/nfs42xattr.c b/fs/nfs/nfs42xattr.c
> index 37d79400e5f4..17eb14b40830 100644
> --- a/fs/nfs/nfs42xattr.c
> +++ b/fs/nfs/nfs42xattr.c
> @@ -801,8 +801,8 @@ static struct shrinker *nfs4_xattr_entry_shrinker;
>  static struct shrinker *nfs4_xattr_large_entry_shrinker;
>
>  static enum lru_status
> -cache_lru_isolate(struct list_head *item,
> -       struct list_lru_one *lru, void *arg)
> +cache_lru_isolate(struct list_lru *lru, struct list_lru_one *l,
> +       struct list_head *item, int nid, void *arg)
>  {
>         struct list_head *dispose =3D arg;
>         struct inode *inode;
> @@ -827,7 +827,7 @@ cache_lru_isolate(struct list_head *item,
>         cache->inode =3D NULL;
>         NFS_I(inode)->xattr_cache =3D NULL;
>         NFS_I(inode)->cache_validity &=3D ~NFS_INO_INVALID_XATTR;
> -       list_lru_isolate(lru, &cache->lru);
> +       __list_lru_del(lru, l, &cache->lru, nid);
>
>         spin_unlock(&inode->i_lock);
>
> @@ -866,8 +866,8 @@ nfs4_xattr_cache_count(struct shrinker *shrink, struc=
t shrink_control *sc)
>  }
>
>  static enum lru_status
> -entry_lru_isolate(struct list_head *item,
> -       struct list_lru_one *lru, void *arg)
> +entry_lru_isolate(struct list_lru *lru, struct list_lru_one *l,
> +       struct list_head *item, int nid, void *arg)
>  {
>         struct list_head *dispose =3D arg;
>         struct nfs4_xattr_bucket *bucket;
> @@ -896,7 +896,7 @@ entry_lru_isolate(struct list_head *item,
>
>                 hlist_del_init(&entry->hnode);
>                 atomic_long_dec(&cache->nent);
> -               list_lru_isolate(lru, &entry->lru);
> +               __list_lru_del(lru, l, &entry->lru, nid);
>
>                 spin_unlock(&bucket->lock);
>         } else {
> @@ -907,7 +907,7 @@ entry_lru_isolate(struct list_head *item,
>                 kref_get(&entry->ref);
>
>                 cache->listxattr =3D NULL;
> -               list_lru_isolate(lru, &entry->lru);
> +               __list_lru_del(lru, l, &entry->lru, nid);
>
>                 spin_unlock(&cache->listxattr_lock);
>         }
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index 17a94e6fcb15..6b9165e5c3c5 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -509,8 +509,10 @@ void nfsd_file_net_dispose(struct nfsd_net *nn)
>
>  /**
>   * nfsd_file_lru_cb - Examine an entry on the LRU list
> - * @item: LRU entry to examine
>   * @lru: controlling LRU
> + * @l: locked sublist of @lru that holds @item
> + * @item: LRU entry to examine
> + * @nid: node id of @l
>   * @arg: dispose list
>   *
>   * Return values:
> @@ -519,8 +521,8 @@ void nfsd_file_net_dispose(struct nfsd_net *nn)
>   *   %LRU_SKIP: @item cannot be evicted
>   */
>  static enum lru_status
> -nfsd_file_lru_cb(struct list_head *item, struct list_lru_one *lru,
> -                void *arg)
> +nfsd_file_lru_cb(struct list_lru *lru, struct list_lru_one *l,
> +                struct list_head *item, int nid, void *arg)
>  {
>         struct list_head *head =3D arg;
>         struct nfsd_file *nf =3D list_entry(item, struct nfsd_file, nf_lr=
u);
> @@ -554,7 +556,7 @@ nfsd_file_lru_cb(struct list_head *item, struct list_=
lru_one *lru,
>
>         /* Refcount went to zero. Unhash it and queue it to the dispose l=
ist */
>         nfsd_file_unhash(nf);
> -       list_lru_isolate(lru, &nf->nf_lru);
> +       __list_lru_del(lru, l, &nf->nf_lru, nid);
>         list_add(&nf->nf_gc, head);
>         this_cpu_inc(nfsd_file_evictions);
>         trace_nfsd_file_gc_disposed(nf);
> @@ -562,8 +564,8 @@ nfsd_file_lru_cb(struct list_head *item, struct list_=
lru_one *lru,
>  }
>
>  static enum lru_status
> -nfsd_file_gc_cb(struct list_head *item, struct list_lru_one *lru,
> -                void *arg)
> +nfsd_file_gc_cb(struct list_lru *lru, struct list_lru_one *l,
> +                struct list_head *item, int nid, void *arg)
>  {
>         struct nfsd_file *nf =3D list_entry(item, struct nfsd_file, nf_lr=
u);
>
> @@ -576,7 +578,7 @@ nfsd_file_gc_cb(struct list_head *item, struct list_l=
ru_one *lru,
>                 trace_nfsd_file_gc_aged(nf);
>                 return LRU_ROTATE;
>         }
> -       return nfsd_file_lru_cb(item, lru, arg);
> +       return nfsd_file_lru_cb(lru, l, item, nid, arg);
>  }
>
>  static void
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 6c93b4f5629c..436aca8f6619 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -1467,8 +1467,10 @@ __xfs_buf_mark_corrupt(
>   */
>  static enum lru_status
>  xfs_buftarg_drain_rele(
> +       struct list_lru         *lru,
> +       struct list_lru_one     *l,
>         struct list_head        *item,
> -       struct list_lru_one     *lru,
> +       int                     nid,
>         void                    *arg)
>
>  {
> @@ -1485,7 +1487,7 @@ xfs_buftarg_drain_rele(
>         }
>
>         xfs_buf_kill(bp);
> -       list_lru_isolate_move(lru, item, dispose);
> +       __list_lru_move(lru, l, item, nid, dispose);
>         spin_unlock(&bp->b_lockref.lock);
>         return LRU_REMOVED;
>  }
> @@ -1560,8 +1562,10 @@ xfs_buftarg_drain(
>
>  static enum lru_status
>  xfs_buftarg_isolate(
> +       struct list_lru         *lru,
> +       struct list_lru_one     *l,
>         struct list_head        *item,
> -       struct list_lru_one     *lru,
> +       int                     nid,
>         void                    *arg)
>  {
>         struct xfs_buf          *bp =3D container_of(item, struct xfs_buf=
, b_lru);
> @@ -1581,7 +1585,7 @@ xfs_buftarg_isolate(
>          * yet.
>          */
>         if (bp->b_lockref.count > 0) {
> -               list_lru_isolate(lru, &bp->b_lru);
> +               __list_lru_del(lru, l, &bp->b_lru, nid);
>                 spin_unlock(&bp->b_lockref.lock);
>                 return LRU_REMOVED;
>         }
> @@ -1597,7 +1601,7 @@ xfs_buftarg_isolate(
>         }
>
>         xfs_buf_kill(bp);
> -       list_lru_isolate_move(lru, item, dispose);
> +       __list_lru_move(lru, l, item, nid, dispose);
>         spin_unlock(&bp->b_lockref.lock);
>         return LRU_REMOVED;
>  }
> diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
> index dd5011f578a6..3933dd222509 100644
> --- a/fs/xfs/xfs_qm.c
> +++ b/fs/xfs/xfs_qm.c
> @@ -411,10 +411,12 @@ struct xfs_qm_isolate {
>
>  static enum lru_status
>  xfs_qm_dquot_isolate(
> +       struct list_lru         *lru,
> +       struct list_lru_one     *l,
>         struct list_head        *item,
> -       struct list_lru_one     *lru,
> +       int                     nid,
>         void                    *arg)
> -               __releases(&lru->lock) __acquires(&lru->lock)
> +               __releases(&l->lock) __acquires(&l->lock)
>  {
>         struct xfs_dquot        *dqp =3D container_of(item,
>                                                 struct xfs_dquot, q_lru);
> @@ -450,7 +452,7 @@ xfs_qm_dquot_isolate(
>                 XFS_STATS_INC(dqp->q_mount, xs_qm_dqwants);
>
>                 trace_xfs_dqreclaim_want(dqp);
> -               list_lru_isolate(lru, &dqp->q_lru);
> +               __list_lru_del(lru, l, &dqp->q_lru, nid);
>                 XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
>                 return LRU_REMOVED;
>         }
> @@ -473,7 +475,7 @@ xfs_qm_dquot_isolate(
>         lockref_mark_dead(&dqp->q_lockref);
>         spin_unlock(&dqp->q_lockref.lock);
>
> -       list_lru_isolate_move(lru, &dqp->q_lru, &isol->dispose);
> +       __list_lru_move(lru, l, &dqp->q_lru, nid, &isol->dispose);
>         XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
>         trace_xfs_dqreclaim_done(dqp);
>         XFS_STATS_INC(dqp->q_mount, xs_qm_dqreclaims);
> diff --git a/include/linux/list_lru.h b/include/linux/list_lru.h
> index a450fffe1550..f6d94474a4c7 100644
> --- a/include/linux/list_lru.h
> +++ b/include/linux/list_lru.h
> @@ -150,6 +150,15 @@ bool __list_lru_add(struct list_lru *lru, struct lis=
t_lru_one *l,
>  bool __list_lru_del(struct list_lru *lru, struct list_lru_one *l,
>                 struct list_head *item, int nid);
>
> +/* Take @item off the locked sublist @l and put it on a private list @he=
ad */
> +static inline void __list_lru_move(struct list_lru *lru, struct list_lru=
_one *l,
> +                                  struct list_head *item, int nid,
> +                                  struct list_head *head)
> +{
> +       __list_lru_del(lru, l, item, nid);
> +       list_add(item, head);
> +}
> +
>  /**
>   * list_lru_add: add an element to the lru list's tail
>   * @lru: the lru pointer
> @@ -271,12 +280,9 @@ static inline unsigned long list_lru_count(struct li=
st_lru *lru)
>         return count;
>  }
>
> -void list_lru_isolate(struct list_lru_one *list, struct list_head *item)=
;
> -void list_lru_isolate_move(struct list_lru_one *list, struct list_head *=
item,
> -                          struct list_head *head);
> -
> -typedef enum lru_status (*list_lru_walk_cb)(struct list_head *item,
> -               struct list_lru_one *list, void *cb_arg);
> +typedef enum lru_status (*list_lru_walk_cb)(struct list_lru *lru,
> +               struct list_lru_one *l, struct list_head *item, int nid,
> +               void *cb_arg);
>
>  /**
>   * list_lru_walk_one: walk a @lru, isolating and disposing freeable item=
s.
> @@ -289,11 +295,14 @@ typedef enum lru_status (*list_lru_walk_cb)(struct =
list_head *item,
>   * @nr_to_walk: how many items to scan.
>   *
>   * This function will scan all elements in a particular @lru, calling th=
e
> - * @isolate callback for each of those items, along with the current lis=
t
> - * spinlock and a caller-provided opaque. The @isolate callback can choo=
se to
> + * @isolate callback for each of those items, along with the locked subl=
ist
> + * and a caller-provided opaque. The @isolate callback can choose to
>   * drop the lock internally, but *must* return with the lock held. The c=
allback
>   * will return an enum lru_status telling the @lru infrastructure what t=
o
> - * do with the object being scanned.
> + * do with the object being scanned. A callback that takes the item off
> + * the lru does so with __list_lru_del() or __list_lru_move(), or with
> + * list_lru_del() once it has dropped the lock, and returns LRU_REMOVED
> + * or LRU_REMOVED_RETRY.
>   *
>   * Please note that @nr_to_walk does not mean how many objects will be f=
reed,
>   * just how many objects will be scanned.
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index bd44d58e8684..87722e1a7eee 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4638,8 +4638,9 @@ static bool thp_underused(struct folio *folio)
>         return false;
>  }
>
> -static enum lru_status deferred_split_isolate(struct list_head *item,
> -                                             struct list_lru_one *lru,
> +static enum lru_status deferred_split_isolate(struct list_lru *lru,
> +                                             struct list_lru_one *l,
> +                                             struct list_head *item, int=
 nid,
>                                               void *cb_arg)
>  {
>         struct folio *folio =3D container_of(item, struct folio, _deferre=
d_list);
> @@ -4649,7 +4650,7 @@ static enum lru_status deferred_split_isolate(struc=
t list_head *item,
>         if (!folio_try_get(folio))
>                 return LRU_SKIP;
>
> -       list_lru_isolate_move(lru, item, freeable);
> +       __list_lru_move(lru, l, item, nid, freeable);
>         return LRU_REMOVED;
>  }
>
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index d1d256822ccc..9469117aa424 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -218,6 +218,7 @@ bool __list_lru_del(struct list_lru *lru, struct list=
_lru_one *l,
>         }
>         return false;
>  }
> +EXPORT_SYMBOL_GPL(__list_lru_del);
>
>  /* The caller must ensure the memcg lifetime. */
>  bool list_lru_add(struct list_lru *lru, struct list_head *item, int nid,
> @@ -291,21 +292,6 @@ bool list_lru_del_obj(struct list_lru *lru, struct l=
ist_head *item)
>  }
>  EXPORT_SYMBOL_GPL(list_lru_del_obj);
>
> -void list_lru_isolate(struct list_lru_one *list, struct list_head *item)
> -{
> -       list_del_init(item);
> -       list->nr_items--;
> -}
> -EXPORT_SYMBOL_GPL(list_lru_isolate);
> -
> -void list_lru_isolate_move(struct list_lru_one *list, struct list_head *=
item,
> -                          struct list_head *head)
> -{
> -       list_move(item, head);
> -       list->nr_items--;
> -}
> -EXPORT_SYMBOL_GPL(list_lru_isolate_move);
> -
>  unsigned long list_lru_count_one(struct list_lru *lru,
>                                  int nid, struct mem_cgroup *memcg)
>  {
> @@ -338,7 +324,6 @@ __list_lru_walk_one(struct list_lru *lru, int nid, st=
ruct mem_cgroup *memcg,
>                     list_lru_walk_cb isolate, void *cb_arg,
>                     unsigned long *nr_to_walk, bool irq_off)
>  {
> -       struct list_lru_node *nlru =3D &lru->node[nid];
>         struct list_lru_one *l =3D NULL;
>         struct list_head *item, *n;
>         unsigned long isolated =3D 0;
> @@ -359,7 +344,7 @@ __list_lru_walk_one(struct list_lru *lru, int nid, st=
ruct mem_cgroup *memcg,
>                         break;
>                 --*nr_to_walk;
>
> -               ret =3D isolate(item, l, cb_arg);
> +               ret =3D isolate(lru, l, item, nid, cb_arg);
>                 switch (ret) {
>                 /*
>                  * LRU_RETRY, LRU_REMOVED_RETRY and LRU_STOP will drop th=
e lru
> @@ -371,7 +356,6 @@ __list_lru_walk_one(struct list_lru *lru, int nid, st=
ruct mem_cgroup *memcg,
>                         fallthrough;
>                 case LRU_REMOVED:
>                         isolated++;
> -                       atomic_long_dec(&nlru->nr_items);
>                         if (ret =3D=3D LRU_REMOVED_RETRY)
>                                 goto restart;
>                         break;
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 3c0c7edd2020..e4c1d9dfcfa2 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -852,8 +852,9 @@ struct shmem_unused_huge_scan {
>         struct shrink_control *sc;
>  };
>
> -static enum lru_status shmem_unused_huge_isolate(struct list_head *item,
> -                                                struct list_lru_one *lru=
,
> +static enum lru_status shmem_unused_huge_isolate(struct list_lru *lru,
> +                                                struct list_lru_one *l,
> +                                                struct list_head *item, =
int nid,
>                                                  void *arg)
>  {
>         struct shmem_unused_huge_scan *scan =3D arg;
> @@ -874,14 +875,14 @@ static enum lru_status shmem_unused_huge_isolate(st=
ruct list_head *item,
>         inode =3D igrab(&info->vfs_inode);
>         /* inode is about to be evicted */
>         if (!inode) {
> -               list_lru_isolate(lru, item);
> +               __list_lru_del(lru, l, item, nid);
>                 objcg =3D shmem_get_and_clear_objcg(info);
>                 spin_unlock(&info->lock);
>                 obj_cgroup_put(objcg);
>                 return LRU_REMOVED;
>         }
>
> -       list_lru_isolate(lru, item);
> +       __list_lru_del(lru, l, item, nid);
>         objcg =3D shmem_get_and_clear_objcg(info);
>         set_shmem_unused_huge_isolated(info);
>         list_add_tail(&info->shrinklist, &scan->list);
> diff --git a/mm/workingset.c b/mm/workingset.c
> index 1504f91cdca5..c5d5690bda9f 100644
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@ -706,9 +706,10 @@ static unsigned long count_shadow_nodes(struct shrin=
ker *shrinker,
>         return nodes - max_nodes;
>  }
>
> -static enum lru_status shadow_lru_isolate(struct list_head *item,
> -                                         struct list_lru_one *lru,
> -                                         void *arg) __must_hold(lru->loc=
k)
> +static enum lru_status shadow_lru_isolate(struct list_lru *lru,
> +                                         struct list_lru_one *l,
> +                                         struct list_head *item, int nid=
,
> +                                         void *arg) __must_hold(l->lock)
>  {
>         struct xa_node *node =3D container_of(item, struct xa_node, priva=
te_list);
>         struct address_space *mapping;
> @@ -717,20 +718,20 @@ static enum lru_status shadow_lru_isolate(struct li=
st_head *item,
>         /*
>          * Page cache insertions and deletions synchronously maintain
>          * the shadow node LRU under the i_pages lock and the
> -        * &lru->lock. Because the page cache tree is emptied before
> -        * the inode can be destroyed, holding the &lru->lock pins any
> +        * &l->lock. Because the page cache tree is emptied before
> +        * the inode can be destroyed, holding the &l->lock pins any
>          * address_space that has nodes on the LRU.
>          *
>          * We can then safely transition to the i_pages lock to
>          * pin only the address_space of the particular node we want
> -        * to reclaim, take the node off-LRU, and drop the &lru->lock.
> +        * to reclaim, take the node off-LRU, and drop the &l->lock.
>          */
>
>         mapping =3D container_of(node->array, struct address_space, i_pag=
es);
>
>         /* Coming from the list, invert the lock order */
>         if (!xa_trylock(&mapping->i_pages)) {
> -               spin_unlock_irq(&lru->lock);
> +               spin_unlock_irq(&l->lock);
>                 ret =3D LRU_RETRY;
>                 goto out;
>         }
> @@ -739,16 +740,16 @@ static enum lru_status shadow_lru_isolate(struct li=
st_head *item,
>         if (mapping->host !=3D NULL) {
>                 if (!spin_trylock(&mapping->host->i_lock)) {
>                         xa_unlock(&mapping->i_pages);
> -                       spin_unlock_irq(&lru->lock);
> +                       spin_unlock_irq(&l->lock);
>                         ret =3D LRU_RETRY;
>                         goto out;
>                 }
>         }
>
> -       list_lru_isolate(lru, item);
> +       __list_lru_del(lru, l, item, nid);
>         __dec_node_page_state(virt_to_page(node), WORKINGSET_NODES);
>
> -       spin_unlock(&lru->lock);
> +       spin_unlock(&l->lock);
>
>         /*
>          * The nodes should only contain one or more shadow entries,
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ad01c691a263..72eae0745b62 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1177,8 +1177,8 @@ static int zswap_writeback_entry(struct zswap_entry=
 *entry,
>   *    can expect from writeback. We scale down the number of objects ava=
ilable
>   *    for reclaim by this ratio.
>   */
> -static enum lru_status shrink_memcg_cb(struct list_head *item, struct li=
st_lru_one *l,
> -                                      void *arg)
> +static enum lru_status shrink_memcg_cb(struct list_lru *lru, struct list=
_lru_one *l,
> +                                      struct list_head *item, int nid, v=
oid *arg)
>  {
>         struct zswap_entry *entry =3D container_of(item, struct zswap_ent=
ry, lru);
>         bool *encountered_page_in_swapcache =3D (bool *)arg;
> --
> 2.56.0
