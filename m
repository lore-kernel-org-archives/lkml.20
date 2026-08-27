Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608B23AFCE9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863885; cv=pass; b=jZZYEKC9ofVlQpzc5swaOHevWeJ656v2Z8s415uccJYIaucjTOulk2FEen2RrTRXWqBpxXxqh7x401/De8ZOuZ/gWZiggOWmWl/PBK0/lnlmjHV5fsDGD6GgmrNViGXOPp6iSZUng+YRvbx7LAD6d59vU9mChTVOluwrl7yKXQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863885; c=relaxed/simple;
	bh=9o9DOl4KaXBxVj0b5AA+e/iVmiKdE2w+ZukOm9SxuyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQh8XrNv/ZxULi/xwXzlfNEANKlvD+lSGyC65pXgKp/DA0IsovNsByjk74el+kinALGqqPlsLafyOlemWbfMCj2HHJesdVMGZRJWR8yKzeg420jk3FA16H0PDE7nXI1oIhaOORLoGWWgHI7QRoUdrcbL8LNHwIiaCv+pJ4iB8r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zqq5lZu4; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zqq5lZu4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so214164e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787863881; cv=none;
        d=google.com; s=arc-20260327;
        b=qOlJFTqTvJ22eyrOdq3GfPmS/oY4M4q0DZu416t5LU+tJpe2UoWMgraEXkuA9HpL72
         jsleze7YekQllYt6rFJpfjz38a1vaJ2ETvyTRmnbGB7OtwsjRKTJtU3Fvd7KMVO9AAnH
         bIK7M5hzu+bOGv7+NUcuYel/eKhJ2+oly36dIkBBrI9nqE9n5lhMAOaDdXzqiUZGh9cm
         96HQtTsxL6QyvCeJ24EcFRee5YzwMkBv+um1c6c6Q9EEqSdhvJpPZYjnwY4enFtJLIoI
         6Kkd1wv/dnoza8ts9FhRNHyu6lhtDfC/UCgr1kozrPxcUAPCwud73O1b+g4NS9EhqSe6
         FyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRfBzLIcTrWFpMj02Z9UyVhgaZeKDSzem6f0ZAiirQo=;
        fh=bLmE1v8Mo9SOSpZRgMKgpKjMuek/YtDpn4kQNosvgDM=;
        b=WWGX8aAJ8//Vm4LCRROkN5GIxIh0cOeagEPVB26umNjrbJhDeuMy3NknnNSim/ZVzq
         wv7FX78sBF+pX++cPlb+uVNj1wzVIQ3XKCjLMheQdMFwQmRNLKa1REzeghopq+4TWFud
         3i1aD96OhPvFugRdhmMZSF9jgxQ6WqY3ExAtHzfmDNf1SrySJsCNq0eUlHTgLR28R5zM
         gavU1xBYcARJOwZ8TQwmscPzQR38dfBV3euTbtuIiuzJapB+mTOZnfNa2xAIKwSQ/8Nc
         DChLMDtbtfFQJ0U1a6y7tQR4rj0S4tZqkgyu4bhETr/U96X66gmGwqkaHrP1JYkixaLP
         VZZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787863881; x=1788468681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRfBzLIcTrWFpMj02Z9UyVhgaZeKDSzem6f0ZAiirQo=;
        b=Zqq5lZu4PodXqBO4gfLe+8DgRaPcGnQCU9ixyeCnT/ip2NghZyGN+89jrpHV7qATHQ
         Gzptc1KQfkffI2dt7xcF48Lodw7BHW8mN93gBjpj4MVfo+JLD6QDWqQDnn6b7sfduRlf
         fKaPhkmty9+EFsdNVrYzeagyHXGJuzK6jGdJBi6MHuvM4SI1FkJTkdjZ0ddUSMD5ct9R
         RSESeXxyUU0kdIq87dCAmw6S/9WNPYkAfI2pApsC5SPjr3E4VptgKxn0u1iKQ+quywzW
         eFb3wRHFNjrldd5VGnUXvNme+vDLxLUhDloUdBqVZJXsYloHI3qp/ob+hUPGr0TrtFJn
         qbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787863881; x=1788468681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRfBzLIcTrWFpMj02Z9UyVhgaZeKDSzem6f0ZAiirQo=;
        b=f4BF9W7xlFptg98WyrG60yYx8C4X0u0IeihB8XgsLLWN7yiEytXtLDLpS7z6ApGrBO
         5ZpFkFAbQrWrXjuFZRSbOb3U1627QgA9OK0XwgOV1dLOmt7iYtMtLMDDTpbVE3Xs+koQ
         lzpUDSeosT4XZrSbJHXeCFIZ7Q2Y65cfSShbJmImx+PFGbuSto6I8zf9jYpxPOVdBAlr
         8l92lbRjMm1UFOLgHQQyRJALpmv/3Y7aK7dS3AH/5JH5KjZqaiJoga1KXMRAT9+P4AiH
         u1asGmVc1FmC9oFnZDQHX7hKOwwVs5KUcupGwxMMNTTTgBxpd2F11ac+x+Be86bXiIaN
         KgVg==
