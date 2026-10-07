Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1264B0E48;
	Wed,  7 Oct 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379736; cv=none; b=pgcABaQTOUe19kT/o2wu6mW0NCScqLcAoEjRT0f9YMkf4m4V2CjHqwfkp4Zvwr/y4mJk8yeifxcChsoYq6on8Gy7UMpW1A88fxKhKrkjIZiRz2B6flAZDXdQ+xLR/fIGby+k/dDqNG/Zm4H22CvPto8zuquHYfNowOw4VgwH5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379736; c=relaxed/simple;
	bh=DFEJsFns0bljZn9HO22/k4JjjqcDhHnDPmz6Bu6tVfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nHJpCOgjZIveVliOsfBJoCVeXjQPNtpu98Dx5iF+5jru9WzPEXYknqWNwBUjpHWYgoSjAkwJ2G9rx675f6z0f7L63qOW+LEbzXxh6jf/pEp4g0EGUWL2brMsNlIfXmpCVMnkwyXq10kOpXRQKaf2ZtQrm+Q1tX0LOf7On4H8CPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnxnRVzs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnxnRVzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379714; x=1822915714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFEJsFns0bljZn9HO22/k4JjjqcDhHnDPmz6Bu6tVfo=;
  b=LnxnRVzsZ7713L+8OMH2S10au9sS9BBCQkIsLZz0y7zsePU5t9EooEe+
   C84p0yw8+B+6rxIXtasLcaCfnFq4tJNgzgDBg2njH2JV9ZF/eC9b84feA
   Ve1RO2m9P+X+mbpDswW19aBJ+5Xt2CA9/nNGTRQp+gOBdcZY8xr/FLONw
   VAZ65INixqHsoI4juhbOUcED5FNLmmmij10tzTh5cslCddWk6JJy3nm4d
   zb1xNQhIDHdvFwTeqcuvk3b1xvqeSL9jOwE1ULB9LGuwlUaOWguBmqcLX
   CbyV1fKb3kl9pmzseIUiLQyDRkrrCP+1YSWl5dAo8kSOtndKlG3eBzusY
   g==;
X-CSE-ConnectionGUID: c+ABJik5QkKfOCe2rZX5fA==
X-CSE-MsgGUID: +HuWDPabR9WdN4bjw0N7HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242429"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:48 -0700
X-CSE-ConnectionGUID: oWJ1MDNJTbWnw94iTQSKDA==
X-CSE-MsgGUID: 64UiknF2QIGMuDVzfxldyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64314"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 7/7] ASoC: core: Remove unused component-register members
Date: Wed,  7 Oct 2026 15:33:53 +0200
Message-Id: <20261007133353.455185-8-cezary.rojewski@intel.com>
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

With the new component constructor, functions snd_soc_component_alloc(),
snd_soc_component_set_name() and soc_component_initialize() become
unused. Remove them and drop the generic macro as there is only one
snd_soc_register_component() function.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  2 --
 include/sound/soc.h           |  8 +-----
 sound/soc/soc-component.c     | 19 ------------
 sound/soc/soc-core.c          | 54 ++++-------------------------------
 4 files changed, 6 insertions(+), 77 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index f4d4f836269e..ac5e9412582e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -297,9 +297,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai);
-struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
 
-void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
 const char *snd_soc_component_name(struct snd_soc_component *component);
 
 void snd_soc_component_set_priv(struct snd_soc_component *component, void *priv);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..08fdee15dba7 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,15 +447,9 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_register_component_c(struct snd_soc_component *component,
-			 const struct snd_soc_component_driver *component_driver,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-int snd_soc_register_component_d(struct device *dev,
+int snd_soc_register_component(struct device *dev,
 			       const struct snd_soc_component_driver *component_driver,
 			       struct snd_soc_dai_driver *dai_drv, int num_dai);
-#define snd_soc_register_component(x, ...) _Generic((x),		\
-struct device * :		snd_soc_register_component_d, \
-struct snd_soc_component * :	snd_soc_register_component_c)(x, __VA_ARGS__)
 
 int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 463ea227cac8..34efb270ce29 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -29,25 +29,6 @@ static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
 			   func, component->name, reg);
 }
 
-struct snd_soc_component *snd_soc_component_alloc(struct device *dev)
-{
-	struct snd_soc_component *component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
-
-	if (!component)
-		return NULL;
-
-	component->dev = dev;
-
-	return component;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
-
-void snd_soc_component_set_name(struct snd_soc_component *component, const char *name)
-{
-	component->name = name;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_set_name);
-
 const char *snd_soc_component_name(struct snd_soc_component *component)
 {
 	return component->name;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 93bc7fa32444..69181cc0258b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2560,35 +2560,6 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
-static int soc_component_initialize(struct snd_soc_component *component,
-				    const struct snd_soc_component_driver *driver)
-{
-	struct device *dev = component->dev;
-
-	component->dapm = snd_soc_dapm_alloc(dev);
-	if (!component->dapm)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&component->dai_list);
-	INIT_LIST_HEAD(&component->dobj_list);
-	INIT_LIST_HEAD(&component->card_list);
-	INIT_LIST_HEAD(&component->list);
-	INIT_LIST_HEAD(&component->card_aux_list);
-	mutex_init(&component->io_mutex);
-
-	if (!component->name) {
-		component->name = snd_soc_fmt_single_name(dev, NULL);
-		if (!component->name) {
-			dev_err(dev, "ASoC: Failed to allocate name\n");
-			return -ENOMEM;
-		}
-	}
-
-	component->driver	= driver;
-
-	return 0;
-}
-
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver)
 {
@@ -2668,25 +2639,10 @@ int snd_soc_component_register(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_register);
 
-int snd_soc_register_component_c(struct snd_soc_component *component,
-			const struct snd_soc_component_driver *component_driver,
-			struct snd_soc_dai_driver *dai_drv,
-			int num_dai)
-{
-	int ret;
-
-	ret = soc_component_initialize(component, component_driver);
-	if (ret < 0)
-		return ret;
-
-	return snd_soc_component_register(component, dai_drv, num_dai);
-}
-EXPORT_SYMBOL_GPL(snd_soc_register_component_c);
-
-int snd_soc_register_component_d(struct device *dev,
-				 const struct snd_soc_component_driver *component_driver,
-				 struct snd_soc_dai_driver *dai_drv,
-				 int num_dai)
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
 {
 	struct snd_soc_component *component;
 
@@ -2696,7 +2652,7 @@ int snd_soc_register_component_d(struct device *dev,
 
 	return snd_soc_component_register(component, dai_drv, num_dai);
 }
-EXPORT_SYMBOL_GPL(snd_soc_register_component_d);
+EXPORT_SYMBOL_GPL(snd_soc_register_component);
 
 /**
  * snd_soc_unregister_component_by_driver - Unregister component using a given driver
-- 
2.34.1

