Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464222;
	b=q21YWNOixwyjwKPmVgWBKzv/EYFmi1axxzbJnBSFl+8xP25dzBos3rhviark5xaoB3f8
	 /76iDP1ycZxaiqFhDA/CXJNyg2YJdpyVf5319X2swpgUCo4Kc363XairxLC0ppnY6xdIk
	 u0ixecr4vdAiLav+pB/7UpGlhpnN6U/YrE2F7r0atM/7NZzXneaU2fi3syIG52CxFzy/h
	 UoODB7KU84tMIQjnqwvC/HsmxHmf0j7FkzY1stGcNIAY/ClcxxhXLYuwvwm2GdWzz5RxZ
	 7re0DOJ0oj7Nhc0X3uy3ZOLPD6Xhmzw6LS2JdA7R3RvZ0lBGcQ8FHK2cUbZoiaeOQxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464222;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=etfsp6iAWhlFT38Dgw9t4wwjEgnClXF/n78zYxjObag=;
	b=yvBTERdrrLgcWWTLc0Em2hIXD0qB+op4znieHhNtaOaLx3/ptnTKYoifxrxVdPRonfgU
	 nb0ipB8mi9gBLsgKM2EXr40I1elw9N0gicg0ucLmeSEVESZ31HVm0NxETOyXPxlMNKGjW
	 4dNrakyEmqyiAMj1fd5sQud4n9yP+Ju3Nsn78b/oKYagD6Yd9JZ26Op9wUV3J8gnJjZzT
	 cewinncZcENL36P6rk7zqmEHz7l3Nvr+j5qpf903djybj55amauVgx0zNQPXfKcq9A/+C
	 UyS/pzD5g5Ewa4OvLwAW1UKSg4RUdYwKomavMAOD9FzTq/X9a6rHQSKv277lpkhw+qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=emdlIFBO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jgtEu80Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=emdlIFBO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jgtEu80Y;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEE606A320;
	Sat, 31 Oct 2026 16:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEEE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=emdlIFBO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jgtEu80Y;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=emdlIFBO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jgtEu80Y
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 22F5A221EB;
	Sat, 31 Oct 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793464219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=etfsp6iAWhlFT38Dgw9t4wwjEgnClXF/n78zYxjObag=;
	b=emdlIFBONEXBMl3kLEQ4e/QvkQZtTLFUHCSl1EDucbD6l8HNP1kJ2juY6ig8wQktTOZnVu
	1hBG3PXYw5Pcjwb+M9FovvFBCTn9Nfp2LhI6MV9ExTJOXfcKuQBHMqYAzG3GHes8gxuenc
	SN+ac5/AnwVP0o/8fJS082o4RpbKEU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793464219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=etfsp6iAWhlFT38Dgw9t4wwjEgnClXF/n78zYxjObag=;
	b=jgtEu80YdyLKdN1KQttBUpfHayji+RwbU5gg9llbrpn38VlICBbKl7ixVUPa5xSvWcwcaU
	Uue8tZI0peaXe7Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793464219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=etfsp6iAWhlFT38Dgw9t4wwjEgnClXF/n78zYxjObag=;
	b=emdlIFBONEXBMl3kLEQ4e/QvkQZtTLFUHCSl1EDucbD6l8HNP1kJ2juY6ig8wQktTOZnVu
	1hBG3PXYw5Pcjwb+M9FovvFBCTn9Nfp2LhI6MV9ExTJOXfcKuQBHMqYAzG3GHes8gxuenc
	SN+ac5/AnwVP0o/8fJS082o4RpbKEU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793464219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=etfsp6iAWhlFT38Dgw9t4wwjEgnClXF/n78zYxjObag=;
	b=jgtEu80YdyLKdN1KQttBUpfHayji+RwbU5gg9llbrpn38VlICBbKl7ixVUPa5xSvWcwcaU
	Uue8tZI0peaXe7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCB5D132D3;
	Sat, 31 Oct 2026 16:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zx3NKJoX5mrCSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:30:18 +0000
