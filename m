Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794346130;
	b=IDL0N+F2vrun641RNeOEYqLjuUforPbYHF+CAos/lB/hiA/bX4GoXhbf/bZMsSE/xbFs
	 khcQeTMpONs6RBd05beRrqXrXQFDDUDLJEJTbMKW2vO1V8P+j1D5L913sKRpu2FyTTVL8
	 t4BVyi3DzBl78XDu7mCJOctaFlkXTjWDpX5z7cUgMa6HiNtogQFj1vTd4uJflu1En12T5
	 2r367ItYjl0+xfdF58BitjYloPwALLOquR5W2QrstvrkJbOoslohdrQD8qxPWidoX3xrb
	 c18aFUFPnagkuMsNOv+3LqCWoRO7smnm2oMPCOY50SRHBbpXhlZBEwiG+DI5pLMmZ7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LYPY1on+LXtwfO8INcglAlZSfDZqIJjivgo2vzNViOg=;
	b=sKBP8WNz73peQID1DeTKo/6ZDbSJVGKpJaveY40FWoCX3r/JWObwDXuxvaevnJBqIDsu
	 99w+BmWijhZ2AihJ5Wdz6259SDozAffh8udoWGKAqeoCZomIWVQwc3dkJtbQXhp4y2DPh
	 6GxEiBfzDN9HGmfYK4fQBbC301Pcj/ePuW5Xplm6D+lE03CF3wGIDrZWJ+Rsh0TYHW5ro
	 BQgv9543Zv0nZG/pUhUDGvI5H2bji4xb/nhQ8VJTqYP7jVaUf2Ekrwzy81GY3c1YWx1RN
	 xdfHycehOqYG6vODwYaE65WDaccuLhzgsIzlPQwA1UnCGuCa7lDo3JdUE+I6ubMsGkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsVht0dr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA56D606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA56D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsVht0dr
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab53a99771so20937001fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794346128; cv=none;
        d=google.com; s=arc-20260327;
        b=lLcCmFGyJtlFr/p9ujB82ONR8KMLpyaThItrVxr/fR0+UZhZYIMrUn1+l6Bb06WlzT
         MEIZrgU7O7b0fUW9Juj6EEAkiw1l/aWdzXibxSwBav5JD4CTuqpq39Y9CBx78Y3kZLuH
         s/2wIt/1KYe3OSrkxSZXcvtx6IwA3Cy/wJXmdgZOCk/JCt4QGhVRYzolb5MKeCCucoKo
         B1tEpWWeNhzcaROHsYXaObWcCG6jAEf9YTvWulKE04Q3H7wtVUe7CEF4qgD+5DoAaltN
         qLVXOGQBbo5WyA0kJhp8whc+s3epLpGfsRlIGSXZKlj/Bp2DnGQxSKQIWAhE+Pd1iSnM
         SG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYPY1on+LXtwfO8INcglAlZSfDZqIJjivgo2vzNViOg=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=AupaBPEel4rsxQ040giiiVC4tGgBmhiDeSj5cjkGqY6+5tUUloBCUSTBVO0nIsthUA
         Z2dzUhXXDYlWXp1moXOBhz8rkUzEhx6mBmw1JeWh8IaaJB/oXBzhrgkuBCsJRVvrSUdA
         HMTmyL18lhraB4I/MloP03B7iumnuoBrgFMWg8puAJwpRemfkNZ6bWkkdkxDMIdlhLex
         THUOlfPUtKnQ85XQT8QfO8g7ny+h0lEv5OJU6gpLpiYlve+rdB1BVYSW6PxG5I4rHBmH
         XoyF2YaBtzx6OyeayaRv27pLvXPsiFizqW1Lfv8rqO2jxU3/3BaX6ktXkWJGFz9Z6BPE
         KbvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346128; x=1794950928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYPY1on+LXtwfO8INcglAlZSfDZqIJjivgo2vzNViOg=;
        b=DsVht0drg1od+uYb3/R0R1F/Iblwhgv8VlC88vJXz2yjVdXUA6gLjIg6xfDPml7iiR
         7dZVVi4Poj5kBH1SbQgX9Hisai2Czy5B8Y+7Wnwrg88iC/M7COKqBsoguGEMba0aiMyJ
         wsBAHawGOZ6rU34eumX2sW3Ff5Z7Lk7EHW4HpFDoOnRZmWjKVkl8fOqK2yHG31yEIg9+
         4uM5aCCeE+p/VpfdJIWcajx8DehSmmUBzWiPnlUvFh/YPD3mUr62ddgfmiIzAVZqKRb5
         olrWUGKV/UiahBcDT94H9tHIJC9/UzFzMjiqc4z6TB46TYaoO3RDNA66S209e7qYnymN
         cfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346128; x=1794950928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYPY1on+LXtwfO8INcglAlZSfDZqIJjivgo2vzNViOg=;
        b=Jh34Tgqe1nTYSocopBm8j4+e4e+9p9acNUGS9Fgsks6cM7O7kGFajZ05wKTtTsJOfV
         pPZ2AqO7xGArxVQCI+LJYjyateXVP1ZtN5gyMXaMc7owv0Gf5mXb7YqdAoQPrmDcJsUI
         jIhc5282WbCW0shcI1tWvtA2EPHmbclseRl9KEl72J8FjiI1TiLJ5a9wn+CJtIGnKq8s
         QPB1kbRfDZxtJyhJLZEc+CZVvKlsOhhtnMkQ1NYAYbniE5n6Pj/97xzrCj6j8NBOslti
         mtcr8GKVdqmkZOOjreykF2DnEB7YbN0fw2np6GEUYB2xlK79vEH1K4/fGgZpkGUcXf4m
         ZH4A==
