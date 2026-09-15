Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655F3B47DF;
	Tue, 15 Sep 2026 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478022; cv=none; b=nudkxfiphpurZ1qKby7Be3Luc+i5Ni2KxKfq+bnYUBZ/z2s1XARsbjmoJCnWIbwbxDCevON6LzMtfiGB/JuE/349ct2BC3+7tidEFY394xw3gMs6EEiRVx2bdFgeoQxAaGEsf3BcHbPBUccp7+zG7ZFipm5Cw2iKGqaW17iCeNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478022; c=relaxed/simple;
	bh=59onL2xa8p2v73PAliOoOgZy/wPHJ//Baq9JPP97Rdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEsQUrRDvbXrEkDP3oPkOgDXpPXw4D66XdpGD72bhbccNVfJRF1uW8yKlyYLQ8JfBlOAm/F/LuvcpqBcD+CLsjmFnR38GuQywUEzj5TitEdA6IdzM+0NrRrckNrM9F40BtrKiYFlJCFlVj5kegdd6R2YgMEIq/2DUQV0P73WQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hevfPPh5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hevfPPh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478021; x=1821014021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=59onL2xa8p2v73PAliOoOgZy/wPHJ//Baq9JPP97Rdw=;
  b=hevfPPh5kFsIi71UHkClBHnEk1ealcBNihSkUC7Cw1UjLY2eLGzgVd5V
   4KITiEKaGlS8e6p15Iiu/CNypA5H26pow8bHoIiENmP1OqbKB/aTE/d3G
   JotMDRMFryc50FrJ+5IuruwAXmAL7VlqR5kcIgwbjMZ29dzbqtA3bGSL5
   XWXFMZGXcmtka0h/5aKalswSO8guXnefng55puqSy3E1iuktYP7AdpgXx
   SZzCGJrajh3dX34oD87ttcjYdDPgLsbZjTKUMYEcYBO5kZg5s3WOu64sH
   OpGUKo9TvirIgLrxUxVkxcceOMCtEI2Au+f3eoA/8fwrilNIamijS1554
   w==;
X-CSE-ConnectionGUID: mXhMlX6/RqibR2Vy/IgWUQ==
X-CSE-MsgGUID: uUGy3v6IT6eZ8MC1WiSHOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112608425"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112608425"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:41 -0700
X-CSE-ConnectionGUID: 2WToJPD2RHizTD6hLYraww==
X-CSE-MsgGUID: RIZylPOBR/C+aEDxYguG/A==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the mach table
Date: Tue, 15 Sep 2026 21:13:24 +0800
Message-ID: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI may report a ghost SoundWire peripheral. It will cause unexpected
error like duplicated links, codec driver can't probe, etc. This series
check the presence of SoundWire peripherals and skip the non-existing
peripherals.

Though it is a SoundWire feature, but the change is mainly in the ASoC.
Can we go through the ASoC tree?

Bard Liao (3):
  soundwire: allow drivers to check whether the peripheral is present
  soundwire: change sdw_show_ping_status type to int
  ASoC: SOF: Intel: wait and verifies the presence of SoundWire
    peripherals

 drivers/soundwire/bus.c       | 23 +++++++++++++----
 include/linux/soundwire/sdw.h |  7 +++++-
 sound/soc/sof/intel/hda.c     | 47 +++++++++++++++++++++++++++++++++--
 3 files changed, 69 insertions(+), 8 deletions(-)

-- 
2.43.0

