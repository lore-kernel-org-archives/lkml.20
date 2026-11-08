Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139990;
	b=UjjAr/Y5gNBKMGsZt5ouTyyBFGHzag7LwaeG++QHdsKX6HEbz5pMhb9XANEIxUyNzxY9
	 /L6CVpusY1hdhIl5JNIoaeytrH8kiicTmL1OZcXRDuEXQIGwxI6mbyJ29iK4cBsBh1I9Q
	 2VJVLKoW79PZ6lBLqYLwnj7GGL3u5l8druilgGxfjkrlZL7DMgX3Js4fdHmvlVB1a7yEd
	 1JZrZ0Lj6KgtfzcUkfzbh4H3/DqL+O2cqu0x+petBTtUcIVSI5qONs1JCsurc7gxMebzj
	 doTQR1dyE5TYYvzh6Z1dWI+wN3KvAY4uz36w7lHJJclW2vuS26fE3MMLiSXWpmR9R4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
	b=dRSnGcWvfH5ek2AqfVZGAypgoQPUUeXvDySZdNggKA/sFhEZISnLqGJ/1AHMtl4tudoS
	 eIFhcHe1QhHmffySNpOAyMPw2nnJ374eKW3zhTI/Rcv1VQ3+KP1PmgInl6AcH9VqUkCn3
	 YccTc3H92+fTuBNCU4NPk9EtEdXZB2tkVc1a7eDI9iKTriR1gXCfs33wC8q+CEgosAI2v
	 5olOTowMWANb0nm1RS6TF/MYcSdu6DTgf5fXsI+MS2W1rxSLOdYP2Ng+hwHFWZBnEd8zc
	 aRwYvxjAvaeuyz90eucne/yvJL5HyYr9GMVUAc0dCO9Kuqk/a3/EpEVWwaIN1m8X2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGg7RntC;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787E606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6787E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGg7RntC
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49318428d98so21863f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794139988; x=1794744788; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
        b=HGg7RntCeGZgbr8ZILgVGPdMxtwdnmDSyBXwJEGGkufw/qEtQG2cICDso6qa9D2jS5
         SnklTsEMZHzpB82zNuIUxJexGV39EiDBlEAb3jOKMIFi3Q6jFUC3tBDZ8YsNnSiXpWqp
         AjyTmOWiduu+JW59Vyf44pXaG6khHGOYG1ztRNG4BSMd0MQLyGwk1NeJatM8CqCo1fSE
         YHao9s6Nq2NyO3TQu2aPuLhsvc2bxcmi5+nDRuV0OYJtzw7+fgEc0qJKWMdxDxMuOoWi
         lCSyMhIPmWypu9F7KgFshWF+2gQPl5ZKXEH7nob6xIXO2bpOfzpoPl+WkjtAkO5byDlG
         RUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794139988; x=1794744788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ygaGJYoEs4KFSYAAlwAVylXljw/N65/5dysb1mPUS9Q=;
        b=Y7uJeTeWOlKp8SBe0mQgO3BBQeRxUju2Zyd40LkS9q7ifUlkInfzfZclQ2oVHRcZYc
         YDqSN544yBCq8r09mAAqZ3X5a5CuyBXcySLfljS+P362QmRshuBUikK+k0bLeFvbsjDq
         ba81cEf4dAjVKXlEDFM8lnmHDhpsL8gV2lr8VyRELaS0zGuuZUP0IMHO5BgbfdhtVvLc
         Fxg1dwMe9XX3hGsS7V6nF5dS0gRRTbkiv7cAmEdbxcUfcMAE8sBAj1UrrsAAEnhRqXqI
         ClJhncSiczyUN/VJ05bRRxfznK4DaL5prEt84t4fCj9ItSvXT+k4/02ZSBOiTvi8qM0R
         1/dQ==
X-Forwarded-Encrypted: i=1; AL+hErGuko74VoqAnH4HHuicFkIvgQIW5zvRxwA2ZdnsLgiBnsJEKCE5wGFDAAT9PYJSOkqw+gcjuqjJhCCyw/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rRs7dYmNy3FBSUC7U9Wtw+YWCBTGWSR2F6mUDRsvLmvryiupW
	bYZQXxefbin15QA/IfHxWey2GbIkdLsjpXJiIFw1w+JYoKH6colLU0zD
X-Gm-Gg: AYBFou0kd6yXrYnLGz6TuAa0/zQM0DoL97pcUUbVw1eR0g0/DDmumcnPLRFiVN7L0hM
	q6djsfOtuQLtHnIuIHSFkKwTylWXiCmtq27XwKCx9tHBekIIo5shVIaqmRAn8cMb7KWvaqMmQjx
	3/LRvCY/IsFkoHDLsTElAsidU0CGF39D1eTUbQS5+XNG3dqol+uDrO69WBziSWvCKNZaknQGfUj
	Ap/JtJePW53q/yvJX99VMKn7raCzg8q5FzWC3aiY4Zahvx2SM7yQ3PNojsHqnbHUQHHHU1eGOJw
	HDHS8l4VlwfW8y8loPRZyaEE//082JWaxF0dK5XW/EiVgVWP0kKI30OnGqZDLy8Ucl5yUSWYDkn
	tjyud1L4u1nQfWSzJ0Mme2fKnbV+qMfoBtpfP4oh/vvUS+i1SRyVEiMgrfi8mjWzinwhQFedU5/
	0YCMv53HYsLGUytimXkDdAUUQA/T+wcLkeOEwocMDBEhyMUR4cvu6/Pwkuxp8PsdeSJohfhBlZa
	OHhJUzHyHLZAycLp7VfVNYemqix5xui1yT1aMwiTPQ2OpU61XOt/QYWt+j4iB7zMmW5GADti+og
	51P1bmLw0xDNbct+Nk9iV0sLCVcYg6j4mTVsZYeLkk6X84YRyE6eynqbjmIyvbYJN66xpNqt9Fk
	LMALxXOQV7K7HnYvx17OllsIL3o3lH0BkLHSQHaTz1nyXcq3VJiU=