X-Gm-Message-State: APuU4Z+Y7G1W7OhLieYaH0Qbe76My8PnZCe2stple3vSAI3CXThUo3CV
	KUTsWvkakPcOuDTiqBjksEfpiheaQQ3bJV9H72rlPWVHSuYGislwO4nThTxwzBUVwVgFnRNcK40
	WTRmUzexNvMtf4bBj7hal2eTu/7Mo+58=
X-Gm-Gg: AYBFou0L0fyXKr6uq3OLYE0Hq/T0/5JugKnmUBUQUrnvIQT5cIWoMkKN8uLzFBuOqYR
	0muzokIqwKEx/ZNRaaKqkMwFTbVp5gT7l0uCVaiogB1g8hZ9xGafs41RCrcj6a4kS0ZYlIhF2BP
	+fXAUrXv4U4iB/59OI/lN4fDGlmErMhBVTQy8VnWHele0z/4Ef0Ujeh9zPU5deS1ink8XYJO/0I
	bu292qgsZVML9reXZ9mp8VQpH28iYddhh9ttURVlaSW5yyLUD303PwIf8hLSZvwa6hOJOXXJYsD
	uns9TzPfmB4kBzfScGg57XyFDIVDIPqCUeqc31ESTe0u+EZJLn6iY+bbUCvSNpi0G50kfeCx3uK
	SqmlPKiCzlr+BZQ0lWoYVoo0q5g0Huxu08vz5QtQdvXTTcdEWmdNThn9NKQCdIhrqgE+mhYBmUO
	BLZSeaoY8AIGULdIenqesOI1/Pp+hViuTz/lW36cucOrjG
X-Received: by 2002:a2e:9fc6:0:b0:3ac:8a38:130e with SMTP id
 38308e7fff4ca-3ae1268e379mr221851fa.21.1794346127781; Tue, 10 Nov 2026
 13:28:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-16-daeho43@gmail.com>
 <32f2a9f7-2c87-4200-b562-61ae8d0ac91a@kernel.org>
In-Reply-To: <32f2a9f7-2c87-4200-b562-61ae8d0ac91a@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 10 Nov 2026 13:28:35 -0800
X-Gm-Features: AclHuK80ZR_G3xPhXYpic9tXQfUhoKuKQEWVw-SDymfT36_-Tb9P_2v4QYos5tM
Message-ID: <CACOAw_yHVVsLz=JYBR2+t8Cqr+MkWcrpHykM7CnGGOTkZT5tGA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 15/20] f2fs: support subpage blocks in atomic writes
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:50=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 11/3/26 03:39, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > Writeback already writes dirty blocks to the COW inode per block. Make
> > write_begin of atomic files reserve and read COW blocks per block as
> > well, and remove the -EOPNOTSUPP checks. Skipping the read of the
> > blocks that a write fully covers also applies to large folios when the
> > block size equals PAGE_SIZE.
>
> With this patch atomic files are allowed in subpage mode, so
> f2fs_abort_atomic_write(inode, true) can extend i_size back to
> original_i_size (e.g. after F2FS_IOC_START_ATOMIC_REPLACE set it to 0).
> FI_ATOMIC_FILE is cleared before i_size is restored and abort doesn't hol=
d
> invalidate_lock, so a racing mmap fault can run ->page_mkwrite() with the
> small i_size and map the folio writable; stores to its blocks between the
> old EOF and original_i_size then don't fault and aren't marked dirty.
> Should we call pagecache_isize_extended() after restoring i_size there, a=
s
> patch 08 does for the other i_size extension paths?
>
> Thanks,
>

Right, thanks for catching this.

There is one more problem in the same window. A read which instantiates
the folio there zero-fills the blocks beyond the small i_size and marks
them uptodate, while they have the original data on disk once i_size is
restored. pagecache_isize_extended() write-protects the folio, but it
does not drop these stale blocks.

