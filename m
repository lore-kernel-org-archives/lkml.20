Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB654F96B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958857; cv=none; b=KrzFuDK88PSogj7bRQUA6zNIB4N085hC1J04z2N2Wb5XOjvJkRs9iU7y9Td4YRaTkBdGwbHyi0Ptaw42v2Ap2g7tW7emud3+rT4BJ+fSrnR3F51Do2zLFF1FUB3OriUrHFaS9bSoeKdZVXJ14N6G8AajMUiuLuVz+GBb6qTUztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958857; c=relaxed/simple;
	bh=0eK0rZW+Bb/wgQko0hLrGoTCtS96mFKwLCxqAk5ubl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8dcsvKi5Tpe1jryZNQjry/1kHT7UfZwIayrxdDowJlxAY+RFd70sl3jM49FZIK3zU34O+xqOq+6rX119WE+nn0MwfbLuSLPGIyr0xOM/+5EW6NEkv/5G7erMQ9Os00HKD1VZd9quN7NNVBNVeMsqyh+xH3jONdyfE2LEd5m+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0AElWIK; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0AElWIK"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so3226308b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958854; x=1791563654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPmxwiXeVlIKKgR8njqiI8v8S5H7LLeX96HR5dBYRSk=;
        b=S0AElWIKOPeV0u1yhooqFtFbuEM6VXaWuRTRuB7nvEoJX8TjAbf6vpfQzXqNm8sJ7n
         W9LpMdpc2yTuPSJa3fV0eiPndecj+fKtPbeLlV4uyUZXpL2ZeGyRW/IcavvhNZ7+ibnr
         VoaPQVBhM2E0EqnW9z7dKctqhhC52DU+zmc1ckw0E824CVU9X974mOT3Ibzj2H/GYq8j
         yCN/7aUffcXjo3W87NWKvL/m3L4fMczjpdCgCCw2nneYsNsy8WXl2OWmvbT0hDxVRF8C
         /SejVpkbFdbRBAd+ZHGyx1Gy7tTNVIC7wrHoki6jDTvIazLyARTM7sN5vBZCuDevuOuo
         Bzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958854; x=1791563654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPmxwiXeVlIKKgR8njqiI8v8S5H7LLeX96HR5dBYRSk=;
        b=XrUptp/xW9UREbovzP/EemFKeczc040dRSRYahAAzE0LqY+m9Pb2+Y5X4wHAJahFaV
         XTMsJTb7rzrrewCx9L9ixd7pJBzyd2l4bGsFmYwq/9kEkOHXknwzilOqbszSkoIv5lbL
         j9MHXe3bHsxIhuDDi+WQzq6gZum87ROOIv2TKV0j/v4vJVHvGpRYpPLxVCZywkiwKoeh
         K6m6XJKnY09lKXFQ0fTuemve/vbCgcXGrSE4+i017iSOzsIMtysU6yQY13RfokXeOFeY
         cEVuZUsnmkyCED2NPdJ47m2h3IxnedPtVo4mycOoxu+Lrp6VRrcwvrT/9bCBrK0fjG8Z
         bZ0g==
X-Gm-Message-State: AFuF++n36FnSIn/1IrD9VaaQXuNwOsGkutF3lTb1EJUJDdu1uy5+ajaN
	R4bWjjLMHeXkfd4gxM9Wd2/sT9MvgxyMZmp4W708+rP+uxy9376VuWr01wmv+iAn
X-Gm-Gg: AYBFou3wnwJUwhIe55Pcge5IVPq9RFs7x+9RB3YExNBW9tccVNNTDVJOHwTZ2eDyHU2
	1Q1O7qeJzVx4M5IxwlnLaviwipiJole7lBUVlPOLmToDAlwgyRqocIgKQg2AgOShv2HfPown23U
	3Pem7eFeLTD2R32yol30Lm7MMn+8/ftdBtpL2YVaf24jJti3eEjppuYv29utBda9d0Z8qYV8jgh
	btfMKZa4EZa7HrA+MZ332/m2+I20GOwofQjLy4QQ4nCKvjqVasEDPBAyznbsooB8gUAyqbdptTZ
	buZKsgT5Jo3n831/tKftDhKi7MZvzlqtsNefd11ZARPDbIslqn/SRraTHcWf8WNrsDZyw1MBfZI
	DWfKr7CgnxxEN/hPexLGlWPWv4JnUdSkHr+ZGWYaUp/sXe6fKjyTzCDI/xzaJ2uiDkhhjHVDLR8
	tBLVmLHbIWAgrtffpAiLox313pLjB77bFsGnXGaVQLMSWezX5i5MIolKlsceIuyEwm+1U=
X-Received: by 2002:a05:6a00:2883:b0:874:705d:f63d with SMTP id d2e1a72fcca58-88af4e2f1ecmr3326787b3a.31.1790958854332;
        Fri, 02 Oct 2026 09:34:14 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:13 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 5/9] platform/x86: int3472: tps68470: add static clock consumer support
Date: Fri,  2 Oct 2026 09:33:46 -0700
Message-ID: <20261002163350.1248431-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms a sensor's ACPI _DEP does not list the INT3472 device,
so for_each_acpi_consumer_dev() misses that sensor and never registers its
tps68470-clk consumer entry, leaving the sensor without its MCLK.

Add optional n_clk_consumers/clk_consumers fields to the board data. When
set, probe builds the tps68470-clk platform data from that static list
instead of walking the ACPI consumers. Boards that leave the fields unset
keep using the existing ACPI traversal.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 19 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/tps68470.h |  8 ++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 9161a656f..a11afb323 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -187,9 +187,22 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODATA,
 				     "No board-data found for this model\n");
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
+	if (board_data->n_clk_consumers) {
+		clk_pdata = devm_kzalloc(&client->dev,
+					 struct_size(clk_pdata, consumers,
+						     board_data->n_clk_consumers),
+					 GFP_KERNEL);
+		if (!clk_pdata)
+			return -ENOMEM;
+		clk_pdata->n_consumers = board_data->n_clk_consumers;
+		for (i = 0; i < board_data->n_clk_consumers; i++)
+			clk_pdata->consumers[i] = board_data->clk_consumers[i];
+		n_consumers = board_data->n_clk_consumers;
+	} else {
+		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
+		if (n_consumers < 0)
+			return n_consumers;
+	}
 
 	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
 	if (!cells)
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 3bbaade96..68303e6fa 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -12,12 +12,20 @@
 #define _INTEL_SKL_INT3472_TPS68470_H
 
 struct gpiod_lookup_table;
+
+struct tps68470_clk_consumer;
 struct tps68470_regulator_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
 	const struct software_node *tps68470_gpio_swnode;
+	/*
+	 * Optional static clock consumers, used in place of the ACPI _DEP
+	 * traversal on platforms where a sensor's _DEP omits the INT3472.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.53.0

