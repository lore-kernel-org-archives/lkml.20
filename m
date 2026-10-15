Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011552E046
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074087; cv=pass; b=ksRQUEUOEPHGDT5XsqVy92xShQy+V596QNTha9JVK/4XJPHBlFcRvbqtQDbNv9UHV8YrAdvfFTZBoMbsJGyBRyYx2rkwmoDw/nS3jjvuekVztKWvo0kUXr3ZvTXUjpOtHPOt7MmmbtRdt+8t3bP9C+V2QTIEkSzpphxF8kqUBIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074087; c=relaxed/simple;
	bh=HayAmmLBI/WF/AkMleopvPrrdy1dOmE7xAMyDaxUghs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uJDdeM3CEHdZ/6TsixuHNAn7Rf/ckkxWiqZ4JI/i68dt2XozNfsU8bo7AU9wNae4bm01kTcjnXEDABs+rrVJ1L4j21DMAczWsmiSEKIDtUPwznBVObQBBbzSrovtvJkX5E6NMzNAewmyIxENkxmNhJTd9vWRLxOdgLBMJ2Fuwe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9t4XZf4; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9t4XZf4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e6df2742cso819853866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792074084; cv=none;
        d=google.com; s=arc-20260327;
        b=BPLcbwwmxlODqzw4ebVJWW5KmvGWu2oeKKDK/2h1zIS1cMxAiCSFRuU6ME0jIQ12Pf
         Z1GTlztwkWuI4qInZEkCMupMqWf/ygIY2qhoySn7/eu22IEH17qlBsry07/cqPv/HQ0x
         YUiJblKth6THsv52Xh7BNIxBDzS8WauXhjc8vVhGCVclkvgEYgoCAgjfPYMUA25bcxYg
         XCxhCVmz0vnmffaj4L+JgA83/ggfPlTm4j76Rm7zsm/DGiucJXiOqpBaOGZVLiw2FQmO
         4GODBkcONQeypOPxb7um97b/ampou/63i02Rqjd53TWqdA1HufwDJumigX04buiuKdY3
         3sJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/8EK0KxjKp+jZTxkjps+lH3/bw/OLb+7lXjV6iL/Kg0=;
        fh=hjJPVa5cZdQshvJjCS5zyMmSWkT5DS0k+kE4rsMUPeE=;
        b=WYJXP4pGB68fYtlyqntwO4xdzfbFs4nLer4G/spps865MnSrUhCLV21DJaEQ+sJWb3
         f064OvDQJcvwkaDWYjccri5f+FJyr0CNUvuXgT/EFJ+fpUTGqFjgVMTDpxV+p0unMqvh
         dSetlzlpdk1pWVQTQmuvMhd4wARAn7nSl1vjoaUMX5X8i52TDokiyKwDFG+uKFMmyg9U
         MtR0wHPeK0u3uwHIll1WOeHmRJus8ZWFD6n6x6dV9Oy9CMYB+d1/N9QZhPRslspOmCH1
         ZeX9m3Wm6KZh3nIXbBZtpq7h4NEJv0MXpdpEp07HgSezJ0cStkiv0AfbKyJ1cl7qFVjb
         C5Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792074084; x=1792678884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8EK0KxjKp+jZTxkjps+lH3/bw/OLb+7lXjV6iL/Kg0=;
        b=a9t4XZf4lD2RH6Opnxarq8DY5cG8RuKSSxlox17uQS16Q1eTCERhSxvhLUPsiFVY/f
         2AQI7VRn7qPkDK+U8qg7Ch0yWttplnGd91uu1yYM1uCqcFo0/Nhxodg8OTgOps649y71
         q+g6QY0RlacumowbPGNj4m/JvCtA++xWMxxpXvTld8gtjTWCC6GumNaCSzxiOTIcC2nG
         TMu5r/6RrUgRRK91kFx4fnzueF0RQlJrDbaGOVC1/JMeDfpwwMOLbwMddjg9ztlCOTAH
         C2zgFqGRrRgx6ag6Gmsb/0oBDV/SyncCiJKM20np9K2b/lqEDe3Bd8rsNDuteF2nO1mk
         7sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074084; x=1792678884;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/8EK0KxjKp+jZTxkjps+lH3/bw/OLb+7lXjV6iL/Kg0=;
        b=KKjqDxZwKP7FruZG3FHl/hcd8szdI5CcvbalLgiG+m84493FXjY8ZPmwkTjZqLOqNj
         bplUpNq35OX/zq42NMlE4mUgaUJQrqG9a4S9hqKzTd5oq7aK539UUJlbw9xqSl6SqVt8
         sg9kgnPq5wv0MkXqIR/R1erG3o/WUEPeyFc4dboG6ogNSXwLWkNJqNEfZj+ePzwwwHPr
         kjxnaViuimS1WVwdlF7xSb4eVzDegJ/fFg0kKNZBZuC7bMpFNBJCbxJpoZo9q7on894J
         ec5pdGhX476xkhwNM499JEpvUq7+izr6atK4IzfVBvW9i1yIkHqtacayzARGCy7OTSgS
         mVHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNTE1DkI7SH3+g9keXQhL17qWeS/kYrP8w3GDDPZT2tK7FYX9L5ovEylxKU1GiMIKqYhu/DxrXxUWjU+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCJuWtLIet9lQQy1GBLM2UMwdeOceyI/Oo1AD6mvy4DTtoV1Db
	1HsNzYUenVNDwEe4AOlOulOjMOn0JbKYeWlyzoztCwmaOanXUTAa1MVHrV0WvD1dxsBT4fAjsoF
	KH7y0dHvO/JZk8k42rc+tR3kKtoIiGynf7EQNutI=
