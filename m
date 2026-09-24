Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F474BFE6C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278963; cv=none; b=RHt/FiQAKE0Q5EKhebZN5gYWMspA8C92VaxA5zOCAEFE+ezWiXZDRrNyxlakQzORBth0kUgDEdxX4ZbJhedyYWEBTZdGmrOsdNzklHeZX8lv6N67i9PiO6cr8BwuEh/7pdUMjll+zTIzDx7EjRr3yKHgFYWTAjZVTom0eJVsYz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278963; c=relaxed/simple;
	bh=zIbIrMzSJDvDYBgIkEwYRPpVBywOrf5wHV9beNe9Csk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RLpmjBiqrEdvre0xGE8rDfmkbgHF6RzWMvTRCYRUlGn/2JbyOYpe0/RgX304jMo6Tvq+V6MwdNhDk2eNhF8YBO/lgLjMXc7x5HXvJnGuPQyxDb6aHbMeMorJVIO0a9hvVgXFI4jeVpRqGtdZCHE3eq7SMaOkXd7GM9eDxBdVcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFZMpI25; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFZMpI25"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso93180f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278959; x=1790883759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgnXoD/BSCv5lN5N25xk3q9G7OkECA3zkXLqZfTADaE=;
        b=MFZMpI25BePn+vnWqqWZabsu07MNqEFn3Q49M7yE1ii/t3tWv2NZru+kqLA5nXh3Qu
         I8uq57ex/gBL1ilv4f2p1MS8ILzSLs03yUfm/iVqqcnTrKQVYvOAVc6AvnfVhjaJVl2W
         rJ1DA9BxZyI79VeEGDrDz6sNAXszCRxsP221eC3oHrWZYv6o1lkzumPaZP9kBFvOSs0L
         LkfUVtHli+AmmBEFXXwGq4EE86ge8Z8sWkwGxN6PdVmGhdm23SRcSvaY80oRaxsROtP4
         uLMw8K2Rwg7uDg8E8ffccYCqS+cfbFA8ZzIFwDKHlqEdZWesM+uIxVxG+VKg/1EiYg4U
         svsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278959; x=1790883759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgnXoD/BSCv5lN5N25xk3q9G7OkECA3zkXLqZfTADaE=;
        b=nVnOF63SqXl5ZMQDjaW9WpZGKuy+RGYxevz0xzXddhGyp8z22ODypJoY8hn+amkapS
         QKM2Q7cSDqvnQCQowDtG23JL/dwSaaYOzgY1+FzTVar6dKKDKOJ66W4Z0nGuT1uc0ODd
         elgkrQm76Qq4U1VC1XizKNj3IvRmGvYJ6QLeFcrRqtY9/ugWOGwsrGOja5Bocd2HkmTc
         ZM0o903iuQuHBpzUG6VhpvUhoHX5VslRSVwww9rl7gbV7SYvg9iBtHYXaUrcjXC6X5uP
         50nOKmQa76j4Ji++f9GiwymbTiVeFANTvLfTyuFGCmR7pM5dN/aDG/fhkNbIPBUGimqq
         xIww==
X-Gm-Message-State: AFuF++mcpHtCM0I5fSabyC2gZ2z90fv9WUNGs0JfzTpceRK4QTPk26Q+
	5fRJKImVZh2q0wbV/Mk9WtwayBClTQSi0bfcFzuLhHBHcRTUAAqusv5KwAhCZoQg3JbXNg==
