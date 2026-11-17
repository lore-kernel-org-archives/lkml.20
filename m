Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794928128;
	b=qy98bZzVa4ItZREWj320nIMDHqg/IZAhYTp46k6IEFUM2QTfQLNEIwx1fRetIaymYrNJ
	 YMbYZBGQhFSVtybWp4JOhfd3U0qzVHmgisMiRARM9Ymkk8ufKL1WG9seX0bkxpgz9koYp
	 9rCYuEPbCv2uTfNIPdfUFpZvKFbrq674U0fv90ZsPElJuZPA2fC/T1uWKBZt1siliE748
	 UvjWlyFF4i/J1LwfEiR37YduRkAGWFcB2oRoocVYD3O7ym9BWaEiWlBPNV3ap0JTxKFRR
	 YUoWMexC6ZYNoGlQyvEBnoyK/Q36y3MIK79VnPI1jlrObCSiTSQYlG2BF8FS8C/ZBOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v4Gs94GpTkxbjUbZUukHPH6DHGGtLaeS/v6KOvCkTt0=;
	b=BSf79EryCah2ehzIn9bpv48szmexxnmagtPzZsRC72sAgBIaF130FvbzfuGRt8/lx9Gx
	 fQ6+6rxbm4I/Nd77CKNCVfIH4/tr6d0xfhuolYnZZBwDOE9B8i189lgc+9ppe85QcuQyq
	 ZPzd+DIJVNM87gHsToWMrmIRipakVlSxTGkW+ehr6W35EbOKioOn7Ms2GnYAR2uIxf9tr
	 aDAbjLZSxWbZBsEX58h5cZ8/KsNECjbvYfFDbLYZN2H7k5fhqyBWN7qp76zLzBg/RdZac
	 P6BbaTeFi1TD5SwPESa2oQGtV0klPXkomytEaByjl9KU8KBvgMiHDU6EhrLs7xO7olg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEvQU3tq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A798606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A798606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEvQU3tq
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so927783666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794928126; cv=none;
        d=google.com; s=arc-20260327;
        b=cG4jPRrW1iIFLV4QSoH+iinP4pNL9gLz0Iue2wMEogyyiWZkAAmAJX81XB8m74XqeI
         6KPgKQFr69GmDkAvj9J1X2V0JxNAiok4dT2/gyELMt6xDELrGiuGr5DHRDNqorPMwwnU
         h+whs/+ri9UNLL7qgUUqrJb/k4WIhpvgaW6xHyeGbBJAL7bb11sCbIjJcQAd8e+5Daoy
         UTmGxh8ex10SDUcNPpDbPAVtwysgKGKJ2To6d0GM9ldJGUgp8rLHryOpL8IcFn23/Lka
         bHWlvFm8BMRDpNfJquzdIwAWceBmPrJOCTKQ2KeaSBAUjXBb9le3+jbczR55bqTePNsR
         sEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v4Gs94GpTkxbjUbZUukHPH6DHGGtLaeS/v6KOvCkTt0=;
        fh=tX7jXdxBZdTC67yNkcVwhMbptLznLF6+dUEIxaCuEqU=;
        b=YnKsHS/OQy0I0q2g6+OorTunQfT02wX2C66cN1jeYO+yDleXedHSPMZOSZiPN7x0vm
         Tm5JznkJS3M3veV5tF/G8fk1x0NcLiQgV9g5eqG6zOiUaEr5tsETY0+dSbfgV54FcQAY
         BjXqdVwESitfuDXaBjVuD8TJobFQC+WJyWlj4NRmafUCFIU/lOLIIkV1B7jVF23KclF+
         ghyoBs2YD2DX2vOMNmz7YvrpzEOHuIFyCp1491U4RwTkvRya/03y0RqQfAEZ69UPyFMQ
         cAbKWHJRvcdJLm1u37WUAIkL29EagU31QFB3bvkKW291Df0bxIvGsTetIwyFIGpG/Eo2
         Kzzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794928126; x=1795532926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4Gs94GpTkxbjUbZUukHPH6DHGGtLaeS/v6KOvCkTt0=;
        b=dEvQU3tqdmjUvLfiamBjgY5jLxARmhlHuB64p2TSsU0eR+7qe07bMzMLm/Npkw4HX5
         LeT3Aek+Xu0LzWxz3PBUrhOhcDmt4dK9LR4FvvFwIDuxqnKpdlT78S++skdUSXcRwNwT
         E2c0Hb813wSZ3lOsPD2GuUsXdxJ372qNxDIu2qCZXN1gjfeOSfCx8+BYxCNhI4HjuRj3
         lQW3vYXMrlIruR5wd6tjtuxMCs1zcvcfvCf1vjOcSFyLAFlpctAii8iRCNs/ZNX3ik4x
         SxrVo5mNFGuNlPcunuuAOt9YZnXnQ/hke+rbmtDE2c8xm4bYFeZR3qIAa3dRYv4S76bq
         2tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928126; x=1795532926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4Gs94GpTkxbjUbZUukHPH6DHGGtLaeS/v6KOvCkTt0=;
        b=UeP3Lrl67rJ2gLVT9//Pzq1PumrJBxawzhkET/cTZ6rCgXvep4FAo4HO5LsqbHj7lQ
         lyk2z4ZdGozn0j85U855QqWGhOMAiZlSHLkufSD4PACZt2KX65wONtqj53aNRVxoAi7v
         xgVqMbbsT+CDZjFN1iltssXeL1E5ub2pko4yi663aWE1IiaqGvTv7lJMUE9F1Ss8qu+8
         7c8MpSmRQh9TDn28sr6aWUNOofQ7WuVEKf1Z3L1utPdHTrMn/jO31uCBcRE8QUzEaG7V
         8dMs1hSYJcTp+To13nUaNTP4SLdVy4Gkp6WWyfUWcv/SZ/bN0mjj98kGZ5Y3xOgpLYZC
         AvKA==
