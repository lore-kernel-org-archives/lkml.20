Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486630;
	b=hyCrmLAJWMcfGTt1Xa4wJfHVYYmKIRfWg6X/lRMwCFlY3oHtqisqs4LwBR5Ch2OX+fQ0
	 XERe6gKn1JU6PkbqU9Z7EhSQDO79XJAegBuRLKKZfyMCVMtZKjPPO7PaW7ltDj+yz6s7w
	 SYWutL5Mcr5soy5jFlhAZ+kSqxMfXYWdf7ib3pxVFlUjny5e1DW83t+AMstuthyTWeeS8
	 aWd1PnArvmwxZKf4NjT+twbTlQzfv/gVw2I5P1ZcyIDXLFWjZTxX5KxKd2I33KVaq8I2o
	 eriXFfDYpi8XuMHg5y++u72kVmew8ogeHEgCs2If3IirtTNsO6M8Ffr7b9Tn37OXCig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Scxxr3QZh8rDu03xKq9Qg0FPWQFgGwpm1Y1nnFDFd+w=;
	b=rymQ4qd/eFEoOvK+3piqgCf2nk2vQkfNoWqnEQnR8gqk0Pk97Kp438Sv46OM9rOl8v63
	 xiVo9/ANwYpB3T1OlT31KXbJncNp9JXjf5SaJYd6ngwGKs+nkZ6r4M4sr5Bn3uvfuh9Ty
	 H5Y1D9iGv7q3FSU9yV4R5fGCM4fQS5Dgq6uyhTYxsrxo/csi67InxLQyalp/alm29e9G0
	 7/xEtKcrTsAXdD5l4eQlJfpiZwjZSteeh4TG0OhOWAfVsilfGZVvfZ2ZWRINc5WQt8/6c
	 c5UYEnRS91pmH6DGNAlD6LQM67jJS3fwaR/VMLhdKYyhVn3E2XoLF2VKrq9vK3wUUHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSborAVm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB81606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB81606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSborAVm
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so34276105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486628; cv=none;
        d=google.com; s=arc-20260327;
        b=NNNrNKvnQdfbKO5ZztaKQEHX8/Bp/WJK4sal1ppgk2jPsWbJdxN0dhYILtkuFxAx7x
         Eah4pR2/YYU72ICMS9zy9QDsfRfpBQfVvYHRIiiWNsxxNXxlGP5gmKn/d/USHF5gqBLG
         R/gLS1sH033kAYKOFUFbcFaiwZp0A6ihWBtOKrxM6tVq7yk4lwToLy2dQaCKxSQDRJCh
         GXXLSMfO4QlT46FB1JJuxWMD9gdOkFMxdIDCDxvBfBOXkrPkBKfFXyBW/XCDoTSB7dQS
         2ahg3bp/IS04X7JGWu+uzXUfj9eDddLynly7+Z2kohkF2PEz2ntwNmAhtYPmnpXApBuT
         CNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Scxxr3QZh8rDu03xKq9Qg0FPWQFgGwpm1Y1nnFDFd+w=;
        fh=TGf0hvpTDrhdghAlxY6x1R+XBCmPZiYjFB8QzcF3wjQ=;
        b=gOP0mLO+NJOydQfwon2ANIVVtr7/rtmuwLrpAq1Tj0cedqqRmaNyNTNROtrMF6HvdR
         f1/TMDUVpCy0rshMKjUxBC6D9UZH8yEPNUvk8/L36gAGzUCrm3QcJNQevL0+LOCb1AQ/
         McbZU+F5IAAyNyoqgNCKlmpGLiAIQHp/MVbi6Z4z5wubGlIy4rlXdf5m2L9jrW1ud028
         Cp+BeBidovj7xdeNVJMsyyoNiTMKYmMCSNDvDT2CE8o1W5+rfkipa2Wvl9oiVF9E+9YN
         fAjnfZnW4uJUv7k8PlfXmMvqDERcIJ4iwfGNFG9IZWvJui46Uih1/glJpt8+LFSISPv3
         3LBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486628; x=1795091428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Scxxr3QZh8rDu03xKq9Qg0FPWQFgGwpm1Y1nnFDFd+w=;
        b=gSborAVmkkKT9hNmcAK8PcnqOV4wFyarCBbkcBPTiAhT82LtpYRmAG3zz0qKqzme87
         j59viw6UAwG7ijwgyq3xQ8vUVz8+fAVyuOy0QoYHCSZrEzlhFBampRpSs/D8ifp9KFA8
         xkTXJiA9yxczIH5p8TIWcuUsesXNa5yZRO7yAFbTHPrRVBjU08Coa6Puy8E1KY4t3l9R
         kzHQVMSKAu5WP/FX8zjFikyyqwIuaKEMt2t4xjfnSnlQtbmuoAtlJjRfdSbtyxEiUwcO
         mbs+bqfl5cOlPYwNQC6/9nhw2By5N+2/HNDpXPG/eyg8wdg6YYEdGio06FRavL9JDdCe
         rzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486628; x=1795091428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Scxxr3QZh8rDu03xKq9Qg0FPWQFgGwpm1Y1nnFDFd+w=;
        b=NAKoNN9eIRB4oBrrZX5zZZvr86OVBQnnnMIe4qZTluTMQXY6Mtb7k7/QQEhDr7cRil
         9DWHq5EJ35pjbKtms4jtjg9nzIW/7n7qNvTyN05FNo5R5FX9ktqd+oks+10LdkVapcH9
         UrqJRYmAnxF8tXK+VWdUZcqRYm54gz5ubNnMj3DKaVI1rnwxinoLyDPyuu5QiwWhDFFm
         9cQyIGcqJeorFgsnebgC6c6BxKvQwtPIUo+3yG5AEAQZwNawe6OESFp3nGx/CvAEMB6s
         jld1s+QVmaurWf975H3jOvuw7yi8lPgyh0DWF/QWv3I+3nKVLnpIJjnpK4Sgt+Idqtic
         gdXA==
