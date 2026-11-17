Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886000;
	b=SLvhXb2SXp3Pl8rTPlbADKfbyJTUxaUgo4aPJlt7uzBjaPlEGOqjIDQprUald+eQaF6p
	 HyV+WlH+KUuOAENMTqHeu0BGceG4DeE6KX2FtgrdTC4raVX9tzfaMSFdERb/6uLKp+VHt
	 XZO4KoW9ZVU0D2IT3TshZkWYUGJYV5WXujTe1Fxj84jz/GPz0++MLWnVCigiiJRrXpJI5
	 XVzAOcOVAJyAjpEyFoZ+HVTZVs0dbS6hMeyrr/vVVnl3QsNOkVffiRB5rsuNtSTsuvQb6
	 URW/wqFdbtBjc05MvVxQwmmrdx/86KZPLcwJYJ1qPJi7u0pic4mPSZB6Ys4VlbCG13g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AXlqTYvpcF3UXvDWj1bG8okcmiq8quZvDfYdZGLKfaw=;
	b=YeIvueYR1e5DIZwpweGJK/EFgVEBoXCWnX3jmDCsvnVRFTp7hteYmvnae5t+JzUit23Z
	 igMwJdoiE6K7ZuDOMfpIX5F0B21nb0Qv7QJxcq+Q36CcvVDoyVk/woVIfIJGV/aHccYQY
	 9Z3Z9nfbRzz3Sl/Stq8VIg9bygrV1O+yC4vPJxJGPi+d//3kqIhuR76KWRgDfelbMWjfy
	 dRp1kRG/Tzkx+ItZP15zwkU59iQ+qAxJxER4BZrVwaUA6ig5fpv9NDmwBPvSg9jINGpy6
	 U/rt6Pol9dzt+QLLqPTp8f74g5cphpwWdg8ThfFcl9a2yvrDpId9og/58gOBRSMwAog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eACmQPAR;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA39606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eACmQPAR
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ecbdf5343so5306436d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885999; x=1795490799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXlqTYvpcF3UXvDWj1bG8okcmiq8quZvDfYdZGLKfaw=;
        b=eACmQPARLv8ryg6G1XCTONpJGqqpucSsBkyz8Q5/Gu0FSRBx1WLVS0DN+LAIKdTNwy
         GlUeb2vtpekLAEfzUgW/XWg3q8Ozwkoki9HJGnhPn9XtETvTw5/s9JRZgMHYf5Hb+pLC
         QlOwxLZDJZ9AReKsmymt36LtqUsiruzjgb8JFx7tQNRopFyaAYz8rY2FtGRYMbkgkZlp
         m2XeM5W3KxMxWWimJEi9RFgHxIFl9aRBhKgSfmXXDzyqbGcpcPmlbAfKX17Gs6ikX20e
         Nqv7+ddYonsR91DtWJcJF/SdjF1Ogqx2Rjg3976Ci4eMybmgaKmAYFbTVh/HJW+j6vg7
         mjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885999; x=1795490799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXlqTYvpcF3UXvDWj1bG8okcmiq8quZvDfYdZGLKfaw=;
        b=nVNid0ervmqHWNW8zjB4u0VVUu5MFLHmQ71nG+YV+OiLj0qdXtUww86jXAqOSlXSpI
         j+r1N3BZnMUfe/2g43daApu/3sx7BCXNJxWZEzlGBxRoUzTKajeJWY+QLtNw+hQDrNIP
         y+/+zWBNB99SXB6UvD1gbh/9jG4f0hGgw2PX/iNDxN/1STVDKR5EzVl263cyLRHj6ll+
         Q+7USlaVCngOYkweVSeyJpT42SkR+YMluVHVM2JEeKAA9w0LaAI2IgVLi/+b9rq7/f2q
         acZO1T0AHIvsvuu7R3QvsCmikKo9rWE8A1S+E6RdwhM3X+zcG6S7hNVEfCpC1yTBV+1/
         7mDw==
X-Forwarded-Encrypted: i=1; AL+hErENECaOmCSmmQr7lzGMyLe7vQIF7/GCFCA/goovA4jVrLS4xs2HQ8gPhM4H89DaqvyFGdaUaiH1XHU5pcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z87uZz/VKimWAPIw6qH0ZdPClPMY2IU7rhwPvhZfFvs6kiv4HeP
	kyohOn6soNpWnhd9yvunL+go18BkAQYPYUbbwpBdg8dIZTsJYdb33xr9p6v34NVy
