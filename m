Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8289B12AAF1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223133; cv=pass; b=LJ4FhbCPR7+AP96vMdSRpHBOhkmApMM9HTZjWuK8jQpE1LUO7CMShq9dMa3PKVqB2E5QCp5VEmRzwhNeeFOUT7syiZt6lJJJ+mC6Q4KZL2ye8hQc8i89MfXTfonOn1ALwmpUQxz8sP9EkO6TqKvaQ0dIgQ/PllbtebfhospVfxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223133; c=relaxed/simple;
	bh=PX1mA6VFXE51/vRnjmxs4wPtdo5NDBG1qbgwIIuLc+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iN9Kzrpl5AeUePcjFF9/6j562v5U3ZUvakbSSk1X1CQa74xBW1LDWUHrW5lH0IBi3OsdjAY+JGJ7LjlyDNA6FLmptntVwOATau1cdcF5cNJMofL3Lf8pt+zGfnA5RRrd6DwEIhMbAlSZ2Nn4QMcTvWwR2OIvNmQzIwKv9sT9NIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8IHbnij; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8IHbnij"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so225537e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788223129; cv=none;
        d=google.com; s=arc-20260327;
        b=O9RgwdMSxtGHQ96FsZLFq+g0v+Cnt3ls91WHwgSRP1auunaZa0XTE/6lE91tHWkVO2
         1B9bHAMDRpLMzFlmjbvW6tyskRgly2y/M36DQYCzRVOlYHxOLZZKmxZ/723FWIvKoQwT
         aKk2EHY2gC56y5sdjQRIc1AA19yZXrzL1ZrX8js93jz535zen/ha6LEr/iNnSBUYxUsj
         6w3hLu0Kn1LHhY+gHWQ/qRqzDJV5rJhtjEgGjyzhbCWqoFCLM34qCZx4NOmd+K2Y8dRE
         2NU7C+u79/HMVyJpJKGj3GlSPQl09E8gdYY9khEWqAQ/pKtN/M4Uv35+TUOyBe5W4rco
         kVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xn3nWICT9jUU4RcDMBxwRJzcwWgf2zAtqL0KAuEWkOE=;
        fh=cu3DZX4b1Syo91sx4+Ab6WEOPiRvD1UrF9k9k0huQPo=;
        b=p/Rt3MedQtEYTxgrlwbD067It8rG7CaZ2tiwENbIIs5yUVR05zq6qJHra/rIQiZzFT
         whAq7daOTpBoyaRVGY+1VLKEPnoWxy8WBd2OMHNIG0deCcjgwlVHRhveWRQP7OqdM59W
         KDdGEKEhh5edVu9PlvBIQSZstA+vJJ4BeBEt55HRQQeHohM56pMcTB2kwUli3u5zm1pL
         upb40xJI1HF3iK25xA62CqgoYud1Kcc4keeTlY/IoYynVgyFZC7dhOX5MXfcMqSml8O6
         KjGFDjDwfvixbaOyAU0VZOyJByGSKU8HBB6OYfCjwaR+P2v/6u65BPu5l/hggctg72BL
         1gYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223129; x=1788827929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn3nWICT9jUU4RcDMBxwRJzcwWgf2zAtqL0KAuEWkOE=;
        b=B8IHbnijhebTU5boKyyAYdmMhHF0tKT60KbYuMAcAW6PdjsMHKNZbDS/0oD6AaVuaZ
         gfOiVhNPuBicCKEMX1di3aSzPUMrDcw+o3B1vRxbY2EZ8UFis2jZccmZ9r10cW4eLkFv
         IaOtdod0fOBl+D0569a6inmrbZo85RpjZCo4PP40vNXnqu6m0krLUYMqA2zvym2LaHic
         RiO+m50+HGld6pIgjY9jnVFIIyP4vwEiv2VbdfNlkULwddqdDbGJxTNDlbfsC7X+vpjv
         iMxK6aOqdRmmV8Hjb6xAjKZpBT0q11j3+2idGeutdz/54/OxEf3ePoKQB4L6HgFSkt2G
         ildA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223129; x=1788827929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn3nWICT9jUU4RcDMBxwRJzcwWgf2zAtqL0KAuEWkOE=;
        b=VK9d02U4l/mtlTT0TPneF4IBwpr9w3JWUKpXvrQkIk5O2Wm9MKj9lX/3ArTCHu5E+6
         iaOhd3oz8HMVPX+Yiupc5moPgunuz498nnDAleitnMBonpnF9EFzX5YZAtHyI1zWI/ys
         +IqgtFitnm88nIU3c9PSajAUU4D/5toyq1PI7Mb43G0M2lCZdxwVSwGJsMpyhgqYDij9
         0m8N7a2cqYYPrD8fphezKGzp5IlsCYxvm3Cpe/+DAGUJZ8V5YcpgmnG8oS+bNUf7vxRs
         azDUdhvphihrcE+VAezNB/SkrpFGZH+rNbNNOTyUgaMIglggVjXg/pdmarkwjbRT0oCZ
         RSdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHBd/p4djsZ6JLICVUCgxGGN9eL9yVIWTBA+OO8U1FlvpSAwaCHJPqlVK58aj1XSh79QjKtnRFGAGm7dA=@vger.kernel.org
