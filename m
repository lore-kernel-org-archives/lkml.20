Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357A425785C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009917; cv=pass; b=Vfiyo/jQHzxxvEZVvAhIXc6ah/dCyR+lGmeM4fwBBhodAiqG+8OXPX5hNdQFgtfncb7UA0FC84dgXKagguKjPF4xrY9bt+nwZFHtTPBZ0CVYPauxHBh6ns+ZhuoQye4pVg7yf3EKigYj7uiFFXab+STqmFr5KUFJZynOSn3oVB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009917; c=relaxed/simple;
	bh=+HHtbDgx6gc/wHgACvQ/og15rxyfYvUh5F6wtJpYyC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYfGQvpYOy2TbE3KWJ0ftkVbBpQs75T8stWTcoE2VkfOV1VMmqb6cV1LQTr756E05rX1i3h80aiSSGC1aipkeQ2ub3vXbIgpmLygONYtNVayGgkBNIPJ0eBpZoH7kzQUJ2Pew81h+ovGveJ7NYR38TcHnPfd+blBr8iuYbQqKC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csEgHp7v; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csEgHp7v"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so676306f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789009913; cv=none;
        d=google.com; s=arc-20260327;
        b=hSeHFPBojjR48P+uINX0MECAAa9AsXnsqRCC1K18JmpO30u8RcwaOFdwOiMC8LubmC
         2/0LNFgUj6hXMQJArRiFY6ewgOeKJssQy7lLtiMqEaYDKbnsIqgYRDT9iLtW+2vUl1kZ
         L9Y2atIMCGrDFcH/kfDZ3u5OjMciCv2uBHXZ7NmZgA99DOXdfi3UVIYHVLOTeAB970yW
         qFyZbp7dCYpUzBNthMVmjQUGenkHoclu7SH16V6vgrSAv8SceZlwhka0aUyxJZlNCe72
         zTIMkgDQe3/gpO0ya91jWRwhxx4mDaw9uuoFOvAl5mpc9U4MJbuSodKh/aO1EAranZ3B
         +VFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xVkCKzX4VeQmHjXiQxd2MWrUlBf8N1GMoTe11gVJYQk=;
        fh=Uz3upw1QgQtS2e0qIiTFWHIoyyjBxu8LiAlJU23JonU=;
        b=OttcVvMLkI71rebpESMN6FUkXaocXniUW7KvxncBjX9FtHpO0y67SZCOaZfmLtz5jK
         IQKh1os4eUJ8EnZ6vF52yln+zGss1oZEUj24Ko8M8mpZp9oQcyT2doGy9jYJSJGGtWkA
         dUieDdG+GKtwPoTDWgzCwjFInYBAAglqSFnpYneDR/Y3sd62wnftfvDVSlFRF1xME1GN
         uOYfe2kvaWh3/kf3O7cw9pdccXsIhZa+AMeLsZtW1MIrxKDgga/1G79eqwsqDSGO4r3q
         l3B2d0WTYx2oScP/jT0pF49EnbB8rBhfOQxDRYRHrsrp/LkFpl+YBcvfeIm5KFir2Pj6
         SycQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789009913; x=1789614713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVkCKzX4VeQmHjXiQxd2MWrUlBf8N1GMoTe11gVJYQk=;
        b=csEgHp7vdi7YD5AVGX3ftjpa3tyToaMbSSTHRrvOUYQNEMWz26yGtI3snE3TdmQalN
         /rLlAU8AqbVQ/gDzGDR82JSpcoH6+lGmXljOtEv3ugwCQP3yGqbrXaE1X+63jVh9pPfl
         C3aSacict6Plk4OIBa2sVEzOiCqI5Z9ChNh0ykNydvQlchEOHU1V14j6twe3XbtDesGd
         EEQOrTBtfG85WKSvx4QBScc3mh9l0PF1HPTYWlAZd4wsB37U8Aw/9rP9lROH3Rvt9P/F
         4j238BbBepvllKna4QLm5RLLoJmnN2EHuios6V2vxprL0f6caG+VVhS+xf7gPwxML417
         zYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789009913; x=1789614713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVkCKzX4VeQmHjXiQxd2MWrUlBf8N1GMoTe11gVJYQk=;
        b=R6/HlSny//4WSXK0neNtykdLFuhP1Miz9GdQ6GcBPTFPTHxuRozV6u29qdL2AtMuwv
         BlJ+4iny+R0lzsF9G+qazVnOcQ7meVui865MdHMDe2oIRNF0W5OHuKA/pP+c0cBrZA2e
         +wuGQ5Pex6oFJW84+/RvxaMQpGIys7B/Cv+NHIr0GuS7mu0xDusQ/SbrJFV6xxctFPor
         Pqkwvr1/E8RQWEVUApQfEZlF6EbtpHm7ibbcQ7UlARtaIYgjYPrZ9mwfvIEgpovcetEi
         y+4Yc1tY4w3X0ajip0Ij3p6vkw8uPRXPRlesJXvaFPsM3kWUIqZj/jT3M8kQ6XQUJ1cE
         3VyQ==
