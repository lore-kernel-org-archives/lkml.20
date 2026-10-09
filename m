Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4EE5187D9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570891; cv=pass; b=tdB8fLa4uLENkWD6Hp/J02sVsLkmG+WGatxAVKMFDziYov+KRwR9SQ/NtrLLwIQejoae1X0bg7UUmM/BOsxxN1NWDXoWHCt4wi1msi7RM1HKOx4PH01fr15FxDYLcLiLJMJmu0RD05C+fGy3P9RbeptuQivd/pHoyk4TfkSyy5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570891; c=relaxed/simple;
	bh=Zix91J+Ug52KZnoRT8hwYCERFyuwIjCrmjuPVH7d3kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJGoCseQBK9ZyTN1mkBes22qzfHcNWxhL3wDJ/Fr2hOUOFnh7Kt5rw58HXLnDsXMFvj6yAU3zjpPW6IP1MuL+5khPCf1Cgkn2U4G2XkpVJ1N07OYajHrBvNqFpYkieF0sUMqeBtTfjG1RVaVVbasDW6bJHgUbG7ZWt2ezliP/00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFFyWakW; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFFyWakW"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso4538390e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791570885; cv=none;
        d=google.com; s=arc-20260327;
        b=NlleSI91s32Akg26/5dBvVl+tpOkDcpiMBOozl7Wlzv3LdTYfkY23Q+2TTLOmWUmat
         7S1zlKdu+A9Uj9F0uGIM1rZZuJvi5p2eqLW2EUbwyS6FwSzGuvJDRnxesB7AVaUetKbw
         xp0lKcH6L8kJli2FnERgN9VLJW1UslEUjRHVLcp/kiFpbz3dJbZoTPq2oT8DfRgChski
         cXghG26YZzLD+01I1yEAWezOAkHJWS4ZLTuYCS8CKTT3gmVBT3SrY2he0UGDNeddUVsM
         FSV8bn24kx05AB2mJg0rjWxc2syAbhfjK1Dir8u+0WqL5fu9MqcHrAO6LWKyYRf9u12H
         83+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7CLTi5QtuRaXCFokSEcR5Bk6ZVYdSxzBUmcveaFUqc=;
        fh=UiUs6pBqDECs/Nmatf83E+7QM4znRya7pfApIoTJW0g=;
        b=pgWnsxtemlvPkfTMi2O5fVmljE8qSThRsMPcz6K8zh2myFK2YEiJL8lzcruTHEHPA3
         TdnIDB6MnJsnEE/27SS13gjs2TT4mvxi9i97A7TuSrXAlDK3zhoTS/4zeoKagDj3XEgV
         /ey4OPFMdxFY71EMmk+GWy0+Y5REnPqbcf0Yxw0DGul8fubL7JdZtaVIFXFAZiTv37OT
         OLeYlKbhK3WDDnf2sJGbSxo9Z9wwe2D9BsFE5s3CA04QsrX2rtPlcBzKhIPMe0/OIblJ
         sJ+rmmF1kwzBG+svkbcVhKY6Mvk+9YqMXwol81CgyDcXXufEX/QZ1HBgOniB1m3jZv7o
         MAcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570885; x=1792175685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7CLTi5QtuRaXCFokSEcR5Bk6ZVYdSxzBUmcveaFUqc=;
        b=MFFyWakWx/gwf2kTvTqEL60swLlHOqcf2VNoHrwZqCENERyIKBvrmVkchZBfYzkaM2
         XBQsHBo3Zp7VTRnZcXw0/ueMVb/w1Os2RZaEWiJW7FxyMAvxi4HgBcXmAU+rvSYnCWZL
         YlpIFF5S7O62t3pvOzpHWqJbyL6XBLqp2phsEEmOGAKYU7FV5ADnP9FrZUUJoToExsc/
         Srk+J+tXkAQ6DJsQe+0OjQQGN6cZ02YWVKXN+T4snXvF6ERIPSfna5C6tn+NShyxprtB
         RflHjOV3oHdGfDaJ26RO2CRLPMk2NLyxkbEDyKh/Qpm7Ks39eUga/b95Yd3up7MEyWU4
         f1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570885; x=1792175685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7CLTi5QtuRaXCFokSEcR5Bk6ZVYdSxzBUmcveaFUqc=;
        b=l9w+mVSg9ulSSTLBc/5xo/H8NOdSsjvEKOkTPm+iifl6SD/BCYyzZ7f+tVuTyYtHAu
         v5CuXj7Rh5E0uuGHqasijFQE0Mpo7JF1hBuRnyZar4GjHE8M+cHy9RcAA+KSeJRyDVZ6
         jc+Iys07fNuxUilrycCdTza/yl9JqabFph6oZg8xqUiCKKICHjgl2vZvrA4Q75VOjJ+C
         0lbRMow2eyavdie5tsRyQzuPTW/c6CnqY3ValEigR6/476CrBWUB/vVk1/uJeNZixVgE
         U5NXI8FCrRx0EBZ98iDn0/4SDjhsNOOiKzLRjEFPtk/RnKJ/q6dWZqcB7xGPGyeov/7h
         5wlg==
