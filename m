Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680673;
	b=aA7cZ0y+/p3D+Zxe/E3GoSnZivzZr4qcz4a1q9lar60BiYrQaMbZ+KAajerRZ61pVX2K
	 cpzsuzz2duHp5rTj4ozGFldQsNOSEyjB8mKJwuIlCvPpc7XlBsc/VZNYj4QDpbESBfU9B
	 niF5kYw0IH7WmDYjpFfNk2DB++hClFh7htegNRbrox7ZjO3eBnr2XbRBbbC8sI5V+sbaw
	 vkhvfHIMzMBUaWGs3XGXWsLc/SwYymCLMJBZVSqmVX0rZLcQwH15FJNURv8uK3H/w+he6
	 1QHWss64UIrQ4rZUiCr+jNnm5Gx7fsh4e1jFsJhdnuHHbhAtnvGPG92bzZGzgC+lrgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
	b=3b5X9GzsHrfmBcugTORMCrdQUFDI/QRU6BHVKOeJLlahTZA0lKuB6WhP16HaSKasTcQv
	 CIYab7Rfq+erK+/cEdPR3O+qPvcX2nlZn7zLwXF2HUi4IXf5HntS0WA7Ph1wFwm/x+7u+
	 r54TQQI5lhNODQkGSsGEGXd7hNV3MUCuTFEVdMjigUPjPDO8gIH4yjBQplB/bzjii0Wex
	 7vLz2VjP1sXLHZhWKSqIIZjnhc/oYUh9/b77kGm+Z6DvLTuA6+liK5+cFRX8QytPqezNA
	 Onq7ViGQxPJ71HInXx/6g5g4GUqe85jqPkqxUa5oGJHvWVxR96cTkQsCPm6OJ7m6jTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PdJvRmCB;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7D606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A7D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PdJvRmCB
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1003762a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680672; x=1794285472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=PdJvRmCBW1wQ6OU3g6wpWwu1J+p3JTzSxLtDdRYLIr9+zCvOFml0datlWZ9ZCXiSL5
         jp0vGuECBDFT6Qk+GR4a7krValxFzz4CC2Yy4WM6IlDhVb1rY1oHPLq63weM1s8yeQlx
         ODTMOxlqBLRuml0PHSxQngt/9AX7NwITY+2VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680672; x=1794285472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=z71yaXe3IC6A6C8AyPvIGRV3idA2B0RRhz3h+hu5CD28BiRXo6oFz9v0Fum+yzSaYX
         IL4wcS4Y3i9k9vizbaCvn9q3td0SdqPFMVIf33vOkrx+SVSl0lcICCRevfA8ck1zgFcs
         YsJ1XBSYaQ51jowNt6Nv/BiObE1L4w8yOuhiUMQe/Iprxf/71pdLE4a4WgbyL3LwilE7
         PDo04W1sXg8YqC4h5KN1ZUrKwdHiQBqOIAZUvxL+DRY7Nj82Qt3WKbsS6j2bWBevbsil
         cgoMYWbId0CBLC71WJnQurePK1kiPIkh2K7D85BBMPchlNU/m2s074zKCC+gspLMiVa7
         ZuTQ==
X-Forwarded-Encrypted: i=1; AKwUvByzqxNgyRQA72u+h744p/9LuMU4tCHTzw21Q5hL4dFfnUTX+6tdzrIYa0pIOrXcDRtv1fdW7RVgzZtHumc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WuychPGua2bld+kZ2XB8DEHGsp+BxQvWrlmWy3y4LQcnKomgZ
	vSUzkR2RyvZ4MV7ZK1DgjngOjwwTWNrf1sfXSxtMdDmguAUcP1iaSgBEil201KMPtg==
X-Gm-Gg: AYBFou228l04D8PKpDgO8V1N9QMxNIetk8QzBk9fBXuztdcn7KW3dX1vT4fNZpB5UH6
	/xOv+AcnQlu1tovSPU8Kv8X51FI76ATjYGASiOqA11dMkHfRZvG0RkGEDqg6MQToMA42jpsIml1
	+kSjWJsrIoNOXncnkY6wG+S6F/qVdAyZakBh/hM+2AZMRSwxPFJSHQmOOzvwuifBa3lmhuw2A/1
	DlVvoV2n//xNhL0M8hximZK6RJ7X4pzp37oAgm4vTcqi7UskKyQPSVhZvJgFfTiEljuSWCRnqM5
	IRP0owMk2TkpNFMa/5gxrekZtX/4GPbz4Poh3O/igi96yo4EVRwWIPx4AL9vuXgPGexjmCvM1Om
	bIABUmdmXjUQz1kRqAVV4CE1RshxupSw7w95fA7DPtDvd/YK23li/D80nu8NbPZ7RR0rtFW9Pqx
	A9a+N/GjVkBI+nuVcQjfhVlloi+UojN6/M/mdmcRLpIkGFfENxzPomRcyHqpvgKMI8zFacliYgp
	YnXknBuuNR/XagT9VpSAbFirOYUdDDrw/7+lv1YBHlMpXA8SlbX2FdeDEAPLEeBrrulkPdFPrEu
	4sYKkHt4fqIs3Xzgcl9QizRhj8cjfB7dMJ0fZxPvnt619nvnXsU6Kvog3qQLrK+oE8KXNH00+o0
	GX5LZlcR7UJFo
X-Received: by 2002:a17:90b:562d:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3ae898385a1mr9902090a91.39.1793680672423;
        Mon, 02 Nov 2026 20:37:52 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:51 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  3 Nov 2026 12:37:26 +0800
Message-ID: <20261103043734.2179858-3-wenst@chromium.org>
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Cc: <stable+noautosel@kernel.org> # needs new regulator API
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag

Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.56.0.385.gac671c819a-goog

