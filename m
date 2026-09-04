Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDFD3BE644
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494695; cv=pass; b=U+EAT1jFAhKdMrxI3UoP3Omrsg1Q9JCuyDlqJS2uEPD/mqJ7O6WQt0W/KHBwIUTqQlhUs6akvqiGhPxWiGxw3zKJ2TcwjUqV0L0VnYi0DQsFhBH8YZnACZyMxTx6BG0JunbU/yWr8Tl9FH3t6u3h1vbtl4V/rhcGUNfD6iH4VGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494695; c=relaxed/simple;
	bh=219TagcQ/DiywYCv12jiyZhdM/9lQcAofjb4jRK86wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeuQx5ohM26KbuxoRoDrPIcfKlOfiFBcNXZ2F+b/LCneZzA6Uz8T0GbDCpfd0WizEmwVHFRlh4EH4PIrZHK6Sv2MS1LcBBqg/feNxUAAp/cnSLM8M6wFe6fNk67S9nlaVJA+cXbiDcZeLFErYPCt6QeDKPFUj9CM6SR8/MFnpzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZwsF/wJ; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZwsF/wJ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so484406e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 21:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788494691; cv=none;
        d=google.com; s=arc-20260327;
        b=pdZ/YlgUiiiq0Dv8G4A8YYLuXk9Hi2VXZOTtEsOmsHKdyAmrWtjgF9YR9NQsSVfDS0
         AYFwdqTDWg56jGdaoaUFHCakQWXHe/8n6Q4zkybnkRMrMEif9bzbkGa+J8UmnLjaycDE
         532UsH0bS/SMV6n095FNn8bsrK9kncFbAZAb7aT44uCPrq5zhDbF6yYqOqs4vLuJwZlZ
         3V5qrNZ33EWQ6WiFXD0V35J0DDvqBGTz6ckJSwdWJzTuU4I7ux8MSnwORzN8zwv1kQJt
         1ZDf9JL0X60t3ne8rs6rbXLklOFcapo47on0YmYfoOGP6YA8lClPe1VTer6gMYfJBwa+
         RTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7W54moT60Hfp0AecTczTHyBgcYZ49cYjf6uIpmUkyk=;
        fh=zawbD0FN4fZiMdr5J+C/jLDlgWftQuRR+veaRUPcmAU=;
        b=UCroH+MW8sFgNV1f25I6fL+y6fOO7rPUt94mvZdJh5Q2/AOeSobwWayQ27Gyh83HHt
         sE/R6+djJYFbOgmhgj3hercLWiVfdFQnxajcqH1lRs2Rf8r+r9txGvDYOlGbWnuMz+Ve
         +KF9Hle/dHVl0g7arPk5riUaGpKMNNpi1WUzyq3oc1jBjkfzCtdZsuyFs3pIZf5mO/zt
         iQ2kG2loJS50adUGb449CMsg4blLob1PiMqLWn1zg6FqAzRcItV90AmPo2DOF+I5xqxI
         IMzlqlm0Coh9BV6WuFUrBnp4QKj/XVarqX41OitrfxHDgRjDSqTyjunQMtrEUT6cVNCP
         p2kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788494691; x=1789099491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7W54moT60Hfp0AecTczTHyBgcYZ49cYjf6uIpmUkyk=;
        b=EZwsF/wJfI22S3qjp/6qgNt8OPhE0cTHNWpZV90YVSz+37NY2Zv9Nd268gJ8syDjus
         a52Btt/bsJWCsEfr75lMVeYr3dFn1eZQpVfm1+/DqiFUmP6u11a+bkVzwX7V5Jx558Ue
         8XYNu99R6gigMf4LCuXdGyCxjQYU4r0c1mUyp4wTQ6nJ7tqd9uMweUhefhBNV/Z3OjW6
         qrap0OTsfMNYcIl8N01ELY1vo4hC6BT2Qr9zBlt0ZC3kyywFqx+py6PolNNoUqO3fdkv
         B4QOm6xh7g1KktWz9GB02HPIEigmXKdu+6mxQWYEA3aOrdzQyqBgcEQslC5XZQ0ZFDU6
         eFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788494691; x=1789099491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7W54moT60Hfp0AecTczTHyBgcYZ49cYjf6uIpmUkyk=;
        b=d/y9Pjhksn+3zIU1M8PJYrktY6xWfLk9XV6Qs42JbKUcpnN9Iiksvrce2ykntIHM3p
         huVr1jaxT9FLn3hFQxle4ySQiCeEf9mpToitCVwH2aVwL2dYp72X9mTQepWPngXbxGB0
         q6JcDhf5bm3raA9aIju3WXef4AzMT2eObvlBGo6uiLOGdYBsm9Qt3axgP1wH93/3JPsE
         YIuDJ5LxbH8jytdfmaUsWBjO068pWNRaMJwp7pf2qIANAZY9Ked5lghFsdL7OfJjZ+3K
         VUMjLc/Au5+xsKqKhq1d5dNruvXQCvqFAHfCUxZX5f+g3a2Zi8ZInYD4qoDr15frm0t7
         QfsA==
