Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3D233944
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960568; cv=pass; b=eHhAb3Lnl330gNuf8wHlzHdnfSF+y+7NjCeQuD6sp6ucL/gk5I60uCxDP7WYz+cC4hGoYwWCp09tz8AdCiEChqTkA6B+JJ7QVokZu0M1rSCgWb5qVShEPkd0ERmzONQfrVqzzzRmmccM8C1X4aHAo6bVU6GYuCR+PlTIr11QkzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960568; c=relaxed/simple;
	bh=n0enLzbUPaDbaQ3AQmg8/C5E5251+vIm6L7iitB2Wu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKTYxA14RFXwkRCKCTdjLlK7ciZQHqwegTVZz3RwnuIc8T02k7Dm0qbJnssVKEpzpMdceUDQv4xqz2nAbYMg4lXRfx0+OoGoX/Y4d8mtTBaIWf9iYbbjVzoF9+JV9EqamCIVdKo7Ml4VWP/9HLHxRP8fuIeYhEBiFXQfsVSnN4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AR0W8p86; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AR0W8p86"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso854091fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960564; cv=none;
        d=google.com; s=arc-20260327;
        b=dSl2tlqYISUWAoHzT2qVOwgtoiUe9sJy5egLVhgQlTkMoMFWs8ux3paaI1DisJKVb/
         Ua+9hglsKI8QVsXLQ8JmIRxwHGqtvSZ6TmThhGYexzB+c6ByLVFNF2qYPMDzvnGbQ3D1
         +ZKH0JaH1WGWfZSSZ9n6D0pFqffKheg2rtA/tlW/FDjcpkLBtTb753j7H/u8QvtzcC9Z
         c0SAS2zTIZeln28bUWVK2cZwg7THhPb/fDxbIZzrdcLgaRkVcozcb2SnkRy1OwVwBEQG
         OpmZ2eNhMke/wtWwySNxBJMzPW0HhuChwIX+XGg/3seZPa1W9G1SWVAYqpSn66fGKSvl
         0uBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pc+uGXWy1Ry/Hp9WEJvAlnTEZ4y1IvMN98W9keqYmpo=;
        fh=5X32ywXdGGqDE57DUcLk85L1XW7RBs0qhR3qjcwx3og=;
        b=Qr7hZc21RutHXDAqxZWUXu4GTsuFhPAnnDUHi5eKwp1Cw2K6IKQmegk6aZmyR2qmqS
         SPjyFIIWR0yzdFOA/DS97lKMcWR9PJuQqFZVMnjxT6fwb4xSdiwzBLTGSZt9O1oVqiCd
         W8LMxpLk32ePioLDG+n+7QXCtjDpB90Gn5sfIW4sulKFqWCxhbrQYWQGb24mujL72B3e
         TloGwvGWivsHieEaNiNFzF/NpuwtK71k2IG1KlKhG2QXLUElVOzjPtnxSbfedK3HDVlZ
         cAe4dH7izAQ/gQFob27VD/UWSlO6RErMiFOde0hv0AuL/3QQMlZNfIRXEOPS6THFb5ER
         7zkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960564; x=1791565364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pc+uGXWy1Ry/Hp9WEJvAlnTEZ4y1IvMN98W9keqYmpo=;
        b=AR0W8p86JU9Y2BXcj9qhRI/FxU9ro1vGcVWAB3u/xZ3zof9S15x6FjNMCukdcZW1SR
         wXh2Li8hEscDVJ7YNx72Eb/LpBGVSJMsG4TTrSWOH9m5curEvMv5d5c4BwBDP36ooPdV
         5e3wHvPUl46n3joLIauzHJYp3lD2GgdbLeGho5ScklxGAfqTC1hC2ZV7MevKfczgpECt
         gT/pLfqsXgPFQl5z84uiDpZkGpShbBVbeK3fDCfudsph+00sj9AgDMyS6P0V+raci1MG
         Qf4Ie3IWHb/1swIJ8YRK0o9czPO7w6ztPaT0Kxo4wVvL6TQkf/MFs7zFng/7/UeMBa5/
         IOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960564; x=1791565364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pc+uGXWy1Ry/Hp9WEJvAlnTEZ4y1IvMN98W9keqYmpo=;
        b=m9b2RzG5I+UxKUW5K1hZmvMYp3dDloDoPlaqz8YfFIw83YX3yoznEUeWTr62zlklTa
         I2aFPWNrtooB9Va2sxAkk5SzOPZlDDS0WvJdDE4HucRQCtxfMy7cl1hRMsCc+zoMQqKq
         8A9xqrUjUIOFgXpdETtQqFIanw1S4cxDQp83Skz3cS/GhNQ9E4i+mcYhmsfDud0VGJZw
         W93Bb8kqkeJNEjAHpwPzFn7cCdNphG+uPhhuvOSWHN0AcDPwT6cJtWjRLdLxJGGUW8XP
         Yw+Y2scDWm0RVFeoU76OBOaqesHw8+G1n9HVcrJjH/18qyTttv6OEM3LiROHGw/Dhdpk
         1sJg==
