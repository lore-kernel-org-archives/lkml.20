Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676641;
	b=rs3plPWMTgWZLJjrBJXm5hrkMaaGNxLe5XdI8fHhxBQybuvL3Qx+VbMQzuGtbJ/MiETD
	 pxsPZtSHhRyHjcOnepQPvBe1bArOflXP204i5M47HhsOs+242xol7rZyRLuuZ/6KUNaMe
	 pd8yosPs4Nz59lsYx0gPUuLOTjl5qhyoySAkPh3qqzoYqHnbK1m2D/nW0SgGgCmOl+yXU
	 hvPodbwyl7q+PgFbRjiZMPisJbnI4KyVdAbhikcFPcAsyjOBI7Rz28ZMLggGgSRh695ra
	 N2aLAoIF99qIBAsuDgCVOWAo9Il87RW6m1LXOqAbOa3CPze1/SaM3/bhxeXfEdPWJrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vel16q6gN2xg2Z/AVBnJqepV7LiP48eLiT0cnN1qO1c=;
	b=Vh2X5Aqp7fv7pZfGBCazBuZRqQ1GAzpr5WhPxjJjeyQR8ZWAoaJ7QedSjARrvQWbQrMP
	 CVeF/d7rvn6yJNt/jU4XAQOM6QMhOF4Xa82JrlaiqJeTIVeicV+JmwuVnYk04hX63OQ5c
	 0mLtZ8MbGcZhs0fmSQH0ot+nMvX3BRVtz1NDF7Gk1gggDnHB5r6sDCjMHO79ir5Y0vAWJ
	 m9Lq1Ct40UGW/q6pr/SprhwyWirIAv+lswrwXeMSuto7I/tgHkwfumtOHV/95zh9piOd9
	 yarjDrYzu/hBvS2btOLj6Im0jsuMUU5Xd9QBND6HZ1bn0ytK61eYH6g0zJ+T6+nL0ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHNjz5sA;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D960A4AC5
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651D960A4AC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cHNjz5sA
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso19783575e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792676640; x=1793281440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vel16q6gN2xg2Z/AVBnJqepV7LiP48eLiT0cnN1qO1c=;
        b=cHNjz5sAwvyB9ToNCxkji6vTSt2soKeHfWorF+IP8rQbOunLU5sxreU5yrka0ba8LA
         V+rhwu5GlHkm0nneC4diO+RLSl8tHKQ1Nc9e+hk4p38+PSpguBwYCT1V8gI2JJhdOs7B
         eTjFY+/7tEhysQy18IPQLz30KDRcamyv3nxpcuFRRVsBmiWj1Ifo1skHUli0YBgIZ9r7
         XJyd7JvqiXYqHTGuLUj2LzTJ8d+icRWZO+A26jvoOlHb3Qv+so57kR0QnJ0B0GrXpaKI
         bklAOoBazNtmV0LBHLaqmOR2WYtx7Ilq6d+9yc+7nqNjAvVVoUb2VPb0xuGyze4VkLYi
         70Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676640; x=1793281440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vel16q6gN2xg2Z/AVBnJqepV7LiP48eLiT0cnN1qO1c=;
        b=pJ+oag8kTHz5BCkPI+INTu7JGXbmjZsc4rTTUCqNm5HaecPOuGegaY57V/GeKFdFqh
         vh0q6GqO9CbF0EN5+dv6rvn8jf/AIS7KtCA0FFxMBQDLBKbr6SQD+NDbK0HRBoagx2l+
         KGYoMZ8XEexr9Ql1+snFAuV+BOjSHbQbsunVNgqyLh7FSlL9Cdt6vjQhN0QpY0++kkdd
         viHYR3mwf35DsOO6LxMRBZyaljOZyfxMixnNa3k7XBUVnwAsmvlqS7p92YaI4CEGzT02
         NWXfHefSj05V7ao2w+Xb8+cUvpQpk+5i2/3XDj36NBMnXHnmlDZZ4EVWHnvPS/fRU16y
         wbHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeGe6sK7+BUw8opZ93ICvSxGlF8H2+odXFxRgODW5u7gIXo62X48mt9/wXHgKxqdLmksYTFuiEz+F6IxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE9TTZr5CXLmwKiiLsITLCWIjDpXa+VvXj2cyI2+7EpUrtfuPY
	LvxDD/Vc6p2fV5hh4XrV0uxgi5y8lpa00qrAoLAt0MK71iBDgRzHsQ+v