X-Forwarded-Encrypted: i=1; AKwUvByd10BeJOFlNHk6I6xU1W3Vz55gUrVuFsZ8zdz0TF2RVHWZ0WBnhdgUHx7OHeTF9SUAnlUwxYfFUoheNLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kbvCb7ILxMG+CDj8Bbwaqusk6m+BjolVkP0ND2/5VSJHSMGbKH
	xaMMJ+YAzwr0fOHz02iCMXq2aRidwzb6qxMxJ+rFHSIK5AF0jLECp8LWhmYRUoap92I6et1W976
	R62Hiyl9CBiDfGoiNwmWg18yjLbIGvAk=
X-Gm-Gg: AYBFou1w+eYEuH/NjjhUA6WY3edc14+raV/MJeQbKP7BTFiAOXYX1ZFXtMPE+dLB5Ir
	fHKNYhLF8Bxw5toFy8s52+eJWb19Q8SspcHCdyYa2rPRZLasNEh8RJHZYJmPrXjerY6zt9GqyKl
	cEX60OzJ3u2/oJ1R5bVC0QnP+wA/xITnojil5P+yVRHGE9Wr2tmAr2YYb9t3twx+vrISETPoH8j
	fuOzaHLA8Cj293c1NYPzU/FjhVWjYmL02abYzg9Up8wOp9eHzkFZFPsArx9t/7dwF+vstuWL/vD
	tn1fEmCb3xcaJlkH7ZlfjRtiB+/nWRRwe0KVOeDVnInAMtoyLpMgK1ty
X-Received: by 2002:adf:e001:0:20b0:485:a9b4:9883 with SMTP id
 ffacd0b85a97d-485a9b498b4mr7685484f8f.1.1789009912963; Wed, 09 Sep 2026
 20:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910022026.3301257-1-chao@kernel.org>
In-Reply-To: <20260910022026.3301257-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 10 Sep 2026 11:11:41 +0800
X-Gm-Features: AcwNN1X-KlZACcf5515s8lAeNLVvT-eSqEYhBnsbw_qZc79PKxbPQVo3RVVMAEE
Message-ID: <CAHJ8P3+9zsTEn9viqV=F+wTeE1VM+JgVsTOHtLG-iRYavMrKZw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid folio->mapping dereference
 in is_{meta, node}_folio()
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>, stable@kernel.org, 
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 10:22=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> Otherwise, it may cause NULL pointer dereference in race condition:
>
> Thread A                        Thread B
>                                 - f2fs_setattr
>                                  - f2fs_truncate
>                                   - f2fs_truncate_blocks
>                                    - f2fs_do_truncate_blocks
>                                     - f2fs_truncate_inode_blocks
>                                      - truncate_dnode
>                                       - truncate_node
>                                        - invalidate_mapping_pages
>                                         - folio->mapping =3D NULL
> - folio_lock
> - is_node_folio
>  - F2FS_F_SB(folio): dereference on folio->mapping
>
> Cc: stable@kernel.org
> Fixes: 019a8912425e ("f2fs: introduce is_{meta,node}_folio")
> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Closes: https://lore.kernel.org/linux-f2fs-devel/c5d29b31-e764-4782-9639-=
be84b1b2bfc2@kernel.org
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!

