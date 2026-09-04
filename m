Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5F319CCF7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494869; cv=pass; b=WgMmc4ExT6lXnXCqCDEAjRRAAwDG6QqCEZhb0fvvM9BLvJTWqQoYvZBwMCd3ElWm8PeL3l0MhwcyIVxSnUJ/UKWmYaRkinQyRhQ3ebyLHVixZYE4TUn/svfrybxEahAb2L9WUUyOx6r2K9YRpbfvIo/wXoOrL8uufPrzxm0kyvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494869; c=relaxed/simple;
	bh=L/MNLadf6m4v4ZyxDP8NNp1lJJiMNYhPZbAw6bYaf9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZcunOhcHn7RXS4FECKalMa6E1IKIx91wWQmikyBKUKnWTPYRCu75KTNM3Ey5Y0wU1UgCrB+zKBJQ/JmW2I427qdyev5/iQkyv8boCft2mbJRm9xy3DMwZZ3waeyybCh+4Q/LOxpnFlLg1yt+sgXCet4PpPomzCJKCS+xilDKFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isIX1PH+; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isIX1PH+"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a35920ff96so14317501fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 21:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788494865; cv=none;
        d=google.com; s=arc-20260327;
        b=V6fH4II6lkGloKFgRv5iiccA4Xm3zx4kX1taVafn16iKt3Wquf1thsXkm6RYUvvxm0
         +rwxrJG9uXPY3/vMWL7MdbfyNtejZjeTk6ygfHStgiw3VE/MlRZudLR1M8LsGksQMlCp
         xhc+KiEiQ2pLxqzeicsXAIHk0QVij3b1Zs1hxkOVTR6OCpjQVOE5GJhP8TYtJWyUt50Q
         HeHRgVovT0G+dtSDm/0j2fBCj59zHifyamz1qLBxpZfwCadBgDC3Mm/eiJsv2vE6LVP2
         66CvPaTnchcTqfOt7Ue5OkLimgknO/+UNAxhnY680qo5C91ZJy0GAvJXkHKOoxQvMmc4
         uxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+u2O86uhcJaaSxC3Etrp5A2S/VCHXi9RkFblZKgw1A=;
        fh=Zm1dQNcn0IL1DYPcmqQrC23iikU3XEYTpJ9rmIXQNX4=;
        b=f9UN8SLbsI49uZcKOMCI8l8pANMBEqbX2zyH4+N8I0HmwpzMB6V2gK7kHPywMbswqa
         rUhIyh4NksJRUKP1IIpR2uCPcDvPjS1AM0JIgqHrGWD220QLhaSaHmklK1DKxvJyQlOI
         gOfc4boBLppWdC68rL/VvaLA2o1v195Uost1ivEaSf/XwtL0Oatb5jwLP0LeN1FWT/+3
         imh6AsW2NGVL7gbi1GsxRF8I3gNlbxiAoJQs1H84BRfGlDGmheO4ynv2FKwMt8WpmmKc
         EcmsNPp89EJXDhpO1wuM8scYD1z0/wiHrxsZKDskZIFN22em8XqgtGRL0QFDWw1WU/Rp
         vdaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788494865; x=1789099665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+u2O86uhcJaaSxC3Etrp5A2S/VCHXi9RkFblZKgw1A=;
        b=isIX1PH+mQH/ESL0gVy7yjBfqFbbbWo7iC8YLWb4kjGwVRbcOqO8H8YVeMqlY9PBWm
         v9yCNf+Zifs0GIKP2qolAYaSJJt+QG80LDzSSX9rDgUrLN8jM8s7CPCykFg45fbXYZpQ
         KLHVG0dxD/AAucJBl5tm7sXtO86/Go99VWsDxV726NcI8XRtlXiMLBmMwprhBWa8RZaw
         ioHpppLAtq2u3oa4PbFqvr10ofb7nWawiq68geuXTkqwLjRb1wsp8Lx6uH/KVpVJdOlb
         RinuiJTAJL0mojLFT0vhp4Yb3HvsDbGv6yjKhFv7qPtzbKNGnDGUU68z3m3CO+TWjqqm
         DZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788494865; x=1789099665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+u2O86uhcJaaSxC3Etrp5A2S/VCHXi9RkFblZKgw1A=;
        b=HbuMtFFXtZ7oQGwgNJmwr0n/JjxrHK0J7aIg0cc55O5NvgtuwiKvkuOhNGAjY/DcV/
         Vo+AJ40u7d4MpqQ++cWTq3/9wrnfPf9pveaSHSwWiMmk2xFXA/mO5kr4FUqojoswGwrl
         tdmIoqj9l8yKCcaMt4HAe7PTV2XqvB2Ce0qTL5oATG5gnlyWSFFQmEjMjhbZ3DH+haSM
         2KJm3N3tcd7IbS9W/pX7WBan7pCiqJd4wx8k3Ls5KBxWekGHLmTTIALPJdmiEpNUyxo1
         q3e9SfUMWvU98TIDQcsAx4txZlW4SgCCphXQSOxrbd/OhID2fGNBacN8QkhIIVwo+Qam
         /IQA==
