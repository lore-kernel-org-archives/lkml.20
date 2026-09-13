Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA7B2F9D82
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265671; cv=none; b=hvvLtV1cwstIBybC5JoQ2bnaKBW+T0K0uSGrxv+xVsNY0NojgHOKEAATCuXyoX81YnHnq2F4sha3W2hJOJgU+j+0S4Q4bDopWAbWJbPDtXJi0aKDQcbmnjAjxrSMvutqXZ28HBhTlXhCJuIJwc+MeZeDSNd+5oHatfORnB3o5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265671; c=relaxed/simple;
	bh=MaAJoU6a7Qyxznv4vcbVvqn1Vtx1/3A0x/k0WpAIyt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gl6UPvslcdfH7Urcjo5k3EFDt5075+dgFgqompo0HxGG/pzLZB2gW2vK24BPjolKu4t+9Xkm3CkFYllEygiBCLVwY8Mq8ugogFQMUo4Cb0+EbJHs9Y4KfZJyGgaq5guRw95mV5dw2MgwJzcqitrrz4pjPK52lkFs9YMIA+cpdag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZRO4d9l; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZRO4d9l"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c8so60699785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789265669; x=1789870469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3En0YSc2ctcfWFz6P+MWPu/wu8wKVRURedbkaqkB1rw=;
        b=sZRO4d9lSlRi25nRUP8xigazAMZMzYqmmIa2ouJ6n5xfRpaFXbtLDnB8t7erVXgMiR
         94++MI67jcaFmafoUaUvrwebgUTRrPJDHW043cK/8/6tCv5q86PlG18EyCO6MoQabhTD
         rLKOqOmhk2pO6stS2faul7ImRwrOHtSlocBdftcI190GpOQOC/5GlY6hsf288ARP2Bqo
         2EdIJz4dgP2hz6f3Lv+l2/oxPUec5638GN/RNZWSiQg9CO9t4oSypefw4oveVCqMOE5z
         zi4+jXXMpfJ12jCr71a7a1vhdfHDfZlDFdUfPkoVW9/CFMqWBhCWquf692E+VCb2zBwM
         COqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789265669; x=1789870469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3En0YSc2ctcfWFz6P+MWPu/wu8wKVRURedbkaqkB1rw=;
        b=FwH3VTnQVeVT9qJVi8M9VSisGBxxIEWS/PHhqVFxCcCA1Vi7WaYvXgtrPC6Z1tfSfq
         JreCgDv985rNa5EEaR3wImEkWNktKZJLAox9bVHrmPpsQXc1eslro3AbNKhYbs4yyWGQ
         s68jnwjMBubT7tcLcEnzq5FT/TfVloCPxH6GX550F3+Xlme1vqHffZXzRN9usRODBdku
         frV/I3n3w4W1N1KW9GOP35Z8tx8akgiRgSG0GXIYGBjTu2/nqjhlep/a2kZM/KI4M9ty
         lwKXV01tVKodVu32RPwbHWZ7aGYRjVQSus0vu5+8SuVhkX4FX4wzBFt39+Mt9eq9HaC9
         MOSA==
X-Forwarded-Encrypted: i=1; AKwUvBxOH9XPrtEJ0s4DKyzG9UwhVXnIyttm2KHxSMq3JUXPDLlwXxkha5kxO7Gpfb5FJFTKMuW6HGf8b0rA/Wo=@vger.kernel.org
X-Gm-Message-State: AFuF++n45cXkMADPPhc/7rwtJCIVaSgDrUrmQhKbQOUKxtGNvKAJM00T
	wyWkDYMMf0i9NJZATzBuKfjPMh6pE8WFandR2aLIFduF7d4FD6YR5/OGMw9aT8q3SA==
