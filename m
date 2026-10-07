Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C863914FE;
	Wed,  7 Oct 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379731; cv=none; b=sgquA962ZbujfCGgMBm52tuO2IeJc0TBAgisSL3rUlzQvXkj9eyDqteIR727A2x3P0fH8Tp+MN0VPc1fC6VFiKB2YmGpd2aNW7RP/lDX0tRjziNxBWZJBCrdMWleMhL72v6tA2huraIgo8sg5VMtBnF01sr47/i+UJu1Vw25QSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379731; c=relaxed/simple;
	bh=3GDHlgF3hdF5zlWK7EeqD5ESUv9U59Ugt3ToPYIw8g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPdcgTI0H7B24Ew9Mbm0TwHiGDGuYuPU7qISSLLJQId1DcvGM7KWEoZRhTIMvV/6U2ntCD2IGqOHb0Wo7dxpIEtiaoArYyTD4kxnaWEGvlIJ8fOoEJTH9iIaBAWTIFu1dc6xb7m4SNrg1DGaPESeoyplNlmCIAPZKnlL96TBVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yce44Vc4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yce44Vc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379712; x=1822915712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3GDHlgF3hdF5zlWK7EeqD5ESUv9U59Ugt3ToPYIw8g4=;
  b=Yce44Vc4M7Zs+RNJvI269GqliO5X/nCvu/CnHEUFDwB03ypog5w1sTZ8
   /RHDqgSi9Ek+ZOv8ksJXqSl9xaeK+eRX9ovhZiohYp49JJKi0+VDbiCPW
   aVDtBbw5daqIvkcBT0Rko4JoZsoccgQAriH+9l2c7TZiBQ/lLA7iEZQqP
   31lx5h+I5qYA6e2/kw7/glpL8X/ubyRT8fmIlBuKa3eA2BxrfBu6hgtzT
   YAPXGbcNOyH14zZSKlSXBuf2zMxWzKN0tIHlWdvLpl6IMpWdAKbTKYbPs
   pgxZx8nD794CJdg4IzGIu8QMbKh5mC8kZxDOdYdKGGKpoEW3RQja/Wir9
   Q==;
X-CSE-ConnectionGUID: eHhiW5zETFiOiyxAhlwYEw==
X-CSE-MsgGUID: q4G0p9YFTOaaoMZKAuBk+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242422"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:47 -0700
X-CSE-ConnectionGUID: EUxqhdZmT1enUnQ2o11CnA==
X-CSE-MsgGUID: vOsZ70PtQMudN5uPSUrUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64309"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/7] ASoC: Intel: avs: Switch to snd_snd_component_new()
Date: Wed,  7 Oct 2026 15:33:52 +0200
Message-Id: <20261007133353.455185-7-cezary.rojewski@intel.com>
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

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c    | 11 +++++------
 sound/soc/intel/avs/probes.c | 12 ++++--------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2d7ced953fde..6dd2b938baaa 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1399,10 +1399,6 @@ int avs_register_component(struct device *dev, const char *name,
 	if (!acomp)
 		return -ENOMEM;
 
-	acomp->base = snd_soc_component_alloc(dev);
-	if (!acomp->base)
-		return -ENOMEM;
-
 	comp_name = devm_kstrdup(dev, name, GFP_KERNEL);
 	if (!comp_name)
 		return -ENOMEM;
@@ -1411,10 +1407,13 @@ int avs_register_component(struct device *dev, const char *name,
 
 	drv->use_dai_pcm_id = !obsolete_card_names;
 
-	snd_soc_component_set_name(acomp->base, comp_name);
+	acomp->base = snd_soc_component_new(dev, comp_name, drv);
+	if (IS_ERR(acomp->base))
+		return PTR_ERR(acomp->base);
+
 	snd_soc_component_set_priv(acomp->base, acomp);
 
-	return snd_soc_register_component(acomp->base, drv, cpu_dais, num_cpu_dais);
+	return snd_soc_component_register(acomp->base, cpu_dais, num_cpu_dais);
 }
 
 static struct snd_soc_dai_driver dmic_cpu_dais[] = {
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 2e4063b743ba..483e151dfd66 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -298,17 +298,13 @@ int avs_register_probe_component(struct avs_dev *adev, const char *name)
 	struct snd_soc_component *component;
 	const char *comp_name;
 
-	component = snd_soc_component_alloc(adev->dev);
-	if (!component)
-		return -ENOMEM;
-
 	comp_name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
 	if (!comp_name)
 		return -ENOMEM;
 
-	snd_soc_component_set_name(component, comp_name);
+	component = snd_soc_component_new(adev->dev, comp_name, &avs_probe_component_driver);
+	if (IS_ERR(component))
+		return PTR_ERR(component);
 
-	return snd_soc_register_component(component,
-					  &avs_probe_component_driver,
-					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	return snd_soc_component_register(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.34.1

