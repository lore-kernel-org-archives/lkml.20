Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693041;
	b=SDAYbstCSm8IHReAKVb4tbPAIZoWRr4zPaUzmSvsUEDt3DWgw04TBSv5YeI+lCmcySI8
	 HNrUTVf/a4Yiyu5CyIJNuO1Ut0JTiBD1fKEthjY+O7kI7Z75VD7m0+isXk6Mm8T+seYei
	 5JTDsnSHR01plovwh3SLSffUlvlLRQTYM9ezamitBUBtFKfp5lSPS8942lnD3ZJzR0fWT
	 cciBpsCSao1QRdmwIgR5XOdO1Ptr+FeNDDDuJa9FEFkAZTSlS0NvURiCwpz/K1y5mDloS
	 BAM25zqAENbV7E/MK/84yKghiasTd/j2jasdKND5RK9Dkwptv1emfNchfl+tzJmkeTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TMkT8pmmuntirJUTkYbT/ik3ik7SviwqZQPfUGnXnKg=;
	b=jR24sYOu7aZ+sh1rsYkgb7soiVpByWwlyMyZc8qWBVCzAi9Kw4iqS7tv9UUsnwYZYYX+
	 gqsYY/kHZGzuKBIanmuIy7wXk+ZmwlKxZ8uAnTya2GPl73Afzw4IR0aPhnPqJRk5QMcyX
	 TF2Yc+yVjBJMIVsvuJG67PZ15qoCTAf5DWjETierSxGFvpXga50jBy7KfsYKcW4q2mlR6
	 LVx98x2BQWhf03W87rPwezhSX1/FSBYL8F++Vd6urOVfd3Vw+iHc9lJOXKcumQgfO3GBD
	 Udv/f32aZUHNbLWj2hM5NK5TfoBs6uB7eSWiEL41pi7BZScLED8Hmfm+9UthR0vaczg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppWgs8NM;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911A606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8911A606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppWgs8NM
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so185767a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693040; x=1794297840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMkT8pmmuntirJUTkYbT/ik3ik7SviwqZQPfUGnXnKg=;
        b=ppWgs8NMyUtDuXWt2AXmqLXdPVCGUFyGi0qxnKpoVidVrhuaRbZD8ZYSmSAR18mCKI
         oj7Fj/1677lPy3NeY4mYkI29aNMi4o2yo6UUjZxNeKR9qq1ytT+aK5/s1J9u9LIaodwo
         FNvGIfFre/SD5xPPuBguL6lgIbKiP5DtuY7kQpyMcGh1e+t4+7Gtab2yNQwtg7O1TeOe
         vc0UD1NW7JInhjCMs725ggDwiVmazPIzcMY8i+cuhPzpq5Dcyf2/NAe8p073PPJmtdvS
         UgsflOtV9ApsrUb5CbiEXCsSH8IVag+J3Mu8eU4MeirFChICbUB0dgMPON/FjyHCtqwA
         nZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693040; x=1794297840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMkT8pmmuntirJUTkYbT/ik3ik7SviwqZQPfUGnXnKg=;
        b=si5ukFogQCgoXqfZ/GDIfm+35eyaIFCIt4HhoabOpYjXbQsqYSeMMtbMpLvUgyJRiL
         MscKtIUHJ/VXtvQMbDjr0dXWq2iqSJgemOThMQc1BsYYq6SpcF6EQqphkSJO0dmGPRkL
         7HbETTq7O59NafpiDtR6Vk0bO83TEn8YAxK9cXWI3Oo2C/j56eV8WliBMErGUd452hyB
         xlzfEr3bhYptbUMhvvgjdM5RjDfh6WOOQQJwmJn2MQRSEjaavw+9SqVtp7/lre4WPv1v
         hk6v4Qowh+LV6ml9TI4u6TyqXyNhw+6eFIaIix/GrYIFMgXN0VtE8Hfnjh9kpOHTYeax
         Qv6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9FU9XBvg7q3rTg0JU/Y22hfWlH+4K/ezPHuMm1I8T5XlsdVZbcQtDyCFRVUTYdorlGqXsOKVMKs9N6ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2E7hQb7F81WCY9HK6YH822c5Xg56U2ak0Hff8VkwVIHkZeV8r
	9pi5f1pC1JHCHjqyZ4kOcB8IUbe9zzp7h9+8gaIo88uP7F2gf7T3GG9Y
X-Gm-Gg: AYBFou2JobB3vKRNeTpSiSCAvIRAyi2lKl0j3s85K0nRxeOGpACiZl3INnjfAIny8ut
	1zDTE5V+9Zqfpe1awAFlvEBCczgtPqaq5s6x7RcT7fLd1Wtn2xrGDV+6p5Y6CgElsPphbhb7dNK
	4owt5GnPfmneqgAhLGpi2pCw8BuIE3Bs81UJqpXk0UnFpCH1uPoYCT5x++CMCoiyy8UgBdajOp8
	hkGcTHim1PWiJm8EjduG9PjcSjIe/hR5W7fDBNtVM92mReODlAl3MMpjaKGelFRHsaajiRBffmV
	86Bt8D7inoUz1TdrpO8g6DhRD1othcAc5g+EmaoSFDi6EYiufUAi4xs6J9vvwK0dixl24mUEuUA
	6sDtbqr3blQ+f/Ys6Qbf4Dj8roaIh2Y/oRPZCg4KfAnciSrXIknmwjE1cNASI2lvx0CBwO/bk0h
	/2NjUJPYgogH36GlLT38BvYg/WHGf8pXovzGvwR0rb4R8/FOXIok0Gr0HFtksDOJ6fHuWkPIpaP
	0sjoxPIkZiKJk+oUklere4Ih43tTq4xPxvd4BEJw1JTP1TlOwPouZPeqvbcvU5nR1Lxl2OnoZsy
	EcSeZMVY4PfX8SjbiXyV0gCBJ4+/4jXMpfM1o/4j4IVIQ7k+mtpArJY=