Date: Sat, 31 Oct 2026 17:30:18 +0100
Message-ID: <87h5i1rfxh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.4-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

Linus,

please pull sound fixes for v7.4-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.4-rc1

The topmost commit is 74f6055d0c5997b13e6a5253fdc2263f3af90408

----------------------------------------------------------------

sound fixes for 7.4-rc1

A collection of fixes across the sound subsystem since the initial
7.4 PR.  Nothing particularly stands out, mostly driver- and
device-specific fixes along with a few race / UAF fixes and cleanups.
Here are some highlights:

* ALSA core:
- Fix potential race in PCM proc handling at disconnection
- Fix potential race in UMP sequencer callback at releasing

* HD-audio:
- Reject codec reset/reconfig on ASoC buses to prevent deadlock
- Force MSI for Hygon H34M51A board
- Usual Realtek quirks for ASUS and HP laptops/AiO

* USB-audio:
- Bound packet copies by PCM buffer size in generic and ua101 drivers
- Rate-limit URB submission errors at stream start
- Skip redundant probe-time interface setup on MSI ALC4080
- Device quirks for Novation UltraNova, MOTU MicroBook II, and RYDZ
  Headphone

* ASoC:
- Fixes for runtime PM and IRQ handling in hdac_hda and SDCA
- SOF: Fix potential UAF at release, fix for Kconfig dependency
- Qualcomm: Fixes for sm8250 and q6apm/q6afe
- NXP / i.MX: Fix for pending work in hw_free
- Xilinx: Fix read-modify-write of AUD_CTRL in formatter_pcm
- Intel: Arrow Lake SoundWire match table additions (RT712, RT713 +
  dual RT1320)
- AMD: DMI quirk for HP Laptop 14-em0xxx and memory leak fix in Raven
  DMA close
- Various codec fixes for midas_wm1811, wm8994, cs35l56, cs42l56,
  WSA881x/883x/884x, es8326/es8375/es9356,  rt721/rt722, and
  tlv320aic32x4

* Misc:
- OPL3: Fix races in timer initialization, shutdown, and voice cleanup
- Bounds checks and string helpers for AC97 and emu10k1
- Fix spu_memset() stride in legacy SH AICA driver
- Parameter handling fixes in pcmtest virtual driver

----------------------------------------------------------------

Alex Kazinsky (1):
      ASoC: tlv320aic32x4: Prevent division by zero in divider callbacks

Andrey Zakharov (1):
      ALSA: emu10k1: Pass destination size to copy_string()

Arnd Bergmann (1):
      ASoC: SOF: amd: add ACPI dependency

Bard Liao (1):
      ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config

Cen Zhang (5):
      ALSA: pcm: Drain proc callbacks at device disconnect
      ALSA: ump: Drain sequencer callbacks before freeing their client
      ALSA: opl3: Initialize the timer before publishing a sequencer port
      ALSA: opl3: Clear voice channels before freeing their sets
      ALSA: opl3: Shut down the timer after draining sequencer ports

Chancel Liu (1):
      ASoC: imx-pcm-rpmsg: Flush pending work in hw_free

Denis Kulikov (1):
      ALSA: usb-audio: Rate-limit URB submission error at stream start

Ernst Persson (1):
      ALSA: hda/realtek: Extend quirk for HP Pavilion All-in-One 27-ca1xxx

Fabio Estevam (1):
      ASoC: fsl_utils: Tolerate fractional PLL rate residue

Filippo Falezza (1):
      ASoC: qcom: sm8250: Limit RX digital gain to 0 dB

Florian Fuchs (1):
      ALSA: sh: aica: Fix spu_memset() stride

HyeongJun An (3):
      ASoC: cs42l56: Remove the ADC Mute Switch control
      ALSA: pcmtest: Reject invalid fill_mode values
      ALSA: pcmtest: Honor the enable parameter

JJ Gault (1):
      ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for RYDZ Technology USB Headphone

