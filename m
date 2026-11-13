Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601192;
	b=Ad4uvh6/dCKY/pxLVrbOrZsXJcafiGqj7ptG12l/88gP7KoI4uFlAcwlEuO+zav+PM5P
	 H7eQMiPiQvzaym8PNlLsVcO7MhiDGZPokLc8kCB64yjgwSFzvpKMTcoY/DhG0XUpT9a4W
	 xOlQ+b9dKlw0hcp5d6Vw6Z96Qx29hcsFFYWF16sd/lpw/8Ueo3ac6UOXdkabXa7ZFIdsz
	 C4Az1oOi5XPDp/TCf0I62/G/W4ikyLA8yY9scpG+rzGXDpk5csxrfnFGgWZGzTWDJGj6m
	 FZ5j7IQn0rd/3n5Fctcq9KihfMc2tSV5yvVbQNPSQ11mwK0JmIWeIIhUhZp/lmmvH1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601192;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=nEmSNqsLdN7B5gPU1pl2Y9r9cTa2cz5CXQYAbJkS2hk=;
	b=TZHA8U9Sp19mnAEQsqnI6BLWNJTgUC7HQxgskq5yft4yIntdp86hneUaYFZdKjKgicCe
	 zt503VwxkuvhL62T+WPJ3ZQdm4f5KSiAErTfF7jQXFYssLbY6CHY6JwsbT8ixShIM5roc
	 tGTaDQeMgrmAzF1875Zq5AJZ0kxWUQ6XVLX40V9HSmXIjozjb2kcGhka3sta7aOfRc+sx
	 3tjVDdJ5NDR5QD+BAyq7k0muRfXDuXwR1b3fnSPiiuY95o8z3wE8Q0OGTPmylLKJ9b14T
	 0bVS82jwNT8iRe7tRYDwEUjrYqhgmrp1v5MiHgKcALGo4/smG5Ms5t2o2kcIglhnpEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=VVWgKuBc;
	arc=none smtp.remote-ip=185.136.65.226
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54206606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54206606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=VVWgKuBc
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026111320193969c105d1c3000207f9
        for <linux-kernel@vger.kernel.org>;
        Fri, 13 Nov 2026 21:19:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nEmSNqsLdN7B5gPU1pl2Y9r9cTa2cz5CXQYAbJkS2hk=;
 b=VVWgKuBcvy/iJj2rwXpSrCUgMXYuTPGE6vIvqGuvvMPs2OoMO2ondFJJIw+m4l5/RR0ZPX
 lmu+SdnLTU8ZDi5O6Oz112hqXE+OqcoYWfItzmXMGLplaaOy9lasuW+2Z5Ba2mzrY6G3Y95z
 F6j/qIB1EtISbHR3DQV6oRQ3tgOwnyLPNehn/xdrkiK8lD8Y7EXG3GpDEfO3pGvkfg/drYJd
 4F/5z9molQ1gd9xOXCFpsq/yv2zyXgF9Tw2v/ikM1B1UqX6PHRuL3JjXDT9Ia2cHjYcfrga+
 QQ1dJYrXYWu6O0/Rgt8w0UUAwNDfmWQdmazC5MeutoARtqidfmDA8Beg==;
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
Subject: [PATCH v7 0/3] leds: trigger: netdev: fix sysfs_update_group() races
Date: Fri, 13 Nov 2026 21:19:29 +0100
Message-ID: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
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
v7:
- rebased onto for-leds-next as of 687615faae92
- dropped patches 2 and 5 superseded by Lee's be29a52d48b5
- added Lee's tags into patches 1-2, but not patch 3 as it was changed
  substantially in rebase
v6:
- report invalid interval to user space
- fixed unlocked hw_control check in interval_store()
- added missing carrier_link_up check in netdev_trig_sw_blink()
- https://lore.kernel.org/all/20261027113349.383147-1-alexander.sverdlin@siemens.com/
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

Alexander Sverdlin (3):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Report invalid interval to user space

 drivers/leds/trigger/ledtrig-netdev.c | 83 +++++++++++++++++----------
 1 file changed, 53 insertions(+), 30 deletions(-)

-- 
2.56.0

