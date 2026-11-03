Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793688918;
	b=M7+K+8o4lQYo6ZRqf0707J4rLnwVJoiW8CdfcS4eCwHi86OkF63vhN3FscTPY1nMXt1m
	 DgrA+bKCNMgHc6/7cmlrDkiqP6AMFMiXftQuVLHsNmuod1+FWq1gmy3RMDI6E5Z6xmuTN
	 Icc2rSp3P9su4mqaJkepJ4QXHEfVDWPs4PpDNUvUwh1ecBRt6QL5fCIa8/uXz8Fa9gwpw
	 FDoPXCjWt0IylgrDNjm5/9lzprLiu/Fh6odRfZzlkebqwXmHnFtzq/lQa9kF4AcwVUzpa
	 Vmudmfe+eFP+m/6LHC+xsCpH/neyW8Nk6wF0DIbde1onag8qZSLRmyOx3oa/SyaSeFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
	b=voJrDNOpw7JAdqvkfy0ONsIACgK7HKj1g1qu1ltSYkpHgHstCeOj+/gM7lbPncl7X8MG
	 aH2C4i7Bt8RBnPpqD6YETZIAmdB0/qrtHnyosblkL3E0hotMZVylyUNphuvfSszdEzwZb
	 14q3DmSMsObpWXR8IAJXTQtf/zrGpoi4tmNEY78t8OSdqNo1vpJAZMrpZw7K+Jf8qjtzA
	 7TLxoV7zzWBhX7rknpj5+vmP0hq5E86m9qLsoeXVrma60Ho3s8ZQkdfUHicJshKLe+fYb
	 U2549ALMjn1hnTKz+BWsQSpBJLoZmApBP8d4quuX7ZG109EQefCWihXHQmK5773eRKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4uEeRKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1C606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F1C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4uEeRKH
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91bb5795792so47567216d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793688916; cv=none;
        d=google.com; s=arc-20260327;
        b=csLw2ystKoLgVXvg8PbOAp5dJSpt1elDjdI4ESVPAw84mo9n/+1Mh8Ci9dDR5UwBBs
         /7D4fxa6qST1OklGb1QKIkfgPWABPImhkNxXafN+URPvqspZI1uZWNQOnDIzN70ac3r+
         ueBEG2j26qJ5orUepl0PRKtJFNq9UEt1S31nNaiFKj1RUt2jjDMkEcpaiYEGNC+rlAM9
         P8PTWoDhe4s4kyKChPvXrWmO2WPrjdPgwUJ+MVyJeBU91o8rKbxAPNXsic8Texxj+SCd
         j0BS+p5c3bFqNLll0wAnouC37nuDCb6QhGXIYSBQpuHjqvyzhf/skJwpReifWL20Hxls
         j2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
        fh=fVaE7/xh4er8Rb0hVUXQcY50O864/9aSYdcBgOAN4VY=;
        b=JAD/7UwegsFj4nMAQNEyKa02lireIcJetIJlP2YsYfCBmuveNdiHcN2JJtbs6lZB2P
         4lXuBAm5k9CaHzN7xR1bGnPeek+cS9GOUwN7LUUmVphiJIwf4QxUEHwb9/rH/1wvDOTR
         fq7B+oaKMm+KUi9EAIUuUJK5kgEw5PTrt8vH7tER+caXksv+AUvAYzkdmOSr4goQ2Um9
         NbCjxADgH+XSxEVFhKHPqlOh15+TJXgoyFTQ2PJZAEAYcFokyxD4baS2ueHwbYnLYA1R
         0EpnMKe0U+WfZhSsU1hYCASTwC4Zt+GsykIbAkymB2wm3OI/MBCpxhWJbg3b/ZiM+82m
         DttA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793688916; x=1794293716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
        b=k4uEeRKHTJHxwhDRwJPuJg4i/2Dusuu3HUDj34UlCNSqAiy7vukOXpTVsztDNTNxLl
         5zkwFNJ2fPlT6AhmJ0ikByjXNiq72Cnfu+vwssDFoFmYc4AGeTS3UrovxtEtfK24izT2
         xxlToLBCZO3jearb6CwNxHb3smQiezziHQKKThpqLL61KyebtbZvWompgX71TqnS2KQ5
         nB/mi+0GfMucxRj8gR9fc4lqSeIRNGGn0NIWnaTIKyLPsYA9wvoa1cMRwSRWMiCXsztF
         VylnG54EAhbrMVi2CVDRauM9nsG5dwOrKsUf94cXUnIswsMfLmIiJAFJ5N60/KP5KAMG
         vjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688916; x=1794293716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
        b=RCMXMT8Sg9JhdpWjMgO/k167YjfjCr+DL2raF1k1cTUH5IQ2Y9T1X2IZ4lFdKilfqG
         wK7hCPTJ6zTIJhC9123Iwz5htQkjwKgIo0JwaM8AHuW23JfctzuTiyzoIgwPfs30Al7r
         KHoLD0lQxleb2R8TtkUo5OXok+DfHKmPoymWetTFbS3okmVKCQ8FOBJX6wXcXnsvtOnD
         6Toy7gVApC4shSFe5rSq4dEo7fVb2hZv6pNBf/PIJkJo96TL/teM9UvOvOvQIXjRBf8Q
         HS25ZXe3i27+BVHCutbm2gnKU5vn8XTZPfUxk8qnQ5vx0T70adrgyiZsSOCJH/NCKfe2
         sL2g==
