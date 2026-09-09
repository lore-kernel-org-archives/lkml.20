Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF6E3B8948
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986454; cv=pass; b=YDE27Mg9nhmIxtOgZMDibw9EEFa4av0wcCTpfpe8R0NDO5h/VK6HyH0z/j8qncLzTEeh3Kz8fT2aLp0+aU0Ae2MGDDSzKzDTH26YlSW8RIvlk4cFEw+mwi1Uh1zB0bmp9fhO9x1RSoHyP+rqniAse1GvjydYDcnWkG5NUo2U6kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986454; c=relaxed/simple;
	bh=jrpEqgKs1Gu81sBDNz1MsYHqTeovuLapYgjFT+Y9xyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jdl1o8EgUD0z4AAsNH3DAPH//LyaDM2y8tKX5RySGxTgp2nIzWIugmrv8q7HB/bzb0o1tIW31Q1eFt0OsJNa3yr45tu+TfKMuynvyLK+M5yHZr0Tpb7vCd8zQLxIXw+Z0hZKb82aH3XeScLxN8NojZK44yCVT+Fq5bE9yy0kUTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixee8BJz; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixee8BJz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b754cc3b6aso3790386e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788986441; cv=none;
        d=google.com; s=arc-20260327;
        b=Z27L7wekdVjmTaG4P3IT/FZ4dMhBFn/K7Zw0z2aH45/sYb4l7NuMPzaYyIQvluhkaT
         QTmNLxRMS6xoJrKVvSZD9/b107Vp1eN8VYokYx8RkFn3gfWH2IBFXBR9R6b9XrH3I2bL
         phR9aQQvNPh1V5IvAoaQ/HsuqZaKm58fcxceMmfD824oss/EiKdElhpnbd+Qm9ZQjGg2
         gN/sOQgmr/Od41jm1sU9t6g7rW6eK2hveKWuPc3C2xLz+dZOIgVPPdRlkpYI7VGpTyzI
         jyF4XoHHTWEzcaEbXHEUtDuHW2kuZB7ycPdN3gyjr6lbMrNb+eqeG4iUJeVoOootiTfx
         MF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lpt/tYvoFsB5Fj7flq1HeTsveXBzyvjJqGHDElkk4bs=;
        fh=LGwHmqLcKaBosGNQCx4YuHc0Mt2gjvfBo2QGq320RqU=;
        b=leAfZvqBpmJJu1DdVXcsucm+TdpX7ZFfbUeYXCeawiJfizD7akRyimiN4GvR4nIK8/
         45E8za8hZiq/XJdmR6FQC0ZlOv7kI3j+z8g3cWKnd6puxvdwiXc5engptRyltLvD5HXr
         /B3g20F2oSCiXIp9FZExP2T+MriCAbMR57sXzza0pTN6ihmnJU8IdPJdrdhEAXpWIBgZ
         ARKn8nzNIJGv25TCySUQVRbadn4QfkeF58Qp0u++q8Y7Ic7uIFCqjzlCAE0YZArgyxe/
         80FvNIN5CJI6auXAQjO12HzvPcBG72t+YtZsSWckgpxuXeDA2gp+vBXIS8rOsc5qDYor
         YQ6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986441; x=1789591241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lpt/tYvoFsB5Fj7flq1HeTsveXBzyvjJqGHDElkk4bs=;
        b=ixee8BJzfhWthmuXP6XBJgHGhwKiPfynbG79AsN7w2W+8FzmgXj2QTtJXS9x49E30h
         86PCJLB9FbyB+/deDMcEZCSvdIQ3Ff8a7qiVs9oMKBzlL5m5l95I68wZq618nnSPv92G
         M+N7Vt0sYF2dkr5cRz5lCs2e+S3HF+6vreiWZAup0qfGZR2jHzwXxIdy0tGwu/aHRGj8
         UZ8aNPB2aVDaUjWClnWFJUZRMLTYCm2vXdqfXya1f5k1eyHl1latiwBaHebtfAt+G/UP
         7XazW/1GFe5rEbnSKIXdE36dDP0LSQORuXva1FAMOnQDHgH+KBHTqHf/8W9zW9mEMtsq
         UQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986441; x=1789591241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpt/tYvoFsB5Fj7flq1HeTsveXBzyvjJqGHDElkk4bs=;
        b=OQaNSIx36J3g+ptkz4ZTwXaTsv50lAm/BLjmoIlZRpjtXbaDsKDfxOKDyh13l1Fbvc
         MCtcMFhH+kZ4SYwHwy0qjnR2SUkb0s8nVIMSXa7Ca5udhpePyHiU/rHpfXcnmIHc1xCq
         TojO1qTUaVbCW40xTQe0RNju0YtYIffLNU7B9f+6Phf0XOhAkHdYS2XogNgDKxlZUOWd
         Ef+Dy892fpR8Qi+qvHOZGyLHNaSwcS2x2mYWP4sCqV/oilB8vi4CH9QL3t9d1IE6Wrya
         BfNC0rJ0vQSFAXyJUIeTrWebZOyuh5iDfgM7V+X8iE1ftiLRPJ6krnSefGDuXmQCa0tN
         DrRg==
