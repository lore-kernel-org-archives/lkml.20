Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0898456B849
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968530; cv=none; b=EOOhGwRmcrSpmFDNdTjfgInfbDwcmSOKrI85A/nunri1sCKyCAxl9FHfHJuRfno3VllDz9KtwgTB9ITK9JDlZwhBzmyyRJ9ZplUVR4+w/4Z69m9bhKppw/u+pHeJhYkLP/Wn0/FfkX0QWIHT1ZKpjK2KFf6uQJEpp5XHvbxfPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968530; c=relaxed/simple;
	bh=uu+2lcKvfJGi/5CNbofvvGBfTiVgP3doGLL1WgijQqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqub69KLSki8wz8WTOfXzQjwjdXQRvJCVvI3dnGSYBCK6unwhdDqZgwSOlv2XvIsd24G70+BeFwiMmDSyhQMOiOak0Xb+CkkeZhJAVqEa3xE8YDt6hEjHKrY21U+xtKFUKX6SXUMpf6CXVhF91yZ9YwzT8AJuhwiGU03cHCmqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=GQLMDJdt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="GQLMDJdt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso8189125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788968526; x=1789573326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATWBzXgtximDnM1arJgBep/Ega/TVarG2T9lOXViDEw=;
        b=GQLMDJdt4gyoDqitmHKquozQjRKCMJ1K28XyxlWLK4fVOzQQc39QZ3pxFpH2rg1/rw
         huH8CaGU319IcC4Po+vqK3mVqR4vl5FkrzE6mo0EqY8xUvDjPfmvGdeotc5122jpItnh
         s1hQWFyF+en8MI0qeCrVHHsfnhUBHtNt6ECbFY3snMrqU9wKe1QKh2/XLnXEKn1lA7A5
         4vF+h4DAxQuo0R4z1F8CmzvteNtj78XDEXLcla+JAlZTLhwUoq8jbPhx8V7KCCnNP6fO
         +RolKcpJRCZ7GeIrvP1pxJZAQ4NOWHcaIA7wIl7dBgbsi8EDtzPBXdAL3BAQTSOXDO6j
         NOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968526; x=1789573326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATWBzXgtximDnM1arJgBep/Ega/TVarG2T9lOXViDEw=;
        b=Fyr1SGCNew+8B0LYOpi7gzZjjSkdRfU8120x7on5cQYWXIsWiPgzgwLgbxdGBkflEz
         jqTtJ6KqCeIFdemSmFpdXkvKWFB92tkSE063ARao1gG28/LGJ1ZoG67pavEUqx9NkzQy
         yVuFhzOajf424lnh2XPi87nqdAc+2R7BZJ+jKMphUJWGfPKFYhOXm32/eaQASQDR9Uqd
         3whga5wtKGtDEMRcshQzzMvZGmCMzxdEkiX9i/XLG8irYiNo+1amFLN/S5KCxXy3+4sW
         KlnSqOWEGFoUlSuIJUtDyM63JS5wxUv/4nq2XPF5X/dPpQNHpa51Jk30hX7GL7qH4en/
         cTEw==
X-Forwarded-Encrypted: i=1; AKwUvBxDW04NwNC56g55uxLK8+096cy+F/vjUjIQt4QwRfml33tGbl+WNbG2s/MFvSF1wSDu5eeY9/8wgeBnP0w=@vger.kernel.org
X-Gm-Message-State: AFuF++km+DP0gFwcNSz4tLS7L4fAaRNaZ6tgXyhUJSppcN45SF6cDoTp
	wHDc5iJsAvt42gptE6n7HZwH5snC0gc7+u0aepfWZbgcxe3Tuo3eiQn467bPOzM3wt0=
X-Gm-Gg: AYBFou1FXiky+qlzq6T158qY9cRLDbH4/F9jSiX6RyN3m/OpSl+GV7eH21mUkyRqZIP
	tAdy/C+3aY0OGS+ECsUwEguvEdIjvVQ801qpFopKW09Z7vvjQ/0VjRuBY8JaS7ZvUWbDzw+Jt8p
	H74zaB9aDm0CH0fK3nq1RVUvvAlWpN66yFmzQ+moCSIr+bW6q2hNhjUEiy7VwpgPk62+dzVD6/q
	zFIxyRksJLRoukax0s/YcpgoS7ZpvgB1xvHKnfsZuGdL0hee4LIUZ2j2i1Gmk0nXMt0LA42kL0R
	Ee57bi82o+O5DMQ5oNSgLGR2iGbhfPlGtbABPEx6njUaab3cqNkwwqoH58MevoZCUYIuOQEqYkR
	Se1NjIzetDEzFegR0L05eP/5PMbJTdLfoektlWpSI3CgSMSj0AfChj5j0Ys7mxfg6WU8LtgY09s
	PCZ6IWBsdyC2UOAZbs4+D+URFUbHAzzE8jgG8oV8oSgUCNLRsOAsPSjYaqXEqtN04tXZ9ifYOQq
	FHI0jXxvJ8FpT/qez9AjtHXXqswNIqg/30fVxsdWI0HYfg3dmw=
