Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35B2386572
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974342; cv=pass; b=OcrY/bdfG6TrPfQmx5xQjzGnZSqGGyvzkcIHfA0C+eOzLwYb0Z2EhHlW9BgJB21EHcTaiPXmamhLFoJdP9iP393VhEuK8xVhNnDVjP0n0dHi4DYJpFIEqwNja5pmw0ilTOwXaiWE0e4NT48VFsUat6Xtstgw35+RadyjLV64Ez4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974342; c=relaxed/simple;
	bh=2Yv1t0KyKZzHsztAEF5oWiVkszVMnp2tJKjueVA64LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaER8vh7o05vh1FqOkKf7gveP827o8qv0lLQbXdsUIboqljllX2+jNg8mBpnTlXDQHX9b9x9iO76VALlF4l2fZxJtMppOL+/u0uxABvrs+KL3OupOsKc3XNQoyq55winptmwDwyBSNobrRir9UUKFzdIePcna9YIiuSmwiyKSaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFI5RHxr; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFI5RHxr"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a8736cfa68so2683071fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790974323; cv=none;
        d=google.com; s=arc-20260327;
        b=GSy/zBh4LPdyWAQQJ0pm5LYXLj7Txiw1bMLZGosNAhrFFJuNyl242wsFDpo7qXoCkN
         vmY0euB8sdoEK5haKQQqcRivyFNt7FjxE9LWHoefJaXunolVs1Nwpv0p4yhd5bXPTcEo
         QxGlfczCg1lH6dhtRLiyLfVzUUKjjum1bl4h5y5zpT0uq7tD3o+YI/LLxoqct94weFU0
         7YuQwOefwNn8Ydrqa66FETjUx6Bo0jmfKPdpecSnXdKxMuNutR3kI5zjCQ7JVqFFpTZp
         BXb6VkeW1fbJNnGNgGw2MvND+MEbaYmXKSqyVR/xy9A1x4Vhu1Zf3pOqA8nDWLOC7HRV
         z/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9z4H7heYHRfvYh9EaZQN3l+k4J7E0e7n1mC9qIize4=;
        fh=zfY5swEX5+grwFAXHNQogkPy+gs702YEdONG33YO9q8=;
        b=HdJFOawmjmwGY3NqwvGNAG1kbF/rgzhFt62tXznf82zvt4aPyFX+GS2Pn64Rm7TUjZ
         tY6ZoRIE1zReTjF3u5DP1OnG0Cxtp+pvJvYjVvs+Pbd/ya0rc6FEidYHPSTom+V+PHyF
         7yc/46FxoZA4gSlZhbT1tYbeEEJSCMu8JgTLT/yN/hghrz3UB0xeZIloQZmO7ZKfRugr
         18O34WmplK1yA9Bnas7lOy5aclISvioqp4ZelbTFBkk+qKdimvGzwJkP0bMknIdWcnwy
         eMUiLe921kAgH4rconwVMSKUnNdRvKEQrrb0If3px4x/uOiYOWOAXyp5DVR0ZOSYzULH
         RyTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790974323; x=1791579123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9z4H7heYHRfvYh9EaZQN3l+k4J7E0e7n1mC9qIize4=;
        b=iFI5RHxrmErU40DNgvMimIukBSjLqKMQme0ShbgAATTEuCMgq3hOjKoS5jagLhak+0
         XaabyTeu0syBcBHcCcp8z+/vt/QUPg6mztjruCoDmnKyREK1iW6ygPvj9uWXhuWV3eds
         8Kjpu6WYHkKHZl5wsDQx3r+TIZSIalO6nbTInKYQYAUJG2r+COQ2K0Di7wOIUXf3KYxk
         4yUWJMnFM1RSJ/xkRibbjf/EQCMrcDthcQVer9TAJkb0LRNcRIiYqH2hHCIaFozxEBjN
         uDeF/VdRK5eE2xTABv9oDiUwQ/M4a5rySPTcDbKtz1AdxCkD1tdOxonj366LoNtrAIp9
         1IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974323; x=1791579123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9z4H7heYHRfvYh9EaZQN3l+k4J7E0e7n1mC9qIize4=;
        b=mqlYeTrNmFO2sST41pnTMfJO3Y69fgp1cmghGjCeOFuYZ+r1CG05yBbZ2aNmTX4CNw
         m7OAGQRIfhN3WG5HbV90LA/eLlep2wOuJaqDPgboMZ3ot8USz8cP4MKK7SYH9egFQogU
         H9gSBU7en7pQZVbsmMxuexToJj7xtEBeKfb/SCB4ozBmJ7zPEECBbY/oGzTIM9sos5to
         wZk4WbvaLoAeoBOXKOvAqfo4SMLmaiwSw5DVor1aUcJ//otShvuuvFKvbHfxqLAHtrw+
         U4t/4FtP2V8N516ptVd6fl6G3VE78EdhUZWS3wXJHfLDqE+qotCCh9RQtueDsVUsBV4l
         CuGg==
