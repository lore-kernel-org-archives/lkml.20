Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEE4E433A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612804; cv=none; b=sLCopbKKNxTdZLYhrMKYkSNMkQEwoVGCL1uvq/kuCB0lxjCOopwkv0DQ0BPAUK7gNh9xmOzNnRQLw+ILiFRLkN7QWcPo1xmaWiDf4OhGr0r+dZHy458ERAcpZzR2uZfmwKQFaj4XZwk3L8DSJC/iZG43RmVlN5Hw2d4hMpcGjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612804; c=relaxed/simple;
	bh=9wKeEgh6pkW6PzAZ90qnhu+sa1sC+v9w34XBbjZflmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urDBSygZFoQ0nenwhe9IZpY2G8EoZO/bqaoIX91gGjgjVKxtt9Nz5kZonw9UfdzALsQlqijplo1tOxCvMEbYTksz4go4L56m4BDxbd8x0g1S4ow+IF9MP/a8ZAqcXWyjIifL+2W/LesNYxf9ylStSDzlY508ON8wT5S7oA5sEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF/5HGAh; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF/5HGAh"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so4361484a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612801; x=1791217601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPSPwJEtl1C5BBneNjXu/SxOVQeDfX2jv9D7UeBshS4=;
        b=nF/5HGAhn2e1HdrwhyeuzsHKUgxIlZ/gIX2joCS5RRh1DoraR9VkOXleF7aeEKOmRI
         AfzuCIXfqEwgVwxtTBMgFaVgjMFZo1PMCpqtDsMW4sw0eXV0B5ayIj3ilJhurGNd84ZH
         AUCDH0mQuWk2RElb+qmsmj4UTlZ/B8kMrqhiztf4iXDQGFSdKxXOYwXQPh5SBJXNooGX
         pDInoZA1mAJ12FpQRveUcOLvZzMOe3sVjkJtFCiF6lwLdlm5tpX25F8EOylrm0N8JDPM
         LA3gDIneE/bPRjO2W561qH9XW07HIGrI2OuRLjaow9Hf0pyw6wzmZaqVJYHCnVQTdDC4
         cvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612801; x=1791217601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPSPwJEtl1C5BBneNjXu/SxOVQeDfX2jv9D7UeBshS4=;
        b=ocShUxX2NNPi9vFvNOPQfrg8adVjKHjq/wdGYp6byDKaWKTazJ5FF3uD3TDJYK+aZQ
         RzP4vZgAsVxT/C4ok2BTSASfQ8PRU/+hgXzPG3zaIc5ShLhKKtGSC11NCuYiJSPeTP1r
         sMLZPsZp4s/7GxOjECsJ0LpWAGNTsxAQrwlYGK449WdDFHsbJ0exKlJ4BWmoCcr1y9kj
         1v/slMd2cTAnz+nK3w/7XPtNKHZIywcBera7eVZZozDteGJJFv5zlTM9FGLP3q1Cd2JI
         dZ3ThUDkPjv5iuzeLyS44iuurYr0EdLQPioXJWxRDG4JLaoyMN+k8VJepPUxIkyu3tcA
         sj5g==
X-Forwarded-Encrypted: i=1; AKwUvBzVp7PxFctiVZZ4s/bYmsssf0sVa6/4JETfGk5n4au/9+ha8Lh/UvapsD9THiMw6cp/B6rULtqHgAWhUFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4V3TdoT5VMjycZjEnx1BTpJ3DnRBFuSjHcsAZ4Mm7ep+tgFSq
	LZOl428WB85RTGWZcuxxkzmrPTBGgrx15HqZUFA0MMQ8Br2PN9if+Qm8
X-Gm-Gg: AYBFou1UaBDcbjg2i+zE01VgUzMLqMbM1noVDzk/OObocntKmEEGTsBG9hVCMabPB9H
	a1m2XxnA9GFCnB63fVI/aNHZT2Glx3ByxELpj+LKGLMoMOh23QIDemtrheyPSFoVmvEdGxqgZgF
	mik1PKyn6AmH1nUIJTrwTSgkoafHfenyP6xYbZQiG+Bfq8QnoLgJkGZ1BL6jeEYfOn5my4iJe9d
	Z3rH17fNyjYzGF7lycuYTwKJhaG5JTZWjFDicB/rrr+5vEr5nl6SvSNdKtmMuvWb6ZLWQ+Eri1q
	GD9x7aB5sjV77yHfMx2QPA6HQC5pZSnxvtommopRnXnKJ4LsrczlEzBe4L1+kxhMKQ8yzQwQUcz
	th20pJTNZfGSt9utywDxyE1bYWvqTFkDdeIqcS/tDxJd1XS6YLhl/fbutovw17faG92v7qQuW/G
	mrSbPcRk+Z2o4wXO1EtDmtkjMUFXvTe9CEMqPwKW34i5ufIiarb1Kdd/B74rTvlRPNumEhCdFdP
	2oOUUs0JAmadebWmVmhBfHjouZYTZpH3VaN/dPo5hhGnQGCtsfq7DIziDbu789Qk26zi8Ueebt9
	eIb/44oXQHM=
