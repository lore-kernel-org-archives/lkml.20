Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877D545DA8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001066; cv=pass; b=on5cpYEdZTXwpe+5UZ7DE3czUuMQQhegcvUBF6BoNbC44/QGf/Ndj9KBl76YHJVc+POa/C6qqT+KZstsjxR0mxs+B1LDJx20TiHToow1HORLQY+5wQQ4pCBZN3EDHK6pqee6Zo4WxrPnB7b7z2CnLzknbL0NTS/tMZ8UZA5/+Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001066; c=relaxed/simple;
	bh=J+h7YdXElMiQCzhKnhtIRfCdNxjHv6XhdIMjoVUG7O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Td9GdZAe0+vbvz0qEHt7S4L22l2JKMbZvwPeGK76QzFaKeJcgUaikn/vdJksKo5JWocWTKZJt3s+aK+W+ZkyeC0hzwr2xN7VoyB+1U5xXfXvMs29SNFrjFHiqTK4MapVhosga0qPyp26+3JGSZ5I4tqyla1ahTuuIlLvHIY2DNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io6KRGbR; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io6KRGbR"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3404ded81dso49001666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792001063; cv=none;
        d=google.com; s=arc-20260327;
        b=HgmJaxW2oN/S3hfJDj6f4m0VoCwEc4S3i75TbGUGBVW4AT/neXpoP9urzLF3n4naSU
         NSl5vMZMel6Fl2W9d0jw7f8S/TDprmwSSPorSbL8S1DGDvXgfghzKhE5bB2z7Froy22B
         D+MjnxSKLDRmxfN0T7GJIPFyrStvxY17/R2WW5MF59qo6NSmIVv65t4x7/Y1tBJXL8W0
         7qIM3ULaldgXWEUDXKJdNgzQHApssXElI6tJtS8WKgymCbJoqguUvbyME7jmn0zwC7GR
         VtS9wHdnDx17wYr0y8L9VzW5qhyLXdv90fdHUhIxVh/xXfjZWIP1uEhQ89ctbKNjEjrC
         m+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fEJjmdOa9f9AfG0wvokXtnQ9GBV6EH86X//DmL/plOI=;
        fh=5v1aA4U55sp4JMxiUwQZGq6Oss9OYWTSabY40EC1Yu4=;
        b=dxtsW19OR1xfdPJy/zkEwraGk2NN5TMpkpPOdSJixNmsMgeBAvnlvZQTAEXFmDDxoA
         2DWA1dmW9lTELtvZFeXPkjFYx3Of02hCr8TrI7I5VqNLssjwypgSODOaYNBHPngSU/EY
         bNyEuOdiU7OIiU486wgR2jsi4DgHNR+H8O2eT73EjFggqBP5/3zEZ5hS/ZgCzsXwk18Y
         X0LmYpMEJ8oUQJIXcniCEc8MRF5njVlAaTMefX9K66mTUC8gdtvLj1y6jXIwHje3MTj2
         3H6VOyNgYridiAn9gE9h6V/y0pCIwHvo6615XA5Z8nkPJqkO5lYTPHVbzY/tjZ29Xrn9
         Izig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792001063; x=1792605863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fEJjmdOa9f9AfG0wvokXtnQ9GBV6EH86X//DmL/plOI=;
        b=io6KRGbRqryTPXxUULFruYi3qjlA3Yh1FG+eCsD4nJwwGXDLL+Zc20XvdOXT2AyQV5
         E+irR1wuMn5uZ3OzEBxwMSHVFe6mo3kyhj0gqSCu0Q7OW7J3VH2w03AKei1N61mMihB4
         BisMGU//2Rf1SmpxFo38/aKQf89ekpE4VBL0Cor4qG7igucLNSDfuOL5bZLLfw5wXrho
         U0nU1r5/bbSFLYaqT+r36/qsRmDm5YF3e6vhDDgYNlBdL5/pZdWdnvvqMGOsTMuEfnXP
         HQVqk34YudBmKF0YSw8rL5yXYeHjtkx+LXZMxLK3zlqmKsBFe4hkmMVzqeN9c7DXh7lx
         /onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001063; x=1792605863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEJjmdOa9f9AfG0wvokXtnQ9GBV6EH86X//DmL/plOI=;
        b=x4SSm4bClHaJeUqX6V7nqS/8ecwlO5o6l/A46KRCjMR1iMay9ruxVOGy8mQh5kFMCI
         wT5FkvWEJwVrojKNGSJiKFfrdPf06PwOZBdoh9BndW1adM5fKTeB1W7cXm9g62IUy9We
         X9jBxLga5yRIN+pAW4y/QajkfapwR1IgbpomoE5GC7Foa58VZtYxDphw1j9uveHW0e7k
         MpXum7QQGlwxvoEMoktQ3BrKbq9JUfWtns7buQHgzIHLY6yHusXC5xqRf2X3TOlqBjpC
         v/tJv10SCi6Z8YIN+QXdH7/LRZLiARjSu2iPUWH4R0qgNBfwvKyGkMMoVFBRUItb3LTN
         51KA==
