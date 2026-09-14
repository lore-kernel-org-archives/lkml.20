Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BF433998
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344879; cv=pass; b=YLzf7c1H0/aSsxhWUwLKQs8ZNhUY2sqHbv2R2VMEzoqyFI+GyPWg6Yd7ZXXxVp4TsPhh+F7mirvCDYZ/ZB3L+DCNaMFjFoEWbpHJyQt3SxuV72TNoy97Nd/o56lp8W10qHpFeWYcNmXYEi+Ef4HlQveqx1OpoknWsau8/Usxa+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344879; c=relaxed/simple;
	bh=0KQvZGf2eNt3Mx4LM9oUUNQs5a57MPGyv6ITNoGIRz0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q0Fgu9ZPSmo34xEHJmbTKsY56v+B/TrgBvdWwuFRtHusxpORmAsrqXtxui225IBGdpsqnF02sPsCOYbNgdQjBMCKMInXl7JyWvhtjaRZSCkd8H/ceC7WXSYB6+E7z9FceBYzXSZH7lddXWijONJ2KlGbYlc3JO2HQdfj4ZFjoj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiHjtiAk; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiHjtiAk"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-866e57f63a3so23673097b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789344876; cv=none;
        d=google.com; s=arc-20260327;
        b=mxv6G+0RuxvhOW1t3N9FxDgGOO4CkF2Em1pGaaPeTVYH65hDfvJyoPC+oipdxXoEKD
         ya46oNpjZx7Ljse37wGfsbPSJE5bSI4776ViGzLWkOtBTDrFggJful2bzNpNddAk1aox
         1De6cbLUX9Fz2mpIv77XswwZmgm/U4udewun57KffzJVvQNjZvEmzOzuRlxOmK8vF2Xp
         qnjWKRlXydA6EI7gdZctcUOS/yswIVP4QbNVL4x7rybPIB2MLwF70K9TMlio/C+g0NKX
         OuGqN3hPNBkn9WFKrzBUbsGXMGSFvIgRpuvwaHSvLYGIWCaB6x3ykjcQ+DdgeJ7dwrC3
         PtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=r/2B6U178W1eE+E/+IiAkp0EgjU8HZfxoZmvFhcpv4k=;
        fh=VtF80xYHBr1NAYnd5XOakohYqM0EyXmpz94BRxYTD0U=;
        b=eJsKd2zELGBiOx/Aq2m3GUgHjBP6MvDjGxVk9E8Q+4jJZ8M5XOzbTHNxKmGmrW40cv
         zFDHK9bLtM8kh3oid5PJQHQGstJINH4U7DA9DBtRdWjYlKtLJMRGwwj7DUTujTIUlKRf
         WQ7OaWGRZ52UQ38wggZRI5PXzcG/MbNb+N3TqHZNCxC35WBW8LN6kwyNimGpuZNUx/9A
         M1mUbMXp8J4zzZJRlJnI51Gfu16+GUSgBnA93Gqq91yvRsN7C47kFGhEmRJqgWbMlpWb
         d5XzTIFPW3D5mY7QFtDimvRPwexlz6Eg3/Qr4My8TXC4QvaQTm1cAIphpN5IWU3dJpWw
         QkBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789344876; x=1789949676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/2B6U178W1eE+E/+IiAkp0EgjU8HZfxoZmvFhcpv4k=;
        b=fiHjtiAkjSgYLmiqKxZ5O08Gz70TSq0sAhFsyh1+/osuEJ/rd79HGXHvz68W3Xc2F1
         yfmj51NLOwlKWV4AlZ+0WQlDo8v8hTmO0/C+c5DAUhYm7D7NPOa71MHTVcNM2Y1hMQrD
         yRpZ6GTqlkuTAVRjj3fqtXkYz4g4qCkuiYuryMIHFmJplVvVFFFyCwIRr1Qzkq7Irvxw
         NWTw3MN2g7Hf4ohsKcBXzqAsc6/J1Mq45HqoCTqdpOQO6FrF3lfEHuCfS656N9QwatD4
         +I/jVDp/HildcG/Vur76QcQtEBisJAR2XHfQeEvS9F/umJkjL5+KPVhIwRaZf6N1uFA/
         scaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344876; x=1789949676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r/2B6U178W1eE+E/+IiAkp0EgjU8HZfxoZmvFhcpv4k=;
        b=sry//wnQJsa1KWeyu5QeD2B+Jie57FPdQANuQG9naGx7RGwrQikK8ZsYKnRHszNZwL
         huLVAoOm1hUOctyJkcDMM4j58bb4AT3F0rUoKBuxljau5BUl9WJigX387RYbOEc8Gv96
         EuJA0tdPXjwKHTmgy/RlujRE04U3DY+jG4X/91K7Gui68TryoSV/0CxQ13MsZUR8/7nc
         64Ze0RVWKQjrdsbj+VLIdA0VXQmgHh7GUchhDRKvuz+vxxsTy/MOAxxSM3lx7greqfwI
         EqDyD2qdRVjz1I+urYl40QARsQwKx27l5XdUN5Ts+mXL2tMtkk9wwedrFhKlqe6DJ+M7
         EZdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzUUdxNyx8PO2qIYZqe+P3TBHJvx7j+WFNnvaJAvi2LN/BoQX1rhW3Po8TA99CK9FRr0oX+Pc+TlwezLU=@vger.kernel.org