X-Forwarded-Encrypted: i=1; AKwUvByaKE2qJDs1qyrB8yPq/vYp9Z8nnx7XDpI08ua6kRVr75qA2iQwanRFENljuJarQWMev8LK77q3pzZaMRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsWBrO8aEGZWyf5qfK/eTWfxRmizz7lLy+NxgzEGer6nEOhWw8
	DBnG0jnArIyEPpyq3SeooMF8HzOosUFvVogMfOP7gmGEHqjxc5743zJ2UKC2NXwZ1lfjQC2HFzA
	Mde3JCQn1ipigA4UmG8L5yNTXjhBzF1M=
X-Gm-Gg: AYBFou0iydFBKf2SJadN8qILC9SGPoddQSQAEsRnyjwvVnM0tc3bFieDmbrYzsKsc7Y
	OG3+RYs0Lf6v4yXKNUjtc+AIVzDQdNdCsuSBgesM5+Q2X2x+l12Ylyx034KLlP9bI7V6G/CLhAN
	4lJhqeGb7SwsjyQPkhJF6DVEKGGjG6WtKq4TYYDZorw1JGcDo1+oBIBuzelqpmKcCH9YoPnRomZ
	whaNkj7bEfabBF+Vh8FdPiTCt8OtxOJT8fR8ogWCT/wHjdvIK1U4MN/RdxMXZy1R54Kvol1pqm/
	pT3ahzv4eK7dnge06v6rwNcuMs4BafD5fMDjZHWMDFfak0MiAnCZ/uGVz9NPhJrY0hXi+nOF8n7
	6x5HKVIpp/8ZIy/oNX0RE/Bs8USdZZvhYa63jJ7JgVjM=
X-Received: by 2002:a05:6512:1086:b0:5bc:ddab:5281 with SMTP id
 2adb3069b0e04-5bcde8be4a4mr1109998e87.36.1791570885026; Fri, 09 Oct 2026
 11:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com> <20261009161224.4163796-4-zhaonanzhe@xiaomi.com>
In-Reply-To: <20261009161224.4163796-4-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 9 Oct 2026 11:34:32 -0700
X-Gm-Features: AclHuK-d0KlhC9eKuT6zjveVOGQTB0KvJDqGMPgep5q2DPbhEW8ul7rYsQM2psI
Message-ID: <CACOAw_wmA_=kVvyu1m7XbVUpUt6J9BZeW=zqHFkD-+Lt3Gtz3g@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 03/17] f2fs: support regular file buffered
 writes on large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>, 
	David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org, 
	Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:15=E2=80=AFAM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> To avoid the complexity of unlocking a large folio in write_begin,
