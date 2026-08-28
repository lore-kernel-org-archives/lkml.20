Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963038C426
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939106; cv=pass; b=i1vIRiDXwYScbqapxrUWMsPdmDVG21Ez/+vULkv2AXo17nFiyjKyDQ2V3I8TJmaGBQyl5D7LFlgvsAuC+7SI0JtrpgZ93YBJJyTghKxq56SVd1I41kbcOs3BcDlnz57amB1b9XXHFzOScveMjX0ehDoNypj8dX9O2pNh1YcMOMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939106; c=relaxed/simple;
	bh=zrNE2jmebpTMC7web2EYMJR/cyJXq5QUvn/XpP8svE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLn/rM/3Yi+6y5I7GO11c3Hah7drey7M5wzzW40Mg1nwjUeZIthmVqacpvGONU+J1IB6VUyiQHtJkp1baAcap8QRhlXIqsJBwoCOLLWH1dDqi2nrCcllB4+vWg7CpeM8XvuU5BwzG+2hJEZEcyhjTiY/3kcO5UUEPcuQ5o8LXB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCZte0B6; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCZte0B6"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f216add2eso130945b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787939102; cv=none;
        d=google.com; s=arc-20260327;
        b=VJRLxI5k1IIGUxcU5mP0iaTuUVxlMQQ7+sB6Gp2isVl3bi5O6oJHUQKm2KTE3TdvJK
         EyJtFbfaQTcu9Oel6fpmm1IsWPMqK2/lVoKsZwW3RhFXNDUZCe2Rr5hEnXSHxFPcHm7k
         cbQor6vFueTN3i0VbNDnmbrEkSFq5iLQlbGTnwqnppEju2UvsLHNchT1+GioXFtG3byU
         ZYQ/L5oEdSu8GKrK2fixP/mI6mYvkGp4x8OV/sByovcj/Vl57WuZ6ZQSV9D0j3nj0bpT
         TfXbhWKLn2bYYYTNOWoWnZVJSjHy/gzb36NjYriLFucNQKmVJDagONbsJemquqxIg+4s
         ging==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mw3Y+lKt2uymRKzrejP7wbItSpM+IsJHL5K8XFWCqL0=;
        fh=AW8XeX0bF1rait+SgSCnVVoxWqpxEmg2T2OQtFC07XA=;
        b=ZCgn23ZWhlKNU6mIT1YJKpJUNdrXkyGjDDDuh6VaIhOsOu3e9/jWEHzKikOXK65m/G
         dRhKO4WuzfocItp53Rj10uQ6wxYWj89AwqXXZcosa57OEpZfGq5YSQcwxMgQwPhN7LpK
         JwLNP8HLyF8Nh959krx/qZbjXqJuZoPiNeL5qDl1w6cG2ziQAWBrFQVXk83T34MeESiR
         Pz80+P2c25y/SdAoEZJ7gC5GBpoabdYj5letDUFZ75C3AFTcreAHxBL3X8EHYNlsIKQu
         MXGKdmL78bGea4x3ZoPj3NfFojHvytlN19VBxr3NZ0NxctDt1M9XPKVzoOwcaO4TzzQN
         nAbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787939102; x=1788543902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw3Y+lKt2uymRKzrejP7wbItSpM+IsJHL5K8XFWCqL0=;
        b=SCZte0B6OYkr+ATpngUEtqrvuYJ6sne/WqXZ7nwjk72cl7qYJr7OPBMhXaYRC9Fj2G
         /6HyMrPULYRPPOyZgA6XAcEvPWC6AdNAvVt+lhB/fDLKYDAVOP3j9tzLJwCQiOsVo0fy
         XMRE1ZgwVr9zpWPkWXjn9BQ6Ua0RoBdCNRAk3bubRCHTGMFFpktz2Pds+oXdgcsisAVN
         K3f7SGelNF+kDHVUx5E/CR78cw7QkTtgPhJYH2FHHp1I+zrGHoW99bxTDStzEomiIVAA
         yeJRDOJipv8pYDIqSWNLdWRDoEezNyFD2n8t6Y7hm5gH81dPv8utZ5uT/wJGGA9TGNnu
         z21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939102; x=1788543902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw3Y+lKt2uymRKzrejP7wbItSpM+IsJHL5K8XFWCqL0=;
        b=Z+GhWIW2xmU8vkgk23wLjJ/tZQeAdMKnCN4Pa3XEQdiXZxMdKpJ3Rvs27C0KiPVO5h
         7dqnI0RfBh1k4zrrvYU387iExUf/qsCerHuop1uxVq2S4AsaEc9fJJ/7ymF/jJlU/1UB
         p5adJOJNfkbEKMQ6yWdqOg1x4gK5ncKQ5PoBMLgzCUuJQXpo5P1OOpB0JR7n0krAHIw4
         /2L2K8B4sfAaKKdUdlxMGCFb08vWR5CdvGmoEuLgYIlOwBT2hGqqssKJ16cUiUBSoDbP
         WoyM02sBedfQGxS7l+OlwPQY6HOVyLQNWXvc9Ugf32iJlCP56sK9D2i48/ejdmYrhelY
         Arjg==
