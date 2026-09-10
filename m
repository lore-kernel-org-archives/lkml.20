Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE293F823D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039038; cv=pass; b=HA+1+zWVQoSjAWo0FXDbv28dTY06wg9JPv85OOUWPSzs9vEXcDY0XlHIE7dBIcvidYf6W99+hvbazulXS1LvYFmXMkuARxlZxnpIiLwVo/O8tJq2ngsxITgt2ZDYaWczJIeZtm/sx3TdfOWyRwkN1+A2Bv62IQipKwDTYNbKuC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039038; c=relaxed/simple;
	bh=VjbPOkEoh1HzrTuoA8ZplNF97fKAdN/R4Sa7sm9fIvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kifaNYPnuirDjtBk1deYMUhMfjeTR8dMfGqyDiLel93QCCkQUjx3aZPFidthDoSratHKTKQTk07cfHJiYH4LoPowP62+wTXdMlo/KQcD+TOzlHA+WP03Qd4hgxRRTQSrWL42fsQALsM9qAez0Z+YIvLMa6tigLlwZNfaeMIkPLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hne2rbCe; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hne2rbCe"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25b661d37dso1026577566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789039035; cv=none;
        d=google.com; s=arc-20260327;
        b=Q61v9/KLbcVmflwwlFy9NoqjCFm0589yoZrkMfuqyqosWLOZkgT7HtjEjdDJ6TeRWD
         aE47ahULCkc7/A0TaR2lTlOYPDkL+BMZgBSmaq+430lc4pGqoCAhFq3Y6a3tbh0btJg9
         Q2MDGxs/gtp807WAC53xe2JPIC7Rk7ZE45hx32MdmmVYrmgmtBvp8MVdeltjNIO7gn5d
         yhZLVkxdJv1GihCD+yCMja+FtUZJus7ncrgjcl/LPnwuaMD2/h5b9btUNhUQ24ifs9iR
         qOpU5VcLw74Uebbkc3kTY4RfpaT9iS3XeyMMS8dMpoFoJmQJx/fYJ5S+uK7iEqKZ8NIm
         TFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O8wrxnj4OMvMbiSwJsqwkcf28whDxJ7CnUQ3M8VzxBM=;
        fh=vYq2h4OndP2+/YJAbw5Dtxfr1NVMUIInW+L5tNETaeA=;
        b=lG+1cNsW/loB1D84uiP7NsaVi45YyG/KSJdQicOXDU0q0QWxC+cZvbZHxkFiqDCRn3
         ziewfffPY6QK+4us5maEu6/nB2eOI4Woqh/7MCrEO9Wm5sgHV31CsKvFXPfFS399xFXd
         YASUY4Wjc68gMzsP79mjEansRxPFKJ/I5dGI2bVmgH71DManDLvcdWlYS+aIp7RvyrcM
         kBrVmFa1R2YwL0bfdoCGtZoyQ9fbYZmcsq2euELRxkLbf2GKmM908t7y6EwbJsNa+6yz
         izvvgG8sRxDIkshW7jiLPwMmozPmSxvH2ncQ+MtCcQhwKtAG5nqNPB0HimVQEcVMxB64
         hFUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039035; x=1789643835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8wrxnj4OMvMbiSwJsqwkcf28whDxJ7CnUQ3M8VzxBM=;
        b=Hne2rbCe2H8hXYnuwNgnUcQhC9nlHWZSoSJvCV4Y/RBoGRaJUC5x2YMtTGNPBB+Vdw
         eRtbpSLlbsQvbVQvPwbbmleEq1svCzyNLzBj7jPEHS/EzbqQKUYhozk0IqXxOzF7UEOG
         dxTnTBoSdSNG2bLf32xNi1TdQy63sMSEguH5/TVGceMiU0RDLU/CBx4J7AGb3jr8ncc8
         5xrcRBSikuEnIBJ94ntR2/dz2Eok/jzE/i8VuruZdI9yUiCDiEJcTxH1Sz1/3iyoMTiv
         ZDJY0WbtnhU/6e/TupIfo6alK1BPgfuWR+VexCN+n92VXBs5IFVsgME81R7ugNCd567p
         Ifng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039035; x=1789643835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8wrxnj4OMvMbiSwJsqwkcf28whDxJ7CnUQ3M8VzxBM=;
        b=cVY1BZieqz6DILaQpuP5PyCBl2dP2GDoIQVjYWP3ITM6hk1gyqj2XfCm5qPc9Pmi1A
         wlZ2divBG1gStreoqjVSu5G1Ii+uiXXIi48/95MlZdvcnKZBN58q1OM7T1afUuU6Yo/q
         obFC/DNArPSurbEM3tb63EL83pwc9OCr2SMgBrppPfuHGjJEIyFS8IkYS9yHC+7xZK1+
         rRkcbCAd5m41hoYAxQMo1Q6mfB2dwZB85QrPQsR96qRrhjMmJsqgyFKZ0BCIVfXo8WMi
         1GI7uviSB+fYnOQ4ddoKik4ENS7p0ssFsIWqNkesp0M2pnYzpbgmBTanPr82KwNTsSnF
         vcNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKi0PK8zrbDGHGjRswPffyzG8Gu/0+bxRMrdNTA7DbZFJtLBhyVX9DlnwNE1UXevGFIAusVvNlOhUR0Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++mjwTma9isjj7PR3yjfeX2rMPmF3gQzxBMtOYzO+WQ4mCuWUoNH
	S+pOSPWn+J/bfITpsj1f8oke29MG00Px5mbwNAP3tipb1HyacIs4/9grOAUJQ1qufU4q1oqBoHV
	zWm6+K2azpu3he+TMM/K9HDFiSvCUIbU=
