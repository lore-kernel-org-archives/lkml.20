Received: from mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA704973BF
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353656; cv=none; b=e09zcxgCf+/vEJeA/4bxQfu8xztyOGzWpANVPhizg9NMdUIG01ewLgXqR0KbFNWDIHOKsi11CUp7XA/aOlaFfYI0nA2sAAy4Pt62PXDvVLEhxDt6Sm7gR/whNgZDKm0FLzfdp6D+YgVWUK8qVZe/u1dCUJsRnBnLU+vvbgNZKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353656; c=relaxed/simple;
	bh=18+mnAc/bPWK0kM0tUFxstHFlb9XFK582B6TDvhivm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF5pSvvbXg8piqCl762CS6YjWrg7YU9dlZ5/uRBECRPVQnCZA1UJR/IqdoxPYHefNer2LXBQkmq0LAyR7ZQELaOsXR9/GfLb8hinxCwOMVe6cdcpkEgeJAcl8JI5NyQKijGTqaReGtRG7tXh8j5nn46VGk4Klp48/3LT/8r+sPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pv4zSyqS; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pv4zSyqS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=18+mnAc/bPWK0kM0tUFxstHFlb9XFK582B6TDvhivm4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792353652; v=1; x=1792958452;
 b=pv4zSyqS4aAThOFR/iFhQDv/Qy5w4mi6Yk5jIB1gJj4YKm8iipQ9PEtiaK9FYnaIAxfrzsS2
 fvcQce4B4YK/YnU5V6HzYp03Fxz+4ldnEC4owoXTDTvTFJXHupMtuvQsL3tdqtlc2MRHSyHV9Q+
 T35vdnzgXAafXXWg0FRnviD0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 864ca5379c404f61;
	Sun, 18 Oct 2026 20:00:52 +0000
X-Mizu-Trace-ID: 864ca5379c404f61
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: tas2783-sdw: load the firmware synchronously
Date: Sun, 18 Oct 2026 13:00:07 -0700
Message-ID: <20261018200009.1493438-3-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tas_fw_load() requests the firmware asynchronously and gives up waiting
for the callback after three seconds. tas_io_init() then returns without
the SDCA function initialization writes, while the callback carries on
downloading, sets fw_dl_success and so allows playback on an amp that
never got them. Nothing cancels the callback when the driver is unbound
either, so it can run on freed driver data. The download takes about
1.2 s per amp on the ASUS ROG Xbox Ally X20, so it fits there, but
nothing bounds it.

Request the firmware with request_firmware_direct() and download it in
the caller, as rt1320 does from its io_init, which removes the wait, the
timeout and the callback. The download now returns its result, so a
missing or bad firmware file fails tas_io_init() before the init writes
instead of running them on an amp that refuses playback anyway.

Fixes: 4cc9bd8d7b32 ("ASoc: tas2783A: Add soundwire based codec driver")
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/tas2783-sdw.c | 83 +++++++++++-----------------------
 1 file changed, 26 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index ebb52efc1edf..8e7376889b6d 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -25,7 +25,6 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/wait.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
@@ -41,7 +40,6 @@
 
 #include "tas2783.h"
 
-#define TIMEOUT_FW_DL_MS (3000)
 #define FW_DL_OFFSET	84 /* binary file information */
 #define FW_FL_HDR	20 /* minimum number of bytes in one chunk */
 #define TAS2783_PROBE_TIMEOUT 5000
@@ -108,9 +106,7 @@ struct tas2783_prv {
 	u8 dev_name[32];
 	bool hw_init;
 	unsigned int fw_version;
-	/* wq for firmware download */
-	wait_queue_head_t fw_wait;
-	bool fw_dl_task_done;
+	/* firmware download result */
 	bool fw_dl_success;
 	/* use fallback fw name */
 	bool fw_use_fallback;
@@ -866,10 +862,9 @@ static s32 tas_fw_get_next_file(const u8 *data, struct tas_fw_file *file)
 	return file->length + sizeof(u32) * 5;
 }
 
