Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794093297;
	b=OXWjMltyqqvhEB026QYFvOrKfv3l1RXeahJpTABm2SQx447icb/YbgzJ3gA6ue1f1A/S
	 ucY8/aa/5/EH3xP4B7Y58gy1Bke9uQ4atwS9qOHMXex3M1rZt0eQet+cI29brg8At2Szg
	 Td7qiQxm3BPylYGPU9xsVXh8QdEjfcTGLS4fMwimfiekkB0iQr2LvUPBLOuVsEltZ5Dk0
	 apfe9LtmzXlL6+5iQ6hVfIz2AEH62ZFIivtiGhudGdSfr5tOp3ND3hiMiKjcmwIGwg/ZH
	 z8ouhBrZI3ws2YK+ARFh0NBHWTuRToxBMraAHxatZb9v2/OeJoGp2sXJCGQxTfSmc8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OFu8ns1BggvVDgjXMnFybFQ1AJESDisumqYhRE+nXSw=;
	b=VPhe4iyyf481OF8ZVr0hksc7XaJI7YgEC154G68liuKgLFgnlaZJ+6OyxaHHul18vuOR
	 V9fJPUIDfTBMAmLEXB7sXQ3i3aPBei2ZZ0FDafky3HtA0uTpzy5Zh2gCbwDjSGi6iPbMl
	 cW9cB4XIT7l+Q46ZBjo8TvgCW+qLwZE95shQyQlynzQx5ACHM3gxx2Sb9U8LMHjOpxUOW
	 UvPmUoGUhTbkXM7GXt3YVRKAQKfPrRpnwGPwXBVosMJNwwuzSA0kOageFtmspvb7klNuu
	 5ZSqJkeGgf4qrEsm/7HX8b95pCotEwQeVHgAM0t7poBys4MBddjQ4vmU10voV8plU3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXuiKw8c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1CC606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mXuiKw8c
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso7011641fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794093295; cv=none;
        d=google.com; s=arc-20260327;
        b=YOgV7VsB4UJKpxl5rDw3NEx6Xu+9hNf2TEyNRwxIcZpWOwOaLKOYkCmEhMW1RWNSwG
         4AujHnFqupS1J8rZP1JQyEe0IDV3TBJL2eIEDB8vUBnkkTsl4j5+hFzZUWjiYH/HlFeG
         9VD+cSv3ig+MoG0WqX+k8hSPCjJc6BxtAW8w+KhrETA0bv86e+tjVHftlO276iwWzAcA
         rAyR+OFy7cDN2Ia7+tOK2RZ6z1ht1cHgaqI1O4aMV0Q0KVoZcbNhSDnZrpTo7pNFS6dw
         9X4mCkzjfaIrtD174Oomjlx+/M7EkYljY4R8EQSluBJfVf2H9HkKkRxInw88MKzK/i3G
         juyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFu8ns1BggvVDgjXMnFybFQ1AJESDisumqYhRE+nXSw=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=sFmOppaZ6XT3LAF1pOoloqB+L5taOiID+UjZFwk/cf/78mWLE9g/KbM7aXwIrS5VBL
         zwDdi5ulO4YvHS4NMTxbcj1gd3deHQ1jV3k1ZSAtSeaG7rYFYvykL83ietfggCHRODIg
         mck+Wr9sAl1oSjcQFy34EPIncLph9O2SNpZRYbYLLvCHoKgvnwAtNhEJVlZUnzqGouDO
         g6sVQfLErHr492sGNgX/0yZNvekxUFbjDLXEoXx9YfqaosqT7e4EcKE5ZMfDhUKqyTxq
         1YdlZyyZafgT2IIriJr70CwvIt9Az9f0Jtb0Y8Ohtbncd0vJAvmGJlbS3Mv7n0Qykpih
         VhcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093295; x=1794698095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFu8ns1BggvVDgjXMnFybFQ1AJESDisumqYhRE+nXSw=;
        b=mXuiKw8cYWVLr7B1db8mfTqOiiR2bPpnvA5eDhdHav6mUl7wvcL7fySJqKCiHuDqML
         ueQzGewUfgQQcI3abh1+XRa0LfDAiOZpXqi2G/TtKUJg9LXiY8B02cIJim0NjSPhGVZk
         0jESyUgF1Lt4W9EBADjeClBd/uh8aBbV4bcWdMQLcXSbvsQusOqP3htOtFxPHBPfsbPU
         LRgdSgOwikmduNAZ5n1gbbBymdfoXlOmGVTnc1P5Qgp/rFsa4atE5w5j4MjyFtd7akqV
         3iJbhth0hWpTKgW1XeLZjeiN61I1lT6XKNIl1Xc0QJP5/wRXdJqhk4/NBm/QZ3ej4jKx
         1cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093295; x=1794698095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFu8ns1BggvVDgjXMnFybFQ1AJESDisumqYhRE+nXSw=;
        b=XW2OhCxhmJgwOlxh4XFqJ05Q9meSEOn9aXoEAwzXujidJkHojG4wlkr5snkAehO4L1
         VxdypSiyB0duM4u+X7Nt11pT0PO/Tr7q7/YBqFPOWb0Fus/oH+vqc7TcICmFinBTxRKa
         0ulp8gSIH0C2H5cdPqKMpFnvDv4XVNxPn5CJayjPiTPxU6a1CRqNVRni62Etl2WmFmzg
         FOQBsSMes4+lvKXaMRvwDmsGubaLzVcfIC4hZyWLeq4LVGiZFtNzeikjfACSOCckmNwl
         KvmRhKS22kmqvVERzOXFM3TG0FLeR8yFe6t9JfmuHUkZhSaskUaym8Bg4dfBeTfkBp0c
         KobQ==
X-Gm-Message-State: APuU4Z8kOjoTPyxujo7UupXQgXXijehOx8yDF26TyIbVCg0EMu1viYBK
	g3nB/crqh5EgKIuzE98uz2QYXjaVBtp7vub1aUH5E4GDB67VNSBss4C+z+XJ1p0Zpnng5acEH16
	ORZcgq/wmyZoUmtg6YZYnsUVpac1fQrg=
X-Gm-Gg: AYBFou32R8DnSk95afXfEalVIyQBDyr6cc+Z3TeQ46fRAcaI/UVzLvENbuMaasoLjfF
	tZYpa0j4sn23IshkohGOr1THt714U8J0CHjZ/ZBRl0UFAKD8etlv7w8rXbX3rQBuwd7VpbkNk2g
	Mv/rWzlD8e5oOUouGRUQwkmyD3mQNQqCmaNCS6+e1B0Z765NC1PluCwsIhatSKE2xUzcq2+BWnr
	936Hg0KaB1RPfD53a+YvX92orUhwqtveiSLm2J0WXVQcszNCTct5L15eyOJoRtYjpIJX7m8f+3H
	G3j2PsHhn8/Gvevj21nGU/iJ7PChufmp3A7nENLlc/dIm6wet3V4PiA63QR1JTQqW6UUKxmzmnH
	CDhn/jtnzL7gzGLitknhNMGmhFrfsR8/srDLARfLM48Ngv6/5NOGco+Fw6Ion7oX+jhraR9fh2L
	XchzdV+hehJLuHp9CbxNNFcwdS4w==
X-Received: by 2002:a05:651c:2108:b0:3a8:7caa:cd4b with SMTP id
 38308e7fff4ca-3adfa41227emr260451fa.7.1794093294043; Sat, 07 Nov 2026
 15:14:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-8-daeho43@gmail.com>
 <164909bf-39e8-421e-b9c6-f2bac0391f39@kernel.org>
