Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794093914;
	b=oiSgHNZSL0dRvSDTx5HeGGN7AzEsnVsBUsMsM53R7BLT1LL5CeM2iZGSpGNe1tsFkOeZ
	 NENdlAJkScy21aqWWrP6UZxdSYW/r6mIzSsKEIanOGoiv2Vb+EUOj+6sE1cHeaW/ZUvWd
	 B7/RCWuvFBbF/y5Rle3q+4DM63Am/HqLm3+gsd/CuBzz1nZm42cxsByZ5HDs2f9pty+9e
	 y8ehbFRnwTmgYpRE0y995ZgHDb7bnzGNIuq4R5m+YsoXCTM0K+9fAfJL4rMboqrTb6OnL
	 VmMmOgOCwVAs5x8QFgfQ8ZuTvqXeQ+9yXGuo50esIsdhxmcJRgTqArMGohe0tiBflnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uRs0yQmeASrtBIrKnYaQSWcQ1SPsdSF+VpmIeXFwytM=;
	b=ER7GSNm3MSJQRV/C2NI/QX2lOiVny0RtQxLGYXmTwMWuxlGrcIqtzEv8HWEcVtQ4avE7
	 0JmTebP/qyPj+Aznq+JK8btxbA3E/VK/+V1j9xEevMhBQvw9HFsRjDAAzhvFJK6L0r82J
	 I18Lildv4XQJXGJHNyzI1gbAyU9iO04onRoMa5ltYwKzVeKWBXynYb9ShuooVmUZHwjbK
	 Be+xhAuKutaRJHbWkpCNgE4a7fpZa5EeD4HhjBy1LBwo9K9DY53cz8pIPikxJC2qVltU9
	 NgOOAgeNuwWLn3w3VTc7vx1HLIzwDcaTV2yQiTDRTFFicZoQPV9pjLC79DyNPX7DQsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ux+VvTNz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F18606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F18606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ux+VvTNz
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a49a022221so517761fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794093911; cv=none;
        d=google.com; s=arc-20260327;
        b=k9LN26lCouXN8SXPKT3PpToUhidJ4grW2mTlsv7qQcAoDUEpCMY+vNca9Zlhn9myOH
         MI3reGmyxosaOxZWgCUo4tMuFT7nyI/BsNqNNmd7TroK0XKlRCf+t4yqntnOEEs2Xzr+
         afMG2rgpNzTWMBrOHF+UXdPfgQ1m2aNEI44XTwH3qyQbIBytkrtQRSrFh/QZncT4Lqm3
         Le21vkySPxzc1Rzju8KJwFzRYQc2ieDxI9mQNOMB0mbLydu/wQ9dUNEthUdMdDsjwn2k
         EYPKFTxE92C5DxSCA3x2BcKzDd57rYAnM6JJcICgQnYioi1QVFQkS7Usc39zIxqeRekV
         kPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uRs0yQmeASrtBIrKnYaQSWcQ1SPsdSF+VpmIeXFwytM=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=Wh7Q12sv1f5NMwQWg5k8seyNcnqXcdQCBXLmvnnPyNcAK+elFoNPlgSk3J375cu8Vu
         ojZYttlMvaONslOmQYK5ZYjJuBMfLscVn3J9L+r0wJjdhIwtns6HuOLnqg/vJq8drzxp
         c4wVyWyICrGGgOZGROQ2gTE052kPPh0otwdO5SgYoxrw7xKMRNQAhp2qbthBzZexeK+m
         qO/TfYexCtXYPtQoAh7IOXGUEN8m8Cks51+4U2KnvclWm4DYjyLiqd94f/S6iSBD/uta
         8IjfRKU1P1aXlq6GxVDM1b/LndGjvZmtc5sD0g6ucdiAlytOSlq1uNm1yYfKrOrYz34g
         3oUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093911; x=1794698711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRs0yQmeASrtBIrKnYaQSWcQ1SPsdSF+VpmIeXFwytM=;
        b=Ux+VvTNzux5JNEuioTw/Dl91rMgsf4rOpuVnX6tlfLfgd1k2vP3PofuIZ/cXhv0eR8
         wzu4vtrcmZ8NiNMEmJfpG2y+dsrezbaK5pbicPOMJc7NdA/GZazraiUgiReePUZUh4Yt
         u86Yj5cRfEDjxmroamylkfBP0faiIukeClvb96Te6SPqWQ76WStWNj1xrO7LcNe6n8gd
         gKXD3KawKjf4H+m0RMi1IzFHoBmZ6slFjUlLPdvk2z/qvYhJPjoU1Iz05YFndlRKJZdY
         O9WmbhKt7Jw33ufFCzEnmn8+ysNU4iJuUrZv/sQZOOByf7+mDTfwzZC1s3kWhV3drPN3
         NUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093911; x=1794698711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRs0yQmeASrtBIrKnYaQSWcQ1SPsdSF+VpmIeXFwytM=;
        b=dtoG80kfPsIPDExbZ6NTEi/ztM57IBVLdEdNrk8fZAdtrx/BBWFfqJCz9CJlXG/fke
         M1+u5Hw2HIqyo6675QmBIYj6pu4igTIc6g9ROuWs/lg3zocIcNL3eJvgh7exzwb23fKU
         nY0/DYzLJVVjfiUBDuZGfMppZZcXn+7mh76KcBlBTkzrHd2z0whC4iSzbAMVd5o1AjmW
         3I/IXrUe4f+IFkskFOD+XstmEldSxRlbs6i9xZMpoDmc63yMjTZehedqN6PHUIBbIsHq
         JmZQN4N19/az+13IEr8Dd8OOQe2zu6vT9vSQd9Kmjndbe+wf58hGntjnfeqYiv3yrccX
         2PTw==
X-Gm-Message-State: APuU4Z/pYf6MdWppYN57ob7TDgOS7mmrjZsg+nnxh6CrH7IcvhHJz+N8
	4zt7v98oftkqPp9mU/VnQGrtLxjxKklSESeWbOvRrQGieG5THNTWKBxS1UmA6pP8XcRkCzT5hEz
	E032uQczCKPCGi7DcNvoNcoHwm6M5SQ4=
