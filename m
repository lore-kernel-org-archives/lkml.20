Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73137F8A7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937497; cv=pass; b=CJ74knMh+I1kTbhL8YApGibRK9HS1jLzO5C/1COrGCd8RG0u4ZNSp2brsCaIZizd11o61+Ud7Q60oDlQBvjLJAwj01xDuq4spGcHohQlQep4autEvnUrn40QCo4n2UCNcUfspPWqZzuVbIKBfjnYSq17mC58rbYeUFZ9APnwZKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937497; c=relaxed/simple;
	bh=PuSu+QDlyu9tEuOYyhFzDk7KyfhIIHNptO/Zu/ptzoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6Z8/ORyAFxo8xu5VPFTH+la+sQBsk3pxXhsanj5Nq9R5s5p6jyIMUrdRUIHsUsvHSmW8D7nFnAJfdGqsGjikqHHerktD8FvN7eoA6E8J2ZixiZ5ezFU6kJsKijXB/KQGPYx9D40GltlRikFfoYBFs81Co949nUA6JsckgGNnis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0qBX0/4; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0qBX0/4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aec201b582so1340788e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787937494; cv=none;
        d=google.com; s=arc-20260327;
        b=cqHX6LYdQqkxgaTPrxNfXPeslWWvbtS0/hPxrkMfPQIOIN5ta6ZIKdwZ7016MwW62o
         eF1J/Wkoaw+a4ai1nQTf1pma+NYmXtcuH/TziVRgvzOu8rJIig0Ch2lsgzrN2glUqNj+
         8kKZuXfzI4zTosBtiTkP8l7RWpa64UpBrwmFNZZADKta7pBNIn424zu8ViQcAfFLWlSe
         /sRG0rRDBxM34+ZBm3ibKOTP8Yko43BHD3nPaN5xqqxlqF1f6mw9Qn1AXnSpZvtPySSu
         xPY6gtN6LAFlO7FYLIFCjwBDnM/QUVZuPRoOG3G3uM20WAOtZVRz1q/fzIgpJ5dGy8Y8
         DcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zkuJ8c4C4QvyA3Q85QsJbhDZbPHSCHEjtJ57RUnpgFA=;
        fh=B2WIKaIWToBQbajbVjbMdztduStH4ptxi6HoNTwxDxY=;
        b=nkAq1uUOPwOcLEd9HwO1z6X+CtJNajzLfnEx9OiFz5xz+PwEqUJsv5EKpTeS+8uwwz
         7Ca6EL6anJrNo9mlEae9c6XFQKxxW4povW8P19Qq+poq5PBaumBcUWIVo97FantIy4Tz
         PnWRzSqNW4plMKwG5oruyYELDPo7jm67aEP3ZKJoXprzDhHdlUF7feX7LVo+5bal+uSe
         WpQ4+5RxIG+RC5URHs27cGRDN53d6VbunjAccdR+lFs11M85PYb2i77OqkGaWsiJ1Zvb
         GJW/mnyHmDiNC2nuO1z5HV95A4+hARZGA5UE3CSLTx7GkRr+W2kKpNY6/os9Y0msnjEc
         apAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787937494; x=1788542294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zkuJ8c4C4QvyA3Q85QsJbhDZbPHSCHEjtJ57RUnpgFA=;
        b=O0qBX0/40B58m8zwvVEBQn5sF17v6WzODqoRAHNFb2IJI1YezViM8HFe8+6XJpZzvf
         coWcsoBRZVLQ+e2tw/GTmJIfBu7Tpvt9VSYVRF/uAdOX5cR3PIRfGpWV3WXXyrMvi16A
         2PVnUJJV2DykuHonPzVjwuyOncEdNjvSkDH9cLCF1uVlVEJIL+Tky6ZTgPlduh/H87Ji
         omV0ElA38ONXsvAIV386ci4lE2tv1KSVG8m+FuXPEP1Z1O/c2cbmuGcI5XkgdMcRWZYK
         9kvCivDDqXLDIlpSxFxkccZ7+3MUd/qfUcbqvqhLY4BbhsUg4dbXOwBZCOmi45O/GE8k
         cihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937494; x=1788542294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkuJ8c4C4QvyA3Q85QsJbhDZbPHSCHEjtJ57RUnpgFA=;
        b=M47riVjDYhg2y8LpMe7bQlJZ26rwGFrwZvjhggxc89pOxjFvi0CoMaYd2EYl2qcKCW
         FlT10GBuFrgxGEE/HiD89VzSwU6nzSQbA8I9e89dvYsyBmkLyEqpRRfVzlOA/dj9QScL
         iKwOgpCeEYo02ylBiKjzRksrxUTdQT1nl7DxUpzVlYnQ7WTdKWOzegMEA3AjU5j036+S
         i0jFKKNC8Skho6/mmQdEHDlVtQdMuXhSJYQyIqxlwOtuAHZZWsi1cJN9osYXAUHiU8En
         +kdVvaRK2jApP16xGK4m7eg9A5mDA/nj26PQCAoD9QLwI8Jrfwvce7uqiLJJ8qzK+g9W
         OjTA==