X-Forwarded-Encrypted: i=1; AL+hErG7GBkDS6EGxjh+y8PCShkRV0+2CNaB9CWmCn3jYu32wJExtXSJpKXU8ILlbJaxB1hEPYSHoSWdpAgUgCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CaWzpxCU5roh/v9U3ImJ6HoskVgiLnmFUUcTn9Q3vsrnqDSOJ
	JfcC7S4zTW8n6DYyrO+naANgBHlLrxiyxgBC5R2M/F2ElI5OK+s4FBJKkWdRcBEX5LyPgX1wq9L
	GYuQub1gaCyxa21qye2SgmbluEJxUgac=
X-Gm-Gg: AYBFou0nPXL9RA6nRm111q4LUj/qmXL+5HjvNsK3lYhGhWxbtQkKb24o8MwWBot1fSi
	hNyyDDCE+KV+XOXgR9vjGoV3KReJidOV2kU44qaMX8AYyEdhkHZPdufC8bvw+J+M0RR6enff2sC
	cLgD7iZx4T7XuFQ5yKvxMCXVipuwCiB1JYKvLP9qGZU4/JSHViXPsNekB+BVOSi97h2aAvVUD9w
	Mu4dkyILTdQACy/ey5Rfv6aNIg89Ezce7jA48v8Fj1X/rh3gUvBLA5Zrm5n9R335DEABV4/Lrhx
	nT6bs0h46uug0JSRnbtof8wnq97BvHoH+RREs4d0e6u4cCm/8CYRGYrk9eAzmxHPA6knIf1htNA
	brMVwNtgA01+VNcf5TCEqrJ4lIsUJWO0JpTRQqGiiE6DyF6VDuloFM8f+Ji+tMTr5PCI8YE7LUK
	0UEGJtUGrA/xWxout/kZxyif4YsJ1SUyhSGut6R45M
X-Received: by 2002:a17:906:dc91:b0:c50:5a93:3bd7 with SMTP id
 a640c23a62f3a-c509614d52cmr1147920566b.3.1794928126422; Tue, 17 Nov 2026
 07:08:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014105634.2858-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20261014105634.2858-1-drifabdelmalekmohamedsaid@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Tue, 17 Nov 2026 16:08:35 +0100
X-Gm-Features: AclHuK-Wos_gDpN0o1jIpvUQldbdrLIdgnnM6UyMd4PsAN4jwtTwU9QU0WtH-1M
Message-ID: <CA+xk8n8M7uAf5xuJMoZ2w3fDyp8DtJBVf1O8UdodaG4OSEc85A@mail.gmail.com>
Subject: Re: [PATCH v2] ecryptfs: replace ecryptfs_from_hex() with hex2bin()
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <blum@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Just following up on this patch to see if anyone has had a chance to
review it or if any changes are needed.
Thanks,
Drif Abdelmalek Mohamed Said

