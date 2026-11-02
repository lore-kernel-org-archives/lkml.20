Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642629;
	b=pNQnZG7VkIwZkw28XcMItVV0aTQMAvMgfeMPePg9Wi627/lW2ir/Rt0K1sULichlkp/H
	 3UZqH7A28oG+p5GWogvGzVpf61ZI+wD7v3vo7r8JSVgU7gWqcYVAn7mW3b2FDkR1oSWle
	 iP2QepGwszfXRmJZ+irYNECdDYhIuACeDQ1XlOrlsGOjCiphbVHiKJbitYo9smq3Ls0vI
	 EhSJ4gFvPLJ46zx9WNmDe3H4/OgT1QeOwwglo2O0qsuQmXxABK9mOWYSnw1u4wUmKoGrx
	 ECvlkVdctDU0fkhgHpXmTHzeJcBUo4CtDmYkfMtKrBOdQ4aaz9ny1PbIpAIg9SZrU6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642629;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mPPK6xid48pnQ++z3sYITqKhAutHo28UVT7NKYvIdjo=;
	b=Gbjtp5Pn11gcVlnG05p2ybOp+YtpFWXZBpJOvqAxeviTcgPvuvlMHlF2X6f1IjADCgIg
	 Vc4PdNB3c7m824WC5iqS9WX0dV02UOs7Mx8FKbrClcwT0YbPy9BXKCZUvWfWjqejU0/Mf
	 bp7nQ3gzrbAUPM83rmOcD2I0i5WwHtzmh+bZxrhsrZ36m5SnH2d1bCO2aCL1vRTNzIWTz
	 FrsEmu2Xz4+2cTNtK1OZ/p6a8iiVxt9BXx8Zw/2iyWU9XrL9OOXIG/z2O9URUNFpQY5tq
	 Y6yGwyf8WbCwgaHczqQ5ovK2ya+uWBHxMGPiD6AWYjrpOoNKBbvo3YUwoUZG5Ez4SQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AThth0pH;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A49606A32D;
	Mon,  2 Nov 2026 18:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A49606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AThth0pH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793642629; x=1825178629;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=biBNGKoBWQIyux7Qbv679Scb4dfJzP+dQzXjOob7PFE=;
  b=AThth0pHGarO3tT6X2Hc4UPepAYMCzcD2jBQcZyyOwoaMJjQjHuK31S9
   jGmRE3RPE1TpP7vaUGXX5luwJ5exXPM3EEyu+YMtScy3jzrCLW/JGjbl7
   DDPxqmHTOWEM5HJPPzHZlCmp3qExbjuxTNRTK3Htbdj1dSLwgEcUf+gfj
   tSuQTQ1NeYP/SXLGn8BdU4ee3bfjoYImq7XLFyVCAqXL/mzDHBmDjCn0h
   egYh7RbTPVoFCw9TGjJ6ygvNpaWnfT2ziFOD1vfrsGqeHnQFMm75gPCo8
   ziu4dIUAadi+Scwj3Y68hDkzSu7+swJCH2oiPUxiQS/fm+VdO5gyhOVK2
   A==;
X-CSE-ConnectionGUID: csAb9tEoTX2AqTGSxfZAwQ==
X-CSE-MsgGUID: gmXh9tr0TNOyn3TiiEIaNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235459"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:03:48 -0800
X-CSE-ConnectionGUID: ocKq/ExzTeO010B1M9piCA==
X-CSE-MsgGUID: 3nwH10jhRG+7WO9iNY4O1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6169160"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2026 10:03:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/7] ASoC: Intel: avs: Soundwire support
Date: Mon,  2 Nov 2026 19:10:35 +0100
Message-Id: <20261102181042.1922005-1-cezary.rojewski@intel.com>
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

Cezary Rojewski (7):
  soundwire: intel: Define stubs when library is disabled
  soundwire: intel: Allow for dynamic assignment of PDIs
  soundwire: intel: Split PDIs and DAIs initialization
  ASoC: Intel: avs: Pass irq to dsp_interrupt callback
  ASoC: Intel: avs: SoundWire support
  ASoC: Intel: avs: Expose common PCM functions
  ASoC: Intel: avs: SoundWire PCM BE operations

 drivers/soundwire/cadence_master.c    |  64 ++++++
 drivers/soundwire/cadence_master.h    |  24 +--
 drivers/soundwire/intel.c             |  40 +++-
 drivers/soundwire/intel.h             |   3 +-
 drivers/soundwire/intel_auxdevice.c   |   4 +
 include/linux/soundwire/sdw_cadence.h |  35 ++++
 include/linux/soundwire/sdw_intel.h   |  41 ++++
 sound/hda/core/Kconfig                |   2 +-
 sound/hda/core/Makefile               |   3 +
 sound/soc/intel/Kconfig               |   1 +
 sound/soc/intel/avs/Makefile          |   4 +
 sound/soc/intel/avs/apl.c             |   2 +-
 sound/soc/intel/avs/avs.h             |  15 +-
 sound/soc/intel/avs/cnl.c             |  25 ++-
 sound/soc/intel/avs/core.c            |  24 ++-
 sound/soc/intel/avs/loader.c          |   3 +
 sound/soc/intel/avs/messages.h        |   2 +
 sound/soc/intel/avs/mtl.c             |   2 +-
 sound/soc/intel/avs/path.c            |   2 +
 sound/soc/intel/avs/pcm.c             |  42 +---
 sound/soc/intel/avs/pcm.h             |  51 +++++
 sound/soc/intel/avs/pcm_sdw.c         | 276 ++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h       |   4 +
 sound/soc/intel/avs/skl.c             |   2 +-
 sound/soc/intel/avs/soundwire.c       | 112 +++++++++++
 sound/soc/intel/avs/soundwire.h       |  63 ++++++
 26 files changed, 765 insertions(+), 81 deletions(-)
 create mode 100644 include/linux/soundwire/sdw_cadence.h
 create mode 100644 sound/soc/intel/avs/pcm_sdw.c
 create mode 100644 sound/soc/intel/avs/soundwire.c
 create mode 100644 sound/soc/intel/avs/soundwire.h

-- 
2.34.1

