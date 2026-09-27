Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1EF3BF692
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495683; cv=none; b=VUn49kOrZWrB8bXebSpp5eot//tRZ6GUFqU5ZghzUjAREYiTUcoVIbNukd0dUSZxoL4yWAmHlJa+dsg4ORJyGRz2eTXp5YpN4Kot6hLjzwuNh6suVEljS7uqPYZfh1R8oP3oSVEYuW91VeG8tGkonsjyGRCrYlQSFPXHqjDYlDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495683; c=relaxed/simple;
	bh=IGTw7cpaA8o18EKEwX+QiaExhRaxJ2vai2vQzvv5R7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nn2Jv9QuyoXvNrcmzqEv5lOkL+ONvYCRGQF5cCBSNXEHLnhLXgwOkFHgObgncsf2NA8SE9YYGwe+50/BASQwJq4u7tYL+Lwk9r/IBcDaHz47XdA37t9v0aTeGjlmzGpMjjiJP0kZFHrC7DaZZaMktR31sqcNEHhiuizSB/XBQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4iZ7WIG; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4iZ7WIG"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0df0bb2d6so591611a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790495680; x=1791100480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjwFwUue96fleY0pohUkbrbEGxywxs4gaD//2C9cu0w=;
        b=O4iZ7WIGNgCdr/aCOjqlfspt0Zb9tlYAwMFzJ/+aMO7h9LpNSjpsWwa8XHWsRvUymG
         p9RZLaosQPNHo1NyK7GWGgx8gYbry4mceJ0L2S1L9VOYDFjWt7MedPmZc4q/y3gT/1/P
         8F6vqlJLI2xjOh3mFyFn3Of0Tl83LmQJx0H3bdziUsWWyNO5ZAh3tdk76RLZADSVPNzO
         XSgge5tUGJXJ2fR9MQ1WGT5Nn3B59m6ntd2OGhu1JpY+m/mjCRhTI3UTkhrOuEQY58XO
         P69GeQFNC95F9efSBAmG7/ekvnqHyigHzCjucgCvxpx+9TvszEfaBAVlug/7czn2P3Hl
         6O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495680; x=1791100480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjwFwUue96fleY0pohUkbrbEGxywxs4gaD//2C9cu0w=;
        b=J1VAhu2Z/eNE8kiUAFYDauOA4fRyYy0TuUag7M120YcJm88p5rDTp0LgzZr0VjnFMg
         l2agE7Q+Y6IQJmIFEA/v1NPY1gWr4st6tQjNBEOrRks+aEle8fcmvf6Gw3GBsuD+z8hi
         2xN6P1tMWvJmtfbUa3ceUI+oHPbMxUsl00vNpIEb6+KAmKA4N15RABaiaFZikQslLBR/
         I4yr4Xf6qHCYKMn37n8UVq6hH6jfnefhg3Z8gvWbmfEiKaddfV2xB6x5DTexuMfoA1fm
         Pp4mw9zAbPKjpXxAW8KHy64TLLRvT7F7ckVEMwVCQiRrReSSNrQIIaB8xHtbza2Kx/gY
         3KHg==
X-Forwarded-Encrypted: i=1; AKwUvBzqy1dD+Y4dgEKjl8WLHVfGLK7BwbSpiMPMqX6dHrFTgXGn/CfbYjfaB5l5Fjh5SMb7j5tTKMVEVs7ZuvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4ak35A12zGHdlHJTn/B4oWhCsjEGDCPJBTW2PbZpcSumoF3hg
	KVHuLCC/LmLdbs1PaHnh50PHKQur+hpHRBsCxcvyWtw3271E0XBHswb8
X-Gm-Gg: AYBFou3IXbH0N8bwzVQcuz9BO39O3Psfgxtf14JXw6Z9ERJoX07so67sgdLo1h4gCkm
	qhEn6FMrsxFvdV4n1n4AIldphX6zEBOQx5qOXPSGC1AjfwMZ0NNPtkAkfAkFk3EpC6dcNmP2PKh
	KOmrxpCI0RKZZWNGEbdrPIeaNFrD9+n3jWIDkwPrxyW9mY7Xlo0NrpLJQ977obw5DWhGC/7Q8Tc
	OV8ZPOMRxeOSfUshrTu4jv8gf6VBXiiFZg8ZF6osvHD1JMDdb6FxG0ChJsZM/fUVMHZ2rdtONFL
	AzE9tz4wqVL9ChseRnR9buBaLym8toIab/AxfU97sM1RR54LdXH2pcfyKZ0w17J9lB9GoyhIqCM
	QxcUx3OYqjpLIAMKmNFCHni4NIGFsbZFFY8jgbFmK2UKeun4tbW1ZZUdqDfQE5VdBIjjzkyiU6m
	RUdutY7xi3cbf03JRxPGz9s7FP2wcJUKXEA4/IpxUX0Fr/0VVMyPK5e0aFCGW7znWyzjbL9pjBh
	s8A0E8GJ54E8BRN
