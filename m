Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754137B02E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643408; cv=pass; b=gBp+1DU6yIqbSYnY+anP08d4w94UnCiJsjV7ftE1XqJptgM+MM5aQorz8FlIeF5qfVx8epcctkrW0GFGS98hNuny99UHMVao9DG7F1PeA6myoWpXjNlmX4h4X8X/TF3ztjRPDKzxuQp4dV2Ge+iwABih7qU61SvLOCGX2mBU/yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643408; c=relaxed/simple;
	bh=MpGhaG9sZCejG15Vatb0v8rnISvwfJPlTjt46GRKsZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZM2FfyzmxxjLNM2jbLUtcceUqZJYtr+By6IkWVnS54jqugFDdJXOHJ+gnIla6BLpY9fDSLpzdm25xK9YCZAC+EZMVe2jqPMGrP4PB29CgmTWvIYHa9LabT+vE7CqQeNr2Dk7M+DX1BjksCNJLuBjuujUaHZfktqFDNNN0RBlXS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eykuq8Hu; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eykuq8Hu"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a772ec8389so5422811fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791643404; cv=none;
        d=google.com; s=arc-20260327;
        b=dpDEWjeyGi3c3AnzdYePgXjNia7Sb6c4B2LdkoEkUcPcHD1MfI0IMjXlkxrKC3DhRk
         T+9t2DHDM3ZvLkrvhUgs7udzS75VrZS0KM/AJbhN0WFY+XQ9rujhcc/PynUyLe+VJkJb
         yA8940gPlfAaF9SPeIfxFRtk4z4/ShY4E60GB0hgwrPG8XHlBFjhxmHvw7y6tl1MW55S
         WTIYawdyi8/KPfiQhJ4XDFEYr5rIkAkxbOHUL62CU1TJU/yrWSMIotmak6H1kNWthFUI
         VJuPXiL+4V9smACZSxONURfK2+7HGRbluBGRJS6WOnkdVvbtCeyvtSYZJTx073tNX/M/
         YmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imLCGiXDmGn6Y+Ur+2RBxpevY4P7nxx5LtTBgp55UWA=;
        fh=++yDoV99vTNPxrXd1l8wNC+te/ANnzTLO79UR0bam+0=;
        b=qSFZWt5KfDrhO0NyJVfcMXEXBTDDAkilkBNEMZ88aFhpyxzZ5RJAlngtIJ9eNnRg2Y
         I9qAi/x9w5SDrb5jdBWKnEIeTf0nMUxnU25O5RrwH9GFDbvyCH2ezBJik7IvJ5GGLTin
         vGZndr+T/BUVJE4xfwbE5dEaQIs4tVZhR/16fYFin7Vcvv3inWl8MBb+f7SpMnMjfXab
         f44y+HIWlttztap+9Ud/zVOMNUZ6jmOnxn5TMutqKzXO7ymU1cvAoFSMz3KwAgyl5Atz
         wfsrD6+eFhApSMOJluXiujsNHtZrDduGoYemCXDuvkR/OTgoeWPL8o/AGRzLwBYv+vEs
         4a+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643404; x=1792248204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imLCGiXDmGn6Y+Ur+2RBxpevY4P7nxx5LtTBgp55UWA=;
        b=Eykuq8Hu1po8rdcPyGeYTG6pWRCt6b7ISboJhLP/xYD8YTCmHyBM1fiDqZld8Prnit
         euKqEpBE55jjqOWETcwCpMQfIJXWZrtsgTI22WoIiArc2qILdizeNCaZNAIXDdVGhCez
         +O/cFGl+oJMpgyQKiNr2VZvmC6WkQbN6IiMYASGFwqxbp48ROralJMnOFs9Z4wFGXaAZ
         LkA/lrv08oO5nsfnUvicznDczqjdEKqOW545Us4fy4Yjo7xr9a/JSdIECHspXmk0stMM
         g33nRr/58XNRayz0iFtvumm1c/0rGR1vVKn5+ka+AtfUFwP/z+NHy8cnK/MQJaPWMmK/
         yAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643404; x=1792248204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imLCGiXDmGn6Y+Ur+2RBxpevY4P7nxx5LtTBgp55UWA=;
        b=y6YpWPPj3pCBYv/UoSKaV8hswWgzt4yZVbPoISf8KMWgVpOgGzcKN3MQ+BtGHMe3lE
         WQs8LXiaI8u2TNoq/qLzjVbtonGuSX5s6HsE6S6E2c6rn96ynzE5REX7QWbpDAdoKVis
         k2JDTwK55AXWWDr804CJENaxujljsVwrlPWohFZqRD/mlXg9xsWoAWmmlN71mxreGdyZ
         DBSfK1CShWxjiJidnRgKwgNg7xYjUX7Ot/TrjVcVrlW9n1tT+Mv7Nz6h/1HUEDT/xLXy
         KKBnmO6ytfAjDZ3Yh5mFQrS6IL8z+sVeZt5WehDb2JxgzorXUHenuVsWYLwEXWbxXfEh
         2e9Q==