X-Forwarded-Encrypted: i=1; AKwUvByjqA8qkI/Gp2e4pa5fEa3Zn9d+vNuu3LzTlqz/5vXFqRF6SQTa4YAQD6LMbocAPGCQHVbvViQbIt1fzbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYYQD9RhN9aXMAx1JVuDfwZUOqAjQCA4ZVccKh09LjRsfzZhWj
	stzCOmVYf34BcZHDd4B478+Jh/5gfvoB3KcpIpUPWRb4BOeWHLeHyPzCu83KJk61trCVQXGIyRp
	0XxJFr7wU26tmN+3+fIFeAbyUB2dIfxA=
X-Gm-Gg: AYBFou3qZX1bZZ202ANJm4he3RuBrr9IghKXXfBqrcaTRv7nMsFR/DbXC0qiCMcYca5
	0BbSXBYBgS5S+PH+qn1s1NXPBwby7/Tlhi/UPIq0n/KBJXSG48EICOft4RC1pLsqX5P2FC27vgA
	K/YUT0uPHn+veJLMh2NkvuV5cMds7kV9fci6qGoFuRfOs3zKRp/8Z0i7m+b4YWl86vphWfPadaG
	4EplihIPGdd6a9UrugvfXqowuBc0HRoiwF/NbvyuazZg4XfuHmIwha/kuKXPDrHJ74HHZ5pTcI/
	dxoFgBLmLDOK+oGYU3hJ7X6VGP1RyhaOX2NkQxl59fBxNeNh6Wz+R3uYpnQW6+kiE84m/IXJRjs
	MFDY2sy3QuNXVqEt9tFT/080ihRpX+TXSdpvbPNALcw==
X-Received: by 2002:a2e:bea6:0:b0:3a7:5ff2:576 with SMTP id
 38308e7fff4ca-3a87ed41ebfmr8836311fa.1.1790960562687; Fri, 02 Oct 2026
 10:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com> <20260915041909.2903887-4-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260915041909.2903887-4-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 2 Oct 2026 10:02:29 -0700
X-Gm-Features: AclHuK8Fi2HsSHh_jc3avIzC3MNozlilbnHXsjM3xezp2qFPLXQ2KX6YSes6Z0Q
Message-ID: <CACOAw_xYg6tDsYARD_7vvBpsQWHG0EtXNG1nHnufPUz0tyZakg@mail.gmail.com>
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

Hi Nanzhe,

generic_perform_write() only keeps [pos, pos + len) from crossing a
mapping_max_folio_size() boundary; it does not limit len to the folio
that ->write_begin() returns. Without large folios this kept the range
within one page, so the order-0 path could use len as is. With large
folios enabled for regular files, len can extend beyond an order-0
folio, but the order-0 path still uses the raw len:

 - "len =3D=3D folio_size(folio)" is taken to mean that the whole folio
   will be overwritten, so the folio is not read.
 - prepare_write_begin() skips the block lookup when
   "len =3D=3D PAGE_SIZE" and FI_PREALLOCATED_ALL is set.

prepare_large_folio_write_begin() already clamps len to the folio. The
order-0 path needs the same. I use a separate variable so that the
large folio path still gets the original len when the folio is looked
up again after "goto repeat":

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ static int f2fs_write_begin(struct file *file, struct address_space *map=
ping,
  pgoff_t index =3D pos >> PAGE_SHIFT;
  bool need_balance =3D false;
  block_t blkaddr =3D NULL_ADDR;
+ unsigned int blen;
  int err =3D 0;

@@ static int f2fs_write_begin(struct file *file, struct address_space *map=
ping,

  *foliop =3D folio;

+ /*
+ * generic_perform_write() does not limit len to this folio, so it
+ * may extend beyond an order-0 folio.
+ */
+ blen =3D min_t(unsigned int, len,
+     folio_size(folio) - offset_in_folio(folio, pos));
+
  if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
- err =3D prepare_atomic_write_begin(sbi, folio, pos, len,
+ err =3D prepare_atomic_write_begin(sbi, folio, pos, blen,
  &blkaddr, &need_balance);
  else if (!folio_test_large(folio))
- err =3D prepare_write_begin(sbi, folio, pos, len,
+ err =3D prepare_write_begin(sbi, folio, pos, blen,
  &blkaddr, &need_balance);
  if (err)
  goto put_folio;
@@ static int f2fs_write_begin(struct file *file, struct address_space *map=
ping,
  goto put_folio;
  }

- if (len =3D=3D folio_size(folio) || folio_test_uptodate(folio))
+ if (blen =3D=3D folio_size(folio) || folio_test_uptodate(folio))
  return 0;

Thanks,
Daeho

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
