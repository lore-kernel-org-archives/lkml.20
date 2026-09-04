Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB537754C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525385; cv=none; b=FzJm0MM5ZuCwkCqDgwwPeTnYJc66fwumSx7eV2V9gDszD+ikxPSPkW91rsE+WeXK32Rn9RFBpeQqmzRMYvOX0b0NPuQAChKXdsAjDoIKwYvFxBINY3R0lq5inaEpOeTQ4TIJuRC8wY/23d7lDUtqYK3/zioC1OiKr0gTj/CcwQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525385; c=relaxed/simple;
	bh=BjHw8yd6/BRd04jmWpzQC2h5VXMVKxhfSIEDd4C9eng=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YL27znEVN+nkO/uDYOKJKqrhRHn52ciJBidJ6PGlpH/HxAZxA+BVo2/lGW8gBhav7XUcXO5grkwUqNCviAhCY+t2LdcDjVUMDpAeVCi41KOOmCQS8aib7nVwE1KBvNpwYFw5FaIMqbI2wvinXiNUpmVc1otkIity2nDcBOZwe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QYWwRhNa; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QYWwRhNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788525374; x=1788784574;
	bh=djvliklWdsfdgRdreD/2ckYAPqPbTY9IWX+kSKJv5Xo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QYWwRhNaP+svYpvlOQXn3irOYnmwkyk697zjGthqpkZEgK8ZRbgJJ7DNNdTx5lfZb
	 QUNE66MV8ygb1/8Z5OD69mtbeFK3Y0zRUZnE/0emuJ0pQLBwG229A+NYcxM27JZ0gB
	 04yUm4YgnSOOyfwtlmQq+Xr6MITsAceKc2OUVUOaaDXZuCSxu0xbB/Uf4pJj4yVJAT
	 fGojx8HBoBwkBmjbHOZ4JzTfc3F/puCC4Q2IK8oqBzJ407HWL7zmj9XTJFx3hKQlZE
	 ntHqhkV4+6X0tDutbFposrNwmRB9KF5jbpCeaVfFksysKvJXdyY34SHsZfM8hwv+GO
	 RO3/rK7ThsVJg==
Date: Fri, 04 Sep 2026 12:36:08 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Shuming Fan <shumingf@realtek.com>, Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Message-ID: <20260904123559.40620-1-lsa.uz@pm.me>
In-Reply-To: <10c5c5b4-cfd5-4d69-8312-ccff02a2e05c@linux.dev>
References: <20260830151516.44629-1-lsa.uz@pm.me> <20260830151516.44629-3-lsa.uz@pm.me> <10c5c5b4-cfd5-4d69-8312-ccff02a2e05c@linux.dev>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5fa4133fe976985b37ea4b7f186eba5dc4d9e59c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Pierre-Louis,

Thank you for the review of 2/2.

