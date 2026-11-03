Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749880;
	b=nrzI8geA+JWNMZVLm8mUYcsjta91y/HHpAdj5nvj/wWH1wM0ZgjFZoUDOTSR2PzLM+f6
	 MgFBs4bRjuY3XrlbkxAyKEKSetPZxcjXOanAM5ECov5+XOC8iZXGxo/eoM3htOvzspsnJ
	 cQQ4Y1JT75seMj2ncR6btWxfJmBnA5ioRAJ6cu8KqyAL5Jdf0MAr83IABc4reXcGSEx6y
	 t1couKRffBi1EWREFp3u+YK1sZr2cGXGecx5YNRhhBReH/cOQUcTwyYxMoQ1Fcfe/LUCU
	 I8hfLil3wa0EiU0XxnPiVOtE6gQFirC2YnPTp+fxwz2/YRrtZKejmNc2o/9gbFRKEjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HlYo3npPGUByceGrtIHjkrKEtKjClf+MQJt0+OILPSo=;
	b=DD0lI9Hm/ORPy+r4Y/l+Kw9JKD2c35DBGYxQEybg1qZn8SP/UTajeXxN9B5F9XWT2rwM
	 44wLu9K175KUwaRJT0VT1OD98NdMBD7Qcy3VUl6OUOhTysVWxnhE73UQZoY4WkFttr1jG
	 xQm/NHeEqDrgnt2t+f/bgT4CfTiYfizG6N74cS++N1djYQVDMcoYr2JJRleBoOK7hPg0o
	 6tCyImEYev+42X9FrunlEUVTus0RYN9KS9CdWkoEqTpHmRP8WE5uZ6JX771OYBiDwWfHj
	 15SSyrwPWzsEVrGrNvSczgPJAWgRYOMzFO7NLdNbM59jUESGWiMdhge/Y7GAJOnyfMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="m6dG/A2N";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED7606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ED7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m6dG/A2N
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so175026eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749879; x=1794354679; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlYo3npPGUByceGrtIHjkrKEtKjClf+MQJt0+OILPSo=;
        b=m6dG/A2NsKVzxeDyOKO2PMtypyyYXjQhUti86iSKwUr7pTjmjlJYqElhhfP9bEIShM
         DL7nmovmsHGt393Jb+ab6O75RiOUvYTFt1epocYtzfU0v+8HEHb+kB8gE3pShMsmEFIl
         bpnlETXk3nS1EndI1WYzaUiqN+GbHOgw1N5eBarEZVphF5wnHo1LD5JgTRpiPohexCih
         SgcJDQDiu57wh0KpivyN7DvXOwHScocOKE+pxvP8uh8CnRVuIz34Z+oR77mzEKnbnv6f
         AjtKzwhNXZrGJlpZZTt2Tfcc867jdRteEo8c+jhw/2cuLWiEa9Vo/P3RYF6lDF3v7Cwv
         dKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749879; x=1794354679;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlYo3npPGUByceGrtIHjkrKEtKjClf+MQJt0+OILPSo=;
        b=yIhF3FuEKWcBaIZ5czKhiKYsfEFtnwTS0o5ejf9+VOcna4xOdcAmkZ2spsl+D0dtqs
         S/aNM9CcuXiDIzi8447HbIoGvPlQjMrtQslX3gS/6Bv0ySKnPuWi/mHbReloHsq8dA3R
         UFLmpmPzBi0j/l6ro5l26TNDadTrHsWqdekdCMOGJjYUMaVG+/Hhugkok7WMyJ0pY/RD
         d0t1qdJp3nxDVXLHseYYCOfxsqqvE8KuE924RMyZTU9v0lk0Mz4tVJ6DfLkDbboHkXIj
         mYOMDJ7tmPx8VMGWzZ/oi0QpCFbz+iXe0o0rrnKO48CyzgHlrxGzGsK2Kp+9gmm08IEU
         pLcw==
X-Forwarded-Encrypted: i=1; AKwUvBzuRjuGNSSjjgGh2f1UA4pgzLWRk/Mp2JqkWvBSp45d9XFbks8d8I7x071Ucmb7X09vj5NXXo4STKYnGy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K5GvtLdiGYgghvcTgjFiyth7EPxzYgbx3YCPef7EdsKF2OpPv
	8PhJLghikpjj9tADtmo7M9CFYo1jkRCc020u6xHPVxQ/IHorr8xxKSRk9FjzSpis9rmdCB7RIle
	zb9xwbHuWvBUFGLb+3w==
X-Received: from dycc2.prod.google.com ([2002:a05:693c:60c2:b0:36b:fcaf:70f8])
 (user=sanglardf job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88d4:20b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36a4241bcccmr22600419eec.35.1793749878549;
 Tue, 03 Nov 2026 15:51:18 -0800 (PST)
Date: Tue,  3 Nov 2026 23:51:15 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103235115.3991801-1-sanglardf@google.com>
Subject: [PATCH] usb: core: Emit KOBJ_CHANGE when usb_reset_device() succeeds
From: Fabien Sanglard <sanglardf@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fabien Sanglard <sanglardf@google.com>
Content-Type: text/plain; charset="UTF-8"

When usb_reset_device() succeeds without re-enumerating the device,
userspace receives no device-level uevent indicating that the reset has
completed. For usbfs clients such as adb, usb_forced_unbind_intf()
unbinds the interface before the port reset, and device_attach() leaves
it unbound afterward because no kernel driver matches.

Since usbfs suppresses uevents on interface claim/release, userspace
receives UNBIND(intf) before the reset and no event when the device is
ready to be re-claimed, forcing it to fall back to polling /dev/bus/usb.

Emit KOBJ_CHANGE on &udev->dev.kobj in usb_reset_device() when the reset
succeeds, after usb_unbind_and_rebind_marked_interfaces(udev), so
userspace is notified (with DEVNAME) once the reset and all kernel
interface rebinding are complete.

Suggested-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Fabien Sanglard <sanglardf@google.com>
---
Tested across snd-usb-audio (no pre/post_reset), usbhid (with
pre/post_reset), and usbfs (adb) using udevadm monitor:

Interface driver                Uevent sequence on reset (ret == 0)
--------------------------------------------------------------------------
Kernel (no pre/post_reset)      UNBIND(intf) -> BIND(intf) -> CHANGE(dev)
Kernel (with pre/post_reset)    CHANGE(dev)
Userspace (usbfs, e.g. adb)     UNBIND(intf) -> CHANGE(dev)

Discussion: https://lore.kernel.org/linux-usb/20261012171609.88273-1-sanglardf@google.com/

 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535..9b3835ced 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -6447,8 +6447,10 @@ int usb_reset_device(struct usb_device *udev)
 		}
 
 		/* If the reset failed, hub_wq will unbind drivers later */
-		if (ret == 0)
+		if (ret == 0) {
 			usb_unbind_and_rebind_marked_interfaces(udev);
+			kobject_uevent(&udev->dev.kobj, KOBJ_CHANGE);
+		}
 	}
 
 	usb_autosuspend_device(udev);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.385.gac671c819a-goog

