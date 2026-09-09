Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52A559CAF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958992; cv=none; b=r7vPLcnH8BOu/shTLimS6RNn2Q8Q4lD+5Dd5kVwoXqfQ0t1Iyigj8tNbydqehgNsNzXP+3POJv6MYCOFcgE1p8vXiDroF2xA+F1CeZMFmiCk+dIC7jOx8dmR0uEf5393zu41v6RptsZPpEdDwVrGU01GItpf4kPUWg0nZw+3/OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958992; c=relaxed/simple;
	bh=8aRTU8lVGgUweHEo4N2lqmZpdLeCLEASyfjPi1iOJ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TucpD7eOmivl8ve0tz9QY3Rj47cblfGkOMhRm8kvc0TZ3jvby5Mq836Hpe807dDb2QFhyVl8c6o4t/6G08XN+6cgdDNf3WyxqJNv2mXR8RG2ESutaNmM80n3EZDWupVJT4pZOU0d3ErGGodw+tbalf9xpDtXxnGHVfKGBw151BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnujjKsz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnujjKsz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so488904566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958989; x=1789563789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ODTOke9WBLLFCAtlr6DbY54kUxk8UUHwnHp/PHXh6k=;
        b=JnujjKszf80hjdJW8mAw+V3sOnMfW77+6TQ/VlE7CZs9IgjQfdXJbI7eqt9qxY83eA
         hodaQGOTNSQpyAkFbTbVCRRetGh/YHzE9UoU/G80SPI1Oa2SPV8jWG1iP8oXedswgBgt
         0Y8pExycguvz9mw4bIMHOFfgVOClbSPckyFxUnMD2uhT4P0PzkYufzQTJkqUVXugOJag
         OvO/llZRU9yJdX0N5p8w6pPZ2WTGx+JnKt33eClCAHrcR3KSQ9ubOA73EzJsgfLU2qP6
         ZQNno9FyP6okHXZWWvw4L95dX7svyMZExXdGc5gWHxcfZcvljRQFZhvT8/KGMqt36tP/
         u1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958989; x=1789563789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ODTOke9WBLLFCAtlr6DbY54kUxk8UUHwnHp/PHXh6k=;
        b=Cu/vUzdTBV2v55xiDdH+CukDMGBCLQ6qZYdxVubB1r7gjgIe4wpFGg2l5nAN2NHZwC
         7elVeE/EnOV/0s7/EhZk1HEzNmEIyqsy1QjqaudjGIKQBfVTMg/sfoiJ6IbfCNQG4v43
         Q6y/K9m4wM6mj8Zjc3ptUnS04wp1e9LzvbT87d6N33rysDD9sqPUYyyta9VQUaaLCLge
         ACqHLh2j0/X03ETgp0XFA5Zt41Aaf7jPGmaGVrUQE6YuOI+SiG3x1Vl0uDyg60ihlHWX
         7uGnvfWulJ1NotLbgEOx8rVu1VPmgJzKzTCzTf993ErTehIK/2HOciBawETIFe8FFxdN
         wkdA==
X-Forwarded-Encrypted: i=1; AKwUvBwNIsLcAk/U+3SQOvR9v5kzZ5726dndPhxf7sZ3/zsPzrsfBmLHrbyR8yUH2/VOWGoXnKz/CnKoKJoypiM=@vger.kernel.org
X-Gm-Message-State: AFuF++kz57A69m40ZODZTHq6ZbsJloArbiyq3hvZW6TmuDoAsAEfP3US
	haOSdW4u+0nrD/mGLgTvZyJC05eKQ/QOhQ1s8bFfyFotYAiA4Je7qajV
X-Gm-Gg: AYBFou0zwxkS4BN6pDJtdENNufcw9MZUNVO5AnrkVNntYTmSqe+KuOH6H1nJG7BhVxm
	dWhnvy99WF/f6UVP8I9JRElilxC5qQMv+9y1YKi3Sya1bV1+WWSdpx1ShbhBjghekt2vRkxV08K
	ZOfh3IsBoD0EDC5eHXT9ss014Oax2U8K72ghasjGZUGbnk5b1WfXDaXj1MY+Jkg2VE0vgMFdx0P
	XdbHTK7UeDk83rXUiu638NHkgPBlGo2py8OCescG3+oBW5PiFagWgAgHxcG1GciL62yKnBKbjhu
	pmxlQsAanPh96hVea/NMJSM2syZ9YzcpocGrxCqjuPEOR6uIAZrbsaUM85eVWLwMIgcbwY62LiZ
	alyIXxGZJVwAtzDoMBciGMbWRTWmQ+puApPmtG45i68EDVFtuqpFp+ktxt1UK1a53HkT9zIKlyU
	mcVo3ftv67rQijH1h0LSb+/uEvm9PdULumtoKHCCiosMwUbtBA+KkBDg6WeNPkjWvlfE5YigGnV
	a9z4Ze6qGw3qzRmc5FijIN+kSnM5+752bQDA57DUBqJsF/RDH9FI7xcuuQpXxTWnt+dO2qx7Wwv
	69BTtVHpdVTsjExEYVPjQxiKx8IvVElt6vRjis0ioeuUKFEQ4LAXkx6EfbEKyKpiIhKpHG4vpHV
	pwCFzmnhcE+kSZQYcBXiQhuztbuj9GuU9rBI/91LSN+X14Huw+8ASyC0o6qJVzaVcNOfdfjJpl7
	7clcNuENNYOxwlT2Dl40R0rEs/I4qBaOj9zVscttJGZGJ898mwNEgYwBKSglcBSXS8EZQikuY/r
	sAAuuyXIkkdVLU=
X-Received: by 2002:a17:907:94c7:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c260cb54617mr1419558766b.23.1788958988471;
        Wed, 09 Sep 2026 06:03:08 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (158.54.90.34.bc.googleusercontent.com. [34.90.54.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e4579395sm506159166b.48.2026.09.09.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:03:08 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>,
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: adc: max14001: add missing MODULE_DEVICE_TABLE macro
Date: Wed,  9 Sep 2026 13:03:04 +0000
Message-ID: <20260909130304.1395-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX14001 has an SPI ID table, but does not export it with the
MODULE_DEVICE_TABLE(spi, ...) macro. Because of this, SPI-based module
autoloading fails on systems that don't use devicetree (e.g. via
spi_board_info).

Add the missing macro to export the alias information.

Fixes: 59795109fa67 ("iio: adc: max14001: New driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/adc/max14001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/max14001.c b/drivers/iio/adc/max14001.c
index 58adeac62dde..7694fbb6a9fd 100644
--- a/drivers/iio/adc/max14001.c
+++ b/drivers/iio/adc/max14001.c
@@ -366,6 +366,7 @@ static const struct spi_device_id max14001_id_table[] = {
 	{ .name = "max14002", .driver_data = (kernel_ulong_t)&max14002_chip_info },
 	{ }
 };
+MODULE_DEVICE_TABLE(spi, max14001_id_table);
 
 static const struct of_device_id max14001_of_match[] = {
 	{ .compatible = "adi,max14001", .data = &max14001_chip_info },
-- 
2.47.3

