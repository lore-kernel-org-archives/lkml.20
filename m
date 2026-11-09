Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241440;
	b=iVQbO07PKkYz3GAuqRv4MshOWuRLAr8487Ym2sE0JlSQMicSdTesj3sBgfKHERs10ESe
	 zTITvexYtvOU350HVBCrAn2VQ3pidFtP+XwiQrEOwm5VAlVbwmYgAoIFuf3O+1PpN8C9W
	 eS5wH+EFtPw+VMNBWt0/Kc2z7tlMN6FOADGqRzxLFF5UMj6uYxWLookeW0vBk8v4PBQsj
	 HshWRqkuncavVTkPwJZPIyWDCH4oeuKCzijgB2mYegED1dq+bP48VETFO+ogbsOHp99il
	 sPfB7oweX70abTOfoYmC/AuTINu0yG1K0OuFzF6a/fShlYcyK4WO2iuQdFbxMi5secg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
	b=SlqmNbQ7Z/bnZ7gC7HeI1vlGoFIhI2CpGh3Ffu5kJPinjjjiP0g0ANMmXe/Epzdzaw6U
	 5uRGgI8rwD2IUJrDorge7dR0iGbbL33zMwioB3gcfLp57YFZycA9S2GP5+SOuzQO6Rso4
	 F5glx3GnCYWlpTtBZ68jxN3GlJ+J5fEpsEi5u4L6bRCFmc6QkPinlvxvDpkklSwhBzgNg
	 T0Jl0uiVoxRayG3QhFhRUsq5DoLulVDgxiMVGJqLhlzbGlZWwt2pIb2W9IEcZRtVhHW6K
	 3sYOYeziUIBDCUg2Wv09QIHs4CSUKQVtSw1kR6/KQ7nSUVl7hJM5uWBSwCZDbfxo1ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UST4gphl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F63606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UST4gphl
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso293345137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794241439; cv=none;
        d=google.com; s=arc-20260327;
        b=pZrRHMjm8mcvy7msp9G6nnStJ6OSW7jqTZTJ5TtKlrflrO8nVDPSxH74rA2Mqq7AT/
         35bqVK7ruW0LTl+a/JDQErWyFYJQddAlVWj66hho4yyinVLknAurrLz0cRLUnA0FEqeF
         kroFOEr7yd2VDBhp/A6Nz/X+dB4ZIIiWtOOHpmOSw7ki/INj+N5cL/K6oiSy/7g289Rl
         VFShmmsYlsatWoo8qjHehJQug0RJPIdHKxA5GvyD/A8IcC7KjZcAwMR3EuJ0FNwDEtIS
         FtIZ9HOppf+hK4Y+R0d8e92GsHbAZUfJj3S8asy6UTAnKpydibeMUdCI1353SoMUnXXj
         0jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
        fh=LopDZj3M4HTpgNMGL92+Kl526C9AvDQGj4uhH47/TyI=;
        b=XMI6VtRjxzQPZFBRNnveiy7e/5UCySJtwVr3p7vFBg+xlIM5GV/As1kYS9JgblnXFj
         SN30HTem723+nccqNqWrDwGaRA92bqPjIGYDeEkzmSSfy2+A3N+g9stbTSEzf3LvnJel
         8H5Za/lBfUoi5odXFhEgDVeQKOZ96VQEnslYpJ8fpVLZ4sfCHpILOxvfLhTJnN41fEMM
         xWrl0QOCsXHziI9DogfYDX+0d0ZofQ1lQKf4BAgF10YvHJThhiriOKB46hGSuuBC030r
         wSG5DqN/x9KkrSRPHt49Y8zyuhhNnp14JBgaAH1vEChgELioy72UoEX9OZH9jiZkpmEd
         lWQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794241439; x=1794846239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
        b=UST4gphlOvD5ejtNgHkUaby8TiPPWioel/rdaHliNbx7NLJQBpY8ELZsZOTVKnxYV/
         jxzwZfWKFxN87xXP4SxHDeDdzrekTy27GwWngL8hJTHxRgbzjNKsQOtJeFYMNky9WCQG
         Ps72rUK3ng9bZyiafnYX1ktnvCvH3ek9XcD2dFJEc8pDtq/GUAoQaI9nAPfdz6uB0q94
         +MiI1kru94LjNDPOQ81EPnuN4GbtKm7y1VemTeTX9rtpem3A7TS9I9h7OnrtksCFGUHW
         6tFdxxhYWZhH6F4GQIIjTUi7BfWXohv6jC4TxX63vG93YF0d7PwBS/ZjH6OxSDlqjakl
         2U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241439; x=1794846239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
        b=FnStJfJjLdW5uFYVWmpcP1l0473v2z3CmBj8k3c/KB6dLydyYS5mmb/mFLaT3kpWCD
         fcfx1p3nVkyecAVHwRYyGHyYQybXLjyma16D+DcHOUCXYEPJufedQQ68cDwoaSsiAbQy
         vaLxMeEZ766oScWWanpDyzF9+X5X0YMpA4AHuMB29Wc3rKc1eeeO+LJBjxncp6CvuBjv
         3Rf5bzNJK3FGU0OC0jCsrUoHmhqrPUs924JVQ6nt9/vndmmQTVRNu7wIfHAD05tN41+f
         yIuf6sgRJVU462Zw/V0mrHA989nux1tPDVWL9KmHRalU2Zkmo+dVSyStv2BzLcJkVLfx
         Mkeg==