X-Gm-Message-State: AFq9FYJof9iscu91vn6sIN6bJXN/8amGfVSUCHIQnMoKxcS74km2y3yW
	UzDYHbbAA/xx9kgzsyP4+pqLVQIb6mWjWKoUroUrPet7q4jSwB3conHUYNXJjomA66qnQhzWNjr
	Z+UH8UN5NOKoAsFGrJD/2xe0050jQfe0=
X-Gm-Gg: AYBFou2sj+pRoI6VOn2PvUsS4xCnvTcvUbzKtXRkFPY5UzxZq/SajF5+YsoJrV4+Ry5
	ICHIvIW7+9ALgFzPMjfiHrhhA+gYfs2uGPIpyunArw0INP91rIVWJIAq2muqZWxpuZHUgoDDOxO
	Bpm4ltnD4kg8g5laC2shKMJgABihDY1DFAkRujh8ij40m+4KeKzeRlD9XLGC+DRu60VxkFR9XtZ
	WCBzYC8GCgc8nYX8/SsV9Wf1D1xTE7PG2/S2BRwAQwiNwBtLfRR7YLycklqnOqSIHsFNPtiV0Bn
	FpEFvvlq/Uo52YjSjtz09zOaEdTJogCmQssWLxbihGFrA7CXMAeVY99eHTIDhBm/Vw+enarAQEM
	TcHlrUvJM1PauDMxcK7pDYjWbgM1bSn9DxoN1rM6sWPdT
X-Received: by 2002:a05:651c:a10f:10b0:3a9:849c:b169 with SMTP id
 38308e7fff4ca-3a9c55cd2d5mr7396811fa.26.1791643403535; Sat, 10 Oct 2026
 07:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010024133.2444761-1-daeho43@gmail.com> <99957074-c89a-44c4-a86d-f65e7dc85024@kernel.org>
