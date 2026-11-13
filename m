Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585553;
	b=r+qAKcWrbvtmUGWjICGYUTPED5ViYlhFzQAc98bZ2IZ/9hhpU1fqG+jkho2wkocNQZ5k
	 jq3BqDhFqxGGppn2TcwCRCUrDFAxyB2P1wAGTAMf3h2CokXw++8YMMXpy5mplm08PNVyQ
	 phJ0fIViEo/eKw4dsY1baNWq50sF1VCmjFND8O/S9u0thRjrozBSO+6dYXUU3sRyFCg2a
	 c3WIoFBWdHxLbjHhjF7uZMIDVEufO/xBrm52XJi4CQaFXPr6KxRYvW4pSjUhpNeAUyFER
	 mCuhWzhYvJRUcTOi1LUUQ0BryLoI9m6S+HcSdl6oGSJR1tVyEA1pygECKeI1DFP0Q5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585553;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=Gx7M6jt6z9Omn/e+tHtHZM2LLzdH97mZcDmy9T8YAF0=;
	b=3YuatQmT5OelFmwuyC3gquNOCpr8FSCEYFe1RfyGZHa6iJwhTvdWnrF+Vh+pYfI3WN2z
	 cAInBpydEWV3418uJ6qqJ1msyKAf0zXGP2Hcryk0a5Lr2G6LSs51Ejhaz5t1vG8FFpS9Z
	 44EJEThTQCPDBrcEQx/VVTixEujiwQmebCexJfy7jMVr68WF82APpeFt0Tf9pn2O7ych2
	 fv3WcoXb4tAQtuIJFAmUAXui7iSZJA7gLe1vN/53oCba2EgCCyj+CzUNHvODEi0YgmwfB
	 DTe3qE0KyjWeWnfb4Mkww4XAF3iJI8eI/Atmj2gnBVWmgDROA8GeiBmAU6E1rQ4JBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fz8lVVzq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hpTMlQ0C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fz8lVVzq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hpTMlQ0C;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98056606BA8A;
	Fri, 13 Nov 2026 15:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98056606BA8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fz8lVVzq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hpTMlQ0C;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fz8lVVzq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hpTMlQ0C
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF0FF1F79B;
	Fri, 13 Nov 2026 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794585550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gx7M6jt6z9Omn/e+tHtHZM2LLzdH97mZcDmy9T8YAF0=;
	b=Fz8lVVzqif0Z9k567b4F0Xqe+BA0Am+LsemDnSZ2aotLBU5EYD/5fAIEGMJG/Bm+xTjpjL
	TmFW6RW4zUKs8uW0IBAcPrArQOLezsGPpDV6QduxQttNevXG6iTysjTiWBJYfJnVSs7DyF
	nBZh02UgaUz2YX/6PzazX6OvxABRPQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794585550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gx7M6jt6z9Omn/e+tHtHZM2LLzdH97mZcDmy9T8YAF0=;
	b=hpTMlQ0CDiVMjFEbmaj1fKLwRV59PilYfNJD9CRWGIITLs0FOf6uwY7Fr+pRy/ZYDBtjVj
	H6RIQzhWpoNBXYAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794585550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gx7M6jt6z9Omn/e+tHtHZM2LLzdH97mZcDmy9T8YAF0=;
	b=Fz8lVVzqif0Z9k567b4F0Xqe+BA0Am+LsemDnSZ2aotLBU5EYD/5fAIEGMJG/Bm+xTjpjL
	TmFW6RW4zUKs8uW0IBAcPrArQOLezsGPpDV6QduxQttNevXG6iTysjTiWBJYfJnVSs7DyF
	nBZh02UgaUz2YX/6PzazX6OvxABRPQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794585550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=Gx7M6jt6z9Omn/e+tHtHZM2LLzdH97mZcDmy9T8YAF0=;
	b=hpTMlQ0CDiVMjFEbmaj1fKLwRV59PilYfNJD9CRWGIITLs0FOf6uwY7Fr+pRy/ZYDBtjVj
	H6RIQzhWpoNBXYAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BDDC1344A;
	Fri, 13 Nov 2026 15:59:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id //VwEs4z92rLVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Nov 2026 15:59:10 +0000
Date: Fri, 13 Nov 2026 16:59:09 +0100
Message-ID: <87pkw8pvsi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.4-rc3
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

Linus,

please pull sound fixes for v7.4-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc3

The topmost commit is bca568589ad118a9b0bac086760baee2a41976a5

----------------------------------------------------------------

sound fixes for 7.4-rc3

A collection of small fixes as usual.  A couple of regression fixes
are included in addition to the various quirks and device-specific
fixes.

* ALSA Core:
- PCM: Fix potential inconsistent PCM state reporting after XRUN

* HD-audio:
- Fix sysfs hint parser
- Revert CS4208 fixup for MacBookAir 7,2 due to regressions
- ACPI _DSD fixes for CS35L41 side-codec on various HP laptops
- Device quirks for Acer (Predator, TravelLite) and Dell (Pro QC1255,
  XPS 8940)

* USB-audio:
- Fix for USB controller bugs reporting oversized packets
- Fix UAF on disconnect in caiaq
- Quirks for NiceHCK Octave DAC and RYDZ Technology Piva AC20

* ASoC:
- Fix a regression due to the conversion to devm_kzalloc_flex() that
  initialized the counter unexpectedly
