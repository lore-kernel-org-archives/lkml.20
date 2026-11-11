Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361952;
	b=NIPLSFluwKm4cCmNIGfBAyNvJee6Raezuug5mIg+3DC389SDvCCUvJqoDsV4yY6dpxwW
	 LMIF6OWncMg/BvtI84a9qmGnkdivRyo4MV3zZ0SeifbYtrDSbSphB1QalktErcuNHrQKr
	 Aq7ey3OkURuhVL8/HhsdZaWniDBbJ17sfLHR8RmZNYq8KTTSvuLt3aWxgacJhIco0S4SG
	 mIDLs/jaZO1aJyk/jxTadixSgNplKd1Xn2QpQ6dFncJhlZdmQ03G8T0NIZckPseEAtXkq
	 jcZVJoDgDB9AIUTtx2/ep5leNDdJ7cYgJXnh3sxR78LVrWfVbWMDhXTVMKoqIvO7d7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FrE2nxcQRZH8WQUmYcabDKCJom3Cf8QMuXcnvRuyIOE=;
	b=xk2yJ9qyltJY2EfxNTbKUwYR+yGyIdGUDwvHf8voyh+5WEUMiscNAsDedvUFvKokBIlp
	 Hb58MtBsIkLIVjGheyz0JDJYEzsnQfBbgus/jRijpIK05FA6JjsjrM18vpNqVKOrDVyhf
	 sxM9jNSSYJt183H5IJw4xYsIT/ro0RZWbC0Pz38187PTAaok8K5FkavHIQ/5Wxd7AORzq
	 kTnWwcqKRddvguWiFVBBHswLErVVJ+FJBZ9OwmTEpavSmbHCp0PmJ/NnDaiDAun/6Ah4E
	 oL1WLIIyTeheZ21rlNeLlYEyxA5RE1SCABup6No+NNrNH1A5MzeuItY0N8KmCMhG1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WswQo9xR;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C548606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C548606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WswQo9xR
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso1046903b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794361951; x=1794966751; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FrE2nxcQRZH8WQUmYcabDKCJom3Cf8QMuXcnvRuyIOE=;
        b=WswQo9xR6Ay2Ig8PLllXM3nUQg0nuun37Ftz4VjBmkMxrlCeSnOT1Lv/dcBP9mFeKV
         UobcWGLxINwKhMBNJbZRY+CBz4li8gx1oIqkPn2ddyL9d5OcMqjvV8iAEIh1dtsHB2im
         zCNrnG+2BbDgXXMh0B5ASSx16qUjJZoCkP7f0Yb9ZwCbAa599l0d0fXlZMvUkYNK1LVm
         xrVsG8MZAG+7NmkSIwBkjJ5jx9G7+BWqukTjvLnbDaK+L9FhOyxggaPDhfIzHkBsleWg
         KcxYxnV4zgwvpaCrdP2+3xAIsMzsd8OvuYa8BB0v5XxNlTThHpd/FTViGWU7QvPdnqBT
         rAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361951; x=1794966751;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FrE2nxcQRZH8WQUmYcabDKCJom3Cf8QMuXcnvRuyIOE=;
        b=1RlKxFaUByxFqicokauX4pKyPcgNLoojgxxPa+bg9GEac6kXdfdjHaKI5KRAE4mYdx
         qbeTE6RjxfPzon9oYffb5WBnya41ysx9ntqGFCrH8S7Zs945PJp6Ng7NL4NxlIDDduCZ
         Ks5aTc+9QslGlsFmlWpEM+RY26fQn9vxlZYN6LQE5mPNvLy5RtXGuPJu14TjZ8M22JQw
         7HwCxl3dlyy7nxFTTHC8c5HePdGUKuFNLAIfn81TsqVWbbUaM3/xyge8pIkO8Ng777Pp
         q1CPp45WT741SWk9rzGE/pbGtwasJ/bgLfDyh4Tk6snXAsny8u9DyCWI1td86JQw9ZSR
         IBUg==
X-Forwarded-Encrypted: i=1; AL+hErH45K9dDI4KyXB/T3UT3D0kYzc1sQnHq4rtXoY//rKAVUQwJ/hoI2fCOBA9N53agtZB4sqgd1Yr4/rFz8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AxyygbdVzf0PQo79hPJC3WoSiutk/iNuHiFlMPc1Qhwvxx2Es
	tx7Fia7vHoBV7pFJlfEG89B9PmiIZZ0sr/Vdg12O9SkywLuXextbw7+0gKZhTuHfioie8g==
X-Gm-Gg: AYBFou2Yai1pfWwIOcDcvmXt7FgJ3c28v6fNWFH2ostdxFecy6e2v74cXdipvEBysIc
	Wqa86owX8S3aQDZcgW0sFpUuZqKfIJfjqCahGn9A5S3wvG9atwmAvWo9pkTBlCLBBLT7frSn2y/
	G9sfufoCwKP0zDtLNNYO3MK4vbDeB7NLuI80qiah3v2fc7U/a5NKE/zdQegW6lmis+wAjPSFzHC
	G5w5Fwved2kJolX4UIrRZCRyif86sHJVN2UELurZj6vSuhnhtYZFndh8dkRiQnDHGHFnofwqq+F
	DrJPmR+ewA8oGy43IuQ3L2BXsnh5HHiF9K4In27ohgBNWna9p6w0OdoX1znOacpRHyD3r3ay+v/
	wW+w+iXh1lVgyGcI09+tkq5hpAkhF8YOLZpkAptqEP4P6HUl3vMhCeSF51NdUAfZZMfEKQ52gPG
	+hc08FmIEdtRWdV4RTkttrO1dODbaKbTeoDlBtu3CsgE0BnNL4RwMiMghq6U9K2MsIU+rQ6V/z/
	Exglw23t6yaKx75wcUj9oqkyoXt0Bde58NcS4YxHlXbT8iWr9mte4r0IveyR720JtfH9CfBD0nq
	lxVhaLe3sQoWu5yq2CuCS09F
