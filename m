Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1EF3A5E6F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555664; cv=pass; b=tNw3wX4cKqkkxQNBGdiKmVIyZu0VVtqCBQ6RshLjFJJRvYBZ7XaUw/HJDaWOBKJPozTU4JIu6iP5WjBoG+i7/D3UAMB2Se2Etx8aHwHw0Glkq0rUEB3zoJVBD5z8GCt7e2LSvnpIjJBh+IpNCg7V3idsaFmH1/Q2enY8zz8woMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555664; c=relaxed/simple;
	bh=VZMBuFp+DS/Db3b4NboyELLEnA2/j8cRPYrFMrmlnOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlBxcbve40XAtm0VirnyrNvHHxSJLTNcPWC6fyxCn5rNdMxUY+8/YvXl+CzBi9rvj1E79wxQbMRJFwBk+3OMdJqH8RE4w9XojUO7iQ9pXExdvU7ng1gitdfADB5pD2ZqbBs/Cshdit85A/wMX2xSIcBPLvNUbL0SbO5xaNXWVVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjZo/uZw; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjZo/uZw"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so123033166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789555655; cv=none;
        d=google.com; s=arc-20260327;
        b=Zk+ifMMH/3JKA1PYR2QGLvZsDviPXCfT4WiiCEencXfDM2cHjgjxEKrrS2xOpqxjJI
         wYsa/BKB4iE2al++CPt0lg5GmpvKsw6etCXzQCSpWFoSKtnfpXcvsFb4AhlVr741+93e
         SuN7cbTUResUhUcBem985IIxtTOqI91CsSvozD6cyKHWH4N+tC+5KFbTLYusspYaf2b6
         HUGULpgypkJkGDKuDEngBi1MVak417pIuTfEDLQVFlmaIgSxBz+rJSitisRi4NyxPVhR
         2EyuNUfjtta2R5UzxAm0uiiKJAHuLHc9H6Qd5xiC3/ymg2uW0bGlqdQq+fbyDh7D0HPE
         FF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZgcaJKY7C0H9SxJQu4Bxpc/+fGWLKWbb9DZVtk2QXZs=;
        fh=fKo3VJWS1sog5wn4hI36dzhlHe1YyS75nPOg9pe0wss=;
        b=EQmwkFPU42ze6j22iVnLRgyMjjeUWvJQ32P9GS2TrxDEAzT7yJYyj6fIDARxXpNemR
         95yc5dbF6VqoBpmJhp2pwhUrftZybNszA4uNjKG19rXiBfae+UAfUDprfs7+VIK45FBC
         MQfeAopwTcDCwqY6vveLXeC7AUcE2nGvgUBWZ7mjUafvsNBjFljXe8k/n57nqtDOlRJx
         d3CanB61hd3L0ektfBrhizA5Kjl4a6iFbhYMHwC7KyGgvWbEXydc9NydSiTkhAVk60XA
         ZQFppZdSXuQP8o9BeluH0gu40feoNFsdlBeoVq72dlnNQQg7hJgnkrn4Tq4zJMOF8VCK
         iQHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789555655; x=1790160455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgcaJKY7C0H9SxJQu4Bxpc/+fGWLKWbb9DZVtk2QXZs=;
        b=mjZo/uZwisbQ3pAu0+BLZrNRI28L7v4g5JehseIG5DxI4cxEmxziyyGD8bEwM/H3wW
         rUfOuztG8BZ7hynsE3RXgB6cCCt0IsBIC+qWxgPStcxE9OuYcROLg/FiA/+9GofB2Nwc
         RmqvBCZRilYC5NjY7m7NCh4TVKcUlv608n+uxghNwYtlpBjgufecokR6lGlIXPvOcsYn
         +G9AA+8uiFuW8OcgfWptfqUGAieCaw4Zvj/04Pag7DDMIxiOK9mgMlIVIovcMMy2X0VZ
         3sAJvgT9Aea9WcxUOwuV1eAXEQVnK29byUPhl8sOK8MOviOlxq0orbpNIb8ulPgqTQB0
         V7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555655; x=1790160455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgcaJKY7C0H9SxJQu4Bxpc/+fGWLKWbb9DZVtk2QXZs=;
        b=Y63tozbSb8oy+B9Vcq91O5CKrpU6Nkf/PXN1eN5J2zpuJjHxOXf4T7odqP8WQ4sn9w
         kjxD1Wt4QmLNBtQE/xFBp8OSG3DmffoybUVknGBex/u2EH987+L8q+hGpHDgXaTsQjIi
         EsT/I3HxshGPxj42Of7LxzpXHABTlZv6Fqp4airw1JB0SsWKWaBbVaHH1HnIKerlzRJK
         z77Ir0kcYUVDrJI6YNd15htfLauEdDhQCnxQ0CDwde+dp3fAU5Y9pMxz9p/edklVchl/
         RZ0vA0PBHof0lVx82TpeEwkx4yW8bQGPs7zpzjBDin3ghT+Wp5tAHw8lXuz0woJEfcZA
         /ohw==
