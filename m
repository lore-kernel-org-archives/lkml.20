Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009101;
	b=Y2EMQywaPWU4va71jP6qjzkSwBH0wNAGEVWarrRM9vnXfXd31Bjc9okNXs6LSGzHJ/KI
	 VPff4dd7a2FjL5hDNlRCnbrQuw3lAy5gA3jwtNSQSJ5jAsOByyv+oGH6FQgSapNBMf3Pa
	 anzbv3OlbNf760OptG3rCffISrVGfowH1c13++mbLh5j2gOG1vTLI0VGoEExHSlD8pD5H
	 /SRXB2AsNLtV0qiccONAujd2iKZtdt5wgzHLbmy8St5G182IWxBtrDH7onvle5k91kDla
	 tPoqhNfka25qE4KIHGBk05rxo0DGUQ2LTepTJ7YlCR5ddRfLQcjk1ehRk5Aq0rqdP9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GmPoTm80w1aA6jNGqFN5qwBH3dTXLvg28noXFFNUWug=;
	b=ZQ8XanxUls6h3rbhe11te/rwJ9UozHB+8qgDloJUjnkCpJQ8hUa7ho6Odp+U5VPMIw2A
	 SLFqhjx5bG53mzWwBY1eaH1Nf9WS6e1WuefLg/51sKIFG2/wj69S7v4bmmDOwCh5/Vp0m
	 9+0ddhqQIYti+/WXxQ1qA/YQ5lTc5ehicqBHiN2P/hsBaVyYVuh63LiB0qMlCpTdwv+Sw
	 dslM/2cQU6ij1a0gISZI5wMkF9fchPGHTOIPZ7gA+KJ4/XT/GZ3B3AxagUXpJ3Lu3cYjM
	 cj5WGA4cX3nqVDMZPLu1pD+07XbDBBWjbF9Me2teaMhwyqwwNlqMqRzNCCUYTt0HblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uu+CGVoV;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC460A2612
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AC460A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uu+CGVoV
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so6654152eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009100; x=1793613900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GmPoTm80w1aA6jNGqFN5qwBH3dTXLvg28noXFFNUWug=;
        b=Uu+CGVoVGuppEhU23WpAU8OKLtB7yHnTsm5kGbBiaOepEuS5LZmXuA7RPG85nTrTcj
         cJAy4LXdYDSbK6n7VysQDu9nC+galbukDwt6O/ylWyhD4zPrXwsLzZURj5PCk6PDmIZ9
         2IfC2EqmhCnsu2xqGxqtS87hXkyD/tJrH18C/LGJfWXzrHbMvRk0teXXUdy5AfYw4BUg
         D+4HaXKQz2woTld0uGJWNpILmHk2fT1WVPuNh1Mh0vYoeXXI8mMllgkYRdGIyjZOhGYo
         jsTHrGYhGHJzkvCJCCYQjB9oHwEJU4IrpsSJ8iUo10Fq62TBboJz07fsHlr7FeLYac4L
         +HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009100; x=1793613900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmPoTm80w1aA6jNGqFN5qwBH3dTXLvg28noXFFNUWug=;
        b=tFNJmse44KfPRs++UpZF3mNXMHJ2ShQdzID5+fok1S5IB0JDHRewM/iwQr3/hW50im
         tYE8H3TMr8KUNiS3YRr5BIFL1IwENveafAurJhiKHnYaLdt0sMI4ft2tpLmg9lQGNXSQ
         DOii2M8d+XceC0G/w+RhuPRutYxpyTz0uphOD08BEPeNj1wPlALgO97OL937/9sWOQIT
         cbwacFgi397i1fRGJyfAZ4LLAV+9MsBPZF4TMVM5LoAkeSV1vMf04wjm8JD/kloEXLAx
         gTBKvIjql/jciw5N6PBnxOK2kgVF7PFA0jJpxRJmG6o14mXe/1bGBBdBjJZ7t9ZgE992
         DSRw==
