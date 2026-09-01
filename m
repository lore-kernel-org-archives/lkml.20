Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE6388885
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225288; cv=pass; b=V38B7KqorOK9ZKXlijxForwhGUVr0CVNRy7y+hAsAHjybHUabG7Mur/jftD5J9TzDl8XVB5QmQ+S+KMIgbbRU8n/2xcwIK3ROS3dgB2vjs1AuxKVIUJTaAZjQEWoh1OB69H6mHeuNoPD4LJrjXW4IyXdc5QuAqfGv+mtSUrzoxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225288; c=relaxed/simple;
	bh=2AkY88WBahQNvHZf1/VJmh8rbOM9oEHcdKWxvjdCILU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1BDmODXBdCQ0IyIO/V+m8W8/xY93wZgGSqTN39c5YGJw1VS9yFEsPcOTV06sPHH6qfmRRsw3bwCPF2Or3+K7F6AgyS+Wb+cjU8rgCjrjPPHLHaDtThZYfA5FL/scH9fycdUlKnjlp2P9YgEPOQthn5wpcGNR7Lrb9dgOdMNEW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtNzJJTV; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtNzJJTV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d5335cf904so39999345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788225285; cv=none;
        d=google.com; s=arc-20260327;
        b=HxcF+QrIPn9Kh3nLzT+UYvnZEMfVNyxGgNhDhdsS5rDqDGrnmiV8CEMHr7777ix0u6
         ZPgaMuBKaE8CyGM6rmUAniKSFK5GYy8kOTTm23iuqQMDQkJb9c3HGdfU9Yf/O9S8zjr6
         MkO81PDY+7F456SB6jtuQA0Ytv5O3uPL+vP7L3bCqLMifqFwd4EIHDgd+ASKInrldakN
         WpRgfzYBN6+UqRTOy7Ql9LFw1utn6luaoGPj2ME+YPPfjdUhYWA6xruw+KEROTy5++dZ
         Xac7mYRl7S1HXq6l/Q8I7MxFiPOhjblfexDtxES4okWLEYtEGOz+FfzE3lUd09BVlgoD
         8K2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vRsO0/ecqsUH3oZx7IbZhQ7HKyWmX57cPuisnfqfibU=;
        fh=lWMWkiop0kZAft9rR16Rhxan+5gRZgoamCHENhu+l5M=;
        b=Ck66gliunYIIY1jDpjpxl0rhSC5mEdwkUFSxBb7W1WEb9fhqNyhjZ5VI1UEsdSIuXs
         foFCcgJQhyStaxlq3pWdgGz2KKM4NqIJlv+TuyLTN1UV7+02pjmYviVYnMCjpp7VQCTW
         9ytMasrdGXU8AxsqEtCC3xTv/LIPMd8g7p0lGriJh6VEU15AZ/YNSL733gtTLgMTqK23
         IKlGt33FS+T0BLsR3wcMcIT2D5rxREVSjsz4F0kSQqdoaWDfzEMIPzDyRsoiu6egJ3rL
         hNAHNY00hTXXeLJOZQe4RGW1EMUlAv0ne9lAGs3K/0LZy2O2fTEO6CceydlLRgPjlDgo
         qwPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788225285; x=1788830085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vRsO0/ecqsUH3oZx7IbZhQ7HKyWmX57cPuisnfqfibU=;
        b=rtNzJJTVa8YL+bL5SPB7DW/bX31If+hz+cvEWJlBjnITUOAqOIV4rawrxoaTGb0yhM
         DrUULgUtlYaX6Xl1uBVe3yRmzO2bDwvquYBsH6ODUIK7F7vFe1Z5w75M9hV41OZqDZm7
         Gf6A+N59HqfSWl49dVPz+X/XRwOcjHDII/ldKUomZXNmPGW+Z2Bd4mJ/W4IPCNrQ+dpD
         urBGjTxobxf20IhoXYKRYPbZdtkyRVoSVvTDhTYczDEZrkI6kjKtkiTHEkB9meT5glze
         Jfx5Jf8gJvJZKN1vOFqNLhYj8hbyQsFJr/4YxZHZ0ode+Q/f3/I0RehGT++qtiawTmb7
         ICcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225285; x=1788830085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRsO0/ecqsUH3oZx7IbZhQ7HKyWmX57cPuisnfqfibU=;
        b=MY/5J1dCi6MBbTzzNWQVOxcdNtAqdky2f+y3a5COKBUZRCcDFQuGL4oHrR8EGyRoTW
         Y39YUsOJfqvsNkYT0uAYnS82wJvP489+VD/0/oR8CUykyx7nzQbmUI+vuBIx9p6UhxZ2
         /+HT/lqr0lY11hEPaiPhj00d2aBTXrWnKSdHYCnTBfaNB6SQM/diP7cal9yZTtcFG23S
         oElMwkRQFCGkh4H11mFUhSroPbf97K2H8yl16Ed1xAFAhSm506nar/ea3oR9cip2NJDB
         tFrUDvY3kKvZJjiL6ieu1U3csNWmuSx9D3KHfwx3PGnFjxDIl9mZ1hvYevi/a+Lrb+Ng
         ZIMg==
