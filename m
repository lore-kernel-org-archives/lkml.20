Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC92DB79F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382985; cv=pass; b=LoAa8lVLQL+nW/jbPwHyN1+aWHAEpUouMgtRin61XuTjBYM31sXeSRQAT58gnP1iApu/esugt+GWTHRwGC+bZYSFiOkdI4i9c9xTPaSQWrwHXfIo0+fBkYdn5qEbk4ik0u9Ko2nuznbotli2zRDDpDECAxz8zWb01+PAbnb6RjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382985; c=relaxed/simple;
	bh=3wwBdvMAjTeVtfaYizeftZsSH3yhir2aAXxY9Fl6Ka8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCKstuHST+xBLFg8gl0oOJRE5chWivxzMiAVXGjGsUACCLUeD2WwZP0keT69XJPvoA/p4AtvBdsi7lCQlGQxNJtEth+WbMYXnVc9YXI/ST5iriruIMEFFoV+uTo5UJu2ncfXJe6NMlrTmEaMtbbKpQ2weoWhZtpo6nmhkhLrEJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfwYwJOz; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfwYwJOz"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so1432137e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790382981; cv=none;
        d=google.com; s=arc-20260327;
        b=gM6UAd/DuAP+LXVxffrnyoaCWsfo296KW+5YmeYXTc8TRQlnR5Z3qnYtlDeKdoyKmd
         dr0rwOs9ci2pHXIyjwQnY9x6Do1pqghpl2k9xSDpBkPu56IWZX4CUQJIL1tPX7JlpF2F
         5K2Gai2FSf4EipMtbuscbQHxNhYhtsUCOQE9q4WxOO6orFFAitH+XhNj8kamlDczVRYt
         uHWV/ozZPMV2is3CmhSCagJTPq59SAq0V0WTyjb8GLwJSYo6dtIBFPeajBO+hdwMGs3j
         RUiQbFS2YU8kDLnIwcQwTeWkrDM7bvoOWHcFKIYjk9EM1CeTOId8f+YoQZGXO/50dPSh
         sq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKFR+wIH5C3O2aKJA1eB2uwYMrgFllA/qD12JYMP4J8=;
        fh=EYNbQS0RMX6tBPKkSSkaAFa/6u/xVseyCsATSDLYCGs=;
        b=kAXCGn3p6gj5RvBzdxtU3BJXO6O1vTKp+x9HqKg59izOsUtWv9eOfI8g7MJ8Jdl9aJ
         H6rlncUqvFsCRydMk18cFSVuXzz+lJGUcd/QvKg6W9p4ofZCACvFJ4EnahYPAaWLiMbr
         SxMV59ZEzjjMVw/AR9ERxRZ3ZxDBax5JPEQzIGFSV25SUIFfJlvspdM9ZlO1OGeaSk77
         y4PbglBbzgCRTRVKUCvRUCBGeWn2BfQhvtFEApDC3DXpQv5n++sOaxEVsl5yF4UfanbA
         5lriWcg8mvjt/BoFsUrag1tPXBfgr1+v8gQiHsAYCaxda+6fRQ2ftEjwddgkzPS3CULY
         Ggag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382981; x=1790987781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKFR+wIH5C3O2aKJA1eB2uwYMrgFllA/qD12JYMP4J8=;
        b=QfwYwJOzGIhwqIJTxWtVQ3AaEMTOdHSCsUWXxy8wH9sy1NT+h0nhiz7vHuy73X9i3V
         Ajr4uexLQBwu2ZEMXPKMjOWdjGw5kAKJlB5TnG42BrrMFug25Kw6sKKyucSafPGawqCB
         QVakpJp51ZdgtGlY7fAyHEPmo4wH2ZCrmeZ40h9yfayzyw7NAQpyLa+XZOo7vqvnTh51
         48re/mirbQusivNfLCpPsM99D/LzRjVnBiu4d9XEXDdu2OvXtOeypriCY+JjGUYmRNO1
         dnBhh+TuJvEwn0Kz/pfsYdawECSVIceZO9sXy+L+QOoJO0Q10w31WFwUAAB15+m181hn
         IWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382981; x=1790987781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKFR+wIH5C3O2aKJA1eB2uwYMrgFllA/qD12JYMP4J8=;
        b=J5KqMBKYj6FiyF7md9rV+F/Dq95lntW0z8/o2ZlySjrf/EOjdt44ye22zeqmn8NDDl
         fY2E6iBddYXNRw+VArb1Mxh9rst43Ou3aKS69Uz08GgTExJK2Sz7ievKjQTB46LGv7KJ
         K2WzQ7ncrPAyWiimbhaHbZbM9K3gsfp1jc9FA/c2bzHmZpDrqMsUrw4/mDVO1u+XDE7n
         x4SpRAgQ67GoVPGaGRKBEqRvaSfdzg6229mq53OWJj8V4efFOElxTWUgG5AuBU5y8p9Q
         Z+bv+5V17/mE5LAveWRSXcMFer/w0NljF5JAuXPev9x8hbjMvuqKnj3xcInNE4gUZ6pR
         DJsQ==
