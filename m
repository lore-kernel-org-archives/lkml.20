Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825719;
	b=BWHlSwAb81cRsDjVsLyLawA8T85Njly98tXMroZIBks1lUirbNYIEHYbbwQZHIbnr81F
	 YRBwCFhIBPLbPqnF6DrXZt5Xmb2RjyKe4Nlb3EcN+/KXGM3sPYy1LeZpI/LRs1vp8jQje
	 YeEfrEF8b+w3Mn9EOzkup6pH46kHnJR9uAoUT7hrzbjB7ko2iLUf8eitIQv7eNzdEj41V
	 z1QejOhJHIJShETSNCuB3+5Te9ibqige1/m2TTuLZCwgYAdzbUWSD0aBhcC5G6sYjbAoa
	 NIHCodGDAbtH783zepLCjKl7WM2FXiGzQGyI2mT3z4Cy/ghwV+b44InC1JDF5rXQsKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NIq308VQGUr/7Gxe2x540xjoV4Zdx2xWDIRiVtWnXPw=;
	b=G+huw3xEyVZfFvDdrqESttzAZtKwGV6ZQOv1CAcEWVMaIKtyLz09E4W746F8BmvUTIDS
	 yvaT7bmpOR9xz0vZwCZ6TSuIDhJv8PwIcAEhpxmEtI6QH6FSJko8yJWVnhdmmJPXny/Mk
	 Qf13qiu+NdEBlUd58VHeUy9ccMJYP5VHbnqKj89yvUsn6BDufC14jV/oqixcT5WbJwyjB
	 17N4lIYeE6Ne1ug9JSPiPIP5e+bwpigeOglNKRJgXSz0LP9EAKRA1W5oPocXSr4BQuWAQ
	 GMkenviZXV20b1VRmNAVnFh9PaJMtVmiLapReApBbg/rKkDbCK6BPl0qG1joKHwisZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=hN0USg6S;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F54606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F54606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=hN0USg6S
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so26889785e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794825717; x=1795430517; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NIq308VQGUr/7Gxe2x540xjoV4Zdx2xWDIRiVtWnXPw=;
        b=hN0USg6Sa3Y5g+9XzVi3ZgaYLhuQyWBIqQghnDZ16ETnPpDYiqoEjrDUQCj4oQWsxr
         lVqeCsqDVZRrjJMi9wz6S6kAjxlauH55t2ejuOcaVAn9z7t5cnVjbE/RuUEpuYcTtuVn
         mNMJKBRBxydA1RKVyy9GYzLYCJvwTNdRQldZGcXK7rh4X8Ie5dGFZV3ysJQtHzIkH10N
         Fw6UmzNcztsb12cwcRrH5+hf2ew1ruCQ35k4i55TcckQhqHqNlVneLAOdvVtK68L5uYE
         L//ZEvxsaFEOpfOYFpZdnkyeNTpkDtdUAMQnRk8ypBvLHSrdaqchRd7O/nzpRWl8KOVP
         HPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825717; x=1795430517;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NIq308VQGUr/7Gxe2x540xjoV4Zdx2xWDIRiVtWnXPw=;
        b=quFz5RhympdeJgH4KATKKfo5O7z+ZypLml3tGaklzFWUKqDCMtKMUWdVbWleWTrmQ0
         oBV2IGfOHD2XBlKwXIB1vF2ePQjYL8iIXnohJ5yTfJpMYNwBeEGmYMQknTDheNFLUHwY
         ucwE34HdIJT0XwSJ8ayvznQK5LmiVHC8PGhUQJv7nzes0kZTa9ivj10bpbnLz+jSyft5
         yQ0pf4QVLDtyqLZt9Ork30DSQZGtvXzu3/hdEwV1hiHeCSZJobH38uoLMu/ifPgqYtvs
         2md2hj89C3bu4ToujiqzjmfYZ2Cl9+4H/6bRqxuE/pcQiCN7SjewZ+Kc8L+qwoyHQ0kq
         BJKA==
X-Forwarded-Encrypted: i=1; AL+hErFZjEr0h9SAZt4lqIWd1MBa3KD7qeS0I2YOW42I83FFWF1M2b9zqFTFn0Wsfg0ZuaH7w6bL4PRzNT2ljRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k+HcUEi9PUJdG5ODkaAN7mlgpTP5inGarc3iMnU2byHzjFjab
	5MuACxdhIr32n7omBz9s8RSG0KtgJ89r6VNiwpncV2cLkKrPE2fhULa2Mf9PulSHlWE=
