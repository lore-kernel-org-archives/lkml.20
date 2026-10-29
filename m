Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309560;
	b=ccQ5rXOLTm8UwCyQTTJhKxjPpEyQi9RpRzzXBN8Ha4LqQFFudJk33GhpFQO6V8XG/UbP
	 NdzfXhfY06eAG3xQ8bSJjeeNcWtKA9ekNM1vxoMq1XIasynXDRIWrrjN2V/DcWqpthPX1
	 gVtA+Vzrw8EH4DAeWbEnl6VXs17HSXPRnnFPT4kknDiKkLyE2OmImD+vz0bAZtV/C7hlM
	 KVUTtZp2QKc2tq689hcr7Rp/20UbRz7FE0ZgQTBUHpryG9c8em7wJcz1uHyWBxtU2BNij
	 VihqIy0QGHqiOuyUpQDjpE7Lrvo/c11W+817mmg3GyGs8cefqKi6cVAs7e4IPGa+8RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
	b=tnd8LllKGuB6vDNiSOnwKJLF+T+wVfwo79aQTQV3/U9aP3ZiFDGsw+Oo9uIcTYhPM9dE
	 ppx2dQ3EtY/9ixDyXIjE53Q2Q2rYfQEOhFKZWlPNoiw8GvLRlmCyoZLoQqkt5HhhAiJxR
	 5pZ0RnahG7Ytm9AoUpsxzUyh01o8M9lUiNuhxVIccX5PmQk7KflcoWWKlNQNXyyEoKVA4
	 srEOczN2+iFDCfsrLIHfHocUdDCStYMmisCEzQm/U2TQ9I7xRhO0+C60PC+14jl+f1YLl
	 s4y+JakRcMACVDeDSWbBosZHiNHyYPJrolRsqlFbCJLSn+ReiPCgmX5NOOGcDzbZ4tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoH5oROd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4326C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4326C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoH5oROd
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91befe703c4so680326d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309559; cv=none;
        d=google.com; s=arc-20260327;
        b=E5WZ/810TOVXEzHYu45QL/fEV/yRz5rQVQofktvfmdQ5sPqisSohYaY3Zawd6gbtTb
         xelw1PpLPC3+UMlMDCxUlhPF4w4E2u6GXJD/Ix6iaRGTJ/Mb36TRYbL1W1YXCtrGCKk9
         iUr3SfRczkBVBaitjYlNFpPoZBDL9OzBAD2lzzawhbvqCY+2H+oMoW9nehjb1kGoPItK
         eadYR9+yumKjjOL8j2VDciGYHOr0XC7GHoSByf4Bwjz22A3Df+37YxGZqP7cCE1oBKty
         EoreiP1dcuzWHH0qq9OPZfJazVqw0jPIGXfK3rMkHQZi2zjKoPi+QDUlvi51V82MD88S
         S+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
        fh=CtTEfpZC0e86PyWd4PxpAz6QkyZPMgP1gtY5zq+DEaw=;
        b=OBTT5drIgzUYnNGWC1ZGA33hgrXItEc5XLv2SpcGiJ7Zb+xcHOPMtqiZJvEBV7poSX
         dpggY/lAeB32qa7bQx3gFeaIYydS0/86ve034KY1t9DZ4Q5ZXpZz4Z4bFop0daODBIre
         x9xvWatBYVIeH+nZmAjIEwnlowsqEYWgBU4RnSoSkfm91P4g2t8oSnPgi2iPsX5hmhkE
         O/qVlHbAFSbK1Iopyl9jCT3gfrzTf2d/9+5dEEvvOCNYlpniGIHdnbXZMZUGcBHbACLo
         qVflfOd+ftRMu5M6Hjo8X/JJWBH6wl+OrPfyuphTt8z1ASQpzquA4ldmrCZRK+3bVkan
         S1oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309559; x=1793914359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
        b=FoH5oROdV9+WJ5k6hA261DYMVshQPYVG4ZphwjWrjafAlLgBGbTRQvjMzeEUENl2/a
         K8hqasjWw4MrkgTPC84fv7iF/1cmXraW+DodC2nDPnia99A4DLC84vnLC1wvE/6nVGuY
         QAbWy3zkdAk/BcAJ+AD725GXyicOOTA/sLPZJNae8fJc9iAdXMMrm+0x0so79kCeTUoO
         A8olktc/t2snkr0xQpDTFU0AHGTKFCVsnmFtCiNUe8xW8v3q4IbKfKYnBirGVeoqOxjD
         Ech0i+SX2DtvesuIBzofFJXlE9F6LEAxn96ZnamJtSsZcYcxcrd83GokVvNnwsK2wLXI
         bk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309559; x=1793914359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
        b=yXpyQjmiPLazCzfOrTgLNNDDk2Xq626FPmOD6OCh4P8n1GbZBNcDXFLF0+iBBNZqSN
         xtw0grhEFTr4vMRGS/ollYEv5XDtcbzBL1fVP11cksMPhZKEJM0DQYWlJU3Bm5bb2g3u
         20mYqZ4exSwILn8H3zOfXYHixyUaJBEayzttsxyaz85lTPHAw7PMEpltW1i/w9CSxONz
         xgIG69AC+GY1pUUsbczK/NEul/48PcZroZCzUujGPI5E1hkJoUtcTqkqvpMoOetjWYFX
         wTnarloZahBIBmWkcX2HMJKwIKb6oXv1LaGuQIEbBvHp0q4pq1Y2SatKFbh9R0T6ZWr9
         F1oA==