X-Forwarded-Encrypted: i=1; AKwUvBzf8ikwEVBFENRiEbpGSSG+5e8zSItwMRjNk17p/rGkdwlhGEepk7UvGaBO7vEPMacuGSjKNmZID85izDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv+Kw0muC4FT4/UGQsgFHCay1poE3VUnhzN3U+f+B+6Qn0M5im
	X5BEpTg+B1xWyVher45JtLPlCVIWi+fHZivEmvLdfNMjU3eLRqDIGgH4kkdm2i6iyeIYlLviUPv
	bvfet/cyrcZTGeUMHJe1h7xeon0Drmac=
X-Gm-Gg: AYBFou208QU4PnWpX4fVAsFWn82S86c9F1J87hxTDWl6/EzSGoe21Ndnw3hrb0m3fwg
	b/eZuuWxpXGbB0tDFBPUSu4D6uSO9lMdehG5yG4MVWgHWkC8UOI3lM9g+cVK7vu4V2VTWJsSJsS
	m1paPNxHpTef7rPkSs6Zll/Knv5JzXNlJwfyxpzDZlyr02S9qr2txwGWl8I0kr9R9iuJy0lIOHO
	vof4yPgf/wLH4mGI4EwO2m7MO5PglZa3sqR1PdtG9YmZnFpXz8qSqZrMjdCm67H2kYuI+R9jA7L
	6c4x61ecAaAXRIgUr/BuKMzx1GcF7O6z1CFbklEPN2j1c6OUaQiXwL+YfLo1926n4lIInqH3Zkj
	ZbZ8L3N8qKJoCNGUAArCLLxe2DT15rCOdfOTUVmNyoXrC9uJ1APSw
X-Received: by 2002:a05:651c:1505:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a8877ae1c5mr8803631fa.7.1790974322607; Fri, 02 Oct 2026
 13:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com> <20260915041909.2903887-6-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260915041909.2903887-6-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 2 Oct 2026 13:51:50 -0700