X-Gm-Gg: AYBFou2WAEuHFyBF2x5pV6s4nTYtsih+FkwYsCD2Xo381MEEICOtheOKeQ5a7inI9/Q
	3YVIKeLWG7GHBI3KT8KsfA8ZC5aiieLzcvBV5+E0hnnJRX8L9xw8zanY/HcWfQu+shak0fD89pH
	BzayPpt3v36SUAsCl7XFffDS/TqAv6Up0cflJonIKchaJdkK+pY9iC6esDZ4R9vkkExnhBLAnke
	jjMzZ5y1FlNT5odTswAvTul3o6i2hSDCVFpawBfU2CsO/6bQzbxLho8AvxjPKXLUrS/TGOdvqrR
	iEuBldv6cuqUoY+6Fav9+c4SI9j3AZUVO0RxCW7xs34GSeEbb42uNezPeimWCWTeGsQjkEOImIl
	uqIHg+CGFQgB8nPFZEZXFleHUbYzeM33bnJvOmy+2ZUYV8kViYgi9/4CRqJdAEmspGuk3b/fUPY
	Txa4sgUHSMYNV8t5ANAwB6Z3kAPw==
X-Received: by 2002:a05:651c:31c9:b0:3ac:e902:f23c with SMTP id
 38308e7fff4ca-3adfa2387a5mr424981fa.0.1794093911066; Sat, 07 Nov 2026
 15:25:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-9-daeho43@gmail.com>
 <c5f90170-90b9-485f-852c-b85e9638f741@kernel.org>
In-Reply-To: <c5f90170-90b9-485f-852c-b85e9638f741@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 7 Nov 2026 15:24:58 -0800
X-Gm-Features: AclHuK-Y_k-ZFbbccHpB3Wf2w7XW3aMPkOrxvlAixXCf5ghPV9LDR-ypf7Ewz2o
Message-ID: <CACOAw_zfDubfF=U0ALSuNBkpU-tzUhQE_iyOq4CqarzFYYqQyg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 08/20] f2fs: adapt range operations and mmap
 for subpage blocks
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:54=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 11/3/26 03:39, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > - A writable PTE covers the whole folio, so page_mkwrite prepares
> >    every block of the folio up to EOF and dirties only those blocks.
> > - Align zero range, punch hole, preallocation and truncation to the
> >    block size instead of PAGE_SIZE. When i_size grows, write-protect th=
e
> >    folio straddling the old EOF so that stores to its new blocks fault
> >    into page_mkwrite.
> > - Unmap every base page overlapping a punched or zeroed range, and
> >    truncate the page cache without truncate_pagecache_range(), whose
> >    unmap underflows for a range ending in the first page.
> > - For SEEK_DATA, treat a NEW_ADDR block as data only if the block
> >    itself is dirty.
> > - When truncation zeroes the tail of a page, mark only the block
> >    holding the new EOF dirty, not the blocks after it.
>
> IIUC, we will call pagecache_isize_extended() after i_size updates.
>
> Will f2fs_zero_post_eof_page() cover this case? if it missed anything aft=
er we
> enable subpage block feature, how about fixing inside f2fs_zero_post_eof_=
page()?

Hi Chao,

They do different things. f2fs_zero_post_eof_page() runs before i_size
grows and zeroes the data past the old EOF. pagecache_isize_extended()
write-protects the folio straddling the old EOF, which may still be
mapped writable, so that mmap stores to the blocks between the old EOF
and the new size fault into ->page_mkwrite(), which prepares and dirties
them. It has to run after i_size is updated, otherwise a fault in
between could map the folio writable again with the old size, so it
cannot be done in f2fs_zero_post_eof_page(). It returns early when the
block size is not smaller than PAGE_SIZE, and this is how ext4 and xfs
use it as well; setattr already gets it through truncate_setsize().

>
> Minor cleanup comments below.

Will change them in v2.

Thanks,

