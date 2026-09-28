Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC44EBAF6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612797; cv=none; b=GKfgtONfyVJtgfbsrFXaCRwhkDJU7yCxLQPigcUFeS6z2gS18MBUhhMsiqh5f7ty+KHl4+YunN00IPbaIeEwd24uhQ//azhrwK9pxBu8g+4FgtynHw/l+zdA8RwBjyU4bPNBJQ+hIcSG6UIHLuZTtk3Q0hQzGJfd60d2nbxYkGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612797; c=relaxed/simple;
	bh=5qMEBYIqzSpO8j+a8K61dlz/uaJGGIy0JV+7Qm1pdBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPcj8RoJBFKYrfUybC/0bmYqRo2DQZIpVLr4pVvZMhMbax+3dNGsHHKy7yqhlQ98N3SAsyxeYZqNHh3+YfuHd8fw9Gide2uNp83X9To2OaWNnkPMIPPrsWBWSatxD0+/PXJkixTug3Erk93IezRZFdk79jRdn3dWeoH7rtlV3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WskxdnTU; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WskxdnTU"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6ab0c3c3af6so2937915a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612794; x=1791217594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrGBtoUEdw4iEkbuZg8N5yagEcFZ+faHEQSH2lP9JTc=;
        b=WskxdnTUSXPrMeGNZEJs/lt1ZnT10wyPxn6Z0Og1hXpeLfuaXmYgtQ55vtSnQq+W9I
         3CFof7iT7Ui/Ptamsi+kgBQFmC40N18CdpR9/ImxkbK3FQzJf3r9oBKthdT8j+bEp7u7
         2spmJY7+OQqKBSbCT45rJrVoBXslvUCNxDr0B0lU0lezKP1i46F7t0/rs23PL218AOgT
         E5SMU5pg8Jv5Z6T1Y79bTgTxhX9ffPGUMNr0xONHoPndlmZWm2vu1x6/z8Dm8QvuCGkl
         ikO8T2mJGgQmZugYKxRlH3wQo4z2oBlKIm6EZl9OdVkh6XAlc9Iivc2KxCIgOZ++HLft
         9k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612794; x=1791217594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrGBtoUEdw4iEkbuZg8N5yagEcFZ+faHEQSH2lP9JTc=;
        b=ygSafSiSLRcfZE4zftViaqaKSdTAqSiuUeAwtMPxTrCBiHtAT6mnGR8SiutISdiE+R
         u6ZHi9Ekqe6qOJnKCVuTzhG4lmpwaVgrhiCtUTCePVrgcuFgRRk61IdZw9x3oYuoXsmg
         wWSuK7zZCyt+gsxz1sMlqsUwQz5hxuVHjN5mximtmjb8KWRDG49+YZu/eEhkC1TrPkf2
         p50DTQrIqqHbDTV0wpXEWcGkEW+lzhOkN8wl5LXFX39ErdpsBc2ue2CedfZjQb3NhowB
         7H2r2+lT35/pErNH0zntoavJNgcRWBVacDgK+bghPu/5GKsaFVQoZ9opclYrqfyVtShG
         Rg0g==
X-Forwarded-Encrypted: i=1; AKwUvBzPyqsDLZnj9Uu72fdlK+5jp/XD02IAkHIJ++gVr8eksEtZjCguXIHdvqt5IjHgGC3/2o/4PxeH5to2hGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOLS628qelRxBVM6A6McusP7PzUoCxxdz7gS5sqz7/O1WWFJo9
	whD3OKo+57ko6bx7Aeb9DxkzavbcZBCOmmWOL3X65sLuMtBv3mKtZ73M
X-Gm-Gg: AYBFou0vbsttpgZ7Wh40yvs1pLozGPWmhVQMWmVKGdANVz/YaKtoVEHimX9PONgDm6M
	zsgWTzCXGFpuBIaAWwAbZzvUD/SymvAvbFW5IJSnlGM5oWXXeruWS9QPNDBEoPywk91AZn4i0hW
	AeYark34UVO2dQIN6Mu1sk513wEWbvnHYk3tfBhVyneEBtJyXuLo+Aup475VYj1Ucp/Ao9w7vKc
	PzXm+3j/PPiEKrwggfH6qEyqkHjf9NoCqeE87c1iCYKHGQPub7ckkBRky9YIc2JSG5i9H67N6rq
	lmoAscWJHc4MxD5mrv1nabYUKNQnAMOJvh+SZIY2UG9oJGXVM4g/63PZ+LOKP1XsIXJlREWoY5t
	+7vrHiYWWiPzm6AkGRHr/r7E4qZbdKPiTliTrRd8v7zdtMeRWNyv9sDVrVHQHQih12Boe7j3GBQ
	toU6b8DxU61jXcfqPlErGFeiY4ACCBHSUNHNezOxsbY1qcfLhwPAZz06IOHz0561j6WWxzrblF8
	FlfATTR3MkCM5+qETSMumENLCqcDXd1DL7qOKTtE6GRM6o71BOZlOBT51uqy0kmJBvUBnf3rDfp
	Urm87vnY804=
