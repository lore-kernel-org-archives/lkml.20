Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713390;
	b=uxTN6Gj/+LYWqhPCXf0Mx9xsINyZgZZdINjE6J+Q7iwwU/fu/gPg5/PrFzzX/uxe7sFx
	 zzaXQFKnciR1XTAUX6TG8dXsZs9ZtiZHzuIbIbw7iVxWkYzBJO3EVhtTFMuKBPB4rCvWW
	 TcTKcHQBwNuZTa5cD7TXKjvIPHOg16FOyHDiMprhBTC/6p6AfGslItiYXXMnCK5pZvRfr
	 zM3WyAv49tqhiEC8bEgmawXkEaNv00q//GMy68b0kpdv6gIPWZ6UBivP/jYveSzpfOUxc
	 7+TGWDECkOWBohpxVML8/2otS7doBEgqK1YotJwSRSC7QmJVYV/f07hCF5H/EmpCL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713390;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZdmQqQyK0aZOjizbaMy6h2oKR3b5w3MhsCDtNgmmsDs=;
	b=2bY1/Ax1HH9HZo/1sWLX527RkSk3NB6TiJ4Hfy3IXFXUpiPszc/Hn7kVBl5jlRcSpeHJ
	 VhdfGvvSVS33HyxbeEvQyzOdIuiRV4QQP1SGe0yptEx3m/A35zcTBF5D7NllS8czqSwe2
	 up/G5kUnD580xELhmRFaZV3bRwAs7DtgrvjyKDdCw5wCeR4dsCqd1LLdiQhvdrYpnaZIg
	 dFdOJXkZeV6YqzGy6M3edWtQAT7qfsH9NF/VxSWr2rFEDkqd83LmunxqdbECSlm8SVYDJ
	 OquTWGkPuuQvYo76d1dnONPC+3Osx65/5fZfadUwY1YxLc3hcv4oS3vdgt4YdLnfWAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFzWZrvK;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55310606A324;
	Tue,  3 Nov 2026 13:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55310606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFzWZrvK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793713388; x=1825249388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TfR4xA2U6Ko/BxSgGY90vgDu+p7Z0W5UgU306Djsi/Y=;
  b=QFzWZrvKzrKnJpLbRNhg5u4GWqtutWIotxkbQ07oM+61OuKiHaYIRqq8
   Lg7nQNUyhwZXIKLeQ8dPGSm8NT6gF2CDmO0ka68+VmwkEZWwMArmWM6tF
   KLgWT+8Ewi1nyfT2GP+WZR0fYASSVGJEuaId+CGEPrvkd3/Oanz6nRbGy
   x/M4CbC/S+H7iwzPaa53AXOZl8pCiGIvIRPjdedWaAKKP2EeTYplIbi6z
   2CF0OtswIkNK937PCt7kqMJ1zFVTNrdj3aGDdDKulym42j6vjPPEcHwAy
   Ye+rEvmFNp2UhE2JeazWXa4TBwCGgUELNZv9BVO4P5PnCIni573Q4yIpO
   w==;
X-CSE-ConnectionGUID: 6g35H5VHRZKkqJnvl7TiUg==
X-CSE-MsgGUID: TpnYN6N6TDmxbkNYPuPaSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2328063"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2328063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 05:43:07 -0800
X-CSE-ConnectionGUID: pa3ixEsgSKW1rzdRWsKnZw==
X-CSE-MsgGUID: gtCZth5kRr2s8QldRcd3Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6428180"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 05:43:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
Date: Tue,  3 Nov 2026 14:49:51 +0100
Message-Id: <20261103134958.2089136-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RaptorLake-P and RaptorLake-M based platform used in Automotive area
do utilize SoundWire for streaming audio.  This patchset brings such
support to the public domain.

If possible, I'd like the changes to go through Mark's tree.

As the patchset updates drivers/soundwire, I've decided to strip it off
any machine-boards and have here just the changes done to the main
soundwire driver and their user/usage.  Machine boards for RPL-P/M will
follow in a separate set and do not touch drivers/soundwire stuff.


The reasoning behind modyfing the soundwire code:

Typically dai->startup() is responsible for checking if all the required
resources are available whereas dai->hw_params() is responsible for
configuring such resources.  Existing code does the PDI assignment and
its configuration within one function - intel_hw_params().  The logical
split is not possible.  The change provides functions that represent
such logical blocks: assign, release and config.  Such division exists
already for the HDAudio interface, see sound/hda/core/stream.c