X-Forwarded-Encrypted: i=1; AL+hErEM7suw5d1h1sr+RRBrDBzc16Ao4Hk5zDmCIOjYTu5LLgEsR2htxoBW2FCBaCNnIC74kCJS+XaDIeTVS4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B5onl9Z3lFHh38igzNVP11fncqZaVIJTTpzTUcJs5SiQ3nIos
	uSV8ivfrzDPqVKvhS0BUolxgJURAMid/R9/9h3DAjDvNta4IlT82EhbKYqtv7QZu4jBZBtq7n+H
	FcREoA82Hi4ekXFciY+zqfzNVHQrPYrs=
X-Gm-Gg: AYBFou1Eok5auyrkjmMLMmxnDhKKVUHj9AMNLp1lGEG6HVBTBWbyhf85S4lILVCNr1q
	IKQyd3SHQ5GKuHe+PjGiJxUH9TrVYaf0/ZdrcsSQNFS5vNhvssHylGrDl893URsCkMgq30wDzpl
	BVYKPcazhKzQWwuqbULzyxOvCx/uwFuaRsp3vT0tMVmnRB11w8FeyOf9RUxE/4uHcqEz/lVhbfQ
	ppEawE+bbS5lZzy4mT8nGs+ygF4/tPbaEfTjcPoOjI8rOlRd3DqTI/GPMPSRHAMzHPM9S2+o31H
	KU4nH0U4CuD/tfMc73CoUDqwf/dByraXb7oOL+rzBvb8TqdBEtHjrUqtOlTmOqg1Crp3V4Ag+yD
	0nptttvfAoiUDp3PlIri4qlqAeV+CuH7YOA2QQXV8zXGFPExmFiZaX2H7FLWQCACihiWkUp9mi9
	+Oil8A78dXyDo7V8w=
X-Received: by 2002:a05:600c:46cd:b0:4a7:a5db:a93e with SMTP id
 5b1f17b1804b1-4ba0931c26emr98068605e9.4.1794486627822; Thu, 12 Nov 2026
 04:30:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111224227.2496049-2-Jeremy.Jean@oss.cyber.gouv.fr> <20261111224227.2496049-3-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261111224227.2496049-3-Jeremy.Jean@oss.cyber.gouv.fr>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 12 Nov 2026 13:30:16 +0100
