Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1725A2A4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916383; cv=pass; b=gRSWG2+Uw0ZONNMUEe77xdROjxPRq0M9zt7fDxTJndJbWbaYPvWDaBA6Ri8W6kbyMjy2DWw5lZiFhsZYiTpyYN+H/p4x6InMO9Q2xNS8wqCKE0Ykt8TA7fFxdC3Qvfe1VVU5ODNt7gHCzhLmPvxuxOXwb4tm1qYYBgaVmhhXNBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916383; c=relaxed/simple;
	bh=bdCoTddfKaTHsPTx0EilFSFAt/yUFrkOn9TGBFgiMp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrxgnkVEy8HT6L/tpi1DwAxV7pnfZaShLfGhEWXKysbYLiLOz9y8TaDCazONyYlioCbjy+pO6RY3q0Sc8QgEhnGTJzFw131emWQNow+P2tu8qV8dnYLAzpIc1QDl1Vdd5iaIN/pRjSbGjnLe54J76gqxAU5ndtj/HrL5sQ2jVj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq/9bYn+; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq/9bYn+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485843116d2so405109f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788916380; cv=none;
        d=google.com; s=arc-20260327;
        b=oo71txTTC50HHnGoIOqZLd+0T5rfOewPnOKNzsDq+7rOmQNTi5Vqu9Ef9gtjHO8qfY
         7u5LkukKnYxHtkwOGKcL75XkM8ALPCKuURHJ6GU+9l3kJaJZX23F0W5iRC1ZMPJ+E+JR
         zj5t2ViK2kjqQmNJkRVJfvup3HH8P19k0lAoDQLSiqXZ/OBGoCwkunPj/LdBwsdhMygT
         TDxxv+r+gX/8tl3+CkbfBC9BM6ssFaX0Wao7GXd7tF5uyf0DQCch/gX3oepANyj+n0BJ
         OoDshL6iXl6gzZZWQItPGAU9d6rZoPaglbUesswa7eI5HMmLNKipVgs5BVHiLnJg8QZO
         hn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/pbXnjBJcdoF7CaGTuOgdcdmxNeEQ1orWGBuh7m6GU=;
        fh=pWYhDjtK28zTUcHDffEz6ELIyTEZE7re3Abr8r7RHIE=;
        b=jY36fNEhouZaNogUKAwQ6ahh60Q6mb73Gw9ggtvDADS2pOGwjWl3VpW+cSo5VTRL6H
         fOnVW6k9c5m/XFuRml1HxAOF4o0S7/NXoHjRhAmPHJfrgLFyo+50huvVBu2Hfdaqd/0x
         eIQ6h4703b3cuuFYVrgI5PkZNUbecqw6k9GN+CN7GuUaFtJDC/NzjDCdJg/5IrWVI8sL
         VHQnPdkauPgLVoQnGzhY7O6KuhJZEEpaOc3rFROivDBhV2qziKnQOwayp8MMqC0KIJdo
         RbY5gGtlOZC5V1aLxxFGda9HAh8f2l0jMwoYXhIQnb6tf7Gf1zFJB+Prfh4MyI/kHAah
         cZ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788916380; x=1789521180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/pbXnjBJcdoF7CaGTuOgdcdmxNeEQ1orWGBuh7m6GU=;
        b=Aq/9bYn+lD1RlsDV8e6QORn4WDYfGwWFOf7/q+I7miqsR2SuV2Mw5LdRVlr/YkGw75
         MG8T/YB3sZA+1xoFM1EofdQRgxpOc5f6BdJcG4RuiECJn36F+LisY3Vqxp36byv8uCry
         7AYNTRwOIAP6fxxgDK+JBJn6Idnz70rJ5HvLpCh14i6La3S28odxr26mEDr1ZbAE0vlT
         61+LJjRfMileNuN2GDiVA7wNgShWRRkbFvl9i0RJ1eekeaw7V9p2fNMzaPL/NoKXDsWt
         EneC8VfrdWbxpoVbhtKpSg9JbAPlFs9gXrg4fmimKEBEZ5wmAB3inEkKTlH9mC8yAfAk
         AmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916380; x=1789521180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/pbXnjBJcdoF7CaGTuOgdcdmxNeEQ1orWGBuh7m6GU=;
        b=exrPhXd1wMb4lM1UFMTUYva9aseD65dIRjqQ1Grh4JeDGetwn4yT68l+q9MRCI1080
         VuPmsIYU6bodniDXg2yrqiI8kI6w0+N4ui6SHVgcr6A5e+c8IKyOhqHzKq3ktJ8h+FYJ
         ZMOkyJjoepd+0PHaiIST35KFpcfA/+vg4tA+Z53yj5bdZeW/shtFaZjyX+caFi7c7KDK
         WxbIKv9johmoneg4KIrLlHR0SEkCS8jEvfYwulTOQzA2lm/2hY2B+h1RGEMc33sY8MQp
         5OBl5QM3kxi8+XGx19v1YMiCj7WU1xf7hbJbXhgNHXq+x0rG4RSQ2zQ7KVoAuYndw0mx
         ppyA==