X-Gm-Message-State: AFuF++llhucrffw8TezTLjuz2C1O+QY4tAzuNjKC3odyCX0ezJVVhQpS
	54BEy0ry1LjwXDxxzOespwYOilxjLPYQzC8kasfHbGXwsqSuMIs1A5tzT7KM7/11HsWtebI4NRB
	X0KTQEHzrofU9zXvG5NQPksZo27TyDW4=
X-Gm-Gg: AYBFou1Uf0GRaLoD+1afiB1xm1cTaMlVo6qEIaAs94W6lRWiXRmsdnbrhDCQaq8XuKh
	ad/N0uiJeSn17u3FBg4OZgupnYHwflSue/ybKOyAhLSuXrkoTmgLCBZJaFNGFjT5oQ8J84NiQ4U
	cijy2w0xqpYVJaav6RTmYeTqHVz2r1VWLNe8IErhWCREyDkmHXACfHs5/xhz5XFUrGrGfOT4CAb
	ftMsdKZizVeTINaVLdrO9PjeuUaINSErTGonMIbdBcTJ3wjjX0fep/oQ6kiVUZcMVUsmbJiBm6i
	VkZR1jb/4LlUiFV/wRv8iZGXhTz1U4AahXG9QcC6KgTB7juG3aZEUw2tubTbla7iXKX90g6a5nB
	Fpwt6LpMbFuzqLzdgaf+sdVry8GsRjHiL5mb9iA==
X-Received: by 2002:a05:690c:9990:b0:85e:688f:3c52 with SMTP id
 00721157ae682-88d218333fbmr1035137b3.33.1789344876540; Sun, 13 Sep 2026
 17:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pujito Adnyana <zhee.tou@gmail.com>
Date: Mon, 14 Sep 2026 08:14:24 +0800
X-Gm-Features: AcwNN1UQSyl0b5EaIAq6TuIl5Dr2LpHbX5QEkrm4mUgWJ7xH8SeB5qeZ3wf1RWA
Message-ID: <CAEkMyrhPTh1Ws0Co6zHBq1aMhrhgam4yPBgbXAMPrffyAKpT4Q@mail.gmail.com>
Subject: Internal keyboard dead on ADVAN 1405 (APN21S-140P3-CS): i8042
 controller OK, keyboard device never ACKs
To: linux-input@vger.kernel.org
Cc: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

The internal keyboard on an ADVAN 1405 laptop (AMD Ryzen 5 3500U,
Picasso) does not work under Linux. The keyboard works correctly in
the BIOS setup utility and in the GRUB menu, so the hardware, the FPC
cable and the embedded controller are all functional up to the point
where the kernel takes over the i8042 port. An external USB keyboard
works fine, and the I2C-HID touchpad on the same machine works fine.

The i8042 controller itself passes its self-test and responds
correctly to every controller-level command. The keyboard device
behind it never acknowledges a single keyboard-level command, and no
scancodes are ever delivered.

System information
Model:        ADVAN 1405 (family "soulmate plus")
Baseboard:    SU / APN21S-140P3-CS
BIOS:         American Megatrends 2.03, 09/05/2024
CPU:          AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx (Picasso)
Kernel:       6.19.10-300.fc44.x86_64
Distribution: Fedora 44 (Workstation)
Firmware:     UEFI, Secure Boot disabled

DMI strings, for a potential quirk entry:

sys_vendor:      ADVAN
product_name:    1405
board_vendor:    SU
board_name:      APN21S-140P3-CS

This is not a regression introduced by a recent kernel: the same
problem was observed on Ubuntu before this machine was moved to
Fedora.

Symptoms
Internal keyboard produces no input at all under Linux, in the
graphical session and on the text console alike. Not even the Caps
Lock LED reacts.
The same keyboard works in the BIOS setup utility.
The same keyboard works in the GRUB menu (arrow keys and Enter
navigate the boot entries correctly), i.e. it is still alive after
UEFI hands over to the bootloader.
An external USB keyboard (04d9:0203) works normally.
The I2C-HID touchpad (093A:0255 on AMDI0010:01) works normally.
Kernel messages

Without debugging enabled:

i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect
       please boot with i8042.nopnp
serio: i8042 KBD port at 0x60,0x64 irq 1
atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
atkbd serio0: Failed to enable keyboard on isa0060/serio0
input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input4

The input device is registered, but it never emits an event.

i8042.debug trace

Booted with i8042.debug=3D1 i8042.unmask_kbd_data=3D1:

i8042: [0] 20 -> i8042 (command)
i8042: [1] 65 <- i8042 (return)
i8042: [1] 20 -> i8042 (command)
i8042: [1] 65 <- i8042 (return)
i8042: [1] 60 -> i8042 (command)
i8042: [1] 74 -> i8042 (parameter)
i8042: [1] 60 -> i8042 (command)
i8042: [1] 65 -> i8042 (parameter)
serio: i8042 KBD port at 0x60,0x64 irq 1
i8042: [2] f5 -> i8042 (kbd-data)
i8042: [211] ed -> i8042 (kbd-data)
i8042: [418] f4 -> i8042 (kbd-data)
input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input4