X-Forwarded-Encrypted: i=1; AKwUvBxnctAA4CmNrAXZ7WVGwyCjmAAbi+Uby0VTXjaNmBFjS303mtdOvHUAyl1MraznCFBKD21KxhS88TsgYyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ135F1bt9PiQIaHSGHriaO4SkEx9v595mICEQm+1sJ5Oo25J/S
	RgUF45TO9mCFnBMsyNsb1RrR26uW81jjZGvOfJZ0Zd5UhBz+8UO6V4KDle+7K2gi55EUyj2B5Vz
	lZym9TeyflE/ExAahDdPTYL0JH+MukJM=
X-Gm-Gg: AYBFou2Cd+VD/aKPSOFWuwxQ7UNrXehLdjWr37D/tCzfaufTkdN2gJJ2H/cXTtShbfW
	iIB8yvdSX1CPDLs00Dr3ODfgCzq6H1coJM6xr4JXEienjKOmmPV0Ypm9td+92IhIC+Oh2/xy6lj
	5ht5UMScDS5edACJeA4UJP0aKTezZ6FKQUNIxvd6cEN8WOLN5e7BYMdGcut6bM/JJhyU2JPW2iD
	847g7FT01n1ECYq3WXP3EHO/gplxsZOs0wUeqBh7ZCU755utegZNqUo9NT0v4XYwEZCAeiefMMp
	c//pHSfybZfkNLXJ9s4BXli0gKOnRpPAUBAfGB4Z1lyaCqrqYwFc8AC8nBjimK/xc111ufZGe8K
	B6QTYHNZabhv2K+Tak2tvKK8LdaybhYUVe8cjiVGbyAMxIOQCpiD8oQewkA7GESpN8cOB
X-Received: by 2002:a05:6214:1d0c:b0:91b:5d3a:4fcd with SMTP id
 6a1803df08f44-91ca4c29c9bmr3565326d6.58.1793309558970; Thu, 29 Oct 2026
 14:32:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
 <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe>
In-Reply-To: <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe>
From: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Fri, 30 Oct 2026 03:32:27 +0600
X-Gm-Features: AclHuK-li7Kz1CGiaWPIm5jwPJr-xw07xpCpyrsNv6RaBX_PUzDNGTbYN34Uo0k
Message-ID: <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in tablet
 mode; EC expects VPC 0x2A with posture data
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Andrew Kallmeyer <kallmeyeras@gmail.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Swapnil Devesh <me@sidevesh.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
tablet mode; EC expects VPC 0x2A with posture data

