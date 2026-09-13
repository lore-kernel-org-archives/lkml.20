Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D835184
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311094; cv=pass; b=miE3jAyuoGC+1XMAG5y0VN5bV7weh8abVcaBivwXyOJCUOpmNtdwTm0rEnv0C7z/bF+fcQBrGU/X0I+h4tD5UmHSMHzcYaK7mUY9LTmZE3IP89J10a0EK7EMCG6MBD22QGvyk1s5aexuJ8YF2DLdb/2rxcN6fMEkOc7vCDjT2BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311094; c=relaxed/simple;
	bh=U6Cz7nC+aX4P0QBeaWHHKotWTMtyZHTqqFKSJ/+pDcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL+xjaVpLHuqS4kCBrB1KdgjneVrr1pKX3z1KK8zxMyB7ikJOXddZoPP0TsfX0qe0xtRBHeNs/NfimfpEbTc5b1ErslAB0VZIoqSkbJZXCUNWPpF37+Dxt1IwDuFrtS78dM9LgDBIU0irpA6jq7m4D8bGYk8oUd7ZBl6/W0QuWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkBWTWRN; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkBWTWRN"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe7so159498666b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789311091; cv=none;
        d=google.com; s=arc-20260327;
        b=aVMt6oe5QzrDEXfYoRsyKiQPeNqgMpFKa1M3JxGsF1hVqAqm0zjjucOaeQQy1O0jO8
         wfIeW2AP9v1QwsTv0aCEpwNWWF5+X8DJP6ZxD+Wnqpcnz05N98n5fX81yRQ7usi/I8Kw
         bKDGz6UBBVWr6/406Xs2CrvIzTHa2XfzpJlAebMEufic4ACa4l8YJLYKwYb10V8A2wZZ
         H+GgOju722Zhrgo5xAV0tSlKu4EsZ74yWuTki56QcC3G7bjUeu1rfAj8HKiClg72nwbW
         3PE3sVByT73L5y0JtDrYPrIzUnSwEbqepnjENoaVSBRZLlwplabZjNROWBH9izFot0Zi
         u3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/A57JkHsOA+C8UXQaVFMCiOBZ9Y6TKcUQ9Z20dIJoXY=;
        fh=VA461YXnRHhxD7xNUqZTe5f1I4Gb9iEMn0VMEmFNAPA=;
        b=eBoYBN87IMx2UYvd8SRtXsRG2Hpg+VbTdGwm/KC3fWckws8hKHP065vYF6Vy6lcjjK
         2OGOI227EoHLxUILQ/UX1U6NvYCcNMjIXbyfwIs6KJLvoH4sMdUmdsxP0F2ttgTU2f6Z
         kmHruyZmmhDj/FCHnnrizPqKehbHgRS8hcXFxRn7bqfzlnOzg0Xx//Hg5iIN6xB4GUms
         mB0p6WnaiLKDp77wRtleOzY9mnPwa8cinB21pqa1fBCvxnl9QNE8R7QuRTwE0b799vA1
         Xn+efSF8Vpyuz328vijFS12J4gwh1cP/nX93JPYGpfXcJM2b6xLZCqbkirD/xKii8qzH
         mEDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311091; x=1789915891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/A57JkHsOA+C8UXQaVFMCiOBZ9Y6TKcUQ9Z20dIJoXY=;
        b=BkBWTWRNW5i4lucsVr8mr/LGVDBuodk5KvILTrBR+QEOQ+7lkvDFXSQ6Yf+MdR9bKU
         ih8Pz99wjpGThaVjQQ8uMLittqhf0eflBlyIt2ZCLc43gBRZFC35ZdmQkuDQ5bTktXQ6
         y3Xe2uNoDDxu7Lbd4UYcawzjKh7KgETogIpuHtXnBa+Dcbi9tvZo/7u5YoWhZGKs//HM
         4RtgEekh+H/LL1VEpYIXjXymMeFIPdIbaRHu+hpuQxVKdM1h2opU3mNsIIVkQY3hjoh+
         EbY5NAUVJjFv1Pf2VrPZlU+4iVjxWlXcHMQZTJvSDcdm4CNjmGbHRSCEPkFuSCugFeeO
         P2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311091; x=1789915891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A57JkHsOA+C8UXQaVFMCiOBZ9Y6TKcUQ9Z20dIJoXY=;
        b=nbe2K6frul4nDNTPVODN2GEKvZ2jaRoiQvJlGrj0XyG8tDE9tcbslB3dOM78H2qUHN
         vmVE65dGjT5vB1a0tby7xOOTOSz/j3ta0YJHuy/7wo6UYuebbe/WCdex4jAHB/+oPyM5
         fFq6dc2QyyHYPSmW2hrAuSyHWPT5aZrTDmRFIej+rp/YwSWCxncSob9p4oQWunLXbspO
         GC1l6V/Ue7I3NGjhq4uxuynVSNZRDL/U3MuvzMiRtj2RqYPzhNPYIFn5Xl+torrxjj8+
         EvxxtLWOZUrFy7jVAxTFTW5Pm3G1PVVcTVRnOd1Vz6nxpauyU8ysyy7hSFkWJa08xMGG
         /uIg==
