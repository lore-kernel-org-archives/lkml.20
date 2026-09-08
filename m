Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1B75A514B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908269; cv=none; b=P4wq6aRwK4YWLa9ysEwksnNQSF/bhJRuK3Uq5gF4aQ4toLxQ3M+/i8osB9k3Cp41x4FuK3cw2b2r7bm+Q6kuZhwwkZWa9erSqqkkytf94SecUyg0dvaxwGqXrE9y3bSTTg9JsgD+J74MqG/8nWrW4VrL54THbNT/Mw3N5N9KnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908269; c=relaxed/simple;
	bh=DQmWpiiP+cD4WOs/XMACwGLUuwq7F0q+Wq6Ld9uy2Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpSMqKr1TyrzzysiRVR1dlL1ndIOqRdfEXw48f7rpDnbJ0p9JzAJgKMvoeC6F6wNUuKUdDGRZNq4fSR1aPtdXjXu8j/WbSz01yBL2NWxHVZiBAuXwoqObNI5ntXDSfezquYQIIA6vO7aMOhXe1IcGE1wgeij55lztPfMrvPe54A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmpF6IUC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmpF6IUC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d715f4a587so72322145ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908265; x=1789513065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wumeOXgAu9H0Kp97qaCmHzt/GpEB2ltmfWp7a6Ii+u8=;
        b=mmpF6IUCM7VAx/+T0HKOxspCt5wTL6l3DBH1qE0kFMamRLzsk1/q1FZ7WazcbNfllG
         9ujr5jSZAeclJVXXgd9btNs/9DDa0sDGcnp52koT+04HQAIeYZrFSJDbCV2kZ+NZeh+z
         9mMEiXmviEO3YQ/qPCl4/g4ZeFiXvY3f52+NFAnyn4zu+Kojd/Pk/SXoaJp+rYKuLhAO
         4WBVveJglt203np0sidV/zQCS9VGqskgNlx5v6/ecoxlGPDoNC+b2HYcZlUoLZyBzFvK
         8XyUR9U9biWQrbdQlfyGr9SZnoBBjyDBuDg0UUTjzY6a1IJFrg2GZmyVDgrepMv+JNYM
         P16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908265; x=1789513065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wumeOXgAu9H0Kp97qaCmHzt/GpEB2ltmfWp7a6Ii+u8=;
        b=CRVAftb5RMJVux74MWoNG/YwslsFm1lLMPKHcKNIUKnzufUDBE+WhmuciB/wURuBwc
         hF71pdUdm1OELIvI9GpI6MK1Jujfj1Eufd6DP0C9I3KaITOYoWrPw0hG8DoJyBuWdEYf
         YfBCw4dwx+DOoU3n05Ys7tJZ0WLt9CvTqfMTZtJUVAmfefsV8yRM8FWTYWHg5rBu5Eqo
         bsfrMsgDfwdyL8WEni+2IjKUJTsjLsDaygKMBFcea7HvYr0Jtr8fvMI9WkJ+LMNDo98h
         FykR2H7sGnukUUG7yl9zownAdR07yHeogp6jfOvsoxFeko135ER8Be01eEw4G+4rkc8y
         XY7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/kfC3KvvTnz553fDQv4pj542uceh+sMQkxuj3/QTCaZkYhcnKliTDlteLl4H0lhCuP0zvFb7gW4iRMpI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQjiImJbHsrxdw+or6nm7L0ipnRtTXvHmoKtSzy4ZfFkGZY5Ug
	EGckh2qgW33MBo0qQT8W+ivl26u6KzmWBCTeLK4/CHpFL8LvKywhDQ1u
X-Gm-Gg: AYBFou0sANh7lC4RO7XfXQRlN6NbqhOYI8Jq26QrZZlIRUjyYpPNqo6CcO/yB/gLS2P
	Q9+ojCSGkDslZjuOrV0eLRO65mL2HQt4iPCiOxPmq+edStOGGVpbQk5r+ZPNRDUWUl1MPNewF41
	iwZLwTUM3DZEJcsFo9qPP0FipWHDZX2WZvEGK8Bqg3OKdF4YpqOW1ofXAR/lsSldISAQc78okrV
	hf+pbGy7yfuMAESYb+WdHnZj/e7hN7c331LjG8YJAKpENOJU1waUXtQXD/LmTHN6vjzlURT8tVf
	GJYm4CvIGf8AZhzx/9nFP4ebb0QUdY8nNBF2r5U86JUE4/XA2eGrwsg9Wmw+VshYFd8ICcAFpFi
	bgugw949NdBN57SSsae4V1dkexwhOHIV1skL3m7IiSrpL2D3dnQVDdgw04F07BFcw8U7G/usjXS
	5WUPiX4UF5JPBpBgC3daAMDcYwC/h+650bto+rp+0mN7WdwvU9b9SQ40pUbFd4NXA7CL88cvbM7
	7VAIQ==
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr47435731a91.9.1788908264615;
        Tue, 08 Sep 2026 15:57:44 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm45266746eec.7.2026.09.08.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:44 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 3/6] eth: fbnic: cache hwmon sensor readings
