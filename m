Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F648C8B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549788; cv=pass; b=LGzpYc/AgacEjF1oG73j+9pgqi4MC6FsPq2k2nqZnYCplxBpEH9+QZC7P9FWp58wMTuLEVWQs8HldPkLl4OLJwTkdRyqE46/dsSW3b0CfQfmVYjz2nS9P7qLSO3bPNF/Hn6VkYAIHUVmI81TBMwOxcr7btAC2F2jcRj1n0zoFVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549788; c=relaxed/simple;
	bh=wz/NdPjx3/zvPXdCcRofEV0Hxj1ce2E2m4ZMR1PDZ1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XzQpZVAk04iv9eemRVM7lqvsbo5G0AepAN4DiwKRc7C5pvx5HwACO7JfEeqPmWRHTeBkv7g89rwIrcUEdMrd+tdt1uaRvJIzf/SghrkCiAGBM/Q2KdM4erl+jKxfDPMerBQWPzQnK5kOWUORpWEy9S+EA1EtlZSzHubaR20ZGvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7KWM3jy; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7KWM3jy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so479935e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789549772; cv=none;
        d=google.com; s=arc-20260327;
        b=U1BnVkZZItBR2cf1O+sfXl0Ah2gF2XBN7PoA1z/cnMINcEcNz/0Qsp5TadhBRlrwH0
         q0bj4nb2IH6dW8XoGiKqU0S6zvLTeqdyUxBbYGKpQSDZQdktQgB2xgOGQ+/Lm3gEq6yk
         O3ESxhtAokiGPMCpDI+fV7BAYU8MTZNyWva/RTT+JE4VAO/V5mwra653XTDAiHjD5PE3
         eGa8ZT7+GU/eGbv+k4xlOMq7rojAErPwN4qE+ZYvXBPykcig0rbQLazUx8d+AHAEuMFm
         tQkBxC0HGgcwYmcw7h1nX6gHstBkICL62MtrhNgw81uRQYi1G5ftv26QvjSNIRetypL+
         o3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6imgTxkZJIt7+wWF4Wa+/fisUFhVJ1qnyiTw4wrjD8=;
        fh=u2myJIyDDw+U2CCcMwsTcc6/wIZor9bdiUAAPuJzOg4=;
        b=klU9OSiBb7P3XH2M332iWuU/DtSYaMbznFOiFTzYoSMJBMinvjQmcgzijcf0B9/w2x
         lzAm9hZOXNK8EMnLut0ySUjR+CqiumrzPKnYEmdfoqw/pqqtlPpXKAw3LeduPDMXv3sG
         1o5e33zwoRp/JYU/cKQ3TqQ4B3WxebZhyCl5bfP9Xl+04ypSVvO+HyUdHmc8L49+/9gA
         Fimp2r88JBqWlgV5yIrvKEQ/+OUXANxzGVMBYOfuTWkurVQeUrxNKRYA2pgBCa5DuNTV
         L229A1yrTC91Tx77E96YjSY2wNTdB5cKNguSOT2VgyTsA3DnkxdSU04harTLlkvFDukF
         y8mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549772; x=1790154572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6imgTxkZJIt7+wWF4Wa+/fisUFhVJ1qnyiTw4wrjD8=;
        b=T7KWM3jyiKtXzeKG0sww+S/+C1HYvzELky0m35vK29OgF4ajk81HijdQbu5SgdA2KG
         MASBtUrBcBOXFuwjcetoqZl29riGrhWPA6WsnuHSkmpkwbEf+ttHn8MkyNTfBnVjOYJs
         73k5Zvsm8V+DvKhpbmO/CDN/tyW2ZfNza9KcuBVzLDiN+BYrQ8ZS+7N3x2XTilTsYTnU
         bbWwxCbcyzWXTcyYOQRDOEVUDSDaSehrEmnvPF7gwBxa7xIOXpao4o4NbMVl1qkmkaND
         NBQazqKYoDguFki4M7upEqQ+hra3Vrhgcxk5SVOD+pRoGq+oL7howNgnevdTSn/jYnJU
         VSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549772; x=1790154572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6imgTxkZJIt7+wWF4Wa+/fisUFhVJ1qnyiTw4wrjD8=;
        b=fVqrDWDaBXAewZoMkrO+E1sAEz108n1b326avC1nD94FtUJUpw3U0e13ZXw5h9d+Vc
         8hDV0v8clTxr2GYPy518EkDW0MHXAdYftrw6/TANkIRSC4HJ9qrbf8kVLU1bsIjjQe5R
         dpFfpfxYpgq8PhRGjy/4gzDPJWppvAePwsxgkTCP6keMbz24rUsZtD9dmI+SRwVWiP0r
         8k8SoXsMTfyutHW0P224TF+Tjjspa9VB765PH8QhPm+MPn5r7LGDkeRcMGPH3BBduH7r
         IwSOvGXrbh4iZPpq/77ahLm1l6p1CCcRYEomC0iflTgjvkeoAsYPjs6keasJ8duUTfhV
         b3RA==
