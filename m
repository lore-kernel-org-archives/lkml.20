Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0804AB1B2;
	Wed,  7 Oct 2026 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379692; cv=none; b=UAVJXpAvBjgrYxLlnWg99Ro/C61DlrUZdgzBhes8z5nHAOZZIe3/gd/rQwZCamMF2BZG0FKdT1J4mGWNpKUodr8/ZOqv2nWxDRlQrxW/KKtW92/bhoYGJEKhQQcZiHx70q5r8bLJTBlZOVPIC3qKDmvW0VF2zdG21ehwZhz+qYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379692; c=relaxed/simple;
	bh=AYcdg9YA3/cv8sdA+Bzkvao6+FKYL1mFyn5VXHU9WrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AM3+7QiJP7ndzwMsSgjKc3IIK0HHDyCk3Fxij05Pj3wzL8591S4InWqpF7Exk+j7EfAkjT7uyrSHECpjfLN4pGJkY2Jzp6LkQY8B0NFEzfdepUz9mOhXCe++BN1rTd7M0/kD6sHMKE0SbAU3pHMpJLO+3Uqj7UUqHzqR0p6tQnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/dLDQdo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/dLDQdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379675; x=1822915675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AYcdg9YA3/cv8sdA+Bzkvao6+FKYL1mFyn5VXHU9WrQ=;
  b=e/dLDQdo3BNqfrEzz3O63EhR3pjWFpvYL7MyCdH3sX09zIiL9bjmz4rQ
   5J8Bn1/UDm1vVM7I22/vIsfd0L7IKsoqSUF/wsX/5GcVlyGRd9wUg34HK
   feWbQBO0l9tb0HErklVO/sH2xGPvSiUBPVOBRNZAr881dTVCEyTPM1Z+a
   ng+KfpEhKMRxM9UQkr+8hiUZdD7bm0qS5rYPx+5p/qUPs+4Mc9y58mxaw
   5RIKfeGYZtVVMNwnvJBiZT6Y4Q7pKXK+fih+LteWONEtNT+u1zSReRUaL
   pWEvLCiGyLIGqt5kpD80wRfEd2gy0e6ZiFi86Okc89yYDrE9nWiufMJ0I
   Q==;
X-CSE-ConnectionGUID: hhtbWKx/S5WWdhVKwzo5GQ==
X-CSE-MsgGUID: yNNkvsAETCa5uq0s4fs0eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242396"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:39 -0700
X-CSE-ConnectionGUID: /RypGFJXRIe4XXBQqasx/g==
X-CSE-MsgGUID: bKGWR2m1QLanqhCBY79D9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64283"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/7] ASoC: core: Rename and export soc_component_add()
Date: Wed,  7 Oct 2026 15:33:48 +0200
Message-Id: <20261007133353.455185-3-cezary.rojewski@intel.com>
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

To keep the register/unregister pattern intact, rename to the function
before exporting it. This concludes the registration update, leaving the
following two options available to the callers:

	1) snd_soc_component_register(component..)
	2) snd_soc_register_component(dev..)

A driver uses 1) when attempting to register a pre-constructed
component object explicitly and 2) when they want the ASoC framework to
do the entire job for them.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-core.c          | 11 ++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d51f71e2f334..f4d4f836269e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -294,6 +294,9 @@ static inline int snd_soc_component_cache_sync(
 
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
+int snd_soc_component_register(struct snd_soc_component *component,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai);
 struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 
 void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c4de336ab408..93bc7fa32444 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2625,9 +2625,9 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_new);
 
-static int soc_component_add(struct snd_soc_component *component,
-			     struct snd_soc_dai_driver *dai_drv,
-			     int num_dai)
+int snd_soc_component_register(struct snd_soc_component *component,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
 {
 	struct snd_soc_card *card, *c;
 	int ret;
@@ -2666,6 +2666,7 @@ static int soc_component_add(struct snd_soc_component *component,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_component_register);
 
 int snd_soc_register_component_c(struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
@@ -2678,7 +2679,7 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
-	return soc_component_add(component, dai_drv, num_dai);
+	return snd_soc_component_register(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
 
@@ -2693,7 +2694,7 @@ int snd_soc_register_component_d(struct device *dev,
 	if (IS_ERR(component))
 		return PTR_ERR(component);
 
-	return soc_component_add(component, dai_drv, num_dai);
+	return snd_soc_component_register(component, dai_drv, num_dai);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_component_d);
 
-- 
2.34.1

