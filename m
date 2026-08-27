Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4030B3CB548
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787864798; cv=pass; b=pxNqxQgnr/fuNNLLCMKfxCJ2lcMs/huQ1O2iFWQ7fb7UtsX+DBgaQHu+dbGczAgk7ZrxX2rYyqaU8rJuBKgk7UjX7v5BWppL1dlysvS0DZU1GCBCLxh1BzFGpMjxJ8bOblC7+JKI2xRFYNxYj8uXKkVPOjBMIBTSecTyGwCN4oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787864798; c=relaxed/simple;
	bh=txXSOg/T8koJP0HfFGZ2JWSPH9am2a+YjYlGxsfgVKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhd4LMkhKFF4bujvd6ZX++CsOvZeUvlnK1ee+zuQ8Y/EvRicKJP9f7nQeM/KUU8yzLUEZ0uIAcG97zQ7GYKmuwJxU2pq+iVc1XQWczZY1pQSNcyRTQh8+jvyAQI/xRP7M66ODO+CbQviuBAyXN8HtW0/PKhXuZXwCsb1cy6Z8iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWkRNnzk; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWkRNnzk"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a20c95e412so723941fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787864792; cv=none;
        d=google.com; s=arc-20260327;
        b=sVBNT6oJ9DKMNd3o1RIt+T1o7Qn6JgUZkjEfhOLcUtbPtEkYV2xP7B8hc8KlIwWRrr
         5LyA3/J/wBx2Xepg293iqwUyEpwxBWgl7ey7dd9M7tGO2Pl3KRTq8P7lFfcy51baaecL
         RABulQefbSkYrG+FM4d+HcQnx2VhJPcWYKtTVt6lh9NIv9A0qIWgUL1dk+x1Cc0Qn6eT
         cm0vDhrCLo9tJz0N40Wjhm9Q2D5jB+o+ORnZNO9g+b1qPQQ/LhN8WCMLZudxmXpWtzkL
         DQXfS/wBCaKhm5hezDX7vJckM2i9vzF2eg5eqFDay1SHAwiduqTDCl/IqGKSOhP9zSUa
         1n3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTI6lCE3SeUi2bNFMaFjCIDOpOsKreE1i5lVGRhuwhM=;
        fh=PcbUmcZL3tHZRkhpCyqpnbLk7m3eH8pqZA5/hIRZI2I=;
        b=dS4KirGXh6lYSKHly6zm9BplJPumo3klfpzgE2Syw8JNanKGiLL6Y32hOKK4pRC5kT
         4ewV3eEaxFq3PxXs3y4ss8fQ5/fMhjgX6kF69GE3KJ6Ywx+FakSzDQAtGSSSZ5OynDl4
         6FO17vbgSWV29nrPLqsxxrUt04KPfgXRswma0vsHa6eUZDLmhWE4izeqrTkKgHH0SdDn
         gSwiwvzodFtYPMnuruZN8jUI0u2sxsE5JsfC1fs2iRDMf9IoEBDR1J10U0Vl3jfV7Y9w
         1V0uEAQy12YAswbUAnm1UrJ/uPq4dyPqrAjKG5GIl5HMFJItNLbmDrDx21hKJ+4qOV7a
         KDxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787864792; x=1788469592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTI6lCE3SeUi2bNFMaFjCIDOpOsKreE1i5lVGRhuwhM=;
        b=gWkRNnzkkdPbEuJzBfG5/StM4bVWicKqyr7ETmVq4L6ZnwUS675R6S323z45SybObp
         A4oE7thcX2c4g1EoGf7OwQUw528XWOkPlFUlKZNKkz+HiRwDurWtKdjLyDSZNFUSZJlv
         GEzMpOqUAZCh3XbQ0D+sTUNN+jaFlD9rM0/enDp89CYJiucYvbW1lbcFztBzICNcY9ED
         Bpn8EZj6XznszmPtAv4sMoTPZ+ZUfks5PuqRkpEstoynuLau6GTs0NId2FMXeyheDh4v
         /Gua/TX3OtlD+B+uOKH1Clq3eE5yhL4Q0h/VajTEj/W1DgB3Et0+u1zMhSv05CeBesrq
         IvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787864792; x=1788469592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTI6lCE3SeUi2bNFMaFjCIDOpOsKreE1i5lVGRhuwhM=;
        b=FBdXKP0mDwWW07uqQDYjV0sm1fUtOU7WuCb7lvzxdGNbK8hIrzo/cJBbep2yN0/zno
         QwgWGWC/1FFFiaSy/nUY/7DKNfQyESO9s198vV/+IjkaqKj8al6AldXh5cdnxxt/BLq4
         ILVArKw+qDrY4NnmChkHdsQRNEey7OWtVNe7rzIep5gyOcdjjn4qVzXaEI3W3S433VEj
         rtSBodGSwz/stVLzTg3id1vSdc/nnsHNteSwtqzXZcULaSxMJwd0YVCdrCjMFPbF8zBc
         xrj3ick0N+b3DYuPAqiO1CJybwz7xKY4s4QYU29IBmYRa5axeC4wRjG6wxnzcXh++ugD
         u0aQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQoGsFVAuRBiMv0Jz0VsUl/2FTGaNSkgmgpXLUXDmOxH3vq0kr/BwouiO66jmr6QRqaIfvQ+GvhMDwfdI=@vger.kernel.org
