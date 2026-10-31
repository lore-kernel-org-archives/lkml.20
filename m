Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437204;
	b=o+tFPi509dMFn5H149FSerjaCRxVdrxZI2ibII7AYPElluVJdrp72JRGZrIzPrn5GpYV
	 HczD5DO5oOHNiSQbtTKWRAEiy4z8BmU2+S7E8iYZsaX0EOqXwH5xd2RPARH5KlHrU/l6G
	 mGCNl22pDsLbXifE1RJJB7jiieIjXbMJvbNhIqF5vQIX8gRvRZ7aMkq4b8URF4nC2vGXN
	 cNhGS0VZvHJhiEvvA3vC/7NACsXZNi5moVJDSiJyHnbST3FSUxHuPtrKfNMv6oE/Cb5L5
	 Jt5kGb3FCw+6ODMfumFLi6/wlEvw7xgUuuQyjz2r8n0ve88klxZarKcYsItPJEfA3sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
	b=qcga/ltfmq0Mx44ZnT/BqF45iwnsrmmTwJbsvT5exKx8LyKvxAAHtCTHfX3dEubSMkLG
	 JQ13cjMjfQK7Hs8UnJxf8CK0S6yWcl3UWEaaiLu+CSh5elucuZVViK3n+26UATqYyKnys
	 K4QkJT9oJGGAc/Xa3fu3N3QdffBEqG56RR5pBRJwKky13XXl0f9/2gfHTNHi2GR1Wan2p
	 0sJcxWhwLGXgWYzKuCjllgKw0v6msJPSRxntMPMFFkapAp9l3fT46OhoXxJS7+X3+2xES
	 Y0P4fhjdCMqqmlc5FjZiKS6IQ79WvQg6OTdsjadV9qv3mfc1HJbmiGS4B3fwvDdsL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLC4nbCN;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570C2606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 570C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLC4nbCN
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea759cc9b6so7084945ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437203; x=1794042003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=wLC4nbCNzS5Lc4pkvG+1R0lZT4CKRKMLrcJ3C7eYNgveSM4ha4ySCLJTKQctRIzj3q
         pp+KACA3l8OqyNhgTlNA24UEH0JkmomtWkd4Zl4Ixyf3DCuwSbqXpFh7REB+uNN94CD8
         46KwRIDy2yqHlHmQDz5dMvJsa3ZEQTg9YVyEZAMtZuq7b3HYXNBPkKJapl2yfAPeJzSk
         PCEtVj72AvkpDVsxtj2QQlHPD7e81GEHcBQZuHZcPZeVNplsA3nOOvBxYA5SrJ3vReKK
         +HkxaLToOyKReO41QPDuKw/FZtH7JVz9Hf0n4+ioOZvwNyiLer2CE5A0Ogt0bwJiG60S
         RCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437203; x=1794042003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=LA7IopcR5FXrnxz0If3l1G2Eklv+J+MwAUxdtvoS6W7MDNx0p6EGzL+c8WBcLRQYes
         QoL8slwzObgYsblsBYiOS39R0/s9yfz9kXHm9poTlY6WYluJBDg0phLxH0Apyn6lx4AV
         zmfOU0CjQCnHiXBgatrCT/IR9rdBVEXhxu5FzaUCEB7JT2SodyJgsEyNqatFhlqqwDLu
         DxMjkumYElIyZb7ATLIC1brjuLXALLLL9VCH88CAVamqzIQ0sLrRrf6Yl8pTIDMCpBgP
         /hm1Uqkbsbrm/CRa0vwrNQe5xaNdu6rYO0B2fybCgtj9/qzZlN8yPkvNOC7LC+LywhOo
         oGNg==
X-Forwarded-Encrypted: i=1; AKwUvBy8Gw4UM4sU2/KBAgmKqQVzkBxNsld1MZZWeWajDMDPuDhT1vtA6MpOuhyTKSJ2vSd+OXD2O+QZqQ9mS7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpK9NB26FWBAs5gG3nbgxwU8k9H1n+0Ds9b2lim1+8mY5/0s6A
	DARN2QvbX3YuhDFgkXMcn5HFUOAKLXoGumDkNbc5FcQgnJ3JdDuJiqj3
