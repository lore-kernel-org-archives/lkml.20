Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793768286;
	b=xe9Zd1xcDp662MerxudDvr/YjK8ao6yIZNZgtF5o0iovxDmvo53gnxnW9rSiH3Kz0/en
	 ojM9n9ayOpeXy/Eqy0CPMIM6UBVtnIIUGbNEKoylGkmbvrFA9uLxbnzrWtJXur5b1D3Wd
	 4t3dBCGfkh0xcnCQ7mZv9J2LjPbxttQIIZBMjJ3u0Lz8Mo8vUJB9jBh+TLYDkg9B3J8F1
	 H36BC/L44mif3gyEeU7XPXBQ/Tgu3pyGPnazV+L8yp7+nGsxcQ+VuPPAv5msdQ+mZ7PZU
	 vcMdIepkr76qIGq7nBi0kT9RD4vqwypF7zzHrMA7XaICGmnngrRL9XhalL8BKnyunJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
	b=I4z/UW8KR6LfAxYkgOWOBPB1FDYITWW2fxM/I51y6yYtxty4zrUthL/vH521TEI59byr
	 L079ugyUO3rJzuW3sCi0GX2GkyIgae0FbqZ7A1hzmMorq94nskGIWIuLXFHWRBecfax4f
	 AJLvuT2hhTUkLsmMP+QbDwpcAPBYlFszBUDge3ifCzQu57cbOonTtGV8pvPlH/vTkeRoB
	 KAAikAmoTGWVwGg8o6VnxkZrr5ygCscxZIGkR8CYCvz+wcPFyLmzSmk0cyuNe7EuYo0aA
	 ZPgiNKd5S++cMOUHv14FGHd9MRBfbqhF6TUy+jayRrbeNjvKGYpLqZ++27JDFD2eGjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZt4RGI0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD6606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FD6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZt4RGI0
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ac99992373so2561551fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793768285; cv=none;
        d=google.com; s=arc-20260327;
        b=ReHBU3/qoqxO/Bh0I8W96q4mFCaLzNLItVs+uRlyO5KQdNmFjIK15Eal0I5ThVtgln
         5PTbFpxeKke4d6FJZvjWYzIrXMmzGOCv8N6CAaR40bEH792+UQd0vsMuSEJGySel/wey
         wngZk8vbxZxVM/K9vCakj088nomP9hR/G0wXIVIbp8HjgQ2DP/xb4OnPYwCuGSriJGbg
         XixtPJGiFtPNohUzexvj5mObmRJXaBFb/wtu5FVslLwRLo2axp7tjTSNeyl2MsM6Kg0z
         v9tm2VFFCtT4/avrwPOV6DIHB4mi0PWe8uWu8zmdUYXEhRPRJUq134QMcoRp5p3QI2Vv
         RYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
        fh=Y//aDhAjAFs2xcynLj/W5QDpyb2v3hDR3/UIdrfVXbo=;
        b=gGTGpE+U/ub74+3iW3LXEqhHWmPOl1aM82VOUB/ca39WaU4c/Ip7MvM0Izfgk0zu4X
         6EAWPwQtHAleg5dkwNM5f7Gpxgxz+6+idX60U5n+FqYFen9RhXhvolDat2G5xGW6/67K
         GgvAhiRnOTmI4R9yObKQGhgZ9H/pzU28bINThLW7d+tIDIyPMYIBYfcBvUMmz5fs+3Ss
         16rdStocNwgjc5TeccanvXLBzzgeuDdInht0lfTjZK4DmWx33jniBwGmtWUn3apJ4hgP
         RMGVUlQ3sFCJziGwTq+6XmV5u61lCX34VWQCLJT1f0lqoO0xS9JhUPmHynXS+0klQ3t8
         T/tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793768285; x=1794373085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
        b=xZt4RGI0wmKNPn/0giRZMkOsILeQbI9sYIWW+6D4sc3WqD62sW15KYTbCsWML30g27
         7B7DSYIpgdqi8reBQw/QeD09g2qUJNOaOOSXMAB4nzKR4HW5brezxtFcybmUdDwjsatZ
         iNdBHdm38DhqneltuHMCDK8htY5oft/K5gRAIiDGjyL+KuhqB2QhfZqCs4Qw5JkAO4Tc
         yqhoSeZXHChtLlSBtm+59/q4Pdna2Y+UG0Pn3JypnK2E56/qhozkV3WhQAKW3rH5j6Mj
         +apfhkbNLtOyi8T1JlpCq1JjBTr9g4v6jS9kU87oupV6WqaFQKRZX8svYsXhwsA+lYeI
         rkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768285; x=1794373085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aDgXyx92m6oxwBS90QVXO0lRfEybhxg9dZAZMkxcDY=;
        b=BE79dSA0cr62F82EtlxTUMdhrfmZ/BdDbWSbKzFos0H9/l4T9vtLLGIEXmOAot6Pcm
         orQuvqlPdXhuI3uGT/tAozWhuQTk1bgAmQq/IHfVGmVTZWOyT1S2uTiKPQaYYJeJcX7I
         b2DTs7r0n6TbMS1yJYqIcnVhzB5I5PKVAF6ENC/fL05vzIcny52N+NUEDJiNCKU7VUtP
         f76a8ZQcKios6ffQB7k8U+48YBqK/MdXezCKJfjvctD3n7shNbN4/u4p8civT+CHNkr8
         MFAxNleMLExw3oTRq1RLAheErH/w9cx2IwKZki/qo4bHs3q1n4Llmi7/Mbv/5JB8L0LI
         gkfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgMVf8CBeCYkO4ml5VtKE3zsijyCr92yQl7s9r/cHxzWZPfsMPwtCo+mCJHAAVYItLr0dC9WIRGmb2jPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xSpy8vaF8lPf90AnCLeO+Qpk09Ch9p5MTNLHqY23klZXH7BkJ
	OOZH49bqaP9sz93W7IWRUyJPkovDkj//B4ZW61pYmMV5m8CUmAeBRgTGI2NK27ebzX/72FX3vhh
	lOpWfMjCKhEtao9Zj/Mfid6GTkpt+ety0IIVKe9mIPFyC
