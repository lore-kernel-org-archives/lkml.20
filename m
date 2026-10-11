Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790D44A3EC;
	Sun, 11 Oct 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791742008; cv=none; b=r6aZlrYkvXIwqygY5O+4Ayv01/N9SEOisN6xPqozL3hpckRlfd8Fsg34mCnAbeM94x3VcJqIjBL7w+53BhNHuiFNL+GBWPnMJFsXHpCw6gBNnd+we74XlIq1knkZ/pNSCYm2Qa/0L2P+g9UuYCavGUsq7wy+v6gRyD6O3dmvk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791742008; c=relaxed/simple;
	bh=emZJbKvYe03g7HJBuE8m7LmYGGgBIwxOsDESI4fubnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=POsJJhjQ3ScqzHZhGqTlc6TEH+8aUQH+v6W/FTjyyNwUqbqbDwhrbJjbCIiIIlmkd5wYxr2UZ56i+gGhF2IrjAOgz1zAO4FeSXWRBBfQJFlWz4UgiabOInjkrmGvC/FKf2BOz8RGbCAu/1+XpeyV+elkazOWqvK1YllKBDGxtC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=URWQdIOn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="URWQdIOn"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8B892807D5;
	Sun, 11 Oct 2026 20:06:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31vg9917Yogb; Sun, 11 Oct 2026 20:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791741996; bh=emZJbKvYe03g7HJBuE8m7LmYGGgBIwxOsDESI4fubnA=;
	h=From:To:Cc:Subject:Date;
	b=URWQdIOn+q45KeFFbnusbXb57ZiCkOY78yTTWyc5lP8ExygfCny7JkMRg6twgxkU2
	 nqB1hHLVXtkZVsA24ZejnHD64SyggoMQBaxj6yMSp/dFrnq01pp2xXPMqVRRQ3wZQk
	 xrCr+AJepD6gsfmaexoUkh4Yxs92c9e62YTmCDLNr639QWLgVADtSZuj7jhGoFpcMR
	 W5jMOM+Ef/7i1i9RHZeJqSHtJIQJ5Wm5uKZxJIKmT4jnVKiwJH0c0zhJfbfYScCyUs
	 ssB3ivxJQxLLh+zrAlts0rvPfs2tGLyxleXraKxAdIH4iESNRKoHPuL4FNlirqzsgi
	 nC2BpasP+l4Sg==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control_led: Fix deadlock between sysfs writes and card disconnect
Date: Sun, 11 Oct 2026 21:06:17 +0300
Message-ID: <20261011180627.1594051-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd_ctl_led_disconnect() removes the ctl-led sysfs files while
holding card->controls_rwsem. device_unregister() waits for running
sysfs callbacks which can deadlock when a concurrent write causes
the attach or detach callback to wait for controls_rwsem.

Break kernfs active protection in the attach, detach and list
callbacks and hold a module reference instead.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
 sound/core/control_led.c | 62 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index ec0e6c7ad..501387287 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -563,12 +563,43 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 	return count;
 }
 
+/*
+ * snd_ctl_led_disconnect() removes these files with card->controls_rwsem
+ * held. so don't let the removal wait for a callback that takes it.
+ */
+static struct kernfs_node *snd_ctl_led_sysfs_enter(struct device *dev,
+						   struct device_attribute *attr)
+{
+	struct kernfs_node *kn;
+
+	if (!try_module_get(THIS_MODULE))
+		return NULL;
+	kn = sysfs_break_active_protection(&dev->kobj, &attr->attr);
+	if (!kn)
+		module_put(THIS_MODULE);
+	return kn;
+}
+
+static void snd_ctl_led_sysfs_exit(struct kernfs_node *kn)
+{
+	sysfs_unbreak_active_protection(kn);
+	module_put(THIS_MODULE);
+}
+
 static ssize_t attach_store(struct device *dev,
 			    struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
-	return set_led_id(led_card, buf, count, true);
+	struct kernfs_node *kn;
+	ssize_t ret;
+
+	kn = snd_ctl_led_sysfs_enter(dev, attr);
+	if (!kn)
+		return -ENODEV;
+	ret = set_led_id(led_card, buf, count, true);
+	snd_ctl_led_sysfs_exit(kn);
+	return ret;
 }
 
 static ssize_t detach_store(struct device *dev,
@@ -576,7 +607,15 @@ static ssize_t detach_store(struct device *dev,
 			    const char *buf, size_t count)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
-	return set_led_id(led_card, buf, count, false);
+	struct kernfs_node *kn;
+	ssize_t ret;
+
+	kn = snd_ctl_led_sysfs_enter(dev, attr);
+	if (!kn)
+		return -ENODEV;
+	ret = set_led_id(led_card, buf, count, false);
+	snd_ctl_led_sysfs_exit(kn);
+	return ret;
 }
 
 static ssize_t reset_store(struct device *dev,
@@ -594,10 +633,8 @@ static ssize_t reset_store(struct device *dev,
 	return count;
 }
 
-static ssize_t list_show(struct device *dev,
-			 struct device_attribute *attr, char *buf)
+static ssize_t snd_ctl_led_list(struct snd_ctl_led_card *led_card, char *buf)
 {
-	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
 	struct snd_ctl_led_ctl *lctl;
 	size_t l = 0;
 	struct snd_card *card __free(snd_card_unref) =
@@ -620,6 +657,21 @@ static ssize_t list_show(struct device *dev,
 	return l;
 }
 
+static ssize_t list_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
+	struct kernfs_node *kn;
+	ssize_t ret;
+
+	kn = snd_ctl_led_sysfs_enter(dev, attr);
+	if (!kn)
+		return -ENODEV;
+	ret = snd_ctl_led_list(led_card, buf);
+	snd_ctl_led_sysfs_exit(kn);
+	return ret;
+}
+
 static DEVICE_ATTR_WO(attach);
 static DEVICE_ATTR_WO(detach);
 static DEVICE_ATTR_WO(reset);
-- 
2.55.0