X-Gm-Gg: AYBFou1zN2RNlhBCKhsc3hxMKMhLH16+f1HIRpwI6VCKZcraUhVJBeuZ1Nrh+zxyky6
	WjM9G7d50kqifGDmmiceC2w5dtRWJJ4VpLw9sv4p9KNin7iB67J8j6TIfHJCm2RzQ1tRPQoQ74F
	9+/7Yc3bMJjiXjPivVdu7YgMCfXJB8ZU7LBzTlv8BBpe25UnLHCunG0rZoMlGZK0m0LjhHCaVX1
	nBDQeenfVBSBX3mHEaIN3RPRHZAwKd8Mn11PvOUBX8UWVUQZVFaEcI3ZUi6eA52JNqrDk9sace+
	Tcy6Zujk/WPBXHSX2cGmxXRTX/0DuL89IpujTAo65jFZHoUozBC46a4hRzREFsaszfUPZNVZYDK
	YOGLRu5r4s7URjZJeiJpTgL60xqTn4yAIljIfAMxXO86CvrSYQWvaB0PpN2K3UGcnciaTmz0ugS
	WIQX5Vd6VXQrQRyfaZrp36SFXv4caDYYN8M66nIBcAzfE6J+uMR9MX/bbe0kQpDOKouf2pBqobT
	CkDOwAFz7HBnGvx+e5XdlifiPL69gXmBFHNLl0MN0KbqTAhTomFz0qmBllZrZ+XcL5mIrsTkwA/
	qa86W8uTHW4Zy2GDZ81or748tYiCWsTBEVppPN/cyE0ek4MNxea2bOv/zXpzmid6FcHVBRpYCyn
	8dvk30DLMmA==
X-Received: by 2002:a05:600c:1989:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb665ca43amr133221345e9.28.1794825716789;
        Mon, 16 Nov 2026 02:41:56 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb64ec7b58sm218180305e9.5.2026.11.16.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:41:56 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 16 Nov 2026 14:41:51 +0400
Subject: [PATCH] power: supply: bq27xxx: Recheck the status after an
 external power change
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
Message-Id: <20261116-bq28z620-status-recheck-v1-1-e3ef211c7fd9@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxA0auUrA3MRBrUq4iLThptFKpOpiKW3
 r2jLt/i/xlcs6nDoZkh68vc7mNF3DQgQzdeFK2vBgrEMUbG9KTdhymgl65MjlllULkhs+heUmh
 72kKtH1nP9v6dj6e/fUpXlfLdwbKs4H4B1HsAAAA=
X-Change-ID: 20261116-bq28z620-status-recheck-66ce9cb05d23
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5560; i=alchark@flipper.net;
 h=from:subject:message-id; bh=yMAsrt3cEsFJF91tvPe7B50jfdiEKkYHfq19JenF93A=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9uvtZV++zgbDG9NSsmOWCK/eGRctOuvK56e05tav/t
 i+RUlF50jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUG69gZJhy8mGQiQnb07fuESo8Pp/X8FysSrgqb/7boi+iuWK62DNGhiV9yy4
 ve1DMaKFrzb1h2dxDnQYOldcTvj0KYJaxT2nP5QYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The status of the signed-current gauges follows the sign of the current
they measure, and that only flips once the gauge's next measurement picks
up the charger change. A BQ28Z620 behind a BQ25798 charger shows positive
current up to 0.8s after the charger reports charging, and negative current
about 1.1s after its input goes away. The single check 0.5s after the
change often sees the old sign, raises no uevent, and leaves the status to
the next poll, by default 360s later, so userspace that only watches the
battery (upower, for one) keeps showing the old status for minutes.

A property read in that window loses the check outright: its refresh
pushes the pending work out to poll_interval. upowerd reads the battery
right after the charger's uevent, so on unplug the check never ran at all.

Keep the first check 0.5s after the change, but repeat it up to five
times, 0.5s apart, until the status changes. Count a refresh from a
property read as one of those checks instead of letting it postpone the
rest.

Stop at the first status change rather than running every check. Each
uevent makes userspace reread all battery properties, and the window right
after a replug is when a USB PD port controller on the same bus needs it
most. A status that only lasts a moment then holds until the next refresh,
the price of keeping the bus quiet.

