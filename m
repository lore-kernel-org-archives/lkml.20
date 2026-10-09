Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F78511E92
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569684; cv=pass; b=DfuaETx/NTrubdYlGIcrPrzDkme5PA5IUMVGPDw/B3BfGCeiV0R6E7eTTfu62zxumgq0qSOqLl0vGb9nlQ32OvLl3Hr1WUOqAb/CP9QZw9E4SxbGwTKFbkLAKQFIFqVXhk6xmwVYPmrFhviDOgRo5tuqdSEMLDeISH/RywkeNcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569684; c=relaxed/simple;
	bh=Iku5PWYF6vmjl/fBl0R/HTppe1MkACYLP/SsSCGjRgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bn+7WaBHprPmgwFA1P/O6nPn5skYcc5S3wqia5q1qhNruImcZDfR/J3mWpF4bfDyirpxMhPi/fG2VWk69ZsUZSOFeVK8/0qcvgPmTD/7kx4UPX/nwXe/gjga1JHl8fTnf8TEWpgWaGwnSDk7aH+wxoe2Cm9G6CIvtk6f0LkPWqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8wxTQTh; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8wxTQTh"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba37877490so3895825e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791569680; cv=none;
        d=google.com; s=arc-20260327;
        b=gaITt1z/Y3ka2AI8264WfQ2ctyJncvykdVmgHBC7sPJIWIpkr5NVRraQ8OIWXS9yJm
         M+1fqOyOCp2n72GO0RNUSIqs0lJrL5sVDZx2lsp5uXFTRcgSjNu+gV96gWitxa3nc8yA
         wLDbW2pmHFVOiDYVNSU5XuOnZqgMdx+Ddifl3+oPB5kRTYlXKq7PpOpnpkPGWIcUqm+C
         Vgkle6zlJBp8+6GA9vIL5NmOxJwhjWmVYlm1NBbUZXug+8zIYZauapRMF4Lwc6mUqhPU
         lQYK88gbcoApd13285KBMQAEeThAzIpEARCdW2SCMLiWtko3J/oGM+S54AQ079LnY8KK
         WIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GzFxJ9vgUSa5vFAHmyHoNK3c8Rn5+2DWr/0WZ9L7B3c=;
        fh=0qoxAz1vwKVQOHMEQmMk0Gz3urdZk7nBO9L2r42gimY=;
        b=UMsYZjedQLG2DwrmYJ0SESf8SelGE+9qfk/kvw7aZmUTGovfWlxmpgBuXOI4jl3CeJ
         /yuAiwJGcjHh+m37Zcmc7XalzORApRoJFAoz/3hZM8Fod5RpHmchWFN8kAINYapH79GJ
         KOhCVo7a3sejO4fhk0qTz2Lc10tjug5M4XvPSF46yE+Xdlp8pH1B+Cf9L5w3Uw9NWaWJ
         NxCwb6wZjuLZCKx/OzkfNPc8sGiiWRjNJe8yBQB3eTVic7qkuhgdJN0SLGGz58+zpX8B
         AGAFi/+T32p8c93ZQu8AbBPBHQpNKgCQcnO+XQhDtaHCxEMhCaTVB/v8Zt7pkX9ABhRB
         o6Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791569680; x=1792174480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GzFxJ9vgUSa5vFAHmyHoNK3c8Rn5+2DWr/0WZ9L7B3c=;
        b=X8wxTQThfxX22uFDFosUqkj8iuCNUqpkfEZ9C/vHXx53Z4Eg+QXESxj2klggT7ptlh
         Lf8AR6bCU0MTwKLNb+qz0AKvVtcaKcLjTLa3KQjD/rVJ6El4u3YePtb3W1jEkma8o0q+
         zulwLtJpU1JEP3ucPJwtVkW6erEmVeIy4HzAWP4HYmwa1fWO1BPBsOwr6m42NCbcT/xl
         zpNOZULWXHAoOE60Y/HYpP8qSSW9cryFENmEPoPWN3NnBTn5q8tj5R1euRpdsN1pT3im
         FPoyee3peo0LQAeaLMYjahJyCG1hiklK9N+E2tkKMYh2rurzpIyQVpGsTemoDbXZi9nC
         MH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569680; x=1792174480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzFxJ9vgUSa5vFAHmyHoNK3c8Rn5+2DWr/0WZ9L7B3c=;
        b=unK9iaYZ5NVTFTAw1AOh92qCPx1GH0Fy+3aS4OlOzVPaixgEmnWYXxD78s07U8p1Wb
         A2DrE4vQCFYJDhnwBFvKNnb/VeBVc8BxOD0o1nNu1V09ddhbCfbWYV+3FEXN0DA35+Mi
         YsGf499+N3wSNbWhRx9yp20b6FXYTCdvcU9EFbCyud5KXd0tWsa/J3IbN/CyH3myh8fx
         tzLXdWN8tbFf9Xq5LKmg3Mmg3D4rV/rNkD05cudsEXPsBlpoKpbrljqAewxYKyds0+M0
         XUAByPdMBVnLDnjFb/FnhpL3k1d0lBROt3ETDUhczeMRtdhFppPSDi5ETdnwAx7vr5+l
         zSfA==
