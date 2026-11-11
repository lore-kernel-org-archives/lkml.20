Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402303;
	b=Yw9T1ihTKmeNA++xXqOJFA7gjs+buRpxS4hhTHGtjl2fBQ30EYqWUXLdsxhsdj8jY2Eh
	 UGBONKMxs5aE+dVatmB+2mLCCHiXTyn42Tgo8CLRPLvBJ8f+8ND8g5DrctHee8E4MTync
	 /1FlNyjqbvKhaYJ5vaWgzXnm5roz5TGlhvbbtmJ4BGGoPsth7pzjIzbypebqDNcOGs2D/
	 PdURRFoOHvuMsm094vTOvLATRPS0DVYIAW2ke2XehHsBhmAcNdAtfDaZlwD9S6sUmz+3N
	 JO2deORqbK59wCrRzeQutFWaIlTrycrST6BrhkBi6ijEgWDba3eAgTBrC2J66kedu/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
	b=TMKgXdj8wZ0pZczba/SxaL/EcpYCfixnhYM+DRZjP6jL8LqQzR69sTD/C7VJGr4V6mjB
	 +9IgFmxSjQhjULzU2bkoEXeV26P49AWPKjoaqVQg6KfobzxsLC++q0IctnAZlINBKht1s
	 rPU1vvmtVQJupVgq7InScbKzAQVI8h2mKR2AWHIvhE7BtzN1wOG+hVVYJLHfedb5dzc5g
	 3ZnyH+sVUzCFcsHBi0gF44d5a8ib0GHu81fB8vZC2CoWiheVAOWG+IS8HOci9KGBCCOBZ
	 ClVsunudqXtFKORKgvx0UqxDeFHBuaSzDkTvaIyjKsu2w12okaH4WHg6jf8BM6Hjv2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF04M1Kt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151E606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5151E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF04M1Kt
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e96502e447so26025755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794402303; cv=none;
        d=google.com; s=arc-20260327;
        b=c4WTwBnTNnidHUpmTh8+GAbdEQ6YpFxv0R5+hsi3DZQnGeJOh6Xpuqk/58ZjrkAEL7
         sIgZZbUxyi0bUrx/R+1s85a77LGjtiFMJFOmIHRRP1BBn7zaZw7n1uBRYrLhA57oouiy
         ed53uhvCGzMoODMBamlu2RvcgNN2Hma4FeVOM4Pd0zDBvVMww1slCjiT8Tdx970A5AO4
         9GBa9xPPRuG0lgoqRKDKMzjyNahIspC3SHdgo3vzKGZJw6V9baRu80EAAeFx/s66WCxg
         g6aORIA3qRqvRrnhZluMbN+Ea8kzesvXpTfqgZHuEIKgvMgjQ8MdwJo7WTKyFGswz8v/
         eAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
        fh=DsSxLWuFk/SzYvp9kBKCw/xZfDjJVbj+wUs518XzQmQ=;
        b=csLdQ25bBGDKq3jMwLthHjdhOrSbA3V0XW8JRupIodUfs2jBMItruzuSXhAIzxNdCZ
         utDB2R8xedfle82Mkt2QQ8vylaEOpZMdZp+Yz/6k0qCqKWWUJKx1Wjf5zso29rZnHT3F
         9wDXiAc2T9oE69n/ES2aYN4jVjV3nTwEo3dMbmK66YRnBKQOdf/FCdJCdPsO2BnOnrLH
         bSqzlgvU5Yw/raCWHIcu5aiSB5Bw3zzAiq4NwzxMZmJ+nHIK9aJXFxn+xvyz30dhxZak
         9iIMdmonyWU6g6pazhC+nQQJarFih0oByXpy2hqtZ+FLuGfaebNS+Z3TheCWSiclR5p3
         oJRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402303; x=1795007103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
        b=NF04M1Kt8vcF1YGnL81CoMMrRsJVzbCr32V81Yt9CToUl5HKyxQViuRBg+tiH3Ns+3
         N5ho30WYv9Hd04lhj4vzJFGt+a2GPYUeKbQgGXRjA9cj01MhST9bQu8GCkf3rJ+sq9Lv
         yPcx7zo/W5RWaStkLg+FTi70eKMAx/NPSG2SJ/eRsZ3ArqjOcwvskWuZCytxnKYorzRt
         2q60k1qQqHxE0TbUouPuE+EtMBJlLBJN66R1MiPH8650AHBA3JQl1z0QvIVLsblffevX
         O7TEZcZ1GqWqk8F4e7vB49gMPGvokRFDYWAr+6o8sO+ouhZTLUaUsze9uUzLbFQzQLPZ
         5kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402303; x=1795007103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUdHRWHMk5SGs7+YuKFMHezWxysz9j61hMdmcrFAg1A=;
        b=JMDuo4BmI3nN8I4exi2ufz0CTScBTFRcPnUzdZ6YgoAIAy7P59s/6izVWurex0AnyC
         kNAVwFtB13+oZcPO4weQCG8/jK8/vGIUBXrFx55SHXHvGXDpaO5GsiSRAEETz5Cudj0M
         Pn3CN2HnQAgrHUKDvAQ2Bzv2AWb3VeItH1SBvBIw2rfQD8KCZWKE6yLHAVOiG54cf6ye
         CAzw59IpGQ9A7VwZjTlO51C0lv3m7S2VHgOey2bevL/P4Wz6MRYojDbSUi24PIDazX3y
         aKMUWf3l2dXcwRAZkBMxfMrn0K+/KmFyAxiRt9HYn2iYkalfIBUU6KYs3TW0QK/EiU9Z
         d98g==
