Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B64A5EB7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011799; cv=pass; b=Gza3VNduTPrEHnjT0glPx3hgQ/8I1bq/Zhh9K//vPG7lfaXs4qj51rNSWtvJB0p6M3/4UewBd1BjY7weHEF7Got2WD4cVKRyeSWEUGrHGskbY3vpAVj8YVRIXNt8pm4vuFKDSKX76z872+KmcFnCBZncw8VOfalNVGWdGnQozZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011799; c=relaxed/simple;
	bh=T4Qy6GFRO1ST1QLZrYR/490K2fdT74b4dRkAKQGKFgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugunzmiP71wc7Ot/ziYGsIPpwThk8R+Wjgdl5dMVRmjsS0tIPI5y4qOXToZT/Ii8gfRJEV0bGBCTXJBWu6INbL9+Qr9g6EPPo38Y4r00hBrsU2X1n08ZYIqFeZkIfZh1wWG2i6YLQcpP4aQ4UiyeoWl0ZgjY/do1NOAuo556tEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6rmrFuo; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6rmrFuo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a980c01033so11491921fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792011795; cv=none;
        d=google.com; s=arc-20260327;
        b=HylO5UbrtnmpeYrB3CCnRLOvqJhUmRUANdTmC+NI3YHaByR86gKzi8OnZtMaKp2uNz
         DfmSBdlTqC76q48LjZzvzNe/Dtz2nxctYnaiP61kK+KJFHFr/i1RYp6vf4VoGlUIwYU6
         YJt/+/jbaa3ynfYaMok8wsmFesrc70PVw5i3akuOTBDIS3onK6ib2F/JfvLhLGI88jAr
         sbGgyB7JDmMiVxfAdekVjBjUrNZalfZAeK8dZL2ihVXdqe78kwtkPqrRDVEgyaMJbFQZ
         x9MvomWGMoDw0ifsg8GPWXvOO5Y339eXDjZPRItyoiqfYRf8ZYNxp0nW/vo5KZbhgG9b
         nQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlL07No56m0cxdKc4fCRf+IU8nDpAMVPkbecBDh9W4s=;
        fh=S5sUhwmxG6b33jj5CebLRWRIr5R2rtiFmvmD+XG1Zs0=;
        b=O6uzlZ0N2ubQbz6hVa9v1nZYpvkHkJJnoVeu+niLDs2L9TlpvkH7ma9PF9xfDc2hgh
         fm8p6ErrO8VemAOd1KNtHOif78wnMjxgc5mm4ctdP85wN5GVHov7HBatBPrItEO3Ujp6
         tXZnt3KbHBHNK8qS/FgreKeLHAk8rQWsZCmsXhUX2L2Lg8g2NyMo8ZGgEmqSSgeVCiLJ
         3G66NNsyeEJyPNeUvd0UlAilb9Pt6Rga6VvPA+wfIWH03ul4FD7ixiaC+xvghgWVnUus
         WQ/aGZDCqOIr56GUOdFBWl3FzU8cINyMizILtrtb4zljt9ceOn2wf8yxngAB+fet7Ej5
         zLYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792011795; x=1792616595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlL07No56m0cxdKc4fCRf+IU8nDpAMVPkbecBDh9W4s=;
        b=p6rmrFuook6XBkT1FyUVaG7PnGlClKjiGTvXYwuumOMSAiH4jafl3vEOJ61HeR1fxN
         SNELFMoFThTXB4mZdndM/Odu1KsgcBNjYjW8AUVxaqbbWHA9Mpz8szL0F7H16JoGnF4o
         iuVwBA3AOXhkJlLoWFfsslfengH2mXuBDVfVxeUyPVR7HxTQmQ+yLCoopXM6dqxXPEzq
         oN+HmDJ729Bci836/K5EvPBtcohFR4lpV5pRuiTdHPomhqH25ohiDX1p6dzHREEfTv3E
         YKJN+8QLk3WRe2tZtrmDoW3qXjXMinZDf2R+OzSsu/zrnG4tqG77ZUpxedV84JusdC1q
         2hkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792011795; x=1792616595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlL07No56m0cxdKc4fCRf+IU8nDpAMVPkbecBDh9W4s=;
        b=bmpLanIIEL7MvjRjTh05K5BfOASgPQbZa6Ee9Dd22NCy7CjuSvWf7WogEMaK07QmB1
         dIRg79jKNFNrS6CtJroVLZP763uUMfmkthP567P6HsQpV36VGAHcgRou8v4wiJyYvdbN
         4hiQFhfNWHYp/9Z/HAnfr7z69f+fbEKafGV8bkMc2i3rulX/QQn1whWvbuTonykCstES
         SjLWmgKKdPOaVtHsDUzZHtz9JsMXtY5tYCor7q/mVgt+XsFc5ntYzDXIstLkIMpH7Yth
         Nv9PrEIEtmZR2CLbbSPnsgz30J43yHJUeP5nkpQpGs96wN+ONUEO0jxIPB0BufunWSDH
         bxew==
