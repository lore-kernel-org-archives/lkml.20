Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372276;
	b=V2syXMOHex8bTgrjBcO0GKSxZxOhjoo3usIwW/l9rT/WwrCheWzJ7fcpRheP8SAOezWa
	 jZ84pouGRvS91OH7GH4flGxX14L32h9uowHlqzqL/6AE0+TgRSe1wzkzxC5L0rQnFro3R
	 deMGnajsjhMZLuocP1p425SvwKhQLS4b6O2S2dGERxefJB9qbdXsqn63mwA0WhhE7jwax
	 iDImYVYgJq2ffGE8FrYwM78zsav6gqeeiL1+45V1UTaerHtS1jWsIxeuTqA6/ec9zwEbo
	 ceWIcM6UJosLSX7cJnox8L+vtbrxuXOkoPHnlEobQfEh4hbB/xfyn3wj0NVuXNUbINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372276;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6PUS3ZgH1Z6BMG/vS/12AC+79tGjk7N1RnLcpisE6NY=;
	b=n0EOJxcIGZyORZImvOjyRKjYsaDU9v9FCfYf0iKcVyBot4IxUG7cBPA1GtStNCHILUpx
	 Ur94iKA/IGufzj+eu9XfT1hf7T9Z9sEB7b6D5yifKzUH3nX7AvbOJrEsWGI+Lkas3M4yD
	 qzzFpY8kleKCYWO5MHde7w+udkCBQXST/KJ1SzhH0SQ/gROj9xF7pqZzQlYw9ZIY9JCif
	 SrQwSsR9Cg6Vqf841qc3HjcZ8C4pqR88XnjSsKPspJkvYd1ygVJ38w81dsLoPISSWoKND
	 ZFPLJwpjWSbgniknUEUSgaWOAMy2eqTjQNFvTHyG+nqbA723N7s2OKua8D4IJNC09ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wkjFCQu3;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E38E60A3832
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E38E60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wkjFCQu3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wkjFCQu3U9IR80Y60tOQdDZ4zsmIzrw/IDIiQa3HFEQnLAyTA5V0PPmsOlk3f3kj0eSt7z55ZxMK9
	 jBQnQagEzcudDsvVcuTfyojZlEDWZEzqkJxEi1DFV1gmO4XQid9SJhZWKaq2atJLF2T2lugy4ePGHt
	 seCL5tTySjXlDHwg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af3f2a3df5-b024a;
	Wed, 11 Nov 2026 12:44:30 +0800 (CST)
X-RM-TRANSID:2ee16af3f2a3df5-b024a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af3f2aa8c3-ce9a8;
	Wed, 11 Nov 2026 12:44:30 +0800 (CST)
X-RM-TRANSID:2ee76af3f2aa8c3-ce9a8
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com, xujiahao <xujiahao@cmss.chinamobile.com>
Subject: [PATCH v2] drm/fbdev-shmem: don't warn on a transient dirty callback failure
Date: Wed, 11 Nov 2026 12:41:56 +0800
Message-ID: <20261111124156.317053-1-xujiahao@cmss.chinamobile.com>
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

Fixes: 150f431a0831 ("drm/fbdev: Add fbdev-shmem")
Reported-by: syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=369ee6a6e9d0bbf14b37
Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
---
v2:
 - Add the Fixes: tag reported by sashiko-bot.  No code change.
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