X-Received: by 2002:a05:600c:3145:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d1757294bmr150353495e9.9.1788968526173;
        Wed, 09 Sep 2026 08:42:06 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm1042068015e9.15.2026.09.09.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:42:05 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 09 Sep 2026 19:41:44 +0400
Subject: [PATCH v2 1/4] power: supply: core: prevent unregistering a power
 supply while a callback runs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-bq257xx-init-v2-1-deb4076b1f02@flipper.net>
References: <20260909-bq257xx-init-v2-0-deb4076b1f02@flipper.net>
In-Reply-To: <20260909-bq257xx-init-v2-0-deb4076b1f02@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7060; i=alchark@flipper.net;
 h=from:subject:message-id; bh=uu+2lcKvfJGi/5CNbofvvGBfTiVgP3doGLL1WgijQqw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQtrHP7JRdy5OU0dY65SkVS+Y2sCk8k3zQbTr970WZla
 HHutYAVHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx160KG/+WP2RPOLpo09cii5NQT2q8fbKw9EZibn/zu97sHQVb7U2YxMrQJ5C1
 /cKLKs3zZrdBy0wWvI47HMnxw+XvFRe3Wr5k3NjMCAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Once a power supply is registered, its callbacks can immediately start
firing from other contexts, such as external_power_changed() triggered by
the TCPM stack. If a power supply is unregistered while the callback is
still running, the driver data can already be freed when the callback
tries to access it, leading to a use-after-free.

This happens e.g. when the hardware bus carrying the power supply device
malfunctions (e.g. I2C is hogged down by another malfunctioning device)
immediately after the power supply is registered, and thus the core is
still processing the callbacks which were queued up when the driver
starts the removal, leading in some cases to a kernel crash, e.g.:

[   11.645942] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000005
[   11.646751] Mem abort info:
[   11.647006]   ESR = 0x0000000096000004
[   11.647338]   EC = 0x25: DABT (current EL), IL = 32 bits
[   11.647806]   SET = 0, FnV = 0
[   11.648077]   EA = 0, S1PTW = 0
[   11.648356]   FSC = 0x04: level 0 translation fault
[   11.648785] Data abort info:
[   11.649041]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   11.649524]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   11.649981]   GCS = 0, Overlay = 0, DirtyBit = 0
[   11.650390] [0000000000000005] user address but active_mm is swapper
[   11.650955] Internal error: Oops: 0000000096000004 [#1]  SMP
[   11.651460] Modules linked in:
[   11.651742] CPU: 1 UID: 0 PID: 144 Comm: kworker/1:2 Not tainted 7.2.0-rc6-g62a9297af2cd #1 PREEMPT
[   11.652553] Hardware name: Flipper One rev. F0B1C2 (DT)
[   11.653024] Workqueue: events power_supply_changed_work
[   11.653511] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   11.654135] pc : __power_supply_is_supplied_by+0x18/0x100
[   11.654624] lr : __power_supply_am_i_supplied+0x40/0xb8
[   11.655098] sp : ffff80008192bb30
[   11.655399] x29: ffff80008192bb30 x28: 0000000000000000 x27: 0000000000000000
[   11.656049] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[   11.656695] x23: ffff0000c19f4200 x22: ffffdb2232ba4ea8 x21: ffff80008192bc28
[   11.657344] x20: ffff0000c1eef000 x19: ffff80008192bc18 x18: 00000000a0886e62
[   11.657991] x17: 000000040044ffff x16: 04500072b5503510 x15: 0000000000000000
[   11.658639] x14: 0000000000000000 x13: 0000000000000220 x12: 0000000000000000
[   11.659286] x11: 0000000000000000 x10: ffff0000c1fdb2b0 x9 : ffffdb2232ba5590
[   11.659934] x8 : 00000000e5b906e6 x7 : ffff0000c2502778 x6 : ffffdb22339793d0
[   11.660581] x5 : ffff80008192bc18 x4 : ffff0000c19cbca0 x3 : 0000000000000000
[   11.661228] x2 : ffff0000c1fdaf40 x1 : ffffffffffffffed x0 : ffff0000c1eef000
[   11.661878] Call trace:
[   11.662103]  __power_supply_is_supplied_by+0x18/0x100 (P)
[   11.662596]  __power_supply_am_i_supplied+0x40/0xb8
[   11.663040]  psy_for_each_psy_cb+0x20/0x40
[   11.663416]  class_for_each_device+0x110/0x150
[   11.663825]  power_supply_am_i_supplied+0x68/0x100
[   11.664262]  bq257xx_external_power_changed+0x58/0x140
[   11.664733]  __power_supply_changed_work+0x60/0x80
[   11.665170]  psy_for_each_psy_cb+0x20/0x40
[   11.665545]  class_for_each_device+0x110/0x150
[   11.665953]  power_supply_changed_work+0x98/0x1b8
[   11.666382]  process_one_work+0x164/0x4c0
[   11.666758]  worker_thread+0x19c/0x320
[   11.667104]  kthread+0x138/0x150
[   11.667408]  ret_from_fork+0x10/0x20
[   11.667744] Code: d503233f a9bd7bfd 910003fd a90153f3 (f9400c34)
[   11.668294] ---[ end trace 0000000000000000 ]---