X-Gm-Gg: AYBFou3Flp8lat8V0NYwgPdwJikae4jJCwSU53Sno0nggRxkUDdpeM8Q6mKzUQartjM
	jAxEhth1HrNOu4H1X6nFxbUytdeyU76kOHHiMR0SCKCWZ9IeHbHMxO5pMMFsQLaKX6+zxdwmzkg
	pXd2YWWk3pS71TSw16Wd4kfJmA8Vn4Elb63iuOSoR9YuyYzZJmCzaj0jFEkNPv+7/EXwyx/ehXD
	nMG8tmJCsFS0KzQVOaJZt+k+8gdLaAeqJGne2Gbf1NWfwCyZRU/ZwG2C0DFIIV2TI4yk7CVzDIK
	28PgmyrN7IH0LEga7GSHc6ls+joC72Xps/9mfFPpe2chFdcI1/vdRSd1e1AdVU0N94q9yCDV0ze
	+Y/m/ZrExL0l6DogIhmU+fNlJVodnVRl56+Y9zyZc7EYj7BVPuukYPnpA0TRNOyaU7Sk+cQPS5W
	UXXTDopN1qM7Co8RBatuto3XRlvQ==
X-Received: by 2002:a2e:a809:0:b0:3ab:4a7c:7a65 with SMTP id
 38308e7fff4ca-3acb7883d20mr31770521fa.0.1793768284322; Tue, 03 Nov 2026
 20:58:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com> <0fd34add2ef37f6abcab1301f6249cc68423f148.camel@rong.moe>
In-Reply-To: <0fd34add2ef37f6abcab1301f6249cc68423f148.camel@rong.moe>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 4 Nov 2026 13:57:27 +0900
X-Gm-Features: AclHuK8XI3VQRpfw0chUuAyxMsM8xfvTXW0qniK64dMt65nJY0lDbNTFE4uQ3p0
Message-ID: <CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] platform/x86: thinkpad_acpi: Add support for auto
 keyboard backlight
To: Rong Zhang <i@rong.moe>
Cc: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Vishnu Sankar <vsankar@lenovo.com>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, ibm-acpi-devel@lists.sourceforge.net, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, platform-driver-x86@vger.kernel.org, cchen50@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qiling,

Thanks a lot for the patches.