X-Gm-Gg: AYBFou1kUioYBUSgW+hthU53pXba1/IAxNtnp4IcuPAGJ0VkXN5zzciXBMAe/0TOdQD
	AlF/UgKFqSDmAMVhToJGE/HFoNETsMmbuqqDaEVs7PIUmBk+2IkghgTsJuMl1Nt3RDC0h7vNgMh
	z0/0xKRq0t6Fh1V7ViPwIMVn1zFPbtOjqQ6UCbNPqCx2O6T3ARo7h4Zgq9uDxY1QhaTxKwUr+6W
	RmKho6N33e+pNMAkFSmwuZRdvXP4mkQA4SlJpnP6cZ0vNT7HXELqbIbIAIXtLS+WVlYc4qlkwq9
	+CO85wmN+5yj7DKQUMjummNxJCRSvlcwd9jqQRSGfX6v9Aco7OY2qnn+njnRZrY=
X-Received: by 2002:a17:907:5cb:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c260c65c15amr1681216466b.2.1789039035136; Thu, 10 Sep 2026
 04:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829194528.5652-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20260829194528.5652-1-drifabdelmalekmohamedsaid@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Thu, 10 Sep 2026 12:17:03 +0100
X-Gm-Features: AcwNN1XvJGPKxPZRv4cwqSlHsRRpfczT2zZPhhAg0zo53rIir_AxYRQBpcV8EbA
Message-ID: <CA+xk8n8v_fR2ockBgGL-Q7QWjHZ8i_AALux98WphJigvv9zbhQ@mail.gmail.com>
Subject: Re: [PATCH] ecryptfs: replace ecryptfs_from_hex() with hex2bin()
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <blum@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this one =E2=80=94 seems to have gotten buried during the me=
rge window.

Thanks,

