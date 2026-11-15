Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794754851;
	b=Iz6aY6cDKpyG4Qo88CbLAF96U8VbYRoxSdLhJXcvYlZBrGBNGgcIrlfuL9etFiu/K15I
	 YuZSiRgvx2rLTt5Piyu7A8NbXkNKI30pPxIDboMt6Ub0hyTL+NhzibDt7sXRFTREMVjaz
	 pOw571UuOvxnv8UzZIFw2xT+0zMjB3ar8y5eitZlB9iBhFH37zb0Cza6HBEEX3IANmV/a
	 XGvxD09HkLWm12Vjmd092HHS1Ub4Z3qfjJeERHETc/GhsSwPunTQ8zaQ9mGxgYEHCSMI7
	 O3karGc6YaL9jKwttX/wZa03vt7qvlakin3jJIxhhZdLoOyBUsm1cRhyoXvLbf7ZgLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MVRNS3ac0YlanU0Fwb5KpLyyO9U1oXwO9vfFA3eak4=;
	b=Mcj3dc6lTZhlcBXzbH4IaG/yvixDcTEuXAAPFehg/WogtEoSFUgc3PvkuxFXGcvf8lIk
	 7QU6PV+TgBovSBoF9oHkU+6FWR9+DN8YFLxIuuUNb0amWK/OK3WojnMo6HWE86vNhXQFJ
	 RQSTlvWoTkfjRG4xIJZlxQS8lKUpF1BNNruF755GP+T3niV6EntOFduOnpZZoOiKaqB2j
	 UhL49dVezHmoRvmPuVQs4bS2d1hBUptTSpCeqBCc7DpZ2fzKGkbzyPe5xCQshTdqiNzZp
	 BS0A4obrXuLug0l4d4TO4jRdPKx3vMJ1lOpgAMf2Djvf7KDMrvwg0NrxpUH1lxP1P2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHyOkxQw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44413606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44413606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SHyOkxQw
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so463855066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794754849; cv=none;
        d=google.com; s=arc-20260327;
        b=NSI71wdYtFn1iPSRIVJt69JyfDhnyuJwrZKrrNZriV78eHCHc95GnhdlbCAeCDfTEa
         5ov1eP5v1dgSMPJqdcDC2/ScOOkdcE+zJ21ddYclMgX3URkihpiiMVPCkD5dZDYVUG5/
         tbZrxTinuZW/vX22n6Yg5W3Teh3+mgBjMLimpNkb6hhzKXPo8eSoWl1fF/j+8w/viBXw
         O6DJRbfxVuNd8ENPd4v56VAUAAqWbWb0PJSiYWXL4fdURdsgk/yIhV5Je8scEAc0NWFS
         HsBvJA0JDb67j6Np2YMoMatbf2s2wabw+6GwQQOsxbQ3f57lwexLQ9JfGE6FXLyrFYKa
         ALdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MVRNS3ac0YlanU0Fwb5KpLyyO9U1oXwO9vfFA3eak4=;
        fh=GlOsv4EHLJ1t2Nc8i+VyuKZgSsULx6HgS8xfA4w81dM=;
        b=QOixa0NSxs9pzXO7mBrR6WmM8gnsHY/zaI23urMM4SQ/LMdqERv7wRotM3XVtuuqsl
         lY/rCe01eYIrQrzoRCi95ubb53MNZQsqLg14jMe6MImDy5AFjDzDwttygN1L3f1DTCNT
         6KkHx8qDTY8DQGnNdorhjuoX6pSJ78ePw1gJ/ddaf4pIwmExqu+YwZNKbp43nxS4CBOh
         DiCUYy/Ll/aRUi8Yzl5ZhNFmyJ8YHAsDLaKVtrXhq98letL6c2A2udyChKPaDIfsPhcT
         1U/6vXq7V8S2mAooxVAz7yEKPk47b6NLwrgDb+17xDAILTMeTy06QLPOHnJNufKgmDLX
         YqdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754849; x=1795359649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MVRNS3ac0YlanU0Fwb5KpLyyO9U1oXwO9vfFA3eak4=;
        b=SHyOkxQwYuLtL0+Qa53+jCNHfMYZrDoIhK10usTnr/SPlsQtxy3DYcaURrAaqZRP6p
         j9KX2LwDO7WvpxAFvRbeGvPMOpBnbsJEvuh/a+pWnWLMDcViXZq6b/VVaPZ68EhpaptP
         zHr4LucIEpdLZQDJogd72JZdMAkBHyXTxsReEVunL/+oJmqoO/hXoqxPt2Qr8UINUk8W
         PKisRAodcZl5vzpIsG78e9fRi2Mkv3dgu35W/QqWyi6fF9QsZX61BfySIbEHZ7oFXuQb
         7fuxV2YOwjcp9LUN7zRZYNpbm5Ey2kJzr2xgJrjMsYP1vCyRno2ESPfdF+IIuftfMTEI
         HtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754849; x=1795359649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MVRNS3ac0YlanU0Fwb5KpLyyO9U1oXwO9vfFA3eak4=;
        b=CvFavvimVGXJLlI1HD8dhtFBh085GGjKtyqFNGMVBNsLvDXi1XW9IXD3u6ArDphIUi
         q9QZ+KGqo3Gpbrp5zKBZv6k+MlhYNVTv3FCB7RLYiOr0zsEtFdhI4c6TuSt2gXCfb+Xo
         /E76HKtD0iV/AzE3UFhibchqqUNIpfax1NRFtOFZ5AAQ9Y3vF+OsgYUqVzoRWOTbHt25
         Esp0iJYhnvixZLxjREvMrI1MIABLg9d/QgmUSAxecPwammmTMDf228PxttPz+/tE5DzG
         J2ELGo1J4fMu6r+cJmRvyVLXrcw+My3kRMUg4yJsnfQ9LKCkwHJotz14cwaZ1OpP0G+e
         /+2g==