On Mon, Nov 2, 2026 at 3:02=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Qiling,
>
> Thanks for working on this.
>
> On Sun, 2026-11-01 at 18:01 +0800, Qiling Zhu wrote:
> > Hi Mark, Ilpo, Rong,
> >
> > Recent ThinkPads with an ambient light sensor (ALS) support an auto
> > mode for the keyboard backlight: the EC picks the backlight level
> > according to ambient light. The mode is EC keyboard backlight level 3,
> > above the two fixed levels exposed so far, and it is reachable only
> > through the Fn+Space shortcut, which is handled entirely by the
> > firmware. Userspace can neither select the mode nor observe whether it
> > is active.
> >
> > This series wires the auto mode up as a private hardware control
> > trigger, "tpacpi-kbd-auto", on top of the hw control trigger framework
> > that recently landed in mainline [1]. With it:
> >
> >   - selecting the trigger writes EC level 3 (auto mode on); writing
> >     "none" turns the backlight off
> >   - the trigger state (bracketed in the trigger sysfs attribute, and
> >     the new trigger_may_offload_to_hw attribute) is the userspace
> >     view of auto mode; reading brightness returns -ENODATA while
> >     auto mode is active, per the framework semantics
> >   - Fn+Space keeps cycling through levels and auto mode as before,
> >     and the trigger state now follows hardware-initiated transitions
> >     automatically
> >
> > This is the thinkpad_acpi counterpart of the ideapad-laptop wiring
> > from the same framework series, which is still queued; this patch
> > depends only on the LED core parts already in mainline and can be
> > applied independently.
> >
> > For background: the February discussion settled that auto mode must
> > not be exposed as a brightness value [2], but no agreement was
> > reached back then on how to expose it instead; the hardware control
> > trigger approach was established later by the framework series [1].
> >
> > Tested on a ThinkPad X1 Carbon Gen 14 (MT 21V8) running linux-next
> > next-20261030: 61 scripted user-visible assertions covering the
> > software paths, the Fn+Space event chain and the unchanged legacy
> > behavior, plus manual exercising of both the Fn+Space cycling and
> > desktop-environment brightness controls; checkpatch --strict clean.
> >
> > Deliberately unchanged (details in the commit message):
> >
> >   - max_brightness stays 2; auto mode is not multiplexed into the
> >     brightness value
> >   - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL
> >   - module unload still turns the keyboard backlight off
> >
> > Two open questions, the main reason for the RFC tag:
> >
> >   1. MLCG returns capability bits in the upper 16 bits; does one of
> >      them indicate auto mode support? If yes, I would gate trigger
> >      registration on it. Mark, does the EC documentation say?
> >   2. On models without an ALS, the EC behavior when asked for level 3
> >      via MLCS is unknown to me. If it is undefined rather than
> >      rejected, optimistic registration would need a rethink (e.g.
> >      DMI whitelisting).
> >
> > Rong, happy to rebase this on top of your series or fold it in, if
> > you prefer to keep both wirings together.
>
> (+CC Vishnu)
>
> AFAIK, Vishnu is also working on adding the same support using the hw
> control trigger framework. Maybe they can answer your questions or
> integrate your patch into theirs.

Thanks, Rong.
Mark and I discussed this, and we are happy to go ahead with Qiling's
implementation rather than duplicate the work.

For some background, we had previously implemented the ThinkPad side
in thinkpad_acpi against Rong's hardware-control-trigger series and
tested it successfully on our hardware. We had been waiting for the
common LED infrastructure before taking that work further, so it is
good to see this moving forward now.

Regarding the open capability question, I checked the Lenovo
keyboard-backlight firmware definitions. MLCG provides an explicit
Auto-mode capability indication:

bit 20 =3D 0: Manual mode only
bit 20 =3D 1: Auto mode is available

So I think MLCG bit 20 is the appropriate indication to use when
deciding whether tpacpi-kbd-auto should be registered, rather than
probing level 3 or relying on ALS presence.

One clarification regarding "AUTO" mode: Auto mode on newer ThinkPads
is not necessarily ALS-dependent. Some systems use the ambient light
sensor as part of the automatic keyboard-backlight behavior, while
there is also an activity-only based Auto behavior where the backlight
turns on following keyboard activity and turns off after a period of
inactivity. Therefore, absence of ALS does not by itself mean that
Auto mode is unsupported. The firmware-reported Auto capability should
be the better discriminator.

Regarding MLCS bit 31 discussed earlier, please ignore that bit for
Auto-mode capability detection. The explicit capability indication is
MLCG bit 20.

Based on this, my suggestion would be to gate Auto-trigger
registration on MLCG bit 20 and leave the actual Auto behavior to the
firmware.

I am happy to test the next revision on additional ThinkPad hardware as wel=
l.

>
> Thanks,
> Rong
>
> >
> > Comments welcome.
> >
> > Regards,
> > Qiling Zhu
> >
> > This patch was developed with LLM assistance; I reviewed every design
> > decision against the framework sources and validated the behavior on
> > real hardware myself.
> >
> > [1] https://lore.kernel.org/r/20260618-leds-trigger-hw-changed-v2-0-c28=
c44053cf3@rong.moe/
> > [2] https://lore.kernel.org/r/20260203232219.11683-1-vishnuocv@gmail.co=
m/
> >
> > Qiling Zhu (1):
> >   platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
> >
> >  drivers/platform/x86/lenovo/Kconfig         |   1 +
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
> >  2 files changed, 88 insertions(+), 17 deletions(-)



--

Regards,

      Vishnu Sankar