In-Reply-To: <99957074-c89a-44c4-a86d-f65e7dc85024@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 10 Oct 2026 07:43:11 -0700
X-Gm-Features: AclHuK94B3UGQhAWFJWoilECADYbd4c_BmvhAts7YTa277lgZePZ3pQNwdrBDZE
Message-ID: <CACOAw_yhAvKMHVa_-e7R6vastOGq1jYdG2g=KicMCFFAAQO91w@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: disallow mmap write and
 data-modifying fallocate on atomic files
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:37=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 10/10/26 10:41, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > Stores through a shared writable mapping and fallocate with
> > FALLOC_FL_PUNCH_HOLE, FALLOC_FL_ZERO_RANGE, FALLOC_FL_COLLAPSE_RANGE or
> > FALLOC_FL_INSERT_RANGE do not go through ->write_begin, so they bypass
> > the COW inode and modify the original inode directly. Reject them while
> > the file is in atomic write mode, as fallocate already does for pinned
> > and compressed files. A write fault gets SIGBUS and fallocate gets
> > -EOPNOTSUPP.
> >
> > fallocate without these flags only preallocates blocks and stays
> > allowed.
> >
> > f2fs_vm_page_mkwrite() cannot take inode_lock, so check the flag under
> > invalidate_lock, and hold invalidate_lock in
> > f2fs_ioc_start_atomic_write() from the flush until the flag is set.
> > Otherwise a fault could check the flag, then start_atomic_write could
> > flush and set the flag, and the fault would dirty the folio afterwards.
> >
> > Cc: stable@kernel.org
> > Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
>
> Daeho,
>
> Please take a look at https://sashiko.dev/#/patchset/20261010024133.24447=
61-1-daeho43%40gmail.com
>
> I think we need to apply this after ("f2fs: remove mappedtodisk flag usag=
e in mmap write path")
>
> More details are in my comments on this patch:
> https://lore.kernel.org/linux-f2fs-devel/496b913c-eb81-4fa8-be72-c6a06a10=
aba2@kernel.org/
>
> Otherwise it looks good to me.
>
> Reviewed-by: Chao Yu <chao@kernel.org>
>
> Thanks,

Oh, got it.

Thanks,

>
> > ---
> > v2: serialize atomic flag check in f2fs_vm_page_mkwrite().
> > ---
> >  fs/f2fs/file.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index ef4d218e694..7020b3e8940 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -187,6 +187,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_f=
ault *vmf)
> >       file_update_time(vmf->vma->vm_file);
> >       filemap_invalidate_lock_shared(inode->i_mapping);
> >
> > +     /*
> > +      * mmap stores bypass the COW inode and would break atomicity. Ch=
eck
> > +      * under invalidate_lock: f2fs_ioc_start_atomic_write() holds it =
while
> > +      * flushing dirty folios and setting FI_ATOMIC_FILE, so either it=
 sees
> > +      * our dirty folio and writes it back, or we see the flag.
> > +      */
> > +     if (unlikely(f2fs_is_atomic_file(inode))) {
> > +             err =3D -EOPNOTSUPP;
> > +             goto out_sem;
> > +     }
> > +
> >       folio_lock(folio);
> >       if (unlikely(folio->mapping !=3D inode->i_mapping ||
> >                       folio_pos(folio) > i_size_read(inode) ||
> > @@ -2113,9 +2124,11 @@ static long f2fs_fallocate(struct file *file, in=
t mode,
> >
> >       /*
> >        * Pinned file should not support partial truncation since the bl=
ock
> > -      * can be used by applications.
> > +      * can be used by applications. Atomic files should not either, s=
ince
> > +      * these modify the original inode directly and break atomicity.
> >        */
> > -     if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &=
&
> > +     if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode) ||
> > +          f2fs_is_atomic_file(inode)) &&
> >               (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE =
|
> >                       FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) =
{
> >               ret =3D -EOPNOTSUPP;
> > @@ -2403,6 +2416,8 @@ static int f2fs_ioc_start_atomic_write(struct fil=
e *filp, bool truncate)
> >
> >       f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
> >       f2fs_down_write(&fi->i_gc_rwsem[READ]);
> > +     /* serialize with f2fs_vm_page_mkwrite(), see the comment there *=
/
> > +     filemap_invalidate_lock(inode->i_mapping);
> >
> >       /*
> >        * Should wait end_io to count F2FS_WB_CP_DATA correctly by
> > @@ -2458,6 +2473,7 @@ static int f2fs_ioc_start_atomic_write(struct fil=
e *filp, bool truncate)
> >       f2fs_i_size_write(fi->cow_inode, isize);
> >
> >  out_unlock:
> > +     filemap_invalidate_unlock(inode->i_mapping);
> >       f2fs_up_write(&fi->i_gc_rwsem[READ]);
> >       f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> >       if (ret)
>