X-Received: by 2002:a5d:584e:0:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49583ee2ab6mr3013316f8f.0.1794139987564;
        Sun, 08 Nov 2026 04:13:07 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm3945815f8f.31.2026.11.08.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:13:05 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 08 Nov 2026 13:12:59 +0100
Subject: [PATCH] drm/mxsfb: Complete page flips only once the new buffer is
 latched
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-mxsfb-flip-latch-v1-1-ad816b23b646@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtQK4muEi3MxhqwHzQiEO+et
 PwW7yWIFJgiDFWCQA9HPo8CWVdgN3OshLwUgxJKSyl63N/oZnSeL/TmthuS6xrbdkrPRkPJrkC
 O3385Tjl/QGTg9WIAAAA=
X-Change-ID: 20261108-mxsfb-flip-latch-ef53c4526ba6
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The controller copies NEXT_BUF to CUR_BUF at the end of each frame. When
a commit writes NEXT_BUF just after that point, the new buffer is only
scanned out one frame later, but the event armed in atomic_flush is
still sent at the next frame done interrupt. Userspace then renders into
a buffer that is still on screen, which shows up as half drawn frames
when a compositor renders directly into its scanout buffers.

Keep the event in the driver and send it from the interrupt handler once
CUR_BUF matches NEXT_BUF, and AS_BUF matches AS_NEXT_BUF for an enabled
overlay. On i.MX8MQ about 2% of the flips completed one frame early
before this change, for both planes.

Fixes: b9f5937680a8 ("drm: mxsfb: Enable vblank handling")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  3 +++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 47 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..d21f12074a81 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -166,7 +166,7 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	reg = readl(mxsfb->base + LCDC_CTRL1);
 
 	if (reg & CTRL1_CUR_FRAME_DONE_IRQ) {
-		drm_crtc_handle_vblank(&mxsfb->crtc);
+		mxsfb_crtc_handle_vblank(mxsfb);
 		if (mxsfb->crc_active) {
 			crc = readl(mxsfb->base + LCDC_V4_CRC_STAT);
 			vbc = drm_crtc_accurate_vblank_count(&mxsfb->crtc);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index bdc47ce5be79..9264ca53999d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -49,6 +49,8 @@ struct mxsfb_drm_private {
 	u32				bus_format;
 
 	bool				crc_active;
+
+	struct drm_pending_vblank_event	*event;
 };
 
 static inline struct mxsfb_drm_private *
@@ -61,5 +63,6 @@ void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb);
 void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb);
 
 int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb);
+void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb);
 
 #endif /* __MXSFB_DRV_H__ */
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index bbc2a2df9f16..c7e516758a1a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -328,6 +328,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
 static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_atomic_commit *state)
 {
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_pending_vblank_event *event;
 
 	event = crtc->state->event;
@@ -338,12 +339,54 @@ static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
-		drm_crtc_arm_vblank_event(crtc, event);
+		mxsfb->event = event;
 	else
 		drm_crtc_send_vblank_event(crtc, event);
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+static bool mxsfb_crtc_buffers_latched(struct mxsfb_drm_private *mxsfb)
+{
+	if (readl(mxsfb->base + mxsfb->devdata->cur_buf) !=
+	    readl(mxsfb->base + mxsfb->devdata->next_buf))
+		return false;
+
+	if (mxsfb->devdata->has_overlay &&
+	    (readl(mxsfb->base + LCDC_AS_CTRL) & AS_CTRL_AS_ENABLE) &&
+	    readl(mxsfb->base + LCDC_AS_BUF) != readl(mxsfb->base + LCDC_AS_NEXT_BUF))
+		return false;
+
+	return true;
+}
+
+static void mxsfb_crtc_finish_page_flip(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_crtc *crtc = &mxsfb->crtc;
+
+	drm_crtc_send_vblank_event(crtc, mxsfb->event);
+	drm_crtc_vblank_put(crtc);
+	mxsfb->event = NULL;
+}
+
+void mxsfb_crtc_handle_vblank(struct mxsfb_drm_private *mxsfb)
+{
+	struct drm_crtc *crtc = &mxsfb->crtc;
+
+	drm_crtc_handle_vblank(crtc);
+
+	/*
+	 * The controller copies NEXT_BUF to CUR_BUF at the end of a frame. If
+	 * the commit wrote NEXT_BUF after that point, the new buffer is only
+	 * scanned out from the next frame on. Complete the flip only once the
+	 * hardware has latched it, otherwise userspace gets back a buffer that
+	 * is still being scanned out.
+	 */
+	spin_lock(&crtc->dev->event_lock);
+	if (mxsfb->event && mxsfb_crtc_buffers_latched(mxsfb))
+		mxsfb_crtc_finish_page_flip(mxsfb);
+	spin_unlock(&crtc->dev->event_lock);
+}
+
 static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_commit *state)
 {
@@ -425,6 +468,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 		drm_crtc_send_vblank_event(crtc, event);
 	}
+	if (mxsfb->event)
+		mxsfb_crtc_finish_page_flip(mxsfb);
 	spin_unlock_irq(&drm->event_lock);
 
 	drm_crtc_vblank_off(crtc);

---
base-commit: 19e67d977d3d4d0c54f03906ef578578190db9e1
change-id: 20261108-mxsfb-flip-latch-ef53c4526ba6

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

