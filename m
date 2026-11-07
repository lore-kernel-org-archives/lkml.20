Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794038585;
	b=Yyj/eLmONpg/WwcgitDgsx/XeZ871BoPh6r2tPwZGAcQcrYxxN8SvrvFcqtLuf5/6nBr
	 HEEWHCff2Oxa0B3JDSB9rzEa1o8L55ctzp//clh8igxq/lrqFBkjjQvHOCO+rHRwsvp0e
	 NsNeRS96IOFlguGTO6oz1bcnWKFSbsJgO5hrbA3EvU4wEMGp66XU/nJ4sb6RyuECApVkX
	 CWtlDZO20KgEpu0A1w/vBSm+etkVFxgw+/p7B7mhzb2LFtzdMSh7RIj9jV0BqUGW1C8Yr
	 239m8NwUB6DV3u4E8RXoK+f3j1i3pUCbjILhkEDUzs8gZ7Tvh+WAiS11FCinhtRE34A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UBKjIJV0Jyc+FtrJEW7tHvzq9gV7uRShW+9B+nXoav0=;
	b=s4YxuPTobs7GWz1bfwiqG8ifmikoclZn+R69DjIE0Us0761iT7W5JtKV0CCjcz6TgxK+
	 cUn5VoXkqDXhRGCb5IBijtIM1u9If3Nl+A9z54Uhj4xKAAJAaY6+eJC0QB1oPeICjRbun
	 JKWZMhueb+7oltlaQKYAqEwAekLcPwFo/db+lduioglHUvjQLVS4D6V9oU3rjbraF1e7d
	 RD7myutptEqz3hq3LtI4VW/9qiDwKEhbsjAY8noWnGWm+j4h2Xwj0/A0ABOcH7G2Ac38t
	 /qqW7vT2grB6F4Lxa9xJublD1OX1He4mkLrzqsoX071Wf1qpzji7dZB5FqZfrdFM06w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0wZGBE3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A69606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A69606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0wZGBE3p
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so9217311fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794038583; cv=none;
        d=google.com; s=arc-20260327;
        b=CRTCN2j5t1dTlFf/JsykDiGVQgzwsFIuyPXykdv7MenH9KttizABvYe3mRzaN8cwZh
         FFGWUtkTZbBYazpzd66A/0T54RbS1iV2yP4+B+i9cd8TaB/AAg5LEoZQrf1aJHOgNHuP
         FlYHPpfpSSTgc7In9LYu+efdaaN4DLHGxUyFjVg4C/RINCNUcabj5XL7Uc4bAHGfiNm3
         1SFhTpJagJxVSOwnyiaynn7PSYiDTtI7JxjiWDjDWrE3kRRJhF2dEJIFErhKY9Am5UKb
         Q4pby5RYdoNVkfA6wDzTF8bjESWBNMRGhSekvyX1FqiCY4HrqrOO6tqWjTe2SUgDYmVI
         pEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UBKjIJV0Jyc+FtrJEW7tHvzq9gV7uRShW+9B+nXoav0=;
        fh=R1H/hM1bMxqgnJxQ6sPmiCJiEE9/ALX6PuILRqCIKjM=;
        b=VBZ6ucsTzcTWx2XCogJGe0K/PW0v6K+GOlDRcLYbYS5WGCyngk6peG2uH090mwEx7L
         noox+BC7stj17udV9olByS7z6PGTWjqkxcfwdk3qxxxn93MNXERjF7H5RhTOSr13VHcp
         dc+NV0R/LHg97u3rem+kgLqJI0AbbzIRACBE7xvsgE4FKIYCQx3glXoKBt6UX5KP2BkZ
         iMYJjpa6gxyWiHMEQN/s5TBR4eDAWCyPw5GzyBcJ/qIet01qBE9vAGd726/HWa97WDCD
         UwS9/YxTdVVvKW/ui0IJHD5Cnkke75gDqbQP/K4+rsdPbYR8VLhPm7pqTyVBmNbj4Yvk
         yVZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794038583; x=1794643383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBKjIJV0Jyc+FtrJEW7tHvzq9gV7uRShW+9B+nXoav0=;
        b=0wZGBE3pi7rRQQLtiubDQsoUKYdeo6JB/h6gxTy2ypWXDwuov5jhpsm9/39Po1RNh7
         cmAU9zxqvRGIHi/P1V1t8v2adQTdSm5KtKmnrFs9mgGdZ6uEnfRUEC+9YD585t6IlyOC
         JM579bY6MFiiK4vrYx8r+etYaV64jQb75hfZGfLppJop0YU/cGIQPtS3IwKyuphfgBWJ
         6q9gifSthlnKhSUz2UVe3PPEM/nKFWeq/WJ4gYmOOaTXNktNREBnU+HrhQijBAR4Wwex
         u9WfGJ3oTkfpNhuAhpvCoV1CQf8c5fJmmRn2LXN93vrfhnNoAuNuXzaCcmsDLEVZdYVL
         7l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038583; x=1794643383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBKjIJV0Jyc+FtrJEW7tHvzq9gV7uRShW+9B+nXoav0=;
        b=J2LUF9wZ8IKRr3WricQC1wx9DKsIbK1sRFzD3hbwD+vdZOeReus2/i/C66Ctz5DedL
         QARwalzFHccmIX0iAOnP+8g7wFm10T/Fy1rqHHH5KxYRXb6RVUncGKgEvnu64cWd//S2
         ePMuKIwe3V6AI85pfneEFOcwC2X4wiHQMoGYSgQnkLSi97x5eYxnuqhrnVBdn0fPUOQJ
         o6aVJ2GM2pxtmbM2RHcUByXK1dgVOGh6FqNZ1xqzdLGQNoyI1kPI0u0Z7IawtcT4V1mn
         HZUxtRUkXHyrFPVjT+BOpBhV6FcXuIYjmIu4zFTNrPhwedasAqg0isZxRGOMGF8LRyy8
         sqeA==
