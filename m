Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A93CF030
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193074; cv=none; b=tKni+OfJxgZxVfJwbanDHxsBn7bz3VKEZXtSIJHBekqlzFToyZKWhc9+p/yfGU0XdmPrLUCAF+sJLGR7m3DMyAlQt0J/abhFjmIc5Xz9wbgiO0BRgkbJWmd4QSe9orCpAnuU/GKLtpPzA9hEPy40lBKYG9dyHfUaWdIqvzHQ6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193074; c=relaxed/simple;
	bh=jGAdImBGD1zBR6ZCSwCEdEyZFGXYBaqDl4HcKAwxYFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqmruKv6R09JKQQ0iX1V5N1AF87xDFP0+AhTATLb5Hc6YTDbo4+CP8vBxeZ3d2PeG7llqFduOln71+Vkm+NDCfA81llBdrYlE9+BEljr+f/m+wzo2ObLjQ3zxdzuuxfqT47Ls+m5HpoUQl6nKCVKSwHUPt2h3bi9MSdEsrHOdiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ohEi0Dsk; arc=none smtp.client-ip=95.215.58.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ohEi0Dsk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jGAdImBGD1zBR6ZCSwCEdEyZFGXYBaqDl4HcKAwxYFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792193069; v=1; x=1792797869;
 b=ohEi0DskkRJKko7UMYzQoJ5ZVtLOvhRW5DpGBZy8orVZ4teVKDXVmVVqbEk+NM+LiaQTJKBa
 PrJFYzyBh2MyCJlUbIpopUCnN4soEusdxUQAjn5dPeweZt0dnZc+69CYsJV/471JNlunC6rCjfz
 2izBSe3Qkfd5C6px5EYlTfrw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1975a4dcb4e56ae;
	Fri, 16 Oct 2026 23:24:29 +0000
X-Mizu-Trace-ID: d1975a4dcb4e56ae
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
Subject: [PATCH 0/5] ASoC: support the ASUS ROG Xbox Ally X20 audio
Date: Fri, 16 Oct 2026 16:24:10 -0700
Message-ID: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Matthew Schwartz (5):
  ASoC: amd: acp-config: force SoundWire probe on ASUS RC74XA
  ASoC: amd: acp: add ACP70 SoundWire machine entry for ASUS RC74XA
  ASoC: tas2783-sdw: use the BIOS speaker ID in the firmware name
  ASoC: sdw_utils: honor empty DisCo port lists when creating DAI links
  ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up

 include/sound/soc_sdw_utils.h            |  1 +
 sound/soc/amd/acp-config.c               |  7 ++++
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c     |  2 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++
 sound/soc/codecs/Kconfig                 |  1 +
 sound/soc/codecs/rt721-sdca-sdw.c        | 17 +++++++++
 sound/soc/codecs/rt721-sdca.c            | 33 ++++++++++++++++++
 sound/soc/codecs/rt721-sdca.h            |  1 +
 sound/soc/codecs/tas2783-sdw.c           | 42 ++++++++++++++++++++--
 sound/soc/intel/boards/sof_sdw.c         |  2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c      | 36 +++++++++++++++++--
 12 files changed, 179 insertions(+), 9 deletions(-)


base-commit: 2450a9bcd3423612f614ea15ff44966fed189191
-- 
2.56.0

