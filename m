Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100841;
	b=doyuqWy3AV7Pjty9vLdrGP6Gk3VJFaDEc9wtdN78DHWpIEkYsPO4fWs5Mgkyg2X03gVz
	 kPbASwCtdrSnvoh5CkPEYgdbhGos8KWsvF/KgyyhpS6GorRTXwGLRiyqW7VKFJGHE14GB
	 QsRcNGDicfaX0EdKGIEL83rMXFB6LCBeCq6Cl1Ff2+9W5s73v6lanFI3qVeZvtFRecTpv
	 hbG3XxPr7SUSpQK0+fhCUBAqBOg96/3kyKkLIsommrkK30nBqro+yTp6sDhVVUyuJ3OEe
	 yuOTh+P/fKJDc3NO3KnuHaHA9g/cNJSl1ZaUlqV1TCVIetaxZ0kiegLvWscP5iPz6jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100841;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=/8UNYZRLfX17A/rGH89AnZhCK05En4ZqGpei7ncmU5o=;
	b=UM2K+17yN3EnFnvCylg9WXhVtFNgzPqTspSAUdfQP4N+JGC15itU8ML8otNIVQTI4Q8R
	 JuluH+Ii0PWn42apJ2rulVRWV1zm0zrPMLWChUR92XtDEFVdR+UMOmlkV4x0IFljuA5uf
	 ETIus3D0WtHPdWCo5hGdanZcTT0BF9zVce8L8+yIaJbLsOR1VW2+bQ13sh2xWDFX+1v5j
	 DaiepcHfs1fflH96Y57WaeWtvwnHkw9Jzj7ARAPNU58h1mbmekCkSYTWpRD/Zx7PPoh38
	 xRjzbUjMyKtF2clq87dQ6qlT3fPNFn6mmD34XTyBfk9fBR1ijdKk1cupSIa7E49UBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=nDpC+cSL;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C1606B5A3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00C1606B5A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=nDpC+cSL
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261027113352ef8483a7be000207e7
        for <linux-kernel@vger.kernel.org>;
        Tue, 27 Oct 2026 12:33:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/8UNYZRLfX17A/rGH89AnZhCK05En4ZqGpei7ncmU5o=;
 b=nDpC+cSLKZgkYoanKQ+Het0/rRNcy2utiuakyCW6FdFnPpiebdZ0vnxjHO9wzeOJjHd9te
 ktBbQpMfjCKJS3dvyNURByM7cD+2u0cdDFhZpzgXjxPBg5reVVBeB8T1rA/NgFVIn3wcy2Dp
 27uQ4WPmhmVWV6o1nY3KKPLwCqKr50f78/ZpHb6UOLs10ZeCRw1HNeyU4j9IwcdlksfnJ1iO
 Zt0swMGlYSiZw6r8g9uLAAIELxMUIxAn/FHF+U5mOnW4jaZqRgoutZ4zusIGg1Kl3Nnadwe6
 q0uc8mjOslXKBe4XTTVHrop0Ic6C+r7UB0xhFwTcDQyWQ7HoGukCr9vw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] leds: trigger: netdev: fix sysfs_update_group() races
Date: Tue, 27 Oct 2026 12:33:40 +0100
Message-ID: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The netdev LED trigger refreshes the link_speed attribute group with
sysfs_update_group() from several contexts (the NETDEV_CHANGE notifier,
device_name writes and, indirectly, trigger (de)activation) that share no
common lock. On a board that emits PHY link events while the trigger is
being (re)armed during boot this is observed as a hard sysfs failure:

  sysfs: cannot create duplicate filename '...green:lan/link_10'
  ...
  led_trigger_set
  led_trigger_write

The window between activate() and device_add_groups() in led_trigger_set()
is narrow, so to reproduce it reliably I artificially widened it with the
debug patch below:

--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -12,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/device.h>
+#include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/rwsem.h>
 #include <linux/leds.h>
@@ -223,6 +224,8 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		if (ret)
 			goto err_activate;

+		msleep(5000);
+
 		ret = device_add_groups(led_cdev->dev, trig->groups);
 		if (ret) {
 			dev_err(led_cdev->dev, "Failed to add trigger attributes\n");

With that msleep() in place, writing the trigger while a NETDEV_CHANGE is
delivered from the linkwatch workqueue reproduces the duplicate-filename
splat every time.

The whole series is LOCKDEP-verified.

Changelog:
v6:
- report invalid interval to user space
- fixed unlocked hw_control check in interval_store()
- added missing carrier_link_up check in netdev_trig_sw_blink()
v5:
- removed unset_device_name()
- https://lore.kernel.org/all/20261020124651.1987272-1-alexander.sverdlin@siemens.com/
v4:
- introduced netdev_trig_sw_blink() and used it in netdev_trig_work()
- https://lore.kernel.org/all/20261001131206.2513248-1-alexander.sverdlin@siemens.com/
v3:
- introduced unset_device_name() as a counterpart of set_device_name()
- guard() has been converted to either explicit mutex_lock()/mutex_unlock()
  or scoped_guard()
- rebased onto next-20260925
- https://lore.kernel.org/all/20260929120902.2793138-1-alexander.sverdlin@siemens.com/
v2:
- addressed pre-existing issues found by Sashiko (patches 1&2)
- reduced verbosity both in comments and in commit messages
- patch 3 is a combined rework of patches 1&2 from v1
- dropped sync from cancel_delayed_work() (worker now takes the lock)
- https://lore.kernel.org/all/20260921093249.3481413-1-alexander.sverdlin@siemens.com/
v1:
- https://lore.kernel.org/all/20260914132356.807004-1-alexander.sverdlin@siemens.com/


Alexander Sverdlin (5):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Access net_dev under trigger_data->lock in the
    worker
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Report invalid interval to user space
  leds: trigger: netdev: Serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 140 ++++++++++++++++++--------
 1 file changed, 96 insertions(+), 44 deletions(-)

-- 
2.56.0