X-Forwarded-Encrypted: i=1; AKwUvByJqLedT1OXYfBFqTRfmVcXPf6GNxnemh0uZQKkb1hOVfkmNoQMNfsZUIxf654uFHWMvqo6lG+fBP3lt1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwNZ8xb22Y7rma4dnNjpqgEakvfYhxIjELxdu/deVIa0icL2zo
	pucGDbezKxY1kL6A8YGlUVj0g28KcZGUtdo9dL8SI+f0i9KJUrWlmOx8siRzKsBaeItQC16AS8B
	RaV+VxPVLw6sXCk63izQesFsKXcBFy+A=
X-Gm-Gg: AYBFou2Wt98vqiIS1b9jmH5Mn07NFwSrC0ttrJnAFgQkeWdD5+97EPuDbOMcEtvTdU2
	8JM4xguK/ytYVXFje6PJKaNb3qLYeu+gOuj4Qy6m1NQniYBlMW1Cn1js1OVRr5OGs9Au0fdFRPv
	QdAhc6u28RhPKCcAg3EnYsncivb0HZR8AYMS3Mmw29RdJx6hgQY3fhCpIpzVPaudA3z2g4cUsX4
	SgHV/dhqZymxyftesWQ+x1PnFuR3iKoYQBKAtosAooM7EpIk4T6l8EvSDTAxgkPYSFTcLlc1ruw
	MDcpbMebiqi4dLpPVzVIT1ipKCPOo7A6i+ihDI3/Y+f3GqMRCjAiED5AekjzBWBTzfvChXyZhSZ
	yKgSI9DieBzpP84gZZiwYpuCE9dfltaCuNG8XAdQx4hZJm87axZ3K2A==
X-Received: by 2002:a05:6512:3d1f:b0:5b8:b331:19b8 with SMTP id
 2adb3069b0e04-5bcde8bea3amr981665e87.38.1791569679857; Fri, 09 Oct 2026
 11:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com> <20261009162828.4188050-2-zhaonanzhe@xiaomi.com>
In-Reply-To: <20261009162828.4188050-2-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 9 Oct 2026 11:14:28 -0700
X-Gm-Features: AclHuK-jbGK0B74BZBo0nkrt6cbQDaiXm-Dt7i2O3z1qYyedzFTZ58d_Vz6ep0Y
Message-ID: <CACOAw_y+X-d0mmPxdKyFrzFOEMgswV3+_EW6WAp--vS_HwFg9A@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 12/17] f2fs: handle partial truncate of
 large folio dirty subpages
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Daeho Jeong <daehojeong@google.com>, Dev Jain <Dev.Jain@arm.com>, 
	David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org, 
	Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:31=E2=80=AFAM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> A large folio can be partial truncated and stays in folio mapping, we
