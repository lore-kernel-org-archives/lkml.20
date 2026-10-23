Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740179;
	b=LdaH9VPwgfkXZwBpEh9YVk5bGSDETQseZUhIe9Tc+5wxAp0AlPClN6Hl6gDoNv7/AX6t
	 CfC2RKAYx7TJCQQ44zFiNuwppVuOjr6bXdWN846u0k0X3tN8dut9vCc+GCnWorxDgtX05
	 cYbPHqDAlR3tJ4acfWudSFuT1An/GeQZoWyLzAx+HGgb6Z8J8uoGuuJr2TARa/qNzwRgL
	 Ktr9DWlLl4ceXEG0wrGo2ULng6R0Ml3SyiSwLQel5XITzBOrxGvMMxNKmJVtWhn2OSKfp
	 cO3v5fmQF6QaDOn6hWU5msQd8Cbr7QtrfZ0JNJeBNef+V54QBkiQkAmwl+MaOe95FLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740179;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=N/lpAwdn0+spG+NkAAydtdjUy71XyLckCbqnM6wgzH8=;
	b=FQO9O4+QohTFwmG4SwuFlAuGf8kmXzJHOXj58L6q81K9UPyv9kipykD21tOInEAdYxkA
	 gaXIVwvqevj3a2sAehZu4AXwjLUfdhVP0WZqtuUsLkK9UULB8NbHlV6/392/uXpuC4stF
	 ZsUXOrUeUTDgnDBbtJ5g1Nyo5d3M6m4kymJ5Kv6EubED3qI9rls1j9afHnqA4/1KWGBTn
	 ig1V9I6z8p+v/jIbkkq4OeFf9ONodUqf7728tT7oFB9pROuVOfKOeerLEsUs6E9sx8HT5
	 Gao4V1lkv2lNYDLShCG+uanRDJCLawjIhGUEA2dKajWK43FiZBcSGQq0YzWcMmU3Tug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qMUO2gjF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="eG/TUyFD";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qMUO2gjF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="eG/TUyFD";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6FA606A31A;
	Fri, 23 Oct 2026 07:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qMUO2gjF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eG/TUyFD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qMUO2gjF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eG/TUyFD
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A3F821FBD;
	Fri, 23 Oct 2026 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792740170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N/lpAwdn0+spG+NkAAydtdjUy71XyLckCbqnM6wgzH8=;
	b=qMUO2gjFT4oCwhTQk6RXRPM6PqcJtwGa33AamlOKBS9w5OTDe+ioZro8WBEksnTJYEtXo4
	le6Zjt+LCV1SnLRoa2Kxp14nBLgTaVMGKzqvI4ZYiON4dPfRLwm90lAHSJz8L8ao+FMzum
	tV0ybbWRjvnWx2cxOJs+nplQcxBiebU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792740170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N/lpAwdn0+spG+NkAAydtdjUy71XyLckCbqnM6wgzH8=;
	b=eG/TUyFDusFX1sobJTBlnpBY0CNnNFmPmOljZgJNakYz6LdnE/cS2UP5ieXLLzyI0p5pB4
	l3Rq6ObfbxHF1MAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792740170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N/lpAwdn0+spG+NkAAydtdjUy71XyLckCbqnM6wgzH8=;
	b=qMUO2gjFT4oCwhTQk6RXRPM6PqcJtwGa33AamlOKBS9w5OTDe+ioZro8WBEksnTJYEtXo4
	le6Zjt+LCV1SnLRoa2Kxp14nBLgTaVMGKzqvI4ZYiON4dPfRLwm90lAHSJz8L8ao+FMzum
	tV0ybbWRjvnWx2cxOJs+nplQcxBiebU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792740170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N/lpAwdn0+spG+NkAAydtdjUy71XyLckCbqnM6wgzH8=;
	b=eG/TUyFDusFX1sobJTBlnpBY0CNnNFmPmOljZgJNakYz6LdnE/cS2UP5ieXLLzyI0p5pB4
	l3Rq6ObfbxHF1MAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A196133F3;
	Fri, 23 Oct 2026 07:22:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id plkqHEkL22qvPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 07:22:49 +0000
Date: Fri, 23 Oct 2026 09:22:49 +0200
Message-ID: <87ecdgc246.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound updates for 7.4-rc1
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Level: 
X-Spam-Flag: NO

Linus,

please pull sound fixes for v7.4-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc1

The topmost commit is ed7995e4ec3789a90e37eb826bfccf43cc85d2fd

----------------------------------------------------------------

sound updates for 7.4-rc1

The AI flood continues, which brought us a fairly busy development
cycle again with changes spread across the subsystem, ranging from
(lots of) core hardening to new platforms and codecs.

Here are some highlights.

* ALSA core:
- PCM: race fixes around channel-map controls, draining/unlink, drop
  sync-stop handling, and DMA buffer delay sync
- Compress-offload: state and geometry validations, buffer leak fix,
  and stream/card lifetime management
- Jack: module pinning during debugfs access, control removal race
  fix, and early injection exposure
- Timer & sequencer: module pinning for user timers, RCU grace period
  wait on port deletion, UMP bounds fixes
- Mark OSS sequencer emulation as deprecated
- RawMIDI: proper disconnect handling and input work drain cleanup
- Control: fixes for vmaster racy setups and control callback
  serialization, UAF fix on card disconnect

* ASoC core:
- Continued framework refactoring, deployment of
  auto_selectable_formats across codecs and platform DAIs
- Generic card cleanup: free jack GPIOs on card remove for simple-card
  and audio-graph-card variants
- SDCA improvements: SimpleJack function type support, library
  helpers, and non-ACPI build support
- Conversion of deprecated DMA API calls

* ASoC SOF:
- Support for compressed audio playback on SOF IPC4 with Intel TGL+
- AMD ACP 7.B / 7.F SoundWire and PDM controller support, ASP carveout
  firmware loading
- Function topology support for Intel I2S machines

* ASoC platforms & codecs:
- Qualcomm: New QAIF driver for Shikra platform, WCD9378 SDCA codec,
  Nord Ride/RRD and Motorola Edge 30 boards, LPASS macro cache
  converted to maple tree
- New codec drivers: ESS ES9039Q2M, Nuvoton NAU83G60 amplifier, Senary
  SN624x SoundWire SDCA codec
- MediaTek / Airoha: New Airoha AN7581 AFE and WM8960 machine drivers,
  extensive clock and error-handling cleanups across MediaTek SoCs
- NVIDIA Tegra: WM8994 machine driver and CS35L45 MDSYNC support
- Realtek: RT766/RT767, RT721_U, RT718 variants, RT712 GPIO LED
  control
- Cirrus Logic: CS35L45 MDSYNC support, CS35L56 regmap default tests
- TI: TAS2573 DSP support in TAS2781, TAS2783 SoundWire fixes
- Everest Semi: ES8326 standby / HPF controls, ES8389 / ES8375 resume
  fixes
- Removal of obsolete ST-Ericsson Ux500 MOP500 machine driver

* HD-audio:
- ACPI controller runtime PM suspend/resume support
- Controller shutdown and unbind race fixes for unsol events and jack
  polling
- HDMI: High Bit Rate (HBR) audio capability enabled, ELD proc and
  converter bounds checks
- AW88399 side codec SSID-specific firmware naming and Lenovo Legion
  R9000P enablement
- Realtek / Conexant / Cirrus / TI quirks for numerous laptops
 (Lenovo, ASUS, HP, Acer, HONOR, Minisforum, MSI, etc.)
- Creative CA0132 Sound BlasterX AE-5 external RGB LED strip support

* USB-audio:
- Dedicated mixer driver for Audient EVO4
- Native Instruments Kore controller LCD support and keymap fix
- Pioneer DJ DDJ-SZ and Roland (OCTA-CAPTURE / QUAD-CAPTURE multirate,
  TD-11) support
- UAC2/3 mixer unit matrix evaluation and bounds checking
- Hardening for LINE6 and caiaq drivers against malformed packets and
  races
- Device-specific quirks for PreSonus, TASCAM, Logitech, Mayflower,
  MOONDROP, Yamaha, etc.

Misc:
- Auto-cleanup conversion for snd_card_free() and devres migration
  across dozens of legacy PCI, ISA, and Sparc drivers
- ALSA loopback (aloop) timer lifecycle fixes and new aloop selftest
- pcmtest driver fixes and kselftest updates

[ Note that there can be a merge conflict in
    sound/hda/codecs/side-codecs/cs35l41_hda.c
  and the diffstat below is a result after conflict resolution ]

----------------------------------------------------------------

Aaron Kling (1):
      ALSA: hda/hdmi: Enable HBR capability

Aayush Kumar (1):
      ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10

Ajanesh Lal (1):
      ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)

Ajay Kumar Nandam (4):
      ASoC: qcom: q6apm: clear g_apm on driver removal
      ASoC: qcom: qdsp6: generalize GPR service domain
      ASoC: dt-bindings: qcom,q6apm-dai: add memory-region and relax iommus
      ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

Akhil Arul (1):
      ALSA: rawmidi: give up draining output when the device stops draining

Alexander Koch (2):
      ASoC: codecs: ak4619: Add optional powerdown GPIO
      ASoC: dt-bindings: asahi-kasei,ak4619: Add powerdown GPIO

Ali Ahmet Memiş (3):
      ALSA: seq: Wait for one RCU grace period when deleting all ports
      ALSA: control_led: Fix deadlock between sysfs writes and card disconnect
      ALSA: hda: intel: Don't free card in the probe work

Alireza Feyzabadi Farahani (1):
      selftests: ALSA: Skip timer tests when device is unavailable

Amadeusz Sławiński (9):
      ALSA: pcm: Fix driver_tstamp value reporting
      ASoC: soc-link: Correct stream stop operations in snd_soc_link_trigger
      ASoC: ops: Fix return value in snd_soc_limit_volume()
      ASoC: soc-topology-test: Check return value of kunit_device_register()
      ASoC: soc-card-test: Check return value of kunit_device_register()
      ASoC: soc-ac97: Fix error handling in snd_soc_new_ac97_component()
      ASoC: soc-ac97: Fix debug message
      ASoC: soc-component: Fix return type of snd_soc_pcm_component_pointer()
      ASoC: soc-dapm: Remove widget from cache on removal

Andrew Udvare (1):
      ALSA: hda/realtek: Fix speaker dropouts on MSI GE66 Raider 11UE

Andrey Golovko (3):
      ASoC: tas2783-sdw: make multi-byte MBQ registers reachable
      ASoC: tas2783-sdw: do not cache read-only Controls
      ASoC: tas2783-sdw: stop describing the Latency and XU ID/Version Controls

Andy Shevchenko (8):
      ASoC: stm32: spdifrx: Drop mention of the deprecated and unused call
      ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
      ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel() by dma_request_chan()
      ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()
      ASoC: fsl_asrc: Replace dma_request_slave_channel() by dma_request_chan()
      gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()
      dmaengine: Remove deprecated dma_request_slave_channel()
      ASoC: sprd: Shadow errors from dma_request_chan()

Arnd Bergmann (1):
      ASoC: amd: acp: add EFI dependency for selecting TAS2783

Art O Cathain (1):
      ASoC: amd: acp-config: force SoundWire probe on Dell 14S DS14265

Baojun Xu (1):
      ASoC: tas2783-sdw: add firmware download status check

Baoquan He (1):
      ALSA: n64: don't use GFP_DMA when calling dma_alloc_coherent()

Bard Liao (8):
      ASoC: SOF: get nhlt from all topologies
      ALSA: intel-nhlt: lower intel_nhlt_ssp_device_type log level
      ASoC: Intel: sof-function-topology-lib: create common helpers
      ASoC: Intel: sof-function-topology-lib: skip non-exist file in best_effort mode
      ASoC: Intel: sof-function-topology-lib: add I2S support for sof_sdw_get_tplg_files
      ASoC: Intel: sof-function-topology-lib: add get_function_topology for I2S machines
      ASoC: soc-acpi-intel-ptl-match: I2S machines: use function topology
      ASoC: Intel: sof-function-topology-lib: fix sscanf type

Bill Wendling (1):
      firmware: cs_dsp: Annotate struct cs_dsp_coeff_ctl with __counted_by_ptr

Bob Song (1):
      ALSA: hda: Reset response counter when a verb times out

Brian Norris (1):
      ALSA: hda: Discard pm_runtime_put_autosuspend() return value

Cen Zhang (21):
      ALSA: timer: Pin the module for userspace timer controllers
      ALSA: jack: Remove debugfs before freeing unregistered jacks
      ALSA: rawmidi: Drain input work before freeing the runtime
      ALSA: pcm: Protect delay DMA sync against concurrent HW_FREE
      ALSA: vmaster: Serialize hook registration with control callbacks
      ALSA: emux: Guard the OSS argument during port initialization
      ALSA: seq: oss: Prevent duplicate MIDI device teardown
      ALSA: pcm: Unlink substreams before releasing them
      ALSA: pcm: Serialize and check HW_REFINE ioctls
      ALSA: mixer: oss: Serialize initial slot construction
      ALSA: vmaster: Protect follower lookup and setup
      ALSA: seq: oss: Ignore sync echoes without a write queue
      ALSA: jack: Protect the index scan against control removal
      ALSA: pcm: Protect the unregister notifier traversal
      ALSA: oss: Keep emulation modules loaded until object teardown
      ALSA: pcmtest: Pin the module while pattern files are open
      ALSA: pcm: Remove channel-map controls before freeing substreams
      ALSA: jack: Pin the module while debugfs files are open
      ALSA: pcm: Protect channel-map reads against runtime detach
      ALSA: aloop: Keep shared timer callbacks alive through close
      ALSA: aloop: Keep the timer source alive until card release

Cezary Rojewski (17):
      ASoC: Intel: avs: Use list_count_nodes() to simplify the code
      ASoC: codecs: hda: Use list_count_nodes() to simplify the code
      ASoC: Intel: avs: Remove topology-loading wrappers
      ASoC: codecs: rt5514: Fix the pm_ops constant name
      ASoC: codecs: rt286: Revert delay value for jack setup
      ASoC: codecs: rt274: Fix format setting for 44100 rate
      ALSA: hda: Fix struct hdac_bus documentation
      ASoC: core: Add component constructor
      ASoC: core: Rename and export soc_component_add()
      ASoC: dmaengine: Switch to snd_snd_component_new()
      ASoC: topology-test: Switch to snd_snd_component_new()
      ASoC: Intel: catpt: Switch to snd_snd_component_new()
      ASoC: Intel: avs: Switch to snd_snd_component_new()
      ASoC: core: Remove unused component-register members
      ASoC: Intel: avs: Unprepare a stream when recovery occurs
      ASoC: Intel: avs: Verify sizes of configs coming from topology
      ASoC: Intel: avs: Prevent module info underflow

