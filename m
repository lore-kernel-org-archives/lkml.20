Received: from wxsgout04.xfusion.com (wxsgout04.xfusion.com [36.139.87.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C764242D6B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=36.139.87.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754176; cv=none; b=OMTtoS1D6aYxgFeCEtbZJyfW3opv5Jq7z4jmvKkcIZIOdKm3Ai3pfyIw+BcTCIKbdnPacdKuvbFtHkTfB+FKnbjhv1bO28cSg65isDEWeZWQNm2P6OYjd9NDuQtUEbrMD5QonahJ+B1ErE7qElTpOUrPdNnirPgI5LNnr2cSPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754176; c=relaxed/simple;
	bh=Cm9nZ83Xceub8x5er6oxomrvqroj+WcHkr0Pl1N+LWA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sDhP3gWaeIe5fnf06GrcdFr7y7D2T+BQu0Nc6LBWftKB19YPoAGu4mfFQmgrTpdaUNR/teeMf+D2XWvFDewPzCpcaDbFKIbo08mrLki7zAIe3/+87Iy9mPWBkiXStTtc73MN2tqIZtfkpJk0vtq6CpIxsZz79Aftgr26dZ0VIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com; spf=pass smtp.mailfrom=xfusion.com; arc=none smtp.client-ip=36.139.87.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4hdY2c52rHzBFKhq;
	Mon,  7 Sep 2026 11:48:40 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Mon, 7 Sep 2026 11:51:55 +0800
From: shechenglong <shechenglong@xfusion.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>, shechenglong
	<shechenglong@xfusion.com>
Subject: [PATCH] drm/client: fix restore of partially initialized client
Date: Mon, 7 Sep 2026 11:51:47 +0800
Message-ID: <20260907035147.1339-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: wuxpheds03045.xfusion.com (10.32.131.99) To
 wuxpheds03048.xfusion.com (10.32.143.30)

I got a null-ptr-deref report when closing a DRM file descriptor:

WARNING: drivers/gpu/drm/drm_atomic.c:2031 at
__drm_atomic_helper_set_config+0x18e/0x1b0 [drm]

Call Trace:
drm_client_modeset_commit_atomic+0x16b/0x220 [drm]
drm_client_modeset_commit_locked+0x56/0x160 [drm]
drm_client_modeset_commit+0x21/0x40 [drm]
__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0x7b/0x80
drm_fbdev_client_restore+0xe/0x20 [drm_client_lib]
drm_client_dev_restore+0x9f/0xc0 [drm]
drm_release+0xc5/0xe0 [drm]

The warning is followed by a NULL pointer dereference:

BUG: kernel NULL pointer dereference, address: 0000000000000008

RIP:
__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0x41/0x80
[drm_kms_helper]

Call Trace:
drm_fbdev_client_restore+0xe/0x20 [drm_client_lib]
drm_client_dev_restore+0x9f/0xc0 [drm]
drm_release+0xc5/0xe0 [drm]
__fput+0xdc/0x2b0
__x64_sys_close+0x39/0x80
do_syscall_64+0x8d/0x460
entry_SYSCALL_64_after_hwframe+0x76/0x7e

drm_client_register() adds the DRM client to the device client list
before invoking the initial hotplug callback. If the hotplug callback
fails, the client remains registered.

For the fbdev client, a failure during drm_fb_helper_initial_config()
causes the partially initialized fbdev helper to be cleaned up.
drm_fb_helper_fini() releases fb_helper->info and leaves it NULL.

The fbdev client therefore remains registered even though there is no
fully initialized framebuffer device.

Later, when userspace closes the DRM file descriptor, drm_release()
can invoke the restore callbacks of registered DRM clients:

drm_release()
drm_client_dev_restore()
drm_fbdev_client_restore()
drm_fb_helper_restore_fbdev_mode_unlocked()

drm_fbdev_client_restore() currently restores the fbdev state
unconditionally. For a partially initialized fbdev client this can
submit an incomplete modeset state and subsequently access fbdev
state which has not been initialized, resulting in the warning and
NULL pointer dereference above.

drm_fbdev_client_unregister() already uses fb_helper->info to
distinguish a fully probed framebuffer device from a partially
initialized client.

Use the same condition in drm_fbdev_client_restore() and skip restore
if no framebuffer device has been successfully initialized.

Signed-off-by: shechenglong <shechenglong@xfusion.com>
---
 drivers/gpu/drm/clients/drm_fbdev_client.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index 91d196a397cf..1c16bc1084c4 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -42,6 +42,14 @@ static int drm_fbdev_client_restore(struct drm_client_dev *client, bool force)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
+	/*
+	 * The client is registered before the initial fbdev probe.
+	 * If probing failed, the client remains registered but there
+	 * is no valid fbdev framebuffer to restore.
+	 */
+	if (!fb_helper->info || !fb_helper->fb)
+		return 0;
+
 	drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
 
 	return 0;
-- 
2.33.0