In-Reply-To: <164909bf-39e8-421e-b9c6-f2bac0391f39@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 7 Nov 2026 15:14:41 -0800
X-Gm-Features: AclHuK_cxWFQ-taEytOU3nTI2YUEGzQjwF_idbVtXoevYp4lxWuYwoBxpzRQgsQ
Message-ID: <CACOAw_w31ZFeTqD6iuOLdO-Lp8LyszFSWrcfhYg0r5r5jcw4Qg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 07/20] f2fs: support subpage blocks in data
 write path and writeback
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 6:52=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 11/3/26 03:39, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > With blocks smaller than PAGE_SIZE, a folio holds several blocks, so
> > write_begin, write_end and writeback have to handle individual blocks
> > instead of the whole folio.
> >
> > - Read, zero and reserve the blocks touched by a write per block in
> >    write_begin, and mark only the written blocks dirty in write_end.
> > - Write back only the dirty blocks of a multi-block folio and complete
> >    write I/O per block. In subpage mode every inode is written back by
> >    f2fs_write_cache_folios(), which now handles dentry and quota folios
> >    and checkpoint errors as f2fs_write_single_data_page() does. Both us=
e
> >    the new f2fs_cp_controlled_inode() and f2fs_wb_folio_action() helper=
s
> >    for these rules.
> >    It also resets the error for each folio, so that the remaining folio=
s
> >    are still written back after an error, as writeback_iter() expects
> >    for integrity writeback, instead of redirtying them.
> >    f2fs_write_folio_dirty_range() cleans up each block where it is
> >    written or skipped, and advances last_disk_size only up to the last
> >    block it submitted. On an error, it clears the dirty state of the
> >    blocks before the failed one, so that only the failed block and the
> >    ones after it are written again.
> > - Count inode dirty blocks per folio: add all blocks of a folio when
> >    it is dirtied and remove them when it is cleaned, instead of countin=
g
> >    the dirty bits of the folio state. A multi-block folio can be dirtie=
d
> >    without a folio state, e.g. after a read of the whole folio or
> >    through folio_mark_dirty(), and a state attached later starts with
> >    dirty bits that were never counted, so the bit count cannot stay
> >    balanced. A partially dirty folio is counted as fully dirty.
>
> Sorry, still I don't understand why we can not track dirty block count in=
 folio,
> the count should be consistent w/ dirty bitmap in ffs (e.g. if there is x=
 bits in
> bitmap is 1, the count should be x).
>
> IIUC, if large folio can track dirty page count, 16k-page should can trac=
k 4k
> dirty block as well? or is there any difference in subpage block feature,=
 can you
> please explain more about this?

Hi Chao,

Counting dirty bits needs the folio state on every dirty multi-block
folio, but a folio can be dirtied through ->dirty_folio(), which cannot
allocate it: ->dirty_folio() must not block and can be called under
the page table lock without the folio lock, and it has no range, so the
whole folio becomes dirty. E.g. a folio read by a single bio has no
folio state, and it can then be dirtied by GUP or mmap. When the folio
state is attached later, its dirty bits are set from PG_dirty, and
these bits were never counted, so clearing them unbalances the counter.

Large folios worked because the folio state was attached up front, but
in subpage mode every order-0 folio is a multi-block folio, and we
cannot attach it in every path that creates or dirties a folio.
Counting per folio adds and removes the same number when the folio is
dirtied and cleaned, so it always stays balanced. A partially dirty
folio is counted as fully dirty, but the counters are only compared
with thresholds such as min_fsync_blocks, and order-0 folios were
counted per page before, so this is enough.

