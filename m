Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D637F339
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802996; cv=pass; b=lJLrDDfxQtFrMELg7dBjOyAyQxkQoAFrNsE8f2uP2IdcsRVPtqy4QYFXWT39bc36kvLl4LPmc02J/7aDtWAj8YSNKJZKm33Ogl6aSJTOI6sU6BwWBjh2/TNZlfhV204gvk7JxRib7ZvEbr3RyZAojlrC5MkVdQbxc03+pyGCwBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802996; c=relaxed/simple;
	bh=4YhYn5FSlPPx84gvttWg80Ipc0md//aTq9lSol72NVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgqP280Pc0Ow2seQznvaxvsYoncJjeG6gNbuwojINbIB+hdtI6qkwHk872TWJkepkU6mNb4NE8mPlHLzZVy5jGUJjtbZ4VR8AGenwGPAKAK+Wg01gz1N7C2K7pW4AUiXGCcvLBRNr6PGxtBxuKxnx3wvBali/pPlZO9vj2myV0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q66HE5R/; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q66HE5R/"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so5155211fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787802993; cv=none;
        d=google.com; s=arc-20260327;
        b=qhO+fU6PeWC0l+4ZHLoJ8bgdJ80xh0FE4k9ybS/uufh4mf4hm1Dq1ywI+EanDFsax6
         YMKYR2Y0kz87wSB549t2O8lbQpKK9anACuOLcxY+A2+CuDHUCNiuaOruN2imJBlGpUj0
         Ifz1Y+kMwGxf0f5n9V6Wi0clCHF85n6NpYhrCXijj1DYY61Z5hho2JVazdiGoTd6CDFZ
         p3nNxmvJf0xM5BNejiQe8ZHKZGkbvakoP7RY8+aoAzIcS/2eS53SsKaQksa7lyR4y365
         eIAyL3B4Z1yAodMCHbtJVaNYrR1EdkR/pvH1nD/miQz7GcmNGpCQy0/GBGh8hsy6XvpF
         DR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhmHfBCxwPWUairZ9+s6ng99fn2LZtkTw0G10u+xfDk=;
        fh=pfpAyAe1NJfThxQz9u+m2ST9x/jwwK0RwUVp9yPXoc8=;
        b=eYeQpJ/5WXw0aKnl5Uf4q/2+wkvu5z6Hbp0hVRizmKhfVReRHFbJHXM3IeooBMVALs
         nyr+wygq1TZtxpO3xDiXXz6sLJRH52pUG8+600MQC5cQUCItugzazFZXHqnHxkLoT6b1
         s9jxcPDZnxKLCVkjnn/XxM20ZjJmQTbUyoOTa2wXvSMTl19r/muxalLwdsILh4g6dXrn
         8b1GPIWbMvqcRh28u/KBCTYm0+6Yx6sYu4Ym0KFk35L90tT+g6Wa2qfYdjTLv4IBIG9R
         SFtE3BuQIE7ghh2d1moww0kWEDfG3oECWXEJ7ersodPjJOywCmZRf48CYk/MOBpkcVd3
         JI0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787802993; x=1788407793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MhmHfBCxwPWUairZ9+s6ng99fn2LZtkTw0G10u+xfDk=;
        b=q66HE5R/GoOX0JjShNlrmv//Lg23/9HXmHDRaqdrglasD7bPuJaLk2zdLWJpUyzAcz
         UHuAlegXqBMXmYr+kBKkNowGmSAHdyVnKr0uhls0oc40dA33TugpD0mY+DCkSprG/JQi
         jdUwjPWj00qb4wwdSiYo0nfHRaoFfogNr0pPm8oXmFplxZBZvUzYJJuHmcwXmr8P2cFs
         OSnNmlYBmUGIAQflafBhgobCrLTXom/jknrwe6q/Nwku4SrdkBz/5OIlFCwixlHeVF1M
         sCyAWT9EHnkGBF2nXBUP4pZyEKq22S61Vc+AkQGli32gYqEharC9O6N18Iu59bcgQbN5
         FKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787802993; x=1788407793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhmHfBCxwPWUairZ9+s6ng99fn2LZtkTw0G10u+xfDk=;
        b=fU1zROeI6ZWlWUNHZTq2XTo3Om1J0ZAAsNKZIFxt12FPwSaEd7jV8QHa8rAP4BofY+
         QwpFcay165L6UP1/PpJ25y/TeF7cReZxrLBknYFTCSB8tdFo7QJ+ijt+23dsWDiYm4/E
         xIbwj4BQQzocrQPD5lL5+NNIllMBQpsWEqQmoJrLsDFZ6vaoW/yRb4+s1psZTTIiy2uJ
         CDcMhmOPoZgitutNHKzhIlbO0dMmhelLQZCsoH2rUmC5us8GmLxo+Hb5bWPAHljn2iV6
         hO/3RIupX6glxlzvqKx2/i9W4aWu/VHu+wUYokcghOIsRQsPKHuvjX8VbTfPCGAonDx7
         eD9A==