X-Gm-Message-State: AFuF++mc7Mxx5h0+aX5tV8BJ1DxCOlBq3vC2G/VKK49iztj3FsZeSkiO
	s8n979R5SV1n6qKBET8rI8zHT7RR0jAPNulQo4hT5shVcwAcXDEGemrwd5j9Mo3zkQsb1iWrElS
	dbKcPDWAQmSaWL2HJGrwHCb56KE4CeZ4=
X-Gm-Gg: AYBFou0wLj8Hu5EHRXyAkdPg5QEM/EnFVb1RpbhYFA8PpuyNsan2Ike80JMT59bojIV
	l+HCp+2HZrTfPwc8/EJ7fr4CJ0QsRXoG2MsLE4PurUgpaitTW0owmW4AWv0+S4fjXK1AveDxMCk
	1yqzVphddvWdpym7gHWluC9mQtCtFnWFEEPOxN7LDe7gG9tdDebK1OhsZDFOOpfEOMDxVNx2iwh
	nDOI3tWCpr0/YuQwKWsrMWlpfEzoGIIGxw3qO36prG7Ixz+sALH0mHqjGOmpKTdfnShb9DZadB4
	hLIHS5ggRJew5NCblSCqVzD1HOR7XgdROmnmRadiQ67yINBsLXfYXtNF1jLVxDmAzbGYPA2wIAH
	rtkt/BjBYm36R/xOpIh4ZqOQX8iK5tM0SZQ==
X-Received: by 2002:a05:6512:3d8b:b0:5b4:508b:de9 with SMTP id
 2adb3069b0e04-5b5e6b09b95mr8387453e87.25.1788223129074; Mon, 31 Aug 2026
 17:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788213716.git.zhangxp1998@gmail.com> <d6a28ec269f24e0ea20f125671ae0e2802d384dc.1788213716.git.zhangxp1998@gmail.com>