Marek Szyprowski (6):
      ASoC: wm8994: fix MCLK gating for AIF clocks sourced from MCLK2
      ASoC: wm8994: don't lose the AIF clock ratio when staying at 32kHz SYSCLK
      ASoC: wm8994: fix MCLK index used for setting MCLK rate
      ASoC: samsung: midas_wm1811: run FLL1 at the AIF1 configured rate when idle
      ASoC: wm8994: follow AIF clock source changes in MCLK gating
      ASoC: codecs: wsa881x: Fix shared powerdown GPIO handling

Oder Chiou (1):
      ASoC: rt721: Remove invalid register defaults

Peter Ujfalusi (5):
      ALSA: hda: Reject codec reset on ASoC (ext_ops) buses
      ASoC: hdac_hda: Allocate the private data at codec driver bind
      ASoC: hdac_hda: Restore the codec device type on unbind
      ASoC: hdac_hda: Balance the runtime PM disable in codec remove
      ASoC: hdac_hda: Keep runtime PM state in sync across codec remove/probe

Ravi Hothi (3):
      ASoC: qcom: audioreach: fix module cfg blob size handling
      ASoC: codecs: wsa884x: Fix VI sense port channel count
      ASoC: codecs: wsa883x: Fix VI sense port channel count

Richard Fitzgerald (1):
      ASoC: cs35l56: Wait for firmware timer expiry before system suspend

Sally Marcher (1):
      ALSA: usb-audio: Add correct datainterval in the quirks-table for Microbook II

Sasha Levin (1):
      ASoC: SOF: Intel: hda: Stop the controller before freeing its DMA buffers

Shahab Ghodsi (1):
      ALSA: hda/realtek: Add quirk for ASUS ExpertBook B3402FVA

Shawn Guo (3):
      ASoC: qcom: q6apm: Fix unmap regions response handling
      ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
      ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

Shawn Rainey (1):
      ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)

Shuming Fan (1):
      ASoC: rt722: enable mono speaker on Dell SKU 0EBA

Sinan Turunc (2):
      ALSA: usb-audio: Bound packet copies by the PCM buffer size
      ALSA: ua101: Bound packet copies by the PCM buffer size

Srinivas Kandagatla (7):
      ASoC: codecs: wsa884x: Accept temperatures across the full trim range
      ASoC: codecs: wsa883x: Accept temperatures across the full trim range
      ASoC: codecs: wsa884x: disable runtime PM on unbind
      ASoC: codecs: wsa883x: disable runtime PM on unbind
      ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
      ASoC: SDCA: drop pm_runtime reference on probe failure path
      ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure

Takashi Iwai (1):
      ALSA: usb-audio: Correct a typo in UMC404HD model comment

Thorsten Blum (2):
      ALSA: ac97: Use snprintf() in snd_ac97_get_name()
      ALSA: ump: Use safe_append_string() in snd_ump_update_group_attrs()

Val Packett (1):
      ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch

Volodymyr Lurin (1):
      ALSA: hda/realtek: Add mute LEDs quirk for HP Pavilion Plus 14-EW1XXX.

Zak Brighton Knight (1):
      ALSA: usb-audio: Skip probe-time interface setup for MSI MAG X570S ALC4080

Zhang Heng (3):
      ALSA: hda/realtek: Fix internal mic on ASUS VivoBook X509JB
      ALSA: hda/realtek: Add quirk for HP Pavilion AiO 24 (ALC225)
      ASoC: amd: yc: Add DMI quirk for HP Laptop 14-em0xxx

Zhang Yi (6):
      ASoC: codecs: es8375: Modify Register Configuration
      ASoC: es9356-sdca: Modify the timing and configuration of headphone events
      ASoC: es9356-sdca: Add writeable_reg
      ASoC: es9356-sdca: Modify the Initialization Configuration
      ASoC: codecs: es*: Modify the registers related to ALC RECOVERY
      ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN

bui duc phuc (2):
      ASoC: amd: raven: Fix memory leak in acp3x_dma_close()
      ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params

renpanpan (1):
      ALSA: hda: Force MSI for Hygon H34M51A board

