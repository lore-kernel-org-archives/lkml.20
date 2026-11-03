Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716821;
	b=WFXUdlEZhNh0Ha1tVJF2ptTZVHitA1nd4DwCTwrjAymmH659JnkvWLSLV2gL4tOSo8Gs
	 I8fjamx3KIkxeh/r+Ni0rGVgMiO6GUqzXtx58puN2bD3/qS1y8AnhhGRkwBqxXlfBEFHP
	 r9/WkfGV7JkcBKXzVmD2jdwmxSBSeZae3yiq1tk/+M1QDBbKNMm8qcXEcKCyLt5uYhqoB
	 pZEPkHRlKwbBFDEstjw1d6S2A3KLb+X2nH0Fi7kKaNYJiwK9+7fIVm+MQWc27o5SbUrql
	 a+gGpZYJoRTPbbzk5el+gMc5yBvjVVKISavRqukfAuzL5PBOmtFvRyoUDA/rxoJIJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=71SHQM+JBAqWOZSxiB0ywBj+k1TZQiMc0kbJjW0dEBE=;
	b=cQ0Q7px+tRnVNr/hz8/pCG024sfQVzMOS7plbVWEvAEVJwDmoLqQkMr4HcIdI2kwVJXL
	 5zzOSteLdXJBOkOWgtmi/zmyXHI6ujTxzvj+N4RpX99XYkIMyTuKZJsrx/vMxWRw4eJa5
	 ar3gGPxo+baBRCHDdkUjU2JpsiLckSbWYQP7yyArPxPnhA6Wyrb+ckN93VzDF5ukmnojL
	 Ez1riq7xnzKmWMwqTplOVA8pj6xphplx9kfIaawkMWjvGxsjhmPfad8sbvIry9+zIZyQY
	 1y+QitbXAAqAXw+gUfcuqZ5PqjJIfQV0hOrK45waM6+ewcvs2Kmty6muENw7XXqdzJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcCqzwTz;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D8606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14D8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcCqzwTz
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so2018580a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716820; x=1794321620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71SHQM+JBAqWOZSxiB0ywBj+k1TZQiMc0kbJjW0dEBE=;
        b=LcCqzwTz/1nC1P2gl8UvDIGdEOpBDVyofXQ6G76dY7JcuDUhvtGrKpsm6EC4ZSTzbV
         OCRFT21vWE5ODkpMuUsfPG3NWbmHglT4KUFDfgaTAt63ZnFYHFeh9EIf95PGeRytnymr
         G2aSUv6zHiYmL8ftc+ggTP26etrF42Qizko+MwXSjqpOfEpdJwIXUG1ez2vTcYtewNLE
         WJhSIgowsOaOMiY6yVCaQXqf3pNDhWpv28ncmhinn4I1q34RQ67LeqHAkuAGQr9BWiBF
         LGv1HLQ0lXOmGVIXQIEXtS2Ia/ESuHQpwZNLeoGzbwxqZSJSQ9/yNHzngJP9y0HLItEb
         Hp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716820; x=1794321620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71SHQM+JBAqWOZSxiB0ywBj+k1TZQiMc0kbJjW0dEBE=;
        b=ataaYnpjy4vYyvtTi0UlzeDdjyq9B8XnQMuA7T86aypunog7+f8pUFZpOlawuXejo5
         /HtbOJhP1kiXTwSRVeDRKek1SyMtuC5Bd9Y129V4JjojhvMhkp0upjI3K5wb4qBGXLjC
         MA3j4WPdTdIqICCTq38+ZXbx0hYer9ZEI7FqeKdOxoqky3IDlniHhOq5noTcB8HdKU/q
         qvYlca1e0uIKIY7g+NQsVu7ncguErFcQy9FnHnBs9Z4aCXrGJqRoBVfrlzyT0cyAe8VB
         xNpSg7Qa4DesaUARYTf/aaLPdoHNZAIhqYeOj78P/47CWY8EONyG39oRVFDu2w6EV9rf
         DSBw==
X-Forwarded-Encrypted: i=1; AKwUvBxfMbdF3nmixDY3SUIqJYg8A+Ydg+GAK/vytsw8CJVYnb2Veqm2Y4eiQ//DJjwIra/tWH4S0CViaSEYdY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eLinv6AWvpyO2znAIM2yU52xn1f2MNwvI4q8zXyl2JtfQYQ6C
	wWS3s0DmFs9zMp1qc9eCPdwhch0xz8XSF9WnFHLdkEPSXpP3a+76Hf7f