-static void tas2783_fw_ready(const struct firmware *fmw, void *context)
+static s32 tas2783_fw_download(struct tas2783_prv *tas_dev,
+			       const struct firmware *fmw)
 {
-	struct tas2783_prv *tas_dev =
-		(struct tas2783_prv *)context;
 	const u8 *buf = NULL;
 	s32  img_sz, ret = 0, cur_file = 0;
 	s32 offset = 0;
@@ -877,41 +872,20 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 
 	struct tas_fw_hdr *hdr __free(kfree) = kzalloc_obj(*hdr);
 	struct tas_fw_file *file __free(kfree) = kzalloc_obj(*file);
-	if (!file || !hdr) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	/* firmware binary not found*/
-	if (!fmw || !fmw->data) {
-		if (!tas_dev->fw_use_fallback) {
-			tas_dev->fw_use_fallback = true;
-			dev_info(tas_dev->dev,
-				"Failed to read preferred fw binary: %s, attempting fallback binary load\n",
-				tas_dev->rca_binaryname);
-		} else {
-			dev_err(tas_dev->dev,
-				"Failed to read fallback fw binary %s\n",
-				tas_dev->rca_binaryname);
-		}
-
-		ret = -EINVAL;
-		goto out;
-	}
+	if (!file || !hdr)
+		return -ENOMEM;
 
 	img_sz = fmw->size;
 	buf = fmw->data;
 	offset += tas_fw_read_hdr(buf, hdr);
 	if (hdr->size != img_sz) {
-		ret = -EINVAL;
 		dev_err(tas_dev->dev, "firmware size mismatch with header");
-		goto out;
+		return -EINVAL;
 	}
 
 	if (img_sz < FW_DL_OFFSET) {
-		ret = -EINVAL;
 		dev_err(tas_dev->dev, "unexpected size, size is too small");
-		goto out;
+		return -EINVAL;
 	}
 
 	mutex_lock(&tas_dev->pde_lock);
@@ -972,13 +946,7 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 				       (val[2] << 8) | val[3];
 	}
 
-out:
-	if (!ret)
-		tas_dev->fw_dl_success = true;
-	tas_dev->fw_dl_task_done = true;
-	wake_up(&tas_dev->fw_wait);
-	if (fmw)
-		release_firmware(fmw);
+	return ret;
 }
 
 static inline s32 tas_clear_latch(struct tas2783_prv *priv)
@@ -1322,31 +1290,32 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 
 static s32 tas_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave *slave)
 {
+	const struct firmware *fmw;
 	s32 ret;
-	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
 
 	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
 			     sizeof(tas_dev->rca_binaryname));
 
-	tas_dev->fw_dl_task_done = false;
-	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
-				      tas_dev->rca_binaryname, tas_dev->dev,
-				      GFP_KERNEL, tas_dev, tas2783_fw_ready);
+	ret = request_firmware_direct(&fmw, tas_dev->rca_binaryname,
+				      tas_dev->dev);
 	if (ret) {
-		dev_err(tas_dev->dev,
-			"firmware request failed for uid=%d, ret=%d\n",
-			unique_id, ret);
+		if (!tas_dev->fw_use_fallback) {
+			tas_dev->fw_use_fallback = true;
+			dev_info(tas_dev->dev,
+				 "Failed to read preferred fw binary: %s, attempting fallback binary load\n",
+				 tas_dev->rca_binaryname);
+		} else {
+			dev_err(tas_dev->dev,
+				"Failed to read fallback fw binary %s\n",
+				tas_dev->rca_binaryname);
+		}
 		return ret;
 	}
 
-	ret = wait_event_timeout(tas_dev->fw_wait, tas_dev->fw_dl_task_done,
-				 msecs_to_jiffies(TIMEOUT_FW_DL_MS));
-	if (!ret) {
-		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
-		return -EAGAIN;
-	}
+	ret = tas2783_fw_download(tas_dev, fmw);
+	release_firmware(fmw);
 
-	return 0;
+	return ret;
 }
 
 static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
@@ -1368,8 +1337,9 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 
 	tas_dev->fw_use_fallback = false;
 	ret = tas_fw_load(tas_dev, slave);
-	if (!ret && tas_dev->fw_use_fallback)
+	if (ret && tas_dev->fw_use_fallback)
 		ret = tas_fw_load(tas_dev, slave);
+	tas_dev->fw_dl_success = !ret;
 
 	if (!ret) {
 		if (tas_dev->sa_func_data)
@@ -1570,7 +1540,6 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	tas_dev->amp_level = TAS2783_AMP_LEVEL_MAX;
 	tas_dev->dvc_level = TAS2783_DVC_LVL_MAX;
 
-	init_waitqueue_head(&tas_dev->fw_wait);
 	dev_set_drvdata(dev, tas_dev);
 	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev,
 					      peripheral,
-- 
2.56.0