In-Reply-To: <d6a28ec269f24e0ea20f125671ae0e2802d384dc.1788213716.git.zhangxp1998@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2026 17:38:36 -0700
X-Gm-Features: AcwNN1Xz4rITOdXFHDmsp3XvvBVxSOS-b_-w5i_4Hdl5cdJVage3azOC6lyaiIk
Message-ID: <CACOAw_wNy_rFe9fC-+iHyEmsEDRtB_CWA2d+gTvV0DjhLAC9CQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 03/11] f2fs: describe NAT block layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:09=E2=80=AFPM Kelvin Zhang <zhangxp1998@gmail.com=
> wrote:
>
> A NAT block is a filesystem-block-sized array of struct f2fs_nat_entry
> elements. The compile-time NAT_ENTRY_PER_BLOCK definition hardcodes the
> NAT capacity to a 4KB block size.
>
> Replace the fixed array in struct f2fs_nat_block with a C flexible
> array member, and calculate sbi->nat_entries_per_block dynamically in
> init_sb_info().
>
> Parameterize NAT geometry helpers (NAT_ENTRY_PER_BLOCK,
> NAT_BLOCK_OFFSET, f2fs_start_nid, NAT_BLK_CNT, and
> f2fs_nat_bitmap_size) with sbi. Update call sites across node management,
> checkpointing, GC, and sysfs.
>
> This is a layout-only change without behavioral differences for 4KB
> blocks.
>
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
> ---
>  fs/f2fs/checkpoint.c    |  4 +--
>  fs/f2fs/debug.c         |  2 +-
>  fs/f2fs/f2fs.h          |  2 ++
>  fs/f2fs/gc.c            |  4 +--
>  fs/f2fs/node.c          | 77 +++++++++++++++++++++--------------------
>  fs/f2fs/node.h          | 22 ++++++++----
>  fs/f2fs/segment.c       |  4 +--
>  fs/f2fs/shrinker.c      |  2 +-
>  fs/f2fs/super.c         |  4 ++-
>  include/linux/f2fs_fs.h |  5 ++-
>  10 files changed, 71 insertions(+), 55 deletions(-)
>
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 47c4a5c83a70..3ecced9b4d57 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -476,11 +476,11 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, bl=
ock_t start, int nrpages,
>                 switch (type) {
>                 case META_NAT:
>                         if (unlikely(blkno >=3D
> -                                       NAT_BLOCK_OFFSET(NM_I(sbi)->max_n=
id)))
> +                                       NAT_BLOCK_OFFSET(sbi, NM_I(sbi)->=
max_nid)))
>                                 blkno =3D 0;
>                         /* get nat block addr */
>                         fio.new_blkaddr =3D current_nat_addr(sbi,
> -                                       blkno * NAT_ENTRY_PER_BLOCK);
> +                                       blkno * NAT_ENTRY_PER_BLOCK(sbi))=
;
>                         break;
>                 case META_SIT:
>                         if (unlikely(blkno >=3D TOTAL_SEGS(sbi)))
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index ff379aff4472..5980b9d79afb 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -345,7 +345,7 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
>         si->base_mem +=3D __bitmap_size(sbi, NAT_BITMAP);
>         si->base_mem +=3D F2FS_BLK_TO_BYTES(NM_I(sbi)->nat_bits_blocks);
>         si->base_mem +=3D NM_I(sbi)->nat_blocks *
> -                               f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK);
> +                               f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK(sbi)=
);
>         si->base_mem +=3D NM_I(sbi)->nat_blocks / 8;
>         si->base_mem +=3D NM_I(sbi)->nat_blocks * sizeof(unsigned short);
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 035863d513ab..8e6000e7d766 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1863,6 +1863,7 @@ struct f2fs_sb_info {
>         unsigned int log_sectors_per_block;     /* log2 sectors per block=
 */
>         unsigned int log_blocksize;             /* log2 block size */
>         unsigned int blocksize;                 /* block size */
> +       unsigned int nat_entries_per_block;     /* NAT entries in a block=
 */
>         unsigned int sit_entries_per_block;     /* SIT entries in a block=
 */
>         unsigned int root_ino_num;              /* root inode number*/
>         unsigned int node_ino_num;              /* node inode number*/
> @@ -2253,6 +2254,7 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const =
struct folio *folio)
>  }
>
>  #define SIT_ENTRY_PER_BLOCK(sbi)       ((sbi)->sit_entries_per_block)
> +#define NAT_ENTRY_PER_BLOCK(sbi)       ((sbi)->nat_entries_per_block)
>
>  static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_inf=
o *sbi)
>  {
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0a00180c21dc..c15c6ba91597 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1066,7 +1066,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi=
,
>                         continue;
>
>                 if (phase =3D=3D 0) {
> -                       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), 1,
> +                       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(sbi, nid=
), 1,
>                                                         META_NAT, true);
>                         continue;
>                 }
> @@ -1614,7 +1614,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi=
, struct f2fs_summary *sum,
>                         continue;
>
>                 if (phase =3D=3D 0) {
> -                       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), 1,
> +                       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(sbi, nid=
), 1,
>                                                         META_NAT, true);
>                         continue;
>                 }
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 86c2e67e43b6..960c6657d0d6 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -169,7 +169,7 @@ static struct folio *get_next_nat_folio(struct f2fs_s=
b_info *sbi, nid_t nid)
>         folio_mark_dirty(dst_folio);
>         f2fs_folio_put(src_folio, true);
>
> -       set_to_next_nat(nm_i, nid);
> +       set_to_next_nat(sbi, nm_i, nid);
>
>         return dst_folio;
>  }
> @@ -254,10 +254,11 @@ static void __del_from_nat_cache(struct f2fs_nm_inf=
o *nm_i, struct nat_entry *e)
>         __free_nat_entry(e);
>  }
>
> -static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *n=
m_i,
> +static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_sb_info *s=
bi,
> +                                                       struct f2fs_nm_in=
fo *nm_i,
>                                                         struct nat_entry =
*ne)
>  {
> -       nid_t set =3D NAT_BLOCK_OFFSET(ne->ni.nid);
> +       nid_t set =3D NAT_BLOCK_OFFSET(sbi, ne->ni.nid);
>         struct nat_entry_set *head;
>
>         head =3D radix_tree_lookup(&nm_i->nat_set_root, set);
> @@ -274,14 +275,15 @@ static struct nat_entry_set *__grab_nat_entry_set(s=
truct f2fs_nm_info *nm_i,
>         return head;
>  }
>
> -static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
> +static void __set_nat_cache_dirty(struct f2fs_sb_info *sbi,
> +               struct f2fs_nm_info *nm_i,
>                 struct nat_entry *ne, bool init_dirty)
>  {
>         struct nat_entry_set *head;
>         bool new_ne =3D nat_get_blkaddr(ne) =3D=3D NEW_ADDR;
>
>         if (!new_ne)
> -               head =3D __grab_nat_entry_set(nm_i, ne);
> +               head =3D __grab_nat_entry_set(sbi, nm_i, ne);
>
>         /*
>          * update entry_cnt in below condition:
> @@ -527,7 +529,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, s=
truct node_info *ni,
>         nat_set_blkaddr(e, new_blkaddr);
>         if (!__is_valid_data_blkaddr(new_blkaddr))
>                 set_nat_flag(e, IS_CHECKPOINTED, false);
> -       __set_nat_cache_dirty(nm_i, e, init_dirty);
> +       __set_nat_cache_dirty(sbi, nm_i, e, init_dirty);
>
>         /* update fsync_mark if its inode nat entry is still alive */
>         if (ni->nid !=3D ni->ino)
> @@ -578,7 +580,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_=
t nid,
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
>         struct curseg_info *curseg =3D CURSEG_I(sbi, CURSEG_HOT_DATA);
>         struct f2fs_journal *journal =3D curseg->journal;
> -       nid_t start_nid =3D START_NID(nid);
> +       nid_t start_nid =3D f2fs_start_nid(sbi, nid);
>         struct f2fs_nat_block *nat_blk;
>         struct folio *folio =3D NULL;
>         struct f2fs_nat_entry ne;
> @@ -2403,8 +2405,8 @@ static void update_free_nid_bitmap(struct f2fs_sb_i=
nfo *sbi, nid_t nid,
>                                                         bool set, bool bu=
ild)
>  {
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
> -       unsigned int nat_ofs =3D NAT_BLOCK_OFFSET(nid);
> -       unsigned int nid_ofs =3D nid - START_NID(nid);
> +       unsigned int nat_ofs =3D NAT_BLOCK_OFFSET(sbi, nid);
> +       unsigned int nid_ofs =3D nid - f2fs_start_nid(sbi, nid);
>
>         if (!test_bit_le(nat_ofs, nm_i->nat_block_bitmap))
>                 return;
> @@ -2524,14 +2526,14 @@ static int scan_nat_page(struct f2fs_sb_info *sbi=
,
>  {
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
>         block_t blk_addr;
> -       unsigned int nat_ofs =3D NAT_BLOCK_OFFSET(start_nid);
> +       unsigned int nat_ofs =3D NAT_BLOCK_OFFSET(sbi, start_nid);
>         int i;
>
>         __set_bit_le(nat_ofs, nm_i->nat_block_bitmap);
>
> -       i =3D start_nid % NAT_ENTRY_PER_BLOCK;
> +       i =3D start_nid % NAT_ENTRY_PER_BLOCK(sbi);
>
> -       for (; i < NAT_ENTRY_PER_BLOCK; i++, start_nid++) {
> +       for (; i < NAT_ENTRY_PER_BLOCK(sbi); i++, start_nid++) {
>                 if (unlikely(start_nid >=3D nm_i->max_nid))
>                         break;
>
> @@ -2587,16 +2589,16 @@ static void scan_free_nid_bits(struct f2fs_sb_inf=
o *sbi)
>                         continue;
>                 if (!nm_i->free_nid_count[i])
>                         continue;
> -               for (idx =3D 0; idx < NAT_ENTRY_PER_BLOCK; idx++) {
> +               for (idx =3D 0; idx < NAT_ENTRY_PER_BLOCK(sbi); idx++) {
>                         idx =3D find_next_bit_le(nm_i->free_nid_bitmap[i]=
,
> -                                               NAT_ENTRY_PER_BLOCK, idx)=
;
> -                       if (idx >=3D NAT_ENTRY_PER_BLOCK)
> +                                               NAT_ENTRY_PER_BLOCK(sbi),=
 idx);
> +                       if (idx >=3D NAT_ENTRY_PER_BLOCK(sbi))
>                                 break;
>
> -                       nid =3D i * NAT_ENTRY_PER_BLOCK + idx;
> +                       nid =3D i * NAT_ENTRY_PER_BLOCK(sbi) + idx;
>                         add_free_nid(sbi, nid, true, false);
>
> -                       if (nm_i->nid_cnt[FREE_NID] >=3D MAX_FREE_NIDS)
> +                       if (nm_i->nid_cnt[FREE_NID] >=3D MAX_FREE_NIDS(sb=
i))
>                                 goto out;
>                 }
>         }
> @@ -2617,11 +2619,11 @@ static int __f2fs_build_free_nids(struct f2fs_sb_=
info *sbi,
>         if (unlikely(nid >=3D nm_i->max_nid))
>                 nid =3D 0;
>
> -       if (unlikely(nid % NAT_ENTRY_PER_BLOCK))
> -               nid =3D NAT_BLOCK_OFFSET(nid) * NAT_ENTRY_PER_BLOCK;
> +       if (unlikely(nid % NAT_ENTRY_PER_BLOCK(sbi)))
> +               nid =3D NAT_BLOCK_OFFSET(sbi, nid) * NAT_ENTRY_PER_BLOCK(=
sbi);
>
>         /* Enough entries */
> -       if (nm_i->nid_cnt[FREE_NID] >=3D NAT_ENTRY_PER_BLOCK)
> +       if (nm_i->nid_cnt[FREE_NID] >=3D NAT_ENTRY_PER_BLOCK(sbi))
>                 return 0;
>
>         if (!sync && !f2fs_available_free_memory(sbi, FREE_NIDS))
> @@ -2631,18 +2633,18 @@ static int __f2fs_build_free_nids(struct f2fs_sb_=
info *sbi,
>                 /* try to find free nids in free_nid_bitmap */
>                 scan_free_nid_bits(sbi);
>
> -               if (nm_i->nid_cnt[FREE_NID] >=3D NAT_ENTRY_PER_BLOCK)
> +               if (nm_i->nid_cnt[FREE_NID] >=3D NAT_ENTRY_PER_BLOCK(sbi)=
)
>                         return 0;
>         }
>
>         /* readahead nat pages to be scanned */
> -       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), FREE_NID_PAGES,
> +       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(sbi, nid), FREE_NID_PAGE=
S,
>                                                         META_NAT, true);
>
>         f2fs_down_read_trace(&nm_i->nat_tree_lock, &lc);
>
>         while (1) {
> -               if (!test_bit_le(NAT_BLOCK_OFFSET(nid),
> +               if (!test_bit_le(NAT_BLOCK_OFFSET(sbi, nid),
>                                                 nm_i->nat_block_bitmap)) =
{
>                         struct folio *folio =3D get_current_nat_folio(sbi=
, nid);
>
> @@ -2668,7 +2670,8 @@ static int __f2fs_build_free_nids(struct f2fs_sb_in=
fo *sbi,
>                         }
>                 }
>
> -               nid +=3D (NAT_ENTRY_PER_BLOCK - (nid % NAT_ENTRY_PER_BLOC=
K));
> +               nid +=3D NAT_ENTRY_PER_BLOCK(sbi) -
> +                       (nid % NAT_ENTRY_PER_BLOCK(sbi));
>                 if (unlikely(nid >=3D nm_i->max_nid))
>                         nid =3D 0;
>
> @@ -2684,7 +2687,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_in=
fo *sbi,
>
>         f2fs_up_read_trace(&nm_i->nat_tree_lock, &lc);
>
> -       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nm_i->next_scan_nid),
> +       f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(sbi, nm_i->next_scan_nid=
),
>                                         nm_i->ra_nid_pages, META_NAT, fal=
se);
>
>         return 0;
> @@ -2811,20 +2814,20 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sb=
i, int nr_shrink)
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
>         int nr =3D nr_shrink;
>
> -       if (nm_i->nid_cnt[FREE_NID] <=3D MAX_FREE_NIDS)
> +       if (nm_i->nid_cnt[FREE_NID] <=3D MAX_FREE_NIDS(sbi))
>                 return 0;
>
>         if (!mutex_trylock(&nm_i->build_lock))
>                 return 0;
>
> -       while (nr_shrink && nm_i->nid_cnt[FREE_NID] > MAX_FREE_NIDS) {
> +       while (nr_shrink && nm_i->nid_cnt[FREE_NID] > MAX_FREE_NIDS(sbi))=
 {
>                 struct free_nid *i, *next;
>                 unsigned int batch =3D SHRINK_NID_BATCH_SIZE;
>
>                 spin_lock(&nm_i->nid_list_lock);
>                 list_for_each_entry_safe(i, next, &nm_i->free_nid_list, l=
ist) {
>                         if (!nr_shrink || !batch ||
> -                               nm_i->nid_cnt[FREE_NID] <=3D MAX_FREE_NID=
S)
> +                               nm_i->nid_cnt[FREE_NID] <=3D MAX_FREE_NID=
S(sbi))
>                                 break;
>                         __remove_free_nid(sbi, i, FREE_NID);
>                         kmem_cache_free(free_nid_slab, i);
> @@ -3074,7 +3077,7 @@ static void remove_nats_in_journal(struct f2fs_sb_i=
nfo *sbi)
>                         spin_unlock(&nm_i->nid_list_lock);
>                 }
>
> -               __set_nat_cache_dirty(nm_i, ne, init_dirty);
> +               __set_nat_cache_dirty(sbi, nm_i, ne, init_dirty);
>         }
>         update_nats_in_cursum(journal, -i);
>         up_write(&curseg->journal_rwsem);
> @@ -3102,7 +3105,7 @@ static void __update_nat_bits(struct f2fs_sb_info *=
sbi, nid_t start_nid,
>                 const struct f2fs_nat_block *nat_blk)
>  {
>         struct f2fs_nm_info *nm_i =3D NM_I(sbi);
> -       unsigned int nat_index =3D start_nid / NAT_ENTRY_PER_BLOCK;
> +       unsigned int nat_index =3D start_nid / NAT_ENTRY_PER_BLOCK(sbi);
>         int valid =3D 0;
>         int i =3D 0;
>
> @@ -3113,7 +3116,7 @@ static void __update_nat_bits(struct f2fs_sb_info *=
sbi, nid_t start_nid,
>                 valid =3D 1;
>                 i =3D 1;
>         }
> -       for (; i < NAT_ENTRY_PER_BLOCK; i++) {
> +       for (; i < NAT_ENTRY_PER_BLOCK(sbi); i++) {
>                 if (le32_to_cpu(nat_blk->entries[i].block_addr) !=3D NULL=
_ADDR)
>                         valid++;
>         }
> @@ -3124,7 +3127,7 @@ static void __update_nat_bits(struct f2fs_sb_info *=
sbi, nid_t start_nid,
>         }
>
>         __clear_bit_le(nat_index, nm_i->empty_nat_bits);
> -       if (valid =3D=3D NAT_ENTRY_PER_BLOCK)
> +       if (valid =3D=3D NAT_ENTRY_PER_BLOCK(sbi))
>                 __set_bit_le(nat_index, nm_i->full_nat_bits);
>         else
>                 __clear_bit_le(nat_index, nm_i->full_nat_bits);
> @@ -3135,7 +3138,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_inf=
o *sbi,
>  {
>         struct curseg_info *curseg =3D CURSEG_I(sbi, CURSEG_HOT_DATA);
>         struct f2fs_journal *journal =3D curseg->journal;
> -       nid_t start_nid =3D set->set * NAT_ENTRY_PER_BLOCK;
> +       nid_t start_nid =3D set->set * NAT_ENTRY_PER_BLOCK(sbi);
>         bool to_journal =3D true;
>         struct f2fs_nat_block *nat_blk;
>         struct nat_entry *ne, *cur;
> @@ -3342,8 +3345,8 @@ static inline void load_free_nid_bitmap(struct f2fs=
_sb_info *sbi)
>
>                 __set_bit_le(i, nm_i->nat_block_bitmap);
>
> -               nid =3D i * NAT_ENTRY_PER_BLOCK;
> -               last_nid =3D nid + NAT_ENTRY_PER_BLOCK;
> +               nid =3D i * NAT_ENTRY_PER_BLOCK(sbi);
> +               last_nid =3D nid + NAT_ENTRY_PER_BLOCK(sbi);
>
>                 spin_lock(&NM_I(sbi)->nid_list_lock);
>                 for (; nid < last_nid; nid++)
> @@ -3373,7 +3376,7 @@ static int init_node_manager(struct f2fs_sb_info *s=
bi)
>         /* segment_count_nat includes pair segment so divide to 2. */
>         nat_segs =3D le32_to_cpu(sb_raw->segment_count_nat) >> 1;
>         nm_i->nat_blocks =3D nat_segs << le32_to_cpu(sb_raw->log_blocks_p=
er_seg);
> -       nm_i->max_nid =3D NAT_ENTRY_PER_BLOCK * nm_i->nat_blocks;
> +       nm_i->max_nid =3D NAT_ENTRY_PER_BLOCK(sbi) * nm_i->nat_blocks;
>
>         /* not used nids: 0, node, meta, (and root counted as valid node)=
 */
>         nm_i->available_nids =3D nm_i->max_nid - sbi->total_valid_node_co=
unt -
> @@ -3436,7 +3439,7 @@ static int init_free_nid_cache(struct f2fs_sb_info =
*sbi)
>
>         for (i =3D 0; i < nm_i->nat_blocks; i++) {
>                 nm_i->free_nid_bitmap[i] =3D f2fs_kvzalloc(sbi,
> -                       f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK), GFP_KERNEL=
);
> +                       f2fs_bitmap_size(NAT_ENTRY_PER_BLOCK(sbi)), GFP_K=
ERNEL);
>                 if (!nm_i->free_nid_bitmap[i])
>                         return -ENOMEM;
>         }
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index 5e114f352099..0dce97aac5fc 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -6,14 +6,23 @@
>   *             http://www.samsung.com/
>   */
>  /* start node id of a node block dedicated to the given node id */
> -#define        START_NID(nid) (((nid) / NAT_ENTRY_PER_BLOCK) * NAT_ENTRY=
_PER_BLOCK)
> +static inline nid_t f2fs_start_nid(struct f2fs_sb_info *sbi, nid_t nid)
> +{
> +       unsigned int entries =3D NAT_ENTRY_PER_BLOCK(sbi);
> +
> +       return (nid / entries) * entries;
> +}
> +
> +#define        START_NID(sbi, nid) f2fs_start_nid(sbi, nid)

Do we still need START_NID()? Otherwise, plz, remove it.

Thanks,

>
>  /* node block offset on the NAT area dedicated to the given start node i=
d */
> -#define        NAT_BLOCK_OFFSET(start_nid) ((start_nid) / NAT_ENTRY_PER_=
BLOCK)
> +#define        NAT_BLOCK_OFFSET(sbi, start_nid) \
> +       ((start_nid) / NAT_ENTRY_PER_BLOCK(sbi))
>
>  /* # of pages to perform synchronous readahead before building free nids=
 */
>  #define FREE_NID_PAGES 8
> -#define MAX_FREE_NIDS  (NAT_ENTRY_PER_BLOCK * FREE_NID_PAGES)
> +#define MAX_FREE_NIDS(sbi)     ((unsigned long)NAT_ENTRY_PER_BLOCK(sbi) =
* \
> +                                FREE_NID_PAGES)
>
>  /* size of free nid batch when shrinking */
>  #define SHRINK_NID_BATCH_SIZE  8
> @@ -208,7 +217,7 @@ static inline pgoff_t current_nat_addr(struct f2fs_sb=
_info *sbi, nid_t start)
>          * OLD =3D (segment_off * 512) * 2 + off_in_segment
>          * NEW =3D 2 * (segment_off * 512 + off_in_segment) - off_in_segm=
ent
>          */
> -       block_off =3D NAT_BLOCK_OFFSET(start);
> +       block_off =3D NAT_BLOCK_OFFSET(sbi, start);
>
>         block_addr =3D (pgoff_t)(nm_i->nat_blkaddr +
>                 (block_off << 1) -
> @@ -230,9 +239,10 @@ static inline pgoff_t next_nat_addr(struct f2fs_sb_i=
nfo *sbi,
>         return block_addr + nm_i->nat_blkaddr;
>  }
>
> -static inline void set_to_next_nat(struct f2fs_nm_info *nm_i, nid_t star=
t_nid)
> +static inline void set_to_next_nat(struct f2fs_sb_info *sbi,
> +                                  struct f2fs_nm_info *nm_i, nid_t start=
_nid)
>  {
> -       unsigned int block_off =3D NAT_BLOCK_OFFSET(start_nid);
> +       unsigned int block_off =3D NAT_BLOCK_OFFSET(sbi, start_nid);
>
>         f2fs_change_bit(block_off, nm_i->nat_bitmap);
>  #ifdef CONFIG_F2FS_CHECK_FS
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b3bf1b62cdad..b29df65ab5b7 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -512,10 +512,10 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, b=
ool from_bg)
>
>         /* check the # of cached NAT entries */
>         if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
> -               f2fs_try_to_free_nats(sbi, NAT_ENTRY_PER_BLOCK);
> +               f2fs_try_to_free_nats(sbi, NAT_ENTRY_PER_BLOCK(sbi));
>
>         if (!f2fs_available_free_memory(sbi, FREE_NIDS))
> -               f2fs_try_to_free_nids(sbi, MAX_FREE_NIDS);
> +               f2fs_try_to_free_nids(sbi, MAX_FREE_NIDS(sbi));
>         else
>                 f2fs_build_free_nids(sbi, false, false);
>
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 4f6bf5926de4..e3e0a7e89406 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -23,7 +23,7 @@ static unsigned long __count_nat_entries(struct f2fs_sb=
_info *sbi)
>
>  static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
>  {
> -       long count =3D NM_I(sbi)->nid_cnt[FREE_NID] - MAX_FREE_NIDS;
> +       long count =3D NM_I(sbi)->nid_cnt[FREE_NID] - MAX_FREE_NIDS(sbi);
>
>         return count > 0 ? count : 0;
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 4bd1c9fb1f7f..fdc2b0c51c06 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4382,6 +4382,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>                 le32_to_cpu(raw_super->log_sectors_per_block);
>         sbi->log_blocksize =3D le32_to_cpu(raw_super->log_blocksize);
>         sbi->blocksize =3D BIT(sbi->log_blocksize);
> +       sbi->nat_entries_per_block =3D sbi->blocksize /
> +               sizeof(struct f2fs_nat_entry);
>         sbi->sit_entries_per_block =3D sbi->blocksize /
>                 sizeof(struct f2fs_sit_entry);
>         sbi->log_blocks_per_seg =3D le32_to_cpu(raw_super->log_blocks_per=
_seg);
> @@ -4391,7 +4393,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>         sbi->total_sections =3D le32_to_cpu(raw_super->section_count);
>         sbi->total_node_count =3D SEGS_TO_BLKS(sbi,
>                         ((le32_to_cpu(raw_super->segment_count_nat) / 2) =
*
> -                       NAT_ENTRY_PER_BLOCK));
> +                       NAT_ENTRY_PER_BLOCK(sbi)));
>         sbi->allocate_section_hint =3D le32_to_cpu(raw_super->section_cou=
nt);
>         sbi->allocate_section_policy =3D ALLOCATE_FORWARD_NOHINT;
>         F2FS_ROOT_INO(sbi) =3D le32_to_cpu(raw_super->root_ino);
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index ecd6694af572..061f906a7b94 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -375,8 +375,6 @@ struct f2fs_node {
>  /*
>   * For NAT entries
>   */
> -#define NAT_ENTRY_PER_BLOCK (F2FS_BLKSIZE / sizeof(struct f2fs_nat_entry=
))
> -
>  struct f2fs_nat_entry {
>         __u8 version;           /* latest version of cached nat entry */
>         __le32 ino;             /* inode number */
> @@ -384,7 +382,8 @@ struct f2fs_nat_entry {
>  } __packed;
>
>  struct f2fs_nat_block {
> -       struct f2fs_nat_entry entries[NAT_ENTRY_PER_BLOCK];
> +       /* The entry count depends on the filesystem block size. */
> +       DECLARE_FLEX_ARRAY(struct f2fs_nat_entry, entries);
>  } __packed;
>
>  /*
> --
> 2.53.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
