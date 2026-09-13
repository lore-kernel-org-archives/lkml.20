Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ABF23BCED
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789259392; cv=none; b=DH/tPNfeuCuYfVI0t8UqDsi6KLa4XCBktTJB4iXMPv9a1dHtxzjV2ylS2TGQ3RJDfBJEOeTsOuI80tMrTjC9dh3HjfWOXArE4POTWmb3OODfc9xHFyLoOrr4mxLMC9uCr6bNK6MWfB0U+6oWF1gSrOJKJ53fFI6UM0ckyjFavsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789259392; c=relaxed/simple;
	bh=64GHYTg1r/dPubV34LDaud4uA/ldHinB73PiAAq6dL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVtIZELZoVchbQAeGKbMefbsdGISdU3fNHLtTpmcJwg8Xzueq/VuJRXBTCNXZoPWkHC/X1IHxAm1Q5aoQ8u7IbfuxFWb1ykPrus0ZY3nwnkkw16EGFlvOwuHuReOPC2E0JSVqWCDWEOz/y8BLhKz3/2he3M3paceDPEtor5BR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=K/eki52j; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="K/eki52j"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso1162398a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789259390; x=1789864190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScvzY1Zp8ZMCyDWV+7q9ZIbetTA7/SJK3fOR/Be6tok=;
        b=K/eki52jSQCCaMSD3UYg329lTYAcUrS4WzaaDIP5tJ3QMQYELAMphUE9XvP13BzS9+
         TaLjjnQh7O+KmufGtixa2NbnQEwkil8jx+GJAN0IkrhFI2hTE5mGQtD5rwJJljo7BJkx
         02+haKJcPPgIQUBAwLcqt+5X+Utm4bXQpco3OsNVNVFX1Ji+rRqTiCwuMtTfKFftGKPW
         gSG3Mbc7A6TvRNc21cQhqAAZDGCHQuNp5a1PgkrA7bjHg1c7pNAmvwI0iWHuvEj+G69E
         SAmdHmEjm1KX4WIhl+fdz4KIRGXb4ICYJ0uKKcclIAN+P6a74JlS4ppOnPVxJxCf/q+t
         F2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789259390; x=1789864190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScvzY1Zp8ZMCyDWV+7q9ZIbetTA7/SJK3fOR/Be6tok=;
        b=hPdQo6YVYuFnTzyaC2DUYZa9YhrqF/igTpnbNcX+wdNsJIhRdbby4T7K9C/13Lxzxh
         WvwfZ28NgUW+/VYWYbDTIo+RXv1bHjof5XY+sWTZZ/FjerZSt6THHaBsfvHu2SBXHHOE
         3715DWEErBduu3hkHknTOpappKQNG0lFjvv9ugqF6ih50FSb6cpHotT7Q2IX7KW2JMjw
         Wu/kGyqaKwG0SrQzVMghvdT7JbkXAhfK0epvzzFi67Pz8PMuQDx6Tcx70qV91FD6n6iX
         jdI0c1DMU1r1mJmW1HYfGVAAJ50m1mlg+UfLpT1kangCRSVn6QQxmXARdB71mR97dcIS
         2xQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5+oXPcLdo5qBbM/2OrP0FZIzl1NqcBMck4y25CT+2Wdn4Hq6ziY47s+qfhr/LU1C+jWdImS5kmWqd4fs=@vger.kernel.org
X-Gm-Message-State: AFuF++l0IIB+SJnPeXVyHuoP1R7vo1EUi2l0OAuc6+VS+y8FS1BMElzW
	WvCdpEeiVsabH+DrNM5eLt+lYvBtgRKmCB/l1VnygAkRdywsY0R4yJnqJNczwceWKg==