X-Received: by 2002:a05:6402:1ed0:b0:6ac:62c2:bd39 with SMTP id 4fb4d7f45d1cf-6ac62c2c748mr3814802a12.10.1790612801289;
        Mon, 28 Sep 2026 09:26:41 -0700 (PDT)
Received: from localhost.localdomain (84-216-182-59.customers.ownit.se. [84.216.182.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9a72sm4277474a12.7.2026.09.28.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:26:41 -0700 (PDT)
From: Pooyan Azad <pooyan.azadparvar@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Herlangga Maulani <w1zardsec@proton.me>,
	Rob Herring <robh@kernel.org>,
	Jeffrey Lin <jeffrey.lin@rad-ic.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Input: raydium_i2c_ts - resize report buffer after firmware update
Date: Mon, 28 Sep 2026 18:26:17 +0200
Message-ID: <4c40e69aa94c91a241c2efbc26496dcabb0fca9e.1790612085.git.pooyan.azadparvar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790612085.git.pooyan.azadparvar@gmail.com>
References: <cover.1790612085.git.pooyan.azadparvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A firmware update can change the packet size. The driver currently warns
and keeps the old report buffer in that case, while still updating other
report parameters. This leaves the buffer and parser state inconsistent.

Resize an existing report buffer after all device information has been
read successfully. Keep the new parameters local until the resize
succeeds so an error leaves the previous configuration intact.

Link: https://lore.kernel.org/r/20260927114425.442803-1-pooyan.azadparvar@gmail.com/
Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>
Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 03ea0ae62999..00990c61010f 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -332,7 +332,9 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	struct raydium_data_info data_info;
+	struct raydium_info info;
 	__le32 query_bank_addr;
+	u8 *report_data;
 	u8 report_size;
 
 	int error, retry_cnt;
@@ -360,27 +362,6 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 			return -EINVAL;
 		}
 
-		/*
-		 * Warn user if we already allocated memory for reports and
-		 * then the size changed (due to firmware update?) and keep
-		 * old size instead.
-		 */
-		if (ts->report_data && ts->pkg_size != data_info.pkg_size) {
-			dev_warn(&client->dev,
-				 "report size changes, was: %d, new: %d\n",
-				 ts->pkg_size, data_info.pkg_size);
-		} else {
-			ts->pkg_size = data_info.pkg_size;
-			ts->report_size = report_size;
-		}
-
-		ts->contact_size = data_info.tp_info_size;
-		ts->data_bank_addr = le32_to_cpu(data_info.data_bank_addr);
-
-		dev_dbg(&client->dev,
-			"data_bank_addr: %#08x, report_size: %d, contact_size: %d\n",
-			ts->data_bank_addr, ts->report_size, ts->contact_size);
-
 		error = raydium_i2c_read(client, RM_CMD_QUERY_BANK,
 					 &query_bank_addr,
 					 sizeof(query_bank_addr));
@@ -388,10 +369,29 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 			continue;
 
 		error = raydium_i2c_read(client, le32_to_cpu(query_bank_addr),
-					 &ts->info, sizeof(ts->info));
+					 &info, sizeof(info));
 		if (error)
 			continue;
 
+		if (ts->report_data && ts->pkg_size != data_info.pkg_size) {
+			report_data = devm_krealloc(&client->dev, ts->report_data,
+						    data_info.pkg_size, GFP_KERNEL);
+			if (!report_data)
+				return -ENOMEM;
+
+			ts->report_data = report_data;
+		}
+
+		ts->pkg_size = data_info.pkg_size;
+		ts->report_size = report_size;
+		ts->contact_size = data_info.tp_info_size;
+		ts->data_bank_addr = le32_to_cpu(data_info.data_bank_addr);
+		ts->info = info;
+
+		dev_dbg(&client->dev,
+			"data_bank_addr: %#08x, report_size: %d, contact_size: %d\n",
+			ts->data_bank_addr, ts->report_size, ts->contact_size);
+
 		return 0;
 	}
 
-- 
2.43.0