X-Forwarded-Encrypted: i=1; AHgh+RqXSTqbUF+FhFvdKgQxNDFmFjClwgjLH87oBBhlvkBt4KE1FVGFMOmXeGkiGkc0KvCwh8R3WsBPoAcq1Xo=@vger.kernel.org
X-Gm-Message-State: AFuF++kWUnus6nKmiHPXUx2p+utfbM7kDInpRdj1tPMMe3LTS4v4BP3s
	RwjksvHvxPpkGHK4wHYTrycjQc5heBIOvpSkXblHv3k+gqHw5/GTeaJi7uclnIqWcd2OVqcmRae
	OC8jXKyiFYi7qVf4X5+Uh195PGZozAXs=
X-Gm-Gg: AR+sD10dzmN1t4TTd8gBjXM+bg7YjTi/c5DdHGYIo3A4QnWau7qoylzPHUvSwJO5a0v
	8s6m+VXEfsUy5Wm6PZzEN+m694N0fx4IRHpDhwD7AXbuSQgc0ED87U0W7S/n0UTOVfT9LA7KIJF
	LZjw20omkW66dh30pWeejZe8nCSi06V3Lf2TgxEyPs7CndmlloILvB+1Gb837WwUA2nuWfUWXMc
	sWRxQoo/NvmgHDsLICK5MyoSYnablFyL4IawvbRs7krugw5pSF3x/bD29Ii/lzVEHBc9B8nQqOZ
	FFpW5PkETDJfrhxPj3uGMTCPMW0R9t8jqbk4AbYXcJZ3RBlc5s1MF2baP4TgHxGddFKQjqisZ/r
	1cgbmu3rzj7+qmXP7z03GDzuBBowS/s8=
X-Received: by 2002:a05:6512:3b8f:b0:5b5:e2f1:e6f9 with SMTP id
 2adb3069b0e04-5b5e68bc823mr437623e87.11.1787863880920; Thu, 27 Aug 2026
 13:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-2-zhaonanzhe@xiaomi.com> <22b18f2e-70f5-4292-b83e-8f6c374a627d@kernel.org>