X-Gm-Gg: AYBFou1K1tGmesbzuviYccUcnCLAfW5xoK8Whdj37h+lQwxqrjljMM3ptfuv/YOrU/B
	AnQ7yvK0EJ0kI2f9oNWGbOsa5+Q5V8pQ5bcgMldV/K5Yf1GHVA0AzTmAN4OnsOjbkLwbtyi515s
	FGsG3XhIkfteia3bzQs4ar/8HjYOMNJIcVa13nVLGr80LuDpyX25PE/PzMF6ylZjlHf6PWT46UN
	4koqP/LOxGKihqcXgBa67dN+pi+AUH+gn87B4BbOV6ZKBhj3PxQgJ3b3n42X1tx4fOcJksFhyFB
	13AbZn8XIOznNWtasrTNKIMg4PVoK7tkPjsKWSqLkHQBzz2AHri1iyEwaKbvUXD8hIA/VfgOpt4
	p+Dd50RzbPiA/B42nIG4Z+U0lNTPBjWqJ9QFtTbX4acGya2IAgijsZz+XWzTbUyA6sTdXuiUSod
	a3zyJS6wth9hQ+i4w8APXxySoUqcci/avKWBCZNlrASdyDY5FQ7zSh2f8J18+uyRsjdRiVuwWsV
	zx8Vu3yzSMjHGtJ6N0RRaezJjIma4ObZ8hM2dC0UFUow/wlOLYLGlBWbh/G3BUqBXx1aWk/8Hvv
	lD4YXR5jonGfAdFu8nlFpt0765zX3W9bFRU8txoe29MNLFlnJ4gn/oaUP2h0bsUn2xjUWeSKEJl
	5ZWF1AgbtyITQmrHX0DhX1nWRjm03MwU6g1O//A4tNqNMTbNAZc5ucymechG1hfKXh8m+0q5gPx
	QyzaQ0z6NBvci25NVDAifXvmfD
X-Received: by 2002:a17:902:d548:b0:2e2:d9fe:51fb with SMTP id d9443c01a7336-2eb363ffa94mr46855425ad.4.1793437202530;
        Sat, 31 Oct 2026 02:00:02 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486bbsm13932775ad.30.2026.10.31.01.59.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 02:00:01 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: sim: fix the configfs lockup racing with mkdir/rmdir
Date: Sat, 31 Oct 2026 18:58:21 +1000
Message-ID: <20261031085821.23385-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027085653.90471-1-yuz08559@gmail.com>
References: <20261027085653.90471-1-yuz08559@gmail.com>
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

gpio_sim_device_lockup_configfs() depends (on activation) and undepends
(on deactivation) the leaf configfs entries of a device. It walks
dev->bank_list and bank->line_list without dev->lock, while the lists
are modified and their nodes freed under dev->lock by the configfs
make/release callbacks. It also walks the lists twice, once to depend
and once to undepend, and the two walks can see different entries:

 - A hog created while the device is live is never depended on, but
   it is undepended on deactivation, hitting
   BUG_ON(sd->s_dependent_count < 1) in configfs_undepend_item().
   The following is enough to trigger it:

	mkdir $G/dev $G/dev/bank0 $G/dev/bank0/line0
	echo 1 > $G/dev/live
	mkdir $G/dev/bank0/line0/hog
	echo 0 > $G/dev/live

 - An entry that is being created or removed when the device goes live
   cannot be depended on (the WARN_ON() fires), but it is undepended
   later, hitting the same BUG_ON(). If it has already been unlinked,
   configfs_depend_item_unlocked() dereferences its NULL ci_group.

Toggling "live" while concurrently creating and removing line and hog
directories hits the WARN_ON() and then the BUG_ON() within a second.

Hold the configfs subsystem mutex and dev->lock across the whole live
transition. The subsystem mutex is what configfs holds when it links
and unlinks entries and when it calls the make_group()/make_item()
callbacks, which then take dev->lock, so the lock order is the same.
Record the entries that were actually depended on and undepend exactly
those. If an entry cannot be depended on because it is being created
or removed, undo the dependencies already taken and fail with -EBUSY
instead of warning.

configfs_depend_item_unlocked() and configfs_undepend_item_unlocked()
only take configfs_dirent_lock for an item of the caller's own
subsystem, so calling them under these locks is fine.

Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
v3:
 - Count the lines with list_count_nodes() (Bartosz).
v2: https://lore.kernel.org/all/20261027085653.90471-1-yuz08559@gmail.com/
 - Supersedes v1 "gpio: sim: snapshot configfs leaf items before
   depending on them". The v1 approach of taking references on the
   entries and depending on them after dropping dev->lock still raced
   with mkdir/rmdir, as the sashiko review pointed out, so the fix
   was redone: hold the subsystem mutex and dev->lock across the whole
   live transition, record the entries that were depended on and fail
   with -EBUSY instead of warning.
v1: https://lore.kernel.org/all/20261026060049.60599-1-yuz08559@gmail.com/
---
 drivers/gpio/gpio-sim.c | 108 +++++++++++++++++++++++++++++++---------
 1 file changed, 84 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec..abc73bb 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -560,6 +560,10 @@ struct gpio_sim_device {
 	struct mutex lock;
 
 	struct list_head bank_list;
+
+	/* Leaf entries depended on while the device is live. */
+	struct config_item **deps;
+	unsigned int num_deps;
 };
 
 static struct gpio_sim_device *to_gpio_sim_device(struct config_item *item)