Chancel Liu (32):
      ASoC: fsl_mqs: Add DAPM output widgets for MQS_L/MQS_R pins
      ASoC: wm8962: Fix regulator notifier and beep leaks on card re-bind
      ASoC: wm8995: Register regulator notifiers from the bus probe
      ASoC: tlv320aic31xx: Register regulator notifier from the I2C probe
      ASoC: tlv320aic3x: Register regulator notifier from the bus probe
      ASoC: cs42l52: Fix beep input device leak on card re-bind
      ASoC: cs42l56: Fix beep input device leak on card re-bind
      ASoC: simple-card-utils: Add simple_util_remove_jack()
      ASoC: simple-card: Free jack GPIOs on card remove
      ASoC: audio-graph-card: Free jack GPIOs on card remove
      ASoC: audio-graph-card2: Free jack GPIOs on card remove
      ASoC: codecs: cpcap: Fix devm resource leaks across card bind/unbind
      ASoC: codecs: da7218: Fix devm resource leaks across card bind/unbind
      ASoC: codecs: tlv320aic32x4: Fix clock leak from runtime callbacks
      ASoC: codecs: twl4030: Acquire board params and hs_extmute GPIO in the platform probe
      ASoC: codecs: es8316: Move mclk acquisition to the i2c probe
      ASoC: codecs: es8323: Move mclk acquisition to the i2c probe
      ASoC: codecs: es8311: Move mclk acquisition to the i2c probe
      ASoC: codecs: es8328: Move clk acquisition to the bus probe
      ASoC: codecs: rt5640: Move mclk acquisition to the i2c probe
      ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe
      ASoC: codecs: rt5514: Move clk acquisition to the i2c probe
      ASoC: codecs: rt5682s: Move mclk acquisition to the i2c probe
      ASoC: codecs: max98090: Move mclk acquisition to the i2c probe
      ASoC: codecs: max98095: Move mclk acquisition to the i2c probe
      ASoC: codecs: wm8985: Move regulator acquisition to the bus probe
      ASoC: codecs: wm8955: Move regulator acquisition to the i2c probe
      ASoC: codecs: es8389: Move regulator and mclk acquisition to the i2c probe
      ASoC: codecs: rt5677-spi: Free the DSP context on component remove
      ASoC: codecs: rt1011: Free the bq/drc coefficient arrays on component remove
      ASoC: codecs: rt5645: Free the hardware EQ parameters on component remove
      ASoC: codecs: rt5514-spi: Free the DSP context on component remove

Charles Keepax (2):
      ASoC: soc-ops: Clarify kernel doc for snd_soc_info_volsw_xs()
      ASoC: SDCA: Remove redundant comment

Christian Marangi (6):
      ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
      ASoC: airoha: Add AFE driver for Airoha AN7581
      ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
      ASoC: airoha: Add machine driver for Airoha AN7581
      ASoC: mediatek: common: permit to provide dedicated regmap for irq
      ASoC: airoha: Fix sparse warning for AN7581 AFE PCM

Christian Ruppert (2):
      Fix Audient EVO4 master playback control name
      Add Audient EVO4 mixer quirks

Colin Ian King (1):
      ASoC: tas2781: Fix spelling mistake "config" -> "config"

Dan Carpenter (1):
      ASoC: codecs: aw88261: small cleanup in aw88261_set_tdm_slot()

Danish Khateeb (1):
      ALSA: timer: Handle userspace-driven timer ioctls from 32-bit tasks

Darren Chang (1):
      ALSA: usb-audio: Add quirk for inverted sample rates on NUX NAI-24

David Cemin (2):
      ALSA: hda/acpi: add runtime PM suspend/resume to the ACPI controller
      ASoC: sdw_utils: clear stale RT711 device reference on exit

David Heidelberg (6):
      ASoC: wcd-mbhc-v2: Fix incorrect properties names and typos
      ASoC: qcom: sdm845: Demystify TDM masks a bit
      ASoC: qcom: sdm845: use DSP_A format for TDM codec DAIs
      ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
      ASoC: qcom: sdm845: Set codec dai and component sysclk during startup
      ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots

Denis Arefev (1):
      ALSA: cs46xx: fix unit mismatch in DSP code area bounds check

Denis Yakovlev (3):
      ALSA: hda/realtek: Enable bass speakers on HONOR MagicBook Pro 16 2024
      ALSA: hda/realtek: Enable headset mic on HONOR MagicBook Pro 16 2024
      ALSA: hda/realtek: Drop unneeded DAC override for HONOR MagicBook Pro 16 2024

Devin Christensen (1):
      ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support

Dimitri Wegner (1):
      ALSA: usb-audio: Add feedback snap quirk for Mayflower ARC AMP

Diogo Ivo (1):
      ASoC: dt-bindings: realtek,rt5677: Add MCLK1 clock property

Eduard Bostina (1):
      ASoC: dt-bindings: Convert TI DA830 EVM audio to DT schema

Evgeny Akhtimirov (1):
      ALSA: hda/realtek: Enable all four speaker amps on Lenovo ThinkBook X G2 IAH

Fan Wu (1):
      ASoC: amd: ps: fix snd_acp63_remove() teardown ordering

Federico Amedeo Izzo (1):
      ASoC: codecs: aw88261: expose hardware mute control

Geert Uytterhoeven (3):
      ASoC: codecs: lpass: Make sure clk_init_data is fully initialized
      ASoC: codecs: wcd934x: Make sure clk_init_data is fully initialized
      ASoC: tlv320aic32x4: Make sure clk_init_data is fully initialized

Georg Wenzel (1):
      ALSA: hda/tas2781: Enable bass speakers support

George Christidis (1):
      ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3402VA

Gergo Koteles (2):
      ALSA: hda/tas2781: Assign total_sz at the end of the function
      ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data

Giovanni Maria Mazzone (1):
      ALSA: hda/realtek: Add quirk for HP 15s-eq3xxx mute LED

Gonçalo Miranda (1):
      ALSA: hda/conexant: Add quirk for Acer Aspire Go 16 mic mute LED

Guangshuo Li (1):
      ASoC: Intel: atom: Fix platform device leak on probe failure

Hanh Kieu (1):
      ALSA: usb-audio: add Pioneer DJ DDJ-SZ support

Haotian Zhang (1):
      ASoC: rockchip: fix device node reference leak in rk3288_hdmi_analog

Harendra Gautam (10):
      ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
      ASoC: qcom: Add QAIF shared data structures and variant interface
      ASoC: qcom: Add QAIF hardware register map
      ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init
      ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
      ASoC: qcom: Switch lpass-cpu and qaif-cpu to snd_soc_of_xlate_dai_name()
      ASoC: qcom: Add QAIF PCM operations
      ASoC: qcom: Add QAIF IRQ handling and platform register
      ASoC: qcom: Add Shikra QAIF support
      MAINTAINERS: Add Qualcomm QAIF driver entry

Hemanth Selam (26):
      ASoC: codecs: fix typos in comments
      firmware: cirrus: fix typo "upto" in comment
      ALSA: core: seq: oss: fix typos in comments
      ALSA: hda: fix typos in comments
      ALSA: usb-audio: fix typos in comments
      ALSA: i2c: fix typos in comments
      ALSA: emu10k1: fix typos in comments
      ALSA: emux: fix typos in comments
      ALSA: firewire: bebob: fix typos in comments
      ALSA: opti9xx: fix typos in comments
      ALSA: hal2: fix typos in comments
      ALSA: ppc: tumbler: fix typos in comments
      ALSA: ac97: fix typos in comments
      ALSA: au88x0: fix typos in comments
      ALSA: aw2: fix typos in comments
      ALSA: cs4281: fix typos in comments
      ALSA: cs46xx: fix typos in comments
      ALSA: echoaudio: fix typos in comments
      ALSA: lx6464es: fix typos in comments
      ALSA: pcxhr: fix typos in comments
      ALSA: riptide: fix typos in comments
      ALSA: rme32: fix typos in comments
      ALSA: hdsp: fix typos in comments
      ALSA: trident: fix typos in comments
      ALSA: vx: fix typos in comments
      ASoC: fix typos in comments

Henrik Enquist (4):
      ALSA: aloop: Don't constrain playback params in notify mode
      selftests/alsa: Add a test for snd-aloop notify mode
      ALSA: aloop: Update the PCM Slave controls for a matching playback
      selftests/alsa: Check the aloop PCM Slave controls for a matching playback

Hongyan Xu (1):
      ASoC: mt6359-accdet: manage private workqueues with devres

Hongyang Zhao (5):
      ASoC: dt-bindings: es8316: Document jack detect inversion
      ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3 sound card
      ASoC: qcom: common: Add generic headset jack helpers
      ASoC: qcom: sc8280xp: Add per-DAI board configuration
      ASoC: qcom: sc8280xp: Add RubikPi 3 sound card support

HyeongJun An (26):
      selftests/alsa: Test writes to IEC958 controls
      selftests/alsa: Do not take another control's event as our own
      selftests/alsa: Check that a write does not silently change other controls
      ASoC: codecs: wm8990: Fix definition of right input PGA controls
      ASoC: codecs: wm8990: Fix definition of LOMIX AINLMUX Bypass Volume control
      ASoC: codecs: wm8991: Fix definition of right input PGA controls
      ASoC: codecs: wm8991: Fix definition of LOMIX AINLMUX Bypass Volume control
      ASoC: codecs: wm8983: Fix definition of ADC 128x Oversampling control
      ASoC: codecs: wm8985: Fix definition of ADC 128x Oversampling control
      ASoC: codecs: wm8994: Fix definition of WM8958 noise gate hold time controls
      ASoC: codecs: wm8955: Fix definition of Treble Cutoff control
      ASoC: codecs: wm_hubs: Fix definition of MIXINR to MIXOUTR volume control
      ASoC: codecs: wm8737: Fix definition of zero cross switches
      ASoC: codecs: wm5100: Fix definition of EQ3 Band 1 Volume control
      ASoC: codecs: wm8750: Fix definition of ALC Capture NG Type control
      ASoC: codecs: wm8510: Fix definition of ADC Inversion Switch control
      ASoC: codecs: da732x: Fix definition of ADC2 EQ Overall Volume control
      ASoC: codecs: tlv320adc3xxx: Fix definition of AGC Target Level control
      ASoC: codecs: sta32x: Fix definition of Ch2 and Ch3 Volume Bypass controls
      ASoC: codecs: sta350: Fix definition of Ch2 and Ch3 Volume Bypass controls
      ASoC: codecs: sta32x: Fix definition of limiter threshold controls
      ASoC: codecs: sta350: Fix definition of limiter threshold controls
      ASoC: tlv320aic32x4: Fix definition of TAS2505 HP Driver Gain Volume control
      selftests: ALSA: pcmtest: Check the frame count of each transfer
      selftests: ALSA: pcmtest: Make room for the longest fill pattern
      selftests: ALSA: pcmtest: Compare all captured bytes in ni_capture

Ilya Pavlukhin (4):
      ACPI: scan: Add CLSA0102 to the serial bus ignore list
      platform/x86: serial-multi-instantiate: Add CLSA0102
      ALSA: hda: cs35l41: Add support for CLSA0102
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 7 Carbon 14ACN6

Imtiaz Chowdhury (1):
      ALSA: hda/realtek: Add HP ENVY Laptop 13-ba1xxx quirk

Iván Ezequiel Rodriguez (1):
      ALSA: hda/realtek: keep headset mic on Acer SSID 0x1640

Jack Yu (3):
      ASoC: rt1320: make SRAM registers readable to stop being cached
      ASoC: rt721-sdca: Adjust blindwrite flow to fix type detection issue
      ASoC: rt721-sdca: Fix inconsistent indenting in jack detect handler

James Calligeros (2):
      ASoC: tas2764: Initialise SDZ GPIO low
      ASoC: tas2770: Initialise SDZ GPIO low

Jared Wuerzburger (1):
      ALSA: hda/realtek: Fix internal mic on Minisforum V3 and V3 SE

Jiale Yao (6):
      ASoC: rt5682-sdw: always cancel jack work on remove
      ASoC: rt711-sdw: always cancel jack work on remove
      ASoC: rt711-sdca: always cancel jack work on remove
      ASoC: rt712-sdca: always cancel jack work on remove
      ASoC: rt721-sdca: always cancel jack work on remove
      ASoC: rt722-sdca: always cancel jack work on remove

Jonathan Seth Mainguy (4):
      ALSA: usb-audio: add Roland OCTA-CAPTURE multirate support
      ALSA: usb-audio: expose OCTA-CAPTURE control MIDI cables
      ALSA: usb-audio: add Roland QUAD-CAPTURE multirate support
      ALSA: usb-audio: set Roland Capture rate during stream preparation

Joonho Lee (2):
      ALSA: pcm: allow capture reads while draining
      ALSA: pcm: refresh linked pointers before draining

Joonhoe Kim (1):
      ASoC: codecs: wcd939x: read the SoundWire port switches per channel

José Miguel Castellanos Valladolid (1):
      ALSA: hda/realtek: Enable mute LEDs on HP OmniBook X Flip 14-fm0xxx

Junjie Cao (1):
      ASoC: rt712-sdca-dmic: fix drvdata type in the gain controls

Jurica Vukadin (1):
      ALSA: usb-audio: Add mic volume quirk for Logitech Brio 100

Justin Bacle (1):
      ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i

Karl Asseily (4):
      dt-bindings: vendor-prefixes: add ESS Technology
      ASoC: dt-bindings: add ESS Technology ES9039Q2M
      ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
      MAINTAINERS: add entry for the ES9039Q2M codec driver

Karl Mehltretter (2):
      ALSA: control: Fix virtual master creation reference in kernel-doc
      ASoC: codecs: es8375: use devm_clk_get_optional() for mclk

Keane Mbae (1):
      ALSA: hda/realtek: Add mic-mute LED quirk for the HP 245 14 inch G10

Kees Cook (4):
      ASoC: rockchip: rk3399_gru_sound: Allocate dai_link with ARRAY_SIZE()
      ASoC: codecs: wm8904: Add const to drc_texts allocation type
      ASoC: codecs: wm8958: Add const to enum texts allocation types
      ASoC: SOF: topology: Add const to tplg_files allocation type

Khanh Le (1):
      ASoC: ak4619: Add suspend and resume callbacks

Krzysztof Kozlowski (2):
      ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
      ASoC: dt-bindings: Use consistent indentation in the example