X-Forwarded-Encrypted: i=1; AKwUvBzqUG0po1wGSjK7v68qjo3qIPVgTR9hW+892ttBHKo23G4KdZlP8dau9hAAOFHLcP5ftz1SD7pWDzUkWwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nnm3grKismMllaiobgw+GR6BL+/dpVq6dwVSWc7rukdYwg74Et
	jhp3GHPELqaW/oSdCTIVayY1Oguoo/PnDzTv78cVSaL8Vdr1YcA/pp7UXF49/PIHfKqo6mwUTy2
	rg3q2zT+aY0AXvyom8IIzRjLLkBqFqgs=
X-Gm-Gg: AYBFou2IDBseW4BM8TR9OOrMITkXLzatkXLwHYha3g6kVNZShEpCQBVxRwbZ9d7GcyI
	xOOI3sVYiXx3cogXFBySIV3mTYb1vtJtrSgwTy6r4B/HfdHFCT4LrQsT+IaHZAHf83oXw8jqtTs
	rKwyovJ07+E1hK+mvfw4R1ZgBVH3le5jGnexuEgxlG4MyvtSZGJmrtt3OAwcfATctSc6zYURBQb
	POOaJB1Sc4dQJmkgHNom4HKLkJlLRQq5tABzi5QD+WyrN675Q6WO915ecjOEjCdJjICAMdIFTuP
	78XoKtfbvoYgRANcyO3WIAOd/7SjbXxlZcn/OjeUNmYMEiLVKrTknapL
X-Received: by 2002:a05:6000:208a:b0:486:fea4:f30d with SMTP id
 ffacd0b85a97d-4870d281932mr2196050f8f.5.1789549772156; Wed, 16 Sep 2026
 02:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-9-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-9-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 17:08:55 +0800
X-Gm-Features: AcwNN1Whb5ZmEjcuGOrTJYQyz0XzeeLWSh97zsT9m5G-tb5HO8qgNCO0eEy8avA
Message-ID: <CAHJ8P3LFF=WtxrD5xRasBiWCr4t8Jnu+EJnmWrLa5WC0JYn1NA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 08/12] f2fs: cache: initialize compress cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:57=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch introduces compress_blocks in f2fs_sb_info structure, initiali=
zes
> and destroys the compress cache during filesystem mount and unmount.
>
> It adds an ino union field in struct f2fs_cached_block (sharing space
> with writeback linkage for zero memory overhead) to track per-inode
> cached blocks, and registers compress cache into the memory shrinker.
>
> Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  fs/f2fs/cache.c |  9 ++++++++-
>  fs/f2fs/cache.h | 14 ++++++++++----
>  fs/f2fs/f2fs.h  |  6 ++++++
>  fs/f2fs/super.c |  7 +++++--
>  4 files changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 3abd469dc011..3e6a198ef3b3 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -176,7 +176,10 @@ static struct f2fs_cached_block *f2fs_create_cache(
>         entry->index =3D index;
>
>         atomic_set(&entry->refcount, 0);
> -       entry->next_entry =3D NULL;
> +       if (!IS_COMPRESS_CACHE(cache))
> +               entry->next_entry =3D NULL;
> +       else
> +               entry->ino =3D 0;
>         INIT_LIST_HEAD(&entry->list);
>
>         entry->cache =3D cache;
> @@ -631,6 +634,10 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info =
*sbi,
>                 return freed;
>
>         freed +=3D f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan - fre=
ed);
> +       if (freed >=3D nr_to_scan)
> +               return freed;
> +
> +       freed +=3D f2fs_do_shrink_cache(COMPRESS_CACHE(sbi), nr_to_scan -=
 freed);