In-Reply-To: <22b18f2e-70f5-4292-b83e-8f6c374a627d@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 13:51:06 -0700
X-Gm-Features: AcwNN1XQ9ONGuGr9Z9-frjHGOF-TMgwF7HnquW5aR4Z7largiChuQH7j5LI7wQQ
Message-ID: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: extend folio state for large folio
 write path
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:59=E2=80=AFPM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> On 8/26/26 16:26, Nanzhe Zhao wrote:
> > Large folio write path needs a subpage status bitmap and write
> > pages pending counter, while keeping compatible with f2fs private
> > flags.
> >
> > Move struct f2fs_folio_state to f2fs.h, add private_flags and
> > subpage state bitmap, and change PAGE_PRIVATE functions to be
> > compatible with f2fs_folio_state. Allocate f2fs_folio_state via kzalloc
> > instead of kmem_cache, since the state size depends on the folio order.
> >
> > Note: Now if a path wants to use f2fs_folio_state, it must call
> > `folio_has_ffs` instead of `folio_test_large`` to make check.
> >
> > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > ---
> >  fs/f2fs/compress.c |  2 +
> >  fs/f2fs/data.c     | 60 ++++++++++++++++--------------
> >  fs/f2fs/f2fs.h     | 92 ++++++++++++++++++++++++++++++++++++----------
> >  fs/f2fs/segment.c  |  2 +-
> >  4 files changed, 108 insertions(+), 48 deletions(-)
> >
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 91855d91bbdd..84da3e39efb4 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -78,6 +78,8 @@ bool f2fs_is_compressed_page(struct folio *folio)
> >               return false;
> >       if (folio_test_f2fs_nonpointer(folio))
> >               return false;
> > +     if (f2fs_folio_has_ffs(folio))
> > +             return false;
>
> Shouldn't this be changed in "f2fs: make compressed files compatible with
> large folio" or other patch? I guess in this patch we only introduce new
> ffs facilities.
>
> >
> >       f2fs_bug_on(F2FS_F_SB(folio),
> >               *((u32 *)folio->private) !=3D F2FS_COMPRESSED_PAGE_MAGIC)=
;
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 6ae0eb37d20f..578a90d427e2 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -32,20 +32,13 @@
> >
> >  static struct kmem_cache *bio_post_read_ctx_cache;
> >  static struct kmem_cache *bio_entry_slab;
> > -static struct kmem_cache *ffs_entry_slab;
> >  static mempool_t *bio_post_read_ctx_pool;
> >  static struct bio_set f2fs_bioset;
> >
> > -struct f2fs_folio_state {
> > -     spinlock_t              state_lock;
> > -     unsigned int            read_pages_pending;
> > -};
> > -
> >  struct f2fs_bio {
> >       struct work_struct work;
> >       struct bio bio;
> >  };
> > -
>
> Unnecessary change.
>
> >  #define      F2FS_BIO_POOL_SIZE      NR_CURSEG_TYPE
> >
> >  int __init f2fs_init_bioset(void)
> > @@ -133,6 +126,9 @@ struct bio_post_read_ctx {
> >       block_t fs_blkaddr;
> >  };
> >
> > +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> > +             struct f2fs_folio_state *ffs, size_t offset, size_t len);
> > +
> >  /*
> >   * Update and unlock a bio's pages, and free the bio.
> >   *
> > @@ -155,7 +151,7 @@ static void f2fs_finish_read_bio(struct bio *bio, b=
ool in_task)
> >
> >       bio_for_each_folio_all(fi, bio) {
> >               struct folio *folio =3D fi.folio;
> > -             unsigned nr_pages =3D fi.length >> PAGE_SHIFT;
> > +             unsigned int nr_pages =3D fi.length >> PAGE_SHIFT;
>
> No need to change in this patch?
>
> >               bool finished =3D true;
> >
> >               if (!folio_test_large(folio) &&
> > @@ -360,6 +356,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> >
> >       bio_for_each_folio_all(fi, bio) {
> >               struct folio *folio =3D fi.folio;
> > +             unsigned int nr_pages =3D fi.length >> PAGE_SHIFT;
>
> No need to change in this patch?
>
> >               enum count_type type;
> >
> >               if (fscrypt_is_bounce_folio(folio)) {
> > @@ -2516,17 +2513,32 @@ int f2fs_read_multi_pages(struct compress_ctx *=
cc, struct bio **bio_ret,
> >  }
> >  #endif
> >
> > -static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
> > +struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
> >  {
> > -     struct f2fs_folio_state *ffs =3D folio->private;
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > +     unsigned long private_flags =3D 0;
> > +
> > +     f2fs_bug_on(F2FS_F_SB(folio), !folio_test_large(folio));
> >
> > -     if (ffs)
> > -             return ffs;
> > +     if (f2fs_folio_has_ffs(folio))
> > +             return (struct f2fs_folio_state *)folio->private;
> >
> > -     ffs =3D f2fs_kmem_cache_alloc(ffs_entry_slab,
> > -                     GFP_NOIO | __GFP_ZERO, true, NULL);
> > +     if (folio_test_private(folio) && folio_test_f2fs_nonpointer(folio=
))
> > +             private_flags =3D (unsigned long)folio->private;
> > +
> > +     ffs =3D kzalloc(struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subp=
ages)),
> > +                     GFP_NOIO | __GFP_NOFAIL);

Regarding __GFP_NOFAIL in f2fs_ffs_find_or_alloc():

I understand it is used to avoid failing in-flight I/O or writeback
when allocating
the subpage state. However, invoking __GFP_NOFAIL in memory
reclaim/writeback paths
risks OOM livelocks under extreme memory pressure.

Ideally, we should ensure ffs is always pre-allocated during write_begin() =
and
page_mkwrite() (where returning -ENOMEM to userspace is safe), so that
the writeback
path never has to allocate ffs on the fly with __GFP_NOFAIL.

WDYT?

> >
> >       spin_lock_init(&ffs->state_lock);
> > +     ffs->private_flags =3D private_flags;
> > +     if (folio_test_uptodate(folio))
> > +             bitmap_set(ffs->state, 0, nr_subpages);
> > +     if (folio_test_dirty(folio))
> > +             bitmap_set(ffs->state, nr_subpages, nr_subpages);
> > +
> > +     if (folio_test_private(folio))
> > +             folio_detach_private(folio);
> >       folio_attach_private(folio, ffs);
> >       return ffs;
> >  }
> > @@ -2535,7 +2547,7 @@ static void ffs_detach_free(struct folio *folio)
> >  {
> >       struct f2fs_folio_state *ffs;
> >
> > -     if (!folio_test_large(folio)) {
> > +     if (!f2fs_folio_has_ffs(folio)) {
> >               folio_detach_private(folio);
> >               return;
> >       }
> > @@ -2545,7 +2557,8 @@ static void ffs_detach_free(struct folio *folio)
> >               return;
> >
> >       WARN_ON_ONCE(ffs->read_pages_pending !=3D 0);
> > -     kmem_cache_free(ffs_entry_slab, ffs);
> > +     WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending));
> > +     kfree(ffs);
> >  }
> >
> >  static int f2fs_read_data_large_folio(struct inode *inode,
> > @@ -2558,7 +2571,7 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
> >       pgoff_t index, offset, next_pgofs =3D 0;
> >       unsigned max_nr_pages =3D rac ? readahead_count(rac) :
> >                               folio_nr_pages(folio);
> > -     unsigned nrpages;
> > +     unsigned int nrpages, len_blks;
> >       struct f2fs_folio_state *ffs;
> >       int ret =3D 0;
> >       bool folio_in_bio =3D false;
> > @@ -2634,7 +2647,7 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
> >                * to prevent from premature folio_end_read() call on fol=
io
> >                */
> >               if (folio_test_large(folio)) {
> > -                     ffs =3D ffs_find_or_alloc(folio);
> > +                     ffs =3D f2fs_ffs_find_or_alloc(folio);
> >
> >                       /* set the bitmap to wait */
> >                       spin_lock_irq(&ffs->state_lock);
> > @@ -2987,7 +3000,7 @@ bool f2fs_should_update_outplace(struct inode *in=
ode, struct f2fs_io_info *fio)
> >               return true;
> >
> >       if (fio) {
> > -             if (page_private_gcing(fio->page))
> > +             if (folio_test_f2fs_gcing(fio->folio))
>
> Shouldn't this be changed in "f2fs: make GC migration large-folio aware"?
>
> >                       return true;
> >               if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
> >                       f2fs_is_checkpointed_data(sbi, fio->old_blkaddr))=
)
> > @@ -4586,21 +4599,12 @@ int __init f2fs_init_bio_entry_cache(void)
> >       if (!bio_entry_slab)
> >               return -ENOMEM;
> >
> > -     ffs_entry_slab =3D f2fs_kmem_cache_create("f2fs_ffs_slab",
> > -                     sizeof(struct f2fs_folio_state));
> > -
> > -     if (!ffs_entry_slab) {
> > -             kmem_cache_destroy(bio_entry_slab);
> > -             return -ENOMEM;
> > -     }
> > -
> >       return 0;
> >  }
> >
> >  void f2fs_destroy_bio_entry_cache(void)
> >  {
> >       kmem_cache_destroy(bio_entry_slab);
> > -     kmem_cache_destroy(ffs_entry_slab);
> >  }
> >
> >  static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t=
 length,
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 16720f1f0a9c..2e8f85cea6d0 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1628,6 +1628,18 @@ static inline void f2fs_clear_bit(unsigned int n=
r, char *addr);
> >   * Layout B: lowest bit should be 0
> >   * page.private is a wrapped pointer.
> >   */
> > +
> > +struct f2fs_folio_state {
> > +     spinlock_t              state_lock;
> > +     unsigned int            read_pages_pending;
> > +     atomic_t                write_pages_pending;
> > +     unsigned long           private_flags;
> > +     /* state[0..nr_subpages - 1] tracks uptodate subpages.
> > +      * state[nr_subpages..2 * nr_subpages - 1] tracks dirty subpages.
> > +      */
> > +     unsigned long           state[];
> > +};
> > +
> >  enum {
> >       PAGE_PRIVATE_NOT_POINTER,               /* private contains non-p=
ointer data */
> >       PAGE_PRIVATE_ONGOING_MIGRATION,         /* data page which is on-=
going migrating */
> > @@ -1637,6 +1649,14 @@ enum {
> >       PAGE_PRIVATE_MAX
> >  };
> >
> > +static inline bool f2fs_folio_has_ffs(const struct folio *folio)
> > +{
> > +     unsigned long private =3D (unsigned long)folio->private;
> > +
> > +     return folio_test_large(folio) && private &&
> > +             !(private & BIT(PAGE_PRIVATE_NOT_POINTER));
>
> Is this a bug? in which case we will set PAGE_PRIVATE_NOT_POINTER in
> a large folio? maybe I missed some cases...
>
> folio_test_large(folio) && private is true and
> (private & BIT(PAGE_PRIVATE_NOT_POINTER) is true?
>
> > +}
> > +
> >  /* For compression */
> >  enum compress_algorithm_type {
> >       COMPRESS_LZO,
> > @@ -2682,10 +2702,57 @@ static inline int inc_valid_block_count(struct =
f2fs_sb_info *sbi,
> >       return -ENOSPC;
> >  }
> >
> > +static inline unsigned long f2fs_folio_get_private_flags(const struct =
folio *folio)
> > +{
> > +     if (f2fs_folio_has_ffs(folio)) {
> > +             struct f2fs_folio_state *ffs =3D folio->private;
> > +
> > +             return ffs->private_flags;
> > +     }
> > +
> > +     return (unsigned long)folio->private;
> > +}
> > +
> > +static inline void f2fs_folio_set_private_flags(struct folio *folio,
> > +                                             unsigned long flags)
> > +{
> > +     if (f2fs_folio_has_ffs(folio)) {
> > +             struct f2fs_folio_state *ffs =3D folio->private;
> > +
> > +             ffs->private_flags |=3D flags;

Is this field protected by holding a lock properly?

Thanks,

> > +             return;
> > +     }
> > +
> > +     if (!folio_test_private(folio))
> > +             folio_attach_private(folio, (void *)flags);
> > +     else
> > +             folio->private =3D (void *)((unsigned long)folio->private=
 | flags);
> > +}
> > +
> > +static inline void f2fs_folio_clear_private_flags(struct folio *folio,
> > +                                              unsigned long flags)
> > +{
> > +     unsigned long private;
> > +
> > +     if (f2fs_folio_has_ffs(folio)) {
> > +             struct f2fs_folio_state *ffs =3D folio->private;
> > +
> > +             ffs->private_flags &=3D ~flags;
> > +             return;
> > +     }
> > +
> > +     private =3D (unsigned long)folio->private;
> > +     private &=3D ~flags;
> > +     if (private =3D=3D BIT(PAGE_PRIVATE_NOT_POINTER))
> > +             folio_detach_private(folio);
> > +     else
> > +             folio->private =3D (void *)private;
> > +}
> > +
> >  #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
> >  static inline bool folio_test_f2fs_##name(const struct folio *folio) \
> >  {                                                                    \
> > -     unsigned long priv =3D (unsigned long)folio->private;            =
 \
> > +     unsigned long priv =3D f2fs_folio_get_private_flags(folio);      =
         \
> >       unsigned long v =3D (1UL << PAGE_PRIVATE_NOT_POINTER) |          =
 \
> >                            (1UL << PAGE_PRIVATE_##flagname);          \
> >       return (priv & v) =3D=3D v;                                      =
   \
> > @@ -2702,12 +2769,7 @@ static inline void folio_set_f2fs_##name(struct =
folio *folio)          \
> >  {                                                                    \
> >       unsigned long v =3D (1UL << PAGE_PRIVATE_NOT_POINTER) |          =
 \
> >                            (1UL << PAGE_PRIVATE_##flagname);          \
> > -     if (!folio->private)                                            \
> > -             folio_attach_private(folio, (void *)v);                 \
> > -     else {                                                          \
> > -             v |=3D (unsigned long)folio->private;                    =
 \
> > -             folio->private =3D (void *)v;                            =
 \
> > -     }                                                               \
> > +     f2fs_folio_set_private_flags(folio, v);                         \
> >  }                                                                    \
> >  static inline void set_page_private_##name(struct page *page) \
> >  { \
> > @@ -2720,13 +2782,8 @@ static inline void set_page_private_##name(struc=
t page *page) \
> >  #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
> >  static inline void folio_clear_f2fs_##name(struct folio *folio)       =
       \
> >  {                                                                    \
> > -     unsigned long v =3D (unsigned long)folio->private;               =
 \
> > -                                                                     \
> > -     v &=3D ~(1UL << PAGE_PRIVATE_##flagname);                        =
 \
> > -     if (v =3D=3D (1UL << PAGE_PRIVATE_NOT_POINTER))                  =
   \
> > -             folio_detach_private(folio);                            \
> > -     else                                                            \
> > -             folio->private =3D (void *)v;                            =
 \
> > +     f2fs_folio_clear_private_flags(folio,                           \
> > +                     1UL << PAGE_PRIVATE_##flagname);                 =
       \
> >  }                                                                    \
> >  static inline void clear_page_private_##name(struct page *page) \
> >  { \
> > @@ -2752,7 +2809,7 @@ PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
> >
> >  static inline unsigned long folio_get_f2fs_data(struct folio *folio)
> >  {
> > -     unsigned long data =3D (unsigned long)folio->private;
> > +     unsigned long data =3D f2fs_folio_get_private_flags(folio);
> >
> >       if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
> >               return 0;
> > @@ -2763,10 +2820,7 @@ static inline void folio_set_f2fs_data(struct fo=
lio *folio, unsigned long data)
> >  {
> >       data =3D (1UL << PAGE_PRIVATE_NOT_POINTER) | (data << PAGE_PRIVAT=
E_MAX);
> >
> > -     if (!folio_test_private(folio))
> > -             folio_attach_private(folio, (void *)data);
> > -     else
> > -             folio->private =3D (void *)((unsigned long)folio->private=
 | data);
> > +     f2fs_folio_set_private_flags(folio, data);
> >  }
> >
> >  static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index ed6f2947210b..df10119d94ad 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3803,7 +3803,7 @@ static int __get_segment_type_6(struct f2fs_io_in=
fo *fio)
> >               if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
> >                       return CURSEG_COLD_DATA_PINNED;
> >
> > -             if (page_private_gcing(fio->page)) {
> > +             if (folio_test_f2fs_gcing(fio->folio)) {
>
> Shouldn't this be changed in "f2fs: make GC migration large-folio aware"?
>
> Thanks,
>
> >                       if (fio->sbi->am.atgc_enabled &&
> >                               (fio->io_type =3D=3D FS_DATA_IO) &&
> >                               (fio->sbi->gc_mode !=3D GC_URGENT_HIGH) &=
&
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
