Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570723;
	b=v+BVokUQw0kUOr8Aq9uIHcn3ZQlMdSDR8ITp/k7ifSjdjyQOxknFyynRieQEwqkp6ZCd
	 SEhfNjg68mKmDUX8+oCX2r3R04ZX7IjffAhhHOkbQUvlavNsJ9rsF8iLCOLjigK5ePG79
	 Y5gYi06IbWCl0AdRlxK7iY2Sr8KRHfVnb+GBNRN5kpEt9SFfyyIWPzj78j0l26w7R0a8v
	 A34fBIrNrmXml2mjU/r1Lfbxo7QaNbvtn/7YDN5Wp5oyoeejlzC6FzIxPsPHo7ee/Ck6v
	 jkChHdEVu/439d0DopRS287TrprEqJzHrSwFI2GRLTNqkloZvO0Pn1s+M159joCN0Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
	b=ZSIjnpi0KdGN89S+4no1VZcPfjXZyoCC0jDhSa82Wr6e47XMCE9TUD53mhTVuyHd0Pvc
	 SV8xFcADlr3Orj/lYBGdKVhPBwuz1sKhCvbPpSeL9yhTLN0Wyk4tKQcSzIIK0TSIxK9CX
	 jQToojgdlRnDs+kPAmDgoggihw2LkglBn9yENcy1uT3i1SC9KZOHM8yCNftMJuK3oNZgy
	 ycEB7bH/eBMcapgg4xhlOwiUMF1QWQvnXH46j9Ng4iC8y4LA3sWj0DIGhvj+X/6dgxFgj
	 V3yRoEHs47OSmnPyOGxsfbs9eaUs+e9TEJfvWaBr2X9SAfJm0u3Zp8K77Uo01bfO4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="cdvkj/kI";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004A606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5004A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cdvkj/kI
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso290438266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570722; x=1794175522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
        b=cdvkj/kIlzzRCXTVMtiJ6HwaZ3z68SGnR0WaYUVnQ/hC456g2Mpxo6SNi0PwQUe/AE
         jCBGSIz/adI497Gj29osCLTtqbaXl4mya+97ERyQ4EHPswKJf8SPxNzOYnmcq11uz0Dl
         OszIqsmA2oil0IqbBnhikMIzuIdH+nvouldlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570722; x=1794175522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbH5cSzYrt16xL/gEwLrXyJYEkUdlaHa3ePjk9YuywE=;
        b=NiCMVFSozHerVFErnw6BlIfCLEulK0UWfIJvvaEPSsbkPbfxrSF6VHlmmYYc2+utP2
         JGItlFq2GQLt9f7sNKa1KCfzVQ7Tc/zXbv9l1c9vjBNoJeaEeW8vKxgakw7KQmREw/fc
         2PdZRTj/kgagz6Plo6PGp2bzS0D/7ASV7ZpI2KK2JS+BX0uloaNLUxK3IZwnIzhsuzY9
         WvqPuee3v3NBSGRI3h8zmehIpq5Sy7awTvOFN+h8Q406QwF4NLrUhphubo1wcNOnc71q
         L8s+hJ99C3gT2GgfJXoVRtLU7BXmxqPMyocoDpUfuBZkDUd0Ybs0ggaX++aobTvq8LGQ
         Z5ug==
X-Forwarded-Encrypted: i=1; AKwUvBwgcudxyXdZ1m678+IHv6cPJmVukQIYszgsc0xX1U7x8fI+TSBY9XZoZHpHdBYvr/EHQBhWb60bMQQZrBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhVCMmzhUam8zyIR3/PbH/2AS2d6ms2mCBqN5+95zzi5jYmRtc
	4FS2+uEg/Sj3pvp1CJO3P3MscjyjnN+4NW/5ohBbN+7VAXY6jaZxTpAi4bCkpOylMtqt4SC/4nO
	H3Ry/8X5p
X-Gm-Gg: AYBFou039fp6MaZHV+MMJ/CHxNzPJJ5sPPBQnMQNWWYIICWNAaHbjMzobBk6jFvboT6
	k9crvJgeB6K+yPrn9aMrnK50y6ioIvpkxzDqSx2NZrk7i5qlvlpQLgI8fVp0It1sGVfvqbv8/EF
	yG2sHs9R58pL1xk6+9DhVx9TLuTglzxL1ix+pfB6H/Tkq8/7eOnqu5lErgB5Bg9aenWcnqZR3Fz
	BieHHP4jfxry3QiuDXcvsf4ZLx8vMh4vD0Dx1Qe96sAAajScp3WHMfbycc/nTk+W16v3kYNLwB/
	dCVJls7WLxZWzLKOGXf0IUA7aSAoye8fdSLgTz5zFZwweumIXu2/iFw/j8TBWAklYexc7wZXMOg
	9QZNuNgxBMXiugpTMAIJkOJjSTcTipgOVS3Q3eo36wQ5fkn0VQ6kjNvPY+02ghwXVEWU7ouMNya
	JxfcfwQEl0e0fcYzB/1CcQjzDtuMm8zdypbpdCUU7BSMIi6lZNNi6emTzPgrP5B1z+DW91pNC9K
	8S8BqIhTNKqiTszt1fVrjxtGUaSyoO2Ii1Iyrj4T/2w00dau5Pt0Lln7KGTO0Aqn8FWYJkpWANV
	FGJKFBpu5XTzkukln1nXeGYE4+L/ETiPfWpAqiHQCZiQnWfb594+IsvTiqYzK6OR0BpAZHo6FZD
	UTgiazMLIm8Lg
