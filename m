Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0827466A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679389; cv=none; b=VM4Gg0EsgV/lOvHerg/gHzkafrcK46Nur7vLHmtK9FNE1gQJYi+ZbwCF2wO+87dmtZ5huarKPlxY+ErrzoNnG+xqyCP6EZ7u8HLboEHwo0OoeRAslidYJwfiAeNxTM5QnynT62Hc0ksX/siqBOFn9Ee3/CmknROeBx7/NYmL5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679389; c=relaxed/simple;
	bh=9OE3lWMldiFmzlDic6b+iRsxMXEkwaJ3kZihjHXwH1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxVknlu+zRMe4xbarJX9/M8MQKblQODpf0fafjuD6VMuqd5mPa8A7kVK3RjTJY6dhhbGpIvOR89dCGVDf+Q78cgmeFuW2wSZDYF10PW+fH3rOkw5NcJFJbl77ZpYKOD7fvoogBoipWgUPJvh3ODKreOAAH9/G4gtJuE7THOYDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFrJ0tCo; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFrJ0tCo"
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93c3dfd105eso77631285a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679386; x=1792284186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=;
        b=OFrJ0tCossEbq+MxwCsfzcwqVPoWOm09m72Lh683dwZZ2Va12a3dSgz4iq+MmV4+2K
         w1cBh73rdmrL/63JJmJwVIYgdCl1DELtsGhFoR5MpQcG3IT4TLad3QkxT2eX3/9OWH7H
         lDRTbE4k/GXbhuDrUsnxJ9vkMEpts/7ysKXeTkTCwmQ2/NzsQeeZ9HznhQJpzg+Ifzrb
         hN8/Dt/mqVWBsE81zoCgmYFS9gkKbJ5Wfj0foodYSZZgZEnWUKbiDxHBqd6QNbDKwKac
         GmxcLNpkXL7npN4X1mJ7CT2OkEf36jiFNe3BF09fe1QrCbbtj1fn0Nou4rumwsXZuCuj
         HcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679386; x=1792284186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKMM/5NJTGuE+7PUxcL8x7aaEFcwMXWe96PcY9zklq0=;
        b=sKQJrDEvut80Xsyehg01p3157uDznW3tSwhlOj4GIPr7pwsIyI7Xy8bPJlD7WF5HIV
         8Y4qSwi+K4wNlh4TTj2vBNTm77ENe3xoF+E2967aA2ZKQwpaAymMDx2oGyKn7/VzLPfa
         47CHQql+oRE3RiefcEeNNJCFSEXXUOPH19AAYnLLig5PBCRj/G2hHrDQ04o3VSeecgkw
         5OS2EZYMi51e5X5gdclbGvR/1meq7JtcJ4gYCffoXp/Oj1FolPSMqzh+woUCbTgkB4Bz
         LR0YTHPNMPrxbgxCUAcLre5XxFLD+2EP1O0dARymbABv5AKFfydg8PNgO8LwY8jijMSO
         IFWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo6LwwhcStJ+s/B/En6zWykGM23vnQPjwIUtZVbO15LC4eifvUYD5PbPXSbNMag3PgqyCOFADq/bvLPy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1ONxeaKOsE7Ex6+uTUQ6KyBFRkaS7B+zx967vq/o2xFSsFM7W
	uxhNijeFUwXtwoBvNIgRSW0AMFHx3GiUYKlkhHDAt6ASaAi58F+pF8VO
X-Gm-Gg: AYBFou3wrLk1BIvy1U5EGZ/j1KR8oNNz49GX4TW5gjVRWhsf2q/vbZeYxEA7OGuQ+Eu
	bAmflK9VZp76L8UIJCMs0PzdHJC6eiDGGYiMFXLso4df23fnBUjQIccAOyWXudkFk7SNqJvgmxR
	jCTSLY3XKhWaUhT7u/Yprq7jzshJo/Eu5fZTT1TTDNeVA6VSg+kSLMDtLI8ocBlEhQgPlXDX4qM
	JCUy9Av+s8pz9AXDmC7VWMU/WvVakZ4IG0wdudX0GBw49VSi9U92BzfGYIRBJRyBw9mlbLtMRec
	LiNAiob0v3C+osrdFHHznBCo5QP8IStUooA4i/dJxX+yxqFIEOy+4xkadkqhsh9mo2P96YdxT0K
	7Lwd1tPeX3o47YMIRG8Hj0HZm5sf9eGLrckiIVaypedZT2m4K9Spv9gHuS+kv+jERb9WyiUyU9L
	PqIbZ2slFpk7KJsrq1J34mU0uwDcvFyuOKqt4JnpXCnwOL8+97L/wYm3HBqp/rcIJ3MVE=
X-Received: by 2002:a05:620a:3187:b0:93e:c12c:9b73 with SMTP id af79cd13be357-93ec12c9f14mr906360385a.78.1791679386387;
        Sat, 10 Oct 2026 17:43:06 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:05 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/mediatek: mtk_crtc: Pick the connector route on every CRTC enable
Date: Sat, 10 Oct 2026 20:42:48 -0400
Message-ID: <20261011004248.1117649-4-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011004248.1117649-1-agentzoan@gmail.com>
References: <20261011004248.1117649-1-agentzoan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_crtc_update_output() only picks the output component of a CRTC
with connector routes when connectors_changed is set in the commit that
enables the CRTC. But connectors_changed only says that the connectors
changed in that commit, not since the CRTC was last enabled. A connector
can be attached to (or moved to) the CRTC while it is inactive, and the
later commit that only sets ACTIVE then has active_changed but not
connectors_changed:

- If the CRTC had never been enabled, the route slot is still NULL and
  mtk_crtc_ddp_hw_init() dereferences it (mtk_ddp_comp_clk_enable()
  and so on).
- If the CRTC was driven through another route before, e.g. a CRTC
  shared by an HDMI bridge on DSI and a DisplayPort output that is
  switched off (DPMS) while the monitor moves from one to the other,
  the pipeline is set up for the old output.

update_output() only runs from atomic_enable and the lookup is a short
loop over the routes, so do it on every enable.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: found by reading the code. The same change runs on the MT8189
    Chromebook described in patch 1, where one routed CRTC drives either
    HDMI or USB-C DisplayPort: DPMS off/on and suspend/resume with a DP
    monitor attached come back. The sequence that fails without it
    (connector attached or swapped while the CRTC is inactive, then only
    ACTIVE set) was not reproduced on purpose. Compile-tested (W=1) on
    next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 704931b369b6..0bfd17f68282 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -695,9 +695,6 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	struct mtk_drm_private *priv;
 	unsigned int encoder_mask = crtc_state->encoder_mask;
 
-	if (!crtc_state->connectors_changed)
-		return;
-
 	if (!mtk_crtc->num_conn_routes)
 		return;
 
-- 
2.43.0