X-Gm-Gg: AYBFou1XN/l0aD9E/STu0BU0XxKUQyGjgDLkTFSdJPdNZrgs52mn45wCLdLm4zLHVXz
	8Q2AlMBGet/TZYNkv8yCXnNUsRw7Z7Bpqe4QX+SQCN36ClS/lC5FM5QG10jEgRyY9kUsAgG9T9a
	WC0vB8kpy7c2b4lfOGSpMZ8NCxgH8FaB19tTUFh6cXhgRJhv4bA1koVfmx85qD1p/wachOBTscW
	QzqwPnO1W3asNtkdkdTDikqfcnR+PQrpUwNVFPLpGwVQc+oj2c6MBCmxCEsZsNCUKSD9zLeYWfU
	3L5HtLH5jQ9XNJFFHLNCuj/tVaP3SnRK3EDN7orQnQFlZSFBQjPImLeRsI6W0wpoXalXGF6gU/+
	B3/G2/cJ5AS1JbSDXfY3L6bYMA47Zz1thxwN3jRXk0UavnmqGCAJ3py0r5l2NwMzjdPLnDL/kQw
	0RH/FMQp8svq3Qndw3CY6GXdozK+akiz/O06C7JQLgsuakn6m+OB2z4jAu9+I2VrjidxhYeMoEa
	5HB3/sj1oOur+D1kPK7BwTxWNo2sy5FwrxWLcS4LK8lZ/It8ljlH8RUobTqqqEcDR7R7BiD8MXN
	rSE=
X-Received: by 2002:a05:600c:3e10:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a20b89151dmr19236685e9.10.1792676639696;
        Thu, 22 Oct 2026 06:43:59 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm13621390f8f.40.2026.10.22.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:43:59 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] watchdog: dw_wdt: use devm_reset_control_get_optional_shared_deasserted
Date: Thu, 22 Oct 2026 16:43:49 +0300
Message-ID: <20261022134354.534642-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022134354.534642-1-a.shimko.dev@gmail.com>
References: <y>
 <20261022134354.534642-1-a.shimko.dev@gmail.com>
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

Replace devm_reset_control_get_optional_shared() with
devm_reset_control_get_optional_shared_deasserted() to let the
device-managed API handle reset line deassertion and assertion
automatically.

The driver currently manages the reset control manually: it calls
reset_control_deassert() during probe and reset_control_assert() in
error paths and remove. This is error-prone and requires explicit
cleanup in multiple places.

Switching to the _deasserted variant deasserts the reset line on
acquisition and asserts it again when the device is removed, which
allows removing the out_assert_rst label along with the related
assertions in the probe error paths and in dw_wdt_drv_remove().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 39031445d754..2cffe337b4ea 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -588,9 +588,9 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(dw_wdt->pclk))
 		return PTR_ERR(dw_wdt->pclk);
 
-	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	dw_wdt->rst = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
 	if (IS_ERR(dw_wdt->rst))
-		return PTR_ERR(dw_wdt->rst);
+		return dev_err_probe(dev, PTR_ERR(dw_wdt->rst), "failed to acquire reset\n");
 
 	/* Enable normal reset without pre-timeout by default. */
 	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
@@ -617,11 +617,9 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		dw_wdt->wdd.info = &dw_wdt_ident;
 	}
 
-	reset_control_deassert(dw_wdt->rst);
-
 	ret = dw_wdt_init_timeouts(dw_wdt, dev);
 	if (ret)
-		goto out_assert_rst;
+		return ret;
 
 	wdd = &dw_wdt->wdd;
 	wdd->ops = &dw_wdt_ops;
@@ -655,15 +653,11 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 	ret = watchdog_register_device(wdd);
 	if (ret)
-		goto out_assert_rst;
+		return ret;
 
 	dw_wdt_dbgfs_init(dw_wdt);
 
 	return 0;
-
-out_assert_rst:
-	reset_control_assert(dw_wdt->rst);
-	return ret;
 }
 
 static void dw_wdt_drv_remove(struct platform_device *pdev)
@@ -673,7 +667,6 @@ static void dw_wdt_drv_remove(struct platform_device *pdev)
 	dw_wdt_dbgfs_clear(dw_wdt);
 
 	watchdog_unregister_device(&dw_wdt->wdd);
-	reset_control_assert(dw_wdt->rst);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

