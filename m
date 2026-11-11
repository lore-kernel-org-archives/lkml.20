Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368529;
	b=pbQ/K18jfiDKyLjLQibq/zmpFDoWaXqfULjrVo9K0B5XR7sS9AxVwaQ2/ADvEjxw6aV8
	 UNdhiMdBMQFv3AIq0QsWpnFt8H7F/7YunvN1+MD+4AyWL2D4zBXzg+MEWqNSeBmaHwgKR
	 vv19BvV7B5ry1LyqRBozb9N320VsfArCY2EDe1w7Ds6XvV98+TBpIzlNJeTvMyxEaEj++
	 0o9pkQ0tyvE725pxmESiY+kVbN7AHfEznsmJm/rOIizbqGbmRaPLJbFsAzKSI6I2ezt49
	 rXKkTqn9fiTyS4uzXcy5ijoAquHSRLKYWIUIG9UnN2lBaxgxwySr+uB5bw2r5zsgKVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368529;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e3gbxBaSCZANnu8ahwOXHZc3kferlHLuM/G8nh/kw2s=;
	b=j7QSKYIrcyDG3ijrhZO4idXsE94aoMlqzdJZYN25GPglvQQbM88RGwgGiBl9nOqDN125
	 T4+ArS1pHIsiFoJ8A1ln053Gh+be0qCc8B4G1kB1Un3HSqv4g9LXDkBV3MeYAk++KgMxL
	 M5GV7lwenT2qUAV9THEPcE9W9kqCJyTjW3Cph9ynqmsKFG+Qttw0v7wJuzkQj7i+CRzNw
	 vxZ3pAJGrMMafFZN0d8j1A7jY1mCpfaDFgLOlg9dFxzf9gW0g/8IzptEKHgJ94O9ADRV/
	 VkkCVFD7yQ2F+WJTWKSOC5xKaitghLsWr9Tfo+Rm/yFqRefswfYCiN9et4tpWLQDQdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tuB3xFuI;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCFF606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCFF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tuB3xFuI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tuB3xFuIzKoH1PmSbz3AjZAFJY/M+MnffAHc5HNT+5K/QtlmSLeJowd797THucyqpxIkPGw8wIR2l
	 BFc7j77VR9tyYGiUaXjXTrky1vCbhus0MkkdzGugXfPqFkGSNfq3QBFrZqJyIZPqRvAsPKEtcS6fT7
	 DNPv+aEBjfS8qmkI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af3e40d612-afa63;
	Wed, 11 Nov 2026 11:42:07 +0800 (CST)
X-RM-TRANSID:2ee16af3e40d612-afa63
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af3e40dfe5-cd088;
	Wed, 11 Nov 2026 11:42:06 +0800 (CST)
X-RM-TRANSID:2ee76af3e40dfe5-cd088
From: xujiahao <xujiahao@cmss.chinamobile.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com, xujiahao <xujiahao@cmss.chinamobile.com>
Subject: [PATCH] drm/fbdev-shmem: don't warn on a transient dirty callback failure
Date: Wed, 11 Nov 2026 11:41:08 +0800
Message-ID: <20261111114108.675721-1-xujiahao@cmss.chinamobile.com>
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

The fbdev dirty callback (drm_atomic_helper_dirtyfb()) can fail with
-ENOMEM when the atomic commit allocation fails under memory pressure.
That is a transient runtime condition, not a driver bug: the damage is
only cosmetic and the frame is redrawn on the next flush.

drm_WARN_ONCE() turns this recoverable failure into a WARN splat (and a
panic with panic_on_warn), which syzbot keeps reporting:

  virtio-pci 0000:00:01.0: [drm] Dirty helper failed: ret=-12
  WARNING: drivers/gpu/drm/drm_fbdev_shmem.c:118 at ...

Keep the warning for other failures, but do not warn about -ENOMEM.  The
error is still propagated to the caller.

Reported-by: syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=369ee6a6e9d0bbf14b37
Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>
---
 drivers/gpu/drm/drm_fbdev_shmem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 8eb05fe9b..c3fa5a663 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -115,7 +115,14 @@ static int drm_fbdev_shmem_helper_fb_dirty(struct drm_fb_helper *helper,
 
 	if (helper->fb->funcs->dirty) {
 		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
+		/*
+		 * An allocation failure is a transient condition under memory
+		 * pressure, not a driver bug, so don't warn about it.  The
+		 * error itself is still propagated to the caller.
+		 */
+		drm_WARN_ONCE(dev, ret && ret != -ENOMEM,
+			      "Dirty helper failed: ret=%d\n", ret);
+		if (ret)
 			return ret;
 	}
 
-- 
2.43.0