X-Forwarded-Encrypted: i=1; AKwUvBz/ODsrSSQLWM7ojMGaIUcz3t9OPNtT6yIjPqtg95kLw0rfZGOCWez9LwsWUcby+K416lfE7Jw+0rtgZDs=@vger.kernel.org
X-Gm-Message-State: AFuF++njdPP61tD3fNdkE6r6s1bMEBvbZnxeeQFycUF6VBikwJA0MtmR
	I/eAp6kj6uGfesQUIvMA2jhxtBoL9D7CBmic96uK6iUMa5t+VuKHyC3qEwZKBys8k7m8feqMLTV
	VpwpBazZ2Vp15uRDf85rQ8szejm0mMA0=
X-Gm-Gg: AYBFou10vU0JgcoC7ejQUfnMNXFwQB70uPHSVhj7lPTdAwzVVKE2d8vD+g9fWFZlgRm
	EkgOHXaasBYpmYeOUjizdOl/H0K/Pf8cGA62Hz/8MK9cgZMAWiAfl6VUKqOm3+R0z8lgMx+oi+F
	TscIRUO0/TOIETQmxCn6jiOpcyuh519UFOAIDvToyYXC8rcoadrQi45weANvNDQAgswoPyiP+Sc
	b2ok1EohsQJHrSB/ZUhRtDV1CywrjmS2Nx/+PValZkj9JcOH2TyQt/UxobKIpY+Mcym4PxUE/Cg
	EudYqjHbWCDmjEhWpcTsc1rbRExqiL393TIsV2tp8K7JjfP7PhJkifrPDaSEMIivC/ITMGu6tFM
	JiSnI2jdQwmRZozkSDnmjTKPS8rdtYbJ0
X-Received: by 2002:a05:6512:1595:b0:5b6:423:7f11 with SMTP id
 2adb3069b0e04-5b617065985mr711837e87.31.1788494690363; Thu, 03 Sep 2026
 21:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-6-zhaonanzhe@xiaomi.com> <12ab1762-e635-42d6-ab0b-e3358e3b32c2@kernel.org>
 <CACOAw_yjqS5DDUxQdiqbQZLdXW-fQzHmVPHf32bdBhwth=kLOw@mail.gmail.com>