X-Gm-Gg: AYBFou1ZnirerlT2GEuu7XI7Lf8ovJgw2AzY9Osyb4F/vGQpidSJRvqlQ052+U6OQ+q
	5aW6R9KQyPMDSEmnK4sqYrDsl9vKLIvGBcqkKqgab1fJnyIc58UDbbfuPr/ua0muv2Pp/eVzaHW
	o+fAurWr2MGuHy6pR6WBx4ppoNie3UgLMoNs0jfch102Rbo7WCI+ekkKrSKMRKxWAeG3zvvQjJM
	yPQe6xEZQ5MoxkhLBjyNCV77S4fVDZD4cle1wiK9t4UuN9TffE8bSnAPiNxFqPCJo9MmLmHxZQv
	d02ZYusRmombaruY5EageIegZjO/DYjsBrG7kdBGYyUIQpKPeLcS8g2lI5keMXZdu8aATwRRfcO
	fHtSXqws459EBy0OzZa/DnRPuYQxro6ZF2KKFVjeNI0PLQ3LAItHJphdtvIql//jQU+yU0NB/nI
	cYHfZOpE77I41zVLzAB1AWJyBYRG5agu78BlAGPqv8JJRWRZh4EgfhRJO7ToeSy/UMDBQWPb99f
	ObLyG17O26aV7BcTxCRVjVqtuHBDb581DFNX3M+EuuPIiQelOs7heeH
X-Received: by 2002:a17:90a:d64c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39d9c1d260amr18545118a91.13.1789259390011;
        Sat, 12 Sep 2026 17:29:50 -0700 (PDT)
Received: from xps.tailc0aff1.ts.net (149-169-99-5.nat.asu.edu. [149.169.99.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm14899408c88.8.2026.09.12.17.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 17:29:49 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+9782320f78c23f40@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: reject audio endpoint with zero packet size
Date: Sat, 12 Sep 2026 17:29:45 -0700
Message-ID: <20260913002945.338569-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em28xx_audio_urb_init() divides by the audio endpoint's wMaxPacketSize
without checking it, so a USB device that declares a zero-sized audio
endpoint divides by zero at probe time.

Reject a zero-sized audio endpoint like a missing one; the caller already
unwinds on a negative return.

  Oops: divide error: 0000 [#1] SMP NOPTI
  Workqueue: usb_hub_wq hub_event
  RIP: 0010:em28xx_audio_init (drivers/media/usb/em28xx/em28xx-audio.c:718)
  Call Trace:
   em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
   em28xx_init_dev.isra.0 (drivers/media/usb/em28xx/em28xx-cards.c:3887)
   em28xx_usb_probe (drivers/media/usb/em28xx/em28xx-cards.c:4258)
   usb_probe_interface (drivers/usb/core/driver.c:396)
   ...
   usb_set_configuration (drivers/usb/core/message.c:2268)
   usb_generic_driver_probe (drivers/usb/core/generic.c:250)
   usb_probe_device (drivers/usb/core/driver.c:291)
   ...
   usb_new_device (drivers/usb/core/hub.c:2703)
   hub_event (drivers/usb/core/hub.c:5961)
   process_one_work (kernel/workqueue.c:3322)
   worker_thread (kernel/workqueue.c:3486)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Kernel panic - not syncing: Fatal exception

Fixes: 1b3fd2d34266 ("[media] em28xx-audio: don't hardcode audio URB calculus")
Cc: stable@vger.kernel.org
Reported-by: co+9782320f78c23f40@bugs.sh
Closes: https://lore.kernel.org/all/51lCz4R7QyTUKbh4mhXNaNzX0evpk0siOzbh%40bugs.sh/
Assisted-by: Claude:claude-opus-5
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/media/usb/em28xx/em28xx-audio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index ccff6be5599e..7f0c5826ce5e 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -693,6 +693,13 @@ static int em28xx_audio_urb_init(struct em28xx *dev)
 	}
 
 	ep_size = em28xx_audio_ep_packet_size(udev, ep);
+	if (ep_size == 0) {
+		dev_err(&dev->intf->dev,
+			"Audio endpoint 0x%02x has a zero packet size\n",
+			EM28XX_EP_AUDIO);
+		return -ENODEV;
+	}
+
 	interval = 1 << (ep->bInterval - 1);
 
 	dev_info(&dev->intf->dev,
-- 
2.43.0

