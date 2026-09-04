Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625994BD11B;
	Fri,  4 Sep 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533130; cv=none; b=m60L04rRsLtVKzxaz3lSRNhZxefwhsTDguMyAet1LAZ0VKBmRF5eD5pNXRE2Jm9KjUODQ+M3SIqJqioRpGu8x35Y/7OT9ICGar2MrIMe5kjCvFP5Xk/1L+8BTl8GD9UrSaB4ZAiEeaTJ02X/wgbXj86Z+jrRlcHwaaObDZXPL+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533130; c=relaxed/simple;
	bh=slERl2dvq5Spzqv2HIyb/3aymRLpbkntgzHliuFBwV8=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=f8rs03wF/W77Gt2Ipj5LZt83b817Cr25WJ8kmfpaUfBy8/MP045PnHU/6LjhHeHvyeIxbrRzajaWN66OqRLa8xbVgZzpwFDsKVBFK16exMvYEv+SoFqz1Nk/tCm5oAFKcRa95xIWXQoWGfCQcYG8+RCWhAmq9LrAOWSxSo3kiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cVcDSyxP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WCawr2qe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cgQ6uVlj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bt1ix3eA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cVcDSyxP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WCawr2qe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cgQ6uVlj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bt1ix3eA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0AA0022540;
	Fri,  4 Sep 2026 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788533122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zGLmfvZ8R5JB0SBfBij6xq4Jo14B7AnjDL+sevxZuWA=;
	b=cVcDSyxPva+Ic+/bobPkbQKBRzpM0vXey8FuD79ExT49n4kpkSb7KKt38H+U0csADXbtWl
	SiULFJMXDULK5tAbU9sFIZcso3Wf591ikDqTN4lY85jqUHAIhHAgAov5Fao6wIfW8nHHZ6
	A0lnEcZL+sLPg0dVOocUs2qSDBMmUuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788533122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zGLmfvZ8R5JB0SBfBij6xq4Jo14B7AnjDL+sevxZuWA=;
	b=WCawr2qe7PFejIun6DQf7aUrNz6j+P52G977qkqaCy4KAqI5DMSWqzta92bVKPCgtfhla/
	z0xp2H1EyJBV5WDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788533118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zGLmfvZ8R5JB0SBfBij6xq4Jo14B7AnjDL+sevxZuWA=;
	b=cgQ6uVljsa7uhObOqqIbxb5eoK7UN/JIaZWaI8A8kpZJiz1hKOpxMR2I8MNL+37DvE5wwy
	xDKP2Xw2XlRQS+UILEhsIOayhHdRPYM8EjgDEPcrC/FMUuLmPbuoCc3BQ3ttnIqlUWotLi
	3+DG/1X0D00Qz8P5VaGtTjXc1YgbqTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788533118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=zGLmfvZ8R5JB0SBfBij6xq4Jo14B7AnjDL+sevxZuWA=;
	b=Bt1ix3eAa8/prjqRnMwTSQidHeZSEQKy2IJKuMcThVPTC7UPw37211q/F9eyjBT2l28Ff0
	554awvupUonJcBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C930613726;
	Fri,  4 Sep 2026 14:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YgPbL33Zmmq3WQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Sep 2026 14:45:17 +0000
Date: Fri, 04 Sep 2026 16:45:17 +0200
Message-ID: <875x0l5b42.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.3-rc2
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

Linus,

please pull sound fixes for v7.3-rc2 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc2

The topmost commit is 3b26ceef88c110f4d188387cffa0df78657be904

----------------------------------------------------------------

sound fixes for 7.3-rc2

A collection of small fixes since 7.3-rc1.  Quite a few fixes are
for ALSA core for issues that have been detected by the things you
know well.  Additionally a series of hardening for runtime PM, and
usual quirk updates, and some other misc driver fixes are included.

