Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9E725B08D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533212; cv=pass; b=cnG1tebNCRG4jFw0+ZRmtFCsSJ2bltozce8VWqD144HVORQgfvpq1LqxvVRRLAIrnyB6ngg9L8LFT/xGZezC5j5dD48eSeM2e4wrYDARocO2qEE1KcEStvhbJrYixe4BN1geqCT7O0yfSipR3jgIPzuGbkpYmbK6qju+hvvodzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533212; c=relaxed/simple;
	bh=tXR1RQ6+n7jhl84cnarNBYonFAXMG6urAEgGGbWvFio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTFADJaUS5riM4NmKrMv0v/ygQoUxe8AWBi56OcYBUThaTWlXzr6UoUq+mOVjpqvnA2wVwosEuLOLrdLErIRia6UxLnqeQJMxfPNfYZjxzXHveXINEnAZPuYoiQWmpX+tvTmWteWekrC7i5BzkinM4BsZMiNFFrrPNNKVmQQPrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwJK75SN; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwJK75SN"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff16febfso4464141fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789533208; cv=none;
        d=google.com; s=arc-20260327;
        b=f9d0jHlyehLDjes4DtBAg1zLa7eIzImFj+aNE+7Geg865jY5GYP7uCqLxfdX+cONJo
         czzx/xPp3op9zMgRca+Dl+OYr6MsiWwpnw/WvTY8BCzaij2QAyyDOTzD6yMvmsgnRFPr
         jNyzaKBkEn7mHmFNR6eexgwGqFUz5Onm/g6H/Szs2EHOHXWXxIVLtvZKriEzdnmypsb9
         GTeolqGRDGLTO7/YCm4r+gZMyYn+5YNBt73UM9Q/RZJWoNQDDRTdfBBAC+ABMMjJovyT
         jSiw7te0pfoH5V4xGJ45SLHSdIxWGDDDz5MGERkD0GEbiAZJY+/f4mv30CeiIBSzzqwo
         VrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fAh0SWq3zZpX8kbTlLw3JQdAbZJ6R9FGqKgdEWqN7f4=;
        fh=j5xfNI6Ms/u+sE70Hwhr5Vn2B6B7R7mbH/khYCsnUqs=;
        b=SgkAaYr2+4HcxwYThx+15EuEWp7S5VBWrYbqgpa+ODv6VT8avIRcyJKh5uzsrlS1i1
         iVoTZ1EeaMbNIUyhnXxkFCoBaVKv2XBIeaG3gbCRKzhNtpL7Hn1dT2N6gDST/XeZYmQi
         JFR4u/gUJ5v8LXxKjSLG3fusfd2Kc4S6HEaB4jc7a6pfguRTOVgZtBuK+n7ZYeh3sLZm
         lWyffcP9GG7AEpU0fcFyyp7mOypsx7S5ENMlRCrs6tCT+FH157AU36pz29nhh+lqvrm8
         9wnG81ZbBLLgq/lzdeB6yaJV/JyrcDrlek8KHpTNCvM51p2WPZ1BIfYl1k4dq2+9ChZ6
         W/dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789533208; x=1790138008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAh0SWq3zZpX8kbTlLw3JQdAbZJ6R9FGqKgdEWqN7f4=;
        b=RwJK75SNZW1253d4CgdQvKYhYYsCL3AlbQQinSMESK4ufWPiOUuCDo+TO4KB6KmB2x
         s8qc1AHhLzorY4UGzQ5P9SnKzp1okTLw34bDGuk+X7fevIkyY2tnmAG8SZF3lo+ErU0F
         b29j6hQ2ApTIFpZRFiz6VoJVzFeghY0on1b1p17jrsSLw/7KzDAkFg3JvVi9PFuTSiGT
         5gnkbyb3JSdTdNhiAHIRy5P+ngZJBTmac/9E60KRT/ugVeoUMnpM/6uRY1auSuqkYhoL
         LAc05kDX7YhvN8P0iovcpGhodl9+0m5LV0uvG7ooCh//z5Eyox8pMTAYBIBTmIXL7UC0
         q6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789533208; x=1790138008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAh0SWq3zZpX8kbTlLw3JQdAbZJ6R9FGqKgdEWqN7f4=;
        b=p5xYau52qQmTgZR3+CS97B3qMZxifF19XmB7TUeXy55OW/BNxqTtLLERxszs0a9ZiR
         LSm7vG73ZLFwX5jOyOeUkGw8auNdAP450ujLkaOlSbwIdSWgL0yDzWGJDhWexw5+Nsfb
         x1vAfgdEehApRvk5gT76gJYdr+BmzO709yo9GH9Dma+zMgjKDVStp1VaE8HushBq6c2T
         09QkpAXradvpQLKDItVwpMcOgVSWV/RC46tJ2ZasUra06kr5J8gTkpd3OVHNyqX5wyub
         5fdT6yM0/uWBflD7L3CRmYLal7+lAeUOFtC6l04aW54eCSmYwzcGHyNigIN0+dECHpGj
         gTXw==