>         return freed;
>  }
>
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index a36ee57adb1a..a8c24f5282fa 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -18,12 +18,15 @@ struct f2fs_rwsem;
>  struct f2fs_io_info;
>  enum page_type;
>
> -/* Represents a single cached block (meta, node) */
> +/* Represents a single cached block (meta, node or compress) */
>  struct f2fs_cached_block {
>         struct list_head list;          /* LRU list head */
>         struct f2fs_cached_block_list *cache;   /* parent cache list */
> -       struct f2fs_cached_block *next_entry;   /* chain for merged BIO *=
/
> -       unsigned long index;            /* key in radix tree, (meta: pba,=
 node: nid) */
> +       union {
> +               struct f2fs_cached_block *next_entry;/* chain for merged =
BIO */
> +               nid_t ino;              /* inode number for compress cach=
e */
> +       };
> +       unsigned long index;            /* key in radix tree, (meta/compr=
ess: pba, node: nid) */
>         unsigned long state;            /* cache entry state (e.g., Dirty=
, UpToDate) */
>         void *data;                     /* blocksize-aligned memory (4KB =
or 16KB) */
>         atomic_t refcount;              /* reference count */
> @@ -34,6 +37,7 @@ struct f2fs_sb_info;
>  enum f2fs_cache_type {
>         F2FS_META_CACHE,
>         F2FS_NODE_CACHE,
> +       F2FS_COMPRESS_CACHE,
>  };
>
>  /* Main cache control structure (per sb_info) */
> @@ -43,12 +47,13 @@ struct f2fs_cached_block_list {
>         spinlock_t tree_lock;           /* Lock for radix tree */
>         struct list_head lru_list;      /* Single global LRU list */
>         spinlock_t list_lock;           /* Lock for LRU list */
> -       enum f2fs_cache_type type;      /* Cache type (Node or Meta) */
> +       enum f2fs_cache_type type;      /* Cache type (Node, Meta, Compre=
ss) */
>         unsigned long num_entries;      /* Current number of entries */
>  };
>
>  #define IS_META_CACHE(cache) ((cache)->type =3D=3D F2FS_META_CACHE)
>  #define IS_NODE_CACHE(cache) ((cache)->type =3D=3D F2FS_NODE_CACHE)
> +#define IS_COMPRESS_CACHE(cache) ((cache)->type =3D=3D F2FS_COMPRESS_CAC=
HE)
>
>  /* Flags for f2fs_cached_block state */
>  enum f2fs_cached_state {
> @@ -196,6 +201,7 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_l=
ist *cache,
>
>  #define META_CACHE(sbi)                (&(sbi)->meta_blocks)
>  #define NODE_CACHE(sbi)                (&(sbi)->node_blocks)
> +#define COMPRESS_CACHE(sbi)    (&(sbi)->compress_blocks)
>
>  #define f2fs_find_meta_cache(sbi, blkaddr)             \
>         f2fs_find_cache(META_CACHE(sbi), blkaddr, 0)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d6681276708e..1e23e02cac8b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2106,6 +2106,7 @@ struct f2fs_sb_info {
>         /* f2fs internal cache */
>         struct f2fs_cached_block_list meta_blocks;
>         struct f2fs_cached_block_list node_blocks;
> +       struct f2fs_cached_block_list compress_blocks;
>
>         /* internal cache flush thread */
>         struct f2fs_cache_kthread cache_thread;
> @@ -2384,6 +2385,11 @@ static inline bool f2fs_is_node_cache(struct f2fs_=
cached_block *entry)
>         return entry->cache && entry->cache =3D=3D NODE_CACHE(entry->cach=
e->sbi);
>  }
>
> +static inline bool f2fs_is_compress_cache(struct f2fs_cached_block *entr=
y)
> +{
> +       return entry->cache && entry->cache =3D=3D COMPRESS_CACHE(entry->=
cache->sbi);
> +}
> +
>  static inline struct f2fs_bio *F2FS_BIO(struct bio *bio)
>  {
>         return container_of(bio, struct f2fs_bio, bio);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index bf42fbffa348..47259e8172fc 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2071,6 +2071,7 @@ static void f2fs_put_super(struct super_block *sb)
>
>         f2fs_destroy_compress_inode(sbi);
>
> +       f2fs_destroy_cache(COMPRESS_CACHE(sbi));
>         f2fs_destroy_cache(NODE_CACHE(sbi));
>         f2fs_destroy_cache(META_CACHE(sbi));
>
> @@ -5263,11 +5264,12 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
>
>         f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
>         f2fs_init_cache(sbi, NODE_CACHE(sbi), F2FS_NODE_CACHE);
> +       f2fs_init_cache(sbi, COMPRESS_CACHE(sbi), F2FS_COMPRESS_CACHE);
>
>         err =3D f2fs_get_valid_checkpoint(sbi);
>         if (err) {
>                 f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
> -               goto free_node_cache;
> +               goto free_compress_cache;
>         }
>
>         if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
> @@ -5582,7 +5584,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>  free_devices:
>         destroy_device_list(sbi);
>         kvfree(sbi->ckpt);
> -free_node_cache:
> +free_compress_cache:
> +       f2fs_destroy_cache(COMPRESS_CACHE(sbi));
>         f2fs_destroy_cache(NODE_CACHE(sbi));
>         f2fs_destroy_cache(META_CACHE(sbi));
>         f2fs_destroy_page_array_cache(sbi);
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
