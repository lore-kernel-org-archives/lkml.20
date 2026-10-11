Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417027A916
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679387; cv=none; b=t14ZOytd9MZ7fFdsHOuCMrxeg9o4ekF5ZtOoUA3GLyt5VYGKsVvrost+5lrXFQzlviGWHafu21gaDt2gcj0mar5akPHcV7UDm5LMK2lhScuhhYt/DHtUobVdcj1EqaP6/yxhyX+Oe2OjwH5xFky1IGr9UyHz4pzscP6jkp0Ec5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679387; c=relaxed/simple;
	bh=onP3tAQ0VTAYct5snqVPYEyn/XjvxfiHDFBI93pUlr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRLWnYD1kCMAyHV73D/7iitK+66So8mlw8gHlrDaDTtQ+FpQxaZyn+wquOcb0/iWyCZdVkdCXZJ+s236jPlCSZaaiO4dmjmfS2xsaxTD1u7R6jwKH4quqLs3Dzy+OTs9D5uVEsZseAbnDfQFmMhhzAEVdF8n0J8MficgZV2EfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbAv8NEb; arc=none smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbAv8NEb"
Received: by mail-qk2-f10.google.com with SMTP id af79cd13be357-930f59d1dc6so59594785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679385; x=1792284185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=;
        b=SbAv8NEblA0jkyZWCZMj8y9vS+SsxEF7yt74RQ0s2qqgWrbx7h/Nar+95f2OOlVK2I
         Qbhwnlygbp5tw4ySAzbW2Au+1Q+3wqdECOR+TI2H388x8xR/wnxlPfdyrQBZ3gjydocL
         RFQysvFwfaXjWuuR1TETQe7mjwFh7ZxLZHDZX9OOng1iOviZ6uQbmHfu9TCETK8JkDSh
         g3a2QlRdoYs3JSRBTn21SyH7XBnjsWjnTyUPQZG2Vj1CBQFFIsMOPlCkRrcd2fiWwD46
         5e3iXI+a+0suhWEpmDQtiZh3zjkKHvS63CsbnuNSKKtMygQxkKgpamOHxpO0NV3ctQuP
         JaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679385; x=1792284185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/oAaJptKR3nQekIsHSFFz9kgi+8N/4Ku6bTVc5nJSg=;
        b=dghnhzHwwizraybwE81Sgxrx/Zw+JgvaVD5ct2qKRRvoTV8gY2FZeXahYYdyHoHAt8
         w1UZPJnyJonQjPw19Dktp4DZ1UYnBYe7Ydmm+8yF+gQdWwFZ97NZ1jtlsEyEwVH0oMjv
         G1JQp7W5YcfISTruClpH0fjWymQESgb+qo6qfZqeRLfHTP3dR/7+4dOR1yP3SFPAQ1u9
         HRdAoYKXi2kdA/grK2nb+OmNWekj9KCi7S78e3rLHh5329h4anLjc3kXQq21OF3HD9K7
         QrW+ofXr5iwOvABS4fq9p3aLPmAlIFqUWI2Z8cImKGenMGFWJrBf6GTRjQVvv74jb3hM
         8r3A==
X-Forwarded-Encrypted: i=1; AKwUvBx1IaK0P4y5DKK29Jy85yxOsJYQz0PKXipynFKlHfakEq/AcIj8ZqmxZXJFAHPYcXQ2l1N26xOis88LsTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpQ3DvLYAZNlHBvPdEpr88yYEHAKZmBwdm5ujrYelEcCOhlfmY
	vhsOo0iLf6jrJEjV9PtZjWvzTXZCs6SvdRtUsX27GoCWO5ehdXGTI7Sf
X-Gm-Gg: AYBFou1O9WNN/M6acFAsZFSqspIOMf9rzMtOfOqZlHvFMbJb57AQ5fjC6y7xOpNQnk+
	HC7uaDftYFwI2WiXFXkjrMl8OGA5G95Ee0/16+DqZlHv8UNb642N2GslX9EvHGMTeYBOmkC7TuZ
	WSwyTnZf34E+RsXXqUMJ6MyH4maSP5ZlqMjOXeiNnPYdOStNDhqCvaI1xJIWnXZZaJQ5Sb92huC
	7s/p5CPxOrho4qnA8wD8O0M2BthxSUpbGN7cyzpMzQymMOBldOWCSwoJVr7pgghbzje8meCwp3c
	X118dq6O8Lgf5JLrtJp6LdFqtnt0ljy10mHOUEAu0n8MM0CgHy8olGk+h5E7FlgRUoH8aQ00YiP
	q6dAxHyDle+GgCdPFyTgdy9B0N2S5T9A6THMCTk/5VtyJbQKR8CjKM01VM85YP71x9xR1PubphA
	N4eeB8yANt8VMzeIxlEwToM6ZcC0nV56BgQ5FexXSXENj8PA08soBo4COaE9pbTrimRz2Tcjz/n
	xlOpQ==
X-Received: by 2002:a05:620a:c53:b0:93c:677c:778d with SMTP id af79cd13be357-93ebd29275cmr999021285a.59.1791679384961;
        Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/mediatek: mtk_crtc: Skip the empty connector route slot in destroy
Date: Sat, 10 Oct 2026 20:42:47 -0400
Message-ID: <20261011004248.1117649-3-agentzoan@gmail.com>
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

A CRTC created with connector routes gets one extra ddp_comp[] slot for
its output component, and ddp_comp_nr counts it, but the slot stays
NULL until mtk_crtc_update_output() fills it in the first atomic
enable.

mtk_crtc_destroy() walks all ddp_comp_nr slots and passes each one to
mtk_ddp_comp_unregister_vblank_cb(), which dereferences it. Tearing
down a CRTC that was never enabled therefore dereferences NULL: unbinding
or removing mediatek-drm while that display path was never used, or
an error in mtk_drm_kms_init() after the CRTC was created.

Skip the empty slot. Nothing was registered for it anyway: the routed
components (DSI, DPI, DP_INTF, ...) have no vblank callback.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: found by reading the code; not reproduced. The same check runs
    on the MT8189 Chromebook described in patch 1 (boot, HDMI/DP hotplug,
    suspend/resume), but that does not exercise the destroy path (the
    driver is built in and was not unbound). Compile-tested (W=1) on
    next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index b54f8565d2fa..704931b369b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -145,6 +145,10 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 		struct mtk_ddp_comp *comp;
 
 		comp = mtk_crtc->ddp_comp[i];
+		/* The connector route slot is empty until the first enable */
+		if (!comp)
+			continue;
+
 		mtk_ddp_comp_unregister_vblank_cb(comp);
 	}
 
-- 
2.43.0