X-Forwarded-Encrypted: i=1; AKwUvBys8Ucoc/AjhusgXg268/FIyqrMclSBe/WceynGrSB6FJsjkrRKJeTtbLao/oxZwUhEdg8NsKgw3MYXKUo=@vger.kernel.org
X-Gm-Message-State: AFuF++mRRCl6T7DXE36YWpJYqGQ1kLp68eXigm9jlvaJzS37qFqgv86G
	T3x/KdCPrGRqqIgVFuTSJ+iolqE8rTQ+jCHFBq5phpKqRePCQA0jPHpoI0ieNjsJRFX5Qk2pDxE
	8orVC1cuQ5uBCKU06F2N3JeXNPuPVS8s=
X-Gm-Gg: AYBFou3nxT1hNzUI2azuXKlJNTJcGiFWG8jltfDumL99VKZVTzwTeiYUq6LMhv3nbVv
	frOVZqAid/JSdzOO26mDhaKPradbMN/mNtHEVenudDmTEfrFirw0Zcwu4AW+iGrWRTVqCiK24Ts
	+aCtx6Ojz/XjqrOCN8cVOw6Sg1fuD/5hsv+uFIlmr91lmldDQ2fuQlZC80xlsJJSrlC4PxmG2TF
	kz2vWzDnTow4GXOEA3LIoAgKP/Jb36ZWQCmKBDiDlJThHLcs49kcfXfNeoKeNk9EOI+uR9ofkPM
	yqwaxMDHE0dCkO4f0kNoopLMxvUgsc58FfXGPwEbO2V/waDVsU3DTb/TJKymMKijK2lrbvXaVYz
	d1vU5y/dEXrGVdFhltV2RcmerCHdH+HI5dqO3J1grEe6AG1Z21NSRdKVb
X-Received: by 2002:a05:6512:1384:b0:5b6:1a7c:59cc with SMTP id
 2adb3069b0e04-5b8b6643d51mr229434e87.38.1789533207967; Tue, 15 Sep 2026
 21:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com> <20260915041909.2903887-9-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260915041909.2903887-9-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 15 Sep 2026 21:33:15 -0700