X-Received: by 2002:a05:6402:5405:b0:6aa:a7c9:8c16 with SMTP id 4fb4d7f45d1cf-6aae8f4dfe7mr8167788a12.35.1790612794366;
        Mon, 28 Sep 2026 09:26:34 -0700 (PDT)
Received: from localhost.localdomain (84-216-182-59.customers.ownit.se. [84.216.182.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9a72sm4277474a12.7.2026.09.28.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:26:34 -0700 (PDT)
From: Pooyan Azad <pooyan.azadparvar@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Herlangga Maulani <w1zardsec@proton.me>,
	Rob Herring <robh@kernel.org>,
	Jeffrey Lin <jeffrey.lin@rad-ic.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] Input: raydium_i2c_ts - validate report parameters
Date: Mon, 28 Sep 2026 18:26:16 +0200
Message-ID: <26ac42dd18a98c4928cbe7f6b6adb4b396be4c8e.1790612085.git.pooyan.azadparvar@gmail.com>
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

The controller supplies packet and per-contact sizes used to allocate and
parse touch reports. The driver trusts these values without validation.

A packet size smaller than the two-byte checksum makes report_size wrap,
allowing the IRQ handler to read beyond the report buffer. A zero or
undersized contact size can cause a divide by zero or make the contact
parser read beyond a record.

Validate both sizes before publishing them, and reject reports that
describe more contacts than the input device has slots. Return main
firmware query errors from initialization as well; otherwise rejecting
invalid parameters would not stop probe or firmware update.

Fixes: 48a2b783483b ("Input: add Raydium I2C touchscreen driver")
Link: https://lore.kernel.org/r/20260728135127.48971-1-meatuni001@gmail.com/
Link: https://lore.kernel.org/r/20260927114425.442803-1-pooyan.azadparvar@gmail.com/
Cc: stable@vger.kernel.org
Reviewed-by: Muhammad Bilal <meatuni001@gmail.com>
Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 0256055abcef..03ea0ae62999 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -64,6 +64,7 @@
 #define RM_CONTACT_PRESSURE_POS	5
 #define RM_CONTACT_WIDTH_X_POS	6
 #define RM_CONTACT_WIDTH_Y_POS	7
+#define RM_MIN_CONTACT_SIZE	(RM_CONTACT_WIDTH_Y_POS + 1)
 
 /* Bootloader relative info */
 #define RM_BL_WRT_CMD_SIZE	3	/* bl flash wrt cmd size */
@@ -332,6 +333,7 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 	struct i2c_client *client = ts->client;
 	struct raydium_data_info data_info;
 	__le32 query_bank_addr;
+	u8 report_size;
 
 	int error, retry_cnt;
 
@@ -341,6 +343,23 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 		if (error)
 			continue;
 
+		if (data_info.pkg_size < RM_PACKET_CRC_SIZE) {
+			dev_err(&client->dev,
+				"invalid report sizes: packet=%u contact=%u\n",
+				data_info.pkg_size, data_info.tp_info_size);
+			return -EINVAL;
+		}
+
+		report_size = data_info.pkg_size - RM_PACKET_CRC_SIZE;
+		if (data_info.tp_info_size < RM_MIN_CONTACT_SIZE ||
+		    data_info.tp_info_size > report_size ||
+		    report_size / data_info.tp_info_size > RM_MAX_TOUCH_NUM) {
+			dev_err(&client->dev,
+				"invalid report sizes: packet=%u contact=%u\n",
+				data_info.pkg_size, data_info.tp_info_size);
+			return -EINVAL;
+		}
+
 		/*
 		 * Warn user if we already allocated memory for reports and
 		 * then the size changed (due to firmware update?) and keep
@@ -352,7 +371,7 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 				 ts->pkg_size, data_info.pkg_size);
 		} else {
 			ts->pkg_size = data_info.pkg_size;
-			ts->report_size = ts->pkg_size - RM_PACKET_CRC_SIZE;
+			ts->report_size = report_size;
 		}
 
 		ts->contact_size = data_info.tp_info_size;
@@ -428,7 +447,7 @@ static int raydium_i2c_initialize(struct raydium_data *ts)
 	if (ts->boot_mode == RAYDIUM_TS_BLDR)
 		raydium_i2c_query_ts_bootloader_info(ts);
 	else
-		raydium_i2c_query_ts_info(ts);
+		error = raydium_i2c_query_ts_info(ts);
 
 	return error;
 }
-- 
2.43.0

