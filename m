Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8705383E5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703710; cv=pass; b=eAh+GtjPASyUGCssv63JibULUEiq2IcFjU+QAPrdvMiexA1RxDge14zzTCFgMxrO795HoHnW3yhBybCIR5NBUZXpKFFUozh0UgZz28JnghTettHeQKzRi9iCTtoy9pGIwTzfED1CF0V7PL4eWyFdaedtQc6bcQ4B0HtMddEVRes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703710; c=relaxed/simple;
	bh=6hZr48jEFD51PszLt5GztUhNag+F+uq16fGJij2d40s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3c/4EKXhcUoPhSRk7EOMWTbO2uu+n1tIjOzbiMOBzWpZOomtjnbOrW5ouup8gfkGufxI1Rh+nOfRp3Yenp0JjQmb5U1iNG2lQ+Lo2u0ybZVmo5f7R5G8+kC+r5Rtuq9UCr8OwQPH1dhzTZvU2stXZVAKN/pik3uBmERLdh5xoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTaxJ/EV; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTaxJ/EV"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so43728461fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790703707; cv=none;
        d=google.com; s=arc-20260327;
        b=AETzS3pGV0/T/MlTjmWXPA+YLZYuuwy5tdzy0FcO5r5XQ4pDG9ALUuLQYFqpB3+ixp
         gOza3+Nfl4Nx9xYQ9TtZApSQ885TI6y9jEyfE6B01YD4Ugl5QFqoHFmbB/wDvwVCN9hz
         12WNVigwYwFbb/fZCJZQR1kiUbHM4xVAVY+o4yroB8/HZ+2ac6aIHpoxFqM6GV441Y7h
         fcR8esu3aBE1afBLBy4jWhT0MdOUadd6sJzzYL5Txb5q06Mq+joz8y2qY8qRGYIF/vqR
         PdFa4SohEh7bJxqflxTAV7EVLyVz5mDa9DO1aa//Ok8d34CSe76y3oEzLTyc9J9QVYTF
         MI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WUIfndKy42FfCD32cKOE5FlbFYY6BOSlgOK5Uj8Z/wo=;
        fh=q4DTay6sh4IA6sIUU5wtn9UeVEwViJLC9o0UluXwZBk=;
        b=loELMnOMbMKykeaZFLi56gNQ9/Iq1sxFHsObx1GUatK24Rdu5CN2r5Zk/2BDli04IP
         0hXU+b8r9EDjYemLgthBqdr42V7mGVnAhE6OBm8gkxDbnBGM/VH6rsV/TodzVWnP2vQR
         zCUafO2mVsc8b4f+idP8CMQ4uhk36VNfd61r3e59n+jSFrAWGm21lTJAWAgdvp7g+AoV
         cYFWcMvw4j5tpo5PIVXNYvIa1D86wR5cO61uJ4z5u8BPjxEy+M09J5VYcsoc3HXmbnV2
         SM7vA2kxcXdHMheOvMnY4V330Js/g+rFqBWI2LyEci4Oom5CQr7m/vP8iaUHwBFGgJJz
         oCkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703707; x=1791308507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WUIfndKy42FfCD32cKOE5FlbFYY6BOSlgOK5Uj8Z/wo=;
        b=TTaxJ/EV+7KYru5tt0fvo+2Xj5rJtt7qXAccTkOk+GyuxkhtKXAim7pv7VUJjjFhwl
         0G/GxGQeH/ZyBm1Ta5JgAJ9RgKOQCRDNKCvDDtwYFKsp/+bCm11UoFGTJFmi2vsK+5M/
         HG8KNSgty4muojKfw4yPYKZFLiiUMuloehCoFDQgjIB0eu5+Ho/rC9LUhRR30QatwQdR
         rG7Q0i1Z/dxxXHc+SnbMJZslB/peumOR5wmcwq5CnpKJDhSoimqIHahhXdgafoIqN7pU
         B9/5RRcz6sBAnKnR2gHxV7SjX9DW3FTuG7yctYun+TEU7soCpNuGCrZbYoV4hi/y+L/b
         XJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703707; x=1791308507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUIfndKy42FfCD32cKOE5FlbFYY6BOSlgOK5Uj8Z/wo=;
        b=aKa94aoqBdZRsrNWXGtCEfbxU0b36OU0M9LDgnmmmxmqp55CohqnVsssAr9iJ7RtPd
         joRt3BsvCooNwubkOS9TBthWKW5kt4LPhG7hceba9KkmcmFICUfxeH7qSzhfk8G0B/FY
         9v+Saxvu3lKjEXm/gx6wF+KWgEIL7dmkdIGBrSsb5NB3XlZ8gEK74CkEySou+sHOUUoB
         dml5kP1WZZzdAPHFbZUDpGghBJ1CiFZAKV8dAiGYHBa8GVI/7iUGmpxGTyEkLxe4ai1K
         22OthResuvGwB6hb+wQEWXAPL4gAkyXeOIwIZaopr1UPCHs7XPRVDM22+r74wL1VVbeQ
         vj2w==
