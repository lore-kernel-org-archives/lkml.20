Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E4B476CE7;
	Fri, 11 Sep 2026 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131877; cv=none; b=qqLY/fCPoYBuSnLUSTs2Tu2/ihyUZv5es0AskvVuNGACT6lcFMFMo099uthrJ9vZEsmOOfyoHsvsbCBUGotDs7/SKSff2X+Z4nYKYNVpnPmv3NmFcd2uz3Ie8TskUJvjwNSVrF7ScTArwjQGnMjtd8Jw1l2pyopdi0oaRXglTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131877; c=relaxed/simple;
	bh=aASjVvft59hgV4TzpOP2BdR6eWlXB8Et+zCOjURtGmY=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=rEymYRes60FIt9v4N5+9S6V3I9hYeetI4qBTXsYFlam1b8jt+zaMjE2LJYOMekuqDy45RyD+wMuuO6Hs6Oze/xOdDEcKbrthJFuOtlZXRhl2dh3FJX0SsNO/ygp86hhVVsdeydO84QsxS6gfJN2dijaOo6foZMkEfXlKPeEXE9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QhejHlN3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CEgtjQ3C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gAZifzcZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eJ1muLvB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QhejHlN3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CEgtjQ3C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gAZifzcZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eJ1muLvB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF47C219BF;
	Fri, 11 Sep 2026 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789131870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ftNAmWL3edl1xDtAmfcdpdghqAzIiyuhEm+MgxBkPZM=;
	b=QhejHlN3L3NeuUpTFDWfob2hOJ90Ad4KD/bRie+7lLy590yjNua03rtfsfP6nFbSVp5zvv
	ji56V+m6BGCQAe+9LjFpakQcKgSWxfcGcPig9GGMFEYH9LNSf2cuyLc7iTh4Sfeol0gkCS
	47WJdsUka0xmCDhraTJxmd9RMJgPVYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789131870;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ftNAmWL3edl1xDtAmfcdpdghqAzIiyuhEm+MgxBkPZM=;
	b=CEgtjQ3C8AFEnvX6pnjfbgg4A3Q4qwgTHkRJ+447dUpR2fcye8VamybateedzYKUP8gvgF
	6A1SK8fQzZn3aoDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789131865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ftNAmWL3edl1xDtAmfcdpdghqAzIiyuhEm+MgxBkPZM=;
	b=gAZifzcZ2FUugqNrxFCxEvQWzMp9tpoRfMTRxWxlPesFD+4Db4RwXxODaKsiqizOCkdTBJ
	ib368UmEfbUAjbO6MYrDSowHIlMRre0t+5+r4r9VVOKBCUvUsnddLzg1jVacxIzgmzae0j
	Cple2rqwhSX3IXHYmr7Z4w5vEfk9+b8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789131865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ftNAmWL3edl1xDtAmfcdpdghqAzIiyuhEm+MgxBkPZM=;
	b=eJ1muLvBRspAP5RGZ2XzH6/TeX1+08Rdoi1LSJnYo7bEhlJs4hvKODgkmyskACE5LLJ1Lr
	uC2GPyQ1jPUegpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C76F136ED;
	Fri, 11 Sep 2026 13:04:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jIEBIVn8o2q2JAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Sep 2026 13:04:25 +0000
Date: Fri, 11 Sep 2026 15:04:25 +0200
Message-ID: <87pkykhrc6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.3-rc3
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

Linus,

please pull sound fixes for v7.3-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc3

The topmost commit is e10f2b7e28be3e1ce42a4be8fa9b0684d1d354ac

----------------------------------------------------------------

sound fixes for 7.3-rc3

A collection of device-specific small fixes.  At this time, the
majority of changes are about ASoC while we have usual suspects like
HD- and USB-audio quirks.  Some highlights below.

ASoC Intel / SoundWire:
- Fix bus and stream resource leaks at error path in avs and hda-ext
- More fixes and refactoring in avs for constraining MSBs, async
  handling d0ix
- Add support for TAC5xx2 SoundWire family and NVL MAX98360A RT5682
  machines
- Fix uninitialized stream configurations in Realtek SoundWire codecs
- Adjust latency control to fix no-sound issue on RT721-SDCA

ASoC AMD:
- Avoid binding for the acp-da7219-max98357a machine driver
- Add quirks for Acer Nitro AN17-41 and HP 255R G10
- Fix memory leaks in ACP6x

ASoC Codecs & Platforms:
- Fixes for cs35l56 to avoid deadlock, kexec race, and runtime PM
  imbalances
- Split stereo streams across mono amps on tas2783-sdw
- Fix pop noise on es8326 and enable_count underflow on es8389
- Various fixes for fsl_micfil, sprd, sti, and publish OF module
  aliases
- Fixes & cleanups for Ux500 (MSP/I2S) and AB8500 codecs

