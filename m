Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988770;
	b=AJpwqI9ubizDs4XmnvdkgkyVmMrOaQ4xwO93joKUUBTiEpi+wtJG5fM9oBpaUX82nAnp
	 Lgy2TjrYhprpVOy4AVIUey+DOxfn3r8yIycjHPiw6Q2N8arJnRIAm4bTBRq/ZGyOdMrkc
	 id1wCmnjFh/rzPOCiAwsRFdt9UqjhpVBTo92iwTIWp93ISfMw7vMAVK+O+I74k2cYsnl4
	 gqzdwdp1NFAvb7HlhdycSpBkbxngCS6q6SPDERPmFNlLj0rM855uhxMVnQkGWiUeJN+Y9
	 ZfhlZZ4WCB8i0ygciF65W44eoe4R/i54BNPNHZ6akiByjcLg8e8KGqVDFUOe8573e7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988770;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xABCAQ/j3mpYe9Wdms85794hL2vRznEt57kS2ozzMLM=;
	b=dG/t8OqPwtaSJRSLeBSrRSI3F+uZ75Gdm9s+AfbdsSlPIXOBA+X9pFHQs0GamvohiRup
	 y3u7Ue9sia51Oy7kTp+5DEtyc1lu4urbwfrpubw+6kHK0Qwy2jb6hWNbEPigE7pQZedR9
	 MWYntTaTdVfriBEJnadebXne4sXSPt4hgm4SVM1R2e95k17z+CGM//YWdXYTubXzYfH12
	 ZZRklcrXjWOK0ENtGYjtWoT0p0ohrgLiCbx404eLat4WRyxrgtQoY7z9mOdcaHDxtmyCN
	 ACltTbDAPRi24N59U0OyTwlRdkdY/u22ghy11cMvadoOhLg4tIpNbCkkqO0CDmbuywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C78606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C78606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so3034048a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988769; x=1794593569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xABCAQ/j3mpYe9Wdms85794hL2vRznEt57kS2ozzMLM=;
        b=qJlIr1FtxpoEH4SMirTUtGo9pQcQuJ5cRyS0uN+1VtHApD4IgfQ+2bVSm9DLp1fDhe
         O1eVuhYI8tHk17KL4cbnTzH+AQL7Z14XDxhd3Ez0ALTnJTDvqqltP7usby2UGHAq4Aez
         fnWmOvSAVrR2+XipZDvlzhoPy2vGeuy4T9G8L7auiAUkpsL6mKmCmKHuRysIe2vUlrHG
         kaGPVz+wWzoSRe0cn11c1pPSuFGiDDtsGkChDhY+ZeumtOtakthcZs3a/2l/BKB8B3d1
         ZgBv18CuzswvSM5zz8gmfRD4gJ8MwnbFAHWL5z24W0aYkL269HodhAQ7qpu2osYcbCeK
         BdWg==
X-Forwarded-Encrypted: i=1; AKwUvBxOW62yvVflMBLFIENo2sRDQwamFOZFEQ5yBPfBYFp55w5w1B4Hiol9RakhbdL8v/8JtJRR3aXFPuIWy/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nisl0Mu0uUagukLoBfOZ1EqnuW/VLz+YVg2+BH4Na9YYFw36b
	RcR2UXKUxhm6SKW5wnv14nKHvnq99ErqpmyoEtGsb/MEB5LT/AatoTJWj7zgkzd1TjU=
X-Gm-Gg: AYBFou1oWl1YULzKqMCox61/r2gQWKDBb9A3qXFia4kxVO5ZIgtpUHP7kpIvFCIE9cl
	CsEuiRPjbNukRdb3KfQyMC9lVdjmRSp2X8Kq5efRotXtKv1AFi4Ipb7H/cGK012B/5mwGBdN37n
	ArawOaqPbPf4ivU3HWBytNizEQRQuHrZBIdfwSxD0Vuv0nOhxdFC9+H/+hLucGOa58G/NjrneCM
	qPRvZfxd9yxw6BfusyzWVbq0XR137ZZj3sC5G4JDbgD32UmEoUD1g0MMl9C4u3MiSMK/cgucUPG
	jjAXBxJHdjGJzQdLXt7HhQjVPy3a5QR/MR5yaHQIraRGVVvsBF99aO9Y5rRUtCDNKtrMh8C+3wH
	oh66O7EJJ8CsbizTBJIFhOA/vEcgi3yOYuJD/P5WVauhrMNEvFcMimnaUIRZaAdkU9faIe3nFvQ
	/6CVv8U4ZEOqdBOpH0bi2CwEeB73MwNxr3TE26hpzTqhSzlfUFeiU2mkBId2NLpJYnHazX03zGR
	s5DZXXoSi1tvoQVyysy8qIlNYvESxxWgEz2Z7T9d7KEqSj3eT8aSbzgMXjLWn20KXXlMPX9Zv0C
	4RcF9pvQK4mkCNdv06ZHFoHTv4rV/w2hE8u5KkgP0+Dj9ri17yW2GKG6jHU=