* Core:
- Fixes for PCM races
- UMP parser NULL dereference fix
- Fix error handling in rawmidi ioctl

* USB- and HD-audio:
- Implement missing runtime PM guards across multiple interfaces
- Fix for OOB access in US-122L MIDI driver
- Double-free fix for CAIAQ driver
- Quirks for HD-audio Realtek & Cirrus codecs, Conexant S3-resume,
  USB Audient devices

* Others:
- Fix of logical mistakes in dummy driver mixer and selftest code
- Lock init fix in the legacy harmony driver

----------------------------------------------------------------

HyeongJun An (4):
      ALSA: usb-audio: fix OOB write in snd_usbmidi_us122l_output()
      ALSA: dummy: Report a change when one capture switch channel moves
      ALSA: rawmidi: Return the error from snd_rawmidi_input_params()
      selftests/alsa: Fix the step check for INTEGER controls

Jonne Vuorela (1):
      ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2

Oleksandr Kovalov (1):
      ALSA: hda/realtek: Fix cold-boot headset misdetection on Acer Aspire A515-57G

Peter Drabik (1):
      ALSA: usb-audio: Add mixer map quirk for Audient iD24

Qingyu Zhang (1):
      ALSA: ump: do not touch legacy_rmidi before it exists

Riku Matsumura (1):
      ALSA: hda/realtek: Add quirk for VAIO VJS131

Runyu Xiao (1):
      ALSA: harmony: initialize locks before requesting IRQ

Takashi Iwai (2):
      ALSA: pcm: Fix race between non-atomic ops and trigger-start
      ALSA: caiaq: Fix potential double-free at error path

Will Porter (6):
      ALSA: usb-audio: Add PM guard to Studio 1810c controls
      ALSA: usb-audio: Add PM guards to US-16x08 transfers
      ALSA: usb-audio: Add PM guard to Scarlett meter reads
      ALSA: usb-audio: Guard Scarlett2 protocol transfers
      ALSA: usb-audio: Add PM guards to RME Digiface controls
      ALSA: usb-audio: Guard FCP protocol transfers

Xu Rao (1):
      ALSA: hda: restore MFG widget enumeration after core split

Yilin Zhang (1):
      ALSA: pcm: Serialize PCM mmap with buffer reallocation to fix page UAF

Zhang Heng (2):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 9 14ILL10
      ALSA: hda/realtek: Add quirk for Acer Predator PHN16-72

feng liu (1):
      ALSA: hda/conexant:Fix abnormal Mic/Speaker functionality on SN6140 after S3 wake-up

---
 sound/core/pcm_native.c                   | 37 +++++++++++++++++++++--------
 sound/core/rawmidi.c                      |  2 +-
 sound/core/ump.c                          |  4 ++++
 sound/drivers/dummy.c                     |  2 +-
 sound/hda/codecs/cirrus/cs420x.c          |  2 ++
 sound/hda/codecs/conexant.c               | 20 ++++++++++++++++
 sound/hda/codecs/realtek/alc269.c         | 39 ++++++++++++++++++++++++++++++-
 sound/hda/core/device.c                   |  5 ++--
 sound/parisc/harmony.c                    |  6 ++---
 sound/usb/caiaq/audio.c                   | 10 ++++----
 sound/usb/fcp.c                           |  8 +++++++
 sound/usb/midi.c                          |  2 ++
 sound/usb/mixer_maps.c                    | 18 ++++++++++++++
 sound/usb/mixer_quirks.c                  |  8 +++++++
 sound/usb/mixer_s1810c.c                  |  8 +++++++
 sound/usb/mixer_scarlett.c                |  4 ++++
 sound/usb/mixer_scarlett2.c               | 36 +++++++++++++++++++++++-----
 sound/usb/mixer_us16x08.c                 |  7 ++++++
 tools/testing/selftests/alsa/mixer-test.c |  4 ++--
 19 files changed, 191 insertions(+), 31 deletions(-)

