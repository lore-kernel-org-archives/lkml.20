Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E539D3D0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531036; cv=none; b=RH3/QkBwyrsQUnSyUeiU6oLa2DFkMbA70vOU6piIRb9dDX7iivOSwgnIhIN3a46ipsXbiaO4hmAuswAGZPJt2jB6pxiDf2I7+26bV89hFhkGGwhR9ZwQAbBefvc6L5B995wSgwe5c532JzjRjbb5h4Re5hioG2x4pCVZGg7kPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531036; c=relaxed/simple;
	bh=RMdz6GEDCziF1NUEvfRkS1s/4PHiKk/NS8PWPsfg7+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He8zTG88ANNomCyRRfJ29b/MD35rsnRpygamy1eXzs3VgLVcscyEDv8+oGoNfKulJMWL4UvlPLHxfm5U5YvFBGE5bffPbaiXOSZd6USnitBkKlJIs8R2IwEtmYvrDV+mr6z/so2N9BczF/iFqgkQe9hTnO5bfU+6zDG/TmRGCj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qddUIexE; arc=none smtp.client-ip=95.215.58.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qddUIexE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RMdz6GEDCziF1NUEvfRkS1s/4PHiKk/NS8PWPsfg7+s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788531032; v=1; x=1789135832;
 b=qddUIexEkXyZJ2I7CJFTgxAtkCViVV1bniL3nvKE8LIj8tO2di2IDBW+2V+gmtrPXrPjePJp
 eBtflWrrhoda9/Nx/vMbCkkbC2RVo/ux+d2XjjiOCUhTEY78nns8uLhX9noAgv/ijEE58iY9gs/
 EQotJvwY8swnstQTMMbMLwmc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 501c6173c18cb7ba;
	Fri, 04 Sep 2026 14:10:31 +0000
X-Mizu-Trace-ID: 501c6173c18cb7ba
X-Migadu-Flow: FLOW_OUT
Message-ID: <592f3b8b-03a2-47b9-b275-b691cbd42d79@linux.dev>
Date: Fri, 4 Sep 2026 16:09:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] soundwire: dmi-quirks: drop the ghost RT1320 on
 the Surface Pro 11 (Intel)
To: Sergey Lebedev <lsa.uz@pm.me>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bard.liao@intel.com>, Shuming Fan <shumingf@realtek.com>,
 Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830151516.44629-1-lsa.uz@pm.me>
 <20260830151516.44629-3-lsa.uz@pm.me>
 <10c5c5b4-cfd5-4d69-8312-ccff02a2e05c@linux.dev>
 <20260904123559.40620-1-lsa.uz@pm.me>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260904123559.40620-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/4/26 14:36, Sergey Lebedev wrote:
> Pierre-Louis,
> 
> Thank you for the review of 2/2.
> 
> On 1/2 I have to correct the record, and the confusion is mine. That patch
> is already upstream:
> 
>   9b30521074f0 ("ASoC: rt1320: run the initialisation preset on the first
>                  hardware init")
> 
> applied from v1 on 2026-08-10, merged in asoc-v7.3 on 2026-08-18 — twelve
> days before I re-sent it as v3 1/2. I rebuilt the series after the v1
> review and did not notice that one of the three had already been taken; the
> cover letter says only that 1/2 is byte-identical to v1's 1/3, which reads
> as "unchanged" rather than "already applied". So there is nothing to skip:
> my own 2026-08-30 request not to apply it, and your agreement with it, both
> concern code that shipped three weeks ago, and AUTOSEL has since proposed
> it for 6.18. That is my error and I am sorry for the wasted attention.
> 
> Which leaves two real questions: whether it belongs in the tree, and what
> the flag is actually doing. I have answers for both now, and they point in
> opposite directions.
> 
> 
> The change is a revert, not a workaround
> ----------------------------------------
> 
> The fallback is what the driver shipped with:
> 
>   bad0a07a7e61  rt1320 driver added         2024-05-21  v6.11
>       if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) ||
>           (!rt1320->first_hw_init)) {
> 
>   f465d10cd731  "Add support for version C"  2024-09-02  v6.12
>       if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {
> 
>   9b30521074f0  restored                     2026-08-04  v7.3
> 
> f465d10cd731 is +2124/-23 and its commit message reads, in full, "This
> patch added the support for version C". That condition was rewritten
> because its body had to grow a VC branch, and the `||` half did not survive
> the edit. Nothing in the message, and nothing I can find on the list,
> suggests it was meant to go.
> 
> The siblings have never been without it, and all four commits are Shuming
> Fan's, which is why I have put him on Cc — he is better placed than I am to
> say whether the removal was meant:
> 
>   bad0a07a7e61  rt1320  2024-05-21  gate introduced, with the fallback
>   936abb09c1c7  rt712   2024-06-20  gate introduced, with the fallback (x3)
>   f465d10cd731  rt1320  2024-09-02  fallback dropped
>   91f4ca732495  rt722   2025-04-16  gate introduced, with the fallback (x3)
> 
> In rt712 and rt722 the fallback is present in the very first line that ever
> consulted the flag there — three times each, for DMIC, jack and amp. Six
> live instances across two drivers, and rt1320 the only one that lost it,
> eight months after being the first to have it.
> 
> So I do not think anything about the flag needs to be understood before
> that change is allowed to stand: it restores the driver's original
> behaviour and makes it consistent with its siblings. What it lacks is the
> tag saying so, which I should have found in August and did not:
> 
>   Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
> 
> That would put the window at v6.12 through v7.2. Whether it is worth
> backporting past 6.18 depends on whether any machine actually lands in the
> gap, and — see below — I can no longer demonstrate one, so I am not asking
> for that.
> 
> 
> What the flag is doing, measured today
> --------------------------------------
> 
> I went back to the hardware rather than argue from July's logs. Surface Pro
> 11 for Business, Ubuntu 7.0.0-30, with snd_soc_rt1320_sdw.dyndbg="func
> rt1320_io_init +p" on the kernel command line — the dynamic-debug control
> file cannot be written on this machine, because Secure Boot puts the kernel
> in lockdown "integrity".
> 
> Two of its modules are local builds rather than the distro's, and it
> matters for reading what follows: snd-soc-rt1320-sdw carries 9b30521074f0,
> and the v3 2/2 quirk is backported into soundwire-intel, which is where
> dmi-quirks.o lands in this tree. I checked the first of those in the
> disassembly rather than trusting the build directory, which turned out to
> hold different source: the gate reads the status register, tests BIT(5),
> and falls through to a byte test of first_hw_init with both branches
> entering the same block. So the fallback is present. The ghost is absent on
> this machine today for the same reason — the quirk is loaded.
> 
> The func_status value is read and printed before that gate, so the readings
> themselves are independent of which version of the condition is compiled
> in:
> 
>   condition                              amp func_status   BIT(5)
>   cold boot, systemd poweroff to S5,
>     RTC alarm wake                       0x61              set
>   warm reboot                            0x61              set
>   resume from s2idle                     0x41              absent
>   driver unbind/bind                     0x41              absent
> 
> 0x61 is NEWLY_ATTACHED | NEEDS_INITIALIZATION | HAS_BEEN_RESET; 0x41 is the
> same without BIT(5).
> 
> On this machine the flag is therefore behaving as intended: raised on the
> attach that follows a genuine power-on, absent on later re-attaches where
> the part has kept its state.
> 
> The resume row is the one that says something about the hardware regardless
> of the patch, because first_hw_init is already true there — so the preset
> is skipped on resume under the stock condition and under the restored one
> alike. It is skipped, and the speakers still work. I checked that by
> measurement rather than by log, because silence with every layer reporting
> success is the failure mode here: a 1 kHz tone played to the speaker and
> recorded on the internal microphone puts the 1 kHz bin 1697x over ambient
> after a resume. The amplifier retains its programming across s2idle.
> 
> I cannot make the same claim from the unbind/bind row. There first_hw_init
> goes back to false, so on this module the fallback fires and the preset
> runs; sound after a rebind shows only that it ran.
> 
> I think 0x41 is also explained, and it is not a second reading of "this
> part has been reset". All three drivers acknowledge exactly one bit:
> 
>   regmap_write(..., RT1320_SDCA_CTL_FUNC_STATUS, 0),
>       FUNCTION_NEEDS_INITIALIZATION);
> 
> DEVICE_NEWLY_ATTACHED and FUNCTION_HAS_BEEN_RESET are never written back by
> rt1320, rt712 or rt722 — none of the three mentions HAS_BEEN_RESET at all.
> So after the first attach clears BIT(5), what is left standing is 0x41, for
> the rest of the boot. That is a question worth asking on its own: are those
> bits meant to be acknowledged by the host, and is anything downstream
> entitled to believe them? If they are write-1-to-clear status and nobody
> clears them, then every reader after the first sees a function permanently
> claiming to be newly attached and freshly reset.
> 
> It also means the patch I nearly sent instead — treat HAS_BEEN_RESET like
> NEEDS_INITIALIZATION — would have been wrong. It would re-run the full
> preset and the MCU patch load on every resume and every rebind, driven by a
> bit that nobody ever clears. I am glad I measured before writing it.
> 
> 
> What I still cannot explain
> ---------------------------
> 
> In July this machine read 0x41 where it now reads 0x61, the amplifier was
> unprogrammed, and the speakers were silent. Those logs are real and so is
> today's table. I do not have a mechanism that turns one into the other, the
> kernel and firmware were ruled out at the time, and I am not going to
> invent one to tidy up the story. What I can say is that the case for
> 9b30521074f0 no longer rests on this laptop at all — it rests on
> f465d10cd731.
> 
> I still have the hardware and the instrumentation is now scripted, so if
> there is a register or a moment you would want looked at, I would rather
> measure what you ask for than keep guessing at what matters.
> 
> 2/2 is the one that still needs applying. Run fully stock on 2026-08-30,
> with distro modules and no quirk, this machine had no audio device at all:
> "aplay -l" reported zero cards. It is not an optimisation. That it has one
> today is only because the backported quirk is loaded.
It's rather hard to follow the references to patches and versions, and
if I am honest there are too many details...
If you have two versions of code where you get two different reads of
the same registers, then git bisect is your friend.

On these bitfields, the definitions of HAS_BEEN_RESET and NEWLY_ATTACHED
were controversial from the beginning when they were discussed in the
MIPI WG. My personal opinion was that they didn't make sense...

NEWLY_ATTACHED is a duplicate at the SDCA level of what is already
defined for the SoundWire enumeration process. I am not sure if there is
any merit in trying to deal with this bitfield, you could end-up in a a
situation where the dev_num is non-zero after enumeration but the
NEWLY_ATTACHED bit is still set. It's not obvious at all for how long
this NEWLY_ATTACHED bit is supposed to be set by hardware.

Same for HAS_BEEN_RESET. There are existing definitions at the SoundWire
level for sync loss, device reset with a register write and bus reset.
It's not clear for how long the HAS_BEEN_RESET bit is set in the SDCA
status register after a SoundWire-level event...I vaguely remember that
this bit was intended to deal with imp-def reset or to provide a
placeholder for future extensions, but for now this bit doesn't seem too
useful...

I would skip both definitions for now. The only one that really matters
is NEEDS_INITIALIZATION, since this could lead to 'no audio' problems.

The premise is that the SDCA hardware layers know if the context is
preserved or not, depending on what power rails are maintained during
the suspend phases. The idea was that the driver should only try to
re-download all the initialization tables - also defined as blind writes
- when the hardware sets this bit.
ut as usual placing trust in the hardware is risky if said hardware
doesn't implement this logic, i.e. it's reasonable to expect that some
chips will always set this bit even if it's not strictly required, or
never set it...
I think the logic to download the tables on the first_hw_init OR when
hardware sets this bit is perfectly reasonable, it can't think of any
reasons why drivers would have different tests.