X-Gm-Gg: AYBFou0mrR4jXjOXKWNfyBx9Wsy+SlRrTHSYafj7xQleffl5zLK7aJ4ZlAz+XPvgJ4r
	Q+Avt/TgUKvNx02JGHzOUSmpB6DJW6ZqwSANAhA/vvAF9d+eeHfKTK9TPGw/ZBsd1F3XMG2Oqwm
	S3kBYmxf938DcAa/YTJ3FXyZJ3jcdF3HefM2FH8SH0LNRi9H8R32p1J/DVIjgyqczU0RuhygFWp
	bLcbVq/Orc869RYo7voxkmXnIL62O1tQcZ4LTkFt5uCVoxdT6ciAUEmXz4cjbsmTWQ63TFvjwYY
	hIylBiQzeAjhxTBT1+nfdJGTszg85W8z2W2QQnkqNkCcJbrgtVumeOAZUsaVIrg51AipGZPrFP2
	OZytRWqk9Zw==
X-Received: by 2002:a17:907:7ba3:b0:c29:f5d5:5aa1 with SMTP id
 a640c23a62f3a-c31aa097acdmr1897928666b.43.1792074084318; Thu, 15 Oct 2026
 07:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nikodem Sanecki <nikodemsanecki@gmail.com>
Date: Thu, 15 Oct 2026 15:21:11 +0100
X-Gm-Features: AclHuK-uMeM2OT-1SvHDE5B8L4CFd9ifGhVLzzenOjl_5vJC1fOzzee1rHAuyPI
Message-ID: <CAAUQFROUNCJo7EUn4eiDxSTd6pfPcQDP1_ma0G2k73DJtMnNVw@mail.gmail.com>
Subject: Hello, I'm reporting a Caps Lock LED issue on my Lenovo ThinkPad L13
 Gen 2 AMD running Arch Linux. I found a workaround that completely fixes it,
 and I hope the findings might help implement a permanent kernel fix. **A
 quick note:** This is my first time using Linux, and I'm a complete beginner
 when it comes to kernel development. I used ChatGPT (GPT-6) to guide the
 troubleshooting process, analyse my laptop's ACPI firmware, and interpret the
 results. I personally ran the diagnostic commands and verified the observed
 behaviour, but the technical explanation below is AI-assisted. Please correct
 me if any of the analysis is inaccurate. ## Problem Under Linux, the physical
 Caps Lock indicator LED never illuminates, even though the Caps Lock key
 itself works normally. The LED works correctly under Windows and during
 certain stages of boot, so the hardware itself is functional. After
 investigating, GPT-6 identified what appears to be a conflict involving GPIO
 11 on the AMD AMDI0...
To: westeri@kernel.org, andriy.shevchenko@linux.intel.com
Cc: linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Resending this report in plain text because my original email was
rejected by the linux-gpio and linux-kernel mailing lists for
containing HTML formatting. Apologies if you received the original
message twice.


Hello,

I'm reporting a Caps Lock LED issue on my Lenovo ThinkPad L13 Gen 2
AMD running Arch Linux. I found a workaround that completely fixes it,
and I hope the findings might help implement a permanent kernel fix.

A quick note: This is my first time using Linux, and I'm a complete
beginner when it comes to kernel development. I used ChatGPT (GPT-6)
to guide the troubleshooting process, analyse my laptop's ACPI
firmware, and interpret the results. I personally ran the diagnostic
commands and verified the observed behaviour, but the technical
explanation below is AI-assisted. Please correct me if any of the
analysis is inaccurate.

Problem

Under Linux, the physical Caps Lock indicator LED never illuminates,
even though the Caps Lock key itself works normally.

The LED works correctly under Windows and during certain stages of
boot, so the hardware itself is functional.

