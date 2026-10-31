Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437993;
	b=czI7MHEcnD5AlOVxHtYdrKRpauJG6ukysxe7Zi5Tq/ClacoovoswEpkJyI1ur1Pag5ya
	 6mdsCAm68prhkonkLvCTFKJB4UmDisEYsm/1zei9ozwpeAz3Azw6MrMO9di/a2QIpb5T2
	 z3NMMJW20bXOZPgso/53rzg7u0OZQ5NmO6jYpYG6NHjrg+b7hRnR9Idw56NSZpmPC4BG2
	 E7qVUwg+QWHwJRzDH6IsEqws0SaI5J62+tgpaCaej/FE5O3eaQFmWr6rkAY61/njkXTZR
	 aUUTocQHSmlddqLobnXasz04dnoPZ5YTvogH/xkV7oeCaQ5CUkG7xuKDOAFmlk197jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yvb6WJh+6K9JJR5AEaTQbWzXxWner501dTBgAUHA8yQ=;
	b=eRNGdkvjawir8gcSv9z/A6Rpv+y6KI5IcJ9JuQZT5+mFmvbZ6HA/ZmcKR7KOL6rtnPFc
	 KRfquC8F/W2w5kOs7woewUyBktMIWTmjE9eY61ktlR91H7emCshQ3mB61LMn14fDN6VG2
	 59R3X0dJ/9oqMRVLYjjf/2Yew1kNYw6bxaQZFqINXbZJmg3usNoC4KBsY2bwDmikHgkZD
	 D3pKQeu8+2ufNKvtrq788ap8uNgekhFwUFrP7AiQaBtbeUqGpeh/1HM6QZUZWqivvKfL5
	 OJR5tCqkttySmq0FTcIn1v9JdHsGXqxEEnMcMYPhw55+UQ+FRfaAItsVGBaEIPT3uiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8TRV+nK;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9214606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9214606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8TRV+nK
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so1348245c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437992; x=1794042792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvb6WJh+6K9JJR5AEaTQbWzXxWner501dTBgAUHA8yQ=;
        b=l8TRV+nKZq27poYKUBpHFHNHKP/A+FczxkUjgPZVg+TgooT7d3lvIHeADPQPVRY0lA
         ZnItKG79DJ9KXKc9uCmGPVHZfqpf8LCTG6ViNOh1WAdo7ydTAS8gYl+GH4u01SA2+KU7
         lG/vGR96+URF1BiPqfinuaUFYyeClCicViVPlp9lFumQgAY1Tz7pzl/Yy0Dzv2hyv6MZ
         EW4Tvlswug29I0wvMtsMAE8js/f0jjfd6vBZPE2R50YSSlBPKqnwA7XVS0mVjktukqGW
         tBYXmhpeZkL8+szN0YCHIUl0UvwvwQOdzIPSFab110vwhZF5O0FIx99fsDeZwHyqpQdw
         Qm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437992; x=1794042792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvb6WJh+6K9JJR5AEaTQbWzXxWner501dTBgAUHA8yQ=;
        b=wITu2YLwCzo5piGvhLQIThk6/Fje2XeOelWHPP+Hp2Rtwq4zz9Ft5ut1E3PJKz5l2v
         yFb6VjW1Uh72vYKfsHazYe/nVXC5mGKiJ5eOvq70R+PK5X5DO8X1XmbdIA9keIRl2bMg
         6csJ4WQPRqOboLTDaSh3XapxbPLWQIHGqglcW4OO5WQ779RFTP5EnIlnoemL2pa9W6fs
         HV9OqqXQyitWFPHHQGy3yeLO5GHS2YzSuTa26ElkAEr8lXPYBoJ6ON3I64tEh0qjanlz
         jY/nwpOWxNbfKheA3KB21AvSeHPeRJDZNwhPBCgXlJHzLF9myJUSkF4MXlcQFDl8O18E
         Xd9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2L0Xb5rwcdOn48swmgykimSmajgWHbOD4Sj1gd1wj3g58yUy2GLkLLlx1xMfvVjL7SPIxgZiVB/jCUB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+dpFq+XcHig3Pi5YfuBmXVMUDecN52ffCTKNSaHAKbe4/vij2
	hLMFJUM9KOK/m0Engznd9TPTpQhuzXDtyVirfE8ltCl82IRkrsSGFaeW
X-Gm-Gg: AYBFou0Wp5x7Zb5OMVeTb00XxwbeykrOO343oKYjmYtvJWKVKhr6udIJxXb1r8NUalj
	RpkB47GAIv7ZxkaGu49CkKL38J6nIOjnK9wqsoa9rvMSuGMeLaNx+idzypz2VoPn2+2CW8iU6d4
	cnuD1QLw6tTAQyyH1KyM5yEIi4dIERisLiC42qHEhvQDA2fU4KwJAzoDzpbv49ZngmtFuM1CrP4
	pCJmctp4+sPti0LzmbQ3mSWEJ9BscuJJ8conDeS5dQbm+3w3/ryL+CvZ1UMQSpkQmcrKMHCTooZ
	e7C61JMp50fY3Um+k2C/sxHaXwmifyibK1cdDiG3J7eIy3ohdlxdo7FyuRpx6HvCfE3A5VytSgD
	tBNDml6HomD1r+l3MiOyPRtUCDahKP6vFTQRd1rSqC5qN0kv4uLBin0ZJ6FeExm01639EHiNh1a
	NWSLesAcI3nE1dPMc6RgzWbv4YsgbJsF1X2HBvhlwqW1JC1vpiBqyniZ1trwXPdY5OBQ00SVR0D
	6jKIUeYQeDVo0yhY0ghzXXx+3bHsGgU4HmdSHm2sWKfPtIUXzNfZGj5+QtnZySdvMskvrg6tvRP
	QzM0wr4ZWQ7Ye8AMQklqLyTBG2Ecd468Drd3
X-Received: by 2002:a05:7022:3b88:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1ac5c8380aamr7862765c88.18.1793437991368;
        Sat, 31 Oct 2026 02:13:11 -0700 (PDT)
Received: from archlinux ([2401:4900:ccca:8aae:db4f:18dc:62fa:a502])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm15771014eec.24.2026.10.31.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:13:10 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v2] staging: iio: frequency: ad9832: use devm_mutex_init()
Date: Sat, 31 Oct 2026 14:42:36 +0530
Message-ID: <20261031091236.40401-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Replace mutex_init() with devm_mutex_init() in ad9832_probe() and
check its return value. The driver already uses devm_* helpers for
its other resources and has no remove() callback, so this ensures
the mutex is destroyed automatically on teardown when mutex
debugging is enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
Changes in v2:
- Add blank line after "st->spi = spi;" (Andy)

 drivers/staging/iio/frequency/ad9832.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35f823f24f..e3b4e19a8d 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -325,7 +325,10 @@ static int ad9832_probe(struct spi_device *spi)
 		return PTR_ERR(st->mclk);
 
 	st->spi = spi;
-	mutex_init(&st->lock);
+
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
-- 
2.56.0

