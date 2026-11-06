Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961587;
	b=cSRhk73zRzHH+l3X13uqAEWMyMPzQcL8AgY+fyF867D1rsMUDQDYpJXFIlKd4cWNraKx
	 Fwd2tqkjZOHdXUC1X+W8/heAvC08Z9RtbTVvdI8Dbl8tsf704xTUf5v7m5DoMYnUqiEcy
	 kUYMPimV4azdZMXMYmAVG+mqbhW/qDn0U1gxMSk4j6gamZNjucEsRfUVPx6oubPt2EXz2
	 Mfl1Qf1GixWkqrN8pbp2FD3r8+Zh7SPspok2dohmtOEKCPNdrgYvJ3GUaFfZVDKCHrnW5
	 s1efW+lwT6Kt7FetpvOB6sSE4/IvPib3NdjLdowt+u4mJkfZA/7W/N10NhmsaxlnhWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
	b=j2sMlM0YmV7o5L0T4AhWc8UYyNTjYKktGttsLA3WW6+ASGgvL1Dblg4XRAWfWm0RMC5x
	 5QmGAfsmAFRfRdjqwtDYuD7YF8Bzjm6K2PjRNrO5Z+SPAWzmNRYfpu5330Sr5mAd70o4G
	 jgB4OT7QHySrM7v6Z0D8yb0cHEleZ9TBnA0kmgIq4Cnm3r5RRg+oOgipbpz4Jyc3s4Gaq
	 MsVYqk7/Mr0wsBcDW8d3r8dsrurS+D25YkqBOZ6T+ILc3NHxpPf6SrElUxE09IT7jf4lv
	 tZG9w9NkDT45CiFV0lGm4IBD9v8vJpfBq9R8RD7E1dQjWu6YYm03BVJqpGausDXq6BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CD6HQJMq;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4141B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4141B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CD6HQJMq
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so682720c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793961586; x=1794566386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
        b=CD6HQJMqheJIH4YmuT2N9CwPbnpSL0tdIXeuDKinIjKbxuQGbtjfelVG7xlKj6r/JE
         BT32QJfAQwe0wAap1q+HW2+fe/Tefc/33L5NGrcHXM0EoQclAnpXNIMu/hs2OJ2461Vt
         eO14Lq4wlWqUHJM7iqqUqNvNgWMoI3nRbFNjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961586; x=1794566386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
        b=d/w3h79QaZuU8tnUKr9e2T2Zu2Tt4PqWkdJDm1Cnz+a+3bjtTgb17GF9ACTfcAY02+
         AAFRuBTzwMHNfmdAq/tdweAvOrX65mkWqIsmYwpBhKIO/HjimA9uuoci4B8iJHYk3vGa
         6muj0c5GKtg54GIDY1MfmiNwrPLZBCpyxaZMgSRa66mHv+Sv8oLRcNZQh0dN2WPBGCsa
         3ri8qptGUXTb/Q/Px8YcbqcbCqVGvfEHiy99g0dFCQDzoVs1owl6A6a8C0GQCKpP5uAp
         D/5rc0CpGXy1oqduRxNTvoY9IkeRSUNoClDPESRO763CWkIz3ocVTvCTh/ikNSUI+LrX
         IQQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIwDXPQoKpOqkLsrOSJfP6ldXox7cKERItotdhFhpj/GS3SO2V0oCNjN1ofdAW6DtKQSalkPHXVCVSLaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oA61KC40tV6tJZ4+t774GUWniIxi+qztbIPOgWcHjM4BoYCkX
	BRH2QS17Niikrl4KFGURNpcqeY4SnsBT2oWxqIvUq+z38z+ZVJ9s/2dL7U3BIoTSaQ==
X-Gm-Gg: AYBFou0pw7moOTvSvc/ezNfaG+pGdwwP3qrZjSlFONv+pqC6EwyIp+19w2ub0c1gobt
	f0JS/TLbXfd2qzFFoaDYo27PO1hdsHgsk3XTaMeB9LFhvZuTfGJHUywRNcrS8Xfh+SKMI2DDkBx
	aIHPwWnUZ8nVra1cQ4JJiudQRnq6EjXj6tcFLSxr9dmkdZK5/y+Jz61Gw2H9W5n4rMgQlrLTSCx
	aC1a44HV2/WIBysgb7gCv7+sxCoaCS4Sv2jmNnneWjZX4HCCj7fhBXkF5tY47g1z0Za1uqAO+jH
	yguhe37zSbcDgqb6q1Q4HXFjhDyXekiVWJiyL1Jp2J4AMbSEb3xes0tIpNCu8NsUCi45IO/A+ww
	3su7D+KOdBrNDJ67VbtXFz+Ca1M1Gb0qol7xDBWzA/s8MgVu6vS94gN6yvH2pCNHbkmM9b4Uk9Y
	MNHbve3p2+dzkHFnoxkcOt1tmdSaZrzk4bwKXsCW7rt5b8TAq3EQEYXREP3Psrihu+QpvKaM+7m
	0do1jNslngP0YaDiAxp1qew2WLhVMWsmaC7i4HjsnyvRW1Xw9OrZbD2ZOM/++jdJN4vUPrn2D/l
	FHAOhMxPmXc+Kg1XvSrqsQ5oAN2S/Lm8KRiNtQQD4kujTJ2TxE2Kf5LqZ/+DZbdvGyDSlFh7HbF
	wzATzgijI+yqmneBy
X-Received: by 2002:a05:7022:fc0b:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b25d315d2emr2054258c88.12.1793961586179;
        Fri, 06 Nov 2026 02:39:46 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm5133779c88.14.2026.11.06.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:39:45 -0800 (PST)
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
Subject: [PATCH v2] drm/mediatek: Validate gamma_lut size
Date: Fri,  6 Nov 2026 18:39:05 +0800
Message-ID: <20261106103932.1219696-1-fshao@chromium.org>
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

The DRM core checks that a gamma_lut blob is aligned to
sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
shorter blobs still reach the driver. mtk_aal_gamma_set() and
mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
read when the blob is shorter.

Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
not match crtc->gamma_size.

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Use drm_color_lut_size() and check against crtc->gamma_size, which
  mtk_crtc_create() already sets for the pipeline. This drops the
  ddp_comp[] loop and avoids the NULL conn_routes slot before enable.
- Move mtk_crtc_atomic_check() before mtk_crtc_atomic_begin() so the
  patch applies cleanly both to linux-next (next-20261104) and on top of
  the mediatek-drm restructuring series.
  https://lore.kernel.org/r/20260714114414.184512-1-angelogioacchino.delregno@collabora.com

 drivers/gpu/drm/mediatek/mtk_crtc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..67c2288ab8e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -841,6 +841,17 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->enabled = false;
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
+
+	if (gamma_lut && drm_color_lut_size(gamma_lut) != crtc->gamma_size)
+		return -EINVAL;
+
+	return 0;
+}
+
 static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 				  struct drm_atomic_commit *state)
 {
@@ -895,6 +906,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.mode_fixup	= mtk_crtc_mode_fixup,
 	.mode_set_nofb	= mtk_crtc_mode_set_nofb,
 	.mode_valid	= mtk_crtc_mode_valid,
+	.atomic_check	= mtk_crtc_atomic_check,
 	.atomic_begin	= mtk_crtc_atomic_begin,
 	.atomic_flush	= mtk_crtc_atomic_flush,
 	.atomic_enable	= mtk_crtc_atomic_enable,
-- 
2.56.0.455.g6c5a503b38-goog

