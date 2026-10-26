Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013838;
	b=NmqtAiPkS7NNR2VT/YQBMHJNi7GpjwD2R6bPC+EEdurHD5rbrh9d0wmu6gdKJTUtM4Ju
	 mR9IPIjZtOnR89mhclnSJBVICgATEg+xNCGLWElzwpWvp3thT/PboaGyxfxBrp7K+IF8r
	 2EmqQ2hxHhQDINDjvEtQ0e0GoKWuFe2FgWeOFshfgJ2d7V3ZOEBIeYMWPajOURBEOQMcf
	 aWGe3/OdG8kG66eBQvSiK7jrS6wOFJLFfBSUYevYL/xC6vs5bt36RSH4tsvPj/Eg9olAO
	 a0ly7s/bUywfs13MQu0EXnH3b5HwCbYrDURtlPNofSS0gH3fsxB3JtphHM311Z+8+WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WdkOB6VcqgEBpO4s2s6iFSqHY8CcGzvsCx2rzyCP3Ao=;
	b=jlGam5HT6gryYWY8t9beRaxsQgZn69l7kOHD9yj+6ZVpSixvq4DSwdhdiG3HlwhNTaS6
	 kzwDL0hl0+GdwFOLEQ7S6t9P/JxNuKb5fuhxte5oYkIlAj6MxMn2exi4T1DzoiWRbQAb5
	 38fBnQkWiHMQssu11raIHl/qjr6Bggg2Pcoqz7+cqkxks6fVxrKUe2BAT2xpBcPs4+dMC
	 7ihKHY8sznK67IMD29qZBu3eoSFjn7DXVigdxxCo8w19tWY8q4DxvTUSa641XVOdFYq/e
	 xdzps5LI81wQs2S8I/1oohE5xXf59LjhHL4900k0iwvXsVJuFtigmGD8Ht4tSbF8t5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GY0kZjy7;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B2606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845B2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GY0kZjy7
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4807954eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013838; x=1793618638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdkOB6VcqgEBpO4s2s6iFSqHY8CcGzvsCx2rzyCP3Ao=;
        b=GY0kZjy7GNL6frg9u7inlu1Qb7hDKFMuTFeosW/Zi6NR/2VutCyp6774hKOZLIQ4Uw
         hZ9aejfoH4Q6A0cWbsooQGLOzV+Y/DGxkDLhQz+tNqHNjNTRgkbY3zTpr0piYPpUDqbk
         Qbci4KibkDYh77Oxp+9zhMdxX79KPOaIVWdVOuXWTcijp9fjvNtKiUHC57lTFPNUxJvO
         3Xu0dXA+1LCQXqGFIQsPwkHZ0ORnHEgjVW0hF56fHT2lH73DytDLyWrDoNjxwqC8pSHx
         3Eql/I5qwXGP/J/uDYuJI+tgmgN5k9+K1tvVvDcB318pajZ/9YTIvTW/1OBebeFey5Yr
         FdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013838; x=1793618638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdkOB6VcqgEBpO4s2s6iFSqHY8CcGzvsCx2rzyCP3Ao=;
        b=B0RrLo9b4HgEDSti4gls84bFk/bbi2v7NibWiL98gLMcCC3dQiWdtUMe1CDnurV9bt
         EmlSPeL0ztJl1e7Wy+lM5gXol8TMQJV0CiR9cJWi1GJTniUbjKzcrO2eDf9Nzn5X8WG+
         w87Y2bgFSjFUihp/5SJqNYwc0QrzyCz0kPQzarUTVT9qmUt0r15z5+d25aLpE9780+3k
         PXfrRzkMPCKlwOMGjS8xRxJ0HVDz1esu2thz56DNg62kG9rbdKmmKdxQuspSeKz4EkXY
         /CuFuXuF+I2T7giR35jlrJJU47CU74lXIUjmB3/nfBNyE1002cnef7TPZkIcWE61EMOF
         kbhg==
X-Forwarded-Encrypted: i=1; AKwUvBxRh5f8pkdKaTc5LTlZ9X1xBVWY39IhCZQwlBKnRGn38P9b5eu0ZC/9ZbaPuUUJfTApxEUzyOp3tm4LPsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVHgGS/ZD94GYOCFIfq34wcfVeZkfQ4Ibh97TbwOH3rJvUrgSa
	VDfBgXsSkOzdo1WjqJHmnSeL6AAKORyXX4liy1mVvZH3b+spovmVl0sJ
X-Gm-Gg: AYBFou35NFH4J1NtnYmY9JFsFxWMnW/YdI/nv+mRZ0ezXPZMILBqF3owvJUTCwO3IOi
	xAgq6iJ36ITZ85ULJUHD1bO8soB1gbarW37p3U94GviU5/10wxNTPneqbET7AO1LLP+LpuPz4Dn
	qjUG0oC88E/SkbBUYPV66lpdd+2Vbw2PB2hsopivO1VEQKI7Sj7oCOKyF//2beXLz6reXFkW6j3
	eBkEDy0OhGV96joVbC7AWBeF8X+xdhAxBxOTDslSoI7L4U7rHUaGk3mrNoyIne++J8miOrFlyP7
	C10NhAO4jAIZZUCbguEs5bPs85YkEwr0ZuBtbk3LBpYMIbenFQsS87QybkORsaNUxVUWyYM55LW
	p+Q1rTaADP1w1zZEU2ycqO5hlGTx0u1tGLR4lB3KK4zgeoAye+zqhIrnlzVWPTfh3ZAcUIIKkXl
	II8PA0ksNvUKUzuhvAhJ9PpYXnoBmJ6ZF5IT9EfIjlTlc1iQoLuv3JgIF5CuLORW+vWyWv+whPs
	6guAoocxVEpiXDfw17Q719IZu7iZxV2Ll8CSSz8DKvObwsA4TPK3ZGXElHRR2ywR5elJrAjv4nk
	w+DZbhSN9p+Sb0Sr2RBL914CS4rQU/LBKBxf+7jreKgkAZY3jnyjzoQHX5UEOmdS6FCfnJldhH3
	SW/KHmJ9u564=
X-Received: by 2002:a05:7300:c8c4:b0:367:6d85:29ef with SMTP id 5a478bee46e88-369e861b789mr10833374eec.27.1793013837476;
        Mon, 26 Oct 2026 04:23:57 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm6599989eec.2.2026.10.26.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:56 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 1/3] iio: proximity: sx9310: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 16:53:04 +0530
Message-ID: <20261026112342.65917-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026112342.65917-1-kapoorarnav43@gmail.com>
References: <20261026112342.65917-1-kapoorarnav43@gmail.com>
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

sx9310_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9310_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 41 ++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 79ba46d8a0aa..fad1dcffbe26 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -943,8 +943,6 @@ static int sx9310_suspend(struct device *dev)
 	u8 ctrl0;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9310_REG_PROX_CTRL0,
 			  &data->suspend_ctrl);
@@ -956,7 +954,28 @@ static int sx9310_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
+}
+
+static int sx9310_wake_up(struct sx_common_data *data)
+{
+	int ret;
+
+	guard(mutex)(&data->mutex);
+	ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
+			    data->suspend_ctrl);
 }
 
 static int sx9310_resume(struct device *dev)
@@ -964,19 +983,13 @@ static int sx9310_resume(struct device *dev)
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 1);
-		if (ret)
-			return ret;
+	ret = sx9310_wake_up(data);
 
-		ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
-				   data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
 
-	enable_irq(data->client->irq);
-	return 0;
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9310_pm_ops, sx9310_suspend, sx9310_resume);
-- 
2.53.0

