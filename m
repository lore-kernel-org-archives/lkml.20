Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A0642A149
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823920; cv=none; b=c0T5u86XaZALFVfGs0OUTxI4Dx2VeQ/KPWoHxI9XLkcr+kIeZbvV08xzaXzvjt+6glZdH4tiKYZz5HENWy5lOfWfSVAkDbZY/gg1imGWpN/ZUHm4GaeEkytD0Ydqul1wZF+AvAxpU4TEz5G+AI++/zBt62hxafn2Onvhdsrsujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823920; c=relaxed/simple;
	bh=4tBaPgo2GIWAifI6EmP16VvhsBhMsaJ899ZFngZrVCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfSeJw2zIAlHSXTsLyPBrda/5RK1h++iDAwcj4akgHXxTtmxub7rObUT76as3nmDs9c8Sp4XE/griJmuzx5hGasoy7Q810W/WVhYsizonw8DHUiEYL/fNTBwcroqFsPOPxFq5zdct96PVXFEjXa0pE0MGeSTFQGSgEaFnDWJ3jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NORkB91C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NORkB91C"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6efd73032so7389945ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787823918; x=1788428718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vM0/L21f9tot3vpFXvyjlc2gt/uZgvIf/L0mZwOnhSg=;
        b=NORkB91CuYbrBoiXuunNhCr/q+tRrbYzBGS2xP76wMyPzZjq8l3R7nUo87JdnYCNAa
         7oD9s6Fkhge2SlOCYOE9WKPTmsMkN/YeEmQD/taK2TpMe3zni3Bg1jCC3SCKuyV4PjT0
         XxldHn/WEbSp6GzB/Intm7KY/6OFDxRn7OEAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823918; x=1788428718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM0/L21f9tot3vpFXvyjlc2gt/uZgvIf/L0mZwOnhSg=;
        b=lVi7J68zwCgrvOJn5e/Z8hL6WqFzqnyFIUfaaRMp92LGNLwzPdv6MTj71NgEJVrfLm
         6ijEhd8AzpPo0+LtbwUpjFIricbMsH/DEZ28YZXduGnMAjYiHWdxp+CuxeeGpoZhVwGA
         UyP7hY/mzEUjohXC/2TgyKrOUB6MjRc1fRwO2ByDK9JORVvgw36LqQDEWbabXM7lz9sS
         WqDO06YmuPrzKjhTz+YUlzLW1I/d+LjFjPDmVy7tBtJhjaShMOg3ghXpPCo+PP49hul2
         xBlrtE11akF7ldzq4bHpPGV+gZIoVhKVULaQe9Z9qtVukL3Zhmpu24m9SA2DdCIz1mPZ
         ZFog==
X-Forwarded-Encrypted: i=1; AHgh+RpHw9aM4rF+j6fnShRyq9ftocprKDQJAtDp+uD2MFQCd68bN92OEt9wplhL7OhBgeLVCn4Zb8JTiU+tkj4=@vger.kernel.org
X-Gm-Message-State: AFuF++mqeWHihld2AAsmeZ7cTbMNYZmi6uFyVgnEpNCh3b+9HiNpviv1
	l6ZtVhCzkEEoyslexk9FSNLGWBEqUYEDhdbkkLom2rNRhAAOh9FirdX9eEQ4ccKX8pTESqDU7xU
	OxmVtXA==
X-Gm-Gg: AR+sD12ZxDuvnHESvJ03kjdccnC4kQ4DjiP6GPUO6Q25NkGVO66o272S1BVjHxRBgA/
	UYVo91qZQJS6rDGZSgr7IFNc6H7cbRwCuOlL9N718Ppel/bhzqPBMJlWgzvqflOVA6JAG/6tti3
	Wic7IADrUWkhwLu6Zhz1UrAUceb8Xoo5LMMAkqPbYhgnXKucPflvpXcYJ9c37G0Wwp9IJVzdz6Y
	4hrlzB/CzSHock2t2dxExPyRXoNaLsXpKl/15dHvpkO1XjYchnglznLZY51c5a2BE7F+ZWnT+t3
	yFtHoq7dhYCDqRk5I17iFzKVos640/jVmEi7JGf39aiQAJ+4lrFpYb+mWwYW5lIAxK3QswTtx2R
	OzTGWg7JjB/Tru/E99H5aPgc3tkBqKpkFuizo6ZX80wJ58QzyxY54H33YjoPRrurJLnLRKq6BRT
	vVLsxZ21DocufL0JiGnR85nGvsHYVExdnQm6sP3vZpg9apjjWla+1j8HfmahPMQ8EB5R02YwkAs
	SsijKyHT4x5Zh0Lghc0Aj0Xsw8bZw==