X-Forwarded-Encrypted: i=1; AKwUvBzp336MlDrx3uuFaLY03SNqfh9pFfdeKgtKf1TPZv7+96NGwQXFY5mXOo9p1zU/HCqk71tSyA2wDq4G2Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yqkopQUUSc7ZPuFNJB68VbqFJPy/6HLh/eJ9QZ1AwjcdrfpIb
	OI6BLVV1yRP5oqV7OMafY6mplCytZMYorXm7xpN7ZRWesmS1zJJ1dfj4HyRAoG3aZV5OgAaTVMS
	vGYdDkSu+VrZqPof8Y4uTuRgSEzoeA+I=
X-Gm-Gg: AYBFou2zMZfhSED56sYY5IOjz0XQup4soU+r5ylSDfwnjV4FrN8upWHfxVuxKss5U5o
	4wpGV5CpeqYigg0s1HDrFefm+wzNuZNvvzwJGSU1gMjFIfzU9Ent9ZcLD6+wzt3/rdVtVdFoxhj
	IGg0uLkMkxb415PNnVVgwsTWqdEcaWgDQKhowwtlS+vgV9RX1cdVqgpGbiacap90QQAN94LSGxe
	6/C7dvB9g0tbipEM/l0+IJDVB46dX2TN8V6LPDMhZZQASMEDakiTixTb1bUe3teYyX6GJf7QfOC
	w33dPxu2Bpc574+cgeNxvRJftyUmLSnn7+/lVCdOMkhg5dZZZHvV1VHKIO/QUUw/vvrsixvzbYN
	4MjZWfYItb6XlIdeQ0P+B/hWTFiCiCoCxWpDHmfapm/xvuZHladtiw+0HSm8=
X-Received: by 2002:a05:6214:5b07:b0:917:c904:4ae7 with SMTP id
 6a1803df08f44-91ca4b6378amr177385546d6.42.1793688916399; Mon, 02 Nov 2026
 22:55:16 -0800 (PST)
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
 <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe> <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
In-Reply-To: <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
From: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Tue, 3 Nov 2026 12:55:04 +0600
X-Gm-Features: AclHuK9ZYGQEzTD77WMjoZV83YHbSvZqWTfB65cmF63ZSTp5hJ0K_i9Gct3Q7e0
Message-ID: <CAGAHqH6GmTamRzM7twRSJmOCMYmAJ+j25585P6UVeF1eROjYNw@mail.gmail.com>
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

Hello,
It's been quite a while. Any updates on the issue? Just a reminder, I
sent the required information you requested after testing it on my
hardware. Good day.

Thanks,
Mahir
(Resending in plain text mode as html text is not accepted. Sorry if
you receive duplicates.)

