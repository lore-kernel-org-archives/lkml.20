Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75021CC59
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797418; cv=pass; b=ZlmcIZDAH2PexUHnYT/svi2YL85NgMqQn3T7EAqddzcxSieQbAAt2XzxEIZ+HYlKpkQWf0IZ/ljQguK00W7LqLkcSPdwt+NKQk+Yz/rUkf5IXK639dCDO3bORkNUSxVioMyR+OStm4L/E0umVTdH9Q/YLHJ4aFX8OijA8CPpGn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797418; c=relaxed/simple;
	bh=AcmEBZHzayfZ5IMie0M4Cf37vjp5qqv+IZhFQFgM9WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDbrsMLrerSCs8NXXEr9KMFkD3bjWUzYm3XxP4P4eeIkgRCPQVQDRuwNQASOUO+apRCMo+C2U5Ri2q+aKs63lTaFjSB4++koT4RisOxB+v5hB1aoM0UTkejj5JkNJF+BPJp8sCe+RZGzaK+1vEvg9ITE2ca9ZMmU0eL/+FWh/8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqdUvLKp; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqdUvLKp"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso2262607a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789797415; cv=none;
        d=google.com; s=arc-20260327;
        b=SYWTKBdL6p5oSdwfKILHm34zOGzug1Cr2iUnzLBfMaqOubWLIf8AUKG18dHjp1HVy5
         wcsF+jigeo9UfVdXZCfeC5Rpki8JyQGwpkzK9EYZEk4I1R0QQ5J4uqKZ+eeyhXtv6eZ8
         ZBB+t/9fj34g36nQCl3e4mSaQcDYscvPH4N49wofNrHhBzUzo0fKwQOM7pwtBnQx199j
         gKJwnpY1id6rC+ybyoZ8RHd+by4txLsSwMY1zvdT11aJq9HpPYER6nkdP0uAlwLtaktW
         tu9756XeOts+L4ognSpOVpfYe8z6cUFTch0oCucYDV5dZtrZ5GZR180ZdfVyB27aWdwn
         57Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OHukx14Sui1pXNCLGNMyUbwIr4Qx9f8ENR4WiEn70ek=;
        fh=xFAXcJFJyNnVTDkIrYXGHCLS+wBWbkrER0hPNksk4pg=;
        b=ZZJhzUfMyXj/gsCEhM5R4HQKDPcHrxCfh6DLVRdJS1Xm767IMpOxHWV29UCOaqv9Ed
         eCzTbJDeMOuMnsocNpi7wdLl7vjsPKtSJnqwVxBC9ZUxZBIt4BmRl+KZbxCcMwm66lRP
         KMcvk9yvBecFRSlBrFSUzxEzVxhM4xTZtADGce2yfc/7xzSQXBpLt8qUxDOyAmPIIfo6
         D0+CSRx037TCbPtUHmKpKg+0GUfGJDEG5uvlwHq6TG2fpEA0l1Y1oJk/l4FI4/Qf94dC
         vfJeM59cW3CgDwyR8i+r5jngSu1fG9lttCuxMPCaxglWQrb8lNELtD603n/6o+18oIFH
         QZHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797415; x=1790402215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHukx14Sui1pXNCLGNMyUbwIr4Qx9f8ENR4WiEn70ek=;
        b=GqdUvLKpqCyswJfgFz012cZ5VONENnI+0vVglKhBCqI226piSoPJjt0XsQ7ZoTdaeQ
         rjgKWAegXLMmiF3G6c+KH9Xj0osJKoVG5TYrc+ecIjyCux/IpUMbRX3JTHhcxMz+h0ve
         LomcPnNiX9agq4MUF2bv1NJFSEOS05K6TyinDu/lIEihzCwT4sDwaytk9s3CyNfByO9P
         TbrTgLlGvaS2NaKbeH0BwacwMka9P2GlAOV2l4kIqjshSemw6LPJ+7hvNsANvTGnPYQC
         T5c9tcbslb8BKA/pSNFWEUH4vYqUAtEK2M0FRubCfnUGmEa6J+iTy1I6B5KVCPq5S5WV
         x4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797415; x=1790402215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHukx14Sui1pXNCLGNMyUbwIr4Qx9f8ENR4WiEn70ek=;
        b=rXHqhWMnlOdpTj0eAR7gxNM8npwmIVQggxmak57IFZNyVyPslABxc3XCzWhwSLBglQ
         oAhK70Xtv9miqmxvceXVBYefVogBSyuLaCRpALl+W9wof3XDG8qoUDKQrIWc7UgZK2ks
         gBeIHmd+iSayvsrkqdO4vzIUxe4zKLb73D8JiqLb9kUF2GVm7gtjSmu13DGi2E686JKz
         lGwz4dk+/zQ9i8FaFDbbCdchvn9M5PO6YAtRBTeqbunCmnyqYhxQdeIscgf3LEJfZbPS
         sJKKSvLEPDSLK+AtybcnHtNp5266pJNV1WSndPUG9Fsu6zQwzlRoXw/m/IogUfmEz/Um
         kF9A==
