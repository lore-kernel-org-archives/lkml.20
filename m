Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C3839DBCF;
	Wed,  7 Oct 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379717; cv=none; b=QbdWdITgIHUHB9dxCYQakSavKm3Y0eMLyDf3REvq49jFMyqREwDSBxp/L+eW1+0I73w8s91bxxQP032lh8jaAUo/a9Tt+YKjznRevoU+o3mBRvRsS1x2MiWkHI+ULZVBDn0BclABs2XvGar/u3kCbFooQKraiHbIfdWgaDLyDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379717; c=relaxed/simple;
	bh=zzqveDGgx7h9pGKMSFFvcQUQ6pbn2oho4PeO5D0tOWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OEkoWctv58/poetjBTRRAfAQ1xtucH+boxzb8IfZ3Zjt6LWa7yj7j0c0x4dOeTkXec9mzVDTVxm1Vhn6+8nTfglZqetDJDiuYaesA79sHkAY5TneHxfScphigXMGYcU3zyeRCqGY035hSFdxDhMfpYE7PdJuIKIRHXM1RyZGglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv5dezTO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv5dezTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379692; x=1822915692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zzqveDGgx7h9pGKMSFFvcQUQ6pbn2oho4PeO5D0tOWc=;
  b=Fv5dezTO3NXhEvO26TNiPviKIxCEyMMPNS9wqjaGeJDSjN6zsnxDK+Qu
   utswjY29zBXoDRehhckitmOjMjfFQ6aCMTgnaHN5cIip2l07uE5dMOCho
   LvXYVEPoq9TzcMo+Nw17M6hGSioxkmN+XH/gGnMpRfOmzuanfTuk+o6Bd
   wCX49MVOU8JvFQAhipzW1dtW0aws11XXChvSOghE8mHPP+q3+umIg8iXN
   Gq/FVRCVrkVnUwX+lv/BUba1JSYqLAGllkyYPmD4ehPDsPDoJ6FRU3Obf
   JKHd8kbkbQlJ4VPk0xRBAFu8kS+MrpJUVeKFiQNy1pqFJPBdTNoY/zqPY
   g==;
X-CSE-ConnectionGUID: eLFlC0RuThaOkJVRtdu4fw==
X-CSE-MsgGUID: AEQh32YAQwSMNVd8GvaSqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242403"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:40 -0700
X-CSE-ConnectionGUID: n6R1V/fOQty15koL7cjPKQ==
X-CSE-MsgGUID: +kp08MOsScG6rXJrUZZaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64290"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/7] ASoC: dmaengine: Switch to snd_snd_component_new()
Date: Wed,  7 Oct 2026 15:33:49 +0200
Message-Id: <20261007133353.455185-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007133353.455185-1-cezary.rojewski@intel.com>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_soc_component_alloc() leaves the component object in uninitialized
state. Switch to the constructor function to retrieve and operate on
object in sane state.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f6206ecaf26f..d750dc44981d 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -454,10 +454,6 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	struct dmaengine_pcm *pcm;
 	int ret;
 
-	component = snd_soc_component_alloc(dev);
-	if (!component)
-		return -ENOMEM;
-
 	pcm = kzalloc_obj(*pcm);
 	if (!pcm)
 		return -ENOMEM;
@@ -467,10 +463,6 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	pcm->config = config;
 	pcm->flags = flags;
 
-	if (config->name)
-		snd_soc_component_set_name(component, config->name);
-	snd_soc_component_set_priv(component, pcm);
-
 	ret = dmaengine_pcm_request_chan_of(pcm, dev, config);
 	if (ret)
 		goto err_free_dma;
@@ -480,7 +472,15 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	else
 		driver = &dmaengine_pcm_component;
 
-	ret = snd_soc_register_component(component, driver, NULL, 0);
+	component = snd_soc_component_new(dev, config->name, driver);
+	if (IS_ERR(component)) {
+		ret = PTR_ERR(component);
+		goto err_free_dma;
+	}
+
+	snd_soc_component_set_priv(component, pcm);
+
+	ret = snd_soc_component_register(component, NULL, 0);
 	if (ret)
 		goto err_free_dma;
 
-- 
2.34.1