HD-audio:
- Fix for channel status notification changes
- Quirks for HP laptops

USB-audio:
- Fix embedded URBs in caiaq, 6fire, hiface, and ua101 drivers
- More hardening in usx2y and us122l drivers
- Quirks for Behringer devices

Misc:
- Add PCI ID for RME HDSPe AIO PCI Express audio card in hdspm
- Fix S/PDIF passthrough on CA20K2 in ctxfi

----------------------------------------------------------------

Aaron Welwood (1):
      ASoC: amd: yc: add quirk for Acer Nitro AN17-41 internal mic

Antoine Monnet (1):
      ASoC: tas2783-sdw: split a stereo stream across the two mono amps

Cezary Rojewski (10):
      ALSA: hda: ext: Clean up links if their initialization fails
      ALSA: hda: ext: Clean up streams if their initialization fails
      ASoC: Intel: avs: Clean up the bus when its initialization fails
      ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
      ASoC: Intel: avs: Clean up streams if their initialization fails
      ASoC: Intel: avs: Do not ignore -ENOENT when loading a topology
      ASoC: Intel: avs: Cancel d0ix_work asynchrounously during recovery
      ASoC: Intel: avs: Fix unbalanced module reference count
      ASoC: Intel: avs: Refactor and fix init_config access
      ASoC: Intel: avs: hda: Constrain MSBs on startup

Edward Adam Davis (1):
      ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev

HyeongJun An (1):
      ALSA: hda: Report a change when only the channel status bytes move

Jack Yu (1):
      ASoC: rt721-sdca: Adjust latency control to fix no-sound issue

Jairaj Arava (1):
      ASoC: Intel: sof_rt5682: Add support for nvl_max98360a_rt5682

Kazuki Hanai (1):
      ALSA: us122l: Prevent write upgrades for read mappings

Krish Gulati (1):
      ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED

Linus Walleij (15):
      ASoC: ab8500: Reset the audio block before configuring it
      ASoC: ab8500: Repair the DAPM capture graph
      ASoC: ab8500: Correct digital interface format setup
      ASoC: ab8500: Validate and program TDM slots correctly
      ASoC: ab8500: Remove the nonfunctional sidetone apply control
      ASoC: ab8500: Skip missing DMIC GPIOs on AB8505
      ASoC: ux500: Fix MSP stream lifecycle handling
      ASoC: ux500: Propagate MSP setup errors
      ASoC: ux500: Correct MSP frame and bit clock setup
      ASoC: ux500: Validate MSP DAI configuration
      ASoC: ux500: Deassert the MSP reset during probe
      ASoC: ux500: Request the MSP MMIO resource
      ASoC: ux500: Remove obsolete PRCMU QoS calls
      ASoC: ux500: Allow repeated MSP prepare calls
      ASoC: ux500: Program the MSP FIFO watermarks

Nick Pegg (1):
      ALSA: usb-audio: Add quirk flags for Behringer UV1

Niranjan H Y (1):
      ASoC: Intel: sof_sdw: add tac5xx2-sdw family

Richard Fitzgerald (3):
      ASoC: cs35l56: Fix pm_runtime imbalance if suspending before first attach
      ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration
      ASoC: cs35l56: Fix race between kexec and snd_soc_register_component()

Roman Prucha (1):
      ALSA: ctxfi: Fix CA20K2 S/PDIF passthrough

Ruairi Anthony (1):
      ALSA: hda/realtek: Add quirk for HP Elite Dragonfly Max G2 speaker

Runyu Xiao (1):
      ASoC: sti: initialize IRQ lock before requesting IRQ

Sebastian Dalfuß (1):
      ALSA: usb-audio: Add boot quirk for Behringer CM1A

Shuming Fan (6):
      ASoC: rt766: fix uninitialized stream_config->type
      ASoC: rt712: fix uninitialized stream_config->type
      ASoC: rt1320: fix uninitialized stream_config->type
      ASoC: rt1318: fix uninitialized stream_config->type
      ASoC: rt721: fix uninitialized stream_config->type
      ASoC: rt722: fix uninitialized stream_config->type

Syed Saba Kareem (1):
      ASoC: amd: yc: Add DMI entry for HP 255R G10 laptop

Takashi Iwai (4):
      ALSA: usb: ua101: Avoid embedded URBs
      ALSA: usb: hiface: Avoid embedded URBs
      ALSA: usb: 6fire: Avoid embedded URBs
      ALSA: hdspm: Add a new PCI device ID (1d18:3fc6) for RME HDSPe AIO PCI express audio

Tianchu Chen (1):
      ASoC: sprd: validate compress buffer sizes against fixed allocations

Tristan Madani (2):
      ALSA: usbusx2y: fix in04_last array size mismatch with in04_buf
      ALSA: usbusx2y: validate URB actual_length in interrupt callback

