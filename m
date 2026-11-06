Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955685;
	b=nkXkhke1lbQyA2fWhYNMgtoBdY9JV00ocFF/2CAg9rUwoUvADwdV/xdbbGChqfTfBnLP
	 YGHFrFyV+7JW2PVUHDJbnmXtdxNYyMhfH2vIKIfWV1sJ9hkEwNv9CYJbykkxJ0GtUeJtn
	 jEy5ZZZWJCVn5oyrh0OEKFRHAjrsyF/gy6pztzmsvd+Mn+DuLvU1JWKJTnYhobwpIg5Es
	 pX7bjhsuNL48M69lCydBrWj0Xg2d1YUYL+pxf+qs4jrkrvZ2ML26jOKcHAhQ7yQMzOk1g
	 CK7obTYM/R3UmhDE2UxwPqmd3mjpEbak1Y0ZNoTsksRhL7BzObGOg4w1qcTtbe267Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955685;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=fBAS0GadJ5nMgs7SpEZLGWiawFlQp34erpE2RsqzjX4=;
	b=jOxmuNxCZ3XqNucxI7gf3chToZUOhGSYQbPllM5syn/7awFQG1wC9P5IoHVDtw1U0Qya
	 pCTPgDM1rtXH3/ZpGrcUzwMd7DM6l8RQDN/2J/S8sDXpsUn6/iGdlISA6kWUE/eblqrmJ
	 ksAOLlLO4AjVapeSOgwbMh5XWgh/2Rz08aGlW3puJj/a/KtmSAhGd1ITjx55NpH7z7CWQ
	 GPfI02u0yormEZHJ1oLX+4oD91rOaIXBgNboZ1OYtKIfqi3aH657NXGDJ1S2ZQKtvixvS
	 +vM5GV2kg1+SjhhkgM9AewkGgRjixMfclZ7vGb3RmygIK7wfU67QywPYORLRYGDDsTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UYNV+KsO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="fO9HWA6/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UYNV+KsO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="fO9HWA6/";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49285606A326;
	Fri,  6 Nov 2026 09:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49285606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UYNV+KsO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fO9HWA6/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UYNV+KsO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fO9HWA6/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38926221DF;
	Fri,  6 Nov 2026 09:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793955682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fBAS0GadJ5nMgs7SpEZLGWiawFlQp34erpE2RsqzjX4=;
	b=UYNV+KsOtHtnkRRciM5jiX3kdRVZ7KJLnIuZV8VGyVtNgsGbT+HHRNxyg+nEUJOeSHarL8
	GB+HgYjKLI3chYYxvX9t2lTLcIxeDRA55q6OBlDedUsc3hPLcQC2HvjY4GkrU6BbaOA+01
	eV/I3SJNJwoK7zr/1foAl6MLn83HUYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793955682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fBAS0GadJ5nMgs7SpEZLGWiawFlQp34erpE2RsqzjX4=;
	b=fO9HWA6/argpoqxj1VeL8nEuR39iFOknJmCMDHSwtnZd+aRTOMRuCtSwoziyXqEHq9gHq8
	Y1w8vuzykKs122Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UYNV+KsO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="fO9HWA6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793955682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fBAS0GadJ5nMgs7SpEZLGWiawFlQp34erpE2RsqzjX4=;
	b=UYNV+KsOtHtnkRRciM5jiX3kdRVZ7KJLnIuZV8VGyVtNgsGbT+HHRNxyg+nEUJOeSHarL8
	GB+HgYjKLI3chYYxvX9t2lTLcIxeDRA55q6OBlDedUsc3hPLcQC2HvjY4GkrU6BbaOA+01
	eV/I3SJNJwoK7zr/1foAl6MLn83HUYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793955682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fBAS0GadJ5nMgs7SpEZLGWiawFlQp34erpE2RsqzjX4=;
	b=fO9HWA6/argpoqxj1VeL8nEuR39iFOknJmCMDHSwtnZd+aRTOMRuCtSwoziyXqEHq9gHq8
	Y1w8vuzykKs122Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5F47134E9;
	Fri,  6 Nov 2026 09:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VnwHL2GX7WqDHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 09:01:21 +0000
Date: Fri, 06 Nov 2026 10:01:21 +0100
Message-ID: <87y0b6pc4e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.4-rc2
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
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38926221DF
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

Linus,

please pull sound fixes for v7.4-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc2