On 1/2 I have to correct the record, and the confusion is mine. That patch
is already upstream:

  9b30521074f0 ("ASoC: rt1320: run the initialisation preset on the first
                 hardware init")

applied from v1 on 2026-08-10, merged in asoc-v7.3 on 2026-08-18 =E2=80=
=94 twelve
days before I re-sent it as v3 1/2. I rebuilt the series after the v1
review and did not notice that one of the three had already been taken; the
cover letter says only that 1/2 is byte-identical to v1's 1/3, which reads
as "unchanged" rather than "already applied". So there is nothing to skip:
my own 2026-08-30 request not to apply it, and your agreement with it, both
concern code that shipped three weeks ago, and AUTOSEL has since proposed
it for 6.18. That is my error and I am sorry for the wasted attention.

Which leaves two real questions: whether it belongs in the tree, and what
the flag is actually doing. I have answers for both now, and they point in
opposite directions.


The change is a revert, not a workaround
----------------------------------------

The fallback is what the driver shipped with:

  bad0a07a7e61  rt1320 driver added         2024-05-21  v6.11
      if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) ||
          (!rt1320->first_hw_init)) {

  f465d10cd731  "Add support for version C"  2024-09-02  v6.12
      if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {

  9b30521074f0  restored                     2026-08-04  v7.3

f465d10cd731 is +2124/-23 and its commit message reads, in full, "This
patch added the support for version C". That condition was rewritten
because its body had to grow a VC branch, and the `||` half did not survive
the edit. Nothing in the message, and nothing I can find on the list,
suggests it was meant to go.

The siblings have never been without it, and all four commits are Shuming
Fan's, which is why I have put him on Cc =E2=80=94 he is better placed than=
 I am to
say whether the removal was meant:

  bad0a07a7e61  rt1320  2024-05-21  gate introduced, with the fallback
  936abb09c1c7  rt712   2024-06-20  gate introduced, with the fallback (x3)
  f465d10cd731  rt1320  2024-09-02  fallback dropped
  91f4ca732495  rt722   2025-04-16  gate introduced, with the fallback (x3)

In rt712 and rt722 the fallback is present in the very first line that ever
consulted the flag there =E2=80=94 three times each, for DMIC, jack and amp=
. Six
live instances across two drivers, and rt1320 the only one that lost it,
eight months after being the first to have it.

So I do not think anything about the flag needs to be understood before
that change is allowed to stand: it restores the driver's original
behaviour and makes it consistent with its siblings. What it lacks is the
tag saying so, which I should have found in August and did not:

  Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")

That would put the window at v6.12 through v7.2. Whether it is worth
backporting past 6.18 depends on whether any machine actually lands in the
gap, and =E2=80=94 see below =E2=80=94 I can no longer demonstrate one, so =
I am not asking
for that.


What the flag is doing, measured today
--------------------------------------

I went back to the hardware rather than argue from July's logs. Surface Pro
11 for Business, Ubuntu 7.0.0-30, with snd_soc_rt1320_sdw.dyndbg=3D"func
rt1320_io_init +p" on the kernel command line =E2=80=94 the dynamic-debug c=
ontrol
file cannot be written on this machine, because Secure Boot puts the kernel
in lockdown "integrity".

Two of its modules are local builds rather than the distro's, and it
matters for reading what follows: snd-soc-rt1320-sdw carries 9b30521074f0,
and the v3 2/2 quirk is backported into soundwire-intel, which is where
dmi-quirks.o lands in this tree. I checked the first of those in the
disassembly rather than trusting the build directory, which turned out to
hold different source: the gate reads the status register, tests BIT(5),
and falls through to a byte test of first_hw_init with both branches
entering the same block. So the fallback is present. The ghost is absent on
this machine today for the same reason =E2=80=94 the quirk is loaded.

The func_status value is read and printed before that gate, so the readings
themselves are independent of which version of the condition is compiled
in:

  condition                              amp func_status   BIT(5)
  cold boot, systemd poweroff to S5,
    RTC alarm wake                       0x61              set
  warm reboot                            0x61              set
  resume from s2idle                     0x41              absent
  driver unbind/bind                     0x41              absent

0x61 is NEWLY_ATTACHED | NEEDS_INITIALIZATION | HAS_BEEN_RESET; 0x41 is the
same without BIT(5).

On this machine the flag is therefore behaving as intended: raised on the
attach that follows a genuine power-on, absent on later re-attaches where
the part has kept its state.

The resume row is the one that says something about the hardware regardless
of the patch, because first_hw_init is already true there =E2=80=94 so the =
preset
is skipped on resume under the stock condition and under the restored one
alike. It is skipped, and the speakers still work. I checked that by
measurement rather than by log, because silence with every layer reporting
success is the failure mode here: a 1 kHz tone played to the speaker and
recorded on the internal microphone puts the 1 kHz bin 1697x over ambient
after a resume. The amplifier retains its programming across s2idle.

I cannot make the same claim from the unbind/bind row. There first_hw_init
goes back to false, so on this module the fallback fires and the preset
runs; sound after a rebind shows only that it ran.

I think 0x41 is also explained, and it is not a second reading of "this
part has been reset". All three drivers acknowledge exactly one bit:

  regmap_write(..., RT1320_SDCA_CTL_FUNC_STATUS, 0),
      FUNCTION_NEEDS_INITIALIZATION);

DEVICE_NEWLY_ATTACHED and FUNCTION_HAS_BEEN_RESET are never written back by
rt1320, rt712 or rt722 =E2=80=94 none of the three mentions HAS_BEEN_RESET =
at all.
So after the first attach clears BIT(5), what is left standing is 0x41, for
the rest of the boot. That is a question worth asking on its own: are those
bits meant to be acknowledged by the host, and is anything downstream
entitled to believe them? If they are write-1-to-clear status and nobody
clears them, then every reader after the first sees a function permanently
claiming to be newly attached and freshly reset.

It also means the patch I nearly sent instead =E2=80=94 treat HAS_BEEN_RESE=
T like
NEEDS_INITIALIZATION =E2=80=94 would have been wrong. It would re-run the f=
ull
preset and the MCU patch load on every resume and every rebind, driven by a
bit that nobody ever clears. I am glad I measured before writing it.


What I still cannot explain
---------------------------

In July this machine read 0x41 where it now reads 0x61, the amplifier was
unprogrammed, and the speakers were silent. Those logs are real and so is
today's table. I do not have a mechanism that turns one into the other, the
kernel and firmware were ruled out at the time, and I am not going to
invent one to tidy up the story. What I can say is that the case for
9b30521074f0 no longer rests on this laptop at all =E2=80=94 it rests on
f465d10cd731.

I still have the hardware and the instrumentation is now scripted, so if
there is a register or a moment you would want looked at, I would rather
measure what you ask for than keep guessing at what matters.

2/2 is the one that still needs applying. Run fully stock on 2026-08-30,
with distro modules and no quirk, this machine had no audio device at all:
"aplay -l" reported zero cards. It is not an optimisation. That it has one
today is only because the backported quirk is loaded.

Sergey