X-Gm-Features: AclHuK8B72oPk-MUz8XqHarAlOIlV3Z95UMe4N-1OgybD_TjtBS1aKyyMJJkp1o
Message-ID: <CACOAw_wrOObFN4qS4Gr+ka9HKrd3weu43Wt4GyHdwRvg8PjLWA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 05/14] f2fs: support large folio writeback
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
> Large folio can contain multiple dirty ranges.
> Add a folio-based writeback path for large-folio mapping files
> and keep the legacy f2fs_write_cache_pages() path unchanged for
> non large-folio mapping files.
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 412 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 407 insertions(+), 5 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index eb5fb8e52851..1f9c99689f38 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -355,7 +355,9 @@ static void f2fs_write_end_bio(struct bio *bio)
>
>         bio_for_each_folio_all(fi, bio) {
>                 struct folio *folio =3D fi.folio;
> +               unsigned int nr_pages =3D fi.length >> PAGE_SHIFT;
>                 enum count_type type;
> +               bool finished =3D true;
>
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>                 if (f2fs_is_compressed_page(folio)) {
> @@ -379,10 +381,19 @@ static void f2fs_write_end_bio(struct bio *bio)
>                                 folio->index, NODE_TYPE_REGULAR, true);
>                         f2fs_bug_on(sbi, folio->index !=3D nid_of_node(sb=
i, folio));
>                 }
> +               if (f2fs_folio_has_ffs(folio)) {
> +                       struct f2fs_folio_state *ffs =3D
> +                               (struct f2fs_folio_state *)folio->private=
;
> +
> +                       finished =3D atomic_sub_and_test(nr_pages,
> +                                       &ffs->write_pages_pending);
> +               }
> +
>                 if (f2fs_in_warm_node_list(sbi, folio))
>                         f2fs_del_fsync_node_entry(sbi, folio);
>
> -               dec_page_count(sbi, type);
> +               while (nr_pages--)
> +                       dec_page_count(sbi, type);
>
>                 /*
>                  * we should access sbi before folio_end_writeback() to
> @@ -392,8 +403,10 @@ static void f2fs_write_end_bio(struct bio *bio)
>                                 wq_has_sleeper(&sbi->cp_wait))
>                         wake_up(&sbi->cp_wait);
>
> -               folio_clear_f2fs_gcing(folio);
> -               folio_end_writeback(folio);
> +               if (finished) {
> +                       folio_clear_f2fs_gcing(folio);
> +                       folio_end_writeback(folio);
> +               }
>         }
>
>         bio_put(bio);
> @@ -2654,7 +2667,7 @@ static void f2fs_ffs_mark_subrange_uptodate(struct =
folio *folio, size_t offset,
>                 folio_mark_uptodate(folio);
>  }
>
> -static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> +void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
>                                     size_t offset, size_t len)
>  {
>         struct f2fs_folio_state *ffs;
> @@ -2677,6 +2690,99 @@ static void f2fs_ffs_mark_subrange_dirty(struct fo=
lio *folio,
>         spin_unlock_irqrestore(&ffs->state_lock, flags);
>  }
>
> +static bool __ffs_clear_subrange_dirty(struct folio *folio,
> +                       struct f2fs_folio_state *ffs, size_t offset, size=
_t len)
> +{
> +       unsigned int nr_subpages =3D folio_nr_pages(folio);
> +       unsigned int start, end;
> +
> +       start =3D offset >> PAGE_SHIFT;
> +       end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +       end =3D min(end, nr_subpages);
> +
> +       bitmap_clear(ffs->state, nr_subpages + start, end - start);
> +       return find_next_bit(ffs->state, 2 * nr_subpages, nr_subpages) <
> +                       2 * nr_subpages;
> +}
> +
> +/**
> + * f2fs_ffs_clear_subrange_dirty_and_test - clear dirty bits and test re=
maining
> + * @folio: the large folio
> + * @offset: start byte offset within the folio
> + * @len: byte length of the subrange
> + *
> + * Clear the dirty bits of the 4K subpages covered by [offset, offset + =
len),
> + * and return whether the folio still has any dirty subpage left.
> + */
> +bool f2fs_ffs_clear_subrange_dirty_and_test(struct folio *folio, size_t =
offset,
> +                                           size_t len)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned long flags;
> +       bool dirty;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return false;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       dirty =3D __ffs_clear_subrange_dirty(folio, ffs, offset, len);
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +
> +       return dirty;
> +}
> +
> +static unsigned int ffs_next_dirty_subpage(struct f2fs_folio_state *ffs,
> +                       const struct folio *folio, unsigned int start,
> +                       unsigned int end)
> +{
> +       unsigned int nr_subpages =3D folio_nr_pages(folio);
> +
> +       return find_next_bit(ffs->state, nr_subpages + end + 1,
> +                       nr_subpages + start) - nr_subpages;
> +}
> +
> +static unsigned int ffs_next_clean_subpage(struct f2fs_folio_state *ffs,
> +                       const struct folio *folio, unsigned int start,
> +                       unsigned int end)
> +{
> +       unsigned int nr_subpages =3D folio_nr_pages(folio);
> +
> +       return find_next_zero_bit(ffs->state, nr_subpages + end + 1,
> +                       nr_subpages + start) - nr_subpages;
> +}
> +
> +static unsigned int ffs_find_dirty_range(struct folio *folio,
> +                                       u64 *range_start, u64 range_end)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned int start, end, nr_pages;
> +
> +       if (*range_start >=3D range_end)
> +               return 0;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return range_end - *range_start;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       start =3D offset_in_folio(folio, *range_start) >> PAGE_SHIFT;
> +       end =3D DIV_ROUND_UP(min_not_zero(offset_in_folio(folio, range_en=
d),
> +                                       folio_size(folio)), PAGE_SIZE) - =
1;
> +
> +       start =3D ffs_next_dirty_subpage(ffs, folio, start, end);
> +       if (start > end)
> +               return 0;
> +
> +       if (start =3D=3D end)
> +               nr_pages =3D 1;
> +       else
> +               nr_pages =3D ffs_next_clean_subpage(ffs, folio,
> +                                                start + 1, end) - start;
> +
> +       *range_start =3D folio_pos(folio) + ((u64)start << PAGE_SHIFT);
> +       return (u64)nr_pages << PAGE_SHIFT;
> +}
> +
>  static bool find_next_valid_block(const struct folio *folio,
>                                   size_t orig_off, size_t *need_off,
>                                   size_t len)
> @@ -3256,6 +3362,133 @@ int f2fs_do_write_data_page(struct f2fs_io_info *=
fio)
>         return err;
>  }
>
> +static int f2fs_write_single_data_folio(struct folio *folio, int *submit=
ted,
> +                                       struct writeback_control *wbc,
> +                                       enum iostat_type io_type,
> +                                       u64 *pos, u64 len)
> +{
> +       struct inode *inode =3D folio->mapping->host;
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> +       bool atomic_commit =3D f2fs_is_atomic_file(inode) &&
> +                               folio_test_f2fs_atomic(folio);
> +       struct inode *dn_inode =3D atomic_commit ?
> +                               F2FS_I(inode)->cow_inode : inode;
> +       struct f2fs_folio_state *ffs =3D NULL;
> +       u64 folio_start =3D folio_pos(folio);
> +       pgoff_t start_idx =3D (*pos - folio_start) >> PAGE_SHIFT;
> +       pgoff_t end_idx =3D (*pos - folio_start + len - 1) >> PAGE_SHIFT;
> +       int err =3D 0;
> +
> +       for (pgoff_t i =3D start_idx; i <=3D end_idx && !err; i++) {
> +               struct dnode_of_data dn;
> +               struct node_info ni;
> +               pgoff_t data_idx =3D folio->index + i;
> +               bool ipu_force =3D false;
> +               bool dn_held =3D false;
> +               bool submitted_blk =3D false;
> +               struct f2fs_io_info fio =3D {
> +                       .sbi =3D sbi,
> +                       .ino =3D inode->i_ino,
> +                       .type =3D DATA,
> +                       .op =3D REQ_OP_WRITE,
> +                       .op_flags =3D wbc_to_write_flags(wbc),
> +                       .old_blkaddr =3D NULL_ADDR,
> +                       .folio =3D folio,
> +                       .folio_offset =3D i,
> +                       .folio_blkcnt =3D 1,
> +                       .encrypted_page =3D NULL,
> +                       .submitted =3D 0,
> +                       .need_lock =3D LOCK_DONE,
> +                       .meta_gc =3D f2fs_meta_inode_gc_required(inode) ?=
 1 : 0,
> +                       .io_type =3D io_type,
> +                       .io_wbc =3D wbc,
> +               };
> +
> +               if (f2fs_folio_has_ffs(folio)) {
> +                       ffs =3D (struct f2fs_folio_state *)folio->private=
;
> +                       atomic_inc(&ffs->write_pages_pending);
> +               }
> +
> +               set_new_dnode(&dn, dn_inode, NULL, NULL, 0);
> +
> +               if (need_inplace_update(&fio) &&
> +                   f2fs_lookup_read_extent_cache_block(inode, data_idx,
> +                                                       &fio.old_blkaddr)=
) {
> +                       if (!f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> +                                                  DATA_GENERIC_ENHANCE))=
 {
> +                               err =3D -EFSCORRUPTED;
> +                               goto block_done;
> +                       }
> +                       ipu_force =3D true;
> +                       goto got_it;
> +               }
> +
> +               err =3D f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE=
);