In-Reply-To: <CACOAw_yjqS5DDUxQdiqbQZLdXW-fQzHmVPHf32bdBhwth=kLOw@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 3 Sep 2026 21:04:36 -0700
X-Gm-Features: AcwNN1XeB9npLH3HD9XqcCECYyZ9WZtThDYroCBxrJzNe0QUNxqGi8ChNH2htlk
Message-ID: <CACOAw_yX2vdMhZEUyYH6TaS1wHNp3axu-bjuZY+3XsnfM4oGzQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 05/14] f2fs: support large folio writeback
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:39=E2=80=AFPM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> On Thu, Aug 27, 2026 at 4:24=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >
> > On 8/26/26 16:26, Nanzhe Zhao wrote:
> > > Large folio can contain multiple dirty ranges.
> > > Add a folio-based writeback path for large-folio mapping files
> > > and keep the legacy f2fs_write_cache_pages() path unchanged for
> > > non large-folio mapping files.
> > >
> > > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > > ---
> > >  fs/f2fs/data.c | 404 +++++++++++++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 398 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > index dff802725544..608d8ea8e607 100644
> > > --- a/fs/f2fs/data.c
> > > +++ b/fs/f2fs/data.c
> > > @@ -358,6 +358,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> > >               struct folio *folio =3D fi.folio;
> > >               unsigned int nr_pages =3D fi.length >> PAGE_SHIFT;
> > >               enum count_type type;
> > > +             bool finished =3D true;
> > >
> > >               if (fscrypt_is_bounce_folio(folio)) {
> > >                       struct folio *io_folio =3D folio;
> > > @@ -388,11 +389,20 @@ static void f2fs_write_end_bio(struct bio *bio)
> > >                               folio->index, NODE_TYPE_REGULAR, true);
> > >                       f2fs_bug_on(sbi, folio->index !=3D nid_of_node(=
folio));
> > >               }
> > > +             if (f2fs_folio_has_ffs(folio)) {
> > > +                     struct f2fs_folio_state *ffs =3D
> > > +                             (struct f2fs_folio_state *)folio->priva=
te;
> > > +
> > > +                     finished =3D atomic_sub_and_test(nr_pages,
> > > +                                     &ffs->write_pages_pending);
> > > +             }
> > > +
> > > +             while (nr_pages--)
> > > +                     dec_page_count(sbi, type);
> > > +
> > >               if (f2fs_in_warm_node_list(folio))
> > >                       f2fs_del_fsync_node_entry(sbi, folio);
> > >
> > > -             dec_page_count(sbi, type);
> >
> > We should not relocate dec_page_count() above f2fs_in_warm_node_list() =
to
> > avoid racing bugs.
> >
> > > -
> > >               /*
> > >                * we should access sbi before folio_end_writeback() to
> > >                * avoid racing w/ kill_f2fs_super()
> > > @@ -401,8 +411,10 @@ static void f2fs_write_end_bio(struct bio *bio)
> > >                               wq_has_sleeper(&sbi->cp_wait))
> > >                       wake_up(&sbi->cp_wait);
> > >
> > > -             folio_clear_f2fs_gcing(folio);
> > > -             folio_end_writeback(folio);
> > > +             if (finished) {
> > > +                     folio_clear_f2fs_gcing(folio);
> > > +                     folio_end_writeback(folio);
> > > +             }
> > >       }
> > >
> > >       bio_put(bio);
> > > @@ -2669,7 +2681,7 @@ static void f2fs_ffs_mark_subrange_uptodate(str=
uct folio *folio, size_t offset,
> > >               folio_mark_uptodate(folio);
> > >  }
> > >
> > > -static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> > > +void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> > >                                   size_t offset, size_t len)
> > >  {
> > >       struct f2fs_folio_state *ffs;
> > > @@ -2692,6 +2704,86 @@ static void f2fs_ffs_mark_subrange_dirty(struc=
t folio *folio,
> > >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> > >  }
> > >
> > > +static bool __ffs_clear_subrange_dirty(struct folio *folio,
> > > +                     struct f2fs_folio_state *ffs, size_t offset, si=
ze_t len)
> > > +{
> > > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > > +     unsigned int start, end;
> > > +
> > > +     start =3D offset >> PAGE_SHIFT;
> > > +     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > > +     end =3D min(end, nr_subpages);
> > > +
> > > +     bitmap_clear(ffs->state, nr_subpages + start, end - start);
> > > +     return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) =
<
> > > +                     2 * nr_subpages;
> > > +}
> > > +
> > > +void f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offse=
t, size_t len)
> > > +{
> > > +     struct f2fs_folio_state *ffs;
> > > +     unsigned long flags;
> > > +
> > > +     if (!f2fs_folio_has_ffs(folio))
> > > +             return;
> > > +
> > > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > > +     __ffs_clear_subrange_dirty(folio, ffs, offset, len);
> > > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > > +}
> > > +
> > > +static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *=
ffs,
> > > +                     const struct folio *folio, unsigned int start,
> > > +                     unsigned int end)
> > > +{
> > > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > > +
> > > +     return find_next_bit(ffs->state, nr_subpages + end + 1,
> > > +                     nr_subpages + start) - nr_subpages;
> > > +}
> > > +
> > > +static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state *=
ffs,
> > > +                     const struct folio *folio, unsigned int start,
> > > +                     unsigned int end)
> > > +{
> > > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > > +
> > > +     return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
> > > +                     nr_subpages + start) - nr_subpages;
> > > +}
> > > +
> > > +static unsigned int ffs_find_dirty_range(struct folio *folio,
> > > +                                     u64 *range_start, u64 range_end=
)
> > > +{
> > > +     struct f2fs_folio_state *ffs;
> > > +     unsigned int start, end, nr_pages;
> > > +
> > > +     if (*range_start >=3D range_end)
> > > +             return 0;
> > > +
> > > +     if (!f2fs_folio_has_ffs(folio))
> > > +             return range_end - *range_start;
> > > +
> > > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > > +     start =3D offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
> > > +     end =3D DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, range_=
end),
> > > +                                     folio_size(folio)), PAGE_SIZE) =
- 1;
> > > +
> > > +     start =3D ffs_next_dirty_subpage(ffs, folio, start, end);
> > > +     if (start > end)
> > > +             return 0;
> > > +
> > > +     if (start =3D=3D end)
> > > +             nr_pages =3D 1;
> > > +     else
> > > +             nr_pages =3D ffs_next_clean_subpage(ffs, folio,
> > > +                                              start + 1, end) - star=
t;
> > > +
> > > +     *range_start =3D folio_pos(folio) + ((u64)start << PAGE_SHIFT);
> > > +     return (u64)nr_pages << PAGE_SHIFT;
> > > +}
> > > +
> > >  static bool find_next_valid_block(const struct folio *folio,
> > >                                 size_t orig_off, size_t *need_off,
> > >                                 size_t len)
> > > @@ -3309,6 +3401,139 @@ int f2fs_do_write_data_page(struct f2fs_io_in=
fo *fio)
> > >       return err;
> > >  }
> > >
> > > +static int f2fs_write_single_data_folio(struct folio *folio, int *su=
bmitted,
> > > +                                     struct writeback_control *wbc,
> > > +                                     enum iostat_type io_type,
> > > +                                     u64 start, u64 end)
> > > +{
> > > +     struct inode *inode =3D folio->mapping->host;
> > > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > +     bool atomic_commit =3D f2fs_is_atomic_file(inode) &&
> > > +                             folio_test_f2fs_atomic(folio);
> > > +     struct inode *dn_inode =3D atomic_commit ?
> > > +                             F2FS_I(inode)->cow_inode : inode;
> > > +     u64 pos =3D folio_pos(folio);
> > > +     pgoff_t start_idx =3D (start - pos) >> PAGE_SHIFT;
> > > +     pgoff_t end_idx =3D (end - 1 - pos) >> PAGE_SHIFT;
> > > +     int local_submitted =3D 0;
> > > +     int err =3D 0;
> > > +
> > > +     for (pgoff_t i =3D start_idx; i <=3D end_idx; i++) {
> > > +             struct dnode_of_data dn;
> > > +             struct node_info ni;
> > > +             pgoff_t data_idx =3D folio->index + i;
> > > +             bool ipu_force =3D false;
> > > +             struct f2fs_io_info fio =3D {
> > > +                     .sbi =3D sbi,
> > > +                     .ino =3D inode->i_ino,
> > > +                     .type =3D DATA,
> > > +                     .op =3D REQ_OP_WRITE,
> > > +                     .op_flags =3D wbc_to_write_flags(wbc),
> > > +                     .old_blkaddr =3D NULL_ADDR,
> > > +                     .folio =3D folio,
> > > +                     .folio_offset =3D i,
> > > +                     .folio_blkcnt =3D 1,
> > > +                     .encrypted_page =3D NULL,
> > > +                     .submitted =3D 0,
> > > +                     .need_lock =3D LOCK_DONE,
> > > +                     .meta_gc =3D f2fs_meta_inode_gc_required(inode)=
 ? 1 : 0,
> > > +                     .io_type =3D io_type,
> > > +                     .io_wbc =3D wbc,
> > > +             };
> > > +
> > > +             if (f2fs_folio_has_ffs(folio)) {
> > > +                     struct f2fs_folio_state *ffs =3D
> > > +                             (struct f2fs_folio_state *)folio->priva=
te;
> > > +
> > > +                     atomic_inc(&ffs->write_pages_pending);
> > > +             }
> > > +
> > > +             set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
> > > +
> > > +             if (!atomic_commit && need_inplace_update(&fio) &&
> >
> > In f2fs_write_single_data_page(), we didn't have !atomic_commit conditi=
on
> > in the check? can we drop !atomic_commit check?
> >
> > need_inplace_update() has checked w/ f2fs_used_in_atomic_write().
> >
> > - need_inplace_update
> >  - f2fs_should_update_outplace
> >   - f2fs_used_in_atomic_write
> >
> > static inline bool f2fs_used_in_atomic_write(struct inode *inode)
> > {
> >         return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode);
> > }
> >
> > > +                 f2fs_lookup_read_extent_cache_block(inode, data_idx=
,
> > > +                                                     &fio.old_blkadd=
r)) {
> > > +                     if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr=
,
> > > +                                                DATA_GENERIC_ENHANCE=
)) {
> > > +                             err =3D -EFSCORRUPTED;
> > > +                             goto rollback;
> > > +                     }
> > > +                     ipu_force =3D true;
> > > +                     goto got_it;
> > > +             }
> > > +
> > > +             err =3D f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NO=
DE);
> > > +             if (err)
> > > +                     goto rollback;
> > > +
> > > +             fio.old_blkaddr =3D dn.data_blkaddr;
> > > +
> > > +got_it:
> > > +             if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> > > +                 !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> > > +                                        DATA_GENERIC_ENHANCE)) {
> > > +                     err =3D -EFSCORRUPTED;
> > > +                     goto rollback;
> > > +             }
> > > +
> > > +             if (fio.meta_gc)
> > > +                     f2fs_wait_on_block_writeback(inode, fio.old_blk=
addr);
> > > +
> > > +             if (!atomic_commit && (ipu_force ||
> > > +                 (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> > > +                                         need_inplace_update(&fio)))=
) {
> > > +                     err =3D f2fs_encrypt_one_page(&fio);
> > > +                     if (err)
> > > +                             goto rollback;
> > > +
> > > +                     f2fs_put_dnode(&dn);
> > > +                     err =3D f2fs_inplace_write_data(&fio);
> > > +                     if (err) {
> > > +                             if (fscrypt_inode_uses_fs_layer_crypto(=
inode))
> > > +                                     fscrypt_finalize_bounce_page(
> > > +                                                     &fio.encrypted_=
page);
> > > +                             goto rollback_no_dnode;
> > > +                     }
> > > +
> > > +                     local_submitted++;
> > > +                     set_inode_flag(inode, FI_UPDATE_WRITE);
> >
> >                         trace_f2fs_do_write_data_page(folio, IPU);
> >
> > > +                     continue;
> > > +             }
> > > +
> > > +             err =3D f2fs_get_node_info(sbi, dn.nid, &ni, false);
> > > +             if (err)
> > > +                     goto rollback;
> > > +
> > > +             fio.version =3D ni.version;
> > > +
> > > +             err =3D f2fs_encrypt_one_page(&fio);
> > > +             if (err)
> > > +                     goto rollback;
> > > +
> > > +             f2fs_outplace_write_data(&dn, &fio);
> > > +             local_submitted++;
> > > +             set_inode_flag(inode, FI_APPEND_WRITE);
> > > +             trace_f2fs_do_write_data_page(folio, OPU);
> > > +             f2fs_put_dnode(&dn);
> > > +             continue;
> > > +
> > > +rollback:
> > > +             f2fs_put_dnode(&dn);
> > > +rollback_no_dnode:
> > > +             if (f2fs_folio_has_ffs(folio)) {
> > > +                     struct f2fs_folio_state *ffs =3D
> > > +                             (struct f2fs_folio_state *)folio->priva=
te;
> > > +
> > > +                     atomic_dec(&ffs->write_pages_pending);
> > > +             }
> > > +             break;
> > > +     }
> > > +
> > > +     if (submitted)
> > > +             *submitted =3D local_submitted;
> > > +     return err;
> > > +}
> > > +
> > >  int f2fs_write_single_data_page(struct folio *folio, int *submitted,
> > >                               struct bio **bio,
> > >                               sector_t *last_block,
> > > @@ -3757,6 +3982,170 @@ static int f2fs_write_cache_pages(struct addr=
ess_space *mapping,
> > >       return ret;
> > >  }
> > >
> > > +static int f2fs_write_cache_folios(struct address_space *mapping,
> > > +                                struct writeback_control *wbc,
> > > +                                enum iostat_type io_type)
> > > +{
> > > +     struct folio *folio =3D NULL;
> > > +     struct inode *inode =3D mapping->host;
> > > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > +     struct f2fs_lock_context lc;
> > > +     u64 pos =3D 0;
> > > +     u64 end_pos =3D 0;
> > > +     u32 r_len =3D 0;
> > > +     int err =3D 0;
> > > +     int submitted =3D 0;
> > > +     int nwritten =3D 0;
> > > +     bool op_locked =3D false;
> > > +     bool next =3D false;
> > > +     bool retry =3D false;
> > > +
> > > +     if (get_dirty_pages(inode) <=3D SM_I(sbi)->min_hot_blocks)
> > > +             set_inode_flag(inode, FI_HOT_DATA);
> > > +     else
> > > +             clear_inode_flag(inode, FI_HOT_DATA);
> > > +
> > > +     while ((folio =3D writeback_iter(mapping, wbc, folio, &err))) {
> > > +             struct f2fs_folio_state *ffs =3D NULL;
> > > +             u64 isize;
> > > +             size_t poff;
> > > +             pgoff_t end_index;
> > > +             bool verity_in_progress;
> > > +             int folio_submitted =3D 0;
> > > +             bool bias_added =3D false;
> > > +
> > > +             submitted =3D 0;
> > > +             next =3D true;
> > > +             retry =3D false;
> > > +
> > > +             if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> > > +                 wbc->sync_mode =3D=3D WB_SYNC_NONE) {
> > > +                     folio_redirty_for_writepage(wbc, folio);
> > > +                     next =3D false;
> > > +                     goto retry_out;
> > > +             }
> > > +retry:
> > > +             pos =3D folio_pos(folio);
> > > +             end_pos =3D pos + folio_size(folio);
> > > +             isize =3D i_size_read(inode);
> > > +             verity_in_progress =3D f2fs_verity_in_progress(inode);
> > > +             poff =3D 0;
> > > +             end_index =3D 0;
> > > +
> > > +             if (retry) {
> > > +                     if (unlikely(folio->mapping !=3D mapping))
> > > +                             goto retry_out;
> > > +
> > > +                     if (!folio_test_dirty(folio))
> > > +                             goto retry_out;
> > > +
> > > +                     if (folio_test_writeback(folio)) {
> > > +                             if (wbc->sync_mode =3D=3D WB_SYNC_NONE)
> > > +                                     goto retry_out;
> > > +                             f2fs_folio_wait_writeback(folio, DATA, =
true, true);
> > > +                     }
> > > +
> > > +                     if (!folio_clear_dirty_for_io(folio))
> > > +                             goto retry_out;
> > > +             }
> > > +
> > > +             /* To avoid dealing with the complexity for one subrang=
e is in bio
> > > +              * while we trylock_op failed before writing another su=
brange.
> > > +              * Try to lock_op before any subrange write for the fol=
io.
> > > +              */
> > > +             if (!op_locked) {
> > > +                     if (!f2fs_trylock_op(sbi, &lc)) {
> > > +                             folio_redirty_for_writepage(wbc, folio)=
;
> > > +                             err =3D 0;
> > > +                             if (wbc->sync_mode !=3D WB_SYNC_ALL)
> > > +                                     goto retry_out;
> > > +
> > > +                             retry =3D true;
> > > +                             folio_unlock(folio);
> > > +                             f2fs_io_schedule_timeout(DEFAULT_SCHEDU=
LE_TIMEOUT);
> > > +                             folio_lock(folio);
> > > +                             goto retry;
> > > +                     }
> > > +                     op_locked =3D true;
> > > +             }
> > > +
> > > +             if (!verity_in_progress) {
> > > +                     poff =3D offset_in_folio(folio, isize);
> > > +                     end_index =3D isize >> PAGE_SHIFT;
> > > +
> > > +                     if (folio->index > end_index ||
> > > +                         (folio->index =3D=3D end_index && poff =3D=
=3D 0))
> > > +                             goto out;
> > > +
> > > +                     if (end_pos > isize) {
> > > +                             folio_zero_segment(folio, poff, folio_s=
ize(folio));
> > > +                             end_pos =3D isize;
> > > +                     }
> > > +             }
> > > +
> > > +             folio_start_writeback(folio);
> > > +
> > > +             if (folio_test_large(folio)) {
> > > +                     if (!f2fs_folio_has_ffs(folio)) {
> >
> > Can you explain why there is no ffs for a dirty large folio?
> >
> > Thanks,
> >
> > > +                             ffs =3D f2fs_ffs_find_or_alloc(folio);
> > > +                             f2fs_ffs_mark_subrange_dirty(folio, 0, =
end_pos - pos);
> > > +                     } else {
> > > +                             ffs =3D (struct f2fs_folio_state *)foli=
o->private;
> > > +                     }
> > > +                     if (f2fs_folio_has_ffs(folio) && !bias_added) {
> > > +                             WARN_ON_ONCE(atomic_read(&ffs->write_pa=
ges_pending) !=3D 0);
> > > +                             atomic_inc(&ffs->write_pages_pending);
> > > +                             bias_added =3D true;
> > > +                     }
> > > +             }
> > > +
> > > +             while ((r_len =3D ffs_find_dirty_range(folio, &pos, end=
_pos))) {
> > > +                     err =3D f2fs_write_single_data_folio(folio, &su=
bmitted,
> > > +                                     wbc, io_type, pos, pos + r_len)=
;
> > > +                     folio_submitted +=3D submitted;
> > > +                     if (err)
> > > +                             goto out;
> > > +
> > > +                     nwritten +=3D submitted;
> > > +                     pos +=3D r_len;
> > > +             }
> > > +
> > > +             if (!err && folio_submitted &&
> > > +                 f2fs_is_atomic_file(inode) &&
> > > +                 folio_test_f2fs_atomic(folio))
> > > +                     folio_clear_f2fs_atomic(folio);
> > > +
> > > +out:
> > > +             f2fs_ffs_clear_subrange_dirty(folio, 0, folio_size(foli=
o));
> > > +             inode_dec_dirty_pages(inode);
>
> If f2fs_write_single_data_folio() fails on subpage 1, jumping
> to `out` unconditionally clears the dirty bitmap for the ENTIRE folio
> (0 to folio_size),
> and decrements the inode dirty pages.
>
> The unwritten dirty subpages lose their dirty tracking and will be
> discarded cleanly
> under memory pressure, causing silent data loss.
>
> Fix: Only clear dirty bits for successfully submitted subranges (`0,
> pos`), and redirty
> the folio if unwritten dirty subpages remain when an error occurs.
>
> Thanks,
>
> > > +
> > > +             if (bias_added) {
> > > +                     if (atomic_dec_and_test(&ffs->write_pages_pendi=
ng))
> > > +                             folio_end_writeback(folio);
> > > +             } else if (!folio_submitted && folio_test_writeback(fol=
io)) {
> > > +                     folio_end_writeback(folio);
> > > +             }
> > > +
> > > +retry_out:
> > > +             if (folio_test_locked(folio))
> > > +                     folio_unlock(folio);
> > > +
> > > +             if (op_locked) {
> > > +                     f2fs_unlock_op(sbi, &lc);
> > > +                     op_locked =3D false;
> > > +             }
> > > +
> > > +             if (err || !next)
> > > +                     break;
> > > +     }
> > > +
> > > +     if (nwritten)
> > > +             f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mappi=
ng->host,
> > > +                                            NULL, 0, DATA);

