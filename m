Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959072;
	b=RsJU12FsGUmzkoxGMFZIFI4dfgwRaJvR74ipF9mhAJzIO8kF+SaFrOOQaqJyjSR+0u0w
	 XD6RlX2ayvPZce1tbg8ag5eojkpjSYJGIVcQzn81uszvqpwfT3Ipcvi8Y4MliPXZM/g6f
	 yQcj3OMJ5Hp7xyxJRHMI70DNdSYT9azaobaXKxewDJKi+iucPsS3xjHNRakjAAoXZAOrk
	 4RHMf1SJpokNbXH5zXmPENkhdI/+X7mhuS6aip917t0egBMRR0VM3zM3qY8xkeSLVe87x
	 whVYMwR4I1KR/Ua/i5CQ5uw9uEFGbAr4dQnuKGrboniU0Hfowq05BjxB38V3HzNHVMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959072;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qaNMR3nruX0CYwtyHVZpUwzyiLtHlWQmL7Y9VO2VBlY=;
	b=EjMveGR0Wa+tt9/4XuiKudop3hb9PFTnb1T4GJCFnSrG5muH104+QL32jCpi92WNP8km
	 mRKPg4FsY/+UiijGQZOzx3q/Ky3wAukYKwqo8qhxKqkvPY5S7jgZldHt2scm1AdioXwej
	 ohqMfaWUnGfqcObAJpVlgxM51uxj2R1Lp0V9ZB2zoTknLEpnAhYa503dLRwgHwtIq7LHV
	 KWJyfz+73E+MZGu8iMHx/rBLy2XoDawLknnCIP3U/sxWu96IE9qpPjVV0Pkv8s7C9vAx7
	 Ume40ehg0VtwKg83Jrv9twS5O8moxLS8ViPD/4jN57LuQlCQmasU4GKYQwE3mNOoCDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WpWTbD5O;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24C5606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24C5606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WpWTbD5O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WpWTbD5O+I1qBhYxRhUoMwr1RkpnWbPp8QK3mp15S6j5u5W9JrH61xHYTQ/62/f7bX8/zwpYXkPR8
	 /whB4ZNaXWb0dRbCdwgBtc9OYRUH8k57P7iTI7rbtLzjOwXxFyjpUUv0tfkLeQGWomy8uHRRojfx2X
	 R4+l3kVYvrgHB/v0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46aeda49910d-50d56;
	Fri, 06 Nov 2026 17:57:49 +0800 (CST)
X-RM-TRANSID:2ee46aeda49910d-50d56
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76aeda49bbde-1be40;
	Fri, 06 Nov 2026 17:57:48 +0800 (CST)
X-RM-TRANSID:2ee76aeda49bbde-1be40
From: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>
Cc: tongzhiwei@cmss.chinamobile.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/syncobj: Fix fence and syncobj leak on dma_fence_chain_alloc failure
Date: Fri,  6 Nov 2026 17:57:20 +0800
Message-ID: <20261106095730.166-1-tongzhiwei@cmss.chinamobile.com>
X-Mailer: git-send-email 2.45.0.windows.1
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

NOTE: this commit is worked by llm completely

In drm_syncobj_import_sync_file_fence(), when point is non-zero and
dma_fence_chain_alloc() returns NULL, the function returns -ENOMEM
without releasing the fence reference (obtained via sync_file_get_fence)
or the syncobj reference (obtained via drm_syncobj_find).  Both
references are permanently leaked.

Add dma_fence_put(fence) and drm_syncobj_put(syncobj) before returning
-ENOMEM on the allocation failure path.

Assisted-by: LLM
Signed-off-by: tongzhiwei <tongzhiwei@cmss.chinamobile.com>
---
 drivers/gpu/drm/drm_syncobj.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index f1d4da168545..1825055e9b54 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -743,8 +743,11 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
+		if (!chain) {
+			dma_fence_put(fence);
+			drm_syncobj_put(syncobj);
 			return -ENOMEM;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
-- 
2.43.0



