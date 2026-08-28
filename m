Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF633CF694
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899348; cv=none; b=TznjxGyiCHWXJyvAAMv13J9LtNDlTKCl4gJurV6MGLu3iDTBwJkPptap2wfsfy3b+b3PSK5edxRys9qJJKPAm35dtdrU3JfAToKzJFkHSKnLPStT80DRd8Cp+Fvwmr99GI+/eE1FPzYn1QtEqTKkh1OR5CywZ3sLZnH6WtzicyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899348; c=relaxed/simple;
	bh=pN6HPYj8rgpgCZ536OcBznzjQHlM6JH7IBNXpCmtsPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ETjKVmBL+WbfHNsN8jr6fwNKUI0gow5O3CVR4jaVRf5FaYtJN32dxcM8/MHocPE+QY5u0NPOWLg11keSwJsPU2zAJaQQ7MpkkHZDMQejpjcWCiqn8QjY3mepUJYJ6u4O1m7FWPQiQcF4hS8aP16VQm/wh8HWhKWKaf6es9JP4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zy2ZoHmE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy2ZoHmE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f502ff678so72076f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787899343; x=1788504143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktRMVezOHSXu+KrKQhXPWvOXAM5roEQ780FkS0ZUNoU=;
        b=Zy2ZoHmE9bPRGgA/zVEbKE0zeNGvMe7s6MV7AMBmLYGSgaoPj999n5fciHkQDjdL2o
         bgy7VsgfpZRTxw+uRdH9eSBSSTvY/b9sSgxz5k3b3VEp7rzIx/e+/TjhVg/5Qlu4iUdN
         eRim4rwmkT+oS1y3a8pObamAU99gMIMKOumkd80awTLiI19ZcBvqyWffqfGoEgPIjqRN
         IExDlTlcrgThnFWcjrMhHs8HF7DbLevnd5D1tnMmqgoUpNP1O/BjwezBErCW7RfF3EpT
         6FLBzRl8q996yngtcydnYSfQg+n9FNCQOMesffC4Cq4u6W0yVT3Uls4dpJ+Pax7PIaTS
         OIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899343; x=1788504143;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktRMVezOHSXu+KrKQhXPWvOXAM5roEQ780FkS0ZUNoU=;
        b=PSV1p1OJEtnt+ymBuDAMxOcxtUjzHNnV5lFSI1BrxYyCjdifyE6N8ByHpUIoyns210
         v3uF7maoQZPKj2S1iKvoWVqFaVrTD33quSNAf3idK/9BlAp2hW6Ap/zhikWbew8g6i5h
         8Zk51hg/IXTFZdwaIcNaIiBotlfk+udXLi90Pdlb90i1ZzwNYLJIrKSFcM33fr8+GyU8
         UgTUVJj5+t1tTD5s2pgWdlKmkR06zT6be2poxogpTDEGJUtGD3AV7nQZHGP5eukDTak0
         //9byAVUfdIU9+/Txw2TNJgdXrN+iK9Rd+iP+xE1s/SXcVpcsCNlQKc7257z+7N6jTnG
         QuQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRo1CdcqMEocaOGeHo0bg8Y145DgA7bs6Nj1OuA/T52evuCg5z8lmViN4/MA7SJ+4Xz6YkTn3NKOYfUSc=@vger.kernel.org
X-Gm-Message-State: AFuF++nKfQiECCyJXJ7HU9apzXO22vzq7nTCDZcFewULiFVtPm6N240R
	Hn7LlR8lu7b9Rm2Ax309suupAB/DfmM8WwSIfs51fplFyfCf3VU8ANUT7IV7/M5qTUE=
X-Gm-Gg: AR+sD12bj4xBXL7l6dV8g3fFKAn8BJ5PO7YuTak2a5rXc4XRGwX+2J/Kqwu6+bYVKkR
	BivO45Q0RN9/B8H7FngsjVtGGDlOHzk0D8cPHqpAYTO8qZyjBcmXMmE0ryOrDRNYj4gWe77ckjI
	ODc6gU9mc7uL0WgWOm+ze8wmjg1TZ6ivGwXdTV29VAJ/ty69XNOIXHWcn0AzxnSjkmkRANQERvT
	fNPKBvVf4fVZy55boN+j9bAMUFLm9H3apUGWENaqJKpHQVdQZtG+acIesUA34pH97RLP1tgFk0s
	Rws8SLCzvLPRkJDMGZKOwhaEnCchgC7a7qY6/eUqIYf91HV5K8s7vGbGX9nRmzWD3kEC0Ws6gDl
	yP/naQiWcyS96dlQNqpeQeU6m4hJLQK1vs7o8H6TcVz0v19Xq1Ogg9JESiZ1PjeUGNWXKmGergo
	N5IsHNAfmkEY7b9BrLP+3/+6ZCz7KYNekn1raDLBZlvA5b75dqj68+EvVwNMM1myaEFG49Xt6bs
	a5hsbTqGDm/TA==
X-Received: by 2002:a05:600c:3103:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49b91c39a77mr31949355e9.1.1787899343257;
        Thu, 27 Aug 2026 23:42:23 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm33472195e9.8.2026.08.27.23.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:42:22 -0700 (PDT)
From: Dmitriy Okunev <dokunevdmitriy@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	lvc-project@linuxtesting.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Archit Taneja <architt@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: tc358767: prevent overflow in PLL calculation
Date: Fri, 28 Aug 2026 09:42:09 +0300
Message-ID: <20260828064209.4314-1-dokunevdmitriy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the tc_pxl_pll_calc() function, the expression `pixelclock *
ext_div[i_pre] * ext_div[i_post] * div` is calculated using
32‑bit arithmetic, since all operands are of type u32 or int.

pixelclock takes the maximum value of 154 MHz (in accordance
with tc_edp_mode_valid()), ext_div[...] takes the value 7, and
div ranges from 1 to 16, inclusive. The maximum product
(154,000,000 * 7 * 7 * 16) is approximately 1.2e11, which is much
larger than UINT32_MAX, leading to an overflow and, as a result,
to an incorrect value of the PLL multiplier.

Fix this by casting `pixelclock` to `u64` before the multiplication,
ensuring all arithmetic is performed in 64-bit precision.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 7caff0fc4296 ("drm/bridge: tc358767: Add DPI to eDP bridge driver")
Signed-off-by: Dmitriy Okunev <dokunevdmitriy@gmail.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e3a57f8228da..39633f618664 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -640,7 +640,7 @@ static int tc_pxl_pll_calc(struct tc_data *tc, u32 refclk, u32 pixelclock,
 				if (iclk < 6000000 || iclk > 40000000)
 					continue;
 
-				tmp = pixelclock * ext_div[i_pre] *
+				tmp = (u64)pixelclock * ext_div[i_pre] *
 				      ext_div[i_post] * div;
 				do_div(tmp, refclk);
 				mul = tmp;
-- 
2.53.0