X-Received: by 2002:a17:907:160f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c4ca7ac0de2mr671854666b.42.1793570721730;
        Sun, 01 Nov 2026 14:05:21 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe93db0sm307417766b.66.2026.11.01.14.05.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:05:16 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so17871265e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:05:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwQyQgEQUZPTcyaElEmIZ9wijLdz+ClMd+StBoGx8vVtiVQ5lHD/vgKzydw3PdVLHmF8azarvN89o+HbAQ=@vger.kernel.org
X-Received: by 2002:a05:600c:8b0a:b0:4a2:191f:7cbd with SMTP id
 5b1f17b1804b1-4ac17191009mr194305115e9.11.1793570715202; Sun, 01 Nov 2026
 14:05:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-6-dianders@chromium.org> <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
In-Reply-To: <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRaq1P5E0Ahpxnm-4RBt1Jm-WdmsArATGnDSx-ZY=gtQ@mail.gmail.com>
X-Gm-Features: AclHuK8vPO0SVdKrca88D1rHTJSemg0l_zF5g5bNVXQTK_MW_PMrAwjFBN9toEk
Message-ID: <CAD=FV=WRaq1P5E0Ahpxnm-4RBt1Jm-WdmsArATGnDSx-ZY=gtQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> On Wed, 28 Oct 2026 at 15:56, Douglas Anderson <dianders@chromium.org> wr=
ote:
> >
> > Tighten `overlay_parse_fixup_entry()` and `overlay_split_fragment_path(=
)`
> > before reusing them to update the base tree's `/__local_fixups__`:
> >
> > - In `overlay_parse_fixup_entry()`, store the `strtoul()` result in an
> >   `unsigned long` before range-checking against `INT32_MAX -
> >   sizeof(uint32_t)`, and require the offset field to begin with an ASCI=
I
> >   digit (`'0'`..`'9'`) since `strtoul()` accepts leading whitespace and
> >   `+`/`-` signs (wrapping negative values to `unsigned long`).
> > - In `overlay_split_fragment_path()`, reject paths with a trailing slas=
h
> >   after `/__overlay__/` (`rel_path_len =3D=3D 0`) with `-FDT_ERR_BADVAL=
UE`.
> >
> > Assisted-by: Gemini:gemini-3-pro [edid_decode] [gerrit_and_build_artifa=
cts] [gsheets_gdocs_cli]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  libfdt/fdt_overlay.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index b7dd8fd922eb..a19eb1bc4bd8 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -376,7 +376,8 @@ static int overlay_parse_fixup_entry(const char **v=
aluep, int *lenp,
> >         uint32_t fixup_len;
> >         const char *sep;
> >         char *endptr;
> > -       uint32_t poffset;
> > +       unsigned long poffset;
> >
> >         fixup_end =3D memchr(*valuep, '\0', *lenp);
> >         if (!fixup_end)
> > @@ -404,9 +405,10 @@ static int overlay_parse_fixup_entry(const char **=
valuep, int *lenp,
> >         if (!name_len)
> >                 return -FDT_ERR_BADOVERLAY;
> >
> > +       if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> > +               return -FDT_ERR_BADOVERLAY;
> >         poffset =3D strtoul(sep + 1, &endptr, 10);
> > -       if ((*endptr !=3D '\0') || (poffset < 0))
> > +       if ((*endptr !=3D '\0') || (poffset > (INT32_MAX - sizeof(uint3=
2_t))))
> >                 return -FDT_ERR_BADOVERLAY;
>
> This is more than a clean-up: it fixes an existing out-of-bounds write
> in fdt_overlay_apply(). With a /__fixups__ entry like
> '/fragment@0/__overlay__/node:prop:-4', strtoul() gives -4 as an int,
> which reaches fdt_setprop_inplace_namelen_partial() as idx =3D
> 0xfffffffc. Then 'len + idx' wraps to 0, the 'proplen < len + idx'
> check passes and memcpy() writes 4 bytes before the property value. On
> 64-bit, '4294967292' does the same. Overlays may well be untrusted, so
> please can you split this into its own patch at the start of the
> series, with a commit message that starts with the problem so it
> doesn't get lost under 'Prepare ... for reuse'?
>
> The real cause is the wrapping check in
> fdt_setprop_inplace_namelen_partial(). That function is public, so any
> caller passing a large idx hits the same overflow. I suggest fixing it
> there with something like:
>
>     if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - id=
x)
>         return -FDT_ERR_NOSPACE;
>
> and keeping the digit check here so that '+4' and ' 4' are still
> rejected. The INT32_MAX bound then becomes an early rejection rather
> than what keeps memory safe. What do you think? A test in tests/
> checking that fdt_overlay_apply() returns -FDT_ERR_BADOVERLAY for an
> overlay with a negative or oversized fixup offset would also be good.

Great catch on `fdt_setprop_inplace_namelen_partial()`! In v3 I've:
1. Split this into its own patch at the very start of the series ("libfdt:
   overlay: Fix out-of-bounds write on bad fixup offset").
2. Fixed the overflow check in `fdt_setprop_inplace_namelen_partial()` in
   `libfdt/fdt_wip.c` as you suggested.
3. Kept the digit check and a `poffset > UINT32_MAX` bound in
   `libfdt/fdt_overlay.c` (mapping `-FDT_ERR_NOSPACE` from
   `fdt_setprop_inplace_namelen_partial()` to `-FDT_ERR_BADOVERLAY` in
   `overlay_fixup_one_phandle()`).
4. Added tests in `tests/setprop_inplace.c` and `tests/run_tests.sh`
   (`overlay_bad_fixup_negative_index.dts` and
   `overlay_bad_fixup_overflow_index.dts`).


-Doug