X-Forwarded-Encrypted: i=1; AL+hErGhXY0ryAs8zRZOgaZmbga91oKulcFSoS6Vvfbk5x0LFnnIuZp5X/j79lZdiYYylMd/JsqEN86IZn0BZmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xgQK9NjgDI8RYbwqvZNEp501pS8dW1D7JZNUBp1lFeS1oMt0Y
	XxvizLC/7xfHWjM7t9ojDYvvKA/K9+LKM3/SQMolqiuGV1Lfy9j3afSLGQrAO8P4p7j7m7hlH/e
	nV/qRMtYAo7zCTqvdo9ZN9t2yE3p2Rn0=
X-Gm-Gg: AYBFou2n3xUB3jBZgW5gN1ICJnEYOjlKmxJbrSS/KIdi114bsvR7ZNUKQLw+1Bkz0E8
	6g2+9M70okKc47Bx9U5ocY2R37jkp7z2ywORGBaS23r3olKNjndV+iCf3WdEvCQqpcRmeXidAHY
	JwxpIq0+DewkTSuooQBxNe8AFgAvYS46xJCAho0+J5s7h8G/BnCUv80tMh8RTzDV0dTa0yX///f
	p7xvmaxWwezVowkxHv82EoVhl5iCoP0XdBLzHpi+uZtszLws1HYLbX08b+a/qTAsMjuepQLUqyq
	0mlfHuYk/nek47qnB4J0VXzMjfLfy4PG1eQDp999lY1WYThbF8/DIfv46A9DgneUWrDB8qRgr8b
	GT2PDCHezgYWpXhE50gTV25Ud9X+CmaK7GxpK7bg=
X-Received: by 2002:a2e:bd07:0:b0:3a5:af50:bc99 with SMTP id
 38308e7fff4ca-3acf3b20711mr8857361fa.13.1794038583192; Sat, 07 Nov 2026
 00:03:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106200423.37769-1-ampr.mhd@gmail.com>
In-Reply-To: <20261106200423.37769-1-ampr.mhd@gmail.com>
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Date: Sat, 7 Nov 2026 11:32:51 +0330
X-Gm-Features: AclHuK8se3YTl-AisXd9olJNlKqNSemA9zYOj4Th4vrPgv6cDYoaaBCODDUwIsY
Message-ID: <CAB_t1-BWNRNOQaCh=qz3s1q2bQhS=njpt-v1u0JrT-Lyw21MRA@mail.gmail.com>
Subject: Re: [PATCH v2] pkcs7: Return -EOPNOTSUPP for data-taking algorithms
 in pkcs7_get_digest()
To: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@linux.win>, 
	"David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note: ignat@cloudflare.com bounced; the correct address per
MAINTAINERS is ignat@linux.win. The patch is otherwise unchanged
and available at:

https://lore.kernel.org/all/20261106200423.37769-1-ampr.mhd@gmail.com/

Thanks,
Mahdi

On Fri, Nov 6, 2026 at 11:34=E2=80=AFPM Muhammad Mahdi Amirpour
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
> Fixes: f3eccecd782d ("pkcs7: Allow the signing algo to do whatever digest=
ion it wants itself")
> Cc: stable@vger.kernel.org # v7.0+
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
> ---
> v2:
>  - Add algorithm name to the pr_notice_once() message (Ignat)
>  - Add Fixes: and Cc: stable tags (Ignat)
>
>  crypto/asymmetric_keys/pkcs7_verify.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_ke=
ys/pkcs7_verify.c
> index 474e2c1ae21b..c2e0eda502e2 100644
> --- a/crypto/asymmetric_keys/pkcs7_verify.c
> +++ b/crypto/asymmetric_keys/pkcs7_verify.c
> @@ -147,14 +147,15 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, c=
onst u8 **buf, u32 *len,
>         if (sinfo =3D=3D NULL || sinfo->next !=3D NULL)
>                 return -EBADMSG;
>
> +       if (sinfo->sig->algo_takes_data) {
> +               pr_notice_once("%s: No digest for data-taking algorithm (=
%s)\n",
> +                              __func__, sinfo->sig->pkey_algo);
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
