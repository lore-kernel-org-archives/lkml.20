Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B199837F8B2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937658; cv=pass; b=IeW9TomnIDmZNx4GOfSausDi1GdkHA3v8WZFm+XGjMRyY+EyJyNOYI+CUTJwvh79RohyRQGSoezUKefp4tYoSUZrGa0J4R+BJyUSc40YO8PGFQZTmcufI+D82EYaHJ9JYKuna6Bx2jb4vtO1FniE+VXhdrsOZEq+58tuvS6uE94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937658; c=relaxed/simple;
	bh=3sAgkHG+9Ih7Xanyyi98IlR3X2ojVQ3e9aGkgzfKvbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7K4yFb4aQAXgoVK7hwUcle9S8AV0kMNxhQXiQQduaQx1+ihhgUZL+MkSQoOj5jUDiB0zk0ekpxGdM/SP9A1LH8KYs4GPEwqyl/8I95LRFtSOieSMoe7MrOQHOLIylDOCSMRGJW74Xxjs021gkquh8GKCSAsXSArnmzDyLC9WXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eszYulWT; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eszYulWT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so1013231e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787937654; cv=none;
        d=google.com; s=arc-20260327;
        b=Cyq8xDDHmjS04KInxrKkmGCDWL3wWeTvBtkUKr0wC3j5+vfcgfdwY0bmViBGzrWs+O
         6VaUx+NZv/HPOOoqX+AOqhFQddDuY6J531C36Z6exHjt0yjZrN/P2BbwaM16I7kS7UIQ
         M3pTZessC2Kl1BTj9ms6xnPWYeu9UOh7loFBXbK8zaK0D+X78aOmTUiHdNZA6nFSjIFV
         CS+lTtJ6IxInwd5u0v/eAT4cWB3PjpzHXr/5URVKqd8gjVhaWCs/vTYOJ2vloJHZQjkt
         /W0X6CXPaOKDS3wdKBr61g1x5t+M3IUIoWGvRQU9ykhK58DwGW3pw8ddJa12QsCePyOU
         NGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGrrVT1AnvMzzkOzceQzSa8xC5h1kjm24uvD1WY0fdI=;
        fh=8bPerEWqneOZOTFsQn261YpD1r//PR0H4apDMX5DGCY=;
        b=e+8PfNyPRgehNlbDZfd/ZslkpmqEFi459Q04kBJPoxNjr30CNAfKc6lxAW8Qmr8e5V
         s/kUiCp4OflM4TUEDUuat4fvBA5JB3YMTE4w7DjaTwHa1CYuR2XcazYsu9zWilSJMCiB
         whWusxskknRa0iFqWJ0xGurehrJ/q0I8ay4evVdN/opEB5Mtd0SRUHwCDu8LBp8I3bd5
         8Oyt/BPUWRmpLzfxukWjk6EsMlAF0BKW5mwjM7KzGhwWTqRbjyyzpbktxR8SXcu+pwqP
         kwahruSN9DbUIR1LlcUFHTs6CXBYtY9ffGj1/dss0BVBdQSU9E4k8FUfnQ9Mi/FRRVkP
         NOjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787937654; x=1788542454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGrrVT1AnvMzzkOzceQzSa8xC5h1kjm24uvD1WY0fdI=;
        b=eszYulWT3rU/RKLOqvWU1dIgst2ZeAknvxLJYBfkpxjbY1k8FwEInoC7uKrpTMFu+e
         p7wFgNxFXTHV7Q7bL+QK5d389BGeDWIksmTWw63zZMrqYXG72fl8ztlS0D8nwSR30QRd
         ImvGsb44D2st9PueLpuSOm53YRwEqvAziR/qRVJt+k2AwJF27OYHNc0ypqHG0ybjdcfv
         h7kC0zPBON7hvbLQoBJQjuAsyAOUUWnH2km6zVt2Y0eCR2HPuQ+dI5NNI1FnHm+5nW/8
         nIw1C1E/EHQL3e1kSSjCXnkokrrZuO6EajFJQyVjCOdMte6tQx/uAGD0JAdkET6UXUoy
         SjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937654; x=1788542454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGrrVT1AnvMzzkOzceQzSa8xC5h1kjm24uvD1WY0fdI=;
        b=HB8D5LkNyQSGY+LsQrgJCdFV5AuoF6dx+TAEx1e2NtMMjpYdZbmprhsv7Rsg3v23EK
         ZU2BJNC9CzozBeoM9pIlMIdqNNWYqa9Xs8bmoUIhx7cZlbry+YhIpoJcVRMrTPItZ7LU
         MU3hf3bVxKrCqmsRRGz7Kqdc+9SZ90+PmrCXxmra+Zdo+Se+eiieE2kNdmEHr1nk5MpD
         kwi+NciFUaj5E8O+FnejnYk/aFM3NxG5vPRFdbdnYDZV5y4eWWibuSl0VvoZM+bexjLj
         P7wRjGrVIqZuUtH0yJ96jwtoPTOoleknbPCAFAoh4Q6yK3ovsMQuOD6Lf9gicWUOZCgM
         7EmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZms+Q3BBo4r3zcwZR121r5FmiSay78iREnjwSOZ3zsmV89uoNr3EQdhZiDAew/k/vekAE7vrNS6g4Jik=@vger.kernel.org
