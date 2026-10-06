Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7E370ACA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284718; cv=none; b=hJJP1Bq0palWE11pZI0jabt0i8y/RdxmiVgTdCoM+UkCUTJf2aL4+XGtSTnpc+6assMB33d7gT1QE8GaR5ACQQ+tLkUe0bUEtnEgaUdqMKDDMg7lgyfVVJS+vsWy/1N9YczDnZWHXZe2oO9x3vMqqYXANmofYfrPMm5TsXYfOJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284718; c=relaxed/simple;
	bh=xFxnRqrRJGHu+kpzHXNX007froimS4Mf6K1EqMERvfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBg5L0kFLIoD9FX4ZEzBBBajk5Ark91rrL/DMgPEJTtESBD/AFUWfO/HViriULbcINIXKSptdmladW1oyz+5GX9MSrofNxL6RvO9/NAwmFiBZ3QU81mxnyd2m8AdeWlRXqx8XQOWCEcwFbEKlNuGNI82mlqPLUYK1PU9MF51bDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdG5k64i; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdG5k64i"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a4a7eb86a4so547109a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284717; x=1791889517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czQOWa8cjt56wAmW94IPDCWghKrkTEoBCmv6pzxyFfc=;
        b=qdG5k64izNDnRwNLAaKtbiV7HNKuZhk2z/9E2xCNJD4Tp41uw0okB2aHM0aeriWRKc
         WqukmlMDjjijjct6Xp2PCF7PEgHY52xZB4GovKEIyuvZdouunJ6xC9iwi8JRXW8wGI2m
         WBPCEOkBNa+5ysrBSVDoGVK5t0xSVDqBn+N+nXnDZkT44b/Wp+0fs29c2QvrMwIrevUN
         0iR9MrcZIP2XOpdJNblBwx5KEiQDwPMGz6cHhztUb/XF2i+6NEkyP6Krkz23GzbJRiOq
         Rx3rudIC0vn4hr+dzQVeSNtdO/tDFl+3nYLr6zy9Fkmr9WFQJ+DnmZhHXyebUOCiGPaO
         G0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284717; x=1791889517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czQOWa8cjt56wAmW94IPDCWghKrkTEoBCmv6pzxyFfc=;
        b=aW04Bi2Pmc++NgM+Ef6F6VD6hfEpyS/yjqVFfpBpqv9KcmI4rWi8y3PU+R3rYzwqwR
         7WF+FsThe4D1nsM40Bcxca3gd2dNi27iCDr6cJ6/4KijAq2QPW2RBmcPMzk0I/HXQH0y
         fauf7ogM5WzJjajAixOKwOegdJ4SxG9l+CxFPMQerimDqAXl4cSG1KsrSs9oI0+VQ5/r
         hySL9Zyw/oJto5ZEfy2V95ew5v4t7R/VRqoxD3SntE7DW9inSZqmydfTvxChjimiS0Lm
         PK7ohzUPOWjX3ZxKey3f61B7P6dsW/oUee2hFjNz90j+KATXyE85jQ3I9LFZ+GPUL4vY
         Ou4A==
X-Forwarded-Encrypted: i=1; AKwUvBwcfTqxUOpIqUzhBu/X1Ek+1aTzfacPii6t0641gtmDqL8oiCbGUj7lq5T+3M5dpElAtl52q7zoGQDluys=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwbR5obXm/Alhwjw7cNCYxbR2TN61v+12V7hVkZIAtwJ0faa5T
	OUsYka7FPj+yeSuCMqMRaaihG4dmgrA9al+faNl8W1PhEzRmPa34mQ2O
X-Gm-Gg: AYBFou0qJrd76fD2x5IXwLaR0BWz6GmtDhJ58jNdHQaSq1HiHUbWH7+rIxWVRZq/GE6
	a2PQN/yekbrhOXHjPwBVtnW/kQJptIw02cLgrElKFB/qrzdr/LdG/Afv7fddmErQGcBETstePLh
	lgiFO80JmLmO1DkIOUAO5FayIjHmHaH97Ln2tVDuhQEZ5W+SvX/PvQPr8FVTraXkNybq7REV4zq
	2eCR7ibgDEK1pWfXwelPleekTk2ZXbegCU7FXgihSr4JpF7Isr27Sb6GBT6LlLc1lzHkPYgMBJ3
	MrBWhC35sNPOtkkX3UKoVpUO6J/6UddTeAd4iCZDmoIjkt6JqFKNnA/dtI3ToueoJUm6xqfzbV8
	fWdDe2LJXF4MGvq968W6SwqelWTJwsnMAaCiIys04e3MrawBCm63MR4HQxGHoX7D/Sy0zziBQbA
	9a10Fokkdy1MjvmdmlcfBRx+hahSkjvJSDEY5fXNOtilyhgODtwCpFcpo/QT2FPbCBWLmt1lttA
	WIwR6h6k9kigOwqleB7EoXC9uQiKnZq//7uIyl0Q/ppEGJKmKnsAUOpW1tdKr4gJAHHIFNw3k9c
	HeQHwQnEqXqXRw==
X-Received: by 2002:a17:90b:4b8f:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3a87379dcccmr668796a91.54.1791284716811;
        Tue, 06 Oct 2026 04:05:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm3668351a91.12.2026.10.06.04.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:05:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Liam Beguin <lvb@xiphos.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: lmk04832: Handle reset GPIO lookup errors
Date: Tue,  6 Oct 2026 18:05:01 +0700
Message-ID: <20261006110501.57051-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but lmk04832_probe() currently ignores them.

Check the return value and propagate errors from the reset GPIO lookup.

Fixes: 3bc61cfd6f4a ("clk: add support for the lmk04832")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/clk-lmk04832.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index f9a0684d2628..81801ccb2675 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1410,6 +1410,9 @@ static int lmk04832_probe(struct spi_device *spi)
 
 	lmk->reset_gpio = devm_gpiod_get_optional(&spi->dev, "reset",
 						  GPIOD_OUT_LOW);
+	if (IS_ERR(lmk->reset_gpio))
+		return dev_err_probe(lmk->dev, PTR_ERR(lmk->reset_gpio),
+				     "failed to get reset GPIO\n");
 
 	lmk->dclk = devm_kcalloc(lmk->dev, info->num_channels >> 1,
 				 sizeof(struct lmk_dclk), GFP_KERNEL);
-- 
2.43.0

