Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500423;
	b=DfwKgO+PvIn2rEzmvr+wPMtpevpLnBFZFGHSXaixroGrvtUEJ+Xy2aC4WWP5Hhfj5zjL
	 kUpUg2gxqfAWM1ByPnw1TfUCm50uRb6/EO+06o+V3Ya6bUtnRnSmxWsAVLb681SNTDwpL
	 wAxuEquyACuIh61DVckCWvyK6Zb/r4xUIWqUBQF+GsarpP6ljgNcsQpmlxwuDem2EXxlZ
	 z1Edantuz3oPS/8zGYBHVCBp23ly1GHEn+In4vJEb8Z/rFmnstCC1Ei1FdBELcerxJs82
	 gyFkgWKOwv6+Ks/bxjgiQ4s7Wr/Yt9znrKAsdRS0naplphmqTbEPBt06f90bI9OuD3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500423;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=Re4v7+cAh9NthZloUF4hCYD8bLLNdZ5nRSvONKgsAAw=;
	b=yk3f13++oLCvjUfpNuGDb54Hbwij0poNnXmI0spQ7sfsxjiPEA/aX1NIrtJQ2D/tIE9E
	 kT+xAlWIS8sha/Tq11Qdhg3Yz8rpiRjw4MGhXGDEdparXxBBexnuf2CHds+BDTKooTFiU
	 hkgHwTRArX+8WTN7A/6q4xdIaq5SRMCavBjxs6sGWkawQXo3Lg8Oe5aAbow42qrByX7dv
	 Z8SIH0+PkRCXIOHpwqG3UEypu6Se/f6XP9x3q9S468kxbcP2HAUFszyhQF/YtiW44tKun
	 MNJnxnub9FDTT1iQ6qp6/9Ydo/TJeIgcLZjeiYgLBuWKrhestMNaHcbEXMfJxg8sM/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=ao1CQwsh;
	arc=none smtp.remote-ip=185.136.64.227
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562B60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5562B60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=ao1CQwsh
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261020124653d576ac4a0900020741
        for <linux-kernel@vger.kernel.org>;
        Tue, 20 Oct 2026 14:46:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Re4v7+cAh9NthZloUF4hCYD8bLLNdZ5nRSvONKgsAAw=;
 b=ao1CQwsh5HC5azTVV0PxpdsGAOBalMqhrXPLIDNVqFgmGxrt/YbI6QiPFCPRpHwtD9dqOa
 eJqkYUfCJcgWPYP+KXE6AJ8E9Lobr0PC887YRaZnZSwHxw91b17awUTJFmbx9jpoY8zzzLmM
 Vy4NzwSyamJLiTrekFeZe4+FvtjpASTJT5LbBR8P6++jZuX/gR+C5uS8MLAXPsiR/1hE3EJS
 tzvCS5fh3txdv8jpKWLiqIo/AO1dCn2qqVBFYFWOWTWeVK+YByyRbntLzB1xRNJhjbWeY3rd
 vKMgS/AzcCPkAIUQWaauP1Jg9F/MUPT+3KdJxgAwv1jwQWwB6jV1/Ocg==;
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
Subject: [PATCH v5 0/4] leds: trigger: netdev: fix sysfs_update_group() races
Date: Tue, 20 Oct 2026 14:46:44 +0200
Message-ID: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
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
v5:
- removed unset_device_name()
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


Alexander Sverdlin (4):
  leds: trigger: netdev: Put netdev on activate error path
  leds: trigger: netdev: Access net_dev under trigger_data->lock in the
    worker
  leds: trigger: netdev: Fix sysfs_update_group() races
  leds: trigger: netdev: Serialize mode/interval stores with trigger
    lock

 drivers/leds/trigger/ledtrig-netdev.c | 123 ++++++++++++++++++--------
 1 file changed, 85 insertions(+), 38 deletions(-)

-- 
2.56.0