X-Gm-Message-State: AFuF++kM+eHJLy2INoxgWco/cwvTRjckSeAbhwqcZDqiMqy69Nevr2Mu
	QnuQMR+r6uDOVMYJbox0KJlr+a+MdlJQRd9rE8WwwpzAS1nBnWaPc1Aor2EijcI+IAI9r8hwGvB
	F1mr97dVeS3GWiGisQpxajQyD3V1eZP4=
X-Gm-Gg: AR+sD10VSGHjTCzDN6XWHP4ms7QjXaVKRKqju2aLW+CwLdPtXCcsvjC6yH2xR401rtF
	kbiwlneFJUVLKMaLUdHoFqFj82bNnHjXhhyeTuQdA6AmrEbUx4TpJHltIPe8VLo2vFsN13EbFnR
	V8zQyW0U8IQ2GPTRlCmDr1WhurAYm8guaBAwEaCkqKeI/YDeid7ksznKgt8kvJQMGkDel8OCgTN
	0rzbol4mXFSi+qjtHMIHsRTIFPuFgV9mL/jMNVFn+U4LpGIicAnL8ZLKrDaANLSy40WYa91bmEE
	uFpjc0TRkp0XlM4XbA5r4G8HQdhhco4bX501C62W8BoPG7VqsspMpu2UlFWu1ZsRZ15vyRjmFUA
	68M8D0biynLzpFag6cf5NpYQ4kNiHzN4=
X-Received: by 2002:a05:6512:6682:20b0:5b1:5fb6:5cf6 with SMTP id
 2adb3069b0e04-5b5e68ece63mr301414e87.17.1787864792124; Thu, 27 Aug 2026
 14:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-3-zhaonanzhe@xiaomi.com> <3771dfee-db35-4af4-a15d-28b8fa98fe96@kernel.org>