X-Forwarded-Encrypted: i=1; AKwUvBxjk6PEjbnA50omtfe8FwQ+TWkKmm3sCYmxGGx2r1xjikNEIHcrEeroXdeOmjWonyKb9IcjwJFMi6f2Ndo=@vger.kernel.org
X-Gm-Message-State: AFuF++n/9srlT4yq/pg//VOi4inCq374pxtYG3uL9Ms7580rehJUyyx/
	YFOYSDFd2ysXH9eDqgy1LlK/23Lvqq2SPHtwJApTRWHR1fP8P20oB1L1RGsxP4UTMZjwPil3j79
	CIQRxJMDsaXCaX6G962r0lGKw/oursbfyFbSE
X-Gm-Gg: AYBFou3BBfbkbtSbT/5zTrwka7KZcSmjCHfKwsZ9dzSL1DK1qdiQHeSVJY1N2gyl+wd
	qzdq3jBBTYLfW7/uze7xNu5aaEhV5veht+h2DhKdS6garnINavllpfcYId3mV8oV8eBUi9F3UzD
	UdxA0cKmAgXaCLZ6z0y2MY7rGCFEepwh8GW1Xf08YKf5t3fOAg6g60Yq33GiTAaPsqtsNecQTiQ
	pX6W4Dsc28BJe0HQ7Xe9oj4cmwx08HPFQ1HpGU5zVIIBq+JBmlLmva0/zMbbRnJjFtK075mvMzg
	0/lLa3oxwrzf3y9HFr93Eh3ed6Usq9YMP7hzkU9NrUkFqicLay8KBPKG
X-Received: by 2002:a05:6000:144e:b0:485:8d31:ccf9 with SMTP id
 ffacd0b85a97d-485907ef7a6mr22363733f8f.4.1788916380195; Tue, 08 Sep 2026
 18:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824131729.3694378-1-chao@kernel.org>
In-Reply-To: <20260824131729.3694378-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 9 Sep 2026 09:12:48 +0800
X-Gm-Features: AcwNN1Vcn3h2XagHNWBx2qCvHznDVYzJaDWMaestGz_GrOmdGRLa4VxE9UXUXkg
Message-ID: <CAHJ8P3+KBs1cQnDPsfpHOyjxNA+JNQ5DPCbrF_JqTLcmoyzB1w@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B48=E6=9C=8824=E6=97=A5=E5=91=A8=E4=B8=80 21:19=E5=86=
=99=E9=81=93=EF=BC=9A
>
> There is potential deadloop in race condition:
>
> Thread A                                Thread B
> - fsync
>  - f2fs_do_sync_file
>   - f2fs_fsync_node_pages
>    - last_fsync_dnode
>     - folio_get(last_folio)
>                                         - f2fs_setattr
>                                          - f2fs_truncate
>                                           - f2fs_truncate_blocks
>                                            - f2fs_do_truncate_blocks
>                                             - f2fs_truncate_inode_blocks
>                                              - truncate_dnode
>                                               - truncate_node
>                                                - invalidate_mapping_pages
>                                                 - folio->mapping =3D NULL
>    - is_node_folio alwasy return false
>    - atomic && !marked is always true,
>      then goto retry
>
> Cc: stable@kernel.org
> Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/node.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 968e5ed38816..86c2e67e43b6 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2016,6 +2016,11 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi=
, struct inode *inode,
>                 f2fs_debug(sbi, "Retry to write fsync mark: ino=3D%u, idx=
=3D%lx",
>                            ino, last_folio->index);
>                 folio_lock(last_folio);
> +               if (unlikely(!is_node_folio(last_folio))) {
Hi Chao,
is_node_folio->NODE_MAPPING(F2FS_F_SB(folio))->F2FS_M_SB(folio->mappping)->=
F2FS_I_SB(mapping->host)
if mapping=3D=3DNULL, panic will occur here?
just like  commit msg in  mai: "f2fs: parameterize node helpers and macros"
thanks=EF=BC=81

> +                       f2fs_folio_put(last_folio, true);
> +                       ret =3D -EAGAIN;
> +                       goto out;
> +               }
>                 f2fs_folio_wait_writeback(last_folio, NODE, true, true);
>                 folio_mark_dirty(last_folio);
>                 folio_unlock(last_folio);
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
