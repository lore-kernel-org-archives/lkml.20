Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736431;
	b=d2TXgUe9tfRdLsizpubxu94sDvGTPB04Oy00aOI1pC7uLm0ZIH3a06Z6nVbNLWj5Idot
	 cVqcyNptSp/obegxiPZIcTu7lEl5zbAlxvuY/XubHA5Ut5PcciEcEHbjC0GOmvhjYYnwD
	 kIHzpUxDigmcQS4o7yThGpAGtqHDEKIMNmk+yuK+crSoin+x7H5fDv2D3VNaazOcmy1FC
	 h1l8VO8KmZA7uKW1EmY3oTQYZ+tGifIcbUgkGG2KX/2RtiEK1UlfZbBo6TrokF4uUA6Pp
	 O9M5aTkrv9H1P55A1Bwj+zJmCyHaFnGpkAWv/uL4/8e4b0VIIRZ9oZ1y4xlJOT8Igzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736431;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yATu9r3fv9rnceL7x4dLhUOb/oDN73fyB8WjE8WqEBs=;
	b=1diXpcmpbPTWyRhzGiJPhQ6fcgLPWWYwAVwwgAK9EZgSy1SgUFb+S4ywr7KD1jx7gc8p
	 YTRqciQrSvz/3MKtYIlPb1k5GKRyARG90JBO3fyl8G1acFzwx9hSc+9iXxZcvcq3MQvbs
	 gzoPYFoQfF0AZPv2N+kiIl/og2RmlYzuzjXXd6sVsshuLCx6YwLLDxgFhkpXcJ3XGXg6P
	 BWfX4FQJBtl0fUNcViZOO9g3qCbkutmQnOkqTZejMl1hc0oGOyv1fbWdKb7w+m7fzbdEh
	 Y7hwh1t2NAzfs0NIWrCk/88EBXohYD68G1F+bvFlwfoofA75mntHE2M7NglUU3ptwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IaM5CR1e;
	arc=none smtp.remote-ip=95.215.58.191
Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28C606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E28C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IaM5CR1e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q4Oj33KAjCxLBzaHuAu2qhkh90So4aD1oU3XcViQIig=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736424; v=1; x=1794341224;
 b=IaM5CR1eCzu9QArWByrH7PeT95XL/RL6Hu2d86fqch6or1MBVpkd5u7tBbJXIU3qBpj25TBT
 +D/PMP2FPaN5um5Fllk/hDc25TBfsqnnJDCT0K1k3bAehUMsnrKl6po+Mskaajs3ido0zjJxWRo
 Xqi77YUyz81h7wNcJkiHBr7w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7eacb9ba536bb1c;
	Tue, 03 Nov 2026 20:07:03 +0000
X-Mizu-Trace-ID: f7eacb9ba536bb1c
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
Subject: [PATCH v2 0/5] ASoC: support the ASUS ROG Xbox Ally X20 audio
Date: Tue,  3 Nov 2026 12:05:34 -0800
Message-ID: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
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
Patch 4 stops sdw_utils from creating the TAS2783 amp feedback capture
link when the BIOS declares an empty source port list, which otherwise
fails on every open. It touches the shared helper and the AMD and Intel
SoundWire machine drivers, but I was only able to test on AMD. Patch 5
makes rt721-sdca wait for its power domains to reach PS0, which removes
a burst of full scale samples at the start of headset mic capture.

Tested on an RC74XA with speaker playback on both amps, headphones, jack
detection, both microphones and suspend.

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

v1: https://lore.kernel.org/r/20261016232416.2628603-1-matthew.schwartz@linux.dev

Matthew Schwartz (5):
  ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
  ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
  ASoC: tas2783-sdw: use the BIOS speaker ID in the firmware name
  ASoC: sdw_utils: honor empty DisCo port lists when creating DAI links
  ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up

 include/sound/soc_sdw_utils.h            |  16 +++
 sound/soc/amd/acp-config.c               |   7 ++
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |   9 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c     |   7 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c |  44 ++++++++
 sound/soc/codecs/Kconfig                 |   1 +
 sound/soc/codecs/rt721-sdca-sdw.c        |  17 ++++
 sound/soc/codecs/rt721-sdca.c            |  33 ++++++
 sound/soc/codecs/rt721-sdca.h            |   1 +
 sound/soc/codecs/tas2783-sdw.c           | 123 ++++++++++++++++-------
 sound/soc/intel/boards/sof_sdw.c         |   7 +-
 sound/soc/sdw_utils/soc_sdw_utils.c      |  60 +++++++++--
 12 files changed, 263 insertions(+), 62 deletions(-)


base-commit: 2450a9bcd3423612f614ea15ff44966fed189191
-- 
2.56.0

