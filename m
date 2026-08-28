Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A33A3804
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939563; cv=pass; b=jN4s6LKcG3WtmuFInDQgaQ/EohaiOltBQ+RJScU9PLa62Sl68hmDaDxVMqlbf27uwgSYlkSVlmKhL3zMtSo8GBrCNHI4EuCq+iOw0vIXZqFuanX4w7n0jF5mVoxB2cjreA7fMbi6NR78jmgsuwz67rZxrMv7E5FJcLSaC3LPrzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939563; c=relaxed/simple;
	bh=6ZzikBitH9akUpJqqMEM3Inke16/dxGzAf8itIjkcUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZI5/MrgCLOigi4cbSy6mOeoHZP0vW7pai5Yxo0+8+UQGU/5KkvLmruUF+mg/B9QfoCKXG5VLdjeY7jBAg8tZNCacfdBO1Hi/TXEsn/SJLwKMYjOffrPUBcQ+imulpU769huoiC/66sHEmRsnhVA2o8q0oBpl3QGW9DLAC2lotE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k37fRRTm; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k37fRRTm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485b358552so1189589b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787939561; cv=none;
        d=google.com; s=arc-20260327;
        b=oKpArfpahwDuKZZeKj13DGR0GrcV/M6R8NPuz4lwe4x8Jv/T1us6IaeL7cYlz93xjb
         eyXciBsu5q/H6D76U35xXxhiVoSVZVGQLRoW4XIljIvVj4uAVPDmr46+IIoH2vxkEbNJ
         FdqqQAAB9s6inItHn5lM2glW+iAgij2Y8SRfshR5YSYa9y72NRRV+oCAswwyitRb/8Ga
         PaG+HFCxO0jUiipgmvM5Pzvw4gMnhTwR6dV+vsironlF7xXCTLDm0pFTMTgSlrl7X4bt
         eQmPNG2neyYoiEMZO/M4TdT/ezXLm8BDm78orGuwF7CPpfgByzqGCovi5SUJQ9BcvMwo
         DsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWPpK39kkwZ7ljJh3+TEpc44Vz3uaxpuv9JHHyuPUYE=;
        fh=Kw64h6lZaqM7PC4+gCoGcBrAmPyXTwc+pOARuDcMUHk=;
        b=qvzXw0A3W6wMSOvNFosaLIsawVcKRcdnbx7TMfuaD8JScrJxRA8menBIJKzmBqPdGm
         TvpIyn9441J57snhOELSUOJ2GcNagk+9BjtyJrQyOeOLiIBV1aSL72GSK84tT/7fsLCA
         +DPKEbuskFMcfjkW+iRizIanN/9vuVDJeE3YorpH9OT/RP8RjW3igxxgJu5Xf6dbHWnm
         d50OTiFaa4bNZKONe+D8bKbe1JsZWohDZGDFjcFICiQuoAFGKbaUsEnTpHUQtfvaGNQI
         5r3IeiURhBJzggTDKodRCN39k3zRxeSTuVUFzc4CffeuD3gZf0n3+RYfxWdhP/IpFJRg
         z8+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787939561; x=1788544361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWPpK39kkwZ7ljJh3+TEpc44Vz3uaxpuv9JHHyuPUYE=;
        b=k37fRRTmGBU5Mnt3kHBLBdSxwevPqsViBTPsVOsOgAxpgdOH/xo9n6CwOcfGPBWuv+
         aSdUoO51JHUu7cgETKGjsKc2r//QzsY/ncq4cONLK8fYmZfT1H9m2TTkl/AkVBNJRX5c
         8NkECFLcG6T2e3XraEVwXh3AyI/LlJvpMpbILFDgqFOCTkk/S3P7ShVGDLjtBlut27Hy
         4r/1d7CPWLtl3U0AZijnBbXd4cY6+9lVi/LuKPGjmGlukr1tw7oyb4t7ipT+fli8Yuc1
         4Q2utJq+lnGSAmDYNfYG4s5iJxRwyU1uPwoz7QOnd2jOugRChCxF6raIczR4F1o7xxxj
         qZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939561; x=1788544361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWPpK39kkwZ7ljJh3+TEpc44Vz3uaxpuv9JHHyuPUYE=;
        b=YIXDE4klz3IPUqzS8ZlwOOflEmkVWHhxvtkp07LGbmqSEonaaRNDRqYaa2x1t0f5Sj
         FIrmwVHgygbGgixA5aBOwtzNc7DV7BIP3J2olCNzmz+tEoD6YpTGaGuSS5o+xyZcli5h
         NEi3Opru1eIZYHMeacey9N0tp51EVgmxfMd+882N/Gt1yPTN3Gaa3xbE6Nf4KsO+WAX3
         h5JYaLK1hp7CGSy0z9sMs9S7Mx95k/fZGlmy/AYcXwIlCmnEdz7cGClFoFBeLXyT4MGN
         v5RtYarZqJ+lzEHEuvaoq6op/6wS4HAacVmMRjx9I53tu2Hm8VYmbniCA6HcO+V/R39/
         E35g==
