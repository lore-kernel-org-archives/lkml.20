Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634547F788
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095196; cv=pass; b=EfYuubI8pjrJzRQ5xUpfAB0kG++DMt4fIRlLW3XECd5jDV0ScuEGso46QLkCRKr1dsQ5X3ne+rMWEA3LzuZR9LYh5wMUnfIxk3JnroRsPN6oWSSTkuxz4uv4l1OY9S9Rveg49ZxlrWFw/rC2c9s/PM0GL0iZmaAPGWazDrQmcCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095196; c=relaxed/simple;
	bh=VhazBpOhj0QlIU3lekCy/9/OQJm95CHgExxNIn9AYpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUuIZHiuilI/Kkk0x31LhinFPUWw9AVZ/+8MDrtH+mcwJUNWwMv+XbLha6F3wmItEM2KhmPrNPOGVPUtaPiY40HRMl1/uGfLCCJL3qCjpwlQjcZSwllDOp2Xtb7qsLVn5KUyTPHiH2qvubmn6r8k/wkTiWEiTxTUcisLSeQh+8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz82OO8m; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz82OO8m"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3f5e5e4c1dso121995566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792095193; cv=none;
        d=google.com; s=arc-20260327;
        b=qfOdxoYSBxw4krmbnnc5NorLFfgjIBRE9UyvWzHs1ltS6QFZ6BCFpbeht5TS/e12N7
         54BitRCCY0RoHGkp+J9TxKI9Smaiar6+nsnm/v+fKOfPn3qS0PPwPO+0OvbRMSRK2gNL
         R73/0mcyw0CCMJmiXjc+9OWtKXf5yKU31g33lzCIBNx7Xq8q6sKxpLsupVRhOXNOK+GQ
         9i1xXq/RMTHp6s0fc3rbaFuA9fg/9OpVlM93Fcx9eVLDXIXKc43uOPwFy7Pn0oOWYcBI
         dEgSrhYT4auQ5wJvTAvGQkugVmdfU1bgU90d5H0w+oa4OXT6lFN1/WsScTwx/66FpivW
         X7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/o0v0Yr+auOrsddBv1qaqTGOkbqMwX+D9s2+D5scD4=;
        fh=5365JvXjgIeKZqys7hGRZgqEi4fimWXE72sLhDbAr/s=;
        b=KpCjxzLTm1ud7sWzctfkCpp2ZzXlWPaPmGdSF8vof7X+5t4Tc8QjHh9HoGl7gSVXC3
         kyMowTsXioR0VMADAr5lXxCr7Ciyp2AA1k9lxcTu1So/v83P5/Qz4U3ZV5YXBkRIwZU/
         sw3Ck+Ox5sGRh/sxreTi5hvXLOQfLr5hjXPZo3fKywijE25gGHo8CmgOWLIDLgmcFiRy
         xq37rZPvjGpOC3F/kup8OQuJokk2LpmVVkw+1F4xiYN7q3YSgBAkMpSB4qnTbMIWplTH
         Ont+ArfSou7ppWJcPGplTO8wM35Vy+Z6rWB7XRzIDbf7s+OX4xNwfYTY1X/cy1UWJHGD
         4/CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792095193; x=1792699993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/o0v0Yr+auOrsddBv1qaqTGOkbqMwX+D9s2+D5scD4=;
        b=Kz82OO8m5E1yYRnNfx2+mtQ9PpOqwY04VaODSP3nmT1fyZaaLUBMxNPNoJLlALDsg3
         DT9k08YRWAfMaKO1yKzAcUN27StDFB6CeYBfRhXITwsFCibpDOt7wnXkBH3xr4M69hNw
         0WvzCMvyxLHqASZ0Mj7kcVv/n9YHZeTIMg9DlixZJAMnaECpBUTS1z3Fa4FWz+VBepVS
         VgHtDQ1oy+SYHQhe4DWZs8NRzbIuQq57/mqMPAzCoU6JtAzManTIRh70Fl1QCNVUwlAH
         /RdAJDtLU6Ppu6+HGiflFVaI+VEwJj8S2DAQQwo1erjDHm2ZEi767BV7a8xoGWZVDRm6
         1fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095193; x=1792699993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/o0v0Yr+auOrsddBv1qaqTGOkbqMwX+D9s2+D5scD4=;
        b=h1WQWTt1pkZi1b5b6IHBozC20LTT2H/gLgrw0VofbTELTqSJSLoyC0hQUaY2ll/mZL
         F+SLTSQ4OCxwODyyKyizJbmsX4KNT+fkpIbeeN+rShSKsiRDtkvq5BRfDU+cEmukdpcy
         IfRp7yZWktr+jPDecS9Ei3tLR5X2HHMyn/l2lT2a2OETRX6BxaKeg2Hu6Gute/HhKaDL
         IwpBSzxCer9Iv4grdvbWJtxpvLadsiczhu5us7WUFXoztLUgy+hPeIp34H/4b1Qmvk24
         eeAuZxoYcQPeBjF6sxACq8pHdFMbADFQ9Ijip7at8nvQjrC2oKTQnOmDiZItLk83kxhG
         WmzA==