X-Forwarded-Encrypted: i=1; AKwUvBxwFoBg2igbni4RBoJdOf9w7XcvlyrA3cIyp8OOtHtd3fjkrCa7UozAQrrERz0M/sSYSTarf3wuBmpjWKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLoIOHuikzXp06KZJepQCBIvIg0HKBLHZUDkjNoxsRcXdID7U3
	lkflzMzNqBBGlnjJD5rY1jceNFgD1/9urx0ix4itRgtdIQOx8GROdvBqqM4PHIjvEJ1j0NCQbow
	FDQaTWTg0an/y/fqrdV0dVqpwBgU2wAY=
X-Gm-Gg: AYBFou0GIN6StuCzCuGPYuFl46G6Gnm2RAE89uGBQyZavmcfCPsEXFwC+vgjY4TKSps
	U0dZL/libKKLLfnT2dtriyWJvxNgEio5HTu6uDX7AErF4pG/N8w/W7wo76mRwXUOayTriNWjRI2
	iiv+EFV2RyfRImhmEx2XzmaQ5FKTlBolJyDFdTL2AnD43PKC3ssEHAYQmfnJkjLimeDamUfFOO7
	UN3sdHlL2QdfNI4kHnr+nQXGLNO2WFUm/5O2Jvnro8tLmp54ku+aiZnfkJJ0j2o5PqXf4ntkdF3
	Jfji7anUbXxihPIbroK2qL9f5BPicm5zRaUrsdD+b1ikk+0c0MRPBLXSq4Su5qf5kuoDXfvX+OP
	GohlCvxDLOkTnqVIngoFxvaDYToqrbpziAQ0CXOBJrG6zUAFU6tom
X-Received: by 2002:a05:651c:2229:b0:3a7:5ff2:576 with SMTP id
 38308e7fff4ca-3a7716ee3f4mr751631fa.1.1790703706221; Tue, 29 Sep 2026
 10:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com> <20260915041909.2903887-4-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260915041909.2903887-4-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 29 Sep 2026 10:41:33 -0700
X-Gm-Features: AclHuK-lLmkYpDOeM31DUT7rDx7aaF3HMiRhtEpA-0GkJcl8yWRE9qUsmQUnKLc
Message-ID: <CACOAw_zwgUPLkU5BJGE3p2fXecEncPYwRAq0hOB71oks0JUpPQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 03/14] f2fs: support regular file buffered
 writes on large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 9:24=E2=80=AFPM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> To avoid the complexity of unlocking a large folio in write_begin,