X-Forwarded-Encrypted: i=1; AHgh+RrN73J8uYTmZ0Z+az5bjA+1vLx6Js0BthGRZPp9PBiWwRb3bsjt0+ZBRY6SfJ9cUj1hbvEhDxKhw1SLgC4=@vger.kernel.org
X-Gm-Message-State: AFuF++kNKjU4CPnOuWuNxqMW0nheq/XzsTXKdhvxkoIuDzQ7w0uJb95j
	UzsohDtpOPihcBNVuke4rLvp937T88XbzT8++u4cEronsy9Qy4Zj73RbtoSI2z3pNJoZR4UI9k4
	bFRZz6BO3XIwSiCPy/EEX6SYulk0i4cg=
X-Gm-Gg: AR+sD10A2Ur5kckc4gzA8FiUeH42TTlrdT951QClxaIyxM2KFUAV/E/QHTusVztJNcA
	M1BCMVQMyXm4HkZYmrqLEbzaFLrCw2s2DwdwCkEAj4ZXhg1iM4DeCLh1kGKozJHzoUq3+FItfE9
	nEU9mmMrGiN7dlIxYaPPOWzlxKVc0VyqtT7UrrYnSkx8haBiGpCHAifWzq4GSce4FszVSw71xzQ
	vDmKv/dwMTQUqOdw+RkgFGJSiAjnAIXN3nDcLPNrFG/8IRlgDZrEQtGpl5yZwUwWB2wEnIpQGQM
	Q8wM/JuCp8cVm8OUpDoZRgPOvIy7sRrqn5htNwFxUDrIlytBgV1nWBMG4h1iZ1kzvTI2mVWLNuc
	tKLnSfRCN+rkpu5ZqDyYC6BR5a/OI++ksls+AVhDHqR0F
X-Received: by 2002:a05:6a00:390c:b0:857:726d:2e9c with SMTP id
 d2e1a72fcca58-857726d301cmr1724560b3a.25.1787939560883; Fri, 28 Aug 2026
 10:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com> <20260826130916.2231342-4-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260826130916.2231342-4-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 10:52:21 -0700
X-Gm-Features: AcwNN1WUBDd6efZN5XHqxY9lyShZYtca5PE80NEUuVrxcs3NfoRFFB6LUMG3fQA
Message-ID: <CACOAw_xyveu1Dt-UwWFKtEtf0LOZn2TOwqNyXh_DKRs=gCVY9A@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 14/14] f2fs: make compressed files compatible
 with large folio
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 8:10=E2=80=AFAM Nanzhe Zhao via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> The compression flag is the hint indicates that the inode can be
> compressed, when the inode is using large folio, we expected it keeps
> using the large folio read/write paths and its data stays uncompressed
> on disk until the inode is evicted and re-read
>
> Let f2fs_write_begin() skip the compression overwrite preparation for
> such inodes and remove the compressed-file gate in
> f2fs_read_data_large_folio() so the data is simply read/written as
> regular blocks.
>

Patch 14 removes the compressed-file gate in
f2fs_read_data_large_folio() under the
assumption that "data stays uncompressed on disk".

However, if a file already contains existing compressed clusters on
disk (e.g. from
earlier writes before large folios or created without large folios),

`f2fs_read_data_large_folio()` will issue regular bio reads without
decompressing them.

Userspace reading from an existing compressed cluster will receive raw
compressed
bytes instead of plaintext data.

Fix: If an inode has existing compressed clusters (or until large
folio read path
supports decompression), I think we must not read compressed clusters
via f2fs_read_data_large_folio().

Thanks,

> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2e20833c6417..befcdc3742f6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2955,12 +2955,6 @@ static int f2fs_read_data_large_folio(struct inode=
 *inode,
>         int ret =3D 0;
>         bool folio_in_bio =3D false;
>
> -       if (f2fs_compressed_file(inode)) {
> -               if (folio)
> -                       folio_unlock(folio);
> -               return -EOPNOTSUPP;
> -       }
> -
>         map.m_seg_type =3D NO_CHECK_TYPE;
>
>         if (rac)
> @@ -4935,7 +4929,8 @@ static int f2fs_write_begin(const struct kiocb *ioc=
b,
>         }
>
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -       if (f2fs_compressed_file(inode)) {
> +       if (f2fs_compressed_file(inode) &&
> +           !mapping_large_folio_support(inode->i_mapping)) {
>                 int ret;
>                 struct page *page;
>
> --
> 2.43.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
