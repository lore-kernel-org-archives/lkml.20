Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0294F470EB0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249010; cv=none; b=EU8TCPV/i5u8VtsqOgbYXMEINgwGY8mDIL5Kfpbhj+dNlfCagmQpmX7Dl1fpKGyzRWzdNWmPEVibbgyZNu2E6IVuJ3Zj3WSsQX8XYB9LzWkdFP8glGL4/D9s+HJo6+kiiVJOOoO69sFyaLKVkUJKj4H/EJgNHCpjlBQl8pnPj9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249010; c=relaxed/simple;
	bh=6ab1wCEQP5zPcBfT0PBKodK0oU1IQzXD1fGtvF3pHJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8rp5PmXqD+3EQS/PAixeUNjVD/PS8E5tcFYEbDKLNr4uvfdWGUpO4LbmM0uWqQfiIHYT9+LYhZXc9K4lUTmP00260JIxOmAM9iWSS4YRUe50Vh6FCmPL1qYzYLGy/4vo3VRopCqo7oqpX/lypGjj8J+cqnVMfgCPQnnIjFC2L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GrVLjJRT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GrVLjJRT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d9520b9155so5951125ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249008; x=1788853808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=GrVLjJRTUdU/jzM1vH5Wt5/vZikPdp2veR7YQ4ZPfhm11Vzid1cb2wpTIFi7MV+pW0
         5P1nWbZ6I1p2r/lAKYLDXRCcfqoA2dSYcVjDmbl+AXMitvMzAjOgIVvdCXZXJBa8LKaG
         7j+G0INHwm6iHmVC1S13o+0u1QLKzbg4eGtac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249008; x=1788853808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=377z9agroO9vgw/MPipyApHAj2rPTrxxSFp/0FEh+cY=;
        b=oOMI8CHANQ03o0ZBtYF5b1Y4LS1Ip5DU+jv59koCMXfhWM1tH45+bOIGCK+vHZ+Ii3
         SNzart0E7VByNfQS65VvLQJHTtCeufIFxCpPxTmyyO3l4Pd8foJnfSS9oWZSE/t2uFm9
         FIavgLqV1tBYqbzwt3WZ52MKbNtb1Z7eE1YlfVBvkhR2TvfsSo34OrmIlzUIp2CzLwug
         4nWGEP6kyBeJheKBgCbGEeiSZDiI9qmM2rMAB4IWTvPtmso8DsWyct1FoKlmZIYRrhv1
         2F0hSc8MheM9FSMq1IW50ki9BPD+VdEbHtgcmQr86Q47vGge987/JUZmHKoJnSz2lCSc
         FNbA==
X-Forwarded-Encrypted: i=1; AKwUvBywZHKYDjXjMRiwlVZ9K15Jyn2Mb5ulAYukbuGiyWQfW0qPsUXAGejN1wPkNwg8fvmhqslVfzV/7C2l8ZM=@vger.kernel.org
X-Gm-Message-State: AFuF++kf5/3TbTGo4UhbbZQELOzfczjILgNHwZcxUUK7rd/DKOSoijRG
	XgGD21GGtlvQwUhgLH05s6AV2vMffsqFW1jnaQw+5utc0iTr6nUNVblWMMQ6hBuadA==
X-Gm-Gg: AYBFou3NFKM0nirDe6B5ruLuuFCV6qjZ3KoFGWnKcJoCigoE5uKIJi+pg9Mt09h6Fu4
	wIe733QZQxyQnI2Eygc+ALqq4exIxRpVN0vr9YCqhN4sRLE7400bUP+HvKJnUUbpiuQXBpKO6aW
	JMd1reddIpgawud7rgSp4JEuRI356bIsw5tp7wA9b/RpA9PEcUXcDJBLDi38O9WAseDk+2GBf5R
	IRsrQmmDQvsiKU4RWStVIcTOBZMWkSie+Xcqf/CX/KM3ncgf5Xj7SlBkMU0nX03uGN5r5cpD1qr
	guGg9m3ZWTFn9UkriaPoIfvIMphhH2dQXLd4DmEwkoCvZ17foLxoO4u6PEholbDV15V3ydYa1hO
	89CuNDLDlRsHw/MXcekHek3+6VGCiRuDDpGe/cpR869tYdbKpK9D1v50lSiy2WdC+84pzICGPHC
	pwXZ1VGYsrtzMjJwVI+XpBtRWX/XlNC/4n9PFm96uYmIIn622CVfY8onIoOuRN5FRx3l5Muggii
	K45IsaFJRHe2upVog5xG5nKR2DFfTDOhfVmGEuPMFhyIQ==
X-Received: by 2002:a17:902:ef52:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2d9383a326bmr139940935ad.4.1788249008298;
        Tue, 01 Sep 2026 00:50:08 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  1 Sep 2026 15:49:23 +0800
Message-ID: <20260901074930.764550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 8 ++++++--
 include/linux/i2c-of-prober.h    | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..97ef58bb4c04 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -130,6 +130,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	const struct i2c_of_probe_ops *ops;
 	const char *type;
 	struct i2c_adapter *i2c;
+	bool device_found;
 	int ret;
 
 	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
@@ -159,6 +160,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	if (ret)
 		goto out_put_i2c_adapter;
 
+	device_found = false;
 	for_each_child_of_node_with_prefix(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
@@ -171,12 +173,13 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 		/* Found a device that is responding */
 		if (ops->cleanup_early)
 			ops->cleanup_early(dev, ctx);
+		device_found = true;
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
 
 	if (ops->cleanup)
-		ops->cleanup(dev, ctx);
+		ops->cleanup(dev, ctx, device_found && !ret);
 out_put_i2c_adapter:
 	i2c_put_adapter(i2c);
 
@@ -388,12 +391,13 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, "I2C_OF_PROBER");
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ * @device_enabled: True if a device was found and enabled.
  *
  * * If a GPIO line was found and not yet released, set its value to the opposite of that
  *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index bb6d47f50ee5..f28a40780d1f 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -45,7 +45,7 @@ struct i2c_of_probe_ops {
 	 *
 	 * Only called if a matching component is actually found. If none are found,
 	 * resources that would have been released in this callback should be released in
-	 * @free_resourcs_late instead.
+	 * @cleanup instead.
 	 */
 	void (*cleanup_early)(struct device *dev, void *data);
 
@@ -53,8 +53,9 @@ struct i2c_of_probe_ops {
 	 * @cleanup: Opposite of @enable to balance refcounts and free resources after probing.
 	 *
 	 * Should check if resources were already freed by @cleanup_early.
+	 * |device_enabled| is true is a component was found and was enabled.
 	 */
-	void (*cleanup)(struct device *dev, void *data);
+	void (*cleanup)(struct device *dev, void *data, bool device_enabled);
 };
 
 /**
@@ -131,7 +132,7 @@ struct i2c_of_probe_simple_ctx {
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
 void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
-void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data, bool device_enabled);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
 
-- 
2.55.0.897.gb25b4bd76c-goog