Add a read-write semaphore between external_power_changed() and
power_supply_unregister() to prevent the latter from returning (and thus
the driver from freeing its data) while the callback is still running.

Fixes: bc1540561c9e ("power_supply: Add API for safe access of power supply function attrs")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/power_supply_core.c | 26 +++++++++++++++++++++++++-
 include/linux/power_supply.h             | 10 ++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 47e307709e5e..1279785645fb 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -1530,6 +1530,19 @@ void power_supply_external_power_changed(struct power_supply *psy)
 			!psy->desc->external_power_changed)
 		return;
 
+	/*
+	 * Keep power_supply_unregister() from returning, and thus from letting
+	 * the driver's data be freed, while the callback is running. The
+	 * ->removing check has to happen under the lock: on its own, just like
+	 * the use_cnt check above, it only tells us the supply was still there
+	 * when we looked, not that it still is by the time the callback
+	 * dereferences its driver data.
+	 */
+	guard(rwsem_read)(&psy->epc_sem);
+
+	if (psy->removing)
+		return;
+
 	psy->desc->external_power_changed(psy);
 }
 EXPORT_SYMBOL_GPL(power_supply_external_power_changed);
@@ -1774,6 +1787,7 @@ __power_supply_register(struct device *parent,
 	}
 
 	spin_lock_init(&psy->changed_lock);
+	init_rwsem(&psy->epc_sem);
 	init_rwsem(&psy->extensions_sem);
 	INIT_LIST_HEAD(&psy->extensions);
 
@@ -1914,7 +1928,17 @@ EXPORT_SYMBOL_GPL(devm_power_supply_register);
 void power_supply_unregister(struct power_supply *psy)
 {
 	WARN_ON(atomic_dec_return(&psy->use_cnt));
-	psy->removing = true;
+
+	/*
+	 * Publish ->removing so that no new ->external_power_changed() call can
+	 * start, and wait via semaphore for one that is already running: it may
+	 * be a supplier's changed_work, which cancel_work_sync() below does not
+	 * cover, and it may still dereference driver data that the caller is
+	 * about to free.
+	 */
+	scoped_guard(rwsem_write, &psy->epc_sem)
+		psy->removing = true;
+
 	cancel_work_sync(&psy->changed_work);
 	cancel_delayed_work_sync(&psy->deferred_register_work);
 	sysfs_remove_link(&psy->dev.kobj, "powers");
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index e749d2189335..131cafded72f 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -351,6 +351,16 @@ struct power_supply {
 	bool removing;
 	atomic_t use_cnt;
 	struct power_supply_battery_info *battery_info;
+	/*
+	 * Held for read while ->external_power_changed() runs, and for write by
+	 * power_supply_unregister() when it publishes @removing, so that it
+	 * waits for an in-flight callback to finish. Without this a driver's
+	 * data, typically devm-allocated on its own device, can be freed while
+	 * the callback is still using it.
+	 * Must not be shared with extensions_sem: callbacks may read their own
+	 * properties, which takes that one for read.
+	 */
+	struct rw_semaphore epc_sem;
 	struct rw_semaphore extensions_sem; /* protects "extensions" */
 	struct list_head extensions;
 #ifdef CONFIG_THERMAL

-- 
2.55.0

