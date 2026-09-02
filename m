Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392814AA408
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367411; cv=pass; b=VSUHSgYnNEJ5/SvTuz1iw3Euvje+C/+9x7563u4DNTwr1QPexQ21Pk23jP/BVu+l7dH7PkJbqCtB3DL/zuSICd5WFXsRovfM7el0chpd8TKkS76i7jAxfxtXNqVnn0XNYwDcRFfvz5CTvvoisKCmNwT/K3lCsKGIatY+ljHOAA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367411; c=relaxed/simple;
	bh=Kp26VVEdhQbaknS8+JZvvugxlSGpf7HG3hY5g1kX4/4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=S2R0OLjmrsCtBnaM9mZbObl/lsX6vRzkP90/EHpBs4+uqIUPIjGRjujf9kK6J1ZfYgZ0fHWWU1b+g//s5aVfrdAl7nDwYB8hAHi7qHmyVsZYES4JnnSy0sv4HM7onMmJ2geMDiTeunYeTNLwJyusm8FttVj4PcYgttsGlHU3lMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuxxkmhl; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuxxkmhl"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc149372c14so1041385a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788367408; cv=none;
        d=google.com; s=arc-20260327;
        b=gn0DHEmcJG4EiomohGA1v9sLdS12yZufu5TFXRHAXj0UIf24lBqNmPp/w/YiPmsywU
         a+mwMQlwsDYMt3pEZbstlS70sS7bKD6zPqkZazCQQ/Bexr6zSElrEsrOyyaTF1WKQmL0
         6iVi9kEvhJLIe5k4//nCEJtfsoMSJG7TLqaLUW0dMMpruqajUARMHIzHmvjmXI3Y39W5
         072zNmxvziWr22R4E/ibXwq0Nm2I9e0JRIuh/L2VgWoy8BuQ5v/u9RHRZsvFRylHjaaI
         UVxg6ohayZPXglRcvHn6Q0IB89niSLHRzgpAXlxG/4ZpTUAja3YNQgl23BeCfT5zplZT
         yhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HScMA7QIvS1kddJwm0MTsNamqIl+iszNC5tAlIKIMpA=;
        fh=aMzWRZuPv1OcEoegrT4GunqKybttE5fFtHqKKN7je0I=;
        b=k9tdmYljxoo6OP3Y1UxnLERa19ylEJqtv4551qqJu3TMXJXU2kxeW9u/VEd/E5DbPN
         xDetc0KaB+qJIAaURjn3oQcnpHTyWWxS3/SKBuNQitRi6UfODWIEkzn8IujzKmgZSprY
         sU1fHv6s/LjxKLGtBalXB9+gPzxOWn5cGRqIrr9aU6U0dDx3I9CvDFbJ8WmuZboKcY6s
         eFwuus2MaIRvWoKMdgfjAcq3CWmHqey+72ZcvA6Jlxw98iruqM8CO4HUdnUOrfofIGQF
         3ahpsH8QcAXzq4xsKVa8PxLhbyt5wP2Lzt2T7+PIwt4YtgUISR37M2sZICda6DQ9NTFr
         5SNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367408; x=1788972208; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HScMA7QIvS1kddJwm0MTsNamqIl+iszNC5tAlIKIMpA=;
        b=fuxxkmhlK8o56HtUSo9GHXxBgSg5SzLVbY7j3lAauLOTVk+DbaAb3IUc85Uylad8bN
         bYOTDKx+LkiAwVudr4Jrx6MPjuAx5blEcxBYGdx6TonflP7Qzf0cv9W1SvJziO4wXGyx
         nMhuv58N+E7p2Q/0m2qu4fjBpa7Ts04mr8IRdyD4wuB6lBQmizGmZVIkz5tJ5RVcD7S0
         Utpb+zqX4fWxVrr9WJdrzSOvs0dtyqKq5dm2mihD0S+5ZULleHRB1Nuu1UDC+49mQJyG
         bEnGrC2IQN8ddZN4/kAEDEAPoRKfLTWNDJGCgjx2Yp04syE2mKjJDiOVq0w71m8yO9Ou
         ZeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367408; x=1788972208;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HScMA7QIvS1kddJwm0MTsNamqIl+iszNC5tAlIKIMpA=;
        b=Yw9W0njr7uKEeuUG0OMwmQBv8MizE4RB2eeiFBeWG+RdrwrMX1IPDC6TgOdEsXA7aw
         zoZZqaQS4bGoOcMcRnA5rCtKexmb+SVjDvdB1v3UUncWncK2QrWu9ucZaHU7X6/5Gw0K
         6397euXXyTwvzu8WnFhnEKgfZLadl6alg55g9VN6cSDh2uVzskD0Iw/9/JB6lQhx4v1m
         7wvobKG22kwB8L32N3OxQFFUoKpROJI4FPnV+KEfowOuWEa4hev3q3n9eqRwVa7itq2y
         sTUzo5E93QCRs0de8VMmYbhOfMp/izVmiXlPrtLyisN2EzuuUwuVK0hc6AV79RIyEihV
         wo0w==