X-Received: by 2002:a17:90b:57c6:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a09853a6cdmr7064156a91.2.1790495680466;
        Sun, 27 Sep 2026 00:54:40 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm13771287a91.2.2026.09.27.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:54:40 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+ca23c8570669ead78867@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/fb-helper: defer setup when fbdev_probe() fails, not just on -EAGAIN
Date: Sun, 27 Sep 2026 14:54:34 +0700
Message-ID: <20260927075434.72658-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__drm_fb_helper_initial_config_and_unlock() calls
drm_client_modeset_probe() first, which already fills in each
mode_set->mode/num_connectors for every connected output, and only
afterwards calls drm_fb_helper_single_fb_probe() to create
fb_helper->fb and wire it into those mode_sets via
drm_setup_crtcs_fb().

If drm_fb_helper_single_fb_probe() fails with anything other than
-EAGAIN (e.g. dev->driver->fbdev_probe() itself fails), the function
bails out before drm_setup_crtcs_fb() runs and before setting
fb_helper->deferred_setup. The client is left with mode_sets that
have a mode and connectors but mode_set->fb == NULL, and nothing
marks this fb_helper as needing a retry.

__drm_fb_helper_restore_fbdev_mode_unlocked() only skips committing
when fb_helper->deferred_setup is set, so a later .restore() call
(drm_lastclose() on process exit, in this report) commits the stale
mode_set through drm_client_modeset_commit() ->
drm_client_modeset_commit_atomic() -> __drm_atomic_helper_set_config(),
which hits WARN_ON(!set->fb).

Mark fb_helper->deferred_setup on any drm_fb_helper_single_fb_probe()
failure, not just -EAGAIN, so restore keeps skipping the commit until
a later hotplug event successfully re-probes and re-populates
mode_set->fb. The real error code is still returned to the caller
unchanged.

Reported-by: syzbot+ca23c8570669ead78867@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ca23c8570669ead78867
Fixes: ca91a2758fce ("drm/fb-helper: Support deferred setup")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (KVM, x86_64) with the syzbot C reproducer, which enumerates
a USB device over raw-gadget matching drm/gud's ID (idVendor 0x1d50,
idProduct 0x614d) then opens the resulting DRM node. In our test VM gud
lands on a different card minor than in the syzbot report since other
drivers (vgem/vkms/bochs-drm) register first, but retargeting the
reproducer's open() at gud's actual minor reproduces it directly on the
very first probe:

  gud 1-1:1.0: [drm] format XR24 little-endian (0x34325258) not supported
  gud 1-1:1.0: [drm] No compatible format found
  gud 1-1:1.0: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)
  ------------[ cut here ]------------
  !set->fb
  WARNING: drivers/gpu/drm/drm_atomic.c:2031 ...

On the unpatched kernel this isn't benign: __drm_atomic_helper_set_config()
warns and then continues, committing an active CRTC/plane with a NULL
framebuffer, which escalates into a NULL-pointer dereference and a fatal
kernel panic a few lines later in our runs. With this patch applied, the
same gud probe failure (ret=-22) still happens every time as expected, but
restore() no longer commits the stale mode_set: no warning, no panic,
clean shutdown across repeated runs.

 drivers/gpu/drm/drm_fb_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d4664ed468b2..0817b639b3fa 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1724,10 +1724,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 
 	ret = drm_fb_helper_single_fb_probe(fb_helper);
 	if (ret < 0) {
-		if (ret == -EAGAIN) {
-			fb_helper->deferred_setup = true;
+		/* modesets are probed but fb_helper->fb isn't; defer restore too */
+		fb_helper->deferred_setup = true;
+		if (ret == -EAGAIN)
 			ret = 0;
-		}
 		mutex_unlock(&fb_helper->lock);
 
 		goto err_drm_fb_helper_release_info;
-- 
2.43.0