X-Forwarded-Encrypted: i=1; AHgh+RpMN7gjB9YEqH7fUrYzWBwMHAn3t85lepwEfoUJz67JOpOo3WUH5Jv5t+GeRT7MIKpGBj72djZEpT65TeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mshSL+Ue/x2BzfS+otuCa/gkgdLU/g3u6hy5N35CqHa9iYdg58
	VmHKca7rOhT0YaMnRntSX/45H/Wsh55sH8a0IkGhdL1UFcWyyNoDkQpfh7ZBYAjtIfyjN9Eq5iT
	8+e2tuOyJ+ivbRmdB9ArEm1/dPcmHFqacJDeTTyE=
X-Gm-Gg: AR+sD13K1kUkV2x9w5Yzel8LKqZMjIWhKC7576SWTCGLWDUz3umn0TsSr2gm8fQzU+V
	gdVxrSUPkIV4FAnYuWIJaYjs9/tMBNy7ttzGtzqTuCDf5ePVfL1bvr9347CfhLWILDW7R73gLcd
	lnxMNH9Jw+BnHCE5ouDbPs7POxESse9/SbsCNIUk0phC68bPueEQfTBwRgwU7ZS0oG2heMGLHif
	Yg/kBohsm6dsQFg1uDBUbxEenIAVNmSKxr/ENf4SwPNZBvrwcHlYeKKgR77jwhirX2a5n5F8Xct
	mHaraZELs7NyxopiEUe/uIN1NB6jk781zA7GrbS460xsi44P6yE9Z4Qod/v306+dZGxfKXBcAWR
	unoFo9qaCKWovW+FeWsIAE8fCR7zCPQLKLB7R6JHRBYOx
X-Received: by 2002:a05:6512:a88:b0:5ae:b2b0:4c15 with SMTP id
 2adb3069b0e04-5b5e68c09f3mr2807209e87.11.1787937493355; Fri, 28 Aug 2026
 10:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-7-zhaonanzhe@xiaomi.com> <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
In-Reply-To: <eecd3a49-d252-4d36-9e5a-44ac3eb02108@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 10:18:00 -0700
X-Gm-Features: AcwNN1UAAyIOS5E9tEPPfNhHyKzbj1J5gcW2vwIpq_9XWrA2LunCP9vMd-TUYlw
Message-ID: <CACOAw_xVM3mDWCPKO49drBk_Khd=kFFgXTwE5zpw5+H=PyrOMA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 06/14] f2fs: prepare mmap write faults for
 large folios
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, Barry Song <baohua@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Pengfei Li <lipengfei28@xiaomi.com>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:37=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> On 8/26/26 16:26, Nanzhe Zhao wrote:
> > Now write protect `mmap` also need to support large folio,
> > Change `f2fs_vm_page_mkwrite` to acheive that.
> >
> > Note it currently marks the whole large folio dirty
> > to avoid data loss which causes write amplification.
> > Further optimization is welcome.
> >
> > PG_mappedtodisk is useless in f2fs, so drop the
> > folio_test_mappedtodisk() check and its goto out_sem
>
> Can you send a separated patch to clean up logic on mappedtodisk flag?
>
> > shortcut in f2fs_vm_page_mkwrite().  We extend the
> > folio_zero_segment() in mkwrite to zero the post-EOF part
> > of the faulted folio for both order-0 and large folios, so
> > the f2fs_zero_post_eof_page() call added to cover that
> > shortcut is no longer needed.
> > > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > ---
> >  fs/f2fs/f2fs.h |  5 +++++
> >  fs/f2fs/file.c | 59 +++++++++++++++++++++++++++++++-------------------
> >  2 files changed, 42 insertions(+), 22 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index ae6031693700..71e6d7e34c7b 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4343,6 +4343,11 @@ int f2fs_write_single_data_page(struct folio *fo=
lio, int *submitted,
> >                               enum iostat_type io_type,
> >                               int compr_blocks, bool allow_balance);
> >  bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t ind=
ex);
> > +struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio);
> > +void f2fs_ffs_mark_subrange_dirty(struct folio *folio, size_t offset, =
size_t len);
> > +bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_=
t offset,
> > +                                     size_t len);
> > +void f2fs_ffs_clear_subrange_dirty(struct folio *folio, size_t offset,=
 size_t len);