X-Forwarded-Encrypted: i=1; AKwUvBwON30DiNRcfOWPHTFg8sIqfY3/AbYPMGGc1bNLW7unGdAWh299yTGMDO8CVvaxU9L5FlsGxU45e4J+9C8=@vger.kernel.org
X-Gm-Message-State: AFuF++lIMYJ/+kUvYGsT1d4oJo+A1Vf971z9bNuoEPVyk/90DqORSaT/
	gluy9TN+iadrH85K/v4xkCGupDj8ef3uTBFQ38Up0vyuVqLipJcCJpEf0ZYS0gZOiZz+HvP1Lds
	kPxvo9S6XXjlahByimXYvt9q+Ao77nlU=
X-Gm-Gg: AYBFou1HaZcXaVyH+6czTxK0cDZrIF/WUDwkIR9M/ORAF3zLzkolIh/VHfDWsJgoS0e
	7JrXFffekCSINvcK8e9v9PPKV4BfTAlctfryzPTEjEBmjv4f2hcxUvybSBJgUM9cZ0mzPxxClMO
	BksF0aokfZ71MHTRRYpm5JBap/7Fg/5aw3rNSzKPvQHwPJKpqxOeM+llY2Q5DtwGjh3Qc9SKQuz
	yeyulEquNOa+GrD/z0dnLkzLmby0vp448QPza/bHwHf5v6TP4Cb7szsz/KI0Tcl27PEqfVZ2u/L
	KDLiTAUCSdQRbftKoj1KvDHxbFKVE/EXsdtDVudBhw==
X-Received: by 2002:a17:90a:fc45:b0:38f:efed:5448 with SMTP id
 98e67ed59e1d1-39aedf2014amr9538080a91.8.1788367407690; Wed, 02 Sep 2026
 09:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Cristian Timohi <cristiantimohi@gmail.com>
Date: Wed, 2 Sep 2026 19:43:15 +0300
X-Gm-Features: AcwNN1XftVetPufXuMVWuVQIJZqhHXPeKpTRP7zMy62wfByc6GjrVO3noGleBYw
Message-ID: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
Subject: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Vijendar.Mukunda@amd.com
Cc: venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org, 
	oder_chiou@realtek.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, broonie@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

****
Resending as plain text, as the previous message was rejected by the
vger.kernel.org mailing list due to an HTML MIME part.
Apologies to recipients who received the previous copy directly.
***

Hello,

I'm reporting an audio issue on an ASUS TUF Gaming A14 FA401EA
(Ryzen AI MAX+ 392) using AMD ACP70 SoundWire and a Realtek RT721
SDCA codec.

I have reproduced the issue on a clean current vanilla 7.3-rc1
kernel, so this does not appear to be Fedora-, PipeWire-, or
desktop-specific.

Current clean test environment
==============================

Distribution:
    Fedora 45

Kernel:
    7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64

snd_acp_sdw_legacy_mach quirk:
    -1

There are no remaining custom snd_acp_sdw_legacy_mach/modprobe
overrides in the current reproduction environment.

Hardware
========

Laptop:
    ASUS TUF Gaming A14 FA401EA

DMI product:
    TUF Gaming A14 FA401EA

DMI board:
    FA401EA

BIOS:
    FA401EA.304

CPU/APU:
    AMD Ryzen AI MAX+ 392

Audio:
    AMD ACP70 SoundWire
    Realtek RT721 SDCA

The SoundWire bus exposes one peripheral:

    sdw:0:1:025d:0721:01: Attached

I do not see TAS2783 devices enumerated on this unit.

Known-good cases
================

The laptop's built-in speakers worked correctly under the
factory-installed Windows 11.

USB audio also works correctly under Linux. I tested Corsair
Virtuoso USB headphones and normal audio playback works.

Therefore the issue appears specific to the internal
AMD ACP70 -> SoundWire -> RT721 audio path.