X-Received: by 2002:a17:907:3ea8:b0:c4d:939:526b with SMTP id a640c23a62f3a-c4d34ee45d6mr313312266b.0.1793988768807;
        Fri, 06 Nov 2026 10:12:48 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356ea5absm95595966b.83.2026.11.06.10.12.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:12:46 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40e30c26a4so184377066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwWiVU/B5C5zUYfNvSy1yiybT8pd27VcL5zvgjZiLHuKm4T2LTXlKcR3DFUbsOqDED/S6wnjnulWWTvxrI=@vger.kernel.org
X-Received: by 2002:a17:907:7285:b0:c3e:2224:1b86 with SMTP id
 a640c23a62f3a-c4d3525a428mr313145766b.2.1793988764396; Fri, 06 Nov 2026
 10:12:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015110826.126621-1-ampr.mhd@gmail.com>
In-Reply-To: <20261015110826.126621-1-ampr.mhd@gmail.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Fri, 6 Nov 2026 18:12:31 +0000
X-Gmail-Original-Message-ID: <CAOs+rJW8nMAAT3BHghtS+V=Pwz6bTg679ND41gsKWHtdsLsksw@mail.gmail.com>
X-Gm-Features: AclHuK-B8qlW9POQL_jz_S8L2JcDrY1HJuCgVxk7uflmFEZo1Scl9EmB4edwCMI
Message-ID: <CAOs+rJW8nMAAT3BHghtS+V=Pwz6bTg679ND41gsKWHtdsLsksw@mail.gmail.com>
Subject: Re: [PATCH] crypto: pkcs7: Return no-digest for data-taking algorithms
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:08=E2=80=AFPM Muhammad Mahdi Amirpour
<ampr.mhd@gmail.com> wrote:
>
> pkcs7_get_digest() is documented to return a digest for IMA to use
> when verifying a modsig.  For signature algorithms where the public
> key algorithm consumes the raw data rather than a precomputed hash
> (algo_takes_data, currently ML-DSA), pkcs7_digest() does not produce
> an intermediate digest.
>
> When such a signature has no authenticated attributes, sig->m points
> at the raw data and m_free is false, so the existing check rejects it.
> But when the signature does have authenticated attributes, sig->m is
> an allocated buffer containing a modified copy of the AuthAttrs and
> m_free is true.  The existing check therefore returns that buffer to
> the caller as if it were a digest.
>
> Test for algo_takes_data directly and report that no digest is
> available, before attempting to call pkcs7_digest().  This covers
> both ML-DSA cases consistently and removes the now-dead m_free check.
>
> The only in-tree caller, ima_collect_modsig(), does not check the
> return value of pkcs7_get_digest(); for a data-taking algorithm it
> will now leave the digest fields unset and fall through with no
> digest, which is the correct outcome for an algorithm that does not
> produce an intermediate digest.  Callers that do care can detect the
> new -EOPNOTSUPP return.
>
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

Would be nice to include "Fixes: " and "Cc: stable.."

> ---
>  crypto/asymmetric_keys/pkcs7_verify.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_ke=
ys/pkcs7_verify.c
> index 474e2c1ae21..7939b08b603 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -147,14 +147,15 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, c=
onst u8 **buf, u32 *len,
>         if (sinfo =3D=3D NULL || sinfo->next !=3D NULL)
>                 return -EBADMSG;
>
> +       if (sinfo->sig->algo_takes_data) {
> +               pr_notice_once("%s: No digest for data-taking algorithm\n=
",

We should actually include what the algorithm is here probably for
easier debugging

> +                              __func__);
> +               return -EOPNOTSUPP;
> +       }
> +
>         ret =3D pkcs7_digest(pkcs7, sinfo);
>         if (ret)
>                 return ret;
> -       if (!sinfo->sig->m_free) {
> -               pr_notice_once("%s: No digest available\n", __func__);
> -               return -EINVAL; /* TODO: MLDSA doesn't necessarily calcul=
ate an
> -                                * intermediate digest. */
> -       }
>
>         *buf =3D sinfo->sig->m;
>         *len =3D sinfo->sig->m_size;
> --
> 2.55.0
>
>

Ignat
