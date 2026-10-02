Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D613859FC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970259; cv=none; b=Nrq7nAQZ5wonUQAQyyRjNUlyRXrF27cjyN/HgdSpmvxChv3fQyfxajVGG3ku0ffLSYHmGwDeC2pCQUuYyK49YWeW/gKf/aruJRzIR/L4cI4CfvrS5v522T1zGh9D5j8uIZPQlM1trosHUNrewTSydsNB+hmB9+MLtkBekqFnuBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970259; c=relaxed/simple;
	bh=t0hrpueYkVfKYyh59jcz88z6nZEgP0q8WK73YH6TaaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ki2rrb8/aSBmVO/l2R4rVsChcXcwI2A32XcjJSzwz8KM/4cDsfcv1HSfS4JBbcSbIC0yXSGB5XmAOfpCnmm0IXceteYiPSI9qeD6QI/c/Lm1wHWBb5Gsc+GOhvRyYyNhGIeeMLErWbTW/4xsPPD4nv7Oj2tTKSc8L6Cbn/azfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=I2yaIzFa; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="I2yaIzFa"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso9839340eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970258; x=1791575058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=;
        b=I2yaIzFalF3ya3kIw8l/P2zhDT5cL8dvSeacUIC6QolQr9lHq5jzvdm7cAcWoSNeqT
         99mnfZZmmZMUe6iRbzqPz4piUZk0LYfZGvbPjeHoPMWxU3u47WqlO6CN5KAA4N343Dz+
         bWZxd5Y2YySIjYSO87rIppolohGm7tgbwkNi5auafowVhdqQirZmFu3Fr+y49smsHt7L
         43HZS+xyoXYWbZs6VXS5KLZQzNBzGN7Uf7PjJ1sBMmzQDsllr4fAlkNyT0pGteMoHMZO
         J4sk4xquAvWiko1q/e43ywz4HrN97UJi2ZT7wQEK/q1cklO+69cepoqRj3Kof4NI1MeJ
         AI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970258; x=1791575058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rko1U6OoJC3n7W8qpIuhWiCDlnVmuYaiccHeKEGfF6U=;
        b=jbrTgzF3P8nlb7DDAt/cYirv+RlCJTYGQj39+LXJ1RYQy4hyfAMAlenqyV24K3nNka
         zQBsRjYacxFdtrLsurv3dE/lDLhFtngBghqogrkWHO7JUF34eN4qwD+ePbWa744H2th5
         yYgZXIJ1s/BVhYGO30uxv1OhZ/MIhfrsLerUVSNYU8+Zsjm+iB6dysHd2OuzvdfEt+0/
         16mprZNhCqroQY5A+rckeRHv4zCrB/l3mt0M2XH7AuDbkoJpdMlpxhNlyKvRvL+JpEYZ
         xUUNf79VbhasUuLx8x41Wsyv76ATjlcmjioG+Qj3a+wi6M5i7yc44/xI23F6UjIx1qzt
         eutw==
X-Forwarded-Encrypted: i=1; AKwUvByvmX2bN7t+mwOXHTYIE4VpHHjKv/RuMR1Vt9b7/TygDw3hicuISGKLDRDuhAzYSNgKepaD9pHc4YnNZWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kNLW4ChUux1lTBpP/dtYhLIL5KMZHTkX7IEFiAYcUmMT/K3Tds
	f4Bpzq67ODjzn8NbnOPUwc/H+4H/Fb895GMNHkjTeYXpkgqndRabzkuA38MIG/yBpEU=
X-Gm-Gg: AYBFou25OrsJRAYAbLaElseeEL3XSCsUMNXaKgMBIGqVy0hF0ELKpJBKk0dQD2tO0H9
	xZGG9WYjDo4xjLqMMOpBOZRz+HcuYWXRoHLHzVDt0+qMADdjQu6/06c0IjjwCXheHmh7Gz+tAIr
	22sM7nFhVODDzHcmgPuvdHKlfR5UcVHDNHfbVYSrEPXOotsG5IH5e4Qyf4hpBrnsbiLOxmP7Txf
	VrFx0Gc70EcwFkYPSrRYGS5AavoVQURz2ybJzR17AJfsOQshsCXg29MV1x+UDH5e6JR8jgwM+oV
	5G53gADN37Cee1+1j4rc72WrToD4d6KMMFIsA25av0HvBCBxH+GUSJM0jKRLe1VKYDWky21OUzw
	tpwqpd8xUn6Cfs3HfW3rJpe1bOhiuhbqN5p3TvJc0ngMTI5hIZCc0iUuShOAFFBtNk1ZiozPfjj
	3gHwgud9wL2Z/PlkZkuSadSlY12vCvuR1cqX/If9KakklYaG3QaTOmp2eUatIwPdr8JzZ+8m53y
	OhhzZacjbTCW5ZZOp8p41URuGHGgOJz1NlP4+hgWF+/SQ5Ci39NBNRCWKSvDYFbV8NpD2Q=
X-Received: by 2002:a05:7301:4545:b0:342:94b:aa28 with SMTP id 5a478bee46e88-34f219610a0mr4295623eec.27.1790970257502;
        Fri, 02 Oct 2026 12:44:17 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fcd065sm7236803eec.19.2026.10.02.12.44.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:44:17 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: [PATCH 6.1.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Fri,  2 Oct 2026 15:44:12 -0400
Message-ID: <20261002194413.20810-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@linaro.org>

[ Upstream commit 4018651ba5c409034149f297d3dd3328b91561fd ]

In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
we do not call cmdq_pkt_create().

During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
is NULL first before calling cmdq_pkt_destroy().  Calling
cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
it will result in a NULL pointer dereference.

[ Backport to 6.1.y: used the older Mediatek CRTC file and helper names. ]

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm mediatek maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-53056. It skips command-packet destruction when
channel setup failed before packet creation.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-53056
Upstream: 4018651ba5c409034149f297d3dd3328b91561fd

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 59b310f7327c86..8e72b3bb51eb94 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -161,9 +161,8 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
-
 	if (mtk_crtc->cmdq_client.chan) {
+		mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
-- 
2.39.5