X-Forwarded-Encrypted: i=1; AKwUvBwul+i6Z+FjusEdEwe098bXRcH7XyIGUnjULV0bJ4JfwkNRaOTuJ4NVVDL0jErn3jeJ0f0Hxkkd4sGgbKs=@vger.kernel.org
X-Gm-Message-State: AFuF++nUO/FNTOqTye5LuBvabezVmcPN1yK9xzU80qzrtKp5S0AEfUMC
	nnwyvt2vlITNZnqLJh3OahmQprpOG6aZ3uQxtoUQcQtLJ+13SDet7d75F+2DarDD6Ud0CvjY3t9
	Bpj/kkKApNN3X/hijPIT3eB4zP2IZ/UMMLoZW
X-Gm-Gg: AYBFou1xZn8Ovl6SqlDrjkbv+fyTqzjgwM89vZ9O+2LZrnwckuI43fsCoqj0f6CvRf2
	aczEOuGLriiUkNY3HpovIH5OykyVAsxwvbIxr1uuUNtJtbWwT2vM3ei+bzaw8vueAmEG5HGnVKv
	QY17nl13MTB1LZQM2ARxmgJjIMDXRaf7A37Ivo22LB2JptGKBcOYhNrpiTGfnaEHKNS8TR4VWeH
	IZBOvQ0U9PFKPzJs45pz4WQTcfj4D0xhBR0KG8B1b3X9lmOXomEDe/Mae+uIFnlDQ9BicK+0W6N
	gYqifCTuKDtM1zCTTP9ZnDHZhEeiRTSQEJf5f7ujQvWzmNAqOPSY1DqGyTXfJq6Qof/PiLDa470
	IeubGv44rAmjcbRYMp90FnxXQKTXSNwnpyKgaIA8PfQMzBQ==
X-Received: by 2002:a17:903:987:b0:2d8:d4cc:be62 with SMTP id
 d9443c01a7336-2d94a8eee8cmr65033355ad.15.1788225284456; Mon, 31 Aug 2026
 18:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788213716.git.zhangxp1998@gmail.com> <bb5a74df5ba223cd33b4b7111e725e5aa315f79d.1788213716.git.zhangxp1998@gmail.com>
