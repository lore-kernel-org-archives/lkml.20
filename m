Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672693750D5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978242; cv=pass; b=US8KkvGOMO5TT+KrN+/x7W6Y6MqtFm5xNRxQX3fGoox4Mk9ClLHGFX7XQjx7qpfsrf7+Jp5BNNyMn/vihI9p6K69+/iovwGC/lwQH2xT45kw+9vlW2SDo5kevRYLt/TgTTMpzpbqzF59OAtRrBKLFbKWXh3PrVxFkHtJy5ZriWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978242; c=relaxed/simple;
	bh=GrKy9WwMNLslOJEUstVTtMo1GdzH7qTLXIWYKkj1gyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obxxJbDM51YaSm+eEGpXx63DfbFpB8ymvNdTA9noeJCBvQGTjFQs0KIN0g5iXavhGAchDSyEp45xAMoeNP+jYmZwQJH4SEPQ4nJK0XLySDOAbufOpppADiikRki4QlvpLGO5TT4/AYhuXjgMmbxvdSsGzE+E7slgH+H/dlTs9Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpYP1yW3; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpYP1yW3"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a7d46c5bbso19714466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978238; cv=none;
        d=google.com; s=arc-20260327;
        b=i3Q2QasHtqwc6+WKAlzVMnaeUIPOm6G441HFpveyHWbUXDyuxeTc9i47cG1sxFGR8L
         S9pNOAilcvxYCkW6Zdvu+DySyKgfLwsNcU2tpnvIdAzK6uUuQaGpEhvS7u8swmHVrvwt
         PfdiV8ueIQGZg+1nWbDYtmnjw9bSEb/bKzXDW7zNOssaDuSaMqB7n3ML4YuSJMJE+BcN
         d2kHN8TVq745ZJkxCC0MsMuKAp+ylh25jYDpMu+tjAMP2LqZG7UU39LAMjgnzwajIm2R
         OqZUp0BpTOAspe9DZTKoPH9R0rStV0BL0zpfQBkmgE64U0PKAgdRjyazWjNOHIO6p/4T
         j3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5425NbyyvwcL8Aen4hOIQPTRFTRLy6ZvU/J9JceGQDE=;
        fh=tdVghybRcHjGKa6cy7WUQ6QEDOBYaRRjWCkb+L3QHec=;
        b=HqLPjaDuIRKPQCvGdiliGh/O7rkzC5MAx9yDWVzrQm+fffg2ODJ4H5orPksQIa977A
         EhAt7MYJEO6dyx129l3cuO4gppBqYpsonReYkKzI6w4AC5sQxpfegIqKmIRgmTfV18x2
         NNhk8uZjKoRrLtTgCsCTAziUxjujmLEG4wvbcf7qAwGgOkfCihf+AhsvWxoprGzucuGO
         st6z3BIAG6NpRrGQi/iD9CmMBsw0web9BOd/T9kCJsBoEHwOrGW2Xk62BgvpusKkRKsu
         w0EW7Zx8FEzxOjHU66UfeT55oWnRIlLEJMTh/EySmRJx7FfDlLgdXKuARJekQ6kZXlLM
         7Tuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978238; x=1790583038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5425NbyyvwcL8Aen4hOIQPTRFTRLy6ZvU/J9JceGQDE=;
        b=TpYP1yW3/azBqraOlSfGaePZRKtYcaf9/fuH8rp0FfQFkG2G97O8b/zlg/9GKPReK/
         hO9aPsrp4nKcYnGjlJiai9OUh6qPrfZ0OLDLaEnVkb3BrbZMBPuqLu2386ySrLvKGV//
         qhYBcni/5dQFrT3Opwyk3yyov1QiYTeIvtpN+gRrdy++MiP7aiZpNDsumCsHDigb7YoP
         jkABm2bi3oeK1sK4UR3wglcB3+t5eiTp27K0Hauu6afljgEjssHTmGj23WZVaXuzfd4V
         GdSnCd2MRVPgjS7R8ZPexSfTUimZdsz/P6b6zKhHvA1lzzf0PGyGiQYz6euFZvPM8Oh0
         0+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978238; x=1790583038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5425NbyyvwcL8Aen4hOIQPTRFTRLy6ZvU/J9JceGQDE=;
        b=WTNdS4CKjeWQC3WwHVcnw3j4X54npMZPp9CIuCj6QrJ2jBQyB+jdg8+HxQDiUO8ySc
         I4mGuvajc4t+g6ZdbCzb23rgn/w0XxyWSf+Ga1jdoYuB63jBMfFjM+SdT62ydUnb1Yc/
         TQsevxbu5ukO79f8WHVvERH467H4rDhAf14X+nrp7ExhAQRlwSU9urRUTndctF/Cd4vj
         vEET8CaLPR+DII/H+WZcaQeQny9hq4+cA5wTXVEGuXEOk2P5fX4On0jZ+37z2P4XmL/p
         ZwfC0b5TzT35nS0J24SvYe/N2CUZ4mPIRkj05LxdCf/Kp8WwHfMF9MBX2ZYGuFqCuQkz
         8xxA==
X-Forwarded-Encrypted: i=1; AKwUvBxBFnywnlMzKQgipROEpxLZtixHK55bjNxbXNTc5lzuWnSa+Y09EpSt6rEwQjV+HFtx5iTOjaUwDBKtG6g=@vger.kernel.org
X-Gm-Message-State: AFuF++kCUe+vcesfYw617hKf62nFNzZh2n9kIolX2eIch3vIesQ6x67F
	l73RRLUGTFx76jRFsm2VmltaQw8m6MZiTvuTIKO3yyxdx6uxDaiXUZGldiv9DcSQh2YXvh2RYGX
	x3IKYCqvrigtjWpdU3bUDkloBqLiWwQg=
