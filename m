Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBF3DE456;
	Fri, 28 Aug 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906402; cv=none; b=QcdEWB4Oec7cNoovS+KjI5psldE8YaKxuWJvZgIEWgHq/EIJBNHZBrabyCrWnGxjc80NzjAkspUlupVJ7BHE8AnfferR6i3tuG5EvofzfE6S4iMLo5rb7rC8putfXLXcsTTyhZ9w84gE3yxc8CW+GPg/v34sYbmnpgsfWcuaLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906402; c=relaxed/simple;
	bh=iRY3j6KektoWoJtlP312qlLFOufFSztlGzymcQAukQk=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=nXUypOzG5KcOFkOD+CRjqzodOLJOFUa1v0h9kc+8F/C06MYrylEid61zIHCfMxXdqRp18eTKLmRXdNOqJsplvJ3C6FgBXnxErKA1qKTVh5y/tr1e4TXlBCUQg5BVubkq1mIglfDmwEUV+Heg/FJcpgfc95F5CvnN8Haru11OnUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ex6bQvHI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WsdX5GFF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JQB2NFwf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7HtAELmh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ex6bQvHI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WsdX5GFF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JQB2NFwf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7HtAELmh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3199D1FAB4;
	Fri, 28 Aug 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787906394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g3uVh3vWQqOsrir9gMderdYGy4jpiQYupLH8YJWcLCk=;
	b=ex6bQvHIIZBDBGUDUz0ITcKMqNCfMvtdPqrjIkz6Sa0d+lnhF7cbX70bTnsZW0iO/M3gUw
	R4pJgw6eaQ5CGxXP8VZQYV5V4cEPDENRpxA4dXa5OFOl9zXkj5NeF+OWiPQ8GlynBVmHa7
	tFSS9hHCFOqrjXyEYRloP2F5uz2ap2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787906394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g3uVh3vWQqOsrir9gMderdYGy4jpiQYupLH8YJWcLCk=;
	b=WsdX5GFFCDFaty0xwLdWRhvPRHvJWZmIqYBYot4FEhXqNtBSDiHE3WqdhLrOkAtGxFqq9a
	ZCpYwPVM0vRrY0Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787906390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g3uVh3vWQqOsrir9gMderdYGy4jpiQYupLH8YJWcLCk=;
	b=JQB2NFwfv2roVySnrr8drXLqz8vInnIA7eSam7yGPkRQOUWXRHzQuGFYabFlV9ocvVQeqN
	PdU83Gecb3J+URUU2eOzC1CE1dQ8zLA8FSNXmwOiPSAXiUHnGie32iyTvLlfYqu36qFTgl
	fsTZUPCmsC0WE3YxK11cR64rCLcKai8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787906390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g3uVh3vWQqOsrir9gMderdYGy4jpiQYupLH8YJWcLCk=;
	b=7HtAELmhU+Vrr8XB9UaGSPWjmP87312e3DTfDbL47bsvG2lHB5x5W2jGqJL07Yzp2ga6p4
	vfVKobXFyb4ZKSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D953613674;
	Fri, 28 Aug 2026 08:39:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m7+wM1VJkWrbRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Aug 2026 08:39:49 +0000
Date: Fri, 28 Aug 2026 10:39:49 +0200
Message-ID: <87y0dq4p0q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.3-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

Linus,

please pull sound fixes for v7.3-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.3-rc1

The topmost commit is c4a0927f535f779700d5ccda8182c2db01e9d551

----------------------------------------------------------------

sound fixes for 7.3-rc1

A collection of various small fixes since the last PR.
Most changes are device-specific fixes, while there are a few fixes
addressing the issues reported recently by fuzzers.

Here are highlights:

* ALSA Core:
- Prevent adding invalid kcontrols to the LED layer
- Workaround for a false-positive mutex lockdep warning in rawmidi

* USB-audio:
- Relaxed the sticky mixer behavior check that caused regressions
- Fix an OOB write in Novation MIDI output
- Proper cleanup after system-resume errors
- Quirk updates for M-Audio Venom, Audient iD14 MkI, Logitech PRO X
  Wireless, SMSL USB DAC, and Creative Sound Blaster Play! 3

