Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1C41228D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378547; cv=pass; b=XLH/qB6Bn6AZf82Yf43KfdrO5DMZ4pXexMCTIOROuJYasCuKZYiUPE+ohBziXO5Qg6ccKX6nAilwXhU42KLx3cHMtor75GTLVe34RFoGI2qOS9w/6Apkvpb384YfB7BESfTty18Y1TIIkWaSys8nQK+Z3u3UPE5EPXUku+YyIns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378547; c=relaxed/simple;
	bh=Rjtgr2U/eUtOnLxq12nLW9TJ7Zj/8JWYb95hOrXteKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpbvYzNQHr4bbQJ0kFvs5NRw6XMl7NDLanr8m5FMAJYcESC/ggjG1tlqoKJO5Ms7mrQPG4Ug1m2aVBaRHj0jpbpHZ1iLINQa+NLb0IIUHTMtBd+100ItvQ95LhP5zDLt3V2sRpbsiBB29M09jVxb7gnXMXduAw53RvlJ8XTHJj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv+BOdC/; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv+BOdC/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740e4so853075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789378544; cv=none;
        d=google.com; s=arc-20260327;
        b=GzVVzOuI8VDL3MUH7wo8IX7YaWuYwZrtFh81xRc0dUKN/8HEKbNWDwyA8KjhCmvOby
         3oVZygAsQeoLWSoDKdT0ZBzCfFHpRvJoaINJaa1D8AyVtHoeUBnR+urQjJtuY5gsVOuz
         9M+BohUuESR/VB7p0bNOjXUgTPCvhY/joUx/Iri8/85CLqXx9CVfA4rwy3n0Baj1fRpa
         D6miLbalnQI3kG79jOFIRQBBKsIj+8B5fdjdlgZ/dLeGozFR3gtFXKN09Y4e+W9zbq8p
         85rdO8tV90QfIqA/0MeJfIexyzlzuLNz2hWuEzo7JzDnekzXoVRxnfUvQQI7C5yShcho
         hZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KPbxA0COvaPTjnPAWf2N63szWFNsCTQ4JdCXnPgmE9c=;
        fh=6s13H4LtCfk/GjqS3P4+w/LJVGJBdyuThx930jyUDwE=;
        b=I3jSUdZWxafIo1o9TKYpXMSEfndzZ4AN41C1oJHplZ81aoIadpIEt5gviy7OcAx8y+
         EhiRgQ09Uizg6gdeKcoSNCawzpuVNNJJvh5Rj3gG2MEgL7FOlM6UQi8kSI3Jl/Q1KiFk
         WwfOwjO9tZ3hOssyn+lVUX63aXpUHyuByB+a4/BJTJDSbCBDyDDk/8qNnSt//3KYQDXj
         Av0G43e+Ngk3wBSOAoUJzTEoTmRZhZa5obwKtruq12J5fGBnDkIkY/WoNB64cfdZgsyV
         THcLSz68c9eTINkLSjtDq2liW0S/u/UDFl9fkrTxZsOSi6p0XrdDVcEpiMg5TdYn9KYS
         0qDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378544; x=1789983344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KPbxA0COvaPTjnPAWf2N63szWFNsCTQ4JdCXnPgmE9c=;
        b=iv+BOdC/UgLPBaWsilROqnKNOA9DRfzocGkFdCCE1shmnNLK8FbnvLMiVrcHfjRntJ
         hnlU4+iYpfeN9rn0r8gE80g54lkLNTpMoxafMUKxG6ic+HQZKnNFzl836ROpq/t+C/Qo
         5ii8kDp3stkjjuCTo1XCmgLwqgWiERspjepvhalfjSa0jKcwyw7OArmiD0DteyBXN3ck
         GPrRo9mIUp5g50GY6eNGiA6WGe8YbZOLMXRfAxaZanzDZCeP85BC2veYwga44lOVfkzd
         h+alWAP+qZqb6/ZtbxLFV1byLLkV1AOQIlgfp1BZSZdLPaUZynVep0Dm9LBpo9t1WI4L
         y+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378544; x=1789983344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPbxA0COvaPTjnPAWf2N63szWFNsCTQ4JdCXnPgmE9c=;
        b=SHmdgIFGJ4kUUt3Uu2IxP0pIEK246bk5ZtvVEWV/jejShaQx5RJ6rFjqC5MXjFh2I5
         ykfuJOmu8mS5Xx7cbvGtGvXIb3TN4gB3zgDn+lsUWmYit3nJBdP2eMzTA0fmPcPB/3qj
         vL5fBncakxqQ4rX3MQCmkNUUklF3SZ5Y+tsV+wN3OMw2yBeO3I4Gw72l5kb161asH61O
         qRcw1wG/bTka594HHh0CoI3cPy5d7Lyh1sPxNyhKscIK88iZuPbNAsjfgcMc8yDKI9MD
         8wvdNKPh912hITvlbitjYn/y0jeJ/7bmVCkg/8A0Su/VYXbWIpZhhKEuH0fxMmEU2PUp
         mYUg==
