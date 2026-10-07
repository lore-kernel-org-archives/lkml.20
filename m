Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF134AF9E3;
	Wed,  7 Oct 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379711; cv=none; b=VkXLFgRCvKBSONg+LuCOYNGXgZxoUq7wAbdu93e92gofLajXJuqy5IGM9T9BFfVvopjCq0lHOSMJOGKf5gGzArwdS6DKmms5JHvnRoHv3rr/g1f4/pZwi3l5UYVgLHDKEfxBPHtHgMyWxW8XyaQnwSs7OUf+8pqmcM28xD1pjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379711; c=relaxed/simple;
	bh=bQ9d7k+arNuVv3Fe/E0z6PwDaUvuC0+cxdYBBXRaETA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oPmuuwsTETDRs5F2VYO9iht3QuDi4qCzka7sjlLfMCiWm+ghcLsdYngm/P6j//cir8Qgmj5XPWmnDWv159tnvF/y2FzicovRwfwRCer34sjP/MFCHfejbZzqcY9fFafPiQOs4kjoovkmWy5fbiL7J2KcoPzyFrqNQCjJ8JfxdyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl/IMW+Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl/IMW+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379695; x=1822915695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bQ9d7k+arNuVv3Fe/E0z6PwDaUvuC0+cxdYBBXRaETA=;
  b=Fl/IMW+Qv4Jiha/fT/vM9Ef1bpt2fmki2q4N6XdcxhEVsrmsXlEmcW48
   QIxgaZFQnL89UF8RNYVAwtEl+IyUCUjHBH3iQ8crbKF8NomSVjGQAYERw
   LeN+RFkRhFfXWDpeuKZO3zN6FEti0W/NB+m8Fg6wRl43y/I2I5ybGHxgM
   CXCPwfzNA856sTh/ktLhtIKWCLiFG81tBPh6TsNBiYfX17+1kSgSH8quZ
   c3NHMbwjouVX8M2Cf0WZ2KE1R7emuZrfg6UiTXaxVZ/MjdPktjaPX8Z1Q
   xrSyZAhscPYR0lMGIkxsjakwUVZK4dTmJztA7T0QQSK8BO0I8U/fiYMcs
   g==;
X-CSE-ConnectionGUID: v53mleZfQfK3gphJGBTLRQ==
X-CSE-MsgGUID: 0ZlkxQb9Qk2hW8SDrPpYyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242416"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:45 -0700
X-CSE-ConnectionGUID: yPv4o3vkQM2Nu86S+XWHaA==
X-CSE-MsgGUID: U03BKuOzRA2xRApiKrM8cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64302"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:43 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/7] ASoC: Intel: catpt: Switch to snd_snd_component_new()
Date: Wed,  7 Oct 2026 15:33:51 +0200
Message-Id: <20261007133353.455185-6-cezary.rojewski@intel.com>
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
 sound/soc/intel/catpt/pcm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index bbba0d959ea2..ca42bc531c6b 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1073,13 +1073,9 @@ int catpt_register_plat_component(struct catpt_dev *cdev)
 {
 	struct snd_soc_component *component;
 
-	component = snd_soc_component_alloc(cdev->dev);
-	if (!component)
-		return -ENOMEM;
+	component = snd_soc_component_new(cdev->dev, catpt_comp_driver.name, &catpt_comp_driver);
+	if (IS_ERR(component))
+		return PTR_ERR(component);
 
-	snd_soc_component_set_name(component, catpt_comp_driver.name);
-
-	return snd_soc_register_component(component,
-					  &catpt_comp_driver,
-					  dai_drivers, ARRAY_SIZE(dai_drivers));
+	return snd_soc_component_register(component, dai_drivers, ARRAY_SIZE(dai_drivers));
 }
-- 
2.34.1