HD-audio:
- Conexant headset plugin fixes
- Quirk additions and fixes for HP Laptop 15, Lenovo IdeaPad Slim 3,
  TongFang XxAF5xxx, Lenovo Legion Pro 7, and Lenovo Yoga Pro 9

ASoC:
- DAPM: Fix off-by-one check on the second enum channel
- Tegra: Fix and sort register defaults
- AMD quirk updates for ASUS FA401EA, HP OmniBook X Flip 16,
  HVY-WXX9/M1060, Alienware m18 R1, and MSI Thin A15 B7UC
- Fixes Qualcomm TDM handling
- Fix double put_device() on SoundWire
- Codec fixes for rt766, tac5xx2, rt712, tas2783, and max98926

Misc:
- Fix card leak on probe error on ice1712 driver
- Hardening for legacy aoa, mtpav and pcxhr drivers

----------------------------------------------------------------

Andrey Golovko (2):
      ASoC: sdw_utils: prepare the stream again when resuming
      ASoC: tas2783-sdw: power the Function up before preparing the port

Binbin Zhou (1):
      ASoC: loongson: Fix naming of machine event and DAPM widgets

Bob Song (1):
      ALSA: hda/conexant: Always enable the headset-mic pin on plugin

Chad Talbott (1):
      ALSA: usb-audio: Add MIN_MUTE quirk for Creative Sound Blaster Play! 3

Christopher Tolang (1):
      ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC

Csaba Budai (1):
      ALSA: hda/realtek: Fix ALC700 audio on Intel Hades Canyon

Eckhart Mohr (1):
      ALSA: hda/realtek: Add quirk for TongFang XxAF5xxx

Edward Blair (1):
      ALSA: usb-audio: Add quirk flags for SMSL USB DAC

Federico Valentín Andrade (2):
      ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
      ALSA: usb-audio: Skip mixer creation on M-Audio Venom

Habil Eren Türker (2):
      ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt
      ALSA: hda/realtek: Fix speaker mute LED for HP Laptop 15-fd0039nt

Haotian Zhang (1):
      ALSA: ice1712: Fix the card leak at probe error with the auto-cleanup

HyeongJun An (1):
      ASoC: dapm: Fix off-by-one check on the second enum channel

Jack Yu (2):
      ASoC: sdw_utils: fix double put_device() on aggregated amps
      ASoC: rt712-sdca: Pull high JD2 to prevent from entering TV mode

Jon Hunter (4):
      ASoC: tegra: Fix the I2S enable default value
      ASoC: tegra: Fix the MIXER enable default value
      ASoC: tegra: Sort ADMAIF register defaults
      ASoC: tegra: Sort MBDRC register defaults

Julian Braha (1):
      ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS

Kuninori Morimoto (1):
      ASoC: codec: max98926: fixup invert setup mask

Marouane El Moufid (1):
      ALSA: usb-audio: fix OOB write in snd_usbmidi_novation_output()

Mehmet Aysel (2):
      ASoC: amd: acp-config: Add HVY-WXX9/M1060 DMI quirk
      ASoC: amd: acp3x-es83xx: Add HVY-WXX9/M1060 DMI quirk

Niranjan H Y (3):
      ASoC: sdw_utils: Set component_name for tac5xx2 codec family
      ASoC: tac5xx2-sdw: Rename gain and volume macros
      ASoC: tac5xx2-sdw: update default regmap registers

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
      ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
      ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
      ASoC: qcom: sc8280xp: Fix TDM hw_params error handling

Rong Zhang (4):
      ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_ALWAYS_SET_RATE
      ALSA: usb-audio: Demote the severity of sticky GET_CUR
      ALSA: usb-audio: Reverse MIXER_GET_CUR_BROKEN as MIXER_GET_CUR_OK
      ALSA: usb-audio: Add quirk flags for Logitech PRO X Wireless

Runyu Xiao (2):
      ALSA: pcxhr: initialize mutexes before requesting threaded IRQ
      ALSA: mtpav: shut down output timer before card teardown

Sehat Mahde (1):
      ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 16