The topmost commit is 22733b6e2e1ebf75228a1e15b9fb9760a86137cc

----------------------------------------------------------------

sound fixes for 7.4-rc2

A collection of (unsurprisingly high amount of) small fixes since the
previous PR.  Majority of changes are device-specific quirks and
driver fixes, along with a few ALSA core fixes and USB-audio driver
hardening.

* ALSA Core:
- Fix page leak on WC DMA buffer allocation failure
- Prevent O_APPEND on OSS streams to avoid UAF
- A PCM regression fix for PulseAudio to allow hw_refine with mmap
- Serialize DSP image loading requests in hwdep
- Clear user-provided numid before adding a control
- Fix dropped data bytes in UMP to MIDI 1.0 System message conversion

* HD-audio:
- Fix double-free on stream page allocation failure in core
- Stop capability walk cleanly on empty capability header
- Fix silent output on Nvidia codecs due to shared converters
- Restore audio registers after AE-5 LED strip transmission
- Calibration data validation and custom address fixes for TAS2781
- Shared boot wait and reset helpers for CS35L41
- Cleanups and fixes for CS35L56 and AW88399
- Add Tegra268 HDMI/DP codec ID
- Device quirks for Acer, Alienware, ASUS, HP, Huawei, Lenovo, MSI

* USB-audio:
- Hardening and bug fixes for usx2y and us122l drivers
- Delay MIDI URB retry on -EPIPE to allow disconnect handling
- Fix use-after-free of MIDI URBs on close in bcd2000
- Reject undersized capture buffers in line6 driver
- Fix URB leak on input setup failure in caiaq driver
- Check return value of qmi_handle_init() in Qualcomm offload driver
- Quirks for Yamaha ZG02, HIK camera, and CVT Touch Device

* ASoC:
- AMD: Support more ACP7.0 projects, quirks for HP and Lenovo models
- Intel: Dummy topology for SN624x codec, SOF BPT DMA stream fix
- Qualcomm: Guard q6apm callbacks, fix runtime PM refcount leak
- Rockchip: Add missing REGMAP_MMIO Kconfig dependencies
- Meson: Request IRQ with clock enabled in axg-fifo
- Codec fixes for cs35l41, cs_dsp, wm_adsp, wm8904, ES8389, tas2770,
  sn624x, and aw88399

* Misc:
- FireWire: Fix inverted streaming speed in firewire-tascam
- PCI: Check SCB creation failures in legacy cs46xx driver

----------------------------------------------------------------

Alex Kazinsky (1):
      ALSA: cs46xx: Handle SCB creation failures before dereferencing

Alexandr (1):
      ALSA: hda/realtek: Enable mute and mic-mute LEDs on HP ENVY 17-cr0xxx

Antheas Kapenekakis (1):
      ALSA: hda/tas2781: Prevent throwing away custom calibration addresses

Anupama Kunkulagunta (1):
      ALSA: hda/tegra: Add Tegra268 HDMI/DP codec ID

Baojun Xu (1):
      ASoC: amd: acp: Add support for more projects on ACP7.0

Benjamin J Pryor (1):
      ALSA: hda/realtek: Extend ALC1316 fixup to MSI GE76 Raider

Chris Chiu (1):
      ALSA: hda/realtek: Use inverted mute LED quirk for HP ZBook 8 G2a

Chris Simpson (1):
      ALSA: hda/realtek: Enable bass speakers on Alienware m17 R3

Cian Ruane (1):
      ALSA: hda/realtek: Add quirk for Huawei MateBook X Pro 2020

Gianluca Balboni (1):
      ASoC: amd: yc: Add DMI quirk for HP OmniBook 3 Laptop 16-by0xxx

HyeongJun An (1):
      ALSA: ump: Fix dropped data bytes at UMP System message conversion

James Calligeros (2):
      ASoC: tas2770: Configure transmit clock edge when setting DAI format
      ASoC: tas2770: Fix error detection in tas2770_set_dai_tdm_idle

Jerome Brunet (1):
      ASoC: meson: axg-fifo: request the irq with the clock enabled

Jude Gyimah (5):
      ASoC: rockchip_i2s: select REGMAP_MMIO
      ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
      ASoC: rockchip_pdm: select REGMAP_MMIO
      ASoC: rockchip_sai: select REGMAP_MMIO
      ASoC: rockchip_spdif: select REGMAP_MMIO

Kuangyi Chiang (1):
      ALSA: usb-audio: Add delay quirk for HIK camera

