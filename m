Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4235292A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508428; cv=pass; b=g/W7tMbSx5vc2/Y2WPp5zR4K8cied2Ced5rpxDa2duwp0uPRkwwn4tjtrE+lEdPsZg/hrNoC8/hYuMHTzu+bZdzx1nlpsA24BF3nQSn2u+bt8lwhGt6OjyBnbvqwSRKCiCmeAJsgxq9CeCOTvkFzJRPIiHhytIVifnvzeAwesqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508428; c=relaxed/simple;
	bh=B4rm2n9bkZJZbYTVAiewnOQ5BwSCBdnF2JacTEh3hM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAmkqm4PabHlGF40Jr7oS/SlP12WeyjLOF5AaXMIymQ6AHVn7fotc1QAAJukuLVpni9lTuMNLI9N3zsNW4sHdI6X8k5KBxRf53PzyZosYvgP0AkvnVowruw9toK88oVsWR9mD2fKw2M/Y/YCVH0sMBOzPzRcEBfL+JbQRdkI4dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Qf5rLs7Y; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Qf5rLs7Y"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so2787995ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508427; cv=none;
        d=google.com; s=arc-20260327;
        b=Cc7trxEKcGNXeYwrlidPawuKOEgGcvoS+ej5GYvjo4hrC2w2XsBo1iuOee28tu7a0v
         aMnD/tIgRlb0fuJxwu2z7FHG1roa47+HlRubL2QZwm6imNW7l29bCDTbkXZ7Jl3pH0QK
         A6YS6Cc3YmjamBvgtskNfUb84gx+Q0OLhkL2q9wwxmFkbpd6+JkhAXdL1VuNczkqLRmx
         GnJAY++aJR1AV9hBE9c28UJAEbtnC0K65bHn4d81FaMvUlMVxP07hYFGGTsNcUJ/gaS3
         pKMdaMusupzw6OrhrDxA4f9mp+RSisardHTQVIr/PYMSbhGw31ZWh3+TADBLumnhPTGQ
         Wo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tf2DDHiSLUuWU4s6Fj0OpIRO1A/JoEg2bToB3dREFOs=;
        fh=bhTHjtbF1tRxKXT+TkdF8HKUtrw4sMW6HQ8uTy0zY4M=;
        b=Tj2wzpRqhGyGkhZvwm7cpW9dELnvuOwZcsaNwunKXkZoGJxRbnQUGUIQE5D2uVlceu
         tnWzoHJIbFuaORyatwygFfJRcTmuF26n7I8U8w8bOjcSnL2icUOxquN53UAoQGb/aXYn
         jAc4S4XGGzKjC4A2HsXSscP3yHIYr/s2J6TjYS905QvJ3ahohClqd31BBkjVPZ8ozq4y
         cdhyFMWeuzeZSuxzNuR8t8LyWURe4d5pwpTdfw9e8Hprnlj0kJWfNrz7etmhcv0az/pG
         w9ZfbWiCut87ZZLzS9weQdiEFa9KtKORWrZSmpZ0crSdjSkOlY1uZ21nscCbGpYYdpX2
         M56g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789508427; x=1790113227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tf2DDHiSLUuWU4s6Fj0OpIRO1A/JoEg2bToB3dREFOs=;
        b=Qf5rLs7YgypFzjotuw1km2vr38WPeBwCSdKt9JpkY8JwPbBrf4B+fSWQllPhY8rqhl
         q1Lt+sJCRiehPT5ToA1MW/13hInq02t+HpUbvXNVAI72ComrivyepYsKAZYuctw60M2r
         FeoDSwsj0+SfWdlk1203ERYxXYbukUUM6TTIC7x9H0GzGcKTnQc0QEmQC6lAaPaptP80
         BPRZDH621h+nGRMTOlbmMKoSCYIxXFywKqv9vXoshu60Ype9eLAdMo/tqG9l6eqkEGCS
         HBl2ws018B8ndrWt9OvpM15cS8X0BbAi+YUuAPj+mL/0OYtuLrp1Yv9Bra9u1n/36mSj
         ObsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508427; x=1790113227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tf2DDHiSLUuWU4s6Fj0OpIRO1A/JoEg2bToB3dREFOs=;
        b=sKQvZO+HAHu3/svmsXlUufW0apGjavkxAgHD/ej197hv3BJfsbupXySYLeZ+NgUwWB
         Tjklbw36p4GjxYbDeglU4UdYndHo9AA0DkYyoO8aDQR0+gH38cTrhT4//UAvEnvEgjDe
         pO98/ts/LJ4lgGqQw/ViWFqJqMjiWlfHoqP7OV8mBL+VdV2ZNIG2Vwr2Zkgfc9xrBy1P
         Up1dkgPWtldvizyidNrFN2wIQsN2WiTJTwwOqChFx4iDHp638jAiNlQs44dmWX0DHHLm
         o3jvzEzRO3o/aRWmHh0H0mW8R8i9Movzdn1JMR25fEpEFMU6q0WJdFf1Dc4jFMs2UiAF
         Izqg==