Leave the gauges without a signed current (BQ27XXX_O_ZERO) with the single
check. Their status follows a flag rather than the current, so it never
counts as changed here and they would always use up all five checks.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq27xxx_battery.c | 39 +++++++++++++++++++++++++++++-----
 include/linux/power/bq27xxx_battery.h  |  1 +
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/bq27xxx_battery.c b/drivers/power/supply/bq27xxx_battery.c
index a955feb6cdfb..e4ea92e78a61 100644
--- a/drivers/power/supply/bq27xxx_battery.c
+++ b/drivers/power/supply/bq27xxx_battery.c
@@ -1124,6 +1124,10 @@ module_param_cb(poll_interval, &param_ops_poll_interval, &poll_interval, 0644);
 MODULE_PARM_DESC(poll_interval,
 		 "battery poll interval in seconds - 0 disables polling");
 
+/* Status checks after an external power change, and the delay between them */
+#define BQ27XXX_STATUS_CHECKS		5
+#define BQ27XXX_STATUS_CHECK_DELAY	(HZ / 2)
+
 /*
  * Common code for BQ27xxx devices
  */
@@ -1898,6 +1902,7 @@ static void bq27xxx_battery_update_unlocked(struct bq27xxx_device_info *di)
 	union power_supply_propval status = di->last_status;
 	struct bq27xxx_reg_cache cache = {0, };
 	bool has_singe_flag = di->opts & BQ27XXX_O_ZERO;
+	bool status_changed;
 
 	cache.flags = bq27xxx_read(di, BQ27XXX_REG_FLAGS, has_singe_flag);
 	if (di->chip == BQ27000 && (cache.flags & 0xff) == 0xff)
@@ -1913,9 +1918,10 @@ static void bq27xxx_battery_update_unlocked(struct bq27xxx_device_info *di)
 			bq27xxx_battery_current_and_status(di, NULL, &status, &cache);
 	}
 
+	status_changed = di->last_status.intval != status.intval;
+
 	if ((di->cache.capacity != cache.capacity) ||
-	    (di->cache.flags != cache.flags) ||
-	    (di->last_status.intval != status.intval)) {
+	    (di->cache.flags != cache.flags) || status_changed) {
 		di->last_status.intval = status.intval;
 		power_supply_changed(di->bat);
 	}
@@ -1925,7 +1931,22 @@ static void bq27xxx_battery_update_unlocked(struct bq27xxx_device_info *di)
 
 	di->last_update = jiffies;
 
-	if (!di->removed && poll_interval > 0)
+	if (di->removed)
+		return;
+
+	/*
+	 * Once the status reflects an external power change, stop checking for
+	 * it; otherwise use up the remaining checks before going back to polling.
+	 */
+	if (status_changed)
+		di->status_checks = 0;
+	else if (di->status_checks)
+		di->status_checks--;
+
+	if (di->status_checks)
+		mod_delayed_work(system_percpu_wq, &di->work,
+				 BQ27XXX_STATUS_CHECK_DELAY);
+	else if (poll_interval > 0)
 		mod_delayed_work(system_percpu_wq, &di->work, poll_interval * HZ);
 }
 
@@ -2201,8 +2222,16 @@ static void bq27xxx_external_power_changed(struct power_supply *psy)
 {
 	struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);
 
-	/* After charger plug in/out wait 0.5s for things to stabilize */
-	mod_delayed_work(system_percpu_wq, &di->work, HZ / 2);
+	/*
+	 * After charger plug in/out the current takes a varying time to settle,
+	 * so check the status a few times rather than once on gauges that derive
+	 * it from the sign of the current.
+	 */
+	mutex_lock(&di->lock);
+	if (!(di->opts & BQ27XXX_O_ZERO))
+		di->status_checks = BQ27XXX_STATUS_CHECKS;
+	mod_delayed_work(system_percpu_wq, &di->work, BQ27XXX_STATUS_CHECK_DELAY);
+	mutex_unlock(&di->lock);
 }
 
 int bq27xxx_battery_setup(struct bq27xxx_device_info *di)
diff --git a/include/linux/power/bq27xxx_battery.h b/include/linux/power/bq27xxx_battery.h
index 731ea837aac3..dad3119454c6 100644
--- a/include/linux/power/bq27xxx_battery.h
+++ b/include/linux/power/bq27xxx_battery.h
@@ -68,6 +68,7 @@ struct bq27xxx_device_info {
 	bool removed;
 	unsigned long last_update;
 	union power_supply_propval last_status;
+	unsigned int status_checks;
 	struct delayed_work work;
 	struct power_supply *bat;
 	struct list_head list;

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-bq28z620-status-recheck-66ce9cb05d23

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

