Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1D43DEAD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651958; cv=none; b=g7XXLymP02L1A8a6gVEXom0tkffULwWAconx8Q2Nd90nHYmj5WiRlv4yTC97tsB5LtrBQj+vmZtS1rPhQmBa7XamfBA8PYcyrJ71kt9aWUf2OkSJ+qFhSJiRXD64LR/BMD1U+gAtfoU1Rki+kE+VNCvezXUh+S796XIptHRHW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651958; c=relaxed/simple;
	bh=cvniDiIc4764cA34CKQl6/w0r0WGSY5lKDDOdu/oDKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pphhDlkB/1Qf68j2aXF3bAtD/QqjAbNIsQad0tWP6DktS9tbrL3ozpArRE6EYHRmBqPYmcWMYWwJFIJ2ALw8Y2chiBdJkEiYh5yJq9WfOS6bPA+tBqPfS0SKQLyyJuqYeHWIwd8PQOL5QjNkTFfeT8hbftrvcq5jEBOghIaSsug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=ilGLmRAP; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="ilGLmRAP"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso1318102eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790651946; x=1791256746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rChgDG4+9LHVh/7Fh95cpWNAythLuYoy13f8pIwvxIg=;
        b=ilGLmRAPqOBK7k5WLuDEdicdftpiXadYdpaMfw+p/Qad9Ip96GFXDbsuQNb36SYEfe
         qhK1ttpwhAe6ob08aP7YX9JB5fUQDGk8x/IHbHD5n+ypJUIu3ScPI3ZtBSOy8Zzb5wKX
         A5c74BWAwkH+bZgXFDU1oT0QXj7+/BnLcr6/A1XcsU6XToLIV7YjwLNP7Z3dcLujsHrG
         643v/husILaQL5gQ+EB5n3uaRHT1Jl1m72NAIJWHedeAm3m0giMN+vYQaTUo35AgiD8K
         Kfde5SfHeZgfZST3CGHA+xSyvCNzahQ4C8FSTs+VfBff7jZ3EdA5IEUW0UPDjU0Lg5gK
         Lklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651946; x=1791256746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rChgDG4+9LHVh/7Fh95cpWNAythLuYoy13f8pIwvxIg=;
        b=FTemOXuKMQq2Z5xx8jM2iwLuDnJjunFCasgIPNBrIhPi+xhfBFLc/7rBXj98tOlyoX
         J+y3KTYo+gTsY+qCSJ/+W+qsuzqfzmICJW4df74YfkxCIRmVu4ZbYeTEpU6y5TB8SWWr
         DXIiN+mqYDHwbr2EVBGxSLizISYuxBC2d6WTIivT60dJ+RCTeXpJEcG0G7FdHgE0mb7b
         qP51wOx4e/kTsJeIOBdbf2THv6hpUTiHtku6EcR+0F/x7wuKj+RvBihAIwsPthJ3CsdV
         7r9HGjMvJj8bV74VrJELnNT4AR+ttCXZQF/ozc4TbH555ivnKxCJfD6FXcOfmbJKDFm4
         cvMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnRUHsjB/lUT8E8zA6Xuok0R054s+eUQ/5sr5eRXW7kbeNeBHQfAJL699AjBd9gM6mNubwKuruWkoldJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLud7KWX9BWfWDZmTi0017uko4jHNgUupNhzOLWRtv8yw3z0yuH
	L32F0Q3SOlZC8AWmb0So7heOWEsaoe+7RLtZ0RjNv1xIk1gb836WAYvrJH9W7pjxhQc=
X-Gm-Gg: AYBFou0q6k+qdQF02BZseM/jFc9xq6bZLwcP4lriVMfQfmhXICqAsf6mhT0vsyOFd+D
	JAbmObo9Ha3zPUhStZuG+EDJKO4bzoVa26j8Tzp9i2YSPhv8fd2cHsvy0C9WdZut4sh3P1tRJGV
	eBXlmQGADUZImISf17BwMwJkNQR+EAE7nZkW/JJtha1uyS29phyQvlkeUeSBtSZTvzVifNZJIJf
	DaHvUnYsTgyMzl74BIR97NXddlHqxfobCpigSlOhz6DnN/YYZZ8cB4gCVNnWgP3CPmXFNLBRTu4
	sQY3KMVLMKVrJQZopN2/6aEj8UVnQiJ1wZ0bb1zccMrDqVyEGPyb5Q8HBmVizeDONgyMHBkodp1
	658EWlz/YVqPSCTDxC1dGAMINX2Ez9X1KoDrpHmWroLrs+31e8lujZAs5D2EvchcBYXK9smCyqD
	JmoDwjAHRgAe90KrMfUr6Qk/e/VOb/6vUXNhf+UzqOIj7Xp2zgMkW1P+30wSoz39P2T86CaEvwf
	D3pArgwDQdfpAbrTOI+bAz6yCaw7R/N12Ss7Kkc9dzIkfv1JEecnGlRWbQi4CP5CQ==
X-Received: by 2002:a05:693c:62dc:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-34271a92cb8mr10274241eec.15.1790651946136;
        Mon, 28 Sep 2026 20:19:06 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm33740601eec.1.2026.09.28.20.19.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 20:19:05 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: [PATCH 6.6.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Mon, 28 Sep 2026 23:19:01 -0400
Message-ID: <20260929031902.88182-1-artem@trailofbits.com>
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

[ Backport to 6.6.y: used the older Mediatek CRTC file and helper names. ]

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

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-53056. It skips command-packet destruction when
channel setup failed before packet creation.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-53056
Upstream: 4018651ba5c409034149f297d3dd3328b91561fd

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 859dffe4513722..1e8052a0425ee5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -163,9 +163,8 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 
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

