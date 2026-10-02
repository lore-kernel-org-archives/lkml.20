Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A92BE655;
	Fri,  2 Oct 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951752; cv=none; b=E7CfaE/jXrLy1nylVUNCHXVV0Lod87jWekSXmiiy5USUtCRhER+dmg5KWsWM+MnTkkjelmIfBilBxnqtnmEwIDD2gAHG0IpXxRJUXcf7RZnX1EjyEQxmF7gEskaUrOJBYgR45OCj3YPc5G5Oet9OPo8UfRIWMeQE+TOy/SM04QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951752; c=relaxed/simple;
	bh=3DPAeIdWvzJy8u+kbMXA96sXiuGLtnl6EI9vSA9UdVk=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=qOyxkAAxEbk7A6os3E8L8ywdLAkgih35dKTuBn5neEti+cvg8zVdlCXlZHzMN9Alu04UUAgg/3lBTWOfQ1IaGPGSdtoB9WzytgEKExlAJ8Hf7jta3mcrg9jhJu9E//aQR3AWshMewQ/C7hr9T2J8eqd7GyR0l77IBqMf87ruL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ha6wkK5m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i8PuR4Fc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yHqilYNf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LQnWefy0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ha6wkK5m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i8PuR4Fc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yHqilYNf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LQnWefy0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 783EC21DE3;
	Fri,  2 Oct 2026 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790951744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=UHPSw6y5oDuUCHzsbizJiJzWjZAPaHgU/9oO1mnW/j8=;
	b=Ha6wkK5m9ssIJqye42FzQeDp5/ml6EPAHaMVY0ysrovdh64weeW8OGUs6XiMr4s3Cyyarc
	F1ror/rXge7hjCMX0bUv1syhuSP9yMVuPW7wyWyAhr/ZcH9hop825hENLImhXUtnDl4lRb
	IWoaTL0OVQdkiNcIff7LphZXFzi1Zlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790951744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=UHPSw6y5oDuUCHzsbizJiJzWjZAPaHgU/9oO1mnW/j8=;
	b=i8PuR4FcsoxRVXclAeRWoaW0gGR6z4TrnLvCYppYJ4VhgtLqnT40yZ6fB3pvt30rwEPyc9
	d2Ua98kgAaLty4BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yHqilYNf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LQnWefy0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790951740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=UHPSw6y5oDuUCHzsbizJiJzWjZAPaHgU/9oO1mnW/j8=;
	b=yHqilYNf4/+rQtfabsYuW6uWF/WWProtUQZWYXvdKtR9WJ26U6rofemC07VgcX1onCRYm2
	/yH6jQeyyDicosDpeiw3WtcXePV6IyZzyf7LRAbBuDAuqfCSD05n6+wKWUGWeNZdIaX6GR
	hvx3zy7+AaP5ZyWpJcJY/3zx64JW718=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790951740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=UHPSw6y5oDuUCHzsbizJiJzWjZAPaHgU/9oO1mnW/j8=;
	b=LQnWefy05IlTxy+8jHqgN1VpNrdC0fUmMfqV03uAxavZStolR/qx6ERyS1jcYNndIDQ1ik
	ApJtPcgk2zF6+TDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E18A139A3;
	Fri,  2 Oct 2026 14:35:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vELIATzBv2rsRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 14:35:40 +0000
Date: Fri, 02 Oct 2026 16:35:39 +0200
Message-ID: <87h5j4yxtw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.3-rc6
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 783EC21DE3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.3-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc6

The topmost commit is b4e7fc36e31f59b318d38afe621ac20650314d27

----------------------------------------------------------------

sound fixes for 7.3-rc6

A fair amount of small fixes, which became much larger as a pile of
pending homeworks during my vacation in the last weeks.
The majority of changes are device-specific quirks and ASoC updates,
along with a few ALSA core fixes and USB-audio hardening as well as a
few regression fixes.

ALSA Core:
- Serialize ALSA sequencer compat port-info ioctls