Kuninori Morimoto (96):
      ASoC: soc-card: don't use card->dai_link[] in for_each_card_prelinks()
      ASoC: soc-core: make fmt_{single/multiple}_name() non static
      ASoC: soc-dai: move snd_soc_add_dai_controls()
      ASoC: soc-dai: move snd_soc_dai_name_get()
      ASoC: soc-dai: move snd_soc_is_match_dai_args()
      ASoC: soc-dai: move snd_soc_is_matching_dai()
      ASoC: soc-dai: move snd_soc_{un}register_dai()
      ASoC: soc-dai: move soc_pcm_set_dai_params()
      ASoC: soc-dai: move soc_pcm_{apply/params/update}_symmetry()
      ASoC: soc-dai: move snd_soc_dai_get_pcm_stream() to soc-dai.c
      ASoC: soc-dai: move snd_soc_dai_{get/set}_widget() to soc-dai.c
      ASoC: soc-dai: move snd_soc_dai_dma_data_{get/set}() to soc-dai.c
      ASoC: soc-dai: move snd_soc_dai_tdm_mask_{get/set}() to soc-dai.c
      ASoC: soc-dai: move snd_soc_dai_stream_active() to soc-dai.c
      ASoC: soc-dai: move snd_soc_dai_{set/get}_stream() to soc-dai.c
      ASoC: codecs: 88pm860x: use .auto_selectable_formats
      ASoC: codecs: ab8500: use .auto_selectable_formats
      ASoC: codecs: adau*: use .auto_selectable_formats
      ASoC: codecs: ak4*: use .auto_selectable_formats
      ASoC: codecs: ak5*: use .auto_selectable_formats
      ASoC: codecs: alc56*: use .auto_selectable_formats
      ASoC: codecs: arizona: use .auto_selectable_formats
      ASoC: codecs: cpcap: use .auto_selectable_formats
      ASoC: codecs: cs35l*: use .auto_selectable_formats
      ASoC: codecs: cs42*: use .auto_selectable_formats
      ASoC: codecs: cs5*: use .auto_selectable_formats
      ASoC: codecs: cx2072x: use .auto_selectable_formats
      ASoC: codecs: da*: use .auto_selectable_formats
      ASoC: codecs: es*: use .auto_selectable_formats
      ASoC: codecs: inno_rk3036: use .auto_selectable_formats
      ASoC: codecs: isabelle: use .auto_selectable_formats
      ASoC: codecs: lm49453: use .auto_selectable_formats
      ASoC: codecs: max*: use .auto_selectable_formats
      ASoC: codecs: mc13783: use .auto_selectable_formats
      ASoC: codecs: ml26124: use .auto_selectable_formats
      ASoC: codecs: nau*: use .auto_selectable_formats
      ASoC: codecs: ntp8*: use .auto_selectable_formats
      ASoC: codecs: rk33*: use .auto_selectable_formats
      ASoC: codecs: rtq912*: use .auto_selectable_formats
      ASoC: codecs: rt*: use .auto_selectable_formats
      ASoC: codecs: sgtl5000: use .auto_selectable_formats
      ASoC: codecs: si476x: use .auto_selectable_formats
      ASoC: codecs: sma130*: use .auto_selectable_formats
      ASoC: codecs: src4xxx: use .auto_selectable_formats
      ASoC: codecs: ssm*: use .auto_selectable_formats
      ASoC: codecs: sta*: use .auto_selectable_formats
      ASoC: codecs: tas*: use .auto_selectable_formats
      ASoC: codecs: tfa9879: use .auto_selectable_formats
      ASoC: codecs: tlv320*: use .auto_selectable_formats
      ASoC: codecs: tscs454: use .auto_selectable_formats
      ASoC: codecs: twl4030: use .auto_selectable_formats
      ASoC: codecs: uda13*: use .auto_selectable_formats
      ASoC: codecs: wm*: use .auto_selectable_formats
      ASoC: codecs: zl38060: use .auto_selectable_formats
      ASoC: dwc: use .auto_selectable_formats
      ASoC: hisilicon: use .auto_selectable_formats
      ASoC: img: use .auto_selectable_formats
      ASoC: jz4740: use .auto_selectable_formats
      ASoC: kirkwood: use .auto_selectable_formats
      ASoC: loongson: use .auto_selectable_formats
      ASoC: mxs: use .auto_selectable_formats
      ASoC: pxa: use .auto_selectable_formats
      ASoC: renesas: use .auto_selectable_formats
      ASoC: rockchip: use .auto_selectable_formats
      ASoC: sti: use .auto_selectable_formats
      ASoC: stm: use .auto_selectable_formats
      ASoC: sunxi: use .auto_selectable_formats
      ASoC: tegra: use .auto_selectable_formats
      ASoC: ti: use .auto_selectable_formats
      ASoC: uniphier: use .auto_selectable_formats
      ASoC: ux500: use .auto_selectable_formats
      ASoC: xtensa: use .auto_selectable_formats
      ASoC: soc-dai: use snd_soc_dai_stream_active()
      ASoC: soc-dai: add snd_soc_dai_id()
      ASoC: soc-dai: add snd_soc_dai_to_component()
      ASoC: soc-dai: add snd_soc_dai_to_driver()
      ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
      ASoC: soc-dai: add snd_soc_dai_get_symmetric_xxx()
      ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
      ASoC: soc-dai: add snd_soc_dai_get_bclk[_ratio]()
      ASoC: soc-dai: rename snd_soc_dai_action() to snd_soc_dai_active_update()
      ASoC: codecs: twl4030: tidyup twl4030_soc_probe()
      ASoC: codecs: cpcap: tidyup cpcap_soc_probe()
      ASoC: soc-component: tidyup be_hw_params_fixup() define position
      ASoC: soc-component: replace bool member to bit field
      ASoC: soc-component: move snd_soc_add_component_controls()
      ASoC: soc-component: move snd_soc_component_fixup_controls()
      ASoC: soc-component: move soc_component_to_node() to soc-component.c
      ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
      ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
      ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
      ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
      ASoC: soc-component: move snd_soc_component_active() to soc-component.c
      ASoC: soc-component: move component_list to soc-component.c
      ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
      ASoC: soc-component: rename snd_soc_component_async_complete()

Le Qi (1):
      ASoC: codecs: da7213: Get MCLK in I2C probe

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for rongyuan GS20

Linus Walleij (4):
      ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
      ASoC: dt-bindings: ux500: Remove MOP500 sound card binding
      ASoC: ab8500: Skip digital microphone support on AB8505
      ASoC: ux500: Remove the MOP500 machine driver

Liu Eason (1):
      ALSA: hda/conexant: Fix silent speaker on Huawei MateBook 14 (SN6140)

Luis Gerardo Lopez Hernandez (1):
      ALSA: hda/realtek: Fix internal speakers on Acer Aspire AL16-31P

Ma Ke (2):
      ASoC: wcd9335: Fix device reference leak in wcd9335_slim_status()
      ALSA: hda: cs35l41: Fix ACPI device reference leak on probe failure

Maciej Strozek (2):
      ASoC: SDCA: Improve scanning the SWFT during FDL
      ASoC: SDCA: Check return value on a missing FDL_Set_Index Range

Maksim Krasutski (1):
      ALSA: hda/realtek: Fix mute LEDs on HP ENVY 17-cr1xxx

Marco Giunta (7):
      ASoC: aw88399: skip BSTS check when boost converter is bypassed
      ASoC: aw88399: remove bsts_unreliable workaround
      ALSA: hda/scodec: imply SERIAL_MULTI_INSTANTIATE for AW88399
      MAINTAINERS: add entry for AW88399 HDA side codec driver
      ASoC: aw88399: pass firmware name as argument
      ALSA: hda: aw88399: use SSID-specific firmware name
      ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P AFR10

Mario Limonciello (1):
      ASoC: amd: acp63: add standalone ES9356 SoundWire machine

Matej Sochan (1):
      ALSA: hda/realtek: Fix silent speakers on Lenovo Legion S7 15IMH05

Maurizio Casciano (2):
      ASoC: Intel: Add Cherry Trail RT5677 machine driver
      ASoC: Intel: cht: Add Yoga Book RT5677 machine entry

Michael Auer (1):
      ASoC: qcom: sdm845: Disable the quaternary MI2S bit clock on shutdown

Michał Kopeć (4):
      ASoC: mediatek: common: Keep codec references until the card is bound
      ASoC: mediatek: Don't keep a freed topology name in the static card
      ASoC: mediatek: mt8188: Constrain UL8 FE to its back end's capabilities
      ASoC: hdmi-codec: Don't parse an empty ELD on startup

Mingxuan Guo (2):
      firmware: cs_dsp: clear dsp->running on the cs_dsp_run() error path
      firmware: cs_dsp: add a KUnit test for the cs_dsp_run() error path

Mizuno Miotsuki (1):
      ASoC: codecs: rk3308: add support for codec revision B

Mohammad Rafi Shaik (8):
      ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM dai ids
      ASoC: qcom: qdsp6: lpass-ports: add support for QAIF AIF MI2S and TDM dais
      ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM interfaces
      ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support
      ASoC: codec: pcm1681: Add TDM support
      ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
      ASoC: qcom: sc8280xp: Add Nord sound card support

Moroz Tymofii (1):
      ALSA: hda/realtek: Enable mute LED on HP Pavilion 15-eg2xxx

Mukesh Ojha (11):
      ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8196: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
      ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
      ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
      ASoC: sprd: Use devm_of_reserved_mem_device_init()
      ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()

Myeonghun Pak (4):
      ASoC: fsl_xcvr: free IRQ before canceling reset work
      ASoC: stm: stm32_i2s: request IRQ after regmap initialization
      ASoC: codecs: rt5682s: disable jack detection work on shutdown
      ASoC: rt5645: Shut down the button timer on removal

Nazmi Maizan (1):
      ALSA: hda/realtek: Fix speakers on COLORFUL L1 Plus

Neo Chang (8):
      ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
      ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
      ASoC: codecs: nau8360: Fix static declarations and endianness
      ASoC: codecs: nau8360: Fix kernel-doc issues
      ASoC: codecs: nau8360: Add default PEQ band number for DSP init
      ASoC: codecs: nau8360: Fix misleading return in nau8360_message_to_dsp()
      ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
      ASoC: codecs: nau8360: Fix AB-BA deadlock in mux update

Nicholas Hobson (1):
      ALSA: usb-audio: keep MIDI input running for Roland TD-11

Nicolas Chauvet (1):
      ALSA: usb-audio: Add quirk for Logitech HD Pro Webcam c920

Nika Sommer (1):
      ALSA: hda/realtek: Enable jack detection on Minisforum AI X1

Niko Huuskonen (4):
      ALSA: caiaq: Serialize access to the EP1 command buffer
      ALSA: caiaq: Fix the Kore controller key map
      ALSA: uapi: Add hwdep interface ID for caiaq devices
      ALSA: caiaq: Add LCD support for the Kore controllers

Niranjan H Y (1):
      ASoC: amd: acp-legacy-mach: skip dai link for amp reference stream

Oder Chiou (2):
      ASoC: rt721: Use the function_status check to avoid duplicate presets
      ASoC: rt721: Add support for the RT721_U and RT718 codec variants

Olivier Kaloudoff (1):
      ALSA: usb-audio: Add mic resolution quirk for Logitech Webcam C200

Peng Fan (3):
      ASoC: use regmap_assign_bits() for conditional set/clear
      ALSA/ASoC: use assign_bit() where applicable
      ASoC: soc-generic-dmaengine-pcm: use dmaengine_get_dma_device() for DMA device

Pengpeng Hou (23):
      ASoC: report component resume callback errors
      ASoC: es8326: report resume restore errors
      ASoC: es8375: report resume restore errors
      ASoC: es8389: report resume restore errors
      ASoC: fs210x: report register restore errors
      ASoC: codecs: sma1307: validate setting firmware layout
      ASoC: sta32x: make power restoration transactional
      ASoC: nau8822: keep regcache offline while supplies are off
      ASoC: rt1015: make control calibration failures observable
      ASoC: adau17x1: return cache sync errors from resume
      ASoC: ak4642: return cache sync errors from resume
      ASoC: es8316: return cache sync errors from resume
      ASoC: es8323: return cache sync errors from resume
      ASoC: nau8540: return cache sync errors from resume
      ASoC: rt1011: return cache sync errors from resume
      ASoC: rt1016: return cache sync errors from resume
      ASoC: rt1305: return cache sync errors from resume
      ASoC: rt1308: return cache sync errors from resume
      ASoC: rt1318: return cache sync errors from resume
      ASoC: rt5616: return cache sync errors from resume
      ASoC: rt5659: return cache sync errors from resume
      ASoC: rt5660: return cache sync errors from resume
      ASoC: rt5665: return cache sync errors from resume

Peter Robinson (1):
      ASoC: pcm5102a: Add support for optional reset gpio

Peter Ujfalusi (29):
      ALSA: compress: pin card module while stream is open
      ALSA: compress: register the open file with the card
      ALSA: compress: stop active streams on disconnect
      ALSA: compress: Set the draining state before the drain trigger
      ASoC: soc-compress: Provide a runtime for the compressed FE substream
      ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal PCMs
      ASoC: soc-compress: Stop running dpcm on free
      ASoC: SOF: sof-audio: Fix the pipeline_list population
      ASoC: SOF: ipc4-pcm: Serialize the PCM free with the pipeline triggers
      ASoC: SOF: sof-audio: do not dereference swidget->spipe unconditionally on free
      ASoC: SOF: ipc4: Add definition of module data in init_ext object type
      ASoC: SOF: ipc4-topology: Support init_ext_module_data for process modules
      ASoC: SOF: ipc4-pcm: Make the timestamp info usable outside of ipc4-pcm.c
      ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to fw_config_params
      ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
      ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
      ASoC: SOF: Check that the audio buffer fits into the page table
      ASoC: SOF: Add support for IPC4 compressed
      ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
      ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
      ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
      ALSA: hda/hdmi: clamp num_cvts against cvt_nids[] in hdmi_read_pin_conn
      ALSA: hda/hdmi: clamp sad_count in ELD proc write handler
      ALSA: x86: hdmi: fix chmap array missing terminator entry
      ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use
      ALSA: compress: fix buffer leak on failed SET_PARAMS
      ALSA: compress: reject buffer geometry change on gapless next_track
      ALSA: compress: add missing OPEN-state gate to SET_METADATA
      ALSA: compress: reject restarting an ACTIVE task via origin_seqno

Piotr Gliźniewicz (3):
      ALSA: 6fire: take stream_mutex in the Digital Thru control
      ALSA: 6fire: add a playback channel map
      ALSA: 6fire: add S/PDIF output

Prasad Kumpatla (4):
      ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
      ASoC: qcom: sc8280xp: add Maili sound card configuration
      ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
      ASoC: qcom: sc8280xp: add Maili sound card configuration

Priyanka Mani (1):
      ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()

Qianghua Wang (3):
      ASoC: codecs: add SN624x SDCA SoundWire driver
      ASoC: sdw_utils: add Senary SN624x helpers and codec_info
      ASoC: Intel: soc-acpi: add SN624x entries for ARL/LNL/MTL/PTL

Randy Dunlap (1):
      docs: sound: hdspm: clean up driver doc.

Ranjani Sridharan (7):
      ASoC: SOF: compress: Move the IPC agnostic helpers to sof-audio.c
      ASoC: SOF: compress: Rename compress ops with ipc3 prefix
      ASoC: SOF: sof-audio: Expose a couple of functions
      ASoC: SOF: pcm: Modify the signature of a couple of PCM IPC ops
      ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
      ASoC: SOF: ops: Add new platform-specific ops for compress
      ASoC: SOF: topology: Add support for decoder and encoder widgets

Ricardo Rivera-Matos (4):
      ASoC: dt-bindings: cs35l45: Adds SYNC properties
      ASoC: cs35l45: Adds support for SYNC bus
      ASoC: dt-bindings: cs35l45: Adds LDPM settings
      ASoC: cs35l45: Adds support for LDPM feature

Richard Acayan (1):
      ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible

Richard Fitzgerald (1):
      ASoC: cs35l56: Add KUnit tests for regmap defaults table

Rob Herring (Arm) (6):
      ASoC: ak4642: Drop "clocks" property presence check
      ASoC: twl4030: Fix "ti,hs_extmute" property type
      ASoC: sta3xx: Fix "st,drop-compensation-ns" size
      ASoC: dt-bindings: mediatek: Fix MT7622 clock count
      ASoC: dt-bindings: hi6210-i2s: Allow graph ports
      ASoC: dt-bindings: Fix TAS2563 address constraints

Rong Zhang (2):
      ALSA: usb-audio: Convert snd_usb_apply_interface_quirk() into a switch statement
      ALSA: usb-audio: Add quirks for HP Elite x3 Lap Dock