> ---
>  fs/f2fs/checkpoint.c |  4 ++--
>  fs/f2fs/data.c       |  7 ++++---
>  fs/f2fs/f2fs.h       | 10 +++++-----
>  fs/f2fs/gc.c         |  2 +-
>  fs/f2fs/node.c       | 22 +++++++++++-----------
>  fs/f2fs/segment.c    |  2 +-
>  6 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 712c4508f38c..dfbfe42086f2 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -291,7 +291,7 @@ static struct folio *__get_meta_folio(struct f2fs_sb_=
info *sbi, pgoff_t index,
>         f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE(sbi))=
;
>
>         folio_lock(folio);
> -       if (unlikely(!is_meta_folio(folio))) {
> +       if (unlikely(!is_meta_folio(sbi, folio))) {
>                 f2fs_folio_put(folio, true);
>                 goto repeat;
>         }
> @@ -638,7 +638,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, l=
ong nr_to_write,
>
>                         folio_lock(folio);
>
> -                       if (unlikely(!is_meta_folio(folio))) {
> +                       if (unlikely(!is_meta_folio(sbi, folio))) {
>  continue_unlock:
>                                 folio_unlock(folio);
>                                 continue;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 93ed8416a289..0da78bf05ac0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -172,7 +172,8 @@ static void f2fs_finish_read_bio(struct bio *bio, boo=
l in_task)
>                         dec_page_count(F2FS_F_SB(folio), __read_io_type(f=
olio));
>
>                 if (bio->bi_status =3D=3D BLK_STS_OK &&
> -                       F2FS_F_SB(folio)->node_inode && is_node_folio(fol=
io) &&
> +                       F2FS_F_SB(folio)->node_inode &&
> +                       is_node_folio(F2FS_F_SB(folio), folio) &&
>                         f2fs_sanity_check_node_footer(F2FS_F_SB(folio),
>                                 folio, folio->index, NODE_TYPE_REGULAR, t=
rue))
>                         bio->bi_status =3D BLK_STS_IOERR;
> @@ -359,12 +360,12 @@ static void f2fs_write_end_bio(struct bio *bio)
>                         }
>                 }
>
> -               if (is_node_folio(folio)) {
> +               if (is_node_folio(sbi, folio)) {
>                         f2fs_sanity_check_node_footer(sbi, folio,
>                                 folio->index, NODE_TYPE_REGULAR, true);
>                         f2fs_bug_on(sbi, folio->index !=3D nid_of_node(sb=
i, folio));
>                 }
> -               if (f2fs_in_warm_node_list(folio))
> +               if (f2fs_in_warm_node_list(sbi, folio))
>                         f2fs_del_fsync_node_entry(sbi, folio);
>
>                 dec_page_count(sbi, type);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 693153cbd8a0..ebc621f302e1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2371,14 +2371,14 @@ static inline struct address_space *NODE_MAPPING(=
struct f2fs_sb_info *sbi)
>         return sbi->node_inode->i_mapping;
>  }
>
> -static inline bool is_meta_folio(struct folio *folio)
> +static inline bool is_meta_folio(struct f2fs_sb_info *sbi, struct folio =
*folio)
>  {
> -       return folio->mapping =3D=3D META_MAPPING(F2FS_F_SB(folio));
> +       return folio->mapping =3D=3D META_MAPPING(sbi);
>  }
>
> -static inline bool is_node_folio(struct folio *folio)
> +static inline bool is_node_folio(struct f2fs_sb_info *sbi, struct folio =
*folio)
>  {
> -       return folio->mapping =3D=3D NODE_MAPPING(F2FS_F_SB(folio));
> +       return folio->mapping =3D=3D NODE_MAPPING(sbi);
>  }
>
>  static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned in=
t type)
> @@ -4063,7 +4063,7 @@ enum node_type;
>
>  int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
>  bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
> -bool f2fs_in_warm_node_list(struct folio *folio);
> +bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *foli=
o);
>  void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
>  void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct folio *f=
olio);
>  void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index aedb45c8ee4a..c70deac9f1a3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1431,7 +1431,7 @@ static int move_data_block(struct inode *inode, blo=
ck_t bidx,
>                                                 F2FS_BLKSIZE(fio.sbi));
>
>                 folio_lock(mfolio);
> -               if (unlikely(!is_meta_folio(mfolio) ||
> +               if (unlikely(!is_meta_folio(fio.sbi, mfolio) ||
>                              !folio_test_uptodate(mfolio))) {
>                         err =3D -EIO;
>                         f2fs_folio_put(mfolio, true);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 8c150d4966e5..f16144b75d11 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -332,10 +332,10 @@ static unsigned int __gang_lookup_nat_set(struct f2=
fs_nm_info *nm_i,
>                                                         start, nr);
>  }
>
> -bool f2fs_in_warm_node_list(struct folio *folio)
> +bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *foli=
o)
>  {
> -       return is_node_folio(folio) && IS_DNODE(F2FS_F_SB(folio), folio) =
&&
> -                                       is_cold_node(F2FS_F_SB(folio), fo=
lio);
> +       return is_node_folio(sbi, folio) && IS_DNODE(sbi, folio) &&
> +                                       is_cold_node(sbi, folio);
>  }
>
>  void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
> @@ -1296,7 +1296,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode,=
 pgoff_t from)