X-Gm-Gg: AYBFou1LhhvPLbZVRMbUZeGXsoRaH3wtiQJFkTdByFIwqPfxi5G3MMEYC/GRXzEyS/t
	bInBFp8dTlPGBhSsKjSF9Ajyl3EggGvazyjk1mnX+xSKHwac8it0IQiEBS6isC3QgFlV8+TD2AE
	xWlTlHlaOUk2km5HgAJfryTjAUmgcXLdnGOYogTIpIvsszFXgiUHL46QNvAUckJFS4eSbcrNoqj
	vZj+7TfFjKK3UzlQTkj9RgmhASy1keG7N0ntb7RACRNLCaqGaCv2hGQG6rCWFNqPlQT/4N8zw/e
	kmKg+zxeOCgMzmZnGTRO0oVQ1PucN9E5LioGoH/UEzKfQiTFDUjPbATDBZ2VuJ3EApyKQD8+Aaz
	vt3VAd8J9yCacbY6sPPobtQU4fdTMbaXP2/TMtBrgEvHzjToAl6nAKARaYPqQC2ZGhAy/JIwkO8
	C3ZeNwEv0oBybrfgKIjv1mFf22AnOrCxKci7X7Cxlkp2xstsIx8Xq5YTioVhLKetakLQlJbEH/T
	+DFxY8yTeEVvNbSufezJRM3A+ncIA1XLTxitFO/l9LffXOgNQvzGSNaPcdKqI4bKh0rg+qgoh0G
	Masp1C2eCr+blGR0I2bcqOfvV4XhqG7B/u20+tMHaTwT
X-Received: by 2002:a05:620a:288a:b0:939:ede4:a499 with SMTP id af79cd13be357-93a035f328dmr773950285a.5.1789265668929;
        Sat, 12 Sep 2026 19:14:28 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f1dd527asm512943485a.16.2026.09.12.19.14.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 19:14:28 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: da9150: balance IRQ wake on teardown
Date: Sat, 12 Sep 2026 22:14:20 -0400
Message-ID: <20260913021420.60344-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DA9150 enables IRQ wake after registering its regmap IRQ chip, but does not
disable it on a later probe failure or driver removal. This leaves the wake
depth elevated after the handler is removed, and repeated bind attempts can
accumulate the imbalance.

Remember whether enabling IRQ wake succeeded and balance only a successful
call. Remove MFD children first so their nested IRQ users are gone, then
disable wake before removing the regmap IRQ chip. Preserve the existing
non-fatal behavior when IRQ wake cannot be enabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/da9150-core.c       | 9 +++++++--
 include/linux/mfd/da9150/core.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3e..d91d419fea663 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -450,7 +450,8 @@ static int da9150_probe(struct i2c_client *client)
 
 	da9150->irq_base = regmap_irq_chip_get_base(da9150->regmap_irq_data);
 
-	enable_irq_wake(da9150->irq);
+	if (!enable_irq_wake(da9150->irq))
+		da9150->irq_wake_enabled = true;
 
 	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
 			      ARRAY_SIZE(da9150_devs), NULL,
@@ -463,6 +464,8 @@ static int da9150_probe(struct i2c_client *client)
 	return 0;
 
 mfd_fail:
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
 	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 regmap_irq_fail:
 	i2c_unregister_device(da9150->core_qif);
@@ -474,8 +477,10 @@ static void da9150_remove(struct i2c_client *client)
 {
 	struct da9150 *da9150 = i2c_get_clientdata(client);
 
-	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	mfd_remove_devices(da9150->dev);
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
+	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	i2c_unregister_device(da9150->core_qif);
 }
 
diff --git a/include/linux/mfd/da9150/core.h b/include/linux/mfd/da9150/core.h
index d116d5f3ef561..369698036d1aa 100644
--- a/include/linux/mfd/da9150/core.h
+++ b/include/linux/mfd/da9150/core.h
@@ -65,6 +65,7 @@ struct da9150 {
 	struct regmap_irq_chip_data *regmap_irq_data;
 	int irq;
 	int irq_base;
+	bool irq_wake_enabled;
 };
 
 /* Device I/O - Query Interface for FG and standard register access */
-- 
2.47.1

