Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E84455C334;
	Thu, 15 Oct 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090524; cv=none; b=qB8qwsN45gDpjmodf5Qr6BS8CHeFG2vZ1611+zcA++MUmnDeX/RyfyOR9nUVerM69ucwfBbsHyMm5951V+i1Rq58IgotcXq/0pHXXM5MGuewu6glPDDmT1mRIXyuuN394ABYhmTG1mr96FJIbalQYcgp9DppAfyK12kviaS5tI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090524; c=relaxed/simple;
	bh=ZVk6gLLI8AxZG0qeUX3TjmvhAoXDOYp/KHnGOlzHNOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hBwX8P7PZ1Od/e8jXsPXQuE7CEXo0HZLIjNg9DMmhlfWPmnxAlNI03FqHuxK1BgKTrDeCtmNUnxkmhSE9z3JyWjY6PAo9R73+GDcrDhiE5XjyD0PISkzlClduDi5OP6WqPzHJ4Fj0SPAKFHqET4f3wirfakaLZtw+9sZCKTSzvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwB+h7vq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwB+h7vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792090520; x=1823626520;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZVk6gLLI8AxZG0qeUX3TjmvhAoXDOYp/KHnGOlzHNOw=;
  b=HwB+h7vqjNarv8fri4ZPyGlpRVFYhm9QXCC/JBh501g6VFMKYtcCb3uT
   wVlc/XaRrH8DiRsg5B/qCxxyTAKDrVvxoWM8n0se0ew9F/IRCToObGFxr
   90UqpjAUlupVNBgNhNn4Hn/gtMNNmX6oEg3FC/Zi9jZ37uHRDan1fSVY7
   LZjLwXyIyJUIVtB13K2i8EzrAi6Ol/KazrkK5gtm61lqJ0GpHVbs5FY2E
   oiEHOTGk2KicG9CueuHEokIk4ZLzrZ3fJvX5RaT33Z6AejqFbshLHxG2a
   Dax12NKSQ3x5gjCm3MfY/83hxU6gA0TbrMHuDyUa3NkwA6PjiU0UuJUax
   Q==;
X-CSE-ConnectionGUID: g/CmumF5R/G5FhMvi+F89g==
X-CSE-MsgGUID: B5VExETTRKiDy6ou9Tc0Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="764271"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="764271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 11:55:18 -0700
X-CSE-ConnectionGUID: G1CefiNXSVy0Qpm6a4BB1Q==
X-CSE-MsgGUID: 6jSX7SvOQ6mhBwRG1aSBxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1742118"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 11:55:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 0/3] ASoC: Intel: avs: Fix for recovery procedure and new size-checks
Date: Thu, 15 Oct 2026 21:02:37 +0200
Message-Id: <20261015190240.729793-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first change addresses XRUN recovery for HDA-Link i.e.: BackEnd
side of a HDAudio stream.

It is the BE side equivalent of job done previously for FE side only
with commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when
XRUN occurs") and its follow up titled: ("ASoC: Intel: avs: Reset the
stream unless it is already prepared") [1].

The next fix problems found by static analyzers. Additional size checks
for topology and a fix for module underflow should a DSP-module be
unloaded on the DSP side in unexpected fashion. Theoretically that's not
possible without a corrupted firmware, but the if-statement is already
there, just a dev_warn() though.

[1]: https://lore.kernel.org/linux-sound/20261010103753.16969-1-stiraspo@gmail.com/


Cezary Rojewski (3):
  ASoC: Intel: avs: Unprepare a stream when recovery occurs
  ASoC: Intel: avs: Verify sizes of configs coming from topology
  ASoC: Intel: avs: Prevent module info underflow

 sound/soc/intel/avs/pcm.c      | 2 ++
 sound/soc/intel/avs/topology.c | 6 ++++++
 sound/soc/intel/avs/utils.c    | 6 ++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1