X-Gm-Gg: AYBFou2VAiutwzSInrpGzwg61r2SjCu4yYzWmiqjrNU952WKHw61qg08GFvyhLh7KdH
	GSsMhk7u66kq9JtcrGUb4rh0VvMKy9TSultO+XaSFFqcW/jbDszx4GpHW2lPkQJJsWdspx2Yyv9
	P69VZXvlVTmhxqUpyWOWOc9Y2wuX3P11FDzHZ9PGrBiV/ctTsiulV+SvLwOXrORMuG75eyBpeVK
	+V4dgRyjjDGYxQDU1XkSgsVIvSUhVFWl3nVJdfKR7bGS5SETWVvnBrOn+4dj2487tUPy/RtOEeD
	+nP58JwVZZgCUO1l2NcPwjZRhOfLD5l9dgGryYrbyoL35TMFReWAeD0+eohXnoJAZiSCqvGmG4u
	AZER8KDN+GB64sM/XbGsOzK/jcyFJDZd0gcFH1rc74toZWJyv+Y/MXuVH063G6mDQ0lS2eBQsd6
	PGOk0uXCBq7xfP6gvPLpw6MTg3uh9eOcgv9wpS9YGcRsLLoxA/e6Xf9VhICKwtK/7M7Ljdat36e
	04UoQYU1wrXo0Ke1RzHzY4J5PlFxnTL0kILVh+jjXq+YByRtxw6HRCVKSAR7C/nxnQ5uVlAGBtE
	WA==
X-Received: by 2002:a05:600c:5493:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49ff06e509cmr312365e9.20.1790278959036;
        Thu, 24 Sep 2026 12:42:39 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm935105e9.7.2026.09.24.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:42:38 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
	Peter Chen <peter.chen@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: phy: don't overwrite a device_type the bus already set
Date: Thu, 24 Sep 2026 20:42:33 +0100
Message-Id: <20260924194236.168010-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_add_phy_dev() replaces the device_type of whatever device the PHY
driver passed in:

	x->dev->type = &usb_phy_dev_type;

That device isn't ours.  PHY drivers point x->dev at the device they are
bound to, and its bus has usually set a device_type up already.

i2c is where this hurts.  An i2c client keeps its release callback on
the device_type, and leaves dev->release NULL:

	const struct device_type i2c_client_type = {
		.groups  = i2c_dev_groups,
		.uevent  = i2c_device_uevent,
		.release = i2c_client_dev_release,
	};

usb_phy_dev_type has no ->release, so once it has replaced
i2c_client_type there is nothing left to free the client with, and
usb_remove_phy() doesn't put the old type back either.  Removing the
client then hits the warning in device_release():

  Device '0-002c' does not have a release() function, it is broken
  WARNING: drivers/base/core.c:2642 at device_release+0x1de/0x280
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   kobject_put+0x162/0x260
   device_unregister+0x27/0x30
   i2c_deregister_clients+0x27d/0x410
   i2c_del_adapter+0xe9/0x230
   i2c_tiny_usb_disconnect+0x3f/0x90
   usb_unbind_interface+0x1e5/0x9c0
   device_remove+0x125/0x170
   device_release_driver_internal+0x4e2/0x6b0
   bus_remove_device+0x2f5/0x470

syzbot gets there with a fake i2c-tiny-usb adapter: instantiate an
isp1301 on the new bus through its new_device attribute, then unplug the
USB device.

Only i2c is affected.  phy-isp1301.c is the one i2c driver among the
twelve callers of usb_add_phy_dev(); the others pass a platform device
or a struct phy, and both leave ->type NULL and keep their release on
dev->release or dev->class->dev_release, so device_release() still finds
one for them.

So only take the device_type if nothing else has.  Callers that rely on
the uevent handler still get it, their ->type being NULL, and the i2c
client keeps the release it cannot do without.

Tested on x86_64 with the syzbot reproducer: before the change the first
isp1301 instantiation panics on unplug, after it 292 instantiate/unplug
cycles pass without a splat.

Reported-by: syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3fb7629cfd12d04beeab
Fixes: a8534cb092d7 ("usb: phy: introduce usb_phy device type with its own uevent handler")
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/usb/phy/phy.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 5a9b9353f343..ded18c7fe32f 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -705,7 +705,13 @@ int usb_add_phy_dev(struct usb_phy *x)
 	if (ret)
 		return ret;
 
-	x->dev->type = &usb_phy_dev_type;
+	/*
+	 * Don't clobber a device_type the bus already set.  x->dev is the
+	 * PHY driver's own device, and for an i2c client the release
+	 * callback lives on the type.
+	 */
+	if (!x->dev->type)
+		x->dev->type = &usb_phy_dev_type;
 
 	ATOMIC_INIT_NOTIFIER_HEAD(&x->notifier);
 
-- 
2.34.1