X-Forwarded-Encrypted: i=1; AKwUvBxTmJgBKZYStd7bnAjceXi2JDY6BoWet5ZJXYziSynIDsdsJn+XlCCYRyiwngrfwKyXaAijdYv7BsA6h1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZAf9SMerV+ThKVXbvF600OoXpj7SqL5+TsdHCK8zDmYX6tj+B
	sbdTQDMwEM1mSDxOSqjfyeOdnyAeDmBq4wSuk6BRnF7v1Z+txNWqB/5nOHK+O9kOmOLhO8ofDev
	JmPUTMH45hMjTdFwwhhOf54FCj4fCiLok0/NI7cE=
X-Gm-Gg: AYBFou3Uh9Ln6UT8ibVNp8KdPU678GUyP2FCEYhU2a/bB19Ms4ihJlrEqRDror9iPvK
	xBr41/n+Dli6+/go/oZXHgnf4S/P8hiaPioJCIkrTYquxjpQvSJiVgtprLyZip6zlmuERmR0m/E
	zeBaJGb0yEvM6TsuyWJ348n4L2Dl0GkLyeLZzPLS549fT9JJ9Tnwh8o4QUTtbbvx7oC1C6QCwga
	MuiFuGtfZ3rrkYvm3nDUd7Wsd+A1XhijTDkDgrbaPZbH31KX+1nkgbIHv+R/dNsnOe0NzacsK39
	4NQaMPjpu3kFGm5Om+4xYYv6lGCa8/XhzPmZAX5U1zMFU9h3SWmh6Is=
X-Received: by 2002:a17:907:c23:b0:c2e:4e08:19b5 with SMTP id
 a640c23a62f3a-c31a9d08813mr1787531366b.8.1792095192447; Thu, 15 Oct 2026
 13:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAUQFRPW-rbcZV-=qV1NMjF_358sdJTiGvQuRxRqAsehY+J9Qg@mail.gmail.com>
 <atEaguJD7dh7xNs0@ashevche-desk.local> <atEb6FN6ZbKI9xgf@ashevche-desk.local>
 <51c151fd-31cb-4ebe-8f3b-eb7634e68c31@amd.com> <4ba482fe-8b34-48ad-9d13-99ab532cbd97@app.fastmail.com>
In-Reply-To: <4ba482fe-8b34-48ad-9d13-99ab532cbd97@app.fastmail.com>
From: Nikodem Sanecki <nikodemsanecki@gmail.com>
Date: Thu, 15 Oct 2026 21:13:05 +0100
X-Gm-Features: AclHuK_6IVWJuTXkQAqot5n8Si7rebYbfwRNkP4YoTlgAmN-6AwE1BlCMyJKGZ0
Message-ID: <CAAUQFRPDq6zdyySWtGM8i_uq-iZJK1qpvCvxTrRweLmS2+-AMg@mail.gmail.com>
Subject: Re: ThinkPad L13 Gen 2 AMD (21AB): Caps Lock LED broken by ACPI GPIO
 11 interrupt conflict
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for looking into this.