X-Gm-Gg: AYBFou3dIm3ssrQe6+JZkityPVQiyPKaOoG8caCms8YDEc0OmdkY0ZE2gYH3FzU7hwk
	bUjm7IBzzZzj6Zx1mBjx4/Wmd0/8ra1D2paQ0HCxTQmNngWsLrbm+clDFuH6zuChQCcUqJlv7nf
	xP4gotYq3fu8/I+QZ28nr44ACDgmFHjzgrS/AyWzscMy6lGzsJ/gS3zkXtgw3eQWdfdxsmWAkmI
	DthdY+2y+B5Onna7U/orzbGCBXHv1pGgCCW9pB/Hes47a//WZimr+TZou1I0hfNXj+Mam5dRdkV
	oDpgmkvwFLPtWpbTlsDrJPsBW4iBIs18AxwOzTXs0kH7MqLugozLr+aTGg==
X-Received: by 2002:a17:907:d503:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c2a16597a38mr814104066b.18.1789978238544; Mon, 21 Sep 2026
 01:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920203239.2876221-2-Jeremy.Jean@oss.cyber.gouv.fr> <20260920203239.2876221-3-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260920203239.2876221-3-Jeremy.Jean@oss.cyber.gouv.fr>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 21 Sep 2026 10:10:28 +0200
X-Gm-Features: AcwNN1Wtxobkh7V_D0j59vslX0xGhWJeUOKiXy3M6bEivWFDogkmGjxGJI0M6sQ
Message-ID: <CAOQ4uxhyc5x3LDzbJtRhQJ+JNQ-hES2k45jcxeGsfEWPB24TKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ovl: disable nfs_export for same-sb lower layers
 with different idmaps
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:33=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> Overlay file handles identify a backing filesystem, but not the lower
> mount used to decode it. If lower layers share a superblock and use
> different idmaps, a file handle can decode through the wrong layer and
> initialize the overlay inode with the wrong owner.
>
> Track the first lower idmap seen for each ovl_sb and disable nfs_export
> when another lower layer on the same backing superblock uses a different
> idmap. Keep index enabled: copy up starts from the overlay dentry selecte=
d
> by lookup and does not need to decode a lower file handle through another
> layer.
>
> Fixes: bc70682a497c ("ovl: support idmapped layers")
> Assisted-by: Codex:gpt-5
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  fs/overlayfs/ovl_entry.h |  2 ++
>  fs/overlayfs/super.c     | 28 +++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/fs/overlayfs/ovl_entry.h b/fs/overlayfs/ovl_entry.h
> index 80cad4ea96a3..2a6e12a0d4dd 100644
> --- a/fs/overlayfs/ovl_entry.h
> +++ b/fs/overlayfs/ovl_entry.h
> @@ -24,6 +24,8 @@ struct ovl_config {
>  struct ovl_sb {
>         struct super_block *sb;
>         dev_t pseudo_dev;
> +       /* Idmap of the first lower layer on this fs */
> +       struct mnt_idmap *lower_idmap;
>         /* Unusable (conflicting) uuid */
>         bool bad_uuid;
>         /* Used as a lower layer (but maybe also as upper) */
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index bd0a3f9039d2..8e78da420b75 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -944,6 +944,24 @@ static bool ovl_lower_uuid_ok(struct ovl_fs *ofs, co=
nst uuid_t *uuid)
>         return true;
>  }
>
> +/*
> + * Lower file handles identify a lower fs, but not the mount whose idmap=
 was
> + * used to decode them.  Remember the first lower idmap seen for each fs=
 so
> + * decodable export handles can be disabled if another one appears.
> + */
> +static bool ovl_lower_mnt_idmap_mismatch(struct ovl_sb *fs,
> +                                        const struct path *path)
> +{
> +       struct mnt_idmap *idmap =3D mnt_idmap(path->mnt);
> +
> +       if (!fs->lower_idmap) {
> +               fs->lower_idmap =3D idmap;
> +               return false;
> +       }
> +
> +       return fs->lower_idmap !=3D idmap;
> +}
> +
>  /* Get a unique fsid for the layer */
>  static int ovl_get_fsid(struct ovl_fs *ofs, const struct path *path)
>  {
> @@ -956,8 +974,15 @@ static int ovl_get_fsid(struct ovl_fs *ofs, const st=
ruct path *path)
>         bool warn =3D false;
>
>         for (i =3D 0; i < ofs->numfs; i++) {
> -               if (ofs->fs[i].sb =3D=3D sb)
> +               if (ofs->fs[i].sb =3D=3D sb) {
> +                       if (ofs->config.nfs_export &&
> +                           ovl_lower_mnt_idmap_mismatch(&ofs->fs[i], pat=
h)) {
> +                               ofs->config.nfs_export =3D false;
> +                               pr_warn("different idmaps in same lower f=
s '%pd2', falling back to nfs_export=3Doff.\n",
> +                                       path->dentry);
> +                       }
>                         return i;
> +               }
>         }
>
>         if (!ovl_lower_uuid_ok(ofs, uuid)) {
> @@ -987,6 +1012,7 @@ static int ovl_get_fsid(struct ovl_fs *ofs, const st=
ruct path *path)
>         ofs->fs[ofs->numfs].sb =3D sb;
>         ofs->fs[ofs->numfs].pseudo_dev =3D dev;
>         ofs->fs[ofs->numfs].bad_uuid =3D bad_uuid;
> +       ovl_lower_mnt_idmap_mismatch(&ofs->fs[ofs->numfs], path);

This helper name spells weird here.
Better just assign lower_idmap directly.

With that fixed, you may add:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

>
>         return ofs->numfs++;
>  }
> --
> 2.47.3
>
