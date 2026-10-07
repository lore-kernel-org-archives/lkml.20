Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F61547054
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389041; cv=none; b=Pm2+xUYHWaRdOYrUVJYkG2s+mP9F+rxjO0WpM+/eM40WRN4ysz1edggpS4VY9B91cL9VRe7Qz7XnK/kL3y4YsbPm3EcjBWDoA6gBBg70wpkz7DFRBLLNb0mOph+oiu2VKfpk8CtLGD2dekUlGuqqHEyIHB9I7yNsE3itFtCmiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389041; c=relaxed/simple;
	bh=nYKBNXbASZM91FNGwDQtCQ6idrk4/AMl4BBgb6Mk4FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eR/A+t78xQMu2ccVuAovmDyeVPM6k39JRi/Q+L3eqL39tt77M5hFdzZXBZlfO55YBike3DqrJBKIPDMTx8O8ITChf/qcbgguD25ter/jqEemK1PzDR99NtN/hCM4iZgAqob/0AG7mjCGyMI8Fda7PoFmWUm/5balub7xYW6R8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0lgEnkJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0lgEnkJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2198824a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791389038; x=1791993838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEp2cJm5A66MilSFbf82vwQxlK5XKvvApSBvw85ugEw=;
        b=D0lgEnkJPaAPCT41uli+LCV6GvThfBKsk5mZIwOMXiHEQsbJRDWrb0qRyle27UexfO
         pkBpmAnXsD0KZ25kUpL6KnGyG9oShJ8wXGQZlNLl8qBXaQp4UXhnFBCWpza2aFXMnDRX
         oLDAQCKlytFJdzZgRUSyll0dK7rTQdrpuxQC2NlYdpnXWOKA1YM3GHxJBqmHk4qKsry6
         cx1PDxqIEPO+GHwEvgS4G0CgYiPbP4GuVbrHcz5uP3X2DI4cWr2cetzU5IKtiWSDnW1W
         1gDaIP+06j4EqTKeru3cbbDKLVZMxgpsVY1QdD+YS22PAt5/EeWwztMoinSPX6Xj92J2
         /JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791389038; x=1791993838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEp2cJm5A66MilSFbf82vwQxlK5XKvvApSBvw85ugEw=;
        b=pOg05MrS+q8VzL/4KMuzN6ci+kjzix9p6QReh9cD8fr5URy/1YHEcqAbJBE27e8mQV
         8EEhqOZiKG+Lhh/YXlMTAdKEwSzCK08UZ+tcYz/C+aUuFKJS17W2Hvvjtgk8xSUe3JxJ
         EpaplMZNQRCbVMaIa5gD2BbSXe7Y8FXENHnUs43bF3adLuttEqY5PCxvAQAQaq86A8Ij
         3KYFqPaZLATJ11ubQnD2aqVsk5GTXH5Z3jbyVUWlzFe5N8D1s14SYYu8xu2RmGYJkeJI
         bs9gh/51Icb8/L7Cz/2aOFu/rIY87kCPWuF+o83RJcjQTIpFaeJZQDFD4qzkZcDbjE4s
         qwYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc/PqCxx0SJm8jagDbWWEtSoc8Z2rlTaGw0qGFzmu51ImgluiKVsabjElsbcZJ/4OlOKHI0Qeg4FUa+58=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbJ4jsTuyWIsI9YHCDhIfsNRtOF872QgESyVUBw9ph9BMtYnso
	JtX4HFT7L6tiB25dRCvmn3ZGPXqi85kXWZQU4vVihUpAEhhuz481mlRy
