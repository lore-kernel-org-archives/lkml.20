Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD042CB08
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751575; cv=none; b=X4VYGuvUeakfhs8CROeRUBgxUZAUyyDJdtstj0tyR6PmM+IR+m86iJhhHHXRM7Tzb3eJSIFygyULztf/TjEwWl1UHPL/KieUAFnTUxPGVrqRa1PZn+eXATPywR5J+EaE4C8O3gXykVKn6yhCaPMrk392kAfCe2XR+d6FKeCSBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751575; c=relaxed/simple;
	bh=f4vzx3ygeFKoFgtvLer1KloJC2SBtH4cyncEcjUfX6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Il+RpkCntI+DHTtKzEXQ9MoTE/tkKGBy+f4tJ26Ye4eGD9cAiskFxEkkRQqCb8dqLS1AsLzfkjOuAbIEQxF9x/rtKbHhR4EOxD0J0bs6lC45cPSMjARTAjs9lUKELadfwxKzoP5CnliLDsFKLAYAGgxCnzDeeoZVRzkydZoQ/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFgz/Mmt; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFgz/Mmt"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1560022a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751560; x=1791356360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hU+zIGAKl5WRrGNtWt1WIuTTmXd64fU+CsTBXH1LZFQ=;
        b=DFgz/Mmtf5jyVwvFpuuSvoDaRkU6TZkX+8rltHrCGsDLEy4DX4DUYwjji7o5KnT+VP
         vvVvG2LGAkLOvfHPBUYNoZR7A/MQ7n/qmoMNqIn+WH9DddqZUXckZaHH0oPSnOmy9qU0
         883jX5tRs53CSgisiOfMpnm647ulffdGb82nsCvIwR6erh5nxxOd3q7MSE0aV5Wk/0ed
         6k7PZFjVnJT6D9XcDnGQPOhusGiNZwB1etrv6fEo2lF244qSrRNdebyV7686jHPrYYk2
         wDtiRRMNChxJ9nagZnL65qczvvVTRAklTW6vb3ey7UxjJgzDX+kfI3x0S9Q4wxq15h7J
         Gn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751560; x=1791356360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hU+zIGAKl5WRrGNtWt1WIuTTmXd64fU+CsTBXH1LZFQ=;
        b=yLFAAqbLBajL5frbdA2n6C96wWr7JKdk1BbDf4Gf4DveXfs2Mc921YhiWSmQdqhvMT
         6hfhQ2u4i4h5FbAdVfyXG7AVkV1UKu20wKuPMDDOZDfDlOtI8b7f9dfhXTW+bsgGA2os
         P5OBWFXvfP+6AspDHZ+klhG6ikxsjV8el1NUAq/jbL+gpsszfv1auBansZxDDdEDoKcQ
         7UsPo400FYZotDhPq1WBJQUARNBpJ8NTZpjsZ2dIJ+zcNXptxWn/xehz1WA0Co0OoIhF
         k/rZoRexomGMkd4bwaPGlJL/K8I95ZUoAGV3Qtw1w7bjbM+fr2eI4syAnyuMrUwoFgkQ
         RLug==
X-Forwarded-Encrypted: i=1; AKwUvBzy0t83Uq2jI89yfwcNwqcZMyXDnieBLOAwRuboNuc6P7ntAPsgFSsjIwHALlQPMH7zxdJby3BbbvVkmy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ74SDH8InK7414eZXQqMH7eitsPecZ/q+4jTHy0FyXVNfQS+Ml
	7bSW6+8dzm/c73fjiW1yTcyLAj+OMLOtxseSyl8joA3WCLiNMq5xNNHE
X-Gm-Gg: AYBFou1+8BGId1rsr+h4eH+BLXFkBJi8ZV4/f7NNSpWy7YjVf++RDyP4O9lxllwSZkm
	z0vRKZcnA9aT18u5PnQnKUNxYrWhTrf6keBRxhVcjAMkLPDKFEmqbUuGegMngsfEy9aTFFa3f+6
	sUABEvf06eRshSo7Hs792ysaoeXSCaDyY6mCKq4q0gJci3lYKZglvjCkCc4kKMML4I8PxqtjBoK
	wtpI29jaZBcyWZmyoLCZWJXWFFtHfnCvdeyjYg6IVUewFyS8cxscP3/5mG9+qfflb8WsbtI9rSs
	EnnVO4ubZitr44nzX59kbkPQTqHLNuUiPRE0RS3VpxY7fbLtdIcBkG5K2hjqqJlWge2p3lU1vMA
	itqrVDo00RbQMDWWXBxyqO9uQc5qgJodt22WY4iNfHyj5hpCKrVXuvn9ja0/UDRTcyq6XnnM/m6
	HhLOOymV8Yl+36PwsTOVQ1ktm8J1c4df9N01dlvl5fdHw2SyY4zK2EgV3BgE7Ehe77BDIM0bLd0
	sRWk/y0o0tMIn6htAk6aVR5xPqPPmrY+LhLI6ES58AUTnpX0ccVToUriwUXw5c6I0BJMUDzDjqx
	sY+zc8duQw==
X-Received: by 2002:a17:90b:5281:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a4d276f94bmr256792a91.7.1790751560438;
        Tue, 29 Sep 2026 23:59:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae9ffaesm2010442a91.16.2026.09.29.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:19 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 5/5] drm/gud: Reset damage state on vcalloc ENOMEM failure
Date: Wed, 30 Sep 2026 06:59:14 +0000
Message-ID: <20260930065914.393939-6-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930065914.393939-1-benquike@gmail.com>
References: <20260930065914.393939-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gud_fb_queue_damage(), returning -ENOMEM when vcalloc() fails without
clearing damage state leaves stale y1 = INT_MAX bounds that cause
drm_rect_height(damage) to underflow to a massive positive number during
subsequent worker flushes.

Call gud_clear_damage(gdrm) before returning -ENOMEM when vcalloc()
fails.

Tested in QEMU against Linux 7.3.0-rc3 by simulating vcalloc() failure in
gud_fb_queue_damage(): on the unfixed kernel the un-cleared damage bounds
(y1 = INT_MAX, y2 = 0) caused height underflow during worker execution;
whereas with this fix applied, gud_clear_damage() resets damage bounds
before returning -ENOMEM.

Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 drivers/gpu/drm/gud/gud_pipe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index aa7792966287..fb726e3d849f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -404,6 +404,7 @@ static int gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *
 	if (!gdrm->shadow_buf) {
 		gdrm->shadow_buf = vcalloc(fb->pitches[0], fb->height);
 		if (!gdrm->shadow_buf) {
+			gud_clear_damage(gdrm);
 			mutex_unlock(&gdrm->damage_lock);
 			return -ENOMEM;
 		}
