Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569515;
	b=VMF36HYbaJyk6mP9grJ9hWgIWoV18L4rP60Ik2J1hc1tw1PiCh6sTAixC6XII5/5PWI4
	 4wenJciJZW8XaEOmeL1d+dShOB1FxGwX6JnGBmcuYypkY0WAuDte89pZR4XQE7O+lKLH6
	 nVAslKJIzw46xlQaKUHXG8Lez9OSl9NZk+T7xPNbZ47vbb+iZ4IJONcmqrUvqBPgBzZp0
	 tJ0BazGb7a4YaTCsyMRSQ08p12Zylyx5hV6bCMkJQbNPvb0sRu4nORkkfu0DTWwcuNxoh
	 jknSk/tyTAVcNoFX+YNlEOCXJWBa3FIuz2ntoLL3ScI1EqWwNT650+nfOel50j8P0qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569515;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6DhFH8hwsCYnBgFxXq/I9O6+y9tsetgI7G8uWPPAQcg=;
	b=X6dvx8OlK9CIW6xcDd11bKVtaqapfVSrxQLaBJNwLcw0nHaaHlu1lJeuY2uQEsM+sW1v
	 iwcyr5BTc2G50TNIscffhNyoa7ixdsbI4T/D/QnMdmzsEdC6vdq07EwaylUj8c2Kicgg+
	 mgVOVsyUCW9OsTjB5i/K+TkhD3xVYIOdjF95OTbIg30c7znAKNPMkFay0z95S4EhA60Di
	 wXfzYdgLrbaIPsvHJsVseNrqv4CztkEgKeKKERl6thHokA8JtUZDk4aD5VvE9MTfaK2PC
	 TSrTUCD5iR3+1lz8r0rvqY2Vm0OwwbKgsFZEfU7QaQGik2CTSY+L3yU9mkqa4PfjiEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NMOENO2o;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D394E606A321;
	Fri, 13 Nov 2026 11:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D394E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NMOENO2o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569515; x=1826105515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/fc+RBsrxEuri+mYI7f8O/LEmpyN3U7R5LhWumAYaG8=;
  b=NMOENO2oFyC545i8LvKmGiBydXUatS6RWIsUu4oD9FscImiIQmzkHMGx
   M4eFIAxfFQvNDY0DdK2h48sGDIc6jveEJV8m0UZzM2Dk56imxoGfklao8
   jvSltIVTfbYiaWbVjLmTZ7fgbVmWgVk71Yx3KvUKUFGUilOBN0X3pO27a
   5uukZpvfd5zxpCYLJeMxC1Fy+zhJ7TicSmMI6n4P0/6838GWO2YhVDN5L
   E+KyIQgSLNB0WooKY1W5EN4ZFyk1A6avlm3QvzAGlrmP6GIpo0KnsWsC/
   Xszat/yFH94zuCxr7BshhZkrafqBvBOgAu72QvU5AmNtRaln7xXnM29yX
   Q==;
X-CSE-ConnectionGUID: WSTusNxzRbyO069Tkn4FbQ==
X-CSE-MsgGUID: msAXuLxsQm+PMTp+uvIeYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246889"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246889"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:23 -0800
X-CSE-ConnectionGUID: ahPVgVjLRHiw4/Mnqkceqg==
X-CSE-MsgGUID: PNHNXKb1TMWnG7czBJE8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235564"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:20 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 00/11] ASoC: Intel: avs: Renames and debug prints
Date: Fri, 13 Nov 2026 12:38:29 +0100
Message-Id: <20261113113840.3067489-1-cezary.rojewski@intel.com>
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

The patches consists almost solely of renames and addition/enrichment
of debug prints. Plus few removals to redunce duplication among these
debug prints.

The 2/11 patch is the exception - as its follow up updates the messages
around, the mentioned patch is here to fix the problem of skipped
results coming from avs_path_pause() in trigger() operations. With that
done, the dev-prints are touched.

Apart from 2/11, from functional perspective everything is left at
status quo.
Sidenote for 6/11: touches on catpt- and avs- boards both. Decided to
merge these two changes rather than generate a separate patch just for
adding 2 missing commas. Feel free to comment if you believe my decision
is incorrect.


Note: this is a orthogonal subject to my soundwire-related series [1].
Paused while I'm testing soundwire-aggregation scenarios. Neither is
blocked by the other.

[1]: https://lore.kernel.org/linux-sound/20261106121557.2338556-1-cezary.rojewski@intel.com/

Cezary Rojewski (11):
  ASoC: Intel: avs: Do not skip error reporting when an IPC timeouts
  ASoC: Intel: avs: Do not skip errors from avs_path_pause()
  ASoC: Intel: avs: Have one location for dumping path-errors
  ASoC: Intel: avs: Small registers cleanup
  ASoC: Intel: avs: Enrich missing-format and token-parsing messages
  ASoC: Intel: avs: Unify code style for platform_device_id arrays
  ASoC: Intel: avs: Streamline topology parser names
  ASoC: Intel: avs: Streamline wording used for board configs
  ASoC: Intel: avs: Streamline naming of hw_params variables
  ASoC: Intel: avs: Streamline spacing used in the avs_ids table
  ASoC: Intel: avs: Remove soc-acpi-intel-match include

 sound/soc/intel/avs/boards/Kconfig   |   6 +-
 sound/soc/intel/avs/boards/probe.c   |   4 +-
 sound/soc/intel/avs/boards/rt274.c   |   4 +-
 sound/soc/intel/avs/boards/rt286.c   |   4 +-
 sound/soc/intel/avs/boards/rt298.c   |   4 +-
 sound/soc/intel/avs/boards/rt5514.c  |   4 +-
 sound/soc/intel/avs/boards/rt5640.c  |   4 +-
 sound/soc/intel/avs/boards/rt5663.c  |   4 +-
 sound/soc/intel/avs/boards/rt5682.c  |   4 +-
 sound/soc/intel/avs/boards/ssm4567.c |   4 +-
 sound/soc/intel/avs/core.c           |  16 ++--
 sound/soc/intel/avs/ipc.c            |   8 +-
 sound/soc/intel/avs/messages.h       |   4 +-
 sound/soc/intel/avs/path.c           |  35 +++++----
 sound/soc/intel/avs/pcm.c            | 109 ++++++++++-----------------
 sound/soc/intel/avs/registers.h      |   2 +-
 sound/soc/intel/avs/topology.c       |  27 ++++---
 sound/soc/intel/boards/bdw-rt5677.c  |   2 +-
 sound/soc/intel/boards/bdw_rt286.c   |   2 +-
 19 files changed, 105 insertions(+), 142 deletions(-)

-- 
2.34.1

