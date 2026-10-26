Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994544;
	b=npgD6zRaH5Ymn58ovByIZjaLN90jYVoH5lYzk12fJK9HFDYimkqd3kljsX62u88sI501
	 0FZxBRVuPatL05+mf0Xe+wFTrnx14XRXiV3dgqJPACWqt/8TG4MiF4vGSE+V/CX7RtgJ9
	 nKrZas2C2mK5Ix2SMz+OwGhVWgkatsxMAH3kdXHHnuD58owMEFcsTZqs56TRUo1peq0oN
	 k9ldcTrxmN8qEwKp4rk2IhOLg52wuArhEgxfpnIfy179A6vmwC8tTmgDjmPBP2la0bpMN
	 2xkWliORoAfvZ3R8BPUBv0hsGJtDVA+wwT4yWcjxIJxssfKOXbihkp83oyjcXeINMUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K5t5lwdyPHqIe+zGWPszmhrUHYwt42j52CshxS8SC8s=;
	b=mZZmtJOnfyxnfqkYanhPx5y5q4dBjOOJGn/zKyZwUkgDq5q5SPaCRFao77NiiUjW01UL
	 GgoLoxtzqVkAatsltSaThpYzZVvmg4xtAj2KdlXnLgE9G/B1J3Gk61pE172gzDrB8VgtT
	 X2uBC+aUeE3nOeACeLNCvWCXLOaAoISEaH3lhZzSu2HQUAOMDbZF7qdHqa50MIXN4nQMi
	 toExxY0eWbmZKYZA3YDYVgSkjmGVDss47OMu/XuOH6nL7cbWs/HxfYxqVTrIphTv7xF0X
	 6JqJEaFR3X3eN2+k0VJ6XhlgjH9nYd7f7c6P/XXB7WI09NcHbQtRcqjvvCofJB4v5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RZfpTO28;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C56606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C56606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RZfpTO28
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e942864693so13554095ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994543; x=1793599343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5t5lwdyPHqIe+zGWPszmhrUHYwt42j52CshxS8SC8s=;
        b=RZfpTO28d8xWb/KIi5uR3p24SsrWLmGAhYKTvilY1NXeGjWbNSbGJByXxg3NAKtZbV
         L4MH7EqJVua1SWRpd5Q5RLa+T/PaOUifJs6ZfTz/7KizOLKXMtZPTdkNZaM6CdNraTqe
         ikhCSwcr+8LNkautPAWVWtFkloi7FX3a1+NOZDEJOk1MmAhNIuOADcsI6pz6wDLdwlOR
         Pqvho1KzmFRNdt5AG/6/VE2SstT82FMOf+PFyVCKW3zvZn7abufORuT5zXPDi9D1pGQ8
         Z5ftV1T+OzMZ/jvm6+3sJGv4guvIZYc5U9EqG6DId7gtjCHcOf8VuWcesKukvmZ4YhQv
         iTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994543; x=1793599343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5t5lwdyPHqIe+zGWPszmhrUHYwt42j52CshxS8SC8s=;
        b=nJ450Yn5iX2v+g/eWpgiY10nRnMQ0n/KdiMVZS/LnFpkeOsnZmecfskiPhHp9k5Sn9
         KNuS3h8Mak/8e4C6i1XqG1zw4eFMRbPT6wqKtLICMMfAPTshms6AB21rqxYVA3e0SpFH
         0/LJvlKOGtf4Hg3rtoQ1Fq7wFOeoEIKtU3bNc/4QpIMKGv+cFPSsI+mTvpPstjCY9Q+w
         ObjiSsM3FA4w3QuaZiMFvpH5oL1wciGeUEAQx3/RohDIubgQSlD5JyicwJfRKQD8tpU6
         bZsox65iYURcKE2Z4HHRGa3X/9lTajCLBCDVezOKyryw1cbOkEvriE/dft3CQERVsCER
         V6Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwITR6Wh7e8MQR1NRagbW9i61Yo/YrigTBj4C1k02lto+kk5sYsbKbKjdEoECwOBUvMaoPQou2NmWdevKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTn2HOmi6Al3fBa8HtWCP3QOffTQ2bHgbQbhmNjkL1vMG93Q6K
	csmY1o0cLAuHjGj5NvFHsaDODZ22XAxoxmHHVyIyfqxhO4DLFJYUk63c
X-Gm-Gg: AYBFou0mB7cZVxQojK3R9kKVjVRTQjILqf3mhxD3YfW6cujHr7sKWNHmlhYbDaLSnxZ
	v7WvxlETJdb0ay7hhldXyEYlwvxaxUqlW3Umf0utPNLhZY0/2PGwqsQ/qbOOhmJvGyiKd2+SVy6
	n9l84NUiDhw1pi/X/VgQCVGzD0cGnhEzuv8NTC5RZdcj2EsgaI1TyoKoWSIOdza+n0Af+ncKJQ0
	YWqrUm21xwhtnqYPFNraucX2yQhH3+uZQAIAbhu8Wx/DXz6bHzGpblNrGegCsZ45j5GhRqyMzXd
	o1SDrq97fNuw8dgJC+fKL6/zfJ9/ZuUceUIp4gVgusKiGF/qYBLZ4MqkvHalTRwCBlWy9xQlmbE
	KTvwht9Zchzq9prUHiV9DBfpr3wv4Rss6lB704LVo5ncBQyVNYtPkvOMO3yucowbsBeb1Gn63Qv
	wddtxySELsF6Dgnx2JHdXQkoz9MzbNU+wk4kPS1HT72+Yd6eafOJvA6u8TPE87Oe5BvB/dY4oog
	S9nv0M7EvUSbw556pK/Nud0tSqMB9wCuoHYuy+AndRJPV604Q7rTpg6oHX3cpFtOtTFZiB69fEI
	jCY0PbRIOBmDbLup12xFsUeO8PcfaMXBa2iWUpqail0Vxc3maN1+j29Pcyte3L6TOGPIAB3hJ7w
	6LKU7+hyep7qp9EkuSZULYz/AKYIM