X-Gm-Message-State: AFuF++nffUVq1YPBHt9+Au3ymLhLldKOHO6uAxrSufQBAA0pt1mPF+8x
	9fPkwBEZbF2GcYpdJUb6Gjzu8pvLoCKPohkizU0gE7+jIS2Y7Aug0hofW3T5OB909t+6nWhprEq
	LOiX2vou1zRfs7BrHzVEsU2lCKb3FYc4=
X-Gm-Gg: AR+sD12Yg8f/8WOPTxyzwzvRpKgW4QFNO9Bn7ROt8ctVQUCDWhEj3Q/94J2YIsUg9xB
	V0OPzdUp/rMPGDlxS+nbWcFPoYdv8mmO1n2LENWSl+uYPNgmPyKq9SLpJkzYYC1R3VxNDcfZYqg
	vFCLOz9B/Z2PTU+Foxq8DZmV+t6jYMvpzIBvrVk3PNinMWdnNjcu1DHkZZvSwCahGHRFophmju4
	G6C4meAIRgYnHuB6AAJhVASZllxVQDYgOUpbGZUxvpi/eEdjDpSa4JPL04gD/gF9bK3RKN0L6Wt
	5VUG3rkUQgRYxy4+57QENFxi5EWXY1wCdBkPxmlCCWU+60hmSC5Ht6ca/h4GdDBveMAKvfSgQi3
	NxevzdI9FO9I8wruobClG67Eu+SLK28baDA==
X-Received: by 2002:a05:6512:3b8f:b0:5b5:e092:c3d1 with SMTP id
 2adb3069b0e04-5b5e690dddamr2738654e87.24.1787937653410; Fri, 28 Aug 2026
 10:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com> <20260826082641.2007658-8-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260826082641.2007658-8-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 10:20:40 -0700
