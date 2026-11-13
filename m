Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583929;
	b=DNF9z5C8PvIfwroQXkTt7KMALAr1Lu0CZeQtxfZbChW0uFVFetLW7IBHjK8Y/DhGg5NO
	 46YqqTzX2qOy226kZku0stywt805MIkcEpgZkU6O+caFop6ZdZoE4P5HqIzvUuBJK+o3N
	 IozzR3jS29uuYo3FmAo8aXtByQCklkMZP0O+s5sGDFcF3kcrG4MTbRIQMbfuV6cJciKWF
	 xIVZqJwq91p8OzgoWxkRvU1uxMfSBduTxB6/jP8nAbc61lmFYtdqMUPz9SnWaPde/PDF5
	 xSOZlg7Sr70Pf4Yzo43uFREY5EDPZ7eSAelIdyx5FFikjFHY6IZlDE6pAume2wCZ1Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583929;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=SbPuNQ4elSJHHzxTWuBsK8sxzOVItZdNtr4rk1uSmYI=;
	b=Hg+mAdJfQkImNfATB1qq14zh7j05qx+4Eg4W639/AP851e1BWWwqkLOAr/3M0iAfbmRx
	 Cb8G/ChSk8YfGdRfq3gTMb1Uu0SwikNd39e7zbwwsvjvfC9O603cUObkMaw1dDPnL0IsP
	 s2zlbelDKMAFtQRdvQHtiFJhKLkqLTfMIOGMRlsJI7UjdBt8EFW6yjcTRTRXjWKzUOz2b
	 O2Bbfa/ECK1AsnJNrPv92m1lTTU9LOGgLXirGsdOTUbgvk2ca2xRrA5gHydeSxGAKkMA9
	 RTabfxPkaL8I4YipERZVcLHR78QCsFUiLoR3Vc02+XJqS8VbaW9/V5QvI8Ywr2Vg4iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwADBM2W;
	arc=none smtp.remote-ip=95.215.58.4
Received: from mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0E4606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwADBM2W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6jgy9UJKIBreFrmHieIU9cNhMtUqrChMDcvSwpvJhzU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583926; v=1; x=1795188726;
 b=DwADBM2W85xofGz0+zRCBkVCL4PhSmgd/OsfUhiePaR83t1UGKkCTIJ0F7o/C6QVXfDuKTlV
 w2rN7FX3K0OgDwpxYY77RjKggiGIJxVJSZo7FF1adewFsyDcIYTsm5pO7X/RK/7Al6F3MQmqjs+
 WqBgvhPrAim6UeGbdMW1QFh8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 19fdf752ab5d448d;
	Fri, 13 Nov 2026 15:32:06 +0000
X-Mizu-Trace-ID: 19fdf752ab5d448d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:49 +0800
Subject: [PATCH v2 01/10] regmap: fix reinit cache failure handling
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-regmap-improve-v2-1-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

regmap_reinit_cache() tears down the existing cache and then updates the
map configuration. regcache_exit() frees reg_defaults_raw when cache_free
is set but does not clear cache_free or the pointer, and neither
regmap_set_name() nor regcache_init() resets map->cache_type on failure.
The old cache_ops pointer also remains set when reinitialising to
REGCACHE_NONE.

If the reinitialisation then fails, a later regmap_exit() calls
regcache_exit() again. It frees reg_defaults_raw a second time and runs
cache_ops->exit() on the already torn-down cache. A stale cache_ops can
also make regmap_volatile() treat registers as cacheable on a map that
has no cache.

Clear cache_free and reg_defaults_raw in regcache_hw_exit(), and clear
the old cache_ops right after regcache_exit() so a reinitialisation to
REGCACHE_NONE cannot leave stale ops behind. Mark the map as having no
cache when regmap_reinit_cache() fails after tearing down the old one.
Assign the new cache type only after regmap_set_name() has succeeded so
the failure paths cannot leave a type without cache ops.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-5693609c-7965-4f36-ae8f-30c610e10a33
Fixes: bf315173359b ("regmap: Allow drivers to reinitialise the register cache at runtime")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c |  8 ++++++--
 drivers/base/regmap/regmap.c   | 12 +++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 1447967ff00b..2954e73180ed 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -122,8 +122,11 @@ static int regcache_hw_init(struct regmap *map, int count)
 
 static void regcache_hw_exit(struct regmap *map)
 {
-	if (map->cache_free)
+	if (map->cache_free) {
 		kfree(map->reg_defaults_raw);
+		map->reg_defaults_raw = NULL;
+		map->cache_free = false;
+	}
 }
 
 static int regcache_locked_op(struct regmap *map,
@@ -282,12 +285,13 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 
 void regcache_exit(struct regmap *map)
 {
+	regcache_hw_exit(map);
+
 	if (map->cache_type == REGCACHE_NONE)
 		return;
 
 	BUG_ON(!map->cache_ops);
 
-	regcache_hw_exit(map);
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n",
 			map->cache_ops->name);
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index a0e14dc1f6f6..327ae2ea9729 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1424,6 +1424,7 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 
 	regmap_debugfs_exit(map);
 	regcache_exit(map);
+	map->cache_ops = NULL;
 
 	map->max_register = config->max_register;
 	map->max_register_is_set = map->max_register ?: config->max_register_is_0;
@@ -1434,18 +1435,23 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
 	map->reg_default_cb = config->reg_default_cb;
-	map->cache_type = config->cache_type;
 
 	ret = regmap_set_name(map, config);
-	if (ret)
+	if (ret) {
+		map->cache_type = REGCACHE_NONE;
 		return ret;
+	}
 
 	map->cache_bypass = false;
 	map->cache_only = false;
 
+	map->cache_type = config->cache_type;
 	ret = regcache_init(map, config);
-	if (ret)
+	if (ret) {
+		map->cache_ops = NULL;
+		map->cache_type = REGCACHE_NONE;
 		return ret;
+	}
 
 	regmap_debugfs_init(map);
 

-- 
2.56.0