So I'd rather close the window. In v2, the callers of
f2fs_abort_atomic_write() hold invalidate_lock across it, as
f2fs_ioc_start_atomic_write() does. Then neither ->page_mkwrite() nor a
read can see the page cache between dropping it and restoring i_size, and
no folio is left when the lock is released, so pagecache_isize_extended()
is not needed.

The eviction path is the only caller which doesn't take it, since no one
uses the page cache then.

> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/data.c | 24 ++++++++++++++++--------
> >  fs/f2fs/file.c |  5 +----
> >  2 files changed, 17 insertions(+), 12 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index a23fd4b01a4c..4e4d1b0d6004 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -4624,7 +4624,7 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
> >               }
> >
> >               if (f2fs_has_subpage_blocks(sbi) &&
> > -                 (f2fs_compressed_file(inode) || f2fs_is_atomic_file(i=
node))) {
> > +                 f2fs_compressed_file(inode)) {
> >                       WARN_ON_ONCE(1);
> >                       mapping_set_error(mapping, -EOPNOTSUPP);
> >                       folio_clear_dirty_for_io(folio);
> > @@ -5247,7 +5247,7 @@ static int prepare_large_folio_write_begin(struct=
 inode *inode,
> >       int err =3D 0;
> >
> >       if (f2fs_has_subpage_blocks(sbi) &&
> > -         (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode)))
> > +         f2fs_compressed_file(inode))
> >               return -EOPNOTSUPP;
> >
> >       /*
> > @@ -5359,13 +5359,16 @@ static int prepare_large_folio_atomic_write_beg=
in(struct inode *inode,
> >       /* Inline data must have been converted before reaching here. */
> >       f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> >
> > -     start =3D folio->index + (ori_off >> PAGE_SHIFT);
> > -     end =3D folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
> > +     start =3D f2fs_folio_lblk(sbi, folio) + (ori_off >> sbi->log_bloc=
ksize);
> > +     end =3D f2fs_folio_lblk(sbi, folio) +
> > +             ((ori_off + len - 1) >> sbi->log_blocksize);
> >
> >       for (index =3D start; index <=3D end; index++) {
> > +             loff_t block_start =3D F2FS_BLK_TO_BYTES(sbi, index);
> > +             loff_t block_end =3D block_start + F2FS_BLKSIZE(sbi);
> >               block_t blkaddr =3D NULL_ADDR;
> >               bool node_changed =3D false;
> > -             size_t off =3D (index - folio->index) << PAGE_SHIFT;
> > +             size_t off =3D f2fs_folio_byte_offset(sbi, folio, index);
> >
> >               err =3D prepare_atomic_write_begin(sbi, inode, index,
> >                                               &blkaddr, &node_changed,
> > @@ -5373,12 +5376,17 @@ static int prepare_large_folio_atomic_write_beg=
in(struct inode *inode,
> >               if (err)
> >                       return err;
> >
> > +             /* Skip read if the write covers the entire block. */
> > +             if (pos <=3D block_start && pos + len >=3D block_end)
> > +                     goto balance;
> > +
> >               if (f2fs_ffs_test_blk_uptodate(folio, index))
> >                       goto balance;
> >
> >               if (blkaddr =3D=3D NEW_ADDR) {
> > -                     folio_zero_segment(folio, off, off + PAGE_SIZE);
> > -                     f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_=
SIZE);
> > +                     folio_zero_segment(folio, off, off + F2FS_BLKSIZE=
(sbi));
> > +                     f2fs_ffs_mark_subrange_uptodate(folio, off,
> > +                                                     F2FS_BLKSIZE(sbi)=
);
> >                       goto balance;
> >               }
> >
> > @@ -5436,7 +5444,7 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >       }
> >
> >       if (f2fs_has_subpage_blocks(sbi) &&
> > -         (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) =
{
> > +         f2fs_compressed_file(inode)) {
> >               err =3D -EOPNOTSUPP;
> >               goto fail;
> >       }
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 1c440b5fa9bd..91f792cf879f 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2299,7 +2299,7 @@ static long f2fs_fallocate(struct file *file, int=
 mode,
> >       }
> >
> >       if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
> > -             if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(in=
ode)) {
> > +             if (f2fs_compressed_file(inode)) {
> >                       ret =3D -EOPNOTSUPP;
> >                       goto out;
> >               }
> > @@ -2553,9 +2553,6 @@ static int f2fs_ioc_start_atomic_write(struct fil=
e *filp, bool truncate)
> >       loff_t isize;
> >       int ret;
> >
> > -     if (f2fs_has_subpage_blocks(sbi))
> > -             return -EOPNOTSUPP;
> > -
> >       if (!(filp->f_mode & FMODE_WRITE))
> >               return -EBADF;
> >
>