X-Forwarded-Encrypted: i=1; AKwUvBysLYh2zdwVIVR9RMwz4dnU5eb7P6LbOFFZCqDZO1oLwiBiep/6MNGmTgoKWdI19D73H+dOsGfJCMd0tjw=@vger.kernel.org
X-Gm-Message-State: AFuF++kSebzlExv+D3+XDC60kvvhKqOO/s8+a8Cj6W8MS3CMUt4X6cpF
	0dqRD2UiZ4U4wQsQcRd+r3tXANYwUa4pRRUedfjjOniu8Hx395xQOp3i4pM4PWPvqmc+MUGWD7M
	0nfOwvKWfvztFMHDpnz5vI0uG/rG+VNY=
X-Gm-Gg: AYBFou1vThpVHpGeqWoKfjdxI+lqBiq/gcH1bBjQF64MhR7qZvF7d5ek1bLpUrjTBE+
	JqBHgy7bCERxK0vB9NHAsw9Y+o3IhTUGpQ9ckHEnXjChNpNs3M0ZhAOrszU6h+eeowDe6yrtrnX
	7jsF2JHMfrUMsRDIi7qYNE9rmI/cpgdEDJEee52zKsHNwvWA5CGQ5ZM1hXh+rZe3Iux2O4yYZcY
	WoYpxbGoUG1dMFgCTsTfhL4MEIQ3E+KLGwVfDzNb+QqS1lBiebaGSNYOprIuGFB2yYiFSxKYt8o
	VMi7WZjjqedJtyEZ2OwHWTH50hLsXGq264+U6CqgQiCal8lNYVdiCOArv5aNeLucwuFx7uHSnTQ
	9zLwEOCgPSOHSf2j2/I+q0KRVdVnvvoTE3jo4z0o=
X-Received: by 2002:a05:6402:3208:b0:6a9:cc5a:944f with SMTP id
 4fb4d7f45d1cf-6aa568904e8mr3091305a12.30.1789797414604; Fri, 18 Sep 2026
 22:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824225610.18471-1-meatuni001@gmail.com> <20260824225610.18471-3-meatuni001@gmail.com>
 <a67d4e52-5e87-0e76-4c91-cb8ba2be31f9@linux.intel.com>
In-Reply-To: <a67d4e52-5e87-0e76-4c91-cb8ba2be31f9@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Sat, 19 Sep 2026 10:56:43 +0500
X-Gm-Features: AcwNN1UUeoLmBs2kcBrba5wCLxOXu9ob-dGHRLDdA1fM_GmYgrixaoOIC9bsGk0
Message-ID: <CADqcGBnGHd+rRn6b=eWVjhWDU-NQ4CFb-3B9cgwBeouN-sbw4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: hp-bioscfg: fix heap OOB read and
 buffer desync in hp_get_string_from_buffer()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: jorge.lopez2@hp.com, Hans de Goede <hansg@kernel.org>, linux@weissschuh.net, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed, you're right about the redundancy.

utf16s_to_utf8s() takes src by value, so it can't advance the caller's
src pointer. The second loop then restarts from the same position and
overwrites everything the conversion just wrote, using dst[i] =3D *src,
a raw truncating cast with no UTF-8 encoding. So step 2 is currently
dead work, and the function is ASCII-only in practice: any character
above 0x7f gets truncated to garbage instead of being properly
encoded.

Two ways to fix that, and I'd like your preference before I send
anything more for it:

(a) Keep utf16s_to_utf8s() as the real conversion, and rewrite the
second loop to do escaping as a pass over its UTF-8 output instead of
re-deriving from UTF-16 src.

(b) Drop utf16s_to_utf8s() entirely if ASCII-only was always the
intent, and keep only the manual loop, fixing its bounds instead..


Thanks,
Muhammad

