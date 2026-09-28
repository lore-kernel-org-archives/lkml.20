Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B94CA787
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602872; cv=none; b=VnZsxi8NXNPjkVlx48a1evoMJ8XCCMTaPkcE/CUz444gHaKR5e3DmG/9YFud8UBEjj+hgO2FHSxqYUEXdGUYrS4dcHvOv9a7P+f+5nCmtC9X9OoUoiT5AsngFP0NIxx6tvLDyz34Lh/wxN+844oPb40/38cLb4Itm6ew1kSLYlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602872; c=relaxed/simple;
	bh=AM0QwFjAjPFjrrSOTsBmpHG136XV/NO92s7s7PSURSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aaRTTOPT5QhE+nw2+5u0KSFx91lyv7LMwQxF3cPj7nFj+2xc7p6yHDKpDmb2AY7wRYhzj9CCrrlmwBQAaWMsk7S8P726S72rgRIff2/3cgDzcd+9wXEZRQU0yO9hCfiAZ6HJ5dY0rsF6BNW2cBSGGn9Ld88f+R0qnjKoV5CH6S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=WFoqRQ27; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="WFoqRQ27"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.109])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5d6f423;
	Mon, 28 Sep 2026 21:41:03 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com
Cc: mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] drm/vc4: drain GEM timer and work on teardown
Date: Mon, 28 Sep 2026 21:41:00 +0800
Message-ID: <20260928134100.420-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e83f5e5503a1kunm58e8e81a20017a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0gaVktJSUMYQklMTx5DH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VSktCWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0
	hMVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=WFoqRQ27TA0QYqdKjs6pFXFqSsmtGODJ0JakpxmjfVvhtgZ1VLJMk0FESxS6nQ7gwWaFlqGYK3yP1FxEdp0bQTJl4//WXNDmrS7wQROMqlcltTFDrRnDrjrQdkPzKHDRJxu340KtuOESoSOE6B3ml0OBqxerfBgBuW7Ia/dowBs=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=l5uc3vlrnJc2pqK+XNyvRBjLb9PdsYhHTUaTOSqOxyY=;
	h=date:mime-version:subject:message-id:from;

The hangcheck timer can rearm itself or queue reset_work, while the V3D
interrupt queues job_done_work. vc4_gem_destroy() releases state
embedded in vc4_dev without first draining those asynchronous callbacks.

Shut down the timer so it cannot be rearmed, then cancel both work items
before GEM state is destroyed.

Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index e231c906709c..2443b62df89c 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1194,6 +1194,10 @@ static void vc4_gem_destroy(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
+	timer_shutdown_sync(&vc4->hangcheck.timer);
+	cancel_work_sync(&vc4->hangcheck.reset_work);
+	cancel_work_sync(&vc4->job_done_work);
+
 	/* Waiting for exec to finish would need to be done before
 	 * unregistering V3D.
 	 */
-- 
2.50.1.windows.1

