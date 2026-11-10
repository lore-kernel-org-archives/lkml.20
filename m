Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336322;
	b=U7ShBd+Y/cPnIslo4n+dCXp1tR2UEh+JWyiwGDCIk2WEma72xSopYTB1vT41+RC86H7C
	 Cn+WocJUDoi8j/WnEJn5tmHb2aATr9bPT3vJKrRIaV73KqqROluJT66u2PVSBKO67gLZB
	 DuVXnPgKvYjSEwL+wqK7vaqekfT2lkaKyDU/WP+3fnz1qCaVgxVT4ABT/MS3sAqbeCFj1
	 0ghcBgrMEBIRw5H8ajjmxrZvn4J2CJUG9BmamUWy33/ZE2L/rMo0E26psMCE443s3JY5j
	 r/dijlJc2/6q1mOpGTlvJCH1l0jL8gu12dwApYDR7jwYCQ5MHCQI2Y3O1QT1AzNlTwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DgEdCOlOkRD5splIPTiNpPB+JtzbgMVgwrhBWqMk6FI=;
	b=XIkm0/5u1lz111Mb7eQCJJoriXReacs61/r880FClPeZh5HfFgXrKNCNxU7PfL5XrYv0
	 zEmVufuplCmmD9VRCEEoA4ligK6rnpCfsLImUPzpQE7m3092m//HJCOpFsqWTN1WIyFUc
	 +t98+oBMdBoaCObcmTYFIkpMw2ujDAzy0wvqMrsprdcxaciTJCZyYe7z09Nte4M1wtgRc
	 Q/uAOLbQAb4xbMpVY/E3GyB/UlnOqPaSRlDEA89Fn2iSXAJgJZ9TJV8YxlnL+Xr5RoQNo
	 rYLoyZxL6La7zipMfQeiICHdpi2nwOh221k91RhNNiVfomqn3HLB6LghhiaWkIVqLYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgMzTI8x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21497606A336
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21497606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgMzTI8x
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab53a99771so19712671fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336319; cv=none;
        d=google.com; s=arc-20260327;
        b=s3QLOZhS9hwhhhCUoFZbLnkHD7OoKaZ48z7yItg3e6lZeZOS0TnjScW98MBljhRAOG
         RVgDcVFTl/g/iz9d9ryYUkOG6g4bCadlKY5K8PaCGslqtx9IA5ATtyLiFSFcdhXMKAzR
         puy/4/tnI93X4jzsUa3yJKlJ2MXXDAPXHHzecLTB/7iKAZw/HZszj5A/PLWp8aXGxdDs
         wzEDhUZOu/KBPhAfObqLKGYScuQYSV0/lKfdFZAXMBz8FuUFhrsRVYa/mssYl+jBPtV8
         TWog0mTFP33qZLSHYS89G6IS4ywW0twOEXhA4NGSOTLczRe4W3sspu0w6L1dbY0P4giS
         yaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DgEdCOlOkRD5splIPTiNpPB+JtzbgMVgwrhBWqMk6FI=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=Kwobeikls3Qp9VstjWG/KE2iCvA5hFM1JS4Zl9lGf+q6E6t7CtuQyLWh8vq44S3k9H
         a5Rjc42RVyXxdpFwYgfRenLCx1wH8uX3nTSx5paur40VvlaFJ8rEJfaakJQdjm3ji8P8
         3o3tUlnHhYSChQRPYk75PpB/dTzkAvcwPQIutq1DjZwFcujr1qKsvLrF2htpjOjMv3lf
         dE8N69FmRbsOcoPo76rT09xWFmyoyAlmq6KknwM63MuhafTTxUoSL2HzenXFUF9XpNKr
         YJg4UoNCiO5Foaikv16N3qchozoKc3QAvMyuUIL9oR0S8zqHa8pkEaJw1a4UDmlyQgUs
         1z4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336319; x=1794941119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgEdCOlOkRD5splIPTiNpPB+JtzbgMVgwrhBWqMk6FI=;
        b=sgMzTI8xLPTUOlTSRecm5IAokW2//oM/mRregTmHJDIbYU12YC1WMiaixAe8lbJas+
         JFhxDVlqj7WNrNxQecLvF01eEGs8BijA5Zntp/dpmnjFTTj7UN3+1BUugTokslbTsESc
         BKtJPotyjK30T/5Rw0J3JP5uHkl90owHTnSA6bI8qrO7SYe0NkA0t4jsuhEpd/2w54so
         YkN96BlSZw80rbbti06NCkYYMn4IMZljSwtwOJRk6xlrEiW5tktjRyv+MY4SowctGEU5
         eYnDkP0VaW5ukU+V8czOHoL2OvO5+bVVtQaPuridYBmBbb7k+bcbACRTPeoeUdyms8yH
         Z8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336319; x=1794941119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgEdCOlOkRD5splIPTiNpPB+JtzbgMVgwrhBWqMk6FI=;
        b=HZo83c/PlbStSe2cYH/hv9hEAzHdxMkeAF7FIwEow6zMKshWhHWNah14csDjlGR5mA
         66QJdfOdPfK3aWxR2MJGC3RzVY/D7Qi4T4CRqq7X3Z01W6yQNuvQ5xxkiVDoF9eEh5Lt
         SRA70YTqBmedNQ2McdEun5Je9uLbIsYbGQPDxwoWcy2s2srDkC3+20z/yLmc1V6JBtvL
         4ZFmA/gClv0RlVEspKkUhyWmX0TSnmSa38uUQZeA08oCc+l8hJ7KOzZRZRFBmSu6SZsM
         ZHXOfdfP2OmRu2abKpyPhQTMJcYPuefY4NE3w6G3NeXkLSwrO1mlsEa2alGXoC1J2uCJ
         wJJA==
X-Gm-Message-State: APuU4Z+es/63wSOsJ0r3EY+SnA8TZ/36QwU0SQSRgVX7ac701vx2QxW0
	Ew5CiErl6KVlTtBXS8Mlk/5IhXkBbe0qynqgIbDP0c43Z9a5QvNO3wEDgsCHyQQywb1FqiAC7Yf
	SjRpZCu1v00aDR5FjpgaPLso4ELks8Us=
X-Gm-Gg: AYBFou2rOvDk0B2SPrlw3XdkNRjf+7RmyvLl2WkDOxn3VyW8IGtM2JxuM2yKev132yO
	xHI2M3IybTIycurSVV8kx7XEJaRZWHZxc35Z6G6K1ad+V++G8fUK6cGzQ+88qJ5OOMN1GpD04tR
	KjEPxczQ0E3pxX0stt67pZ1OjPAR8GBXEpAGA3TVHs0Ve2vwooHZVC/tnDDd3HzPs/AHNXigHuR
	UZTXEeIzsphFotpHFp/eJ5/h7GedAmP6S5Euodwx2Rc7yrjgnbjY3xMb6uSYyM9/7hAGt9QzAnt
	cvOjjn75u0vNCHSfzOYBq6fmnpMdi1aOwoqg79jCKgPLrdTdTWj7Ha9lXMtgG2m9yvkuVZHvshi
	jgCTWkiwbm0Nqlggc72B2HoVilN17VehnSrkjw4cn0jNRtRH85vP7P7mcqZy8u0MMlbSPlylIZy
	vuFTBLnJcaklOtP/kQQOfVkFs=
X-Received: by 2002:a2e:bc03:0:b0:3ad:de02:e9a9 with SMTP id
 38308e7fff4ca-3ae09628030mr8750281fa.12.1794336317918; Tue, 10 Nov 2026
 10:45:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-19-daeho43@gmail.com>
 <4e4fcefa-5a23-4210-83bf-ff1227a6aa39@kernel.org>
In-Reply-To: <4e4fcefa-5a23-4210-83bf-ff1227a6aa39@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 10 Nov 2026 10:45:03 -0800
X-Gm-Features: AclHuK_hOcgqUmWkmSfw_-gTYUUppeJWJp3pNhapPEjIrFtXyZTpbS5tJE6_-s8
Message-ID: <CACOAw_x9dJ=qPP+s4aFhMZtqpwf1JM3nCm2H5PqF+VZk7t6PZQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 18/20] f2fs: support subpage blocks in compression
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:04=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 11/3/26 03:39, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > With subpage blocks, a cluster spans fewer folios than blocks, and
> > several compressed blocks share a bounce folio.
> >
> > - Require a cluster to cover at least one page.
> > - Use block offsets and sizes for compressed data, keep each compressed
> >   block at its block offset within the cluster, and count pending
> >   compressed I/O in blocks so that a shared bounce folio is not
> >   decompressed or freed early.
> > - Submit only the written block of a shared bounce folio in
> >   f2fs_submit_page_write(), at its offset in the folio.
> > - Keep compressed files on the page based read and write paths, and
> >   compress a cluster only when all of its blocks are dirty and below
> >   EOF.
> > - A folio with per-block state may hold uptodate blocks newer than the
> >   on-disk cluster, so decompress into a bounce page and copy back only
> >   the blocks that are not uptodate.
> > - Cache compressed blocks one block at a time in the compress cache.
> > - Lock only the unlocked pages in cancel_cluster_writeback() to avoid a
> >   self-deadlock.
> > - Attach a folio state to multi-block folios when compressed writeback
> >   starts, as the raw write path does. Otherwise the write completion,
> >   which does not hold the folio lock, can detach the page private flags
> >   while a task is moving them into a new folio state.
> > - Take sbi from the dic to count the blocks of a compressed page in
> >   f2fs_finish_read_bio().
> > - Write the blocks of a multi-block folio in
> >   f2fs_write_single_data_page() as f2fs_write_cache_folios() does,
> >   taking the write_blocks_pending bias with a new helper shared by the
> >   two and dropping it with f2fs_ffs_put_write_pending().
> > - Remove the -EOPNOTSUPP checks.
>
> static inline unsigned int min_compress_log_size(struct f2fs_sb_info *sbi=
)
> {
>         return max_t(unsigned int, MIN_COMPRESS_LOG_SIZE,
>                         F2FS_LOG_BLKS_PER_PAGE(sbi));
> }
>
>         if (ri->i_log_cluster_size < min_compress_log_size(sbi) ||
>                 ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
>                 f2fs_warn(sbi,
>                         "%s: inode (ino=3D%llx) has unsupported log clust=
er size: %u, run fsck to fix",
>
> It seems we limited the min compress log size w/ F2FS_LOG_BLKS_PER_PAGE, =
e.g. 16k
> page size, min compress cluster size is 16k, and for 64k page size, it is=
 64k, it
> will deny to load any compress inode that cluster size is smaller than 64=
k when we
> upgrade the kernel version, I think we need to declare it in commit messa=
ge and document.
>

Hi Chao,

Right. To be precise, the minimum changes only when a page has more than
four blocks, since MIN_COMPRESS_LOG_SIZE is already 2: with 4KB blocks,
it stays 16KB on a 16KB page kernel and becomes 64KB only on a 64KB page
kernel. A 4KB block image could not be mounted on a 64KB page kernel
before this series, so nothing changes for the existing users.

But failing the sanity check is wrong, since it reports a valid inode as
a corrupted one (SBI_NEED_FSCK, ERROR_CORRUPTED_INODE and "run fsck to
fix"). In v2, I'll keep the on-disk range check as it is, and make
f2fs_is_compress_backend_ready() return false for a cluster smaller than
a page, as for an unsupported compression algorithm. Then such a file can
still be looked up and removed, and opening it fails with -EOPNOTSUPP.
The mount option and F2FS_IOC_SET_COMPRESS_OPTION still reject a
compress_log_size smaller than a page.

I'll describe it in the commit message and in
Documentation/filesystems/f2fs.rst.

> >
> > The bounce folios are now freed when the last block of a cluster
> > completes, also when the block size equals PAGE_SIZE.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/compress.c | 520 +++++++++++++++++++++++++++++++--------------
> >  fs/f2fs/data.c     | 248 +++++++++++++--------
> >  fs/f2fs/f2fs.h     |  61 +++---
> >  fs/f2fs/file.c     |  65 +++---
> >  fs/f2fs/inode.c    |   2 +-
> >  fs/f2fs/super.c    |   7 +-
> >  6 files changed, 582 insertions(+), 321 deletions(-)
> >
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 0b0f31af6626..5b37ada5b111 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -57,14 +57,15 @@ struct f2fs_compress_ops {
> >       bool (*is_level_valid)(int level);
> >  };
> >
> > -static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t=
 index)
> > +static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t=
 lblk)
> >  {
> > -     return index & (cc->cluster_size - 1);
> > +     return (lblk & (cc->cluster_size - 1)) >>
> > +             F2FS_LOG_BLKS_PER_PAGE(F2FS_I_SB(cc->inode));
> >  }
> >
> > -static pgoff_t cluster_idx(struct compress_ctx *cc, pgoff_t index)
> > +static pgoff_t cluster_idx(struct compress_ctx *cc, pgoff_t lblk)
> >  {
> > -     return index >> cc->log_cluster_size;
> > +     return lblk >> cc->log_cluster_size;
> >  }
> >
> >  static pgoff_t start_idx_of_cluster(struct compress_ctx *cc)
> > @@ -114,7 +115,9 @@ static void f2fs_drop_rpages(struct compress_ctx *c=
c, int len, bool unlock)
> >
> >  static void f2fs_put_rpages(struct compress_ctx *cc)
> >  {
> > -     f2fs_drop_rpages(cc, cc->cluster_size, false);
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +
> > +     f2fs_drop_rpages(cc, cc->cluster_size >> F2FS_LOG_BLKS_PER_PAGE(s=
bi), false);
> >  }
> >
> >  static void f2fs_unlock_rpages(struct compress_ctx *cc, int len)
> > @@ -125,9 +128,11 @@ static void f2fs_unlock_rpages(struct compress_ctx=
 *cc, int len)
> >  static void f2fs_put_rpages_wbc(struct compress_ctx *cc,
> >               struct writeback_control *wbc, bool redirty, bool unlock)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> >       unsigned int i;
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> >               if (!cc->rpages[i])
> >                       continue;
> >               if (redirty)
> > @@ -158,22 +163,24 @@ void f2fs_destroy_compress_ctx(struct compress_ct=
x *cc, bool reuse)
> >       cc->rpages =3D NULL;
> >       cc->nr_rpages =3D 0;
> >       cc->nr_cpages =3D 0;
> > -     cc->valid_nr_cpages =3D 0;
> > +     cc->valid_nr_cblocks =3D 0;
> >       if (!reuse)
> >               cc->cluster_idx =3D NULL_CLUSTER;
> >  }
> >
> >  void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio =
*folio)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> >       unsigned int cluster_ofs;
> > +     pgoff_t lblk =3D f2fs_folio_lblk(sbi, folio);
> >
> > -     if (!f2fs_cluster_can_merge_page(cc, folio->index))
> > -             f2fs_bug_on(F2FS_I_SB(cc->inode), 1);
> > +     if (!f2fs_cluster_can_merge_block(cc, lblk))
> > +             f2fs_bug_on(sbi, 1);
> >
> > -     cluster_ofs =3D offset_in_cluster(cc, folio->index);
> > +     cluster_ofs =3D offset_in_cluster(cc, lblk);
> >       cc->rpages[cluster_ofs] =3D folio_page(folio, 0);
> >       cc->nr_rpages++;
> > -     cc->cluster_idx =3D cluster_idx(cc, folio->index);
> > +     cc->cluster_idx =3D cluster_idx(cc, lblk);
> >  }
> >
> >  #ifdef CONFIG_F2FS_FS_LZO
> > @@ -184,7 +191,7 @@ static int lzo_init_compress_ctx(struct compress_ct=
x *cc)
> >       if (!cc->private)
> >               return -ENOMEM;
> >
> > -     cc->clen =3D lzo1x_worst_compress(PAGE_SIZE << cc->log_cluster_si=
ze);
> > +     cc->clen =3D lzo1x_worst_compress(F2FS_BLKSIZE(F2FS_I_SB(cc->inod=
e)) << cc->log_cluster_size);
> >       return 0;
> >  }
> >
> > @@ -220,10 +227,11 @@ static int lzo_decompress_pages(struct decompress=
_io_ctx *dic)
> >               return -EIO;
> >       }
> >
> > -     if (dic->rlen !=3D PAGE_SIZE << dic->log_cluster_size) {
> > +     if (dic->rlen !=3D F2FS_BLKSIZE(dic->sbi) << dic->log_cluster_siz=
e) {
> >               f2fs_err_ratelimited(dic->sbi,
> >                               "lzo invalid rlen:%zu, expected:%lu",
> > -                             dic->rlen, PAGE_SIZE << dic->log_cluster_=
size);
> > +                             dic->rlen, (unsigned long)F2FS_BLKSIZE(di=
c->sbi) <<
> > +                                             dic->log_cluster_size);
> >               return -EIO;
> >       }
> >       return 0;
> > @@ -256,7 +264,7 @@ static int lz4_init_compress_ctx(struct compress_ct=
x *cc)
> >        * adapt worst compress case, because lz4 compressor can handle
> >        * output budget properly.
> >        */
> > -     cc->clen =3D cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> > +     cc->clen =3D cc->rlen - F2FS_BLKSIZE(F2FS_I_SB(cc->inode)) - COMP=
RESS_HEADER_SIZE;
> >       return 0;
> >  }
> >
> > @@ -300,10 +308,11 @@ static int lz4_decompress_pages(struct decompress=
_io_ctx *dic)
> >               return -EIO;
> >       }
> >
> > -     if (ret !=3D PAGE_SIZE << dic->log_cluster_size) {
> > +     if (ret !=3D F2FS_BLKSIZE(dic->sbi) << dic->log_cluster_size) {
> >               f2fs_err_ratelimited(dic->sbi,
> >                               "lz4 invalid ret:%d, expected:%lu",
> > -                             ret, PAGE_SIZE << dic->log_cluster_size);
> > +                             ret, (unsigned long)F2FS_BLKSIZE(dic->sbi=
) <<
> > +                                             dic->log_cluster_size);
> >               return -EIO;
> >       }
> >       return 0;
> > @@ -358,7 +367,7 @@ static int zstd_init_compress_ctx(struct compress_c=
tx *cc)
> >       cc->private =3D workspace;
> >       cc->private2 =3D stream;
> >
> > -     cc->clen =3D cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> > +     cc->clen =3D cc->rlen - F2FS_BLKSIZE(F2FS_I_SB(cc->inode)) - COMP=
RESS_HEADER_SIZE;
> >       return 0;
> >  }
> >
> > @@ -375,7 +384,7 @@ static int zstd_compress_pages(struct compress_ctx =
*cc)
> >       zstd_in_buffer inbuf;
> >       zstd_out_buffer outbuf;
> >       int src_size =3D cc->rlen;
> > -     int dst_size =3D src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> > +     int dst_size =3D src_size - F2FS_BLKSIZE(F2FS_I_SB(cc->inode)) - =
COMPRESS_HEADER_SIZE;
> >       int ret;
> >
> >       inbuf.pos =3D 0;
> > @@ -419,7 +428,7 @@ static int zstd_init_decompress_ctx(struct decompre=
ss_io_ctx *dic)
> >       void *workspace;
> >       unsigned int workspace_size;
> >       unsigned int max_window_size =3D
> > -                     MAX_COMPRESS_WINDOW_SIZE(dic->log_cluster_size);
> > +                     MAX_COMPRESS_WINDOW_SIZE(dic->sbi, dic->log_clust=
er_size);
> >
> >       workspace_size =3D zstd_dstream_workspace_bound(max_window_size);
> >
> > @@ -475,7 +484,7 @@ static int zstd_decompress_pages(struct decompress_=
io_ctx *dic)
> >               f2fs_err_ratelimited(dic->sbi,
> >                               "%s ZSTD invalid rlen:%zu, expected:%lu",
> >                               __func__, dic->rlen,
> > -                             PAGE_SIZE << dic->log_cluster_size);
> > +                             (unsigned long)F2FS_BLKSIZE(dic->sbi) << =
dic->log_cluster_size);
> >               return -EIO;
> >       }
> >
> > @@ -550,8 +559,6 @@ bool f2fs_is_compress_backend_ready(struct inode *i=
node)
> >  {
> >       if (!f2fs_compressed_file(inode))
> >               return true;
> > -     if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
> > -             return false;
> >       return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
> >  }
> >
> > @@ -621,13 +628,23 @@ static void *f2fs_vmap(struct page **pages, unsig=
ned int count)
> >       return buf;
> >  }
> >
> > +static void f2fs_vunmap(void *vaddr, unsigned int count)
> > +{
> > +     if (!vaddr)
> > +             return;
> > +     vm_unmap_ram((void *)((unsigned long)vaddr & PAGE_MASK), count);
> > +}
> > +
> >  static int f2fs_compress_pages(struct compress_ctx *cc)
> >  {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> >       struct f2fs_inode_info *fi =3D F2FS_I(cc->inode);
> >       const struct f2fs_compress_ops *cops =3D
> >                               f2fs_cops[fi->i_compress_algorithm];
> > -     unsigned int max_len, new_nr_cpages;
> > +     unsigned int max_len, new_cblocks;
> > +     unsigned int nr_rfolios, needed_folios;
> > +     unsigned int cbuf_blk_ofs =3D f2fs_has_subpage_blocks(sbi) ? 1 : =
0;
> > +     void *cbuf_vaddr;
> >       u32 chksum =3D 0;
> >       int i, ret;
> >
> > @@ -640,9 +657,12 @@ static int f2fs_compress_pages(struct compress_ctx=
 *cc)
> >                       goto out;
> >       }
> >
> > +     nr_rfolios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_PAGE(sbi);
> > +
> >       max_len =3D COMPRESS_HEADER_SIZE + cc->clen;
> > -     cc->nr_cpages =3D DIV_ROUND_UP(max_len, PAGE_SIZE);
> > -     cc->valid_nr_cpages =3D cc->nr_cpages;
> > +     cc->valid_nr_cblocks =3D DIV_ROUND_UP(max_len, F2FS_BLKSIZE(sbi))=
;
>
> F2FS_BLK_ALIGN(sbi, max_len)?