X-Received: by 2002:a17:902:da8e:b0:2ea:19a1:cd3e with SMTP id d9443c01a7336-2ea9c83381dmr51356895ad.33.1792994542732;
        Sun, 25 Oct 2026 23:02:22 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af31421sm12212435ad.7.2026.10.25.23.02.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 23:02:22 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] gpio: sim: snapshot configfs leaf items before depending on them
Date: Mon, 26 Oct 2026 16:00:49 +1000
Message-ID: <20261026060049.60599-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

gpio_sim_device_lockup_configfs() walks dev->bank_list and each
bank->line_list to depend (or undepend) the leaf configfs items when a
simulated device is activated or deactivated.  The walk runs without
holding dev->lock:

	list_for_each_entry(bank, &dev->bank_list, siblings) {
		list_for_each_entry(line, &bank->line_list, siblings) {
			...
			configfs_depend_item_unlocked(subsys, item);

Every other traversal of these lists holds dev->lock, and the lists are
mutated under it: gpio_sim_line_config_group_release() and
gpio_sim_bank_config_group_release() both do list_del() under dev->lock
and then free the line/bank.  A line or bank can be removed by rmdir(2)
while it is not yet (or no longer) depended on, i.e. in the window around
activation before configfs_depend_item_unlocked() has pinned it, and in
the window around deactivation after configfs_undepend_item_unlocked()
has released it.  The lockless walk can then dereference a line or bank
that a concurrent release is freeing, or follow a ->siblings pointer into
a freed node, resulting in a use-after-free / list corruption.

The walk cannot simply be moved under dev->lock, because
configfs_[un]depend_item_unlocked() take configfs-internal locks and
holding dev->lock across them would invert the lock order against the
configfs rmdir path, which calls the release callbacks (taking dev->lock)
with those configfs locks held.

Take a pinned snapshot of the leaf items under dev->lock instead.  The
list pointers are now only followed with the lock held; each item is
pinned with config_item_get_unless_zero() so it cannot be freed once the
lock is dropped, and items already being torn down (get returns NULL) are
skipped, since they must not be depended on anyway.  The snapshot is then
depended/undepended with the lock dropped - preserving the required lock
order - and each item is put afterwards.

Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/gpio/gpio-sim.c | 56 +++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec..562f305 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -978,27 +978,61 @@ static void
 gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
 {
 	struct configfs_subsystem *subsys = dev->group.cg_subsys;
+	struct config_item **items = NULL, *item;
 	struct gpio_sim_bank *bank;
 	struct gpio_sim_line *line;
-	struct config_item *item;
+	size_t i, n;
 
 	/*
 	 * The device only needs to depend on leaf entries. This is
 	 * sufficient to lock up all the configfs entries that the
 	 * instantiated, alive device depends on.
+	 *
+	 * The bank and line lists are only stable under dev->lock, but
+	 * configfs_[un]depend_item_unlocked() must not be called under it:
+	 * they take configfs-internal locks and that would invert the lock
+	 * order against the configfs rmdir path, which removes lines and
+	 * banks from these lists and frees them under dev->lock. So take a
+	 * pinned snapshot of the leaf items under the lock - skipping any
+	 * that are already being torn down - and then depend/undepend the
+	 * snapshot with the lock dropped.
 	 */
-	list_for_each_entry(bank, &dev->bank_list, siblings) {
-		list_for_each_entry(line, &bank->line_list, siblings) {
-			item = line->hog ? &line->hog->item
-					 : &line->group.cg_item;
-
-			if (lock)
-				WARN_ON(configfs_depend_item_unlocked(subsys,
-								      item));
-			else
-				configfs_undepend_item_unlocked(item);
+	scoped_guard(mutex, &dev->lock) {
+		n = 0;
+		list_for_each_entry(bank, &dev->bank_list, siblings)
+			list_for_each_entry(line, &bank->line_list, siblings)
+				n++;
+
+		if (!n)
+			return;
+
+		items = kcalloc(n, sizeof(*items), GFP_KERNEL);
+		if (!items)
+			return;
+
+		i = 0;
+		list_for_each_entry(bank, &dev->bank_list, siblings) {
+			list_for_each_entry(line, &bank->line_list, siblings) {
+				item = line->hog ? &line->hog->item
+						 : &line->group.cg_item;
+				item = config_item_get_unless_zero(item);
+				if (item)
+					items[i++] = item;
+			}
 		}
+		n = i;
 	}
+
+	for (i = 0; i < n; i++) {
+		if (lock)
+			WARN_ON(configfs_depend_item_unlocked(subsys,
+							      items[i]));
+		else
+			configfs_undepend_item_unlocked(items[i]);
+		config_item_put(items[i]);
+	}
+
+	kfree(items);
 }
 
 static ssize_t
-- 
2.43.0