> need to clear the subrange dirty bits and uptodate bits that the partial
> truncate covers. If this partial truncate happens to clear the last
> subrange dirty bits, then cancel the whole folio dirty state.
>
> Also add a guard in f2fs_write_single_data_folio() so a large folio
> subpage whose disk block was already truncated (NULL_ADDR) is skipped
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 109 insertions(+), 6 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 21c43019167a..138a77044e95 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -329,6 +329,27 @@ static void f2fs_read_end_io(struct bio *bio)
>         f2fs_verify_and_finish_bio(bio, intask);
>  }
>
> +static bool f2fs_ffs_has_dirty_subpage(struct folio *folio)
> +{
> +       struct f2fs_folio_state *ffs;
> +       unsigned long flags;
> +       unsigned int nr_subpages;
> +       bool dirty;
> +
> +       if (!f2fs_folio_has_ffs(folio))
> +               return false;
> +
> +       ffs =3D (struct f2fs_folio_state *)folio->private;
> +       nr_subpages =3D folio_nr_pages(folio);
> +
> +       spin_lock_irqsave(&ffs->state_lock, flags);
> +       dirty =3D find_next_bit(ffs->state, 2 * nr_subpages,
> +                               nr_subpages) < 2 * nr_subpages;
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +
> +       return dirty;
> +}
> +
>  static void f2fs_write_end_bio(struct bio *bio)
>  {
>         struct f2fs_sb_info *sbi =3D bio->bi_private;
> @@ -380,7 +401,8 @@ static void f2fs_write_end_bio(struct bio *bio)
>                         wake_up(&sbi->cp_wait);
>
>                 if (finished) {
> -                       folio_clear_f2fs_gcing(folio);
> +                       if (!f2fs_ffs_has_dirty_subpage(folio))
> +                               folio_clear_f2fs_gcing(folio);
>                         folio_end_writeback(folio);
>                 }
>         }
> @@ -2893,6 +2915,29 @@ static void f2fs_ffs_mark_subrange_uptodate(struct=
 folio *folio, size_t offset,
>                 folio_mark_uptodate(folio);
>  }
>
> +static void ffs_clear_subrange_uptodate(struct folio *folio,
> +                                       size_t offset, size_t len)
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
> +       bitmap_clear(ffs->state, start, end - start);
> +       spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
>  bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
>  {
>         struct f2fs_folio_state *ffs;
> @@ -3771,12 +3816,35 @@ static int f2fs_write_folio_dirty_range(struct fo=
lio *folio, int *submitted,
>
>                 err =3D f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE=
);
>
> +               /*
> +                * If a subpage of folio for a cow file is dirtied but no=
t
> +                * reserve a cow block, fallback to original inode to loo=
kup
> +                * block address
> +                */
> +               if (atomic_commit && (err =3D=3D -ENOENT ||
> +                   (!err && dn.data_blkaddr =3D=3D NULL_ADDR))) {
> +                       f2fs_put_dnode(&dn);
> +                       set_new_dnode(&dn, inode, NULL, NULL, 0);
> +                       err =3D f2fs_get_dnode_of_data(&dn, data_idx,
> +                                                    LOOKUP_NODE);
> +                       /* Original inode has no block, handled as trunca=
ted below */
> +                       if (err =3D=3D -ENOENT)
> +                               err =3D 0;
> +               }
>                 if (err)
>                         goto block_done;

Hi Nanzhe,

For non-atomic files, -ENOENT from the first f2fs_get_dnode_of_data()
still comes here as an error, so f2fs_write_cache_folios() redirties
the rest of the folio and returns the error.
f2fs_write_single_data_page() does not fail the writeback on -ENOENT.

I asked the same on v2 05/14. Could non-atomic files also handle it
like NULL_ADDR (already truncated)? Something like:

if (err =3D=3D -ENOENT) {
    ffs_clear_subrange_uptodate(folio,
        (unsigned long long)i << PAGE_SHIFT,
        PAGE_SIZE);
    err =3D 0;
    goto block_done;
}
if (err)
    goto block_done;

Thanks,
Daeho

>                 dn_held =3D true;
>
>                 fio.old_blkaddr =3D dn.data_blkaddr;
>
> +               /* This page is already truncated */
> +               if (fio.old_blkaddr =3D=3D NULL_ADDR) {
> +                       ffs_clear_subrange_uptodate(folio,
> +                                       (unsigned long long)i << PAGE_SHI=
FT,
> +                                       PAGE_SIZE);
> +                       goto block_done;
> +               }
> +
>  got_it:
>                 if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
>                     !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
> @@ -4325,6 +4393,7 @@ static int f2fs_write_cache_folios(struct address_s=
pace *mapping,
>                 bool verity_in_progress;
>                 int folio_submitted =3D 0;
>                 bool bias_added =3D false;
> +               bool dirty;
>
>                 submitted =3D 0;
>                 next =3D true;
> @@ -4432,15 +4501,19 @@ static int f2fs_write_cache_folios(struct address=
_space *mapping,
>                  * partially written back), the folio must stay dirty so =
that
>                  * the remaining subranges are written back later.
>                  */
> -               if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> -                                       (err ? pos : end_pos) - folio_pos=
(folio)))
> +               dirty =3D f2fs_ffs_clear_subrange_dirty_and_test(folio, 0=
,
> +                                       (err ? pos : end_pos) - folio_pos=
(folio));
> +               if (dirty)
>                         folio_redirty_for_writepage(wbc, folio);
>                 else if (!f2fs_folio_has_ffs(folio))
>                         inode_dec_dirty_pages(inode);
>
>                 if (bias_added) {
> -                       if (atomic_dec_and_test(&ffs->write_pages_pending=
))
> +                       if (atomic_dec_and_test(&ffs->write_pages_pending=
)) {
> +                               if (!dirty)
> +                                       folio_clear_f2fs_gcing(folio);
>                                 folio_end_writeback(folio);
> +                       }
>                 } else if (!folio_submitted && folio_test_writeback(folio=
)) {
>                         folio_end_writeback(folio);
>                 }
> @@ -5243,10 +5316,40 @@ void f2fs_invalidate_folio(struct folio *folio, s=
ize_t offset, size_t length)
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>
>         if (inode->i_ino >=3D F2FS_ROOT_INO(sbi) &&
> -                               (offset || length !=3D folio_size(folio))=
)
> +                               (offset || length !=3D folio_size(folio))=
) {
> +               size_t clear_start =3D round_up(offset, PAGE_SIZE);
> +               size_t clear_end =3D round_down(offset + length, PAGE_SIZ=
E);
> +               size_t clear_length;
> +               bool dirty;
> +
> +               /*
> +                * If the truncated range falls within a single subpage, =
no
> +                * subpage state needs to be cleared.
> +                */
> +               if (clear_start >=3D clear_end || !f2fs_folio_has_ffs(fol=
io))
> +                       return;
> +
> +               clear_length =3D clear_end - clear_start;
> +               dirty =3D f2fs_ffs_clear_subrange_dirty_and_test(folio,
> +                                               clear_start, clear_length=
);
> +               ffs_clear_subrange_uptodate(folio, clear_start, clear_len=
gth);
> +
> +               /*
> +                * If the truncated subrange happens to clear the remaini=
ng
> +                * dirty bitmap of the whole folio, cancel the folio-leve=
l
> +                * dirty state.
> +                */
> +               if (!dirty && folio_test_dirty(folio))
> +                       folio_cancel_dirty(folio);
> +               if (!dirty && !folio_test_writeback(folio))
> +                       folio_clear_f2fs_gcing(folio);
>                 return;
> +       }
>
> -       if (folio_test_dirty(folio)) {
> +       if (f2fs_folio_has_ffs(folio)) {
> +               f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
> +                                                       folio_size(folio)=
);
> +       } else if (folio_test_dirty(folio)) {
>                 inode_dec_dirty_pages(inode);
>                 f2fs_remove_dirty_inode(inode);
>         }
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
