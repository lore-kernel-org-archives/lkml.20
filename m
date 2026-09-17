Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208EA57ED80;
	Thu, 17 Sep 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654044; cv=none; b=jerUNqmdSHo/VINOYaZ+H6imGNSws9LnNnMZCBfRuwPTOvWWigpH7qMFK5eUuYWR/aNjWSh5N0ClOqSJsmbLvMl85/jgFoJu56LvZuvviyZ+XHyxt7WD5OacEpTYG6RwXzTDUo3zeBaUlRCa322HLpRt+LIs8aUBG2GA4bojkck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654044; c=relaxed/simple;
	bh=vfl896ZYq+ITdLTIbwzVIZEFlFnt1i7wxR7g5ktqCno=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=kESPE1yu2yyWEN/JECs42Tnpd8/73CxkqGzges/sKgxiPky7a4GmIboAHIliYcltITAEFItm7fpsO/+XI9C8LmiEhOC8JwmUrqfEIfkbNi0mvnwPnZVQdMm3d93x1mTP5NYlKQXrzmdMYALF6CPGjpmylm97g5cBMqMqJaNQA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r6OUgXZ1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B75js+1O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vq+JBTPb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I7jGfqy+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r6OUgXZ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B75js+1O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vq+JBTPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I7jGfqy+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B2DC2001C;
	Thu, 17 Sep 2026 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789654031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfwbHmxT6E+UXfoHfKFxrx2mYaRxKqMI8z5hjEm22SQ=;
	b=r6OUgXZ1+iwufbBqw6FGKb2JKc3PB84G1RsdKEHNUNNB8JwUiE+BhYYaaUxJspMkNlW6eW
	MHK43BDKQ5cMs9k3kPzeU8+KoRV6Gf5lXbLk2Oprm8uZcM8OHVp6ngtCA/6tuFBGvIbpya
	a0/YkzYeamHXYSLd5D/eI8s097vTjgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789654031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfwbHmxT6E+UXfoHfKFxrx2mYaRxKqMI8z5hjEm22SQ=;
	b=B75js+1OsMxFwDDpcpVaWUubFlk/+a8cxnhQ48tH+dWBETTqas211k6EaGOT1DoQUcPbah
	F3IyYmFgy07fQQBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vq+JBTPb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I7jGfqy+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789654027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfwbHmxT6E+UXfoHfKFxrx2mYaRxKqMI8z5hjEm22SQ=;
	b=vq+JBTPb+XwziZlvpcUd9ycE/Aed1j5ozZVeCJ7BDjkXzvu9gXeidNs9v5eKDONpGh3YNp
	4WKF1PLinB54o5nxNRKD7zqgG48W7+xQ3ykpdv+cXZZVCDq6GMHFBAlOKv+UGQ/ySjMyU+
	Hc6LRLWT79deQzYPp5id3bOoKrooU0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789654027;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfwbHmxT6E+UXfoHfKFxrx2mYaRxKqMI8z5hjEm22SQ=;
	b=I7jGfqy+bUaxjxa5JH+ERUAEkky44UfxiGe+sov95j2K36JvKgH1cZTl5kVHKjH4m0uu03
	9VWvvxAxHSydRBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B2EC13974;
	Thu, 17 Sep 2026 14:07:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0yceCQv0q2rNYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 14:07:07 +0000
Date: Thu, 17 Sep 2026 16:07:06 +0200
Message-ID: <87ecesgeet.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.3-rc4
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9B2DC2001C
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

Linus,

please pull sound fixes for v7.3-rc4 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc4

The topmost commit is 546b928da0427b0d6c663cbb992bd7bfa9ac7971

----------------------------------------------------------------

sound fixes for 7.3-rc4

A collection of small fixes.  Most of them are device-specific fixes
while there are a few core fixes.  The continued flux, but not too
scaring yet.  Some highlights below.

ALSA Core:
- Fix potential UAF after asynchronous card release
- Fix a race condition in PCM timer initialization order

USB-Audio:
- Hardening fixes for issues reported by fuzzer for 6fire, bcd2000,
  and implicit FB packets
- Fix double list addition in implicit FB handling
- Quirks for AVerMedia GC553Pro and Behringer FCA1616

HD-Audio:
- Quirks / fixes for HP OmniBook 7, OMEN 15, and Victus 15 laptops

ASoC:
- Support for DAI link codec channel mask to avoid mismatches
- Fix HDMI-codec channel status change report
- Fixes for various codecs and platforms: Realtek rt712/rt721
  (calibration, reset fixes), Cirrus Logic (empty EFI variable
  validation, capture channel fixup), AMD ACP SoundWire (bounds
  checks, refactorings), ADAU1977 (OF match table support, SPI
  cleanups), ES8336 (Huawei Matebook B3-420 quirk), UX500 (macro fix)