Date: Tue,  8 Sep 2026 15:57:34 -0700
Message-ID: <20260908225737.3034403-4-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908225737.3034403-1-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each hwmon attribute access triggers its own TSENE firmware mailbox
round-trip, so reading the full set of attributes or polling them at a
high rate floods the firmware mailbox with quick, successive IPC messages
for data that barely changes between ticks.

Cache the last temperature and voltage reading and serve reads from it
for the remainder of the current jiffy. A single TSENE response carries
both readings, so one transaction on a miss refreshes both and satisfies
a whole batch of reads. The cache is seeded with the FBNIC_SENSOR_NO_DATA
sentinel at registration so the first read always refreshes, and
concurrent reads are serialized by the hwmon core so no additional
locking is required.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h       |  7 ++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  7 ++++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 35 +++++++++++++------
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index d0715695c43e..f647ef07704b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -22,11 +22,18 @@ struct fbnic_napi_vector;
 #define FBNIC_MAX_NAPI_VECTORS		128u
 #define FBNIC_MBX_CMPL_SLOTS		4

+struct fbnic_hwmon_cache {
+	unsigned long last_read;
+	s32 temp_mdeg;
+	s32 volt_mv;
+};
+
 struct fbnic_dev {
 	struct device *dev;
 	struct net_device *netdev;
 	struct dentry *dbg_fbd;
 	struct device *hwmon;
+	struct fbnic_hwmon_cache hwmon_cache;
 	struct devlink_health_reporter *fw_reporter;
 	struct devlink_health_reporter *otp_reporter;

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
index d84723e4cfa3..42a5f83ddb45 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -6,6 +6,7 @@

 #include <linux/completion.h>
 #include <linux/if_ether.h>
+#include <linux/limits.h>
 #include <linux/types.h>

 struct fbnic_dev;
@@ -44,6 +45,12 @@ struct fbnic_fw_ver {
 	char commit[FBNIC_FW_CAP_RESP_COMMIT_MAX_SIZE];
 };

+/* Sentinel for a sensor value the driver does not have: a threshold the
+ * firmware never populated (older firmware) or a cache entry not yet
+ * refreshed.
+ */
+#define FBNIC_SENSOR_NO_DATA			S32_MIN
+
 struct fbnic_fw_cap {
 	struct {
 		struct fbnic_fw_ver mgmt, bootloader;
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 38bb26cb8e6c..c8e7ff1d36fc 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -2,6 +2,7 @@
 /* Copyright (c) Meta Platforms, Inc. and affiliates. */

 #include <linux/hwmon.h>
+#include <linux/jiffies.h>

 #include "fbnic.h"
 #include "fbnic_mac.h"
@@ -25,26 +26,31 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,

 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
 {
+	struct fbnic_hwmon_cache *cache = &fbd->hwmon_cache;
 	struct fbnic_fw_completion *fw_cmpl;
 	int err = 0;
-	s32 *sensor;
-
-	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
-	if (!fw_cmpl)
-		return -ENOMEM;
+	s32 *cached;

 	switch (id) {
 	case FBNIC_SENSOR_TEMP:
-		sensor = &fw_cmpl->u.tsene.millidegrees;
+		cached = &cache->temp_mdeg;
 		break;
 	case FBNIC_SENSOR_VOLTAGE:
-		sensor = &fw_cmpl->u.tsene.millivolts;
+		cached = &cache->volt_mv;
 		break;
 	default:
-		err = -EINVAL;
-		goto exit_free;
+		return -EINVAL;
+	}
+
+	if (*cached != FBNIC_SENSOR_NO_DATA && cache->last_read == jiffies) {
+		*val = *cached;
+		return 0;
 	}

+	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
+	if (!fw_cmpl)
+		return -ENOMEM;
+
 	err = fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
 	if (err) {
 		dev_err(fbd->dev,
@@ -67,7 +73,12 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
 		goto exit_cleanup;
 	}

-	*val = *sensor;
+	/* FW returns both readings in one response, cache both. */
+	cache->temp_mdeg = fw_cmpl->u.tsene.millidegrees;
+	cache->volt_mv = fw_cmpl->u.tsene.millivolts;
+	cache->last_read = jiffies;
+
+	*val = *cached;
 exit_cleanup:
 	fbnic_mbx_clear_cmpl(fbd, fw_cmpl);
 exit_free:
@@ -107,6 +118,10 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return;

+	/* Seed cache with sentinel so the first read always refreshes. */
+	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
+	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
+
 	fbd->hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
 						     fbd, &fbnic_chip_info,
 						     NULL);
--
2.53.0-Meta
