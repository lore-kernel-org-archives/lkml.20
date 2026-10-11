Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89AC1F5825
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679386; cv=none; b=i/57JJIRls+ED708Z3XeDpHIvq1SRJ+iabkqiNBuoJpOpgfpraE8znY9tQqDjiyXvU2388dUbivpHVUGinsZ95oZLaSjCAyKz8SF5FuiFbrRV4MJlolxE6Us7k7/vceF1UCzai3BA76EBI04N1Y0/glmteqBnCqT+3r++DffEyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679386; c=relaxed/simple;
	bh=lQC1TkEjDUks1LsmXvudabJ4bI0Y7kPPi2mpymk9Ow8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKrS2EYx+DmIYg4w4JZiXtADTIBfwaCyx1Vp2DcQs/KVnUu5DIMGJ08HO9QADGxMUVmGfXLWoWxMhWdPrXfX3gLiExDBt6OkiBhQYiY5aR5XiiGDUGK3uIIqb5c/C9ZCRr8XmsnEPI0rd18eNBysdVp4uytm8aJ64RVYlhsDe30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E72FKD/S; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E72FKD/S"
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-9367f27ddcbso81458585a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679383; x=1792284183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9++rHuAww9Im2B2wfP7togskszZqup/CYoTLkYiciU=;
        b=E72FKD/SmyUpFQswdjDK9v4myMs+feHchqUbHuwWqd2jeE2KHFc7fFizDja9g4yHXv
         1TSrTY1N0UNyQpmEcAAxfdEtInyx2ULT03xaJZcc5d0nZOR35ghQgee/k4jZ4fs+RNxB
         aAcDzwbOjJZzXZ8/p6k8O560CjIMI968PrI5To3OSQihusX1URoy1U8k9+vKkaQOW2qs
         XgSJFjc38wiC6TAbyqFwHkFYM5MSH4eHCtxHoSAEpKNEFZEp+fwZdsp76L7G8XC/eE0W
         cET2fbNvqKs3bY+itHlDk30PRIQA9YYtyfMfHlA0hh1w41Dek/M57YZz8eSAnri27/Bo
         pumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679383; x=1792284183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9++rHuAww9Im2B2wfP7togskszZqup/CYoTLkYiciU=;
        b=fhbx8K0a7hhq9FeZuX3OmAAnBDh7dEVzNxXGD9WghE9+WDOoL3NTYNG9Z57iGd8zZ8
         2gAd2e1g8+i6Tnzf5Our/DI5xdjIvI7R3J6VDShhDAyJvdQnFZn6O9v31Jc73+xMeZtI
         HKPGpwCtAss+YXck0AZuHIzPHSbffV1SLk3rAKiOpU7kSxk1QymxLs5v7WmBEyKWzYdb
         fFIMduQNfZkqPqaq78Y05/506qyeUhLT8K50lD8L3429qdV93BRLBwkru28dIBsrZwHp
         cVKjFFL1iE4ckSr/934BgaYr5b3RpTYl3vPnhpB5vkYALZ/etGlPRokuheAJjODkVTz/
         OaYA==
X-Forwarded-Encrypted: i=1; AKwUvBx3ZTNekzV348dRD4oElfafmKlyNl7d6KfPkVrQR7pxDelg0a090J9en76die/yXRcr0gtAGzvf5R/ywxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrF2Uu+41Tl6C4oQ5fMYhullTsw2PaREiOarWnHnZurJ24N1qb
	MLZJlq/pa6NmA9GI2iDlHRazba+kNe70iacACbrHWXlsEN3C+XwQ04sa
