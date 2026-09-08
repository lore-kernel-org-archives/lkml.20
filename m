Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E69C367293
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845776; cv=none; b=V7vPe8NtAAvXPNf/CjEWJiI07svjCSKwLOemzUHIbdpsghzuDRutnJjnaTef6PDY1AJ+C1sfEs1in+SqGpfWHsqOmYoeNWHiXt1cP1uSOJVn1NPpiJ2yd1JIiwHrqmuRGKaITT3WxRjQ+rf5y56Y4V/1mk56pg9JkhD/hP2FV3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845776; c=relaxed/simple;
	bh=hbh0kPGztzKqofjXfoo4NctvQyaeednPy4UEJ6oHvs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OLjO5tYA+SZaL2htyTWEyfsZlUdEy89CEUqH41Qp991EHdA2SLvyHX+pyJLP6780BJhs61d/dg+zR+f1PDexIzfjq7IYK56nP4b/L3kgF2Z8xRDq/qxIxTWjuEJ2yi5PRp4J15g+FCBUTS4iVn9aCSTbFT3QV9YrjtAaAUbdcyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzRDkKY/; arc=none smtp.client-ip=74.125.231.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzRDkKY/"
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-7f4ebb7b327so1240736a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845773; x=1789450573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WBc8n+gHehdclfRcRH7kDCMyNFtQz31WE2jNiaWuYu4=;
        b=BzRDkKY/qREFxA7+HGy6ld5bk9KN3NMdYjboZgKDc3+RAqSi8H5yrO8FHEukz+KREw
         v+OhXF5wUcQIo6VzzTryx7HilHZimKkStA0t0HkhIFRjXSnqEBNpSe79qYxYkxb404gg
         wCIjuSh3ARTDWOmsx69zjCIy5N/MZtSk9IAxIjS7tj/wKX5sEBleC+to+RY+XJs1PLWB
         M978up+7G76yiYwZndRrXQQGePWuXnav5zMFayUxp7stS1X47F/sCEhibQKIpPkfeYUP
         N7QbFYKpqU49XjfP1nac9OMTQN57xvqhO/Bs5Pzl6qq5SVMJ1BmXQI6EHc+enLz/Pzr2
         g2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845773; x=1789450573;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WBc8n+gHehdclfRcRH7kDCMyNFtQz31WE2jNiaWuYu4=;
        b=eMqL8OEJNq3v6PydHOY+xB7XRdl2VsLQ452IOBM7t6ogwX+wsGvCycJwyUH45RESkn
         QkZIdqfuFoIguZfjyNBvyE6LJn1Edbf4ee5Ed6p0/XLNkJrMz5G7tlMu0D5MgoJUHXVD
         bHHpxUGBpfzYN8MSoRaoFfO6V4qGrsV+Y/sINgUnvkSdSZ8dcnbirpcaKmUwBJvPE2cC
         +FbiiG57dWMFYvpSXTvGPvkvobrh14/chnTtQPOr4/HZV9pOXhxkqDNDf4i+RZazi0Iy
         7ccZwQ3m7De3wTkPA/WqGEvwDmqazZDn2/JPMWrKfnM7gLvd/tWZXNXzXKP+BrsLrf9r
         AhIw==
X-Forwarded-Encrypted: i=1; AKwUvBzsoUnHQ3L4DJHq60RNZabiNFDkOR0yPbr8pvvmDmp56H+3d8uZR5OC0ocZ93tXxBJBIUb5OosszyiBTl4=@vger.kernel.org
X-Gm-Message-State: AFuF++mbaoe0UdzF674WCKPnIRboZ+u1JeuPZ1Li3Y5V+xwjZcfDfqXa
	Zld7hZkAFcZ9mn4ULrKtKMa0Twi7CFL1lBMGGaiR4y1mMq62pJulG042
X-Gm-Gg: AYBFou3CG9QWznsNso8KI7549AW+cB7d834EOJbEdVWGDzDO0vAjiuRZuaIcl7QZKQR
	EtwRLFwdw821jSTC+xerjAXpzMyFp4Gb6mNhCiB9CeRzlbAXGGL4ik/9YNDYluabZEJ1/oXZ+Ip
	iQFwHGbR4pgse6glfO6Od45Z2DH3lZp0AW51186OaGtQ9bnYmO8zrURwKAEJGRNc7+GaJcCf7wE
	W1vfn4Avh19lrwog6qkuk7nCgbwMk6zda8fe0zQRm8c7w7EcTEvfkpQVbeUTiHdk5168wjouc31
	LPZJEzI5cCZZ0IWP0F4Bpk+SdCCrV+5MKxT6UkEXE2gD1QmwgSdeMlRD57cVK/MkTVyh6s5+lCw
	7ARGe/BYY9Cj97R8fLLBvT2AS76DDJc/vdyHXCCWUB7WbAmJK5HtdRixK5wqLeY3uPN+lgEa4m/
	mu1HbxSx9K1jVYQkL0vGFYWunM6oFjU8r9On0fivjjHvQXm6Yxwq9JFqT1