----------------------------------------------------------------

Ai Chao (1):
      ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook B3-420

Alvin ©ipraga (3):
      ASoC: adau1977: make the Kconfig symbols user selectable
      ASoC: adau1977-spi: drop __maybe_unused and of_match_ptr()
      ASoC: adau1977-i2c: add OF match table for I2C

Asai Neko (1):
      ALSA: usb-audio: skip the broken mute control on AVerMedia GC553Pro

HyeongJun An (1):
      ASoC: hdmi-codec: Report a change when the channel status moves

Jack Yu (1):
      ASoC: rt712-sdca: reconfigure PLL2 to fix calibration time-out

Jaeho Cho (1):
      ALSA: hda/realtek: Enable mute LEDs on HP OmniBook 7 17-dc0xxx

Jiangshan Yi (1):
      ASoC: codecs: rt712-sdca-dmic: fix uninitialized stream_config->type

Kitty Makin (1):
      ALSA: usb-audio: Add capture quirk for Behringer FCA1616

Krish Gulati (1):
      ALSA: hda/realtek: Add quirk for HP Victus 15-fa1xxx (MB 8BB1) mute LED

Nguyen Ngoc Thang (2):
      ALSA: pcm: set timer->private_data before registering the PCM timer
      ALSA: usb-audio: fix list_add double-add in push_back_to_ready_list

Oder Chiou (1):
      ASoC: rt721: Reset codec to fix abnormal sound

Richard Fitzgerald (7):
      ASoC: wm_adsp: Firmware search progress log should not look like an error
      ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
      ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
      ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec params
      ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
      ASoC: sdw_utils: cs_amp: Delete bogus and incorrect capture channel fixup
      ASoC: cs-amp-lib: Prevent NULL pointer if efi variable is zero length

Sasha Levin (1):
      ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments

Slavin Liu (1):
      ALSA: hda: trace PCM open only after assigning a stream

Takashi Iwai (2):
      ALSA: bcd2000: Fix race between rawmidi and disconnect
      ALSA: core: Fix potential UAF after asynchronous card release

Vijendar Mukunda (4):
      ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
      ASoC: amd: acp: refactor codec config count in SOF SoundWire machine driver
      ASoC: amd: acp: fix ffs() operator precedence for SoundWire link ID
      ASoC: amd: acp: fix card name length warning in SOF SoundWire machine driver

Xavier Goffin (1):
      ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15-ax

Xiang Mei (2):
      ALSA: usb-audio: Clamp implicit feedback packet count to URB capacity
      ALSA: 6fire: fix OOB write from device-reported iso length

Yuho Choi (1):
      ALSA: virtio: reset device before deleting virtqueues

---
 include/sound/soc.h                     |  3 +-
 include/sound/soc_sdw_utils.h           |  2 -
 sound/core/init.c                       |  3 +-
 sound/core/pcm_timer.c                  |  7 ++-
 sound/hda/codecs/realtek/alc269.c       | 11 ++++-
 sound/hda/common/controller.c           |  2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 14 +++++-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 23 ++++++---
 sound/soc/codecs/Kconfig                |  4 +-
 sound/soc/codecs/adau1977-i2c.c         |  9 ++++
 sound/soc/codecs/adau1977-spi.c         | 12 ++---
 sound/soc/codecs/cs-amp-lib.c           |  2 +
 sound/soc/codecs/hdmi-codec.c           |  6 ++-
 sound/soc/codecs/rt712-sdca-dmic.c      | 14 ++----
 sound/soc/codecs/rt712-sdca-sdw.c       |  8 +++
 sound/soc/codecs/rt712-sdca.c           | 86 +++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt712-sdca.h           | 18 +++++++
 sound/soc/codecs/rt721-sdca-sdw.c       |  3 ++
 sound/soc/codecs/rt721-sdca.c           | 17 +++++++
 sound/soc/codecs/wm_adsp.c              |  5 +-
 sound/soc/intel/boards/sof_es8336.c     |  9 ++++
 sound/soc/sdw_utils/soc_sdw_cs_amp.c    | 46 ------------------
 sound/soc/sdw_utils/soc_sdw_utils.c     | 24 +++++----
 sound/soc/soc-pcm.c                     | 18 +++++--
 sound/soc/ux500/ux500_msp_i2s.h         |  4 +-
 sound/usb/6fire/pcm.c                   | 12 ++++-
 sound/usb/bcd2000/bcd2000.c             | 33 ++++++++++---
 sound/usb/card.h                        |  1 +
 sound/usb/endpoint.c                    | 21 +++++---
 sound/usb/implicit.c                    |  1 +
 sound/usb/mixer_maps.c                  | 13 +++++
 sound/virtio/virtio_card.c              |  4 +-
 32 files changed, 316 insertions(+), 119 deletions(-)