HD-audio:
- Fix ALC235 codec headset handling
- Fix regression on Tegra194 controller support
- Quirks / fixes for Lenovo, ASUS, Acer, Dell, Higole, HP, and IPASON
  laptops

USB-audio:
- Hardening for line6 and ua101 drivers to deal with malformed packets
- Fix input device leak on probe error in caiaq driver
- Apply quirks generically for Audient and Behringer devices
- Quirks for ASUS SupremeFX Hi-Fi, HiBy FC4 (native DSD), and MSI MAG
  B850M MORTAR WIFI

ASoC:
- Runtime PM fixes for SDCA class function driver
- Fix uninitialized stream configs in RT1017 and MAX98363 SDW codecs
- AMD ACP SoundWire support for ASUS and Lenovo models
- Quirks for Intel machines (Lenovo Yoga Slim 7, Chuwi Hi8)
- Qualcomm LPASS fixes for playback constraints and WSA macro volume
- Codec / platform fixes for rt274/rt286, cs42l43, wm8903, Tegra ASRC

Misc:
- Regression fix for silent playback on Creative Titanium HD
- Error handling fix at probe via auto-cleanup in ice1712

----------------------------------------------------------------

Aaron Kling (1):
      ALSA: hda/tegra: Re-enable SDO workaround for Tegra194

Achilles Zhang (1):
      ALSA: usb-audio: Add native DSD quirk for HiBy FC4

Arnd Bergmann (1):
      ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID

Bartosz Brom (1):
      ALSA: hda/realtek: Add mute LED quirks for HP Pavilion 15-eh3174nw and HP Laptop 15-dw1xxx

Cezary Rojewski (2):
      ASoC: codecs: rt286: Revert delay value for jack setup
      ASoC: codecs: rt274: Fix format setting for 44100 rate

Charles Keepax (1):
      ASoC: Intel: Add quirk to block match table for Lenovo Yoga Slim 7