X-Forwarded-Encrypted: i=1; AKwUvBxdgZR3MeH5VSh0M7e4vid2o/Px06tJKtMSl1/IM4pJBnd50oGL/Kf3wkx0Jc454vsDx5pVvuGrYa9P7Tc=@vger.kernel.org
X-Gm-Message-State: AFuF++kI3/+fAzn2ircEDZua07cEu9EGqj9QYd/V0dZIVBBVTzuDcOnj
	r9b/ka5e1f5B/9mrfO+w0c99VRwlvU6mumqcUdKZnd/0xbcXxWcvCeITtm+o3TDUNBQEYv+75EV
	17MoePi5IRF1ajAPYK5lF7UYMsmwosFI=
X-Gm-Gg: AYBFou2qQetqxtWSA50pkPcvEHxATeeM94a9hsiYckTFbjdjlw3gvsfWMJFDIoTpfpE
	capVFYOxnt6dUrxuMvrXxXvNj1TDcEhUIOToht8at9/ZNFhzMxpTmwzi1RsxwN9/l/tLNihki8r
	xrAyaA+uu1BAAaakfo4XBxfn076SVghN4ZaakvbVULUekViBIYTPyUogJbve8AO+YTmP1QYLHwQ
	ZNAUWsS+Vw9WlHoZlg/wNwr5VXlzVWwd8PispB5yLFUZyaGI4AsGIE958x1dW7/UQmPeb9wthu1
	VoU+kY5KSXqHqexJomM37woF5p7nERO5whSVuqCo0IUos8pOQLUO9+j3jenkwvclW/MQtCxCqEb
	S14EzFdBPSeZaAzp5EII+/lhI7oC+m9OG/5LkJszTcKub
X-Received: by 2002:ac2:5684:0:b0:5b6:1a7d:1137 with SMTP id
 2adb3069b0e04-5b61a7d1680mr5534962e87.62.1788986440525; Wed, 09 Sep 2026
 13:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-4-zhaonanzhe@xiaomi.com> <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
In-Reply-To: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 13:40:26 -0700
X-Gm-Features: AcwNN1VnSINKzxR6l1JwUZg1R9xZBcXQrW93vEdLMCgWaJbB02W2MI9AI5nJYZc
Message-ID: <CACOAw_x_v+roRVKdny2XP36h_zhs9Y=XEnPeZgM1URDfMMp7ZA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered
 writes on large folios
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 2:00=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> On 8/26/26 16:26, Nanzhe Zhao wrote:
> > To avoid the complexity of unlocking a large folio in write_begin,
> > preallocate partial blocks for inodes that can use large folios.
> > During write_begin, read only the partial head and tail 4K subpages
> > that need read-before-write, and skip read I/O for the full middle
> > subpages covered by the write.
> >
> > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > ---
> >  fs/f2fs/data.c | 289 +++++++++++++++++++++++++++++++++++++++++++++++--
> >  fs/f2fs/f2fs.h |   1 +
> >  fs/f2fs/file.c |  17 ++-
> >  3 files changed, 293 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 8649d443ca74..7ce96ae02cfc 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1249,6 +1249,40 @@ static void f2fs_submit_page_read(struct inode *=
inode, struct fsverity_info *vi,
> >       f2fs_submit_read_bio(sbi, bio, DATA);
> >  }
> >
> > +/*
> > + * Synchronously read a single 4K subpage by reusing f2fs_submit_page_=
read()
> > + * so that iostat, trace, blk-crypto and post-read handling are all pr=
eserved.
> > + * The caller must have already allocated ffs for the folio.
> > + */
> > +static int f2fs_submit_page_read_sync(struct inode *inode, struct foli=
o *folio,
> > +                                   pgoff_t index, block_t blkaddr)
> > +{
> > +     struct f2fs_folio_state *ffs =3D folio->private;
> > +     unsigned long flags;
> > +
> > +     /* Add bias so end_io does not call folio_end_read(). */
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     ffs->read_pages_pending++;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +
> > +     f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
> > +                           REQ_OP_READ, false);
> > +
> > +     /* Wait for pending drops back to bias which indicates all bio ha=
ve completed. */
> > +     while (READ_ONCE(ffs->read_pages_pending) !=3D 1)
> > +             f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
>
> Suspect there will be potential performance issue, as timeout interval is
> large.
>
> > +
> > +     /* Remove the bias. */
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     ffs->read_pages_pending--;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
>
> Looks hacky.
>
> If large folio has 4 sub pages, first 3 pages are uptodate.
> Then we use f2fs_submit_page_read_sync() to read last page,
> in f2fs_finish_read_bio(), we update state bitmap of last page to 1,
> but as read_pages_pending is 1, so folio won't be set as uptodate.
>
> Oh, in f2fs_write_end(), we have another change to set folio uptodate
> though, so the flow is a little bit different here.