> preallocate partial blocks for inodes that can use large folios.
> During write_begin, read only the partial head and tail 4K subpages
> that need read-before-write, and skip read I/O for the full middle
> subpages covered by the write.
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 300 +++++++++++++++++++++++++++++++++++++++++++++++--
>  fs/f2fs/f2fs.h |   1 +
>  fs/f2fs/file.c |  17 ++-
>  3 files changed, 304 insertions(+), 14 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f14044e8a6f4..a490df4f50b3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1233,6 +1233,35 @@ static void f2fs_submit_page_read(struct inode *in=
ode, struct fsverity_info *vi,
>         f2fs_submit_read_bio(sbi, bio, DATA);
>  }
>
> +/*
> + * Synchronously read a single 4K subpage by reusing f2fs_submit_page_re=
ad()
> + * so that iostat, trace, blk-crypto and post-read handling are all pres=
erved.
> + * The caller must have already allocated ffs for the folio.
> + */
> +static int f2fs_submit_page_read_sync(struct inode *inode, struct folio =
*folio,
> +                                     pgoff_t index, block_t blkaddr)
> +{
> +       struct f2fs_folio_state *ffs =3D folio->private;
> +
> +       /* Add bias so end_io does not call folio_end_read(). */
> +       f2fs_update_read_folio_pending(folio, 1);
> +
> +       f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
> +                             REQ_OP_READ, false);
> +
> +       /* Wait until all bios have completed (pending drops back to our =
bias). */
> +       while (READ_ONCE(ffs->read_pages_pending) !=3D 1)
> +               f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
> +
> +       /* Remove the bias. */
> +       f2fs_update_read_folio_pending(folio, -1);
> +
> +       if (!f2fs_ffs_test_blk_uptodate(folio, index))
> +               return -EIO;
> +
> +       return 0;
> +}
> +
>  static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr=
)
>  {
>         __le32 *addr =3D get_dnode_addr(dn->inode, dn->node_folio);
> @@ -2570,6 +2599,114 @@ static void ffs_detach_free(struct folio *folio)
>         kfree(ffs);
>  }
>
> +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index=
)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned int idx;
> +
> +       f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
> +
> +       if (folio_test_uptodate(folio))
> +               return true;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return false;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       idx =3D index - folio->index;
> +       return test_bit(idx, ffs->state);
> +}
> +
> +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> +               struct f2fs_folio_state *ffs, size_t offset, size_t len)
> +{
> +       unsigned int nr_subpages =3D folio_nr_pages(folio);
> +       unsigned int start, end;
> +
> +       start =3D offset >> PAGE_SHIFT;
> +       end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +       end =3D min(end, nr_subpages);
> +
> +       bitmap_set(ffs->state, start, end - start);
> +       return bitmap_full(ffs->state, nr_subpages);
> +}
> +
> +static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t =
offset,
> +                                      size_t len)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned long flags;
> +       bool mark_uptodate =3D false;
> +
> +       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +       if (!f2fs_folio_has_ffs(folio)) {
> +               folio_mark_uptodate(folio);
> +               return;
> +       }
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       mark_uptodate =3D __ffs_mark_subrange_uptodate(folio, ffs, offset=
, len) &&
> +                       !ffs->read_pages_pending;
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +       if (mark_uptodate)
> +               folio_mark_uptodate(folio);
> +}
> +
> +static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> +                                   size_t offset, size_t len)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned int nr_subpages, start, end;
> +       unsigned long flags;
> +
> +       f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       nr_subpages =3D folio_nr_pages(folio);
> +       start =3D offset >> PAGE_SHIFT;
> +       end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +       end =3D min(end, nr_subpages);
> +
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       bitmap_set(ffs->state, nr_subpages + start, end - start);
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
> +static bool find_next_valid_block(const struct folio *folio,
> +                                 size_t orig_off, size_t *need_off,
> +                                 size_t len)
> +{
> +       size_t start =3D orig_off;
> +       size_t end =3D start + len;
> +       size_t head, tail;
> +       pgoff_t index;
> +
> +       if (start & (PAGE_SIZE - 1)) {
> +               head =3D round_down(start, PAGE_SIZE);
> +               index =3D folio->index + (head >> PAGE_SHIFT);
> +               if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +                       *need_off =3D head;
> +                       return true;
> +               }
> +       }
> +
> +       if (end & (PAGE_SIZE - 1)) {
> +               tail =3D round_down(end - 1, PAGE_SIZE);
> +               index =3D folio->index + (tail >> PAGE_SHIFT);
> +               if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> +                       *need_off =3D tail;
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static int f2fs_read_data_large_folio(struct inode *inode,
>                 struct fsverity_info *vi,
>                 struct readahead_control *rac, struct folio *folio)
> @@ -3927,6 +4064,110 @@ static int prepare_atomic_write_begin(struct f2fs=
_sb_info *sbi,
>         return 0;
>  }
>
> +static int prepare_large_folio_write_begin(struct inode *inode,
> +                                         struct folio *folio, loff_t pos=
,
> +                                         unsigned int len)
> +{
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> +       struct f2fs_folio_state *ffs;
> +       size_t ori_off =3D offset_in_folio(folio, pos);
> +       size_t need_off =3D ori_off;
> +       int err =3D 0;
> +
> +       len =3D min_t(unsigned int, len, folio_size(folio) - ori_off);
> +
> +       /*
> +        * When folio minimum order is non-zero, the fsverity
> +        * page_cache_write() path enters f2fs_write_begin() via
> +        * aops->write_begin without going through f2fs_write_iter(),
> +        * so preallocation from f2fs_write_iter() is skipped.  In that
> +        * case, if FI_PREALLOCATED_ALL is not set, we must preallocate
> +        * the write blocks here.
> +        */
> +       if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL)) {
> +               struct f2fs_map_blocks map =3D {};
> +
> +               map.m_lblk =3D F2FS_BYTES_TO_BLK(sbi, pos);
> +               map.m_len =3D F2FS_BLK_ALIGN(sbi, pos + len) - map.m_lblk=
;
> +
> +               if (!IS_DEVICE_ALIASING(inode))
> +                       map.m_may_create =3D true;
> +               map.m_seg_type =3D NO_CHECK_TYPE;
> +
> +               err =3D f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_A=
IO);
> +               if (err)
> +                       return err;
> +       }

