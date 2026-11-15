Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749770;
	b=w1S82LQSYDst76fL8pKND6wsBDhRVjFqi6MYQP4BFvchHUWCd3kpiOSLN1o6v7ugeCCf
	 clDywbMVeBK1g/t0ZZHgYz2lfWXQEkmiHN/+CcjbB5yOuA4bD/MegwYr4VOSQj/YMkLxh
	 WQwyULmbz7834lpPohTJKrRaEz0xKSP4KFKVzPSO/QTObfgDyWou9N8KlaAlW6GjRvlXY
	 dtjFbMNUpO5wxj0PP4fF+9HW4mvFzh5cS+urqla6QHV/b46LyDcXFVS8YnMXpohq26hu7
	 1DcoDcxcAg/RrgILFKptGCMp7N/YN/skTGa1I5d/bHuiskE8rW2rrfS3MWdj9O8aN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749770;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CRp2PjdQ7+ZT4NK2cLgdd6O+V5jMdcUEINgEmKNy1sk=;
	b=XsMoEtXuo/ze1F5Yo/BDtGq9YkGBegEeIZXFZmMpLU2iDsln0A/01IWiNlwUU7YoGTSd
	 OtjJ73IrUJMY6TYa9u4Hb9J7WDv2Q96uRjcr+U4IiOgSb6wv/3Jg2JzF9aym4yMFFaZ6g
	 QFr5zLPGmHWL1yVfwyomEM2U2z0vzfk7aBAX6smwqV04BNjP0riZIuBMIY+JffdQWF2Qp
	 woDZPNvbRYSepvh7TIEXhaTSICW2sXoKrhb71FkXGZvOUiWXxjCze5EpiB08zdSa0msh1
	 xxLHt0dKlinBKxQxcMJKXvbMEHeWtg7ad+xfYdKxaxLXN7SHIEWsnffkgI0TQFqdflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD638606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD638606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50715c2757so320466266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749768; x=1795354568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRp2PjdQ7+ZT4NK2cLgdd6O+V5jMdcUEINgEmKNy1sk=;
        b=0ee5F08xWyZJRYDNYGcV0k8YnKlbDEvVn4jwjbAQTdKt2oBP65cpboqLkEBpowul88
         mqpFQknkqU315S5FHFtvUKOA+7+6rcUGbrumRV2byMiPU9hmmaAau2GOpRbuo5beJKTh
         gvUt745gB39FHo2AnpeCCOvj/gW3Doi63JyTT9osXcxC7EalQNiwKsMyiv6ZAstd+4ev
         S6VvyJn6PVOj29UqKRoy950T9i8eSoWFOue1XRJpWcZK6+eOpmGPR9jzUyLCFnvVpDUR
         kiFthyNxvUC7bjCuLOjqeoiYKpsz2CD7Uda4WzuS5cZolzkrNpIdfrq7e4u1etsoTpT3
         Ws8w==
X-Forwarded-Encrypted: i=1; AL+hErGUnbfvuFLYcugCn8yaUUb2rCuKp7Nglo7zJyHmbLjAe+TbMzHbmitgRx5ZGMZkcmo8oRi6wWg2ZZAZeaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xSPBo9QBWqAAhbMSpvhp2hmCXtIb86xjPJq89VkKI8ZWqboNF
	TAidFStFaFHMO3LpCzqOD+RvTjC4CHNFHXZNHU+VkdMgJCJ0UvwM2LhnX7xoLG6ef3k=