X-Gm-Features: AcwNN1XO2sKHODH885V32TWeU6tHewsV7_TE97nL95m6HfirXlRi1o7PylMLO8A
Message-ID: <CACOAw_z47SS7OKs_wU=-eiPLTMqF=7w6cekiLFK4ePVAhC8YNg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 08/14] f2fs: optimize small block size large
 folio read
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 9:21=E2=80=AFPM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> The original f2fs_read_data_large_folio() implementation has limited
> benefit with a 4KB block size, mainly because updating
> read_pages_pending greatly increases the number of spinlock
> operations.
>
> Use len_blks to batch read_pages_pending and iostat updates for
> contiguous mapped blocks. If the contiguous mapping covers the whole
> folio, skip f2fs_folio_state allocation for that folio.
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 65 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 45 insertions(+), 20 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 287d83debf95..09ad5cf0d9aa 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -173,8 +173,9 @@ static void f2fs_finish_read_bio(struct bio *bio, boo=
l in_task)
>                         continue;
>                 }
>
> -               if (folio_test_large(folio)) {
> -                       struct f2fs_folio_state *ffs =3D folio->private;
> +               if (f2fs_folio_has_ffs(folio)) {
> +                       struct f2fs_folio_state *ffs =3D
> +                               (struct f2fs_folio_state *)folio->private=
;
>
>                         spin_lock_irqsave(&ffs->state_lock, flags);
>                         ffs->read_pages_pending -=3D nr_pages;
> @@ -2844,8 +2845,7 @@ static int f2fs_read_data_large_folio(struct inode =
*inode,
>         pgoff_t index, offset, next_pgofs =3D 0;
>         unsigned max_nr_pages =3D rac ? readahead_count(rac) :
>                                 folio_nr_pages(folio);
> -       unsigned int nrpages;
> -       struct f2fs_folio_state *ffs;
> +       unsigned int nrpages, len_blks;
>         int ret =3D 0;
>         bool folio_in_bio =3D false;
>
> @@ -2868,11 +2868,17 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
>         folio_in_bio =3D false;
>         index =3D folio->index;
>         offset =3D 0;
> -       ffs =3D NULL;
>         nrpages =3D folio_nr_pages(folio);
>
> -       for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
> +       for (; nrpages;
> +            nrpages -=3D len_blks, max_nr_pages -=3D len_blks,
> +            index +=3D len_blks, offset +=3D len_blks) {
>                 sector_t block_nr;
> +               bool whole_folio_in_bio;
> +               unsigned int i;
> +
> +               len_blks =3D 1;
> +
>                 /*
>                  * Map blocks using the previous result first.
>                  */
> @@ -2901,13 +2907,31 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
>  got_it:
>                 if ((map.m_flags & F2FS_MAP_MAPPED)) {
>                         block_nr =3D map.m_pblk + index - map.m_lblk;
> -                       if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), bloc=
k_nr,
> +
> +                       len_blks =3D min_t(unsigned int, nrpages, max_nr_=
pages);
> +                       len_blks =3D min_t(unsigned int, len_blks,
> +                                       (unsigned int)(map.m_lblk + map.m=
_len - index));
> +
> +                       for (i =3D 0; i < len_blks; i++) {
> +                               if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inod=
e),
> +                                               block_nr + i,
>                                                 DATA_GENERIC_ENHANCE_READ=
)) {
> -                               ret =3D -EFSCORRUPTED;
> -                               goto err_out;
> +                                       ret =3D -EFSCORRUPTED;
> +                                       goto err_out;
> +                               }
>                         }
> +
> +                       /*
> +                        * If an entire folio is added to one bio,
> +                        * folio_end_read() can complete the folio read s=
tatus
> +                        * without relying on f2fs_folio_state.
> +                        */
> +                       whole_folio_in_bio =3D offset =3D=3D 0 &&
> +                                       len_blks =3D=3D folio_nr_pages(fo=
lio);
> +
>                 } else {
>                         size_t page_offset =3D offset << PAGE_SHIFT;
> +
>                         folio_zero_range(folio, page_offset, PAGE_SIZE);
>                         if (vi && !fsverity_verify_blocks(vi, folio, PAGE=
_SIZE, page_offset)) {
>                                 ret =3D -EIO;
> @@ -2917,15 +2941,13 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
>                 }
>
>                 /* We must increment read_pages_pending before possible B=
IOs submitting
> -                * to prevent from premature folio_end_read() call on fol=
io
> +                * to prevent from premature folio_end_read() call on fol=
io.
>                  */
> -               if (folio_test_large(folio)) {
> -                       ffs =3D f2fs_ffs_find_or_alloc(folio);
> +               if (folio_test_large(folio) && !whole_folio_in_bio) {

Hi Nanzhe,

I found a hang issue caused by the whole_folio_in_bio optimization
during my local 16KB page-4KB block testing:

Plz, check the whole_folio_in_bio optimization is safe for the below condit=
ions.
1. read_blocks_pending underflow: If a folio already has ffs attached
(from previous writes/holes/reads), whole_folio_in_bio skips
incrementing read_blocks_pending.
When the BIO completes, f2fs_finish_read_bio() still decrements it,
underflowing the counter.
2. BIO split risk: If a large folio BIO gets split by the block/crypto
layer, f2fs_finish_read_bio() would call folio_end_read() prematurely
on the first completing piece.

Thanks,

> +                       f2fs_ffs_find_or_alloc(folio);
>
>                         /* set the bitmap to wait */
> -                       spin_lock_irq(&ffs->state_lock);
> -                       ffs->read_pages_pending++;
> -                       spin_unlock_irq(&ffs->state_lock);
> +                       f2fs_update_read_folio_pending(folio, len_blks);
>                 }
>
>                 /*
> @@ -2949,17 +2971,20 @@ static int f2fs_read_data_large_folio(struct inod=
e *inode,
>                  * If the page is under writeback, we need to wait for
>                  * its completion to see the correct decrypted data.
>                  */
> -               f2fs_wait_on_block_writeback(inode, block_nr);
> +               for (i =3D 0; i < len_blks; i++)
> +                       f2fs_wait_on_block_writeback(inode, block_nr + i)=
;
>
> -               if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(ino=
de)),
> +               if (!bio_add_folio(bio, folio,
> +                               len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode))=
,
>                                 offset << PAGE_SHIFT))
>                         goto submit_and_realloc;
>
>                 folio_in_bio =3D true;
> -               inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
> +               for (i =3D 0; i < len_blks; i++)
> +                       inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>                 f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_I=
O,
> -                               F2FS_BLKSIZE(F2FS_I_SB(inode)));
> -               last_block_in_bio =3D block_nr;
> +                               len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode))=
);
> +               last_block_in_bio =3D block_nr + len_blks - 1;
>         }
>         trace_f2fs_read_folio(folio, DATA);
>  err_out:
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
