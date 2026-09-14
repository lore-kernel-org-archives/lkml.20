Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD9F3D9DC9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385680; cv=none; b=BlLu2J7j3uBfkCK1EUCaBCE8HfNS374boKHSVXz9zF/XlcHxu7udXgbbmTk/X3tulwgiysFGEQVik+qDdZUT5t0QfgMkRJ65ma6S9myirUNLLrhb9HUNrK761HnxTPDV6MWxKWX3PkYGHClQxaDHakeF4xt3OVhBGEs45uG3ZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385680; c=relaxed/simple;
	bh=XS+qH/RTSkMc4RPHuQ3J2MtXlQ8fdRg7aQKWU3v+L4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDsOI/bW2vXGd4OowcZdwxdw6tUCQG3+/ixGDxEY1+lHybCnBHmNU5aL6o0F6BytdKXRcufi3DSTQCj6SLBTJKkpSOsiQtmxITKbjjeb0b29r1+CCxcRLbgxImfPvlbc8v/q8RnAryvoA0DInZj+JGIQ6bqPCtP9fGEjNxT7VnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cumMyjk0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cumMyjk0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8701fcf40d4so131685b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385679; x=1789990479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D98Mt2BThELnUozhvWQ+a9TWWTndWMHSpzuyilayST0=;
        b=cumMyjk02O8OWFnRksPZrF3LJjp2MEi5FT64cOF2+jECzmrdW9tRR7MN/nAKlEiNda
         hdANBdeJLorjyjNjO1gzcDlKhj8Mu6tEZbfInoCT9KHedDNfLJDfwR4ojnqLDdmXPWsb
         4pL8mUSDk6DZ7G1NKpn2tU+gffS1atzQ0mrZuthDf2vNy3nOTMGVfzbplAcsSsrC60rG
         T7w69PI1aRQioNoN8YzBMZT+5099iB+Ojf6zg/Q5MGCw6qrBijBXKoK611m0+rYdd4si
         2quAY4lG5QhOjogL82PH7fZrbqAQhNp0jqZZ3+Dr1i6O1Ze2/PES8JxubqT7HUxCR5b8
         7itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385679; x=1789990479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D98Mt2BThELnUozhvWQ+a9TWWTndWMHSpzuyilayST0=;
        b=Amhg2uv9zWkwJDK/MjXJOCBa/SKqwdQqhnVmP9OciCqBp24BjIYlIiKi/wcTiRZE8h
         yOzbu1q8bLPJ8m4qq234wr9sBjlU+Bn+V5pmw3gk3hIpuT/v6A54JaAPstVOI+Ue8NSf
         31jB/dys5cYrpDdlV9d9vC97F44evSTtSUBue+KXEtdHzsWHCcjw8iKOGNrmzQewtsSu
         N9FmwURT7iNAcW84obkae8SIpHGRAPrRlR0SrepwCTe43RhM5XRZV61/pMKGMf8zhJPy
         mOYa0ai0IIAOWlSRIk0Kp09Mv83cGdXFrET35ujCxtHjQtc8x/atU0DlZ2o+92Lp8D1G
         zqWg==
X-Forwarded-Encrypted: i=1; AKwUvByCkzgWTE9cjiIvztR/1x8z/bJcM+lFnB99FSS62bl+6LNukxvBrUhAuR8uLqqPSsaQB4SITWydXWXYKt0=@vger.kernel.org
X-Gm-Message-State: AFuF++llZZmsMqaGP6vJV/90ALbyOWLKiznvLTbStHeQiZAXNIZ9ZWtX
	oq3LKd26tUHBkKJOgu8VSGjvCmeyuN8mdcX3/geltsa5unOrS853j4ox
X-Gm-Gg: AYBFou1oOcJ/qcR7HxMj9LQXVx+nH6eJ1y0A2+Qn22Nh9hfAAWZHD0b+OzAc+F7VPs4
	OASolW2b9qI6ntcPWER66GbNGmEQnyI72KmhAAcHwG6brtCW7/RaLscvlGqTjx1UQKnFQKtwXaC
	xlHTuuTojdrU4FVXNkC5C3kz32w4S9MqrR6IJUH7nfw1V4Opyo1zWlJ9KK+M6MAcNjNv9GWCoEO
	OJJsRnCttCZkYhg7uDnvBbQeb4DNOceklWgDE7zjdUpKAL0zIXqCNztieEswX3bfI9u2wtyhjps
	5qlBOIJ7ulTiUTo13+B0jUEArhkX6vLJ03V9JW9HjPuq9JW01QgIcgOw4/zwBOLZO1GcrRWqcVt
	GVCH9d0NULMaD5e0oLVdbrDd+A0izUpSYU6p+CSpcmYO/odlHQk9yqKguL3+PbV/GOq8MRS3LKF
	YIKiC+2Eo0xms9HyoeqDRaZCIYVTXHnkr1Rohx54T3LfgcHk7OD+7Ivw==
X-Received: by 2002:a05:6a00:1741:b0:868:f03a:70d9 with SMTP id d2e1a72fcca58-86f82f516b2mr4191540b3a.4.1789385678538;
        Mon, 14 Sep 2026 04:34:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c019dsm4440557b3a.7.2026.09.14.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:34:38 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iio: adc: at91-sama5d2: disable autosuspend on remove
Date: Mon, 14 Sep 2026 19:34:22 +0800
Message-ID: <20260914113422.1689331-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

at91_adc_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
set therefore leaves the runtime PM state incompletely cleaned up after
the driver is unbound.

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path.

This issue was found by manual code inspection.

Fixes: 75d7556ac0e4 ("iio: adc: at91-sama5d2_adc: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index e8a5285bb6d4..e68632e628c7 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -2487,6 +2487,7 @@ static void at91_adc_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(st->dev);
 	pm_runtime_set_suspended(st->dev);
+	pm_runtime_dont_use_autosuspend(st->dev);
 	clk_disable_unprepare(st->per_clk);
 
 	regulator_disable(st->vref);
-- 
2.43.0