Rosen Penev (4):
      ASoC: uniphier: aio-dma: pass chip to irq handler
      ASoC: tegra: ADX: convert map to flexible array
      ASoC: xilinx: formatter_pcm: use more devm in probe
      ASoC: fsl: mpc5200: gate AC97 driver on PPC_MPC52xx

Runyu Xiao (8):
      ALSA: mpu401: shut down timer before freeing MPU
      ALSA: oxygen: use helper to activate the SPDIF PCM control
      ALSA: via82xx: use helper to activate DXS controls
      ALSA: usb-audio: Protect Roland control activation
      ALSA: sgio2audio: Only free successfully requested IRQs
      m68k: dmasound: Keep the Q40 IRQ handler registered
      ASoC: pcm6240: do not free an unrequested IRQ
      ASoC: codecs: wcd937x: request watchdog IRQs without devm

Saim Masood (1):
      ALSA: hda/realtek: Fix speakers on ASUS ExpertBook PM3606CHA

Sandro Pischinger (1):
      ALSA: usb-audio: Add iface reset quirk for TASCAM US-16x08

Scott Gauche (1):
      ALSA: hda/realtek: Fix audio after Windows reboot on ASUS Q423SA

Shawn Guo (2):
      ASoC: dt-bindings: ti,pcm1681: Document the PCM1681 supplies
      ASoC: codec: pcm1681: Enable the PCM1681 supplies

Sheetal (1):
      ASoC: tegra: Fix ASRC Stream6 input threshold control

Shenghao Ding (5):
      ASoC: tas2781: add support for TAS2573 DSP functionality
      ASoC: tas2781: Add register decoded info to I/O error logs
      ASoC: tas2781: Add TAS2573 calibration support
      ASoC: tas2781: Refactor register error log with unified macro
      ASoC: tas2781: Fix TAS2781/TAS5825 PPC version logic conflict

Shengjiu Wang (6):
      ASoC: fsl_asrc: use regmap_write_bits to update clock source registers
      ASoC: dt-bindings: fsl,imx-asrc: update port binding to support multiple paths
      ASoC: dt-bindings: fsl,easrc: add ports binding for multiple conversion paths
      ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct
      ASoC: fsl_asrc: expose individual DAIs per conversion path
      ASoC: fsl_easrc: expose individual DAIs per conversion path

Shuming Fan (6):
      ASoC: rt1320: avoid re-initialize in advanced mode
      ASoC: rt712: add GPIOs for LED control
      ASoC: sdw_utils: Add rt766/rt767 support
      ASoC: rt766: avoid re-initialize the blind write
      ASoC: rt712: avoid duplicate reset in io_init
      ASoC: rt766: trigger JD when system reboots

Slavin Liu (1):
      ASoC: fsl_asrc: check the second front-end DMA channel

Srinivas Kandagatla (15):
      ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
      ASoC: SDCA: make find_sdca_control_reset() return void
      ASoC: codecs: lpass-wsa-macro: use v2.5 Compander1 addresses on v2.5+
      ASoC: codecs: lpass-{rx,wsa}-macro: sort reg_defaults before regmap init
      ASoC: codecs: lpass-wsa-macro: switch cache to REGCACHE_MAPLE
      ASoC: codecs: lpass-rx-macro: switch cache to REGCACHE_MAPLE
      ASoC: codecs: lpass-tx-macro: switch cache to REGCACHE_MAPLE
      ASoC: codecs: lpass-va-macro: switch cache to REGCACHE_MAPLE
      ASoC: SDCA: allow building without ACPI
      ASoC: SDCA: export PM helpers keyed on sdca_class_drv
      ASoC: SDCA: expose class SoundWire probe/remove as library
      ASoC: SDCA: add class_ops with populate_function
      ASoC: SDCA: class_function: xlate sound-dai cell by entity index
      ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
      ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

Steven 'Steve' Kendall (1):
      ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect

Sung Byeongchan (1):
      ALSA: pcmtest: handle multiple wraps in random capture fill

Sven Jans (1):
      ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx

Svyatoslav Ryhel (4):
      ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
      ASoC: tegra: Support auxiliary devices
      ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
      ASoC: tegra: Support WM8994 by machine driver

Syed Saba Kareem (1):
      ASoC: amd: acp: fix TAS2783 SoundWire codec unmet dependencies

Takashi Iwai (108):
      ALSA: rawmidi: Add a proper disconnect handling
      ALSA: seq: Mark OSS sequencer emulation as deprecated
      ALSA: core: Check shutdown flag at D0 power-state, too
      ALSA: control: Fix UAF in snd_ctl_elem_add() on card disconnect
      ALSA: usb-audio: Check mixer matrix size for UAC2/3 at parsing
      ALSA: usb-audio: Fix UAC2 mixer unit request handling
      ALSA: usb-audio: Optimize min/max/res parse for UAC2
      ALSA: ump: Avoid dereference with max_src_size=0
      ALSA: galaxy: Use auto-cleanup for probe card error handling
      ALSA: sc6000: Use auto-cleanup for probe card error handling
      ALSA: ad1889: Use auto-cleanup for probe card error handling
      ALSA: ali5451: Use auto-cleanup for probe card error handling
      ALSA: als4000: Use auto-cleanup for probe card error handling
      ALSA: atiixp: Use auto-cleanup for probe card error handling
      ALSA: au88x0: Use auto-cleanup for probe card error handling
      ALSA: azt3328: Use auto-cleanup for probe card error handling
      ALSA: bt87x: Use auto-cleanup for probe card error handling
      ALSA: ca0106: Use auto-cleanup for probe card error handling
      ALSA: cs4281: Use auto-cleanup for probe card error handling
      ALSA: cs5535audio: Use auto-cleanup for probe card error handling
      ALSA: echoaudio: Use auto-cleanup for probe card error handling
      ALSA: emu10k1x: Use auto-cleanup for probe card error handling
      ALSA: ens137x: Use auto-cleanup for probe card error handling
      ALSA: es1938: Use auto-cleanup for probe card error handling
      ALSA: es1968: Use auto-cleanup for probe card error handling
      ALSA: fm801: Use auto-cleanup for probe card error handling
      ALSA: ice1724: Use auto-cleanup for probe card error handling
      ALSA: intel8x0: Use auto-cleanup for probe card error handling
      ALSA: lola: Use auto-cleanup for probe card error handling
      ALSA: maestro3: Use auto-cleanup for probe card error handling
      ALSA: oxygen: Use auto-cleanup for probe card error handling
      ALSA: riptide: Use auto-cleanup for probe card error handling
      ALSA: rme32: Use auto-cleanup for probe card error handling
      ALSA: rm96: Use auto-cleanup for probe card error handling
      ALSA: sis7019: Use auto-cleanup for probe card error handling
      ALSA: sonicbibes: Use auto-cleanup for probe card error handling
      ALSA: via82xx: Use auto-cleanup for probe card error handling
      ALSA: ymfpci: Use auto-cleanup for probe card error handling
      ALSA: intel-hdmi-audio: Use auto-cleanup for probe card error handling
      ALSA: Drop unused snd_card_free_on_error()
      ALSA: pcm: Optimize cpu_latency_qos_*() calls
      ALSA: als300: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: aw2: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: cmipci: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: cs46xx: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: korg1212: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: lx6464es: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: hdsp: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: hdspm: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: rme9652: Avoid manual calls of snd_card_free() at probe card error handling
      ALSA: mips: hal2: Use devres card management
      ALSA: mips: sgio2audio: Use devres card management
      ALSA: mips: n64: Handle card removal properly
      ALSA: parisc: harmony: Use devres card management
      ALSA: ctxfi: Use devres card management
      ALSA: powermac: Use devres card management
      ALSA: sh: Use devres card management
      ALSA: sparc: cs4231: Use devres card management
      ALSA: sparc: dbri: Use devres card management
      ALSA: caiaq: Allow zero-length packet handling for EP1
      ALSA: seq: Drop the bogus RCU guard from clientptr()
      ALSA: pcm: Fix TOCTOU state overwrite in snd_pcm_drop()
      ALSA: hda: Fix potential UAF for gating jack
      ALSA: usb-audio: Fix invalid UAC2/3 mixer unit matrix evaluation
      ALSA: usb-audio: Fix data race at mixer_ctl_feature_info()
      ALSA: pcmtest: Fix a bogus pointer read in snd_pcmtst_pcm_pointer()
      ALSA: usb-audio: Fix mixer bitmap cache over 32 channels
      ALSA: core: Add missing barriers for power_ref vs card->shutdown
      ALSA: seq: Fix missing direction and ump_group handling in 32bit compat ioctl
      ALSA: pcmtest: Fix leak at probe error
      ALSA: pcmtest: Use platform_device_register_simple()
      ALSA: info: Fix memory leak at card removal
      ALSA: aloop: Avoid a bad mixure of guard() and goto
      ALSA: core: Fix leaks at snd_card_init() error paths
      ALSA: seq: Don't lose partial read failure
      ALSA: hda: Use linked list for jack table
      ALSA: hda: Avoid non-operational GPU warning at regular device removal
      ALSA: hda: Stop unsol events and jack polling before codec unbind
      ASoC: codecs: hda: Stop unsol events and jack polling before codec removal
      ALSA: hda: Make hdac_device.registered a plain bool
      ALSA: hda: Don't free card at probe error in vga_switcheroo handler
      ALSA: caiaq: Register card at the final step
      ALSA: caiaq: Fix races at MIDI URB and trigger accesses
      ALSA: usb: us16x08: Fix racy accesses of mixer elements
      ALSA: line6: Reject too small max packet sizes
      ALSA: line6: Fix potential OOB write in line6_capture_copy()
      ASoC: fsl_asrc_m2m: Fix bogus compress task pointer assignments
      ALSA: hda: intel: Cancel delayed work at shutdown, too
      ALSA: hda: Disable unsol event handling at error and shutdown paths
      ALSA: hda: Add lock around codec->registered flag manipulations
      ALSA: hda: Stop unsol event and jack polling at hda-ext device removal, too
      ALSA: hda: Add NULL check for the driver pointer at unsol event work
      Revert "ALSA: hda/tas2781: Enable bass speakers support"
      ALSA: jack: Fix kctl free at error in snd_jack_kctl_new()
      ALSA: pcm: Protect delay DMA sync in forward and rewind, too
      ALSA: line6: Use kzalloc() for PCM buffer allocation
      ALSA: usb-audio: Use fixed control index for us16x08 mixer elements
      ALSA: pcm: Apply sync-stop at SNDRV_PCM_IOCTL_DROP ioctl
      ALSA: ump: Correct return size of fill_rpn()
      ALSA: pcm: Add refcount for races between drain and unlink
      ALSA: core: Serialize snd_refcount put and sync
      ALSA: pcm: Call snd_pcm_sync_stop outside spinlock in snd_pcm_drop()
      ALSA: jack: Expose injection debugfs at device register phase
      ALSA: seq: oss: Skip events until fully initialized
      ALSA: usb-audio: Avoid applying boot quirk for Behringer UMC204HD
      ALSA: emux: Fix UAF of soundfont zones at note-on
      ALSA: emux: Stop voices before freeing zones in all cases
      ALSA: line6: Handle period elapsed calls outside the locks

Thierry Reding (1):
      dt-bindings: ASoC: nvidia,tegra30-ahub: Convert to json-schema

Thomas Nemer (2):
      ALSA: usb-audio: Fix missing sample-rate control for PreSonus AudioBox USB
      ALSA: usb-audio: Skip sample-rate read-back on PreSonus AudioBox USB

Thorsten Blum (5):
      ALSA: usb-audio: Simplify usb_audio_make_shortname()
      ALSA: usb-audio: Simplify usb_audio_make_longname()
      ALSA: hiface: Use scnprintf() in hiface_chip_create()
      ALSA: caiaq: Use strscpy() in snd_usb_caiaq_input_init()
      ALSA: usb-audio: Use strscpy() in append_ctl_name()

Ting-Han Hou (1):
      ALSA: virtio: reset I/O message fill level on prepare

Vadym Shevchuk (1):
      ALSA: usb-audio: Add quirk for Shanling UP4

Val Packett (4):
      ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
      ASoC: qcom: sm8250: add Senary MI2S RX support
      ASoC: dt-bindings: qcom,sm8250: Add Motorola Edge 30 sound card
      ASoC: qcom: sm8250: Add motorola-dubai soundcard compatible

Vasiliy Kovalev (1):
      ALSA: hda/via: Apply runtime PM workaround for ASUS X55A

Vijendar Mukunda (22):
      ASoC: SOF: amd: return -EINVAL for unknown PCI revision in acp7x suspend
      ASoC: SOF: amd: fix amd_sof_acp_remove() teardown ordering
      ASoC: SOF: amd: fix amd_sof_acp_probe() error unwind ordering
      ASoC: SOF: amd: add ACP7.B/7.F PDM controller scan and pdata propagation
      ASoC: SOF: amd: update SoundWire specific acp descriptor fields for ACP7.B/7.F
      ASoC: SOF: amd: enable SoundWire build for ACP7.B/7.F
      ASoC: SOF: amd: wire SoundWire probe and remove into ACP7.B/7.F paths
      ASoC: SOF: amd: add ACP7.B/7.F clock-stop detection in check_acp_sdw_enable_status
      ASoC: SOF: amd: add ACP7.B/7.F SoundWire IO IRQ handling
      ASoC: SOF: amd: enable SoundWire host wake interrupt in acp_init
      ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
      ASoC: SOF: amd: rename acp7x machine table and descriptor to acp7f
      ASoC: SOF: amd: select descriptor per PCI revision in acp7x probe
      ASoC: amd: add I2S machine table for ACP7.B
      ASoC: SOF: amd: add ACP7.B chip descriptor and wire per-revision probe
      ASoC: SOF: amd: Propagate PCI subsystem Vendor and Device IDs
      ASoC: SOF: amd: consolidate local variable declarations
      ASoC: amd: acp: add acp-mach-common.h for shared machine driver types
      ASoC: SOF: amd: propagate pdm_sel to SDW machine driver via mach->pdata
      ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F
      ASoC: SOF: amd: fix trailing blank line at EOF in acp_asp_mailbox.c
      ASoC: amd: acp: move ACP7X_PDM_DMIC0/1 to acp-mach-common.h

Viktor Menshin (1):
      ALSA: hda/realtek: Fix hiss/crackle on Lenovo Xiaoxin 14 GT (17aa:3912)

Vladyslav Tymoshchuk (3):
      ASoC: qcom: q6apm-dai: wrap the position of a full ring to 0
      ASoC: qcom: q6apm: reset the hw pointer with the fragment queue
      ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0

Wang Yan (1):
      ALSA: mtpav: restore negation dropped in guard() conversion

Wentao Liang (6):
      ASoC: wm8994: Fix runtime PM imbalance in wm8994_component_probe()
      ASoC: arizona-jack: Fix runtime PM imbalance in arizona_start_hpdet_acc_id()
      ASoC: audio-graph-card2: Fix use-after-free in audio_graph2_link_c2c()
      ASoC: codecs: wm8994: Fix runtime PM leak in wm8994_mic_detect()
      ASoC: ti: davinci-mcasp: Fix runtime PM imbalance in __davinci_mcasp_set_clkdiv()
      ASoC: codecs: wcd9335: Fix SLIM interface device leak in wcd9335_slim_status()