X-Forwarded-Encrypted: i=1; AL+hErEw0mjddDW9x+OX8qJnoIBOX0PECum3cTRKrhNKat3xWXTW1sKf7pLTh4xgJCgIEhU9YQGRf3ky/1Xwoc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D2SYGFiC5b76oAcEAcmt5RybGb/EWmncA1DVG+ZBBBsBGky2k
	erRioEzLRiF5eCqRHPNaVMfzcXE8H91KcEArvnSkZfCFH3nNgjcRjJmj9McitBXnhfSFAHRdm5w
	kvGScn1Bww/AtCI550WKd/gdoc0f13n4=
X-Gm-Gg: AYBFou2spwquRU/XNzOYv6lPFZAAlaDjqqzDrhmcLhHvt1C/yuw/kZp+fYS4ATWvJUy
	ggZMFEcFEFq3OU7Iv2ZB8vrotkMGtoSLVdgkckF/GDOUz6gRHd2MGn5la5TMLXp9xfA+yfTNjSm
	CZonRoz7oUibyuVQsJVaz4n/nydpQqcydH8nLP2iZ8jEKYc5ANrtftZLpWRjUzlrt0JI46XeBkJ
	JwZbyhZnCpu/RmrsKZXlPxZaCE6D5twlXiFIPxyXySf1n9AyoZowQD9noxkk5WrX1XfpcWyBfUA
	nrUapEPPVW4CYxeHjJQ1dsC79ewJzPVtJjUFnoJg1LMe7sSlosJbZyQ8xwL2CkL4TN1TkRVP5sX
	6o+pXIHf1H7V4G1+SJQheCsYcfSCRlKkydjs2nw==
X-Received: by 2002:a17:90b:1c01:b0:3b0:9a2e:b491 with SMTP id
 98e67ed59e1d1-3b182f8c3e4mr2105707a91.66.1794402302257; Wed, 11 Nov 2026
 05:05:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-2-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-2-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 11 Nov 2026 21:04:47 +0800
X-Gm-Features: AclHuK9gW152QspKH7kQnf0y9WcVt11cA0ZeBNkE67Czjx0uGH17tx_pcQrtqzY
Message-ID: <CAA+D8AO47ctz1voKax0OsyYiLQ+UT9gU-E7Z0i6=D6RKgb9=yA@mail.gmail.com>
Subject: Re: [PATCH 1/5] ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:07=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> asrc_read_last_fifo() checks the FIFO fill level, a number of frames,
> against a length in bytes, and ignores the frames already drained by
> previous iterations of its retry loop. With an output length close to
> the 512 KiB buffer size, which userspace controls through the task input
> size and formats, the drain writes past the end of the output buffer:
> 312 bytes for 10 channels of S24_LE with 8 frames left in the FIFO.
> 8-bit formats are also stored as 3 bytes per sample.
>
> Check the space needed by all drained frames in bytes, and add a 1-byte
> path for 8-bit formats.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f..cadfebb12e7c 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -53,21 +53,26 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair =
*pair, void *dma_vaddr, u32
>  {
>         struct fsl_asrc *asrc =3D pair->asrc;
>         enum asrc_pair_index index =3D pair->index;
> -       u32 i, reg, size, t_size =3D 0, width;
> +       u32 i, reg, size, t_size =3D 0, width, frame_bytes;
>         u32 *reg32 =3D NULL;
>         u16 *reg16 =3D NULL;
>         u8  *reg24 =3D NULL;
> +       u8  *reg8 =3D NULL;

The asrc doesn't support 8bit output. so don't need to add reg8 here.

Best regards
Shengjiu Wang
>
>         width =3D snd_pcm_format_physical_width(pair->sample_format[OUT])=
;
>         if (width =3D=3D 32)
>                 reg32 =3D dma_vaddr + *length;
>         else if (width =3D=3D 16)
>                 reg16 =3D dma_vaddr + *length;
> +       else if (width =3D=3D 8)
> +               reg8 =3D dma_vaddr + *length;
>         else
>                 reg24 =3D dma_vaddr + *length;
> +
> +       frame_bytes =3D pair->channels * width / 8;
>  retry:
>         size =3D asrc->get_output_fifo_size(pair);
> -       if (size + *length > ASRC_M2M_BUFFER_SIZE)
> +       if (*length + (t_size + size) * frame_bytes > ASRC_M2M_BUFFER_SIZ=
E)
>                 goto end;
>
>         for (i =3D 0; i < size * pair->channels; i++) {
> @@ -76,6 +81,8 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *p=
air, void *dma_vaddr, u32
>                         *reg32++ =3D reg;
>                 } else if (reg16) {
>                         *reg16++ =3D (u16)reg;
> +               } else if (reg8) {
> +                       *reg8++ =3D (u8)reg;
>                 } else {
>                         *reg24++ =3D (u8)reg;
>                         *reg24++ =3D (u8)(reg >> 8);
> @@ -89,12 +96,7 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *=
pair, void *dma_vaddr, u32
>                 goto retry;
>  end:
>         /* Update payload length */
> -       if (reg32)
> -               *length +=3D t_size * pair->channels * 4;
> -       else if (reg16)
> -               *length +=3D t_size * pair->channels * 2;
> -       else
> -               *length +=3D t_size * pair->channels * 3;
> +       *length +=3D t_size * frame_bytes;
>  }
>
>  /* config dma channel */
> --
> 2.53.0
>