Daniel Ortiz (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo V15 G6 ARP

Harin Lee (1):
      ALSA: ctxfi: Fix silent playback on Titanium HD (SB1270)

Harrison Lucas (1):
      ALSA: hda/realtek: Fix mute and micmute LEDs on HP ENVY x360 15-ey0xxx

Hernan Ganzo (1):
      ALSA: hda/realtek: Limit internal mic boost on HP Pavilion 15 (103c:2164)

HyeongJun An (1):
      ASoC: wm8903: Move the DRC QR threshold to the register that holds it

Jakub Gawlik (1):
      ALSA: hda/realtek: Add micmute LED quirk for Acer Swift SFG16-72

Jasper Firth (1):
      ASoC: Intel: bytcr_rt5651: Add quirk for Chuwi Hi8 with generic DMI strings

Jiangshan Yi (2):
      ASoC: codecs: max98363: fix uninitialized stream_config->type
      ASoC: codecs: rt1017-sdca-sdw: fix uninitialized stream_config->type

Jianyu Zhou (1):
      ALSA: hda/realtek: Add quirk for IPASON SmartBook S1

KIM MinWoo (1):
      ALSA: hda/realtek: Add quirk for Lenovo ThinkBook 16p Gen 3 ARH (21EK)

Kailang Yang (1):
      ALSA: hda/realtek - Add headset mode for Dell Pro QC1255

Krish Gulati (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx

Kyle Zeng (1):
      ALSA: seq: Serialize compat port-info ioctls

Liviu Nicoara (1):
      ASoC: codecs: lpass-wsa-macro: rewrite the interpolator volume after enabling clocks

Luis Banha (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-ec1xxx

Maciej Strozek (2):
      ASoC: SDCA: Set suspended flag after resuming within system suspend
      ASoC: SDCA: Add better pm_runtime error handling in func probe

Matt Barr (1):
      ALSA: hda/realtek: Drop Yoga Pro 9 16IAH10 PCI SSID quirk

Muhtasham Nawr al-Mahmud (1):
      ALSA: hda/realtek: Fix speakers on ASUS PM3406CHA

Nguyen Ngoc Thang (1):
      ALSA: caiaq: unregister the input device when probe fails

Preston Lam (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Laptop 15-fd2xxx

Richard Fitzgerald (1):
      spi: cs42l43: Workaround for wrong speaker ID on Dell XPS 13 DX13260

Roman Bolotov (1):
      ALSA: usb-audio: Add quirk flag for ASUS SupremeFX Hi-Fi

Seiji Adachi (1):
      ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to quirks

Sheetal (1):
      ASoC: tegra: Fix ASRC Stream6 input threshold control

Syed Saba Kareem (1):
      ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine

Takashi Iwai (4):
      ALSA: usb-audio: Apply boot quirk for Behringer models generically
      ALSA: usb-audio: Apply IGNORE_CTL_ERROR quirk to all Audient devices
      ALSA: core: Define auto-cleanup for snd_card_free()
      ALSA: ice1712: Fix the error handling via auto-cleanup at probe

Tarun Noonemunthala (1):
      ALSA: hda/realtek: Add quirk for HP ENVY 13-aq1xxx

Tomasz Bojanowski (1):
      ALSA: usb-audio: Add mixer mapping for MSI MAG B850M MORTAR WIFI

Xiang Mei (2):
      ALSA: ua101: reject mismatched capture/playback packet sizes
      ALSA: line6: reject oversized playback packets

Yu-Hsiang Tseng (1):
      ALSA: hda/realtek: Fix silent speaker on Higole F9B

Zeyu Li (1):
      ALSA: hda/realtek: Add ALC235 support for headset mode

Zhang Heng (7):
      ASoC: amd: acp: Add DMI quirk for Lenovo Yoga Pro 7 14ASP9
      ALSA: hda/realtek: Add quirk for Acer Nitro ANV16-41
      ALSA: hda/realtek: Fix square wave output on ASUS Strix G615LR
      ALSA: hda/realtek: Add quirk for Lenovo ThinkBook G8+
      ALSA: hda/realtek: Add quirk for Acer Nitro AN515-45
      ASoC: amd: acp-config: Add ACP70 DMI quirk for ASUS UM5406GA
      ALSA: hda/realtek: Add quirk for HP Pavilion AiO 24 speaker

Zimeng Li (1):
      ASoC: qcom: lpass-cpu: use DAI table index for playback constraints

renpanpan (1):
      ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 14-dv1001TU

---
 drivers/spi/spi-cs42l43.c                          | 97 ++++++++++++++++++++++
 include/sound/core.h                               |  9 ++
 sound/core/seq/seq_compat.c                        |  4 +-
 sound/hda/codecs/realtek/alc269.c                  | 62 +++++++++++++-
 sound/hda/codecs/realtek/realtek.c                 |  6 ++
 sound/hda/controllers/tegra.c                      |  3 +-
 sound/pci/ctxfi/cthw20k2.c                         |  2 +
 sound/pci/ice1712/ice1712.c                        |  2 +-
 sound/soc/amd/acp-config.c                         | 14 ++++
 sound/soc/amd/acp/Kconfig                          |  1 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c           | 20 +++++
 sound/soc/amd/yc/acp6x-mach.c                      | 14 ++++
 sound/soc/codecs/Kconfig                           |  4 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |  3 +
 sound/soc/codecs/max98363.c                        |  2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 | 27 ++----
 sound/soc/codecs/rt274.c                           |  4 +-
 sound/soc/codecs/rt286.c                           |  2 +-
 sound/soc/codecs/wm8903.c                          |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c              | 17 ++++
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |  1 +
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.c  | 16 ++++
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.h  |  1 +
 sound/soc/qcom/lpass-cpu.c                         |  4 +-
 sound/soc/sdca/sdca_class_function.c               | 19 +++--
 sound/soc/tegra/tegra186_asrc.c                    |  2 +-
 sound/usb/caiaq/device.c                           |  3 +
 sound/usb/line6/playback.c                         |  7 ++
 sound/usb/misc/ua101.c                             |  9 ++
 sound/usb/mixer_maps.c                             |  4 +
 sound/usb/quirks.c                                 | 16 +++-
 31 files changed, 331 insertions(+), 46 deletions(-)

