Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D04D4876
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603906; cv=none; b=r3pMCs4q4KvQaCxrUOgjbZAjs9lHyDiGccA3EVNTfcHhua98CrsMedcvofNIwMwaHP/2MCToTpTZrVRxMECvVLmcJlQJTgG4BxUNKY0LJVqigwMhfoaGgQgZroL5aYWGq1M2ewT6wbHmg2vFVJkoqVqlGKeuAWwtV7RDSzesycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603906; c=relaxed/simple;
	bh=GU6rru0i0s02icKiHw7kTQykJ0rwnxsY2s22aKjWk1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HdJUtQAPr2v5wuLDhxWL+3vYuGIHRah8H+4JLxGHaQKj6BYjTCaEQ188cPmQG4EErmD8BSqH5k/5e1A6PWJoa7WSq9JToYMlk7a7tXjWCm2qfgbES9mT7TFHEMeLEDXh5JUbSD6+HaJeTnE1ImjmQw23C1dDAuSecXGwlTiaGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWCRZG3B; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWCRZG3B"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1550451a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790603904; x=1791208704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn4hX6mT9hKK5rs7jV7LPfxAez/GODV4ZuwmMfHS/FE=;
        b=KWCRZG3BH/xMxDzhFuzu5LJD8N6OoUPJ01NzQLdgF6pc5vyN3Kl77uK3SbzUIu1sRh
         J/3hTOv+96FEe+npci/1JQ7kvDraY2zAFj9W1I9/CFombAhvcBxPRWfgTHzOX+Gvzg3W
         Is5m5LgH+KoNIZDT/wreas8xMhatSNtVmHbjvNmFwcRJh1BqcknzTto9dhlKVuA95e0J
         j8/xyIX1nRfRVtBH99BTkfx2nUdR/yJtK5YUQS9OJsqKGBHrCVxrTAt1mBXoMUbR0Mrq
         eQPOZFSnogHRg1yv5JqpHR5MsrzQ9QQ9SFw+PUK74H9WAj3G4AxXuBKtmVLdLNhNqZYZ
         GI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603904; x=1791208704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn4hX6mT9hKK5rs7jV7LPfxAez/GODV4ZuwmMfHS/FE=;
        b=VJtmcL0q0zIKGUqNm4WbxDttxIqbZrlSos7Mz4e+aMkoLbvEQfdLS91wAxoXADDO/q
         D6paBGrZfZMVNCfldjEoOW1O4PsaJMKPKgOA43T3QkESSR5CFGscz9Ye9QX1n+JDhcXp
         P/ZVnpDhop7srFBJ4yj28uiYmQOLspvcSO8+URNe0AlvkNTxTRtPNAoYhp+hhGTtpONg
         39mmS+Ra1NA0kPQEiqIfQ17uxK3pvtiGujEZU/TJt8AtWxvN5a+72c+upt0D2qNhC8+V
         Zv5RgQvYbszGtgT9XwLdhevwWC+Snb7aKFJBLwFwe+sQma9VfIbr82MBoacZmUtAzIPk
         jkFA==
X-Forwarded-Encrypted: i=1; AKwUvBx3gzK4wUmDfhOjQwN9s5hq6i1X5Bqwwtpld5rBetFrzdxzXBvrniIF1oOwHTSPwPicCM/jlscmwedPf4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKmvzQinjPIIfNbzV2WRMObi4gcJtqhygdZdRi9kVQUeUpr+GB
	NYeDBNLReYl1toNutUKrvgrCuBnE+t3fuQ/4SnzCSwqbSt66lXLfLZTPczBDtA==
X-Gm-Gg: AYBFou3JndzdRasSON1YVo68QiiOF0/UabyWHAb52xaD16Z4GHOkayjRulgLdCxcMi4
	Ngx7zI6dEWPZTtyZJmqZxWdNOHosa90vP9ip2rKUGsvk1647/OfJikR2xNfqOjLxNfB9QvzJ6vs
	px4wzldFxGd21L9+6bEopzix53sbXFTbVTlIVuRayJ5fkeMfmEjGWlM6vzu3pXRj6Ufbt1BkdJ1
	HYNnDmlFKwZDqF+af5The/yW6rsfv98OX6PJm5QNvlJSfF0rn4cxwSfjOSfcRYLkxDTny/WmaFu
	qS8FsLBFzZEH5OAUfi/1q98PvfhUZeeBWaVVX9Y8WLRbCyS7VgkK/iJfCssYQ9clmfdTv0Oy3ie
	V2XUcF9t29wlGfXk5K+v7rKtKYP/IOX8bYfnQaK67NoqId7J6m8m1fb+AR7NVpWze8APpZj9uK4
	YUS9Tjf87I1ueeQYcy4M5PB3otY3uAkKAf1gRxUFk1GQkTh6ewofAXhbPhoiM/JPKYcGxXRWrA7
	lwr1aXK+r24+6c5
X-Received: by 2002:a17:90b:3c91:b0:3a4:7a81:e6ad with SMTP id 98e67ed59e1d1-3a47a81e754mr1375128a91.11.1790603903568;
        Mon, 28 Sep 2026 06:58:23 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc79219db77sm4204205a12.14.2026.09.28.06.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:58:23 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ak7375: fix regulator leak on remove while runtime-active
Date: Mon, 28 Sep 2026 20:58:16 +0700
Message-Id: <20260928135816.2383130-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ak7375_remove() calls pm_runtime_set_suspended(), but that's pure
bookkeeping -- it doesn't call ak7375_vcm_suspend() or otherwise
disable the regulator. ak7375_open()/close() hold a resume_and_get()/
put() pair for as long as a /dev/v4l-subdevX fd stays open, and
nothing requires userspace to close it before unbind -- so removing
the driver with an fd still open leaves the regulator on with no code
path left to ever disable it.

Call ak7375_vcm_suspend() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Moved remove() after suspend()/resume()'s definitions since it now
calls them directly.

Fixes: 90ee26fb2f50 ("media: ak7375: Add ak7375 lens voice coil driver")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ak7375.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 9a2432cea3ff..79327440f0b5 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -229,16 +229,6 @@ static int ak7375_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void ak7375_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
-
-	ak7375_subdev_cleanup(ak7375_dev);
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
-}
-
 /*
  * This function sets the vcm position, so it consumes least current
  * The lens position is gradually moved in units of ctrl_steps,
@@ -328,6 +318,18 @@ static int __maybe_unused ak7375_vcm_resume(struct device *dev)
 	return 0;
 }
 
+static void ak7375_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
+
+	ak7375_subdev_cleanup(ak7375_dev);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ak7375_vcm_suspend(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
 static const struct of_device_id ak7375_of_table[] = {
 	{ .compatible = "asahi-kasei,ak7345", .data = &ak7345_cdef, },
 	{ .compatible = "asahi-kasei,ak7375", .data = &ak7375_cdef, },
-- 
2.25.1

