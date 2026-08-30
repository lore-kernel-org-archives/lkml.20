Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C02DF137;
	Sun, 30 Aug 2026 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788112093; cv=none; b=c14Nowx+DyrXMPAKwWA1IbZnkzrOsHs1QZSlPNn0+GVclFHNYwAsocwbvtq6waqdtkrHUKHCIQQpV5euGdiVx/6xR5f46fyEFJTcXTPJ/ti5G86kgXHfN/ynAo2fE8HPxFE7NbYV8XsnFt5Y0HLdbw83SOUNRBHTBLvr+6e2YZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788112093; c=relaxed/simple;
	bh=0dwYuIRy09qEXh5E1UNY7V77iT2mRnI48LT4TNrU9+k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKDOkcemrgv27nWicUSKqN4Hze+EXeLszUDW47i2PX0et+YCdmsVgobgukq6ciXj1MDYGSTAmQIf3CctXrJvjh8CcuoW4KvE9ruQUHa1cbVj6ZcsML5ImyvrCmmSqeQt0JkTrEBulAx39HZo8Ncaszys8OhbQtb2TrfH25it5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=SOA/T3CS; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SOA/T3CS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788112077; x=1788371277;
	bh=zv9vquX8nTqhi7EME/PqC6Bu9cxQo7Fyu3/pcfxF3No=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SOA/T3CSj+pIIepj5ctF07dDhcZ3w3ms8aKswaTvcb6HxlzLiyl/nxx+znTfjOuOE
	 cx5sPSxjr0AY9h8awqalEaLJr9UeOmDQpRc8D3ELvKuOsXW1i7htaXmQwLYKbiYwHq
	 26Etww8G5lGa+8o6JGiCOrcsT+OZVE/8gfgeIny6mgHazFNvS0g61x36gTtxgksOO+
	 YT1FawCCYtRDDmDSRkEeFYCtiYGI/wiflirEB0BDYsuLR+ZlNX3eYos8dQfineXfG8
	 y4zbndYptTMN5+6IdNuXu3wNqz8w5H44E6Y+CnpOPHjsuor2vzD6lvBS6yr97yPjCc
	 uI2q+mXa9/IFg==
Date: Sun, 30 Aug 2026 17:47:51 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Shuming Fan <shumingf@realtek.com>, Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ASoC: fix audio on the Microsoft Surface Pro 11 (Intel)
Message-ID: <20260830174741.39644-1-lsa.uz@pm.me>
In-Reply-To: <20260830151516.44629-1-lsa.uz@pm.me>
References: <20260830151516.44629-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: dd3d78aa049eb4b4ab49b5ba8600a6043c621d41
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Please do not apply 1/2. I cannot reproduce the condition it fixes, and I
would rather say so myself than have it found in review.

The patch rests on one claim: that this part never sets
FUNCTION_NEEDS_INITIALIZATION, so rt1320_io_init() never runs the vendor
preset and the amplifier is never programmed. Every func_status line I
recorded in July reads 0x41 - NEWLY_ATTACHED | FUNCTION_HAS_BEEN_RESET,
without BIT(5).

Re-tested tonight on the same machine, with the stock rt1320 driver and my
patch not loaded:

  rt1320-sdca sdw:0:0:025d:1320:01: rt1320_io_init amp func_status=3D0x61
  rt1320-sdca sdw:0:0:025d:1320:01: rt1320_vc_preset, RT1320_KR0_INT_READY=
=3D0x0
  rt1320-sdca sdw:0:0:025d:1320:01: rt1320_vc_preset, RT1320_KR0_INT_READY=
=3D0x1f

0x61 is 0x41 | BIT(5). The bit is set, the stock driver runs the preset, an=
d
the patch is a no-op. Same reading in three configurations - with the ghost
_ADR removed, with a machine-entry approach that leaves it enumerated, and
fully stock - and on a genuine cold boot, not a reboot: the previous boot
ended in systemd-poweroff and an RTC alarm brought the machine back from S5=
.

The speakers work without the patch, and I checked that by measurement rath=
er
than by reading logs, because silence with every layer reporting success is
the exact failure mode here. Playing a 1 kHz tone and recording the interna=
l
microphone, the 1 kHz bin rises 185x over ambient with the patch absent, 61=
0x
with it present. Both are unambiguously audible; the difference is room noi=
se.

What I ruled out:

  - the gate is unchanged. if ((amp_func_status & FUNCTION_NEEDS_INITIALIZA=
TION))
    is identical in v7.0 and v7.1-rc7, the tree this series targets
  - Ubuntu changed nothing relevant between 7.0.0-28 and 7.0.0-30: no rt132=
0,
    sdca, soundwire or sdw entry in the changelog
  - firmware predates the July readings. firmware-sof-signed went to 2025.1=
2.2
    on 2026-07-27 and the Surface firmware bundle was applied 2026-07-28
  - the ghost is not involved: fully stock, it never reaches rt1320_io_init=
()
    at all, and the real device still reports 0x61

So I have no explanation for the change, and I am not going to invent one. =
If
someone knows how an SDCA part stops asserting that status bit between one
month and the next, I would like to hear it - that is worth more to the
subsystem than the patch was. I still have the hardware and will test whate=
ver
is useful.

2/2 is unaffected and I would ask that it still be considered. I re-verifie=
d it
the same night by running fully stock:

  sysfs: cannot create duplicate filename '.../sof_sdw/SDW0-Capture-SmartMi=
c'
  kobject_add_internal failed for SDW0-Capture-SmartMic with -EEXIST
  sof_sdw sof_sdw: probe with driver sof_sdw failed with error -12

aplay -l reports zero cards. Without the quirk this machine has no audio de=
vice
at all, so that patch is not an optimisation.

One more result from the same night, since it bears on the approach. I comp=
ared
this series against the downstream machine-entry patch that Surface Pro 11 =
users
run today, on one machine and one kernel, swapping only the audio modules. =
Both
end up with the same configuration - same three function topologies, 4 play=
back
+ 1 capture, rt1320-1, working microphone. The difference is what each cost=
s:
the machine entry does not match at all unless class_id is added to
SDW_CODEC_ADR_MASK and to the peripheral comparison in soc-acpi.c, because
generic matching sees two peripherals for the one address it declares. That=
 is
shared code for every SoundWire machine. Removing the ghost at enumeration =
needs
no such change.

Sorry for the noise on 1/2.

Thanks,
Sergey

