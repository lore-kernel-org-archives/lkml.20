Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A43955D2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768767; cv=none; b=D/WTbygs5pMbPy7wa6tGxNq4EWVUQCc3BGAdfOi4InGmz2cRJwDoXeIu9Yt8o9t+keP2HZZ3hfgkPnhIuxVg5HZe4q1mJuVeOaMyoGADleC1rAUuPEU382eYswrFAlYZ2ZaQW3WOqfC0hbiJ3JFCNOhdyUncb2+MKTwn6L/W5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768767; c=relaxed/simple;
	bh=Nc1rNU2E7DHLdveCumxpbnt9mfl76U9FIsZQStRq2/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbbax+PC67RVkCGZH0ZOIIzrusCuwx1BNlxTW1xTICdypqYD/vAcWQoQpkEzDxvdD9i573exId9VGS67W0qm+iBVHSEzYTIs9OiG36sfrzcETPwhdx5VEvCPkpU5OUV3NaWboOWvsk2J7ZqHqpbdNPTFh/VGgcZmCpQz1DB4yYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jtjw68om; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jtjw68om"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1600d040e4so30606466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787768754; x=1788373554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AANzETdmnhX2GAGuIhUsamI5Im+2Kfn2eShC6d5HLA=;
        b=Jtjw68omAmsPWFkAz+W7nIDSn9rw5RVVfw0Bfmx2Xuyoh8ku//cnaVf2o6uXA3jVyz
         QIhp83hFE9ZHBNVt6CWFrmZGFegCD7Niu/ArvQRJxjzyKYYGc8bBdJNU+Q9/ocYqf2dP
         NDI7uencRd7Ht5bHY35MmnX1JAz6Qc/+xj2fDQdOCUakenI+9s/CS/UwN8BxGvC05tRT
         hxg5Tw1y3X+qQnDzFbeXtWnmblv2nusXiuUownTeqSY88bMFKAj3D0tm17Z78zffjIVJ
         kW2fjXAjtmo80wPQ8HBSLLCvmvj/+n1n5X2fTfecvUdoWXFPaX35Ks4mrK2F57rSYEXz
         Ezeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768754; x=1788373554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AANzETdmnhX2GAGuIhUsamI5Im+2Kfn2eShC6d5HLA=;
        b=cd0nbSIgze06KyiqxTJEEwNYlo6Ed/YvLXJ7QiEVjuiwYmQI3CVjOEJv1QWtKwY4Ed
         IH17lxkzMeI6g9YsV2blqvZa8tqMFRO1mhr11hjZ7628RSTGKIHpXCeWTNdrZaGFlKCN
         WkLexJNGXL+L8MUPF8j6C4wpLky8qhgc5cvPs7KfuCrtvaRa5M+ZrByUSajnND/OQYK1
         XcMqIDzv+1CeYqbscY2Y9D6n/CSK0xs5ey43ThRMZK6LndxtOG6nd3VSoPxZMlx+GgZJ
         tSKfD60zw+Jw4Zvo5LzmN1n2ViHJh8olxxyndoFgPZrodgjFZBF4A1Kpnbvn/3l+gVF2
         OyLg==
X-Forwarded-Encrypted: i=1; AHgh+RqqrYMzwFWuSyM+ev/HjUDiU01/8OfXZSeLu6JbQ1NvGhmbQy/beDCMbnf6rF8cSZCQ3BPsUoaMWaxXwn8=@vger.kernel.org
X-Gm-Message-State: AFuF++k/r73+KW457Dbh+Q0S5vZD5b6zH+WZ2cYZxvQqLQ0r0xPe6gbG
	inVtYmqcYuyxPNV7SpD2V+m47D6PYOZb5fYg1F1gTEz3JsqZzmohfFQv
X-Gm-Gg: AR+sD139OO5YZ7RWGRdqYdAZX+Iu5CX2GwbeFkmjmFln7GNplPEkegFIoisCwaPgP+Q
	gR2xfQ5UfCQgZ0bAn1M7QSEsUXfPicoDS5kyCS36A8GwWEKQziA4nOTYlAWTYBOSbsiNI90Jr0t
	jZ798v8H7KJd2EO4bjxvWfclAvF5gu4QY0O9JETN7cGdcVOtNiMhd6YmlZNQRbDp/HJk4hT+Wjm
	NbAR0o6aNWGFwAmtFNves0G3bsW/LjPWJD6JcmNqQECqQXh56vr3ijpiTOX9mrcYTaeWKfEyPRb
	4KBr5iFWxeMStTKo14BAKZsYhL2hM6fBZAfpSxsz2O426Hakr0jsIO39BLd9iF32cic5INV8Kbj
	z+cV2sPYkxlarndbjIaCK88Cqc8q4qTMuKzN/p9ppZdDNJwLdRkdKxMMGJt2seQrIiS54xavdim
	MKEWfkEplUjtPOnbnGBZdMBX/xn48LG3LLpCjbo5BLzSlkSMgSPWL07pJvqjP3OtUjrdY=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id a640c23a62f3a-c25360ae6f6mr120564366b.11.1787768753983;
        Wed, 26 Aug 2026 11:25:53 -0700 (PDT)
Received: from fedora ([2404:3100:1006:efb1:8177:ae9d:629e:eab1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43absm612769666b.51.2026.08.26.11.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:25:53 -0700 (PDT)
From: Saim Shujah <saimzst@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Saim Shujah <saimzst@gmail.com>
Subject: [PATCH] drm/msm/dpu: clear pending flush state before physical cleanup
Date: Wed, 26 Aug 2026 23:24:59 +0500
Message-ID: <20260826182459.1506522-1-saimzst@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware can consume an active-frame CTL flush while the cached software
pending-flush mask retains the submitted bits. Video-mode disable stops the
timing engine before physical cleanup, which then adds teardown bits to the
stale cached mask.

The teardown trigger can replay source-pipe bits after timing
stops, leaving one pending and preventing the first commit after re-enable.

Clear the cached pending-flush bookkeeping before constructing the teardown
state. clear_pending_flush() updates software bookkeeping only; it does not
write the hardware CTL_FLUSH register.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Cc: stable@vger.kernel.org
Signed-off-by: Saim Shujah <saimzst@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 778e231..f3b1fdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2264,6 +2264,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 
+	ctl->ops.clear_pending_flush(ctl);
 	ctl->ops.reset(ctl);
 
 	dpu_encoder_helper_reset_mixers(phys_enc);
-- 
2.55.0