>                         goto fail;
>                 if (offset[1] =3D=3D 0 && get_nid(sbi, folio, offset[0], =
true)) {
>                         folio_lock(folio);
> -                       BUG_ON(!is_node_folio(folio));
> +                       BUG_ON(!is_node_folio(sbi, folio));
>                         set_nid(sbi, folio, offset[0], 0, true);
>                         folio_unlock(folio);
>                 }
> @@ -1612,7 +1612,7 @@ static struct folio *__get_node_folio(struct f2fs_s=
b_info *sbi, pgoff_t nid,
>
>         folio_lock(folio);
>
> -       if (unlikely(!is_node_folio(folio))) {
> +       if (unlikely(!is_node_folio(sbi, folio))) {
>                 f2fs_folio_put(folio, true);
>                 goto repeat;
>         }
> @@ -1731,7 +1731,7 @@ static struct folio *last_fsync_dnode(struct f2fs_s=
b_info *sbi, nid_t ino)
>
>                         folio_lock(folio);
>
> -                       if (unlikely(!is_node_folio(folio))) {
> +                       if (unlikely(!is_node_folio(sbi, folio))) {
>  continue_unlock:
>                                 folio_unlock(folio);
>                                 continue;
> @@ -1841,7 +1841,7 @@ static bool __write_node_folio(struct folio *folio,=
 bool atomic, bool do_fsync,
>                                 f2fs_need_dentry_mark(sbi, ino_of_node(sb=
i, folio)));
>
>         /* should add to global list before clearing PAGECACHE status */
> -       if (f2fs_in_warm_node_list(folio)) {
> +       if (f2fs_in_warm_node_list(sbi, folio)) {
>                 seq =3D f2fs_add_fsync_node_entry(sbi, folio);
>                 if (seq_id)
>                         *seq_id =3D seq;
> @@ -1965,7 +1965,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi,=
 struct inode *inode,
>
>                         folio_lock(folio);
>
> -                       if (unlikely(!is_node_folio(folio))) {
> +                       if (unlikely(!is_node_folio(sbi, folio))) {
>  continue_unlock:
>                                 folio_unlock(folio);
>                                 continue;
> @@ -2023,7 +2023,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi,=
 struct inode *inode,
>                 f2fs_debug(sbi, "Retry to write fsync mark: ino=3D%u, idx=
=3D%lx",
>                            ino, last_folio->index);
>                 folio_lock(last_folio);
> -               if (unlikely(!is_node_folio(last_folio))) {
> +               if (unlikely(!is_node_folio(sbi, last_folio))) {
>                         f2fs_folio_put(last_folio, true);
>                         ret =3D -EAGAIN;
>                         goto out;
> @@ -2101,7 +2101,7 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sb=
i)
>
>                         folio_lock(folio);
>
> -                       if (unlikely(!is_node_folio(folio)))
> +                       if (unlikely(!is_node_folio(sbi, folio)))
>                                 goto unlock;
>                         if (!folio_test_dirty(folio))
>                                 goto unlock;
> @@ -2173,7 +2173,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>                         else if (!folio_trylock(folio))
>                                 continue;
>
> -                       if (unlikely(!is_node_folio(folio))) {
> +                       if (unlikely(!is_node_folio(sbi, folio))) {
>  continue_unlock:
>                                 folio_unlock(folio);
>                                 continue;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 0b6267d0354e..ffdd2c510b3c 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4161,7 +4161,7 @@ static void do_write_page(struct f2fs_summary *sum,=
 struct f2fs_io_info *fio)
>                         __func__, fio->ino, folio->index, type,
>                         fio->old_blkaddr, fio->new_blkaddr, err);
>                 folio_end_writeback(folio);
> -               if (f2fs_in_warm_node_list(folio))
> +               if (f2fs_in_warm_node_list(fio->sbi, folio))
>                         f2fs_del_fsync_node_entry(fio->sbi, folio);
>                 f2fs_bug_on(fio->sbi, !is_set_ckpt_flags(fio->sbi,
>                                                         CP_ERROR_FLAG));
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
