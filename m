Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793222513;
	b=Tq1Fw/iIviEJuJQgaIj6FeTTlHSttyPEl91Hw6sQ3dL6ALNx2MEafYlQvm2a5MLblFyz
	 U4NissjTyMHR41iDXylTInHfz5b+mKd93VuXMOa35mdDIP5N8kKeoXk3RlE6VE+ZJ4gvH
	 O1nQ0Mh59fzHbpvamLgD1s3xQxdDtFJZ2HTM8zzrbn2Cz+T8W4Q+yiRJPeb/DTE03v7g/
	 0YiGKnQl3J/o4zNMQxgnmPUoV0SodVW9IXdncWrEZp3ouUJiFVUngMY/F07Mp+t4Q5B5z
	 rhF8/evnN19Ga2jSaye/4us6RWrnGPKi8hwLJTHOndF6JhwEbos7IBCFOOoIzVhJQwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
	b=ezu8Y9ZcnoCGCW0wftx59AIkLeHe9JK8jCpxJMrTgZAZjHetMPVz1hKnctrt/fYtiKNv
	 nbjrWNhmdmYtk1ufe/U0xxsL++myf5gc4Ke4txx3WMATi410KyUw4Epb8wH5oyDeUsobs
	 p6lv50xBUzSxkdgflcNaE7O4TxUwc81pUG/UdjYsj9BL+K98kiVHyfS7bij5LEEv79Yrg
	 CBAv51nKX11o2GqVOcaFQK2VqcmPCb2L9S3VYtSljBhuZNBui+58OFaR+S+78xSHkUzVb
	 WzPrdAW614fINSc8hVxQVPneOfgoN1NJYYpmpyNw+RRQOOtbJDWnUnsaoi3maugEdsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMVnz7L5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMVnz7L5
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c63449320so15287536d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793222512; cv=none;
        d=google.com; s=arc-20260327;
        b=DBm/HI1HSkUtV4Hq1Tw5zsDFlTNoAfD2x/iQyV3RqYiqKtR+Ev2MGlaHwut4YKrhBu
         Lv5rizqqIgJPRDK38X/udfmY1FInRUvsVgqn0naCxYKl7ckQXK1Uhvv0ucTIqbTLt6/W
         +rDZRoF9OSI5v/+Y4JRxsGpA6bRArAAqP51nE8zq2BeMrMycrnlfOf2nY5FqPOMLMSoc
         ozG/BN2TG/nsUWh8xMXtd7yDs7pA/iKUSSXHEuNmcAEomoKeAKgdiP3Q68Ed+SNjgX3k
         OtzcKsCJRhWZ/FDrxtWYWO9wJZgvbo/AmsFuChoBlYCRHNXup/tpLuQe/YKJ0/s4+yiP
         hZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
        fh=I116VO7ojVFq/QbhT9P7xG+xWljCRTATXb/jX6ubj5g=;
        b=WDyZMJGRfTVtSIDyjFImNLfYdM29+InplPDLGezl1JzwCnQVT5CCWCKEOCFGV4CYFj
         Jb32xFNC1Z6v3SYDEvix97vL0AeTslpZ2w9yaRc04DvTbpQhrZY/iJHJ1nX8LV6sb0Xn
         60WanwBWQFT21lb92vpjY+IFO/v2e3GeF46E2zhueJRLY/Uj+G4ly5Oylk/RrbPdxQcd
         JEL0LQg0Me2uQIk9cDIuVPBwx6q5Z/2x6obqt6BeGsYrCMjwS0wR01xaH11JYpwMKGZV
         Nq94TTLeztzBu2yCZxj9GLl2chTxEOWa8njIp97dQf9uog6ROhbQmJyzrMW41DXAa/cU
         a7PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793222512; x=1793827312; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
        b=gMVnz7L5ieqJUx2OQeFTamuf2oJLu2mqxfBqwqa8rUOK1RCdR4MO0jhKH2dgQaVc7M
         tLeKVp7cKr46dhqXP41zMdWqApWe04qAJTvDRREy0satsiRCM9WypgSIMJz2dS4d/lqt
         VXwzK0tNV0OGsTi0ClKGxAyQ5czqwqUt6QMHn8IUpJDGkAx3A9A/ettXv5XQKOSgfHpp
         ZM/e9bWihZCv4V9GTO0F/wrX7eUI8bQmUCO65vQjKB8/IiEcIInlEs2IoQzQJdqBF6u1
         bxXKbYqIhRRl7bqJEv6RaDZyduf2WCjRNJ+8lh4Y5hPgY6nE5Xd4E+wWTae+4nMkSplL
         ujRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222512; x=1793827312;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
        b=e2nmdM81iirqWEMNk/nb+e+r8hbNDQjsaKHu4KQLvimCFjSs7nf3NY9EfBknas+gSp
         VFG8SAZbv4oq8XO5NNeuSe8BEIHz4dSigHhy1riKVEvMjYsDlP1/3RcXgvfFVmIZ797q
         XGN6fECWFtZGKwPzXnPKg1/YbLfSlBb5qC7Suo8ZWm1uD8UdEHNM2nWM29lw0mf25K42
         hQLQdQsMudZUE3xe0qE3/q8wmPVaxgBHAnfZ9Jr2s99j8wkcBIkEsO+cz9sCp/aOWSn+
         M7IOvbXcdo4eL0lRxcN+d3gST2jLqkebLxqToDkLDCPJN8a9iWCqKWV45YmHjqEP7q2y
         C/tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjifOUIxG6IrsoHQzKbVK3ziXbDlXis0E8fgzRavqD8NODU4zQ0N+G6efHw5s4szD1NiGg1zo18JAnVmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPTJVr9cI9IyrcR8NmjwDkKThhjEnu52zet0q7+GPEfFmTyCwv
	Wxy8g6GidqqHs54BhH8yYrC0KDQN70p4H+wNEPbUiuPxQmgb47dOefoG60ZE5pIWkvzHMjoW2d/
	vzgqaUoFC7HWzRFBSiDd1EYrp8iBihbNDm9aXGuhcUw==