In-Reply-To: <3771dfee-db35-4af4-a15d-28b8fa98fe96@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 14:06:19 -0700
X-Gm-Features: AcwNN1UX8cF71OpWNF9Pyckc-1xTjNYb0rpc7VN9R2dNndNrBT_Op7vETJIX9VE
Message-ID: <CACOAw_xpxprNSnEuvToxn7wjr3Expi+pq6S=46TN7Yi5AJJ-cw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 02/14] f2fs: carry subpage offset and count in
 write IO
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:18=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> On 8/26/26 16:26, Nanzhe Zhao wrote:
> > Large folio write paths need to submit I/O for a range inside a
> > folio instead of always submitting the whole folio from offset zero.
> > Add folio_offset and folio_blkcnt to f2fs_io_info to describe the
> > block offset inside the folio and the number of contiguous blocks
> > covered by the I/O.
> >
> > Apply the new fields to the bio submit paths that need the subpage
> > offset or contiguous block count.
> >
> > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > ---
> >  fs/f2fs/data.c    | 59 ++++++++++++++++++++++++++++++++---------------
> >  fs/f2fs/f2fs.h    | 11 +++++++++
> >  fs/f2fs/segment.c |  3 ++-
> >  3 files changed, 54 insertions(+), 19 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 578a90d427e2..8649d443ca74 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -783,6 +783,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
> >       struct folio *fio_folio =3D fio->folio;
> >       struct folio *data_folio =3D fio->encrypted_page ?
> >                       page_folio(fio->encrypted_page) : fio_folio;
> > +     pgoff_t fio_lblk =3D F2FS_FIO_LBLK(fio_folio, fio);
> > +     size_t bio_offset =3D F2FS_FIO_BIO_OFFSET(fio);
> > +     size_t bio_len =3D F2FS_FIO_BIO_SIZE(fio);
> >
> >       if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
> >                       fio->is_por ? META_POR : (__is_meta_io(fio) ?
> > @@ -795,11 +798,11 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio=
)
> >       bio =3D __bio_alloc(fio, 1);
> >
> >       f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
> > -                     fio_folio->index, fio, GFP_NOIO);
> > -     bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
> > +                     fio_lblk, fio, GFP_NOIO);
> > +     bio_add_folio_nofail(bio, data_folio, bio_len, bio_offset);
> >
> >       if (fio->io_wbc && !is_read_io(fio->op))
> > -             wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZ=
E);
> > +             wbc_account_cgroup_owner(fio->io_wbc, fio_folio, bio_len)=
;
> >
> >       inc_page_count(fio->sbi, is_read_io(fio->op) ?
> >                       __read_io_type(data_folio) : WB_DATA_TYPE(fio->fo=
lio, false));
> > @@ -844,7 +847,8 @@ static bool io_is_mergeable(struct f2fs_sb_info *sb=
i, struct bio *bio,
> >  }
> >
> >  static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
> > -                             struct folio *folio, enum temp_type temp)
> > +                             struct folio *folio, size_t len, size_t o=
ffset,
> > +                             enum temp_type temp)
> >  {
> >       struct f2fs_bio_info *io =3D sbi->write_io[DATA] + temp;
> >       struct bio_entry *be;
> > @@ -853,7 +857,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi,=
 struct bio *bio,
> >       be->bio =3D bio;
> >       bio_get(bio);
> >
> > -     bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
> > +     bio_add_folio_nofail(bio, folio, len, offset);
> >
> >       f2fs_down_write(&io->bio_list_lock);
> >       list_add_tail(&be->list, &io->bio_list);
> > @@ -870,6 +874,9 @@ static int add_ipu_page(struct f2fs_io_info *fio, s=
truct bio **bio,
> >                                                       struct folio *fol=
io)
> >  {
> >       struct folio *fio_folio =3D fio->folio;
> > +     pgoff_t fio_lblk =3D F2FS_FIO_LBLK(fio_folio, fio);
> > +     size_t bio_offset =3D F2FS_FIO_BIO_OFFSET(fio);
> > +     size_t bio_len =3D F2FS_FIO_BIO_SIZE(fio);
> >       struct f2fs_sb_info *sbi =3D fio->sbi;
> >       enum temp_type temp;
> >       bool found =3D false;
> > @@ -892,8 +899,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, s=
truct bio **bio,
> >                                                           fio->new_blka=
ddr));
> >                       if (f2fs_crypt_mergeable_bio(*bio,
> >                                       fio_folio->mapping->host,
> > -                                     fio_folio->index, fio) &&
> > -                         bio_add_folio(*bio, folio, folio_size(folio),=
 0)) {
> > +                                     fio_lblk, fio) &&
> > +                         bio_add_folio(*bio, folio, bio_len, bio_offse=
t)) {
> >                               ret =3D 0;
> >                               break;
> >                       }
> > @@ -1007,6 +1014,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio=
)
> >       struct folio *data_folio =3D fio->encrypted_page ?
> >                       page_folio(fio->encrypted_page) : fio->folio;
> >       struct folio *folio =3D fio->folio;
> > +     pgoff_t fio_lblk =3D F2FS_FIO_LBLK(folio, fio);
> > +     unsigned int fio_cnt =3D F2FS_FIO_BLKCNT(fio);
> > +     size_t bio_offset =3D F2FS_FIO_BIO_OFFSET(fio);
> > +     size_t bio_len =3D F2FS_FIO_BIO_SIZE(fio);
> >
> >       if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
> >                       __is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
> > @@ -1021,9 +1032,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio=
)
> >       if (!bio) {
> >               bio =3D __bio_alloc(fio, BIO_MAX_VECS);
> >               f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
> > -                             folio->index, fio, GFP_NOIO);
> > +                             fio_lblk, fio, GFP_NOIO);
> >
> > -             add_bio_entry(fio->sbi, bio, data_folio, fio->temp);
> > +             add_bio_entry(fio->sbi, bio, data_folio, bio_len,
> > +                          bio_offset, fio->temp);
> >       } else {
> >               if (add_ipu_page(fio, &bio, data_folio))
> >                       goto alloc_new;
> > @@ -1034,7 +1046,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
> >
> >       inc_page_count(fio->sbi, WB_DATA_TYPE(folio, false));
> >
> > -     *fio->last_block =3D fio->new_blkaddr;
> > +     *fio->last_block =3D fio->new_blkaddr + fio_cnt - 1;
> >       *fio->bio =3D bio;
> >
> >       return 0;
> > @@ -1070,6 +1082,10 @@ void f2fs_submit_page_write(struct f2fs_io_info =
*fio)
> >       struct folio *bio_folio;
> >       struct f2fs_lock_context lc;
> >       enum count_type type;
> > +     pgoff_t fio_lblk;
> > +     unsigned int fio_cnt;
> > +     size_t bio_offset;
> > +     size_t bio_len;
> >
> >       f2fs_bug_on(sbi, is_read_io(fio->op));
> >
> > @@ -1108,6 +1124,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *=
fio)
> >       /* set submitted =3D true as a return value */
> >       fio->submitted =3D 1;
> >
> > +     fio_lblk =3D F2FS_FIO_LBLK(fio->folio, fio);
> > +     fio_cnt =3D F2FS_FIO_BLKCNT(fio);
> > +
> >       type =3D WB_DATA_TYPE(bio_folio, fio->compressed_page);
> >       inc_page_count(sbi, type);