X-Forwarded-Encrypted: i=1; AL+hErEofNz3lz9vYlxv7GfRHjhYcRlZMEK5rLyQT1+y64oZc8Dgh7uEEYqVirovN9DIYSMQ6yAieopmpEOuIJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ey7PAZMiTW8+o7o3UWtzDx1YgvUXsaZ1qUM0emAUFue7B3HbF
	M7X54eFRhiWtHgNBMBGT+CWfNTuSMHiUYSsryecRKmnhAwzGdYqpJCY54QUwhIS3P/xXjazI8P4
	io7NrqEof1mgzce3hATL5DocRojSq6/U=
X-Gm-Gg: AYBFou2tIiSDIBHbrEBTH4qoSUyv2be7CmlyTR2/EB/jW94TiUOpLGC96RcDmsDj1YL
	rbi+OFLi7NuX3TYb9i43yyVr7QuEg3IuMjna1pyl3Cvwqpq1ViFGRnVcsydEvesJPR2BsMqtsf4
	ggbamX8kqbflG/uWMQeQsgh70l72YDmDbkjZ0Q6B3AVZcMUxFGF08vhnXsRZLibYXYyeyJyH2/9
	TxdHUii2jyF/KyUUHTHN2L8yO2KZ3n/ObmHlpD/d/gc987HsZ4NXb3VOAAc9bp1B6o3te29Y9ze
	e48emDM/JduyxuqkgDXLNUB+ctLag4DQhhTXfz20r7OMAz1ZlqXkOBX8F9prCsFpwWrvzHvxgvb
	RgBRoByF8E4KJe1tnqm5vW6bg1li+AlSA9TgUTx0=
X-Received: by 2002:a05:6102:604a:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d2db157523mr1181146137.16.1794241434153; Mon, 09 Nov 2026
 08:23:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com> <CAHp75VcP6AD8-vSG-QzxTCWm8RWJG2CQJ=9mrn=3nFGJd2YJXw@mail.gmail.com>
In-Reply-To: <CAHp75VcP6AD8-vSG-QzxTCWm8RWJG2CQJ=9mrn=3nFGJd2YJXw@mail.gmail.com>
From: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Date: Mon, 9 Nov 2026 17:23:43 +0100
X-Gm-Features: AclHuK9_L7g6nQeJqb6GRMpf5wVh4DmYUaeFgBi1z-Yb1qLIeH2stSdKS5uAbfY
Message-ID: <CALAp9RGDV-L6icyq6nJhEA1=4DQuj-UOb-3B_NiUAi1JVTojkA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix MSHW0040 button driver selection on AMD
 Surface devices
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thanks for the review.

On the tags, agreed. In v3 the acpidumps reference moves into the tag block
as

  Link: https://github.com/linux-surface/acpidumps [1]

and I will keep the v1 thread, marked [2] and referenced from the text,
since Dmitry's review there is where the "0 is a valid revision" design
comes from.

On the documentation: if the maintainers would rather not take it with
b4 shazam -M, I am happy to put the model table in a comment next to the
check in both drivers instead.

I will wait for Dmitry and Hans before sending v3, so it can cover anything
they raise as well.

Thanks!
Ant=C3=B3n


El lun, 9 nov 2026 a las 8:10, Andy Shevchenko
(<andy.shevchenko@gmail.com>) escribi=C3=B3:
>
> On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
> <antoniovazquezblanco@gmail.com> wrote:
> >
> > This is a rebase and rework of Sachi King's series from November 2021 [=
1].
> > It was reviewed then, the review was never acted on, and the thread wen=
t
> > quiet in March 2022. Sachi has confirmed they are happy for it to be
> > carried and no longer have the hardware. Both patches keep their origin=
al
> > authorship and sign-offs.
> >
> > The problem, restated, because Hans asked for this in [1] and never got=
 a