X-Forwarded-Encrypted: i=1; AKwUvByeiOrYK86rElqxxTnKxbZn1el2vjP8KkxfSLQt9jKhJVFGGMs4xWalVNOUeUw6N5D6I3sjTyvuirlzQo4=@vger.kernel.org
X-Gm-Message-State: AFuF++nZqOEqAugYWV3gJ/r2eD899XNjYIXm6Lqr7kRGSzpYtUdSvxLg
	efNYzUH+j3njrvohzJYLywqulRswZgmBzpqJlNULW5yn7eV0MjPwEPBGpxmw94djyMNHmwPkCY+
	bA3ENgJ2HZAP2Bm6ZWLm+fc/obTVuIqg=
X-Gm-Gg: AYBFou2QT10bsNR1bt6t9fSKmqWNgDonTSdYUzhnAMtY+ym3ns5Ad4akbopKemwwbOG
	UWgFUGd61n3Uoz3jJHFmnW2giHIFfiWBHH7Q6gU3+QQo62pkfTCWvEF9sXfbUU3rc0auVh9h4NL
	O2msMNuwT6nOdvkXcieUIMB3k8XY68DRb6rVi/w1Hkt5ZS8g/ScK1fU90jdUVKRbREXfdJJj7BT
	UkI8vk1SqMtvE9R2sMNshPU4iDB/3su1A7DC5/xISQWhaPtJMBbNQdb0MZPYNiouOsSNUEHZpO0
	stkFetfyjFPL/4mPiz2Xqs3B3hbSKRqUxcNFkbHKpzQKcZTQsy6x4wQEpd9HS3vxL7L1on1YIrc
	jl7/n90QUDg==
X-Received: by 2002:a17:907:6093:b0:c26:1691:b36d with SMTP id
 a640c23a62f3a-c29858842cbmr399520766b.38.1789311091357; Sun, 13 Sep 2026
 07:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913144918.1606123-1-mjguzik@gmail.com> <20260913144918.1606123-3-mjguzik@gmail.com>
In-Reply-To: <20260913144918.1606123-3-mjguzik@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sun, 13 Sep 2026 16:51:19 +0200
X-Gm-Features: AcwNN1X1rdspH6JI1iXNYOsa8ljwnzz2DO1twadqF9g5ZfaY7EiBXHNmk6aHnJs
Message-ID: <CAGudoHGyaBkcLfggaUYgcKPLhzZzN7_YELomKsQBR0qiX+hPyA@mail.gmail.com>
Subject: Re: [PATCH 02/10] fs: add path_create(), path_move() and path_clone()
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk, jack@suse.cz, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 4:49=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
>  fs/namei.c           | 29 +++++++++++++++++++++++++++++
>  include/linux/path.h | 14 ++++++++++++--
>  2 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/fs/namei.c b/fs/namei.c
> index ca4f5e3be99a..c8754c7ba8be 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -698,6 +698,35 @@ static __always_inline int lookup_inode_permission_m=
ay_exec(struct mnt_idmap *id
>         return security_inode_permission(inode, mask);
>  }
>
> +/**
> + * path_create - WRITEME

sigh

I'll take care of it. for the purpose of review pretend this is actual text=
 ;)

> + * @path: path to get the reference to
> + * @mnt: WRITEME
> + * @dentry: WRITEME
> + *
> + * Create a path object using the given vfsmount and dentry pair while i=
ncrementing
> + * the reference count on both.
> + */
> +void path_create(struct path *path, struct vfsmount *mnt, struct dentry =
*dentry)
> +{
> +       path->mnt =3D mntget(mnt);
> +       path->dentry =3D dget(dentry);
> +}
> +EXPORT_SYMBOL(path_create);
> +
> +/**
> + * path_clone - WRITEME
> + * @path: path to get the reference to
> + *
> + * Given a path increment the reference count to the dentry and the vfsm=
ount.
> + */
> +void path_clone(const struct path *src, struct path *dst)
> +{
> +       dst->mnt =3D mntget(src->mnt);
> +       dst->dentry =3D dget(src->dentry);
> +}
> +EXPORT_SYMBOL(path_clone);
> +
>  /**
>   * path_get - get a reference to a path
>   * @path: path to get the reference to
> diff --git a/include/linux/path.h b/include/linux/path.h
> index 7ea389dc764b..8a621e0e1921 100644
> --- a/include/linux/path.h
> +++ b/include/linux/path.h
> @@ -10,8 +10,18 @@ struct path {
>         struct dentry *dentry;
>  } __randomize_layout;
>
> -extern void path_get(const struct path *);
> -extern void path_put(const struct path *);
> +void path_create(struct path *, struct vfsmount *, struct dentry *);
> +void path_clone(const struct path *, struct path *);
> +void path_get(const struct path *);
> +void path_put(const struct path *);
> +
> +static inline void path_move(struct path *src, struct path *dst)
> +{
> +       dst->mnt =3D src->mnt;
> +       dst->dentry =3D src->dentry;
> +       src->mnt =3D NULL;
> +       src->dentry =3D NULL;
> +}
>
>  static inline int path_equal(const struct path *path1, const struct path=
 *path2)
>  {
> --
> 2.53.0
>