- Copy DAI link names into card device to survive component rebind
- SOF: Fix pin format memory leak in IPC4 process widget setup,
- SOF: Support alternatively signed firmware loading on AMD platforms
- AMD: Guard SoundWire context with NULL checks in IRQ handlers
- AMD: SoundWire support on LG gram 16Z95U,  fix speaker pop noise on
  ACP3x with ES83xx codecs, quirks for Acer, ASUS, Huawei, and Lenovo
- Qualcomm: Fix headset jack at card rebind, PCM position fix on q6asm
- Apple: Fix clock selection for clock consumer FEs in MCA driver
- Intel: SoundWire jack-detection quirk for Dell Latitude 9420
- Codecs: Fixes for CS43130 (power down on close), ES9356 (gain dB
  scale), and MAX98090 (preserve mic boost)

----------------------------------------------------------------

Andrew Davison (1):
      ALSA: hda: Fix [codec] ID matching in patch files for IDs with bit 31 set

Angel J (1):
      ALSA: hda/realtek: Fix the Dell XPS 8940 headset microphone

Baoli Zhang (1):
      ASoC: SOF: ipc4-topology: Fix pin format leak in process widget setup

Devajith Jijush (1):
      ALSA: hda/conexant: Add quirk for Acer TravelLite TL05-41M

Emanuele Ghidoli (1):
      ASoC: soc-core: reset rtd->num_components after allocation

Fa-Iz Faadhillah Ibrahim (1):
      ALSA: hda/realtek: Update quirk for Acer Predator PHN16-72

Gichoon Han (1):
      ALSA: usb-audio: Drop capture packets with bogus actual_length

HyeongJun An (1):
      ASoC: Intel: sof_sdw: Add quirk for Dell Latitude 9420

Jaehoon Kim (2):
      ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16Z95U
      ASoC: amd: acp70: Add rt713 + rt1320 SoundWire machine for LG gram 16Z95U

Janne Grunau (1):
      ASoC: apple: mca: Fix clock selection for clock consumer FEs

Jude Gyimah (1):
      ALSA: aw2-alsa: select SND_PCM

Kailang Yang (1):
      ALSA: hda/realtek - remove headphone MIC support for Dell Pro QC1255

LiangCheng Wang (1):
      ASoC: max98090: keep the MIC boost across mic input power-up

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for RYDZ Technology Piva AC20

Mario Limonciello (1):
      ASoC: SOF: amd: Load alternatively signed firmware with an "_l" suffix

Michael McAllister (1):
      ASoC: qcom: q6asm: Reset PCM positions when preparing a stream

Mikael Magnusson (1):
      ALSA: pcm: update state after xrun

Olivier Louvignes (1):
      ASoC: cs43130: Power the playback path down when the stream closes

Samuel Leyva (2):
      ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
      ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec output

Sergei Nizovtsev (1):
      ALSA: caiaq: Kill EP1 URB before unregistering the input device

Shengyu Qu (1):
      ALSA: usb-audio: Add native DSD support for NiceHCK Octave

Stefan Binding (1):
      ALSA: hda: cs35l41: Override malformed _DSD properties for various laptops

Takashi Iwai (1):
      Revert "ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2"

Tyler Baker (2):
      ASoC: soc-core: copy the DAI link names into the card
      ASoC: qcom: x1e80100: recreate the headset jack on card rebind

Viacheslav-Illia Detsyk (1):
      ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41

Vijendar Mukunda (2):
      ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ handler
      ASoC: SOF: amd: guard adata->sdw dereferences with NULL check in IRQ handler

Zachary Huang (1):
      ASoC: es9356: fix the capture gain dB scale

Zhang Heng (3):
      ASoC: amd: yc: Fall back to DMI quirk table when _WOV returns 0
      ASoC: amd: yc: Add DMI quirk for ASUS TUF Gaming A16 FA607NUQ
      ASoC: amd: acp: Add Lenovo Legion 5 15AGP11 to ACP70 override table

---
 sound/core/pcm_native.c                            |  8 ++-
 sound/hda/codecs/cirrus/cs420x.c                   |  2 -
 sound/hda/codecs/conexant.c                        | 12 ++++
 sound/hda/codecs/realtek/alc269.c                  | 21 ++----
 sound/hda/codecs/realtek/alc882.c                  | 10 +++
 .../hda/codecs/side-codecs/cs35l41_hda_property.c  | 22 +++++-
 sound/hda/common/sysfs.c                           |  5 +-
 sound/pci/Kconfig                                  |  1 +
 sound/soc/amd/acp-config.c                         | 28 ++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      | 24 +++++--
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 83 ++++++++++++++++++++++
 sound/soc/amd/ps/pci-ps.c                          | 32 +++++----
 sound/soc/amd/yc/acp6x-mach.c                      | 16 ++++-
 sound/soc/apple/mca.c                              | 10 ++-
 sound/soc/codecs/cs43130.c                         |  2 -
 sound/soc/codecs/es9356.c                          |  4 +-
 sound/soc/codecs/max98090.c                        | 22 +++---
 sound/soc/intel/boards/sof_sdw.c                   | 10 +++
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  3 +
 sound/soc/qcom/qdsp6/q6asm.c                       |  2 +
 sound/soc/qcom/x1e80100.c                          | 18 +++++
 sound/soc/soc-core.c                               | 22 ++++++
 sound/soc/sof/amd/acp.c                            | 61 ++++++++++++----
 sound/soc/sof/amd/acp.h                            |  2 +
 sound/soc/sof/ipc4-topology.c                      |  2 +-
 sound/usb/caiaq/device.c                           | 11 ++-
 sound/usb/pcm.c                                    |  6 ++
 sound/usb/quirks.c                                 |  4 ++
 28 files changed, 367 insertions(+), 76 deletions(-)