Xucheng Pan (1):
      ALSA: usb-audio: Re-read descriptors for Xiaomi 2717:d005

Yi Tao (1):
      ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2

Yibo Tan (2):
      ASoC: amd: acp-es8336: Use an owned codec device reference
      ASoC: amd: acp3x-es83xx: Keep an owned codec device reference

YuanZhe Liu (1):
      ALSA: line6: Clear prev_fbuf on capture buffer release

Yuri Zaporozhets (1):
      ASoC: dwc: Use OF match data again for StarFive JH7110

Zachary Huang (1):
      ASoC: es9356: add missing DAI rates and formats

Zain Aboobacker (2):
      ASoC: dt-bindings: foursemi,fs2105s: Fix typo
      ASoC: codecs: nau8825: fix typos in comments

Zhang Heng (7):
      ALSA: hda: Fix speakers on ThinkBook Plus G3 IAP
      ALSA: hda/realtek: Add GPIO2 low quirk for ASUS E5402WHA
      ALSA: hda/realtek: Fix quirk for HP Laptop 15-fc0xxx
      ASoC: amd: yc: Add DMI quirk for MSI Crosshair A17 HX D8WFKG
      ASoC: amd: yc: Add DMI quirk for MSI Alpha 17 C7VF
      ALSA: hda: cs35l41: Add support for HP OmniBook 7 14-hg0xxx
      ALSA: hda/realtek: Add fixup for Huawei MateBook X Pro 2019 (MACHR-WX9)

Zhang Yi (2):
      ASoC: codecs: ES8326: Add private members about HPF
      ASoC: codecs: ES8326: Adjust the standby configuration

bui duc phuc (146):
      ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq() error codes
      ASoC: samsung: aries_wm8994: Drop redundant probe error messages
      ASoC: samsung: pcm: Use dev_err_probe() for error handling
      ASoC: samsung: pcm: Drop redundant probe error messages
      ASoC: samsung: spdif: Drop redundant probe error messages
      ASoC: samsung: tm2_wm5110: Drop redundant probe error messages
      ASoC: mediatek: mt8173: Fix clock error handling
      ASoC: mediatek: mt8173: Use dev_err_probe() for error handling
      ASoC: mediatek: mt8173: Drop redundant probe error messages
      ASoC: mediatek: mt2701: Use devm_clk_get_optional() for audio_mrgif_pd
      ASoC: mediatek: mt2701: Use dev_err_probe() for error handling
      ASoC: mediatek: mt2701: Drop redundant probe error messages
      ASoC: mediatek: mt7986: Drop redundant probe error messages
      ASoC: mediatek: mt8186: Fix APLL mux setting error handling
      ASoC: mediatek: mt8186: Fix clock handling in mux disable path
      ASoC: mediatek: mt8186: Fix AFE clock error handling
      ASoC: mediatek: mt8186: Fix APLL enable error handling
      ASoC: mediatek: mt8186: Fix MCK error handling
      ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
      ASoC: mediatek: mt8186: Handle regcache sync failure
      ASoC: mediatek: mt8186: Drop redundant probe error messages
      ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
      ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
      ASoC: mediatek: mt6797: Drop redundant probe error messages
      ALSA: pcm: Simplify success check in snd_pcm_open_file()
      ALSA: pcm: Propagate snd_pcm_stop() errors in snd_pcm_drop()
      ASoC: codecs: pcm6240: Return 0 explicitly on success
      ASoC: mediatek: mt8189: Propagate APLL enable errors
      ASoC: mediatek: mt8189: Propagate MCK enable errors
      ASoC: mediatek: mt8189: Validate MCK ID
      ASoC: mediatek: mt8189: Propagate reg_rw clock errors
      ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
      ASoC: mediatek: mt8189: Propagate runtime resume errors
      ASoC: mediatek: mt8189: Remove redundant error message
      ASoC: mediatek: mt8189: Propagate APLL errors
      ASoC: mediatek: mt8189: Propagate MCLK errors
      ASoC: mediatek: mt8189: Validate sysclk frequency
      ASoC: mediatek: mt8189: Propagate TDM clock errors
      ASoC: mediatek: mt8189: Validate TDM MCLK frequency
      ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization errors
      ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable errors
      ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
      ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
      ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
      ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error messages
      ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
      ASoC: fsl_asrc_m2m: fix pm_runtime usage counter leak on error
      ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
      ASoC: mediatek: mt8183: Fix clock handling in mux disable path
      ASoC: mediatek: mt8183: Fix APLL enable error handling
      ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
      ASoC: mediatek: mt8183: Drop redundant probe error messages
      ALSA: dummy: Move pcm_substreams check out of the loop
      ASoC: mediatek: mt8192: fix APLL mux error handling
      ASoC: mediatek: mt8192: fix AFE clock error handling
      ASoC: mediatek: mt8192: fix error handling in APLL enable functions
      ASoC: mediatek: mt8192: fix MCK clock error handling
      ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
      ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
      ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
      ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
      ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
      ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime resume
      ASoC: mediatek: mt8192: Remove redundant error message
      ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in ADDA DAI
      ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event handlers
      ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event handlers
      ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF calibration
      ASoC: rockchip: rockchip_sai: Handle runtime PM resume failures in set_fmt
      ASoC: rockchip: rockchip_i2s: Handle runtime PM resume failures in set_fmt
      ASoC: mediatek: common: Handle constraint return value in FE startup
      ASoC: mediatek: mt8188: Handle constraint return value in FE startup
      ASoC: mediatek: mt8189: Handle constraint return value in FE startup
      ASoC: mediatek: mt8365: Handle constraint return value in FE startup
      ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
      ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
      ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
      ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
      ASoC: codecs: rt5645: Simplify optional GPIO error handling
      ASoC: codecs: rt5659: propagate GPIO errors
      ASoC: amd: acp: Fix .close() being skipped on rollback
      ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
      ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
      ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
      ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
      ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
      ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
      ASoC: apple: mca: Ensure the DAI is marked as started on success
      ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
      ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
      ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
      ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
      ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
      ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
      ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
      ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
      ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
      ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
      ASoC: intel: atom: Fix .shutdown() being skipped on rollback
      ASoC: renesas: fsi: Ensure the component is marked as opened on success
      ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
      ASoC: renesas: rz-ssi: Ensure the component is marked as opened on success
      ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
      ASoC: rockchip: rockchip_max98090: Mark the link as started on success
      ASoC: atmel-i2s: fix MCK generator error handling
      ASoC: atmel-i2s: use optional API for muxclk
      ASoC: atmel-i2s: use optional API for gclk
      ASoC: atmel-i2s: use dev_err_probe() for pclk errors
      ASoC: atmel-i2s: remove redundant error message
      ASoC: mediatek: mt8196: fix APLL mux error handling
      ASoC: mediatek: mt8196: fix APLL enable error handling
      ASoC: mediatek: mt8196: fix MCK error handling
      ASoC: mediatek: mt8196: fix register access clock error handling
      ASoC: mediatek: mt8196: propagate main clock errors
      ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
      ASoC: mediatek: mt8196: fix runtime resume error handling
      ASoC: mediatek: mt8196: remove redundant error message
      ASoC: mediatek: mt8196: propagate I2S clock errors
      ASoC: mediatek: mt8196: propagate TDM clock errors
      ASoC: mediatek: mt8195: Fix tuner clock error handling
      ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
      ASoC: mediatek: mt8195: Fix register access clock error handling
      ASoC: mediatek: mt8195: Fix timing system clock error handling
      ASoC: mediatek: mt8195: Fix main clock error handling
      ASoC: mediatek: mt8195: Fix paired memif clock error handling
      ASoC: mediatek: mt8195: Fix FE startup error handling
      ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
      ASoC: mediatek: mt8195: Fix runtime resume error handling
      ASoC: mediatek: mt8195: Remove redundant error message
      ASoC: mediatek: mt8195: Propagate IRQ lookup errors
      ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
      ASoC: mediatek: mt8195: Fix ETDM startup error handling
      ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
      ASoC: mediatek: mt8195: Fix ETDM probe error handling
      ASoC: mediatek: mt8195: Fix clock parent error handling
      ASoC: amd: Explain component open return value handling
      ASoC: apple: Explain DAI startup return value handling
      ASoC: atmel: Explain component open return value handling
      ASoC: codecs: Explain DAI startup return value handling
      ASoC: imx-pcm-rpmsg: Explain component open return value handling
      ASoC: intel: atom: Explain DAI startup return value handling
      ASoC: renesas: msiof: Explain component open return value handling
      ASoC: renesas: msiof: Remove redundant period constraint
      ASoC: renesas: rz-ssi: Explain component open return value handling
      ASoC: renesas: rz-ssi: Remove redundant component open callback
      ASoC: rockchip: Explain DAI link startup return value handling

wangdicheng (1):
      ALSA: hda/realtek: Limit Line In boost and ADC gain on DECENTA MATX03

Ștefan Ghețu (3):
      ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data
      ASoC: SOF: imx8: check imx_sc_pm_cpu_start() return value
      ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump

