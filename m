Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C473A4AF16E;
	Wed,  7 Oct 2026 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379713; cv=none; b=TmwB9fynSYqrxfLMzC3micT62zLv0mXPkScdmB9ZlzKrRdMpQrxTZ7ZctRYwIzCxyF+TCWKQcj4eJwlQSDqX08l4mbWPLa7fFrFAPdmwD1CFWwj7T2y01+y8F7W3j2+OlhSck6bbxw2sQJS+dbRymgtsyEmbQgoWQ9vg12tByG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379713; c=relaxed/simple;
	bh=NhgS4jtUOMahOX+ISZKhvEOM115DkmUECw0d7x3e7t0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uK0dqU7b5hLrwgaKexbnXnQfuGQeMYBVLllZY2oxhp2DrqKLu99dKTaCCu6kuV9Ir46DWd0lQFbwuMhSYGkbyQvXu/kL0Bcqt8P/OnVhuleVM42VeLXSaWgeKowj9KNu85ResMOWiFlQkQuDSM7Mzy0j7LkeQa/kXhBTDXylYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm7boOm/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm7boOm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379693; x=1822915693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NhgS4jtUOMahOX+ISZKhvEOM115DkmUECw0d7x3e7t0=;
  b=jm7boOm/ib7+VKi6/WIfUjihICpa/2KzSpP8WhdDxCTRKrMpMlh4Ax5m
   cgOELY4anXe6VNKZhrYZGWwjc6NoUUxurSIsCKtK2UGqoJr1avIaio4l0
   3Gz43NCV1MVTjsISH4bjl3MFKfoE5lJvrj39Gh1VV5xB1QJhnWMaM5qvU
   thwUy/lpxcDbmQUyrtQjyxIYKdpCcPHgJe3zHfizO7KncoJSdfhbvZj7d
   pDh7R1XTzZiOzIR7ddVOlikX01Lhdb98YsHoJ2qE0f5UKZnyKLeCBmSUy
   XP+g8HFxGz5ST9LwgoYzBEhaCL0Er5KaYCk++WCjeEq7oBLR6sDaCSRfX
   A==;
X-CSE-ConnectionGUID: P2ziea8WQxqZdK57oJcw5g==
X-CSE-MsgGUID: F3PVbo+hSwKQL4chCz8bWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="242409"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="242409"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:27:43 -0700
X-CSE-ConnectionGUID: uuo+YFyoSgW3Li7qPvhISg==
X-CSE-MsgGUID: e5VkCEJ9RbWIvEbOxpaqBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="64296"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2026 06:27:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/7] ASoC: topology-test: Switch to snd_snd_component_new()
Date: Wed,  7 Oct 2026 15:33:50 +0200
Message-Id: <20261007133353.455185-5-cezary.rojewski@intel.com>
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
 sound/soc/soc-topology-test.c | 66 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 346a52d3006a..bcfb52061133 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -246,8 +246,8 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component_null_comp);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -256,7 +256,7 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component_null_comp, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -291,8 +291,8 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -301,7 +301,7 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -355,8 +355,8 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component_null_fw);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -365,7 +365,7 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component_null_fw, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -406,8 +406,8 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -416,7 +416,7 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -464,8 +464,8 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -474,7 +474,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -522,8 +522,8 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -532,7 +532,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -580,8 +580,8 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -590,7 +590,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -639,8 +639,8 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -649,7 +649,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -690,8 +690,8 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -700,7 +700,7 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	snd_soc_unregister_component(test_dev);
@@ -743,8 +743,8 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
@@ -755,7 +755,7 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 
 	for (i = 0; i < 100; i++) {
 
-		ret = snd_soc_register_component(component, &test_component, NULL, 0);
+		ret = snd_soc_component_register(component, NULL, 0);
 		KUNIT_EXPECT_EQ(test, 0, ret);
 
 		snd_soc_unregister_component(test_dev);
@@ -799,13 +799,13 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links);
 	kunit_comp->card.fully_routed = true;
 
-	component = snd_soc_component_alloc(test_dev);
-	KUNIT_ASSERT_NOT_NULL(test, component);
+	component = snd_soc_component_new(test_dev, NULL, &test_component);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, component);
 
 	snd_soc_component_set_priv(component, kunit_comp);
 
 	/* run test */
-	ret = snd_soc_register_component(component, &test_component, NULL, 0);
+	ret = snd_soc_component_register(component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	for (i = 0; i < 100; i++) {
-- 
2.34.1