X-Forwarded-Encrypted: i=1; AKwUvBw0J9VaFQ3NIk6q7EUdL0W1q9Q5kQP77329i47RTK8Z5WmQu7etB5Xa2Aac6gQfemQVeOxEjxOiY2S0Zl4=@vger.kernel.org
X-Gm-Message-State: AFuF++mOqw5u8CLhNNxg3169AbVVKl1NIdXqMsjQhK+aam1Oe2ide6ao
	40nlwMm3WNuVdFqitfwA+lb+XrgCYhLMsjCh5hi3lqi6kI/yNBNBtrlbC3dG8BdyiuQbl8slhFy
	kpaERzSRuQQuhBDA6sSOQ9oW3Cc/LNkg=
X-Gm-Gg: AYBFou21QPKKd0C2002fb6y1q2V+UKOXL/hOvxOdf+Er37yp2VMgzynwCvsU2v8l7Vl
	M7Apj5za65si+SnqMGD5HJM/pXaiEVtTbMkIf6mQXJI6lTwZAzO4aDc2IFWZtH+3lrq25EiXcAS
	LDTkBt9VEnUkkJiF2SKTWgjaxfGXmvw8NIsVfhZ+bm+eSOPgwMCvXgTq3XChlmEQRPX4NcX8oAk
	a5+LBMlrl98LSmwH9HQu/dEb0MKAu0UHpMYf5oIL5S/gX62BLV9Pd++Iw78Jaul0+JQfZtTLIDw
	zoxlE8lwyzIT3nuGSUdPImqJx1ar26EW7fXbUMeg7g8TOF6giHCWT6tuBgcDtJaHCQsuIMYBnuh
	GSqgt+TxMXPd6ST+pELAgejjnyC238GjOA0VAGRCxP5g=
X-Received: by 2002:a05:651c:1144:b0:3a3:61ec:43c2 with SMTP id
 38308e7fff4ca-3a361ec4555mr7570421fa.19.1788494865011; Thu, 03 Sep 2026
 21:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-6-zhaonanzhe@xiaomi.com> <12ab1762-e635-42d6-ab0b-e3358e3b32c2@kernel.org>
 <CACOAw_yjqS5DDUxQdiqbQZLdXW-fQzHmVPHf32bdBhwth=kLOw@mail.gmail.com> <CACOAw_yX2vdMhZEUyYH6TaS1wHNp3axu-bjuZY+3XsnfM4oGzQ@mail.gmail.com>
In-Reply-To: <CACOAw_yX2vdMhZEUyYH6TaS1wHNp3axu-bjuZY+3XsnfM4oGzQ@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 3 Sep 2026 21:07:32 -0700
X-Gm-Features: AcwNN1VXjcLwQOON1ZSKGwt7j9WzE9bsKJHIVKHNdgdjrMStWcGUd_EuyBIY23c
Message-ID: <CACOAw_zDt01Z3-KrFWKz4U1j1X1pQUvi4sitsYRL=HE9=Z+t9A@mail.gmail.com>
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