Hi Nanzhe,

This runs with the folio locked, but f2fs_map_blocks() with m_may_create
calls f2fs_balance_fs(), right? If foreground GC then needs this
folio, it can deadlock.

The comment only mentions the fsverity path, but the condition is just
!FI_PREALLOCATED_ALL, so regular writes can get here too: Maybe, short writ=
es
(fault_in fails), partial preallocation on -ENOSPC/-EDQUOT, and DIO
falling back to buffered I/O. On the fsverity path, FI_PREALLOCATED_ALL
is never set, so it always runs this with the folio locked.

How about only reserving blocks here, without balancing (e.g.
f2fs_reserve_block() and collecting node_changed)? f2fs_write_begin()
could then do the balance after unlocking and putting the folio, and
retry with "goto repeat".

Thanks,

> +
> +       ffs =3D f2fs_ffs_find_or_alloc(folio);
> +       if (!ffs)
> +               return -ENOMEM;
> +
> +       /* Skip read if the folio is already fully uptodate or the write
> +        * covers the entire folio.
> +        */
> +       if (folio_test_uptodate(folio) || len =3D=3D folio_size(folio))
> +               return 0;
> +
> +       if (!f2fs_verity_in_progress(inode) &&
> +           !(pos & (PAGE_SIZE - 1)) && (pos + len) >=3D i_size_read(inod=
e)) {
> +               size_t zoff =3D ori_off + len;
> +
> +               if (zoff < folio_size(folio))
> +                       folio_zero_segment(folio, zoff, folio_size(folio)=
);
> +               return 0;
> +       }
> +
> +       /* Inline data must have been converted before reaching here. */
> +       f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> +
> +       while (find_next_valid_block(folio, ori_off,
> +                                    &need_off, len)) {
> +               struct dnode_of_data dn;
> +               pgoff_t index =3D folio->index + (need_off >> PAGE_SHIFT)=
;
> +               block_t blkaddr;
> +               bool get_dn =3D false;
> +
> +               if (!f2fs_lookup_read_extent_cache_block(inode, index,
> +                                                       &blkaddr)) {
> +                       if (IS_DEVICE_ALIASING(inode))
> +                               return -ENODATA;
> +
> +                       set_new_dnode(&dn, inode, NULL, NULL, 0);
> +                       err =3D f2fs_get_dnode_of_data(&dn, index, LOOKUP=
_NODE);
> +                       if (err)
> +                               return err;
> +                       get_dn =3D true;
> +                       blkaddr =3D dn.data_blkaddr;
> +
> +                       if (blkaddr =3D=3D NEW_ADDR) {
> +                               size_t off =3D offset_in_folio(folio,
> +                                                            index << PAG=
E_SHIFT);
> +
> +                               folio_zero_segment(folio, off, off + PAGE=
_SIZE);
> +                               f2fs_ffs_mark_subrange_uptodate(folio, of=
f,
> +                                                              PAGE_SIZE)=
;
> +                               goto out;
> +                       }
> +
> +                       if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +                                                 DATA_GENERIC_ENHANCE_RE=
AD)) {
> +                               err =3D -EFSCORRUPTED;
> +                               goto out;
> +                       }
> +               }
> +
> +               err =3D f2fs_submit_page_read_sync(inode, folio, index, b=
lkaddr);
> +out:
> +               if (get_dn)
> +                       f2fs_put_dnode(&dn);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
>  static int f2fs_write_begin(const struct kiocb *iocb,
>                             struct address_space *mapping,
>                             loff_t pos, unsigned len, struct folio **foli=
op,
> @@ -3938,6 +4179,7 @@ static int f2fs_write_begin(const struct kiocb *ioc=
b,
>         pgoff_t index =3D pos >> PAGE_SHIFT;
>         bool need_balance =3D false;
>         block_t blkaddr =3D NULL_ADDR;
> +       fgf_t fgp =3D FGP_LOCK | FGP_WRITE | FGP_CREAT;
>         int err =3D 0;
>
>         trace_f2fs_write_begin(inode, pos, len);
> @@ -3985,9 +4227,15 @@ static int f2fs_write_begin(const struct kiocb *io=
cb,
>          * Do not use FGP_STABLE to avoid deadlock.
>          * Will wait that below with our IO control.
>          */
> -       folio =3D f2fs_filemap_get_folio(mapping, index,
> -                               FGP_LOCK | FGP_WRITE | FGP_CREAT,
> -                               mapping_gfp_mask(mapping));
> +       /*
> +        * Inline data is carried in the first subpage.  Keep the index #=
0
> +        * folio order-0 so that the existing inline read/convert paths
> +        * (prepare_write_begin()) still apply; large folios are used fro=
m
> +        * the second folio on.
> +        */
> +       fgp |=3D fgf_set_order(f2fs_has_inline_data(inode) ? PAGE_SIZE : =
len);
> +       folio =3D f2fs_filemap_get_folio(mapping, index, fgp,
> +                                     mapping_gfp_mask(mapping));
>         if (IS_ERR(folio)) {
>                 err =3D PTR_ERR(folio);
>                 goto fail;
> @@ -4000,7 +4248,7 @@ static int f2fs_write_begin(const struct kiocb *ioc=
b,
>         if (f2fs_is_atomic_file(inode))
>                 err =3D prepare_atomic_write_begin(sbi, folio, pos, len,
>                                         &blkaddr, &need_balance);
> -       else
> +       else if (!folio_test_large(folio))
>                 err =3D prepare_write_begin(sbi, folio, pos, len,
>                                         &blkaddr, &need_balance);
>         if (err)
> @@ -4021,6 +4269,14 @@ static int f2fs_write_begin(const struct kiocb *io=
cb,
>
>         f2fs_folio_wait_writeback(folio, DATA, false, true);
>
> +       if (folio_test_large(folio)) {
> +               err =3D prepare_large_folio_write_begin(inode,
> +                                       folio, pos, len);
> +               if (!err)
> +                       return 0;
> +               goto put_folio;
> +       }
> +
>         if (len =3D=3D folio_size(folio) || folio_test_uptodate(folio))
>                 return 0;
>
> @@ -4081,15 +4337,20 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
>         trace_f2fs_write_end(inode, pos, len, copied);
>
>         /*
> -        * This should be come from len =3D=3D PAGE_SIZE, and we expect c=
opied
> -        * should be PAGE_SIZE. Otherwise, we treat it with zero copied a=
nd
> -        * let generic_perform_write() try to copy data again through cop=
ied=3D0.
> +        * If a short copy happens on a folio that isn't uptodate, we tre=
at
> +        * it with zero copied and let generic_perform_write() try to cop=
y
> +        * data again through copied=3D0.
>          */
>         if (!folio_test_uptodate(folio)) {
> -               if (unlikely(copied !=3D len))
> +               if (unlikely(copied !=3D len)) {
>                         copied =3D 0;
> -               else
> +               } else if (folio_test_large(folio)) {
> +                       f2fs_ffs_mark_subrange_uptodate(folio,
> +                                       offset_in_folio(folio, pos), len)=
;
> +               } else {
> +                       /* This should be come from len =3D=3D PAGE_SIZE =
*/
>                         folio_mark_uptodate(folio);
> +               }
>         }
>
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -4108,6 +4369,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
>         if (!copied)
>                 goto unlock_out;
>
> +       if (folio_test_large(folio))
> +               f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio=
, pos),
> +                                                                  copied=
);
>         folio_mark_dirty(folio);
>
>         if (f2fs_is_atomic_file(inode))
> @@ -4170,8 +4434,22 @@ static bool f2fs_dirty_data_folio(struct address_s=
pace *mapping,
>
>         trace_f2fs_set_page_dirty(folio, DATA);
>
> -       if (!folio_test_uptodate(folio))
> -               folio_mark_uptodate(folio);
> +       if (!folio_test_uptodate(folio)) {
> +               bool uptodate =3D true;
> +
> +               if (f2fs_folio_has_ffs(folio)) {
> +                       struct f2fs_folio_state *ffs =3D
> +                               (struct f2fs_folio_state *)folio->private=
;
> +                       unsigned long flags;
> +
> +                       spin_lock_irqsave(&ffs->state_lock, flags);
> +                       uptodate =3D bitmap_full(ffs->state, folio_nr_pag=
es(folio)) &&
> +                                  !ffs->read_pages_pending;
> +                       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +               }
> +               if (uptodate)
> +                       folio_mark_uptodate(folio);
> +       }
>         BUG_ON(folio_test_swapcache(folio));
>
>         if (filemap_dirty_folio(mapping, folio)) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 326382ede1c3..8eccca6e5d27 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4392,6 +4392,7 @@ int f2fs_write_single_data_page(struct folio *folio=
, int *submitted,
>                                 struct writeback_control *wbc,
>                                 enum iostat_type io_type,
>                                 int compr_blocks, bool allow_balance);
> +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index=
);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t le=
ngth);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b0bdc7a977b9..9071bd23e57b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5412,9 +5412,20 @@ static int f2fs_preallocate_blocks(struct kiocb *i=
ocb, struct iov_iter *iter,
>                         return ret;
>         }
>
> -       /* Do not preallocate blocks that will be written partially in 4K=
B. */
> -       map.m_lblk =3D F2FS_BLK_ALIGN(sbi, pos);
> -       map.m_len =3D F2FS_BYTES_TO_BLK(sbi, pos + count);
> +       if (!dio && mapping_large_folio_support(inode->i_mapping)) {
> +               /*
> +                * Preallocate all blocks touched by a large-folio buffer=
ed write so
> +                * the regular write_begin path does not need to unlock t=
he folio for
> +                * f2fs_balance_fs().  Rechecking large-folio state after=
 unlock is
> +                * unreliable since partial truncation can split the foli=
o.
> +                */
> +               map.m_lblk =3D F2FS_BYTES_TO_BLK(sbi, pos);
> +               map.m_len =3D F2FS_BLK_ALIGN(sbi, pos + count);
> +       } else {
> +               /* Do not preallocate blocks that will be written partial=
ly in 4KB. */
> +               map.m_lblk =3D F2FS_BLK_ALIGN(sbi, pos);
> +               map.m_len =3D F2FS_BYTES_TO_BLK(sbi, pos + count);
> +       }
>         if (map.m_len > map.m_lblk)
>                 map.m_len -=3D map.m_lblk;
>         else
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