I've checked Lenovo's website. My installed BIOS is R1QET54W (1.40),
which matches the latest advertised version. The version history on
their website appears inconsistent, though.

I also have the sanitised ACPI excerpts and diagnostic logs ready.
Given that a patch has now been submitted, would a kernel Bugzilla
report with these artifacts still be useful?

Happy to help with any further testing.

Thanks,
Nikodem

On Thu, Oct 15, 2026 at 8:25=E2=80=AFPM Mark Pearson <mpearson-lenovo@squeb=
b.ca> wrote:
>
>
> On Thu, Oct 15, 2026, at 2:48 PM, Mario Limonciello wrote:
> > On 10/15/26 13:31, Andy Shevchenko wrote:
> >> On Thu, Oct 15, 2026 at 09:25:10PM +0300, Andy Shevchenko wrote:
> >>> +Cc: Dmitry (as it might be related to keyboard configuration), other=
s for
> >>> the previously reported same IRQ on the same GPIO controller but for =
some
> >>> camera stuff.
> >>>
> >>> On Thu, Oct 15, 2026 at 03:13:02PM +0100, Nikodem Sanecki wrote:
> >>>> Hello,
> >>>>
> >>>> I'm reporting a Caps Lock LED issue on my Lenovo ThinkPad L13 Gen 2 =
AMD
> >>>> running Arch Linux. I found a workaround that completely fixes it, a=
nd I
> >>>> hope the findings might help implement a permanent kernel fix.
> >>>>
> >>>> *A quick note:* This is my first time using Linux, and I'm a complet=
e
> >>>> beginner when it comes to kernel development. I used ChatGPT (GPT-6)=
 to
> >>>> guide the troubleshooting process, analyse my laptop's ACPI firmware=
, and
> >>>> interpret the results. I personally ran the diagnostic commands and
> >>>> verified the observed behaviour, but the technical explanation below=
 is
> >>>> AI-assisted. Please correct me if any of the analysis is inaccurate.
> >>>> Problem
> >>>>
> >>>> Under Linux, the physical Caps Lock indicator LED never illuminates,=
 even