On Thu, Sep 3, 2026 at 9:04=E2=80=AFPM Daeho Jeong <daeho43@gmail.com> wrot=
e:
>
> On Thu, Aug 27, 2026 at 3:39=E2=80=AFPM Daeho Jeong <daeho43@gmail.com> w=
rote:
> >
> > On Thu, Aug 27, 2026 at 4:24=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> > <linux-f2fs-devel@lists.sourceforge.net> wrote:
> > >
> > > On 8/26/26 16:26, Nanzhe Zhao wrote:
> > > > Large folio can contain multiple dirty ranges.
> > > > Add a folio-based writeback path for large-folio mapping files
> > > > and keep the legacy f2fs_write_cache_pages() path unchanged for
> > > > non large-folio mapping files.
> > > >
> > > > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > > > ---
> > > >  fs/f2fs/data.c | 404 +++++++++++++++++++++++++++++++++++++++++++++=
+++-
> > > >  1 file changed, 398 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > index dff802725544..608d8ea8e607 100644
> > > > --- a/fs/f2fs/data.c
> > > > +++ b/fs/f2fs/data.c
> > > > @@ -358,6 +358,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> > > >               struct folio *folio =3D fi.folio;
> > > >               unsigned int nr_pages =3D fi.length >> PAGE_SHIFT;
> > > >               enum count_type type;
> > > > +             bool finished =3D true;
> > > >
> > > >               if (fscrypt_is_bounce_folio(folio)) {
> > > >                       struct folio *io_folio =3D folio;
> > > > @@ -388,11 +389,20 @@ static void f2fs_write_end_bio(struct bio *bi=
o)
> > > >                               folio->index, NODE_TYPE_REGULAR, true=
);
> > > >                       f2fs_bug_on(sbi, folio->index !=3D nid_of_nod=
e(folio));
> > > >               }
> > > > +             if (f2fs_folio_has_ffs(folio)) {
> > > > +                     struct f2fs_folio_state *ffs =3D
> > > > +                             (struct f2fs_folio_state *)folio->pri=
vate;
> > > > +
> > > > +                     finished =3D atomic_sub_and_test(nr_pages,
> > > > +                                     &ffs->write_pages_pending);
> > > > +             }
> > > > +
> > > > +             while (nr_pages--)
> > > > +                     dec_page_count(sbi, type);
> > > > +
> > > >               if (f2fs_in_warm_node_list(folio))
> > > >                       f2fs_del_fsync_node_entry(sbi, folio);
> > > >
> > > > -             dec_page_count(sbi, type);
> > >
> > > We should not relocate dec_page_count() above f2fs_in_warm_node_list(=
) to
> > > avoid racing bugs.
> > >
> > > > -
> > > >               /*
> > > >                * we should access sbi before folio_end_writeback() =
to
> > > >                * avoid racing w/ kill_f2fs_super()
> > > > @@ -401,8 +411,10 @@ static void f2fs_write_end_bio(struct bio *bio=
)
> > > >                               wq_has_sleeper(&sbi->cp_wait))
> > > >                       wake_up(&sbi->cp_wait);
> > > >
> > > > -             folio_clear_f2fs_gcing(folio);
> > > > -             folio_end_writeback(folio);
> > > > +             if (finished) {
> > > > +                     folio_clear_f2fs_gcing(folio);
> > > > +                     folio_end_writeback(folio);
> > > > +             }
> > > >       }
> > > >
> > > >       bio_put(bio);
> > > > @@ -2669,7 +2681,7 @@ static void f2fs_ffs_mark_subrange_uptodate(s=
truct folio *folio, size_t offset,
> > > >               folio_mark_uptodate(folio);
> > > >  }
> > > >
> > > > -static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> > > > +void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> > > >                                   size_t offset, size_t len)
> > > >  {
> > > >       struct f2fs_folio_state *ffs;
> > > > @@ -2692,6 +2704,86 @@ static void f2fs_ffs_mark_subrange_dirty(str=
uct folio *folio,
> > > >       spin_unlock_irqrestore(&ffs->state_lock, flags);
> > > >  }
> > > >
> > > > +static bool __ffs_clear_subrange_dirty(struct folio *folio,
> > > > +                     struct f2fs_folio_state *ffs, size_t offset, =
size_t len)
> > > > +{
> > > > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > > > +     unsigned int start, end;
> > > > +
> > > > +     start =3D offset >> PAGE_SHIFT;
> > > > +     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > > > +     end =3D min(end, nr_subpages);
> > > > +
> > > > +     bitmap_clear(ffs->state, nr_subpages + start, end - start);
> > > > +     return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages=
) <
> > > > +                     2 * nr_subpages;
> > > > +}
> > > > +
> > > > +void f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t off=
set, size_t len)
> > > > +{
> > > > +     struct f2fs_folio_state *ffs;
> > > > +     unsigned long flags;
> > > > +
> > > > +     if (!f2fs_folio_has_ffs(folio))
> > > > +             return;
> > > > +
> > > > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > > > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > > > +     __ffs_clear_subrange_dirty(folio, ffs, offset, len);
> > > > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > > > +}
> > > > +
> > > > +static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state=
 *ffs,
> > > > +                     const struct folio *folio, unsigned int start=
,
> > > > +                     unsigned int end)
> > > > +{
> > > > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > > > +
> > > > +     return find_next_bit(ffs->state, nr_subpages + end + 1,
> > > > +                     nr_subpages + start) - nr_subpages;
> > > > +}
> > > > +
> > > > +static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state=
 *ffs,
> > > > +                     const struct folio *folio, unsigned int start=
,
> > > > +                     unsigned int end)
> > > > +{
> > > > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > > > +
> > > > +     return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
> > > > +                     nr_subpages + start) - nr_subpages;
> > > > +}
> > > > +
> > > > +static unsigned int ffs_find_dirty_range(struct folio *folio,
> > > > +                                     u64 *range_start, u64 range_e=
nd)
> > > > +{
> > > > +     struct f2fs_folio_state *ffs;
> > > > +     unsigned int start, end, nr_pages;
> > > > +
> > > > +     if (*range_start >=3D range_end)
> > > > +             return 0;
> > > > +
> > > > +     if (!f2fs_folio_has_ffs(folio))
> > > > +             return range_end - *range_start;
> > > > +
> > > > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > > > +     start =3D offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
> > > > +     end =3D DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, rang=
e_end),
> > > > +                                     folio_size(folio)), PAGE_SIZE=
) - 1;
> > > > +
> > > > +     start =3D ffs_next_dirty_subpage(ffs, folio, start, end);
> > > > +     if (start > end)
> > > > +             return 0;
> > > > +
> > > > +     if (start =3D=3D end)
> > > > +             nr_pages =3D 1;
> > > > +     else
> > > > +             nr_pages =3D ffs_next_clean_subpage(ffs, folio,
> > > > +                                              start + 1, end) - st=
art;
> > > > +
> > > > +     *range_start =3D folio_pos(folio) + ((u64)start << PAGE_SHIFT=
);
> > > > +     return (u64)nr_pages << PAGE_SHIFT;
> > > > +}
> > > > +
> > > >  static bool find_next_valid_block(const struct folio *folio,
> > > >                                 size_t orig_off, size_t *need_off,
> > > >                                 size_t len)
> > > > @@ -3309,6 +3401,139 @@ int f2fs_do_write_data_page(struct f2fs_io_=
info *fio)
> > > >       return err;
> > > >  }
> > > >
> > > > +static int f2fs_write_single_data_folio(struct folio *folio, int *=
submitted,
> > > > +                                     struct writeback_control *wbc=
,
> > > > +                                     enum iostat_type io_type,
> > > > +                                     u64 start, u64 end)
> > > > +{
> > > > +     struct inode *inode =3D folio->mapping->host;
> > > > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > > +     bool atomic_commit =3D f2fs_is_atomic_file(inode) &&
> > > > +                             folio_test_f2fs_atomic(folio);
> > > > +     struct inode *dn_inode =3D atomic_commit ?
> > > > +                             F2FS_I(inode)->cow_inode : inode;
> > > > +     u64 pos =3D folio_pos(folio);
> > > > +     pgoff_t start_idx =3D (start - pos) >> PAGE_SHIFT;
> > > > +     pgoff_t end_idx =3D (end - 1 - pos) >> PAGE_SHIFT;
> > > > +     int local_submitted =3D 0;
> > > > +     int err =3D 0;
> > > > +
> > > > +     for (pgoff_t i =3D start_idx; i <=3D end_idx; i++) {
> > > > +             struct dnode_of_data dn;
> > > > +             struct node_info ni;
> > > > +             pgoff_t data_idx =3D folio->index + i;
> > > > +             bool ipu_force =3D false;
> > > > +             struct f2fs_io_info fio =3D {
> > > > +                     .sbi =3D sbi,
> > > > +                     .ino =3D inode->i_ino,
> > > > +                     .type =3D DATA,
> > > > +                     .op =3D REQ_OP_WRITE,
> > > > +                     .op_flags =3D wbc_to_write_flags(wbc),
> > > > +                     .old_blkaddr =3D NULL_ADDR,
> > > > +                     .folio =3D folio,
> > > > +                     .folio_offset =3D i,
> > > > +                     .folio_blkcnt =3D 1,
> > > > +                     .encrypted_page =3D NULL,
> > > > +                     .submitted =3D 0,
> > > > +                     .need_lock =3D LOCK_DONE,
> > > > +                     .meta_gc =3D f2fs_meta_inode_gc_required(inod=
e) ? 1 : 0,
> > > > +                     .io_type =3D io_type,
> > > > +                     .io_wbc =3D wbc,
> > > > +             };
> > > > +
> > > > +             if (f2fs_folio_has_ffs(folio)) {
> > > > +                     struct f2fs_folio_state *ffs =3D
> > > > +                             (struct f2fs_folio_state *)folio->pri=
vate;
> > > > +
> > > > +                     atomic_inc(&ffs->write_pages_pending);
> > > > +             }
> > > > +
> > > > +             set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
> > > > +
> > > > +             if (!atomic_commit && need_inplace_update(&fio) &&
> > >
> > > In f2fs_write_single_data_page(), we didn't have !atomic_commit condi=
tion
> > > in the check? can we drop !atomic_commit check?
> > >
> > > need_inplace_update() has checked w/ f2fs_used_in_atomic_write().
> > >
> > > - need_inplace_update
> > >  - f2fs_should_update_outplace
> > >   - f2fs_used_in_atomic_write
> > >
> > > static inline bool f2fs_used_in_atomic_write(struct inode *inode)
> > > {
> > >         return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode);
> > > }
> > >
> > > > +                 f2fs_lookup_read_extent_cache_block(inode, data_i=
dx,
> > > > +                                                     &fio.old_blka=
ddr)) {
> > > > +                     if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkad=
dr,
> > > > +                                                DATA_GENERIC_ENHAN=
CE)) {
> > > > +                             err =3D -EFSCORRUPTED;
> > > > +                             goto rollback;
> > > > +                     }
> > > > +                     ipu_force =3D true;
> > > > +                     goto got_it;
> > > > +             }
> > > > +
> > > > +             err =3D f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_=
NODE);
> > > > +             if (err)
> > > > +                     goto rollback;
> > > > +
> > > > +             fio.old_blkaddr =3D dn.data_blkaddr;
> > > > +
> > > > +got_it:
> > > > +             if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> > > > +                 !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> > > > +                                        DATA_GENERIC_ENHANCE)) {
> > > > +                     err =3D -EFSCORRUPTED;
> > > > +                     goto rollback;
> > > > +             }
> > > > +
> > > > +             if (fio.meta_gc)
> > > > +                     f2fs_wait_on_block_writeback(inode, fio.old_b=
lkaddr);
> > > > +
> > > > +             if (!atomic_commit && (ipu_force ||
> > > > +                 (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> > > > +                                         need_inplace_update(&fio)=
))) {
> > > > +                     err =3D f2fs_encrypt_one_page(&fio);
> > > > +                     if (err)
> > > > +                             goto rollback;
> > > > +
> > > > +                     f2fs_put_dnode(&dn);
> > > > +                     err =3D f2fs_inplace_write_data(&fio);
> > > > +                     if (err) {
> > > > +                             if (fscrypt_inode_uses_fs_layer_crypt=
o(inode))
> > > > +                                     fscrypt_finalize_bounce_page(
> > > > +                                                     &fio.encrypte=
d_page);
> > > > +                             goto rollback_no_dnode;
> > > > +                     }
> > > > +
> > > > +                     local_submitted++;
> > > > +                     set_inode_flag(inode, FI_UPDATE_WRITE);
> > >
> > >                         trace_f2fs_do_write_data_page(folio, IPU);
> > >
> > > > +                     continue;
> > > > +             }
> > > > +
> > > > +             err =3D f2fs_get_node_info(sbi, dn.nid, &ni, false);
> > > > +             if (err)
> > > > +                     goto rollback;
> > > > +
> > > > +             fio.version =3D ni.version;
> > > > +
> > > > +             err =3D f2fs_encrypt_one_page(&fio);
> > > > +             if (err)
> > > > +                     goto rollback;
> > > > +
> > > > +             f2fs_outplace_write_data(&dn, &fio);
> > > > +             local_submitted++;
> > > > +             set_inode_flag(inode, FI_APPEND_WRITE);
> > > > +             trace_f2fs_do_write_data_page(folio, OPU);
> > > > +             f2fs_put_dnode(&dn);
> > > > +             continue;
> > > > +
> > > > +rollback:
> > > > +             f2fs_put_dnode(&dn);
> > > > +rollback_no_dnode:
> > > > +             if (f2fs_folio_has_ffs(folio)) {
> > > > +                     struct f2fs_folio_state *ffs =3D
> > > > +                             (struct f2fs_folio_state *)folio->pri=
vate;
> > > > +
> > > > +                     atomic_dec(&ffs->write_pages_pending);
> > > > +             }
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     if (submitted)
> > > > +             *submitted =3D local_submitted;
> > > > +     return err;
> > > > +}
> > > > +
> > > >  int f2fs_write_single_data_page(struct folio *folio, int *submitte=
d,
> > > >                               struct bio **bio,
> > > >                               sector_t *last_block,
> > > > @@ -3757,6 +3982,170 @@ static int f2fs_write_cache_pages(struct ad=
dress_space *mapping,
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int f2fs_write_cache_folios(struct address_space *mapping,
> > > > +                                struct writeback_control *wbc,
> > > > +                                enum iostat_type io_type)
> > > > +{

Maybe we need to update last_disk_size of the inode like the previous
f2fs_write_single_data_page(), right?

Thanks,


> > > > +     struct folio *folio =3D NULL;
> > > > +     struct inode *inode =3D mapping->host;
> > > > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > > +     struct f2fs_lock_context lc;
> > > > +     u64 pos =3D 0;
> > > > +     u64 end_pos =3D 0;
> > > > +     u32 r_len =3D 0;
> > > > +     int err =3D 0;
> > > > +     int submitted =3D 0;
> > > > +     int nwritten =3D 0;
> > > > +     bool op_locked =3D false;
> > > > +     bool next =3D false;
> > > > +     bool retry =3D false;
> > > > +
> > > > +     if (get_dirty_pages(inode) <=3D SM_I(sbi)->min_hot_blocks)
> > > > +             set_inode_flag(inode, FI_HOT_DATA);
> > > > +     else
> > > > +             clear_inode_flag(inode, FI_HOT_DATA);
> > > > +
> > > > +     while ((folio =3D writeback_iter(mapping, wbc, folio, &err)))=
 {
> > > > +             struct f2fs_folio_state *ffs =3D NULL;
> > > > +             u64 isize;
> > > > +             size_t poff;
> > > > +             pgoff_t end_index;
> > > > +             bool verity_in_progress;
> > > > +             int folio_submitted =3D 0;
> > > > +             bool bias_added =3D false;
> > > > +
> > > > +             submitted =3D 0;
> > > > +             next =3D true;
> > > > +             retry =3D false;
> > > > +
> > > > +             if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> > > > +                 wbc->sync_mode =3D=3D WB_SYNC_NONE) {
> > > > +                     folio_redirty_for_writepage(wbc, folio);
> > > > +                     next =3D false;
> > > > +                     goto retry_out;
> > > > +             }
> > > > +retry:
> > > > +             pos =3D folio_pos(folio);
> > > > +             end_pos =3D pos + folio_size(folio);
> > > > +             isize =3D i_size_read(inode);
> > > > +             verity_in_progress =3D f2fs_verity_in_progress(inode)=
;
> > > > +             poff =3D 0;
> > > > +             end_index =3D 0;
> > > > +
> > > > +             if (retry) {
> > > > +                     if (unlikely(folio->mapping !=3D mapping))
> > > > +                             goto retry_out;
> > > > +
> > > > +                     if (!folio_test_dirty(folio))
> > > > +                             goto retry_out;
> > > > +
> > > > +                     if (folio_test_writeback(folio)) {
> > > > +                             if (wbc->sync_mode =3D=3D WB_SYNC_NON=
E)
> > > > +                                     goto retry_out;
> > > > +                             f2fs_folio_wait_writeback(folio, DATA=
, true, true);
> > > > +                     }
> > > > +
> > > > +                     if (!folio_clear_dirty_for_io(folio))
> > > > +                             goto retry_out;
> > > > +             }
> > > > +
> > > > +             /* To avoid dealing with the complexity for one subra=
nge is in bio
> > > > +              * while we trylock_op failed before writing another =
subrange.
> > > > +              * Try to lock_op before any subrange write for the f=
olio.
> > > > +              */
> > > > +             if (!op_locked) {
> > > > +                     if (!f2fs_trylock_op(sbi, &lc)) {
> > > > +                             folio_redirty_for_writepage(wbc, foli=
o);
> > > > +                             err =3D 0;
> > > > +                             if (wbc->sync_mode !=3D WB_SYNC_ALL)
> > > > +                                     goto retry_out;
> > > > +
> > > > +                             retry =3D true;
> > > > +                             folio_unlock(folio);
> > > > +                             f2fs_io_schedule_timeout(DEFAULT_SCHE=
DULE_TIMEOUT);
> > > > +                             folio_lock(folio);
> > > > +                             goto retry;
> > > > +                     }
> > > > +                     op_locked =3D true;
> > > > +             }
> > > > +
> > > > +             if (!verity_in_progress) {
> > > > +                     poff =3D offset_in_folio(folio, isize);
> > > > +                     end_index =3D isize >> PAGE_SHIFT;
> > > > +
> > > > +                     if (folio->index > end_index ||
> > > > +                         (folio->index =3D=3D end_index && poff =
=3D=3D 0))
> > > > +                             goto out;
> > > > +
> > > > +                     if (end_pos > isize) {
> > > > +                             folio_zero_segment(folio, poff, folio=
_size(folio));
> > > > +                             end_pos =3D isize;
> > > > +                     }
> > > > +             }
> > > > +
> > > > +             folio_start_writeback(folio);
> > > > +
> > > > +             if (folio_test_large(folio)) {
> > > > +                     if (!f2fs_folio_has_ffs(folio)) {
> > >
> > > Can you explain why there is no ffs for a dirty large folio?
> > >
> > > Thanks,
> > >
> > > > +                             ffs =3D f2fs_ffs_find_or_alloc(folio)=
;
> > > > +                             f2fs_ffs_mark_subrange_dirty(folio, 0=
, end_pos - pos);
> > > > +                     } else {
> > > > +                             ffs =3D (struct f2fs_folio_state *)fo=
lio->private;
> > > > +                     }
> > > > +                     if (f2fs_folio_has_ffs(folio) && !bias_added)=
 {
> > > > +                             WARN_ON_ONCE(atomic_read(&ffs->write_=
pages_pending) !=3D 0);
> > > > +                             atomic_inc(&ffs->write_pages_pending)=
;
> > > > +                             bias_added =3D true;
> > > > +                     }
> > > > +             }
> > > > +
> > > > +             while ((r_len =3D ffs_find_dirty_range(folio, &pos, e=
nd_pos))) {
> > > > +                     err =3D f2fs_write_single_data_folio(folio, &=
submitted,
> > > > +                                     wbc, io_type, pos, pos + r_le=
n);
> > > > +                     folio_submitted +=3D submitted;
> > > > +                     if (err)
> > > > +                             goto out;
> > > > +
> > > > +                     nwritten +=3D submitted;
> > > > +                     pos +=3D r_len;
> > > > +             }
> > > > +
> > > > +             if (!err && folio_submitted &&
> > > > +                 f2fs_is_atomic_file(inode) &&
> > > > +                 folio_test_f2fs_atomic(folio))
> > > > +                     folio_clear_f2fs_atomic(folio);
> > > > +
> > > > +out:
> > > > +             f2fs_ffs_clear_subrange_dirty(folio, 0, folio_size(fo=
lio));
> > > > +             inode_dec_dirty_pages(inode);
> >
> > If f2fs_write_single_data_folio() fails on subpage 1, jumping
> > to `out` unconditionally clears the dirty bitmap for the ENTIRE folio
> > (0 to folio_size),
> > and decrements the inode dirty pages.
> >
> > The unwritten dirty subpages lose their dirty tracking and will be
> > discarded cleanly
> > under memory pressure, causing silent data loss.
> >
> > Fix: Only clear dirty bits for successfully submitted subranges (`0,
> > pos`), and redirty
> > the folio if unwritten dirty subpages remain when an error occurs.
> >
> > Thanks,
> >
> > > > +
> > > > +             if (bias_added) {
> > > > +                     if (atomic_dec_and_test(&ffs->write_pages_pen=
ding))
> > > > +                             folio_end_writeback(folio);
> > > > +             } else if (!folio_submitted && folio_test_writeback(f=
olio)) {
> > > > +                     folio_end_writeback(folio);
> > > > +             }
> > > > +
> > > > +retry_out:
> > > > +             if (folio_test_locked(folio))
> > > > +                     folio_unlock(folio);
> > > > +
> > > > +             if (op_locked) {
> > > > +                     f2fs_unlock_op(sbi, &lc);
> > > > +                     op_locked =3D false;
> > > > +             }
> > > > +
> > > > +             if (err || !next)
> > > > +                     break;
> > > > +     }
> > > > +
> > > > +     if (nwritten)
> > > > +             f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), map=
ping->host,
> > > > +                                            NULL, 0, DATA);
>
> When large folios are enabled, bios can contain segments pointing to tail
> pages of a compound folio.
>
> In __has_merged_page(), target->mapping is directly dereferenced. For tai=
l
> pages, target->mapping contains compound_head metadata rather than a vali=
d
> address_space pointer, leading to a kernel crash when accessing
> target->mapping->host.
>
> Plz, fix this by retrieving the head folio via page_folio(target) before
> referencing mapping, and also match folios when comparing against `page`.
>
> Thanks,
>
>
> > > > +
> > > > +     return err;
> > > > +}
> > > > +
> > > >  static inline bool __should_serialize_io(struct inode *inode,
> > > >                                       struct writeback_control *wbc=
)
> > > >  {
> > > > @@ -3851,7 +4240,10 @@ static int __f2fs_write_data_pages(struct ad=
dress_space *mapping,
> > > >       account_writeback(inode, true);
> > > >
> > > >       blk_start_plug(&plug);
> > > > -     ret =3D f2fs_write_cache_pages(mapping, wbc, io_type);
> > > > +     if (mapping_large_folio_support(inode->i_mapping))
> > > > +             ret =3D f2fs_write_cache_folios(mapping, wbc, io_type=
);
> > > > +     else
> > > > +             ret =3D f2fs_write_cache_pages(mapping, wbc, io_type)=
;
> > > >       blk_finish_plug(&plug);
> > > >
> > > >       account_writeback(inode, false);
> > >
> > >
> > >
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