Yes, the implementation here looks hacky.

I think it should be like this. Any thoughts on this?

static int f2fs_submit_page_read_sync(struct inode *inode,
                                     struct folio *folio,
                                     pgoff_t index, block_t blkaddr)
{
        struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
        size_t off =3D f2fs_folio_byte_offset(sbi, folio, index);
        struct block_device *bdev;
        sector_t sector;
        struct bio *bio;
        int ret;

        f2fs_wait_on_block_writeback(inode, blkaddr);

        bdev =3D f2fs_target_device(sbi, blkaddr, &sector);
        bio =3D bio_alloc_bioset(bdev, 1, REQ_OP_READ | REQ_SYNC,
                               GFP_NOIO, &f2fs_bioset);
        bio->bi_iter.bi_sector =3D sector;
        f2fs_set_bio_crypt_ctx(bio, inode, index, NULL, GFP_NOFS);

        if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(sbi), off)) {
                bio_put(bio);
                return -EIO;
        }

        inc_page_count(sbi, F2FS_RD_DATA);
        ret =3D submit_bio_wait(bio);
        bio_put(bio);
        dec_page_count(sbi, F2FS_RD_DATA);
        if (ret)
                return ret;

        if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
                ret =3D fscrypt_decrypt_pagecache_blocks(folio,
                                                       F2FS_BLKSIZE(sbi), o=
ff);
                if (ret)
                        return ret;
        }

        f2fs_ffs_mark_subrange_uptodate(folio, off, F2FS_BLKSIZE(sbi));
        return 0;
}