X-Forwarded-Encrypted: i=1; AKwUvBzKPqBXlsJjtIEiziY4y4OABY0Z8NDK5kUrEUwyk16TAVzBKVqEUJSBjio1nVi7nn2eR5cuH6nwwbQXfgo=@vger.kernel.org
X-Gm-Message-State: AFuF++kiOwy5SyBjHYnEYEnWZRCTYmZiP/kJYuU5MiApcvQFKdM0UOXM
	BfSRcxgzN6v3VLBzhxsK9/NXbQAc9mQOpGYkSP8MLtczLyVS6GSuov8x7CZ6Esnf5kXX0Dz39LV
	EuihNMnwwPDO0UC4naTfxeR1k0+x8R3g=
X-Gm-Gg: AYBFou1BR8eyhui44haVLRTLsGiEKV5jOvKbK7/PTc7OMgVsYXvL+CjdJuA7kaqmbF1
	3TFF5Yo7VVWg5QcMZYLQ+7hiSjlowyojXpuZXOJ+MgzuEoNs/XMPiDZsNQPd6wEYf2Uk4cElfrh
	3lpo5Ex0wHOip+9ZWLEJJjSXbCKuaXitFFztuzKnX4qoEAMnLIj2nMOZ7/bmKm7z9rPHu9wn9+0
	TWgKkfuCUtfLYIzold/jrqRS9CGitTShnqTshWELvdZ1DL0cg4iZgB8oEe1e8D+1qezA9kkAdiT
	hn77/+GlRKyBck4pMn6lbUduiOHwYDLncp79QkzpCQKlUJgzxGmyx230g8MR0ptgg5FQks/H4Wu
	mdQ6fE7CHKbkA2JED1jeMRPMweTAcc722GJlc9lv1xbPb2QODFA==
X-Received: by 2002:a17:907:9806:b0:c29:ab1d:b5be with SMTP id
 a640c23a62f3a-c29e5308f4emr140996666b.27.1789555655362; Wed, 16 Sep 2026
 03:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0380b8d6-cff5-383f-b47f-700d1d17fefa@linux.intel.com>
 <20260916004606.165065-1-meatuni001@gmail.com> <372e11de-9835-ef04-dba8-89faafa00ea6@linux.intel.com>
In-Reply-To: <372e11de-9835-ef04-dba8-89faafa00ea6@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 16 Sep 2026 15:47:23 +0500
X-Gm-Features: AcwNN1X723FFcCqfjG2Ew9yyYyMDw9AcuCD52yVJWN42G-AONas8nSu9MuyPPxI
Message-ID: <CADqcGBnxHNwnQs+z4=HzF59HEk2Qhz2ZPoMTEjahTK3KnG7HDA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: zero the hex-string decode
 buffer in hp_convert_hexstr_to_str
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Ilpo.

Noted. I'll include the parentheses in function names in the Subject
line for future patches.

Thanks for the review and for applying the patch.

--
Muhammad


On Wed, Sep 16, 2026 at 3:29=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 16 Sep 2026, Muhammad Bilal wrote:
>
> > hp_convert_hexstr_to_str() allocates its output buffer for the
> > worst-case decoded length, then fills in only as many bytes as the
> > input actually decodes to before shrinking the allocation down to
> > that length with krealloc(). Well-formed input can decode to
> > noticeably fewer bytes than the worst case, so the buffer is
> > frequently only partially written by the time it is realloc'd and
> > returned to the caller.
> >
> > Use kzalloc() instead of kmalloc() for the initial allocation, so
> > any unused capacity starts out zeroed instead of holding leftover
> > heap contents, rather than relying on every current and future
> > caller and code path to fill the buffer exactly.
> >
> > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> > Applies on top of "platform/x86: hp-bioscfg: fix slab-out-of-bounds
> > write in hp_convert_hexstr_to_str" (the DIV_ROUND_UP sizing fix),
> > which Ilpo has applied to review-ilpo-next but is not yet in
> > mainline. Sent as its own patch rather than a v3 of that one, since
> > the sizing fix itself was applied as-is; this is the separate change
> > requested on top of it.
>
> Thanks, applied to review-ilpo-next.
>
> In future, please try to add parenthesis into function names in the
> shortlog (on Subject line) as well so I don't need to manually add them
> myself.
>
> --
>  i.
>
> > ---
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.c
> > index ff28db7..2dab9c0 100644
> > --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > @@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32=
 input_len, char **str, int *
> >       *len =3D 0;
> >       *str =3D NULL;
> >
> > -     new_str =3D kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNE=
L);
> > +     new_str =3D kzalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNE=
L);
> >       if (!new_str)
> >               return -ENOMEM;
> >
> >