X-Received: by 2002:a05:6808:124d:b0:568:8130:9c79 with SMTP id 5614622812f47-56b972f7271mr773993b6e.27.1794361951415;
        Tue, 10 Nov 2026 17:52:31 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm4008565b6e.11.2026.11.10.17.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:52:30 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 19:52:25 -0600
Subject: [PATCH] power: supply: core: give each supply's epc_sem its own
 lockdep class
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-power-supply-epc-lockdep-key-v1-1-39bd0a237a6c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqDMAwA0KuEfBtoOxTsVcSPEuMWFBtaNifi3
 QXfAd6JVYpKxQgnFvlp1bxhBN8A8idtbyGdMAIGFzrv3Yss71Kofs3Wg8SY1szLJEaLHBTS7Nr
 k+5aZsQG0IrP+n34Yr+sGMGr6W24AAAA=
X-Change-ID: 20261103-power-supply-epc-lockdep-key-2af05a195ccc
To: Sebastian Reichel <sre@kernel.org>, Hang Nan <2122295973@qq.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794361948; l=3715;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=YmCqJjTCZNRzJZ4cgvXeQI2hyXoDjvK2f+9IDcUZq3M=;
 b=DjaOTZWy+pWszEcbPAaGnJQzUHxc4B6gb1op23Bv2YL8XC4xqUX77TV3BcInTxD3mAGSm2xmg
 1EvIRISuGlbDRRCupgVn89LIc7MeYJ8Pdcgk0/KmqdI0aHyER/QaAk8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Since commit 9f7f7a859451 ("power_supply: serialize property access with
unregister"), power_supply_get_property() takes the target supply's
epc_sem for read. Every supply's epc_sem is initialised at the same site,
so they all share one lockdep class.

A driver that reads another supply while holding a lock that its
get_property() callback also takes is then reported as a circular
dependency, even though the two semaphores belong to different supplies.
sc27xx_fgu_get_property() does this with data->lock and the charger, and
a fuel gauge driver in preparation did the same with its charger:

  WARNING: possible circular locking dependency detected
  kworker/2:1/60 is trying to acquire lock:
   (mutex_#2){+.+.}-{4:4}, at: mt6397_battery_get_property+0x50/0x23c
  but task is already holding lock:
   (&psy->epc_sem){.+.+}-{4:4}, at: power_supply_get_property+0x34/0x80

Lockdep then turns itself off for the rest of the boot.

Register a lockdep key for each supply, so that only a supply's own epc_sem
is ordered against its own locks.

Fixes: 9f7f7a859451 ("power_supply: serialize property access with unregister")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 power_supply_get_property() takes the target supply's
epc_sem, and every supply's epc_sem shares one lockdep class. A driver
that reads another supply under a lock its own get_property() takes is
then reported as a circular dependency, and lockdep switches itself off.

Tested on an MT8173 tablet (Amazon Fire HD 10, 2017) with PROVE_LOCKING:
the report came at boot with a fuel gauge that reads its charger under
its own mutex, and doesn't come with this patch (debug_locks stays 1).
---
 drivers/power/supply/power_supply_core.c | 3 +++
 include/linux/power_supply.h             | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index de15314ef954..76bbe8772143 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -1662,6 +1662,7 @@ static void power_supply_dev_release(struct device *dev)
 	struct power_supply *psy = to_power_supply(dev);
 
 	dev_dbg(dev, "%s\n", __func__);
+	lockdep_unregister_key(&psy->epc_key);
 	kfree(psy);
 }
 
@@ -1765,6 +1766,7 @@ __power_supply_register(struct device *parent,
 	if (!psy)
 		return ERR_PTR(-ENOMEM);
 
+	lockdep_register_key(&psy->epc_key);
 	dev = &psy->dev;
 
 	device_initialize(dev);
@@ -1810,6 +1812,7 @@ __power_supply_register(struct device *parent,
 
 	spin_lock_init(&psy->changed_lock);
 	init_rwsem(&psy->epc_sem);
+	lockdep_set_class(&psy->epc_sem, &psy->epc_key);
 	init_rwsem(&psy->extensions_sem);
 	INIT_LIST_HEAD(&psy->extensions);
 
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index cce61137aef4..3cfe2520862e 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -371,8 +371,11 @@ struct power_supply {
 	 * the callback is still using it.
 	 * Must not be shared with extensions_sem: callbacks may read their own
 	 * properties, which takes that one for read.
+	 * Each supply has its own lockdep class: a driver may read another
+	 * supply's properties while holding a lock its own callbacks take.
 	 */
 	struct rw_semaphore epc_sem;
+	struct lock_class_key epc_key;
 	struct rw_semaphore extensions_sem; /* protects "extensions" */
 	struct list_head extensions;
 #ifdef CONFIG_THERMAL

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-power-supply-epc-lockdep-key-2af05a195ccc

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