In-Reply-To: <bb5a74df5ba223cd33b4b7111e725e5aa315f79d.1788213716.git.zhangxp1998@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2026 18:14:28 -0700
X-Gm-Features: AcwNN1XWhxUdDiU4KvT0Q79YUPhSWj9o2sNKfREDq6xGMSYU_9crA4_7nLvyuCE
Message-ID: <CACOAw_zvoYvdLWjUYpj1ambnjzPpzTOzTp7zGWA-aF=JqNPUNg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 09/11] f2fs: parameterize byte and block
 conversion macros
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:09=E2=80=AFPM Kelvin Zhang <zhangxp1998@gmail.com=
> wrote:
>
> Byte-to-block and block-to-byte conversion helpers previously relied on
> global PAGE_SIZE, PAGE_SHIFT, or F2FS_BLKSIZE_BITS.
>
> Parameterize F2FS_BYTES_TO_BLK, F2FS_BLK_TO_BYTES, F2FS_BLK_END_BYTES,
> F2FS_BLK_ALIGN, and max_file_blocks with struct f2fs_sb_info *sbi using
> sbi->log_blocksize.
>
> Update all call sites across data mapping, file operations, fiemap querie=
s,
> fsverity checks, NAT bitmap allocations, and truncate paths.
>
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
> ---
>  fs/f2fs/checkpoint.c    |  2 +-
>  fs/f2fs/data.c          | 58 +++++++++++++++++++++++------------------
>  fs/f2fs/debug.c         |  2 +-
>  fs/f2fs/f2fs.h          |  7 ++---
>  fs/f2fs/file.c          | 54 +++++++++++++++++++++-----------------
>  fs/f2fs/node.c          |  7 ++---
>  fs/f2fs/recovery.c      |  4 +--
>  fs/f2fs/segment.c       |  9 ++++---
>  fs/f2fs/super.c         |  9 ++++---
>  fs/f2fs/verity.c        |  6 +++--
>  include/linux/f2fs_fs.h | 12 ++++++---
>  11 files changed, 96 insertions(+), 74 deletions(-)
>
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 37a72b693545..d0dcc918422e 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1866,7 +1866,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, =
struct cp_control *cpc)
>                 blk =3D start_blk + BLKS_PER_SEG(sbi) - nm_i->nat_bits_bl=
ocks;
>                 for (i =3D 0; i < nm_i->nat_bits_blocks; i++)
>                         f2fs_update_meta_page(sbi, nm_i->nat_bits +
> -                                       F2FS_BLK_TO_BYTES(i), blk + i);
> +                                       F2FS_BLK_TO_BYTES(sbi, i), blk + =
i);
>         }
>
>         /* write out checkpoint buffer at block 0 */
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 44e1ae43565e..6ee4440c17dd 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1977,12 +1977,12 @@ static bool __f2fs_overwrite_io(struct inode *ino=
de, loff_t pos, size_t len,
>         if (pos + len > i_size_read(inode))
>                 return false;
>
> -       map.m_lblk =3D F2FS_BYTES_TO_BLK(pos);
> +       map.m_lblk =3D F2FS_BYTES_TO_BLK(F2FS_I_SB(inode), pos);
>         map.m_next_pgofs =3D NULL;
>         map.m_next_extent =3D NULL;
>         map.m_seg_type =3D NO_CHECK_TYPE;
>         map.m_may_create =3D false;
> -       last_lblk =3D F2FS_BLK_ALIGN(pos + len);
> +       last_lblk =3D F2FS_BLK_ALIGN(F2FS_I_SB(inode), pos + len);
>
>         while (map.m_lblk < last_lblk) {
>                 map.m_len =3D last_lblk - map.m_lblk;
> @@ -2025,7 +2025,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
>                         return err;
>                 }
>
> -               phys =3D F2FS_BLK_TO_BYTES(ni.blk_addr);
> +               phys =3D F2FS_BLK_TO_BYTES(sbi, ni.blk_addr);
>                 offset =3D offsetof(struct f2fs_inode, i_addr) +
>                                         sizeof(__le32) * (DEF_ADDRS_PER_I=
NODE_SBI(sbi) -
>                                         get_inline_xattr_addrs(inode));
> @@ -2059,7 +2059,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
>                         return err;
>                 }
>
> -               phys =3D F2FS_BLK_TO_BYTES(ni.blk_addr);
> +               phys =3D F2FS_BLK_TO_BYTES(sbi, ni.blk_addr);
>                 len =3D inode->i_sb->s_blocksize;
>
>                 f2fs_folio_put(folio, true);
> @@ -2078,6 +2078,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
>  int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>                 u64 start, u64 len)
>  {
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         struct f2fs_map_blocks map;
>         sector_t start_blk, last_blk, blk_len, max_len;
>         pgoff_t next_pgofs;
> @@ -2101,7 +2102,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_=
extent_info *fieinfo,
>
>         inode_lock_shared(inode);
>
> -       maxbytes =3D F2FS_BLK_TO_BYTES(max_file_blocks(inode));
> +       maxbytes =3D F2FS_BLK_TO_BYTES(sbi, max_file_blocks(sbi, inode));
>         if (start > maxbytes) {
>                 ret =3D -EFBIG;
>                 goto out;
> @@ -2121,10 +2122,10 @@ int f2fs_fiemap(struct inode *inode, struct fiema=
p_extent_info *fieinfo,
>                         goto out;
>         }
>
> -       start_blk =3D F2FS_BYTES_TO_BLK(start);
> -       last_blk =3D F2FS_BYTES_TO_BLK(start + len - 1);
> +       start_blk =3D F2FS_BYTES_TO_BLK(sbi, start);
> +       last_blk =3D F2FS_BYTES_TO_BLK(sbi, start + len - 1);
>         blk_len =3D last_blk - start_blk + 1;
> -       max_len =3D F2FS_BYTES_TO_BLK(maxbytes) - start_blk;
> +       max_len =3D F2FS_BYTES_TO_BLK(sbi, maxbytes) - start_blk;
>
>  next:
>         memset(&map, 0, sizeof(map));
> @@ -2146,7 +2147,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_=
extent_info *fieinfo,
>         if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
>                 start_blk =3D next_pgofs;
>
> -               if (F2FS_BLK_TO_BYTES(start_blk) < maxbytes)
> +               if (F2FS_BLK_TO_BYTES(sbi, start_blk) < maxbytes)
>                         goto prep_next;
>
>                 flags |=3D FIEMAP_EXTENT_LAST;
> @@ -2194,14 +2195,14 @@ int f2fs_fiemap(struct inode *inode, struct fiema=
p_extent_info *fieinfo,
>         } else if (compr_appended) {
>                 unsigned int appended_blks =3D cluster_size -
>                                                 count_in_cluster + 1;
> -               size +=3D F2FS_BLK_TO_BYTES(appended_blks);
> +               size +=3D F2FS_BLK_TO_BYTES(sbi, appended_blks);
>                 start_blk +=3D appended_blks;
>                 compr_cluster =3D false;
>         } else {
> -               logical =3D F2FS_BLK_TO_BYTES(start_blk);
> +               logical =3D F2FS_BLK_TO_BYTES(sbi, start_blk);
>                 phys =3D __is_valid_data_blkaddr(map.m_pblk) ?
> -                       F2FS_BLK_TO_BYTES(map.m_pblk) : 0;
> -               size =3D F2FS_BLK_TO_BYTES(map.m_len);
> +                       F2FS_BLK_TO_BYTES(sbi, map.m_pblk) : 0;
> +               size =3D F2FS_BLK_TO_BYTES(sbi, map.m_len);
>                 flags =3D 0;
>
>                 if (compr_cluster) {
> @@ -2215,7 +2216,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_=
extent_info *fieinfo,
>                         flags =3D FIEMAP_EXTENT_UNWRITTEN;
>                 }
>
> -               start_blk +=3D F2FS_BYTES_TO_BLK(size);
> +               start_blk +=3D F2FS_BYTES_TO_BLK(sbi, size);
>         }
>
>  prep_next:
> @@ -2235,7 +2236,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_=
extent_info *fieinfo,
>  static inline loff_t f2fs_readpage_limit(struct inode *inode)
>  {
>         if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
> -               return F2FS_BLK_TO_BYTES(max_file_blocks(inode));
> +               return F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
> +                               max_file_blocks(F2FS_I_SB(inode), inode))=
;
>
>         return i_size_read(inode);
>  }
> @@ -2263,7 +2265,8 @@ static int f2fs_read_single_page(struct inode *inod=
e, struct fsverity_info *vi,
>
>         block_in_file =3D (sector_t)index;
>         last_block =3D block_in_file + nr_pages;
> -       last_block_in_file =3D F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inod=
e) +
> +       last_block_in_file =3D F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
> +                               f2fs_readpage_limit(inode) +
>                                                         blocksize - 1);
>         if (last_block > last_block_in_file)
>                 last_block =3D last_block_in_file;
> @@ -2374,7 +2377,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, =
struct bio **bio_ret,
>
>         f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
>
> -       last_block_in_file =3D F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inod=
e) +
> +       last_block_in_file =3D F2FS_BYTES_TO_BLK(sbi,
> +                               f2fs_readpage_limit(inode) +
>                                                         blocksize - 1);
>
>         /* get rid of pages beyond EOF */
> @@ -4236,7 +4240,7 @@ static sector_t f2fs_bmap(struct address_space *map=
ping, sector_t block)
>                 filemap_write_and_wait(mapping);
>
>         /* Block number less than F2FS MAX BLOCKS */
> -       if (unlikely(block >=3D max_file_blocks(inode)))
> +       if (unlikely(block >=3D max_file_blocks(F2FS_I_SB(inode), inode))=
)
>                 goto out;
>
>         if (f2fs_compressed_file(inode)) {
> @@ -4352,7 +4356,7 @@ static int check_swap_activate(struct swap_info_str=
uct *sis,
>          * to be very smart.
>          */
>         cur_lblock =3D 0;
> -       last_lblock =3D F2FS_BYTES_TO_BLK(i_size_read(inode));
> +       last_lblock =3D F2FS_BYTES_TO_BLK(sbi, i_size_read(inode));
>
>         while (cur_lblock < last_lblock && cur_lblock < sis->max) {
>                 struct f2fs_map_blocks map;
> @@ -4607,12 +4611,14 @@ static int f2fs_iomap_begin(struct inode *inode, =
loff_t offset, loff_t length,
>                             unsigned int flags, struct iomap *iomap,
>                             struct iomap *srcmap)
>  {
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         struct f2fs_map_blocks map =3D { NULL, };
>         pgoff_t next_pgofs =3D 0;
>         int err;
>
> -       map.m_lblk =3D F2FS_BYTES_TO_BLK(offset);
> -       map.m_len =3D F2FS_BYTES_TO_BLK(offset + length - 1) - map.m_lblk=
 + 1;
> +       map.m_lblk =3D F2FS_BYTES_TO_BLK(sbi, offset);
> +       map.m_len =3D F2FS_BYTES_TO_BLK(sbi, offset + length - 1) -
> +                                                       map.m_lblk + 1;
>         map.m_next_pgofs =3D &next_pgofs;
>         map.m_seg_type =3D f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>                                                 inode->i_write_hint);
> @@ -4633,7 +4639,7 @@ static int f2fs_iomap_begin(struct inode *inode, lo=
ff_t offset, loff_t length,
>         if (err)
>                 return err;
>
> -       iomap->offset =3D F2FS_BLK_TO_BYTES(map.m_lblk);
> +       iomap->offset =3D F2FS_BLK_TO_BYTES(sbi, map.m_lblk);
>
>         /*
>          * When inline encryption is enabled, sometimes I/O to an encrypt=
ed file
> @@ -4653,11 +4659,11 @@ static int f2fs_iomap_begin(struct inode *inode, =
loff_t offset, loff_t length,
>                 if (WARN_ON_ONCE(map.m_pblk =3D=3D NEW_ADDR))
>                         return -EINVAL;
>
> -               iomap->length =3D F2FS_BLK_TO_BYTES(map.m_len);
> +               iomap->length =3D F2FS_BLK_TO_BYTES(sbi, map.m_len);
>                 iomap->type =3D IOMAP_MAPPED;
>                 iomap->flags |=3D IOMAP_F_MERGED;
>                 iomap->bdev =3D map.m_bdev;
> -               iomap->addr =3D F2FS_BLK_TO_BYTES(map.m_pblk);
> +               iomap->addr =3D F2FS_BLK_TO_BYTES(sbi, map.m_pblk);
>
>                 if (flags & IOMAP_WRITE && map.m_last_pblk)
>                         iomap->private =3D (void *)map.m_last_pblk;
> @@ -4666,11 +4672,11 @@ static int f2fs_iomap_begin(struct inode *inode, =
loff_t offset, loff_t length,
>                         return -ENOTBLK;
>
>                 if (map.m_pblk =3D=3D NULL_ADDR) {
> -                       iomap->length =3D F2FS_BLK_TO_BYTES(next_pgofs) -
> +                       iomap->length =3D F2FS_BLK_TO_BYTES(sbi, next_pgo=
fs) -
>                                                         iomap->offset;
>                         iomap->type =3D IOMAP_HOLE;
>                 } else if (map.m_pblk =3D=3D NEW_ADDR) {
> -                       iomap->length =3D F2FS_BLK_TO_BYTES(map.m_len);
> +                       iomap->length =3D F2FS_BLK_TO_BYTES(sbi, map.m_le=
n);
>                         iomap->type =3D IOMAP_UNWRITTEN;
>                 } else {
>                         f2fs_bug_on(F2FS_I_SB(inode), 1);
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 5980b9d79afb..a6cfceafe2fe 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -343,7 +343,7 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
>         /* build nm */
>         si->base_mem +=3D sizeof(struct f2fs_nm_info);
>         si->base_mem +=3D __bitmap_size(sbi, NAT_BITMAP);
> -       si->base_mem +=3D F2FS_BLK_TO_BYTES(NM_I(sbi)->nat_bits_blocks);
> +       si->base_mem +=3D F2FS_BLK_TO_BYTES(sbi, NM_I(sbi)->nat_bits_bloc=
ks);
>         si->base_mem +=3D NM_I(sbi)->nat_blocks *
>                                 f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK(sbi)=
);
>         si->base_mem +=3D NM_I(sbi)->nat_blocks / 8;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b90c5a42703f..c625a2572841 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4016,7 +4016,7 @@ void f2fs_inode_synced(struct inode *inode);
>  int f2fs_dquot_initialize(struct inode *inode);
>  int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
>  int f2fs_do_quota_sync(struct super_block *sb, int type);
> -loff_t max_file_blocks(struct inode *inode);
> +loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode);
>  void f2fs_quota_off_umount(struct super_block *sb);
>  void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
>  void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
> @@ -5263,8 +5263,9 @@ static inline void f2fs_truncate_meta_inode_pages(s=
truct f2fs_sb_info *sbi,
>                                                         NULL, 0, DATA);
>
>         truncate_inode_pages_range(META_MAPPING(sbi),
> -                       F2FS_BLK_TO_BYTES((loff_t)blkaddr),
> -                       F2FS_BLK_END_BYTES((loff_t)(blkaddr + cnt - 1)));
> +                       F2FS_BLK_TO_BYTES(sbi, (loff_t)blkaddr),
> +                       F2FS_BLK_END_BYTES(sbi,
> +                                           (loff_t)(blkaddr + cnt - 1)))=
;
>  }
>
>  static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *s=
bi,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 2c72e028cec2..6fafb32bc5f2 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -513,7 +513,8 @@ static bool __found_offset(struct address_space *mapp=
ing,
>  static loff_t f2fs_seek_block(struct file *file, loff_t offset, int when=
ce)
>  {
>         struct inode *inode =3D file->f_mapping->host;
> -       loff_t maxbytes =3D F2FS_BLK_TO_BYTES(max_file_blocks(inode));
> +       loff_t maxbytes =3D F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
> +                       max_file_blocks(F2FS_I_SB(inode), inode));
>         struct dnode_of_data dn;
>         pgoff_t pgofs, end_offset;
>         loff_t data_ofs =3D offset;
> @@ -537,9 +538,10 @@ static loff_t f2fs_seek_block(struct file *file, lof=
f_t offset, int whence)
>                 }
>         }
>
> -       pgofs =3D (pgoff_t)(offset >> PAGE_SHIFT);
> +       pgofs =3D F2FS_BYTES_TO_BLK(F2FS_I_SB(inode), offset);
>
> -       for (; data_ofs < isize; data_ofs =3D (loff_t)pgofs << PAGE_SHIFT=
) {
> +       for (; data_ofs < isize;
> +                       data_ofs =3D F2FS_BLK_TO_BYTES(F2FS_I_SB(inode), =
pgofs)) {
>                 set_new_dnode(&dn, inode, NULL, NULL, 0);
>                 err =3D f2fs_get_dnode_of_data(&dn, pgofs, LOOKUP_NODE);
>                 if (err && err !=3D -ENOENT) {
> @@ -559,7 +561,7 @@ static loff_t f2fs_seek_block(struct file *file, loff=
_t offset, int whence)
>                 /* find data/hole in dnode block */
>                 for (; dn.ofs_in_node < end_offset;
>                                 dn.ofs_in_node++, pgofs++,
> -                               data_ofs =3D (loff_t)pgofs << PAGE_SHIFT)=
 {
> +                               data_ofs =3D F2FS_BLK_TO_BYTES(F2FS_I_SB(=
inode), pgofs)) {
>                         block_t blkaddr;
>
>                         blkaddr =3D f2fs_data_blkaddr(&dn);
> @@ -595,7 +597,8 @@ static loff_t f2fs_seek_block(struct file *file, loff=
_t offset, int whence)
>  static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
>  {
>         struct inode *inode =3D file->f_mapping->host;
> -       loff_t maxbytes =3D F2FS_BLK_TO_BYTES(max_file_blocks(inode));
> +       loff_t maxbytes =3D F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
> +                       max_file_blocks(F2FS_I_SB(inode), inode));
>
>         switch (whence) {
>         case SEEK_SET:
> @@ -846,9 +849,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 =
from, bool lock)
>                 goto out_err;
>         }
>
> -       free_from =3D (pgoff_t)F2FS_BLK_ALIGN(from);
> +       free_from =3D (pgoff_t)F2FS_BLK_ALIGN(sbi, from);
>
> -       if (free_from >=3D max_file_blocks(inode))
> +       if (free_from >=3D max_file_blocks(sbi, inode))
>                 goto free_partial;
>
>         if (lock)
> @@ -959,9 +962,10 @@ int f2fs_truncate_blocks(struct inode *inode, u64 fr=
om, bool lock)
>
>  int f2fs_truncate(struct inode *inode)
>  {
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         int err;
>
> -       if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> +       if (unlikely(f2fs_cp_error(sbi)))
>                 return -EIO;
>
>         if (!(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
> @@ -970,7 +974,7 @@ int f2fs_truncate(struct inode *inode)
>
>         trace_f2fs_truncate(inode);
>
> -       if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE))
> +       if (time_to_inject(sbi, FAULT_TRUNCATE))
>                 return -EIO;
>
>         err =3D f2fs_dquot_initialize(inode);
> @@ -986,8 +990,8 @@ int f2fs_truncate(struct inode *inode)
>                          * leak in evict() path.
>                          */
>                         truncate_inode_pages_range(inode->i_mapping,
> -                                       F2FS_BLK_TO_BYTES(0),
> -                                       F2FS_BLK_END_BYTES(0));
> +                                       F2FS_BLK_TO_BYTES(sbi, 0),
> +                                       F2FS_BLK_END_BYTES(sbi, 0));
>                         return err;
>                 }
>         }
> @@ -1161,7 +1165,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>                         return -EOPNOTSUPP;
>                 if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
>                         !IS_ALIGNED(attr->ia_size,
> -                       F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
> +                       F2FS_BLK_TO_BYTES(sbi, fi->i_cluster_size)))
>                         return -EINVAL;
>
>                 if (f2fs_is_pinned_file(inode)) {
> @@ -1177,7 +1181,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>                          * pinned file.
>                          */
>                         else if (!IS_ALIGNED(attr->ia_size,
> -                               F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi)))=
)
> +                               F2FS_BLK_TO_BYTES(sbi, CAP_BLKS_PER_SEC(s=
bi))))
>                                 return -EINVAL;
>                 }
>         }
> @@ -2648,7 +2652,8 @@ static int f2fs_keep_noreuse_range(struct inode *in=
ode,
>                                 loff_t offset, loff_t len)
>  {
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> -       u64 max_bytes =3D F2FS_BLK_TO_BYTES(max_file_blocks(inode));
> +       u64 max_bytes =3D F2FS_BLK_TO_BYTES(sbi,
> +                                       max_file_blocks(sbi, inode));
>         u64 start, end;
>         int ret =3D 0;
>
> @@ -3191,8 +3196,8 @@ static int f2fs_ioc_defragment(struct file *filp, u=
nsigned long arg)
>         if (range.start & (F2FS_BLKSIZE - 1) || range.len & (F2FS_BLKSIZE=
 - 1))
>                 return -EINVAL;
>
> -       if (unlikely((range.start + range.len) >> PAGE_SHIFT >
> -                                       max_file_blocks(inode)))
> +       if (unlikely(F2FS_BYTES_TO_BLK(sbi, range.start + range.len) >
> +                                       max_file_blocks(sbi, inode)))
>                 return -EINVAL;
>
>         err =3D mnt_want_write_file(filp);
> @@ -3326,9 +3331,9 @@ static int f2fs_move_file_range(struct file *file_i=
n, loff_t pos_in,
>         }
>
>         f2fs_lock_op(sbi, &lc);
> -       ret =3D __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(pos_in)=
,
> -                               F2FS_BYTES_TO_BLK(pos_out),
> -                               F2FS_BYTES_TO_BLK(len), false);
> +       ret =3D __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(sbi, po=
s_in),
> +                               F2FS_BYTES_TO_BLK(sbi, pos_out),
> +                               F2FS_BYTES_TO_BLK(sbi, len), false);
>
>         if (!ret) {
>                 if (dst_max_i_size)
> @@ -3994,7 +3999,7 @@ int f2fs_precache_extents(struct inode *inode)
>         map.m_next_extent =3D &m_next_extent;
>         map.m_seg_type =3D NO_CHECK_TYPE;
>         map.m_may_create =3D false;
> -       end =3D F2FS_BLK_ALIGN(i_size_read(inode));
> +       end =3D F2FS_BLK_ALIGN(F2FS_I_SB(inode), i_size_read(inode));
>
>         while (map.m_lblk < end) {
>                 map.m_len =3D end - map.m_lblk;
> @@ -4594,7 +4599,7 @@ static int f2fs_sec_trim_file(struct file *filp, un=
signed long arg)
>                 goto err;
>         }
>
> -       index =3D F2FS_BYTES_TO_BLK(range.start);
> +       index =3D F2FS_BYTES_TO_BLK(sbi, range.start);
>         pg_end =3D DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);
>
>         ret =3D f2fs_convert_inline_inode(inode);
> @@ -5385,7 +5390,8 @@ static int f2fs_preallocate_blocks(struct kiocb *io=
cb, struct iov_iter *iter,
>          * buffered IO, if DIO meets any holes.
>          */
>         if (dio && i_size_read(inode) &&
> -               (F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inod=
e))))
> +               (F2FS_BYTES_TO_BLK(sbi, pos) <
> +                F2FS_BLK_ALIGN(sbi, i_size_read(inode))))
>                 return 0;
>
>         /* No-wait I/O can't allocate blocks. */
> @@ -5406,8 +5412,8 @@ static int f2fs_preallocate_blocks(struct kiocb *io=
cb, struct iov_iter *iter,
>         }
>
>         /* Do not preallocate blocks that will be written partially in 4K=
B. */
> -       map.m_lblk =3D F2FS_BLK_ALIGN(pos);
> -       map.m_len =3D F2FS_BYTES_TO_BLK(pos + count);
> +       map.m_lblk =3D F2FS_BLK_ALIGN(sbi, pos);
> +       map.m_len =3D F2FS_BYTES_TO_BLK(sbi, pos + count);
>         if (map.m_len > map.m_lblk)
>                 map.m_len -=3D map.m_lblk;
>         else
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 7dabfada1b54..e7aa3b790214 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -3294,9 +3294,10 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *=
sbi)
>         if (!enabled_nat_bits(sbi, NULL))
>                 return 0;
>
> -       nm_i->nat_bits_blocks =3D F2FS_BLK_ALIGN((nat_bits_bytes << 1) + =
8);
> +       nm_i->nat_bits_blocks =3D F2FS_BLK_ALIGN(sbi,
> +                                              (nat_bits_bytes << 1) + 8)=
;
>         nm_i->nat_bits =3D f2fs_kvzalloc(sbi,
> -                       F2FS_BLK_TO_BYTES(nm_i->nat_bits_blocks), GFP_KER=
NEL);
> +                       F2FS_BLK_TO_BYTES(sbi, nm_i->nat_bits_blocks), GF=
P_KERNEL);
>         if (!nm_i->nat_bits)
>                 return -ENOMEM;
>
> @@ -3309,7 +3310,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *s=
bi)
>                 if (IS_ERR(folio))
>                         return PTR_ERR(folio);
>
> -               memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(i),
> +               memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(sbi, i),
>                                         folio_address(folio), F2FS_BLKSIZ=
E);
>                 f2fs_folio_put(folio, true);
>         }
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index aaa5227739c8..b52718741ddc 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -734,9 +734,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, =
struct inode *inode,
>                 }
>
>                 if (!file_keep_isize(inode) &&
> -                       (i_size_read(inode) <=3D ((loff_t)index << PAGE_S=
HIFT)))
> +                       (i_size_read(inode) <=3D F2FS_BLK_TO_BYTES(sbi, i=
ndex)))
>                         f2fs_i_size_write(inode,
> -                               (loff_t)(index + 1) << PAGE_SHIFT);
> +                               F2FS_BLK_TO_BYTES(sbi, index + 1));
>
>                 /*
>                  * dest is reserved block, invalidate src block
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index f565b6873832..f58b26c84b3a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3592,8 +3592,8 @@ static unsigned int __issue_discard_cmd_range(struc=
t f2fs_sb_info *sbi,
>
>  int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>  {
> -       __u64 start =3D F2FS_BYTES_TO_BLK(range->start);
> -       __u64 end =3D start + F2FS_BYTES_TO_BLK(range->len) - 1;
> +       __u64 start =3D F2FS_BYTES_TO_BLK(sbi, range->start);
> +       __u64 end =3D start + F2FS_BYTES_TO_BLK(sbi, range->len) - 1;
>         unsigned int start_segno, end_segno;
>         block_t start_block, end_block;
>         struct cp_control cpc;
> @@ -3624,7 +3624,8 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct f=
strim_range *range)
>         }
>
>         cpc.reason =3D CP_DISCARD;
> -       cpc.trim_minlen =3D max_t(__u64, 1, F2FS_BYTES_TO_BLK(range->minl=
en));
> +       cpc.trim_minlen =3D max_t(__u64, 1,
> +                               F2FS_BYTES_TO_BLK(sbi, range->minlen));
>         cpc.trim_start =3D start_segno;
>         cpc.trim_end =3D end_segno;
>
> @@ -3658,7 +3659,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct f=
strim_range *range)
>                                         start_block, end_block);
>  out:
>         if (!err)
> -               range->len =3D F2FS_BLK_TO_BYTES(trimmed);
> +               range->len =3D F2FS_BLK_TO_BYTES(sbi, trimmed);
>         return err;
>  }
>
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 46973207cd7b..b962c14cbcc1 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3884,7 +3884,7 @@ static const struct export_operations f2fs_export_o=
ps =3D {
>         .get_parent =3D f2fs_get_parent,
>  };
>
> -loff_t max_file_blocks(struct inode *inode)
> +loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode)
>  {
>         loff_t result =3D 0;
>         loff_t leaf_count;
> @@ -3918,7 +3918,8 @@ loff_t max_file_blocks(struct inode *inode)
>          * fit within U32_MAX + 1 data units.
>          */
>
> -       result =3D umin(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) *=
 4096));
