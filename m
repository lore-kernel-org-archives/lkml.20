Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794000566;
	b=gin45DU5e6rXAsZvwKAUCUtMtuPOQZoX4Qp2/ABRuJ2eFnwcyf1ASa033XxGe9haMBkp
	 LBdpGyWB0X2RO9aUtSIUzJcr6G3Moi2mZNeK2VBgfgNvm9+z1H2DWtUUwiF+vqDQBXXRW
	 0hAAHKM10rb1SpU6wPEZ/oA2gKIa0xHy4DKfwd5xkUldkBzcGzJBuEhjYghrC+h4nttH6
	 eLs9idR28leHDrzMnrqIgWPZtKEwxa8ELmzee/T49mgTuS66hvgtny7y7bL6a6wzaxrZc
	 oiDCi/h4MigCaqsPehncI6gF3XwqySfU3//ZP/W6Mwt1MaNvYI4udW8bg7Hlq66/A3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WMGZP0zlApSX3MJgqVQD5meDGB+YCvT8P8N/GArUWT8=;
	b=M0blTSGGNC7ihwE4Ion1+nCxS667S11fH4Ty5zqDlwwCE0/CJGt9prSJtaHIRgTrSJBb
	 TwxSFx3ToJvBAP4SnUH4ndSLorOzrq8Q7/2tcHeRHD79j1xrdLYy5MEhg3xEeq84idbep
	 l/OzAV2JJPJy79SzoqCzXA/sOQc5fpiBV4c9E8VAfY6cKtTQHx8Uvp7Pmk38gUKydnH3P
	 29uNOQNKdGfXVh4uUJBofgDPyskK3OrVbp3PGnWrhf+h3IyymQUQihWdmlFHrB/uobUTf
	 z9X9WFqNg7mZQ7n4Arm+wuX985reAjX76ttpxnFCHVT4A7WgaNcvT8uhu7ybqXHneBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZIxVglw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19358606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19358606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZIxVglw
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so8178821fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794000564; cv=none;
        d=google.com; s=arc-20260327;
        b=f2t7Cv5YYYOFYdEvHHKq0+Orl8juGBPSiY5pI+hiTg9M+Eydq0meEPHMXxOP7xBB1k
         zZk0NjClLxkgI4Aer8bI1GLh4SEuo3rf6ltO56GyQd5eJZ0pCvA2PJMXunsnrW2S3QXM
         oqgbcsJS+wHbQT/dSxIvhrldEk3Z82uhXy8f25FihxMG+WR2a5skh+xsXuKfb3LZ74Vs
         4UJc6FetTwnshaYSFKKf5Dm55wJ02KWBAybqpqoePS/lDiP+glBblq9lxxzfwfGGv7io
         4gyqmhmz6La6BP3Nn7m3EjPc4Wp/yuSM5tOZY2XqQpd3iFlyll9+jhLO1lZiESIxkB7y
         BZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMGZP0zlApSX3MJgqVQD5meDGB+YCvT8P8N/GArUWT8=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=RuBDonrm7yCD99MM1oZ034YkRXB8LQmI0mUe3jl7fLyZB+xvIZGf5CLWyS6tKYuUQP
         cH+5niwJnr1+0S4sGYO0szsQ93c0QjKM12rbCTDxp8zPfl9HoUqCEYjC4FWhBPXG9Jxc
         nOtNSD6P2bqHvEyeEbbgUTjO5E/Ijzwmw+IUMv1bOxZsjpH8SguqeMl0Vp5tEnhgmbXX
         6LGy+nnprwIfsVS+NcH2/TN+aMqRLVguUbZushI/08u6CYgK2ZquFQ+jZTvedmZ+kBWa
         F3605j1r94oNpli+DHo63MgjnDGA57pLb4v8MRsOLfj75txpNGojX6uenesmGC94nHSG
         +3Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000564; x=1794605364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WMGZP0zlApSX3MJgqVQD5meDGB+YCvT8P8N/GArUWT8=;
        b=kZIxVglwPbQA+52xiruos9w6/FsoalRJCFyQjVZzQ6tsZChQlk+eqvANjcJfNvy/zJ
         zWNYIlTTx4dETlbyqlolGOvDiqFYrJA5mTmf6OcwAHzUDeLVQ9DwCjZkBp6NaaUzlZXL
         YJ7YL2aYR4UU1zhaTq0DOMnYwqBH/KYNt3rAXdNRBhG1GgtIkgXbv4EGMfq7dI7aCQaE
         36PPT5AH7wRAPe71ZyzoF6a1HEfjjcjbVjryM3Iuy/Q+aRxUYkmQLPcKGaXe1JDTSHtj
         fZ3QffyY6UmdWyUJMxRTN3ZwwG/nt3QrrT1nq9q3E9a5Ms8u4okYbijF2GTBuBFzCB2f
         yXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000564; x=1794605364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMGZP0zlApSX3MJgqVQD5meDGB+YCvT8P8N/GArUWT8=;
        b=IJAGJf4uQmo5W08sjPdSgNWyIKoLitNXDrapzAfQaCTwrhl4XrXs30iL4kdZGNo6Pl
         ZFdbmS1O5YP1nnWpbAxRKA+oTd+5lXaADU5fo+eeyEAcqvZkGRqXDbl45A0d+FsW9YIs
         +kxeQC8v8I6AALw6wRAIRRtYOmAmybfyqcvgFqj9qTSy055utwc2u41MncOo39Sc+TDA
         XktncejvuvkdXtNML5xE6BtyDOsRyIO++dGjp0ofKlL8Uk/PrAicoVeOxypcAxQLi3CQ
         7LHSvkt2zKiU6L8i5XE6SNvEg24jv4fJbL0YSCK/W8+bxJEkEINQrascQMfCi6kLw2jQ
         T7Jw==
