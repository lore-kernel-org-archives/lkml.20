Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833174;
	b=UHlV8SUHlOWjJpciVfsK9dmaDpQq42kUT9wNslKfLTemeWwi/vq8NctKSeD4XL3XPHEO
	 mBOjqY9jzinlOh8G91JKXkAr58KW7/PuchDkk+W+yF8cI+4Tivwsi+yW/y9Y1CFYRSpKJ
	 uy7s4cxBcNw1Ku02FCRyKciondej3sLRK4VZVLRKxQBCgjxxpx75UuoC2je66ZGgqYxuT
	 uZrehwjIFUnZh+zH6auoUtNMQj518VC51AZSPbiE0UcqDMuPvBr/pMmZ+QWmD6Wy9qwPI
	 7MZ7eNXqOFXYWFiogJkgkwuM0+uD8bl05+QNEKe+beLzvQbRte/1ZOdA/yhRtBkPYnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833174;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=arZxwJUH8KsLmgA0OaH9zQ7lRvV2honSTZ5JrbyQ1xU=;
	b=oCfv0DdkleJk5DGgWuF9dx1EtnpW3eQaLfp6GA+eExIwr8Jb5hIW2jhBQHQVDMl2LSB7
	 ZQTGZqHWm5pMFErTq/gTI3VtMshkdUK4GWLzset+BiguGxLveobF99DhjDbCTForL5nUM
	 pWg5uEgqL86I3UfDYfZs1FSOjP51l1ZIJdVOCb6M7JmrGGGIt6vATrVnDGi+DfMqFYDhO
	 bR3kP4jQm7SJQHxBgJ7HyWZGGvF66RpgzKjZI34qhXNEXrJ2K5Wz7GX+9wsPefa+iynyP
	 9xclCsbprYIvgfiivAWJQ+d7o5MUWvgmWblI0LETDLphmCUcRafLv5omUkJcWVRf5Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TPblOg65;
	arc=none smtp.remote-ip=91.218.175.241
Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6033606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6033606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TPblOg65
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IwL2qFezpoqNR9l2/hRYcJYYkgE1KoPejqM6U5mzOmw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793833170; v=1; x=1794437970;
 b=TPblOg655oKjHbEOBeuW4QotDit9+5bilHlKV2AawpNU8vNWwgPUUJ+NJEgvOvWFhpj0XQQE
 78TtNfYs6mLaR17CtmDcKEkqMlTLL6KHVVrqsuahaYUv8o3dm8ewPk/d085dXBSBCocK13Nxv9v
 93lDPDQNdMzzXO1to7pFmeQo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 63f206f8476da4c7;
	Wed, 04 Nov 2026 22:59:29 +0000
X-Mizu-Trace-ID: 63f206f8476da4c7
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ASoC: support the ASUS ROG Xbox Ally X20 audio
Date: Wed,  4 Nov 2026 14:57:59 -0800
Message-ID: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Xbox Ally X20 (RC74XA) moves from the HDA codec and TAS2781
amps of the earlier ROG Ally models to SoundWire on ACP 7.0, with two
TAS2783 amps on link 0 and an RT721 on link 1. Its BIOS marks the ACP as
legacy DMIC only, no machine table entry matches the link layout, and
its TAS2783 firmware in linux-firmware uses the four-field name that
carries the BIOS speaker ID, so the speakers do not work today.

Patches 1 to 3 cover that: the ACP config override so the SoundWire
links are probed, the machine entry, and the speaker ID firmware name.
Patch 4 makes rt721-sdca wait for its power domains to reach PS0, which
removes a burst of full scale samples at the start of headset mic
capture.

Tested on an RC74XA with speaker playback on both amps, headphones, jack
detection, both microphones and suspend.

Changes in v3:
- Dropped the sdw_utils DisCo port list patch, including the hunk Bard
  commented on. With patches 1 and 2 the RC74XA probes the AMD legacy
  machine driver, which skips the amp reference capture link since
  commit 9867312e9fd2 ("ASoC: amd: acp-legacy-mach: skip dai link for
  amp reference stream"), so the SmartAmp capture PCM that failed on
  every open is not created. That commit was already in the base of v1
  and v2, and I had only seen the failure on a kernel without it.
  Pierre-Louis's suggestion to set the TAS2783 ports in the driver still
  applies where the amp reference stream is used, and will follow
  separately along with his point about the data port ranges in the
  regmap callbacks.
- Picked up Pierre-Louis's Reviewed-by on patch 4 (was 5).

Changes in v2:
- Patch 3: try the firmware names in a fixed order, the four-field name
  when SPEAKER_ID is present, then SSID-LINK-0xUID and SSID-LINK-UID,
  so a board with the variable but three-field firmware still loads the
  0x name. Read SPEAKER_ID once at probe into a u32 and only use it
  when it is four bytes. With no PCI parent, try the generic name once
  instead of twice. (Mark, Sashiko)
- Patch 4: only honor empty port lists for codecs whose driver takes its
  ports from DisCo, currently TAS2783. (Mark) Take the stream name and
  DAI link ID from an endpoint that is part of the stream, only run init
  for those endpoints, count the AMD legacy amp capture endpoints by
  their effective direction, and skip an endpoint left with no
  direction. Check the endpoint number against dai_num before using
  its DAI info. (Sashiko) Dropped Vijendar's Reviewed-by because of
  these changes.
- Picked up Vijendar's Reviewed-by on patches 1 and 2.

v2: https://lore.kernel.org/r/20261103200540.3863272-1-matthew.schwartz@linux.dev
v1: https://lore.kernel.org/r/20261016232416.2628603-1-matthew.schwartz@linux.dev

Matthew Schwartz (4):
  ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
  ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
  ASoC: tas2783-sdw: use the BIOS speaker ID in the firmware name
  ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up

 sound/soc/amd/acp-config.c               |   7 ++
 sound/soc/amd/acp/amd-acp70-acpi-match.c |  44 ++++++++
 sound/soc/codecs/Kconfig                 |   1 +
 sound/soc/codecs/rt721-sdca-sdw.c        |  17 ++++
 sound/soc/codecs/rt721-sdca.c            |  33 ++++++
 sound/soc/codecs/rt721-sdca.h            |   1 +
 sound/soc/codecs/tas2783-sdw.c           | 123 ++++++++++++++++-------
 7 files changed, 187 insertions(+), 39 deletions(-)


base-commit: 2450a9bcd3423612f614ea15ff44966fed189191
-- 
2.56.0