> >  void f2fs_write_failed(struct inode *inode, loff_t to);
> >  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t =
length);
> >  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index e40285d4f9c2..02d687527241 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -124,6 +124,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_f=
ault *vmf)
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       struct dnode_of_data dn;
> >       bool need_alloc =3D !f2fs_is_pinned_file(inode);
> > +     pgoff_t pidx =3D folio->index + folio_page_idx(folio, vmf->page);
> > +     loff_t pos =3D (loff_t)pidx << PAGE_SHIFT;
> > +     loff_t isize;
> > +     loff_t folio_start;
> > +     loff_t valid_end;
> > +     size_t dirty_len;
> > +     size_t subpage_off;
> >       int err =3D 0;
> >       vm_fault_t ret;
> >
> > @@ -160,7 +167,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fa=
ult *vmf)
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >       if (f2fs_compressed_file(inode)) {
> > -             int ret =3D f2fs_is_compressed_cluster(inode, folio->inde=
x);
> > +             int ret =3D f2fs_is_compressed_cluster(inode, pidx);
> >
> >               if (ret < 0) {
> >                       err =3D ret;
> > @@ -178,18 +185,20 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_=
fault *vmf)
> >
> >       f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> >
> > -     err =3D f2fs_zero_post_eof_page(inode,
> > -             (folio->index + 1) << PAGE_SHIFT, true, false);
> > -     if (err)
> > -             goto out_pagefault;
> > -
> >       file_update_time(vmf->vma->vm_file);
> >       filemap_invalidate_lock_shared(inode->i_mapping);
> >
> >       folio_lock(folio);
> > +     isize =3D i_size_read(inode);
> > +     folio_start =3D folio_pos(folio);
> > +     subpage_off =3D offset_in_folio(folio, pos);
> > +     valid_end =3D min_t(loff_t, folio_start + folio_size(folio), isiz=
e);
> > +     dirty_len =3D valid_end > folio_start ? valid_end - folio_start :=
 0;
> > +
> >       if (unlikely(folio->mapping !=3D inode->i_mapping ||
> > -                     folio_pos(folio) > i_size_read(inode) ||
> > -                     !folio_test_uptodate(folio))) {
> > +                     pos >=3D isize ||
> > +                     !f2fs_ffs_test_blk_uptodate(folio,
> > +                     folio->index + (subpage_off >> PAGE_SHIFT)))) {
> >               folio_unlock(folio);
> >               err =3D -EFAULT;
> >               goto out_sem;
> > @@ -198,9 +207,19 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_f=
ault *vmf)
> >       set_new_dnode(&dn, inode, NULL, NULL, 0);
> >       if (need_alloc) {
> >               /* block allocation */
> > -             err =3D f2fs_get_block_locked(&dn, folio->index);
> > +             if (folio_test_large(folio)) {
> > +                     pgoff_t i, nr =3D DIV_ROUND_UP(dirty_len, PAGE_SI=
ZE);
> > +
> > +                     for (i =3D 0; i < nr; i++) {
> > +                             err =3D f2fs_get_block_locked(&dn, folio-=
>index + i);
> > +                             if (err)
> > +                                     break;
>
> We only need to call f2fs_get_block_locked() for vmf->page?
>
> Hi Barry, could you please help to confirm this? Only vmf->page contain d=
irty
> data, rather than whole large folio contain dirty data?
>
> Thanks,
>
> > +                     }
> > +             } else {
> > +                     err =3D f2fs_get_block_locked(&dn, pidx);
> > +             }
> >       } else {
> > -             err =3D f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_=
NODE);
> > +             err =3D f2fs_get_dnode_of_data(&dn, pidx, LOOKUP_NODE);
> >               f2fs_put_dnode(&dn);
> >               if (f2fs_is_pinned_file(inode) &&
> >                   !__is_valid_data_blkaddr(dn.data_blkaddr))
> > @@ -217,20 +236,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_=
fault *vmf)
> >       /* wait for GCed page writeback via META_MAPPING */
> >       f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);

Is it okay to wait for the last block of the large folio here?

> >
> > -     /*
> > -      * check to see if the page is mapped already (no holes)
> > -      */
> > -     if (folio_test_mappedtodisk(folio))
> > -             goto out_sem;
> > -
> >       /* page is wholly or partially inside EOF */
> > -     if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
> > -                                             i_size_read(inode)) {
> > -             loff_t offset;
> > +     if (folio_start + folio_size(folio) > isize) {
> > +             size_t offset =3D offset_in_folio(folio, isize);
> >
> > -             offset =3D i_size_read(inode) & ~PAGE_MASK;
> >               folio_zero_segment(folio, offset, folio_size(folio));
> >       }
> > +
> > +     if (folio_test_large(folio)) {
> > +             f2fs_ffs_find_or_alloc(folio);
> > +             f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> > +     }
> >       folio_mark_dirty(folio);
> >
> >       f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);

Need to update for dirty_len?

> > @@ -238,12 +254,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_=
fault *vmf)
> >
> >  out_sem:
> >       filemap_invalidate_unlock_shared(inode->i_mapping);
> > -out_pagefault:
> >       sb_end_pagefault(inode->i_sb);
> >  out:
> >       ret =3D vmf_fs_error(err);
> >
> > -     trace_f2fs_vm_page_mkwrite(inode, folio->index, vmf->vma->vm_flag=
s, ret);
> > +     trace_f2fs_vm_page_mkwrite(inode, pidx, vmf->vma->vm_flags, ret);
> >       return ret;
> >  }
> >
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
