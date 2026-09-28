Received: from mail-ed2-f13.google.com (mail-ed2-f13.google.com [74.125.228.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9AB4EDCA1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612807; cv=none; b=V4v7oRt8ZS8clsBTUWWt08JCvXndzUHx03EvGGuXBcR7qh9Z3+HUw0TIP8VUnljaegvIgzEU/nHy/W3aSGwjiLrtoK4mUk0VN21IYqtQQjBRoD8Ergv6bTnn5PCS56+JZGdfEB+jzRqR6HLTzmd588NgRHMqYRf8NmCOAxbxOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612807; c=relaxed/simple;
	bh=A9JWXJhhYbjEw0Q/FmT2TC0JFq9NWAqh52pS9DhlAR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOJtCe6IGEPt+hWciebaRb73/gQMK9C8bfZbjWX7i9f6tSjuaFosiPNTTz1b6dYHZWWcgQZ+pPagbuUn0DVURW+R5j9bAN5JPfCskrevCRsBDJOtVg/g3sFHUsKtXslFuykcp07ESsXl2kF095bdW/r5IXvmHLlRuGjWR3Dk3wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH0fldog; arc=none smtp.client-ip=74.125.228.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH0fldog"
Received: by mail-ed2-f13.google.com with SMTP id 4fb4d7f45d1cf-6ab0d9260baso2566973a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612804; x=1791217604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ciF559s1gnabWjBTiObZN3nBwqiMjrqb8Ji1Ou0L1qE=;
        b=TH0fldogRN5oibEj0bfbhKVI6R8puOEOaMRhE6kSVi2aKZzIyJZ6prBABkI0GS2i54
         Rqd3oHua+WoVPUsjg1ezyPQMAGNuTztNM0t/SwMJRpu4ZZo/5rFxtlh6gXRZEMW6y3FX
         dBThd5Z9yggoExThAVm6hOZ7TLOcS1l5zT/pll7nkXy98pT0yKf8MPn15IOmUxRh3iuv
         SzCo8ovjO9DxGunlv+JAp+2OEbwC/aYWVzQ7tAbsKUJHO4O3I2IfZeoemjONdS30eFBs
         4cAEiw27bncyCI1fgnnG1AENBiiGOYgOLzGTAdHE+RUT3CXFTJq0VUJ8EMUpoLR8zHjV
         OewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612804; x=1791217604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ciF559s1gnabWjBTiObZN3nBwqiMjrqb8Ji1Ou0L1qE=;
        b=jfbftNDppBYhL3EnKUdNF5dT6BC4PMkvr8CD+CPbWrTynQ9o2L2YcLOzqWE34NhAir
         LrbZRv2FbsQmk6J2BxS1VrVxT+Rk2ABgLPpVSXvIPp/ug6vPpxRT097srH5pNNigs1g9
         R+kWbV3GW7NGG3FhTdl/DE0xe1HX0BwvpomILci8VDvN4vDWaAUyB9nxyMhU6I0nheQD
         QL3LSMQNOLZ0Zb5qqw5LGMTNnFXQ63gHt+4B6I2F+rBteQXmSqTBBaitJOL1hiyyUgec
         DiQns3myt1YfUEaoQAbYxvZAhQvFZG4boUakeZpK8FYmbQMxc4FV6B5V1dVZSOx21LS7
         puYw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ0EnXMKCEYUGZBkrA6X4Bo8IZEaVkXU1vGUR6A+75/r2PqUneab/3fUEdcP9aAKdFPCcdA8e1wwPK2vM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9+T747piQNZzXhEefJs9/gfLEO7EUc+zvpy65kXq3yyqefdhZ
	6I2mDiYWOaHG46RK/76CdRIJMOBLHwqlQm71f4YKMw+Lb8p5ckxywz/Z
X-Gm-Gg: AYBFou3pfHhYd04bVZBY9N7A45N1d4RtAB70KSq4ruj7K2qEL70qWCA4dM/uqKkcrWr
	tYHbcd6+4eLGLnThjQVZ1yI9lx8N7X//4ZRcd2anck4bhm7pT1rDsnoU1Vuki+sgjnUbkUVoed8
	3hkr/M7j2uYpxhjvgyH/AogjSVL/lrYoajKZ336m98SuSHQpjpwbMWdr7eqqFpSWIKugvcIo88R
	kKwMJO8a7IpXWyg3A7WHw9GyRUIBrskWbEhkwHl/KJqBSxu9wfbpLDOLbTrW/DPZKC34Jlrq3tG
	0ZmpQg+4AQWFl618F8JhLYRJdPh4bzg952Xt3jPaK0VXq0k7awCQ7wSsz7z5cUJfF09Iby6+v3g
	3URzA4mnfLyMBAoEpqvAhduvXYOopk0okvQ2l/XAiZrbFj57nPOEFfz8ZyvCuREDhL5t4kvjx0C
	amJ90DGEMuynlAOA4Sqt4ughd2cT3lAT1EObFiAwQjPJLs9a16s2gkWG538N1bkdPcM9E89VjDC
	gWuIYUp/MpQzsYvjv0byJZjiaxJY1y6M2px5jENv5ncavPLwhVYERGef/QmgTyDZOHMTm3Iv0gp
	Y7JCbkpR7g0=
X-Received: by 2002:a05:6402:23d2:b0:6aa:f187:26bc with SMTP id 4fb4d7f45d1cf-6aaf1873468mr5827998a12.39.1790612803776;
        Mon, 28 Sep 2026 09:26:43 -0700 (PDT)
Received: from localhost.localdomain (84-216-182-59.customers.ownit.se. [84.216.182.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9a72sm4277474a12.7.2026.09.28.09.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:26:43 -0700 (PDT)
From: Pooyan Azad <pooyan.azadparvar@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Herlangga Maulani <w1zardsec@proton.me>,
	Rob Herring <robh@kernel.org>,
	Jeffrey Lin <jeffrey.lin@rad-ic.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Input: raydium_i2c_ts - defer report buffer allocation
Date: Mon, 28 Sep 2026 18:26:18 +0200
Message-ID: <ab1e1006a0ddebacc8b36023a062651fdbe57e97.1790612085.git.pooyan.azadparvar@gmail.com>
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

Devices may probe in bootloader mode, where the main firmware packet size
is not available yet. Allocating the report buffer from probe in this state
requests zero bytes and leaves a ZERO_SIZE_PTR until firmware is updated.

Allocate the buffer from the main firmware information query instead. The
query runs before the IRQ is requested during normal probe and with the IRQ
disabled after a firmware update, so changing the allocation point does not
introduce a race with the IRQ handler.

Link: https://lore.kernel.org/r/20260927114425.442803-1-pooyan.azadparvar@gmail.com/
Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>
Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 00990c61010f..1d7f53d0b9fe 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -373,7 +373,7 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 		if (error)
 			continue;
 
-		if (ts->report_data && ts->pkg_size != data_info.pkg_size) {
+		if (!ts->report_data || ts->pkg_size != data_info.pkg_size) {
 			report_data = devm_krealloc(&client->dev, ts->report_data,
 						    data_info.pkg_size, GFP_KERNEL);
 			if (!report_data)
@@ -1135,11 +1135,6 @@ static int raydium_i2c_probe(struct i2c_client *client)
 		return error;
 	}
 
-	ts->report_data = devm_kmalloc(&client->dev,
-				       ts->pkg_size, GFP_KERNEL);
-	if (!ts->report_data)
-		return -ENOMEM;
-
 	ts->input = devm_input_allocate_device(&client->dev);
 	if (!ts->input) {
 		dev_err(&client->dev, "Failed to allocate input device\n");
-- 
2.43.0