Hi Nanzhe,

The atomic flag is per folio, but COW blocks are reserved per block in
write_begin. A block dirtied without write_begin, e.g. by
truncate_partial_data_page(), has no COW block, but it is still looked
up in the COW inode here:
 - NULL_ADDR: the truncated-block check added in 10/14 drops the block,
   so its data never reaches the disk.
 - -ENOENT (no COW dnode): the folio is redirtied and every writeback
   fails, so F2FS_IOC_COMMIT_ATOMIC_WRITE never succeeds.

For example, on a 4KB page kernel, with blocks 0-3 allocated and cached
in one 16KB folio:
  ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE);
  pwrite(fd, buf, 4096, 0);   /* COW block for block 0 only */
  ftruncate(fd, 4196);        /* dirties block 1 only */
  ioctl(fd, F2FS_IOC_COMMIT_ATOMIC_WRITE);

The zeroed tail of block 1 is lost, so extending the file later shows
the old data in [4196, 8192).

A block without a COW block was not written atomically, so it can go to
the original inode, like an order-0 folio that did not go through
write_begin:

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ static int f2fs_write_single_data_folio(struct folio *folio, int *submit=
ted,
  }

  err =3D f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
+
+ /* A block without a COW block was not written atomically */
+ if (atomic_commit && (err =3D=3D -ENOENT ||
+      (!err && dn.data_blkaddr =3D=3D NULL_ADDR))) {
+ f2fs_put_dnode(&dn);
+ set_new_dnode(&dn, inode, NULL, NULL, 0);
+ err =3D f2fs_get_dnode_of_data(&dn, data_idx,
+     LOOKUP_NODE);
+ }
  if (err)
  goto block_done;
  dn_held =3D true;