X-Forwarded-Encrypted: i=1; AHgh+RpizeYpBwA+jIsCsHblgmAY5oAo2d0aUrJZV6+BkGWEvpi2cH91yOIxoyq9mSPcrLUQBHVTSieTAA0UpfU=@vger.kernel.org
X-Gm-Message-State: AFuF++kyTxvaB/63mbkYyHaSUK278zUGvK8waIj+32lssxAwnJfUoQc1
	fGzCH7SSvV5rzzgKtD9jK98BQUpLfRbyuFA4o7CIMjLHZBv6e5wJy0Clv0nHpLB3p8n5CXK6qX3
	NfRQh4YOSGQ1/Ccbkg57cPfnfkl4e63BXgQ==
X-Gm-Gg: AR+sD11kgvz9UrMb/NH40kcer4T9dXNrhjx/LAwhtAyabqg/UxkCnGtFq0k/bv+gPR/
	TvXJ9MdjN2X2X/4mo2lwOtMGkEVS6tY53axJjRfh+qJ2u2Bo9PdYgdOvkfWGncdnoY5UCVXC6nn
	AQnEwR6wk4dq2ra99xPYBLKMd9CwQbUdSQlJy0Y8FT1Fj0t47UpkHIC593mY/jtTOSImBd7HAw8
	mPgGxvoUO4QGOv/q6CnwhnpzFKmr2W9PesohySj9GFdg3LbU+Z9i1u4uzL5Iz3wd6WGiii2ofvk
	4n+/y/j+UIMo8wC8cOTVpk1zC8TS6BQtRhinEmVX9tNRI8l55u6UqF1V
X-Received: by 2002:a05:651c:2124:b0:39f:75f5:907d with SMTP id
 38308e7fff4ca-3a1fd454d23mr24384781fa.2.1787802992881; Wed, 26 Aug 2026
 20:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075935.170457-1-zenghongling@kylinos.cn>
 <CANFS6bZczfbx3HKO9pN2wOm9Wy8oCX0GAA_uAoXzhu1j34Jo7w@mail.gmail.com> <6A8D37D1.7010800@126.com>
In-Reply-To: <6A8D37D1.7010800@126.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Thu, 27 Aug 2026 12:56:21 +0900
X-Gm-Features: AcwNN1W4ADiFsA1DExE0Miz_nGo___YnVaIMS7fjmTlaGnkmeF19MvmI3fsDMKk
Message-ID: <CANFS6bbfYTTyg_3vUi6i42mGczQyAVeQJc59SMvcu2xqOg5y8Q@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix memmove overlap in ntfs_new_attr_flags
To: Hongling Zeng <zhongling0719@126.com>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, linkinjeon@kernel.org, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 8=EC=9B=94 25=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 3:36, H=
ongling Zeng <zhongling0719@126.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
> =E5=9C=A8 2026=E5=B9=B408=E6=9C=8825=E6=97=A5 13:45, Hyunchul Lee =E5=86=
=99=E9=81=93:
> > Hi Hongling,
> >
> > 2026=EB=85=84 8=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 4:5=
9, Hongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >> When the record shrinks while the payload offsets increase (e.g., enab=
ling
> >> compression reduces padding, making arec_size < old_arec_size, but the=
 header
> >> grows by 8 bytes), moving the name first can overwrite the old mapping=
_pairs
> >> before they are copied. Move mapping_pairs first in this case.
> > Can this situation occur even when
> > it is not a crafted image?
> Hi Hyunchul
>
>    Yes. This can occur during normal operations when modifying
> system.ntfs_attrib
>    on a file with a named non-resident attribute. The header grows
> (adding the
>    compressed_size field) while the total record shrinks (reduced padding=
),
>    causing name_ofs and mp_ofs to increase and creating the memmove overl=
ap.
>
>    No crafted image is required - a valid NTFS filesystem with the right
>    attribute layout will trigger this path.

What I am wondering was whether there had been
cases where such padding existed.
I has been considering where we should guard
against that case.

This patch looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
