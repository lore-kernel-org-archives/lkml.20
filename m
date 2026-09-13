Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3B3385D9D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289640; cv=none; b=CmsnFK6XHo8rYqpOBmcBjrDo44px9zwEX2iX5JT2gIeI5AAauZwhsuYG6dFfPRxG59DU5iSgTRVs/bCvqQ7h3DyJSIlb92+TH6M5eyxk6A5Opu8fdDatJQ8cCde8ks+xPTwrtdiw/OpRLYbWHtJ+fQa1zHDTPOmYb6Tb/N7UBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289640; c=relaxed/simple;
	bh=envbLuQDbQDDEWH3XcYF5G304K0mIQCtaASdr8Op0dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFwotctg4YG4k7bEXxqdEPGAv7u9A1qcee7oWNXg7k+0KQtR1O/CgwBQwDWX8kjgWIde2HqA7efRRBzGzOMMpF38ACNrQ2Y9kANHg/X7atWRO4fSaLjfzklzEz7FZkg0LibhSSQCZC8qOhHAZsDQ8k4VOArFdLI9Kdm8byTHGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCXOjZ9i; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCXOjZ9i"
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e667e3c45so4786815e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289637; x=1789894437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDLkgYBNbtyZoarKCnkrYArqCb7j8Bh77/axESvjCE0=;
        b=DCXOjZ9ijXzDxYixge4RPYSgc5mABw3Rhal/7gdgkFzXagRkIFnJYpX+XZ0oHll947
         qrAdVpZZnHr7uN4i9XAFs2QZD9cngEabnU17kkJ6bg5525r1wi3yu/C+Ip85kc6lM22F
         7p1kpyeursYavGWlsnOOxUSfO4NbNzbnJkmybAp62i2FxZ+5rLb9Rsq+2T/uQpWzG3ac
         ltQHeo8C6dp8zVz12mVhSDPC8CQpgSyG0fQhzrUTgx/w75rD7KjCnfWTL48Hs6X/YcYA
         zg6pQzx5QMFuiCdFKVaQZj3mZYJvC3ZBupO1/i0YnOttp4rWdfUElQXTeCDgNYA3iyEz
         oyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289637; x=1789894437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDLkgYBNbtyZoarKCnkrYArqCb7j8Bh77/axESvjCE0=;
        b=Sp2ZJ0e6LmC2khovgcIqfcIc22ngyn4qiFHuGZmU+LjPlAhsThrKZJo6Tc6ukaEjPX
         FsMBCqpt1QU/LLcob0YGe+YMBVIFXuD4uJp0mvyslve6N5/OraIkXX7mj25DpC04jLKF
         oJgrNdEQCdlqAMXVr+d2nJBheHDoNtzAPxvE0xqQwErnzS7axfg0618scB9P4CDlkUSk
         SgfSSEF7sHj6MP8qb3NyHdHxqD2fcKslzMKCg033ZBebiaWWxhMprYXFa8miP1m7D9L6
         R3NuCUboA6zKisuoOAQuJqeOyq3g5XkcLKOr8s0jqEZouY/Yo9H+rMbfJDFh/FVhawRh
         euhw==
X-Forwarded-Encrypted: i=1; AKwUvBwrWSMKXpuCENIEq7wu73ZoaNzWPD62QaCqpXDqD2mwO04t5m2IMb3ra0MoIxPhD4Iki4OH9gOZ5WMWfFo=@vger.kernel.org
X-Gm-Message-State: AFuF++lc3B4GzRiUteV+ath0Rwso7nJANXWruTsYrE/ZENYbBj4rFs2W
	60v9xapzF/d+Bjp3ysYERE+u6nxf9D5hs5+lIRRb7Aoa0EVuYY+16oIE
X-Gm-Gg: AYBFou0/QVg7S7p0QKaeHQyf1ppfeEusg4nuQs+aYzzP2dn+ykphRE/Zp21HYCwxdjG
	i4d6Y5JMX4ertexHDiaphy3ptZYM5a+K7iOKgmELIuTxJaRqrQFPDkZirF7zG5CdHW2JdFrwnG0
	AksTnSceJmBZh4AZfD5yCsK2nYiRuGlu8P4QDYj+7LG7+jYWmq5V7/lutVZOMXTtPw4wBPQtHvp
	gBHmuwWYEJAnf0x8xiedo1jKPh+AA4cD449o5QjC7foCwnojPKzOjPdPUIo/t+xBqARA3QS6mp5
	SK2FHhKjb7t7nnJbhbHGlp4akAICoFxfAMqshEEKu89AgLuSz1M+piMLjSFl3da+T40Yi/JgdBA
	rs5k5zm3TL9Dr/mw10J5eRQR9z2vO859/YxhOJJXIfBmjHx0Hhhwnknmf9tV69kFOitb751c94a
	nQnuqU6Y/p3BXQIXB8XL6EwAfS48cxPaDEBo1DIH4PzZvdaa1O2RFcl/X4D8mhwKTlpPBx9Ffx3
	B5fO2NqRCqV4tzQPeU=
X-Received: by 2002:a5d:6f17:0:b0:486:fcc8:aaf with SMTP id ffacd0b85a97d-486fcc80b06mr1476198f8f.26.1789289637449;
        Sun, 13 Sep 2026 01:53:57 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:57 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 2/6] iio: accel: adis16201: add OF device ID table
Date: Sun, 13 Sep 2026 13:53:03 +0500
Message-ID: <20260913085307.13846-3-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of_device_id table for adis16201 and register it with
MODULE_DEVICE_TABLE() to enable device tree based matching.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 1e76a3560..2ce5c409b 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,6 +288,13 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id adis16201_of_match[] = {
+	{ .compatible = "adi,adis16201" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, adis16201_of_match);
+
 static const struct spi_device_id adis16201_ids[] = {
 	{ .name = "adis16201", 0 },
 	{ },
@@ -298,6 +305,7 @@ MODULE_DEVICE_TABLE(spi, adis16201_ids);
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
+		.of_match_table = adis16201_of_match,
 	},
 	.probe = adis16201_probe,
 	.id_table = adis16201_ids,
-- 
2.43.0

