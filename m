Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818925;
	b=1rusflaNsCwYUu7XSqZrYN0EwoEEC6Sf+ooLa0LDdgOUPPtffIMs6DU09+Jqo77+mkG5
	 NhqBrYbHQzC816YI0Pqy93H2/rmlcldYj7y4XRkoxzIfBO4+ugLDT+u8OveUnQozxvRXk
	 z0Yj6VuNizIY79KSf2xGgjdbxb92adhHovuvJMq4WjeM4YN4ehEs95KfRdAjmVwO4xSOH
	 pSuT3BWpoDxahwtUAEcsbzE9m0NfxZV0uUklda8pIyvFgSxrNSwMl7gEHWgUodx9h0X9M
	 /hSLxtCEF3qMBOm47g+d5Q7eSKwgkWKj3WlTxOY6rLFETknIv3MZZ7/Aj/7qWi8Gf5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
	b=y7ddZG+2u0JRj4CIc3H/4dGsgfb4BrbZvm9r2AejUBbLo7MYn1LKSk9AHcfE4mPA9DYy
	 yJXLIRCm4VwvYunQvpLxBgw1OrguajTskM36bJaRsS4W6ym6bhJfkQ6DdX4EW/XmdZVoT
	 L2CywV0R8HTqwweOLL9WDifaCMOnqcIABCn/iFOpscknHpB6i5Vvg3kC7hDkg9Janf2qS
	 YCyHhTdd9f7v4Elp7Xvps8ZZ3WWfx6SDQ468yrI1xqO6K1T+MiiggbvNyBJyvF3mOPaml
	 Ww1uB8se8+IJ10CELtA/++o8FwUwqCraJ8MP+s1rFUHo2cDLFGmZD9uK63VUAJablSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqTCOfeH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38D606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A38D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqTCOfeH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so11908295e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818923; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUszrd4rUhNk2ObiS3+HTwoXg9P/bliTA+OLpdvA9jnibFSc/0V0WDAXqmGqnVXUW9
         6ulPu/1b78WwVq9EKPaYCC4wjUVJ6Lnce9L0Kq6txG4sxfBJ4PgKZsUKyIMT1dVHbTor
         112v2VGe1pqZTbg7cW1+w4jTAnhDDaoD6iZvkS1WRhAEthSASdjGbzLGGiCz41UEG7CO
         I3NBcqpQrVRP1NoKTwdCloS+MXCVlVcm++JmWVwHZ227r2SfckZFI2YPlUJdhe+6aRi/
         nSPv18kP/ozf1w8nxCEFshT5aqLd4mTnrC7NN7TMjOix/PJLehxlWxAj5JdMy58anZ7W
         jlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
        fh=sz4N8pXBLybJaZadDVzjahK3rrB22eEaNqhaZJy1EbY=;
        b=QVwWS334XvqLTlIPqd0BD7zhnikBBVGy/+UMMvQ0LHEYmeHpjIwCF0oO9PkH9jc91D
         VcWAd2YqOy+FCRVdLkoKUjj1jOUDKDpIc2ldkZnKhxGTyP7/BNkwkDxWzyPHRD7zQ1a+
         FDWxvMg2FLmWfybYRGMDAzaUwQz1aajLtYiJy+67J054wBgQajLjzfp/pSYRcDee2gT2
         VfRUyjfqd1OJwmE9Wt+CYKmXAw4ZxvuTwZmNMPxS70p1xpI6sTRkO14kQ/9XAPxUH8pa
         7ozjoQXaLkL0pHnzW1B/rINXwGaq2aDuzpLY4u/YbuUQATVSSgWYpMX8KxsmBBcD7aSH
         uMGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818923; x=1794423723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
        b=eqTCOfeHKe3l/56+nB+NKmRz+SQ2Uh2SxG3yy5zShuOF7qJgXjlby62RNT2NdNWDKV
         xWYdzvYrJqktNSr+ev7IYg2iP7D2PKmWEkcFVmfqRlzEi4hP+Fm0ir1E+cu3t598FiRu
         kpVN4/6B/47P1p/emIG7ZsA1B3PFz7A9cEjQety4hgfAtIXj+1iyhkNIaZL9KZcyvEw7
         nOHJE0X2qtEmE1qIxarLgkTZemtv6NeHjn+TYM7V5FDx/3d0FerOS19sd1mSPQ2Kc1Ch
         g/MDLT+dveL7jWzB08rgYkXhPpSj5Z4pVxAVP6zybFOfOu9M5Rx6xBA/r6h2Ax6xNPpz
         FJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818923; x=1794423723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oafn2hCqm7HTSzGstliyGNOlBVNP4XwTG5bffvWvqGc=;
        b=xAWsRPRE8lXd+A3Kw7W667IYDdgmOFq7DoUIHAeG9NXSwmwT+9ElTotkllz5MelMH7
         PBpMHymeKXkpyZyYwtzGf7pDIh9us1HqBW7uiGn6cse2/W11DBlsOtZRAQd+kIYqQ96h
         bMNsll0ybEn3i7p0a4HDUYhqw9Swj+t1zTHBNrhcimNyT/9CjQheelXLcK7U16zYCc5b
         WWSZ2gHKaJW6DJ6Hw1v6b6TwMmcj0WiEyFWnIrlCKakng2tCLr/pbiC2ck8KMOnmCRYR
         JX43CSvYMwvhCertGZlZpchk5aMbT4pzu9s3AjENIckf1Jyn5hkHMIpmAtneiA4JHo7P
         Fzzg==