X-Gm-Gg: AYBFou240kyWqzJXwUDgB8ejsni+CDrUONtOcHQZOLeMedlqLoKpbvpjOp4Q2mPr+6q
	74Iy/603MMrMj2udX/qmcbnRdAImt2F+8C8wm1XgCX0dXt/5qKpJHxRC2VLhAVB7iQxl2t22Nzg
	q+EPW1ov/F2iu00owq8t4r5IP4spQvuBe6DhiYPLKsWvDMj+7safZyrcaLVfRpdiW7C1qPcSiIO
	B1Yvhv0Y+iilXMQniTv+sJKVaC+d7qDtkdQl1OaLWA8pl9zFwGJnYyCpiWpm40Vk3LUK7OMVuLS
	luHCJkQRZTYzjsKIoxNQSUeUCSA2nMUKJS6FKdBGxH1q07/X9U0c4Go5Lmpfj/qO3IAB6xq4G3m
	w9kuQfD7ojLCXc33ciD4/J5HPzB8qiw0udx9u1pXo+4vHTkFtmW/0i3tTFHZmyXAuY5/oeONxCB
	Ba/2fMC7gOIx8UQbBBQz4jK/sr3B5i2mgAD5Vnqx87uVhsriqUURvCiMUdi1vfkb6hbTk=
X-Received: by 2002:a05:620a:444a:b0:93e:c12c:f13d with SMTP id af79cd13be357-93ec12d05e2mr893634385a.71.1791679383533;
        Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm532320085a.12.2026.10.10.17.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:03 -0700 (PDT)
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
Subject: [PATCH 1/3] drm/mediatek: mtk_crtc: Look up connector routes in the CRTC's own mmsys
Date: Sat, 10 Oct 2026 20:42:46 -0400
Message-ID: <20261011004248.1117649-2-agentzoan@gmail.com>
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

mtk_crtc_update_output() finds the private data of the display
controller (mmsys) that a CRTC belongs to with

  priv->all_drm_private[drm_crtc_index(crtc)]

but all_drm_private[] has one entry per mmsys (mmsys_dev_num entries),
not one per CRTC. mtk_crtc_create() gets the right entry from its
priv_data_index argument, and the two only agree when every mmsys
drives exactly one CRTC and the CRTCs are created in mmsys order.

When a CRTC with connector routes sits on an mmsys that drives more
than one CRTC, the lookup reads past the end of all_drm_private[] (or
picks another mmsys' data), and the route component taken from that
data's ddp_comp[] array is bogus. On an MT8189 board with connector
routes on the external display path (CRTC 1 on the only mmsys), the
first HDMI hotplug oopsed in the compositor's atomic commit.

With the route tables currently in the tree (only MT8188 VDOSYS0, whose
main path is always CRTC 0 and all_drm_private[0]) the two indices
happen to match, so nothing in-tree hits this yet. It triggers as soon
as routes are used on a path that is not the first CRTC of the first
mmsys.

Remember the mmsys private data mtk_crtc_create() used for the CRTC and
use it in mtk_crtc_update_output().

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: on an MT8189 Chromebook (Lenovo IdeaPad Slim 3 Chromebook,
    "quigon") running next-20261008 with the not yet merged MT8189 display
    support and a local change that puts the connector routes
    ({1, DVO1}, {1, DSI0}) on the external path. Without this patch the
    first HDMI hotplug oopsed in the compositor's commit; with a
    functionally identical patch (the field had another name), HDMI
    (DSI0 -> IT61620 bridge, 3840x2160@30) and USB-C DisplayPort (DVO1)
    both come up on CRTC 1. Not tested on MT8188, the only in-tree user of
    connector routes, where the looked-up entry does not change. This exact
    patch was compile-tested (W=1) on next-20261008.

 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..b54f8565d2fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -59,6 +59,7 @@ struct mtk_crtc {
 #endif
 
 	struct device			*mmsys_dev;
+	struct mtk_drm_private		*mmsys_priv;
 	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
@@ -696,7 +697,7 @@ static void mtk_crtc_update_output(struct drm_crtc *crtc,
 	if (!mtk_crtc->num_conn_routes)
 		return;
 
-	priv = ((struct mtk_drm_private *)crtc->dev->dev_private)->all_drm_private[crtc_index];
+	priv = mtk_crtc->mmsys_priv;
 	dev = priv->dev;
 
 	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
@@ -1055,6 +1056,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 
 	mtk_crtc->ddp_comp_nr = path_len;
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
+	mtk_crtc->mmsys_priv = priv;
 
 	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
-- 
2.43.0

