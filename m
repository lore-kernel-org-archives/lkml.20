Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7E56854B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999270; cv=none; b=fSRGRKOQGDwhZP71r2qy/BzR6e/6ylvCvsuS+EvxxohZwZyVgco9MOJ7GJuNv3dqYtLOlkI/BuWWFeLBMydn23LenFp8oNeCbaKwz6gKAudTaFDKJH+XNzZRXdJwpBhrvAm83kMzlODu1r1nkfLCXeHi26hg1dmWB3WbRUl+zz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999270; c=relaxed/simple;
	bh=tEaYoaokfTDeC+YTWR3V+2BkXiRgjSARyNOHEZYlDSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP7BGYNHLs5gBLnRPy17LBgYG7qfc01BwdC2mkohGfSs9iUyJgwCPhB0X8l67At2zjEJvDHmB34X0jlOJM3Z3MvjkLqXeU+2/eH1MeSt8V8Ax6XYbRXWhhh0bwNFtSrCqLVcLosDA1+UHRbP+dV0EOc9S9gegLlytptvFzi5t4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTr/V+Sb; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTr/V+Sb"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3ee49054ecso10661766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999263; x=1792604063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o314AkdT/hGMbAfrRQAXUHtm0eSAGgqeibTH2FdEkQ=;
        b=kTr/V+SbgjAUKvRfsrnQ5vhDid2r9OpinKSRPvLTq+WTha/2X+8BT1ItxSN4POf5nk
         Y2HWWhSdO/3JP8S8ktee9XFHXo4RHBubEZJK6ON60cK6iz8QpleKHpniuwJbVbrCWASO
         QgkFJ/CND7QJBHFSEP9Teuffmd75T6Utl/s+aBSd2n0qUUuHBs3kHd2wWWTRixyLp0Yn
         wUohuTW1KXLaqygx7bQmM1f2Bv59yoUfz0hcUhbB+0+bdnLVd17NoURLgkG9ZNyzTKOV
         2wdqu6Sa26o79Va8fNGyL833xN0BnrnzLUlbln7OZsxU/mtfZQbFK47I2aX4l9i72DTz
         h3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999263; x=1792604063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o314AkdT/hGMbAfrRQAXUHtm0eSAGgqeibTH2FdEkQ=;
        b=Q0y4mhWn2UPw0fLiL34oduURhsDSL+UTEBUMoj3C1RVDgFqRGaYmNUwN1Lpobjg0GJ
         1QcGbLiyD3Yya9XZjzdv00b/BL0qFIOWrBxtaTSHAvSWZnZAZBjj5FQ6QzYVq6PwQL9J
         9cgc/byJQMNK3Xh/m37M2NHxtiqX70+LUfpMrDjPu1rNbczdYJ+CuG1R7wtTYhRynG6x
         pzQVB8bEzNjcd7eeP3TjaDPjJBtdbwLoptnbskkPckl1Rac+XkoqpcAYAqLtDAvvgiHx
         CF6jEebsHYqt21tRzu/Y0oxVeMrH1NDUrkNIODM/GGREdFmKrbZltv/sInIXAFuVVvOw
         yY3w==
X-Forwarded-Encrypted: i=1; AKwUvBw66c3wDkTKRxMKLOlyZIuAQzaukjhu92tQeT0wYmKuCEUzUI/u/WzqwVxl1pcZBDMAw35hXfK/HBLE5Zo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+8OKMKNToR1SoN/ZieVqxn86LqsMqQ5bCv3hYA/DyXoeo44jN
	5GOYgN0o6+YatNKxiDqcXSPFD8oFSMf3QvledRv08OqUQcOOreR9lyJxV+Jrqyif
X-Gm-Gg: AYBFou2sZ4SEGDfuKKDvB/mNcePcrmBBT+D9L4/C88Z4WCpQxZ+eEKpZcC5YDN47DBI
	uGqtOgdz9m/oqiCyQmw0wcV2hUVx8qIOyRp4dR+g5MWuQ+e3v6rBgoxeBm/2e8enU055b0eydUB
	/lZE1IGYyb+wm2eXV1WLZxNE4OTN855NTDdhZTa10dZzjI4Hwjss2nHAjZukOI1014P5/qA0zzM
	aqsZoisLs7i/u/L9LZZPVuy/+YM+pe6w6q1266mPaS68HQJtJ3l8XP1KFccf8gLd5Eev/LXTW0i
	3ToqqX8Tk1dScBX+1+6MgimytTbbvgpomIPVkqVwUpsB4yiCUBRbTLsMUrEsIO3QM6+a/lz7URC
	OeTM3uO0j3/k8zka6brEy8EhUMav4zsKLb95tbcJJdccTTkYbnM2RbApMJ9Q7a1dxcPHdbSGoqo
	YCBim0anUmmppVRS1Uf3LqXktXKBXkyxH6NF1m5z3pCKZ40nYhqALq95Ea8vdHzdLzFcvc4cQa8
	ERouhgJhlaOFDNc
X-Received: by 2002:a17:907:3d4a:b0:c26:22ae:b66b with SMTP id a640c23a62f3a-c31a9fa1d4amr1618151866b.15.1791999263151;
        Wed, 14 Oct 2026 10:34:23 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:05 +0200
Subject: [PATCH v3 06/11] hwmon: chipcap2: disable device after hwmon
 teardown
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-6-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1970;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=tEaYoaokfTDeC+YTWR3V+2BkXiRgjSARyNOHEZYlDSM=;
 b=DU00AsHpqm60m8y8hn5WeCDWjaGzKIjb8MGXi6ooaNx0rRcHilmSsoGZ7KWf9UAzL0l6yheJ/
 A7xJ9vTetJfDZJb90s6FWyJegpqVQY+TFNRvSerHuL7jvfKy2eo0DYh
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

cc2_remove() disables the device while the device-managed hwmon device is
still registered. A concurrent sysfs callback can then enable the device
after it has been disabled during removal.

Register a device-managed disable action before registering the hwmon
device, so devres unregisters the hwmon device before disabling the
physical device.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 21dc6db27c40..654f6420da7a 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -152,6 +152,11 @@ static void cc2_disable(struct cc2_data *data)
 	}
 }
 
+static void cc2_disable_action(void *data)
+{
+	cc2_disable(data);
+}
+
 static int cc2_cmd_response_diagnostic(struct device *dev, u8 status)
 {
 	int resp;
@@ -744,6 +749,10 @@ static int cc2_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get IRQs\n");
 
+	ret = devm_add_action_or_reset(dev, cc2_disable_action, data);
+	if (ret)
+		return ret;
+
 	ret = cc2_request_data_ready(data, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request ready irq\n");
@@ -762,13 +771,6 @@ static int cc2_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void cc2_remove(struct i2c_client *client)
-{
-	struct cc2_data *data = i2c_get_clientdata(client);
-
-	cc2_disable(data);
-}
-
 static const struct i2c_device_id cc2_id[] = {
 	{ .name = "cc2d23" },
 	{ .name = "cc2d23s" },
@@ -801,7 +803,6 @@ static struct i2c_driver cc2_driver = {
 		.of_match_table = cc2_of_match,
 	},
 	.probe		= cc2_probe,
-	.remove		= cc2_remove,
 	.id_table = cc2_id,
 };
 module_i2c_driver(cc2_driver);

-- 
2.43.0