X-Forwarded-Encrypted: i=1; AL+hErHX7OhEarz7T/9iFsyeEBjcKAXxynxUMHfUWCMIoabBqlO5khKJymR0NQqL6ApBdgW7lzFRVcHFo/siftk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yBiAoAuLkdRBvRehrA8viHmL90Cak1N++1DLSlV3aUJ13nIOA
	1xHj9VYCx/gi2NQcdUZwDAg0pyFPuxCoEb8KfF3B0C0X8r/9mDojm4PyTqU3gifsklmuOQyDUXQ
	qdXEYjB6RVuxgUxdGtFsEK+loazs0Te8=
X-Gm-Gg: AYBFou3I9zHBTqjc4zq3RiSgmKAs5ucNDDmDfwVqyLt5j3MfnWPMlcmpIR2FXmdGnPx
	gOU//UvAeZlyvqSl3E76HwrCtxh4uVKeoa0zLQY9+v9DbaAEfZJUP1jkkK6KGRwpGxXcY+KhDJ+
	NwCU3Y52iFrv3I/As0ChXzjSEU/jWiJJdLwAajpdfSz5XLeiF8d4QmYyQXxePVizVn/K8KkcI+Z
	0C30Hd0fD0rMHs+bjiNGcN/U/Bu3/rdOWfaKLndNDsQnEaoYqokUuBDdYHb3bMW+YZwXkB8zeI2
	B3px9Vs2zqUMA9J3r35f+zQBb/EcAu3NUwDz4mW4hqqXJGO2o4tXkB9jE07/823khOTBAr2/U+x
	UbPf4JTHa8/ibYWxEgfMZEcMC+AauQbD7qE0quFkOWCD/iP4kY1KORs8qIZyTZ/TkJYLHGA==
X-Received: by 2002:a17:907:6d11:b0:c26:2a2:b91d with SMTP id
 a640c23a62f3a-c509612a23fmr694079266b.6.1794754848470; Sun, 15 Nov 2026
 07:00:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-work-ovl-d_real-v1-0-ca155efbcb2e@kernel.org> <20261115-work-ovl-d_real-v1-2-ca155efbcb2e@kernel.org>