>
> >
> > The SEEK_DATA change also applies to large folios when the block size
> > equals PAGE_SIZE.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/data.c |  58 +++++++++--
> >   fs/f2fs/f2fs.h |   4 +-
> >   fs/f2fs/file.c | 263 ++++++++++++++++++++++++++++++++----------------=
-
> >   3 files changed, 228 insertions(+), 97 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 41246f83b31d..77915a2eb190 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -3198,7 +3198,7 @@ bool f2fs_ffs_dirty_blk_range(struct folio *folio=
, unsigned int from,
> >
> >   static bool find_next_valid_block(const struct folio *folio,
> >                                 size_t orig_off, size_t *need_off,
> > -                               size_t len)
> > +                               size_t len, bool read_full)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_M_SB(folio->mapping);
> >       size_t start =3D orig_off;
> > @@ -3206,6 +3206,20 @@ static bool find_next_valid_block(const struct f=
olio *folio,
> >       size_t head, tail;
> >       pgoff_t index;
> >
> > +     /* Find every block that is not uptodate, not only the partial on=
es. */
> > +     if (read_full) {
> > +             for (head =3D round_down(*need_off, F2FS_BLKSIZE(sbi)); h=
ead < end;
> > +                  head +=3D F2FS_BLKSIZE(sbi)) {
> > +                     index =3D f2fs_folio_lblk(sbi, folio) +
> > +                             F2FS_BYTES_TO_BLK(sbi, head);
> > +                     if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> > +                             *need_off =3D head;
> > +                             return true;
> > +                     }
> > +             }
> > +             return false;
> > +     }
> > +
> >       if (start & (F2FS_BLKSIZE(sbi) - 1)) {
>
> F2FS_BLKSIZE_MASK(sbi)
>
> >               head =3D round_down(start, F2FS_BLKSIZE(sbi));
> >               index =3D f2fs_folio_lblk(sbi, folio) +
> > @@ -5222,7 +5236,8 @@ static bool f2fs_balance_fs_folio_locked(struct f=
olio *folio,
> >
> >   static int prepare_large_folio_write_begin(struct inode *inode,
> >                                         struct folio *folio, loff_t pos=
,
> > -                                       unsigned int len, bool *need_ba=
lance)
> > +                                       unsigned int len, bool read_ful=
l,
> > +                                       bool preallocated, bool *need_b=
alance)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       struct f2fs_folio_state *ffs;
> > @@ -5238,8 +5253,7 @@ static int prepare_large_folio_write_begin(struct=
 inode *inode,
> >        * Reserve blocks without f2fs_balance_fs() since the folio is lo=
cked;
> >        * the caller balances after unlocking it if *need_balance is set=
.
> >        */
> > -     if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL) &&
> > -         !IS_DEVICE_ALIASING(inode)) {
> > +     if (!preallocated && !IS_DEVICE_ALIASING(inode)) {
> >               pgoff_t first =3D F2FS_BYTES_TO_BLK(sbi, pos);
> >               pgoff_t last =3D F2FS_BLK_ALIGN(sbi, pos + len);
> >               pgoff_t idx;
> > @@ -5261,14 +5275,15 @@ static int prepare_large_folio_write_begin(stru=
ct inode *inode,
> >       /* Skip read if the folio is already fully uptodate or the write
> >        * covers the entire folio.
> >        */
> > -     if (folio_test_uptodate(folio) || len =3D=3D folio_size(folio))
> > +     if (folio_test_uptodate(folio) ||
> > +         (!read_full && len =3D=3D folio_size(folio)))
> >               return 0;
> >
> >       /*
> >        * Skip read if the write starts at a block boundary and reaches =
EOF,
> >        * and zero the rest of the folio instead.
> >        */
> > -     if (!f2fs_verity_in_progress(inode) &&
> > +     if (!read_full && !f2fs_verity_in_progress(inode) &&
> >           !(pos & (F2FS_BLKSIZE(sbi) - 1)) && (pos + len) >=3D i_size_r=
ead(inode)) {
>
> F2FS_BLKSIZE_MASK(sbi)
>
> >               size_t zoff =3D ori_off + len;
> >
> > @@ -5281,7 +5296,7 @@ static int prepare_large_folio_write_begin(struct=
 inode *inode,
> >       f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> >
> >       while (find_next_valid_block(folio, ori_off,
> > -                                  &need_off, len)) {
> > +                                  &need_off, len, read_full)) {
> >               struct dnode_of_data dn;
> >               pgoff_t index =3D f2fs_folio_lblk(sbi, folio) +
> >                               F2FS_BYTES_TO_BLK(sbi, need_off);
> > @@ -5382,6 +5397,20 @@ static int prepare_large_folio_atomic_write_begi=
n(struct inode *inode,
> >       return 0;
> >   }
> >
> > +int f2fs_prepare_subpage_mkwrite(struct inode *inode, struct folio *fo=
lio,
> > +                              loff_t pos, unsigned int len)
> > +{
> > +     bool need_balance =3D false;
> > +
> > +     /*
> > +      * mkwrite runs without inode_lock, so FI_PREALLOCATED_ALL may ha=
ve
> > +      * been set by a concurrent write() for a different range. It cal=
ls
> > +      * f2fs_balance_fs() before locking the folio, so ignore need_bal=
ance.
> > +      */
> > +     return prepare_large_folio_write_begin(inode, folio, pos, len, tr=
ue,
> > +                                            false, &need_balance);
> > +}
> > +
> >   static int f2fs_write_begin(const struct kiocb *iocb,
> >                           struct address_space *mapping,
> >                           loff_t pos, unsigned len, struct folio **foli=
op,
> > @@ -5490,7 +5519,9 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >                                       mapping, folio, pos, len, retried=
);
> >       } else {
> >               err =3D prepare_large_folio_write_begin(inode, folio, pos=
, blen,
> > -                                                   &need_balance);
> > +                             false,
> > +                             is_inode_flag_set(inode, FI_PREALLOCATED_=
ALL),
> > +                             &need_balance);
> >       }
> >       if (err) {
> >               if (err =3D=3D -EAGAIN) {
> > @@ -5566,6 +5597,7 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >                       struct folio *folio, void *fsdata)
> >   {
> >       struct inode *inode =3D folio->mapping->host;
> > +     loff_t old_size =3D i_size_read(inode);
> >
> >       trace_f2fs_write_end(inode, pos, len, copied);
> >
> > @@ -5595,6 +5627,8 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >               if (pos + copied > i_size_read(inode) &&
> >                               !f2fs_verity_in_progress(inode))
> >                       f2fs_i_size_write(inode, pos + copied);
> > +             if (i_size_read(inode) > old_size)
> > +                     pagecache_isize_extended(inode, old_size, pos);
> >               return copied;
> >       }
> >   #endif
> > @@ -5620,6 +5654,14 @@ static int f2fs_write_end(const struct kiocb *io=
cb,
> >   unlock_out:
> >       f2fs_folio_put(folio, true);
> >       f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> > +
> > +     /*
> > +      * The folio straddling the old EOF may still be mapped writable,=
 and
> > +      * the blocks between the old EOF and pos in it are not prepared.
> > +      * Write-protect it so that mmap stores to them fault.
> > +      */
> > +     if (i_size_read(inode) > old_size)
> > +             pagecache_isize_extended(inode, old_size, pos);
> >       return copied;
> >   }
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index aab1095ad5ff..8e3224eacdb5 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4094,7 +4094,7 @@ int f2fs_getattr(const struct mnt_idmap *idmap, c=
onst struct path *path,
> >                struct kstat *stat, u32 request_mask, unsigned int flags=
);
> >   int f2fs_setattr(const struct mnt_idmap *idmap, struct dentry *dentry=
,
> >                struct iattr *attr);
> > -int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t =
pg_end);
> > +int f2fs_truncate_hole(struct inode *inode, pgoff_t blk_start, pgoff_t=
 blk_end);
> >   void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int co=
unt);
> >   int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
> >                                               bool readonly, bool need_=
lock);
> > @@ -4539,6 +4539,8 @@ void f2fs_ffs_clear_subrange_uptodate(struct foli=
o *folio, size_t offset,
> >                                     size_t len);
> >   bool f2fs_ffs_dirty_blk_range(struct folio *folio, unsigned int from,
> >                             unsigned int to, unsigned int *start, unsig=
ned int *count);
> > +int f2fs_prepare_subpage_mkwrite(struct inode *inode, struct folio *fo=
lio,
> > +                              loff_t pos, unsigned int len);
> >   void f2fs_write_failed(struct inode *inode, loff_t to);
> >   void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t=
 length);
> >   bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index be548f39e33e..e68553cef777 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -41,18 +41,19 @@ static int fill_zero(struct inode *inode, pgoff_t i=
ndex,
> >
> >   static int do_zero_post_eof_page(struct inode *inode, loff_t new_size=
)
> >   {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       loff_t old_size =3D i_size_read(inode);
> >       unsigned int offset, len;
> > -     pgoff_t index;
> > +     pgoff_t bidx;
> >       int err;
> >
> > -     offset =3D old_size & (PAGE_SIZE - 1);
> > +     offset =3D old_size & (F2FS_BLKSIZE(sbi) - 1);
>
> F2FS_BLKSIZE_MASK(sbi)
>
> >
> >       if (!offset)
> >               return 0;
> >
> > -     len =3D min_t(loff_t, PAGE_SIZE - offset, new_size - old_size);
> > -     index =3D old_size >> PAGE_SHIFT;
> > +     len =3D min_t(loff_t, F2FS_BLKSIZE(sbi) - offset, new_size - old_=
size);
> > +     bidx =3D F2FS_BYTES_TO_BLK(sbi, old_size);
> >
> >       if (f2fs_has_inline_data(inode)) {
> >               /* data post eof should be always zero */
> > @@ -63,7 +64,7 @@ static int do_zero_post_eof_page(struct inode *inode,=
 loff_t new_size)
> >                       return err;
> >       }
> >
> > -     err =3D fill_zero(inode, index, offset, len);
> > +     err =3D fill_zero(inode, bidx, offset, len);
> >       if (err)
> >               return err;
> >       return filemap_write_and_wait_range(inode->i_mapping,
> > @@ -144,11 +145,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_=
fault *vmf)
> >       bool need_alloc =3D !f2fs_is_pinned_file(inode);
> >       pgoff_t pidx =3D folio->index + folio_page_idx(folio, vmf->page);
> >       loff_t pos =3D (loff_t)pidx << PAGE_SHIFT;
> > +     pgoff_t bidx =3D F2FS_BYTES_TO_BLK(sbi, pos + offset_in_page(vmf-=
>address));
> >       loff_t isize;
> >       loff_t folio_start;
> >       loff_t valid_end;
> >       size_t dirty_len;
> > -     size_t subpage_off;
> >       pgoff_t i, nr;
> >       int err =3D 0;
> >       vm_fault_t ret;
> > @@ -212,14 +213,12 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_=
fault *vmf)
> >       folio_lock(folio);
> >       isize =3D i_size_read(inode);
> >       folio_start =3D folio_pos(folio);
> > -     subpage_off =3D offset_in_folio(folio, pos);
> >       valid_end =3D min_t(loff_t, folio_start + folio_size(folio), isiz=
e);
> >       dirty_len =3D valid_end - folio_start;
> >
> >       if (unlikely(folio->mapping !=3D inode->i_mapping ||
> >                       pos >=3D isize ||
> > -                     !f2fs_ffs_test_blk_uptodate(folio,
> > -                     folio->index + (subpage_off >> PAGE_SHIFT)))) {
> > +                     !f2fs_ffs_test_blk_uptodate(folio, bidx))) {
> >               folio_unlock(folio);
> >               err =3D -EFAULT;
> >               goto out_sem;
> > @@ -240,6 +239,24 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_f=
ault *vmf)
> >
> >       nr =3D DIV_ROUND_UP(dirty_len, PAGE_SIZE);
> >
> > +     if (f2fs_has_subpage_blocks(sbi)) {
> > +             /*
> > +              * A writable PTE covers the whole base folio.  Like ext4=
's
> > +              * block_page_mkwrite(), prepare every filesystem block t=
hrough EOF
> > +              * before returning it writable, but dirty only those blo=
cks.  This
> > +              * prevents a later store in a sibling 4K block from bypa=
ssing block
> > +              * allocation while also keeping blocks beyond i_size cle=
an.
> > +              */
> > +             f2fs_folio_wait_writeback(folio, false, true);
> > +             err =3D f2fs_prepare_subpage_mkwrite(inode, folio,
> > +                                                folio_pos(folio), dirt=
y_len);
> > +             if (err) {
> > +                     folio_unlock(folio);
> > +                     goto out_sem;
> > +             }
> > +             goto zero_tail;
> > +     }
> > +
> >       for (i =3D 0; i < nr; i++) {
> >               err =3D f2fs_get_block_mkwrite(inode, folio, folio->index=
 + i,
> >                                            need_alloc);
> > @@ -249,6 +266,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fa=
ult *vmf)
> >               }
> >       }
> >
> > +zero_tail:
> >       /* page is wholly or partially inside EOF */
> >       if (folio_start + folio_size(folio) > isize) {
> >               size_t offset =3D offset_in_folio(folio, isize);
> > @@ -256,8 +274,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fa=
ult *vmf)
> >               folio_zero_segment(folio, offset, folio_size(folio));
> >       }
> >
> > -     if (folio_test_large(folio))
> > -             f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> > +     f2fs_ffs_mark_subrange_dirty(folio, 0, dirty_len);
> >       folio_mark_dirty(folio);
> >
> >       f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, dirty_len);
> > @@ -503,7 +520,9 @@ static bool __found_offset(struct address_space *ma=
pping,
> >   {
> >       block_t blkaddr =3D f2fs_data_blkaddr(dn);
> >       struct inode *inode =3D mapping->host;
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       bool compressed_cluster =3D false;
> > +     bool dirty =3D false;
> >
> >       if (f2fs_compressed_file(inode)) {
> >               block_t first_blkaddr =3D data_blkaddr(dn->inode, dn->nod=
e_entry,
> > @@ -512,12 +531,37 @@ static bool __found_offset(struct address_space *=
mapping,
> >               compressed_cluster =3D first_blkaddr =3D=3D COMPRESS_ADDR=
;
> >       }
> >
> > +     if (blkaddr =3D=3D NEW_ADDR) {
> > +             pgoff_t f_index =3D f2fs_lblk_to_folio_index(sbi, index);
> > +
> > +             if (xa_get_mark(&mapping->i_pages, f_index, PAGECACHE_TAG=
_DIRTY)) {
> > +                     struct folio *folio =3D filemap_get_folio(mapping=
, f_index);
> > +
> > +                     if (!IS_ERR(folio)) {
> > +                             /*
> > +                              * ffs is freed under the folio lock. We =
hold the
> > +                              * dnode, so only trylock the folio, and =
take the
> > +                              * block as dirty, as the dirty tag says,=
 if the
> > +                              * folio is busy.
> > +                              */
> > +                             if (folio_trylock(folio)) {
> > +                                     if (folio->mapping =3D=3D mapping=
)
> > +                                             dirty =3D f2fs_ffs_test_b=
lk_dirty(folio,
> > +                                                                     i=
ndex);
> > +                                     folio_unlock(folio);
> > +                             } else {
> > +                                     dirty =3D true;
> > +                             }
> > +                             f2fs_folio_put(folio, false);
> > +                     }
> > +             }
> > +     }
> > +
> >       switch (whence) {
> >       case SEEK_DATA:
> >               if (__is_valid_data_blkaddr(blkaddr))
> >                       return true;
> > -             if (blkaddr =3D=3D NEW_ADDR &&
> > -                 xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_D=
IRTY))
> > +             if (dirty)
> >                       return true;
> >               if (compressed_cluster)
> >                       return true;
> > @@ -815,20 +859,23 @@ void f2fs_truncate_data_blocks_range(struct dnode=
_of_data *dn, int count)
> >                                        dn->ofs_in_node, nr_free);
> >   }
> >
> > -static int truncate_partial_data_page(struct inode *inode, u64 from,
> > +static int truncate_partial_data_block(struct inode *inode, u64 from,
> >                                                               bool cach=
e_only)
> >   {
> > -     pgoff_t index =3D from >> PAGE_SHIFT;
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > +     pgoff_t bidx =3D F2FS_BYTES_TO_BLK(sbi, from);
> > +     pgoff_t f_index =3D f2fs_has_subpage_blocks(sbi) ?
> > +             f2fs_lblk_to_folio_index(sbi, bidx) : (from >> PAGE_SHIFT=
);
> >       struct address_space *mapping =3D inode->i_mapping;
> >       struct folio *folio;
> >       size_t folio_off;
> >       size_t blk_end;
> >
> > -     if (!(from & (PAGE_SIZE - 1)) && !cache_only)
> > +     if (!(from & (F2FS_BLKSIZE(sbi) - 1)) && !cache_only)
>
> F2FS_BLKSIZE_MASK(sbi)
>
> >               return 0;
> >
> >       if (cache_only) {
> > -             folio =3D filemap_lock_folio(mapping, index);
> > +             folio =3D filemap_lock_folio(mapping, f_index);
> >               if (IS_ERR(folio))
> >                      return 0;
> >               if (folio_test_uptodate(folio))
> > @@ -837,7 +884,7 @@ static int truncate_partial_data_page(struct inode =
*inode, u64 from,
> >               return 0;
> >       }
> >
> > -     folio =3D f2fs_get_lock_data_folio(inode, index, true);
> > +     folio =3D f2fs_get_lock_data_folio(inode, bidx, true);
> >       if (IS_ERR(folio))
> >               return PTR_ERR(folio) =3D=3D -ENOENT ? 0 : PTR_ERR(folio)=
;
> >   truncate_out:
> > @@ -848,14 +895,15 @@ static int truncate_partial_data_page(struct inod=
e *inode, u64 from,
> >       folio_zero_segment(folio, folio_off, blk_end);
> >
> >       /* An encrypted inode should have a key and truncate the last pag=
e. */
> > -     f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
> > +     f2fs_bug_on(sbi, cache_only && IS_ENCRYPTED(inode));
> >       if (!cache_only) {
> >               /*
> >                * The folio was read back above, so the subpage is
> > -              * already uptodate and dirty data stays valid.
> > +              * already uptodate and dirty data stays valid. Mark only
> > +              * the block holding the new EOF dirty.
> >                */
> >               f2fs_ffs_mark_subrange_dirty(folio, folio_off,
> > -                             blk_end - folio_off);
> > +                     round_up(folio_off, F2FS_BLKSIZE(sbi)) - folio_of=
f);
> >               folio_mark_dirty(folio);
> >       }
> >       f2fs_folio_put(folio, true);
> > @@ -944,9 +992,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u6=
4 from, bool lock)
> >       if (lock)
> >               f2fs_unlock_op(sbi, &lc);
> >   free_partial:
> > -     /* lastly zero out the first data page */
> > +     /* lastly zero out the first data block */
> >       if (!err)
> > -             err =3D truncate_partial_data_page(inode, from, truncate_=
page);
> > +             err =3D truncate_partial_data_block(inode, from, truncate=
_page);
>
> s/truncate_page/truncate_block ?
>
> Thanks,
>
> >   out_err:
> >       trace_f2fs_truncate_blocks_exit(inode, err);
> >       return err;
> > @@ -1310,7 +1358,7 @@ const struct inode_operations f2fs_file_inode_ope=
rations =3D {
> >       .fileattr_set   =3D f2fs_fileattr_set,
> >   };
> >
> > -static int fill_zero(struct inode *inode, pgoff_t index,
> > +static int fill_zero(struct inode *inode, pgoff_t bidx,
> >                                       loff_t start, loff_t len)
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > @@ -1324,15 +1372,14 @@ static int fill_zero(struct inode *inode, pgoff=
_t index,
> >       f2fs_balance_fs(sbi, true);
> >
> >       f2fs_lock_op(sbi, &lc);
> > -     folio =3D f2fs_get_new_data_folio(inode, NULL, index, false);
> > +     folio =3D f2fs_get_new_data_folio(inode, NULL, bidx, false);
> >       f2fs_unlock_op(sbi, &lc);
> >
> >       if (IS_ERR(folio))
> >               return PTR_ERR(folio);
> >
> >       f2fs_folio_wait_writeback(folio, true, true);
> > -     folio_off =3D offset_in_folio(folio,
> > -                                (loff_t)index << PAGE_SHIFT) + start;
> > +     folio_off =3D f2fs_folio_byte_offset(sbi, folio, bidx) + start;
> >       folio_zero_range(folio, folio_off, len);
> >       /*
> >        * This subpage must be uptodate here, which is guaranteed by
> > @@ -1344,41 +1391,68 @@ static int fill_zero(struct inode *inode, pgoff=
_t index,
> >       return 0;
> >   }
> >
> > -int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t =
pg_end)
> > +int f2fs_truncate_hole(struct inode *inode, pgoff_t blk_start, pgoff_t=
 blk_end)
> >   {
> >       int err;
> >
> > -     while (pg_start < pg_end) {
> > +     while (blk_start < blk_end) {
> >               struct dnode_of_data dn;
> >               pgoff_t end_offset, count;
> >
> >               set_new_dnode(&dn, inode, NULL, NULL, 0);
> > -             err =3D f2fs_get_dnode_of_data(&dn, pg_start, LOOKUP_NODE=
);
> > +             err =3D f2fs_get_dnode_of_data(&dn, blk_start, LOOKUP_NOD=
E);
> >               if (err) {
> >                       if (err =3D=3D -ENOENT) {
> > -                             pg_start =3D f2fs_get_next_block_offset(&=
dn,
> > -                                                             pg_start)=
;
> > +                             blk_start =3D f2fs_get_next_block_offset(=
&dn,
> > +                                                             blk_start=
);
> >                               continue;
> >                       }
> >                       return err;
> >               }
> >
> >               end_offset =3D ADDRS_PER_PAGE(dn.node_entry, inode);
> > -             count =3D min(end_offset - dn.ofs_in_node, pg_end - pg_st=
art);
> > +             count =3D min(end_offset - dn.ofs_in_node, blk_end - blk_=
start);
> >
> >               f2fs_bug_on(F2FS_I_SB(inode), count =3D=3D 0 || count > e=
nd_offset);
> >
> >               f2fs_truncate_data_blocks_range(&dn, count);
> >               f2fs_put_dnode(&dn);
> >
> > -             pg_start +=3D count;
> > +             blk_start +=3D count;
> >       }
> >       return 0;
> >   }
> >
> > +/*
> > + * unmap_mapping_range() computes page count solely from holelen, whic=
h causes
> > + * under-unmapping when start is not PAGE_SIZE aligned. Outward-align =
to PAGE_SIZE
> > + * to guarantee all overlapping base pages are unmapped.
> > + *
> > + * Then truncate the page cache without truncate_pagecache_range(), wh=
ose own
> > + * unmap underflows when the range ends in the first page and unmaps t=
he rest
> > + * of the file.
> > + */
> > +static void f2fs_truncate_pagecache_range(struct inode *inode,
> > +                                       loff_t start, loff_t end)
> > +{
> > +     struct address_space *mapping =3D inode->i_mapping;
> > +     loff_t unmap_start, unmap_len;
> > +
> > +     if (!f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
> > +             truncate_pagecache_range(inode, start, end - 1);
> > +             return;
> > +     }
> > +
> > +     unmap_start =3D round_down(start, PAGE_SIZE);
> > +     unmap_len =3D round_up(end, PAGE_SIZE) - unmap_start;
> > +     unmap_mapping_range(mapping, unmap_start, unmap_len, 0);
> > +     truncate_inode_pages_range(mapping, start, end - 1);
> > +}
> > +
> >   static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t=
 len)
> >   {
> > -     pgoff_t pg_start, pg_end;
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > +     pgoff_t blk_start, blk_end;
> >       loff_t off_start, off_end;
> >       int ret;
> >
> > @@ -1390,47 +1464,46 @@ static int f2fs_punch_hole(struct inode *inode,=
 loff_t offset, loff_t len)
> >       if (ret)
> >               return ret;
> >
> > -     pg_start =3D ((unsigned long long) offset) >> PAGE_SHIFT;
> > -     pg_end =3D ((unsigned long long) offset + len) >> PAGE_SHIFT;
> > +     blk_start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     blk_end =3D F2FS_BYTES_TO_BLK(sbi, offset + len);
> >
> > -     off_start =3D offset & (PAGE_SIZE - 1);
> > -     off_end =3D (offset + len) & (PAGE_SIZE - 1);
> > +     off_start =3D offset & F2FS_BLKSIZE_MASK(sbi);
> > +     off_end =3D (offset + len) & F2FS_BLKSIZE_MASK(sbi);
> >
> > -     if (pg_start =3D=3D pg_end) {
> > -             ret =3D fill_zero(inode, pg_start, off_start,
> > +     if (blk_start =3D=3D blk_end) {
> > +             ret =3D fill_zero(inode, blk_start, off_start,
> >                                               off_end - off_start);
> >               if (ret)
> >                       return ret;
> >       } else {
> >               if (off_start) {
> > -                     ret =3D fill_zero(inode, pg_start++, off_start,
> > -                                             PAGE_SIZE - off_start);
> > +                     ret =3D fill_zero(inode, blk_start++, off_start,
> > +                                             F2FS_BLKSIZE(sbi) - off_s=
tart);
> >                       if (ret)
> >                               return ret;
> >               }
> >               if (off_end) {
> > -                     ret =3D fill_zero(inode, pg_end, 0, off_end);
> > +                     ret =3D fill_zero(inode, blk_end, 0, off_end);
> >                       if (ret)
> >                               return ret;
> >               }
> >
> > -             if (pg_start < pg_end) {
> > -                     loff_t blk_start, blk_end;
> > -                     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > +             if (blk_start < blk_end) {
> > +                     loff_t byte_start, byte_end;
> >                       struct f2fs_lock_context lc;
> >
> >                       f2fs_balance_fs(sbi, true);
> >
> > -                     blk_start =3D (loff_t)pg_start << PAGE_SHIFT;
> > -                     blk_end =3D (loff_t)pg_end << PAGE_SHIFT;
> > +                     byte_start =3D F2FS_BLK_TO_BYTES(sbi, blk_start);
> > +                     byte_end =3D F2FS_BLK_TO_BYTES(sbi, blk_end);
> >
> >                       f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]=
);
> >                       filemap_invalidate_lock(inode->i_mapping);
> >
> > -                     truncate_pagecache_range(inode, blk_start, blk_en=
d - 1);
> > +                     f2fs_truncate_pagecache_range(inode, byte_start, =
byte_end);
> >
> >                       f2fs_lock_op(sbi, &lc);
> > -                     ret =3D f2fs_truncate_hole(inode, pg_start, pg_en=
d);
> > +                     ret =3D f2fs_truncate_hole(inode, blk_start, blk_=
end);
> >                       f2fs_unlock_op(sbi, &lc);
> >
> >                       filemap_invalidate_unlock(inode->i_mapping);
> > @@ -1621,7 +1694,7 @@ static int __clone_blkaddrs(struct inode *src_ino=
de, struct inode *dst_inode,
> >                       f2fs_folio_wait_writeback(fdst, true, true);
> >                       memcpy_folio(fdst, dst_off, fsrc, src_off,
> >                                   F2FS_BLKSIZE(sbi));
> > -                     if (folio_test_large(fdst)) {
> > +                     if (f2fs_is_multiblock_folio(sbi, fdst)) {
> >                               f2fs_ffs_mark_subrange_uptodate(fdst,
> >                                               dst_off, F2FS_BLKSIZE(sbi=
));
> >                               f2fs_ffs_mark_subrange_dirty(fdst, dst_of=
f,
> > @@ -1830,7 +1903,7 @@ static int f2fs_zero_range(struct inode *inode, l=
off_t offset, loff_t len,
> >   {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       struct address_space *mapping =3D inode->i_mapping;
> > -     pgoff_t index, pg_start, pg_end;
> > +     pgoff_t blk_start, blk_end;
> >       loff_t new_size =3D i_size_read(inode);
> >       loff_t off_start, off_end;
> >       int ret =3D 0;
> > @@ -1851,31 +1924,33 @@ static int f2fs_zero_range(struct inode *inode,=
 loff_t offset, loff_t len,
> >       if (ret)
> >               return ret;
> >
> > -     pg_start =3D ((unsigned long long) offset) >> PAGE_SHIFT;
> > -     pg_end =3D ((unsigned long long) offset + len) >> PAGE_SHIFT;
> > +     blk_start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     blk_end =3D F2FS_BYTES_TO_BLK(sbi, offset + len);
> >
> > -     off_start =3D offset & (PAGE_SIZE - 1);
> > -     off_end =3D (offset + len) & (PAGE_SIZE - 1);
> > +     off_start =3D offset & F2FS_BLKSIZE_MASK(sbi);
> > +     off_end =3D (offset + len) & F2FS_BLKSIZE_MASK(sbi);
> >
> > -     if (pg_start =3D=3D pg_end) {
> > -             ret =3D fill_zero(inode, pg_start, off_start,
> > +     if (blk_start =3D=3D blk_end) {
> > +             ret =3D fill_zero(inode, blk_start, off_start,
> >                                               off_end - off_start);
> >               if (ret)
> >                       return ret;
> >
> >               new_size =3D max_t(loff_t, new_size, offset + len);
> >       } else {
> > +             pgoff_t index;
> > +
> >               if (off_start) {
> > -                     ret =3D fill_zero(inode, pg_start++, off_start,
> > -                                             PAGE_SIZE - off_start);
> > +                     ret =3D fill_zero(inode, blk_start++, off_start,
> > +                                             F2FS_BLKSIZE(sbi) - off_s=
tart);
> >                       if (ret)
> >                               return ret;
> >
> >                       new_size =3D max_t(loff_t, new_size,
> > -                                     (loff_t)pg_start << PAGE_SHIFT);
> > +                                     F2FS_BLK_TO_BYTES(sbi, blk_start)=
);
> >               }
> >
> > -             for (index =3D pg_start; index < pg_end;) {
> > +             for (index =3D blk_start; index < blk_end;) {
> >                       struct dnode_of_data dn;
> >                       struct f2fs_lock_context lc;
> >                       unsigned int end_offset;
> > @@ -1884,9 +1959,9 @@ static int f2fs_zero_range(struct inode *inode, l=
off_t offset, loff_t len,
> >                       f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]=
);
> >                       filemap_invalidate_lock(mapping);
> >
> > -                     truncate_pagecache_range(inode,
> > -                             (loff_t)index << PAGE_SHIFT,
> > -                             ((loff_t)pg_end << PAGE_SHIFT) - 1);
> > +                     f2fs_truncate_pagecache_range(inode,
> > +                             F2FS_BLK_TO_BYTES(sbi, index),
> > +                             F2FS_BLK_TO_BYTES(sbi, blk_end));
> >
> >                       f2fs_lock_op(sbi, &lc);
> >
> > @@ -1900,7 +1975,7 @@ static int f2fs_zero_range(struct inode *inode, l=
off_t offset, loff_t len,
> >                       }
> >
> >                       end_offset =3D ADDRS_PER_PAGE(dn.node_entry, inod=
e);
> > -                     end =3D min(pg_end, end_offset - dn.ofs_in_node +=
 index);
> > +                     end =3D min(blk_end, end_offset - dn.ofs_in_node =
+ index);
> >
> >                       ret =3D f2fs_do_zero_range(&dn, index, end);
> >                       f2fs_put_dnode(&dn);
> > @@ -1916,11 +1991,11 @@ static int f2fs_zero_range(struct inode *inode,=
 loff_t offset, loff_t len,
> >
> >                       index =3D end;
> >                       new_size =3D max_t(loff_t, new_size,
> > -                                     (loff_t)index << PAGE_SHIFT);
> > +                                     F2FS_BLK_TO_BYTES(sbi, index));
> >               }
> >
> >               if (off_end) {
> > -                     ret =3D fill_zero(inode, pg_end, 0, off_end);
> > +                     ret =3D fill_zero(inode, blk_end, 0, off_end);
> >                       if (ret)
> >                               goto out;
> >
> > @@ -1930,10 +2005,14 @@ static int f2fs_zero_range(struct inode *inode,=
 loff_t offset, loff_t len,
> >
> >   out:
> >       if (new_size > i_size_read(inode)) {
> > -             if (mode & FALLOC_FL_KEEP_SIZE)
> > +             if (mode & FALLOC_FL_KEEP_SIZE) {
> >                       file_set_keep_isize(inode);
> > -             else
> > +             } else {
> > +                     loff_t old_size =3D i_size_read(inode);
> > +
> >                       f2fs_i_size_write(inode, new_size);
> > +                     pagecache_isize_extended(inode, old_size, new_siz=
e);
> > +             }
> >       }
> >       return ret;
> >   }
> > @@ -2034,7 +2113,7 @@ static int f2fs_expand_inode_data(struct inode *i=
node, loff_t offset,
> >                       .should_migrate_blocks =3D false,
> >                       .err_gc_skipped =3D true,
> >                       .nr_free_secs =3D 0 };
> > -     pgoff_t pg_start, pg_end;
> > +     pgoff_t blk_start, blk_end;
> >       loff_t new_size;
> >       loff_t off_end;
> >       block_t expanded =3D 0;
> > @@ -2054,12 +2133,12 @@ static int f2fs_expand_inode_data(struct inode =
*inode, loff_t offset,
> >
> >       f2fs_balance_fs(sbi, true);
> >
> > -     pg_start =3D ((unsigned long long)offset) >> PAGE_SHIFT;
> > -     pg_end =3D ((unsigned long long)offset + len) >> PAGE_SHIFT;
> > -     off_end =3D (offset + len) & (PAGE_SIZE - 1);
> > +     blk_start =3D F2FS_BYTES_TO_BLK(sbi, offset);
> > +     blk_end =3D F2FS_BYTES_TO_BLK(sbi, offset + len);
> > +     off_end =3D (offset + len) & F2FS_BLKSIZE_MASK(sbi);
> >
> > -     map.m_lblk =3D pg_start;
> > -     map.m_len =3D pg_end - pg_start;
> > +     map.m_lblk =3D blk_start;
> > +     map.m_len =3D blk_end - blk_start;
> >       if (off_end)
> >               map.m_len++;
> >
> > @@ -2071,9 +2150,9 @@ static int f2fs_expand_inode_data(struct inode *i=
node, loff_t offset,
> >               block_t sec_len;
> >
> >               if (map.m_lblk % sec_blks) {
> > -                     pg_start =3D rounddown(map.m_lblk, sec_blks);
> > -                     map.m_lblk =3D pg_start;
> > -                     map.m_len =3D pg_end - pg_start;
> > +                     blk_start =3D rounddown(map.m_lblk, sec_blks);
> > +                     map.m_lblk =3D blk_start;
> > +                     map.m_len =3D blk_end - blk_start;
> >                       if (off_end)
> >                               map.m_len++;
> >               }
> > @@ -2089,7 +2168,7 @@ static int f2fs_expand_inode_data(struct inode *i=
node, loff_t offset,
> >                               f2fs_warn_ratelimited(sbi,
> >                                       "ino:%llu, start:%lu, end:%lu, ne=
ed to trigger GC to "
> >                                       "reclaim enough free segment when=
 checkpoint is enabled",
> > -                                     inode->i_ino, pg_start, pg_end);
> > +                                     inode->i_ino, blk_start, blk_end)=
;
> >                               goto out_err;
> >                       }
> >               }
> > @@ -2135,20 +2214,24 @@ static int f2fs_expand_inode_data(struct inode =
*inode, loff_t offset,
> >               if (!expanded)
> >                       return err;
> >
> > -             last_off =3D pg_start + expanded - 1;
> > +             last_off =3D blk_start + expanded - 1;
> >
> >               /* update new size to the failed position */
> > -             new_size =3D (last_off =3D=3D pg_end) ? offset + len :
> > -                                     (loff_t)(last_off + 1) << PAGE_SH=
IFT;
> > +             new_size =3D (last_off =3D=3D blk_end) ? offset + len :
> > +                                     F2FS_BLK_TO_BYTES(sbi, last_off +=
 1);
> >       } else {
> > -             new_size =3D ((loff_t)pg_end << PAGE_SHIFT) + off_end;
> > +             new_size =3D F2FS_BLK_TO_BYTES(sbi, blk_end) + off_end;
> >       }
> >
> >       if (new_size > i_size_read(inode)) {
> > -             if (mode & FALLOC_FL_KEEP_SIZE)
> > +             if (mode & FALLOC_FL_KEEP_SIZE) {
> >                       file_set_keep_isize(inode);
> > -             else
> > +             } else {
> > +                     loff_t old_size =3D i_size_read(inode);
> > +
> >                       f2fs_i_size_write(inode, new_size);
> > +                     pagecache_isize_extended(inode, old_size, new_siz=
e);
> > +             }
> >       }
> >
> >       return err;
> > @@ -5758,8 +5841,12 @@ static ssize_t f2fs_dio_write_iter(struct kiocb =
*iocb, struct iov_iter *from,
> >
> >       if (ret < 0)
> >               goto out;
> > -     if (pos + ret > inode->i_size)
> > +     if (pos + ret > inode->i_size) {
> > +             loff_t old_size =3D inode->i_size;
> > +
> >               f2fs_i_size_write(inode, pos + ret);
> > +             pagecache_isize_extended(inode, old_size, pos + ret);
> > +     }
> >       if (!do_opu)
> >               set_inode_flag(inode, FI_UPDATE_WRITE);
> >
>