---
 include/sound/cs35l56.h                           |   4 +
 include/sound/info.h                              |   2 +
 include/sound/ump.h                               |   5 +
 sound/core/info.c                                 |  23 +++-
 sound/core/pcm.c                                  |  54 ++++----
 sound/core/seq/seq_ump_client.c                   |   5 +-
 sound/core/ump.c                                  |  63 +++++++--
 sound/drivers/opl3/opl3_midi.c                    |  15 +++
 sound/drivers/opl3/opl3_oss.c                     |   1 +
 sound/drivers/opl3/opl3_seq.c                     |  13 +-
 sound/drivers/opl3/opl3_voice.h                   |   1 +
 sound/drivers/pcmtest.c                           |  24 +++-
 sound/hda/codecs/realtek/alc269.c                 |  12 ++
 sound/hda/common/codec.c                          |   6 +
 sound/hda/common/sysfs.c                          |   4 +
 sound/hda/controllers/intel.c                     |   2 +
 sound/pci/ac97/ac97_codec.c                       |  29 ++--
 sound/pci/emu10k1/emufx.c                         |  18 ++-
 sound/sh/aica.c                                   |   2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c               |   2 +
 sound/soc/amd/yc/acp6x-mach.c                     |   7 +
 sound/soc/codecs/cs35l56-sdw.c                    |  27 +++-
 sound/soc/codecs/cs35l56-shared.c                 |  38 ++++++
 sound/soc/codecs/cs35l56.c                        |  17 +++
 sound/soc/codecs/cs35l56.h                        |   1 +
 sound/soc/codecs/cs42l56.c                        |   1 -
 sound/soc/codecs/es8326.c                         |   2 +-
 sound/soc/codecs/es8375.c                         | 136 +++++++++----------
 sound/soc/codecs/es8375.h                         |   5 +-
 sound/soc/codecs/es9356.c                         | 106 +++++++++++----
 sound/soc/codecs/es9356.h                         |   5 +
 sound/soc/codecs/hdac_hda.c                       |  41 +++++-
 sound/soc/codecs/rt721-sdca-sdw.c                 |   2 -
 sound/soc/codecs/rt721-sdca-sdw.h                 |   4 -
 sound/soc/codecs/rt722-sdca.c                     |  18 +++
 sound/soc/codecs/rt722-sdca.h                     |   2 +
 sound/soc/codecs/tlv320aic32x4-clk.c              |   8 +-
 sound/soc/codecs/wm8994.c                         | 153 ++++++++++++----------
 sound/soc/codecs/wm8994.h                         |   2 +
 sound/soc/codecs/wsa881x.c                        |  18 ++-
 sound/soc/codecs/wsa883x.c                        |  21 +--
 sound/soc/codecs/wsa884x.c                        |  19 +--
 sound/soc/fsl/fsl_utils.c                         |  25 +++-
 sound/soc/fsl/imx-pcm-rpmsg.c                     |  14 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c |  84 ++++++++++++
 sound/soc/qcom/qdsp6/q6afe.c                      |  10 +-
 sound/soc/qcom/qdsp6/q6apm.c                      |  49 +++++--
 sound/soc/qcom/qdsp6/topology.c                   |  31 ++++-
 sound/soc/qcom/sm8250.c                           |  10 ++
 sound/soc/samsung/midas_wm1811.c                  |  14 +-
 sound/soc/sdca/sdca_class.c                       |  10 +-
 sound/soc/sof/amd/Kconfig                         |   1 +
 sound/soc/sof/intel/hda-codec.c                   |  23 +---
 sound/soc/sof/intel/hda-ctrl.c                    |   1 +
 sound/soc/sof/intel/hda.c                         |   4 +
 sound/soc/xilinx/xlnx_formatter_pcm.c             |  18 +--
 sound/usb/endpoint.c                              |   6 +-
 sound/usb/misc/ua101.c                            |  29 +++-
 sound/usb/pcm.c                                   |  20 ++-
 sound/usb/quirks-table.h                          |  65 +++++++++
 sound/usb/quirks.c                                |   6 +-
 61 files changed, 1017 insertions(+), 321 deletions(-)