Yorick Rommers (1):
      ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards

Zhang Yi (2):
      ASoC: codecs: ES8326: issue about capture pop
      ASoC: codecs: ES8389: Prevent enable_count underflow in clk_core_disable

hpp.iscas (3):
      ASoC: bcm: bcm63xx: Publish the OF module aliases
      ASoC: Intel: SST: Publish the PCI module aliases
      ASoC: mt6351: Publish the OF module alias

wangdicheng (2):
      ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
      ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()

Ștefan Ghețu (1):
      ASoC: fsl_micfil: balance mclk enable/disable

---
 sound/hda/codecs/realtek/alc269.c                 |   2 +
 sound/hda/common/codec.c                          |   4 +-
 sound/hda/core/ext/controller.c                   |   4 +-
 sound/hda/core/ext/stream.c                       |   5 +-
 sound/pci/ctxfi/cthw20k2.c                        |   1 +
 sound/pci/rme9652/hdspm.c                         |  10 +-
 sound/soc/amd/acp-da7219-max98357a.c              |  23 +
 sound/soc/amd/renoir/acp3x-pdm-dma.c              |   2 +-
 sound/soc/amd/yc/acp6x-mach.c                     |  14 +
 sound/soc/amd/yc/acp6x-pdm-dma.c                  |   2 +
 sound/soc/bcm/bcm63xx-i2s-whistler.c              |   1 +
 sound/soc/codecs/ab8500-codec.c                   | 688 +++++++++-------------
 sound/soc/codecs/cs35l56-sdw.c                    |   7 +-
 sound/soc/codecs/cs35l56.c                        | 116 +++-
 sound/soc/codecs/cs35l56.h                        |   2 +
 sound/soc/codecs/es8326.c                         |  19 +-
 sound/soc/codecs/es8389.c                         |  34 +-
 sound/soc/codecs/mt6351.c                         |   1 +
 sound/soc/codecs/rt1318-sdw.c                     |  24 +-
 sound/soc/codecs/rt1320-sdw.c                     |   2 +-
 sound/soc/codecs/rt712-sdca.c                     |  17 +-
 sound/soc/codecs/rt721-sdca.c                     |  17 +-
 sound/soc/codecs/rt722-sdca.c                     |  16 +-
 sound/soc/codecs/rt766-sdca.c                     |   5 +-
 sound/soc/codecs/tas2783-sdw.c                    |  25 +
 sound/soc/fsl/fsl_micfil.c                        |  21 +-
 sound/soc/intel/atom/sst/sst_pci.c                |   1 +
 sound/soc/intel/avs/boards/hdaudio.c              |  17 +
 sound/soc/intel/avs/core.c                        |  59 +-
 sound/soc/intel/avs/debugfs.c                     |  12 +-
 sound/soc/intel/avs/ipc.c                         |   6 +-
 sound/soc/intel/avs/path.c                        |  11 +-
 sound/soc/intel/avs/pcm.c                         |  34 +-
 sound/soc/intel/avs/topology.c                    |  49 +-
 sound/soc/intel/avs/topology.h                    |   5 +-
 sound/soc/intel/boards/Kconfig                    |   4 +-
 sound/soc/intel/boards/sof_rt5682.c               |   8 +
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c |   8 +-
 sound/soc/sprd/sprd-pcm-compress.c                |  15 +-
 sound/soc/sti/uniperif_reader.c                   |   4 +-
 sound/soc/ux500/ux500_msp_dai.c                   | 189 +++---
 sound/soc/ux500/ux500_msp_dai.h                   |  14 +-
 sound/soc/ux500/ux500_msp_i2s.c                   | 260 +++++---
 sound/soc/ux500/ux500_msp_i2s.h                   |  12 +-
 sound/usb/6fire/comm.c                            |  42 +-
 sound/usb/6fire/comm.h                            |   2 +-
 sound/usb/6fire/midi.c                            |  43 +-
 sound/usb/6fire/midi.h                            |   2 +-
 sound/usb/6fire/pcm.c                             | 128 ++--
 sound/usb/6fire/pcm.h                             |   5 +-
 sound/usb/caiaq/device.c                          |  36 +-
 sound/usb/caiaq/device.h                          |   4 +-
 sound/usb/caiaq/midi.c                            |   6 +-
 sound/usb/hiface/pcm.c                            |  44 +-
 sound/usb/misc/ua101.c                            | 102 ++--
 sound/usb/quirks.c                                |  25 +
 sound/usb/usx2y/us122l.c                          |   7 +-
 sound/usb/usx2y/usbusx2y.c                        |  10 +-
 sound/usb/usx2y/usbusx2y.h                        |   4 +-
 59 files changed, 1246 insertions(+), 984 deletions(-)

