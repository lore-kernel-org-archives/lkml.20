Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680687;
	b=yuB9hhKWvq4pEED/XUZa2+x8qWZwkcL95GtbEPCAN9uHND329yhfgqIF8nj3boYSJyrH
	 h5BHerDflAqw7lWtJdG1k7jNjFn7CpscA5rRGEMSLiHQ0pX56W0dN1UpwAK7qJHdpPnLk
	 KWrwCurH2zAR8FLT5eMZe09r+Zo5s7ByoGta0rhr/ry0B9kxAHp0W5GLLCOxZV/FKybxN
	 1k8Zx+E5VFVrybAUB585pyQvfWhKn+QeMn/ZAGzB/m9Ee7YCb/v8Gtlq2zfOauZImnlis
	 GrQDg39NYcKy9YUH1LTy30ECNerMTslJG/Ou6DArakT2pNrT6ylbfA+rgEWr9AriA+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
	b=3x/3oCZl58T6fKwF15Uyb4xh9CxyMS9eK/BeW+4Kp2ziXvWoiTEAFgtophmIbbLCBOua
	 VZGpeCTyQDCZE9ySmve/N8Q0IWaB5creyFDCMYL8/nt8La+gTMSNX9t9+9ovNkI3Wc6S4
	 42txd3YgN/mZPPQxJyrIb9ghmBT+m2GBKk2uE0LhXBfwysnfeObTgXlfHkkFvb9dgoOF+
	 rQB+uLMJBiMiMuLzysYlZoxpW7ZtUVX/3pCTo2QCrHcwZNvu33EDtXQJsKdvvJ6FVNSQi
	 OEFklStSBHV1xRUrbG+DOYckrGNYZ4UlNtc2i19T6dtXSggHCDV+gYItJ9V7foY/AWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLSMcA9W;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99931606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99931606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLSMcA9W
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2327312a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680686; x=1794285486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=oLSMcA9W3IOpt9klu3M+RevOG4/HcHBTfA0yEM6xVIUXFeUd6bjAZ0+mmKcxRr83st
         SPucrPPbzXLyOf4jyjpRoZhJXMkZhQecbEGnmbFAioBSHjVS9hgmo9kxu9B4BgQkHu6l
         3pzjjeCjka3g90UB83kNZSoT8293LPKvhbQcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680686; x=1794285486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2GPV8kPMdAQMoqvFZFNAZKoDNH2JuPpdXamalsnIvU=;
        b=1BEt2mFdaWYNBjC2WAS9SImUT6hsp6hSDIxOqFM3FaJFu01wEVSNhSEZrsdewp8cfo
         fw7437nFM6f7tFQsQ6+jye9sNhJ7m8HV4XQZvDBra30WQZd5tQmRjmM2iI2Czpx3xfNS
         j6Pv3YrwCSKmQxiLBGVdVUsH/6L20uT6N0ZUebQyMrxd0fGkOIbYxPFCJyPUq5PqAm3j
         9Gxut3pqxot0Ikj3U3+UEctSpVygQGEFtpBzRJ9k1roYD+2O/v1OWv3zPQrGBSMXrGD+
         qorsihEYD9GiRRGJIFCsPjcy/sttURc4XCN1G/e218OykVIgIlE4ZuMcwi4FYyL+0oWx
         4Q8g==
X-Forwarded-Encrypted: i=1; AKwUvBwrdS4nIbHqDbWSOzlj+snrAsrw7JfGnMc5cbwe/N92otquaq/YYtPF3bPCua8BVQpK4eFABMBF79RjS7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ju/MWp+VwLWTx497fspv80Hz28j4HKgO/a/sT7+9ES+gNoaD+
	Dm/2Iq6W/GUj3zJXcyGy9GIG88hQOS+1jkHjjmtmQiSbUCFdaQlA82JwY1sOSwvdPQ==
X-Gm-Gg: AYBFou2CWFDVjP42YbPoVPQydHPhi2OItxay71IDtHKVFDGV4Rq8ct//XeiNRQRU/Xp
	umNxQNbVGne85lNKTn0hMHngM/WswwKPauWWimU4ANLdoXSy8XsxMm8iVGO9oSkD2INcgHBk2KB
	wgB6Hf3+2jQ/4jtBR587fbuu2Bj90R/p2qoZs7VJ5mCD72sV89jL3x4PpiH10ow0iPvmcH1Aq02
	UUxAnVdqJR6C3PEhWyioQhzqFsCwoYXoOLR+6RPgFWRTRZNpO7uzJoi/tnvDLuyyTHuobZu9l2u
	YJlzJYj6atINDZVw3bsyTDLlvtbKC8UTAbwBZlLDkmjPSj1h5DIBGdTFegVXdykzWTTYvaJ/PnS
	JpEefEDq3q8jQC5Pm1mFsIn4dHxIjk/SIW0ch+mspOwMnc9UuPoiHk3mM602tprLSf+JlWcHmJY
	w7sQ6WR+jPRHMznbre1upicGkGOxAHG4p609P3i5ERHe7CigTE8TxxQe2Oz7VO6Hkkl09rbsDJq
	jEazWkj/X0HtCFx0nO1EN5w2QiUh4SxeKBDwBhMhC4wNqb2abfYJb47R9o7c6Lr+VnvZ/tf0dgE
	UAIXiV2Je/F/FrW8Z+PU2h1+KVOJ03FlXFqBkCgSwc0bCB+Sdgw2y3I87djf9Cy/lWtylyBaNC6
	uLNWYT/qWKO97
X-Received: by 2002:a17:90b:1b0f:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae8957d4f8mr10310774a91.8.1793680685963;
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:05 -0800 (PST)
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
Subject: [PATCH v7 5/8] i2c: of-prober: Let cleanup op know if a device was found
Date: Tue,  3 Nov 2026 12:37:29 +0800
Message-ID: <20261103043734.2179858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prober's cleanup op may want to do things differently if a device
was found, such as wait for the actual device driver to pick up
resources.

Add a parameter to the cleanup op to pass this information in.

Also fix up an incorrect reference in i2c_of_probe_ops's kernel-doc.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- fixed typo in commit message and comments
- fixed missing parameter in cleanup op type declaration

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
index bb6d47f50ee5..11f3a05ce881 100644
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
+	 * @device_enabled is true if a component was found and was enabled.
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
2.56.0.385.gac671c819a-goog

