Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142CC38B157
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562908; cv=none; b=taDhDdA5vty/hyuushAnNfUQM+F7UUREx6lCh7dBqA5grN6WbymDCyrOefdY/HF1jlthqFKfcIgiR3mxKk27LsmtuZk/aHlo5AIeOQlUqyNW9jH0rfrySN8/nSJCJFcpSzaEtU+1PC+kRvjtxvq1nsePHp0yLihU965EQK+jmso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562908; c=relaxed/simple;
	bh=ktEUA4I/QOWBXJdkm7apRaIMx8G1N83lADeV3M8pSqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbiWJjTfxbmzL6sw9CK4Wm8Y05aWCs4SmXThRhTD19NiQtRW/BlMUo1NTSW/l942eUcquJikeWwaKW9CclcekuiVtA2wVVMaRrF9rf1IY36yV2kzUFemUNu6GOdZios6/FdjIwam8VhzTuJPVKpaIPOsJDznyTn5/7dMBZL+YJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSkenvss; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSkenvss"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8534d507f59so1686805b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788562906; x=1789167706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj6rkiDUr48HOONfvJQ87MDV9HV1+Ud30doXtyCj4Sk=;
        b=MSkenvssU/QEs5XARmvXVoaFykK5PHhnQ4l+dsLaoIjs2gHIhp9N7gYNsmRO04FVva
         FHB1tTJfh7vknW2QHO5QfncSX49e7R+Dm0RCQy0QpSPgnRmZ7aV/ERCgRc/2ql54u1xH
         G803GbKXv1uTzeuPONVGmWKdwQ7aGmxzbe5pQkdO0p/wMSc0V46WWxVsNOvYC4QtCYUV
         9f10i9R7KSIms7YQ0sYPJECyvuuhwywX4szXuQGYtUn7IeQaZSn3v8Y4BSR+OQhgmc34
         oG2we796NQe9kCfWdwmHq/B3ta+dFb58zyMnV7pb2+EISFafnT3QS9Z007Lif+nzbITG
         G4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562906; x=1789167706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj6rkiDUr48HOONfvJQ87MDV9HV1+Ud30doXtyCj4Sk=;
        b=HwzC+YQM15KzMB5K381VpyuQjvNb2rjIKy4n/W9mlr9LQivrf4o39hwtperQycgawU
         yM2yKETzWY0zs3EFUmHOcaBbNZDqhKvmJhq1avQ+w5ufeaR5xRIIOqw7A0afB1FD17wY
         zMWMb+u0jNNFDEBxruSHNbhkJVPKqjrR+/Lul6QKytKDvWJ31LDuAUsEJL6Q2TkaTxV/
         yN/GPvqgIiQOtk1X+B98qiRlJmFFJs9GGYIcrxAQLRJp7tSFR2QS1HVTJ4vsycYdIfQ5
         1bMmEQIt8uQw9HVk50XCcIgm0+pIg4td4TFYBn0jbM931gYA26IvS8qT+94rjm/tFRYF
         qXJw==
X-Forwarded-Encrypted: i=1; AKwUvBy21dN4nx6pZK/u74w7Gfl0OzQtMhbRqb4/Sb9t1OPZghLOyQYjUJhArUfSi6x3bwZr+SfGp4R7fDEPMlg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+nNBx3mo6orgK+8dDDLULHGrwCOtPl4m9knIITXOPHhD1T+Ri
	nIekZkKA5Df1kHt3jQnbX7NyKSnZKKSW8pdHUDc24n7ZZwBAxDFssEcm
X-Gm-Gg: AYBFou3iDwZ4g5EgXnd8sWIbq3y7dmA8OUnYVtV7M5fVdj669iW9uSDpwxydSJOVsUd
	usddrtost5xJIWT/waX1SAoS1PddtnXibV4k6oInejxTS2+8sNJpkNN2RHh8m20KAYa+76v6u/T
	ki8shZaWSB5PYqEVml5PnZobBT7Beaai80XlaKTFMgP2DkbK2gJJx3FXAzSCUu66tWWDYZv4aOs
	GPNRlnLm2/DiDLHd+JUODH1uvs1U3g9FUSoJ3VxRuEzRzwz5BZ7cc995aNlbllrF6LpweMcfrjS
	aQn0iSJ4F8p2SGpf4JKu2AwJwqeFztIzui32JuILSIQbvmSvAtkyYYFlmLMjQvnXFm80khHB6z7
	9IxgHt6Vca8SmGK/jRb3COpcirC8eu43ENjJLWjIUMfKt599OCJ3TbTxIbW4v/v2REwOjAVgZUh
	lyhMLLE35YZjA1HaLUy4FTsnW1cp77Rtj3bm+EOlD0lRbLMfuFOTSq44STU0ZiiQ6DY2C5rOoXk
	5J6RXwNmWhM+YC9nSsK0P72UsiffXlIuAx1exOoDADAolJjfmQ7LU9HITJGdzJhwJYQ9N1uVbTB
	J69gJf+T+tUqNXTDsJHzGlefHldqLcS3+JOgLg==