X-Received: by 2002:a05:6830:6f46:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-7fa1ff74418mr27813923a34.10.1788845772488;
        Mon, 07 Sep 2026 22:36:12 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da949asm13128118a34.12.2026.09.07.22.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:36:11 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 08 Sep 2026 00:35:58 -0500
Subject: [PATCH] power: supply: bq24190_charger: use the wake irq API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rbrue-suez-upstreaming-bq24190_charger-use-wake-irq-api-v1-1-c3f10ae2a34a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBAAv0L27CalKoJfMca0sNTVWGGXqpHwd
 6se5zAzMygJk8K+mEHowcr3mKFcFdCeXQyE3GUGa2xlGlOjeEmEmuiNadBJyN04BvSj3ZSNOWV
 JAgkmJXy6a9ZlRDcw+o4q09fldm12kOuDUM+v3/lw/LMmf6F2+u5gWT5BqQgQmwAAAA==
X-Change-ID: 20260908-rbrue-suez-upstreaming-bq24190_charger-use-wake-irq-api-bde60f815307
To: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Greer <mgreer@animalcreek.com>, Liam Breck <kernel@networkimprov.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788845769; l=2879;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=hbh0kPGztzKqofjXfoo4NctvQyaeednPy4UEJ6oHvs0=;
 b=mCC5dX7hmHijitDnXFjpTWaloLli1AScb6gnvqNvofZLCm2DBxcYJ3wuE3n9Ax9hWfabJ1uWI
 EwZ74Ke/jF0DI52HqDBUgypxP5UQqHSecQQbRChAkJ6+pbP1DbWyUJI
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

bq24190_probe() calls enable_irq_wake() on the charger interrupt and
never calls disable_irq_wake(). That is wrong in three ways.

It is unbalanced. free_irq() does not touch desc->wake_depth -- only
irq_set_irq_wake() does -- so after the driver is unbound the descriptor
is still one wake reference deep and the irqchip is still configured for
wake, forever, for an interrupt nobody owns any more.

It ignores the device's wakeup policy. The chip is made a system wake
source whether or not anyone asked for it, and because
device_init_wakeup() is never called there is no power/wakeup attribute
for userspace to say otherwise. A board that would rather not be woken
by its charger has no way to express that.

And it arms the interrupt for wake permanently, from probe onwards,
rather than for the sleep it is meant to cover.

Use the wake irq API instead: devm_device_init_wakeup() to make the
device wakeup-capable and enabled -- preserving today's behaviour -- and
devm_pm_set_wake_irq() to hand the interrupt to the PM core, which arms
it in dpm_suspend_noirq() (only if device_may_wakeup(), immediately
before suspend_device_irqs()) and disarms it on resume. Both are unwound
by devm, so the reference is balanced on unbind, and userspace gets the
power/wakeup control it should have had.

No intended change in behaviour: charger events still wake the system by
default.

The same conversion was made to another charger driver for the same
reason, in commit 6c5393771c50 ("power: supply: qcom_pmi8998_charger: fix
wakeirq").

Fixes: f385e6e2a153 ("power: bq24190_charger: Use PM runtime autosuspend")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/power/supply/bq24190_charger.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/supply/bq24190_charger.c
index 4bea6fd83c36..376b0b06a096 100644
--- a/drivers/power/supply/bq24190_charger.c
+++ b/drivers/power/supply/bq24190_charger.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/power_supply.h>
 #include <linux/power/bq24190_charger.h>
 #include <linux/regulator/driver.h>
@@ -2168,7 +2169,13 @@ static int bq24190_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto out_charger;
 
-	enable_irq_wake(client->irq);
+	ret = devm_device_init_wakeup(dev);
+	if (ret < 0)
+		goto out_charger;
+
+	ret = devm_pm_set_wake_irq(dev, client->irq);
+	if (ret < 0)
+		goto out_charger;
 
 	pm_runtime_put_autosuspend(dev);
 

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-rbrue-suez-upstreaming-bq24190_charger-use-wake-irq-api-bde60f815307

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