X-Forwarded-Encrypted: i=1; AKwUvBz84D4IsNWfdzqlouztc3Bmtrrri1I0fqTs/DKsXLwaNwYHEsq1JpALvneQ7R57XTOJyHMhBj8LMBYjZ4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hIJEiFbyIICPBF5EaO+HmYnx23wBGAE1750ApR9Zk6XlXO62O
	wc88My/xgPueP/hKtHjmVJO+g8VdCdi/+UCXII9zTOLfqski1apFnoULLw1vyqpiWbR4+ZtHP9Y
	pVvBLE7xzHlSBHysbE7aWDoAS8KZpyl8=
X-Gm-Gg: AYBFou1Y0zk6ss5p08uEt6e2R8RDzBGp8lrQjtft1BfrALRPjmjJ7NfdUWDrtZtJ7Lh
	Fb4tOL/oc1gDfYSR3RRo/1x7p+/oWOxWdZqxbBBqqu5vUXvc3MmQ8GhJn45FfOqZi+J2Rzc/SND
	ZAIlnLE5KhXVNrdRJtElJAwP4PeYhm++c31b/R8C1JsA1MB3aKFzijummsWLq8GfI8/QCVvNgJA
	xyhWmrDK8y359TCIax22YKekftrEdFn73ixLnq1u9zMGhi8UpNt9alJkKW93kynZRi7w9CaPxSD
	b0ekB04VCy7wQEl0YzNYR+kAl5sJj732QNv8lUpMgToLW4ONYZNdxDhocDsUSzHilTXe1owbzXX
	l1sRwizk57euwq/ykLvMlCGarKVNu6oJY9K0rkgLJOsxBYGZ1eVGcCdOt5gMBiRY/vBN3Hy7G
X-Received: by 2002:a05:600c:8b85:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4ac14fbdcf7mr351103275e9.4.1793818922672; Wed, 04 Nov 2026
 11:02:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com> <ausVkYs1-3rJ5Fj0@devuan>
In-Reply-To: <ausVkYs1-3rJ5Fj0@devuan>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Wed, 4 Nov 2026 11:01:49 -0800
X-Gm-Features: AclHuK9UdU3dwq1JUXXL7zxhwPl3JamlIpuYEG9TvgYAG08j28_4tj64jKv1xfo
Message-ID: <CAPDEY+XgvNEfMNLH9YgJLZGF_bfDFC9kTe58ssxyq=joYYzQtA@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kees@kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:25=E2=80=AFAM Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> Hi Mariia,

Hi Alejandro,

>
> > Date: 2026-11-04 01:02:39-0800
> > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls with a single snprintf()
> > call to construct the IR device path.
> >
> > Both the source and destination buffers have the same capacity,
>
> The line above seems irrelevant, and potentially confusing.
> The size of the input is not important, because since we're appending
> stuff after it, truncation may actually happen.

Agreed. I've removed the statement about buffer capacities from the
commit message in v2. No code changes.


>
> > and the return values are unused. This preserves the resulting
> > string, including truncation behavior.
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
>
> Except for the small comment above,
>
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
>

Thanks for the review!

>
> Cheers,
> Alex
>

Best,
Mariia


> > ---
> >  drivers/media/common/siano/smsir.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/=
siano/smsir.c
> > index 283770d583d5..636ff228108b 100644
> > --- a/drivers/media/common/siano/smsir.c
> > +++ b/drivers/media/common/siano/smsir.c
> > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> >       snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> >                "SMS IR (%s)", sms_get_board(board_id)->name);
> >
> > -     strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.ph=
ys));
> > -     strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > +     snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > +              "%s/ir0", coredev->devpath);
> >
> >       dev->device_name =3D coredev->ir.name;
> >       dev->input_phys =3D coredev->ir.phys;
> > --
> > 2.43.0
> >
> >
>
> --
> <https://www.alejandro-colomar.es>
