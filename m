Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913029;
	b=fKBK/GDUp9cROC/wad5DvIJXNg1cx9z0lsd24kLl5gdI+6aslMgEuWOWbdKEmxhwiu0E
	 43XRfyu8p4ISp1JA/QG+HMsG4VRrXDntQXtlnH42STVSatN3QqemkTUwub+g6kHFhWjmV
	 YqFcWdYqpkU0Q+TCzpwo9s9BvNtQsqmyICishT61+/GwA7qDYwT0nCMlN5sN2APxyGPPS
	 s0gTREx2UjdWlq9PhHZ7vYNUKp3+VtPFytw0cgLTih4I9wDHMFxhbx2DD9fRujLgXoJGU
	 PLNrABONkQsBb3hYxxzJX4sGbeNcqFndUxwvjQHFZ07l2bUrzvvjHZ/2vRuWG762GuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913029;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4sJ9s7f5Q/rrBh/jiPDE7QHkaIG//0YC7UHsi9Lv2Nc=;
	b=eXjgAOKS+IPpsx62poDvkb7vl/fmOIyuO/fa4NtIN4DPtslx5ZzGGqxCZk6SGpH7V7D7
	 fcU3iTKuJSDSoR4334DgAjUuVfG6xfd17a7uQttIs5rNpq/l56Nh2JrRBPrX7kkDfqbWV
	 JOuiXh+UKSt2V1Z7VPzAii87XGMgeAUjFtJBv7xymvdPDdlkyeb0upM5t7zjFP1IpQs/e
	 ukgMkYWeggCfDfQKuiOon6dyCDDzhrs5uHpxyZfcoXtfXd5ZScD+JjJbq2QJs+u+vFtPJ
	 eqyXxjIGRp7tkurf+0cOIQtzjnscDZfYCk/GzIhbuhgs7DZazk3u8eLVBHGPvrzoJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=z9hYBlgC;
	arc=none smtp.remote-ip=61.135.153.166
Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED2E606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED2E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=z9hYBlgC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1794913025;
	bh=4sJ9s7f5Q/rrBh/jiPDE7QHkaIG//0YC7UHsi9Lv2Nc=;
	h=From:Subject:Date:Message-ID;
	b=z9hYBlgCBL94vVCQ6O8L1yIqHK3g63KGgYLoCOXyO24Xqq0rCRMRYUKEJKxXbu4ms
	 lSEn+9OOCEaKzcH0K8UPNpZPRKbTs/p8uRpAccX31PEEGphYPR17GfgKN2BE37Wrwl
	 JX9yi4qChEZ5jwL8YUin4iUmMcRkEdvfuzwIk8og=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.33) with ESMTP
	id 6AFC32F500007964; Tue, 17 Nov 2026 18:56:55 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 9807086685066
X-SMAIL-UIID: 712B557F85C64A6293B1F3E6B407B349-20261117-185655-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+436c71c257f18c488712@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvb: reject dmxdev ioctl until adapter frontend init done
Date: Tue, 17 Nov 2026 18:56:53 +0800
Message-ID: <20261117105653.61358-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6afbf0cd.27ea6653.1a0e84.0004.GAE@google.com>
References: <6afbf0cd.27ea6653.1a0e84.0004.GAE@google.com>
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

There is a race for usbv2 adapter dvb init and dmxdev ioctl:

   CPU1					CPU2
   ====					====
dvb_usbv2_probe()->
 dvb_usbv2_init()->
  dvb_usbv2_adapter_init()->
   dvb_usbv2_adapter_dvb_init()->
    dvb_dmxdev_init()
     dmxdev is ready			dvb_demux_ioctl()->
					 dvb_demux_do_ioctl()->
					  ...
					   dvb_usb_start_feed()
					     In the current context, active_fe
					     is 0 and adapter->fe[0] is NULL
					     because frontend hasn't inited,
					     this potentially hitting [1]
   dvb_usbv2_adapter_frontend_init()

Move active_fe init to dvb_usbv2_adapter_init() before dmxdev init, this would
reject dmxdev ioctl.

[1]
KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
RIP: 0010:ec168_streaming_ctrl+0x73/0x210 drivers/media/usb/dvb-usb-v2/ec168.c:312
Call Trace:
 dvb_usb_start_feed+0xa03/0xef0 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:308
 dmx_ts_feed_start_filtering+0xf6/0x220 drivers/media/dvb-core/dvb_demux.c:747
 dvb_dmxdev_start_feed+0x273/0x3f0 drivers/media/dvb-core/dmxdev.c:658
 dvb_dmxdev_filter_start+0x1b6/0xdd0 drivers/media/dvb-core/dmxdev.c:769
 dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:985 [inline]
 dvb_demux_do_ioctl+0xe64/0x1200 drivers/media/dvb-core/dmxdev.c:1099
 dvb_usercopy+0x167/0x340 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1208

Fixes: e48b2a68617c ("[media] dvb_usb_v2: frontend switching changes")
Reported-by: syzbot+436c71c257f18c488712@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=436c71c257f18c488712
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..c764f288065a 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -637,7 +637,6 @@ static int dvb_usbv2_adapter_frontend_init(struct dvb_usb_adapter *adap)
 	dev_dbg(&d->udev->dev, "%s: adap=%d\n", __func__, adap->id);
 
 	memset(adap->fe, 0, sizeof(adap->fe));
-	adap->active_fe = -1;
 
 	if (d->props->frontend_attach) {
 		ret = d->props->frontend_attach(adap);
@@ -760,6 +759,7 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 		adap = &d->adapter[i];
 		adap->id = i;
 		adap->props = &d->props->adapter[i];
+		adap->active_fe = -1;
 
 		/* speed - when running at FULL speed we need a HW PID filter */
 		if (d->udev->speed == USB_SPEED_FULL &&
-- 
2.43.0