On Sat, Aug 29, 2026 at 8:45=E2=80=AFPM Drif Abdelmalek Mohamed Said
<drifabdelmalekmohamedsaid@gmail.com> wrote:
>
> ecryptfs_from_hex() relied on the deprecated simple_strtoul(). Rather
> than patching it to use kstrtoul(), its intended replacement, remove it
> entirely and switch all call sites to the generic hex2bin() helper
> from <linux/hex.h>, which already provides the same functionality.
>
> Update call sites with the (u8 *) casts required by hex2bin()'s
> signature.
>
> All call sites guarantee src is composed only of valid hex characters
> and that src is at least 2*dst_size bytes, so hex2bin()'s stricter
> error handling is never triggered here.
>
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>
> ---
>  fs/ecryptfs/crypto.c          | 18 ------------------
>  fs/ecryptfs/ecryptfs_kernel.h |  1 -
>  fs/ecryptfs/keystore.c        |  7 ++++---
>  3 files changed, 4 insertions(+), 22 deletions(-)
>
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index e67119b6029c..7e802fd631a6 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -29,24 +29,6 @@
>  #define DECRYPT                0
>  #define ENCRYPT                1
>
> -/**
> - * ecryptfs_from_hex
> - * @dst: Buffer to take the bytes from src hex; must be at least of
> - *       size (src_size / 2)
> - * @src: Buffer to be converted from a hex string representation to raw =
value
> - * @dst_size: size of dst buffer, or number of hex characters pairs to c=
onvert
> - */
> -void ecryptfs_from_hex(char *dst, char *src, int dst_size)
> -{
> -       int x;
> -       char tmp[3] =3D { 0, };
> -
> -       for (x =3D 0; x < dst_size; x++) {
> -               tmp[0] =3D src[x * 2];
> -               tmp[1] =3D src[x * 2 + 1];
> -               dst[x] =3D (unsigned char)simple_strtol(tmp, NULL, 16);
> -       }
> -}
>
>  static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
>                                                   const char *cipher_name=
,
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.=
h
> index 58165928ed1e..be91f7c3fc58 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -47,7 +47,6 @@ ecryptfs_to_hex(char *dst, char *src, size_t src_size)
>         *end =3D '\0';
>  }
>
> -extern void ecryptfs_from_hex(char *dst, char *src, int dst_size);
>
>  struct ecryptfs_key_record {
>         unsigned char type;
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 51651314b7a6..dcfb2e5fa88e 100644
> --- a/fs/ecryptfs/keystore.c
> +++ b/fs/ecryptfs/keystore.c
> @@ -18,6 +18,7 @@
>  #include <linux/random.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/hex.h>
>  #include "ecryptfs_kernel.h"
>
>  /*
> @@ -713,7 +714,7 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *rema=
ining_bytes,
>                 goto out_free_unlock;
>         }
>         s->i +=3D s->packet_size_len;
> -       ecryptfs_from_hex(&dest[s->i],
> +       hex2bin((u8 *)&dest[s->i],
>                           mount_crypt_stat->global_default_fnek_sig,
>                           ECRYPTFS_SIG_SIZE);
>         s->i +=3D ECRYPTFS_SIG_SIZE;
> @@ -2015,7 +2016,7 @@ write_tag_1_packet(char *dest, size_t *remaining_by=
tes,
>         int rc =3D 0;
>
>         (*packet_size) =3D 0;
> -       ecryptfs_from_hex(key_rec->sig, auth_tok->token.private_key.signa=
ture,
> +       hex2bin((u8 *)key_rec->sig, auth_tok->token.private_key.signature=
,
>                           ECRYPTFS_SIG_SIZE);
>         encrypted_session_key_valid =3D 0;
>         for (i =3D 0; i < crypt_stat->key_size; i++)
> @@ -2179,7 +2180,7 @@ write_tag_3_packet(char *dest, size_t *remaining_by=
tes,
>         int rc =3D 0;
>
>         (*packet_size) =3D 0;
> -       ecryptfs_from_hex(key_rec->sig, auth_tok->token.password.signatur=
e,
> +       hex2bin((u8 *)key_rec->sig, auth_tok->token.password.signature,
>                           ECRYPTFS_SIG_SIZE);
>         rc =3D ecryptfs_get_tfm_and_mutex_for_cipher_name(&tfm, &tfm_mute=
x,
>                                                         crypt_stat->ciphe=
r);
> --
> 2.43.0
>