Shengyu Qu (1):
      ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants

Shuming Fan (1):
      ASoC: rt766: add RT766/RT767 VA1 device IDs

Takashi Iwai (2):
      ALSA: rawmidi: Another workaround for false-positive mutex lockdep warning
      ALSA: control: Don't add invalid kcontrols to LED layer

Will Porter (2):
      ALSA: usb-audio: Add iD14 MkI to monitor-mix volume quirk
      ALSA: usb-audio: Complete cleanup after system-resume errors

Zhang Heng (5):
      ALSA: hda/conexant: Simplify headset plugin type handling
      ALSA: hda/realtek: Fix bass speaker DAC routing for Lenovo Yoga Pro 9 16IAH10
      ALSA: hda/realtek: Reorder quirk entries for Lenovo Legion Pro 7 16ARX8H
      ALSA: hda/realtek: Add quirk for Lenovo IdeaPad Slim 3 15ABR8
      ASoC: amd: yc: Add DMI entry for Alienware m18 R1 AMD

bui duc phuc (2):
      ALSA: aoa: i2sbus: Check IRQ before requesting it
      ASoC: soc-generic-dmaengine: Fix DMA channel request warning

---
 Documentation/sound/alsa-configuration.rst         |  25 +--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |  56 +++---
 include/sound/rawmidi.h                            |   8 +-
 sound/aoa/soundbus/i2sbus/core.c                   |   2 +
 sound/core/control_led.c                           |   2 +
 sound/core/rawmidi.c                               |  11 +-
 sound/core/ump.c                                   |   3 +-
 sound/drivers/mtpav.c                              |   4 +-
 sound/hda/codecs/conexant.c                        |  18 +-
 sound/hda/codecs/realtek/alc269.c                  |  93 ++++++++-
 sound/pci/ice1712/ice1712.c                        |   7 +-
 sound/pci/pcxhr/pcxhr.c                            |  14 +-
 sound/soc/amd/acp-config.c                         |  23 ++-
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |   8 +
 sound/soc/amd/yc/acp6x-mach.c                      |  14 ++
 sound/soc/codecs/max98926.c                        |   2 +-
 sound/soc/codecs/rt712-sdca.c                      |   1 +
 sound/soc/codecs/rt712-sdca.h                      |   1 +
 sound/soc/codecs/rt766-sdca-sdw.c                  |   2 +
 sound/soc/codecs/tac5xx2-sdw.c                     | 118 ++++++------
 sound/soc/codecs/tac5xx2.h                         |   5 +-
 sound/soc/codecs/tas2783-sdw.c                     |  20 ++
 sound/soc/fsl/Kconfig                              |   4 +-
 sound/soc/fsl/efika-audio-fabric.c                 |   2 -
 sound/soc/fsl/pcm030-audio-fabric.c                |   2 -
 sound/soc/loongson/loongson_card.c                 |  14 +-
 sound/soc/qcom/common.c                            |   6 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   4 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |  56 +++---
 sound/soc/qcom/qdsp6/q6prm.h                       |  56 +++---
 sound/soc/qcom/sc8280xp.c                          |  21 ++-
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |   2 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  28 ++-
 sound/soc/soc-dapm.c                               |   2 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |  20 +-
 sound/soc/tegra/tegra210_admaif.c                  | 210 ++++++++++++++-------
 sound/soc/tegra/tegra210_i2s.c                     |  20 +-
 sound/soc/tegra/tegra210_i2s.h                     |   1 +
 sound/soc/tegra/tegra210_mbdrc.c                   |  42 ++---
 sound/soc/tegra/tegra210_mixer.c                   |  10 +-
 sound/usb/card.c                                   |  14 +-
 sound/usb/midi.c                                   |   2 +
 sound/usb/mixer.c                                  |  82 +++-----
 sound/usb/mixer_maps.c                             |  21 ++-
 sound/usb/quirks-table.h                           |  22 +++
 sound/usb/quirks.c                                 |  26 +--
 sound/usb/usbaudio.h                               |  24 +--
 47 files changed, 705 insertions(+), 423 deletions(-)