On Fri, Oct 30, 2026 at 3:32=E2=80=AFAM Mahir Faisal
<mahirfaisalantiq33@gmail.com> wrote:
>
> Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
> tablet mode; EC expects VPC 0x2A with posture data
>
> Hi Rong,
>
> Thanks for looking into this. I ran each case on the 14IRL8 (82YL,
> BIOS LHCN30WW) with my userspace daemon stopped. Commands were sent
> through acpi_call as VPCW 0 <data>, VPCW 1 0x2a; the EC cleared VCMD
> within ~10 ms every time. Keyboard/touchpad state was measured by
> counting evdev events from the internal devices (AT Translated Set 2
> keyboard, ELAN327E:00 04F3:327E Touchpad) during timed windows while
> I typed and used the touchpad. Backlight state is by eye.
>
> One observation up front, because it affects how the commands should
> be used: the commands set the keyboard/touchpad lock directly, but the
> backlight only changes when the command agrees with the physical
> posture (details under the 0x08/0x09 cases below).
>
> > What if:
> >
> > - 0x0A is not sent on start
>
> Not needed here. Fresh boot with nothing sent since power-on (the
> previous shutdown had sent 0x0B): folding alone left the backlight on;
> 0x08 while folded turned it off; unfolding plus 0x09 restored the
> keyboard (19 presses counted) and the backlight at its previous level.
>
> > - 0x08/0x09 is sent after sending 0x0B
>
> Both still work. After 0x0B, folding alone did not turn the backlight
> off, 0x08 while folded did, and unfolding plus 0x09 restored the
> keyboard (34 presses) and the backlight.
>
> > - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
>
> Harmless. 0x0A x3, then 0x08 x3 while folded, then 0x09 x3 after
> unfolding (0.5 s apart) behaved the same as single commands: backlight
> off while folded, keyboard working afterwards (18 presses), no flicker
> or delay.
>
> > What if 0x0B is sent when the keyboard backlight is on?
>
> In laptop mode: nothing visible changes. The backlight stays on and the
> keyboard keeps working (27 presses afterwards).
>
> While folded with the backlight already off after 0x08: the backlight
> stays off and the keyboard stays disabled while folded (0 presses).
> On unfolding, with no 0x09 sent, the keyboard (24 presses) and the
> backlight came back on their own.
>
> > What if:
> > - 0x08 is sent when unfolded
>
> The keyboard and touchpad are disabled in laptop mode (0 key presses,
> 0 touchpad events over 10 s), but the backlight stays on. After one
> 0x09 the touchpad and keyboard were back.
>
> > - 0x09 is sent when folded
>
> With the backlight off after 0x08, a 0x09 while still folded
> re-enables the keyboard and touchpad (37 key presses and 3798
> touchpad events while folded), but the backlight stays off.
>
> So on this EC, a driver that sends the wrong posture would lock the
> internal keyboard and touchpad in laptop mode, while the backlight
> depends on the physical posture as well. Sending 0x08/0x09 strictly
> from the posture reported in the YMC event looks safe; 0x0A and
> repeated commands are not needed but do no harm.
>
> I also tested unfolding after 0x08 without sending 0x09 (0x0A sent
> before, no 0x0B). On unfolding, the backlight came back on, but the
> keyboard and touchpad stayed disabled: 0 key presses and 0 touchpad
> events over 10 s. They worked again after 0x0A + 0x09 (sent together,
> so this run alone doesn't show which one was needed; in the other
> tests 0x09 alone was enough).
>
> Compare the 0x0B-while-folded case above, where unfolding alone
> restored the keyboard. So once 0x08 is sent, the EC keeps the input
> lock until it gets 0x09; after 0x0B it follows the hinge again. For a
> driver this suggests re-sending the current posture on resume (the
> posture can change during suspend), and sending 0x0B on remove or
> shutdown, so a missed 0x09 can't leave the internal keyboard locked
> in laptop mode.
>
> > An acpidump would be helpful.
>
> The compressed dump is ~390 KB, so I'm sending it to you off-list
> rather than to the lists. The MSDM table is stripped from it.
>
> Thanks,
> Mahir
>
> On Thu, Oct 29, 2026 at 11:18=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
> >
> > Hi Mahir,
> >
> > Thanks for the report.
> >
> > On Thu, 2026-10-29 at 03:21 +0600, Mahir Faisal wrote:
> > > Hello,
> > >
> > > On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
> > > laptop is folded into tablet/tent/stand mode under Linux, while on
> > > Windows it turns off. I traced the difference to a VPC command that
> > > the Windows YMC service sends on every posture change and that Linux
> > > does not send. Details below; I'd appreciate your view on whether
> > > lenovo-ymc/ideapad-laptop should send it.
> > >
> > > System
> > > ------
> > >   Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
> > >   BIOS:   LHCN30WW (latest)
> > >   Kernel: 7.2.11-300.fc45.x86_64 (Fedora)
> > >
> > > Symptom
> > > -------
> > > When folded, the EC disables the keyboard (no input reaches a VT) and
> > > SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
> > > backlight, however, stays at its previous level. Writes through
> > > KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored i=
n
> > > the EC (KBLS reads back the new value) but are not applied while
> > > folded, so there is no way to turn the backlight off without
> > > unfolding.
> > >
> > > The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
> > > "EC Notification":
> > >   "Fix the issue of keyboard backlight is on when turn on in notebook
> > >    mode and change NoteBook mode to Yoga mode."
> > >
> > > The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
> > > Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.
> > >
> > > What Windows does
> > > -----------------
> > > The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
> > > ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
> > > buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
> > > Management". Its handler for that IOCTL maps function 0x0C to VPC
> > > command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
> > > data byte, using the same VDAT/VCMD sequence as write_ec_cmd().
> > >
> > > Values of X observed in YMC.exe:
> > >   0x0A  service start
> > >   0x08  posture !=3D laptop (tent/stand/tablet)
> > >   0x09  posture =3D=3D laptop
> > >   0x0B  service stop
> >
> > What if:
> >
> > - 0x0A is not sent on start
> > - 0x08/0x09 is sent after sending 0x0B
> > - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
> >
> > >
> > > Current Linux behaviour
> > > -----------------------
> > > ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
> > > for models in ymc_ec_trigger_quirk_dmi_table. Booting with
> > > ideapad_laptop.ymc_ec_trigger=3D1 on this machine has no effect on th=
e
> > > backlight.
> > >
> > > Test
> > > ----
> > > Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
> > > followed by VPCW 1 0x2a, then polling VPCR 1 until 0:
> > >
> > >   data 0x0A, then fold      -> no change, backlight stays on
> > >   fold, then data 0x08      -> EC turns the keyboard backlight off
> > >   unfold, then data 0x09    -> keyboard and backlight work normally
> >
> > What if 0x0B is sent when the keyboard backlight is on?
> >
> > >
> > > I'm currently running a small userspace daemon that sends 0x0A at
> > > start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
> > > reliably so far.
> >
> > What if:
> > - 0x08 is sent when unfolded
> > - 0x09 is sent when folded
> >
> > >
> > > Suggestion
> > > ----------
> > > On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
> > > is anything other than laptop and 0x09 for laptop, instead of 1. This
> > > might also be worth doing outside the quirk table, since it matches
> > > what the Windows driver does on every model it supports. I can't tell
> > > whether data 1 is still needed on the models already in the quirk
> > > table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
> > > that hardware would need to check.
> >
> > There is a chance that the 0x0A[start] =3D> (0x08[fold] <=3D> 0x09[unfo=
ld])
> > =3D> 0x0B[stop] sequence is generic. Derek, Mark, could you confirm if =
the
> > sequence exists in the documentation? If so, I think we can replace the
> > quirk table and the module parameter with the standard sequence. I will
> > prepare a patch once I get enough information.
> >
> > +CC Gergo, Andrew, Andr=C3=A9, Swapnil
> >
> > I believe the quirk was concluded by trial and error. Could you test if
> > the above sequence works on your devices?
> >
> > >
> > > I can provide an acpidump, the disassembly excerpts, or test patches
> > > on this machine.
> >
> > An acpidump would be helpful.
> >
> > Thanks,
> > Rong
> >
> > >
> > > Disclosure: AI assistance was used to troubleshoot the issue and draf=
t
> > > this email.
> > >
> > > Thanks,
> > > Mahir