Also, -ENOENT from the original inode still fails the whole folio here,
while f2fs_write_single_data_page() ignores it. Should this path do the
same?

Thanks,
Daeho

> +               if (err)
> +                       goto block_done;
> +               dn_held =3D true;
> +
> +               fio.old_blkaddr =3D dn.data_blkaddr;
> +
> +got_it:
> +               if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> +                   !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> +                                          DATA_GENERIC_ENHANCE)) {
> +                       err =3D -EFSCORRUPTED;
> +                       goto block_done;
> +               }
> +
> +               if (fio.meta_gc)
> +                       f2fs_wait_on_block_writeback(inode, fio.old_blkad=
dr);
> +
> +               if (ipu_force ||
> +                   (__is_valid_data_blkaddr(fio.old_blkaddr) &&
> +                                           need_inplace_update(&fio))) {
> +                       f2fs_put_dnode(&dn);
> +                       err =3D f2fs_inplace_write_data(&fio);
> +                       trace_f2fs_do_write_data_page(folio, IPU);
> +                       if (err)
> +                               goto block_done;
> +
> +                       if (submitted)
> +                               (*submitted)++;
> +                       submitted_blk =3D true;
> +                       set_inode_flag(inode, FI_UPDATE_WRITE);
> +                       goto block_done;
> +               }
> +
> +               err =3D f2fs_get_node_info(sbi, dn.nid, &ni, false);
> +               if (err)
> +                       goto block_done;
> +
> +               fio.version =3D ni.version;
> +
> +               f2fs_outplace_write_data(&dn, &fio);
> +               if (submitted)
> +                       (*submitted)++;
> +               submitted_blk =3D true;
> +               set_inode_flag(inode, FI_APPEND_WRITE);
> +               trace_f2fs_do_write_data_page(folio, OPU);
> +               goto block_done;
> +block_done:
> +               if (dn_held)
> +                       f2fs_put_dnode(&dn);
> +               if (!submitted_blk && ffs)
> +                       atomic_dec(&ffs->write_pages_pending);
> +               if (!err) {
> +                       *pos =3D (data_idx + 1) << PAGE_SHIFT;
> +                       spin_lock(&F2FS_I(inode)->i_size_lock);
> +                       if (F2FS_I(inode)->last_disk_size < *pos)
> +                               F2FS_I(inode)->last_disk_size =3D *pos;
> +                       spin_unlock(&F2FS_I(inode)->i_size_lock);
> +               } else {
> +                       file_set_keep_isize(inode);
> +               }
> +       }
> +
> +       return err;
> +}
> +
>  int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>                                 struct bio **bio,
>                                 sector_t *last_block,
> @@ -3705,6 +3938,172 @@ static int f2fs_write_cache_pages(struct address_=
space *mapping,
>         return ret;
>  }
>
> +static int f2fs_write_cache_folios(struct address_space *mapping,
> +                                  struct writeback_control *wbc,
> +                                  enum iostat_type io_type)
> +{
> +       struct folio *folio =3D NULL;
> +       struct inode *inode =3D mapping->host;
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> +       struct f2fs_lock_context lc;
> +       u64 pos =3D 0;
> +       u64 end_pos =3D 0;
> +       u32 r_len =3D 0;
> +       int err =3D 0;
> +       int submitted =3D 0;
> +       int nwritten =3D 0;
> +       bool op_locked =3D false;
> +       bool next =3D false;
> +       bool retry =3D false;
> +
> +       if (get_dirty_pages(inode) <=3D SM_I(sbi)->min_hot_blocks)
> +               set_inode_flag(inode, FI_HOT_DATA);
> +       else
> +               clear_inode_flag(inode, FI_HOT_DATA);
> +
> +       while ((folio =3D writeback_iter(mapping, wbc, folio, &err))) {
> +               struct f2fs_folio_state *ffs =3D NULL;
> +               u64 isize;
> +               size_t poff;
> +               pgoff_t end_index;
> +               bool verity_in_progress;
> +               int folio_submitted =3D 0;
> +               bool bias_added =3D false;
> +
> +               submitted =3D 0;
> +               next =3D true;
> +               retry =3D false;
> +
> +               if (atomic_read(&sbi->wb_sync_req[DATA]) &&
> +                   wbc->sync_mode =3D=3D WB_SYNC_NONE) {
> +                       folio_redirty_for_writepage(wbc, folio);
> +                       next =3D false;
> +                       goto retry_out;
> +               }
> +retry:
> +               pos =3D folio_pos(folio);
> +               end_pos =3D pos + folio_size(folio);
> +               isize =3D i_size_read(inode);
> +               verity_in_progress =3D f2fs_verity_in_progress(inode);
> +               poff =3D 0;
> +               end_index =3D 0;
> +
> +               if (retry) {
> +
> +                       if (unlikely(folio->mapping !=3D mapping))
> +                               goto retry_out;
> +
> +                       if (!folio_test_dirty(folio))
> +                               goto retry_out;
> +
> +                       if (folio_test_writeback(folio)) {
> +                               if (wbc->sync_mode =3D=3D WB_SYNC_NONE)
> +                                       goto retry_out;
> +                               f2fs_folio_wait_writeback(folio, DATA, tr=
ue, true);
> +                       }
> +
> +                       if (!folio_clear_dirty_for_io(folio))
> +                               goto retry_out;
> +               }
> +
> +               /* To avoid dealing with the complexity for one subrange =
is in bio
> +                * while we trylock_op failed before writing another subr=
ange.
> +                * Try to lock_op before any subrange write for the folio=
.
> +                */
> +               if (!op_locked) {
> +                       if (!f2fs_trylock_op(sbi, &lc)) {
> +                               folio_redirty_for_writepage(wbc, folio);
> +                               err =3D 0;
> +                               if (wbc->sync_mode !=3D WB_SYNC_ALL)
> +                                       goto retry_out;
> +
> +                               retry =3D true;
> +                               folio_unlock(folio);
> +                               f2fs_io_schedule_timeout(DEFAULT_SCHEDULE=
_TIMEOUT);
> +                               folio_lock(folio);
> +                               goto retry;
> +                       }
> +                       op_locked =3D true;
> +               }
> +
> +               if (!verity_in_progress) {
> +                       poff =3D offset_in_folio(folio, isize);
> +                       end_index =3D isize >> PAGE_SHIFT;
> +
> +                       if (folio->index > end_index ||
> +                           (folio->index =3D=3D end_index && poff =3D=3D=
 0))
> +                               goto out;
> +
> +                       if (end_pos > isize) {
> +                               folio_zero_segment(folio, poff, folio_siz=
e(folio));
> +                               end_pos =3D isize;
> +                       }
> +               }
> +
> +               folio_start_writeback(folio);
> +
> +               if (!bias_added && f2fs_folio_has_ffs(folio)) {
> +                       ffs =3D (struct f2fs_folio_state *)folio->private=
;
> +                       WARN_ON_ONCE(atomic_read(&ffs->write_pages_pendin=
g) !=3D 0);
> +                       atomic_inc(&ffs->write_pages_pending);
> +                       bias_added =3D true;
> +               }
> +
> +               while ((r_len =3D ffs_find_dirty_range(folio, &pos, end_p=
os))) {
> +                       err =3D f2fs_write_single_data_folio(folio, &subm=
itted,
> +                                       wbc, io_type, &pos, r_len);
> +                       folio_submitted +=3D submitted;
> +                       if (err)
> +                               goto out;
> +
> +                       nwritten +=3D submitted;
> +               }
> +
> +               if (!err && folio_submitted &&
> +                   f2fs_is_atomic_file(inode) &&
> +                   folio_test_f2fs_atomic(folio))
> +                       folio_clear_f2fs_atomic(folio);
> +
> +out:
> +               /*
> +                * Clear the dirty state of the subranges that were writt=
en back.
> +                * If some subranges are still dirty (e.g. the folio was =
only
> +                * partially written back), the folio must stay dirty so =
that
> +                * the remaining subranges are written back later.
> +                */
> +               if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> +                                       (err ? pos : end_pos) - folio_pos=
(folio)))
> +                       folio_redirty_for_writepage(wbc, folio);
> +               else
> +                       inode_dec_dirty_pages(inode);
> +
> +               if (bias_added) {
> +                       if (atomic_dec_and_test(&ffs->write_pages_pending=
))
> +                               folio_end_writeback(folio);
> +               } else if (!folio_submitted && folio_test_writeback(folio=
)) {
> +                       folio_end_writeback(folio);
> +               }
> +
> +retry_out:
> +               if (folio_test_locked(folio))
> +                       folio_unlock(folio);
> +
> +               if (op_locked) {
> +                       f2fs_unlock_op(sbi, &lc);
> +                       op_locked =3D false;
> +               }
> +
> +               if (err || !next)
> +                       break;
> +       }
> +
> +       if (nwritten)
> +               f2fs_submit_merged_write_cond(F2FS_M_SB(mapping), mapping=
->host,
> +                                              NULL, 0, DATA);
> +
> +       return err;
> +}
> +
>  static inline bool __should_serialize_io(struct inode *inode,
>                                         struct writeback_control *wbc)
>  {
> @@ -3799,7 +4198,10 @@ static int __f2fs_write_data_pages(struct address_=
space *mapping,
>         account_writeback(inode, true);
>
>         blk_start_plug(&plug);
> -       ret =3D f2fs_write_cache_pages(mapping, wbc, io_type);
> +       if (mapping_large_folio_support(inode->i_mapping))
> +               ret =3D f2fs_write_cache_folios(mapping, wbc, io_type);
> +       else
> +               ret =3D f2fs_write_cache_pages(mapping, wbc, io_type);
>         blk_finish_plug(&plug);
>
>         account_writeback(inode, false);
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
