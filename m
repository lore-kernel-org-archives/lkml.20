Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE225468C19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391940; cv=none; b=gGC8fNOq1KkNqLAi2CAkFTpfAFRc9XLRrVMbPTYgBtYSJ/T+cFr0LxpdBFmPoWLazDmRqpAsEblDZxwVM93X+HVK/tyehylii44NtJrNhcO3rzhae25BHclhGxvj+usBXOOggAbe9EfMlmLgTsNEsbFPndq/K9qqjp0LNNDC4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391940; c=relaxed/simple;
	bh=KdKxNSK2EqzOJkxmWBpgLJOR0R0yxWfK4EduhOCNn/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZwHZ8bOukWhORc7dPCp4I15W43ifYgx92bw1Bqj/y5zTedqbnuKE7k2P9UBz1h9uiN4xDUYYMPQhwDJNeP6z5QEZqjOlmkptOxwB5O9he3k+vwngR2T6MS39o/j0TwyyT1Bj35ImoBJxsXX5fX5qqd6YkD+aLEgplYGkDsLTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDCfSrOS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDCfSrOS"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so5755755ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391938; x=1789996738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CtYN0tgKPETVlmb678BLgBAA4im2S7f1euATyuMTj0=;
        b=KDCfSrOSQ//Xg3o3nxSj+DFByzN8ywv2juXCbxy/6m8sURpOxDB4hOeYTKmqw15w5u
         6UQZlHxNlQtik8GYKeQfdoXnvhbC0yom1cL/A5ToPd6hlehj82qsHnV1FzwTT5dvrJIW
         5TmAk9+Bv+WYzMXYCvLSt73O4Pf53cD+zWaCm4wOLhlTWJgXxTJXgq2DdfE6U4/3APCp
         wMqegRCVpZGiafYisp/fBYHPEe+/WfWj05PU8489F6xiyzy3ea5yIl/iv4RTLlJfgaFo
         zTElNEJwmb52arj4HQJw794S4r6zMlHKMtqNxRs5apq/XRO1wZKbz6GhJRjbgNTTCVEw
         vkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391938; x=1789996738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CtYN0tgKPETVlmb678BLgBAA4im2S7f1euATyuMTj0=;
        b=BCBhxvm6mfBzXu/rf3rk4WGaFdja/ErshaO7R6lFbzL93ZYO/eYDFX+L6sSCqpyC6j
         aVAh1r7X9J7VD9XAKrEK/666dPMfTtk8U6lhjVjk1qR+j7rFmmycbS38RtM0CTdVrSs+
         whzQGhzgD3UYl83zJwh5L9cOx/WFzM+MEMYR/EW8RCDqjbaQt1vW5v5jVDexlQgxkkrj
         p7VElLfpwEK61XO7u7kdz5TROUUvYfdkSXonGgysGQvPenxqXdmsoyxBqb8uG6rBHvtZ
         A4lJ94100hSX16FKsFFayb5e7GnJAnTLwr9qOMGecHax6oEdPA9odoFZzLniEBetdVG/
         SK1w==
X-Forwarded-Encrypted: i=1; AKwUvBxFxHCcat/KO0u/yCy/XLbcyJ65M+1x7MlpbAUeuQCoXZC23D3NOBLH+mfEAYLEZ9Y9DOfFEpwpldnHQkI=@vger.kernel.org
X-Gm-Message-State: AFuF++kKFh6inQbrFH7jD4Jxqfr3w3KxcKfLpxrIOj1X/Dz/jMR9A8x1
	LoPABF2JhqpCY+Y3ffCAE9w2+8+DQtjIaZEWXmqVLm2yugcOUW+uVu2W48v9ag==
X-Gm-Gg: AYBFou0g7KOGQaaey9gSlppGkgPYcKJm/RNB5cHJIXtFlT3G3y6twvhi5VDVNIjSB4r
	C4JF7hJFINYJR/uLFzY/IgLHD7bxraTb4bMcpj6QdC15uywamyBlC9yAvRyCBTEpXogCDzCE60j
	5a/Lkyl06vKIAdY9wPpzAjluQMX9b1CUSUpnfPrhI3B5zJNQlj84k4rlgLHDRaASQugcfaMzKl6
	FDJgR+gJKjp0Y+6zCNSLyFSk20W/inr/n4Y/dQ2WAM7+fibbr7xGjZpH50y8/ZaC4jFtBTlsrVX
	b/xcZ3SoHtkg8LKoihtIxO943z6ix6JxAwh8g5QLLBEm/QJ6Rxenm9rY5kO5KgIakRIY+MSNDko
	sSZLXH9Via74g1tbSet7l2/2dJnNCRZJmxdFOCea5UJGmC2ygm/pBNmI9O6IS4EnABs/n1Nr+gD
	dH01FzRooQ6ucfsOXxXDJZW1Qe3Y8SZpN7pjm6MCsfQuypN+h0Dgm0bd4BCDAhPvFuRuso8/pu5
	oOVRtMj3NuqSCq/
X-Received: by 2002:a17:902:f791:b0:2dd:7370:e19e with SMTP id d9443c01a7336-2dd7370e21dmr12996905ad.16.1789391938060;
        Mon, 14 Sep 2026 06:18:58 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm40753855ad.4.2026.09.14.06.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:18:57 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ma35d1: fix permanent clock reference/enable-count leak in probe
Date: Mon, 14 Sep 2026 20:18:50 +0700
Message-Id: <20260914131850.2331670-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ma35d1_rtc_probe() gets the RTC clock via of_clk_get() and enables it
via clk_prepare_enable(), but the struct clk * is a local variable --
never stored anywhere, and the driver has no .remove. So on every
probe, success or failure, there's no way to ever call
clk_disable_unprepare()/clk_put() on it -- a permanent leak, and since
CONFIG_RTC_DRV_MA35D1 is tristate, each module load/unload leaks
another one.

Replace of_clk_get() + clk_prepare_enable() with
devm_clk_get_enabled() -- same clock (both route through
__of_clk_get(np, 0, ...)) but devm-managed, so it's released
automatically on unbind or any probe-failure return.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-ma35d1.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..43358d68565a 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -221,14 +221,10 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->rtc_reg))
 		return PTR_ERR(rtc->rtc_reg);
 
-	clk = of_clk_get(pdev->dev.of_node, 0);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc clock\n");
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	if (!(rtc_reg_read(rtc, MA35_REG_RTC_INIT) & RTC_INIT_ACTIVE)) {
 		ret = ma35d1_rtc_init(rtc, RTC_INIT_TIMEOUT);
 		if (ret)
-- 
2.25.1