When large folios are enabled, bios can contain segments pointing to tail
pages of a compound folio.

In __has_merged_page(), target->mapping is directly dereferenced. For tail
pages, target->mapping contains compound_head metadata rather than a valid
address_space pointer, leading to a kernel crash when accessing
target->mapping->host.

Plz, fix this by retrieving the head folio via page_folio(target) before
referencing mapping, and also match folios when comparing against `page`.

Thanks,


> > > +
> > > +     return err;
> > > +}
> > > +
> > >  static inline bool __should_serialize_io(struct inode *inode,
> > >                                       struct writeback_control *wbc)
> > >  {
> > > @@ -3851,7 +4240,10 @@ static int __f2fs_write_data_pages(struct addr=
ess_space *mapping,
> > >       account_writeback(inode, true);
> > >
> > >       blk_start_plug(&plug);
> > > -     ret =3D f2fs_write_cache_pages(mapping, wbc, io_type);
> > > +     if (mapping_large_folio_support(inode->i_mapping))
> > > +             ret =3D f2fs_write_cache_folios(mapping, wbc, io_type);
> > > +     else
> > > +             ret =3D f2fs_write_cache_pages(mapping, wbc, io_type);
> > >       blk_finish_plug(&plug);
> > >
> > >       account_writeback(inode, false);
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