X-Forwarded-Encrypted: i=1; AHgh+RqOK+bNPvDCBCGUctYs6qc+uRCmEGRI2iz0fztv73+QihfcqQaS1yLTVSp5NVuht/6T1flpYv9UaryqZGM=@vger.kernel.org
X-Gm-Message-State: AFuF++knjq+C1gll+bFi/aF3QtHSc7+rEtSB/qSqC9PYQ7w2X/VsaguH
	uHhug69+nBlDnDE5Si8svQefk1C47S7XHnCuqVJgFNaQq4nCnYM105nv54pg33vsyuF2r3LnNe/
	TYeCnil5kfNOi7CxcN0rFHw9LAQjaX7WnSRHbq/kTfQ==
X-Gm-Gg: AR+sD106A921gbcmwUY6O3JBKG3+VaXgoa40++awY9sUP0Refn8Irgs5dpB6QOJSIDB
	3nK4laqLlerHEUQ6eQGTANE1u+sZQq6YZJNphRvYlFl53J+bVxnMcpZ46XmCA51Pb8xmeDpcuBG
	0swtH/a//NTpJaHO6wXgaWkzmMbdanJsb4lCOdPv/moC9yvUjiCoD4FjEl2MdfTguPc4sbEL16F
	p5WaQ/BJ/w7DHJebz8Cuz3t0sGjV31t2NnX7d/YAO1CrKbeuNX8kOPLezTmYf0cpOLdjf/2AbQC
	de0ewLco+DNNVCP5Ca8umQ/PHSSnGOJsQpUeNXGS7F4Ofz+xjIiKDCI1Y1CDMmpo3xU5+r5n0Jd
	t6Ndh3tqaP+GTPlEz0uWlfn+KTT25iKaKQR16AAjI5Wtr
X-Received: by 2002:a05:6a00:2289:b0:852:355b:2430 with SMTP id
 d2e1a72fcca58-8562a001846mr17704249b3a.10.1787939101725; Fri, 28 Aug 2026
 10:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com> <20260826130916.2231342-3-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260826130916.2231342-3-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 10:44:46 -0700
X-Gm-Features: AcwNN1UllGtgLs-8uTsDEcb_0iJO-fZYMaRrjc0gSD6U2fjS6MYvT-H68ZCnMRQ
Message-ID: <CACOAw_ybFr8thjmy3ayzB0u+1f5vSFnR8km67J4bkOE7czSyYw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 13/14] f2fs: allow large folio support to
 writeable files
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 8:07=E2=80=AFAM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> Now we make all write path support large folios,
> so we open permission to let writeable file set
> large folio mapping.
>
> Keep fs-layer encrypted files excluded unless inline encryption is
> enabled, since f2fs_encrypt_one_page() still encrypts one PAGE_SIZE
> page and cannot handle large folios.
>
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c  |  9 ++++++++-
>  fs/f2fs/f2fs.h  | 13 +++++++++++++
>  fs/f2fs/file.c  | 16 ----------------
>  fs/f2fs/inode.c |  4 +---
>  fs/f2fs/namei.c |  1 +
>  5 files changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0b167b14a9a5..2e20833c6417 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2955,7 +2955,7 @@ static int f2fs_read_data_large_folio(struct inode =
*inode,
>         int ret =3D 0;
>         bool folio_in_bio =3D false;
>
> -       if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
> +       if (f2fs_compressed_file(inode)) {
>                 if (folio)
>                         folio_unlock(folio);
>                 return -EOPNOTSUPP;
> @@ -3321,6 +3321,13 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio=
)
>         if (fscrypt_inode_uses_inline_crypto(inode))
>                 return 0;
>
> +       if (folio_test_large(page_folio(page))) {
> +               f2fs_warn_ratelimited(F2FS_I_SB(inode),
> +                       "large folio does not support fs-layer encryption=
, ino=3D%llu",
> +                       (unsigned long long)inode->i_ino);
> +               return -EOPNOTSUPP;
> +       }
> +
>         fio->encrypted_page =3D fscrypt_encrypt_pagecache_blocks(page_fol=
io(page),
>                                         PAGE_SIZE, 0, GFP_NOFS);
>         if (IS_ERR(fio->encrypted_page))
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6ae249bf9aa1..04ed0ea92b26 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -5201,6 +5201,19 @@ static inline bool f2fs_quota_file(struct f2fs_sb_=
info *sbi, nid_t ino)
>         return false;
>  }
>
> +static inline void f2fs_mapping_set_large_folio(struct inode *inode)
> +{
> +       if (!S_ISREG(inode->i_mode) ||
> +           f2fs_has_inline_data(inode) ||
> +           f2fs_compressed_file(inode) ||
> +           f2fs_quota_file(F2FS_I_SB(inode), inode->i_ino) ||
> +           (f2fs_encrypted_file(inode) &&
> +            !(inode->i_sb->s_flags & SB_INLINECRYPT)))
> +               return;
> +
> +       mapping_set_folio_min_order(inode->i_mapping, 0);
> +}