X-Gm-Gg: AYBFou39yM/EmHTgGdq6gwLWdFoEQxNKZxg72JD51SoKCwZK5fQqEo+A7JBYSkEVvDW
	Utm7MkTEkMBEqlP/XEiY+OjPSDn1umTyrRmAklog3z3aBC6SSOMRMqRCn7KU/8qOQarh7dBkzDC
	bC5157w/77CuEAXcDhcFVJYMmOij6TjjOsLqIUEMAboswfSdT99AFPr7GJkmQc0F6Umgst5cqab
	mEABbI8KTDhyXeWa4O+08RluIxJakIcop44ct8kG43qk3EG9iXGFSQQH8DW6V6auXtYaHA0oqx8
	auOHMN4EcCeO7oyJ3krm2137Q8ah88pBkZygA8ZJw7EZRhFXjULmbqXlXBqNgr+fiU49EFdkqpj
	AAnOd1op7vwojeD8dSo5u75hXCpZXVhOvaj2WIt730g6bHzc=
X-Received: by 2002:ad4:5c61:0:b0:91c:75df:6512 with SMTP id
 6a1803df08f44-91c7d1d2830mr61812056d6.45.1793222511553; Wed, 28 Oct 2026
 14:21:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Thu, 29 Oct 2026 03:21:40 +0600
X-Gm-Features: AclHuK-SBa0LZAObr8ICal18-r-5HSSQlJ2zHc2E4EIOPab0xbGreYw338udJMw
Message-ID: <CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
Subject: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in tablet mode;
 EC expects VPC 0x2A with posture data
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
laptop is folded into tablet/tent/stand mode under Linux, while on
Windows it turns off. I traced the difference to a VPC command that
the Windows YMC service sends on every posture change and that Linux
does not send. Details below; I'd appreciate your view on whether
lenovo-ymc/ideapad-laptop should send it.

System
------
  Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
  BIOS:   LHCN30WW (latest)
  Kernel: 7.2.11-300.fc45.x86_64 (Fedora)

Symptom
-------
When folded, the EC disables the keyboard (no input reaches a VT) and
SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
backlight, however, stays at its previous level. Writes through
KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored in
the EC (KBLS reads back the new value) but are not applied while
folded, so there is no way to turn the backlight off without
unfolding.

The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
"EC Notification":
  "Fix the issue of keyboard backlight is on when turn on in notebook
   mode and change NoteBook mode to Yoga mode."

The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.

What Windows does
-----------------
The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
Management". Its handler for that IOCTL maps function 0x0C to VPC
command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
data byte, using the same VDAT/VCMD sequence as write_ec_cmd().

Values of X observed in YMC.exe:
  0x0A  service start
  0x08  posture != laptop (tent/stand/tablet)
  0x09  posture == laptop
  0x0B  service stop

Current Linux behaviour
-----------------------
ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
for models in ymc_ec_trigger_quirk_dmi_table. Booting with
ideapad_laptop.ymc_ec_trigger=1 on this machine has no effect on the
backlight.

Test
----
Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
followed by VPCW 1 0x2a, then polling VPCR 1 until 0:

  data 0x0A, then fold      -> no change, backlight stays on
  fold, then data 0x08      -> EC turns the keyboard backlight off
  unfold, then data 0x09    -> keyboard and backlight work normally

I'm currently running a small userspace daemon that sends 0x0A at
start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
reliably so far.

Suggestion
----------
On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
is anything other than laptop and 0x09 for laptop, instead of 1. This
might also be worth doing outside the quirk table, since it matches
what the Windows driver does on every model it supports. I can't tell
whether data 1 is still needed on the models already in the quirk
table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
that hardware would need to check.

I can provide an acpidump, the disassembly excerpts, or test patches
on this machine.

Disclosure: AI assistance was used to troubleshoot the issue and draft
this email.

Thanks,
Mahir