X-Received: by 2002:a17:903:3503:b0:2d7:2ed9:62cf with SMTP id d9443c01a7336-2d72ed96378mr50084955ad.10.1787823917735;
        Thu, 27 Aug 2026 02:45:17 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498d74asm15068685ad.29.2026.08.27.02.45.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 02:45:17 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso629719a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZ3dWMSKtPteB299fI1/JWam/BfMqTAzngFAE/0z0ct9dT55zYkzKkdgA66f2rE42ux4Z22dZzUqIbUqY=@vger.kernel.org
X-Received: by 2002:a17:90b:5281:b0:396:4ce0:6400 with SMTP id
 98e67ed59e1d1-3969ba3a303mr7718113a91.2.1787823916368; Thu, 27 Aug 2026
 02:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-hid-ff-input-configured-v1-2-1dc9bbacd88c@gmail.com>
 <20260818120428.2546810-1-ribalda@chromium.org> <2a757d6-c09d-c16c-43df-fe8fab3c1b2b@inria.fr>
In-Reply-To: <2a757d6-c09d-c16c-43df-fe8fab3c1b2b@inria.fr>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Aug 2026 11:45:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCubAtxPLft=YF4Cq2aAO9c7ZEe_gYmvSQ5yT8UxGzzSEA@mail.gmail.com>
X-Gm-Features: AcwNN1Wg35VaoCPidKcyTWNXMAGNl7vbS8U51ZtBOmn-f-e6hSKjRXwP7gyXSqM
Message-ID: <CANiDSCubAtxPLft=YF4Cq2aAO9c7ZEe_gYmvSQ5yT8UxGzzSEA@mail.gmail.com>
Subject: Re: HID: add documentation and Coccinelle script for FF registration race
To: Julia Lawall <julia.lawall@inria.fr>
Cc: dmitry.torokhov@gmail.com, bentiss@kernel.org, cocci@inria.fr, 
	corbet@lwn.net, hadess@hadess.net, jikos@kernel.org, lains@riseup.net, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nicolas.palix@imag.fr, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[In plaintext this time, sorry for the previous HTML email[

Hi,

Just a heads-up that this this patch has landed in Linus tree, not
only in -next:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/s=
cripts/coccinelle/hid/ff_race.cocci?id=3D225c30812857f47cb42bfd945a15f448f5=
8e82cc

We should fix it before -rc1 is tagged

Regards!

On Tue, 18 Aug 2026 at 14:08, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 18 Aug 2026, Ricardo Ribalda wrote:
>
> > Hi Dimitry
> >
> > Looks like media-ci is not particularly happy about this patch:
> >
> > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/1081279=
01
> >
> > /usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file /bui=
lds/linux-media/users/ribalda/scripts/coccinelle/hid/ff_race.cocci --patch =
/builds/linux-media/users/ribalda --dir . -I /builds/linux-media/users/riba=
lda/arch/x86/include -I /builds/linux-media/users/ribalda/arch/x86/include/=
generated -I /builds/linux-media/users/ribalda/include -I /builds/linux-med=
ia/users/ribalda/include -I /builds/linux-media/users/ribalda/arch/x86/incl=
ude/uapi -I /builds/linux-media/users/ribalda/arch/x86/include/generated/ua=
pi -I /builds/linux-media/users/ribalda/include/uapi -I /builds/linux-media=
/users/ribalda/include/generated/uapi --include /builds/linux-media/users/r=
ibalda/include/linux/compiler-version.h --include /builds/linux-media/users=
/ribalda/include/linux/kconfig.h --jobs 16 --chunksize 1
> > Position variable r.p2 on line 20 must be attached to some other token =
using @.
> > coccicheck failed
> >
> >
> > The following change fixes the issue for me... but you probably want to=
 double
> > check it, I am not proficient at cocci.
>
> I would also like to improve this, as suggested in a previous mail.
> Could it be detached from the documentation change?  Then I can take this
> part and fix it up.
>
> julia
>
> >
> > diff --git a/scripts/coccinelle/hid/ff_race.cocci b/scripts/coccinelle/=
hid/ff_race.cocci
> > index 479f5d1e3184..7cf84936db13 100644
> > --- a/scripts/coccinelle/hid/ff_race.cocci
> > +++ b/scripts/coccinelle/hid/ff_race.cocci
> > @@ -9,7 +9,8 @@ virtual report
> >
> >  @r@
> >  identifier probe_fn;
> > -expression hdev, flags;
> > +identifier hdev;
> > +expression flags;
> >  position p1, p2;
> >  @@
> >
> > @@ -17,7 +18,7 @@ probe_fn(struct hid_device *hdev, ...) {
> >    <...
> >    hid_hw_start@p1(hdev, flags)
> >    ...
> > -  \(input_ff_create\|input_ff_create_memless\)@p2(...)
> > +  \(input_ff_create@p2\|input_ff_create_memless@p2\)(...)
> >    ...>
> >  }
> >
> >
> > Regards!
> >



--=20
Ricardo Ribalda