Actual behavior
===============

Internal speakers:
    Completely silent.

3.5 mm headphone jack:
    No intelligible audio is produced.
    When the analog audio path becomes active, the headphones produce
    a continuous buzzing noise. The buzz stops when the playback/path
    is deactivated.

Opening the desktop sound control panel can also trigger the buzzing
while the analog audio path is active.

ALSA playback devices
=====================

The amd-soundwire card exposes:

    device 0:
    SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0

    device 2:
    SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2

Direct ALSA reproduction
========================

Internal speakers:

    speaker-test -D hw:CARD=amdsoundwire,DEV=2 \
        -c 2 -r 48000 -F S16_LE -t wav

The PCM stream starts normally without an ALSA error, but there is
no physical speaker output.

Analog headphones:

    aplay -D plughw:CARD=amdsoundwire,DEV=0 \
        /usr/share/sounds/alsa/Front_Left.wav

No speech is heard. The headphone output only buzzes while the
audio path is active.

Zero-PCM test
=============

I also sent only zero-valued PCM samples:

    timeout 10s bash -c '
    dd if=/dev/zero bs=192000 2>/dev/null |
    aplay -D hw:CARD=amdsoundwire,DEV=0 \
          -t raw -f S16_LE -r 48000 -c 2
    '

The headphone jack still buzzes while the zero-PCM stream is active.

Therefore the buzz does not appear to represent corrupted application
audio; merely activating playback is sufficient to produce it.

Mixer / UCM
===========

Speaker:

    Speaker Switch = on
    rt721 FU06 Playback Volume = 87,87

Headphones:

    Headphone Switch = on
    rt721 FU05 Playback Volume = 87,87

I also explicitly enabled the corresponding Speaker and Headphones
UCM devices. This did not change the result.

ASoC DAPM during speaker playback
=================================

I inspected debugfs while speaker-test on the SmartAmp PCM was
actively running.

All relevant widgets were ON:

    Speaker: On
    rt721 DP3 Speaker Playback: On
        stream DP3 Speaker Playback active
    rt721 DP3RX: On
    rt721 FU 21: On
    rt721 FU 23: On
    rt721 PDE 41: On
    rt721 SPK: On

The DAPM graph therefore appears to activate the entire expected
speaker path:

    DP3 Speaker Playback
      -> DP3RX
      -> FU 21 / FU 23
      -> SPK
      -> Speaker

but the physical speakers remain silent.

Kernel messages
===============

RT721 attaches successfully.

I see:

    rt721-sdca sdw:0:1:025d:0721:01:
    Driver needs fixing: Unsorted reg_defaults, sorting the copy

On an earlier 7.2.x boot I also observed:

    soundwire sdw:0:1:025d:0721:01:
    PARITY error detected before INT mask is enabled

I did not observe additional SoundWire/RT721 errors when starting
or stopping playback.

Kernels tested
==============

The same issue was reproduced on:

    Fedora 44:
    7.2.2-300.fc44.x86_64

    Fedora 45:
    7.2.2-300.fc45.x86_64

    Vanilla mainline:
    7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64

    CachyOS kernel:
    7.2.2-cachyos1.fc45.x86_64

The current reproduction is on the clean vanilla 7.3-rc1 kernel.

Previous experiments
====================

Before testing clean mainline, I also built a Fedora 7.2.2 kernel
locally and experimentally changed the RT721 speaker endpoint in:

    sound/soc/amd/acp/amd-acp70-acpi-match.c

from:

    .aggregated = 0
    .group_id = 0

to:

    .aggregated = 1
    .group_id = 1

This did not change the behavior.

I also tested that custom kernel with:

    options snd_acp_sdw_legacy_mach quirk=32768

The kernel reported:

    amd_sdw amd_sdw: Overriding quirk 0x1 => 0x8000

but there was still no speaker output.

Those experimental overrides have been removed. The current vanilla
7.3-rc1 reproduction uses quirk=-1 and no custom modprobe options.

Question
========

Could this FA401EA variant require a different RT721-only topology,
ACP70 configuration, SoundWire setup, or codec initialization quirk?

The fact that all-zero PCM causes the analog headphone output to buzz
while the stream is active may be particularly relevant.

I'm happy to test patches or provide register/debug output.

I can also provide full alsa-info, kernel journal, lspci output,
SoundWire sysfs state, mixer state, and DAPM debugfs output.

Thank you.
Cristian
