Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793998427;
	b=Y9nelvdCtKgQ1pJFZ7TDuYO3N58jcKZKGlRbT/UgXa368vlvZo805VA1aIHv2iRcDQJF
	 aDE8CpwCsjBl5mF/xM9Ox7Gji/ok1wkQskGrrh2FaDT9ar/1+EGtaGKp2ppbXe8DiE0a9
	 Q1Hv0NtO9k/uLe2hJ6+frVzTgqAnCiuGZ7fRKLNEExE3XDpzCA44c+Fs9c/sihObGOQwc
	 C2ZEPzbPqNz59Fz8XYHs4sFgYgV2ffRsx+R7ZQEfISx61Ot242IgsuwHRfrkBcdRLCXCK
	 UcS8z1uW+DAw/fVRcIvsxkgVRkkwMQYOmOhUUTFDPzhvCFjY52YLjtCQV7d6EJDSO3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=M3JapaK2KiHXRrfkjeiuRkdpqDOpVsFA4bF7WEH+XJ8=;
	b=SYLJmszICNjxQMihOZLR8f2YfzFXHGoDb/5TEWW4P1Kkb7EcBwb8Zd4CtPoDlQCpAFbH
	 SwPkjYRvqSe6jGZPqccTeklvaimeGBVTTurJzNlMTecqBZPn6qHEpXlj2bTe57IeKksBd
	 8l01pLEHe6VC+gCMSmOxVYsHJboWANXxF2m5XLpQv4tKTaaNtcMiFQ9QqWIJOI7DJSYb4
	 SbTTVkSqOlIVJ3XRxSJKjVrVbQMijHtgSOYd4nOG3RkJ090lK7wXFgX7ccVYWSWOq2cki
	 1b9Vd5sxVtDlQFQJY+3+6GPLxSTk+szhqukXom+4XFMQNQoiJAkiMLXusmEHa9ziq6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKwzlBp9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FED606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKwzlBp9
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a49a022221so7423611fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793998425; cv=none;
        d=google.com; s=arc-20260327;
        b=CAH++pI/x/6cYKKZHQOH7IxSCNJE2MdiIOB7Tg1dXYG4eRag9k8yIyzk0+KDRQ6yi7
         4QCWXjngTtw+xDHW2WJqF8EXaIFpxu88ZFtvGo9+9nlSLYUH+th6r64wOAFAJT09dW2b
         S2W/djqnYc7C8xPzKsV0uw4z2YZihvckg/Z8DI0kLotnytik+N7fpWXuqsen3aSTLH9c
         iCIiWbebz0UQMWNdvNnC7wseAl9uRbg/TXrulbV6+sJNkVtqrZnlzC3buh/gac9HrzXT
         5T721L+Rh8hjJbEiU4UBQ1ia9nxudNn59sUaESO6xEOlqzXDPrrsuNN1E2XPY74ZrwTT
         IU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3JapaK2KiHXRrfkjeiuRkdpqDOpVsFA4bF7WEH+XJ8=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=BxZNJVk+daeQR9GT/b1PdUewuYhiYs45G47wC5/k7OLlF/W53bD+AMZTkXFPaWugLi
         oJmg1TgmR6GNGcBGLFpQCWwnT2vGL4lME7xl69y17ijNZAuuPGVGsBNgTma1VEOR461H
         PVdi9Xg3yvDK1T7M2Szm5aVZG4s7iN34E5vaROITeRMJCRYcVzU76ZtU7C8Iku5tV0gq
         My4MZUxJLsyAC5nod4azqExPNTzJtFzAIus/b8tHQ1FX74ApOfS/jFQh0CjT3o3qtjn3
         t/0zRXaLohpHLDc8E8ECyChizymvbpPO2LyIhh27n6ho+G7EqrW98k7s9S1xoQdkogdg
         7eOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998425; x=1794603225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3JapaK2KiHXRrfkjeiuRkdpqDOpVsFA4bF7WEH+XJ8=;
        b=XKwzlBp9o40plw7jDCiZF7Db5FaOrqbbZr244D3aikYRtXVw7tXLh7Tf8rnffeaMJR
         Wj5LxWghhC7ogpdppyTkJjFNGxZWYIfFgzSzpQuof28kxSURaC4nva3I9DxpuM69AV9D
         DjouiY88RGSQ7DqMF3uwX0bpAbiA9Y7S6Caqpxar2Z202Z3YOeE9PIfJclCwXvZP6Ae7
         pFtlZsaivVLiT6xPy6NAS8v1H4oiXLyO2joF0jFPLohQky/PkfkZZBL2X2H3ILs1luqn
         SuaeHR8NkPyd4nCi0JHc/ZDDrIgaB1/gLapvIKLoTc96TWumN/jqf7nKUPSEbrQaX8Od
         YRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998425; x=1794603225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3JapaK2KiHXRrfkjeiuRkdpqDOpVsFA4bF7WEH+XJ8=;
        b=UGrutO2TxdTR7s70E7KkYq5yDLLdppxLYihoZFeWCNIYghbyTOQ3CZNj9icWZwGpfu
         4TbZYxRcPmGTt/fXs89JK4xh25Crj7kR3WrZ28LquEx1ftGqm1nruspJeDt3rxtHUh36
         v0CmpkfNS9E4WXBsiiD1YcadLe5EXnzNLih3UEtrNesuNNMgSIAoQWjtv/BscdbDib5D
         kDUtgDS3AUbtk3VbozG5Hv4KP5FKxayj1woud7DaShtoB4SuXE6Qr2iaHNHBaGGK1t8W
         BB3pUgra7IqtzADghe6rmXlMTprZvEkrUcYT13ifDBiTa5pNL6iTKkXKKk+ZD8ZS2xKM
         NWLA==
X-Gm-Message-State: APuU4Z+OVs5cW1ezs6QNlvdIj0/d1zeY8F551hqA7j3Upz4VjTBNFFm2
	h5LhlpQiOISG2eYcDRiWddtQMazf8e5lDwiJ1Y/cWpLHxAG/HChJoQPNfT1eOctO9wBqr2AacqV
	QX6T1c44JW561oykcGUsCZwJ+Uqtr2Xs=
