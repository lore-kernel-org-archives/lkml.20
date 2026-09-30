Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C051C347
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788375; cv=none; b=SeN9EZSjSSE55rj4XZaZQpz0VfhXMqojUuc3rT0J7m3ieoPlHGxFUspvBTQul3io4YhuAqm4+oGDlAsmVdfLPBwF35Eks8cxLArX5pngliVZ1wKlB8vGmYlpsydjqJe8AoCsfat111Kr3nL4s2cSwth4QeHXepCM24hAr67GOrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788375; c=relaxed/simple;
	bh=WdjfwuLlNW7MMMae3ZeWD4EXVc3/c4TDscD9rZ6H6c4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CZ6QYD6vUyVimxkc8z7Kc4/Mq0QiuTSjNsKBepliHIQanN0HHJhdllE3EMj+egRBuj4DfLwujKI8pjmju2doH1M7xbbPzjEBaNjJ9bBRmhrc4OuYR3oWZyKtTPiJhcg3E6FoT32W6NyOyZJKN+vmeKa77+eBiYgcPk3oUwt18ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPs1em6E; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPs1em6E"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc794a06e5fso3140622a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788373; x=1791393173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbmaV1Ht+pQcqM0UYJvv+5BLoui2ejuA1oa00pHWEJk=;
        b=JPs1em6EHuLRi/5HajN0B7ZnhHomT6j0oQ+Mc0xSxMbWAbK2tHwfSPEep/wi+7bXgs
         RLTnaWUIwXQdBkPomoo5RfeIv6W/y0rC74SeQJGk1AvJ5gUfd8nsekQ/gMSGCN6n6jVQ
         O7hgQ1ykn0LuY30yoGjAh+9GjeBsb5Hv/adhVz5wbWFn8CP0FTgjJkIMzMTfUmVf9c1q
         lTaZvo/5rawXGbO26vwgBV7SjdmwQ80EEfaBn1xg+xDUSsGHAEB6itwy+2EMFU5l3tgl
         hqoopJg579PA2FyGkHdrLK105cvDyydEDs7O6EQ2FiM6fByTnGbGxuOPBF6sHDDyQXn2
         re2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788373; x=1791393173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbmaV1Ht+pQcqM0UYJvv+5BLoui2ejuA1oa00pHWEJk=;
        b=jwplwAkdJLHNIUo6cD6u2hJyISYIvGDHyubCqYG0AShGXcsjFEJ8isSdKNdp2Ad//f
         Os+XeA3/YeWzB9BwIKBB3vBcFeSJfqRk4BCHC6HRTdBycIZqfobZOaaeFD+OcdAVLwnj
         JYnqn/z1eYzidjnX7q8M7oZj+Xf3mzriSUv05MDElQCH4DGXmQlxqPJ8toqwOCsOSCUL
         chdyCBppPSHVgrJCOLN28FPYVfomv3XdgrF8D4Is6zW+xikNIT1keekYPgyDCN749PTS
         YjgL04Jc5b6PrEAFJQdNMFJC6nSG6SZmE0TwgtSvXvqlcMk9SZ5llJXlzbHOdl+/+ytI
         uKtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEXixI6Ra8j+udBbj5lJaRhiFNWsfvAmDqHbNyY7TqPdJ/tfG2yTcTkWN7iOk//vbN0YSAEC+jgrInIf8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPNgHVnVD+lRbZskkFJLK+4u5XVFuOn1940DSZPCMyqEjhLk1V
	lPhFZ8zlW54dMjfIgOEnMsTOEvLLmUVr4WZPLbbfi7umRKZ2FUQFtPKF
X-Gm-Gg: AYBFou1fdAdO43D4PCqIMEJ0YmM51fxSe6fjlRkyarz4GNzW2Wf9/B0NnSEUI/f1TJW
	r+sODhdISE+IQsGJoKrkL77AUPSzwe1zYoCQNPW1EHNaJvsu7ECbffTB2DS/RTyN12RhiXBKQIh
	EIplDrna4hdDdxXqG7WvDUmPPwTDHCJHDF5GWx5TEBy8qfmFHXxFtlzRjcKzMHPu2GjxfviNaKS
	8NdFfKvEGEEsVMPq/ssEa4ZVqjbZOXXDmlcWuwGZsBba1wy4MFB0d4oTRNbJGeb1Lvoq7874F7o
	+T09ZfdaqnGuryS3vxYwISVvzHURqMiHwodXWVgdgitHaJz68yOH5RxNycs3WlKTblz8kI0gqWE
	kcr/Fc8csCI4EfsEvyl5a/DAIjfw6N0Xm9iH2MEeZXySFs1ohzN7m+oMy7QfkBucPaAa7GtX+Ib
	uX/6grnvRA9pe3+fF5KWWdlzl8c1zqWPvkByw1CnJez6QRW865QHXgcwl/qhtnQ9V0ybDHRvhJx
	iYaL26iiFGAwj+NkDUcjM2SNQNVqFExpEEJO+MmLZRqFUfHHw==
X-Received: by 2002:a05:6a20:d492:b0:3dd:a196:69e3 with SMTP id adf61e73a8af0-3de9eb8f535mr2002403637.62.1790788373509;
        Wed, 30 Sep 2026 10:12:53 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:53 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 08/10] iio: adc: ti-ads1015: use managed runtime PM setup
Date: Wed, 30 Sep 2026 22:42:02 +0530
Message-Id: <20260930171204.12863-9-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_pm_runtime_set_active_enabled() to combine setting the device
active and enabling runtime PM.

Previously, probe explicitly called pm_runtime_set_active() followed by
devm_pm_runtime_enable(). The managed helper changes the teardown
semantics by associating runtime PM enablement with the device-managed
lifetime.

The runtime suspend and resume callbacks only update the conversion-mode
bits through regmap. They do not manipulate runtime-PM usage counts or
other shared resources such as regulators or clocks, so this change does
not introduce an additional runtime-PM reference or resource-balance
operation in this driver.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index a790f694a1a9..9312822218df 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -1046,12 +1046,9 @@ static int ads1015_probe(struct i2c_client *client)
 
 	data->conv_invalid = true;
 
-	ret = pm_runtime_set_active(dev);
-	if (ret)
-		return ret;
 	pm_runtime_set_autosuspend_delay(dev, ADS1015_SLEEP_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_enable(dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return ret;
 
-- 
2.39.5