X-Gm-Message-State: APuU4Z/SPS+6OoRzmK34Bd5soGIY5nFeOQX5amJQvVbkN0infAroOEox
	69JtlFkiUGcslm9/xTdyBm1ijdguCOHyd4qeWU60+WLLgHiDfW+/gdFglfKaGHQ6UeyprdBxHMD
	xXbFgm5ZSObBTX7jveibdzcQGiViSx3A=
X-Gm-Gg: AYBFou11pHIt8m/PSeYwdzR25lX7NJtR8VJ4GVUdwe/nQLxB0cDLet0U/UYUo37th6N
	oWGMua3x+Q74Dji7eWc6ym0hcerB7wwy72dgmeRG9Od1Gnh9ef1EbyJx/rVHRqKZ9a0QjEYqLyh
	SSeMmYlJmVSJweWSJCRtNftQ+7TJodqj0cUwS9NLfHiIxUzkx2yOlFp1h7/MUX2K7VzWDVc96Fh
	KGDm9vjhCxxWSAmXDtDOvXea+dUl/Go2W2zirXQwJWTRmmVDi4AtIp9FAFNLgfFOSoUnMqUFEmR
	ZBXxqOsLq5ur0AB2aQr8/1/HOqBpjYuYHrOUIt6Q5WVVRiglCHyOzHSC2D98BfM6xctZbZQBeHN
	VYoR6ljuNiQl3e2ULm31FhSp95rAweCaW6MDUiOkp+8yggNNgv9olibRGpAFEUfpErS8CzUv6O6
	a4hFPLaQvGH+MASTm/C18JjPPipg==
X-Received: by 2002:a05:651c:a152:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3acf3a2672fmr7083751fa.16.1794000563857; Fri, 06 Nov 2026
 13:29:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-6-daeho43@gmail.com>
 <c9338038-0eae-457a-a04e-06615354ddd4@kernel.org>