X-Received: by 2002:a17:90b:548f:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3ae897c8b96mr6987877a91.40.1793693039871;
        Tue, 03 Nov 2026 00:03:59 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5814basm3316347a91.2.2026.11.03.00.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:03:58 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: mhklinux@outlook.com,
	stephen@networkplumber.org,
	linmq006@gmail.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] Drivers: hv: vmbus: Do not remove the channel when device registration fails
Date: Tue,  3 Nov 2026 16:03:47 +0800
Message-ID: <20261103080347.90310-3-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080347.90310-1-izaiahsun@gmail.com>
References: <20261103080347.90310-1-izaiahsun@gmail.com>
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

When vmbus_device_register() fails, it drops the device it was setting
up, and the device's release, vmbus_device_release(), calls
hv_process_channel_removal() on the channel. That function is for
channels the host has rescinded and starts with
BUG_ON(!channel->rescind), so the kernel stops there. Without the
BUG_ON, it would unmap and release the relid, unlink the channel and
free it, and then the error path of vmbus_add_channel_work() would do
all of that again.

When device_register() fails, clear the device's channel pointer before
dropping the device, and only remove the channel in
vmbus_device_release() if there is one: vmbus_add_channel_work() cleans
it up. A concurrent driver_attach() can still match the device while it
is being removed, so make vmbus_match() skip a device without a channel.

The later failures, creating the channels directory or the primary
channel's kobject, come after device_register() may have bound a driver,
and a driver can hold on to the channel past its remove callback unless
the channel was rescinded (hv_sock's connection, or the sub-channels it
opened). So do not unregister the device for them: its channel is then
just missing from sysfs, as it is while the device is being set up. A
sub-channel of such a device is refused, as when its own kobject cannot
be added.

Fixes: c2e5df616e1a ("vmbus: add per-channel sysfs info")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed them and tested them
    as described in the cover letter.
    
    Changes in v2: vmbus_match() skips a device without a channel, and the
    failures after device_register() keep the device instead of
    unregistering it (Sashiko review of v1).

 drivers/hv/vmbus_drv.c | 46 ++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index fc0f16f51266..1b9bc82bebd0 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -840,9 +840,14 @@ static int vmbus_match(struct device *device, const struct device_driver *driver
 {
 	const struct hv_driver *drv = drv_to_hv_drv(driver);
 	struct hv_device *hv_dev = device_to_hv_device(device);
+	struct vmbus_channel *channel = READ_ONCE(hv_dev->channel);
+
+	/* None if vmbus_device_register() failed */
+	if (!channel)
+		return 0;
 
 	/* The hv_sock driver handles all hv_sock offers. */
-	if (is_hvsock_channel(hv_dev->channel))
+	if (is_hvsock_channel(channel))
 		return drv->hvsock;
 
 	if (hv_vmbus_get_id(drv, hv_dev))
@@ -979,9 +984,15 @@ static void vmbus_device_release(struct device *device)
 
 	hv_debug_rm_dev_dir(hv_dev);
 
-	mutex_lock(&vmbus_connection.channel_mutex);
-	hv_process_channel_removal(channel);
-	mutex_unlock(&vmbus_connection.channel_mutex);
+	/*
+	 * No channel if vmbus_device_register() failed: the channel was not
+	 * rescinded, and vmbus_add_channel_work() cleans it up.
+	 */
+	if (channel) {
+		mutex_lock(&vmbus_connection.channel_mutex);
+		hv_process_channel_removal(channel);
+		mutex_unlock(&vmbus_connection.channel_mutex);
+	}
 	kfree(hv_dev);
 }
 
@@ -2103,6 +2114,10 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 	u32 relid = channel->offermsg.child_relid;
 	int ret;
 
+	/* The device has no channels directory if creating it failed */
+	if (!dev->channels_kset)
+		return -ENOENT;
+
 	/*
 	 * On failure the kobject keeps its reference: the callers' error
 	 * paths drop it in free_channel(), which also frees the channel.
@@ -2189,6 +2204,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	ret = device_register(&child_device_obj->device);
 	if (ret) {
 		pr_err("Unable to register child device\n");
+		WRITE_ONCE(child_device_obj->channel, NULL);
 		put_device(&child_device_obj->device);
 		return ret;
 	}
@@ -2205,31 +2221,17 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	 * here. The race can't result in a kernel failure, but the user space
 	 * program may get an error in accessing "channels" or its
 	 * subdirectories. See also comments with vmbus_add_dynid() about a
-	 * related race condition.
+	 * related race condition. For the same reason, the device stays
+	 * registered if its channel cannot be shown in sysfs.
 	 */
 	child_device_obj->channels_kset = kset_create_and_add("channels",
 							      NULL, kobj);
-	if (!child_device_obj->channels_kset) {
-		ret = -ENOMEM;
-		goto err_dev_unregister;
-	}
-
-	ret = vmbus_add_channel_kobj(child_device_obj,
-				     child_device_obj->channel);
-	if (ret) {
+	if (!child_device_obj->channels_kset ||
+	    vmbus_add_channel_kobj(child_device_obj, child_device_obj->channel))
 		pr_err("Unable to register primary channel\n");
-		goto err_kset_unregister;
-	}
 	hv_debug_add_dev_dir(child_device_obj);
 
 	return 0;
-
-err_kset_unregister:
-	kset_unregister(child_device_obj->channels_kset);
-
-err_dev_unregister:
-	device_unregister(&child_device_obj->device);
-	return ret;
 }
 
 /*
-- 
2.53.0

