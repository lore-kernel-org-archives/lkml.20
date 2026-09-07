Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D569438493
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788821087; cv=none; b=tMtNfDZjEhdUL+6VOqfzH6hTmacVPDeMVklioDO6JDm4S6GuqgcyP18d+mzzwv78wRyCSFQ2Vg3FyvOvaZzBZwv4ki7xJSKcfPAJTzudxpQygZsQpg5YVjtG0Iu3eAn1bVaRx9DYNp6h1l1brCNB+goTcMCZBCVNXpG0wcvicgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788821087; c=relaxed/simple;
	bh=eJT1th8vkf3NL7hYeCL6NFDeQmEhQFBe5CV1EY/c4+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMQHeKoDXJVTyf8GTuYlv/wm+LHZKakIo/wqO6+eqouomOX1N9l2Yuzw09uhkjycLHC86YF3kpYzkkVGXNzntA8wE77AVXcxy+MH0Iil6G7Grx4U0S460xoca63F9FAe1hkDwzu84lWQ/xg0VAGL8VnWjzBihF59J0xn/IgpoGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hoaet9sp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hoaet9sp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so3276580a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788821086; x=1789425886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUv0mkJ7cMAUQ8w3WWyZh0341NHHmgqap051/du2GZE=;
        b=Hoaet9spe8LMsPZ88gk6X+JJfLjHhE8DK2MNshpbRpOeFDr4u84zHPW797ow0IP5vN
         EhzDKqNk1kj70sakgUkmBW5RFzuy9Dxuhq9QGABrDVe7BmtI/kp2heIWmjPVyKCs+LFf
         6DYIzP2uX2mWjINIX8HVhg09xEfXlmwgJGcEI3NdH4TXCEY3NWcek1xHxuTe2XT8yPO7
         Vyc68qGQPaybQRVV4HMPz3GldCJRTJJhzBqwp/PNgdMHj+SBEdygof/rqRwaMcZO1ezP
         GLTS/MmnLmSLOLmCkr1c6JGUcHWJan663j3EEKfNrR2q1RJw+XT8W/PEo3FfhFgNF41U
         vBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788821086; x=1789425886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUv0mkJ7cMAUQ8w3WWyZh0341NHHmgqap051/du2GZE=;
        b=HYdD7WN48pLVcf23x8UdovE4/rgTeKJbAyHUyOdN0C+zFoEWBKxs9Q8IpdYv4a3kUc
         54pPUUkEP4QKQPfNRjOUCJu7qBwjT9qzQB67ctxH0dDGhhvlWKSwX5tt88QWOiEPc2HI
         5/dJWbC3pY/io1IdKwTjWvdDg8LjgiYIJ5DwsE6klo6bHROER8mfuEz6SXf1BgNdKDBs
         uKna7F3RqqHnDn7PXFDxcbcLRfG64K1+cfxiD14HyV7+EWDhuHZ8fcj+/SVjriqa8N6u
         zkjxL006wByJmeA7OtCrjjiVFPYh+PdfDqXC/E5SyrqUUiozYDnm2VBr3IBpcJLUQMjj
         DW1A==
X-Forwarded-Encrypted: i=1; AKwUvByZVJAUN9cmNGfhH3GBDJ0t+xddwu9TlmW+BzAMaW0xRIvn5mp8cidGeNX8sn5vXUDltFylzxWg3rorj20=@vger.kernel.org
X-Gm-Message-State: AFuF++nZOapb1yAhZhFgOjJVE/+ITCuGA2lCaIdb4Vm4YOTsgiiMmhYi
	JE+AetXPMV/+TU8R6flJCLFu4bTGb3vyNSQE2acASiUsFRwDeoeWw7H/