Hi Rong,

Thanks for looking into this. I ran each case on the 14IRL8 (82YL,
BIOS LHCN30WW) with my userspace daemon stopped. Commands were sent
through acpi_call as VPCW 0 <data>, VPCW 1 0x2a; the EC cleared VCMD
within ~10 ms every time. Keyboard/touchpad state was measured by
counting evdev events from the internal devices (AT Translated Set 2
keyboard, ELAN327E:00 04F3:327E Touchpad) during timed windows while
I typed and used the touchpad. Backlight state is by eye.

One observation up front, because it affects how the commands should
be used: the commands set the keyboard/touchpad lock directly, but the
backlight only changes when the command agrees with the physical
posture (details under the 0x08/0x09 cases below).

> What if:
>
> - 0x0A is not sent on start

Not needed here. Fresh boot with nothing sent since power-on (the
previous shutdown had sent 0x0B): folding alone left the backlight on;
0x08 while folded turned it off; unfolding plus 0x09 restored the
keyboard (19 presses counted) and the backlight at its previous level.

> - 0x08/0x09 is sent after sending 0x0B

Both still work. After 0x0B, folding alone did not turn the backlight
off, 0x08 while folded did, and unfolding plus 0x09 restored the
keyboard (34 presses) and the backlight.

> - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times

Harmless. 0x0A x3, then 0x08 x3 while folded, then 0x09 x3 after
unfolding (0.5 s apart) behaved the same as single commands: backlight
off while folded, keyboard working afterwards (18 presses), no flicker
or delay.

> What if 0x0B is sent when the keyboard backlight is on?

In laptop mode: nothing visible changes. The backlight stays on and the
keyboard keeps working (27 presses afterwards).

While folded with the backlight already off after 0x08: the backlight
stays off and the keyboard stays disabled while folded (0 presses).
On unfolding, with no 0x09 sent, the keyboard (24 presses) and the
backlight came back on their own.

> What if:
> - 0x08 is sent when unfolded

The keyboard and touchpad are disabled in laptop mode (0 key presses,
0 touchpad events over 10 s), but the backlight stays on. After one
0x09 the touchpad and keyboard were back.

> - 0x09 is sent when folded

With the backlight off after 0x08, a 0x09 while still folded
re-enables the keyboard and touchpad (37 key presses and 3798
touchpad events while folded), but the backlight stays off.

So on this EC, a driver that sends the wrong posture would lock the
internal keyboard and touchpad in laptop mode, while the backlight
depends on the physical posture as well. Sending 0x08/0x09 strictly
from the posture reported in the YMC event looks safe; 0x0A and
repeated commands are not needed but do no harm.

I also tested unfolding after 0x08 without sending 0x09 (0x0A sent
before, no 0x0B). On unfolding, the backlight came back on, but the
keyboard and touchpad stayed disabled: 0 key presses and 0 touchpad
events over 10 s. They worked again after 0x0A + 0x09 (sent together,
so this run alone doesn't show which one was needed; in the other
tests 0x09 alone was enough).

Compare the 0x0B-while-folded case above, where unfolding alone
restored the keyboard. So once 0x08 is sent, the EC keeps the input
lock until it gets 0x09; after 0x0B it follows the hinge again. For a
driver this suggests re-sending the current posture on resume (the
posture can change during suspend), and sending 0x0B on remove or
shutdown, so a missed 0x09 can't leave the internal keyboard locked
in laptop mode.

> An acpidump would be helpful.

The compressed dump is ~390 KB, so I'm sending it to you off-list
rather than to the lists. The MSDM table is stripped from it.

Thanks,
Mahir