In-Reply-To: <20261115-work-ovl-d_real-v1-2-ca155efbcb2e@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 16:00:36 +0100
X-Gm-Features: AclHuK_wHYShIpzO3KRe2QttGftKj9EtJqTGjYXExDCpgXdtVHvMQ3jGuPVE7gY
Message-ID: <CAOQ4uxjoHbevvu8auB4m8AVcY9H6uHdDAP6mfi9OOMh+3775xA@mail.gmail.com>
Subject: Re: [PATCH 02/13] fs: add d_real_data_inode() and d_real_metadata_inode()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Chris Down <chris@chrisdown.name>, 
	Miklos Szeredi <mszeredi@redhat.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:02=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Currently, d_real() can't fail. When overlayfs fails to look up the data
> of a metacopy file in a data-only layer it hands back the overlayfs
> dentry and callers silently work with the overlayfs inode. That's more
> problematic than current callers realize.
>
> For trace_uprobe and bpf's uprobe_multi it means uprobe_register() fails
> with an -EIO that has nothing to do with the actual problem. For IMA it
> means the stacked change detection is skipped and for IPE the file is
> evaluated against an inode that has none of the properties of the real
> file.
>
> Teach d_real() to fail and teach all callers to handle errors. This adds
> two helpers for the callers to switch over to:
>
> - d_real_data_inode() returns the inode hosting the data or an ERR_PTR()
>   if that can't be resolved.
>
> - d_real_metadata_inode() returns the inode hosting the metadata. It
>   never has to look anything up and so never fails (but no promises for
>   the future).

About those promises...

>
> d_real() can't fail yet so this is a pure preparation. d_real_inode()
> stays around until all callers are converted.
>
> No functional changes.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  include/linux/dcache.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index 84b0cfe4ed0e7..674bc50b81827 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_DCACHE_H
>
>  #include <linux/atomic.h>
> +#include <linux/err.h>
>  #include <linux/list.h>
>  #include <linux/math.h>
>  #include <linux/rculist.h>
> @@ -660,6 +661,49 @@ static inline struct inode *d_real_inode(const struc=
t dentry *dentry)
>         return d_inode(d_real((struct dentry *) dentry, D_REAL_DATA));
>  }
>
> +/**
> + * d_real_data_inode - Return the real inode hosting the data
> + * @dentry: The dentry to query
> + *
> + * If @dentry is a regular file on a union/overlay, then return the
> + * underlying, real inode that hosts its data. Otherwise return d_inode(=
).
> + *
> + * The union/overlay may have to look up the data first. This can sleep =
and it
> + * can fail, e.g., because the data is missing or because its verity dig=
est
> + * doesn't match.
> + *
> + * Return: The real inode hosting the data of @dentry, or an ERR_PTR() i=
f it
> + * can't be resolved.
> + */
> +static inline struct inode *d_real_data_inode(const struct dentry *dentr=
y)
> +{
> +       struct dentry *real;
> +
> +       /* This usage of d_real() results in const dentry */
> +       real =3D d_real((struct dentry *)dentry, D_REAL_DATA);
> +       if (IS_ERR(real))
> +               return ERR_CAST(real);
> +       return d_inode(real);
> +}
> +
> +/**
> + * d_real_metadata_inode - Return the real inode hosting the metadata
> + * @dentry: The dentry to query
> + *
> + * If @dentry is a regular file on a union/overlay, then return the
> + * underlying, real inode that hosts its metadata. Otherwise return d_in=
ode().
> + *
> + * Unlike d_real_data_inode() this never has to look anything up and so =
it
> + * never fails.
> + *
> + * Return: The real inode hosting the metadata of @dentry.
> + */
> +static inline struct inode *d_real_metadata_inode(const struct dentry *d=
entry)
> +{
> +       /* This usage of d_real() results in const dentry */
> +       return d_inode(d_real((struct dentry *)dentry, D_REAL_METADATA));
> +}
> +

Wondering out loud - since you needed to change IMA anyway and need
IMA patches reviews, do you think it is hard to also gracefully deal with e=
rrors
from d_real_metadata_inode() and not have to promise that it never fails?

This question is not intended to block your patches.
If there is a reason we should keep this promise for now,
I have no problem with it, so

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
