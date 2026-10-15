Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1785568FB3;
	Thu, 15 Oct 2026 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090540; cv=none; b=TMFaaDyuYJnvb1YsImwy6Q85sfVrIcUr8w2jiXeXEvAJLOaRmPIR7BQs8kS6mEZOXf5QTCfNMy8G5TXHd2RxQEZdYnyWGOH9e4tUNAJlPP7yOmtNECe3k7npZT6tqhp0PytSU8rCxr44Z7/WOjVOd17iM/z1uzh0RLDb6d9W6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090540; c=relaxed/simple;
	bh=cbmGhbtKpv1gaoLM5Ui024oSq91uMa/GRcRggwQYUtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nQXFy5Gw+Efu+X5GdSV51x42RSLdv0Gg/AD19TNayH+otqXCXnubhdy1PmQG+ypeD9Vt2XubNKyY+4PlVhXy1SYHjt/KUOEdnNCkrAIlcswUyHPf6SAsvO/D9opSfolVN6C+RAUX7OEYFNXfc5zlHWEMtVvGwJJgF0d9luSzvag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frSvwZ73; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frSvwZ73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792090538; x=1823626538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cbmGhbtKpv1gaoLM5Ui024oSq91uMa/GRcRggwQYUtk=;
  b=frSvwZ73Q16n0wvD/Fr4IdRiA38sKIiSEFREUUkg8QL1KTqyaxkBtDxC
   yaAKZ8JqjLq09O35BFXE4AzJ3kM+XedE13Ciq/OwqyiatzI6wmTPS1cYb
   6Ns98hn5C6aAKwB1M4WHmwwTAkGcDoI2f9+t/CHtNUNnNEFPYRaavhM9b
   RTicZLrICPOOC595MTxK8Sl9pg5nuPTTOlZDZq2RO8zO9HyjvUlVDueZV
   WNPLZ556sRCK/rJ/Hwr63Z+FWJHbgupAtdtQ+498ZjgZwFkA0bdtl6Ied
   AiCjhfpdKNMK21RZFskUuSy5//MSLld+i/jOttTNgFa2Q+daIq9DQsqub
   Q==;
X-CSE-ConnectionGUID: TormF6YuRaOfA0NQFkB+8A==
X-CSE-MsgGUID: bqoHpssNRQGd0g5hMlYXkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="764312"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="764312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 11:55:37 -0700
X-CSE-ConnectionGUID: 7atxUFwFQii/+i+8q9ixdw==
X-CSE-MsgGUID: vuadB4tZQfG5eVXmwMOSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1742201"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 11:55:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ASoC: Intel: avs: Unprepare a stream when recovery occurs
Date: Thu, 15 Oct 2026 21:02:38 +0200
Message-Id: <20261015190240.729793-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015190240.729793-1-cezary.rojewski@intel.com>
References: <20261015190240.729793-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recovery on alsa-lib side is handled with either:
1) snd_pcm_prepare(state=XRUN)
2) snd_pcm_drop/drain() -> snd_pcm_prepare(state=SETUP)

before starting the PCM anew. Relying solely on state=XRUN leaves 2)
unaccounted for. sound/core/pcm_native.c ensures correctness of the
state machine so plain state!=PREPARED check suffices.

This is the BE equivalent of job done previously for FE side only with
commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN
occurs") and its follow up titled: ("ASoC: Intel: avs: Reset the stream
unless it is already prepared").

Link: https://lore.kernel.org/linux-sound/20261010103753.16969-1-stiraspo@gmail.com/T/
Fixes: d070002a20fc ("ASoC: Intel: avs: HDA PCM BE operations")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 3cf455e8b879..a0a0d645ea33 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -461,6 +461,8 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	link_stream = data->link_stream;
 	p = &be->dpcm[substream->stream].hw_params;
 
+	if (substream->runtime->state != SNDRV_PCM_STATE_PREPARED)
+		link_stream->link_prepared = false;
 	if (link_stream->link_prepared)
 		return 0;
 
-- 
2.34.1