X-Forwarded-Encrypted: i=1; AKwUvBwVP5ZNaoC65IpZKc4qkSH/kK5SWfBGVHC1fftRMQ4XYTyBK35DaGBHVneKdpylHfP3DlyJkOT/0mx3VD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU2dk+Ikl/QIClTmGdZN4ZBarUBzkcmaZrxke/P8ws8v6t0UTk
	Cb6VHQvHWd40Hv1+w7nwxQm4nkpJtTCkGhADoE5cqk6MP/nMkZ4lFsbk
X-Gm-Gg: AYBFou3iPqeEjHGsZIAfpf77pvV34YcjMf4dAg8M/W957v+hi8rEntVvZYj5j3f8Scq
	5jF3Wp0s6+4uSh8/zVRvZUJdyn5GO6N3mFwNyZ/Fx/s1AxNdDeLoRd1+13yKEBhOi9gdap8ECiC
	eaG4dVj/di4xgfEfpVa0gc06xRybLlYRNMvmvP2RIjQdmijBKXiKKrROZv8m0BTbtwO8+0MKH/n
	u7CXjrEqEDnQ050Wa4OjUrF3G1e9KlA9XaStQqJGRe/h1ewhqkQwV2bU/Q5YTHs141/0BZ5ttmd
	Fhj7WqIaGGadiWWebEKe/7GS3X9XQDEtkt3P1ZIO3Y7G/GGtXB9w/hgchkwU86PHZgzeIITUHlf
	LIhtnP2WsOMm2QXZ83MTuyjLDIbQ56T0wr2QOf7I+okovrDexIzpY4B5LhDd7kn9Uw8lj6AbyF2
	M0ev9ndiMjdZSGxhm+mQIV9+amc395b0lJ+ff7m/X8P9dBwDZnAQ1IPMV+Jk44mLgTdD6B6/Htf
	NqY+xkW4yvrejptDq84nQ/DWMiQpz4kaWZXcEtoSLmNEMEeYiJ/G/3eZ+YCGWDZiQSNXjiKxFze
	DGxaSLDqxkn2V2nm2Hmu0eAQpG4c8kuNn8quf7jH1YfII8aMM8RzWOckzNcsICtDRvTxT2QPrf0
	Y7DO1TLXULzwkOsi8vI0/ZKyiafaNvxTl
X-Received: by 2002:a05:693c:41c5:10b0:35c:e696:2d4a with SMTP id 5a478bee46e88-369f83ae704mr5296092eec.24.1793009099693;
        Mon, 26 Oct 2026 03:04:59 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm29726211eec.16.2026.10.26.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:04:58 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: proximity: sx9360: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 15:34:47 +0530
Message-ID: <20261026100450.17023-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9360_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9360_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
I'm sending the same fix for sx9310, sx9324 and sx9360 as separate
patches, as the Fixes tags differ.

Compile-tested only (W=1); I don't have SX9360 hardware and haven't
reproduced a failing suspend.

 drivers/iio/proximity/sx9360.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index ed83d809ecf5..85b83d86a433 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -797,8 +797,6 @@ static int sx9360_suspend(struct device *dev)
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9360_REG_GNRL_CTRL0, &regval);
 	if (ret < 0)
@@ -809,23 +807,32 @@ static int sx9360_suspend(struct device *dev)
 
 
 	/* Disable all phases, send the device to sleep. */
-	return regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
+	ret = regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9360_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_update_bits(data->regmap,
-					     SX9360_REG_GNRL_CTRL0,
-					     SX9360_REG_GNRL_CTRL0_PHEN_MASK,
-					     data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
-	enable_irq(data->client->irq);
-	return 0;
+	scoped_guard(mutex, &data->mutex)
+		ret = regmap_update_bits(data->regmap, SX9360_REG_GNRL_CTRL0,
+					 SX9360_REG_GNRL_CTRL0_PHEN_MASK,
+					 data->suspend_ctrl);
+
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9360_pm_ops, sx9360_suspend, sx9360_resume);

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