On Fri, Sep 18, 2026 at 7:18=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 25 Aug 2026, Muhammad Bilal wrote:
>
> > hp_get_string_from_buffer() has several buffer boundary and memory
> > safety bugs when parsing UTF-16 strings from WMI BIOS buffers:
>
> Can these be fixed separately? It would help review.
>
> > First, the loop that counts how many characters will need backslash-
> > escaping uses the same variable as both the accumulator and the loop
> > bound:
> >
> >   size =3D src_size / sizeof(u16);
> >   ...
> >   for (i =3D 0; i < size; i++)
> >           if (src[i] =3D=3D '\\' || src[i] =3D=3D '\r' ||
> >               src[i] =3D=3D '\n' || src[i] =3D=3D '\t')
> >                   size++;
> >
> > Each escape character found extends size, which is also what i is
> > compared against, so the loop keeps going past the buffer's true
> > character count once any escape character is seen at or near the end
> > of the valid range. Every escape character found causes one additional
> > out-of-bounds src[i] read.
> >
> > Second, once conv_dst_size is computed, the conversion call passes the
> > byte length instead of the character count:
> >
> >   utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_size)=
;
> >
> > utf16s_to_utf8s()'s inlen parameter is a count of u16 units: its main
> > loop decrements inlen once and advances the source pointer by one
> > wchar_t per character consumed. src_size here is a byte count (the
> > code's own preceding comment, "size value in u16 chars", computes the
> > true character count separately as src_size / sizeof(u16)), so passing
> > it directly makes the conversion loop walk up to twice as many u16
> > units as the source buffer actually holds whenever maxout does not
> > run out first.
> >
> > Third, the bounds check 'if (*buffer_size < src_size)' is checked after
> > src++ has already stepped over the 2-byte prefix. If *buffer_size equal=
s
> > src_size, only src_size - 2 bytes remain, so reading src_size bytes
> > reads 2 bytes past the end of the input buffer.
> >
> > Finally, at the end of the function, the pointer and remaining buffer
> > size are adjusted using the escape-inflated size rather than the actual
> > number of input bytes consumed from the WMI buffer (sizeof(u16) +
> > src_size), causing the buffer pointer and remaining length to drift out
> > of sync for subsequent property parsers.
> >
> > Fix these by:
> > - Keeping the true, unmodified character count in a separate orig_size
> >   variable.
> > - Checking *buffer_size against sizeof(u16) + src_size before reading.
> > - Accurately advancing *buffer and *buffer_size by sizeof(u16) + src_si=
ze.
> >
> > Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 29 +++++++++++---------
> >  1 file changed, 16 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.c
> > index 32b99a862082..dd453a9b962f 100644
> > --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > @@ -60,6 +60,7 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffe=
r_size, char *dst, u32 dst_
> >       u16 *src =3D (u16 *)*buffer;
> >       u16 src_size;
> >
> > +     u16 orig_size;
> >       u16 size;
> >       int i;
> >       int conv_dst_size;
> > @@ -67,17 +68,16 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buf=
fer_size, char *dst, u32 dst_
> >       if (*buffer_size < sizeof(u16))
> >               return -EINVAL;
> >
> > -     src_size =3D *(src++);
> > -     /* size value in u16 chars */
> > -     size =3D src_size / sizeof(u16);
> > -
> > -     /* Ensure there is enough space remaining to read and convert
> > -      * the string
> > -      */
> > -     if (*buffer_size < src_size)
> > +     src_size =3D *src;
> > +     if (*buffer_size < sizeof(u16) + src_size)
> >               return -EINVAL;
> >
> > -     for (i =3D 0; i < size; i++)
> > +     src++;
> > +     /* size value in u16 chars */
> > +     orig_size =3D src_size / sizeof(u16);
> > +     size =3D orig_size;
> > +
> > +     for (i =3D 0; i < orig_size; i++)
> >               if (src[i] =3D=3D '\\' ||
> >                   src[i] =3D=3D '\r' ||
> >                   src[i] =3D=3D '\n' ||
> > @@ -93,9 +93,12 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buff=
er_size, char *dst, u32 dst_
> >               conv_dst_size =3D dst_size - 1;
> >
> >       /*
> > -      * convert from UTF-16 unicode to ASCII
> > +      * Convert from UTF-16 unicode to ASCII. utf16s_to_utf8s() counts
> > +      * its length argument in u16 units, not bytes, so pass the
> > +      * original character count rather than src_size (bytes) or the
> > +      * escape-inflated size.
> >        */
> > -     utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_s=
ize);
> > +     utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN, dst, conv_dst_=
size);
> >       dst[conv_dst_size] =3D 0;
> >
> >       for (i =3D 0; i < conv_dst_size; i++) {
> > @@ -121,8 +124,8 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buf=
fer_size, char *dst, u32 dst_
> >               src++;
> >       }
> >
> > -     *buffer =3D (u8 *)src;
> > -     *buffer_size -=3D size * sizeof(u16);
> > +     *buffer +=3D sizeof(u16) + src_size;
> > +     *buffer_size -=3D sizeof(u16) + src_size;
>
> I really don't even understand how this function is even supposed to
> work... So lets try to agree on its functionalit first and if that makes
> any sense...
>
> 1. Function calculates some lengths
>
> 2. Calls utf16s_to_utf8s() to do src -> dst conversion
>
> 3. It overwrites dst in a loop by copying from src or escaping the src
>    char.
>
> What is the purpose of step 2 if step 3 overwrites dst? Does this happen
> to work just because ASCII chars in src are <=3D 0x7f so the copy in step=
 3
> won't mess _most_ strings up??
>
>
> --
>  i.
>