X-Forwarded-Encrypted: i=1; AKwUvBytezr6DEgs44hN/yc8nzyG269LRCFjGIe2a5Tmuzp3v4XKNkNgtUV7LiXXCrQtcNyiuRStF8mmQzLgWDc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3phmNJFWj6yX17M/kRetpeoZafTNq4dM6IORPdXP/1f9mKsXs
	sggNqGNfh4GURYeEwTq6/6jQ+HKYJ0HAb62WxXDAYTk+uSMI8OYa+PDkriDSw2nVwj8W9WxTxA4
	R4xFWReUD2RCFQHD5KvuMLATCv18sLw0tNQ==
X-Gm-Gg: AYBFou36YsN5Y/pYoM4P3SZ7BthNY7a0gXK+UeSIkKGULHH5G3CAGVad6kKLvrptCNz
	fvr+Cpgr48zmzcHncxiw4Cl9bMBpTgGM6XKnu1MPqLJDCPcB3pDETQ3HIYPR3uZtaNwVv7/np7D
	rYz5Lrwt66HZOs8aTKx8qoqzhAdV3Cxde3PbLMq8WZw3yBnWdqIBVSM9E1iCcv5x44jtlAf1JQG
	qMzsfOaROx7QYZUtdlFB92wCMqiGfOe2nPjFVLtbmSJcktM1nJAw/5rO/m3s2thXtqAynrlXxV/
	3vJNsiFfSUIveBUIbM5wXqXwZ42m8CEgewjSwb5ltQTs9hrTfSGg5VnV44EHyQMsOaLp
X-Received: by 2002:a05:6512:39d1:b0:5b8:efc1:a3db with SMTP id
 2adb3069b0e04-5b8efc1a4c3mr159637e87.66.1790382980845; Fri, 25 Sep 2026
 17:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924090102.2865942-1-liubaolin12138@163.com> <20260924090102.2865942-5-liubaolin12138@163.com>