X-Gm-Features: AcwNN1VXSpaTHcBf9GaXL5EAmnlHl8EBltAWdYgTvIMuqXlTg9lrGvbU8w6M-1A
Message-ID: <CACOAw_yO+CyS=xBDA1iRTfjZtm_40wLGwD6TZQLRN2nFmuw7xQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 07/14] f2fs: make GC migration large-folio aware
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:33=E2=80=AFAM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> GC can operate on a 4K block that is cached inside a large folio.
> The data lookup helpers therefore need to test and update uptodate
> state for the addressed subpage instead of rejecting large folios or
> treating the whole folio as the target block.
>
> Let f2fs_get_read_data_folio(), f2fs_find_data_folio(), and
> f2fs_get_lock_data_folio() to use subpage uptodate state. Submit
> single-block reads at the requested folio offset and zero only the
> addressed 4K range for NEW_ADDR.
>
> Also update `move_data_page` to mark, clear, and restore dirty
> state for the target subpage, and submit write I/O with the subpage
> offset recorded in f2fs_io_info.
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 96 ++++++++++++++++++++++++++++++++++----------------
>  fs/f2fs/f2fs.h |  6 ++--
>  fs/f2fs/gc.c   | 30 ++++++++++++++--
>  3 files changed, 97 insertions(+), 35 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 608d8ea8e607..0e54b1e25893 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1241,19 +1241,31 @@ static struct bio *f2fs_grab_read_bio(struct inod=
e *inode,
>
>  /* This can handle encryption stuffs */
>  static void f2fs_submit_page_read(struct inode *inode, struct fsverity_i=
nfo *vi,
> -                                 struct folio *folio, block_t blkaddr,
> -                                 blk_opf_t op_flags, bool for_write)
> +                                 struct folio *folio, pgoff_t index,
> +                                 block_t blkaddr, blk_opf_t op_flags,
> +                                 bool for_write)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         struct bio *bio;
> +       size_t offset =3D 0;
>
> -       bio =3D f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, folio=
->index,
> +       if (f2fs_folio_has_ffs(folio)) {
> +               struct f2fs_folio_state *ffs =3D folio->private;
> +               unsigned long flags;
> +
> +               offset =3D offset_in_folio(folio, (loff_t)index << PAGE_S=
HIFT);
> +               spin_lock_irqsave(&ffs->state_lock, flags);
> +               ffs->read_pages_pending++;
> +               spin_unlock_irqrestore(&ffs->state_lock, flags);
> +       }
> +
> +       bio =3D f2fs_grab_read_bio(inode, vi, blkaddr, 1, op_flags, index=
,
>                                  for_write);
>
>         /* wait for GCed page writeback via META_MAPPING */
>         f2fs_wait_on_block_writeback(inode, blkaddr);
>
> -       if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
> +       if (!bio_add_folio(bio, folio, PAGE_SIZE, offset))
>                 f2fs_bug_on(sbi, 1);
>
>         inc_page_count(sbi, F2FS_RD_DATA);
> @@ -1399,21 +1411,13 @@ struct folio *f2fs_get_read_data_folio(struct ino=
de *inode, pgoff_t index,
>         struct dnode_of_data dn;
>         struct folio *folio;
>         int err;
> -retry:
> +
>         folio =3D f2fs_grab_cache_folio(mapping, index, for_write);
>         if (IS_ERR(folio))
>                 return folio;
>
> -       if (folio_test_large(folio)) {
> -               pgoff_t folio_index =3D mapping_align_index(mapping, inde=
x);
> -               unsigned long nr_pages =3D folio_nr_pages(folio);
> -
> -               f2fs_folio_put(folio, true);
> -               invalidate_inode_pages2_range(mapping, folio_index,
> -                               folio_index + nr_pages - 1);
> -               f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> -               goto retry;
> -       }
> +       if (folio_test_large(folio))
> +               f2fs_ffs_find_or_alloc(folio);
>
>         if (f2fs_lookup_read_extent_cache_block(inode, index,
>                                                 &dn.data_blkaddr)) {
> @@ -1448,7 +1452,7 @@ struct folio *f2fs_get_read_data_folio(struct inode=
 *inode, pgoff_t index,
>                 goto put_err;
>         }
>  got_it:
> -       if (folio_test_uptodate(folio)) {
> +       if (f2fs_ffs_test_blk_uptodate(folio, index)) {
>                 folio_unlock(folio);
>                 return folio;
>         }
> @@ -1461,15 +1465,17 @@ struct folio *f2fs_get_read_data_folio(struct ino=
de *inode, pgoff_t index,
>          * f2fs_init_inode_metadata.
>          */
>         if (dn.data_blkaddr =3D=3D NEW_ADDR) {
> -               folio_zero_segment(folio, 0, folio_size(folio));
> -               if (!folio_test_uptodate(folio))
> -                       folio_mark_uptodate(folio);
> +               size_t offset =3D offset_in_folio(folio,
> +                                               (loff_t)index << PAGE_SHI=
FT);
> +
> +               folio_zero_segment(folio, offset, offset + PAGE_SIZE);
> +               f2fs_ffs_mark_subrange_uptodate(folio, offset, PAGE_SIZE)=
;
>                 folio_unlock(folio);
>                 return folio;
>         }
>
> -       f2fs_submit_page_read(inode, f2fs_need_verity(inode, folio->index=
),
> -                             folio, dn.data_blkaddr, op_flags, for_write=
);
> +       f2fs_submit_page_read(inode, f2fs_need_verity(inode, index),
> +                             folio, index, dn.data_blkaddr, op_flags, fo=
r_write);
>         return folio;
>
>  put_err:
> @@ -1486,7 +1492,7 @@ struct folio *f2fs_find_data_folio(struct inode *in=
ode, pgoff_t index,
>         folio =3D f2fs_filemap_get_folio(mapping, index, FGP_ACCESSED, 0)=
;
>         if (IS_ERR(folio))
>                 goto read;
> -       if (folio_test_uptodate(folio))
> +       if (f2fs_ffs_test_blk_uptodate(folio, index))
>                 return folio;
>         f2fs_folio_put(folio, false);
>
> @@ -1495,11 +1501,11 @@ struct folio *f2fs_find_data_folio(struct inode *=
inode, pgoff_t index,
>         if (IS_ERR(folio))
>                 return folio;
>
> -       if (folio_test_uptodate(folio))
> +       if (f2fs_ffs_test_blk_uptodate(folio, index))
>                 return folio;
>
>         folio_wait_locked(folio);
> -       if (unlikely(!folio_test_uptodate(folio))) {
> +       if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
>                 f2fs_folio_put(folio, false);
>                 return ERR_PTR(-EIO);
>         }
> @@ -1523,7 +1529,8 @@ struct folio *f2fs_get_lock_data_folio(struct inode=
 *inode, pgoff_t index,
>
>         /* wait for read completion */
>         folio_lock(folio);
> -       if (unlikely(folio->mapping !=3D mapping || !folio_test_uptodate(=
folio))) {
> +       if (unlikely(folio->mapping !=3D mapping ||
> +                   !f2fs_ffs_test_blk_uptodate(folio, index))) {
>                 f2fs_folio_put(folio, true);
>                 return ERR_PTR(-EIO);
>         }
> @@ -2681,6 +2688,23 @@ static void f2fs_ffs_mark_subrange_uptodate(struct=
 folio *folio, size_t offset,
>                 folio_mark_uptodate(folio);
>  }
>
> +bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned int idx, nr_subpages;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return folio_test_dirty(folio);
> +
> +       if (!folio_contains(folio, index))
> +               return false;
> +
> +       ffs =3D folio->private;
> +       nr_subpages =3D folio_nr_pages(folio);
> +       idx =3D index - folio->index;
> +       return test_bit(nr_subpages + idx, ffs->state);
> +}
> +
>  void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
>                                     size_t offset, size_t len)
>  {
> @@ -2719,18 +2743,30 @@ static bool __ffs_clear_subrange_dirty(struct fol=
io *folio,
>                         2 * nr_subpages;
>  }
>
> -void f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offset, s=
ize_t len)
> +/**
> + * f2fs_ffs_clear_subrange_dirty - clear the dirty bits of a folio subra=
nge
> + * @folio: the large folio
> + * @offset: start byte offset within the folio
> + * @len: byte length of the subrange
> + *
> + * Clear the dirty bits of the 4K subpages covered by [offset, offset + =
len),
> + * and return whether the folio still has any dirty subpage left.
> + */
> +bool f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offset,
> +                                  size_t len)
>  {
>         struct f2fs_folio_state *ffs;
>         unsigned long flags;
> +       bool dirty;
>
>         if (!f2fs_folio_has_ffs(folio))
> -               return;
> +               return false;
>
> -       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       ffs =3D folio->private;
>         spin_lock_irqsave(&ffs->state_lock, flags);
> -       __ffs_clear_subrange_dirty(folio, ffs, offset, len);
> +       dirty =3D __ffs_clear_subrange_dirty(folio, ffs, offset, len);
>         spin_unlock_irqrestore(&ffs->state_lock, flags);
> +       return dirty;
>  }
>
>  static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
> @@ -4853,7 +4889,7 @@ static int f2fs_write_begin(const struct kiocb *ioc=
b,
>                  */
>                 f2fs_submit_page_read(inode,
>                                       NULL, /* can't write to fsverity fi=
les */
> -                                     folio, blkaddr, 0, true);
> +                                     folio, index, blkaddr, 0, true);
>
>                 folio_lock(folio);
>                 if (unlikely(folio->mapping !=3D mapping)) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 71e6d7e34c7b..0ffbe2bd04c8 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4344,10 +4344,10 @@ int f2fs_write_single_data_page(struct folio *fol=
io, int *submitted,
>                                 int compr_blocks, bool allow_balance);
>  bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index=
);
>  struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> +bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index);
>  void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, si=
ze_t len);
> -bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t =
offset,
> -                                       size_t len);
> -void f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offset, s=
ize_t len);
> +bool f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offset,
> +                                  size_t len);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t le=
ngth);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0c17038fcfd7..42e6dfcbf98d 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1504,12 +1504,19 @@ static int move_data_page(struct inode *inode, bl=
ock_t bidx, int gc_type,
>                                                 unsigned int segno, int o=
ff)
>  {
>         struct folio *folio;
> +       size_t foff =3D 0;
> +       bool large =3D false;
>         int err =3D 0;
>
>         folio =3D f2fs_get_lock_data_folio(inode, bidx, true);
>         if (IS_ERR(folio))
>                 return PTR_ERR(folio);
>
> +       if (f2fs_folio_has_ffs(folio)) {
> +               large =3D true;
> +               foff =3D offset_in_folio(folio, (loff_t)bidx << PAGE_SHIF=
T);
> +       }
> +
>         if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
>                 err =3D -ENOENT;
>                 goto out;
> @@ -1524,6 +1531,8 @@ static int move_data_page(struct inode *inode, bloc=
k_t bidx, int gc_type,
>                         err =3D -EAGAIN;
>                         goto out;
>                 }
> +               if (large)
> +                       f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SI=
ZE);
>                 folio_mark_dirty(folio);
>                 folio_set_f2fs_gcing(folio);
>         } else {
> @@ -1536,32 +1545,49 @@ static int move_data_page(struct inode *inode, bl=
ock_t bidx, int gc_type,
>                         .op_flags =3D REQ_SYNC,
>                         .old_blkaddr =3D NULL_ADDR,
>                         .folio =3D folio,
> +                       .folio_offset =3D bidx - folio->index,
> +                       .folio_blkcnt =3D 1,
>                         .encrypted_page =3D NULL,
>                         .need_lock =3D LOCK_REQ,
>                         .io_type =3D FS_GC_DATA_IO,
>                 };
> -               bool is_dirty =3D folio_test_dirty(folio);
> +               struct f2fs_folio_state *ffs =3D NULL;
> +               bool is_dirty =3D f2fs_ffs_test_blk_dirty(folio, bidx);
>
>  retry:
>                 f2fs_folio_wait_writeback(folio, DATA, true, true);
>
> +               if (large) {
> +                       ffs =3D folio->private;
> +                       f2fs_ffs_mark_subrange_dirty(folio, foff, PAGE_SI=
ZE);
> +               }
>                 folio_mark_dirty(folio);
>                 if (folio_clear_dirty_for_io(folio)) {
>                         inode_dec_dirty_pages(inode);
>                         f2fs_remove_dirty_inode(inode);
> +                       if (large &&
> +                           f2fs_ffs_clear_subrange_dirty(folio, foff, PA=
GE_SIZE))
> +                               folio_mark_dirty(folio);
>                 }
>
> +               if (large)
> +                       atomic_inc(&ffs->write_pages_pending);

Under Patch 08, a cleanly read large folio may NOT have
f2fs_folio_state allocated
(folio->private =3D=3D NULL), right?

When foreground/background GC tries to migrate a 4KB block in such a folio,
`ffs` is NULL, and `atomic_inc(&ffs->write_pages_pending)` will instantly c=
rash
with a NULL pointer dereference!

Fix: Call `ffs =3D f2fs_ffs_find_or_alloc(folio);` before accessing `ffs`.

Thanks,

>                 folio_set_f2fs_gcing(folio);
>
>                 err =3D f2fs_do_write_data_page(&fio);
>                 if (err) {
>                         folio_clear_f2fs_gcing(folio);
> +                       if (large)
> +                               atomic_dec(&ffs->write_pages_pending);
>                         if (err =3D=3D -ENOMEM) {
>                                 memalloc_retry_wait(GFP_NOFS);
>                                 goto retry;
>                         }
> -                       if (is_dirty)
> +                       if (is_dirty) {
> +                               if (large)
> +                                       f2fs_ffs_mark_subrange_dirty(foli=
o, foff, PAGE_SIZE);
>                                 folio_mark_dirty(folio);
> +                       }
>                 }
>         }
>  out:
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