X-Gm-Gg: AZFdTZfM5Tf2pb9SLC78feQTZ9vOEtOnNiYIXew8sGi38Iq02wc9fxNk3dI4oM01e6s
	KthUMdvYx7I1kISQN0hqZttHafqdLtUYAVe3xGp7E/NM5v9ovI2XS7QBCBdd6UTXTDRmd5JFYUV
	4B0GDfwVtaP8xU3atTvIg19ksjUVCOt9DxrxP/ORc6EuWqNoXxB6SV/tIxfBmYsZ0WbzhpdH8X5
	+Tj6/uXnbtSc9XnqFrWNGKd/vXSCZtV9mCkvv+E0qfKbGkp/0NfMsi0BVKEUao+lImBv0J7YMK+
	IJB8fi2dog/wRzVuLSHwPUwak7JWUKfT54HjCIF8ZC5SFL917fkJ5HJN2N6m13VD1otWn1z2AZC
	umE7nuckAvSGUeMvfwMQpKW2pB4GEYFcJ1BimRWPbivIahzA5IpKjVjVQZdgLSrBlXfXXhA9Pp0
	akMISqUZ8vRYVR3OihUc08cOvhcbN+JbD7OP9lHLBQjAvcVVWV/2Lj7lGPs+4qUF8bHNLYkqW4h
	OwKM80ttf5bDKL2Q+QupZSY61aIH7zjQjr2pYxpnDz++NmYJm//I7WrCZPfNm+KnEwr/WqPAjK6
	fA9uYP3qB2b0zW8Vj/gM0FOr+e9NUzcd5EnmFa3q5aMP+Unpk1bArRsKhqb1KfSKgVpSkKoTO8h
	M
X-Received: by 2002:a05:6214:29eb:b0:91b:5d39:e137 with SMTP id 6a1803df08f44-920fd44a178mr24402826d6.34.1794885998689;
        Mon, 16 Nov 2026 19:26:38 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d61888sm101701986d6.20.2026.11.16.19.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:26:38 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ma Ke <make24@iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] mei: do not let mei_open() find a released mei_device
Date: Mon, 16 Nov 2026 22:26:34 -0500
Message-ID: <20261117032634.1740740-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mei_open() looks up the mei_device in mei_idr without mei_minor_lock or
RCU and only then takes a reference with get_device(). Two things can
go wrong.

On a preemptible kernel the walk can read an IDR node that idr_remove()
for another device has already freed through RCU.

The device can also be freed before the reference is taken. An open()
of an earlier device's character device can be delayed between
chrdev_open() and mei_open() while that device is removed and its minor
is handed to a new device. If mei_register() of the new device fails,
put_device() frees it while mei_idr still points at it. mei_deregister()
has the same window, because device_destroy() runs before
mei_minor_free().

Do the lookup and get_device() under mei_minor_lock, and stop mei_idr
from pointing at the device before its last reference can be dropped.
mei_register() frees the minor before put_device(), and mei_deregister()
clears the entry with idr_replace() before device_destroy(), which keeps
the minor reserved until the old device is gone.

Found with a static analysis tool we are developing. Compile-tested only,
with x86_64_defconfig plus INTEL_MEI, INTEL_MEI_ME and W=1.

Fixes: 7704e6be4ed2 ("mei: hook mei_device on class device")
Fixes: a6dab2f61d23 ("mei: Fix error handling in mei_register")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/misc/mei/main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 4fbf0b323616..5a8570e54801 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -53,10 +53,13 @@ static int mei_open(struct inode *inode, struct file *file)
 
 	int err;
 
+	mutex_lock(&mei_minor_lock);
 	dev = idr_find(&mei_idr, iminor(inode));
+	if (dev)
+		get_device(&dev->dev);
+	mutex_unlock(&mei_minor_lock);
 	if (!dev)
 		return -ENODEV;
-	get_device(&dev->dev);
 
 	mutex_lock(&dev->device_lock);
 
@@ -1324,8 +1327,8 @@ int mei_register(struct mei_device *dev, struct device *parent)
 err_del_cdev:
 	cdev_del(dev->cdev);
 err:
-	put_device(&dev->dev);
 	mei_minor_free(minor);
+	put_device(&dev->dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mei_register);
@@ -1340,6 +1343,11 @@ void mei_deregister(struct mei_device *dev)
 
 	mei_dbgfs_deregister(dev);
 
+	/* Keep the minor reserved, but stop mei_open() from finding dev. */
+	mutex_lock(&mei_minor_lock);
+	idr_replace(&mei_idr, NULL, minor);
+	mutex_unlock(&mei_minor_lock);
+
 	device_destroy(&mei_class, devno);
 
 	mei_minor_free(minor);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

