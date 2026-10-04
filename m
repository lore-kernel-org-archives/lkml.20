Received: from mta1.migadu.com (out-65.mta1.migadu.com [95.215.58.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DFC43F4A1
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115597; cv=none; b=oeDFELH0L1/XEQqJXTL6L7eiia1C798oSpNzI4adYLC+d9izZ2TYzA9OSaB0PZZgusSxXxBNRVvTOQhsfSC+7HEQ9C2KV3Xq7dVvxam4I17RDB61+sL1EVCqGyKUNZrIYSLwHtV5on8B36Z0h9mXhTklplOnWzWjcAToDixJRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115597; c=relaxed/simple;
	bh=/wDs7AqCXjro1en1uYeNesaW+AzN410aG4sQHsUGAvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV/+VuXqHz3qUuY6s/7Qyb7DpjRnVFhp0+L0n5F3hpyC9v++e5ddgvjMPWROwPqhzIUD9uZXjC4TOXl6qcmCwZjMyLc970cK3fgcHvhMejJjwy2bVTnPSgFDtpkyl0L43h2zHQO3IROBuGxtqnQg/89tD+IWws2Em3N6IZqI58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E8i1jsUS; arc=none smtp.client-ip=95.215.58.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E8i1jsUS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/wDs7AqCXjro1en1uYeNesaW+AzN410aG4sQHsUGAvU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791115591; v=1; x=1791720391;
 b=E8i1jsUSfQnOwXuXt6V7CpK+VbuW9iYfGuHPdaJZzoeMPUeU//ru0urtLHOOhzhBJ+DBbTCq
 bT9ZWTqOPgHL/G6BHl+RJKoNXrPkTQfluyg0L+4YNBipV+RHzRJavI8CRQhIvq7cgcsiUcwBg8P
 CD+mW8HSaMzrCPdOhVDHNblU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 95ef59e2b8d83611;
	Sun, 04 Oct 2026 12:06:31 +0000
X-Mizu-Trace-ID: 95ef59e2b8d83611
X-Migadu-Flow: FLOW_OUT
Message-ID: <586d0b39-40c8-4f3d-a786-c1085f87b858@linux.dev>
Date: Sun, 4 Oct 2026 17:36:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/appletbdrm: Add suspend and resume support
To: vasilij.kernel@tototo.si, Aun-Ali Zaidi <admin@kodeit.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
References: <20260924-appletbdrm-pm-v1-1-0e5432132161@tototo.si>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <20260924-appletbdrm-pm-v1-1-0e5432132161@tototo.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Vasilij Markin <vasilij.kernel@tototo.si>

The driver has no USB power management callbacks, so the USB core
unbinds it before system suspend and binds it again on resume. The DRM
device is unregistered and registered again on every suspend and resume
cycle, userspace driving the Touch Bar through it (such as tiny-dfr)
loses its device, and the Touch Bar stays dark after resume.

Implement suspend and resume with drm_mode_config_helper_suspend() and
drm_mode_config_helper_resume(), so the device stays registered and the
last committed state is restored on resume. If the device was reset
while suspended, repeat the probe-time handshake first.

Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vasilij Markin <vasilij.kernel@tototo.si>
Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
---
v2: Remove reset_resume

 drivers/gpu/drm/tiny/appletbdrm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index ef71b9957..c94ed1068 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -30,6 +30,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -821,6 +822,20 @@ static void appletbdrm_shutdown(struct usb_interface *intf)
 	drm_atomic_helper_shutdown(&adev->drm);
 }
 
+static int appletbdrm_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct appletbdrm_device *adev = usb_get_intfdata(intf);
+
+	return drm_mode_config_helper_suspend(&adev->drm);
+}
+
+static int appletbdrm_resume(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev = usb_get_intfdata(intf);
+
+	return drm_mode_config_helper_resume(&adev->drm);
+}
+
 static const struct usb_device_id appletbdrm_usb_id_table[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
 	{}
@@ -832,6 +847,8 @@ static struct usb_driver appletbdrm_usb_driver = {
 	.probe		= appletbdrm_probe,
 	.disconnect	= appletbdrm_disconnect,
 	.shutdown	= appletbdrm_shutdown,
+	.suspend	= appletbdrm_suspend,
+	.resume		= appletbdrm_resume,
 	.id_table	= appletbdrm_usb_id_table,
 };
 module_usb_driver(appletbdrm_usb_driver);
-- 
2.53.0