X-Gm-Gg: AYBFou1tWQJwQfULPw0rBwLhVs8M2vmkP7gOMeQZJ57z49yMwTicZQNKHnxHqgF+HD2
	5mfzjf0BYhJ1yMseOlfuJ6sZTsVuoGqFUtpeSpqB2a4AI5Y1nmE0Qq9uokI6OstbwwnALNuLyoi
	PGk0lDD34RDudOq4s4htw3oDop9WfKAkx/D7TWdQkXPM1Ew+Psi9HlHX6/I3uyBnZ6Rr91wXzYt
	hrVskMsoYCg+sbb2P8EwWMATgUTuXGjJXgjoiVklENFIPvKy3NasfW4fN1hJTYFm1I2ABZBnvg7
	NWlOwsabFiLfTuhSOKnejX9thGy48mICXUmMTDUtF9n3cWCgnzZAxtlNFar7W3q6+w7yQr0LCVS
	NCV4+NbQXxmldekmxHBLwdYOngIU1jtrSOZt6QxCodpwjnaLzFf3afPP1jp+Sg2Sbr9kxmB1DBW
	HDKcsKsWR2ZwreLqgQU0TvNdYKevfsWKN8Cwcbuu/GJ+4gdINQfZKMMGjgUX4tLiJNV/6BNwnIB
	Pcb+jVLxpgXIhqwS8YjWORisrp8LVHCvLJiM+h1xkW9ZD1fKQrY7eXCuR57M+TuWYS9QwdZG8vc
	IIkdjyfTrcbaHFZR/xe64mQN7UUy1j1aEp7NfC4Xea3YorUPL1Rlu5EbocLBcViSh6NuqEOimDQ
	bvB+hQOut/yYZ1QHkfQ==
X-Received: by 2002:a05:6402:13c7:b0:6b5:8719:6d54 with SMTP id 4fb4d7f45d1cf-6b7c0c6db64mr5674568a12.24.1794749767813;
        Sun, 15 Nov 2026 05:36:07 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c262338csm3319199a12.33.2026.11.15.05.36.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:36:07 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33636865e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:36:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjy9Y8PLuLV6T9/R9faPvp69XH0goC7pXy/DgbNj62ScEnQfJmupGA89kgAp+w9RPga9SOyDj/8XiZlAs=@vger.kernel.org
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id
 5b1f17b1804b1-4bb55a58e1amr180391845e9.20.1794749766904; Sun, 15 Nov 2026
 05:36:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.4084031-2-iam@sung-woo.kim> <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
In-Reply-To: <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Sun, 15 Nov 2026 08:35:50 -0500
X-Gmail-Original-Message-ID: <CAJNyHpJuFY7SA=xzM+ZD-30F0YW73eCS0mP1Triu0sQotaO28Q@mail.gmail.com>
X-Gm-Features: AclHuK8LTHHMaEvQyZot_XanTuzT972cGFa3yw5rvKxpPOm1x_YoUHoyJ3G7R0k
Message-ID: <CAJNyHpJuFY7SA=xzM+ZD-30F0YW73eCS0mP1Triu0sQotaO28Q@mail.gmail.com>
Subject: Re: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One more, sorry for the multiple followups: CXT_PINCFG_LENOVO_NOTEBOOK
in conexant.c.


On Sun, Nov 15, 2026 at 8:26=E2=80=AFAM Sungwoo Kim <iam@sung-woo.kim> wrot=
e:
>
> One more, ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE in alc662.c also has the
> same issue (missing .chained=3Dtrue)
>
> On Sun, Nov 15, 2026 at 8:23=E2=80=AFAM Sungwoo Kim <iam@sung-woo.kim> wr=
ote:
> >
> > The fixup specifies a chain_id but does not set the chained flag,
> > which prevents the chained fixup from being executed.
> >
> > Should chained be set to true here?
> >
> > This was identified through static analysis and has not been tested
> > on actual hardware.
> >
> > Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index 96fa8c2782bb..1be2e609c28d 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x1e, 0x411111f0 },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_CZC_TMI] =3D {
> > @@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x20, 0x8000ffff },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_CZC_L101] =3D {
> > @@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x1e, 0x411111f0 },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_LEMOTE_A1802] =3D {
> > @@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x21, 0x03214020 },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_LEMOTE_A190X] =3D {
> > @@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x1b, 0x0201401f }, /* front lineout */
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC256_FIXUP_INTEL_NUC8_RUGGED] =3D {
> > --
> > 2.47.3
> >