X-Forwarded-Encrypted: i=1; AKwUvBz/MqbALpyP5aEGz5dgxhCBlGV3lvmkYc++vMFACWGxByKmKuQ1mqZkfVjMMlJvvYnyUbFskVG7jwMHGTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbgUXBlvihi3jmblhwLzrxWpYg3JfJw+3hzvI0aIr+mmaMKOJJ
	mOuu5T3mNDGmVX2SogvPUZOtLyVXxz+DLSFN3TemrWLbWvtlvh1b154fm5i/oBjHDymp+5qb6rX
	nX2wIzl4W+9xSJLTtaxxKe7QI4yVSk/E=
X-Gm-Gg: AYBFou2Nwm/Mt1V58uSv/mFOjHtTeZZwPXAfi8eCagNkbCP7jjjCZjaOvcXWzFumDfb
	vqQm7RQIyb0Y3JYzX4papIbula5s9UZsiO4F76U3xt4hjdvlbsSIJzI1Qs3UaB9nDgOf9WmjNAD
	G1q9j3/jb7/vmREir3U3qXtQOruCz7CYBLxd4J22GJ0sp5hpRUZ7XioxqJV5EX+7cbzgvb50cYU
	tVdbQLwq0Jv96N0cJh1EZGOVeJJkPx3A97Manswq+qyFdfHpOY9iJGjNPeRPM5diR3hWOhda4BG
	DMlhYeb9hNJy8ETqn4iAjiwFUNo2EFE+QKo3tcFIhmX+wTQc8YkgGYjUIhCSnkQGAFyym5hul0Q
	v1aC4KwDsrnBS36a2VJU=
X-Received: by 2002:a17:907:9720:b0:c2e:e3c:ddf3 with SMTP id
 a640c23a62f3a-c31a9a2d73dmr1892027666b.1.1792001063289; Wed, 14 Oct 2026
 11:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013084056.1070923-1-nicoyip.dev@gmail.com>
 <20261013090358.1178367-2-nicoyip.dev@gmail.com> <as9pUYoOmLI2l5oB@kernel.org>
 <as9rFtolVVn0NVD1@kernel.org>
In-Reply-To: <as9rFtolVVn0NVD1@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 15 Oct 2026 02:04:12 +0800
X-Gm-Features: AclHuK-SQplAHNwQy93oHnQprXs6MEsIoHX8-ERaJcQyBiXLt0uOAaw9EhmmAzA
Message-ID: <CAAo+4rVHykh4cvw=wvcZ+6MqehsOi-Foq6f+DjN536pbjj_P0g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] keys: Serialize ownership transfers with key accounting
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:44=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Wed, Oct 14, 2026 at 02:36:53PM +0300, Jarkko Sakkinen wrote:
> > On Tue, Oct 13, 2026 at 05:03:58PM +0800, Chengfeng Ye wrote:
> > > Protecting individual accesses to key->user does not make ownership
> > > transfers atomic with accounting updates. keyctl_chown_key() holds
> > > key->sem, but instantiation is serialized by key_construction_mutex a=
nd
> > > need not hold that semaphore. KEY_LOOKUP_PARTIAL also permits chown o=
f
> > > an uninstantiated key.
> > >
> > > The instantiated-key count can therefore be charged to the wrong owne=
r:
> > >
> > >   instantiate                       keyctl_chown_key()
> > >   increment old->nikeys
> > >                                     observe KEY_IS_UNINSTANTIATED
> > >                                     skip the nikeys transfer
> > >                                     replace key->user
> > >   mark key instantiated
> >
> >
> > Same here there's another below.
>
> This was also asked last time. Actually last time (since I missed the
> spurious comment), this was the only thing that wask from you.
>
> Br, Jarkko

I'll also try to address the same changelog clarity problem in 2/2 (so
as the spurious comment). Apologies again for the messy changelog.

Best regards,
Chengfeng