@@ -974,31 +978,80 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 	gpio_sim_remove_swnode_recursive(swnode);
 }
 
-static void
-gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
+static void gpio_sim_device_unlock_configfs(struct gpio_sim_device *dev)
+{
+	unsigned int i;
+
+	lockdep_assert_held(&dev->lock);
+
+	for (i = 0; i < dev->num_deps; i++)
+		configfs_undepend_item_unlocked(dev->deps[i]);
+
+	kfree(dev->deps);
+	dev->deps = NULL;
+	dev->num_deps = 0;
+}
+
+static int gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev)
 {
 	struct configfs_subsystem *subsys = dev->group.cg_subsys;
 	struct gpio_sim_bank *bank;
 	struct gpio_sim_line *line;
 	struct config_item *item;
+	unsigned int num = 0;
+	int ret;
+
+	lockdep_assert_held(&subsys->su_mutex);
+	lockdep_assert_held(&dev->lock);
 
 	/*
 	 * The device only needs to depend on leaf entries. This is
 	 * sufficient to lock up all the configfs entries that the
 	 * instantiated, alive device depends on.
+	 *
+	 * dev->lock keeps the bank and line lists stable and the subsystem
+	 * mutex keeps the entries' ci_group stable. An entry that is still
+	 * being created or removed cannot be depended on, in which case the
+	 * device is not brought up. The entries that were actually depended
+	 * on are recorded, so that exactly those are undepended when the
+	 * device goes down.
 	 */
+	list_for_each_entry(bank, &dev->bank_list, siblings)
+		num += list_count_nodes(&bank->line_list);
+
+	if (!num)
+		return 0;
+
+	dev->deps = kzalloc_objs(*dev->deps, num);
+	if (!dev->deps)
+		return -ENOMEM;
+
 	list_for_each_entry(bank, &dev->bank_list, siblings) {
 		list_for_each_entry(line, &bank->line_list, siblings) {
 			item = line->hog ? &line->hog->item
 					 : &line->group.cg_item;
 
-			if (lock)
-				WARN_ON(configfs_depend_item_unlocked(subsys,
-								      item));
-			else
-				configfs_undepend_item_unlocked(item);
+			/* Already unlinked by a concurrent rmdir(). */
+			if (!item->ci_group) {
+				ret = -EBUSY;
+				goto err_unlock;
+			}
+
+			ret = configfs_depend_item_unlocked(subsys, item);
+			if (ret) {
+				ret = -EBUSY;
+				goto err_unlock;
+			}
+
+			dev->deps[dev->num_deps++] = item;
 		}
 	}
+
+	return 0;
+
+err_unlock:
+	gpio_sim_device_unlock_configfs(dev);
+	return ret;
 }
 
 static ssize_t
@@ -1013,26 +1066,32 @@ gpio_sim_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	if (live)
-		gpio_sim_device_lockup_configfs(dev, true);
-
-	scoped_guard(mutex, &dev->lock) {
-		if (live == gpio_sim_device_is_live(dev))
-			ret = -EPERM;
-		else if (live)
-			ret = gpio_sim_device_activate(dev);
-		else
-			gpio_sim_device_deactivate(dev);
-	}
-
 	/*
-	 * Undepend is required only if device disablement (live == 0)
-	 * succeeds or if device enablement (live == 1) fails.
+	 * Lock order: subsystem mutex, then dev->lock. This is the same
+	 * order as in the make_group()/make_item() callbacks.
 	 */
-	if (live == !!ret)
-		gpio_sim_device_lockup_configfs(dev, false);
+	guard(mutex)(&dev->group.cg_subsys->su_mutex);
+	guard(mutex)(&dev->lock);
+
+	if (live == gpio_sim_device_is_live(dev))
+		return -EPERM;
+
+	if (live) {
+		ret = gpio_sim_device_lockup_configfs(dev);
+		if (ret)
+			return ret;
 
-	return ret ?: count;
+		ret = gpio_sim_device_activate(dev);
+		if (ret) {
+			gpio_sim_device_unlock_configfs(dev);
+			return ret;
+		}
+	} else {
+		gpio_sim_device_deactivate(dev);
+		gpio_sim_device_unlock_configfs(dev);
+	}
+
+	return count;
 }
 
 CONFIGFS_ATTR(gpio_sim_device_config_, live);
@@ -1546,6 +1605,7 @@ static void gpio_sim_device_config_group_release(struct config_item *item)
 
 	mutex_destroy(&dev->lock);
 	ida_free(&gpio_sim_ida, dev->id);
+	kfree(dev->deps);
 	kfree(dev);
 }
 
-- 
2.43.0