On Thu, Oct 29, 2026 at 11:18=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Hi Mahir,
>
> Thanks for the report.
>
> On Thu, 2026-10-29 at 03:21 +0600, Mahir Faisal wrote:
> > Hello,
> >
> > On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
> > laptop is folded into tablet/tent/stand mode under Linux, while on
> > Windows it turns off. I traced the difference to a VPC command that
> > the Windows YMC service sends on every posture change and that Linux
> > does not send. Details below; I'd appreciate your view on whether
> > lenovo-ymc/ideapad-laptop should send it.
> >
> > System
> > ------
> >   Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
> >   BIOS:   LHCN30WW (latest)
> >   Kernel: 7.2.11-300.fc45.x86_64 (Fedora)
> >
> > Symptom
> > -------
> > When folded, the EC disables the keyboard (no input reaches a VT) and
> > SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
> > backlight, however, stays at its previous level. Writes through
> > KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored in
> > the EC (KBLS reads back the new value) but are not applied while
> > folded, so there is no way to turn the backlight off without
> > unfolding.
> >
> > The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
> > "EC Notification":
> >   "Fix the issue of keyboard backlight is on when turn on in notebook
> >    mode and change NoteBook mode to Yoga mode."
> >
> > The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
> > Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.
> >
> > What Windows does
> > -----------------
> > The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
> > ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
> > buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
> > Management". Its handler for that IOCTL maps function 0x0C to VPC
> > command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
> > data byte, using the same VDAT/VCMD sequence as write_ec_cmd().
> >
> > Values of X observed in YMC.exe:
> >   0x0A  service start
> >   0x08  posture !=3D laptop (tent/stand/tablet)
> >   0x09  posture =3D=3D laptop
> >   0x0B  service stop
>
> What if:
>
> - 0x0A is not sent on start
> - 0x08/0x09 is sent after sending 0x0B
> - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
>
> >
> > Current Linux behaviour
> > -----------------------
> > ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
> > for models in ymc_ec_trigger_quirk_dmi_table. Booting with
> > ideapad_laptop.ymc_ec_trigger=3D1 on this machine has no effect on the
> > backlight.
> >
> > Test
> > ----
> > Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
> > followed by VPCW 1 0x2a, then polling VPCR 1 until 0:
> >
> >   data 0x0A, then fold      -> no change, backlight stays on
> >   fold, then data 0x08      -> EC turns the keyboard backlight off
> >   unfold, then data 0x09    -> keyboard and backlight work normally
>
> What if 0x0B is sent when the keyboard backlight is on?
>
> >
> > I'm currently running a small userspace daemon that sends 0x0A at
> > start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
> > reliably so far.
>
> What if:
> - 0x08 is sent when unfolded
> - 0x09 is sent when folded
>
> >
> > Suggestion
> > ----------
> > On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
> > is anything other than laptop and 0x09 for laptop, instead of 1. This
> > might also be worth doing outside the quirk table, since it matches
> > what the Windows driver does on every model it supports. I can't tell
> > whether data 1 is still needed on the models already in the quirk
> > table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
> > that hardware would need to check.
>
> There is a chance that the 0x0A[start] =3D> (0x08[fold] <=3D> 0x09[unfold=
])
> =3D> 0x0B[stop] sequence is generic. Derek, Mark, could you confirm if th=
e
> sequence exists in the documentation? If so, I think we can replace the
> quirk table and the module parameter with the standard sequence. I will
> prepare a patch once I get enough information.
>
> +CC Gergo, Andrew, Andr=C3=A9, Swapnil
>
> I believe the quirk was concluded by trial and error. Could you test if
> the above sequence works on your devices?
>
> >
> > I can provide an acpidump, the disassembly excerpts, or test patches
> > on this machine.
>
> An acpidump would be helpful.
>
> Thanks,
> Rong
>
> >
> > Disclosure: AI assistance was used to troubleshoot the issue and draft
> > this email.
> >
> > Thanks,
> > Mahir