X-Gm-Features: AclHuK-PALtUIojkOvbIjpvKnSsZMgTvb-UczhCsAjfiBo_uVoM0-bxZwzKBT3s
Message-ID: <CAOQ4uxgZag+6MrkJsCXucUBWDaKWptkoZOStZ6Ns4+17Lw+=hQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ovl: reject different lower idmaps on the same fs
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:43=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> Overlay file handles identify a backing filesystem, but not the lower
> mount used to decode it. If lower layers share a superblock and use
> different idmaps, a handle can decode through the wrong layer.
>
> Record the first idmap on a private lower clone for each backing
> filesystem. Fail if another clone has a different idmap. Comparing
> the private clones prevents mount_setattr() from changing the checked
> state. Distinct idmap objects are treated as ambiguous.

I got a bit concerned from regressions, when lower layers have idmap
from same userns, but not the same idmap objects, becauses I have
no idea how different runtimes setup overlayfs.

To reduce the risk, I took a conservative interpretations of Chritian's
"just fail the mount" [1] so we just fail the mount if index/nfs_export
are requested and leave a way out for the poor user.

[1] https://lore.kernel.org/all/20260925-server-hager-riskieren-06116eded21=
3@brauner/

Applied with some changes below...

Thanks,
Amir.

>
> Fixes: bc70682a497c ("ovl: support idmapped layers")
> Cc: stable@vger.kernel.org
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  fs/overlayfs/ovl_entry.h |  2 ++
>  fs/overlayfs/super.c     | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/fs/overlayfs/ovl_entry.h b/fs/overlayfs/ovl_entry.h
> index ac07e8769f9b..5b2f1b930daa 100644
> --- a/fs/overlayfs/ovl_entry.h
> +++ b/fs/overlayfs/ovl_entry.h
> @@ -24,6 +24,8 @@ struct ovl_config {
>  struct ovl_sb {
>         struct super_block *sb;
>         dev_t pseudo_dev;
> +       /* Idmap of the first lower layer on this fs */
> +       const struct mnt_idmap *lower_idmap;
>         /* Unusable (conflicting) uuid */
>         bool bad_uuid;
>         /* Used as a lower layer (but maybe also as upper) */
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 8bc970748b96..40eb8428a718 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1141,6 +1141,21 @@ static int ovl_get_layers(struct super_block *sb, =
struct ovl_fs *ofs,
>                         return err;
>                 }
>
> +               if (i < nr_merged_lower) {
> +                       const struct mnt_idmap *idmap =3D mnt_idmap(mnt);
> +                       struct ovl_sb *fs =3D &ofs->fs[fsid];
> +
> +                       if (!fs->lower_idmap)
> +                               fs->lower_idmap =3D idmap;
> +                       if (fs->lower_idmap !=3D idmap) {
> +                               pr_err("lower layer '%pd2' conflicts with=
 idmap of another layer on the same fs\n",
> +                                      l->path.dentry);


                /*
                 * Lower file handles identify the lower fs, but not the la=
yer,
                 * so with different idmaps on the same lower fs, index and
                 * nfs_export may decode a file handle through a layer with=
 the
                 * wrong idmap.  Following copy up origin without index is =
only
                 * used for st_ino, which does not depend on the idmap.
                 */
                if (i < nr_merged_lower &&
                    (ofs->config.index || ofs->config.nfs_export)) {
                        const struct mnt_idmap *idmap =3D mnt_idmap(mnt);
                        struct ovl_sb *fs =3D &ofs->fs[fsid];

                        if (!fs->lower_idmap) {
                                fs->lower_idmap =3D idmap;
                        } else if (fs->lower_idmap !=3D idmap) {
                                pr_err("lower layer '%pd2' conflicts
with idmap of another lower layer on the same fs, mount with '-o
index=3Doff,nfs_export=3Doff' to override.\n",
                                       l->path.dentry);

> +                               iput(trap);
> +                               kern_unmount(mnt);
> +                               return -EINVAL;
> +                       }
> +               }
> +
>                 /*
>                  * Make lower layers R/O.  That way fchmod/fchown on lowe=
r file
>                  * will fail instead of modifying lower fs.
> --
> 2.47.3
>