>
> > - Compressed and atomic files are not supported yet in subpage mode:
> >    write_begin returns -EOPNOTSUPP for them. Inline data is converted
> >    first.
> >
> > Some of these changes also apply to large folios when the block size
> > equals PAGE_SIZE.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/checkpoint.c |  39 +---
> >   fs/f2fs/data.c       | 486 ++++++++++++++++++++++--------------------=
-
> >   fs/f2fs/dir.c        |   2 +-
> >   fs/f2fs/f2fs.h       |   1 -
> >   fs/f2fs/file.c       |  11 +-
> >   fs/f2fs/gc.c         |  11 +-
> >   fs/f2fs/inline.c     |   7 +-
> >   fs/f2fs/node.c       |   2 +-
> >   8 files changed, 275 insertions(+), 284 deletions(-)
> >
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 1060ee651756..a9a2b9d93231 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1324,46 +1324,21 @@ static void __remove_dirty_inode(struct inode *=
inode, enum inode_type type)
> >       stat_dec_dirty_inode(F2FS_I_SB(inode), type);
> >   }
> >
> > -/*
> > - * Account @nr dirty blocks (negative when dirtiness is cleared) for @=
inode.
> > - */
> > -void f2fs_account_dirty_blocks(struct inode *inode, int nr)
> > +void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       enum inode_type type =3D S_ISDIR(inode->i_mode) ? DIR_INODE : FIL=
E_INODE;
> > +     unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> >
> > -     if (!nr)
> > -             return;
> > -
> > -     spin_lock(&sbi->inode_lock[type]);
> > -     if (nr > 0) {
> > -             if (type !=3D FILE_INODE || test_opt(sbi, DATA_FLUSH))
> > -                     __add_dirty_inode(inode, type);
> > -             inode_add_dirty_blocks(inode, nr);
> > -     } else {
> > -             inode_sub_dirty_blocks(inode, -nr);
> > -             __remove_dirty_inode(inode, type);
> > -     }
> > -     spin_unlock(&sbi->inode_lock[type]);
> > -}
> > -
> > -void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio)
> > -{
> >       if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
> >                       !S_ISLNK(inode->i_mode))
> >               return;
> >
> > -     /*
> > -      * Large folios have a subpage dirty bitmap, so defer their dirty=
 accounting
> > -      * to the f2fs_ffs_*subrange_dirty*() helpers.  This avoids nesti=
ng
> > -      * ffs->state_lock with the inode dirty list lock.
> > -      */
> > -     if (f2fs_folio_has_ffs(folio)) {
> > -             folio_set_f2fs_reference(folio);
> > -             return;
> > -     }
> > -
> > -     f2fs_account_dirty_blocks(inode, 1);
> > +     spin_lock(&sbi->inode_lock[type]);
> > +     if (type !=3D FILE_INODE || test_opt(sbi, DATA_FLUSH))
> > +             __add_dirty_inode(inode, type);
> > +     inode_add_dirty_blocks(inode, nr_blocks);
> > +     spin_unlock(&sbi->inode_lock[type]);
> >
> >       folio_set_f2fs_reference(folio);
> >   }
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 07b7aeb94350..41246f83b31d 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -420,8 +420,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> >
> >       bio_for_each_folio_all(fi, bio) {
> >               struct folio *folio =3D fi.folio;
> > -             unsigned int nr_pages =3D fi.length >> PAGE_SHIFT;
> > -             unsigned int npages =3D nr_pages;
> > +             unsigned int nr_blocks =3D fi.length >> sbi->log_blocksiz=
e;
>
> F2FS_BYTES_TO_BLK(sbi, fi.length);
>
> >               enum count_type type;
> >
> >   #ifdef CONFIG_F2FS_FS_COMPRESSION
> > @@ -441,8 +440,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> >                       }
> >               }
> >
> > -             while (nr_pages--)
> > -                     dec_cache_count(sbi, type);
> > +             sub_cache_counts(sbi, type, nr_blocks);
> >
> >               /*
> >                * we should access sbi before folio_end_writeback() to
> > @@ -452,7 +450,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> >                               wq_has_sleeper(&sbi->cp_wait))
> >                       wake_up(&sbi->cp_wait);
> >
> > -             f2fs_ffs_put_write_pending(folio, npages);
> > +             f2fs_ffs_put_write_pending(folio, nr_blocks);
> >       }
> >
> >       bio_put(bio);
> > @@ -3023,7 +3021,7 @@ static void f2fs_clear_truncated_page_state(struc=
t folio *folio, pgoff_t i)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> >
> > -     if (f2fs_folio_has_ffs(folio)) {
> > +     if (f2fs_is_multiblock_folio(sbi, folio)) {
> >               f2fs_ffs_clear_subrange_uptodate(folio,
> >                               F2FS_BLK_TO_BYTES(sbi, i), F2FS_BLKSIZE(s=
bi));
> >       } else {
> > @@ -3051,21 +3049,6 @@ bool f2fs_ffs_test_blk_dirty(const struct folio =
*folio, pgoff_t index)
> >       return test_bit(nr_blocks + offset, ffs->state);
> >   }
> >
> > -static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
> > -                     struct f2fs_folio_state *ffs, size_t offset, size=
_t len)
> > -{
> > -     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > -     unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > -     unsigned int start, end, before;
> > -
> > -     start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > -     end =3D min_t(unsigned int, F2FS_BLK_ALIGN(sbi, offset + len), nr=
_blocks);
> > -
> > -     before =3D bitmap_weight(ffs->state, 2 * nr_blocks);
> > -     bitmap_set(ffs->state, nr_blocks + start, end - start);
> > -     return bitmap_weight(ffs->state, 2 * nr_blocks) - before;
> > -}
> > -
> >   /*
> >    * Mark the given range dirty for writeback.
> >    *
> > @@ -3078,7 +3061,8 @@ void f2fs_ffs_mark_subrange_dirty(struct folio *f=
olio,
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> >       struct f2fs_folio_state *ffs;
> > -     unsigned int set;
> > +     unsigned int nr_blocks;
> > +     unsigned int start, end;
> >       unsigned long flags;
> >
> >       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> > @@ -3087,13 +3071,13 @@ void f2fs_ffs_mark_subrange_dirty(struct folio =
*folio,
> >               return;
> >
> >       ffs =3D f2fs_ffs_find_or_alloc(folio);
> > +     nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > +     start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     end =3D min_t(unsigned int, F2FS_BLK_ALIGN(sbi, offset + len), nr=
_blocks);
> >
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> > -     set =3D __ffs_mark_subrange_dirty(folio, ffs, offset, len);
> > +     bitmap_set(ffs->state, start + nr_blocks, end - start);
> >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> > -
> > -     if (set)
> > -             f2fs_account_dirty_blocks(folio->mapping->host, set);
> >   }
> >
> >   void f2fs_ffs_clear_subrange_uptodate(struct folio *folio,
> > @@ -3129,19 +3113,16 @@ void f2fs_ffs_clear_subrange_uptodate(struct fo=
lio *folio,
> >   }
> >
> >   static bool __ffs_clear_subrange_dirty(struct folio *folio,
> > -                     struct f2fs_folio_state *ffs, size_t offset, size=
_t len,
> > -                     unsigned int *cleared)
> > +                     struct f2fs_folio_state *ffs, size_t offset, size=
_t len)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> >       unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > -     unsigned int start, end, before;
> > +     unsigned int start, end;
> >
> >       start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> >       end =3D min_t(unsigned int, F2FS_BLK_ALIGN(sbi, offset + len), nr=
_blocks);
> >
> > -     before =3D bitmap_weight(ffs->state, 2 * nr_blocks);
> >       bitmap_clear(ffs->state, nr_blocks + start, end - start);
> > -     *cleared =3D before - bitmap_weight(ffs->state, 2 * nr_blocks);
> >       return find_next_bit(ffs->state, 2 * nr_blocks, nr_blocks) <
> >                       2 * nr_blocks;
> >   }
> > @@ -3153,15 +3134,13 @@ static bool __ffs_clear_subrange_dirty(struct f=
olio *folio,
> >    * @len: byte length of the subrange
> >    *
> >    * Clear the dirty bits of the 4K subpages covered by [offset, offset=
 + len),
> > - * account the cleared subpages against the inode dirty counters, and =
return
> > - * whether the folio still has any dirty subpage left.
> > + * and return whether the folio still has any dirty subpage left.
> >    */
> >   bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size=
_t offset,
> >                                           size_t len)
> >   {
> >       struct f2fs_folio_state *ffs;
> >       unsigned long flags;
> > -     unsigned int cleared =3D 0;
> >       bool dirty;
> >
> >       if (!f2fs_folio_has_ffs(folio)) {
> > @@ -3178,12 +3157,9 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(stru=
ct folio *folio, size_t offset,
> >
> >       ffs =3D f2fs_ffs_find_or_alloc(folio);
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> > -     dirty =3D __ffs_clear_subrange_dirty(folio, ffs, offset, len, &cl=
eared);
> > +     dirty =3D __ffs_clear_subrange_dirty(folio, ffs, offset, len);
> >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> >
> > -     if (cleared)
> > -             f2fs_account_dirty_blocks(folio->mapping->host, -cleared)=
;
> > -
> >       return dirty;
> >   }
> >
> > @@ -3943,7 +3919,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *=
fio)
> >   static int f2fs_write_folio_dirty_range(struct folio *folio, int *sub=
mitted,
> >                                       struct writeback_control *wbc,
> >                                       enum iostat_type io_type,
> > -                                     u64 *pos, u64 len)
> > +                                     u64 start, u64 end)
> >   {
> >       struct inode *inode =3D folio->mapping->host;
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > @@ -3951,19 +3927,19 @@ static int f2fs_write_folio_dirty_range(struct =
folio *folio, int *submitted,
> >                               folio_test_f2fs_atomic(folio);
> >       struct inode *dn_inode =3D atomic_commit ?
> >                               F2FS_I(inode)->cow_inode : inode;
> > -     struct f2fs_folio_state *ffs =3D NULL;
> > -     u64 folio_start =3D folio_pos(folio);
> > -     pgoff_t start_idx =3D (*pos - folio_start) >> PAGE_SHIFT;
> > -     pgoff_t end_idx =3D (*pos - folio_start + len - 1) >> PAGE_SHIFT;
> > +     u64 pos =3D folio_pos(folio);
> > +     pgoff_t start_idx =3D (start - pos) >> sbi->log_blocksize;
> > +     pgoff_t end_idx =3D (end - 1 - pos) >> sbi->log_blocksize;
>
> F2FS_BYTES_TO_BLK(sbi, start - pos);
> F2FS_BYTES_TO_BLK(sbi, end - 1 - pos);
>
> > +     pgoff_t last_idx =3D 0;
> > +     pgoff_t i;
> > +     int local_submitted =3D 0;
> >       int err =3D 0;
> >
> > -     for (pgoff_t i =3D start_idx; i <=3D end_idx && !err; i++) {
> > +     for (i =3D start_idx; i <=3D end_idx; i++) {
> >               struct dnode_of_data dn;
> >               struct node_info ni;
> > -             pgoff_t data_idx =3D folio->index + i;
> > +             pgoff_t data_idx =3D f2fs_folio_lblk(sbi, folio) + i;
> >               bool ipu_force =3D false;
> > -             bool dn_held =3D false;
> > -             bool submitted_blk =3D false;
> >               struct f2fs_io_info fio =3D {
> >                       .sbi =3D sbi,
> >                       .ino =3D inode->i_ino,
> > @@ -3983,7 +3959,12 @@ static int f2fs_write_folio_dirty_range(struct f=
olio *folio, int *submitted,
> >               };
> >
> >               if (f2fs_folio_has_ffs(folio)) {
> > -                     ffs =3D (struct f2fs_folio_state *)folio->private=
;
> > +                     struct f2fs_folio_state *ffs =3D
> > +                             (struct f2fs_folio_state *)folio->private=
;
> > +
> > +                     /* Write only dirty blocks */
> > +                     if (!f2fs_ffs_test_blk_dirty(folio, data_idx))
> > +                             continue;
> >                       atomic_inc(&ffs->write_blocks_pending);
> >               }
> >
> > @@ -3995,7 +3976,7 @@ static int f2fs_write_folio_dirty_range(struct fo=
lio *folio, int *submitted,
> >                       if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> >                                                  DATA_GENERIC_ENHANCE))=
 {
> >                               err =3D -EFSCORRUPTED;
> > -                             goto block_done;
> > +                             goto skip_block;
> >                       }
> >                       ipu_force =3D true;
> >                       goto got_it;
> > @@ -4015,24 +3996,22 @@ static int f2fs_write_folio_dirty_range(struct =
folio *folio, int *submitted,
> >                                                    LOOKUP_NODE);
> >               }
> >               if (err && err !=3D -ENOENT)
> > -                     goto block_done;
> > -             dn_held =3D true;
> > +                     goto skip_block;
> >
> > -             fio.old_blkaddr =3D dn.data_blkaddr;
> > -
> > -             /* This page is already truncated */
> > -             if (err =3D=3D -ENOENT || fio.old_blkaddr =3D=3D NULL_ADD=
R) {
> > -                     f2fs_clear_truncated_page_state(folio, i);
> > +             /* This block is already truncated */
> > +             if (err || dn.data_blkaddr =3D=3D NULL_ADDR) {
> >                       err =3D 0;
> > -                     goto block_done;
> > +                     f2fs_clear_truncated_page_state(folio, i);
> > +                     goto skip_block;
> >               }
> >
> > +             fio.old_blkaddr =3D dn.data_blkaddr;
> >   got_it:
> >               if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> >                   !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> >                                          DATA_GENERIC_ENHANCE)) {
> >                       err =3D -EFSCORRUPTED;
> > -                     goto block_done;
> > +                     goto skip_block;
> >               }
> >
> >               if (fio.meta_gc)
> > @@ -4042,61 +4021,109 @@ static int f2fs_write_folio_dirty_range(struct=
 folio *folio, int *submitted,
> >                   (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> >                                           need_inplace_update(&fio))) {
> >                       f2fs_put_dnode(&dn);
> > -                     dn_held =3D false;
> >                       err =3D f2fs_inplace_write_data(&fio);
> > -                     trace_f2fs_do_write_data_page(folio, IPU);
> >                       if (err)
> > -                             goto block_done;
> > +                             goto skip_block_no_dnode;
> >
> > -                     if (submitted)
> > -                             (*submitted)++;
> > -                     submitted_blk =3D true;
> > +                     local_submitted++;
> > +                     last_idx =3D data_idx;
> >                       set_inode_flag(inode, FI_UPDATE_WRITE);
> > -                     goto block_done;
> > +                     trace_f2fs_do_write_data_page(folio, IPU);
> > +                     continue;
> >               }
> >
> >               err =3D f2fs_get_node_info(sbi, dn.nid, &ni, false);
> >               if (err)
> > -                     goto block_done;
> > +                     goto skip_block;
> >
> >               fio.version =3D ni.version;
> >
> >               f2fs_outplace_write_data(&dn, &fio);
> > -             /*
> > -              * The outplace write path failed to submit this block.
> > -              */
> > +             f2fs_put_dnode(&dn);
> > +             /* The outplace write path failed to submit this block. *=
/
> >               if (!fio.submitted) {
> >                       err =3D -EIO;
> > -                     goto block_done;
> > +                     goto skip_block_no_dnode;
> >               }
> > -             if (submitted)
> > -                     (*submitted)++;
> > -             submitted_blk =3D true;
> > +             local_submitted++;
> > +             last_idx =3D data_idx;
> >               set_inode_flag(inode, FI_APPEND_WRITE);
> >               trace_f2fs_do_write_data_page(folio, OPU);
> > -block_done:
> > -             if (dn_held)
> > -                     f2fs_put_dnode(&dn);
> > +             continue;
> > +
> > +skip_block:
> > +             f2fs_put_dnode(&dn);
> > +skip_block_no_dnode:
> > +             if (f2fs_folio_has_ffs(folio))
> > +                     f2fs_ffs_put_write_pending(folio, 1);
> > +             if (err)
> > +                     break;
> > +     }
> > +
> > +     if (err) {
> >               /*
> > -              * If this block was not submitted, roll back its
> > -              * write pages pending.
> > +              * The blocks before the failed one were written or skipp=
ed, so
> > +              * keep only the failed block and the ones after it dirty=
.
> >                */
> > -             if (!submitted_blk && ffs)
> > -                     f2fs_ffs_put_write_pending(folio, 1);
> > -             if (!err) {
> > -                     *pos =3D ((loff_t)data_idx + 1) << PAGE_SHIFT;
> > -                     spin_lock(&F2FS_I(inode)->i_size_lock);
> > -                     if (F2FS_I(inode)->last_disk_size < *pos)
> > -                             F2FS_I(inode)->last_disk_size =3D *pos;
> > -                     spin_unlock(&F2FS_I(inode)->i_size_lock);
> > -             } else {
> > -                     file_set_keep_isize(inode);
> > +             if (i > start_idx) {
> > +                     size_t len =3D F2FS_BLK_TO_BYTES(sbi, i - start_i=
dx);
> > +
> > +                     f2fs_ffs_clear_subrange_dirty_and_test(folio,
> > +                                                            start - po=
s, len);
> >               }
> > +             file_set_keep_isize(inode);
> > +     } else if (local_submitted) {
> > +             loff_t psize =3D (loff_t)(last_idx + 1) << sbi->log_block=
size;
>
> F2FS_BLK_TO_BYTES(sbi, last_idx + 1)
>
> > +
> > +             if (psize > i_size_read(inode))
> > +                     psize =3D i_size_read(inode);
>
> It seems an improvement, to avoid unnecessary inode write during fsync, c=
an we fix
> f2fs_write_single_data_page as well? maybe it's better fix them all in a =
separated
> patch?

Agreed. f2fs_write_single_data_page() and the compressed write path also
set last_disk_size beyond i_size. Besides the extra inode write, if
i_size grows to the recorded value later, f2fs_skip_inode_update() can
see last_disk_size =3D=3D i_size even though the inode on disk still has
the old size. I will fix all of them in a separate patch.

>
> > +
> > +             spin_lock(&F2FS_I(inode)->i_size_lock);
> > +             if (F2FS_I(inode)->last_disk_size < psize)
> > +                     F2FS_I(inode)->last_disk_size =3D psize;
> > +             spin_unlock(&F2FS_I(inode)->i_size_lock);
> >       }
> >
> > +     if (submitted)
> > +             *submitted =3D local_submitted;
> >       return err;
> >   }
> >
> > +/* Dentry and quota blocks are controlled by checkpoint. */
> > +static bool f2fs_cp_controlled_inode(struct inode *inode)
> > +{
> > +     return S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode);
> > +}
> > +
> > +enum f2fs_wb_action {
> > +     F2FS_WB_WRITE,          /* write back the folio */
> > +     F2FS_WB_REDIRTY,        /* keep the folio dirty */
> > +     F2FS_WB_DROP,           /* drop the dirty data */
> > +};
> > +
> > +/* Decide what to do with a dirty data folio before writing it back. *=
/
> > +static enum f2fs_wb_action f2fs_wb_folio_action(struct f2fs_sb_info *s=
bi,
> > +                                             struct inode *inode)
> > +{
> > +     /* we should bypass data pages to proceed the kworker jobs */
> > +     if (unlikely(f2fs_cp_error(sbi))) {
> > +             mapping_set_error(inode->i_mapping, -EIO);
> > +             /*
> > +              * Keep dirty dentry folios for the latest directory stru=
cture,
> > +              * and keep data folios in remount-ro mode.
> > +              */
> > +             if ((S_ISDIR(inode->i_mode) &&
> > +                  !is_sbi_flag_set(sbi, SBI_IS_CLOSE)) ||
> > +                 F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_READONLY)
> > +                     return F2FS_WB_REDIRTY;
> > +             return F2FS_WB_DROP;
> > +     }
> > +
> > +     if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> > +             return F2FS_WB_REDIRTY;
> > +     return F2FS_WB_WRITE;
> > +}
> > +
> >   int f2fs_write_single_data_page(struct folio *folio, int *submitted,
> >                               struct bio **bio,
> >                               sector_t *last_block,
> > @@ -4137,26 +4164,15 @@ int f2fs_write_single_data_page(struct folio *f=
olio, int *submitted,
> >
> >       trace_f2fs_writepage(folio, DATA);
> >
> > -     /* we should bypass data pages to proceed the kworker jobs */
> > -     if (unlikely(f2fs_cp_error(sbi))) {
> > -             mapping_set_error(folio->mapping, -EIO);
> > -             /*
> > -              * don't drop any dirty dentry pages for keeping lastest
> > -              * directory structure.
> > -              */
> > -             if (S_ISDIR(inode->i_mode) &&
> > -                             !is_sbi_flag_set(sbi, SBI_IS_CLOSE))
> > -                     goto redirty_out;
> > -
> > -             /* keep data pages in remount-ro mode */
> > -             if (F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_READONLY)
> > -                     goto redirty_out;
> > +     switch (f2fs_wb_folio_action(sbi, inode)) {
> > +     case F2FS_WB_REDIRTY:
> > +             goto redirty_out;
> > +     case F2FS_WB_DROP:
> >               goto out;
> > +     case F2FS_WB_WRITE:
> > +             break;
> >       }
> >
> > -     if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> > -             goto redirty_out;
> > -
> >       if (folio->index < end_index ||
> >                       f2fs_verity_in_progress(inode) ||
> >                       compr_blocks)
> > @@ -4172,8 +4188,7 @@ int f2fs_write_single_data_page(struct folio *fol=
io, int *submitted,
> >
> >       folio_zero_segment(folio, offset, folio_size(folio));
> >   write:
> > -     /* Dentry/quota blocks are controlled by checkpoint */
> > -     if (S_ISDIR(inode->i_mode) || quota_inode) {
> > +     if (f2fs_cp_controlled_inode(inode)) {
> >               struct f2fs_lock_context lc;
> >
> >               /*
> > @@ -4224,14 +4239,14 @@ int f2fs_write_single_data_page(struct folio *f=
olio, int *submitted,
> >               goto redirty_out;
> >
> >   out:
> > -     inode_dec_dirty_block(inode);
> > +     inode_sub_dirty_blocks(inode, f2fs_blocks_per_folio(sbi, folio));
> >       if (err) {
> >               folio_clear_uptodate(folio);
> >               folio_clear_f2fs_gcing(folio);
> >       }
> >       folio_unlock(folio);
> > -     if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
> > -                     !F2FS_I(inode)->wb_task && allow_balance)
> > +     if (!f2fs_cp_controlled_inode(inode) &&
> > +         !F2FS_I(inode)->wb_task && allow_balance)
> >               f2fs_balance_fs(sbi, need_balance_fs);
> >
> >       if (unlikely(f2fs_cp_error(sbi))) {
> > @@ -4560,6 +4575,7 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
> >       int submitted =3D 0;
> >       int nwritten =3D 0;
> >       bool op_locked =3D false;
> > +     bool node_locked =3D false;
> >       bool retry =3D false;
> >
> >       if (get_dirty_blocks(inode) <=3D SM_I(sbi)->min_hot_blocks)
> > @@ -4571,20 +4587,15 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >               struct f2fs_folio_state *ffs =3D NULL;
> >               u64 isize;
> >               size_t poff;
> > -             size_t clear_len;
> >               pgoff_t end_index;
> >               bool verity_in_progress;
> >               int folio_submitted =3D 0;
> >               bool bias_added =3D false;
> >
> >               submitted =3D 0;
> > +             err =3D 0;
> >               retry =3D false;
> >
> > -             if (err) {
> > -                     folio_redirty_for_writepage(wbc, folio);
> > -                     goto retry_out;
> > -             }
> > -
> >               if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> >                   wbc->sync_mode =3D=3D WB_SYNC_NONE) {
> >                       folio_redirty_for_writepage(wbc, folio);
> > @@ -4597,11 +4608,22 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >                       goto retry_out;
> >               }
> >
> > +             if (f2fs_has_subpage_blocks(sbi) &&
> > +                 (f2fs_compressed_file(inode) || f2fs_is_atomic_file(i=
node))) {
> > +                     WARN_ON_ONCE(1);
> > +                     mapping_set_error(mapping, -EOPNOTSUPP);
> > +                     folio_clear_dirty_for_io(folio);
> > +                     inode_sub_dirty_blocks(inode, f2fs_blocks_per_fol=
io(sbi, folio));
> > +                     err =3D -EOPNOTSUPP;
> > +                     goto retry_out;
> > +             }
> > +
> >               /*
> >                * Writing back one large folio performs multiple block a=
llocations, so
> >                * best-effort balance the filesystem before writing it b=
ack.
> >                */
> > -             if (!F2FS_I(inode)->wb_task && has_not_enough_free_secs(s=
bi, 0, 0)) {
> > +             if (!f2fs_cp_controlled_inode(inode) &&
> > +                 !F2FS_I(inode)->wb_task && has_not_enough_free_secs(s=
bi, 0, 0)) {
> >                       folio_redirty_for_writepage(wbc, folio);
> >                       retry =3D true;
> >                       folio_unlock(folio);
> > @@ -4636,31 +4658,39 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >               }
> >
> >               /*
> > -              * If cp_error is set, all subpages of this folio are not
> > -              * written back unless the filesystem is mounted with
> > -              * errors=3Dremount-ro.  The check is placed after the re=
try
> > -              * block so it also covers cp_error being set while the f=
olio
> > -              * lock was dropped for f2fs_balance_fs() or for the tryl=
ock_op()
> > -              * backoff.  PG_dirty is clear at this point, so both the
> > -              * redirty and the drop below leave a coherent state.
> > +              * Checked after the retry block, so that it also covers =
cp_error
> > +              * being set while the folio lock was dropped for f2fs_ba=
lance_fs()
> > +              * or for the trylock_op() backoff.
> >                */
> > -             if (unlikely(f2fs_cp_error(sbi))) {
> > -                     mapping_set_error(mapping, -EIO);
> > -                     if (F2FS_OPTION(sbi).errors =3D=3D MOUNT_ERRORS_R=
EADONLY) {
> > -                             folio_redirty_for_writepage(wbc, folio);
> > -                             goto retry_out;
> > -                     }
> > -                     goto out;
> > +             switch (f2fs_wb_folio_action(sbi, inode)) {
> > +             case F2FS_WB_REDIRTY:
> > +                     folio_redirty_for_writepage(wbc, folio);
> > +                     goto retry_out;
> > +             case F2FS_WB_DROP:
> > +                     f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> > +                                             folio_size(folio));
> > +                     inode_sub_dirty_blocks(inode, f2fs_blocks_per_fol=
io(sbi, folio));
> > +                     goto retry_out;
> > +             case F2FS_WB_WRITE:
> > +                     break;
> >               }
> >
> > -             /* To avoid dealing with the complexity for one subrange =
is in bio
> > -              * while we trylock_op failed before writing another subr=
ange.
> > -              * Try to lock_op before any subrange write for the folio=
.
> > -              */
> > -             if (!op_locked) {
> > +             if (f2fs_cp_controlled_inode(inode)) {
> > +                     /*
> > +                      * Quota writes need node_write to avoid block
> > +                      * allocation during checkpoint.
> > +                      */
> > +                     if (IS_NOQUOTA(inode)) {
> > +                             f2fs_down_read_trace(&sbi->node_write, &l=
c);
> > +                             node_locked =3D true;
> > +                     }
> > +             } else {
> > +                     /* To avoid dealing with the complexity for one s=
ubrange is in bio
> > +                      * while we trylock_op failed before writing anot=
her subrange.
> > +                      * Try to lock_op before any subrange write for t=
he folio.
> > +                      */
> >                       if (!f2fs_trylock_op(sbi, &lc)) {
> >                               folio_redirty_for_writepage(wbc, folio);
> > -                             err =3D 0;
> >                               if (wbc->sync_mode !=3D WB_SYNC_ALL)
> >                                       goto retry_out;
> >
> > @@ -4690,59 +4720,34 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >               folio_start_writeback(folio);
> >
> >               /*
> > -              * PG_dirty was already cleared by writeback_iter(), and =
a
> > -              * single-block folio has no ffs dirty bitmap, so the dir=
ty
> > -              * range cannot be derived. Write the whole folio.
> > +              * PG_dirty was already cleared by writeback_iter(). A si=
ngle-block
> > +              * folio has no ffs, so its whole folio is written.
> >                */
> > -             if (!folio_test_large(folio)) {
> > -                     err =3D f2fs_write_folio_dirty_range(folio, &subm=
itted,
> > -                                     wbc, io_type, &pos, end_pos - pos=
);
> > -                     folio_submitted +=3D submitted;
> > -                     if (err)
> > -                             goto out;
> > -                     nwritten +=3D submitted;
> > -                     goto written;
> > -             }
> > -
> > -             if (!f2fs_folio_has_ffs(folio)) {
> > -                     ffs =3D f2fs_ffs_find_or_alloc(folio);
> > -                     f2fs_ffs_mark_subrange_dirty(folio, 0, end_pos - =
pos);
> > -             } else {
> > +             if (f2fs_is_multiblock_folio(sbi, folio)) {
> > +                     if (!f2fs_folio_has_ffs(folio))
> > +                             f2fs_ffs_mark_subrange_dirty(folio, 0, en=
d_pos - pos);
> >                       ffs =3D (struct f2fs_folio_state *)folio->private=
;
> > +                     /*
> > +                      * Multiblock folios can be submitted as multiple=
 bios,
> > +                      * which may complete while we are still submitti=
ng the
> > +                      * remaining dirty ranges.  Hold a bias on
> > +                      * write_blocks_pending to prevent folio_end_writ=
eback()
> > +                      * from being called early.
> > +                      */
> > +                     if (!bias_added) {
> > +                             WARN_ON_ONCE(atomic_read(&ffs->write_bloc=
ks_pending) !=3D 0);
> > +                             atomic_inc(&ffs->write_blocks_pending);
> > +                             bias_added =3D true;
> > +                     }
> >               }
> > -             /*
> > -              * Large folios can be submitted as multiple bios, which =
may
> > -              * complete while we are still submitting the remaining d=
irty
> > -              * ranges.  Hold a bias on write_blocks_pending to preven=
t
> > -              * folio_end_writeback() from being called early.
> > -              */
> > -             if (f2fs_folio_has_ffs(folio) && !bias_added) {
> > -                     WARN_ON_ONCE(atomic_read(&ffs->write_blocks_pendi=
ng) !=3D 0);
> > -                     atomic_inc(&ffs->write_blocks_pending);
> > -                     bias_added =3D true;
> > -             }
> > -
> > -             unsigned int from =3D 0, start, count;
> > -             unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, fol=
io);
> > -             unsigned int to_blk =3D min_t(unsigned int,
> > -                             F2FS_BLK_ALIGN(sbi, end_pos - folio_pos(f=
olio)),
> > -                             nr_blocks);
> >
> > -             while (f2fs_ffs_dirty_blk_range(folio, from, to_blk,
> > -                                             &start, &count)) {
> > -                     submitted =3D 0;
> > -                     pos =3D folio_pos(folio) + F2FS_BLK_TO_BYTES(sbi,=
 start);
> > -                     err =3D f2fs_write_folio_dirty_range(folio, &subm=
itted,
> > -                                     wbc, io_type, &pos,
> > -                                     F2FS_BLK_TO_BYTES(sbi, count));
> > -                     folio_submitted +=3D submitted;
> > -                     nwritten +=3D submitted;
> > -                     if (err)
> > -                             goto out;
> > -                     from =3D start + count;
> > -             }
> > +             err =3D f2fs_write_folio_dirty_range(folio, &submitted, w=
bc, io_type,
> > +                                                pos, end_pos);
> > +             folio_submitted +=3D submitted;
> > +             nwritten +=3D submitted;
> > +             if (err)
> > +                     goto out;
> >
> > -written:
> >               /* If none of the subpages of a folio is submitted, keep =
the atomic flag */
> >               if (folio_submitted &&
> >                   f2fs_is_atomic_file(inode) &&
> > @@ -4750,26 +4755,12 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >                       folio_clear_f2fs_atomic(folio);
> >
> >   out:
> > -             /*
> > -              * Clear the dirty state of the subranges that were writt=
en back.
> > -              * If some subranges are still dirty (e.g. the folio was =
only
> > -              * partially written back), or if the writeback failed, t=
he
> > -              * folio must stay dirty so that the remaining subranges =
are
> > -              * written back later.
> > -              *
> > -              * On success, clear dirty bits of the whole folio rather=
 than
> > -              * up to isize: subpages beyond EOF can still carry dirty=
 bits
> > -              * (e.g. fill_zero() w/ FALLOC_FL_KEEP_SIZE, BG_GC on blo=
cks
> > -              * beyond EOF, or f2fs_ffs_find_or_alloc() on a dirty fol=
io),
> > -              * they will never be written back, and would keep the fo=
lio
> > -              * redirtied forever.
> > -              */
> > -             clear_len =3D err ? pos - folio_pos(folio) : folio_size(f=
olio);
> > -             if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> > -                                             clear_len) || err) {
> > +             if (!err) {
> > +                     f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> > +                                             folio_size(folio));
> > +                     inode_sub_dirty_blocks(inode, f2fs_blocks_per_fol=
io(sbi, folio));
> > +             } else {
> >                       folio_redirty_for_writepage(wbc, folio);
> > -             } else if (!f2fs_folio_has_ffs(folio)) {
> > -                     inode_dec_dirty_block(inode);
> >               }
> >
> >               /*
> > @@ -4780,7 +4771,7 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
> >                       f2fs_ffs_put_write_pending(folio, 1);
> >               } else if (!folio_submitted && folio_test_writeback(folio=
)) {
> >                       /*
> > -                      * Order-0 folios take no bias, so end the writeb=
ack
> > +                      * Single-block folios take no bias, so end the w=
riteback
> >                        * if nothing was submitted.
> >                        */
> >                       folio_end_writeback(folio);
> > @@ -4792,6 +4783,11 @@ static int f2fs_write_cache_folios(struct addres=
s_space *mapping,
> >                       op_locked =3D false;
> >               }
> >
> > +             if (node_locked) {
> > +                     f2fs_up_read_trace(&sbi->node_write, &lc);
> > +                     node_locked =3D false;
> > +             }
> > +
> >               folio_unlock(folio);
> >       }
> >
> > @@ -4872,10 +4868,10 @@ static int __f2fs_write_data_pages(struct addre=
ss_space *mapping,
> >       if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >               goto skip_write;
> >
> > -     if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
> > -                     wbc->sync_mode =3D=3D WB_SYNC_NONE &&
> > -                     get_dirty_blocks(inode) < nr_caches_to_skip(sbi, =
DATA) &&
> > -                     f2fs_available_free_memory(sbi, DIRTY_DENTS))
> > +     if (f2fs_cp_controlled_inode(inode) &&
> > +         wbc->sync_mode =3D=3D WB_SYNC_NONE &&
> > +         get_dirty_blocks(inode) < nr_caches_to_skip(sbi, DATA) &&
> > +         f2fs_available_free_memory(sbi, DIRTY_DENTS))
> >               goto skip_write;
> >
> >       /* skip writing in file defragment preparing stage */
> > @@ -4902,7 +4898,7 @@ static int __f2fs_write_data_pages(struct address=
_space *mapping,
> >       account_writeback(inode, true);
> >
> >       blk_start_plug(&plug);
> > -     if (mapping_large_folio_support(inode->i_mapping) &&
> > +     if (f2fs_has_multiblock_folios(inode) &&
> >           !f2fs_has_inline_data(inode))
> >               ret =3D f2fs_write_cache_folios(mapping, wbc, io_type);
> >       else
> > @@ -5136,7 +5132,7 @@ static int prepare_atomic_write_begin(struct f2fs=
_sb_info *sbi,
> >       int err =3D 0;
> >       block_t ori_blk_addr =3D NULL_ADDR;
> >       bool cow_has_reserved_block =3D false;
> > -     bool append =3D ((loff_t)index << PAGE_SHIFT) >=3D i_size_read(in=
ode);
> > +     bool append =3D F2FS_BLK_TO_BYTES(sbi, index) >=3D i_size_read(in=
ode);
> >
> >       /*
> >        * On the first attempt, an append write can skip the COW lookup =
and
> > @@ -5226,7 +5222,7 @@ static bool f2fs_balance_fs_folio_locked(struct f=
olio *folio,
> >
> >   static int prepare_large_folio_write_begin(struct inode *inode,
> >                                         struct folio *folio, loff_t pos=
,
> > -                                       unsigned int len)
> > +                                       unsigned int len, bool *need_ba=
lance)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       struct f2fs_folio_state *ffs;
> > @@ -5234,9 +5230,13 @@ static int prepare_large_folio_write_begin(struc=
t inode *inode,
> >       size_t need_off =3D ori_off;
> >       int err =3D 0;
> >
> > +     if (f2fs_has_subpage_blocks(sbi) &&
> > +         (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode)))
> > +             return -EOPNOTSUPP;
> > +
> >       /*
> > -      * when the write did not come through f2fs_write_iter, we preall=
ocate all
> > -      * blocks in the write range here.
> > +      * Reserve blocks without f2fs_balance_fs() since the folio is lo=
cked;
> > +      * the caller balances after unlocking it if *need_balance is set=
.
>
> I think there is potential risk if we don't allow unlock -> f2fs_balance_=
fs, e.g.
> multiple threads call write_begin to write high order large folio concurr=
ently will
> consume free blocks quickly, it may run out of free segments potentially =
w/o fggc.
> thoughts?

f2fs_balance_fs() is still called. f2fs_write_begin() calls
f2fs_balance_fs_folio_locked() right after this, which unlocks the
folio, calls f2fs_balance_fs() and locks it again, under the same
condition (node_changed) as before. It is only moved to the caller, so
that the order-0 and multi-block paths balance in one place. I will
make the comment clearer in v2.

Thanks,

>
> Thanks,
>
> >        */
> >       if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
> >           !IS_DEVICE_ALIASING(inode)) {
> > @@ -5252,9 +5252,7 @@ static int prepare_large_folio_write_begin(struct=
 inode *inode,
> >                                                  &node_changed);
> >                       if (err)
> >                               return err;
> > -                     if (f2fs_balance_fs_folio_locked(folio, folio->ma=
pping,
> > -                                                node_changed))
> > -                             return -EAGAIN;
> > +                     *need_balance |=3D node_changed;
> >               }
> >       }
> >
> > @@ -5266,8 +5264,12 @@ static int prepare_large_folio_write_begin(struc=
t inode *inode,
> >       if (folio_test_uptodate(folio) || len =3D=3D folio_size(folio))
> >               return 0;
> >
> > +     /*
> > +      * Skip read if the write starts at a block boundary and reaches =
EOF,
> > +      * and zero the rest of the folio instead.
> > +      */
> >       if (!f2fs_verity_in_progress(inode) &&
> > -         !(pos & (PAGE_SIZE - 1)) && (pos + len) >=3D i_size_read(inod=
e)) {
> > +         !(pos & (F2FS_BLKSIZE(sbi) - 1)) && (pos + len) >=3D i_size_r=
ead(inode)) {
> >               size_t zoff =3D ori_off + len;
> >
> >               if (zoff < folio_size(folio))
> > @@ -5281,7 +5283,8 @@ static int prepare_large_folio_write_begin(struct=
 inode *inode,
> >       while (find_next_valid_block(folio, ori_off,
> >                                    &need_off, len)) {
> >               struct dnode_of_data dn;
> > -             pgoff_t index =3D folio->index + (need_off >> PAGE_SHIFT)=
;
> > +             pgoff_t index =3D f2fs_folio_lblk(sbi, folio) +
> > +                             F2FS_BYTES_TO_BLK(sbi, need_off);
> >               block_t blkaddr;
> >
> >               if (!f2fs_lookup_read_extent_cache_block(inode, index,
> > @@ -5297,12 +5300,13 @@ static int prepare_large_folio_write_begin(stru=
ct inode *inode,
> >                       f2fs_put_dnode(&dn);
> >
> >                       if (blkaddr =3D=3D NEW_ADDR) {
> > -                             size_t off =3D offset_in_folio(folio,
> > -                                                          (loff_t)inde=
x << PAGE_SHIFT);
> > +                             size_t off =3D f2fs_folio_byte_offset(sbi=
,
> > +                                                             folio, in=
dex);
> >
> > -                             folio_zero_segment(folio, off, off + PAGE=
_SIZE);
> > +                             folio_zero_segment(folio, off,
> > +                                                off + F2FS_BLKSIZE(sbi=
));
> >                               f2fs_ffs_mark_subrange_uptodate(folio, of=
f,
> > -                                                            PAGE_SIZE)=
;
> > +                                                            F2FS_BLKSI=
ZE(sbi));
> >                               continue;
> >                       }
> >               }
> > @@ -5401,12 +5405,18 @@ static int f2fs_write_begin(const struct kiocb =
*iocb,
> >               goto fail;
> >       }
> >
> > +     if (f2fs_has_subpage_blocks(sbi) &&
> > +         (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) =
{
> > +             err =3D -EOPNOTSUPP;
> > +             goto fail;
> > +     }
> > +
> >       /*
> >        * We should check this at this moment to avoid deadlock on inode=
 page
> >        * and #0 page. The locking rule for inline_data conversion shoul=
d be:
> >        * folio_lock(folio #0) -> folio_lock(inode_page)
> >        */
> > -     if (index !=3D 0) {
> > +     if (index !=3D 0 || f2fs_has_subpage_blocks(sbi)) {
> >               err =3D f2fs_convert_inline_inode(inode);
> >               if (err)
> >                       goto fail;
> > @@ -5469,17 +5479,19 @@ static int f2fs_write_begin(const struct kiocb =
*iocb,
> >        */
> >       f2fs_folio_wait_writeback(folio, false, true);
> >
> > -     if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
> > +     if (f2fs_is_atomic_file(inode) && !f2fs_is_multiblock_folio(sbi, =
folio)) {
> >               err =3D prepare_atomic_write_begin(sbi, inode, folio->ind=
ex,
> >                                       &blkaddr, &need_balance, retried)=
;
> > -     else if (!folio_test_large(folio))
> > +     } else if (!f2fs_is_multiblock_folio(sbi, folio)) {
> >               err =3D prepare_write_begin(sbi, folio, pos, blen,
> >                                       &blkaddr, &need_balance);
> > -     else if (f2fs_is_atomic_file(inode))
> > +     } else if (f2fs_is_atomic_file(inode)) {
> >               err =3D prepare_large_folio_atomic_write_begin(inode,
> >                                       mapping, folio, pos, len, retried=
);
> > -     else
> > -             err =3D prepare_large_folio_write_begin(inode, folio, pos=
, blen);
> > +     } else {
> > +             err =3D prepare_large_folio_write_begin(inode, folio, pos=
, blen,
> > +                                                   &need_balance);
> > +     }
> >       if (err) {
> >               if (err =3D=3D -EAGAIN) {
> >                       retried =3D true;
> > @@ -5495,7 +5507,7 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >               goto repeat;
> >       }
> >
> > -     if (folio_test_large(folio))
> > +     if (f2fs_is_multiblock_folio(sbi, folio))
> >               return 0;
> >
> >       if (blen =3D=3D folio_size(folio) || folio_test_uptodate(folio))
> > @@ -5565,7 +5577,7 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >       if (!folio_test_uptodate(folio)) {
> >               if (unlikely(copied !=3D len)) {
> >                       copied =3D 0;
> > -             } else if (folio_test_large(folio)) {
> > +             } else if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), fol=
io)) {
> >                       f2fs_ffs_mark_subrange_uptodate(folio,
> >                                       offset_in_folio(folio, pos), len)=
;
> >               } else {
> > @@ -5590,7 +5602,7 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >       if (!copied)
> >               goto unlock_out;
> >
> > -     if (folio_test_large(folio))
> > +     if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio))
> >               f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio=
, pos),
> >                                                                  copied=
);
> >       folio_mark_dirty(folio);
> > @@ -5642,6 +5654,9 @@ void f2fs_invalidate_folio(struct folio *folio, s=
ize_t offset, size_t length)
> >                * dirty state.
> >                */
> >               if (!dirty && folio_test_dirty(folio)) {
> > +                     inode_sub_dirty_blocks(inode,
> > +                                     f2fs_blocks_per_folio(sbi, folio)=
);
> > +                     f2fs_remove_dirty_inode(inode);
> >                       f2fs_clear_page_cache_dirty_tag(folio);
> >                       folio_cancel_dirty(folio);
> >               }
> > @@ -5650,11 +5665,8 @@ void f2fs_invalidate_folio(struct folio *folio, =
size_t offset, size_t length)
> >               return;
> >       }
> >
> > -     if (f2fs_folio_has_ffs(folio)) {
> > -             f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> > -                                                     folio_size(folio)=
);
> > -     } else if (folio_test_dirty(folio)) {
> > -             inode_dec_dirty_block(inode);
> > +     if (folio_test_dirty(folio)) {
> > +             inode_sub_dirty_blocks(inode, f2fs_blocks_per_folio(sbi, =
folio));
> >               f2fs_remove_dirty_inode(inode);
> >       }
> >
> > diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> > index aa3511c6f8fe..7f5dc2354a27 100644
> > --- a/fs/f2fs/dir.c
> > +++ b/fs/f2fs/dir.c
> > @@ -979,9 +979,9 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentr=
y, void *dentry_block,
> >               if (!f2fs_has_subpage_blocks(sbi)) {
> >                       folio_clear_uptodate(folio);
> >                       folio_detach_private(folio);
> > -                     inode_dec_dirty_block(dir);
> >               }
> >
> > +             inode_sub_dirty_blocks(dir, f2fs_blocks_per_folio(sbi, fo=
lio));
> >               f2fs_remove_dirty_inode(dir);
> >       }
> >   keep_dirty:
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index cf7294068415..aab1095ad5ff 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4457,7 +4457,6 @@ void f2fs_remove_orphan_inode(struct f2fs_sb_info=
 *sbi, nid_t ino);
> >   int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi);
> >   int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi);
> >   void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio=
);
> > -void f2fs_account_dirty_blocks(struct inode *inode, int nr);
> >   void f2fs_remove_dirty_inode(struct inode *inode);
> >   int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type =
type,
> >                                                               bool from=
_cp);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 1ce4553b1d01..be548f39e33e 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -5561,12 +5561,13 @@ static int f2fs_preallocate_blocks(struct kiocb=
 *iocb, struct iov_iter *iter,
> >                       return ret;
> >       }
> >
> > -     if (!dio && mapping_large_folio_support(inode->i_mapping)) {
> > +     if (!dio && f2fs_has_multiblock_folios(inode)) {
> >               /*
> > -              * Preallocate all blocks touched by a large-folio buffer=
ed write so
> > -              * the regular write_begin path does not need to unlock t=
he folio for
> > -              * f2fs_balance_fs().  Rechecking large-folio state after=
 unlock is
> > -              * unreliable since partial truncation can split the foli=
o.
> > +              * Preallocate all blocks touched by a multiblock-folio b=
uffered
> > +              * write so the regular write_begin path does not need to=
 unlock
> > +              * the folio for f2fs_balance_fs().  Rechecking large-fol=
io
> > +              * state after unlock is unreliable since partial truncat=
ion can
> > +              * split the folio.
> >                */
> >               map.m_lblk =3D F2FS_BYTES_TO_BLK(sbi, pos);
> >               map.m_len =3D F2FS_BLK_ALIGN(sbi, pos + count);
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 6c24001325b2..f041a036836e 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1608,13 +1608,12 @@ static int move_data_cache_block(struct inode *=
inode, block_t bidx, int gc_type,
> >                       f2fs_ffs_mark_subrange_dirty(folio, foff, F2FS_BL=
KSIZE(sbi));
> >               folio_mark_dirty(folio);
> >               if (folio_clear_dirty_for_io(folio)) {
> > -                     if (!has_ffs) {
> > -                             inode_dec_dirty_block(inode);
> > -                             f2fs_remove_dirty_inode(inode);
> > -                     } else if (f2fs_ffs_clear_subrange_dirty_and_test=
(folio,
> > -                                             foff, F2FS_BLKSIZE(sbi)))=
 {
> > +                     inode_sub_dirty_blocks(inode, f2fs_blocks_per_fol=
io(sbi, folio));
> > +                     f2fs_remove_dirty_inode(inode);
> > +                     if (has_ffs &&
> > +                         f2fs_ffs_clear_subrange_dirty_and_test(folio,=
 foff,
> > +                                                     F2FS_BLKSIZE(sbi)=
))
> >                               folio_mark_dirty(folio);
> > -                     }
> >               }
> >
> >               folio_set_f2fs_gcing(folio);
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > index ba0aff8e5643..757be9f8d069 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -196,10 +196,15 @@ int f2fs_convert_inline_folio(struct dnode_of_dat=
a *dn, struct folio *folio)
> >       folio_start_writeback(folio);
> >       fio.old_blkaddr =3D dn->data_blkaddr;
> >       set_inode_flag(dn->inode, FI_HOT_DATA);
> > +     if (f2fs_is_multiblock_folio(fio.sbi, folio)) {
> > +             struct f2fs_folio_state *ffs =3D f2fs_ffs_find_or_alloc(f=
olio);
> > +
> > +             atomic_inc(&ffs->write_blocks_pending);
> > +     }
> >       f2fs_outplace_write_data(dn, &fio);
> >       f2fs_folio_wait_writeback(folio, true, true);
> >       if (dirty) {
> > -             inode_dec_dirty_block(dn->inode);
> > +             inode_sub_dirty_blocks(dn->inode, f2fs_blocks_per_folio(f=
io.sbi, folio));
> >               f2fs_remove_dirty_inode(dn->inode);
> >       }
> >
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index c48b12208e20..b95bb5c27b0b 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1700,7 +1700,7 @@ static void flush_inline_data(struct f2fs_sb_info=
 *sbi, nid_t ino)
> >               goto folio_out;
> >
> >       ret =3D f2fs_write_inline_data(inode, folio);
> > -     inode_dec_dirty_block(inode);
> > +     inode_sub_dirty_blocks(inode, f2fs_blocks_per_folio(sbi, folio));
> >       f2fs_remove_dirty_inode(inode);
> >       if (ret)
> >               folio_mark_dirty(folio);
>
