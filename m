Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716327;
	b=YH0lSz+bBEijb/NogkwxiswtBZlO6u5Jc5XGy5mUmlB0DE5Vr76No1U6Kv4spQSjk3lz
	 BMP4QG4BJ6oL839UftJ67k4XfEdTYR+2LsxcIo3Kjw0esgnh3bxaG1yw1NvTeLYg+1pux
	 1YMxGiJelpeQ2DeDm+W1YuWzG87chyI3T4cOIxZgI9Sz3rgkIvxjc9WW0u54fqY4LCFoD
	 sc7IFyTQUTE3EZnsvkPBWBotRaeaGUhNK5B3qtZuFlrVE5i/Jb3rLq8otjBFAdOYXQUxy
	 LhsYoo/1062cVOibNKnf593u6ygAmO2oyWWDrAFs7CWjdvgO8Sl2oyxxMHZJkeQKq6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
	b=wG2zllt4ZQfViFsKwi3nWB1bic8f8HkvFUtRc6jGatBEUhqB9UP+JEhH2I/+WgtyXoMK
	 G9H/uYWARwkesP20Zr+8Ia7RUksVfPf3d5tiDMMYHbEKIF2F7c7Myy5SF7CL/70zmfdY9
	 3vsIlU5CDrDEe+WTM9HSKSO9o1c0gY6h/tAtwcT7Yz61JSMnRGOzCPxr1baQsYEDzGUG6
	 Kiq7JFeZySpfwn5q4qDCTInmQ+3MAlWfXo5PS0281JxtdF0V6kcbYzigjWP6I5WTeG4jN
	 7kTpc27irjrVCSCMmRopA/7lBQA9p5o59Ip2UFAYwcsqElSGv3fPilfU7AKtU8pCZ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G374LnRY;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7C606EE92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC7C606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G374LnRY
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea7987517aso27587175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716327; x=1794321127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=G374LnRYRE87zWe4QgbNOVNjB4B2zEt6OVgBzP9vXqSxdyQ38VEGqSfxGQcVB0wJGw
         l24EZaJhZ2GROWzwHLL6SB0xegHbvE1K9wRhFujr3esRAYV4iDzIBRvQCzIy/lROAb46
         /UJClnGHNu80uisZNEloGBg3Ge1eHiMwcwkjKiTEMI9ppaQeXefICEdStGTduIMBYwMm
         ZXEaFc5YHhX7U89ru9Ne5BToKNKSa8Gd3mdPR3wmLRahhDsNdWA/W3O5+oleX5bD9WW3
         hziTSDoydsqIyfE+imtJ7ehVhP4fj0gucKBxMWhfdX6KIUcyxEJcsABHdksLWHJZOVPu
         xanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716327; x=1794321127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=tjrIvzDxyfICVIOfP4Nr5yC/f7EzkuSDb8s9nFv7MzwIcQO6j3RqvgdchGv76RRLkN
         JzGwRE+ms0ww3o3YWOVHPfyEJmR5SYY9i5MO2RWxCyGlOblmTNaGvi1sTusyQR2Lyixo
         e7PkRJfQ78WMPa0L12wXcN0BlKG68iSWv5QRk7mRo8fCkI69qtexLi2SgnQW9P6+CRtq
         8gWeFEhMTGdRaMUXO9+4Ea2KnveCLmAgJuo2LfWw0ZQm7I6HUV5nSjtXGkzEf8oa9Enf
         V2X7VXEepxJmV1k0Xzd26uaT4diBEMi/fDL3c61u02Z1GfdL448LxMkXV12XzfEEVjpQ
         61TA==
X-Forwarded-Encrypted: i=1; AKwUvBxQb34SpZaoNSW+MZjvts13K0Ine9jZOvX38w2AKHtrtUPqTsHnfVznlWtKYJPMJStQzxJAJqp8muEwU7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P6MiuzzDzCrPEoZFZtFGJtAjW3rka2Xk6nWkaPwCZym5osqEU
	KcqCwN2eVPXekSsiLqn6CJlMJ2Y8/+qFcJkJRnWZg9U96O0ueNpGo44Q
X-Gm-Gg: AYBFou1qY5iibpKszmSI9w3DA5hZECUs/6+0fRzCLuMJMyRXNqA8JKVhEM1jsrOehbZ
	0BtSSuFLopBc3bIYNKzGpsi8WW2f34uVXWt3DVw4ehshMdFeK659Y08A4bGDFS6DdQIBpzgQzy+
	xNlt26hG9Wboazce3/+pq2d4gJpGchk/MQNR7ev4cv81H9Dimvh+qoyScXdxtiPxEsfEp9tg/Xf
	gv/alfAm+PXbuVKZ3iGamFLqGcTXipnJ6DOlH7sgbs+cn0DXv0s93jPg8Gs/+XoHLzf+gOZl4wJ
	Nv6rIbGYf5pGBIwRR/WV443FVaNV9mHNYDIDhp60pzRGEUkOMup9Jyl6aHeEp1nmK0qoZ9JdwpI
	oXMcNwF5FYcVa5Mkb5rEoltt1Q4jLydctXUkPUby1l10ZjcBS8bPEg3i8VRM9f4IJkMeytFCMe0
	YZFNAF4c6HHHUW4JpZ3C46tOz3slmkO7ubvBRqXesBpt2gwsFu6IrF+D18GAZNOzTzTqWipBYQS
	bsz0pGZsI3bI4yJ2Tf6z9kfCADtGqsKKJAT2MGi2sq8JveIkNvXENPQgsQaQnv7/GHga0zu8fEH
	R1mwKG1XUB+SrtfSE8O9Z3Z9VmpHmTeQva+h9gXNdRAlM9kVztDCqi5m1ILzk2KE0Gh9peNKHxo
	cTBXxsGEo4lz5Up8h2+rnIpIdgpJ9y0odVgDUPmnrV0xYusuWBm9POlYqd+Mwn/4Za/6/NpQXtt
	ibo98=
X-Received: by 2002:a17:903:320a:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2eb3641516amr136502015ad.8.1793716326715;
        Tue, 03 Nov 2026 06:32:06 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fc14sm42816695ad.26.2026.11.03.06.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 06:32:06 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 RESEND] gpio: sim: fix the configfs lockup racing with mkdir/rmdir
Date: Wed,  4 Nov 2026 00:31:36 +1000
Message-ID: <20261103143136.62155-1-yuz08559@gmail.com>
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