X-Gm-Gg: AYBFou07cjZBYJv6iezanxe3Kq/kMooMLW0h8dCK7Q3Pl7XzZUdy0nsakD6TB3X9dYJ
	UrpYrMbUxGy2ooGHfGNSvMRVTxKgnGY+wD3EetNvOemzHgOACMeZkc2+YDqpmguelLUqV4nCUiB
	AhNf/Wd+xPupVrrAi0Nz2xeTdg2T1lqHzwSV0QKOe4gmdIkVBmEM6Mh63BRvGJqs40sJqluyIUQ
	jN9gbxMSHhhABKSvGJARxWve1XFvXtui5isfyP91Flh9kgpk8isTM2oRiOb9frrwNrKZmPi6rX6
	5hxFyAfUC9DLFbiPM3ZL1gKlfz6Izh1pV5E+m160YkeHCyuntGnRZYdE164VEFrZhKV+eHyhn2X
	VZjG8//1yGi382VcLym94fxR44NN1IkNs7OUXRa6wuSDw3NLeDmWnUi21LggZWydM9l1dL0+TlA
	0/nF0IDEOYuwf3h5KlMv20w0GGxBCKeAExAHK8xfvbJoh2eN1MJzaoBw==
X-Received: by 2002:a05:6a21:6f06:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3da39f4293fmr37866696637.7.1788821085747;
        Mon, 07 Sep 2026 15:44:45 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455485c25sm4526555a12.26.2026.09.07.15.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:44:44 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: erazor_de@users.sourceforge.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] HID: roccat: fully initialize device before publishing to devices[]
Date: Mon,  7 Sep 2026 16:44:26 -0600
Message-ID: <20260907224426.159104-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a9ccae4.37659fcc.e790.0006.GAE@google.com>
References: <6a9ccae4.37659fcc.e790.0006.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

roccat_connect() published the new device into the global devices[]
array, then released devices_lock, before initializing readers_lock,
cbuf_lock, the wait queue, the readers list, or setting hid/exist/
cbuf_end/report_size on the device.

Since devices[] is checked (under devices_lock) by roccat_open() to
decide whether a device is available to open, a concurrent open()
racing against roccat_connect() could look up the device, then lock
readers_lock before mutex_init() has run on it, or read device->hid
while it is still NULL from kzalloc, once devices_lock is released
but before the remaining fields are set.

Move all initialization of the device's own private state ahead of
the point where it is inserted into devices[], so the object is fully
constructed before it becomes visible to any other reader.

Reported-by: syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/hid/hid-roccat.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index d6fff53d4ee7..53358297e96c 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -307,26 +307,32 @@ int roccat_connect(const struct class *klass, struct hid_device *hid, int report
 	if (!device)
 		return -ENOMEM;
 
-	mutex_lock(&devices_lock);
+	init_waitqueue_head(&device->wait);
+	INIT_LIST_HEAD(&device->readers);
+	mutex_init(&device->readers_lock);
+	mutex_init(&device->cbuf_lock);
+	device->hid = hid;
+	device->exist = 1;
+	device->cbuf_end = 0;
+	device->report_size = report_size;
 
+	mutex_lock(&devices_lock);
 	for (minor = 0; minor < ROCCAT_MAX_DEVICES; ++minor) {
 		if (devices[minor])
 			continue;
 		break;
 	}
-
-	if (minor < ROCCAT_MAX_DEVICES) {
-		devices[minor] = device;
-	} else {
+	if (minor >= ROCCAT_MAX_DEVICES) {
 		mutex_unlock(&devices_lock);
 		kfree(device);
 		return -EINVAL;
 	}
+	device->minor = minor;
+	devices[minor] = device;
 
 	device->dev = device_create(klass, &hid->dev,
 			MKDEV(roccat_major, minor), NULL,
 			"%s%s%d", "roccat", hid->driver->name, minor);
-
 	if (IS_ERR(device->dev)) {
 		devices[minor] = NULL;
 		mutex_unlock(&devices_lock);
@@ -334,19 +340,8 @@ int roccat_connect(const struct class *klass, struct hid_device *hid, int report
 		kfree(device);
 		return temp;
 	}
-
 	mutex_unlock(&devices_lock);
 
-	init_waitqueue_head(&device->wait);
-	INIT_LIST_HEAD(&device->readers);
-	mutex_init(&device->readers_lock);
-	mutex_init(&device->cbuf_lock);
-	device->minor = minor;
-	device->hid = hid;
-	device->exist = 1;
-	device->cbuf_end = 0;
-	device->report_size = report_size;
-
 	return minor;
 }
 EXPORT_SYMBOL_GPL(roccat_connect);
-- 
2.55.0