In-Reply-To: <20260924090102.2865942-5-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 26 Sep 2026 09:36:08 +0900
X-Gm-Features: AclHuK_r9M0aky5yciYiQdWvqsd_twJSs0jbAeQ_7NFmfikWLkftz0bS8QZLqgQ
Message-ID: <CANFS6bYMg7_nu1L5GOyBtr2LDUY4XSOVdrBQqFqCwy=EF+n7tQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] ntfs: report MFT metadata and recovery errors to fsnotify
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 24=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:02, B=
aolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> MFT record corruption, stale extent references and allocation bitmap
> inconsistencies can leave files or volume metadata unusable without
> notifying filesystem health monitors.
>
> Report these errors against the affected base inode or the volume, as
> appropriate. Also report failures to release clusters, restore mapping
> pairs and attribute records, or restore MFT bitmap state during recovery.
>
> Keep recovery errors separate from the original operation's return value.
> Report each failed recovery where it is detected and leave event merging
> to fanotify, without passing reporting state through the mapping APIs.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/mft.c | 158 ++++++++++++++++++++++++++++++--------------------
>  1 file changed, 96 insertions(+), 62 deletions(-)
>
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 8bb8b4085c8b..a1b1c080b256 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -112,6 +112,7 @@ int ntfs_mft_record_check(const struct ntfs_volume *v=
ol, struct mft_record *m,
>  static inline struct mft_record *map_mft_record_folio(struct ntfs_inode =
*ni)
>  {
>         loff_t i_size;
> +       struct ntfs_inode *base_ni;
>         struct ntfs_volume *vol =3D ni->vol;
>         struct inode *mft_vi =3D vol->mft_ino;
>         struct folio *folio;
> @@ -170,7 +171,11 @@ static inline struct mft_record *map_mft_record_foli=
o(struct ntfs_inode *ni)
>                 kfree(ni->mrec);
>                 ni->mrec =3D NULL;
>                 folio =3D ERR_PTR(-EIO);
> -               NVolSetErrors(vol);
> +               if (ni->nr_extents >=3D 0)
> +                       base_ni =3D ni;
> +               else
> +                       base_ni =3D ni->ext.base_ntfs_ino;

The above pattern is repeated in the series, but
there is already the helper, ntfs_inode_base().

Could we use it from the call sites?


> +               ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
>         }
>  err_out:
>         ni->folio =3D NULL;
> @@ -313,6 +318,7 @@ struct mft_record *map_extent_mft_record(struct ntfs_=
inode *base_ni, u64 mref,
>                         unmap_mft_record(ni);
>                         ntfs_error(base_ni->vol->sb,
>                                         "Found stale extent mft reference=
! Corrupt filesystem. Run chkdsk.");
> +                       ntfs_report_file_metadata_error(VFS_I(base_ni), -=
EIO);
>                         return ERR_PTR(-EIO);
>                 }
>  map_err_out:
> @@ -344,6 +350,7 @@ struct mft_record *map_extent_mft_record(struct ntfs_=
inode *base_ni, u64 mref,
>         if (seq_no && (le16_to_cpu(m->sequence_number) !=3D seq_no)) {
>                 ntfs_error(base_ni->vol->sb,
>                                 "Found stale extent mft reference! Corrup=
t filesystem. Run chkdsk.");
> +               ntfs_report_file_metadata_error(VFS_I(base_ni), -EIO);
>                 destroy_ni =3D true;
>                 m =3D ERR_PTR(-EIO);
>                 goto unm_nolock_err_out;
> @@ -1340,8 +1347,9 @@ static int ntfs_mft_bitmap_extend_allocation_nolock=
(struct ntfs_volume *vol)
>         struct ntfs_attr_search_ctx *ctx =3D NULL;
>         struct mft_record *mrec;
>         struct attr_record *a =3D NULL;
> -       int ret, mp_size;
> +       int err, ret, mp_size;
>         u32 old_alen =3D 0;
> +       u16 mp_ofs;
>         u8 *b, tb;
>         struct {
>                 u8 added_cluster:1;
> @@ -1426,10 +1434,11 @@ static int ntfs_mft_bitmap_extend_allocation_nolo=
ck(struct ntfs_volume *vol)
>                 if (IS_ERR(rl)) {
>                         up_write(&mftbmp_ni->runlist.lock);
>                         ntfs_error(vol->sb, "Failed to merge runlists for=
 mft bitmap.");
> -                       if (ntfs_cluster_free_from_rl(vol, rl2)) {
> +                       err =3D ntfs_cluster_free_from_rl(vol, rl2);
> +                       if (err) {
>                                 ntfs_error(vol->sb, "Failed to deallocate=
 allocated cluster.%s",
>                                                 es);
> -                               NVolSetErrors(vol);
> +                               ntfs_report_metadata_error(vol, err);
>                         }
>                         kvfree(rl2);
>                         return PTR_ERR(rl);
> @@ -1549,9 +1558,10 @@ static int ntfs_mft_bitmap_extend_allocation_noloc=
k(struct ntfs_volume *vol)
>
>  restore_undo_alloc:
>         ntfs_attr_reinit_search_ctx(ctx);
> -       if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
> -                       mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn, N=
ULL,
> -                       0, ctx)) {
> +       err =3D ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
> +                              mftbmp_ni->name_len, CASE_SENSITIVE, rl[1]=
.vcn,
> +                              NULL, 0, ctx);
> +       if (err) {
>                 ntfs_error(vol->sb,
>                         "Failed to find last attribute extent of mft bitm=
ap attribute.%s", es);
>                 write_lock_irqsave(&mftbmp_ni->size_lock, flags);
> @@ -1564,7 +1574,7 @@ static int ntfs_mft_bitmap_extend_allocation_nolock=
(struct ntfs_volume *vol)
>                  * The only thing that is now wrong is ->allocated_size o=
f the
>                  * base attribute extent which chkdsk should be able to f=
ix.
>                  */
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, err);
>                 return ret;
>         }
>         a =3D ctx->attr;
> @@ -1583,31 +1593,36 @@ static int ntfs_mft_bitmap_extend_allocation_nolo=
ck(struct ntfs_volume *vol)
>         }
>         /* Deallocate the cluster. */
>         down_write(&vol->lcnbmp_lock);
> -       if (ntfs_bitmap_clear_bit(vol->lcnbmp_ino, lcn)) {
> +       err =3D ntfs_bitmap_clear_bit(vol->lcnbmp_ino, lcn);
> +       if (err) {
>                 ntfs_error(vol->sb, "Failed to free allocated cluster.%s"=
, es);
> -               NVolSetErrors(vol);
> -       } else
> +               ntfs_report_metadata_error(vol, err);
> +       } else {
>                 ntfs_inc_free_clusters(vol, 1);
> +       }
>         up_write(&vol->lcnbmp_lock);
>         if (status.mp_rebuilt) {
> -               if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
> -                               a->data.non_resident.mapping_pairs_offset=
),
> -                               old_alen - le16_to_cpu(
> -                               a->data.non_resident.mapping_pairs_offset=
),
> -                               rl2, ll, -1, NULL, NULL, NULL)) {
> +               mp_ofs =3D le16_to_cpu(a->data.non_resident.mapping_pairs=
_offset);
> +               err =3D ntfs_mapping_pairs_build(vol, (u8 *)a + mp_ofs,
> +                                              old_alen - mp_ofs, rl2, ll=
, -1,
> +                                              NULL, NULL, NULL);
> +               if (err) {
>                         ntfs_error(vol->sb, "Failed to restore mapping pa=
irs array.%s", es);
> -                       NVolSetErrors(vol);
> +                       ntfs_report_metadata_error(vol, err);
>                 }
> -               if (ntfs_attr_record_resize(ctx->mrec, a, old_alen)) {
> +               err =3D ntfs_attr_record_resize(ctx->mrec, a, old_alen);
> +               if (err) {
>                         ntfs_error(vol->sb, "Failed to restore attribute =
record.%s", es);
> -                       NVolSetErrors(vol);
> +                       ntfs_report_metadata_error(vol, err);
>                 }
>                 mark_mft_record_dirty(ctx->ntfs_ino);
> -       } else if (status.mp_extended &&
> -                  ntfs_attr_update_mapping_pairs_locked(mftbmp_ni, 0,
> -                                                         mftbmp_ni)) {
> -               ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",=
 es);
> -               NVolSetErrors(vol);
> +       } else if (status.mp_extended) {
> +               err =3D ntfs_attr_update_mapping_pairs_locked(mftbmp_ni, =
0,
> +                                                           mftbmp_ni);
> +               if (err) {
> +                       ntfs_error(vol->sb, "Failed to restore mapping pa=
irs.%s", es);
> +                       ntfs_report_metadata_error(vol, err);
> +               }
>         }
>         if (ctx)
>                 ntfs_attr_put_search_ctx(ctx);
> @@ -1640,7 +1655,7 @@ static int ntfs_mft_bitmap_extend_initialized_noloc=
k(struct ntfs_volume *vol)
>         struct ntfs_attr_search_ctx *ctx;
>         struct mft_record *mrec;
>         struct attr_record *a;
> -       int ret;
> +       int err, ret;
>
>         ntfs_debug("Extending mft bitmap initialized (and data) size.");
>         mft_ni =3D NTFS_I(vol->mft_ino);
> @@ -1700,20 +1715,23 @@ static int ntfs_mft_bitmap_extend_initialized_nol=
ock(struct ntfs_volume *vol)
>         mrec =3D map_mft_record(mft_ni);
>         if (IS_ERR(mrec)) {
>                 ntfs_error(vol->sb, "Failed to map mft record.%s", es);
> -               NVolSetErrors(vol);
> +               err =3D PTR_ERR(mrec);
> +               ntfs_report_metadata_error(vol, err);
>                 return ret;
>         }
>         ctx =3D ntfs_attr_get_search_ctx(mft_ni, mrec);
>         if (unlikely(!ctx)) {
>                 ntfs_error(vol->sb, "Failed to get search context.%s", es=
);
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, -ENOMEM);
>                 goto unm_err_out;
>         }
> -       if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
> -                       mftbmp_ni->name_len, CASE_SENSITIVE, 0, NULL, 0, =
ctx)) {
> +       err =3D ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
> +                              mftbmp_ni->name_len, CASE_SENSITIVE, 0, NU=
LL, 0,
> +                              ctx);
> +       if (err) {
>                 ntfs_error(vol->sb,
>                         "Failed to find first attribute extent of mft bit=
map attribute.%s", es);
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, err);
>  put_err_out:
>                 ntfs_attr_put_search_ctx(ctx);
>  unm_err_out:
> @@ -1767,6 +1785,7 @@ static int ntfs_mft_bitmap_extend_initialized_noloc=
k(struct ntfs_volume *vol)
>  static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vo=
l)
>  {
>         s64 lcn;
> +       s64 freed;
>         s64 old_last_vcn;
>         s64 min_nr, nr, ll;
>         unsigned long flags;
> @@ -1775,8 +1794,9 @@ static int ntfs_mft_data_extend_allocation_nolock(s=
truct ntfs_volume *vol)
>         struct ntfs_attr_search_ctx *ctx =3D NULL;
>         struct mft_record *mrec;
>         struct attr_record *a =3D NULL;
> -       int ret, mp_size;
> +       int err, ret, mp_size;
>         u32 old_alen =3D 0;
> +       u16 mp_ofs;
>         bool mp_rebuilt =3D false, mp_extended =3D false;
>         size_t new_rl_count;
>
> @@ -1863,10 +1883,11 @@ static int ntfs_mft_data_extend_allocation_nolock=
(struct ntfs_volume *vol)
>         if (IS_ERR(rl)) {
>                 up_write(&mft_ni->runlist.lock);
>                 ntfs_error(vol->sb, "Failed to merge runlists for mft dat=
a attribute.");
> -               if (ntfs_cluster_free_from_rl(vol, rl2)) {
> +               err =3D ntfs_cluster_free_from_rl(vol, rl2);
> +               if (err) {
>                         ntfs_error(vol->sb,
>                                 "Failed to deallocate clusters from the m=
ft data attribute.%s", es);
> -                       NVolSetErrors(vol);
> +                       ntfs_report_metadata_error(vol, err);
>                 }
>                 kvfree(rl2);
>                 return PTR_ERR(rl);
> @@ -1986,8 +2007,9 @@ static int ntfs_mft_data_extend_allocation_nolock(s=
truct ntfs_volume *vol)
>         return 0;
>  restore_undo_alloc:
>         ntfs_attr_reinit_search_ctx(ctx);
> -       if (ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name_len=
,
> -                       CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx)) {
> +       err =3D ntfs_attr_lookup(mft_ni->type, mft_ni->name, mft_ni->name=
_len,
> +                              CASE_SENSITIVE, rl[1].vcn, NULL, 0, ctx);
> +       if (err) {
>                 ntfs_error(vol->sb,
>                         "Failed to find last attribute extent of mft data=
 attribute.%s", es);
>                 write_lock_irqsave(&mft_ni->size_lock, flags);
> @@ -2000,45 +2022,51 @@ static int ntfs_mft_data_extend_allocation_nolock=
(struct ntfs_volume *vol)
>                  * The only thing that is now wrong is ->allocated_size o=
f the
>                  * base attribute extent which chkdsk should be able to f=
ix.
>                  */
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, err);
>                 return ret;
>         }
>         ctx->attr->data.non_resident.highest_vcn =3D
>                         cpu_to_le64(old_last_vcn - 1);
>  undo_alloc:
> -       if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
> +       freed =3D ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx);
> +       if (freed < 0) {
>                 ntfs_error(vol->sb, "Failed to free clusters from mft dat=
a attribute.%s", es);
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, freed);
>         }
>
> -       if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn))=
 {
> +       err =3D ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_v=
cn);
> +       if (err) {
>                 ntfs_error(vol->sb, "Failed to truncate mft data attribut=
e runlist.%s", es);
> -               NVolSetErrors(vol);
> -       }
> -       if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
> -               ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
> -                          es);
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, err);
> +       }
> +       if (mp_extended) {
> +               err =3D ntfs_attr_update_mapping_pairs(mft_ni, 0);
> +               if (err) {
> +                       ntfs_error(vol->sb, "Failed to restore mapping pa=
irs.%s",
> +                                  es);
> +                       ntfs_report_metadata_error(vol, err);
> +               }
>         }
>         if (ctx) {
>                 a =3D ctx->attr;
>                 if (mp_rebuilt && !IS_ERR(ctx->mrec)) {
> -                       if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_=
to_cpu(
> -                               a->data.non_resident.mapping_pairs_offset=
),
> -                               old_alen - le16_to_cpu(
> -                                       a->data.non_resident.mapping_pair=
s_offset),
> -                               rl2, ll, -1, NULL, NULL, NULL)) {
> +                       mp_ofs =3D le16_to_cpu(a->data.non_resident.mappi=
ng_pairs_offset);
> +                       err =3D ntfs_mapping_pairs_build(vol, (u8 *)a + m=
p_ofs,
> +                                                      old_alen - mp_ofs,=
 rl2, ll,
> +                                                      -1, NULL, NULL, NU=
LL);
> +                       if (err) {
>                                 ntfs_error(vol->sb, "Failed to restore ma=
pping pairs array.%s", es);
> -                               NVolSetErrors(vol);
> +                               ntfs_report_metadata_error(vol, err);
>                         }
> -                       if (ntfs_attr_record_resize(ctx->mrec, a, old_ale=
n)) {
> +                       err =3D ntfs_attr_record_resize(ctx->mrec, a, old=
_alen);
> +                       if (err) {
>                                 ntfs_error(vol->sb, "Failed to restore at=
tribute record.%s", es);
> -                               NVolSetErrors(vol);
> +                               ntfs_report_metadata_error(vol, err);
>                         }
>                         mark_mft_record_dirty(ctx->ntfs_ino);
>                 } else if (IS_ERR(ctx->mrec)) {
>                         ntfs_error(vol->sb, "Failed to restore attribute =
search context.%s", es);
> -                       NVolSetErrors(vol);
> +                       ntfs_report_metadata_error(vol, PTR_ERR(ctx->mrec=
));
>                 }
>                 ntfs_attr_put_search_ctx(ctx);
>         }
> @@ -2270,8 +2298,8 @@ static int ntfs_mft_record_format(const struct ntfs=
_volume *vol, const s64 mft_n
>   *
>   * On error, the volume will be left in a consistent state and no record=
 will
>   * be allocated.  If rolling back a partial operation fails, we may leav=
e some
> - * inconsistent metadata in which case we set NVolErrors() so the volume=
 is
> - * left dirty when unmounted.
> + * inconsistent metadata in which case we report the error so the volume=
 is
> + * left dirty when unmounted and userspace is notified.
>   *
>   * Note, this function cannot make use of most of the normal functions, =
like
>   * for example for attribute resizing, etc, because when the run list ov=
erflows
> @@ -2302,7 +2330,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>         struct attr_record *a;
>         pgoff_t index;
>         unsigned int ofs;
> -       int err;
> +       int err, rollback_err;
>         __le16 seq_no, usn;
>         bool record_formatted =3D false, from_reserve =3D false, tail_all=
oc =3D false;
>         bool reserve_created =3D false;
> @@ -2706,7 +2734,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>                         folio_unlock(folio);
>                         kunmap_local(m);
>                         folio_put(folio);
> -                       NVolSetErrors(vol);
> +                       ntfs_report_metadata_error(vol, -EFSCORRUPTED);
>                         goto search_free_rec;
>                 }
>                 /*
> @@ -2862,9 +2890,12 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol,=
 const int mode,
>         if (!base_ni || base_ni->mft_no !=3D FILE_MFT)
>                 down_write(&vol->mftbmp_lock);
>  undo_mftbmp_alloc_nolock:
> -       if (!forced_reserved_record && ntfs_bitmap_clear_bit(vol->mftbmp_=
ino, bit)) {
> +       rollback_err =3D 0;
> +       if (!forced_reserved_record)
> +               rollback_err =3D ntfs_bitmap_clear_bit(vol->mftbmp_ino, b=
it);
> +       if (rollback_err) {
>                 ntfs_error(vol->sb, "Failed to clear bit in mft bitmap.%s=
", es);
> -               NVolSetErrors(vol);
> +               ntfs_report_metadata_error(vol, rollback_err);
>         }
>         if ((from_reserve || reserve_created) &&
>             vol->mft_record_reserve_pos =3D=3D bit + 1)
> @@ -2901,7 +2932,7 @@ int ntfs_mft_record_alloc(struct ntfs_volume *vol, =
const int mode,
>  int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
>  {
>         u64 mft_no;
> -       int err;
> +       int err, rollback_err;
>         u16 seq_no;
>         __le16 old_seq_no;
>         __le64 old_base_mft_record;
> @@ -2995,8 +3026,11 @@ int ntfs_mft_record_free(struct ntfs_volume *vol, =
struct ntfs_inode *ni)
>         memalloc_flags =3D memalloc_nofs_save();
>         if (base_ni->mft_no !=3D FILE_MFT)
>                 down_write(&vol->mftbmp_lock);
> -       if (ntfs_bitmap_set_bit(vol->mftbmp_ino, mft_no))
> +       rollback_err =3D ntfs_bitmap_set_bit(vol->mftbmp_ino, mft_no);
> +       if (rollback_err) {
>                 ntfs_error(vol->sb, "ntfs_bitmap_set_bit failed in bitmap=
_rollback\n");
> +               ntfs_report_metadata_error(vol, rollback_err);
> +       }
>         if (base_ni->mft_no !=3D FILE_MFT)
>                 up_write(&vol->mftbmp_lock);
>         memalloc_nofs_restore(memalloc_flags);
> --
> 2.51.0
>


--
Thanks,
Hyunchul