> >>>> though the Caps Lock key itself works normally.
> >>>>
> >>>> The LED works correctly under Windows and during certain stages of b=
oot, so
> >>>> the hardware itself is functional.
> >>>>
> >>>> After investigating, GPT-6 identified what appears to be a conflict
> >>>> involving GPIO 11 on the AMD AMDI0030 controller.
> >>>>
> >>>> Booting Arch Linux with this kernel parameter completely fixes the p=
roblem:
> >>>>
> >>>> gpiolib_acpi.ignore_interrupt=3DAMDI0030:00@11
> >>>>
> >>>> The Caps Lock LED now works normally, and I haven't noticed any othe=
r
> >>>> hardware issues.
> >>>> System information
> >>>>
> >>>>     -
> >>>>
> >>>>     Device: Lenovo ThinkPad L13 Gen 2 AMD
> >>>>     -
> >>>>
> >>>>     DMI product name: 21AB004LSP
> >>>>     -
> >>>>
> >>>>     DMI product version/family: ThinkPad L13 Gen 2a
> >>>>     -
> >>>>
> >>>>     DMI vendor: LENOVO
> >>>>     -
> >>>>
> >>>>     DMI product SKU: LENOVO_MT_21AB_BU_Think_FM_ThinkPad L13 Gen 2a
> >>>>     -
> >>>>
> >>>>     Kernel: 7.2.9-arch1-1
> >>>>     -
> >>>>
> >>>>     Distribution: Arch Linux
> >>>>     -
> >>>>
> >>>>     BIOS: R1QET54W (1.40)
> >>>>     -
> >>>>
> >>>>     BIOS date: 2026-04-14
> >>>>     -
> >>>>
> >>>>     DSDT OEM ID: LENOVO
> >>>>     -
> >>>>
> >>>>     DSDT OEM Table ID: TP-R1Q
> >>>>
> >>>> Diagnostic findings
> >>>>
> >>>> The following is GPT-6's analysis of the diagnostic output and decom=
piled
> >>>> ACPI tables.
> >>>>
> >>>> *1. Linux sends the correct keyboard LED commands*
> >>>>
> >>>> Using bpftrace, we observed that atkbd_set_leds() consistently retur=
ned 0.
> >>>>
> >>>> Tracing ps2_command() for command 0x10ED produced:
> >>>>
> >>>> SETLEDS: value=3D4, caps=3D1
> >>>> SETLEDS: value=3D0, caps=3D0
> >>>> SETLEDS: value=3D4, caps=3D1
> >>>> SETLEDS: value=3D0, caps=3D0
> >>>>
> >>>> The driver reports success and sends the expected Caps Lock states, =
but the
> >>>> physical indicator stays off.
> >>>>
> >>>> *2. The embedded controller tracks Caps Lock correctly*
> >>>>
> >>>> The DSDT defines the CPLS field at EC offset 0x0F, bit 7.
> >>>>
> >>>> Reading that byte through the read-only ec_sys interface showed it c=
hanging
> >>>> from 0x00 to 0x80 when Caps Lock was toggled.
> >>>>
> >>>> Enabling dynamic debugging in drivers/acpi/ec.c confirmed that each =
Caps
> >>>> Lock press triggered EC query 0x78, which was scheduled, started and
> >>>> stopped successfully.
> >>>>
> >>>> *3. Lenovo's firmware controls GPIO 11*
> >>>>
> >>>> The DSDT contains:
> >>>>
> >>>> Method (_Q78, 0, NotSerialized)
> >>>> {
> >>>>      If (CPLS)
> >>>>      {
> >>>>          WFIO (0x0B, 0x00)
> >>>>      }
> >>>>      Else
> >>>>      {
> >>>>          WFIO (0x0B, 0x01)
> >>>>      }
> >>>> }
> >>>>
> >>>> The WFIO method writes bit 22 using WMEM(), targeting address 0xFED8=
1500 +
> >>>> (11 * 4) =3D 0xFED8152C.
> >>>>
> >>>> This appears to control the Caps Lock indicator using GPIO 11.
> >>>>
> >>>> *4. The same GPIO is declared as an ACPI interrupt*
> >>>>
> >>>> In SSDT12, _SB.GPIO._AEI declares GPIO 11 as an edge-triggered, acti=
ve-low,
> >>>> exclusive wake interrupt.
> >>>>
> >>>> Its _EVT handler includes:
> >>>>
> >>>> Case (0x0B)
> >>>> {
> >>>>      MSTP (0x3911)
> >>>>      Notify (\_SB.PCI0.GPP1, 0x00) // Bus Check
> >>
> >> This looks like some GPIO related notification. I dunno what Windows d=
river does.
> >> Mario?
> >>
> >
> > Honestly - this sounds like a copy / paste BIOS bug that they copied th=
e
> > SSDT from one system and didn't change it.
> >
> > I would think quirking it makes sense if the BIOS isn't going to be fix=
ed.
> >
> > Before we go much further can you check if this is the latest BIOS?
> > Check Lenovo's website, in case it wasn't brought to LVFS.
> >
> > Also; Mark can you ask BIOS guys to look this over?
> >
> > It sure seems like GPIO 11 shouldn't be in _AEI.
> >
> Yep - created internal ticket LO-4711
> Just a note though - the platform was not in the Linux program (and is ra=
ther old) - so my expectations of getting a fix is rather low I'm afraid
>
> I'd get the quirk ready, and if I don't get any feedback from the FW team=
 by next week go ahead with that.
>
> Mark