>
> > +
> > +     if (!f2fs_ffs_test_blk_uptodate(folio, index))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> >  static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkad=
dr)
> >  {
> >       __le32 *addr =3D get_dnode_addr(dn->inode, dn->node_folio);
> > @@ -2582,6 +2616,112 @@ static void ffs_detach_free(struct folio *folio=
)
> >       kfree(ffs);
> >  }
> >
> > +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t ind=
ex)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned int idx;
> > +
> > +     if (!f2fs_folio_has_ffs(folio))
> > +             return folio_test_uptodate(folio);
> > +
> > +     if (!folio_contains(folio, index))
> > +             return false;
>
> Can we check this out of f2fs_ffs_test_blk_uptodate()? and add a sanity
> check here:
>
> f2fs_bug_on(sbi, !folio_contains(folio, index));
>
> > +
> > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     idx =3D index - folio->index;
> > +     return test_bit(idx, ffs->state);
> > +}
> > +
> > +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> > +             struct f2fs_folio_state *ffs, size_t offset, size_t len)
> > +{
> > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > +     unsigned int start, end;
> > +
> > +     start =3D offset >> PAGE_SHIFT;
> > +     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > +     end =3D min(end, nr_subpages);
> > +
> > +     bitmap_set(ffs->state, start, end - start);
> > +     return bitmap_full(ffs->state, nr_subpages);
> > +}
> > +
> > +static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_=
t offset,
> > +                                    size_t len)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned long flags;
> > +     bool mark_uptodate =3D false;
> > +
> > +     f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> > +
> > +     if (!f2fs_folio_has_ffs(folio)) {
> > +             folio_mark_uptodate(folio);
> > +             return;
> > +     }
> > +
> > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     mark_uptodate =3D __ffs_mark_subrange_uptodate(folio, ffs, offset=
, len) &&
> > +                     !ffs->read_pages_pending;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +     if (mark_uptodate)
> > +             folio_mark_uptodate(folio);
> > +}
> > +
> > +static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> > +                                 size_t offset, size_t len)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned int nr_subpages, start, end;
> > +     unsigned long flags;
> > +
> > +     f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> > +
> > +     if (!f2fs_folio_has_ffs(folio))
> > +             return;
> > +
> > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     nr_subpages =3D folio_nr_pages(folio);
> > +     start =3D offset >> PAGE_SHIFT;
> > +     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > +     end =3D min(end, nr_subpages);
> > +
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     bitmap_set(ffs->state, nr_subpages + start, end - start);
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +}
> > +
> > +static bool find_next_valid_block(const struct folio *folio,
> > +                               size_t orig_off, size_t *need_off,
> > +                               size_t len)
> > +{
> > +     size_t start =3D orig_off;
> > +     size_t end =3D start + len;
> > +     size_t head, tail;
> > +     pgoff_t index;
> > +
> > +     if (start & (PAGE_SIZE - 1)) {
> > +             head =3D round_down(start, PAGE_SIZE);
> > +             index =3D folio->index + (head >> PAGE_SHIFT);
> > +             if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> > +                     *need_off =3D head;
> > +                     return true;
> > +             }
> > +     }
> > +
> > +     if (end & (PAGE_SIZE - 1)) {
> > +             tail =3D round_down(end - 1, PAGE_SIZE);
> > +             index =3D folio->index + (tail >> PAGE_SHIFT);
> > +             if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> > +                     *need_off =3D tail;
> > +                     return true;
> > +             }
> > +     }
> > +
> > +     return false;
> > +}
> > +
> >  static int f2fs_read_data_large_folio(struct inode *inode,
> >               struct fsverity_info *vi,
> >               struct readahead_control *rac, struct folio *folio)
> > @@ -3975,6 +4115,102 @@ static int prepare_atomic_write_begin(struct f2=
fs_sb_info *sbi,
> >       return 0;
> >  }
> >
> > +static int prepare_large_folio_write_begin(struct inode *inode,
> > +                                       struct folio *folio, loff_t pos=
,
> > +                                       unsigned int len)
> > +{
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > +     struct f2fs_folio_state *ffs;
> > +     size_t ori_off =3D offset_in_folio(folio, pos);
> > +     size_t need_off =3D ori_off;
> > +     int err =3D 0;
> > +
> > +     len =3D min_t(unsigned int, len, folio_size(folio) - ori_off);
> > +
> > +     /*
> > +      * When folio minimum order is non-zero, the fsverity
> > +      * page_cache_write() path enters f2fs_write_begin() via
> > +      * aops->write_begin without going through f2fs_write_iter(),
> > +      * so preallocation from f2fs_write_iter() is skipped.  In that
> > +      * case, if FI_PREALLOCATED_ALL is not set, we must preallocate
> > +      * the write blocks here.
> > +      */
> > +     if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL)) {
> > +             struct f2fs_map_blocks map =3D {};
> > +
> > +             map.m_lblk =3D F2FS_BYTES_TO_BLK(pos);
> > +             map.m_len =3D F2FS_BLK_ALIGN(pos + len) - map.m_lblk;
> > +
> > +             if (!IS_DEVICE_ALIASING(inode))
> > +                     map.m_may_create =3D true;
> > +             map.m_seg_type =3D NO_CHECK_TYPE;
> > +
> > +             err =3D f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_A=
IO);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     /*
> > +      * Skip read and ffs allocation if the folio is already fully
> > +      * uptodate or the write covers the entire folio.
> > +      */
> > +     if (folio_test_uptodate(folio) || len =3D=3D folio_size(folio))
> > +             return 0;
>
> Do we need to adopt fsverity like we did in f2fs_write_begin()?
>
>         if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >=3D i_size_read(inod=
e) &&
>             !f2fs_verity_in_progress(inode)) {
>                 folio_zero_segment(folio, len, folio_size(folio));
>                 return 0;
>         }
>
> > +
> > +     ffs =3D f2fs_ffs_find_or_alloc(folio);
>
> f2fs_ffs_find_or_alloc() will never fail.
>
> > +     if (!ffs)
> > +             return -ENOMEM;
> > +
> > +     /* Inline data must have been converted before reaching here. */
> > +     f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> > +
> > +     while (find_next_valid_block(folio, ori_off,
> > +                                  &need_off, len)) {
> > +             struct dnode_of_data dn;
> > +             pgoff_t index =3D folio->index + (need_off >> PAGE_SHIFT)=
;
> > +             block_t blkaddr;
> > +             bool get_dn =3D false;
> > +
> > +             if (!f2fs_lookup_read_extent_cache_block(inode, index,
> > +                                                     &blkaddr)) {
> > +                     if (IS_DEVICE_ALIASING(inode))
> > +                             return -ENODATA;
> > +
> > +                     set_new_dnode(&dn, inode, NULL, NULL, 0);
> > +                     err =3D f2fs_get_dnode_of_data(&dn, index, LOOKUP=
_NODE);
> > +                     if (err)
> > +                             return err;
> > +                     get_dn =3D true;
> > +                     blkaddr =3D dn.data_blkaddr;
> > +
> > +                     if (blkaddr =3D=3D NEW_ADDR) {
> > +                             size_t off =3D offset_in_folio(folio,
> > +                                                          index << PAG=
E_SHIFT);
> > +
> > +                             folio_zero_segment(folio, off, off + PAGE=
_SIZE);
> > +                             f2fs_ffs_mark_subrange_uptodate(folio, of=
f,
> > +                                                            PAGE_SIZE)=
;
> > +                             goto out;
> > +                     }
> > +
> > +                     if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> > +                                               DATA_GENERIC_ENHANCE_RE=
AD)) {
> > +                             err =3D -EFSCORRUPTED;
> > +                             goto out;
> > +                     }
> > +             }
> > +
> > +             err =3D f2fs_submit_page_read_sync(inode, folio, index, b=
lkaddr);
> > +out:
> > +             if (get_dn)
> > +                     f2fs_put_dnode(&dn);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int f2fs_write_begin(const struct kiocb *iocb,
> >                           struct address_space *mapping,
> >                           loff_t pos, unsigned len, struct folio **foli=
op,
> > @@ -3986,6 +4222,7 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >       pgoff_t index =3D pos >> PAGE_SHIFT;
> >       bool need_balance =3D false;
> >       block_t blkaddr =3D NULL_ADDR;
> > +     fgf_t fgp =3D FGP_LOCK | FGP_WRITE | FGP_CREAT;
> >       int err =3D 0;
> >
> >       trace_f2fs_write_begin(inode, pos, len);
> > @@ -4033,9 +4270,9 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >        * Do not use FGP_STABLE to avoid deadlock.
> >        * Will wait that below with our IO control.
> >        */
> > -     folio =3D f2fs_filemap_get_folio(mapping, index,
> > -                             FGP_LOCK | FGP_WRITE | FGP_CREAT,
> > -                             mapping_gfp_mask(mapping));
> > +     fgp |=3D fgf_set_order(len);
> > +     folio =3D __filemap_get_folio(mapping, index, fgp,
> > +                                 mapping_gfp_mask(mapping));
>
> It detaches from fault injection, why we need to change to use
> __filemap_get_folio()?
>
> >       if (IS_ERR(folio)) {
> >               err =3D PTR_ERR(folio);
> >               goto fail;
> > @@ -4048,7 +4285,7 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >       if (f2fs_is_atomic_file(inode))
> >               err =3D prepare_atomic_write_begin(sbi, folio, pos, len,
> >                                       &blkaddr, &need_balance);
> > -     else
> > +     else if (!folio_test_large(folio))
> >               err =3D prepare_write_begin(sbi, folio, pos, len,
> >                                       &blkaddr, &need_balance);
> >       if (err)
> > @@ -4069,6 +4306,14 @@ static int f2fs_write_begin(const struct kiocb *=
iocb,
> >
> >       f2fs_folio_wait_writeback(folio, DATA, false, true);
> >
> > +     if (folio_test_large(folio)) {
> > +             err =3D prepare_large_folio_write_begin(inode,
> > +                                     folio, pos, len);
> > +             if (!err)
> > +                     return 0;
> > +             goto put_folio;
> > +     }
> > +
> >       if (len =3D=3D folio_size(folio) || folio_test_uptodate(folio))
> >               return 0;
> >
> > @@ -4129,15 +4374,20 @@ static int f2fs_write_end(const struct kiocb *i=
ocb,
> >       trace_f2fs_write_end(inode, pos, len, copied);
> >
> >       /*
> > -      * This should be come from len =3D=3D PAGE_SIZE, and we expect c=
opied
> > -      * should be PAGE_SIZE. Otherwise, we treat it with zero copied a=
nd
> > -      * let generic_perform_write() try to copy data again through cop=
ied=3D0.
> > +      * If a short copy happens on a folio that isn't uptodate, we tre=
at
> > +      * it with zero copied and let generic_perform_write() try to cop=
y
> > +      * data again through copied=3D0.
> >        */
> >       if (!folio_test_uptodate(folio)) {
> > -             if (unlikely(copied !=3D len))
> > +             if (unlikely(copied !=3D len)) {
> >                       copied =3D 0;
> > -             else
> > +             } else if (folio_test_large(folio)) {
> > +                     f2fs_ffs_mark_subrange_uptodate(folio,
> > +                                     offset_in_folio(folio, pos), len)=
;
> > +             } else {
> > +                     /* This should be come from len =3D=3D PAGE_SIZE =
*/
> >                       folio_mark_uptodate(folio);
> > +             }
> >       }
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> > @@ -4156,6 +4406,9 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >       if (!copied)
> >               goto unlock_out;
> >
> > +     if (folio_test_large(folio))
> > +             f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio=
, pos),
> > +                                                                copied=
);
> >       folio_mark_dirty(folio);
> >
> >       if (f2fs_is_atomic_file(inode))
> > @@ -4218,8 +4471,22 @@ static bool f2fs_dirty_data_folio(struct address=
_space *mapping,
> >
> >       trace_f2fs_set_page_dirty(folio, DATA);
> >
> > -     if (!folio_test_uptodate(folio))
> > -             folio_mark_uptodate(folio);
> > +     if (!folio_test_uptodate(folio)) {
> > +             bool uptodate =3D true;
> > +
> > +             if (f2fs_folio_has_ffs(folio)) {
> > +                     struct f2fs_folio_state *ffs =3D
> > +                             (struct f2fs_folio_state *)folio->private=
;
> > +                     unsigned long flags;
> > +
> > +                     spin_lock_irqsave(&ffs->state_lock, flags);
> > +                     uptodate =3D bitmap_full(ffs->state, folio_nr_pag=
es(folio)) &&
> > +                                !ffs->read_pages_pending;
> > +                     spin_unlock_irqrestore(&ffs->state_lock, flags);
>
> f2fs_ffs_mark_subrange_uptodate(folio, 0, folio_size(folio)); ?
>
> > +             }
> > +             if (uptodate)
> > +                     folio_mark_uptodate(folio);
> > +     }
> >       BUG_ON(folio_test_swapcache(folio));
> >
> >       if (filemap_dirty_folio(mapping, folio)) {
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 31ddd321daf6..ae6031693700 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4342,6 +4342,7 @@ int f2fs_write_single_data_page(struct folio *fol=
io, int *submitted,
> >                               struct writeback_control *wbc,
> >                               enum iostat_type io_type,
> >                               int compr_blocks, bool allow_balance);
> > +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t ind=
ex);
> >  void f2fs_write_failed(struct inode *inode, loff_t to);
> >  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t =
length);
> >  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index d440231b8cb9..e40285d4f9c2 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -5405,9 +5405,20 @@ static int f2fs_preallocate_blocks(struct kiocb =
*iocb, struct iov_iter *iter,
> >                       return ret;
> >       }
> >
> > -     /* Do not preallocate blocks that will be written partially in 4K=
B. */
> > -     map.m_lblk =3D F2FS_BLK_ALIGN(pos);
> > -     map.m_len =3D F2FS_BYTES_TO_BLK(pos + count);
> > +     if (mapping_large_folio_support(inode->i_mapping)) {
> > +             /*
> > +              * Preallocate all blocks touched by a large-folio buffer=
ed write so
> > +              * the regular write_begin path does not need to unlock t=
he folio for
> > +              * f2fs_balance_fs().  Rechecking large-folio state after=
 unlock is
> > +              * unreliable since partial truncation can split the foli=
o.
>
> You mean buffered io case, right? so we need to check !dio as well?
>
> Thanks,
>
> > +              */
> > +             map.m_lblk =3D F2FS_BYTES_TO_BLK(pos);
> > +             map.m_len =3D F2FS_BLK_ALIGN(pos + count);
> > +     } else {
> > +             /* Do not preallocate blocks that will be written partial=
ly in 4KB. */
> > +             map.m_lblk =3D F2FS_BLK_ALIGN(pos);
> > +             map.m_len =3D F2FS_BYTES_TO_BLK(pos + count);
> > +     }
> >       if (map.m_len > map.m_lblk)
> >               map.m_len -=3D map.m_lblk;
> >       else
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