inc_page_count() is called only once, but the completion
path in f2fs_write_end_bio() decrements the counter by `fi.length >>
PAGE_SHIFT`.
Even though folio_blkcnt is currently always 1, for robustness and
future multi-block
support, please account for fio_cnt:
    for (i =3D 0; i < fio_cnt; i++)
        inc_page_count(sbi, type);

Thanks,

> >
> > @@ -1115,26 +1134,28 @@ void f2fs_submit_page_write(struct f2fs_io_info=
 *fio)
> >           (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bi=
o,
> >                             fio->new_blkaddr) ||
> >            !f2fs_crypt_mergeable_bio(io->bio, fio_inode(fio),
> > -                             bio_folio->index, fio)))
> > +                             fio_lblk, fio)))
> >               __submit_merged_bio(io);
> >  alloc_new:
> >       if (io->bio =3D=3D NULL) {
> >               io->bio =3D __bio_alloc(fio, BIO_MAX_VECS);
> >               f2fs_set_bio_crypt_ctx(io->bio, fio_inode(fio),
> > -                             bio_folio->index, fio, GFP_NOIO);
> > +                             fio_lblk, fio, GFP_NOIO);
> >               io->fio =3D *fio;
> >       }
> >
> > -     if (!bio_add_folio(io->bio, bio_folio, folio_size(bio_folio), 0))=
 {
> > +     bio_offset =3D F2FS_FIO_BIO_OFFSET(fio);
> > +     bio_len =3D F2FS_FIO_BIO_SIZE(fio);
> > +
> > +     if (!bio_add_folio(io->bio, bio_folio, bio_len, bio_offset)) {
> >               __submit_merged_bio(io);
> >               goto alloc_new;
> >       }
> >
> >       if (fio->io_wbc)
> > -             wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
> > -                             folio_size(fio->folio));
> > +             wbc_account_cgroup_owner(fio->io_wbc, fio->folio, bio_len=
);
> >
> > -     io->last_block_in_bio =3D fio->new_blkaddr;
> > +     io->last_block_in_bio =3D fio->new_blkaddr + fio_cnt - 1;
> >
> >       trace_f2fs_submit_folio_write(fio->folio, fio);
> >  #ifdef CONFIG_BLK_DEV_ZONED
> > @@ -3039,7 +3060,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *=
fio)
> >               set_new_dnode(&dn, inode, NULL, NULL, 0);
> >
> >       if (need_inplace_update(fio) &&
> > -         f2fs_lookup_read_extent_cache_block(inode, folio->index,
> > +         f2fs_lookup_read_extent_cache_block(inode,
> > +                                             F2FS_FIO_LBLK(folio, fio)=
,
> >                                               &fio->old_blkaddr)) {
> >               if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
> >                                               DATA_GENERIC_ENHANCE))
> > @@ -3058,7 +3080,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *=
fio)
> >       if (fio->need_lock =3D=3D LOCK_REQ && !f2fs_trylock_op(fio->sbi, =
&lc))
> >               return -EAGAIN;
> >
> > -     err =3D f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
> > +     err =3D f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(folio, fio),
> > +                                  LOOKUP_NODE);
> >       if (err)
> >               goto out;
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 2e8f85cea6d0..31ddd321daf6 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1357,6 +1357,8 @@ struct f2fs_io_info {
> >       blk_opf_t op_flags;     /* req_flag_bits */
> >       block_t new_blkaddr;    /* new block address to be written */
> >       block_t old_blkaddr;    /* old block address before Cow */
> > +     pgoff_t folio_offset;   /* offset in large folio */
> > +     unsigned int folio_blkcnt;      /* block count in large folio */
> >       union {
> >               struct page *page;      /* page to be written */
> >               struct folio *folio;
> > @@ -1378,6 +1380,15 @@ struct f2fs_io_info {
> >       sector_t *last_block;           /* last block number in bio */
> >  };
> >
> > +#define F2FS_FIO_LBLK(folio, fio)                                    \
> > +     ((folio)->index + (fio)->folio_offset)
>
> #define F2FS_FIO_LBLK(fio)                                      \
>         (((fio)->folio)->index + (fio)->folio_offset)
>
> > +#define F2FS_FIO_BLKCNT(fio)                                         \
> > +     ((fio)->folio_blkcnt ? (fio)->folio_blkcnt : 1)
>
> Hmm, it's better to not leaving fio.folio_blkcnt as zero, can we set
> fio.folio_blkcnt to 1 by default? and use fio->folio_blkcnt.
>
> Thanks,
>
> > +#define F2FS_FIO_BIO_OFFSET(fio)                                     \
> > +     ((fio)->folio_offset << PAGE_SHIFT)
> > +#define F2FS_FIO_BIO_SIZE(fio)                                       \
> > +     F2FS_BLK_TO_BYTES(F2FS_FIO_BLKCNT(fio))
> > +
> >  struct bio_entry {
> >       struct bio *bio;
> >       struct list_head list;
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index df10119d94ad..5bb1e51a38a0 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3816,7 +3816,8 @@ static int __get_segment_type_6(struct f2fs_io_in=
fo *fio)
> >               if (file_is_cold(inode) || f2fs_need_compress_data(inode)=
)
> >                       return CURSEG_COLD_DATA;
> >
> > -             type =3D __get_age_segment_type(inode, fio->folio->index)=
;
> > +             type =3D __get_age_segment_type(inode,
> > +                                          F2FS_FIO_LBLK(fio->folio, fi=
o));
> >               if (type !=3D NO_CHECK_TYPE)
> >                       return type;
> >
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