X-Gm-Gg: AYBFou13aaZ5+uKjH042G0fxo6dEW/t/mgNyYgYRgMToyK7e3V4B73K2k2dt//MB7vR
	vzXqEEb/GH49MlTTYs+C0mmNjl8Fou9y5R/Rv9LcxNvbkA0EY4dDs2nXptr/D819vR5weSRqGI3
	mF+H3FsxitaRpFzMJ4lBRTzsZTN2QWOwt/nE74rGHd/vUTLo6RhIgWB9EXkmWVvLvNl2mNi10sl
	oNpQauK3UWatGw+FMKRozkFHVgXDX2quFvoWk6Tse73cwUe11UUjGYLSGLOz3/ENSUWepTy2hzY
	k5wPxEB48jM7FJcs05lYVDt6e7C9GsznhcbKfLtZ9BISGNOm2EqBxtcuxSkT5YIi5xCxQHbQ1ur
	nsThDmNeBr/illMnO3rPbs6im/TD06jgXDXfTAUbrw6cuQhQFVkPSO5DYquSOeNAYLSjSUXqZcy
	ZPFL+XvSi5E1H75t4S9Rucw+6NoopMeIK6sdL501bwXbiop9mKxXIo0lgebdOY2dcWFu9v0ER91
	pKfybDawyXIQhQJHvcDyoSj/m/drvPLsCBZpkBfpfbCfiydxDZhMlugQ0Kl+AO813lJtPiNmu/G
	n3m2sQJf1q53XrK5zc31cELKqY/2Mky82+qIqyR9eoHAdUSdT67i52LcaLmYujxSudPw04NUGGq
	8dXMZYhRfqFo=
X-Received: by 2002:a17:902:f688:b0:2ec:ed9d:bfbf with SMTP id d9443c01a7336-2eced9dbffdmr20393835ad.57.1793716820092;
        Tue, 03 Nov 2026 06:40:20 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:314f:4575:be3:a064])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm42898465ad.4.2026.11.03.06.40.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 06:40:19 -0800 (PST)
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
Subject: [PATCH v3 2/2] Drivers: hv: vmbus: Do not remove the channel when device registration fails
Date: Tue,  3 Nov 2026 22:40:06 +0800
Message-ID: <20261103144006.69857-3-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103144006.69857-1-izaiahsun@gmail.com>
References: <20261103144006.69857-1-izaiahsun@gmail.com>
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
it up, after clearing the channel's pointer to the freed device. A
concurrent driver_attach() can still match the device while it is being
removed, so make vmbus_match() skip a device without a channel, and
look at the channel under rcu_read_lock(), as it is freed with
kfree_rcu().

The later failures, creating the channels directory or the primary
channel's kobject, come after device_register() may have bound a driver,
and a driver can hold on to the channel past its remove callback unless
the channel was rescinded (hv_sock's connection, or the sub-channels it
opened). So do not unregister the device for them: its channel is then
just missing from sysfs, as it is while the device is being set up. A
sub-channel of a device without a channels directory is left out of
sysfs too. This also applies to a sub-channel offered while its device
is still being registered, before the directory is created, which was
added to the top of /sys until now.

Fixes: c2e5df616e1a ("vmbus: add per-channel sysfs info")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed them and tested them
    as described in the cover letter.
    
    Changes in v3: vmbus_match() reads the channel under rcu_read_lock(),
    the channel no longer points to the freed device, and a sub-channel of
    a device without a channels directory is left out of sysfs instead of
    being refused (Sashiko review of v2).
    
    Changes in v2: vmbus_match() skips a device without a channel, and the
    failures after device_register() keep the device instead of
    unregistering it (Sashiko review of v1).

 drivers/hv/channel_mgmt.c |  7 ++--
 drivers/hv/vmbus_drv.c    | 72 ++++++++++++++++++++++++---------------
 2 files changed, 49 insertions(+), 30 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index cb1d8d76928f..1fa232e86fce 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -554,15 +554,16 @@ static void vmbus_add_channel_work(struct work_struct *work)
 	 * method.
 	 *
 	 * If vmbus_device_register() fails, the 'device_obj' is freed in