Observations:

Controller-level traffic is entirely normal. The CCB reads back as
0x65 (keyboard interrupt enabled, keyboard clock enabled, translation
enabled), is temporarily set to 0x74 during probing, and is restored
to 0x65.
A controller self-test (aa -> 55) passes whenever it is issued.
Every keyboard-level command (f5 disable scanning, ed set LEDs, f3 set
typematic, f4 enable scanning) is sent and never acknowledged. The
~205 ms spacing between consecutive commands is the command timeout.

Forcing a reconnect via

echo -n "reconnect" > /sys/devices/platform/i8042/serio0/drvctl

reproduces the same pattern. On one occasion, and only once across
many attempts, a late acknowledgement did arrive:

i8042: [943273] f6 -> i8042 (kbd-data)
i8042: [943474] fa <- i8042 (flush, kbd)
i8042: [943474] Interrupt 1, without any data

The fa arrived roughly 200 ms after the command was sent =E2=80=94 just pas=
t
the timeout, so the driver had already given up and the byte was
discarded during the flush. The accompanying "Interrupt 1, without any
data" suggests IRQ 1 was asserted while OBF was not yet set when the
kernel sampled the status register.

No <- i8042 (interrupt, kbd) line is ever produced, under any
configuration, when a key is pressed.

ACPI

The keyboard is declared in the DSDT as follows:

Scope (_SB.PCI0.SBRG)
{
    Device (PS2K)
    {
        Name (_HID, "MSFT0001")
        Name (_CID, EisaId ("PNP0303"))
        Method (_STA, 0, NotSerialized)
        {
            Return (0x0F)
        }
        Name (_CRS, Buffer (0x16)
        {
            0x47, 0x01, 0x60, 0x00, 0x60, 0x00, 0x00, 0x01,
            0x47, 0x01, 0x64, 0x00, 0x64, 0x00, 0x00, 0x01,
            0x23, 0x02, 0x00, 0x19, 0x79, 0x00
        })
        Name (_PRS, Buffer (0x18) { ... })
        Method (_PSW, 1, NotSerialized)
        {
            KBFG =3D Arg0
        }
    }
}

Points worth noting:

_STA returns 0x0F unconditionally. There is no _OSI-dependent branch,
so the firmware is not hiding the device from non-Windows systems. For
completeness, several acpi_osi=3D variants were tried anyway and made no
difference. (acpi_osi=3D! on its own additionally kills the backlight on
this machine and leaves the display blank.)
Resources are entirely conventional: ports 0x60 and 0x64, IRQ 1.
_HID is MSFT0001 with PNP0303 only as _CID. Linux matches on the _CID
and enumeration succeeds, so this does not appear to be the problem,
but it is unusual enough to mention.

The keyboard device and the embedded controller share a parent scope:

MSFT0001:00 -> .../LNXSYBUS:00/PNP0A08:00/device:3a/MSFT0001:00
PNP0C09:00  -> .../LNXSYBUS:00/PNP0A08:00/device:3a/PNP0C09:00

This suggests the PS/2 keyboard is emulated by the EC rather than
being an independent PS/2 device. The EC itself initialises without
complaint:

ACPI: EC: EC started
ACPI: EC: interrupt blocked
ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
ACPI: EC: interrupt unblocked
ACPI: EC: event unblocked
ACPI: EC: GPE=3D0x3
Kernel parameters tried, without success

Individually and in combination:

i8042.dumbkbd
i8042.nopnp
i8042.reset
i8042.reset=3Dnever
i8042.nomux
i8042.noloop
i8042.notimeout
i8042.probe_defer
i8042.unmask_kbd_data
atkbd.reset=3D1
acpi_osi=3D! acpi_osi=3D"Windows 2015"
acpi_osi=3DLinux

i8042.dumbkbd is of particular interest. With it, f5/ed/f3/f4 are
never sent, the CCB is left at 0x65, and the keyboard is left in
whatever state the firmware handed over =E2=80=94 yet still no scancodes
arrive. This suggests the firmware leaves scanning disabled on
ExitBootServices, so the keyboard genuinely needs the f4 that never
gets acknowledged. That leaves no working path: with f4 the command
times out, without f4 the keyboard is never enabled.

A cold EC reset (full power off, adapter removed, power button held
for 60 seconds) was performed before testing and changed nothing. The
machine has no Windows installation left, so no cross-check against
the vendor OS is available.

Question

Is there a way to make atkbd tolerate an acknowledgement that arrives
just past the command timeout, or to retry enabling scanning after the
initial probe? If a DMI quirk is the right mechanism here, I am happy
to test patches and provide any further data needed.

Full dmesg output, the decompiled DSDT and acpidump output are
available on request, or can be attached if preferred.

Thanks for your time.
Pujito Adnyana
+6285935178773
zhee.tou@gmail.com