X-Forwarded-Encrypted: i=1; AKwUvBzsdF0uOq20mEkgA1dSkpHpYWqoFk2xD0gppY7Ckdkm0r1jAkwan+q3CS9gGm7LbNbmphS/wWHlJnIArw4=@vger.kernel.org
X-Gm-Message-State: AFuF++n6tpfCt/EKTiHZPhG11BC8uLaBWTvKhWNpQoTHpHMwgG9jPbMt
	aIkoC89eReh+dM3AuBX/opSzygM03MvezwbBJseHAHrxRaqRjJ1QEn5EyndhhMvbc3x+7xzcl8J
	JrF5qnmS1FaJnjdI0ltWafp5xZAxJaRU=
X-Gm-Gg: AYBFou07Jn4We1v6V8qrvSotv3I5uC/I/QB1f2Z0cjvPG78Jm22ak1JI9ZGddp09aRx
	Q9mCWOFHLf7PBbek6K0WfwISu+QfiQjVc9NoHiuF9DJnO+zRFC+LsB6eLziI9fsEQt/9/VRW8zo
	k5mh06hNU1OcAYFZumgAz16TiIxS8f/eOo/dJScWscJ3i8iuEqmnK/S+BwSx+acBmGIypk4/XBS
	tE7DdjnXfPATiYdxjmrDLMfrDYdlleMSjmGs0kHmqEITZczZ7uMouc5sVFLrP5Ac3aZOgVtJ4UB
	f2BGAgi4zsrcSx7SrG7Qrglehg/iJ296ZqXHoVeLrQUXwhoan7MKQ2Wt
X-Received: by 2002:a05:600c:3b9f:b0:49e:745d:5768 with SMTP id
 5b1f17b1804b1-49e7a5f1f60mr23605915e9.0.1789378544021; Mon, 14 Sep 2026
 02:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-11-chao@kernel.org>
In-Reply-To: <20260911232405.1815804-11-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 14 Sep 2026 17:35:32 +0800
X-Gm-Features: AcwNN1VnSCWJgpKtwXQyP1wTpU6veJ78avoYFHwQRsO6Xvdy_W_Jkqe4MFswL-o
Message-ID: <CAHJ8P3+cDHYmS22Jj4Za1=9bHEDQzsDYP=uBvDHT3ZyAizYZXA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 10/12] f2fs: cache: support fault injection
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8812=E6=97=A5=E5=91=A8=E5=85=AD 07:28=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch adds fault injection support for metadata cache allocations
> to improve error-path test coverage.
> - it integrates entry allocations with FAULT_KALLOC
FAULT_KALLOC ->  FAULT_KMALLOC?
>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/cache.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 7260c157654b..dcab0f321730 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -154,23 +154,27 @@ static struct f2fs_cached_block *f2fs_create_cache(
>                 struct f2fs_cached_block_list *cache,
>                 unsigned long index, bool nofail)
>  {
> +       struct f2fs_sb_info *sbi =3D cache->sbi;
>         struct f2fs_cached_block *entry;
>         unsigned int flags =3D GFP_NOFS;
>
>         if (index =3D=3D ULONG_MAX)
>                 return ERR_PTR(-ERANGE);
>
> -       if (nofail)
> +       if (nofail) {
>                 flags |=3D __GFP_NOFAIL;
> -
> -       entry =3D kzalloc_obj(*entry, flags);
> -       if (!entry)
> -               return ERR_PTR(-ENOMEM);
> -
> -       entry->data =3D kmalloc(cache->sbi->blocksize, flags);
> -       if (!entry->data) {
> -               kfree(entry);
> -               return ERR_PTR(-ENOMEM);
> +               entry =3D kzalloc_obj(*entry, flags);
> +               entry->data =3D kmalloc(sbi->blocksize, flags);
> +       } else {
> +               entry =3D f2fs_kzalloc(sbi, sizeof(*entry), flags);
> +               if (!entry)
> +                       return ERR_PTR(-ENOMEM);
> +
> +               entry->data =3D f2fs_kmalloc(sbi, sbi->blocksize, flags);
> +               if (!entry->data) {
> +                       kfree(entry);
> +                       return ERR_PTR(-ENOMEM);
> +               }
>         }
>
>         entry->index =3D index;
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