Will fix it.

>
> > +     cc->nr_cpages =3D DIV_ROUND_UP(cbuf_blk_ofs + cc->valid_nr_cblock=
s,
> > +                                     F2FS_BLKS_PER_PAGE(sbi));
> >
> >       cc->cpages =3D page_array_alloc(sbi, cc->nr_cpages);
> >       if (!cc->cpages) {
> > @@ -653,23 +673,24 @@ static int f2fs_compress_pages(struct compress_ct=
x *cc)
> >       for (i =3D 0; i < cc->nr_cpages; i++)
> >               cc->cpages[i] =3D f2fs_compress_alloc_page();
> >
> > -     cc->rbuf =3D f2fs_vmap(cc->rpages, cc->cluster_size);
> > +     cc->rbuf =3D f2fs_vmap(cc->rpages, nr_rfolios);
> >       if (!cc->rbuf) {
> >               ret =3D -ENOMEM;
> >               goto out_free_cpages;
> >       }
> >
> > -     cc->cbuf =3D f2fs_vmap(cc->cpages, cc->nr_cpages);
> > -     if (!cc->cbuf) {
> > +     cbuf_vaddr =3D f2fs_vmap(cc->cpages, cc->nr_cpages);
> > +     if (!cbuf_vaddr) {
> >               ret =3D -ENOMEM;
> >               goto out_vunmap_rbuf;
> >       }
> > +     cc->cbuf =3D cbuf_vaddr + (cbuf_blk_ofs << sbi->log_blocksize);
> >
> >       ret =3D cops->compress_pages(cc);
> >       if (ret)
> >               goto out_vunmap_cbuf;
> >
> > -     max_len =3D PAGE_SIZE * (cc->cluster_size - 1) - COMPRESS_HEADER_=
SIZE;
> > +     max_len =3D F2FS_BLKSIZE(sbi) * (cc->cluster_size - 1) - COMPRESS=
_HEADER_SIZE;
> >
> >       if (cc->clen > max_len) {
> >               ret =3D -EAGAIN;
> > @@ -685,17 +706,19 @@ static int f2fs_compress_pages(struct compress_ct=
x *cc)
> >       for (i =3D 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
> >               cc->cbuf->reserved[i] =3D cpu_to_le32(0);
> >
> > -     new_nr_cpages =3D DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, P=
AGE_SIZE);
> > +     new_cblocks =3D DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, F2F=
S_BLKSIZE(sbi));
> >
> > -     /* zero out any unused part of the last page */
> > +     /* zero out any unused part of the last block */
> >       memset(&cc->cbuf->cdata[cc->clen], 0,
> > -                     (new_nr_cpages * PAGE_SIZE) -
> > +                     (new_cblocks * F2FS_BLKSIZE(sbi)) -
> >                       (cc->clen + COMPRESS_HEADER_SIZE));
> >
> > -     vm_unmap_ram(cc->cbuf, cc->nr_cpages);
> > -     vm_unmap_ram(cc->rbuf, cc->cluster_size);
> > +     f2fs_vunmap(cc->cbuf, cc->nr_cpages);
> > +     f2fs_vunmap(cc->rbuf, nr_rfolios);
> >
> > -     for (i =3D new_nr_cpages; i < cc->nr_cpages; i++) {
> > +     needed_folios =3D DIV_ROUND_UP(cbuf_blk_ofs + new_cblocks,
> > +                                     F2FS_BLKS_PER_PAGE(sbi));
> > +     for (i =3D needed_folios; i < cc->nr_cpages; i++) {
> >               f2fs_compress_free_page(cc->cpages[i]);
> >               cc->cpages[i] =3D NULL;
> >       }
> > @@ -703,16 +726,16 @@ static int f2fs_compress_pages(struct compress_ct=
x *cc)
> >       if (cops->destroy_compress_ctx)
> >               cops->destroy_compress_ctx(cc);
> >
> > -     cc->valid_nr_cpages =3D new_nr_cpages;
> > +     cc->valid_nr_cblocks =3D new_cblocks;
> >
> >       trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
> >                                                       cc->clen, ret);
> >       return 0;
> >
> >  out_vunmap_cbuf:
> > -     vm_unmap_ram(cc->cbuf, cc->nr_cpages);
> > +     f2fs_vunmap(cc->cbuf, cc->nr_cpages);
> >  out_vunmap_rbuf:
> > -     vm_unmap_ram(cc->rbuf, cc->cluster_size);
> > +     f2fs_vunmap(cc->rbuf, nr_rfolios);
> >  out_free_cpages:
> >       for (i =3D 0; i < cc->nr_cpages; i++) {
> >               if (cc->cpages[i])
> > @@ -741,7 +764,7 @@ void f2fs_decompress_cluster(struct decompress_io_c=
tx *dic, bool in_task)
> >       const struct f2fs_compress_ops *cops =3D
> >                       f2fs_cops[fi->i_compress_algorithm];
> >       bool bypass_callback =3D false;
> > -     int ret;
> > +     int i, ret;
> >
> >       trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
> >                               dic->cluster_size, fi->i_compress_algorit=
hm);
> > @@ -758,9 +781,9 @@ void f2fs_decompress_cluster(struct decompress_io_c=
tx *dic, bool in_task)
> >       }
> >
> >       dic->clen =3D le32_to_cpu(dic->cbuf->clen);
> > -     dic->rlen =3D PAGE_SIZE << dic->log_cluster_size;
> > +     dic->rlen =3D F2FS_BLKSIZE(sbi) << dic->log_cluster_size;
> >
> > -     if (dic->clen > PAGE_SIZE * dic->nr_cpages - COMPRESS_HEADER_SIZE=
) {
> > +     if (dic->clen > F2FS_BLKSIZE(sbi) * dic->valid_nr_cblocks - COMPR=
ESS_HEADER_SIZE) {
> >               ret =3D -EFSCORRUPTED;
> >
> >               /* Avoid f2fs_commit_super in irq context */
> > @@ -787,6 +810,31 @@ void f2fs_decompress_cluster(struct decompress_io_=
ctx *dic, bool in_task)
> >               }
> >       }
> >
> > +     /*
> > +      * Folios with f2fs_folio_state were decompressed into bounce pag=
es.
> > +      * Copy only the blocks that are not uptodate, so that newer data=
 in
> > +      * the uptodate (possibly dirty) blocks is kept.
> > +      */
> > +     for (i =3D 0; !ret && i < dic->nr_rpages; i++) {
> > +             struct page *rpage =3D dic->rpages[i];
> > +             struct folio *folio;
> > +             pgoff_t lblk;
> > +             unsigned int b;
> > +
> > +             if (!rpage || dic->tpages[i] =3D=3D rpage)
> > +                     continue;
> > +
> > +             folio =3D page_folio(rpage);
> > +             lblk =3D f2fs_folio_lblk(sbi, folio);
> > +             for (b =3D 0; b < f2fs_blocks_per_folio(sbi, folio); b++)=
 {
> > +                     size_t off =3D (size_t)b << sbi->log_blocksize;
> > +
> > +                     if (!f2fs_ffs_test_blk_uptodate(folio, lblk + b))
> > +                             memcpy_page(rpage, off, dic->tpages[i], o=
ff,
> > +                                         F2FS_BLKSIZE(sbi));
> > +             }
> > +     }
> > +
> >  out_release:
> >       f2fs_release_decomp_mem(dic, bypass_callback, false);
> >
> > @@ -796,8 +844,8 @@ void f2fs_decompress_cluster(struct decompress_io_c=
tx *dic, bool in_task)
> >       f2fs_decompress_end_io(dic, ret, in_task);
> >  }
> >
> > -static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
> > -             struct folio *folio, nid_t ino, block_t blkaddr);
> > +static void f2fs_cache_compressed_block(struct f2fs_sb_info *sbi,
> > +             struct folio *folio, size_t offset, nid_t ino, block_t bl=
kaddr);
> >
> >  /*
> >   * This is called when a page of a compressed cluster has been read fr=
om disk
> > @@ -805,29 +853,35 @@ static void f2fs_cache_compressed_page(struct f2f=
s_sb_info *sbi,
> >   * page being waited on in the cluster, and if so, it decompresses the=
 cluster
> >   * (or in the case of a failure, cleans up without actually decompress=
ing).
> >   */
> > -void f2fs_end_read_compressed_page(struct folio *folio, bool failed,
> > -             block_t blkaddr, bool in_task)
> > +void f2fs_end_read_compressed_page(struct folio *folio, size_t offset,
> > +             bool failed, block_t blkaddr, unsigned int nr_blocks,
> > +             bool in_task)
> >  {
> >       struct decompress_io_ctx *dic =3D folio->private;
> >       struct f2fs_sb_info *sbi =3D dic->sbi;
> > +     int i;
> >
> > -     dec_cache_count(sbi, F2FS_RD_DATA);
> > +     sub_cache_counts(sbi, F2FS_RD_DATA, nr_blocks);
> >
> >       if (failed)
> >               WRITE_ONCE(dic->failed, true);
> > -     else if (blkaddr && in_task)
> > -             f2fs_cache_compressed_page(sbi, folio,
> > -                                     dic->inode->i_ino, blkaddr);
> > +     else if (blkaddr && in_task) {
> > +             for (i =3D 0; i < nr_blocks; i++)
> > +                     f2fs_cache_compressed_block(sbi, folio,
> > +                                     offset + i * F2FS_BLKSIZE(sbi),
> > +                                     dic->inode->i_ino,
> > +                                     blkaddr + i);
> > +     }
> >
> > -     if (atomic_dec_and_test(&dic->remaining_pages))
> > +     if (atomic_sub_and_test(nr_blocks, &dic->remaining_blocks))
> >               f2fs_decompress_cluster(dic, in_task);
> >  }
> >
> > -static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
> > +static bool is_block_in_cluster(struct compress_ctx *cc, pgoff_t lblk)
> >  {
> >       if (cc->cluster_idx =3D=3D NULL_CLUSTER)
> >               return true;
> > -     return cc->cluster_idx =3D=3D cluster_idx(cc, index);
> > +     return cc->cluster_idx =3D=3D cluster_idx(cc, lblk);
> >  }
> >
> >  bool f2fs_cluster_is_empty(struct compress_ctx *cc)
> > @@ -837,19 +891,40 @@ bool f2fs_cluster_is_empty(struct compress_ctx *c=
c)
> >
> >  static bool f2fs_cluster_is_full(struct compress_ctx *cc)
> >  {
> > -     return cc->cluster_size =3D=3D cc->nr_rpages;
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> > +     int i;
> > +
> > +     if (cc->nr_rpages !=3D nr_folios)
> > +             return false;
> > +
> > +     /* PG_dirty is cleared for writeback; without ffs it covered ever=
y block */
> > +     for (i =3D 0; i < nr_folios; i++) {
> > +             struct folio *folio =3D page_folio(cc->rpages[i]);
> > +             unsigned int nr_blocks =3D f2fs_blocks_per_folio(sbi, fol=
io);
> > +             unsigned int start, count;
> > +
> > +             if (f2fs_folio_has_ffs(folio) &&
> > +                 (!f2fs_ffs_dirty_blk_range(folio, 0, nr_blocks,
> > +                                            &start, &count) ||
> > +                  count !=3D nr_blocks))
> > +                     return false;
> > +     }
> > +     return true;
> >  }
> >
> > -bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t inde=
x)
> > +bool f2fs_cluster_can_merge_block(struct compress_ctx *cc, pgoff_t lbl=
k)
> >  {
> >       if (f2fs_cluster_is_empty(cc))
> >               return true;
> > -     return is_page_in_cluster(cc, index);
> > +     return is_block_in_cluster(cc, lblk);
> >  }
> >
> >  bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page =
**pages,
> >                               int index, int nr_pages, bool uptodate)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> >       unsigned long pgidx =3D page_folio(pages[index])->index;
> >       int i =3D uptodate ? 0 : 1;
> >
> > @@ -857,13 +932,13 @@ bool f2fs_all_cluster_page_ready(struct compress_=
ctx *cc, struct page **pages,
> >        * when uptodate set to true, try to check all pages in cluster i=
s
> >        * uptodate or not.
> >        */
> > -     if (uptodate && (pgidx % cc->cluster_size))
> > +     if (uptodate && (pgidx % nr_folios))
> >               return false;
> >
> > -     if (nr_pages - index < cc->cluster_size)
> > +     if (nr_pages - index < nr_folios)
> >               return false;
> >
> > -     for (; i < cc->cluster_size; i++) {
> > +     for (; i < nr_folios; i++) {
> >               struct folio *folio =3D page_folio(pages[index + i]);
> >
> >               if (folio->index !=3D pgidx + i)
> > @@ -877,17 +952,19 @@ bool f2fs_all_cluster_page_ready(struct compress_=
ctx *cc, struct page **pages,
> >
> >  static bool cluster_has_invalid_data(struct compress_ctx *cc)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> >       loff_t i_size =3D i_size_read(cc->inode);
> > -     unsigned nr_pages =3D DIV_ROUND_UP(i_size, PAGE_SIZE);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> >       int i;
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> >               struct page *page =3D cc->rpages[i];
> >
> > -             f2fs_bug_on(F2FS_I_SB(cc->inode), !page);
> > +             f2fs_bug_on(sbi, !page);
> >
> > -             /* beyond EOF */
> > -             if (page_folio(page)->index >=3D nr_pages)
> > +             /* any block beyond EOF */
> > +             if (folio_pos(page_folio(page)) +
> > +                 folio_size(page_folio(page)) - F2FS_BLKSIZE(sbi) >=3D=
 i_size)
> >                       return true;
> >       }
> >       return false;
> > @@ -1014,17 +1091,17 @@ static int f2fs_decompressed_blocks(struct inod=
e *inode,
> >  }
> >
> >  /* return whether cluster is compressed one or not */
> > -int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
> > +int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t lblk)
> >  {
> >       return __f2fs_cluster_blocks(inode,
> > -             index >> F2FS_I(inode)->i_log_cluster_size,
> > +             lblk >> F2FS_I(inode)->i_log_cluster_size,
> >               CLUSTER_IS_COMPR);
> >  }
> >
> >  /* return whether cluster contains non raw blocks or not */
> > -bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t index)
> > +bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t lblk)
> >  {
> > -     unsigned int cluster_idx =3D index >> F2FS_I(inode)->i_log_cluste=
r_size;
> > +     unsigned int cluster_idx =3D lblk >> F2FS_I(inode)->i_log_cluster=
_size;
> >
> >       return f2fs_decompressed_blocks(inode, cluster_idx) !=3D
> >               F2FS_I(inode)->i_cluster_size;
> > @@ -1045,34 +1122,57 @@ static bool cluster_may_compress(struct compres=
s_ctx *cc)
> >
> >  static void set_cluster_writeback(struct compress_ctx *cc)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> >       int i;
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > -             if (cc->rpages[i])
> > -                     set_page_writeback(cc->rpages[i]);
> > +     for (i =3D 0; i < nr_folios; i++) {
> > +             struct folio *folio;
> > +
> > +             if (!cc->rpages[i])
> > +                     continue;
> > +
> > +             folio =3D page_folio(cc->rpages[i]);
> > +             set_page_writeback(cc->rpages[i]);
> > +             /*
> > +              * Attach a folio state before the I/O, as the raw write =
path
> > +              * does, so that the write completion, which does not hol=
d the
> > +              * folio lock, never detaches the page private flags kept=
 in
> > +              * folio->private.
> > +              */
> > +             if (f2fs_is_multiblock_folio(sbi, folio))
> > +                     f2fs_ffs_find_or_alloc(folio);
> >       }
> >  }
> >
> >  static void cancel_cluster_writeback(struct compress_ctx *cc,
> > -                     struct compress_io_ctx *cic, int submitted)
> > +                     struct compress_io_ctx *cic, int failed_blk)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> >       int i;
> >
> >       /* Wait for submitted IOs. */
> > -     if (submitted > 1) {
> > +     if (failed_blk > 1) {
> >               f2fs_submit_merged_write(F2FS_I_SB(cc->inode), DATA);
> > -             while (atomic_read(&cic->pending_pages) !=3D
> > -                                     (cc->valid_nr_cpages - submitted =
+ 1))
> > +             while (atomic_read(&cic->pending_blocks) !=3D
> > +                                     (cc->valid_nr_cblocks - failed_bl=
k + 1))
> >                       f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT=
);
> >       }
> >
> > +     inode_add_dirty_blocks(cc->inode, failed_blk);
> > +
> >       /* Cancel writeback and stay locked. */
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> >               struct folio *folio =3D page_folio(cc->rpages[i]);
> > +             unsigned int last_blk_in_folio =3D
> > +                     ((i + 1) << F2FS_LOG_BLKS_PER_PAGE(sbi)) - 1;
> >
> > -             if (i < submitted) {
> > -                     inode_inc_dirty_block(cc->inode);
> > +             if (last_blk_in_folio < failed_blk) {
> >                       folio_lock(folio);
> > +                     /* f2fs_write_compressed_pages() cleared its dirt=
y blocks */
> > +                     if (f2fs_folio_has_ffs(folio))
> > +                             f2fs_ffs_mark_subrange_dirty(folio, 0, PA=
GE_SIZE);
>
> f2fs_ffs_mark_subrange_dirty(folio, 0, folio_size(folio));

Will fix it.

>
> >               }
> >               folio_clear_f2fs_gcing(folio);
> >               if (folio_test_writeback(folio))
> > @@ -1082,21 +1182,26 @@ static void cancel_cluster_writeback(struct com=
press_ctx *cc,
> >
> >  static void set_cluster_dirty(struct compress_ctx *cc)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> >       int i;
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> >               struct folio *folio;
> >
> >               if (!cc->rpages[i])
> >                       continue;
> >               folio =3D page_folio(cc->rpages[i]);
> > +             /* The whole cluster is rewritten */
> > +             if (f2fs_folio_has_ffs(folio))
> > +                     f2fs_ffs_mark_subrange_dirty(folio, 0, folio_size=
(folio));
> >               folio_mark_dirty(folio);
> >               folio_set_f2fs_gcing(folio);
> >       }
> >  }
> >
> >  static int prepare_compress_overwrite(struct compress_ctx *cc,
> > -             struct page **pagep, pgoff_t index, void **fsdata)
> > +             struct page **pagep, pgoff_t lblk, void **fsdata)
> >  {
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> >       struct address_space *mapping =3D cc->inode->i_mapping;
> > @@ -1115,9 +1220,13 @@ static int prepare_compress_overwrite(struct com=
press_ctx *cc,
> >       if (ret)
> >               return ret;
> >
> > +     unsigned int nr_folios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER_=
PAGE(sbi);
> > +
> >       /* keep folio reference to avoid page reclaim */
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > -             folio =3D f2fs_filemap_get_folio(mapping, start_idx + i,
> > +     for (i =3D 0; i < nr_folios; i++) {
> > +             pgoff_t f_index =3D f2fs_lblk_to_folio_index(sbi, start_i=
dx) + i;
> > +
> > +             folio =3D f2fs_filemap_get_folio(mapping, f_index,
> >                               fgp_flag, GFP_NOFS);
> >               if (IS_ERR(folio)) {
> >                       ret =3D PTR_ERR(folio);
> > @@ -1147,10 +1256,12 @@ static int prepare_compress_overwrite(struct co=
mpress_ctx *cc,
> >                       goto out;
> >       }
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> > +             pgoff_t f_index =3D f2fs_lblk_to_folio_index(sbi, start_i=
dx) + i;
> > +
> >               f2fs_bug_on(sbi, cc->rpages[i]);
> >
> > -             folio =3D filemap_lock_folio(mapping, start_idx + i);
> > +             folio =3D filemap_lock_folio(mapping, f_index);
> >               if (IS_ERR(folio)) {
> >                       /* folio could be truncated */
> >                       goto release_and_retry;
> > @@ -1171,7 +1282,7 @@ static int prepare_compress_overwrite(struct comp=
ress_ctx *cc,
> >
> >       if (likely(!ret)) {
> >               *fsdata =3D cc->rpages;
> > -             *pagep =3D cc->rpages[offset_in_cluster(cc, index)];
> > +             *pagep =3D cc->rpages[offset_in_cluster(cc, lblk)];
> >               return cc->cluster_size;
> >       }
> >
> > @@ -1184,23 +1295,23 @@ static int prepare_compress_overwrite(struct co=
mpress_ctx *cc,
> >  }
> >
> >  int f2fs_prepare_compress_overwrite(struct inode *inode,
> > -             struct page **pagep, pgoff_t index, void **fsdata)
> > +             struct page **pagep, pgoff_t lblk, void **fsdata)
> >  {
> >       struct compress_ctx cc =3D {
> >               .inode =3D inode,
> >               .log_cluster_size =3D F2FS_I(inode)->i_log_cluster_size,
> >               .cluster_size =3D F2FS_I(inode)->i_cluster_size,
> > -             .cluster_idx =3D index >> F2FS_I(inode)->i_log_cluster_si=
ze,
> > +             .cluster_idx =3D lblk >> F2FS_I(inode)->i_log_cluster_siz=
e,
> >               .rpages =3D NULL,
> >               .nr_rpages =3D 0,
> >               .vi =3D NULL, /* can't write to fsverity files */
> >       };
> >
> > -     return prepare_compress_overwrite(&cc, pagep, index, fsdata);
> > +     return prepare_compress_overwrite(&cc, pagep, lblk, fsdata);
> >  }
> >
> >  bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
> > -                                     pgoff_t index, unsigned copied)
> > +                                     pgoff_t lblk, unsigned int copied=
)
> >
> >  {
> >       struct compress_ctx cc =3D {
> > @@ -1210,7 +1321,7 @@ bool f2fs_compress_write_end(struct inode *inode,=
 void *fsdata,
> >               .rpages =3D fsdata,
> >       };
> >       struct folio *folio =3D page_folio(cc.rpages[0]);
> > -     bool first_index =3D (index =3D=3D folio->index);
> > +     bool first_index =3D (lblk =3D=3D f2fs_folio_lblk(F2FS_I_SB(inode=
), folio));
> >
> >       if (copied)
> >               set_cluster_dirty(&cc);
> > @@ -1223,12 +1334,15 @@ bool f2fs_compress_write_end(struct inode *inod=
e, void *fsdata,
> >
> >  int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool =
lock)
> >  {
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       void *fsdata =3D NULL;
> >       struct page *pagep;
> >       struct page **rpages;
> >       int log_cluster_size =3D F2FS_I(inode)->i_log_cluster_size;
> > -     pgoff_t start_idx =3D from >> (PAGE_SHIFT + log_cluster_size) <<
> > +     pgoff_t start_idx =3D (from >> (sbi->log_blocksize + log_cluster_=
size)) <<
> >                                                       log_cluster_size;
> > +     unsigned int nr_folios =3D (1 << log_cluster_size) >>
> > +                                     F2FS_LOG_BLKS_PER_PAGE(sbi);
> >       int i;
> >       int err;
> >
> > @@ -1252,9 +1366,9 @@ int f2fs_truncate_partial_cluster(struct inode *i=
node, u64 from, bool lock)
> >
> >       rpages =3D fsdata;
> >
> > -     for (i =3D (1 << log_cluster_size) - 1; i >=3D 0; i--) {
> > +     for (i =3D nr_folios - 1; i >=3D 0; i--) {
> >               struct folio *folio =3D page_folio(rpages[i]);
> > -             loff_t start =3D (loff_t)folio->index << PAGE_SHIFT;
> > +             loff_t start =3D folio_pos(folio);
> >               loff_t offset =3D from > start ? from - start : 0;
> >
> >               folio_zero_segment(folio, offset, folio_size(folio));
> > @@ -1266,14 +1380,15 @@ int f2fs_truncate_partial_cluster(struct inode =
*inode, u64 from, bool lock)
> >       f2fs_compress_write_end(inode, fsdata, start_idx, true);
> >
> >       err =3D filemap_write_and_wait_range(inode->i_mapping,
> > -                     round_down(from, 1 << log_cluster_size << PAGE_SH=
IFT),
> > +                     round_down(from, 1 << log_cluster_size << sbi->lo=
g_blocksize),
> >                       LLONG_MAX);
> >       if (err)
> >               return err;
> >
> >       truncate_pagecache(inode, from);
> >
> > -     return f2fs_do_truncate_blocks(inode, round_up(from, PAGE_SIZE), =
lock);
> > +     return f2fs_do_truncate_blocks(inode, round_up(from, F2FS_BLKSIZE=
(sbi)),
> > +                                    lock);
> >  }
> >
> >  static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> > @@ -1303,8 +1418,9 @@ static int f2fs_write_compressed_pages(struct com=
press_ctx *cc,
> >       struct node_info ni;
> >       struct compress_io_ctx *cic;
> >       struct f2fs_lock_context lc;
> > +     unsigned int nr_rfolios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER=
_PAGE(sbi);
> >       pgoff_t start_idx =3D start_idx_of_cluster(cc);
> > -     unsigned int last_index =3D cc->cluster_size - 1;
> > +     unsigned int blk_idx, c_folio_idx, c_folio_ofs;
> >       loff_t psize;
> >       int i, err;
> >       bool quota_inode =3D IS_NOQUOTA(inode);
> > @@ -1338,10 +1454,10 @@ static int f2fs_write_compressed_pages(struct c=
ompress_ctx *cc,
> >                       goto out_put_dnode;
> >       }
> >
> > -     folio =3D page_folio(cc->rpages[last_index]);
> > +     folio =3D page_folio(cc->rpages[nr_rfolios - 1]);
> >       psize =3D folio_next_pos(folio);
> >
> > -     err =3D f2fs_get_node_info(fio.sbi, dn.nid, &ni, false);
> > +     err =3D f2fs_get_node_info(sbi, dn.nid, &ni, false);
> >       if (err)
> >               goto out_put_dnode;
> >
> > @@ -1353,18 +1469,30 @@ static int f2fs_write_compressed_pages(struct c=
ompress_ctx *cc,
> >
> >       cic->magic =3D F2FS_COMPRESSED_PAGE_MAGIC;
> >       cic->inode =3D inode;
> > -     atomic_set(&cic->pending_pages, cc->valid_nr_cpages);
> > -     cic->rpages =3D page_array_alloc(sbi, cc->cluster_size);
> > +     atomic_set(&cic->pending_blocks, cc->valid_nr_cblocks);
> > +     cic->rpages =3D page_array_alloc(sbi, nr_rfolios);
> >       if (!cic->rpages)
> >               goto out_put_cic;
> >
> > -     cic->nr_rpages =3D cc->cluster_size;
> > +     cic->nr_rpages =3D nr_rfolios;
> > +     cic->cpages =3D cc->cpages;
> > +     cic->nr_cpages =3D cc->nr_cpages;
> > +     cc->cpages =3D NULL;
> > +
> > +     for (i =3D 0; i < cic->nr_cpages; i++) {
> > +             pgoff_t fidx;
> > +
> > +             if (!cic->cpages[i])
> > +                     break;
> > +
> > +             fidx =3D f2fs_has_subpage_blocks(sbi) ?
> > +                             (f2fs_lblk_to_folio_index(sbi, start_idx)=
 + i) :
>
> It's better to explain why the start iv value is different in between sub=
page
> blocks and non subpage blocks case. I guess it's due to we still hold the=
 first
> unused block in cpage (the special block is tagged as COMPRESS_ADDR), rig=
ht?

Right, I'll move it into a helper with a comment, and use it in f2fs_alloc_=
dic()
as well.

Thanks,

>
> > +                             (start_idx + 1 + i);
> >
> > -     for (i =3D 0; i < cc->valid_nr_cpages; i++) {
> > -             f2fs_set_compressed_page(cc->cpages[i], inode,
> > -                             page_folio(cc->rpages[i + 1])->index, cic=
);
> > -             fio.compressed_page =3D cc->cpages[i];
> > +             f2fs_set_compressed_page(cic->cpages[i], inode, fidx, cic=
);
> > +     }
> >
> > +     for (i =3D 0; i < cc->valid_nr_cblocks; i++) {
> >               fio.old_blkaddr =3D data_blkaddr(dn.inode, dn.node_entry,
> >                                               dn.ofs_in_node + i + 1);
> >
> > @@ -1374,14 +1502,15 @@ static int f2fs_write_compressed_pages(struct c=
ompress_ctx *cc,
> >
> >       set_cluster_writeback(cc);
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++)
> > +     for (i =3D 0; i < nr_rfolios; i++)
> >               cic->rpages[i] =3D cc->rpages[i];
> >
> >       for (i =3D 0; i < cc->cluster_size; i++, dn.ofs_in_node++) {
> >               block_t blkaddr;
> > +             unsigned int r_idx =3D i >> F2FS_LOG_BLKS_PER_PAGE(sbi);
> >
> >               blkaddr =3D f2fs_data_blkaddr(&dn);
> > -             fio.folio =3D page_folio(cc->rpages[i]);
> > +             fio.folio =3D page_folio(cc->rpages[r_idx]);
> >               fio.old_blkaddr =3D blkaddr;
> >
> >               /* cluster header */
> > @@ -1397,7 +1526,7 @@ static int f2fs_write_compressed_pages(struct com=
press_ctx *cc,
> >               if (fio.compr_blocks && __is_valid_data_blkaddr(blkaddr))
> >                       fio.compr_blocks++;
> >
> > -             if (i > cc->valid_nr_cpages) {
> > +             if (i > cc->valid_nr_cblocks) {
> >                       if (__is_valid_data_blkaddr(blkaddr)) {
> >                               f2fs_invalidate_blocks(sbi, blkaddr, 1);
> >                               f2fs_update_data_blkaddr(&dn, NEW_ADDR);
> > @@ -1407,9 +1536,13 @@ static int f2fs_write_compressed_pages(struct co=
mpress_ctx *cc,
> >
> >               f2fs_bug_on(fio.sbi, blkaddr =3D=3D NULL_ADDR);
> >
> > -             fio.compressed_page =3D cc->cpages[i - 1];
> > +             blk_idx =3D f2fs_has_subpage_blocks(sbi) ? i : (i - 1);
> > +             c_folio_idx =3D blk_idx / F2FS_BLKS_PER_PAGE(sbi);
> > +             c_folio_ofs =3D blk_idx % F2FS_BLKS_PER_PAGE(sbi);
> > +
> > +             fio.compressed_page =3D cic->cpages[c_folio_idx];
> > +             fio.folio_offset =3D c_folio_ofs;
> >
> > -             cc->cpages[i - 1] =3D NULL;
> >               fio.submitted =3D 0;
> >               f2fs_outplace_write_data(&dn, &fio);
> >               if (unlikely(!fio.submitted)) {
> > @@ -1420,13 +1553,20 @@ static int f2fs_write_compressed_pages(struct c=
ompress_ctx *cc,
> >               (*submitted)++;
> >  unlock_continue:
> >               inode_dec_dirty_block(cc->inode);
> > -             folio_unlock(fio.folio);
> > +             if ((i + 1) % F2FS_BLKS_PER_PAGE(sbi) =3D=3D 0) {
> > +                     f2fs_ffs_clear_subrange_dirty_and_test(fio.folio,
> > +                                                            0, PAGE_SI=
ZE);
> > +                     folio_unlock(fio.folio);
> > +             }
> >       }
> >
> > +     /* count pages like the raw write path */
> > +     *submitted =3D DIV_ROUND_UP(*submitted, F2FS_BLKS_PER_PAGE(sbi));
> > +
> >       if (fio.compr_blocks)
> >               f2fs_i_compr_blocks_update(inode, fio.compr_blocks - 1, f=
alse);
> > -     f2fs_i_compr_blocks_update(inode, cc->valid_nr_cpages, true);
> > -     add_compr_block_stat(inode, cc->valid_nr_cpages);
> > +     f2fs_i_compr_blocks_update(inode, cc->valid_nr_cblocks, true);
> > +     add_compr_block_stat(inode, cc->valid_nr_cblocks);
> >
> >       set_inode_flag(cc->inode, FI_APPEND_WRITE);
> >
> > @@ -1442,13 +1582,18 @@ static int f2fs_write_compressed_pages(struct c=
ompress_ctx *cc,
> >       spin_unlock(&fi->i_size_lock);
> >
> >       f2fs_put_rpages(cc);
> > -     page_array_free(sbi, cc->cpages, cc->nr_cpages);
> > -     cc->cpages =3D NULL;
> >       f2fs_destroy_compress_ctx(cc, false);
> >       return 0;
> >
> >  out_free_page_array:
> > -     page_array_free(sbi, cic->rpages, cc->cluster_size);
> > +     page_array_free(sbi, cic->rpages, nr_rfolios);
> > +
> > +     for (i =3D 0; i < cic->nr_cpages; i++) {
> > +             if (!cic->cpages[i])
> > +                     continue;
> > +             f2fs_compress_free_page(cic->cpages[i]);
> > +     }
> > +     page_array_free(sbi, cic->cpages, cic->nr_cpages);
> >  out_put_cic:
> >       kmem_cache_free(cic_entry_slab, cic);
> >  out_put_dnode:
> > @@ -1459,18 +1604,21 @@ static int f2fs_write_compressed_pages(struct c=
ompress_ctx *cc,
> >       else
> >               f2fs_unlock_op(sbi, &lc);
> >  out_free:
> > -     for (i =3D 0; i < cc->valid_nr_cpages; i++) {
> > -             f2fs_compress_free_page(cc->cpages[i]);
> > -             cc->cpages[i] =3D NULL;
> > +     if (cc->cpages) {
> > +             for (i =3D 0; i < cc->nr_cpages; i++) {
> > +                     if (!cc->cpages[i])
> > +                             continue;
> > +                     f2fs_compress_free_page(cc->cpages[i]);
> > +             }
> > +             page_array_free(sbi, cc->cpages, cc->nr_cpages);
> > +             cc->cpages =3D NULL;
> >       }
> > -     page_array_free(sbi, cc->cpages, cc->nr_cpages);
> > -     cc->cpages =3D NULL;
> >       return -EAGAIN;
> >  }
> >
> > -void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
> > +void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio,
> > +                             unsigned int nr_blocks)
> >  {
> > -     struct page *page =3D &folio->page;
> >       struct f2fs_sb_info *sbi =3D bio->bi_private;
> >       struct compress_io_ctx *cic =3D folio->private;
> >       enum count_type type =3D WB_DATA_TYPE(folio, true);
> > @@ -1479,13 +1627,17 @@ void f2fs_compress_write_end_io(struct bio *bio=
, struct folio *folio)
> >       if (unlikely(bio->bi_status !=3D BLK_STS_OK))
> >               mapping_set_error(cic->inode->i_mapping, -EIO);
> >
> > -     f2fs_compress_free_page(page);
> > -
> > -     if (atomic_dec_return(&cic->pending_pages)) {
> > -             dec_cache_count(sbi, type);
> > +     if (!atomic_sub_and_test(nr_blocks, &cic->pending_blocks)) {
> > +             sub_cache_counts(sbi, type, nr_blocks);
> >               return;
> >       }
> >
> > +     for (i =3D 0; i < cic->nr_cpages; i++) {
> > +             if (cic->cpages[i])
> > +                     f2fs_compress_free_page(cic->cpages[i]);
> > +     }
> > +     page_array_free(sbi, cic->cpages, cic->nr_cpages);
> > +
> >       for (i =3D 0; i < cic->nr_rpages; i++) {
> >               struct folio *rfolio;
> >
> > @@ -1499,12 +1651,12 @@ void f2fs_compress_write_end_io(struct bio *bio=
, struct folio *folio)
> >       kmem_cache_free(cic_entry_slab, cic);
> >
> >       /*
> > -      * Make sure dec_cache_count() is the last access to sbi.
> > +      * Make sure sub_cache_counts() is the last access to sbi.
> >        * Once it drops the F2FS_WB_CP_DATA counter to zero, the
> >        * unmount thread can proceed to destroy sbi and
> >        * sbi->page_array_slab.
> >        */
> > -     dec_cache_count(sbi, type);
> > +     sub_cache_counts(sbi, type, nr_blocks);
> >  }
> >
> >  static int f2fs_write_raw_pages(struct compress_ctx *cc,
> > @@ -1517,10 +1669,12 @@ static int f2fs_write_raw_pages(struct compress=
_ctx *cc,
> >       struct f2fs_lock_context lc;
> >       int submitted, compr_blocks, i;
> >       int ret =3D 0;
> > +     unsigned int nr_folios =3D cc->cluster_size >>
> > +                                     F2FS_LOG_BLKS_PER_PAGE(sbi);
> >
> >       compr_blocks =3D f2fs_compressed_blocks(cc);
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> >               if (!cc->rpages[i])
> >                       continue;
> >
> > @@ -1535,7 +1689,7 @@ static int f2fs_write_raw_pages(struct compress_c=
tx *cc,
> >       if (compr_blocks > 0)
> >               f2fs_lock_op(sbi, &lc);
> >
> > -     for (i =3D 0; i < cc->cluster_size; i++) {
> > +     for (i =3D 0; i < nr_folios; i++) {
> >               struct folio *folio;
> >
> >               if (!cc->rpages[i])
> > @@ -1639,17 +1793,27 @@ static int f2fs_prepare_decomp_mem(struct decom=
press_io_ctx *dic,
> >               bool pre_alloc)
> >  {
> >       const struct f2fs_compress_ops *cops =3D f2fs_cops[dic->compress_=
algorithm];
> > +     unsigned int nr_rfolios =3D dic->cluster_size >> F2FS_LOG_BLKS_PE=
R_PAGE(dic->sbi);
> > +     unsigned int cbuf_blk_ofs =3D f2fs_has_subpage_blocks(dic->sbi) ?=
 1 : 0;
> > +     void *cbuf_vaddr;
> >       int i;
> >
> >       if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
> >               return 0;
> >
> > -     dic->tpages =3D page_array_alloc(dic->sbi, dic->cluster_size);
> > +     dic->tpages =3D page_array_alloc(dic->sbi, nr_rfolios);
> >       if (!dic->tpages)
> >               return -ENOMEM;
> >
> > -     for (i =3D 0; i < dic->cluster_size; i++) {
> > -             if (dic->rpages[i]) {
> > +     for (i =3D 0; i < nr_rfolios; i++) {
> > +             /*
> > +              * A folio with f2fs_folio_state may have uptodate blocks=
 newer
> > +              * than the on-disk cluster (e.g., dirty blocks left afte=
r a
> > +              * partial truncate). Decompress it into a bounce page in=
stead,
> > +              * see f2fs_decompress_cluster().
> > +              */
> > +             if (dic->rpages[i] &&
> > +                 !f2fs_folio_has_ffs(page_folio(dic->rpages[i]))) {
> >                       dic->tpages[i] =3D dic->rpages[i];
> >                       continue;
> >               }
> > @@ -1657,14 +1821,16 @@ static int f2fs_prepare_decomp_mem(struct decom=
press_io_ctx *dic,
> >               dic->tpages[i] =3D f2fs_compress_alloc_page();
> >       }
> >
> > -     dic->rbuf =3D f2fs_vmap(dic->tpages, dic->cluster_size);
> > +     dic->rbuf =3D f2fs_vmap(dic->tpages, nr_rfolios);
> >       if (!dic->rbuf)
> >               return -ENOMEM;
> >
> > -     dic->cbuf =3D f2fs_vmap(dic->cpages, dic->nr_cpages);
> > -     if (!dic->cbuf)
> > +     cbuf_vaddr =3D f2fs_vmap(dic->cpages, dic->nr_cpages);
> > +     if (!cbuf_vaddr)
> >               return -ENOMEM;
> >
> > +     dic->cbuf =3D cbuf_vaddr + (cbuf_blk_ofs << dic->sbi->log_blocksi=
ze);
> > +
> >       if (cops->init_decompress_ctx)
> >               return cops->init_decompress_ctx(dic);
> >
> > @@ -1675,6 +1841,7 @@ static void f2fs_release_decomp_mem(struct decomp=
ress_io_ctx *dic,
> >               bool bypass_destroy_callback, bool pre_alloc)
> >  {
> >       const struct f2fs_compress_ops *cops =3D f2fs_cops[dic->compress_=
algorithm];
> > +     unsigned int nr_rfolios =3D dic->cluster_size >> F2FS_LOG_BLKS_PE=
R_PAGE(dic->sbi);
> >
> >       if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
> >               return;
> > @@ -1682,11 +1849,15 @@ static void f2fs_release_decomp_mem(struct deco=
mpress_io_ctx *dic,
> >       if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
> >               cops->destroy_decompress_ctx(dic);
> >
> > -     if (dic->cbuf)
> > -             vm_unmap_ram(dic->cbuf, dic->nr_cpages);
> > +     if (dic->cbuf) {
> > +             f2fs_vunmap(dic->cbuf, dic->nr_cpages);
> > +             dic->cbuf =3D NULL;
> > +     }
> >
> > -     if (dic->rbuf)
> > -             vm_unmap_ram(dic->rbuf, dic->cluster_size);
> > +     if (dic->rbuf) {
> > +             f2fs_vunmap(dic->rbuf, nr_rfolios);
> > +             dic->rbuf =3D NULL;
> > +     }
> >  }
> >
> >  static void f2fs_free_dic(struct decompress_io_ctx *dic,
> > @@ -1697,13 +1868,17 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct=
 compress_ctx *cc)
> >       struct decompress_io_ctx *dic;
> >       pgoff_t start_idx =3D start_idx_of_cluster(cc);
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(cc->inode);
> > +     unsigned int nr_rfolios =3D cc->cluster_size >> F2FS_LOG_BLKS_PER=
_PAGE(sbi);
> > +     unsigned int cbuf_blk_ofs =3D f2fs_has_subpage_blocks(sbi) ? 1 : =
0;
> > +     unsigned int nr_cpages =3D DIV_ROUND_UP(cbuf_blk_ofs + cc->valid_=
nr_cblocks,
> > +                                     F2FS_BLKS_PER_PAGE(sbi));
> >       int i, ret;
> >
> >       dic =3D f2fs_kmem_cache_alloc(dic_entry_slab, GFP_F2FS_ZERO, fals=
e, sbi);
> >       if (!dic)
> >               return ERR_PTR(-ENOMEM);
> >
> > -     dic->rpages =3D page_array_alloc(sbi, cc->cluster_size);
> > +     dic->rpages =3D page_array_alloc(sbi, nr_rfolios);
> >       if (!dic->rpages) {
> >               kmem_cache_free(dic_entry_slab, dic);
> >               return ERR_PTR(-ENOMEM);
> > @@ -1713,33 +1888,38 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct=
 compress_ctx *cc)
> >       dic->inode =3D cc->inode;
> >       dic->sbi =3D sbi;
> >       dic->compress_algorithm =3D F2FS_I(cc->inode)->i_compress_algorit=
hm;
> > -     atomic_set(&dic->remaining_pages, cc->nr_cpages);
> > +     atomic_set(&dic->remaining_blocks, cc->valid_nr_cblocks);
> >       dic->cluster_idx =3D cc->cluster_idx;
> >       dic->cluster_size =3D cc->cluster_size;
> >       dic->log_cluster_size =3D cc->log_cluster_size;
> > -     dic->nr_cpages =3D cc->nr_cpages;
> > +     dic->valid_nr_cblocks =3D cc->valid_nr_cblocks;
> > +     dic->nr_cpages =3D nr_cpages;
> >       refcount_set(&dic->refcnt, 1);
> >       dic->failed =3D false;
> >       dic->vi =3D cc->vi;
> >
> > -     for (i =3D 0; i < dic->cluster_size; i++)
> > +     for (i =3D 0; i < nr_rfolios; i++)
> >               dic->rpages[i] =3D cc->rpages[i];
> > -     dic->nr_rpages =3D cc->cluster_size;
> > +     dic->nr_rpages =3D nr_rfolios;
> >
> > -     dic->cpages =3D page_array_alloc(sbi, dic->nr_cpages);
> > +     dic->cpages =3D page_array_alloc(sbi, nr_cpages);
> >       if (!dic->cpages) {
> >               ret =3D -ENOMEM;
> >               goto out_free;
> >       }
> >
> > -     for (i =3D 0; i < dic->nr_cpages; i++) {
> > +     for (i =3D 0; i < nr_cpages; i++) {
> >               struct page *page;
> > +             pgoff_t fidx =3D f2fs_has_subpage_blocks(sbi) ?
> > +                             (f2fs_lblk_to_folio_index(sbi, start_idx)=
 + i) :
> > +                             (start_idx + 1 + i);
> >
> >               page =3D f2fs_compress_alloc_page();
> > -             f2fs_set_compressed_page(page, cc->inode,
> > -                                     start_idx + i + 1, dic);
> > +             f2fs_set_compressed_page(page, cc->inode, fidx, dic);
> >               dic->cpages[i] =3D page;
> >       }
> > +     dic->valid_nr_cblocks =3D cc->valid_nr_cblocks;
> > +     dic->nr_cpages =3D nr_cpages;
> >
> >       ret =3D f2fs_prepare_decomp_mem(dic, true);
> >       if (ret)
> > @@ -1758,18 +1938,19 @@ static void f2fs_free_dic(struct decompress_io_=
ctx *dic,
> >       int i;
> >       /* use sbi in dic to avoid UFA of dic->inode*/
> >       struct f2fs_sb_info *sbi =3D dic->sbi;
> > +     unsigned int nr_rfolios =3D dic->cluster_size >> F2FS_LOG_BLKS_PE=
R_PAGE(sbi);
> >
> >       f2fs_release_decomp_mem(dic, bypass_destroy_callback, true);
> >
> >       if (dic->tpages) {
> > -             for (i =3D 0; i < dic->cluster_size; i++) {
> > -                     if (dic->rpages[i])
> > +             for (i =3D 0; i < nr_rfolios; i++) {
> > +                     if (dic->tpages[i] =3D=3D dic->rpages[i])
> >                               continue;
> >                       if (!dic->tpages[i])
> >                               continue;
> >                       f2fs_compress_free_page(dic->tpages[i]);
> >               }
> > -             page_array_free(sbi, dic->tpages, dic->cluster_size);
> > +             page_array_free(sbi, dic->tpages, nr_rfolios);
> >       }
> >
> >       if (dic->cpages) {
> > @@ -1812,15 +1993,19 @@ static void f2fs_verify_cluster(struct work_str=
uct *work)
> >       int i;
> >
> >       /* Verify, update, and unlock the decompressed pages. */
> > -     for (i =3D 0; i < dic->cluster_size; i++) {
> > +     for (i =3D 0; i < dic->nr_rpages; i++) {
> >               struct page *rpage =3D dic->rpages[i];
> >               struct folio *rfolio;
> >
> >               if (!rpage)
> >                       continue;
> >               rfolio =3D page_folio(rpage);
> > -             if (fsverity_verify_folio(dic->vi, rfolio))
> > +             if (fsverity_verify_folio(dic->vi, rfolio)) {
> > +                     if (f2fs_is_multiblock_folio(dic->sbi, rfolio))
> > +                             f2fs_ffs_mark_subrange_uptodate(rfolio, 0=
,
> > +                                                     folio_size(rfolio=
));
> >                       folio_mark_uptodate(rfolio);
> > +             }
> >               folio_unlock(rfolio);
> >       }
> >
> > @@ -1849,16 +2034,20 @@ void f2fs_decompress_end_io(struct decompress_i=
o_ctx *dic, bool failed,
> >       }
> >
> >       /* Update and unlock the cluster's pagecache pages. */
> > -     for (i =3D 0; i < dic->cluster_size; i++) {
> > +     for (i =3D 0; i < dic->nr_rpages; i++) {
> >               struct page *rpage =3D dic->rpages[i];
> >
> >               if (!rpage)
> >                       continue;
> >
> > -             if (failed)
> > +             if (failed) {
> >                       ClearPageUptodate(rpage);
> > -             else
> > +             } else {
> > +                     if (f2fs_is_multiblock_folio(dic->sbi, page_folio=
(rpage)))
> > +                             f2fs_ffs_mark_subrange_uptodate(page_foli=
o(rpage), 0,
> > +                                                             folio_siz=
e(page_folio(rpage)));
> >                       SetPageUptodate(rpage);
> > +             }
> >               unlock_page(rpage);
> >       }
> >
> > @@ -1916,8 +2105,8 @@ void f2fs_invalidate_compress_pages_range(struct =
f2fs_sb_info *sbi,
> >       f2fs_drop_cache_range(COMPRESS_CACHE(sbi), blkaddr, len, false);
> >  }
> >
> > -static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
> > -             struct folio *folio, nid_t ino, block_t blkaddr)
> > +static void f2fs_cache_compressed_block(struct f2fs_sb_info *sbi,
> > +             struct folio *folio, size_t offset, nid_t ino, block_t bl=
kaddr)
> >  {
> >       struct f2fs_cached_block *entry;
> >
> > @@ -1961,13 +2150,14 @@ static void f2fs_cache_compressed_page(struct f=
2fs_sb_info *sbi,
> >       }
> >
> >       entry->ino =3D ino;
> > -     memcpy(cache_address(entry), folio_address(folio), sbi->blocksize=
);
> > +     memcpy(cache_address(entry), folio_address(folio) + offset,
> > +                                                     sbi->blocksize);
> >       f2fs_cache_set_uptodate(entry);
> >       f2fs_put_cache(entry, true);
> >  }
> >
> > -bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio=
 *folio,
> > -                                                             block_t b=
lkaddr)
> > +bool f2fs_load_compressed_block(struct f2fs_sb_info *sbi, struct folio=
 *folio,
> > +                             size_t offset, block_t blkaddr)
> >  {
> >       struct f2fs_cached_block *entry;
> >       bool hitted =3D false;
> > @@ -1982,8 +2172,8 @@ bool f2fs_load_compressed_folio(struct f2fs_sb_in=
fo *sbi, struct folio *folio,
> >               if (f2fs_is_compress_cache(entry) &&
> >                               f2fs_cache_test_uptodate(entry)) {
> >                       atomic_inc(&sbi->compress_page_hit);
> > -                     memcpy(folio_address(folio),
> > -                             cache_address(entry), folio_size(folio));
> > +                     memcpy(folio_address(folio) + offset,
> > +                             cache_address(entry), sbi->blocksize);
> >                       hitted =3D true;
> >               }
> >               f2fs_put_cache(entry, true);
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index a7cc7231b572..869005dfb40b 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -150,12 +150,17 @@ static void f2fs_finish_read_bio(struct bio *bio,=
 bool in_task)
> >               bool finished =3D true;
> >               bool uptodate =3D bio->bi_status =3D=3D BLK_STS_OK;
> >
> > -             if (!folio_test_large(folio) &&
> > -                 f2fs_is_compressed_page(folio)) {
> > +             if (f2fs_is_compressed_page(folio)) {
> > +                     struct decompress_io_ctx *dic =3D folio->private;
> > +
> > +                     /* The cluster may be unlocked, so do not use its=
 inode. */
> > +                     nr_blocks =3D fi.length >> dic->sbi->log_blocksiz=
e;
> >                       if (ctx && !ctx->decompression_attempted)
> > -                             f2fs_end_read_compressed_page(folio, true=
, 0,
> > +                             f2fs_end_read_compressed_page(folio, fi.o=
ffset,
> > +                                                     true, 0, nr_block=
s,
> >                                                       in_task);
> > -                     f2fs_put_folio_dic(folio, in_task);
> > +                     while (nr_blocks--)
> > +                             f2fs_put_folio_dic(folio, in_task);
> >                       continue;
> >               }
> >
> > @@ -265,14 +270,18 @@ static void f2fs_handle_step_decompress(struct bi=
o_post_read_ctx *ctx,
> >
> >       bio_for_each_folio_all(fi, ctx->bio) {
> >               struct folio *folio =3D fi.folio;
> > +             struct f2fs_sb_info *sbi =3D F2FS_F_SB(folio);
> > +             unsigned int nr_blocks =3D fi.length >> sbi->log_blocksiz=
e;
> >
> > -             if (f2fs_is_compressed_page(folio))
> > -                     f2fs_end_read_compressed_page(folio, false, blkad=
dr,
> > -                                                   in_task);
> > -             else
> > +             if (f2fs_is_compressed_page(folio)) {
> > +                     f2fs_end_read_compressed_page(folio, fi.offset,
> > +                                                   false, blkaddr,
> > +                                                   nr_blocks, in_task)=
;
> > +             } else {
> >                       all_compressed =3D false;
> > +             }
> >
> > -             blkaddr++;
> > +             blkaddr +=3D nr_blocks;
> >       }
> >
> >       ctx->decompression_attempted =3D true;
> > @@ -425,7 +434,7 @@ static void f2fs_write_end_bio(struct bio *bio)
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >               if (f2fs_is_compressed_page(folio)) {
> > -                     f2fs_compress_write_end_io(bio, folio);
> > +                     f2fs_compress_write_end_io(bio, folio, nr_blocks)=
;
> >                       continue;
> >               }
> >  #endif
> > @@ -1337,9 +1346,14 @@ void f2fs_submit_page_write(struct f2fs_io_info =
*fio)
> >               io->fio =3D *fio;
> >       }
> >
> > -     bio_offset =3D bio_folio =3D=3D fio->folio ? F2FS_FIO_BIO_OFFSET(=
fio) : 0;
> > -     bio_len =3D bio_folio =3D=3D fio->folio ? F2FS_FIO_BIO_SIZE(fio) =
:
> > -                                         folio_size(bio_folio);
> > +     /* A compressed page holds several blocks with subpage blocks. */
> > +     if (bio_folio =3D=3D fio->folio || fio->compressed_page) {
> > +             bio_offset =3D F2FS_FIO_BIO_OFFSET(fio);
> > +             bio_len =3D F2FS_FIO_BIO_SIZE(fio);
> > +     } else {
> > +             bio_offset =3D 0;
> > +             bio_len =3D folio_size(bio_folio);
> > +     }
> >
> >       if (!bio_add_folio(io->bio, bio_folio, bio_len, bio_offset)) {
> >               __submit_merged_bio(io);
> > @@ -2728,7 +2742,7 @@ static int f2fs_read_single_page(struct inode *in=
ode, struct fsverity_info *vi,
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >  int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_re=
t,
> > -                             unsigned nr_pages, sector_t *last_block_i=
n_bio,
> > +                             unsigned int nr_blocks, sector_t *last_bl=
ock_in_bio,
> >                               struct readahead_control *rac, bool for_w=
rite)
> >  {
> >       struct dnode_of_data dn;
> > @@ -2765,7 +2779,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc=
, struct bio **bio_ret,
> >                       continue;
> >
> >               folio =3D page_folio(page);
> > -             if ((sector_t)folio->index >=3D last_block_in_file) {
> > +             if ((sector_t)f2fs_folio_lblk(sbi, folio) >=3D last_block=
_in_file) {
> >                       folio_zero_segment(folio, 0, folio_size(folio));
> >                       if (!folio_test_uptodate(folio))
> >                               folio_mark_uptodate(folio);
> > @@ -2811,14 +2825,14 @@ int f2fs_read_multi_pages(struct compress_ctx *=
cc, struct bio **bio_ret,
> >                       ret =3D -EFAULT;
> >                       goto out_put_dnode;
> >               }
> > -             cc->nr_cpages++;
> > +             cc->valid_nr_cblocks++;
> >
> >               if (!from_dnode && i >=3D ei.c_len)
> >                       break;
> >       }
> >
> >       /* nothing to decompress */
> > -     if (cc->nr_cpages =3D=3D 0) {
> > +     if (cc->valid_nr_cblocks =3D=3D 0) {
> >               ret =3D 0;
> >               goto out_put_dnode;
> >       }
> > @@ -2829,8 +2843,12 @@ int f2fs_read_multi_pages(struct compress_ctx *c=
c, struct bio **bio_ret,
> >               goto out_put_dnode;
> >       }
> >
> > -     for (i =3D 0; i < cc->nr_cpages; i++) {
> > -             struct folio *folio =3D page_folio(dic->cpages[i]);
> > +     for (i =3D 0; i < cc->valid_nr_cblocks; i++) {
> > +             unsigned int blk_idx =3D f2fs_has_subpage_blocks(sbi) ? (=
1 + i) : i;
> > +             unsigned int c_folio_idx =3D blk_idx / F2FS_BLKS_PER_PAGE=
(sbi);
> > +             unsigned int c_folio_ofs =3D blk_idx % F2FS_BLKS_PER_PAGE=
(sbi);
> > +             struct folio *folio =3D page_folio(dic->cpages[c_folio_id=
x]);
> > +             size_t offset =3D c_folio_ofs * blocksize;
> >               block_t blkaddr;
> >               struct bio_post_read_ctx *ctx;
> >
> > @@ -2840,8 +2858,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc=
, struct bio **bio_ret,
> >
> >               f2fs_wait_on_block_writeback(inode, blkaddr);
> >
> > -             if (f2fs_load_compressed_folio(sbi, folio, blkaddr)) {
> > -                     if (atomic_dec_and_test(&dic->remaining_pages)) {
> > +             if (f2fs_load_compressed_block(sbi, folio, offset, blkadd=
r)) {
> > +                     if (atomic_dec_and_test(&dic->remaining_blocks)) =
{
> >                               f2fs_decompress_cluster(dic, true);
> >                               break;
> >                       }
> > @@ -2850,7 +2868,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc=
, struct bio **bio_ret,
> >
> >               if (bio && (!page_is_mergeable(sbi, bio,
> >                                       *last_block_in_bio, blkaddr) ||
> > -                 !f2fs_crypt_mergeable_bio(bio, inode, folio->index, N=
ULL))) {
> > +                 !f2fs_crypt_mergeable_bio(bio, inode, start_idx + 1 +=
 i, NULL))) {
> >  submit_and_realloc:
> >                       f2fs_submit_read_bio(sbi, bio, DATA);
> >                       bio =3D NULL;
> > @@ -2858,11 +2876,11 @@ int f2fs_read_multi_pages(struct compress_ctx *=
cc, struct bio **bio_ret,
> >
> >               if (!bio)
> >                       bio =3D f2fs_grab_read_bio(inode, cc->vi, blkaddr=
,
> > -                                              nr_pages - i,
> > +                                              nr_blocks - i,
> >                                                f2fs_ra_op_flags(rac),
> > -                                              folio->index, for_write)=
;
> > +                                              start_idx + 1 + i, for_w=
rite);
> >
> > -             if (!bio_add_folio(bio, folio, blocksize, 0))
> > +             if (!bio_add_folio(bio, folio, blocksize, offset))
> >                       goto submit_and_realloc;
> >
> >               ctx =3D get_post_read_ctx(bio);
> > @@ -3525,7 +3543,7 @@ static int f2fs_mpage_readpages(struct inode *ino=
de, struct fsverity_info *vi,
> >               .rpages =3D NULL,
> >               .cpages =3D NULL,
> >               .nr_rpages =3D 0,
> > -             .nr_cpages =3D 0,
> > +             .valid_nr_cblocks =3D 0,
> >       };
> >       pgoff_t nc_cluster_idx =3D NULL_CLUSTER;
> >       pgoff_t index;
> > @@ -3535,14 +3553,19 @@ static int f2fs_mpage_readpages(struct inode *i=
node, struct fsverity_info *vi,
> >       unsigned max_nr_pages =3D nr_pages;
> >       int ret =3D 0;
> >
> > -     if (f2fs_has_multiblock_folios(inode))
> > +     if (mapping_large_folio_support(inode->i_mapping) ||
> > +         (f2fs_has_subpage_blocks(F2FS_I_SB(inode)) &&
> > +          !f2fs_compressed_file(inode)))
> >               return f2fs_read_data_large_folio(inode, vi, rac, folio);
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >       if (f2fs_compressed_file(inode)) {
> > +             unsigned int nr_rfolios =3D cc.cluster_size >>
> > +                             F2FS_LOG_BLKS_PER_PAGE(F2FS_I_SB(inode));
> > +
> >               index =3D rac ? readahead_index(rac) : folio->index;
> > -             max_nr_pages =3D round_up(index + nr_pages, cc.cluster_si=
ze) -
> > -                             round_down(index, cc.cluster_size);
> > +             max_nr_pages =3D round_up(index + nr_pages, nr_rfolios) -
> > +                             round_down(index, nr_rfolios);
> >       }
> >  #endif
> >
> > @@ -3564,16 +3587,16 @@ static int f2fs_mpage_readpages(struct inode *i=
node, struct fsverity_info *vi,
> >               f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> > -             index =3D folio->index;
> > +             pgoff_t f_lblk =3D f2fs_folio_lblk(F2FS_I_SB(inode), foli=
o);
> >
> >               if (!f2fs_compressed_file(inode))
> >                       goto read_single_page;
> >
> >               /* there are remained compressed pages, submit them */
> > -             if (!f2fs_cluster_can_merge_page(&cc, index)) {
> > +             if (!f2fs_cluster_can_merge_block(&cc, f_lblk)) {
> >                       cc.vi =3D vi;
> >                       ret =3D f2fs_read_multi_pages(&cc, &bio,
> > -                                             max_nr_pages,
> > +                                             max_nr_pages * F2FS_BLKS_=
PER_PAGE(F2FS_I_SB(inode)),
>
> max_nr_pages << F2FS_LOG_BLKS_PER_PAGE ?
>
> >                                               &last_block_in_bio,
> >                                               rac, false);
> >                       f2fs_destroy_compress_ctx(&cc, false);
> > @@ -3581,15 +3604,15 @@ static int f2fs_mpage_readpages(struct inode *i=
node, struct fsverity_info *vi,
> >                               goto set_error_page;
> >               }
> >               if (cc.cluster_idx =3D=3D NULL_CLUSTER) {
> > -                     if (nc_cluster_idx =3D=3D index >> cc.log_cluster=
_size)
> > +                     if (nc_cluster_idx =3D=3D f_lblk >> cc.log_cluste=
r_size)
> >                               goto read_single_page;
> >
> > -                     ret =3D f2fs_is_compressed_cluster(inode, index);
> > +                     ret =3D f2fs_is_compressed_cluster(inode, f_lblk)=
;
> >                       if (ret < 0)
> >                               goto set_error_page;
> >                       else if (!ret) {
> >                               nc_cluster_idx =3D
> > -                                     index >> cc.log_cluster_size;
> > +                                     f_lblk >> cc.log_cluster_size;
> >                               goto read_single_page;
> >                       }
> >
> > @@ -3605,15 +3628,21 @@ static int f2fs_mpage_readpages(struct inode *i=
node, struct fsverity_info *vi,
> >  read_single_page:
> >  #endif
> >
> > -             ret =3D f2fs_read_single_page(inode, vi, folio, max_nr_pa=
ges,
> > -                                         &map, &bio, &last_block_in_bi=
o,
> > -                                         rac);
> > -             if (ret) {
> > +             if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio)) {
> > +                     ret =3D f2fs_read_data_large_folio(inode, vi, NUL=
L, folio);
> > +                     if (ret)
> > +                             continue;
> > +             } else {
> > +                     ret =3D f2fs_read_single_page(inode, vi, folio,
> > +                                                 max_nr_pages, &map, &=
bio,
> > +                                                 &last_block_in_bio, r=
ac);
> > +                     if (ret) {
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >  set_error_page:
> >  #endif
> > -                     folio_zero_segment(folio, 0, folio_size(folio));
> > -                     folio_unlock(folio);
> > +                             folio_zero_segment(folio, 0, folio_size(f=
olio));
> > +                             folio_unlock(folio);
> > +                     }
> >               }
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >  next_page:
> > @@ -3625,7 +3654,8 @@ static int f2fs_mpage_readpages(struct inode *ino=
de, struct fsverity_info *vi,
> >                       if (nr_pages =3D=3D 1 && !f2fs_cluster_is_empty(&=
cc)) {
> >                               cc.vi =3D vi;
> >                               ret =3D f2fs_read_multi_pages(&cc, &bio,
> > -                                                     max_nr_pages,
> > +                                                     max_nr_pages *
> > +                                                     F2FS_BLKS_PER_PAG=
E(F2FS_I_SB(inode)),
>
> max_nr_pages << F2FS_LOG_BLKS_PER_PAGE ?
>
> >                                                       &last_block_in_bi=
o,
> >                                                       rac, false);
> >                               f2fs_destroy_compress_ctx(&cc, false);
> > @@ -3934,7 +3964,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *=
fio)
> >  static int f2fs_write_folio_dirty_range(struct folio *folio, int *subm=
itted,
> >                                       struct writeback_control *wbc,
> >                                       enum iostat_type io_type,
> > -                                     u64 start, u64 end)
> > +                                     u64 start, u64 end,
> > +                                     int compr_blocks)
> >  {
> >       struct inode *inode =3D folio->mapping->host;
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > @@ -3967,6 +3998,7 @@ static int f2fs_write_folio_dirty_range(struct fo=
lio *folio, int *submitted,
> >                       .folio_blkcnt =3D 1,
> >                       .encrypted_page =3D NULL,
> >                       .submitted =3D 0,
> > +                     .compr_blocks =3D (i =3D=3D 0) ? compr_blocks : 0=
,
> >                       .need_lock =3D LOCK_DONE,
> >                       .meta_gc =3D f2fs_meta_inode_gc_required(inode) ?=
 1 : 0,
> >                       .io_type =3D io_type,
> > @@ -3977,8 +4009,12 @@ static int f2fs_write_folio_dirty_range(struct f=
olio *folio, int *submitted,
> >                       struct f2fs_folio_state *ffs =3D
> >                               (struct f2fs_folio_state *)folio->private=
;
> >
> > -                     /* Write only dirty blocks */
> > -                     if (!f2fs_ffs_test_blk_dirty(folio, data_idx))
> > +                     /*
> > +                      * Write only dirty blocks, or all blocks of a
> > +                      * compressed cluster.
> > +                      */
> > +                     if (!compr_blocks &&
> > +                         !f2fs_ffs_test_blk_dirty(folio, data_idx))
> >                               continue;
> >                       atomic_inc(&ffs->write_blocks_pending);
> >               }
> > @@ -4053,6 +4089,9 @@ static int f2fs_write_folio_dirty_range(struct fo=
lio *folio, int *submitted,
> >
> >               fio.version =3D ni.version;
> >
> > +             if (fio.compr_blocks && fio.old_blkaddr =3D=3D COMPRESS_A=
DDR)
> > +                     f2fs_i_compr_blocks_update(inode, fio.compr_block=
s - 1, false);
> > +
> >               f2fs_outplace_write_data(&dn, &fio);
> >               f2fs_put_dnode(&dn);
> >               /* The outplace write path failed to submit this block. *=
/
> > @@ -4139,6 +4178,22 @@ static enum f2fs_wb_action f2fs_wb_folio_action(=
struct f2fs_sb_info *sbi,
> >       return F2FS_WB_WRITE;
> >  }
> >
> > +/*
> > + * Hold a bias on write_blocks_pending while the blocks of a multi-blo=
ck
> > + * folio are submitted, so that their completions cannot end the folio
> > + * writeback early. Without ffs, the folio dirty flag covered @len byt=
es.
> > + */
> > +static void f2fs_folio_get_write_bias(struct folio *folio, size_t len)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +
> > +     if (!f2fs_folio_has_ffs(folio))
> > +             f2fs_ffs_mark_subrange_dirty(folio, 0, len);
> > +     ffs =3D folio->private;
> > +     WARN_ON_ONCE(atomic_read(&ffs->write_blocks_pending) !=3D 0);
> > +     atomic_inc(&ffs->write_blocks_pending);
> > +}
> > +
> >  int f2fs_write_single_data_page(struct folio *folio, int *submitted,
> >                               struct bio **bio,
> >                               sector_t *last_block,
> > @@ -4157,6 +4212,7 @@ int f2fs_write_single_data_page(struct folio *fol=
io, int *submitted,
> >       bool need_balance_fs =3D false;
> >       bool quota_inode =3D IS_NOQUOTA(inode);
> >       int err =3D 0;
> > +     int local_submitted =3D 0;
> >       struct f2fs_io_info fio =3D {
> >               .sbi =3D sbi,
> >               .ino =3D inode->i_ino,
> > @@ -4203,6 +4259,42 @@ int f2fs_write_single_data_page(struct folio *fo=
lio, int *submitted,
> >
> >       folio_zero_segment(folio, offset, folio_size(folio));
> >  write:
> > +     if (f2fs_is_multiblock_folio(sbi, folio)) {
> > +             struct f2fs_lock_context lc;
> > +             unsigned int to_blk =3D f2fs_blocks_per_folio(sbi, folio)=
;
> > +             u64 pos =3D folio_pos(folio);
> > +
> > +             if (!compr_blocks && !f2fs_verity_in_progress(inode))
> > +                     to_blk =3D min_t(unsigned int,
> > +                                     F2FS_BLK_ALIGN(sbi, i_size - pos)=
,
> > +                                     to_blk);
> > +
> > +             /* Deadlock due to between page->lock and f2fs_lock_op */
> > +             if (!compr_blocks && !f2fs_trylock_op(sbi, &lc)) {
> > +                     err =3D -EAGAIN;
> > +                     goto redirty_out;
> > +             }
> > +
> > +             folio_start_writeback(folio);
> > +             f2fs_folio_get_write_bias(folio, F2FS_BLK_TO_BYTES(sbi, t=
o_blk));
> > +
> > +             err =3D f2fs_write_folio_dirty_range(folio, &local_submit=
ted,
> > +                                     wbc, io_type, pos,
> > +                                     pos + F2FS_BLK_TO_BYTES(sbi, to_b=
lk),
> > +                                     compr_blocks);
> > +
> > +             if (!compr_blocks)
> > +                     f2fs_unlock_op(sbi, &lc);
> > +
> > +             if (!err)
> > +                     f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> > +                                     F2FS_BLK_TO_BYTES(sbi, to_blk));
> > +
> > +             f2fs_ffs_put_write_pending(folio, 1);
> > +
> > +             goto done;
> > +     }
> > +
> >       if (f2fs_cp_controlled_inode(inode)) {
> >               struct f2fs_lock_context lc;
> >
> > @@ -4272,7 +4364,9 @@ int f2fs_write_single_data_page(struct folio *fol=
io, int *submitted,
> >       }
> >
> >       if (submitted)
> > -             *submitted =3D fio.submitted;
> > +             *submitted =3D f2fs_is_multiblock_folio(sbi, folio) ?
> > +                     DIV_ROUND_UP(local_submitted, F2FS_BLKS_PER_PAGE(=
sbi)) :
> > +                     fio.submitted;
> >
> >       return 0;
> >
> > @@ -4317,10 +4411,10 @@ static int f2fs_write_cache_pages(struct addres=
s_space *mapping,
> >               .rpages =3D NULL,
> >               .nr_rpages =3D 0,
> >               .cpages =3D NULL,
> > -             .valid_nr_cpages =3D 0,
> > +             .valid_nr_cblocks =3D 0,
> >               .rbuf =3D NULL,
> >               .cbuf =3D NULL,
> > -             .rlen =3D PAGE_SIZE * F2FS_I(inode)->i_cluster_size,
> > +             .rlen =3D F2FS_BLKSIZE(sbi) * F2FS_I(inode)->i_cluster_si=
ze,
> >               .private =3D NULL,
> >       };
> >  #endif
> > @@ -4409,6 +4503,7 @@ static int f2fs_write_cache_pages(struct address_=
space *mapping,
> >                               void *fsdata =3D NULL;
> >                               struct page *pagep;
> >                               int ret2;
> > +                             pgoff_t f_lblk =3D f2fs_folio_lblk(sbi, f=
olio);
> >
> >                               ret =3D f2fs_init_compress_ctx(&cc);
> >                               if (ret) {
> > @@ -4416,8 +4511,7 @@ static int f2fs_write_cache_pages(struct address_=
space *mapping,
> >                                       break;
> >                               }
> >
> > -                             if (!f2fs_cluster_can_merge_page(&cc,
> > -                                                             folio->in=
dex)) {
> > +                             if (!f2fs_cluster_can_merge_block(&cc, f_=
lblk)) {
> >                                       ret =3D f2fs_write_multi_pages(&c=
c,
> >                                               &submitted, wbc, io_type)=
;
> >                                       if (!ret)
> > @@ -4437,14 +4531,14 @@ static int f2fs_write_cache_pages(struct addres=
s_space *mapping,
> >
> >                               ret2 =3D f2fs_prepare_compress_overwrite(
> >                                                       inode, &pagep,
> > -                                                     folio->index, &fs=
data);
> > +                                                     f_lblk, &fsdata);
> >                               if (ret2 < 0) {
> >                                       ret =3D ret2;
> >                                       done =3D 1;
> >                                       break;
> >                               } else if (ret2 &&
> >                                       (!f2fs_compress_write_end(inode,
> > -                                             fsdata, folio->index, 1) =
||
> > +                                             fsdata, f_lblk, 1) ||
> >                                        !f2fs_all_cluster_page_ready(&cc=
,
> >                                               pages, i, nr_pages,
> >                                               false))) {
> > @@ -4599,7 +4693,6 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
> >               clear_inode_flag(inode, FI_HOT_DATA);
> >
> >       while ((folio =3D writeback_iter(mapping, wbc, folio, &err))) {
> > -             struct f2fs_folio_state *ffs =3D NULL;
> >               u64 isize;
> >               size_t poff;
> >               pgoff_t end_index;
> > @@ -4623,16 +4716,6 @@ static int f2fs_write_cache_folios(struct addres=
s_space *mapping,
> >                       goto retry_out;
> >               }
> >
> > -             if (f2fs_has_subpage_blocks(sbi) &&
> > -                 f2fs_compressed_file(inode)) {
> > -                     WARN_ON_ONCE(1);
> > -                     mapping_set_error(mapping, -EOPNOTSUPP);
> > -                     folio_clear_dirty_for_io(folio);
> > -                     inode_sub_dirty_blocks(inode, f2fs_blocks_per_fol=
io(sbi, folio));
> > -                     err =3D -EOPNOTSUPP;
> > -                     goto retry_out;
> > -             }
> > -
> >               /*
> >                * Writing back one large folio performs multiple block a=
llocations, so
> >                * best-effort balance the filesystem before writing it b=
ack.
> > @@ -4754,25 +4837,12 @@ static int f2fs_write_cache_folios(struct addre=
ss_space *mapping,
> >                * folio has no ffs, so its whole folio is written.
> >                */
> >               if (f2fs_is_multiblock_folio(sbi, folio)) {
> > -                     if (!f2fs_folio_has_ffs(folio))
> > -                             f2fs_ffs_mark_subrange_dirty(folio, 0, en=
d_pos - pos);
> > -                     ffs =3D (struct f2fs_folio_state *)folio->private=
;
> > -                     /*
> > -                      * Multiblock folios can be submitted as multiple=
 bios,
> > -                      * which may complete while we are still submitti=
ng the
> > -                      * remaining dirty ranges.  Hold a bias on
> > -                      * write_blocks_pending to prevent folio_end_writ=
eback()
> > -                      * from being called early.
> > -                      */
> > -                     if (!bias_added) {
> > -                             WARN_ON_ONCE(atomic_read(&ffs->write_bloc=
ks_pending) !=3D 0);
> > -                             atomic_inc(&ffs->write_blocks_pending);
> > -                             bias_added =3D true;
> > -                     }
> > +                     f2fs_folio_get_write_bias(folio, end_pos - pos);
> > +                     bias_added =3D true;
> >               }
> >
> >               err =3D f2fs_write_folio_dirty_range(folio, &submitted, w=
bc, io_type,
> > -                                                pos, end_pos);
> > +                                                pos, end_pos, 0);
> >               folio_submitted +=3D submitted;
> >               nwritten +=3D submitted;
> >               if (err)
> > @@ -4928,7 +4998,8 @@ static int __f2fs_write_data_pages(struct address=
_space *mapping,
> >       account_writeback(inode, true);
> >
> >       blk_start_plug(&plug);
> > -     if (f2fs_has_multiblock_folios(inode))
> > +     if (mapping_large_folio_support(mapping) ||
> > +         (f2fs_has_subpage_blocks(sbi) && !f2fs_compressed_file(inode)=
))
> >               ret =3D f2fs_write_cache_folios(mapping, wbc, io_type);
> >       else
> >               ret =3D f2fs_write_cache_pages(mapping, wbc, io_type);
> > @@ -5267,10 +5338,6 @@ static int prepare_large_folio_write_begin(struc=
t inode *inode,
> >       size_t need_off =3D ori_off;
> >       int err =3D 0;
> >
> > -     if (f2fs_has_subpage_blocks(sbi) &&
> > -         f2fs_compressed_file(inode))
> > -             return -EOPNOTSUPP;
> > -
> >       /*
> >        * Reserve blocks without f2fs_balance_fs() since the folio is lo=
cked;
> >        * the caller balances after unlocking it if *need_balance is set=
.
> > @@ -5464,12 +5531,6 @@ static int f2fs_write_begin(const struct kiocb *=
iocb,
> >               goto fail;
> >       }
> >
> > -     if (f2fs_has_subpage_blocks(sbi) &&
> > -         f2fs_compressed_file(inode)) {
> > -             err =3D -EOPNOTSUPP;
> > -             goto fail;
> > -     }
> > -
> >       /*
> >        * We should check this at this moment to avoid deadlock on inode=
 page
> >        * and #0 page. The locking rule for inline_data conversion shoul=
d be:
> > @@ -5490,11 +5551,13 @@ static int f2fs_write_begin(const struct kiocb =
*iocb,
> >
> >               *fsdata =3D NULL;
> >
> > +             pgoff_t f_lblk =3D F2FS_BYTES_TO_BLK(sbi, pos);
> > +
> >               if (len =3D=3D PAGE_SIZE && !(f2fs_is_atomic_file(inode))=
)
> >                       goto repeat;
> >
> >               ret =3D f2fs_prepare_compress_overwrite(inode, &page,
> > -                                                     index, fsdata);
> > +                                                     f_lblk, fsdata);
> >               if (ret < 0) {
> >                       err =3D ret;
> >                       goto fail;
> > @@ -5670,7 +5733,8 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >       /* overwrite compressed file */
> >       if (f2fs_compressed_file(inode) && fsdata) {
> > -             f2fs_compress_write_end(inode, fsdata, folio->index, copi=
ed);
> > +             f2fs_compress_write_end(inode, fsdata,
> > +                             f2fs_folio_lblk(F2FS_I_SB(inode), folio),=
 copied);
> >               f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> >
> >               if (pos + copied > i_size_read(inode) &&
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 8e38d46c446c..0a11c61ee3cf 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1696,7 +1696,7 @@ struct compress_ctx {
> >       unsigned int nr_rpages;         /* total page number in rpages */
> >       struct page **cpages;           /* pages store compressed data in=
 cluster */
> >       unsigned int nr_cpages;         /* total page number in cpages */
> > -     unsigned int valid_nr_cpages;   /* valid page number in cpages */
> > +     unsigned int valid_nr_cblocks;  /* valid block number in cpages *=
/
> >       void *rbuf;                     /* virtual mapped address on rpag=
es */
> >       struct compress_data *cbuf;     /* virtual mapped address on cpag=
es */
> >       size_t rlen;                    /* valid data length in rbuf */
> > @@ -1712,7 +1712,9 @@ struct compress_io_ctx {
> >       struct inode *inode;            /* inode the context belong to */
> >       struct page **rpages;           /* pages store raw data in cluste=
r */
> >       unsigned int nr_rpages;         /* total page number in rpages */
> > -     atomic_t pending_pages;         /* in-flight compressed page coun=
t */
> > +     atomic_t pending_blocks;        /* in-flight compressed block cou=
nt */
> > +     struct page **cpages;           /* bounce pages store compressed =
data */
> > +     unsigned int nr_cpages;         /* total page number in cpages */
> >  };
> >
> >  /* Context for decompressing one cluster on the read IO path */
> > @@ -1727,6 +1729,7 @@ struct decompress_io_ctx {
> >       unsigned int nr_rpages;         /* total page number in rpages */
> >       struct page **cpages;           /* pages store compressed data in=
 cluster */
> >       unsigned int nr_cpages;         /* total page number in cpages */
> > +     unsigned int valid_nr_cblocks;  /* valid compressed block number =
*/
> >       struct page **tpages;           /* temp pages to pad holes in clu=
ster */
> >       void *rbuf;                     /* virtual mapped address on rpag=
es */
> >       struct compress_data *cbuf;     /* virtual mapped address on cpag=
es */
> > @@ -1734,16 +1737,16 @@ struct decompress_io_ctx {
> >       size_t clen;                    /* valid data length in cbuf */
> >
> >       /*
> > -      * The number of compressed pages remaining to be read in this cl=
uster.
> > -      * This is initially nr_cpages.  It is decremented by 1 each time=
 a page
> > -      * has been read (or failed to be read).  When it reaches 0, the =
cluster
> > -      * is decompressed (or an error is reported).
> > +      * The number of compressed blocks remaining to be read in this c=
luster.
> > +      * This is initially valid_nr_cblocks.  It is decremented by the =
number
> > +      * of blocks each time they have been read (or failed to be read)=
.  When
> > +      * it reaches 0, the cluster is decompressed (or an error is repo=
rted).
> >        *
> >        * If an error occurs before all the pages have been submitted fo=
r I/O,
> >        * then this will never reach 0.  In this case the I/O submitter =
is
> >        * responsible for calling f2fs_decompress_end_io() instead.
> >        */
> > -     atomic_t remaining_pages;
> > +     atomic_t remaining_blocks;
> >
> >       /*
> >        * Number of references to this decompress_io_ctx.
> > @@ -1770,7 +1773,7 @@ struct decompress_io_ctx {
> >  #define NULL_CLUSTER                 ((unsigned int)(~0))
> >  #define MIN_COMPRESS_LOG_SIZE                2
> >  #define MAX_COMPRESS_LOG_SIZE                8
> > -#define MAX_COMPRESS_WINDOW_SIZE(log_size)   ((PAGE_SIZE) << (log_size=
))
> > +#define MAX_COMPRESS_WINDOW_SIZE(sbi, log_size)      ((F2FS_BLKSIZE(sb=
i)) << (log_size))
> >
> >  struct f2fs_gc_kthread {
> >       struct task_struct *f2fs_gc_task;
> > @@ -2338,6 +2341,12 @@ static inline unsigned int f2fs_blocks_per_folio=
(struct f2fs_sb_info *sbi,
> >
> >  #define F2FS_LOG_BLKS_PER_PAGE(sbi)  (PAGE_SHIFT - (sbi)->log_blocksiz=
e)
> >
> > +static inline unsigned int min_compress_log_size(struct f2fs_sb_info *=
sbi)
> > +{
> > +     return max_t(unsigned int, MIN_COMPRESS_LOG_SIZE,
> > +                     F2FS_LOG_BLKS_PER_PAGE(sbi));
> > +}
> > +
> >  static inline bool f2fs_has_subpage_blocks(struct f2fs_sb_info *sbi)
> >  {
> >       return F2FS_BLKSIZE(sbi) < PAGE_SIZE;
> > @@ -4990,20 +4999,22 @@ enum cluster_check_type {
> >  bool f2fs_is_compressed_page(struct folio *folio);
> >  struct folio *f2fs_compress_control_folio(struct folio *folio);
> >  int f2fs_prepare_compress_overwrite(struct inode *inode,
> > -                     struct page **pagep, pgoff_t index, void **fsdata=
);
> > +                     struct page **pagep, pgoff_t lblk, void **fsdata)=
;
> >  bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
> > -                                     pgoff_t index, unsigned copied);
> > +                                     pgoff_t lblk, unsigned int copied=
);
> >  int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool =
lock);
> > -void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio);
> > +void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio,
> > +                             unsigned int nr_blocks);
> >  bool f2fs_is_compress_backend_ready(struct inode *inode);
> >  bool f2fs_is_compress_level_valid(int alg, int lvl);
> >  int __init f2fs_init_compress_mempool(void);
> >  void f2fs_destroy_compress_mempool(void);
> >  void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_ta=
sk);
> > -void f2fs_end_read_compressed_page(struct folio *folio, bool failed,
> > -                             block_t blkaddr, bool in_task);
> > +void f2fs_end_read_compressed_page(struct folio *folio, size_t offset,
> > +                             bool failed, block_t blkaddr,
> > +                             unsigned int nr_blocks, bool in_task);
> >  bool f2fs_cluster_is_empty(struct compress_ctx *cc);
> > -bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t inde=
x);
> > +bool f2fs_cluster_can_merge_block(struct compress_ctx *cc, pgoff_t lbl=
k);
> >  bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page =
**pages,
> >                               int index, int nr_pages, bool uptodate);
> >  bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
> > @@ -5012,13 +5023,13 @@ int f2fs_write_multi_pages(struct compress_ctx =
*cc,
> >                                               int *submitted,
> >                                               struct writeback_control =
*wbc,
> >                                               enum iostat_type io_type)=
;
> > -int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
> > -bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t index);
> > +int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t lblk);
> > +bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t lblk);
> >  void f2fs_update_read_extent_tree_range_compressed(struct inode *inode=
,
> >                               pgoff_t fofs, block_t blkaddr,
> >                               unsigned int llen, unsigned int c_len);
> >  int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_re=
t,
> > -                             unsigned nr_pages, sector_t *last_block_i=
n_bio,
> > +                             unsigned int nr_blocks, sector_t *last_bl=
ock_in_bio,
> >                               struct readahead_control *rac, bool for_w=
rite);
> >  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
> >  void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed=
,
> > @@ -5036,8 +5047,8 @@ int __init f2fs_init_compress_cache(void);
> >  void f2fs_destroy_compress_cache(void);
> >  void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
> >                                       block_t blkaddr, unsigned int len=
);
> > -bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio=
 *folio,
> > -                                                             block_t b=
lkaddr);
> > +bool f2fs_load_compressed_block(struct f2fs_sb_info *sbi, struct folio=
 *folio,
> > +                             size_t offset, block_t blkaddr);
> >  void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t in=
o);
> >  #define inc_compr_inode_stat(inode)                                  \
> >       do {                                                            \
> > @@ -5071,7 +5082,8 @@ static inline void f2fs_destroy_compress_mempool(=
void) { }
> >  static inline void f2fs_decompress_cluster(struct decompress_io_ctx *d=
ic,
> >                               bool in_task) { }
> >  static inline void f2fs_end_read_compressed_page(struct folio *folio,
> > -                             bool failed, block_t blkaddr, bool in_tas=
k)
> > +                             size_t offset, bool failed, block_t blkad=
dr,
> > +                             unsigned int nr_blocks, bool in_task)
> >  {
> >       WARN_ON_ONCE(1);
> >  }
> > @@ -5089,17 +5101,18 @@ static inline int __init f2fs_init_compress_cac=
he(void) { return 0; }
> >  static inline void f2fs_destroy_compress_cache(void) { }
> >  static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb=
_info *sbi,
> >                               block_t blkaddr, unsigned int len) { }
> > -static inline bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi=
,
> > -             struct folio *folio, block_t blkaddr) { return false; }
> > +static inline bool f2fs_load_compressed_block(struct f2fs_sb_info *sbi=
,
> > +             struct folio *folio, size_t offset,
> > +             block_t blkaddr) { return false; }
> >  static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info =
*sbi,
> >                                                       nid_t ino) { }
> >  #define inc_compr_inode_stat(inode)          do { } while (0)
> >  static inline int f2fs_is_compressed_cluster(
> >                               struct inode *inode,
> > -                             pgoff_t index) { return 0; }
> > +                             pgoff_t lblk) { return 0; }
> >  static inline bool f2fs_is_sparse_cluster(
> >                               struct inode *inode,
> > -                             pgoff_t index) { return true; }
> > +                             pgoff_t lblk) { return true; }
> >  static inline void f2fs_update_read_extent_tree_range_compressed(
> >                               struct inode *inode,
> >                               pgoff_t fofs, block_t blkaddr,
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 67ed6be8952f..952896640e72 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -178,7 +178,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fa=
ult *vmf)
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> >       if (f2fs_compressed_file(inode)) {
> > -             int ret =3D f2fs_is_compressed_cluster(inode, pidx);
> > +             int ret =3D f2fs_is_compressed_cluster(inode, bidx);
> >
> >               if (ret < 0) {
> >                       err =3D ret;
> > @@ -1019,7 +1019,8 @@ int f2fs_truncate_blocks(struct inode *inode, u64=
 from, bool lock)
> >        */
> >       if (f2fs_compressed_file(inode))
> >               free_from =3D round_up(from,
> > -                             F2FS_I(inode)->i_cluster_size << PAGE_SHI=
FT);
> > +                             F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
> > +                                     F2FS_I(inode)->i_cluster_size));
> >  #endif
> >
> >       err =3D f2fs_do_truncate_blocks(inode, free_from, lock);
> > @@ -2298,13 +2299,6 @@ static long f2fs_fallocate(struct file *file, in=
t mode,
> >               goto out;
> >       }
> >
> > -     if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
> > -             if (f2fs_compressed_file(inode)) {
> > -                     ret =3D -EOPNOTSUPP;
> > -                     goto out;
> > -             }
> > -     }
> > -
> >       ret =3D file_modified(file);
> >       if (ret)
> >               goto out;
> > @@ -4447,9 +4441,6 @@ static int f2fs_release_compress_blocks(struct fi=
le *filp, unsigned long arg)
> >       int ret;
> >       int writecount;
> >
> > -     if (f2fs_has_subpage_blocks(sbi))
> > -             return -EOPNOTSUPP;
> > -
> >       if (!f2fs_sb_has_compression(sbi))
> >               return -EOPNOTSUPP;
> >
> > @@ -4645,9 +4636,6 @@ static int f2fs_reserve_compress_blocks(struct fi=
le *filp, unsigned long arg)
> >       unsigned int reserved_blocks =3D 0;
> >       int ret;
> >
> > -     if (f2fs_has_subpage_blocks(sbi))
> > -             return -EOPNOTSUPP;
> > -
> >       if (!f2fs_sb_has_compression(sbi))
> >               return -EOPNOTSUPP;
> >
> > @@ -4969,9 +4957,6 @@ static int f2fs_ioc_set_compress_option(struct fi=
le *filp, unsigned long arg)
> >       struct f2fs_comp_option option;
> >       int ret =3D 0;
> >
> > -     if (f2fs_has_subpage_blocks(sbi))
> > -             return -EOPNOTSUPP;
> > -
> >       if (!f2fs_sb_has_compression(sbi))
> >               return -EOPNOTSUPP;
> >
> > @@ -4982,7 +4967,7 @@ static int f2fs_ioc_set_compress_option(struct fi=
le *filp, unsigned long arg)
> >                               sizeof(option)))
> >               return -EFAULT;
> >
> > -     if (option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> > +     if (option.log_cluster_size < min_compress_log_size(sbi) ||
> >               option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
> >               option.algorithm >=3D COMPRESS_MAX)
> >               return -EINVAL;
> > @@ -5076,16 +5061,22 @@ static int redirty_blocks(struct inode *inode, =
pgoff_t page_idx, int len)
> >               off =3D offset_in_folio(folio, (loff_t)redirty_idx << PAG=
E_SHIFT);
> >               dlen =3D (size_t)(next_idx - redirty_idx) << PAGE_SHIFT;
> >
> > -             if (folio_test_large(folio)) {
> > +             if (f2fs_is_multiblock_folio(F2FS_I_SB(inode), folio)) {
> > +                     loff_t eof =3D i_size_read(inode) - folio_pos(fol=
io);
> > +
> >                       /*
> > -                      * A compressed inode can keep using large folios=
, in
> > +                      * folio_mark_dirty() does not dirty the blocks o=
f a folio
> > +                      * state.  A compressed inode can keep using larg=
e folios, in
> >                        * which case the compression flag only works as =
a hint
> >                        * until the inode is evicted.  Update the subpag=
e dirty
> >                        * bitmap as well, otherwise f2fs_write_cache_fol=
ios()
> > -                      * finds no dirty range and skips the whole folio=
.
> > +                      * finds no dirty range and skips the whole folio=
.  Do
> > +                      * not dirty the blocks past EOF.
> >                        */
> > -                     f2fs_ffs_find_or_alloc(folio);
> > -                     f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
> > +                     if ((loff_t)(off + dlen) > eof)
> > +                             dlen =3D eof > (loff_t)off ? eof - off : =
0;
> > +                     if (dlen)
> > +                             f2fs_ffs_mark_subrange_dirty(folio, off, =
dlen);
> >               }
> >
> >               folio_mark_dirty(folio);
> > @@ -5103,12 +5094,9 @@ static int f2fs_ioc_decompress_file(struct file =
*filp)
> >       struct inode *inode =3D file_inode(filp);
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       struct f2fs_inode_info *fi =3D F2FS_I(inode);
> > -     pgoff_t page_idx =3D 0, last_idx, cluster_idx;
> > +     pgoff_t lblk =3D 0, last_idx, cluster_idx;
> >       int ret;
> >
> > -     if (f2fs_has_subpage_blocks(sbi))
> > -             return -EOPNOTSUPP;
> > -
> >       if (!f2fs_sb_has_compression(sbi) ||
> >                       F2FS_OPTION(sbi).compress_mode !=3D COMPR_MODE_US=
ER)
> >               return -EOPNOTSUPP;
> > @@ -5145,12 +5133,14 @@ static int f2fs_ioc_decompress_file(struct file=
 *filp)
> >       last_idx >>=3D fi->i_log_cluster_size;
> >
> >       for (cluster_idx =3D 0; cluster_idx < last_idx; cluster_idx++) {
> > -             page_idx =3D cluster_idx << fi->i_log_cluster_size;
> > +             lblk =3D cluster_idx << fi->i_log_cluster_size;
> >
> > -             if (!f2fs_is_compressed_cluster(inode, page_idx))
> > +             if (!f2fs_is_compressed_cluster(inode, lblk))
> >                       continue;
> >
> > -             ret =3D redirty_blocks(inode, page_idx, fi->i_cluster_siz=
e);
> > +             ret =3D redirty_blocks(inode,
> > +                     f2fs_lblk_to_folio_index(sbi, lblk),
> > +                     fi->i_cluster_size >> F2FS_LOG_BLKS_PER_PAGE(sbi)=
);
> >               if (ret < 0)
> >                       break;
> >
> > @@ -5187,12 +5177,9 @@ static int f2fs_ioc_compress_file(struct file *f=
ilp)
> >       struct inode *inode =3D file_inode(filp);
> >       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> >       struct f2fs_inode_info *fi =3D F2FS_I(inode);
> > -     pgoff_t page_idx =3D 0, last_idx, cluster_idx;
> > +     pgoff_t lblk =3D 0, last_idx, cluster_idx;
> >       int ret;
> >
> > -     if (f2fs_has_subpage_blocks(sbi))
> > -             return -EOPNOTSUPP;
> > -
> >       if (!f2fs_sb_has_compression(sbi) ||
> >                       F2FS_OPTION(sbi).compress_mode !=3D COMPR_MODE_US=
ER)
> >               return -EOPNOTSUPP;
> > @@ -5235,12 +5222,14 @@ static int f2fs_ioc_compress_file(struct file *=
filp)
> >       last_idx >>=3D fi->i_log_cluster_size;
> >
> >       for (cluster_idx =3D 0; cluster_idx < last_idx; cluster_idx++) {
> > -             page_idx =3D cluster_idx << fi->i_log_cluster_size;
> > +             lblk =3D cluster_idx << fi->i_log_cluster_size;
> >
> > -             if (f2fs_is_sparse_cluster(inode, page_idx))
> > +             if (f2fs_is_sparse_cluster(inode, lblk))
> >                       continue;
> >
> > -             ret =3D redirty_blocks(inode, page_idx, fi->i_cluster_siz=
e);
> > +             ret =3D redirty_blocks(inode,
> > +                     f2fs_lblk_to_folio_index(sbi, lblk),
> > +                     fi->i_cluster_size >> F2FS_LOG_BLKS_PER_PAGE(sbi)=
);
> >               if (ret < 0)
> >                       break;
> >
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 5c6a64b31b05..aad5fbbcc5a2 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -225,7 +225,7 @@ static bool sanity_check_compress_inode(struct inod=
e *inode,
> >                       SECTOR_TO_BLOCK(sbi, inode->i_blocks));
> >               return false;
> >       }
> > -     if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> > +     if (ri->i_log_cluster_size < min_compress_log_size(sbi) ||
> >               ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
> >               f2fs_warn(sbi,
> >                       "%s: inode (ino=3D%llx) has unsupported log clust=
er size: %u, run fsck to fix",
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index fa74564adcfb..b2669057b7d2 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1447,6 +1447,11 @@ static int f2fs_check_compression(struct fs_cont=
ext *fc,
> >               ctx_clear_opt_mask(ctx, F2FS_MOUNT_COMPRESS_CACHE);
> >               return 0;
> >       }
> > +     if ((ctx->spec_mask & F2FS_SPEC_compress_log_size) &&
> > +         F2FS_CTX_INFO(ctx).compress_log_size < min_compress_log_size(=
sbi)) {
> > +             f2fs_err(sbi, "Compress cluster log size is out of range"=
);
> > +             return -EINVAL;
> > +     }
> >       if (ctx->spec_mask & F2FS_SPEC_compress_extension) {
> >               cnt =3D F2FS_CTX_INFO(ctx).compress_ext_cnt;
> >               for (i =3D 0; i < F2FS_CTX_INFO(ctx).compress_ext_cnt; i+=
+) {
> > @@ -2630,7 +2635,7 @@ static void default_options(struct f2fs_sb_info *=
sbi, bool remount)
> >       F2FS_OPTION(sbi).s_resgid =3D make_kgid(&init_user_ns, F2FS_DEF_R=
ESGID);
> >       if (f2fs_sb_has_compression(sbi)) {
> >               F2FS_OPTION(sbi).compress_algorithm =3D COMPRESS_LZ4;
> > -             F2FS_OPTION(sbi).compress_log_size =3D MIN_COMPRESS_LOG_S=
IZE;
> > +             F2FS_OPTION(sbi).compress_log_size =3D min_compress_log_s=
ize(sbi);
> >               F2FS_OPTION(sbi).compress_ext_cnt =3D 0;
> >               F2FS_OPTION(sbi).compress_mode =3D COMPR_MODE_FS;
> >       }
>
