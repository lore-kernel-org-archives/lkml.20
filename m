Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869883;
	b=OwgQwgnYSh7MvUvGvc2yOPuj9GbuhmK1TAbl/w0dAAYGVi7imXziRKCE4BKgCG/yUdwq
	 pJFicGjNeo1obQO2RH1WIXWxxLgAxBc4LMa/C4PymqpPkKiXa0qayQrwqqg6fsWHxYamL
	 zHr3RYdlmOgFfMwmCzVbgb6ZWc1SrVc0elrCV3lQGwesdCYIJio3g/RvmFq7K04nEUcow
	 QwtWzcMxVcIhf3To66GZ2UfJ91mPMXIHcCwz1q2i+C7hshAFjyGlzQSTjTkFQUTb9kKbE
	 gqq/Rq964/g8ZAam3MfU/P+Z7xTAdzZV/7rqVDar8XoFeW23/mHV5sVYtCTioQBBFSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
	b=dollEYBC0frFWk2x9LdwTNv33XUDUjdhF8dSv+yoA2zHtzQ0Nrp0YAPpRYT00aoPbUXx
	 8cNbX8hjB8uK3VdExcES9hf7unlT8CHVBxFUjWKTpyI4PkrCJ/VePyGDSsIsFu7oZdcbe
	 5Zrx9HV9ZPmQcTsV5PDGWjBJumnpAccg/X4tYOyqL4MJCXjixYr7GFIKT4ILeJEJQ7kky
	 UoBkFzY7ySQ7L5/gEl5Y1QRU4gwqr6i33gYFZQ9tjXcCHyCCa9wyt7E60nvHJ/J/v2Wtv
	 3rn/3Imex7PQpF0IShhyIqmxY4bs2JD8WhbpLpjH0G8yh9XXS/ELhTP0i5we3Ao7U5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oU7t7yli;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D92606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oU7t7yli
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so944065c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793869882; x=1794474682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
        b=oU7t7ylijINXThW7aWPeYyWvYHIu/36pRaJyeQXj9xl7T0c2MT7uMwy6EpXd11RXoS
         9lttFVStTc3RkmBkz6PsOmudzwE7hbNe48vCXYaZ1iWej6K+2Il3jaoqapJoaOzu9S9q
         305oo/+xT6Ih+7UI2IEj9rhumv1lscoy4kucQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869882; x=1794474682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
        b=f6bN5ieSev9oy53kREInaG+psY9fDlzsLEguI+gnxucoIJ5RUt540xPjVn845/h2ty
         KxB1mMW0lZN6FzqARUa8QrQh7eWO2cpwRDRNy5NAbUR4juvyKP23gGSn6tnct/PM6iO7
         6JmRIjJQh91MXzVoU2yTvFB50iVAFPSRj2qd+iNAoJ93Mvm0jpxa6nx7ftk5Zq7hpOts
         twDdEgp6xnO7fzTmImR1lcoXH3ThDTch+X5eHchUVPSiDUHKwGZcqJ0n9f35WOpkUqfU
         eYfUOx06cAq3G87tQ1+eobN6UpKMr22y/chN5U0LYUQIt5SRWVZ+lvYr/zi2M6agY6zO
         9QIA==
X-Forwarded-Encrypted: i=1; AKwUvBwRjWytwCyc+xZNxnshOYzfeBBc4BLRb3BmfMNQjX4BssgeU9LlKRCJUSlx/KErX+J86E6W/zAfgjxpfSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLSmZVJT0ygyPKidJ2ZDgRPJ5BLD146QO4fF+hLLApNyA5MQz
	arKRZLBJ8m6wdAKoZXSr1VJMJG4RoRbGWmfUU7EuI2x8nYGtQUM6bc9ZlO7gXypOCQ==
X-Gm-Gg: AYBFou0H+ZuQm4VUUrDAT/NFYN5F7I6GUQnHkvYPPuPPbn5tYU2psafKDzkm6auWccs
	mSFXsy1nQ6cyoil20ZR7iM7OnkYsstcj/Q8aLu7cuDAoUC5X00SnsArlIFVzA+h844VqwhMQ0Ls
	vPilbYgxOHYAts63pxWsi8UFunmd9wutzL0bNHor6bT9aRbHq3H9RwG4B8thc5tpMwqplj1Pm9w
	wtmohHWk+YVCFGzEtses4jzqbMNoWXenw/mk/Ipt0izsG4aTS1Ke+pkD8oeRY7ts57oapLcRrYO
	8Y9rttcyJVOjyc9YOSWH9I0wX8dPBghXXSPV8lr0u2eJDRhJDyfxsh4TofenImwfoAiIQTEQAlT
	btLnaLvh+MmeOahFjNKx8qyD4z0rVF65DPwaqpsx4wLW7LPdqypHIxki2CmcRJsG4ZKyOBqEvgn
	VVDdl/AoI83kocILnaghN7GE6E/MlnRLgkcz9V8kK7CeeGP5vk56LIzj6ZgrH/Rx/gunWf71CA4
	+apZoG1WBOtJX2nB82fBhPAW47YjPz2kOgEMzHTLLMLAvZMdBLpegmbXd3Z6kJhFlu6IWRybpSt
	2rvorKtQ122WaIkDpk/KB2fbROwnlJYMTIIHqIWS5KpTT9CRoWSR8uHvHGA5ZpcJAPF0DKX2E8m
	fIfZGgi3xj/3l/1OxYdUsHezW/2so3AAE05PblA==
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr29105381c88.34.1793869881711;
        Thu, 05 Nov 2026 01:11:21 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm20117002eec.27.2026.11.05.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:11:21 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Validate gamma_lut size
Date: Thu,  5 Nov 2026 17:10:43 +0800
Message-ID: <20261105091054.3993611-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
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

The DRM core only checks that a GAMMA_LUT blob size is a multiple of
sizeof(struct drm_color_lut), not that its entry count matches the
hardware LUT size. mtk_gamma_set() and mtk_aal_gamma_set() then read
the blob up to the hardware LUT size, which is an OOB read when the blob
is shorter.

Add mtk_crtc_atomic_check() and reject gamma_lut with invalid length.

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_crtc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..fd9b51fd00ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -880,6 +880,26 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
 	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
+	unsigned int lut_size;
+	int i;
+
+	if (!gamma_lut)
+		return 0;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
+		if (lut_size && gamma_lut->length != lut_size * sizeof(struct drm_color_lut))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
@@ -899,6 +919,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.atomic_flush	= mtk_crtc_atomic_flush,
 	.atomic_enable	= mtk_crtc_atomic_enable,
 	.atomic_disable	= mtk_crtc_atomic_disable,
+	.atomic_check	= mtk_crtc_atomic_check,
 };
 
 static int mtk_crtc_init(struct drm_device *drm, struct mtk_crtc *mtk_crtc,
-- 
2.56.0.455.g6c5a503b38-goog