X-Forwarded-Encrypted: i=1; AKwUvBwFluDMUSvhTloQr2tblkbkpgGc+/7UoO0saxhWVIcsyhSUT5lktjME0RgM4UGrd/Y14yPxA16qVAHpdi0=@vger.kernel.org
X-Gm-Message-State: AFuF++kSjAZlzejr/HpCHh8vUpa/9dmFE6xuYMKcarVUfqwDDz/Tsvu4
	L7iI1JEqlZFdf2k9jLKc/o3hzh9IS42gHY6bZF5N/WWjb7yFlGQpkQTBDViMNX6dOevSDfEy0EY
	61Vf8zzfEIbfsJ9xOSehxKntkCWw+2MPCdnIFe/dc
X-Gm-Gg: AYBFou0q5veybsto0ONTHc+7HUitBv4jtTX5FrtctfJHN6ofZ422PVhD2hsOs5M2Zr9
	D3ByPs1WcwSgLWNHK6Mf7i4gQlOE+frRd/G2IJQVEcX364rd0uM87ssILhts5toeNzS+oW25k2h
	bS6jPyRgNp6nYOrA9EJstRbrAcjAp8bQPrRsz/khWZ7yTTDH5tKT5hXVIFc3bZZDGfdgxMk/gHw
	KS55RK02FZZkIqDCkBay+rf7t1vJCreQ7GoJtvMaaiOR9gVKbvSBgxtbDC4Lg6yzb8rsKtcR28k
	HQcvQIwJtde2NSc+6LgvCyiVePJ9ozwkSXg4PeBM9iCUyvbihoATNFzFhnZA1uPbDZPLGrGsHby
	3lN8vaDJQ1FU=
X-Received: by 2002:a17:903:1983:b0:2d9:4871:393d with SMTP id
 d9443c01a7336-2dd8e77e51fmr2057485ad.21.1789508426906; Tue, 15 Sep 2026
 14:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915195728.3519469-1-arnd@kernel.org> <CAHC9VhQwkwrEgnuyP-u_NJxmjgy3Zp9XN4cAqCMqH3ugV+jrsA@mail.gmail.com>
 <5a285431-9b60-4d87-87c4-a5b52021ea65@app.fastmail.com>
In-Reply-To: <5a285431-9b60-4d87-87c4-a5b52021ea65@app.fastmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 15 Sep 2026 17:40:15 -0400
X-Gm-Features: AcwNN1XFRHlUUDTBceDCE7_aMUsMY6ed2e061kcuq0vG9XSfwVJaXL4EmZTGKQY
Message-ID: <CAHC9VhQH16yo-w1kGDTyQw5S4a9+04NwsC6Mmp1LP_X_kti6Aw@mail.gmail.com>
Subject: Re: [PATCH] selinux: use explicit 64-bit division
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Tue, Sep 15, 2026, at 22:36, Paul Moore wrote:
> > On Tue, Sep 15, 2026 at 3:57=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >>
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> On 32-bit targets, the division of a 64-bit integer by 33 causes a
> >> function call:
> >>
> >> arm-linux-gnueabi-ld: security/selinux/selinuxfs.o: in function `sel_r=
ead_class':
> >> selinuxfs.c:(.text+0xdcc): undefined reference to `__aeabi_uldivmod'
> >> arm-linux-gnueabi-ld: security/selinux/selinuxfs.o: in function `sel_r=
ead_perm':
> >> selinuxfs.c:(.text+0xed0): undefined reference to `__aeabi_uldivmod'
> >>
> >> Replace this with an explicit call to div_u64() and div_u64_rem() to
> >> annotate that these are potentially very slow.
> >>
> >> Fixes: fc68b6a45f16 ("selinux: convert selinuxfs inode numbers from un=
signed long to u64")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>  security/selinux/selinuxfs.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > Thanks Arnd.
> >
> > As sashiko pointed out[1], since we don't really use the full 64-bit
> > inode space, what do you think about the following fix instead?
>
> Ah right, I hadn't checked the actual value of SEL_INO_MASK, and the
> description of your patch made it sound like the 64-bit space
> was actually required.

No worries, selinuxfs is a bit odd sometimes.

> Your patch is better then, you can treat my mail as Reported-by.

Done, patch link below.  Thanks again!

https://lore.kernel.org/selinux/20260915213807.481355-2-paul@paul-moore.com

--=20
paul-moore.com