> +       result =3D umin(result, F2FS_BYTES_TO_BLK(sbi,
> +                                               ((loff_t)U32_MAX + 1) * 4=
096));
>
>         return result;
>  }
> @@ -4370,7 +4371,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi=
)
>
>         nat_blocks =3D nat_segs << log_blocks_per_seg;
>         nat_bits_bytes =3D nat_blocks / BITS_PER_BYTE;
> -       nat_bits_blocks =3D F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
> +       nat_bits_blocks =3D F2FS_BLK_ALIGN(sbi, (nat_bits_bytes << 1) + 8=
);
>         if (__is_set_ckpt_flags(ckpt, CP_NAT_BITS_FLAG) &&
>                 (cp_payload + F2FS_CP_PACKS +
>                 NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >=3D blocks_per_=
seg)) {
> @@ -5193,7 +5194,7 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         if (err)
>                 goto free_options;
>
> -       sb->s_maxbytes =3D max_file_blocks(NULL) <<
> +       sb->s_maxbytes =3D max_file_blocks(sbi, NULL) <<
>                                 le32_to_cpu(raw_super->log_blocksize);
>         sb->s_max_links =3D F2FS_LINK_MAX;
>
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 39f482515445..ee838f880c4a 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -75,7 +75,8 @@ static int pagecache_write(struct inode *inode, const v=
oid *buf, size_t count,
>         struct address_space *mapping =3D inode->i_mapping;
>         const struct address_space_operations *aops =3D mapping->a_ops;
>
> -       if (pos + count > F2FS_BLK_TO_BYTES(max_file_blocks(inode)))
> +       if (pos + count > F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
> +                       max_file_blocks(F2FS_I_SB(inode), inode)))
>                 return -EFBIG;
>
>         while (count) {
> @@ -239,7 +240,8 @@ static int f2fs_get_verity_descriptor(struct inode *i=
node, void *buf,
>
>         /* Get the descriptor */
>         if (pos + size < pos ||
> -           pos + size > F2FS_BLK_TO_BYTES(max_file_blocks(inode)) ||
> +           pos + size > F2FS_BLK_TO_BYTES(F2FS_I_SB(inode),
> +                       max_file_blocks(F2FS_I_SB(inode), inode)) ||
>             pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
>                 f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
>                 f2fs_handle_error(F2FS_I_SB(inode),
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index f89609356be8..f622d26f37a7 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -28,10 +28,14 @@
>  #define COMPRESS_ADDR          ((block_t)-2)   /* used as compressed dat=
a flag */
>
>  #define F2FS_BLKSIZE_MASK              (F2FS_BLKSIZE - 1)
> -#define F2FS_BYTES_TO_BLK(bytes)       ((unsigned long long)(bytes) >> F=
2FS_BLKSIZE_BITS)
> -#define F2FS_BLK_TO_BYTES(blk)         ((unsigned long long)(blk) << F2F=
S_BLKSIZE_BITS)
> -#define F2FS_BLK_END_BYTES(blk)                (F2FS_BLK_TO_BYTES(blk + =
1) - 1)
> -#define F2FS_BLK_ALIGN(x)              (F2FS_BYTES_TO_BLK((x) + F2FS_BLK=
SIZE - 1))
> +#define F2FS_BYTES_TO_BLK(sbi, bytes)                                  \
> +       ((unsigned long long)(bytes) >> (sbi)->log_blocksize)
> +#define F2FS_BLK_TO_BYTES(sbi, blk)                                    \
> +       ((unsigned long long)(blk) << (sbi)->log_blocksize)
> +#define F2FS_BLK_END_BYTES(sbi, blk)                                   \
> +       (F2FS_BLK_TO_BYTES(sbi, (blk) + 1) - 1)
> +#define F2FS_BLK_ALIGN(sbi, x)                                         \
> +       DIV_ROUND_UP_ULL((x), (sbi)->blocksize)

DIV_ROUND_UP_ULL() expands internally to do_div().

Please restore the original bit-shifting style using F2FS_BYTES_TO_BLK:
    #define F2FS_BLK_ALIGN(sbi, bytes) \
        F2FS_BYTES_TO_BLK(sbi, (unsigned long long)(bytes) +
F2FS_BLKSIZE(sbi) - 1)

This avoids unnecessary 64-bit division overhead on hot I/O and block
calculation paths.

Thanks,

>
>  /* 0, 1(node nid), 2(meta nid) are reserved node id */
>  #define F2FS_RESERVED_NODE_NUM         3
> --
> 2.53.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