Lee Jones (1):
      ASoC: SOF: Intel: hda-sdw-bpt: Stop active DMA before closing BPT streams

Marco Giunta (3):
      ALSA: hda: aw88399: use auto-cleanup for ACPI subsystem ID string
      ALSA: hda: aw88399: add missing MODULE_AUTHOR to I2C driver
      ASoC: aw88399: move library exports to SND_SOC_AW88399_LIB namespace

Micha³ Kopeæ (1):
      ALSA: hda/core: Stop capability walk on empty capability header

Mohamed Yassine Jebabli (1):
      ALSA: hda/tas2781: Only accept CRC-less V1 data if all entries are valid

Mohit Sharma (1):
      ASoC: qcom: q6apm: Guard callbacks until probe data is ready

Nguyen Thanh Nhat (1):
      ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71

Qianghua Wang (2):
      ASoC: Intel: soc-acpi: use dummy topology for SN624x
      ASoC: codecs: sn624x-sdca: limit DMIC capture to 2 channels

Rafael Medina (1):
      ALSA: hda/ca0132: Restore AE-5 audio registers after LED strip send

Razvan Dinculescu (1):
      ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs

Richard Fitzgerald (5):
      firmware: cs_dsp: Fix memory leak on cs_dsp_power_up() error path
      ASoC: wm_adsp: Prevent negative string length in wm_adsp_control_add()
      ALSA: hda: cs35l56: Fix mixed cleanup and goto in cs35l56_hda_fw_load()
      ALSA: doc: cs35l56: Update calibration write failure message info
      ALSA: hda: cs35l56: Stop cs_dsp before calling cs_dsp_power_down()

Riley (1):
      ALSA: usb-audio: Add quirk for Yamaha ZG02