---
 .../devicetree/bindings/sound/adi,adau1372.yaml    |   10 +-
 .../devicetree/bindings/sound/adi,adau7118.yaml    |   22 +-
 .../bindings/sound/airoha,an7581-afe.yaml          |   41 +
 .../bindings/sound/airoha,an7581-wm8960.yaml       |   71 +
 .../bindings/sound/amlogic,gx-sound-card.yaml      |   20 +-
 .../bindings/sound/asahi-kasei,ak4619.yaml         |   16 +-
 .../bindings/sound/audio-graph-port.yaml           |   10 +-
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  |  146 +-
 .../devicetree/bindings/sound/cirrus,cs4270.yaml   |   12 +-
 .../devicetree/bindings/sound/cirrus,cs42l42.yaml  |   42 +-
 .../devicetree/bindings/sound/cirrus,cs42l84.yaml  |   18 +-
 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |   56 +-
 .../bindings/sound/davinci-evm-audio.txt           |   49 -
 .../devicetree/bindings/sound/dialog,da7219.yaml   |   62 +-
 .../bindings/sound/esstech,es9039q2m.yaml          |   94 +
 .../devicetree/bindings/sound/everest,es8316.yaml  |    5 +
 .../bindings/sound/foursemi,fs2105s.yaml           |    2 +-
 .../devicetree/bindings/sound/fsl,easrc.yaml       |   45 +
 .../devicetree/bindings/sound/fsl,imx-asrc.yaml    |   45 +-
 .../devicetree/bindings/sound/fsl,sai.yaml         |   14 +-
 .../bindings/sound/hisilicon,hi6210-i2s.yaml       |    4 +
 .../devicetree/bindings/sound/imx-audio-card.yaml  |    4 +-
 .../devicetree/bindings/sound/imx-audmux.yaml      |    8 +-
 .../bindings/sound/invensense,ics43432.yaml        |    8 +-
 .../bindings/sound/loongson,ls-audio-card.yaml     |    4 +-
 .../bindings/sound/mediatek,mt2701-audio.yaml      |   10 +-
 .../bindings/sound/mediatek,mt8173-afe-pcm.yaml    |   22 +-
 .../bindings/sound/mediatek,mt8183-audio.yaml      |   82 +-
 .../sound/mt8186-mt6366-da7219-max98357.yaml       |   36 +-
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        |   36 +-
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |   46 +-
 .../devicetree/bindings/sound/mt8195-mt6359.yaml   |   50 +-
 .../devicetree/bindings/sound/nuvoton,nau8360.yaml |  115 +
 .../bindings/sound/nvidia,tegra-audio-common.yaml  |    5 +
 .../bindings/sound/nvidia,tegra-audio-wm8994.yaml  |  110 +
 .../bindings/sound/nvidia,tegra30-ahub.txt         |   88 -
 .../bindings/sound/nvidia,tegra30-ahub.yaml        |  289 +++
 .../sound/qcom,msm8916-wcd-digital-codec.yaml      |    1 +
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |   17 +-
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml      |   12 +-
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |   16 +-
 .../bindings/sound/qcom,shikra-qaif-cpu.yaml       |  290 +++
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |    3 +
 .../bindings/sound/qcom,wcd9378-sdw.yaml           |  105 +
 .../devicetree/bindings/sound/realtek,rt5677.yaml  |   10 +
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |   16 +-
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   32 +-
 .../bindings/sound/stericsson,ux500-msp-i2s.yaml   |   96 +
 .../bindings/sound/ti,da830-evm-audio.yaml         |   83 +
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |   16 +
 .../devicetree/bindings/sound/ti,tas2781.yaml      |    4 +-
 .../devicetree/bindings/sound/ti,tas5805m.yaml     |   10 +-
 .../bindings/sound/ti,tlv320dac3100.yaml           |    2 +-
 .../devicetree/bindings/sound/ti,tpa6130a2.yaml    |    2 +-
 .../devicetree/bindings/sound/ux500-mop500.txt     |   39 -
 .../devicetree/bindings/sound/ux500-msp.txt        |   42 -
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/sound/alsa-configuration.rst         |    6 +
 Documentation/sound/cards/hdspm.rst                |  109 +-
 MAINTAINERS                                        |   40 +
 drivers/acpi/scan.c                                |    1 +
 drivers/firmware/cirrus/cs_dsp.c                   |    4 +-
 .../firmware/cirrus/test/cs_dsp_test_callbacks.c   |   35 +
 drivers/gpib/fmh_gpib/fmh_gpib.c                   |   10 +-
 drivers/platform/x86/serial-multi-instantiate.c    |    1 +
 include/dt-bindings/sound/cs35l45.h                |   27 +
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |   52 +
 include/linux/dmaengine.h                          |    9 -
 include/linux/firmware/cirrus/cs_dsp.h             |    2 +-
 include/sound/aw88399.h                            |    8 +-
 include/sound/compress_driver.h                    |    2 +
 include/sound/control.h                            |    4 +-
 include/sound/core.h                               |    5 +-
 include/sound/emu10k1.h                            |    4 +-
 include/sound/emux_legacy.h                        |    2 +-
 include/sound/hda_codec.h                          |    6 +-
 include/sound/hdaudio.h                            |   12 +-
 include/sound/jack.h                               |    2 +-
 include/sound/pcm.h                                |    2 +
 include/sound/pcm_oss.h                            |    1 +
 include/sound/rawmidi.h                            |    1 +
 include/sound/sdca.h                               |   23 +-
 include/sound/sdca_class.h                         |   70 +
 include/sound/simple_card_utils.h                  |    2 +
 include/sound/soc-component.h                      |   82 +-
 include/sound/soc-dai.h                            |  179 +-
 include/sound/soc.h                                |   35 +-
 include/sound/soc_sdw_utils.h                      |   20 +
 include/sound/sof/ipc4/header.h                    |   24 +-
 include/sound/tas2781-dsp.h                        |   13 +
 include/sound/tas2781.h                            |   31 +
 include/uapi/sound/asound.h                        |    3 +-
 sound/core/compress_offload.c                      |  142 +-
 sound/core/control.c                               |    2 +
 sound/core/control_led.c                           |   62 +-
 sound/core/ctljack.c                               |    1 +
 sound/core/info.c                                  |    3 +-
 sound/core/init.c                                  |   95 +-
 sound/core/jack.c                                  |   67 +-
 sound/core/misc.c                                  |    5 +-
 sound/core/oss/mixer_oss.c                         |   37 +-
 sound/core/oss/pcm_oss.c                           |   12 +
 sound/core/pcm.c                                   |   11 +-
 sound/core/pcm_compat.c                            |    6 +-
 sound/core/pcm_lib.c                               |   32 +-
 sound/core/pcm_native.c                            |  277 ++-
 sound/core/rawmidi.c                               |   86 +-
 sound/core/seq/Kconfig                             |    7 +-
 sound/core/seq/oss/seq_oss.c                       |    3 +
 sound/core/seq/oss/seq_oss_device.h                |    1 +
 sound/core/seq/oss/seq_oss_event.c                 |    9 +-
 sound/core/seq/oss/seq_oss_init.c                  |    4 +-
 sound/core/seq/oss/seq_oss_midi.c                  |    5 +
 sound/core/seq/seq_clientmgr.c                     |   27 +-
 sound/core/seq/seq_compat.c                        |   15 +-
 sound/core/seq/seq_ports.c                         |   41 +-
 sound/core/seq/seq_ports.h                         |    1 +
 sound/core/timer.c                                 |    2 +
 sound/core/timer_compat.c                          |    1 +
 sound/core/ump.c                                   |    2 +-
 sound/core/ump_convert.c                           |    2 +-
 sound/core/vmaster.c                               |   10 +-
 sound/drivers/aloop.c                              |   70 +-
 sound/drivers/dummy.c                              |   10 +-
 sound/drivers/mpu401/mpu401_uart.c                 |    8 +-
 sound/drivers/mtpav.c                              |    2 +-
 sound/drivers/pcmtest.c                            |  133 +-
 sound/drivers/serial-generic.c                     |   10 +-
 sound/firewire/bebob/bebob_hwdep.c                 |    2 +-
 sound/hda/codecs/ca0132.c                          |  391 +++-
 sound/hda/codecs/cirrus/cs8409-tables.c            |    9 +-
 sound/hda/codecs/cirrus/cs8409.c                   |   52 +-
 sound/hda/codecs/cirrus/cs8409.h                   |    4 +
 sound/hda/codecs/conexant.c                        |   80 +
 sound/hda/codecs/hdmi/eld.c                        |    6 +-
 sound/hda/codecs/hdmi/hdmi.c                       |    5 +-
 sound/hda/codecs/hdmi/tegrahdmi.c                  |   35 +
 sound/hda/codecs/realtek/alc269.c                  |  425 +++-
 sound/hda/codecs/realtek/alc662.c                  |   24 +
 sound/hda/codecs/realtek/alc882.c                  |    2 +-
 sound/hda/codecs/side-codecs/Kconfig               |    1 +
 sound/hda/codecs/side-codecs/aw88399_hda.c         |   58 +-
 sound/hda/codecs/side-codecs/aw88399_hda.h         |    1 -
 sound/hda/codecs/side-codecs/cs35l41_hda.c         |   12 +-
 sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c     |    3 +
 .../hda/codecs/side-codecs/cs35l41_hda_property.c  |   36 +
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |   19 +-
 sound/hda/codecs/sigmatel.c                        |    6 +-
 sound/hda/codecs/via.c                             |    1 +
 sound/hda/common/bind.c                            |   15 +-
 sound/hda/common/codec.c                           |   18 +-
 sound/hda/common/hda_jack.h                        |    1 +
 sound/hda/common/jack.c                            |   88 +-
 sound/hda/controllers/acpi.c                       |   41 +
 sound/hda/controllers/intel.c                      |   33 +-
 sound/hda/core/bus.c                               |   38 +-
 sound/hda/core/component.c                         |    5 +-
 sound/hda/core/controller.c                        |   24 +-
 sound/hda/core/device.c                            |   13 +-
 sound/hda/core/intel-nhlt.c                        |    4 +-
 sound/hda/core/local.h                             |    2 +
 sound/i2c/other/ak4113.c                           |    2 +-
 sound/i2c/other/ak4114.c                           |    2 +-
 sound/i2c/other/ak4xxx-adda.c                      |    2 +-
 sound/isa/galaxy/galaxy.c                          |   10 +-
 sound/isa/opti9xx/opti92x-ad1848.c                 |    2 +-
 sound/isa/sc6000.c                                 |   10 +-
 sound/mips/hal2.c                                  |   34 +-
 sound/mips/sgio2audio.c                            |   43 +-
 sound/mips/snd-n64.c                               |   63 +-
 sound/oss/dmasound/dmasound_q40.c                  |   65 +-
 sound/parisc/harmony.c                             |   24 +-
 sound/pci/ac97/ac97_codec.c                        |    2 +-
 sound/pci/ac97/ac97_patch.c                        |    2 +-
 sound/pci/ad1889.c                                 |   13 +-
 sound/pci/ali5451/ali5451.c                        |   13 +-
 sound/pci/als300.c                                 |   11 +-
 sound/pci/als4000.c                                |   13 +-
 sound/pci/atiixp.c                                 |   13 +-
 sound/pci/atiixp_modem.c                           |   13 +-
 sound/pci/au88x0/au88x0.c                          |   11 +-
 sound/pci/au88x0/au88x0.h                          |    2 +-
 sound/pci/au88x0/au88x0_mpu401.c                   |    2 +-
 sound/pci/aw2/aw2-alsa.c                           |   11 +-
 sound/pci/aw2/aw2-saa7146.c                        |    4 +-
 sound/pci/azt3328.c                                |   11 +-
 sound/pci/bt87x.c                                  |   13 +-
 sound/pci/ca0106/ca0106_main.c                     |   11 +-
 sound/pci/cmipci.c                                 |   11 +-
 sound/pci/cs4281.c                                 |   15 +-
 sound/pci/cs46xx/cs46xx.c                          |   25 +-
 sound/pci/cs46xx/cs46xx_lib.c                      |    6 +-
 sound/pci/cs46xx/dsp_spos.c                        |    2 +-
 sound/pci/cs46xx/dsp_spos_scb_lib.c                |    8 +-
 sound/pci/cs5535audio/cs5535audio.c                |   13 +-
 sound/pci/ctxfi/xfi.c                              |   23 +-
 sound/pci/echoaudio/echoaudio.c                    |   18 +-
 sound/pci/echoaudio/echoaudio.h                    |    4 +-
 sound/pci/emu10k1/emu10k1x.c                       |   13 +-
 sound/pci/ens1370.c                                |   13 +-
 sound/pci/es1938.c                                 |   13 +-
 sound/pci/es1968.c                                 |   13 +-
 sound/pci/fm801.c                                  |   13 +-
 sound/pci/ice1712/ice1724.c                        |   13 +-
 sound/pci/intel8x0.c                               |   14 +-
 sound/pci/intel8x0m.c                              |   13 +-
 sound/pci/korg1212/korg1212.c                      |   11 +-
 sound/pci/lola/lola.c                              |   13 +-
 sound/pci/lx6464es/lx6464es.c                      |   11 +-
 sound/pci/lx6464es/lx_core.c                       |    2 +-
 sound/pci/lx6464es/lx_defs.h                       |    2 +-
 sound/pci/maestro3.c                               |   11 +-
 sound/pci/oxygen/oxygen_lib.c                      |   15 +-
 sound/pci/oxygen/oxygen_pcm.c                      |   37 +-
 sound/pci/pcxhr/pcxhr_core.c                       |    4 +-
 sound/pci/riptide/riptide.c                        |   15 +-
 sound/pci/rme32.c                                  |   13 +-
 sound/pci/rme96.c                                  |   13 +-
 sound/pci/rme9652/hdsp.c                           |   13 +-
 sound/pci/rme9652/hdspm.c                          |   12 +-
 sound/pci/rme9652/rme9652.c                        |   11 +-
 sound/pci/sis7019.c                                |   13 +-
 sound/pci/sonicvibes.c                             |   13 +-
 sound/pci/trident/trident_memory.c                 |    2 +-
 sound/pci/via82xx.c                                |   24 +-
 sound/pci/via82xx_modem.c                          |   13 +-
 sound/pci/vx222/vx222_ops.c                        |    2 +-
 sound/pci/ymfpci/ymfpci.c                          |   13 +-
 sound/pcmcia/vx/vxp_ops.c                          |    2 +-
 sound/ppc/powermac.c                               |   35 +-
 sound/ppc/tumbler.c                                |    2 +-
 sound/sh/sh_dac_audio.c                            |   22 +-
 sound/soc/amd/acp-config.c                         |   29 +-
 sound/soc/amd/acp-es8336.c                         |    3 +-
 sound/soc/amd/acp/Kconfig                          |    5 +-
 sound/soc/amd/acp/acp-mach-common.h                |   29 +
 sound/soc/amd/acp/acp-platform.c                   |    7 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |   32 +
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |   12 +
 sound/soc/amd/acp/amd-acp63-acpi-match.c           |   50 +
 sound/soc/amd/acp/soc_amd_sdw_common.h             |    1 +
 sound/soc/amd/mach-config.h                        |    3 +-
 sound/soc/amd/ps/acp63.h                           |    8 +
 sound/soc/amd/ps/pci-ps.c                          |    2 +
 sound/soc/amd/ps/ps-common.c                       |    2 +
 sound/soc/amd/ps/ps-pdm-dma.c                      |    8 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |    8 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    8 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    8 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |    8 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   14 +
 sound/soc/amd/yc/acp6x-pdm-dma.c                   |    8 +-
 sound/soc/apple/mca.c                              |   16 +-
 sound/soc/atmel/atmel-i2s.c                        |   54 +-
 sound/soc/atmel/atmel-pcm-dma.c                    |    2 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |    7 +
 sound/soc/bcm/cygnus-ssp.h                         |    2 +-
 sound/soc/codecs/88pm860x-codec.c                  |    6 +
 sound/soc/codecs/Kconfig                           |   49 +
 sound/soc/codecs/Makefile                          |    8 +
 sound/soc/codecs/ab8500-codec.c                    |  157 +-
 sound/soc/codecs/adau1372.c                        |   12 +
 sound/soc/codecs/adau1373.c                        |   12 +
 sound/soc/codecs/adau1701.c                        |   15 +-
 sound/soc/codecs/adau17x1.c                        |   17 +-
 sound/soc/codecs/adau1977.c                        |   13 +
 sound/soc/codecs/adau7118.c                        |   12 +
 sound/soc/codecs/ak4104.c                          |    7 +
 sound/soc/codecs/ak4118.c                          |    7 +
 sound/soc/codecs/ak4458.c                          |    9 +
 sound/soc/codecs/ak4535.c                          |    6 +
 sound/soc/codecs/ak4619.c                          |   32 +
 sound/soc/codecs/ak4642.c                          |   14 +-
 sound/soc/codecs/ak4671.c                          |    7 +
 sound/soc/codecs/ak5386.c                          |    6 +
 sound/soc/codecs/ak5558.c                          |    7 +
 sound/soc/codecs/alc5623.c                         |   11 +
 sound/soc/codecs/alc5632.c                         |   13 +
 sound/soc/codecs/arizona-jack.c                    |    1 +
 sound/soc/codecs/arizona.c                         |   23 +
 sound/soc/codecs/aw88261.c                         |   39 +-
 sound/soc/codecs/aw88399-lib.c                     |   28 +-
 sound/soc/codecs/aw88399.c                         |    2 +-
 sound/soc/codecs/cpcap.c                           |   88 +-
 sound/soc/codecs/cs35l33.c                         |    8 +-
 sound/soc/codecs/cs35l34.c                         |    2 +-
 sound/soc/codecs/cs35l35.c                         |    7 +
 sound/soc/codecs/cs35l36.c                         |   56 +
 sound/soc/codecs/cs35l41.c                         |   10 +
 sound/soc/codecs/cs35l45-tables.c                  |   62 +
 sound/soc/codecs/cs35l45.c                         |  177 +-
 sound/soc/codecs/cs35l45.h                         |   53 +
 sound/soc/codecs/cs35l56-shared-test.c             |   56 +
 sound/soc/codecs/cs35l56.c                         |   10 +
 sound/soc/codecs/cs40l50-codec.c                   |    9 +
 sound/soc/codecs/cs4234.c                          |    9 +
 sound/soc/codecs/cs4265.c                          |   12 +
 sound/soc/codecs/cs4270.c                          |    6 +
 sound/soc/codecs/cs4271.c                          |    6 +
 sound/soc/codecs/cs42l42.c                         |   27 +-
 sound/soc/codecs/cs42l43.c                         |   12 +
 sound/soc/codecs/cs42l51.c                         |    7 +
 sound/soc/codecs/cs42l52.c                         |   22 +-
 sound/soc/codecs/cs42l56.c                         |   17 +-
 sound/soc/codecs/cs42l73.c                         |   11 +-
 sound/soc/codecs/cs42l84.c                         |    6 +
 sound/soc/codecs/cs42xx8.c                         |    8 +
 sound/soc/codecs/cs43130.c                         |   14 +
 sound/soc/codecs/cs4341.c                          |    8 +
 sound/soc/codecs/cs4349.c                          |   12 +
 sound/soc/codecs/cs48l32.c                         |   23 +
 sound/soc/codecs/cs530x.c                          |    9 +
 sound/soc/codecs/cs53l30.c                         |    8 +
 sound/soc/codecs/cx20442.c                         |    2 +-
 sound/soc/codecs/cx2072x.c                         |   12 +
 sound/soc/codecs/da7210.c                          |    9 +-
 sound/soc/codecs/da7213.c                          |   23 +-
 sound/soc/codecs/da7218.c                          |  141 +-
 sound/soc/codecs/da7219.c                          |   12 +
 sound/soc/codecs/da732x.c                          |   19 +-
 sound/soc/codecs/da9055.c                          |    8 +
 sound/soc/codecs/es7134.c                          |    6 +
 sound/soc/codecs/es7241.c                          |    7 +
 sound/soc/codecs/es8311.c                          |   27 +-
 sound/soc/codecs/es8316.c                          |   27 +-
 sound/soc/codecs/es8323.c                          |   32 +-
 sound/soc/codecs/es8326.c                          |  181 +-
 sound/soc/codecs/es8326.h                          |    4 +
 sound/soc/codecs/es8328.c                          |   20 +-
 sound/soc/codecs/es8375.c                          |   32 +-
 sound/soc/codecs/es8389.c                          |   65 +-
 sound/soc/codecs/es9039q2m.c                       | 2008 +++++++++++++++++
 sound/soc/codecs/es9356.c                          |   22 +
 sound/soc/codecs/fs210x.c                          |    5 +-
 sound/soc/codecs/hda.c                             |   14 +-
 sound/soc/codecs/hdac_hda.c                        |    2 +-
 sound/soc/codecs/hdac_hdmi.c                       |    2 +-
 sound/soc/codecs/hdmi-codec.c                      |    8 +-
 sound/soc/codecs/inno_rk3036.c                     |   12 +
 sound/soc/codecs/isabelle.c                        |   13 +
 sound/soc/codecs/lm49453.c                         |   15 +
 sound/soc/codecs/lpass-rx-macro.c                  |    6 +-
 sound/soc/codecs/lpass-tx-macro.c                  |    4 +-
 sound/soc/codecs/lpass-va-macro.c                  |    4 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   48 +-
 sound/soc/codecs/max98088.c                        |   12 +
 sound/soc/codecs/max98090.c                        |   35 +-
 sound/soc/codecs/max98095.c                        |   24 +-
 sound/soc/codecs/max98371.c                        |    7 +
 sound/soc/codecs/max98373-i2c.c                    |   10 +
 sound/soc/codecs/max98388.c                        |   10 +
 sound/soc/codecs/max98390.c                        |   10 +
 sound/soc/codecs/max98396.c                        |   12 +
 sound/soc/codecs/max9850.c                         |   11 +
 sound/soc/codecs/max98520.c                        |   10 +
 sound/soc/codecs/max9860.c                         |   23 +
 sound/soc/codecs/max9867.c                         |   10 +
 sound/soc/codecs/max98925.c                        |    8 +
 sound/soc/codecs/max98926.c                        |    8 +
 sound/soc/codecs/max98927.c                        |   14 +-
 sound/soc/codecs/mc13783.c                         |   12 +
 sound/soc/codecs/ml26124.c                         |    6 +
 sound/soc/codecs/mt6359-accdet.c                   |   50 +-
 sound/soc/codecs/mt6359.c                          |    8 +-
 sound/soc/codecs/nau8325.c                         |   27 +-
 sound/soc/codecs/nau8360-dsp.c                     |  634 ++++++
 sound/soc/codecs/nau8360-dsp.h                     |  122 ++
 sound/soc/codecs/nau8360.c                         | 2309 ++++++++++++++++++++
 sound/soc/codecs/nau8360.h                         |  917 ++++++++
 sound/soc/codecs/nau8540.c                         |   31 +-
 sound/soc/codecs/nau8810.c                         |   12 +
 sound/soc/codecs/nau8821.c                         |   27 +-
 sound/soc/codecs/nau8822.c                         |   27 +-
 sound/soc/codecs/nau8824.c                         |   27 +-
 sound/soc/codecs/nau8825.c                         |   45 +-
 sound/soc/codecs/ntp8835.c                         |    7 +
 sound/soc/codecs/ntp8918.c                         |    7 +
 sound/soc/codecs/pcm1681.c                         |  157 +-
 sound/soc/codecs/pcm5102a.c                        |   30 +-
 sound/soc/codecs/pcm6240.c                         |    8 +-
 sound/soc/codecs/rk3308_codec.c                    |  113 +-
 sound/soc/codecs/rk3328_codec.c                    |    9 +
 sound/soc/codecs/rt1011.c                          |   44 +-
 sound/soc/codecs/rt1015.c                          |   91 +-
 sound/soc/codecs/rt1016.c                          |   14 +-
 sound/soc/codecs/rt1019.c                          |   10 +
 sound/soc/codecs/rt1305.c                          |   14 +-
 sound/soc/codecs/rt1308.c                          |   14 +-
 sound/soc/codecs/rt1318.c                          |   13 +-
 sound/soc/codecs/rt1320-sdw.c                      |   12 +-
 sound/soc/codecs/rt274.c                           |    8 +
 sound/soc/codecs/rt286.c                           |    8 +
 sound/soc/codecs/rt298.c                           |    8 +
 sound/soc/codecs/rt5514-spi.c                      |   37 +-
 sound/soc/codecs/rt5514.c                          |   39 +-
 sound/soc/codecs/rt5616.c                          |   23 +-
 sound/soc/codecs/rt5631.c                          |   10 +
 sound/soc/codecs/rt5631.h                          |    8 +-
 sound/soc/codecs/rt5640.c                          |   22 +-
 sound/soc/codecs/rt5645.c                          |   52 +-
 sound/soc/codecs/rt5651.c                          |   12 +-
 sound/soc/codecs/rt5659.c                          |   20 +-
 sound/soc/codecs/rt5660.c                          |   14 +-
 sound/soc/codecs/rt5663.c                          |   10 +
 sound/soc/codecs/rt5665.c                          |   14 +-
 sound/soc/codecs/rt5668.c                          |   22 +
 sound/soc/codecs/rt5670.c                          |   12 +-
 sound/soc/codecs/rt5677-spi.c                      |   21 +-
 sound/soc/codecs/rt5677.c                          |   10 +
 sound/soc/codecs/rt5682-sdw.c                      |    3 +-
 sound/soc/codecs/rt5682.c                          |   22 +
 sound/soc/codecs/rt5682s.c                         |   38 +-
 sound/soc/codecs/rt711-sdca-sdw.c                  |    6 +-
 sound/soc/codecs/rt711-sdw.c                       |    8 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |    4 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |    7 +-
 sound/soc/codecs/rt712-sdca-sdw.h                  |    3 +
 sound/soc/codecs/rt712-sdca.c                      |  141 +-
 sound/soc/codecs/rt712-sdca.h                      |    6 +
 sound/soc/codecs/rt721-sdca-sdw.c                  |   61 +-
 sound/soc/codecs/rt721-sdca-sdw.h                  |    7 +
 sound/soc/codecs/rt721-sdca.c                      |  797 +++++--
 sound/soc/codecs/rt721-sdca.h                      |   44 +
 sound/soc/codecs/rt722-sdca-sdw.c                  |    6 +-
 sound/soc/codecs/rt766-sdca.c                      |   10 +-
 sound/soc/codecs/rt766-sdca.h                      |    1 +
 sound/soc/codecs/rt9120.c                          |    9 +
 sound/soc/codecs/rt9123.c                          |   13 +
 sound/soc/codecs/rtq9124.c                         |    9 +
 sound/soc/codecs/rtq9128.c                         |    9 +
 sound/soc/codecs/sgtl5000.c                        |   11 +
 sound/soc/codecs/si476x.c                          |   18 +
 sound/soc/codecs/sma1303.c                         |   13 +
 sound/soc/codecs/sma1307.c                         |   27 +-
 sound/soc/codecs/sn624x-sdca-sdw.c                 | 1888 ++++++++++++++++
 sound/soc/codecs/sn624x-sdca.h                     |  152 ++
 sound/soc/codecs/src4xxx.c                         |    8 +
 sound/soc/codecs/ssm2518.c                         |   13 +
 sound/soc/codecs/ssm2602.c                         |   13 +
 sound/soc/codecs/ssm3515.c                         |   10 +
 sound/soc/codecs/ssm4567.c                         |   13 +
 sound/soc/codecs/sta32x.c                          |  136 +-
 sound/soc/codecs/sta350.c                          |   35 +-
 sound/soc/codecs/sta529.c                          |    7 +
 sound/soc/codecs/tas2552.c                         |   14 +
 sound/soc/codecs/tas2562.c                         |   10 +
 sound/soc/codecs/tas2764.c                         |   14 +-
 sound/soc/codecs/tas2770.c                         |   14 +-
 sound/soc/codecs/tas2780.c                         |   10 +
 sound/soc/codecs/tas2781-comlib-i2c.c              |    4 +-
 sound/soc/codecs/tas2781-comlib.c                  |   10 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |   46 +-
 sound/soc/codecs/tas2781-i2c.c                     |  320 ++-
 sound/soc/codecs/tas2783-sdw.c                     |  218 +-
 sound/soc/codecs/tas2783.h                         |    4 +-
 sound/soc/codecs/tas5086.c                         |    7 +
 sound/soc/codecs/tas571x.c                         |    7 +
 sound/soc/codecs/tas5720.c                         |    9 +
 sound/soc/codecs/tas6424.c                         |    9 +
 sound/soc/codecs/tas675x.c                         |   10 +-
 sound/soc/codecs/tfa9879.c                         |    9 +
 sound/soc/codecs/tlv320adc3xxx.c                   |   16 +-
 sound/soc/codecs/tlv320adcx140.c                   |   12 +
 sound/soc/codecs/tlv320aic23.c                     |    9 +
 sound/soc/codecs/tlv320aic26.c                     |    8 +
 sound/soc/codecs/tlv320aic31xx.c                   |   41 +-
 sound/soc/codecs/tlv320aic32x4-clk.c               |    2 +-
 sound/soc/codecs/tlv320aic32x4.c                   |  104 +-
 sound/soc/codecs/tlv320aic32x4.h                   |    1 +
 sound/soc/codecs/tlv320aic3x.c                     |   42 +-
 sound/soc/codecs/tlv320dac33.c                     |   10 +-
 sound/soc/codecs/tscs454.c                         |   15 +
 sound/soc/codecs/twl4030.c                         |   87 +-
 sound/soc/codecs/uda1334.c                         |    6 +
 sound/soc/codecs/uda1342.c                         |    7 +
 sound/soc/codecs/uda1380.c                         |   11 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |    8 +-
 sound/soc/codecs/wcd9335.c                         |   25 +-
 sound/soc/codecs/wcd934x.c                         |    2 +-
 sound/soc/codecs/wcd9378-sdca.c                    | 1080 +++++++++
 sound/soc/codecs/wcd9378-sdca.h                    |   20 +
 sound/soc/codecs/wcd9378-sdw.c                     |   51 +
 sound/soc/codecs/wcd937x.c                         |   44 +-
 sound/soc/codecs/wcd939x.c                         |   10 +-
 sound/soc/codecs/wcd939x.h                         |    1 -
 sound/soc/codecs/wm2200.c                          |   10 +
 sound/soc/codecs/wm5100.c                          |   12 +-
 sound/soc/codecs/wm8350.c                          |   24 +
 sound/soc/codecs/wm8400.c                          |    9 +
 sound/soc/codecs/wm8510.c                          |   14 +-
 sound/soc/codecs/wm8523.c                          |   13 +
 sound/soc/codecs/wm8524.c                          |    6 +
 sound/soc/codecs/wm8580.c                          |   35 +-
 sound/soc/codecs/wm8711.c                          |   13 +
 sound/soc/codecs/wm8728.c                          |    9 +
 sound/soc/codecs/wm8731.c                          |   13 +
 sound/soc/codecs/wm8737.c                          |   19 +-
 sound/soc/codecs/wm8741.c                          |   13 +
 sound/soc/codecs/wm8750.c                          |   15 +-
 sound/soc/codecs/wm8753.c                          |   20 +
 sound/soc/codecs/wm8770.c                          |   11 +
 sound/soc/codecs/wm8776.c                          |   13 +
 sound/soc/codecs/wm8782.c                          |   12 +-
 sound/soc/codecs/wm8804.c                          |   15 +-
 sound/soc/codecs/wm8900.c                          |   18 +
 sound/soc/codecs/wm8903.c                          |   18 +
 sound/soc/codecs/wm8904.c                          |   20 +-
 sound/soc/codecs/wm8940.c                          |   13 +
 sound/soc/codecs/wm8955.c                          |   44 +-
 sound/soc/codecs/wm8958-dsp2.c                     |    8 +-
 sound/soc/codecs/wm8960.c                          |   13 +
 sound/soc/codecs/wm8961.c                          |   18 +
 sound/soc/codecs/wm8962.c                          |   74 +-
 sound/soc/codecs/wm8971.c                          |   13 +
 sound/soc/codecs/wm8974.c                          |   17 +
 sound/soc/codecs/wm8978.c                          |   12 +
 sound/soc/codecs/wm8983.c                          |   14 +-
 sound/soc/codecs/wm8985.c                          |   55 +-
 sound/soc/codecs/wm8988.c                          |   13 +
 sound/soc/codecs/wm8990.c                          |   19 +-
 sound/soc/codecs/wm8991.c                          |   19 +-
 sound/soc/codecs/wm8993.c                          |   18 +
 sound/soc/codecs/wm8994.c                          |   29 +-
 sound/soc/codecs/wm8995.c                          |   61 +-
 sound/soc/codecs/wm8996.c                          |   14 +-
 sound/soc/codecs/wm9081.c                          |   18 +
 sound/soc/codecs/wm9713.c                          |   13 +
 sound/soc/codecs/wm_hubs.c                         |    4 +-
 sound/soc/codecs/wsa885x.c                         |   11 +-
 sound/soc/codecs/zl38060.c                         |    6 +
 sound/soc/dwc/dwc-i2s.c                            |   15 +-
 sound/soc/fsl/Kconfig                              |    2 +-
 sound/soc/fsl/fsl_asrc.c                           |  110 +-
 sound/soc/fsl/fsl_asrc_common.h                    |    7 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |   38 +-
 sound/soc/fsl/fsl_asrc_m2m.c                       |   19 +-
 sound/soc/fsl/fsl_easrc.c                          |  125 +-
 sound/soc/fsl/fsl_mqs.c                            |   14 +
 sound/soc/fsl/fsl_xcvr.c                           |   28 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |    8 +-
 sound/soc/generic/audio-graph-card.c               |    1 +
 sound/soc/generic/audio-graph-card2.c              |    4 +-
 sound/soc/generic/simple-card-utils.c              |   23 +-
 sound/soc/generic/simple-card.c                    |   13 +-
 sound/soc/hisilicon/hi6210-i2s.c                   |    7 +
 sound/soc/img/img-i2s-in.c                         |   12 +-
 sound/soc/img/img-i2s-out.c                        |   13 +-
 sound/soc/img/img-parallel-out.c                   |    8 +-
 sound/soc/intel/atom/sst-mfld-dsp.h                |    2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |    7 +-
 sound/soc/intel/atom/sst/sst.h                     |    2 +-
 sound/soc/intel/atom/sst/sst_acpi.c                |   14 +-
 sound/soc/intel/avs/boards/hdaudio.c               |    8 +-
 sound/soc/intel/avs/pcm.c                          |   24 +-
 sound/soc/intel/avs/probes.c                       |   12 +-
 sound/soc/intel/avs/topology.c                     |   31 +-
 sound/soc/intel/avs/topology.h                     |    3 -
 sound/soc/intel/avs/utils.c                        |    6 +-
 sound/soc/intel/boards/Kconfig                     |   15 +
 sound/soc/intel/boards/Makefile                    |    2 +
 sound/soc/intel/boards/cht_rt5677.c                |  654 ++++++
 sound/soc/intel/boards/sof_cirrus_common.c         |    2 +-
 sound/soc/intel/catpt/pcm.c                        |   12 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |   71 +
 sound/soc/intel/common/soc-acpi-intel-cht-match.c  |    8 +
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   71 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   71 +
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |   85 +
 sound/soc/intel/common/sof-function-topology-lib.c |  289 ++-
 sound/soc/intel/common/sof-function-topology-lib.h |    3 +
 sound/soc/jz4740/jz4740-i2s.c                      |    7 +
 sound/soc/kirkwood/kirkwood-i2s.c                  |    7 +
 sound/soc/loongson/loongson_i2s.c                  |    6 +
 sound/soc/mediatek/Kconfig                         |   27 +-
 sound/soc/mediatek/Makefile                        |    1 +
 sound/soc/mediatek/an7581/Makefile                 |    9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h      |   49 +
 sound/soc/mediatek/an7581/an7581-afe-pcm.c         |  515 +++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c        |  433 ++++
 sound/soc/mediatek/an7581/an7581-reg.h             |  114 +
 sound/soc/mediatek/an7581/an7581-wm8960.c          |  161 ++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h           |    2 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c   |   67 +-
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c  |   61 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |    4 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         |    4 +-
 sound/soc/mediatek/mt2701/mt2701-wm8960.c          |    4 +-
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c         |   23 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c         |    8 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c         |    8 +-
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c        |    2 +-
 sound/soc/mediatek/mt7986/mt7986-wm8960.c          |    4 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |   26 +-
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c         |   31 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |   21 +-
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c         |   95 +-
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |    6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |   23 +-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c         |  115 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c         |   41 +-
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c      |   12 +-
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c        |    5 +-
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c        |   10 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    3 +
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c         |  134 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c         |   69 +-
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c         |   18 +-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c         |   19 +-
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c         |  163 +-
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |   94 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |   23 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c        |   44 +-
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c         |   20 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c         |   18 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   37 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c         |   86 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c         |  113 +-
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c        |    3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |   99 +-
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c         |  145 +-
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c         |   42 +-
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c         |   17 +-
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c         |   16 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         |    7 +-
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |    2 +-
 sound/soc/mxs/mxs-saif.c                           |   10 +
 sound/soc/pxa/mmp-sspa.c                           |    6 +
 sound/soc/pxa/pxa-ssp.c                            |   11 +
 sound/soc/pxa/pxa2xx-i2s.c                         |    6 +
 sound/soc/pxa/pxa2xx-pcm-lib.c                     |    9 +-
 sound/soc/qcom/Kconfig                             |   11 +
 sound/soc/qcom/Makefile                            |    3 +
 sound/soc/qcom/common.c                            |   61 +-
 sound/soc/qcom/common.h                            |    5 +-
 sound/soc/qcom/lpass-cpu.c                         |   23 +-
 sound/soc/qcom/qaif-cpu.c                          |  887 ++++++++
 sound/soc/qcom/qaif-platform.c                     |  885 ++++++++
 sound/soc/qcom/qaif-reg.h                          |  470 ++++
 sound/soc/qcom/qaif-shikra.c                       |  445 ++++
 sound/soc/qcom/qaif.h                              |  292 +++
 sound/soc/qcom/qdsp6/audioreach.c                  |   12 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |   22 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  329 ++-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |    2 +
 sound/soc/qcom/qdsp6/q6apm.c                       |   10 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |    2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |    9 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |   54 +
 sound/soc/qcom/qdsp6/q6prm.c                       |    2 +
 sound/soc/qcom/qdsp6/q6routing.c                   |   11 +
 sound/soc/qcom/sc8280xp.c                          |  194 +-
 sound/soc/qcom/sdm845.c                            |   68 +-
 sound/soc/qcom/sm8250.c                            |    9 +
 sound/soc/renesas/fsi.c                            |   11 +-
 sound/soc/renesas/rcar/msiof.c                     |   14 +-
 sound/soc/renesas/rz-ssi.c                         |   28 +-
 sound/soc/renesas/siu_dai.c                        |    6 +
 sound/soc/renesas/ssi.c                            |   13 +
 sound/soc/rockchip/rk3288_hdmi_analog.c            |   42 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |   18 +-
 sound/soc/rockchip/rockchip_i2s.c                  |   29 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |   27 +-
 sound/soc/rockchip/rockchip_max98090.c             |   15 +-
 sound/soc/rockchip/rockchip_pdm.c                  |   14 +-
 sound/soc/rockchip/rockchip_sai.c                  |   35 +-
 sound/soc/samsung/aries_wm8994.c                   |   14 +-
 sound/soc/samsung/pcm.c                            |   19 +-
 sound/soc/samsung/spdif.c                          |    8 +-
 sound/soc/samsung/tm2_wm5110.c                     |   12 +-
 sound/soc/sdca/Kconfig                             |    6 +-
 sound/soc/sdca/sdca_asoc.c                         |    4 +-
 sound/soc/sdca/sdca_class.c                        |  148 +-
 sound/soc/sdca/sdca_class.h                        |   35 -
 sound/soc/sdca/sdca_class_function.c               |   50 +-
 sound/soc/sdca/sdca_device.c                       |    4 +
 sound/soc/sdca/sdca_fdl.c                          |   18 +-
 sound/soc/sdca/sdca_functions.c                    |   15 +-
 sound/soc/sdw_utils/Makefile                       |    4 +-
 sound/soc/sdw_utils/soc_sdw_rt711.c                |    1 +
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c           |    6 +
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c  |    8 +
 sound/soc/sdw_utils/soc_sdw_senary_amp.c           |   80 +
 sound/soc/sdw_utils/soc_sdw_senary_dmic.c          |   49 +
 sound/soc/sdw_utils/soc_sdw_senary_sdca.c          |   63 +
 .../sdw_utils/soc_sdw_senary_sdca_jack_common.c    |  197 ++
 sound/soc/sdw_utils/soc_sdw_utils.c                |  384 ++++
 sound/soc/soc-ac97.c                               |    6 +-
 sound/soc/soc-card-test.c                          |    7 +-
 sound/soc/soc-component.c                          |  373 +++-
 sound/soc/soc-compress.c                           |  209 +-
 sound/soc/soc-core.c                               |  580 +----
 sound/soc/soc-dai.c                                |  418 +++-
 sound/soc/soc-dapm.c                               |   29 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |   28 +-
 sound/soc/soc-internal.h                           |   52 +
 sound/soc/soc-link.c                               |    2 +-
 sound/soc/soc-ops.c                                |   14 +-
 sound/soc/soc-pcm.c                                |  144 +-
 sound/soc/soc-topology-test.c                      |   74 +-
 sound/soc/sof/Makefile                             |    4 +-
 sound/soc/sof/amd/Kconfig                          |    1 +
 sound/soc/sof/amd/Makefile                         |    2 +-
 sound/soc/sof/amd/acp-common.c                     |   34 +
 sound/soc/sof/amd/acp-dsp-offset.h                 |   75 +
 sound/soc/sof/amd/acp-loader.c                     |   64 +
 sound/soc/sof/amd/acp-stream.c                     |    9 -
 sound/soc/sof/amd/acp.c                            |  468 +++-
 sound/soc/sof/amd/acp.h                            |  120 +
 sound/soc/sof/amd/acp7x.c                          |   11 +-
 sound/soc/sof/amd/acp7x.h                          |   37 +
 sound/soc/sof/amd/acp_asp_mailbox.c                |  558 +++++
 sound/soc/sof/amd/pci-acp7x.c                      |   86 +-
 sound/soc/sof/core.c                               |   10 +-
 sound/soc/sof/imx/imx-common.c                     |    1 +
 sound/soc/sof/imx/imx8.c                           |   26 +-
 sound/soc/sof/intel/Kconfig                        |    9 +-
 sound/soc/sof/intel/apl.c                          |    1 +
 sound/soc/sof/intel/cnl.c                          |    1 +
 sound/soc/sof/intel/hda-codec.c                    |    4 +-
 sound/soc/sof/intel/hda-common-ops.c               |    8 +
 sound/soc/sof/intel/hda-dai.c                      |   26 +-
 sound/soc/sof/intel/hda-pcm.c                      |  142 ++
 sound/soc/sof/intel/hda-stream.c                   |   91 +-
 sound/soc/sof/intel/hda.h                          |   15 +
 sound/soc/sof/intel/icl.c                          |    1 +
 sound/soc/sof/intel/mtl.c                          |    1 +
 sound/soc/sof/intel/skl.c                          |    1 +
 sound/soc/sof/intel/tgl.c                          |    1 +
 sound/soc/sof/{compress.c => ipc3-compress.c}      |  145 +-
 sound/soc/sof/ipc3-dtrace.c                        |    2 +-
 sound/soc/sof/ipc3-pcm.c                           |   29 +-
 sound/soc/sof/ipc3-priv.h                          |    3 +
 sound/soc/sof/ipc4-compress.c                      |  823 +++++++
 sound/soc/sof/ipc4-loader.c                        |   37 +
 sound/soc/sof/ipc4-pcm.c                           |  114 +-
 sound/soc/sof/ipc4-priv.h                          |   55 +-
 sound/soc/sof/ipc4-topology.c                      |  178 +-
 sound/soc/sof/ipc4-topology.h                      |    9 +
 sound/soc/sof/ipc4.c                               |   13 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |    2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |    2 +-
 sound/soc/sof/ops.h                                |   74 +
 sound/soc/sof/pcm.c                                |   20 +-
 sound/soc/sof/sof-audio.c                          |   95 +-
 sound/soc/sof/sof-audio.h                          |   24 +-
 sound/soc/sof/sof-priv.h                           |   12 +
 sound/soc/sof/sof-utils.c                          |   12 +-
 sound/soc/sof/sof-utils.h                          |   11 +-
 sound/soc/sof/topology.c                           |    5 +-
 sound/soc/sprd/sprd-pcm-compress.c                 |    7 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |   10 +-
 sound/soc/sti/uniperif_player.c                    |   29 +-
 sound/soc/sti/uniperif_reader.c                    |   27 +-
 sound/soc/stm/stm32_i2s.c                          |   35 +-
 sound/soc/stm/stm32_sai_sub.c                      |   15 +
 sound/soc/stm/stm32_spdifrx.c                      |    2 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   13 +
 sound/soc/sunxi/sun8i-codec.c                      |   13 +
 sound/soc/tegra/Kconfig                            |   10 +
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra20_i2s.c                      |   10 +
 sound/soc/tegra/tegra210_adx.c                     |   12 +-
 sound/soc/tegra/tegra210_adx.h                     |    2 +-
 sound/soc/tegra/tegra210_i2s.c                     |   13 +
 sound/soc/tegra/tegra30_i2s.c                      |   10 +
 sound/soc/tegra/tegra_asoc_machine.c               |    6 +
 sound/soc/tegra/tegra_wm8994.c                     |  175 ++
 sound/soc/ti/davinci-i2s.c                         |   16 +-
 sound/soc/ti/davinci-mcasp.c                       |   17 +-
 sound/soc/ti/omap-mcbsp.c                          |   14 +-
 sound/soc/uniphier/aio-cpu.c                       |    9 +
 sound/soc/uniphier/aio-dma.c                       |    5 +-
 sound/soc/uniphier/aio.h                           |    2 +-
 sound/soc/ux500/Kconfig                            |   23 +-
 sound/soc/ux500/Makefile                           |    3 -
 sound/soc/ux500/mop500.c                           |  167 --
 sound/soc/ux500/mop500_ab8500.c                    |  437 ----
 sound/soc/ux500/mop500_ab8500.h                    |   17 -
 sound/soc/ux500/ux500_msp_dai.c                    |   33 +-
 sound/soc/ux500/ux500_msp_i2s.c                    |    2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |   79 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   12 +-
 sound/sparc/cs4231.c                               |   49 +-
 sound/sparc/dbri.c                                 |   37 +-
 sound/synth/emux/emux.c                            |   10 +-
 sound/synth/emux/emux_oss.c                        |   14 +-
 sound/synth/emux/emux_synth.c                      |    3 +
 sound/synth/emux/soundfont.c                       |   18 +-
 sound/usb/6fire/control.c                          |   32 +-
 sound/usb/6fire/pcm.c                              |  334 ++-
 sound/usb/6fire/pcm.h                              |    7 +-
 sound/usb/Makefile                                 |    1 +
 sound/usb/caiaq/Makefile                           |    2 +-
 sound/usb/caiaq/device.c                           |   22 +-
 sound/usb/caiaq/device.h                           |   16 +-
 sound/usb/caiaq/input.c                            |   35 +-
 sound/usb/caiaq/lcd.c                              |  258 +++
 sound/usb/caiaq/lcd.h                              |    7 +
 sound/usb/caiaq/midi.c                             |    2 +
 sound/usb/card.c                                   |   99 +-
 sound/usb/card.h                                   |    1 +
 sound/usb/clock.c                                  |   27 +
 sound/usb/endpoint.c                               |   16 +
 sound/usb/hiface/chip.c                            |   13 +-
 sound/usb/line6/capture.c                          |   28 +-
 sound/usb/line6/capture.h                          |    2 +-
 sound/usb/line6/pcm.c                              |   16 +-
 sound/usb/line6/playback.c                         |   31 +-
 sound/usb/midi.c                                   |   69 +-
 sound/usb/mixer.c                                  |  400 ++--
 sound/usb/mixer.h                                  |   10 +-
 sound/usb/mixer_evo.c                              |  505 +++++
 sound/usb/mixer_evo.h                              |   12 +
 sound/usb/mixer_maps.c                             |   13 +
 sound/usb/mixer_quirks.c                           |    7 +-
 sound/usb/mixer_scarlett.c                         |   18 +-
 sound/usb/mixer_us16x08.c                          |   39 +-
 sound/usb/mixer_us16x08.h                          |    2 +-
 sound/usb/quirks-table.h                           |  257 ++-
 sound/usb/quirks.c                                 |  292 ++-
 sound/usb/usbaudio.h                               |    6 +
 sound/virtio/virtio_pcm.h                          |    2 +
 sound/virtio/virtio_pcm_msg.c                      |   19 +
 sound/virtio/virtio_pcm_ops.c                      |    1 +
 sound/x86/intel_hdmi_audio.c                       |   19 +-
 tools/testing/selftests/alsa/.gitignore            |    1 +
 tools/testing/selftests/alsa/Makefile              |    2 +-
 tools/testing/selftests/alsa/aloop-test.c          |  385 ++++
 tools/testing/selftests/alsa/mixer-test.c          |  490 ++++-
 tools/testing/selftests/alsa/test-pcmtest-driver.c |   27 +-
 tools/testing/selftests/alsa/utimer-test.c         |    6 +
 832 files changed, 37044 insertions(+), 6793 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/davinci-evm-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,da830-evm-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ux500-mop500.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/ux500-msp.txt
 create mode 100644 include/sound/sdca_class.h
 create mode 100644 sound/soc/amd/acp/acp-mach-common.h
 create mode 100644 sound/soc/codecs/es9039q2m.c
 create mode 100644 sound/soc/codecs/nau8360-dsp.c
 create mode 100644 sound/soc/codecs/nau8360-dsp.h
 create mode 100644 sound/soc/codecs/nau8360.c
 create mode 100644 sound/soc/codecs/nau8360.h
 create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdca.c
 create mode 100644 sound/soc/codecs/wcd9378-sdca.h
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c
 create mode 100644 sound/soc/qcom/qaif-cpu.c
 create mode 100644 sound/soc/qcom/qaif-platform.c
 create mode 100644 sound/soc/qcom/qaif-reg.h
 create mode 100644 sound/soc/qcom/qaif-shikra.c
 create mode 100644 sound/soc/qcom/qaif.h
 delete mode 100644 sound/soc/sdca/sdca_class.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
 create mode 100644 sound/soc/soc-internal.h
 create mode 100644 sound/soc/sof/amd/acp7x.h
 create mode 100644 sound/soc/sof/amd/acp_asp_mailbox.c
 rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)
 create mode 100644 sound/soc/sof/ipc4-compress.c
 create mode 100644 sound/soc/tegra/tegra_wm8994.c
 delete mode 100644 sound/soc/ux500/mop500.c
 delete mode 100644 sound/soc/ux500/mop500_ab8500.c
 delete mode 100644 sound/soc/ux500/mop500_ab8500.h
 create mode 100644 sound/usb/caiaq/lcd.c
 create mode 100644 sound/usb/caiaq/lcd.h
 create mode 100644 sound/usb/mixer_evo.c
 create mode 100644 sound/usb/mixer_evo.h
 create mode 100644 tools/testing/selftests/alsa/aloop-test.c