X-Gm-Gg: AYBFou3BaiuriiThbmeJCyuZ3gElRGyl39cbb8IrxsjjznwUyRy9W9qTsWc4UDhd4Ka
	tiPwQVhxD2So807vfZyh7o8EpAAGR4k1uZNLGCq5zivMRj3TBVIjkWcguDTOCexJYkOqe0zlqzf
	IgRayRgbicghQV+mJ0llffNwqEESJa/mKJRSw0SXa4FzREB7zcRXjy0hlQ1x5rh71AeeNddYYkW
	R4oDx97yvBXFGQ73qUlMKioYy5Ya4+AxZMELlEjzROxfZRVcwAfJUIE5MwFJA26Hsc9xWibQF/e
	NTRfuDkFe43LShf0KYtsJcAdpjzcZuqpJlHHBsMqF5rbqIifJu/4FFQnQbTIaGL4nJ5x1R1uYWb
	baKBwR3YM9eXj9cLew7e76QN2rAHsrO0D5iacYMXdF1xDbJmHqOmidR0HtWD93/VbPwH0tYiGac
	SOdgKjeN9Psjbxhhi6swuED6xzSrsGuLU9JW4ZXYKEG1SMc7Gul77h5BpFwh6mdlQkEmTBMnoq
X-Received: by 2002:a17:90b:2683:b0:3a0:a055:1759 with SMTP id 98e67ed59e1d1-3a8a0f341d7mr2589050a91.40.1791389038153;
        Wed, 07 Oct 2026 09:03:58 -0700 (PDT)
Received: from archlinux ([103.208.68.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7aaf8asm57354a91.6.2026.10.07.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:03:57 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: johannes.thumshirn@wdc.com
Cc: adarshdas950@gmail.com,
	dsterba@suse.com,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mason@kernel.org,
	syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
Subject: [PATCH v2] btrfs: unwind device add when sysfs registration fails
Date: Wed,  7 Oct 2026 21:33:49 +0530
Message-ID: <20261007160349.22411-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <eb63c9f9-a158-4a70-b3ed-30046b15de11@wdc.com>
References: <eb63c9f9-a158-4a70-b3ed-30046b15de11@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btrfs_init_new_device() ignored the return value of
btrfs_sysfs_add_device(). When sysfs link creation failed (e.g. -EEXIST),
the add path continued, aborted the transaction with the same errno, and
tripped WARN_ON(btrfs_abort_should_print_stack()) while leaving the device
half-registered in memory.

Check the return value and unwind when registration fails, without
aborting the filesystem for errnos like -EEXIST. If add failed before
anything was published in sysfs, tear down the in-memory device state only
and do not call btrfs_sysfs_remove_device(). When the block-device link
was created but devid kobject registration fails, drop the link inside
btrfs_sysfs_add_device() before returning the error.

Reported-by: syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6a791c94.01d0871a.3a0d52.0099.GAE@google.com
Tested-by: syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
v2:
 - Unwind without sysfs remove when add failed (review on v1)
 - Roll back block-device link if devid kobject add fails
v1: https://lore.kernel.org/all/20261003111951.24527-1-adarshdas950@gmail.com/
---
 fs/btrfs/sysfs.c   | 3 +++
 fs/btrfs/volumes.c | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
index 39cb01ee441a..2f034689e71b 100644
--- a/fs/btrfs/sysfs.c
+++ b/fs/btrfs/sysfs.c
@@ -2165,6 +2165,9 @@ int btrfs_sysfs_add_device(struct btrfs_device *device)
 	ret = kobject_init_and_add(&device->devid_kobj, &devid_ktype,
 				   devinfo_kobj, "%llu", device->devid);
 	if (ret) {
+		if (device->bdev)
+			sysfs_remove_link(devices_kobj,
+					  bdev_kobj(device->bdev)->name);
 		kobject_put(&device->devid_kobj);
 		btrfs_warn(device->fs_info,
 			   "devinfo init for devid %llu failed: %d",
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 85ea9c5d4536..56b38f012093 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -3066,7 +3066,11 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 	mutex_unlock(&fs_info->chunk_mutex);
 
 	/* Add sysfs device entry */
-	btrfs_sysfs_add_device(device);
+	ret = btrfs_sysfs_add_device(device);
+	if (ret) {
+		mutex_unlock(&fs_devices->device_list_mutex);
+		goto error_unwind_device;
+	}
 
 	mutex_unlock(&fs_devices->device_list_mutex);
 
@@ -3147,6 +3151,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
 
 error_sysfs:
 	btrfs_sysfs_remove_device(device);
+error_unwind_device:
 	mutex_lock(&fs_info->fs_devices->device_list_mutex);
 	if (seeding_dev)
 		btrfs_assign_next_active_device(device, seed_devices->latest_dev);