-	 * vmbus_device_release() as called by device_unregister() in the
-	 * error path of vmbus_device_register(). In the outside error
-	 * path, there's no need to free it.
+	 * vmbus_device_release() as called by put_device() in the error
+	 * path of vmbus_device_register(). In the outside error path,
+	 * there's no need to free it, but the channel must not point to it.
 	 */
 	ret = vmbus_device_register(newchannel->device_obj);
 
 	if (ret != 0) {
 		pr_err("unable to add child device object (relid %d)\n",
 			newchannel->offermsg.child_relid);
+		newchannel->device_obj = NULL;
 		goto err_deq_chan;
 	}
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index fc0f16f51266..b41ce24e200c 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -840,9 +840,24 @@ static int vmbus_match(struct device *device, const struct device_driver *driver
 {
 	const struct hv_driver *drv = drv_to_hv_drv(driver);
 	struct hv_device *hv_dev = device_to_hv_device(device);
+	struct vmbus_channel *channel;
+	bool hvsock = false;
+
+	/*
+	 * No channel if vmbus_device_register() failed. The channel is then
+	 * freed after an RCU grace period.
+	 */
+	rcu_read_lock();
+	channel = READ_ONCE(hv_dev->channel);
+	if (channel)
+		hvsock = is_hvsock_channel(channel);
+	rcu_read_unlock();
+
+	if (!channel)
+		return 0;
 
 	/* The hv_sock driver handles all hv_sock offers. */
-	if (is_hvsock_channel(hv_dev->channel))
+	if (hvsock)
 		return drv->hvsock;
 
 	if (hv_vmbus_get_id(drv, hv_dev))
@@ -979,9 +994,15 @@ static void vmbus_device_release(struct device *device)
 
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
 
@@ -2099,15 +2120,24 @@ void vmbus_init_channel_kobj(struct vmbus_channel *channel)
 int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 {
 	const struct device *device = &dev->device;
+	struct kset *kset = READ_ONCE(dev->channels_kset);
 	struct kobject *kobj = &channel->kobj;
 	u32 relid = channel->offermsg.child_relid;
 	int ret;
 
+	/*
+	 * The device has no channels directory if creating it failed, or not
+	 * yet while vmbus_device_register() is still running: leave the
+	 * channel out of sysfs.
+	 */
+	if (!kset)
+		return 0;
+
 	/*
 	 * On failure the kobject keeps its reference: the callers' error
 	 * paths drop it in free_channel(), which also frees the channel.
 	 */
-	kobj->kset = dev->channels_kset;
+	kobj->kset = kset;
 	ret = kobject_add(kobj, NULL, "%u", relid);
 	if (ret)
 		return ret;
@@ -2116,8 +2146,9 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 
 	if (ret) {
 		/*
-		 * The calling functions' error handling paths will cleanup the
-		 * empty channel directory.
+		 * The empty channel directory goes away with the kobject: in
+		 * the error path of vmbus_add_channel_work() for a sub-channel,
+		 * and when its device is removed for a primary channel.
 		 */
 		dev_err(device, "Unable to set up channel sysfs files\n");
 		return ret;
@@ -2189,6 +2220,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	ret = device_register(&child_device_obj->device);
 	if (ret) {
 		pr_err("Unable to register child device\n");
+		WRITE_ONCE(child_device_obj->channel, NULL);
 		put_device(&child_device_obj->device);
 		return ret;
 	}
@@ -2205,31 +2237,17 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	 * here. The race can't result in a kernel failure, but the user space
 	 * program may get an error in accessing "channels" or its
 	 * subdirectories. See also comments with vmbus_add_dynid() about a
-	 * related race condition.
+	 * related race condition. For the same reason, the device stays
+	 * registered if its channel cannot be shown in sysfs.
 	 */
-	child_device_obj->channels_kset = kset_create_and_add("channels",
-							      NULL, kobj);
-	if (!child_device_obj->channels_kset) {
-		ret = -ENOMEM;
-		goto err_dev_unregister;
-	}
-
-	ret = vmbus_add_channel_kobj(child_device_obj,
-				     child_device_obj->channel);
-	if (ret) {
+	WRITE_ONCE(child_device_obj->channels_kset,
+		   kset_create_and_add("channels", NULL, kobj));
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