For the user i.e.: avs-driver (sound/soc/intel/avs) it also makes the
code very cohesive - aligns with that's done on the HDAudio side as all
the HDAudio streams are assignment during dai->startup() and configured
with dai->hw_params().  

Also, the existing code fetches the PDIs based on pre-defined "dai_id".
That's not the case for the avs-driver.  It simply asks: "is any PDI
free?" and assigns it for the substream if one is found.
No predefining.  Again, this aligns with how HDAudio streaming is done.

avs-driver -only patches follow the three soundwire ones.  First, they
extend the existing code so it can accommodate SDW interface.  With that
done, laverage existing PCM code (sound/soc/intel/avs/pcm.c) and
soundwire-intel to implement DAI operations.


Changes in v2:
- dropped duplicate headers as pointed by Amadeusz
- fixed PDI initialization for ace2x as pointed by Bard. This is done by
  introducing ->init_pdis() ops and calling it just before
  ->register_dais(). The body of the ops is 1:1 with the existing PDI
  initialization code
- fixed the error path if init_pdis() fails, as pointed by Bard
- fixed Amadeusz' email for all the headers

A number of changes pointed by Sashiko:
- fixed compilation when CONFIG_SND_SOC_INTEL_AVS=y and
  CONFIG_SOUNDWIRE_INTEL=m. This is done with help of new kconfig:
  SND_SOC_INTEL_AVS_SOUNDWIRE
- added missing kernel docs
- avs_sdw_dai_trigger()/prepare() now rollback sdw_stream state if DSP
  operations fail
- avs_sdw_dai_shutdown() now NULLs the sdw_stream context
- wanted to reserve this for later but since the bot pointed this out,
  updated hw_params(), hw_free() and prepare() to accommodate for
  suspend/resume scenario with a SDW stream
- sdw_intel_acpi_scan() now returns -ENODEV if the library is disabled
  (previously returned 0)
- avs_sdw_probe() now exits early if the link_mask is 0
- disabled SDW probing for avs-driver on ACE2+ platforms


Cezary Rojewski (7):
  soundwire: intel: Define stubs when library is disabled
  soundwire: intel: Allow for dynamic assignment of PDIs
  soundwire: intel: Split PDIs and DAIs initialization
  ASoC: Intel: avs: Pass irq to dsp_interrupt callback
  ASoC: Intel: avs: SoundWire support
  ASoC: Intel: avs: Expose common PCM functions
  ASoC: Intel: avs: SoundWire PCM BE operations

 drivers/soundwire/cadence_master.c    |  65 ++++++
 drivers/soundwire/cadence_master.h    |  25 +--
 drivers/soundwire/intel.c             |  41 +++-
 drivers/soundwire/intel.h             |  10 +-
 drivers/soundwire/intel_ace2x.c       |  25 ++-
 drivers/soundwire/intel_auxdevice.c   |   4 +
 include/linux/soundwire/sdw_cadence.h |  35 ++++
 include/linux/soundwire/sdw_intel.h   |  45 +++-
 sound/hda/core/Kconfig                |   2 +-
 sound/hda/core/Makefile               |   3 +
 sound/soc/intel/Kconfig               |   8 +
 sound/soc/intel/avs/Makefile          |   4 +
 sound/soc/intel/avs/apl.c             |   2 +-
 sound/soc/intel/avs/avs.h             |  15 +-
 sound/soc/intel/avs/cnl.c             |  25 ++-
 sound/soc/intel/avs/core.c            |  22 +-
 sound/soc/intel/avs/loader.c          |   3 +
 sound/soc/intel/avs/messages.h        |   2 +
 sound/soc/intel/avs/mtl.c             |   2 +-
 sound/soc/intel/avs/path.c            |   2 +
 sound/soc/intel/avs/pcm.c             |  42 +---
 sound/soc/intel/avs/pcm.h             |  50 +++++
 sound/soc/intel/avs/pcm_sdw.c         | 289 ++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h       |   4 +
 sound/soc/intel/avs/skl.c             |   2 +-
 sound/soc/intel/avs/soundwire.c       | 117 +++++++++++
 sound/soc/intel/avs/soundwire.h       |  63 ++++++
 27 files changed, 816 insertions(+), 91 deletions(-)
 create mode 100644 include/linux/soundwire/sdw_cadence.h
 create mode 100644 sound/soc/intel/avs/pcm_sdw.c
 create mode 100644 sound/soc/intel/avs/soundwire.c
 create mode 100644 sound/soc/intel/avs/soundwire.h

-- 
2.34.1