On Wed, Oct 14, 2026 at 11:56=E2=80=AFAM Drif Abdelmalek Mohamed Said
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
> All call sites guarantee that src is at least 2*dst_size bytes,
> but nothing guarantees that src is valid hex, and also hex2bin's return
> value needs to be checked, so we add a fail early check to call sites.
>
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>
> ---
> v2:
>  - Added fail early check for hex2bin's return value
>  - Fixed doubline empty lines
> v1:https://lore.kernel.org/ecryptfs/20260829194528.5652-1-drifabdelmalekm=
ohamedsaid@gmail.com/
>  fs/ecryptfs/crypto.c          | 19 -------------------
>  fs/ecryptfs/ecryptfs_kernel.h |  2 --
>  fs/ecryptfs/keystore.c        | 20 +++++++++++++++++---
>  3 files changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
> index e67119b6029c..059294df4b38 100644
> --- a/fs/ecryptfs/crypto.c
> +++ b/fs/ecryptfs/crypto.c
> @@ -29,25 +29,6 @@
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
> -
>  static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
>                                                   const char *cipher_name=
,
>                                                   const char *chaining_mo=
difier)
> diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.=
h
> index 58165928ed1e..0efda4cea71d 100644
> --- a/fs/ecryptfs/ecryptfs_kernel.h
> +++ b/fs/ecryptfs/ecryptfs_kernel.h
> @@ -47,8 +47,6 @@ ecryptfs_to_hex(char *dst, char *src, size_t src_size)
>         *end =3D '\0';
>  }
>
> -extern void ecryptfs_from_hex(char *dst, char *src, int dst_size);
> -
>  struct ecryptfs_key_record {
>         unsigned char type;
>         size_t enc_key_size;
> diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> index 51651314b7a6..4aaf62e61f3a 100644
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
> @@ -713,9 +714,14 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *rem=
aining_bytes,
>                 goto out_free_unlock;
>         }
>         s->i +=3D s->packet_size_len;
> -       ecryptfs_from_hex(&dest[s->i],
> +       rc =3D hex2bin((u8 *)&dest[s->i],
>                           mount_crypt_stat->global_default_fnek_sig,
>                           ECRYPTFS_SIG_SIZE);
> +       if (rc) {
> +               printk(KERN_ERR "%s: Invalid fnek sig [%s]; rc =3D [%d]\n=
",
> +                          __func__, mount_crypt_stat->global_default_fne=
k_sig, rc);
> +               goto out_free_unlock;
> +       }
>         s->i +=3D ECRYPTFS_SIG_SIZE;
>         s->cipher_code =3D ecryptfs_code_for_cipher_string(
>                 mount_crypt_stat->global_default_fn_cipher_name,
> @@ -2015,8 +2021,12 @@ write_tag_1_packet(char *dest, size_t *remaining_b=
ytes,
>         int rc =3D 0;
>
>         (*packet_size) =3D 0;
> -       ecryptfs_from_hex(key_rec->sig, auth_tok->token.private_key.signa=
ture,
> +       rc =3D hex2bin((u8 *)key_rec->sig, auth_tok->token.private_key.si=
gnature,
>                           ECRYPTFS_SIG_SIZE);
> +       if (rc) {
> +               printk(KERN_ERR "Invalid token private key signature; rc =
=3D [%d]\n", rc);
> +               goto out;
> +       }
>         encrypted_session_key_valid =3D 0;
>         for (i =3D 0; i < crypt_stat->key_size; i++)
>                 encrypted_session_key_valid |=3D
> @@ -2179,8 +2189,12 @@ write_tag_3_packet(char *dest, size_t *remaining_b=
ytes,
>         int rc =3D 0;
>
>         (*packet_size) =3D 0;
> -       ecryptfs_from_hex(key_rec->sig, auth_tok->token.password.signatur=
e,
> +       rc =3D hex2bin((u8 *)key_rec->sig, auth_tok->token.password.signa=
ture,
>                           ECRYPTFS_SIG_SIZE);
> +       if (rc) {
> +               printk(KERN_ERR "Invalid token password signature; rc =3D=
 [%d]\n", rc);
> +               goto out;
> +       }
>         rc =3D ecryptfs_get_tfm_and_mutex_for_cipher_name(&tfm, &tfm_mute=
x,
>                                                         crypt_stat->ciphe=
r);
>         if (unlikely(rc)) {
> --
> 2.43.0
>
