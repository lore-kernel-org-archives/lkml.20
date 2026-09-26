Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6C3812FB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440300; cv=none; b=YRkVjc8ZPiacxdbF8xDuH1q6uzxRs5m70o/STR31/Vb6Rs58ggxcwV7UJQyhLNrM0d9xy2Eh3XcZV0Ljwcy+stRYSsA5VxGpeD3c8SSaKmpS0v+xWQKVaYwEb0u8f8zzRVAQPihs9EbqJbk61NPkwVKl1cxGq0GLA+XHaCdJzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440300; c=relaxed/simple;
	bh=rlxFcGgeJPs1ww+AeSrKhOhmgDqoyNKGjcG5mzWZxKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jC3DFO3XCcFNeWzUKvIgVk/ByY3vEEmvQHLPawef04uB/6yBKsv5NehjOUlaJT3p9qkApa6C0Nee6zvgD0bbvE4cpv0KVZinIoCfxhuyaiupyvO1FbcXitatd+O31FHa5GjBMJKkntQoTJINiyMHGkUULdduTd9QVw8ye4hu8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWJy7Kdq; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWJy7Kdq"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332bdd8296so7308191cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440294; x=1791045094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKaiZuCWzgj/35GoC92DyRMuXF3uBWzJWZETTYPAMUo=;
        b=HWJy7KdqExvWCGzWG2Lqg1bbg0+aInKcjCNqxD7XwYeGM7xH9wsIn+lsDiumByJhq5
         OEq9Z2/NwA3HKBvgmwrXr0u6Sz+1NbcGvUUB14ZS4dRJbNpYZ9GT2k+jXcQ2u8cB2i0/
         oP/OwnnYJ38I7HgpgOMsKPy+KiMFeBWPX9so69N5U0M8PLRNFDk+JOv8ecokSmgJIEO1
         EPjBD9POWjg87y3Jt8oYgkpf5mnofRg2z+liVw4hG4tjGEHzD+iElICGWsS119G1TBQe
         zvJ6e4puM/R35Wuh0JJEA3RDqAQut7h7lVRx6x8X2Qaaft4GLdYNf5a0EXS+aLL0ZAPI
         9JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440294; x=1791045094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKaiZuCWzgj/35GoC92DyRMuXF3uBWzJWZETTYPAMUo=;
        b=ijunyZ3dFeZouROUkt6pGPoAdwJL2t9vnj3f5SovWhT773vJq9kz17P4iqJ9mnEp/G
         qrXYwwgRy6d/kEArESDbdUTxLEDpMO827EnPPK5Mxg5O04K0RJWShsHcaAa2WHQr35zN
         nLLFH9ksnbvOU3grW6G6I7M8Pgr7Bzm5+VKXPE163Q8nsW6hC1qRzRTOOK0Kwlor82dK
         Wr/cps1BPerpI4KtZEV5JkBTM20VbMNAVMFA0zElCAqqLSmvOyPYYK8kmp7jK9nn0Tcy
         j0KIAmNqJVsQSOVP2iCgCRpnplDH7kN2+a7CCjdzIdGcob3mugYpsOgYec2/1V300gFi
         OuDw==
X-Forwarded-Encrypted: i=1; AKwUvBxjKld02ibFbsuZ45KQ5QSJM8lHRft3oAkJJLQ7Abv4y8AH0e2g6ZWtlUqCTTGwO9ZyBLiTbVjNQF6rfoc=@vger.kernel.org
X-Gm-Message-State: AFuF++nV+GIcyM8JTw1hLOLEcQC+aZK67Fz1Hapf+KvN9BAyHHiIV3W6
	QcOaZzrqjpW9SeeGJn8Adr+pwmiI14HYFwzOL1D/odIdVyOd0Zd90CEA
X-Gm-Gg: AYBFou3RyRK9ydrfKM1FM8XpExaTAzo3JxLdAl2H4YjnpUV/QYNku7TLto85Vlc+cmb
	8Cduyrml5YPDHvUlCtwE9BTJg5pPzNVvecrKu9aZs8UuYnG+5KteGNXEAk1pZmpu4cm/kI6faUG
	ezxGUyMIVxHZAMrC2IHTXc/06k3KfemP0/LyCj1nOaESQhnijTt2OBaB1hU0KFjbafP6DWndtJb
	3LmQLnXAuW81pwxx8H4ZWtawP6cWYq9rLk8ItAf33kiLBous1Mnmscr7I2fKX2xBV8N+zZruunP
	KYKkSh1uNNMHz1th2Nlp1P5luPkl5bcU91YVCBu16J2hg3acKcfJda/0J7PTG+ifuztJDf0FZ20
	313ylS6zWtuxmv9qdUqCOXzZu9zjNlip9gWcJjdIgFuT2HTYmPX9CXlI8yRngIkrS5ZkJQ1nYNL
	qrP/QnjSsYmoF3J3mbMHZ/nTGRgLOW/abdY+rXnISHpPmxS3ZbNSXb9vE8TK+Gc0nBVPXDahl1H
	c+2pZj81M1mcFah7Lpx2LiH0zd4qQCxPMWbcLM0En/8bsOmnevLV38j7R5h4YvH7iM=
X-Received: by 2002:a05:620a:4686:b0:93a:2e8:5afa with SMTP id af79cd13be357-93c43ca5e78mr1028604385a.30.1790440294481;
        Sat, 26 Sep 2026 09:31:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:4040:29f7:9600:f571:6178:b590:34a4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c4fe09037sm341332385a.27.2026.09.26.09.31.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 09:31:31 -0700 (PDT)
From: Dillon Amburgey <dillona@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Dillon Amburgey <dillona@gmail.com>,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	christian.koenig@amd.com,
	krisman@collabora.co.uk,
	noralf@tronnes.org
Subject: [PATCH v3 2/5] drm/qxl: wait for pending commits before applying DirtyFB
Date: Sat, 26 Sep 2026 12:31:20 -0400
Message-ID: <20260926163123.39217-3-dillona@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260926163123.39217-1-dillona@gmail.com>
References: <20260926163123.39217-1-dillona@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The modeset locks protect software state, but a nonblocking commit can
swap that state before its hardware updates finish. DirtyFB can then
race primary-surface replacement and draw into the preceding surface.

Wait for the current CRTC commits while holding the modeset locks before
checking the primary and issuing dirty updates. Return wait and lock
errors to the caller instead of reporting success.

Fixes: 9973c879cff7 ("drm: qxl: Atomic phase 3: Wire up atomic page_flip helper")
Assisted-by: LLM sparse
Signed-off-by: Dillon Amburgey <dillona@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 1f869734e14d..51087cacff74 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -437,10 +437,17 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 	struct qxl_bo *qobj;
 	struct drm_modeset_acquire_ctx ctx;
 	bool is_primary;
+	struct drm_crtc *crtc;
 	int inc = 1, ret;
 
 	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
 
+	drm_for_each_crtc(crtc, &qdev->ddev) {
+		ret = drm_crtc_commit_wait(crtc->state->commit);
+		if (ret)
+			goto out_lock_end;
+	}
+
 	qobj = gem_to_qxl_bo(fb->obj[0]);
 	/* if we aren't primary surface ignore this */
 	is_primary = qobj->shadow ? qobj->shadow->is_primary : qobj->is_primary;
@@ -464,7 +471,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 out_lock_end:
 	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static const struct drm_framebuffer_funcs qxl_fb_funcs = {
