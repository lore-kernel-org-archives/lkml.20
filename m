Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663042AFBB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276096; cv=none; b=oKTz7viyQoSzukTObrm4S7cfAHMAEh1EL4lqy+eK3a+g0YVEoiaKrjyqUeX836R4Zh2ruQFj83/OV/cb0jUSSmumBDW/zbJjolGSe+xRwAzmvN8xm5QLdT0NspjUqae0knd26aoD0YNzD3zbjj3P+/jwbG+3ElEyT2iK6PXKjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276096; c=relaxed/simple;
	bh=haEcaONaRja1qUOHyi3OxXLJqfw+TC0USxhfuYRWozg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQ62VPCyRP97/IGYEdmawOcdMcQ+rHNOKEIaBHluLHg/o5FZMYZAg+7cEOIRbYVx+nQc/zhtEBhbZqAIe/g1DsPdE2y/UiEl55yafXkw9CdS57xDFFWBwuHtmsrZMcOsMwl87oYf45weaktgIXiyDqTKatAOYzcEOcHbwKlsbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSk507m4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSk507m4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5cad1a6baso47720675ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788276094; x=1788880894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XaLq54eX4gxpoy5NbzaGOOpUsCKXEm26+G5a1HE7Ws=;
        b=YSk507m4Ke8PfiPnB83iNy/yvrEpZoCbXRDeKDFBYyovcYQR5Spi9brVJxwx/Kgvr5
         d1RNHPHmkWi/ReFsFm2tafGpxFD0Vl57sFfVOk3deJMLF7gPn8784+s0SZTFQsGtyKIg
         1+xcu2mIrRg1HXlkcQQ9X+61TolFHaTEXOA21RXljUKRuVDopoq8c8agRDGVVX3cNoyq
         XtnwralrZ+ytP4T25dUsRlN4cJEdDBSsItQtDrYp8CvSCU5x0WaBq4uaIs30I/z1JsRF
         wF/Xu9/dhx20KOSF0fTAx9UF9wG0e5S5uYMswe8kKeg0gOONikECyk0xoXpmJYYyvUAR
         8ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276094; x=1788880894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XaLq54eX4gxpoy5NbzaGOOpUsCKXEm26+G5a1HE7Ws=;
        b=FO/OYRaHFgq7GO43j0bFpjRb73hI4XKsaNGAV8Ve+mgJir+L6zXrMxWRyT42V8t8/m
         9R9EHSvEIrIp5KdadtJh0O8kAtqHSYZU8GtpfnlSikf5ZNbw6oyJwOK+3W49MCtwHvhs
         yDUv/bv3GHIjGfF4rVWkdS6RctmQYJq/FluEt6QhXVxynHJvFfhUhES35KLxl2TPEM2J
         Qau3txzTvGZZ+vX7WjmVN0KekVf2oU7se0mrNkID1H22Ul3Y88zHMHrmPgFfh7JfoZhL
         5RvbzM75wqdcsx6+MCSdpnS5KwRYaI9gfLLHqhlteV9R2VybBolgbL5Lsvdxs4pe2Xbv
         w5zw==
X-Forwarded-Encrypted: i=1; AKwUvBzbBpS9CbuU+qr5kvXLWtY2oABe9i0QWRTY/89laX1VpFLDi+dYkOyKILeKNVFYmiKp5QRL9gLcX+016ZE=@vger.kernel.org
X-Gm-Message-State: AFuF++nnI/IRCvFU2sYfgIfI2QMCOhuhW7SpD4SBXWwIIqxmIMqqTDse
	J1V2SxU2r8V0DNP09yvbyh8+g3rCNm883OzZhpRuY3n2MzlMKd5W6Z8=
X-Gm-Gg: AYBFou3f14qsF7+8zc/j/rM6I0vn+1ooTVpa6kTMmF+dpzCFGQQEviRC6459pVKIIJ+
	GxoXU38gmtgf0jjMLswc2uaTsqWvHnyuwz8lfyvMz6qQ1Z2frLTKsoEUD+ofuin1v+or03RCOM3
	TwQ3qKiyX3QXGeM/WxV5oa0n+0Psx3NSAcKn83sOFKpRVj+BPRNf+cT+aHW0peARmw6ts1hPfHi
	EpTCATEdX8Rhpi3+RBF7Ne6RTiOg3QtMX2AP+BG/6nylh23WlusCX6QxLMRmJGxeCEWaU9qb/u5
	1N5f18PdaTq0hhz6+d+ODrzDuQ56VqjbsR+kIsET5agDrDtSmElz1HWOBg5b/tC6u+z596jTed+
	u95KT/CTjpPjOzfn8pHQvXOZwN6eSY5vNjS6Efyiu4dyCepEs6KkzenYkcw9RR1xS66z7P13Vtc
	N+yhOsR2gDKGI5h1RZuQadZ7VzRh+50xW+4tbEUuiwBVMZUgDSZ5t5kX1gnuKkE61WpjzuuMqyK
	g==
X-Received: by 2002:a17:902:cf12:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2d94a2e3a54mr149081855ad.0.1788276094509;
        Tue, 01 Sep 2026 08:21:34 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:16f9:fc9f:f197:159b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd3a8bfcsm695975ad.37.2026.09.01.08.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:21:33 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Song Qiang <songqiang1304521@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Abhash Jha <abhashkumarjha123@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH] iio: proximity: vl53l0x-i2c: claim direct mode for raw reads
Date: Wed,  2 Sep 2026 00:21:26 +0900
Message-ID: <20260901152126.533902-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vl53l0x_read_raw() starts a single-shot ranging measurement and reads
back the result. Once the triggered buffer is enabled the sensor runs in
continuous mode and its data-ready interrupt is routed to the trigger,
so a concurrent in_distance_raw read disturbs the streaming setup and
never gets its completion, returning -ETIMEDOUT.

The original submission claimed direct mode here, but it was dropped
during review because the driver had no buffer support at the time [1].
Continuous (buffered) mode was later added without restoring the
claim [2], reintroducing the conflict.

Reject direct reads while buffered capture is active by claiming direct
mode around the measurement, as the vl53l1x sibling already does.

Fixes: 762186c6e7b1 ("iio: proximity: vl53l0x-i2c: Added continuous mode support")
Link: https://lore.kernel.org/linux-iio/20180911160300.GA9212@himanshu-Vostro-3559/ [1]
Link: https://lore.kernel.org/linux-iio/20240909101508.263085-3-abhashkumarjha123@gmail.com/ [2]
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Only compile-tested; I don't have VL53L0X hardware to exercise the race
yet. The change mirrors the existing vl53l1x sibling.

 drivers/iio/proximity/vl53l0x-i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl53l0x-i2c.c
index 9fe14ceb8be7..173e69753df7 100644
--- a/drivers/iio/proximity/vl53l0x-i2c.c
+++ b/drivers/iio/proximity/vl53l0x-i2c.c
@@ -219,7 +219,10 @@ static int vl53l0x_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
+		if (!iio_device_claim_direct(indio_dev))
+			return -EBUSY;
 		ret = vl53l0x_read_proximity(data, chan, val);
+		iio_device_release_direct(indio_dev);
 		if (ret < 0)
 			return ret;
 
-- 
2.53.0