> > clear answer:
> >
> > The AMD variants of the Surface Laptop 3 and 4 use the same MSHW0040 AC=
PI
> > device ID as the Intel Surface devices from the 5th generation on. Both
> > soc_button_array and surfacepro3_button match that ID and tell the grou=
ps
> > apart inside probe, by evaluating function 2 of the MSHW0040 _DSM, the =
OEM
> > Platform Revision, and treating a returned 0 as proof that the method i=
s
> > absent. The AMD variants implement that function and legitimately retur=
n 0,
> > so both drivers draw the wrong conclusion, and surfacepro3_button binds
> > where soc_button_array should.
> >
> > The sound test is whether the device implements that function at all, w=
hich
> > function 0 of the same _DSM advertises and acpi_check_dsm() reports.
> >
> > To answer the question of which models are affected, every ACPI dump in
> > linux-surface/acpidumps [2] carrying MSHW0040 was surveyed, 32 models, =
for
> > UUID 6fd05c69-cde3-49f4-95ed-ab1665498035 revision 1:
> >
> >   Model                        fn 0 mask fn 2 advertised
> >   Surface Book 1               0x03      no
> >   Surface Book 2               0x0d      yes
> >   Surface Book 3               0x0f      yes
> >   Surface Laptop 1             0x05      yes
> >   Surface Laptop 2             0x05      yes
> >   Surface Laptop 3 AMD         0x0f      yes
> >   Surface Laptop 3 Intel       0x0f      yes
> >   Surface Laptop 4 AMD         0x0f      yes
> >   Surface Laptop 4 Intel       0x0f      yes
> >   Surface Laptop 5             0x0f      yes
> >   Surface Laptop 6             0x0f      yes
> >   Surface Laptop 7 Qualcomm    0x0f      yes
> >   Surface Laptop Go 1          0x0f      yes
> >   Surface Laptop Go 2          0x0f      yes
> >   Surface Laptop Go 3          0x0f      yes
> >   Surface Laptop SE            0x0d      yes
> >   Surface Laptop Studio 1      0x0f      yes
> >   Surface Laptop Studio 2      0x0f      yes
> >   Surface Pro 10 Business      0x0f      yes
> >   Surface Pro 11 Qualcomm      0x0f      yes
> >   Surface Pro 4                no _DSM   no
> >   Surface Pro 5                0x0f      yes
> >   Surface Pro 6                0x0f      yes
> >   Surface Pro 7                0x0f      yes
> >   Surface Pro 7 Plus           0x0f      yes
> >   Surface Pro 8                0x0f      yes
> >   Surface Pro 9 5G             0x0f      yes
> >   Surface Pro 9 Intel          0x0f      yes
> >   Surface Pro X SQ1            0x0f      yes
> >   Surface Pro X SQ2            0x0f      yes
> >   Surface Studio 2             0x0d      yes
> >   Windows Dev Kit 2023         0x0f      yes
> > Exactly two do not advertise function 2, and they are exactly the two t=
hat
> > need surfacepro3_button:
> >
> >   - Surface Pro 4: its MSHW0040 device carries no _DSM at all, only _HI=
D
> >     and _STA.
> >   - Surface Book 1: it does carry the _DSM with this UUID, but function=
 0
> >     returns {0x03,0,0,0}, advertising functions 0 and 1 only. Function =
1
> >     there is dGPU base attach and detach handling.
> >
> > Worth noting that v1 said the devices needing surfacepro3_button "do no=
t
> > have the _DSM". That is not true of the Surface Book 1, and the inaccur=
acy
> > is probably why the problem was hard to follow. The commit messages now
> > describe what is actually tested.
>
> ...
>
> > On merging: please do not separate the two patches. Both drivers match
> > MSHW0040 and discriminate only in probe, so with only one of them appli=
ed,
> > which driver claims the device on the AMD variants depends on module lo=
ad
> > order. Hans asked for the same arrangement for his own two patch series=
 in
> > 2022, so either tree with an ack from the other would work.
>
> If we go with this series close to its current shape, I really ask
> maintainers to use `b4 shazam -M` for it to make a cover letter
> (without list of files and changelogs) be present in the Git history
> (as a "merge" commit message) as it supplies nice piece of
> documentation (see the part above ...). Alternatively we might want to
> see this be listed somewhere in the code as a comment, or in some file
> under Documentation. The rationale is that it is always hard to find
> people who may test something on a variety of the HW and having a
> technical background provide a valuable summary.
>
> --
> With Best Regards,
> Andy Shevchenko
