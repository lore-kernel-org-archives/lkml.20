Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F74563280;
	Thu, 15 Oct 2026 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090544; cv=none; b=Mb2O2T/IFNcyM/VjNEfxEckezasdl/Us2O3LPWDZnfev2RwNDjK7a4xYmAbNePRwbHiTS8L70LIqqE7KjBfNmYGRyzI39raaOePnbhi7a1rS1XuHTcOQDDNbOJUBQnYZ1cQ9MUcBc6yDT0lGVY8W3I7SSZfqefs9gb88plDCWYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090544; c=relaxed/simple;
	bh=XWCUS0e+e5W0dUSXQA++xYnQb7HpJP7/AEysPBbn54c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ansncPQJY1xcQY0ZOS8jwyXDqnUiWXFPIcZi2XDjp+HgiEK2wNKIw0MlZgmaUxAxN32hhBTrQ+qIiq2dQdahDzcSPMkk/LvIB8SxyTabYCOb+WBWRkip1zSzGKVL3SxTQr8G3pqpVXJ8VN+BwvY8CoJ2VjsaHaidI7xRPf6zgyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaamRYG8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaamRYG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792090539; x=1823626539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWCUS0e+e5W0dUSXQA++xYnQb7HpJP7/AEysPBbn54c=;
  b=YaamRYG8MJOhB9/eGu/ExMYo5uMQCjSmbOc6hkDSAe96zi+3doyANXrQ
   OBB70qSoQ+bMwfpYD6J9kbEESgSCqrhDhosg7wh3LTtHhstfFVHsX5RTx
   1qDBJC9PUK63uO2CshTylUuZ/hePET+wcHInhdC7guKU+UwKsK+ncNQSN
   PjK7TcFmUcvogbAv4OkKqJXmWkEXpGam5qNLuKVmdvob6IbfYAKjpQpJq
   7cGwDsadUVg5yoa/W1y5MBbyrybf0bc/zqLwuUyvAnx7BxWDelpm9k3c4
   7d773Ggb+HRSwcnH1kiZxl+KUku51WOPvzhichSRn/g9NkRGA8trLxkQs
   Q==;
X-CSE-ConnectionGUID: /fl7b9vvQtGWb9xrrHPWUA==
X-CSE-MsgGUID: A0KtviSZSdiQ3ERayX4JVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="764318"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="764318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 11:55:38 -0700
X-CSE-ConnectionGUID: os8SnSbjSa+KFTCD99xu4w==
X-CSE-MsgGUID: iNzSGbIMSDa8AQrPFJRWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1742213"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 11:55:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/3] ASoC: Intel: avs: Verify sizes of configs coming from topology
Date: Thu, 15 Oct 2026 21:02:39 +0200
Message-Id: <20261015190240.729793-3-cezary.rojewski@intel.com>
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

Before operating on the init_config or NHLT-blob entries check whether
their sizes are within bounds of the block being parsed.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 1085090d5a9c..e81401bb6dbd 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1720,6 +1720,10 @@ static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 					       AVS_TKN_INIT_CONFIG_ID_U32,
 					       mod_init_config_parsers,
 					       ARRAY_SIZE(mod_init_config_parsers));
+		if (ret)
+			return ret;
+		if (config->length > block_size)
+			return -EINVAL;
 
 		block_size -= esize;
 
@@ -1790,6 +1794,8 @@ static int avs_tplg_parse_nhlt_configs(struct snd_soc_component *comp,
 		/* With tuples parsed, the blob shall be allocated. */
 		if (!config->blob)
 			return -EINVAL;
+		if (config->blob->capabilities_size > block_size)
+			return -EINVAL;
 
 		/* Consume the raw data and move to the next entry. */
 		memcpy(config->blob->capabilities, (u8 *)tuples + esize,
-- 
2.34.1