X-Gm-Gg: AYBFou1mD0jvN18hbktAleWHq43orncmmQlPriJze6I9AIaj6tQ3fRnXpjiSnx+L3dJ
	j5lD3MfcVVLwX4F0wZI7mz/UT3YNoiGDICAjLghw/rtydoxPLdaTwFCf2i2wzbDS3SaoMcbCvp3
	Z55bQ4vFfGIAtunb9/QWFV/LrCYwg/6p4y7q9WntR5z1aCfMsViuPfQTmyAs4DkZ7e3CPSifyxt
	Of706w+Pv2zMa6wSDOOLbpNWZvAYJdZ/BCNhhKyHx0WYZFB0wMUxODgPfT48CzhDjSyU/irwjBH
	WRZ9Hlbt/5DscsEco8Iy/URMY93MRaKNd3YpQ28gwmz0nSIazhgmCXnDx2qNJOZ3vZ08H0PxIKX
	B+Iy6sBtmmMlYcuuF0GahGuB1EzbkZnAxxfNPSjqDNEuHAEXWEQSuw1eH3YRKt+IzQzV+mUM0wb
	zVahb02DV8Bi0ExsYhVywe+LiF8KFbXZlOuA5vdCiGxpKGirk=
X-Received: by 2002:a2e:a80b:0:b0:3ab:119a:81c7 with SMTP id
 38308e7fff4ca-3acf3b2b3admr8150301fa.9.1793998424291; Fri, 06 Nov 2026
 12:53:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-4-daeho43@gmail.com>
 <b3c98bba-69c8-4350-a9eb-0942be336f93@kernel.org>
In-Reply-To: <b3c98bba-69c8-4350-a9eb-0942be336f93@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 6 Nov 2026 12:53:32 -0800
X-Gm-Features: AclHuK_ETy-s36dT-mER4NgYqjDUKw-Gv-OOea-_mM_LMdWcDxa2GhlWuNuugv8
Message-ID: <CACOAw_ypOkWNWW8=8fn8gmnWnwrFDENYCHT-mXKjSEOL-UCYZg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 03/20] f2fs: extend f2fs_folio_state for
 subpage blocks
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:19=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 11/3/26 03:39, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > With subpage blocks, even an order-0 folio holds several blocks, so
> > track uptodate and dirty state per block for any folio that holds more
> > than one block, not only for large folios.
> >
> > - Identify the folio state by a magic number, since folio->private can
> >   also hold page private flags, and carry those flags over when the
> >   state is attached.
> > - Make the uptodate and dirty helpers take block indices. Allocate the
> >   state on demand with __GFP_NOFAIL, so callers no longer handle an
> >   allocation failure.
> > - Handle per-block state in invalidation, dirtying and writeback.
> > - Clear PAGECACHE_TAG_TOWRITE as well as PAGECACHE_TAG_DIRTY in
> >   f2fs_clear_page_cache_dirty_tag().
> >
> > Some of these changes also apply to large folios when the block size
> > equals PAGE_SIZE.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/data.c    | 430 ++++++++++++++++++++++++++--------------------
> >  fs/f2fs/f2fs.h    |  35 ++--
> >  fs/f2fs/file.c    |  18 +-
> >  fs/f2fs/segment.c |   2 +-
> >  4 files changed, 264 insertions(+), 221 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index aacc92839f61..e983b59e4a65 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -96,15 +96,14 @@ struct bio_post_read_ctx {
> >  static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> >               struct f2fs_folio_state *ffs, size_t offset, size_t len)
> >  {
> > -     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > -     unsigned int start, end;
> > -
> > -     start =3D offset >> PAGE_SHIFT;
> > -     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > -     end =3D min(end, nr_subpages);
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +     unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > +     unsigned int start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     unsigned int end =3D min_t(unsigned int,
> > +                             F2FS_BLK_ALIGN(sbi, offset + len), nr_blo=
cks);
> >
> >       bitmap_set(ffs->state, start, end - start);
> > -     return bitmap_full(ffs->state, nr_subpages);
> > +     return bitmap_full(ffs->state, nr_blocks);
> >  }
> >
> >  /*
> > @@ -122,7 +121,7 @@ static bool __ffs_mark_subrange_uptodate(struct fol=
io *folio,
> >   * release the bio's reference to the decompress_io_ctx of the page's =
cluster.
> >   */
> >  /*
> > - * Update read_pages_pending.
> > + * Update read_blocks_pending.
> >   */
> >  static inline void f2fs_update_read_folio_pending(struct folio *folio,=
 int nr)
> >  {
> > @@ -134,7 +133,7 @@ static inline void f2fs_update_read_folio_pending(s=
truct folio *folio, int nr)
> >
> >       ffs =3D (struct f2fs_folio_state *)folio->private;
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> > -     ffs->read_pages_pending +=3D nr;
> > +     ffs->read_blocks_pending +=3D nr;
> >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> >  }
> >
> > @@ -173,8 +172,8 @@ static void f2fs_finish_read_bio(struct bio *bio, b=
ool in_task)
> >                       if (uptodate)
> >                               uptodate =3D __ffs_mark_subrange_uptodate=
(folio, ffs,
> >                                               fi.offset, fi.length);
> > -                     ffs->read_pages_pending -=3D nr_pages;
> > -                     finished =3D !ffs->read_pages_pending;
> > +                     ffs->read_blocks_pending -=3D nr_pages;
>
> Looks weird here, but logically it's fine due to pagesize =3D=3D blocksiz=
e now.

Hi Chao,

Right. It is converted to nr_blocks (fi.length >> sbi->log_blocksize)
in "f2fs: support subpage blocks in data read path and GC", where the
block size can differ from PAGE_SIZE.

Other comments here will be applied.

Thanks,