In-Reply-To: <c9338038-0eae-457a-a04e-06615354ddd4@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 6 Nov 2026 13:29:11 -0800
X-Gm-Features: AclHuK-tqtAdJyIvDjD-gCKiJUSuoOklP-peCLraB9Hl0y0487CoZq-yatuStHM
Message-ID: <CACOAw_ytMxXZyG=7R0xdJW+WASoDnE=q4fQCefHwMTuQPtxf1w@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 05/20] f2fs: convert inode dirty page counters
 to dirty block counters
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:24=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 11/3/26 03:39, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > The per-inode dirty counter is compared against block based thresholds
> > such as min_fsync_blocks and BLKS_PER_SEG, so with subpage blocks it
> > has to count blocks instead of pages. Rename it to dirty_blocks, make
> > its helpers take block counts, and convert to pages where it is
> > compared with page based values. The conversions are no-ops when the
> > block size equals PAGE_SIZE.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/checkpoint.c |  4 ++--
> >  fs/f2fs/data.c       | 13 +++++++------
> >  fs/f2fs/f2fs.h       | 36 +++++++++++++++++-------------------
> >  fs/f2fs/file.c       | 16 ++++++++--------
> >  fs/f2fs/inode.c      |  2 +-
> >  fs/f2fs/node.c       |  3 ++-
> >  fs/f2fs/super.c      |  2 +-
> >  7 files changed, 38 insertions(+), 38 deletions(-)
> >
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 158d97fc349a..1060ee651756 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1316,7 +1316,7 @@ static void __remove_dirty_inode(struct inode *in=
ode, enum inode_type type)
> >  {
> >       int flag =3D (type =3D=3D DIR_INODE) ? FI_DIRTY_DIR : FI_DIRTY_FI=
LE;
> >
> > -     if (get_dirty_pages(inode) || !is_inode_flag_set(inode, flag))
> > +     if (get_dirty_blocks(inode) || !is_inode_flag_set(inode, flag))
> >               return;
> >
> >       list_del_init(&F2FS_I(inode)->dirty_list);
> > @@ -1325,7 +1325,7 @@ static void __remove_dirty_inode(struct inode *in=
ode, enum inode_type type)
> >  }
> >
> >  /*
> > - * Account @nr dirty pages (negative when dirtiness is cleared) for @i=
node.
> > + * Account @nr dirty blocks (negative when dirtiness is cleared) for @=
inode.
> >   */
> >  void f2fs_account_dirty_blocks(struct inode *inode, int nr)
> >  {
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index e983b59e4a65..f2254e872a3d 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -4282,7 +4282,7 @@ static int f2fs_write_cache_pages(struct address_=
space *mapping,
> >
> >       folio_batch_init(&fbatch);
> >
> > -     if (get_dirty_pages(mapping->host) <=3D
> > +     if (get_dirty_blocks(mapping->host) <=3D
> >                               SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
> >               set_inode_flag(mapping->host, FI_HOT_DATA);
> >       else
> > @@ -4527,7 +4527,7 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
> >       bool op_locked =3D false;
> >       bool retry =3D false;
> >
> > -     if (get_dirty_pages(inode) <=3D SM_I(sbi)->min_hot_blocks)
> > +     if (get_dirty_blocks(inode) <=3D SM_I(sbi)->min_hot_blocks)
> >               set_inode_flag(inode, FI_HOT_DATA);
> >       else
> >               clear_inode_flag(inode, FI_HOT_DATA);
> > @@ -4791,7 +4791,7 @@ static inline bool __should_serialize_io(struct i=
node *inode,
> >               return true;
> >       if (wbc->sync_mode !=3D WB_SYNC_ALL)
> >               return true;
> > -     if (get_dirty_pages(inode) >=3D SM_I(F2FS_I_SB(inode))->min_seq_b=
locks)
> > +     if (get_dirty_blocks(inode) >=3D SM_I(F2FS_I_SB(inode))->min_seq_=
blocks)
> >               return true;
> >       return false;
> >  }
> > @@ -4830,7 +4830,7 @@ static int __f2fs_write_data_pages(struct address=
_space *mapping,
> >       bool locked =3D false;
> >
> >       /* skip writing if there is no dirty page in this inode */
> > -     if (!get_dirty_pages(inode) && wbc->sync_mode =3D=3D WB_SYNC_NONE=
)
> > +     if (!get_dirty_blocks(inode) && wbc->sync_mode =3D=3D WB_SYNC_NON=
E)
> >               return 0;
> >
> >       /* during POR, we don't need to trigger writepage at all. */
> > @@ -4839,7 +4839,7 @@ static int __f2fs_write_data_pages(struct address=
_space *mapping,
> >
> >       if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
> >                       wbc->sync_mode =3D=3D WB_SYNC_NONE &&
> > -                     get_dirty_pages(inode) < nr_caches_to_skip(sbi, D=
ATA) &&
> > +                     get_dirty_blocks(inode) < nr_caches_to_skip(sbi, =
DATA) &&
> >                       f2fs_available_free_memory(sbi, DIRTY_DENTS))
> >               goto skip_write;
> >
> > @@ -4898,7 +4898,8 @@ static int __f2fs_write_data_pages(struct address=
_space *mapping,
> >       return ret;
> >
> >  skip_write:
> > -     wbc->pages_skipped +=3D get_dirty_pages(inode);
> > +     wbc->pages_skipped +=3D get_dirty_blocks(inode) >>
> > +                                     F2FS_LOG_BLKS_PER_PAGE(sbi);
>
> It seems not accurate here? because all dirty blocks can locates in one p=
age or spread
> in several pages? not sure, it's worth to keep both dirty_{pages,blocks},=
 it's complicate
> to maintain both of them, or can we add a comments here at least to descr=
ibe the issue,
> if no further issue was found w/ current approach.

Hi Chao,

"f2fs: support subpage blocks in data write path and
writeback" accounts dirty blocks per folio: all blocks of a folio are
added when the folio is dirtied and removed when it is cleaned, even
if only some of them are dirty. So the inode and global dirty block
counts are always the number of pages in dirty folios times the
blocks per page, and the shift gives the exact number of dirty pages,
however the dirty blocks are spread. In this patch, the block size
still equals PAGE_SIZE, so the shift is 0. I will add this in comments
in Patch 07/20.

>
> >       update_skipped_write(sbi, wbc);
> >       trace_f2fs_writepages(mapping->host, wbc, DATA);
> >       return 0;
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 3822824326d7..bc67416a6663 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -957,7 +957,7 @@ struct f2fs_inode_info {
> >       unsigned long flags[BITS_TO_LONGS(FI_MAX)];     /* use to pass pe=
r-file flags */
> >       unsigned int ioprio_hint;       /* hint for IO priority */
> >       struct f2fs_rwsem i_sem;        /* protect fi info */
> > -     atomic_t dirty_pages;           /* # of dirty pages */
> > +     atomic_t dirty_blocks;          /* # of dirty blocks */
> >       f2fs_hash_t chash;              /* hash value of given file name =
*/
> >       unsigned int clevel;            /* maximum level of given file na=
me */
> >       struct task_struct *task;       /* lookup and create consistency =
*/
> > @@ -2336,6 +2336,8 @@ static inline unsigned int f2fs_blocks_per_folio(=
struct f2fs_sb_info *sbi,
> >       return folio_size(folio) >> sbi->log_blocksize;
> >  }
> >
> > +#define F2FS_LOG_BLKS_PER_PAGE(sbi)  (PAGE_SHIFT - (sbi)->log_blocksiz=
e)
> > +
> >  static inline bool f2fs_has_subpage_blocks(struct f2fs_sb_info *sbi)
> >  {
> >       return F2FS_BLKSIZE(sbi) < PAGE_SIZE;
> > @@ -2979,40 +2981,36 @@ static inline void dec_cache_count(struct f2fs_=
sb_info *sbi, int count_type)
> >       sub_cache_counts(sbi, count_type, 1);
> >  }
> >
> > -/*
> > - * Account @nr dirty pages for @inode; one page is
> > - * (PAGE_SIZE >> log_blocksize) filesystem blocks.
> > - */
> > -static inline void inode_add_dirty_blocks(struct inode *inode, int nr)
> > +static inline void inode_add_dirty_blocks(struct inode *inode,
> > +                                       unsigned int nr_blocks)
> >  {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > -     int blocks =3D nr * (PAGE_SIZE >> sbi->log_blocksize);
> >
> > -     atomic_add(blocks, &F2FS_I(inode)->dirty_pages);
> > +     atomic_add(nr_blocks, &F2FS_I(inode)->dirty_blocks);
> >       if (S_ISDIR(inode->i_mode))
> > -             add_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
> > +             add_cache_counts(sbi, F2FS_DIRTY_DENTS, nr_blocks);
> >       else
> > -             add_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
> > +             add_cache_counts(sbi, F2FS_DIRTY_DATA, nr_blocks);
> >       if (IS_NOQUOTA(inode))
> > -             add_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
> > +             add_cache_counts(sbi, F2FS_DIRTY_QDATA, nr_blocks);
> >  }
> >
> > -static inline void inode_sub_dirty_blocks(struct inode *inode, int nr)
> > +static inline void inode_sub_dirty_blocks(struct inode *inode,
> > +                                       unsigned int nr_blocks)
> >  {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > -     int blocks =3D nr * (PAGE_SIZE >> sbi->log_blocksize);
> >
> >       if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
> >                       !S_ISLNK(inode->i_mode))
> >               return;
> >
> > -     atomic_sub(blocks, &F2FS_I(inode)->dirty_pages);
> > +     atomic_sub(nr_blocks, &F2FS_I(inode)->dirty_blocks);
> >       if (S_ISDIR(inode->i_mode))
> > -             sub_cache_counts(sbi, F2FS_DIRTY_DENTS, blocks);
> > +             sub_cache_counts(sbi, F2FS_DIRTY_DENTS, nr_blocks);
> >       else
> > -             sub_cache_counts(sbi, F2FS_DIRTY_DATA, blocks);
> > +             sub_cache_counts(sbi, F2FS_DIRTY_DATA, nr_blocks);
> >       if (IS_NOQUOTA(inode))
> > -             sub_cache_counts(sbi, F2FS_DIRTY_QDATA, blocks);
> > +             sub_cache_counts(sbi, F2FS_DIRTY_QDATA, nr_blocks);
> >  }
> >
> >  static inline void inode_inc_dirty_block(struct inode *inode)
> > @@ -3052,9 +3050,9 @@ static inline s64 get_nr_caches(struct f2fs_sb_in=
fo *sbi, int count_type)
> >       return atomic_read(&sbi->nr_caches[count_type]);
> >  }
> >
> > -static inline int get_dirty_pages(struct inode *inode)
> > +static inline int get_dirty_blocks(struct inode *inode)
> >  {
> > -     return atomic_read(&F2FS_I(inode)->dirty_pages);
> > +     return atomic_read(&F2FS_I(inode)->dirty_blocks);
> >  }
> >
> >  static inline int get_blocktype_secs(struct f2fs_sb_info *sbi, int blo=
ck_type)
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index e339cfd84b27..97c052b98559 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -376,7 +376,7 @@ static int f2fs_do_sync_file(struct file *file, lof=
f_t start, loff_t end,
> >               goto go_write;
> >
> >       /* if fdatasync is triggered, let's do in-place-update */
> > -     if (datasync || get_dirty_pages(inode) <=3D SM_I(sbi)->min_fsync_=
blocks)
> > +     if (datasync || get_dirty_blocks(inode) <=3D SM_I(sbi)->min_fsync=
_blocks)
> >               set_inode_flag(inode, FI_NEED_IPU);
> >       ret =3D file_write_and_wait_range(file, start, end);
> >       clear_inode_flag(inode, FI_NEED_IPU);
> > @@ -2495,9 +2495,9 @@ static int f2fs_ioc_start_atomic_write(struct fil=
e *filp, bool truncate)
> >        * Should wait end_io to count F2FS_WB_CP_DATA correctly by
> >        * f2fs_is_atomic_file.
> >        */
> > -     if (get_dirty_pages(inode))
> > -             f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=
=3D%llu, npages=3D%u",
> > -                       inode->i_ino, get_dirty_pages(inode));
> > +     if (get_dirty_blocks(inode))
> > +             f2fs_warn(sbi, "Unexpected flush for atomic writes: ino=
=3D%llu, nblocks=3D%u",
> > +                       inode->i_ino, get_dirty_blocks(inode));
> >       ret =3D filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_M=
AX);
> >       if (ret)
> >               goto out_unlock;
> > @@ -2519,7 +2519,7 @@ static int f2fs_ioc_start_atomic_write(struct fil=
e *filp, bool truncate)
> >               F2FS_I(fi->cow_inode)->atomic_inode =3D inode;
> >       } else {
> >               /* Reuse the already created COW inode */
> > -             f2fs_bug_on(sbi, get_dirty_pages(fi->cow_inode));
> > +             f2fs_bug_on(sbi, get_dirty_blocks(fi->cow_inode));
> >
> >               invalidate_mapping_pages(fi->cow_inode->i_mapping, 0, -1)=
;
> >
> > @@ -4877,7 +4877,7 @@ static int f2fs_ioc_set_compress_option(struct fi=
le *filp, unsigned long arg)
> >               goto out;
> >       }
> >
> > -     if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
> > +     if (f2fs_is_mmap_file(inode) || get_dirty_blocks(inode)) {
> >               ret =3D -EBUSY;
> >               goto out;
> >       }
> > @@ -5033,7 +5033,7 @@ static int f2fs_ioc_decompress_file(struct file *=
filp)
> >               if (ret < 0)
> >                       break;
> >
> > -             if (get_dirty_pages(inode) >=3D BLKS_PER_SEG(sbi)) {
> > +             if (get_dirty_blocks(inode) >=3D BLKS_PER_SEG(sbi)) {
> >                       ret =3D filemap_fdatawrite(inode->i_mapping);
> >                       if (ret < 0)
> >                               break;
> > @@ -5123,7 +5123,7 @@ static int f2fs_ioc_compress_file(struct file *fi=
lp)
> >               if (ret < 0)
> >                       break;
> >
> > -             if (get_dirty_pages(inode) >=3D BLKS_PER_SEG(sbi)) {
> > +             if (get_dirty_blocks(inode) >=3D BLKS_PER_SEG(sbi)) {
> >                       ret =3D filemap_fdatawrite(inode->i_mapping);
> >                       if (ret < 0)
> >                               break;
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index f5a4dac98ef2..5c6a64b31b05 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -872,7 +872,7 @@ static void f2fs_pre_evict_inode(struct inode *inod=
e)
> >           test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
> >               f2fs_invalidate_compress_pages(sbi, inode->i_ino);
> >
> > -     f2fs_bug_on(sbi, get_dirty_pages(inode));
> > +     f2fs_bug_on(sbi, get_dirty_blocks(inode));
> >       f2fs_remove_dirty_inode(inode);
> >       f2fs_remove_donate_inode(inode);
> >
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index e53871f32c35..cb8affb2c1e0 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -85,7 +85,8 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *=
sbi, int type)
> >       } else if (type =3D=3D DIRTY_DENTS) {
> >               if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
> >                       return false;
> > -             mem_size =3D get_nr_caches(sbi, F2FS_DIRTY_DENTS);
> > +             mem_size =3D get_nr_caches(sbi, F2FS_DIRTY_DENTS) >>
> > +                                     F2FS_LOG_BLKS_PER_PAGE(sbi);
>
> It loses accurate here as well.
>
> Thanks,

Same as above, F2FS_DIRTY_DENTS is also accounted per folio.

Thanks,

>
> >               res =3D mem_size < ((avail_ram * nm_i->ram_thresh / 100) =
>> 1);
> >       } else if (type =3D=3D INO_ENTRIES) {
> >               int i;
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index f34558b661eb..fa74564adcfb 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1855,7 +1855,7 @@ static struct inode *f2fs_alloc_inode(struct supe=
r_block *sb)
> >       init_once((void *) fi);
> >
> >       /* Initialize f2fs-specific inode info */
> > -     atomic_set(&fi->dirty_pages, 0);
> > +     atomic_set(&fi->dirty_blocks, 0);
> >       atomic_set(&fi->i_compr_blocks, 0);
> >       atomic_set(&fi->open_count, 0);
> >       atomic_set(&fi->writeback, 0);
>