Rodnei Cilto (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo V15 AMN G6

Sasha Levin (2):
      ALSA: memalloc: Free the new pages when WC DMA mapping fails
      ALSA: hda/core: Fix double free on stream page allocation failure

Shivam Madlani (1):
      ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP OmniBook 7

Sinan Turunc (3):
      ALSA: line6: Reject capture buffers smaller than two packets
      ALSA: usx2y: Require a buffer of two URBs
      ALSA: usx2y: Guard the playback copy

Sreeraj S Kurup (1):
      ALSA: control: Clear user-provided numid before adding a control

Stefan Binding (2):
      ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot api
      ASoC: cs35l41: Use common wait_for_boot and reset_and_boot apis

Stefano Radaelli (1):
      ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL

Stjepan Poljak (1):
      ALSA: usb-audio: don't resubmit MIDI URBs at once on -EPIPE

Takashi Iwai (1):
      ALSA: pcm: Prevent O_APPEND open on OSS streams

Takashi Sakamoto (1):
      ALSA: firewire: fix inverted streaming speed between tx and rx streams

Tang Bin (1):
      ASoC: codecs: lpass-rx-macro: fix PM ref leak in swclk_gate_enable

Thorsten Blum (1):
      ALSA: usx2y: Use prepare_inurb() in usb_stream_start()

Vincent Cloutier (1):
      ALSA: pcm: Allow HW_REFINE queries with mapped buffers

Wei Lixiang (1):
      ASoC: amd: yc: drop duplicated DMI quirk entries

Wentao Liang (1):
      ALSA: caiaq: free the EP4 URB when input setup fails

YuanZhe Liu (6):
      ALSA: us122l: Add missing NULL check in usb_stream_hwdep_mmap()
      ALSA: us122l: Fix NULL dereference at hwdep open and release
      ALSA: usx2y: Initialize idle URBs before submitting streams
      ALSA: hwdep: Serialize DSP load requests
      ALSA: bcd2000: Fix use-after-free of MIDI URBs on file close
      ALSA: usx2y: Refuse a retried DSP load after a failure

Yuqiang Sun (1):
      ALSA: usb-audio: qcom: Check the return value of qmi_handle_init()

Zhang Heng (4):
      ALSA: hda/realtek: Fix DAC binding for Lenovo Legion Pro 7 16ARX8H
      ALSA: hda/realtek: Fix DAC binding for Legion Pro 7 16ARX8H variant
      ALSA: hda/realtek: Fix pop noise on ASUS PRIME B650M-K
      ALSA: hda: cs35l41: Add support for HP OmniBook 7 Laptop 16-ay0xxx

Zhang Yi (1):
      ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing

ahmad baghereslami (1):
      ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3

renpanpan (1):
      ALSA: usb-audio: Fix card name for CVT Touch Device (1ff7:0f33)

yinguobing (1):
      ALSA: hda/realtek: Add quirk for Huawei WRT-WX9 (ALC256, 19e5:320d)

---
 Documentation/sound/codecs/cs35l56.rst             | 21 +++--
 drivers/firmware/cirrus/cs_dsp.c                   |  6 ++
 include/sound/cs35l41.h                            |  2 +
 include/sound/hwdep.h                              |  1 +
 sound/core/control.c                               |  3 +-
 sound/core/hwdep.c                                 |  2 +
 sound/core/memalloc.c                              |  2 +-
 sound/core/pcm.c                                   |  2 +
 sound/core/pcm_local.h                             |  6 ++
 sound/core/pcm_native.c                            | 16 ++--
 sound/core/ump_convert.c                           |  2 +-
 sound/firewire/tascam/tascam-stream.c              |  4 +-
 sound/hda/codecs/ca0132.c                          | 43 +++++++++-
 sound/hda/codecs/conexant.c                        |  1 +
 sound/hda/codecs/hdmi/nvhdmi.c                     | 97 ++++++++++++++++++++++
 sound/hda/codecs/hdmi/tegrahdmi.c                  |  1 +
 sound/hda/codecs/realtek/alc269.c                  | 41 ++++++---
 sound/hda/codecs/realtek/alc662.c                  | 21 +++++
 sound/hda/codecs/side-codecs/aw88399_hda.c         |  5 +-
 sound/hda/codecs/side-codecs/aw88399_hda_i2c.c     |  2 +
 sound/hda/codecs/side-codecs/cs35l41_hda.c         | 33 +-------
 .../hda/codecs/side-codecs/cs35l41_hda_property.c  |  2 +
 sound/hda/codecs/side-codecs/cs35l56_hda.c         | 14 ++--
 sound/hda/codecs/side-codecs/tas2781_hda.c         | 31 ++++++-
 sound/hda/core/controller.c                        | 15 +++-
 sound/pci/cs46xx/dsp_spos.c                        |  2 +
 sound/pci/cs46xx/dsp_spos_scb_lib.c                |  3 +-
 sound/soc/amd/acp-config.c                         | 35 ++++++++
 sound/soc/amd/yc/acp6x-mach.c                      | 35 ++++----
 sound/soc/codecs/aw88399-lib.c                     | 30 +++----
 sound/soc/codecs/aw88399.c                         |  1 +
 sound/soc/codecs/cs35l41-lib.c                     | 67 +++++++++++++++
 sound/soc/codecs/cs35l41.c                         | 18 +---
 sound/soc/codecs/es8389.c                          | 17 ++--
 sound/soc/codecs/lpass-rx-macro.c                  |  2 +-
 sound/soc/codecs/sn624x-sdca-sdw.c                 |  2 +-
 sound/soc/codecs/tas2770.c                         | 23 +++--
 sound/soc/codecs/tas2770.h                         |  4 +-
 sound/soc/codecs/wm8904.c                          | 14 ++++
 sound/soc/codecs/wm_adsp.c                         | 10 +++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |  4 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  4 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  4 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  6 +-
 sound/soc/meson/axg-fifo.c                         | 30 +++----
 sound/soc/qcom/qdsp6/q6apm.c                       |  6 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |  3 +
 sound/soc/rockchip/Kconfig                         |  5 ++
 sound/soc/sof/intel/hda-sdw-bpt.c                  |  6 ++
 sound/usb/bcd2000/bcd2000.c                        | 20 ++++-
 sound/usb/caiaq/input.c                            |  2 +
 sound/usb/line6/capture.c                          | 29 +++++++
 sound/usb/midi.c                                   |  3 +-
 sound/usb/qcom/qc_audio_offload.c                  |  7 ++
 sound/usb/quirks-table.h                           | 35 ++++++++
 sound/usb/quirks.c                                 |  4 +
 sound/usb/usx2y/us122l.c                           | 27 ++++--
 sound/usb/usx2y/usX2Yhwdep.c                       |  5 ++
 sound/usb/usx2y/usb_stream.c                       | 14 ++--
 sound/usb/usx2y/usbusx2yaudio.c                    | 43 +++++++++-
 60 files changed, 701 insertions(+), 192 deletions(-)