>
> > +                     finished =3D !ffs->read_blocks_pending;
> >                       spin_unlock_irqrestore(&ffs->state_lock, flags);
> >               }
> >
> > @@ -372,18 +371,18 @@ bool f2fs_ffs_has_dirty_subpage(struct folio *fol=
io)
> >  {
> >       struct f2fs_folio_state *ffs;
> >       unsigned long flags;
> > -     unsigned int nr_subpages;
> > +     unsigned int nr_blocks;
> >       bool dirty;
> >
> >       if (!f2fs_folio_has_ffs(folio))
> >               return false;
> >
> >       ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     nr_subpages =3D folio_nr_pages(folio);
> > +     nr_blocks =3D f2fs_blocks_per_folio(F2FS_F_SB(folio), folio);
> >
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> > -     dirty =3D find_next_bit(ffs->state, 2 * nr_subpages,
> > -                             nr_subpages) < 2 * nr_subpages;
> > +     dirty =3D find_next_bit(ffs->state, 2 * nr_blocks,
> > +                             nr_blocks) < 2 * nr_blocks;
> >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> >
> >       return dirty;
> > @@ -402,7 +401,7 @@ static void f2fs_ffs_put_write_pending(struct folio=
 *folio, unsigned int nr)
> >               goto release;
> >
> >       ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     if (!atomic_sub_and_test(nr, &ffs->write_pages_pending))
> > +     if (!atomic_sub_and_test(nr, &ffs->write_blocks_pending))
> >               return;
> >  release:
> >       if (!f2fs_ffs_has_dirty_subpage(folio))
> > @@ -1572,7 +1571,7 @@ static int f2fs_submit_page_read_sync(struct inod=
e *inode, struct folio *folio,
> >                             REQ_OP_READ, true);
> >
> >       /* Wait until all bios have completed (pending drops back to our =
bias). */
> > -     while (READ_ONCE(ffs->read_pages_pending) !=3D 1)
> > +     while (READ_ONCE(ffs->read_blocks_pending) !=3D 1)
> >               f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> >
> >       /* Remove the bias. */
> > @@ -1693,12 +1692,8 @@ struct folio *f2fs_get_read_data_folio(struct in=
ode *inode, pgoff_t index,
> >       if (IS_ERR(folio))
> >               return folio;
> >
> > -     if (folio_test_large(folio)) {
> > -             if (!f2fs_ffs_find_or_alloc(folio)) {
> > -                     err =3D -ENOMEM;
> > -                     goto put_err;
> > -             }
> > -     }
> > +     if (folio_test_large(folio))
> > +             f2fs_ffs_find_or_alloc(folio);
> >
> >       if (f2fs_lookup_read_extent_cache_block(inode, index,
> >                                               &dn.data_blkaddr)) {
> > @@ -1821,12 +1816,8 @@ struct folio *f2fs_get_lock_data_folio(struct in=
ode *inode, pgoff_t index,
> >        * for a fully uptodate folio; a partially uptodate one cannot be
> >        * rebuilt and will fail the subpage check below.
> >        */
> > -     if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio)) {
> > -             if (!f2fs_ffs_find_or_alloc(folio)) {
> > -                     f2fs_folio_put(folio, true);
> > -                     return ERR_PTR(-ENOMEM);
> > -             }
> > -     }
> > +     if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio))
> > +             f2fs_ffs_find_or_alloc(folio);
> >
> >       if (unlikely(!f2fs_ffs_test_blk_uptodate(folio, index))) {
> >               f2fs_folio_put(folio, true);
> > @@ -1862,11 +1853,8 @@ struct folio *f2fs_get_new_data_folio(struct ino=
de *inode,
> >               return ERR_PTR(-ENOMEM);
> >       }
> >
> > -     if (folio_test_large(folio) && !f2fs_ffs_find_or_alloc(folio)) {
> > -             f2fs_folio_put(folio, true);
> > -             f2fs_put_cache(ientry, true);
> > -             return ERR_PTR(-ENOMEM);
> > -     }
> > +     if (folio_test_large(folio))
> > +             f2fs_ffs_find_or_alloc(folio);
> >
> >       set_new_dnode(&dn, inode, ientry, NULL, 0);
> >       err =3D f2fs_reserve_block(&dn, index);
> > @@ -2900,29 +2888,43 @@ int f2fs_read_multi_pages(struct compress_ctx *=
cc, struct bio **bio_ret,
> >
> >  struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
> >  {
> > -     struct f2fs_folio_state *ffs;
> > -     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > -     unsigned long private =3D (unsigned long)folio->private;
> > -
> > -     f2fs_bug_on(F2FS_F_SB(folio), !folio_test_large(folio));
> > -     f2fs_bug_on(F2FS_F_SB(folio),
> > -                 test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &private));
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +     struct f2fs_folio_state *ffs =3D folio->private;
> > +     unsigned int nr_blocks;
> > +     unsigned long private_flags;
> >
> >       if (f2fs_folio_has_ffs(folio))
> > -             return (struct f2fs_folio_state *)folio->private;
> > +             return ffs;
> >
> > -     ffs =3D f2fs_kmalloc(F2FS_F_SB(folio),
> > -                     struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subp=
ages)),
> > -                     GFP_NOFS | __GFP_ZERO);
> > -     if (!ffs)
> > -             return NULL;
> > +     /* Carry over the page private flags kept in folio->private. */
> > +     private_flags =3D f2fs_folio_get_private_flags(folio);
> >
> > +     nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > +     ffs =3D kzalloc(struct_size(ffs, state, BITS_TO_LONGS(2 * nr_bloc=
ks)),
> > +                     GFP_NOIO | __GFP_NOFAIL);
> > +
> > +     ffs->magic =3D F2FS_FOLIO_STATE_MAGIC;
> >       spin_lock_init(&ffs->state_lock);
> > +     ffs->private_flags =3D private_flags;
> >       if (folio_test_uptodate(folio))
> > -             bitmap_set(ffs->state, 0, nr_subpages);
> > -     if (folio_test_dirty(folio))
> > -             bitmap_set(ffs->state, nr_subpages, nr_subpages);
> > +             bitmap_set(ffs->state, 0, nr_blocks);
> > +     if (folio_test_dirty(folio)) {
> > +             struct inode *inode =3D folio->mapping->host;
> > +             pgoff_t last_lblk =3D F2FS_BLK_ALIGN(sbi, i_size_read(ino=
de));
> > +             pgoff_t first_lblk =3D f2fs_folio_lblk(sbi, folio);
> > +             pgoff_t valid_blocks =3D 0;
> >
> > +             if (f2fs_verity_in_progress(inode))
> > +                     valid_blocks =3D nr_blocks;
> > +             else if (first_lblk < last_lblk)
> > +                     valid_blocks =3D min_t(pgoff_t, nr_blocks,
> > +                                          last_lblk - first_lblk);
> > +
> > +             if (valid_blocks)
> > +                     bitmap_set(ffs->state, nr_blocks, valid_blocks);
> > +     }
> > +
> > +     folio_detach_private(folio);
> >       folio_attach_private(folio, ffs);
> >       return ffs;
> >  }
> > @@ -2940,17 +2942,17 @@ static void ffs_detach_free(struct folio *folio=
)
> >       if (!ffs)
> >               return;
> >
> > -     WARN_ON_ONCE(ffs->read_pages_pending !=3D 0);
> > -     WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending));
> > +     WARN_ON_ONCE(ffs->read_blocks_pending !=3D 0);
> > +     WARN_ON_ONCE(atomic_read(&ffs->write_blocks_pending));
> > +     ffs->magic =3D 0;
> >       kfree(ffs);
> >  }
> >
> >  bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t ind=
ex)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_M_SB(folio->mapping);
> >       struct f2fs_folio_state *ffs;
> > -     unsigned int idx;
> > -
> > -     f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
> > +     pgoff_t offset;
> >
> >       if (folio_test_uptodate(folio))
> >               return true;
> > @@ -2958,63 +2960,60 @@ bool f2fs_ffs_test_blk_uptodate(const struct fo=
lio *folio, pgoff_t index)
> >       if (!f2fs_folio_has_ffs(folio))
> >               return false;
> >
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     idx =3D index - folio->index;
> > -     return test_bit(idx, ffs->state);
> > +     ffs =3D folio->private;
> > +     offset =3D f2fs_folio_blk_offset(sbi, folio, index);
> > +     if (WARN_ON_ONCE(offset >=3D f2fs_blocks_per_folio(sbi, folio)))
> > +             return false;
> > +
> > +     if (test_bit(offset, ffs->state)) {
> > +             /* Order the bit test before reading the block data */
> > +             smp_rmb();
> > +             return true;
> > +     }
> > +     return false;
> >  }
> >
> >  void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offse=
t,
> >                                      size_t len)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> >       struct f2fs_folio_state *ffs;
> >       unsigned long flags;
> >       bool mark_uptodate =3D false;
> >
> >       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> >
> > -     if (!f2fs_folio_has_ffs(folio)) {
> > +     if (!f2fs_is_multiblock_folio(sbi, folio)) {
> >               folio_mark_uptodate(folio);
> >               return;
> >       }
> >
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     spin_lock_irqsave(&ffs->state_lock, flags);
> > -     mark_uptodate =3D __ffs_mark_subrange_uptodate(folio, ffs, offset=
, len) &&
> > -                     !ffs->read_pages_pending;
> > -     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > -     if (mark_uptodate)
> > +     /*
> > +      * Without f2fs_folio_state, the folio uptodate flag covers every=
 block,
> > +      * so marking the whole folio needs no allocation. This keeps bio
> > +      * completion paths such as decompression free of allocation.
> > +      */
> > +     if (!f2fs_folio_has_ffs(folio) && !offset && len >=3D folio_size(=
folio)) {
> >               folio_mark_uptodate(folio);
> > -}
> > -
> > -static void ffs_clear_subrange_uptodate(struct folio *folio,
> > -                                     size_t offset, size_t len)
> > -{
> > -     struct f2fs_folio_state *ffs;
> > -     unsigned int nr_subpages, start, end;
> > -     unsigned long flags;
> > -
> > -     f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> > -
> > -     if (!f2fs_folio_has_ffs(folio))
> >               return;
> > +     }
> >
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     nr_subpages =3D folio_nr_pages(folio);
> > -     start =3D offset >> PAGE_SHIFT;
> > -     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > -     end =3D min(end, nr_subpages);
> > -
> > +     ffs =3D f2fs_ffs_find_or_alloc(folio);
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> > -     bitmap_clear(ffs->state, start, end - start);
> > +     mark_uptodate =3D __ffs_mark_subrange_uptodate(folio, ffs, offset=
, len) &&
> > +                     !ffs->read_blocks_pending;
> >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +     if (mark_uptodate)
> > +             folio_mark_uptodate(folio);
> >  }
> >
> >  static void f2fs_clear_truncated_page_state(struct folio *folio, pgoff=
_t i)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +
> >       if (f2fs_folio_has_ffs(folio)) {
> > -             ffs_clear_subrange_uptodate(folio,
> > -                             (loff_t)i << PAGE_SHIFT, PAGE_SIZE);
> > -             folio_clear_uptodate(folio);
> > +             f2fs_ffs_clear_subrange_uptodate(folio,
> > +                             F2FS_BLK_TO_BYTES(sbi, i), F2FS_BLKSIZE(s=
bi));
> >       } else {
> >               folio_clear_uptodate(folio);
> >               folio_clear_f2fs_gcing(folio);
> > @@ -3023,33 +3022,36 @@ static void f2fs_clear_truncated_page_state(str=
uct folio *folio, pgoff_t i)
> >
> >  bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_M_SB(folio->mapping);
> >       struct f2fs_folio_state *ffs;
> > -     unsigned int idx, nr_subpages;
> > -
> > -     f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
> > +     unsigned int nr_blocks;
> > +     pgoff_t offset;
> >
> >       if (!f2fs_folio_has_ffs(folio))
> >               return folio_test_dirty(folio);
> >
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     nr_subpages =3D folio_nr_pages(folio);
> > -     idx =3D index - folio->index;
> > -     return test_bit(nr_subpages + idx, ffs->state);
> > +     ffs =3D folio->private;
> > +     nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > +     offset =3D f2fs_folio_blk_offset(sbi, folio, index);
> > +     if (WARN_ON_ONCE(offset >=3D nr_blocks))
> > +             return false;
> > +
> > +     return test_bit(nr_blocks + offset, ffs->state);
> >  }
> >
> >  static unsigned int __ffs_mark_subrange_dirty(struct folio *folio,
> >                       struct f2fs_folio_state *ffs, size_t offset, size=
_t len)
> >  {
> > -     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +     unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> >       unsigned int start, end, before;
> >
> > -     start =3D offset >> PAGE_SHIFT;
> > -     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > -     end =3D min(end, nr_subpages);
> > +     start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     end =3D min_t(unsigned int, F2FS_BLK_ALIGN(sbi, offset + len), nr=
_blocks);
> >
> > -     before =3D bitmap_weight(ffs->state, 2 * nr_subpages);
> > -     bitmap_set(ffs->state, nr_subpages + start, end - start);
> > -     return bitmap_weight(ffs->state, 2 * nr_subpages) - before;
> > +     before =3D bitmap_weight(ffs->state, 2 * nr_blocks);
> > +     bitmap_set(ffs->state, nr_blocks + start, end - start);
> > +     return bitmap_weight(ffs->state, 2 * nr_blocks) - before;
> >  }
> >
> >  /*
> > @@ -3062,16 +3064,17 @@ static unsigned int __ffs_mark_subrange_dirty(s=
truct folio *folio,
> >  void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> >                                   size_t offset, size_t len)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> >       struct f2fs_folio_state *ffs;
> >       unsigned int set;
> >       unsigned long flags;
> >
> >       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> >
> > -     if (!f2fs_folio_has_ffs(folio))
> > +     if (!f2fs_is_multiblock_folio(sbi, folio))
> >               return;
> >
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     ffs =3D f2fs_ffs_find_or_alloc(folio);
> >
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> >       set =3D __ffs_mark_subrange_dirty(folio, ffs, offset, len);
> > @@ -3081,22 +3084,54 @@ void f2fs_ffs_mark_subrange_dirty(struct folio =
*folio,
> >               f2fs_account_dirty_blocks(folio->mapping->host, set);
> >  }
> >
> > +void f2fs_ffs_clear_subrange_uptodate(struct folio *folio,
> > +                                          size_t offset, size_t len)
> > +{
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned int nr_blocks, start, end;
> > +     unsigned long flags;
> > +
> > +     f2fs_bug_on(sbi, offset + len > folio_size(folio));
> > +
> > +     if (!f2fs_folio_has_ffs(folio)) {
> > +             if (!folio_test_uptodate(folio))
> > +                     return;
> > +             /* Without ffs, clearing the whole folio needs no allocat=
ion. */
> > +             if (!offset && len >=3D folio_size(folio)) {
> > +                     folio_clear_uptodate(folio);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     ffs =3D f2fs_ffs_find_or_alloc(folio);
> > +     nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > +     start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     end =3D min_t(unsigned int, F2FS_BLK_ALIGN(sbi, offset + len), nr=
_blocks);
> > +
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     bitmap_clear(ffs->state, start, end - start);
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +     if (folio_test_uptodate(folio))
> > +             folio_clear_uptodate(folio);
> > +}
> > +
> >  static bool __ffs_clear_subrange_dirty(struct folio *folio,
> >                       struct f2fs_folio_state *ffs, size_t offset, size=
_t len,
> >                       unsigned int *cleared)
> >  {
> > -     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +     unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> >       unsigned int start, end, before;
> >
> > -     start =3D offset >> PAGE_SHIFT;
> > -     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > -     end =3D min(end, nr_subpages);
> > +     start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     end =3D min_t(unsigned int, F2FS_BLK_ALIGN(sbi, offset + len), nr=
_blocks);
> >
> > -     before =3D bitmap_weight(ffs->state, 2 * nr_subpages);
> > -     bitmap_clear(ffs->state, nr_subpages + start, end - start);
> > -     *cleared =3D before - bitmap_weight(ffs->state, 2 * nr_subpages);
> > -     return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) <
> > -                     2 * nr_subpages;
> > +     before =3D bitmap_weight(ffs->state, 2 * nr_blocks);
> > +     bitmap_clear(ffs->state, nr_blocks + start, end - start);
> > +     *cleared =3D before - bitmap_weight(ffs->state, 2 * nr_blocks);
> > +     return find_next_bit(ffs->state, 2 * nr_blocks, nr_blocks) <
> > +                     2 * nr_blocks;
> >  }
> >
> >  /**
> > @@ -3117,10 +3152,19 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(str=
uct folio *folio, size_t offset,
> >       unsigned int cleared =3D 0;
> >       bool dirty;
> >
> > -     if (!f2fs_folio_has_ffs(folio))
> > -             return false;
> > +     if (!f2fs_folio_has_ffs(folio)) {
> > +             /*
> > +              * Without ffs, the folio dirty flag covers every block. =
Callers
> > +              * that clear the flag first (writeback, GC) must have ff=
s.
> > +              */
> > +             if (!folio_test_dirty(folio))
> > +                     return false;
> > +             /* Clearing the whole folio leaves no dirty block. */
> > +             if (!offset && len >=3D folio_size(folio))
> > +                     return false;
> > +     }
> >
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     ffs =3D f2fs_ffs_find_or_alloc(folio);
> >       spin_lock_irqsave(&ffs->state_lock, flags);
> >       dirty =3D __ffs_clear_subrange_dirty(folio, ffs, offset, len, &cl=
eared);
> >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> > @@ -3131,55 +3175,37 @@ bool f2fs_ffs_clear_subrange_dirty_and_test(str=
uct folio *folio, size_t offset,
> >       return dirty;
> >  }
> >
> > -static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ff=
s,
> > -                     const struct folio *folio, unsigned int start,
> > -                     unsigned int end)
> > -{
> > -     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > -
> > -     return find_next_bit(ffs->state, nr_subpages + end + 1,
> > -                     nr_subpages + start) - nr_subpages;
> > -}
> > -
> > -static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state *ff=
s,
> > -                     const struct folio *folio, unsigned int start,
> > -                     unsigned int end)
> > -{
> > -     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > -
> > -     return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
> > -                     nr_subpages + start) - nr_subpages;
> > -}
> > -
> > -static unsigned int ffs_find_dirty_range(struct folio *folio,
> > -                                     u64 *range_start, u64 range_end)
> > +bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
> > +                           unsigned int to, unsigned int *start,
> > +                           unsigned int *count)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> >       struct f2fs_folio_state *ffs;
> > -     unsigned int start, end, nr_pages;
> > -
> > -     if (*range_start >=3D range_end)
> > -             return 0;
> > -
> > -     if (!f2fs_folio_has_ffs(folio))
> > -             return range_end - *range_start;
> > -
> > -     ffs =3D (struct f2fs_folio_state *)folio->private;
> > -     start =3D offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
> > -     end =3D DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, range_en=
d),
> > -                                     folio_size(folio)), PAGE_SIZE) - =
1;
> > +     unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, folio);
> > +     unsigned long flags;
> >
> > -     start =3D ffs_next_dirty_subpage(ffs, folio, start, end);
> > -     if (start > end)
> > -             return 0;
> > +     if (from >=3D to || to > nr_blocks)
> > +             return false;
> >
> > -     if (start =3D=3D end)
> > -             nr_pages =3D 1;
> > -     else
> > -             nr_pages =3D ffs_next_clean_subpage(ffs, folio,
> > -                                              start + 1, end) - start;
> > +     if (!f2fs_folio_has_ffs(folio)) {
> > +             if (!folio_test_dirty(folio))
> > +                     return false;
> > +             *start =3D from;
> > +             *count =3D to - from;
> > +             return true;
> > +     }
> >
> > -     *range_start =3D folio_pos(folio) + ((u64)start << PAGE_SHIFT);
> > -     return (u64)nr_pages << PAGE_SHIFT;
> > +     ffs =3D folio->private;
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     *start =3D find_next_bit(ffs->state, nr_blocks + to, nr_blocks + =
from) - nr_blocks;
> > +     if (*start >=3D to) {
> > +             spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +             return false;
> > +     }
> > +     *count =3D find_next_zero_bit(ffs->state, nr_blocks + to,
> > +                                 nr_blocks + *start) - nr_blocks - *st=
art;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +     return true;
> >  }
> >
> >  static bool find_next_valid_block(const struct folio *folio,
> > @@ -3307,13 +3333,9 @@ static int f2fs_read_data_large_folio(struct ino=
de *inode,
> >               /*
> >                * Allocate the folio state before doing anything with th=
e
> >                * folio, so that the block mapping helpers below can rel=
y on
> > -              * it, and fail early if memory is not available.
> > +              * it.
> >                */
> >               ffs =3D f2fs_ffs_find_or_alloc(folio);
> > -             if (!ffs) {
> > -                     ret =3D -ENOMEM;
> > -                     goto err_out;
> > -             }
> >       }
> >       index =3D folio->index;
> >       offset =3D 0;
> > @@ -3393,7 +3415,7 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
> >                       continue;
> >               }
> >
> > -             /* We must increment read_pages_pending before possible B=
IOs submitting
> > +             /* We must increment read_blocks_pending before possible =
BIOs submitting
> >                * to prevent from premature folio_end_read() call on fol=
io
> >                */
> >               if (folio_test_large(folio)) {
> > @@ -3847,7 +3869,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *=
fio)
> >       __folio_start_writeback(folio, folio_test_dirty(folio));
> >       if (f2fs_folio_has_ffs(folio)) {
> >               ffs =3D (struct f2fs_folio_state *)folio->private;
> > -             atomic_inc(&ffs->write_pages_pending);
> > +             atomic_inc(&ffs->write_blocks_pending);
> >               pending_added =3D true;
> >       }
> >
> > @@ -3927,7 +3949,7 @@ static int f2fs_write_folio_dirty_range(struct fo=
lio *folio, int *submitted,
> >
> >               if (f2fs_folio_has_ffs(folio)) {
> >                       ffs =3D (struct f2fs_folio_state *)folio->private=
;
> > -                     atomic_inc(&ffs->write_pages_pending);
> > +                     atomic_inc(&ffs->write_blocks_pending);
> >               }
> >
> >               set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
> > @@ -4499,7 +4521,6 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
> >       struct f2fs_lock_context lc;
> >       u64 pos =3D 0;
> >       u64 end_pos =3D 0;
> > -     u32 r_len =3D 0;
> >       int err =3D 0;
> >       int submitted =3D 0;
> >       int nwritten =3D 0;
> > @@ -4633,29 +4654,60 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >
> >               folio_start_writeback(folio);
> >
> > +             /*
> > +              * PG_dirty was already cleared by writeback_iter(), and =
a
> > +              * single-block folio has no ffs dirty bitmap, so the dir=
ty
> > +              * range cannot be derived. Write the whole folio.
> > +              */
> > +             if (!folio_test_large(folio)) {
> > +                     err =3D f2fs_write_folio_dirty_range(folio, &subm=
itted,
> > +                                     wbc, io_type, &pos, end_pos - pos=
);
> > +                     folio_submitted +=3D submitted;
> > +                     if (err)
> > +                             goto out;
> > +                     nwritten +=3D submitted;
>
> Should update nwritten before goto out in case we only submitted partial =
4k blocks
> in a 16k folio.
>
> > +                     goto written;
> > +             }
> > +
> > +             if (!f2fs_folio_has_ffs(folio)) {
> > +                     ffs =3D f2fs_ffs_find_or_alloc(folio);
> > +                     f2fs_ffs_mark_subrange_dirty(folio, 0, end_pos - =
pos);
> > +             } else {
> > +                     ffs =3D (struct f2fs_folio_state *)folio->private=
;
> > +             }
> >               /*
> >                * Large folios can be submitted as multiple bios, which =
may
> >                * complete while we are still submitting the remaining d=
irty
> > -              * ranges.  Hold a bias on write_pages_pending to prevent
> > +              * ranges.  Hold a bias on write_blocks_pending to preven=
t
> >                * folio_end_writeback() from being called early.
> >                */
> > -             if (!bias_added && f2fs_folio_has_ffs(folio)) {
> > -                     ffs =3D (struct f2fs_folio_state *)folio->private=
;
> > -                     WARN_ON_ONCE(atomic_read(&ffs->write_pages_pendin=
g) !=3D 0);
> > -                     atomic_inc(&ffs->write_pages_pending);
> > +             if (f2fs_folio_has_ffs(folio) && !bias_added) {
>
> f2fs_folio_has_ffs(folio) check is redundant here, due to we will allocat=
e ffs if there
> is no ffs.
>
> Thanks,
>
> > +                     WARN_ON_ONCE(atomic_read(&ffs->write_blocks_pendi=
ng) !=3D 0);
> > +                     atomic_inc(&ffs->write_blocks_pending);
> >                       bias_added =3D true;
> >               }
> >
> > -             while ((r_len =3D ffs_find_dirty_range(folio, &pos, end_p=
os))) {
> > +             unsigned int from =3D 0, start, count;
> > +             unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, fol=
io);
> > +             unsigned int to_blk =3D min_t(unsigned int,
> > +                             F2FS_BLK_ALIGN(sbi, end_pos - folio_pos(f=
olio)),
> > +                             nr_blocks);
> > +
> > +             while (f2fs_ffs_dirty_blk_range(folio, from, to_blk,
> > +                                             &start, &count)) {
> >                       submitted =3D 0;
> > +                     pos =3D folio_pos(folio) + F2FS_BLK_TO_BYTES(sbi,=
 start);
> >                       err =3D f2fs_write_folio_dirty_range(folio, &subm=
itted,
> > -                                     wbc, io_type, &pos, r_len);
> > +                                     wbc, io_type, &pos,
> > +                                     F2FS_BLK_TO_BYTES(sbi, count));
> >                       folio_submitted +=3D submitted;
> >                       nwritten +=3D submitted;
> >                       if (err)
> >                               goto out;
> > +                     from =3D start + count;
> >               }
> >
> > +written:
> >               /* If none of the subpages of a folio is submitted, keep =
the atomic flag */
> >               if (folio_submitted &&
> >                   f2fs_is_atomic_file(inode) &&
> > @@ -5171,8 +5223,6 @@ static int prepare_large_folio_write_begin(struct=
 inode *inode,
> >       }
> >
> >       ffs =3D f2fs_ffs_find_or_alloc(folio);
> > -     if (!ffs)
> > -             return -ENOMEM;
> >
> >       /* Skip read if the folio is already fully uptodate or the write
> >        * covers the entire folio.
> > @@ -5248,8 +5298,7 @@ static int prepare_large_folio_atomic_write_begin=
(struct inode *inode,
> >
> >       len =3D min_t(unsigned int, len, folio_size(folio) - ori_off);
> >
> > -     if (!f2fs_ffs_find_or_alloc(folio))
> > -             return -ENOMEM;
> > +     f2fs_ffs_find_or_alloc(folio);
> >
> >       /* Inline data must have been converted before reaching here. */
> >       f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> > @@ -5533,8 +5582,8 @@ void f2fs_invalidate_folio(struct folio *folio, s=
ize_t offset, size_t length)
> >
> >       if (inode->i_ino >=3D F2FS_ROOT_INO(sbi) &&
> >                               (offset || length !=3D folio_size(folio))=
) {
> > -             size_t clear_start =3D round_up(offset, PAGE_SIZE);
> > -             size_t clear_end =3D round_down(offset + length, PAGE_SIZ=
E);
> > +             size_t clear_start =3D round_up(offset, F2FS_BLKSIZE(sbi)=
);
> > +             size_t clear_end =3D round_down(offset + length, F2FS_BLK=
SIZE(sbi));
> >               size_t clear_length;
> >               bool dirty;
> >
> > @@ -5548,16 +5597,18 @@ void f2fs_invalidate_folio(struct folio *folio,=
 size_t offset, size_t length)
> >               clear_length =3D clear_end - clear_start;
> >               dirty =3D f2fs_ffs_clear_subrange_dirty_and_test(folio,
> >                                               clear_start, clear_length=
);
> > -             ffs_clear_subrange_uptodate(folio, clear_start, clear_len=
gth);
> > -             folio_clear_uptodate(folio);
> > +             f2fs_ffs_clear_subrange_uptodate(folio, clear_start,
> > +                                              clear_length);
> >
> >               /*
> >                * If the truncated subrange happens to clear the remaini=
ng
> >                * dirty bitmap of the whole folio, cancel the folio-leve=
l
> >                * dirty state.
> >                */
> > -             if (!dirty && folio_test_dirty(folio))
> > +             if (!dirty && folio_test_dirty(folio)) {
> > +                     f2fs_clear_page_cache_dirty_tag(folio);
> >                       folio_cancel_dirty(folio);
> > +             }
> >               if (!dirty && !folio_test_writeback(folio))
> >                       folio_clear_f2fs_gcing(folio);
> >               return;
> > @@ -5592,6 +5643,7 @@ static bool f2fs_dirty_data_folio(struct address_=
space *mapping,
> >               struct folio *folio)
> >  {
> >       struct inode *inode =3D mapping->host;
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >
> >       trace_f2fs_set_page_dirty(folio, DATA);
> >
> > @@ -5599,13 +5651,13 @@ static bool f2fs_dirty_data_folio(struct addres=
s_space *mapping,
> >               bool uptodate =3D true;
> >
> >               if (f2fs_folio_has_ffs(folio)) {
> > -                     struct f2fs_folio_state *ffs =3D
> > -                             (struct f2fs_folio_state *)folio->private=
;
> > +                     struct f2fs_folio_state *ffs =3D folio->private;
> > +                     unsigned int nr_blocks =3D f2fs_blocks_per_folio(=
sbi, folio);
> >                       unsigned long flags;
> >
> >                       spin_lock_irqsave(&ffs->state_lock, flags);
> > -                     uptodate =3D bitmap_full(ffs->state, folio_nr_pag=
es(folio)) &&
> > -                                !ffs->read_pages_pending;
> > +                     uptodate =3D bitmap_full(ffs->state, nr_blocks) &=
&
> > +                                !ffs->read_blocks_pending;
> >                       spin_unlock_irqrestore(&ffs->state_lock, flags);
> >               }
> >               if (uptodate)
> > @@ -5957,6 +6009,8 @@ void f2fs_clear_page_cache_dirty_tag(struct folio=
 *folio)
> >       xa_lock_irqsave(&mapping->i_pages, flags);
> >       __xa_clear_mark(&mapping->i_pages, folio->index,
> >                                               PAGECACHE_TAG_DIRTY);
> > +     __xa_clear_mark(&mapping->i_pages, folio->index,
> > +                                             PAGECACHE_TAG_TOWRITE);
> >       xa_unlock_irqrestore(&mapping->i_pages, flags);
> >  }
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 11de12a3e804..114d3d7bcd3e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1630,13 +1630,17 @@ static inline void f2fs_clear_bit(unsigned int =
nr, char *addr);
> >   * folio->private is a wrapped pointer.
> >   */
> >
> > +#define F2FS_FOLIO_STATE_MAGIC               0xF5F2FF50
> > +
> >  struct f2fs_folio_state {
> > +     u32                     magic;
> >       spinlock_t              state_lock;
> > -     unsigned int            read_pages_pending;
> > -     atomic_t                write_pages_pending;
> > +     unsigned int            read_blocks_pending;
> > +     atomic_t                write_blocks_pending;
> >       unsigned long           private_flags;
> > -     /* state[0..nr_subpages - 1] tracks uptodate subpages.
> > -      * state[nr_subpages..2 * nr_subpages - 1] tracks dirty subpages.
> > +     /*
> > +      * state[0..nr_blocks - 1] tracks uptodate blocks.
> > +      * state[nr_blocks..2 * nr_blocks - 1] tracks dirty blocks.
> >        */
> >       unsigned long           state[];
> >  };
> > @@ -2337,6 +2341,12 @@ static inline bool f2fs_has_subpage_blocks(struc=
t f2fs_sb_info *sbi)
> >       return F2FS_BLKSIZE(sbi) < PAGE_SIZE;
> >  }
> >
> > +static inline bool f2fs_is_multiblock_folio(struct f2fs_sb_info *sbi,
> > +                                         const struct folio *folio)
> > +{
> > +     return folio_size(folio) > F2FS_BLKSIZE(sbi);
> > +}
> > +
> >  static inline pgoff_t f2fs_folio_lblk(struct f2fs_sb_info *sbi,
> >                                     const struct folio *folio)
> >  {
> > @@ -2483,18 +2493,9 @@ static inline bool f2fs_folio_has_ffs(const stru=
ct folio *folio)
> >  {
> >       unsigned long private =3D (unsigned long)folio->private;
> >
> > -     if (!folio_test_large(folio) || !private)
> > +     if (!private || (private & BIT(F2FS_FOLIO_PRIVATE_NOT_POINTER)))
> >               return false;
> > -
> > -     /*
> > -      * A large folio should always carry f2fs_folio_state rather than
> > -      * non-pointer private flags at its folio->private.
> > -      */
> > -     if (unlikely(test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &private)))=
 {
> > -             f2fs_bug_on(F2FS_F_SB(folio), 1);
> > -             return false;
> > -     }
> > -     return true;
> > +     return *((u32 *)private) =3D=3D F2FS_FOLIO_STATE_MAGIC;
> >  }
> >
> >  static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned i=
nt type)
> > @@ -4529,6 +4530,10 @@ void f2fs_ffs_mark_subrange_dirty(struct folio *=
folio, size_t offset, size_t len
> >  bool f2fs_ffs_has_dirty_subpage(struct folio *folio);
> >  bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_=
t offset,
> >                                           size_t len);
> > +void f2fs_ffs_clear_subrange_uptodate(struct folio *folio, size_t offs=
et,
> > +                                   size_t len);
> > +bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
> > +                           unsigned int to, unsigned int *start, unsig=
ned int *count);
> >  void f2fs_write_failed(struct inode *inode, loff_t to);
> >  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t =
length);
> >  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 82eb62301c48..e339cfd84b27 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -238,12 +238,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_f=
ault *vmf)
> >               goto out_sem;
> >       }
> >
> > -     if (folio_test_large(folio) && !f2fs_ffs_find_or_alloc(folio)) {
> > -             folio_unlock(folio);
> > -             err =3D -ENOMEM;
> > -             goto out_sem;
> > -     }
> > -
> >       nr =3D DIV_ROUND_UP(dirty_len, PAGE_SIZE);
> >
> >       for (i =3D 0; i < nr; i++) {
> > @@ -1628,12 +1622,6 @@ static int __clone_blkaddrs(struct inode *src_in=
ode, struct inode *dst_inode,
> >                       memcpy_folio(fdst, dst_off, fsrc, src_off,
> >                                   F2FS_BLKSIZE(sbi));
> >                       if (folio_test_large(fdst)) {
> > -                             if (!f2fs_ffs_find_or_alloc(fdst)) {
> > -                                     f2fs_folio_put(fdst, true);
> > -                                     if (!same_folio)
> > -                                             f2fs_folio_put(fsrc, true=
);
> > -                                     return -ENOMEM;
> > -                             }
> >                               f2fs_ffs_mark_subrange_uptodate(fdst,
> >                                               dst_off, F2FS_BLKSIZE(sbi=
));
> >                               f2fs_ffs_mark_subrange_dirty(fdst, dst_of=
f,
> > @@ -4975,16 +4963,12 @@ static int redirty_blocks(struct inode *inode, =
pgoff_t page_idx, int len)
> >                        * bitmap as well, otherwise f2fs_write_cache_fol=
ios()
> >                        * finds no dirty range and skips the whole folio=
.
> >                        */
> > -                     if (!f2fs_ffs_find_or_alloc(folio)) {
> > -                             ret =3D -ENOMEM;
> > -                             goto next;
> > -                     }
> > +                     f2fs_ffs_find_or_alloc(folio);
> >                       f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
> >               }
> >
> >               folio_mark_dirty(folio);
> >               folio_set_f2fs_gcing(folio);
> > -next:
> >               redirty_idx =3D folio_next_index(folio);
> >               folio_unlock(folio);
> >               folio_put_refs(folio, 2);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 2b0821c2c18b..93f165151c0f 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4193,7 +4193,7 @@ static void do_write_block(struct f2fs_summary *s=
um, struct f2fs_io_info *fio)
> >                               fio->old_blkaddr, fio->new_blkaddr, err);
> >                       /*
> >                        * For a large folio, the caller rolls back
> > -                      * write_pages_pending and ends writeback when th=
e last
> > +                      * write_blocks_pending and ends writeback when t=
he last
> >                        * pending write is gone.
> >                        */
> >                       if (!f2fs_folio_has_ffs(folio))
>