In F2FS, newly created files almost always start with inline_data
(`FI_INLINE_DATA`).
Because f2fs_has_inline_data() is true during f2fs_new_inode() / f2fs_iget(=
),
mapping_set_large_folios is skipped.

When the file later expands and is converted to regular blocks in
f2fs_convert_inline_inode(),
`f2fs_mapping_set_large_folio()` is NEVER called.

As a result, almost NO newly created file will ever use Large Folios
during its lifetime.

Fix: Call `f2fs_mapping_set_large_folio(inode)` inside
`f2fs_convert_inline_inode()` once
inline data is converted. Also consider using the standard
`mapping_set_large_folios(mapping)`
helper instead of `mapping_set_folio_min_order(mapping, 0)`.

Thanks,

> +
>  static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
>  {
>         return F2FS_OPTION(sbi).discard_unit =3D=3D DISCARD_UNIT_BLOCK;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b82acbc3240f..c8426821e701 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -134,17 +134,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fau=
lt *vmf)
>         int err =3D 0;
>         vm_fault_t ret;
>
> -       /*
> -        * We only support large folio on the read case.
> -        * Don't make any dirty pages.
> -        */
> -       if (unlikely(IS_IMMUTABLE(inode)) ||
> -           mapping_large_folio_support(inode->i_mapping)) {
> -               f2fs_err(sbi, "Not expected: immutable: %d large_folio: %=
d",
> -                               IS_IMMUTABLE(inode),
> -                               mapping_large_folio_support(inode->i_mapp=
ing));
> -               return VM_FAULT_SIGBUS;
> -       }
>
>         if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
>                 err =3D -EIO;
> @@ -698,9 +687,6 @@ static int f2fs_file_open(struct inode *inode, struct=
 file *filp)
>         if (!f2fs_is_compress_backend_ready(inode))
>                 return -EOPNOTSUPP;
>
> -       if (mapping_large_folio_support(inode->i_mapping) &&
> -           filp->f_mode & FMODE_WRITE)
> -               return -EOPNOTSUPP;
>
>         err =3D fsverity_file_open(inode, filp);
>         if (err)
> @@ -1177,8 +1163,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>                 return -EPERM;
>
>         if ((attr->ia_valid & ATTR_SIZE)) {
> -               if (mapping_large_folio_support(inode->i_mapping))
> -                       return -EOPNOTSUPP;
>                 if (IS_DEVICE_ALIASING(inode))
>                         return -EPERM;
>                 if (!f2fs_is_compress_backend_ready(inode))
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 96cc0e777567..7c4b5cdfe276 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -642,9 +642,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsig=
ned long ino)
>                 inode->i_op =3D &f2fs_file_inode_operations;
>                 inode->i_fop =3D &f2fs_file_operations;
>                 inode->i_mapping->a_ops =3D &f2fs_dblock_aops;
> -               if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &=
&
> -                   !f2fs_quota_file(sbi, inode->i_ino))
> -                       mapping_set_folio_min_order(inode->i_mapping, 0);
> +               f2fs_mapping_set_large_folio(inode);
>         } else if (S_ISDIR(inode->i_mode)) {
>                 inode->i_op =3D &f2fs_dir_inode_operations;
>                 inode->i_fop =3D &f2fs_dir_operations;
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index afaab7739283..bdf4e586bfcf 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -341,6 +341,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap =
*idmap,
>         f2fs_set_inode_flags(inode);
>
>         f2fs_init_extent_tree(inode);
> +       f2fs_mapping_set_large_folio(inode);
>
>         trace_f2fs_new_inode(inode, 0);
>         return inode;
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