X-Gm-Message-State: AFq9FYID2o9zHZsfth2Y2HMHlRbzAN/1su8O8q/1vVGn4dnoX/ZujD4U
	bv6e3mHuaYdujiQayjceoVNZqMor3Vved3jPG37mvxWBD2su1jt6QXYmqp6y4mXXCQmKRh6u371
	Njtb/7XBDtGyhmv8DIR9i1Iqkk5e4aAwPj4WWgcA=
X-Gm-Gg: AYBFou1LoVnZ119suhaGoqoGzeyHKCebEqXwFe/WV3Uk/yyXWaI7y70Nig9ZPRS0maM
	vcjU+7V8HtUdaL1C3kyRV0AoUDmiWH1V56m+DGfRuZBXWn0PR854G0/+lDYx2/zKTiWjMgrYY9C
	vs+W9lSNuOnTA944tK3MiL4dNCJ0vsbonadUqcTfxCMMs8GDN6xMfLQ0XJZ6Q/lv8kIWn7vG9Mr
	UbDC9FkVUlL/lMTiIci47/gaJuaIeUrUcfNsmd9YvIBkyVaA06JXIKbasO38VEL+u/nH4kJ15cM
	WTRgZZ0Mqj0MTAZULP5pTx/u9FQK1MUYUd5yT8zchSet8m3ZEmj4Q5JljpO33PGKySUiGROmw4c
	Eo5DZevq/jMyss+k/JsnojF4KLaBeHTRfAYrexiSiWpJe
X-Received: by 2002:a05:651c:2221:b0:3a6:58f7:da9a with SMTP id
 38308e7fff4ca-3a9c54acd7bmr39702171fa.27.1792011793698; Wed, 14 Oct 2026
 14:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014152138.138281-1-daeho43@gmail.com>
In-Reply-To: <20261014152138.138281-1-daeho43@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 14 Oct 2026 14:03:01 -0700
X-Gm-Features: AclHuK9ssELmbfFeOdtC11wQQOkFMUhWUeAu0fXdFEVJnCmum3r_7J3AOUUwHzg
Message-ID: <CACOAw_yLf9MDqBdkvhY9rwe=pLjkrGkcrHtAmdsvhcOdU4Zt3Q@mail.gmail.com>
Subject: Re: [PATCH] f2fs: expose resizable_tail feature via sysfs
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>, stable@vger.kernel.org, 
	Daniel Zheng <zhengdaniel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ cc: zhengdaniel@google.com

On Wed, Oct 14, 2026 at 8:21=E2=80=AFAM Daeho Jeong <daeho43@gmail.com> wro=
te:
>
> From: Daeho Jeong <daehojeong@google.com>
>
> Userspace has no way to know whether the kernel supports the
> resizable_tail_secno mount option before mounting. Passing it to a
> kernel without the support fails the mount with -EINVAL, and checking
> /sys/fs/f2fs/<disk>/pinned_area_max_secno requires an f2fs instance
> to be mounted already.
>
> Export /sys/fs/f2fs/features/resizable_tail so that userspace can check
> the support before formatting or mounting a filesystem that relies on
> resizable_tail_secno, e.g. a filesystem whose tail is going to be shrunk
> online later.
>
> Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinn=
ed allocation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
>  fs/f2fs/sysfs.c                         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/=
testing/sysfs-fs-f2fs
> index c4746c416ac..8df18b5d479 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -271,7 +271,7 @@ Description:        Shows all enabled kernel features=
.
>                 inode_crtime, lost_found, verity, sb_checksum,
>                 casefold, readonly, compression, test_dummy_encryption_v2=
,
>                 atomic_write, pin_file, encrypted_casefold, linear_lookup=
,
> -               fserror.
> +               fserror, resizable_tail.
>
>  What:          /sys/fs/f2fs/<disk>/inject_rate
>  Date:          May 2016
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9749da70089..8b844a8b0bf 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1421,6 +1421,7 @@ F2FS_FEATURE_RO_ATTR(linear_lookup);
>  #endif
>  F2FS_FEATURE_RO_ATTR(packed_ssa);
>  F2FS_FEATURE_RO_ATTR(fserror);
> +F2FS_FEATURE_RO_ATTR(resizable_tail);
>
>  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>  static struct attribute *f2fs_attrs[] =3D {
> @@ -1592,6 +1593,7 @@ static struct attribute *f2fs_feat_attrs[] =3D {
>  #endif
>         BASE_ATTR_LIST(packed_ssa),
>         BASE_ATTR_LIST(fserror),
> +       BASE_ATTR_LIST(resizable_tail),
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs_feat);
> --
> 2.56.0.385.gd3acb90ef8-goog
>
