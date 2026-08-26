Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A0456DE1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756197; cv=none; b=h8u9nJebzaa7n98qnOFKsY/KcRK/OFre7IN9QCmr+4xwQ/JV37L1xkQLBjZH8hQVkNJLmiusPo1E7uhzwpeDO8khoOz92f6EVibZyxNVRB38r2hwiiBTuXgBSd0yThj6pITUJo6I2j4lQl7zqOwEoKsHFwZUd1Pv+GFPCMPiwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756197; c=relaxed/simple;
	bh=UA2YNIP0lUAowa8coZr4/mp90ciLAVtHcIoTfa16sBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uyl/fVdUR2WN18YBnu5R3mPo06vixvlSxS3af+obAsbqYdTFc5LncFxWxxbgV2S+gqD9gk2NZgZS2VGUcILtx6oX/VHuu0TchgsSsYd7j11vUJvlhrEWH969u176kdXOBaWjEr9Wk0Y41BBWRU+6uQwtb5n74/JVvbYkxCRfbdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NWjvJiO1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NWjvJiO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756190;
	bh=UA2YNIP0lUAowa8coZr4/mp90ciLAVtHcIoTfa16sBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NWjvJiO1VfiXZQbseIzNcWisJa07ydu3Ykq7UCttOXQWCwK1/dUldpEiQB3qlsc90
	 Q0yod3bEXKvexGbGX/Fy8S+1L7I+FV/elf+Gl08geEUVr6OkFVUXjKpJe1fiy9Fz3i
	 xWKGk7F5ngXJx5VpA+xpXsgVneifPuz8kopbj0xgaQtNUlgqChNFwsGANkmw5Ijc1M
	 dxt12c6lIpLoany+XaLBGxpcMWt+bawuJI1ZQnAUHfD4UckJGK7HvZyEmibMarVtqc
	 Pqf3Zoa2E++h7exwy+IEFCh9GFH0XK9VnCeNLi7Mu5Mc9DcWZe/TDsn3NPFJfj/TWk
	 VDERqMXCTyaxA==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D490117E0BDC;
	Wed, 26 Aug 2026 16:56:29 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:17 +0200
Subject: [PATCH v4 18/18] drm/panthor: Add debugfs knobs to simulate reset
 failures
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-18-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=3621;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=UA2YNIP0lUAowa8coZr4/mp90ciLAVtHcIoTfa16sBc=;
 b=pOy0tD1iipteQpBM04nkUgM4dHCFYJLGzFfWba53UKptJCenua8WmdBNfMJIR8L/BR0MqH8ZQ
 XDNfNl9rKeEDt5kN6HwyriSKK2aRrbtLU+e23mEG5XJ4SQbZIEqi0IX
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

It's almost impossible to trigger a situation where the reset
doesn't work now that the driver is more mature, so let's add two
knobs to exercise this error path:

- a knob to trigger a reset
- a knob to fake an error in the reset path

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 48 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_device.h |  8 ++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 328e601d80e8..8bdc511310c0 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -5,6 +5,7 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/mm.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -182,7 +183,10 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_hw_soft_reset(ptdev);
 	panthor_hw_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
-	ret = panthor_fw_post_reset(ptdev);
+	if (ptdev->reset.fake_failure)
+		ret = -EIO;
+	else
+		ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
 	panthor_sched_post_reset(ptdev, ret != 0);
 	drm_dev_exit(cookie);
@@ -690,8 +694,50 @@ int panthor_device_suspend(struct device *dev)
 }
 
 #ifdef CONFIG_DEBUG_FS
+static int panthor_device_fake_fw_reset_failure_get(void *data, u64 *val)
+{
+	struct panthor_device *ptdev = data;
+
+	*val = ptdev->reset.fake_failure ? 1 : 0;
+	return 0;
+}
+
+static int panthor_device_fake_fw_reset_failure_set(void *data, u64 val)
+{
+	struct panthor_device *ptdev = data;
+
+	ptdev->reset.fake_failure = val ? true : false;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(panthor_device_fake_fw_reset_failure_fops,
+			 panthor_device_fake_fw_reset_failure_get,
+			 panthor_device_fake_fw_reset_failure_set, "%llu\n");
+
+static ssize_t panthor_device_reset_file_write(struct file *file,
+					       const char __user *, size_t size,
+					       loff_t *)
+{
+	struct panthor_device *ptdev = file_inode(file)->i_private;
+
+	panthor_device_schedule_reset(ptdev);
+	return size;
+}
+
+static const struct debugfs_short_fops panthor_device_reset_fops = {
+	.write = panthor_device_reset_file_write,
+};
+
 void panthor_device_debugfs_init(struct drm_minor *minor)
 {
+	struct panthor_device *ptdev = container_of(minor->dev, struct panthor_device, base);
+
+	debugfs_create_file("fake_fw_reset_failure", 0644,
+			    minor->debugfs_root, ptdev,
+			    &panthor_device_fake_fw_reset_failure_fops);
+	debugfs_create_file("reset", 0200,
+			    minor->debugfs_root, ptdev,
+			    &panthor_device_reset_fops);
 	panthor_mmu_debugfs_init(minor);
 	panthor_gem_debugfs_init(minor);
 }
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index e12049961912..82ec34347eba 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -294,6 +294,14 @@ struct panthor_device {
 		 * all FW sections to make sure we start from a fresh state.
 		 */
 		bool fast;
+
+		/**
+		 * @fake_failure: When true, pretend the FW boot in the reset path failed.
+		 *
+		 * This is important to check that we're doing the right thing in this very
+		 * unlikely case.
+		 */
+		bool fake_failure;
 	} reset;
 
 	/** @pm: Power management related data. */

-- 
2.55.0