After investigating, GPT-6 identified what appears to be a conflict
involving GPIO 11 on the AMD AMDI0030 controller.

Booting Arch Linux with this kernel parameter completely fixes the problem:

gpiolib_acpi.ignore_interrupt=AMDI0030:00@11

The Caps Lock LED now works normally, and I haven't noticed any other
hardware issues.

System information

Device: Lenovo ThinkPad L13 Gen 2 AMD

DMI product name: 21AB004LSP

DMI product version/family: ThinkPad L13 Gen 2a

DMI vendor: LENOVO

DMI product SKU: LENOVO_MT_21AB_BU_Think_FM_ThinkPad L13 Gen 2a

Kernel: 7.2.9-arch1-1

Distribution: Arch Linux

BIOS: R1QET54W (1.40)

BIOS date: 2026-04-14

DSDT OEM ID: LENOVO

DSDT OEM Table ID: TP-R1Q

Diagnostic findings

The following is GPT-6's analysis of the diagnostic output and
decompiled ACPI tables.

1. Linux sends the correct keyboard LED commands

Using bpftrace, we observed that atkbd_set_leds() consistently returned 0.

Tracing ps2_command() for command 0x10ED produced:

SETLEDS: value=4, caps=1
SETLEDS: value=0, caps=0
SETLEDS: value=4, caps=1
SETLEDS: value=0, caps=0

The driver reports success and sends the expected Caps Lock states,
but the physical indicator stays off.

2. The embedded controller tracks Caps Lock correctly

The DSDT defines the CPLS field at EC offset 0x0F, bit 7.

Reading that byte through the read-only ec_sys interface showed it
changing from 0x00 to 0x80 when Caps Lock was toggled.

Enabling dynamic debugging in drivers/acpi/ec.c confirmed that each
Caps Lock press triggered EC query 0x78, which was scheduled, started
and stopped successfully.

3. Lenovo's firmware controls GPIO 11

The DSDT contains:

Method (_Q78, 0, NotSerialized)
{
    If (CPLS)
    {
        WFIO (0x0B, 0x00)
    }
    Else
    {
        WFIO (0x0B, 0x01)
    }
}

The WFIO method writes bit 22 using WMEM(), targeting address
0xFED81500 + (11 * 4) = 0xFED8152C.

This appears to control the Caps Lock indicator using GPIO 11.

4. The same GPIO is declared as an ACPI interrupt

In SSDT12, _SB.GPIO._AEI declares GPIO 11 as an edge-triggered,
active-low, exclusive wake interrupt.

Its _EVT handler includes:

Case (0x0B)
{
    MSTP (0x3911)
    Notify (\_SB.PCI0.GPP1, 0x00) // Bus Check
}

This appears to conflict with the firmware's use of GPIO 11 as an output.

5. GPIO registers confirm the suspected conflict

Without the workaround, /sys/kernel/debug/gpio showed:

#11 ... input ... 0x457a00
#11 ... input ... 0x057a00

Pressing Caps Lock changed bit 22, but bit 23 (output enable) remained cleared.

After booting with:

gpiolib_acpi.ignore_interrupt=AMDI0030:00@11

The result was:

#11 ... output ... 0xc50000

The output-enable bit was now set, and the physical Caps Lock LED
worked flawlessly.

The system was already using atkbd.reset=1 for a separate
keyboard-backlight problem. That parameter alone had not fixed the
Caps Lock LED.

Possible explanation

GPT-6's interpretation is that Linux's ACPI GPIO handling configures
GPIO 11 as an interrupt input because of the firmware's _AEI
declaration.

That disables the output driver, even though the firmware continues
updating the GPIO output-value bit when Caps Lock changes.

Ignoring the interrupt allows the pin to remain configured as an
output, restoring the indicator.

Related upstream fix

This seems very similar to the Acer Nitro V 16S AI issue addressed by:

6da1f3437435c82eaa15b121022474bb358ffe20

"gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro V 16S AI"

https://lists.openwall.net/linux-kernel/2026/10/02/1029

However, there is an important difference.

On my ThinkPad, the GPIO 11 _EVT handler issues a PCIe bus-check
notification. I therefore don't know whether permanently ignoring the
interrupt could interfere with PCIe-related events, hot-plugging or
wake behaviour.

So far, normal use with the workaround appears unaffected, but I
haven't exhaustively tested those scenarios.

Question

Would a DMI-specific gpiolib ACPI quirk be appropriate for this
ThinkPad, or should the conflicting GPIO declaration be handled
differently because of the PCIe notification?

I can provide the relevant decompiled DSDT/SSDT excerpts, additional
diagnostic logs, or test a proposed fix if that would help.

Thanks very much for your time, and apologies if I've misunderstood
any of the technical details. I'm happy to run further tests with
guidance.

Best regards