X-Received: by 2002:a05:6a00:10d4:b0:857:7337:5db4 with SMTP id d2e1a72fcca58-8616a26166amr10487230b3a.18.1788562906198;
        Fri, 04 Sep 2026 16:01:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86265451951sm723957b3a.50.2026.09.04.16.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:01:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: amcc: trng: use int for ppc4xx_trng_probe()
Date: Fri,  4 Sep 2026 16:01:44 -0700
Message-ID: <20260904230144.127071-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass an error message to crypto4xx_probe() , which will allow handling
failure. The inline function returns 0 as trng is optional
functionality. Same with the of_node.

Add an extra goto in crypto4xx_probe() to unregister algs as registering
them happens before trng.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/amcc/crypto4xx_core.c |  6 +++++-
 drivers/crypto/amcc/crypto4xx_trng.c | 15 ++++++++++-----
 drivers/crypto/amcc/crypto4xx_trng.h |  6 +++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_core.c b/drivers/crypto/amcc/crypto4xx_core.c
index a044dce65cf4..acf18b71e54d 100644
--- a/drivers/crypto/amcc/crypto4xx_core.c
+++ b/drivers/crypto/amcc/crypto4xx_core.c
@@ -1315,9 +1315,13 @@ static int crypto4xx_probe(struct platform_device *ofdev)
 	if (rc)
 		goto err_irq;
 
-	ppc4xx_trng_probe(core_dev);
+	rc = ppc4xx_trng_probe(core_dev);
+	if (rc)
+		goto err_crypto;
 	return 0;
 
+err_crypto:
+	crypto4xx_unregister_alg(core_dev->dev);
 err_irq:
 	free_irq(core_dev->irq, core_dev);
 err_tasklet:
diff --git a/drivers/crypto/amcc/crypto4xx_trng.c b/drivers/crypto/amcc/crypto4xx_trng.c
index cfd66b779ce1..83e9353529fc 100644
--- a/drivers/crypto/amcc/crypto4xx_trng.c
+++ b/drivers/crypto/amcc/crypto4xx_trng.c
@@ -68,7 +68,7 @@ static const struct of_device_id ppc4xx_trng_match[] = {
 	{},
 };
 
-void ppc4xx_trng_probe(struct crypto4xx_core_device *core_dev)
+int ppc4xx_trng_probe(struct crypto4xx_core_device *core_dev)
 {
 	struct crypto4xx_device *dev = core_dev->dev;
 	struct device_node *trng = NULL;
@@ -79,17 +79,21 @@ void ppc4xx_trng_probe(struct crypto4xx_core_device *core_dev)
 	trng = of_find_matching_node(NULL, ppc4xx_trng_match);
 	if (!trng || !of_device_is_available(trng)) {
 		of_node_put(trng);
-		return;
+		return 0;
 	}
 
 	dev->trng_base = of_iomap(trng, 0);
 	of_node_put(trng);
-	if (!dev->trng_base)
+	if (!dev->trng_base) {
+		err = -EINVAL;
 		goto err_out;
+	}
 
 	rng = kzalloc_obj(*rng);
-	if (!rng)
+	if (!rng) {
+		err = -ENOMEM;
 		goto err_out;
+	}
 
 	rng->name = KBUILD_MODNAME;
 	rng->data_present = ppc4xx_trng_data_present;
@@ -105,13 +109,14 @@ void ppc4xx_trng_probe(struct crypto4xx_core_device *core_dev)
 			err);
 		goto err_out;
 	}
-	return;
+	return 0;
 
 err_out:
 	iounmap(dev->trng_base);
 	kfree(rng);
 	dev->trng_base = NULL;
 	core_dev->trng = NULL;
+	return err;
 }
 
 void ppc4xx_trng_remove(struct crypto4xx_core_device *core_dev)
diff --git a/drivers/crypto/amcc/crypto4xx_trng.h b/drivers/crypto/amcc/crypto4xx_trng.h
index 7356716274cb..1030c3cfafd0 100644
--- a/drivers/crypto/amcc/crypto4xx_trng.h
+++ b/drivers/crypto/amcc/crypto4xx_trng.h
@@ -13,11 +13,11 @@
 #define __CRYPTO4XX_TRNG_H__
 
 #ifdef CONFIG_HW_RANDOM_PPC4XX
-void ppc4xx_trng_probe(struct crypto4xx_core_device *core_dev);
+int ppc4xx_trng_probe(struct crypto4xx_core_device *core_dev);
 void ppc4xx_trng_remove(struct crypto4xx_core_device *core_dev);
 #else
-static inline void ppc4xx_trng_probe(
-	struct crypto4xx_core_device *dev __maybe_unused) { }
+static inline int ppc4xx_trng_probe(
+	struct crypto4xx_core_device *dev __maybe_unused) { return 0; }
 static inline void ppc4xx_trng_remove(
 	struct crypto4xx_core_device *dev __maybe_unused) { }
 #endif
-- 
2.55.0