> preallocate partial blocks for inodes that can use large folios.
> During write_begin, read only the partial head and tail 4K subpages
> that need read-before-write, and skip read I/O for the full middle
> subpages covered by the write.
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 369 +++++++++++++++++++++++++++++++++++++++++++++++--
>  fs/f2fs/f2fs.h |   1 +
>  fs/f2fs/file.c |  17 ++-
>  3 files changed, 370 insertions(+), 17 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 6b8bee06a4f3..af2bb02e301f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -93,6 +93,20 @@ struct bio_post_read_ctx {
>         block_t fs_blkaddr;
>  };
>
> +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> +               struct f2fs_folio_state *ffs, size_t offset, size_t len)
> +{
> +       unsigned int nr_subpages =3D folio_nr_pages(folio);
> +       unsigned int start, end;
> +
> +       start =3D offset >> PAGE_SHIFT;
> +       end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +       end =3D min(end, nr_subpages);
> +
> +       bitmap_set(ffs->state, start, end - start);
> +       return bitmap_full(ffs->state, nr_subpages);
> +}
> +
>  /*
>   * Update and unlock a bio's pages, and free the bio.
>   *
> @@ -107,6 +121,23 @@ struct bio_post_read_ctx {
>   * called (i.e., I/O error or decryption error, but *not* verity error),=
 and
>   * release the bio's reference to the decompress_io_ctx of the page's cl=
uster.
>   */
> +/*
> + * Update read_pages_pending.
> + */
> +static inline void f2fs_update_read_folio_pending(struct folio *folio, i=
nt nr)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned long flags;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       ffs->read_pages_pending +=3D nr;
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
>  static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  {
>         struct folio_iter fi;
> @@ -128,7 +159,8 @@ static void f2fs_finish_read_bio(struct bio *bio, boo=
l in_task)
>                 }
>
>                 if (folio_test_large(folio)) {
> -                       struct f2fs_folio_state *ffs =3D folio->private;
> +                       struct f2fs_folio_state *ffs =3D
> +                               (struct f2fs_folio_state *)folio->private=
;
>
>                         spin_lock_irqsave(&ffs->state_lock, flags);
>                         ffs->read_pages_pending -=3D nr_pages;
> @@ -1430,6 +1462,36 @@ static void f2fs_submit_page_read(struct inode *in=
ode, struct fsverity_info *vi,
>         f2fs_submit_read_bio(sbi, bio, DATA);
>  }
>
> +/*
> + * Synchronously read a single 4K subpage by reusing f2fs_submit_page_re=
ad()
> + * so that iostat, trace, blk-crypto and post-read handling are all pres=
erved.
> + * The caller must have already allocated ffs for the folio.
> + */
> +static int f2fs_submit_page_read_sync(struct inode *inode, struct folio =
*folio,
> +                                     pgoff_t index, block_t blkaddr)
> +{
> +       struct f2fs_folio_state *ffs =3D
> +               (struct f2fs_folio_state *)folio->private;
> +
> +       /* Add bias so end_io does not call folio_end_read(). */
> +       f2fs_update_read_folio_pending(folio, 1);
> +
> +       f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
> +                             REQ_OP_READ, false);
> +
> +       /* Wait until all bios have completed (pending drops back to our =
bias). */
> +       while (READ_ONCE(ffs->read_pages_pending) !=3D 1)
> +               f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +
> +       /* Remove the bias. */
> +       f2fs_update_read_folio_pending(folio, -1);
> +
> +       if (!f2fs_ffs_test_blk_uptodate(folio, index))
> +               return -EIO;
> +
> +       return 0;
> +}
> +
>  static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr=
)
>  {
>         __le32 *addr =3D get_dnode_addr(dn->inode, dn->node_entry);
> @@ -2767,6 +2829,110 @@ static void ffs_detach_free(struct folio *folio)
>         kfree(ffs);
>  }
>
> +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index=
)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned int idx;
> +
> +       f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
> +
> +       if (folio_test_uptodate(folio))
> +               return true;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return false;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       idx =3D index - folio->index;
> +       return test_bit(idx, ffs->state);
> +}
> +
> +static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t =
offset,
> +                                      size_t len)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned long flags;
> +       bool mark_uptodate =3D false;
> +
> +       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +       if (!f2fs_folio_has_ffs(folio)) {
> +               folio_mark_uptodate(folio);
> +               return;
> +       }
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       mark_uptodate =3D __ffs_mark_subrange_uptodate(folio, ffs, offset=
, len) &&
> +                       !ffs->read_pages_pending;
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +       if (mark_uptodate)
> +               folio_mark_uptodate(folio);
> +}
> +
> +static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
> +                       struct f2fs_folio_state *ffs, size_t offset, size=
_t len)
> +{
> +       unsigned int nr_subpages =3D folio_nr_pages(folio);
> +       unsigned int start, end, before;
> +
> +       start =3D offset >> PAGE_SHIFT;
> +       end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +       end =3D min(end, nr_subpages);
> +
> +       before =3D bitmap_weight(ffs->state, 2 * nr_subpages);
> +       bitmap_set(ffs->state, nr_subpages + start, end - start);
> +       return bitmap_weight(ffs->state, 2 * nr_subpages) - before;
> +}
> +
> +static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> +                                   size_t offset, size_t len)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned long flags;
> +
> +       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       __ffs_mark_subrange_dirty(folio, ffs, offset, len);
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
> +static bool find_next_valid_block(const struct folio *folio,
> +                                 size_t orig_off, size_t *need_off,
> +                                 size_t len)
> +{
> +       size_t start =3D orig_off;
> +       size_t end =3D start + len;
> +       size_t head, tail;
> +       pgoff_t index;
> +
> +       if (start & (PAGE_SIZE - 1)) {
> +               head =3D round_down(start, PAGE_SIZE);
> +               index =3D folio->index + (head >> PAGE_SHIFT);
> +               if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +                       *need_off =3D head;
> +                       return true;
> +               }
> +       }
> +
> +       if (end & (PAGE_SIZE - 1)) {
> +               tail =3D round_down(end, PAGE_SIZE);
> +               index =3D folio->index + (tail >> PAGE_SHIFT);
> +               if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +                       *need_off =3D tail;
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static int f2fs_read_data_large_folio(struct inode *inode,
>                 struct fsverity_info *vi,
>                 struct readahead_control *rac, struct folio *folio)
> @@ -4128,6 +4294,135 @@ static int prepare_atomic_write_begin(struct f2fs=
_sb_info *sbi,
>         return 0;
>  }
>
> +/*
> + * Drop the folio lock when a node was changed, then balance the
> + * filesystem and reacquire the lock.
> + *
> + * Return: true if the folio became unusable while unlocked (being
> + * truncated), false if the folio is still usable.
> + */
> +static bool f2fs_folio_may_unlock_balance_fs(struct folio *folio,
> +               struct address_space *mapping, bool node_changed)
> +{
> +       struct inode *inode =3D folio->mapping->host;
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> +       unsigned int orig_order;
> +
> +       if (!node_changed || IS_NOQUOTA(inode) ||
> +                       !has_not_enough_free_secs(sbi, 0, 0))
> +               return false;
> +
> +       orig_order =3D folio_order(folio);
> +       folio_unlock(folio);
> +       f2fs_balance_fs(sbi, true);
> +       folio_lock(folio);

Hi Nanzhe,

Thanks for reworking this. One thing about where it is called.

In f2fs_write_begin(), the order-0 path balances before
f2fs_folio_wait_writeback(), but prepare_large_folio_write_begin() and
prepare_large_folio_atomic_write_begin() (04/17) are called after it,
so their f2fs_folio_may_unlock_balance_fs() calls unlock the folio
after the wait. If the folio already has dirty blocks, writeback can
start on it while it is unlocked, and nothing waits again after
folio_lock(), so the new data can be copied into a folio under
writeback.

Maybe f2fs_folio_may_unlock_balance_fs() could call
f2fs_folio_wait_writeback() after relocking?

Thanks,
Daeho

> +
> +       if (folio->mapping !=3D mapping)
> +               return true;
> +
> +       if (folio_order(folio) !=3D orig_order)
> +               return true;
> +
> +       return false;
> +}
> +
> +static int prepare_large_folio_write_begin(struct inode *inode,
> +                                         struct folio *folio, loff_t pos=
,
> +                                         unsigned int len)
> +{
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> +       struct f2fs_folio_state *ffs;
> +       size_t ori_off =3D offset_in_folio(folio, pos);
> +       size_t need_off =3D ori_off;
> +       int err =3D 0;
> +
> +       /*
> +        * when the write did not come through f2fs_write_iter, we preall=
ocate all
> +        * blocks in the write range here.
> +        */
> +       if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
> +           !IS_DEVICE_ALIASING(inode)) {
> +               pgoff_t first =3D F2FS_BYTES_TO_BLK(sbi, pos);
> +               pgoff_t last =3D F2FS_BLK_ALIGN(sbi, pos + len);
> +               pgoff_t idx;
> +
> +               for (idx =3D first; idx < last; idx++) {
> +                       block_t blkaddr =3D NULL_ADDR;
> +                       bool node_changed =3D false;
> +
> +                       err =3D __reserve_data_block(inode, idx, &blkaddr=
,
> +                                                  &node_changed);
> +                       if (err)
> +                               return err;
> +                       if (f2fs_folio_may_unlock_balance_fs(folio, folio=
->mapping,
> +                                                  node_changed))
> +                               return -EAGAIN;
> +               }
> +       }
> +
> +       ffs =3D f2fs_ffs_find_or_alloc(folio);
> +       if (!ffs)
> +               return -ENOMEM;
> +
> +       /* Skip read if the folio is already fully uptodate or the write
> +        * covers the entire folio.
> +        */
> +       if (folio_test_uptodate(folio) || len =3D=3D folio_size(folio))
> +               return 0;
> +
> +       if (!f2fs_verity_in_progress(inode) &&
> +           !(pos & (PAGE_SIZE - 1)) && (pos + len) >=3D i_size_read(inod=
e)) {
> +               size_t zoff =3D ori_off + len;
> +
> +               if (zoff < folio_size(folio))
> +                       folio_zero_segment(folio, zoff, folio_size(folio)=
);
> +               return 0;
> +       }
> +
> +       /* Inline data must have been converted before reaching here. */
> +       f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> +
> +       while (find_next_valid_block(folio, ori_off,
> +                                    &need_off, len)) {
> +               struct dnode_of_data dn;
> +               pgoff_t index =3D folio->index + (need_off >> PAGE_SHIFT)=
;
> +               block_t blkaddr;
> +
> +               if (!f2fs_lookup_read_extent_cache_block(inode, index,
> +                                                       &blkaddr)) {
> +                       if (IS_DEVICE_ALIASING(inode))
> +                               return -ENODATA;
> +
> +                       set_new_dnode(&dn, inode, NULL, NULL, 0);
> +                       err =3D f2fs_get_dnode_of_data(&dn, index, LOOKUP=
_NODE);
> +                       if (err)
> +                               return err;
> +                       blkaddr =3D dn.data_blkaddr;
> +                       f2fs_put_dnode(&dn);
> +
> +                       if (blkaddr =3D=3D NEW_ADDR) {
> +                               size_t off =3D offset_in_folio(folio,
> +                                                            index << PAG=
E_SHIFT);
> +
> +                               folio_zero_segment(folio, off, off + PAGE=
_SIZE);
> +                               f2fs_ffs_mark_subrange_uptodate(folio, of=
f,
> +                                                              PAGE_SIZE)=
;
> +                               continue;
> +                       }
> +
> +                       if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +                                                 DATA_GENERIC_ENHANCE_RE=
AD))
> +                               return -EFSCORRUPTED;
> +               }
> +
> +               err =3D f2fs_submit_page_read_sync(inode, folio, index, b=
lkaddr);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
>  static int f2fs_write_begin(const struct kiocb *iocb,
>                             struct address_space *mapping,
>                             loff_t pos, unsigned len, struct folio **foli=
op,
> @@ -4139,6 +4434,8 @@ static int f2fs_write_begin(const struct kiocb *ioc=
b,
>         pgoff_t index =3D pos >> PAGE_SHIFT;
>         bool need_balance =3D false;
>         block_t blkaddr =3D NULL_ADDR;
> +       fgf_t fgp =3D FGP_LOCK | FGP_WRITE | FGP_CREAT;
> +       unsigned int blen;
>         int err =3D 0;
>
>         trace_f2fs_write_begin(inode, pos, len);
> @@ -4186,9 +4483,15 @@ static int f2fs_write_begin(const struct kiocb *io=
cb,
>          * Do not use FGP_STABLE to avoid deadlock.
>          * Will wait that below with our IO control.
>          */
> -       folio =3D f2fs_filemap_get_folio(mapping, index,
> -                               FGP_LOCK | FGP_WRITE | FGP_CREAT,
> -                               mapping_gfp_mask(mapping));
> +       /*
> +        * Inline data is carried in the first subpage.  Keep the index #=
0
> +        * folio order-0 so that the existing inline read/convert paths
> +        * (prepare_write_begin()) still apply; large folios are used fro=
m
> +        * the second folio on.
> +        */
> +       fgp |=3D fgf_set_order(f2fs_has_inline_data(inode) ? PAGE_SIZE : =
len);
> +       folio =3D f2fs_filemap_get_folio(mapping, index, fgp,
> +                                     mapping_gfp_mask(mapping));
>         if (IS_ERR(folio)) {
>                 err =3D PTR_ERR(folio);
>                 goto fail;
> @@ -4198,11 +4501,15 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
>
>         *foliop =3D folio;
>
> +       /* Clamp the write length to the folio size. */
> +       blen =3D min_t(unsigned int, len,
> +                    folio_size(folio) - offset_in_folio(folio, pos));
> +
>         if (f2fs_is_atomic_file(inode))
>                 err =3D prepare_atomic_write_begin(sbi, folio, pos, len,
>                                         &blkaddr, &need_balance);
> -       else
> -               err =3D prepare_write_begin(sbi, folio, pos, len,
> +       else if (!folio_test_large(folio))
> +               err =3D prepare_write_begin(sbi, folio, pos, blen,
>                                         &blkaddr, &need_balance);
>         if (err)
>                 goto put_folio;
> @@ -4222,7 +4529,19 @@ static int f2fs_write_begin(const struct kiocb *io=
cb,
>
>         f2fs_folio_wait_writeback(folio, false, true);
>
> -       if (len =3D=3D folio_size(folio) || folio_test_uptodate(folio))
> +       if (folio_test_large(folio)) {
> +               err =3D prepare_large_folio_write_begin(inode,
> +                                       folio, pos, blen);
> +               if (!err)
> +                       return 0;
> +               if (err =3D=3D -EAGAIN) {
> +                       f2fs_folio_put(folio, true);
> +                       goto repeat;
> +               }
> +               goto put_folio;
> +       }
> +
> +       if (blen =3D=3D folio_size(folio) || folio_test_uptodate(folio))
>                 return 0;
>
>         if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >=3D i_size_read(inod=
e) &&
> @@ -4282,15 +4601,20 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
>         trace_f2fs_write_end(inode, pos, len, copied);
>
>         /*
> -        * This should be come from len =3D=3D PAGE_SIZE, and we expect c=
opied
> -        * should be PAGE_SIZE. Otherwise, we treat it with zero copied a=
nd
> -        * let generic_perform_write() try to copy data again through cop=
ied=3D0.
> +        * If a short copy happens on a folio that isn't uptodate, we tre=
at
> +        * it with zero copied and let generic_perform_write() try to cop=
y
> +        * data again through copied=3D0.
>          */
>         if (!folio_test_uptodate(folio)) {
> -               if (unlikely(copied !=3D len))
> +               if (unlikely(copied !=3D len)) {
>                         copied =3D 0;
> -               else
> +               } else if (folio_test_large(folio)) {
> +                       f2fs_ffs_mark_subrange_uptodate(folio,
> +                                       offset_in_folio(folio, pos), len)=
;
> +               } else {
> +                       /* This should be come from len =3D=3D PAGE_SIZE =
*/
>                         folio_mark_uptodate(folio);
> +               }
>         }
>
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -4309,6 +4633,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
>         if (!copied)
>                 goto unlock_out;
>
> +       if (folio_test_large(folio))
> +               f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio=
, pos),
> +                                                                  copied=
);
>         folio_mark_dirty(folio);
>
>         if (f2fs_is_atomic_file(inode))
> @@ -4365,8 +4692,22 @@ static bool f2fs_dirty_data_folio(struct address_s=
pace *mapping,
>
>         trace_f2fs_set_page_dirty(folio, DATA);
>
> -       if (!folio_test_uptodate(folio))
> -               folio_mark_uptodate(folio);
> +       if (!folio_test_uptodate(folio)) {
> +               bool uptodate =3D true;
> +
> +               if (f2fs_folio_has_ffs(folio)) {
> +                       struct f2fs_folio_state *ffs =3D
> +                               (struct f2fs_folio_state *)folio->private=
;
> +                       unsigned long flags;
> +
> +                       spin_lock_irqsave(&ffs->state_lock, flags);
> +                       uptodate =3D bitmap_full(ffs->state, folio_nr_pag=
es(folio)) &&
> +                                  !ffs->read_pages_pending;
> +                       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +               }
> +               if (uptodate)
> +                       folio_mark_uptodate(folio);
> +       }
>         BUG_ON(folio_test_swapcache(folio));
>
>         if (filemap_dirty_folio(mapping, folio)) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 20b7de55b2bf..e14275f98fe7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4450,6 +4450,7 @@ int f2fs_write_single_data_page(struct folio *folio=
, int *submitted,
>                                 struct writeback_control *wbc,
>                                 enum iostat_type io_type,
>                                 int compr_blocks, bool allow_balance);
> +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index=
);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t le=
ngth);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ef4d218e694b..aade9a04d8f3 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5408,9 +5408,20 @@ static int f2fs_preallocate_blocks(struct kiocb *i=
ocb, struct iov_iter *iter,
>                         return ret;
>         }
>
> -       /* Do not preallocate blocks that will be written partially in 4K=
B. */
> -       map.m_lblk =3D F2FS_BLK_ALIGN(sbi, pos);
> -       map.m_len =3D F2FS_BYTES_TO_BLK(sbi, pos + count);
> +       if (!dio && mapping_large_folio_support(inode->i_mapping)) {
> +               /*
> +                * Preallocate all blocks touched by a large-folio buffer=
ed write so
> +                * the regular write_begin path does not need to unlock t=
he folio for
> +                * f2fs_balance_fs().  Rechecking large-folio state after=
 unlock is
> +                * unreliable since partial truncation can split the foli=
o.
> +                */
> +               map.m_lblk =3D F2FS_BYTES_TO_BLK(sbi, pos);
> +               map.m_len =3D F2FS_BLK_ALIGN(sbi, pos + count);
> +       } else {
> +               /* Do not preallocate blocks that will be written partial=
ly in 4KB. */
> +               map.m_lblk =3D F2FS_BLK_ALIGN(sbi, pos);
> +               map.m_len =3D F2FS_BYTES_TO_BLK(sbi, pos + count);
> +       }
>         if (map.m_len > map.m_lblk)
>                 map.m_len -=3D map.m_lblk;
>         else
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
