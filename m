Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ECE38758D;
	Wed,  7 Oct 2026 13:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379694; cv=none; b=rINCI5TEjugYAP6TUgSJFk5xNTQvASMRPlcNF3RvfQ7CKy+hgvryj/HLmMiwm4zTe3mJccHWPqzNeI59XSl6Q9iqp+jCRoijQR+tlzFysRCh76c+3FkZS91Y9bu/s3LYH5H4qnBv+QfrJnMu8HmPkMmZqQtLzu9heKDmQBdTYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379694; c=relaxed/simple;
	bh=41r0ag+pCJdqcVRBDBLAtjEi4sWfPj7OMiQLiZzuqag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y02kWanTgnIVGV7HrHCh/dQiJDzcjI14WXjVwZ91mpaqnJ1eegVmTKS/2/kfr7FZQ55mw13d/DEMTmgP9VG9/Tc6XNoaaQFk+zuGxQFcOusEcMZM5k2oxdWC1DstE/RawRqejEt+eoDi/SDizyFbqUiCRrjLLTubsdnjAWfYhAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO+EBx9z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO+EBx9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379675; x=1822915675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=41r0ag+pCJdqcVRBDBLAtjEi4sWfPj7OMiQLiZzuqag=;
  b=hO+EBx9zhO9LoScPms89FBPDMzkfxxusf+G+qlrwfO4KsfikfF6HG7p8
   WJZJyR2OqiU5NYqsf8xADnvZiqV+Wm0bV3sMwqAsjqQo5RKFcpTPMZPAj
   PS7BNuhr7jG8PgEequN4AupYYGDSP62MwnFis3DxIXHsrlwUmEg0WWl7m
   /qDYUcJRHf0FGIBlfN+gq/sTUuTQuqVj3XqeeWAXMVKhSNuFxwTwVw1ZT
   SxBxhB7VX1hA0BcIPdlC6me9gQWrtpzQw9KmW8TXIYNp/pP9OUc4kal4q
   sl3jzuaOruXk0n5VWT5qkcbpPyCxT9LpX/NSAiazUNjS09HcrCKu5inRK
   Q==;
X-CSE-ConnectionGUID: AuY5N65hRHa0tVsEXcuwlA==
X-CSE-MsgGUID: 9Xlj+FraReSg+FaLveTYFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242390"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242390"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:37 -0700
X-CSE-ConnectionGUID: +r1zbngJTgqrcfvUWCw7Tg==
X-CSE-MsgGUID: MvEAUKAbQGeUomLp1Ll3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64277"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/7] ASoC: core: Add component constructor
Date: Wed,  7 Oct 2026 15:33:47 +0200
Message-Id: <20261007133353.455185-2-cezary.rojewski@intel.com>
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

There is a gap between snd_soc_component_alloc() and
snd_soc_register_component(). A driver that obtains a component object
through snd_soc_component_alloc() receives an object in uninitialized
state. soc_component_initialize() is the function responsible for
bringing it into a sane one but it is not accessible by the framework
users.

The framework shall prevent manipulation of uninitialized components.
Introduce snd_soc_component_new() which acts as a constructor: allocates
and initializes the component object before returning it to the caller.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-core.c          | 44 +++++++++++++++++++++++++++++++----
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 6c1acc984ecb..d51f71e2f334 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -292,6 +292,8 @@ static inline int snd_soc_component_cache_sync(
 	return regcache_sync(component->regmap);
 }
 
+struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
+						const struct snd_soc_component_driver *driver);
 struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 
 void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a198591..c4de336ab408 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2589,6 +2589,42 @@ static int soc_component_initialize(struct snd_soc_component *component,
 	return 0;
 }
 
+struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
+						const struct snd_soc_component_driver *driver)
+{
+	struct snd_soc_component *component;
+
+	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return ERR_PTR(-ENOMEM);
+
+	component->dapm = snd_soc_dapm_alloc(dev);
+	if (!component->dapm)
+		return ERR_PTR(-ENOMEM);
+
+	if (!name) {
+		name = snd_soc_fmt_single_name(dev, NULL);
+		if (!name) {
+			dev_err(dev, "ASoC: Failed to allocate name\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	component->dev = dev;
+	component->name = name;
+	component->driver = driver;
+
+	INIT_LIST_HEAD(&component->dai_list);
+	INIT_LIST_HEAD(&component->dobj_list);
+	INIT_LIST_HEAD(&component->card_list);
+	INIT_LIST_HEAD(&component->list);
+	INIT_LIST_HEAD(&component->card_aux_list);
+	mutex_init(&component->io_mutex);
+
+	return component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_new);
+
 static int soc_component_add(struct snd_soc_component *component,
 			     struct snd_soc_dai_driver *dai_drv,
 			     int num_dai)
@@ -2653,11 +2689,11 @@ int snd_soc_register_component_d(struct device *dev,
 {
 	struct snd_soc_component *component;
 
-	component = snd_soc_component_alloc(dev);
-	if (!component)
-		return -ENOMEM;
+	component = snd_soc_component_new(dev, NULL, component_driver);
+	if (IS_ERR(component))
+		return PTR_ERR(component);
 
-	return snd_soc_register_component_c(component, component_driver, dai_drv, num_dai);
+	return soc_component_add(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_d);
 
-- 
2.34.1

