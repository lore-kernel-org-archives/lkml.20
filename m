Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B21D63F3
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192462; cv=none; b=ogcYuzC1rFV2lMf1g6y/6WNhAmhjHsBYV/5bu386lb4nBPV3MX6BS/+nP2ziVgsa4rBMyD7uqruaczfU2/bgSyB0mAS9VIOq6bNw68FR73rRTP5UmfxnczYvyPAMlH4eoCoo0q248DG995Gc6dIy1wjy7rYViB6J24qNIfy2gRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192462; c=relaxed/simple;
	bh=ZRGUArXIX6/pHtyYmSr3rgxN4EPhIPuwhe7zVbISvEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Iv7KvpBN4ipTpalDi1qIXf5U1LhNOUWHB2lRmuKb1qKXku1fvLiPLTh+Y7pLm+tTS9LjU9bZd7XF6mOYXGfwDTtxMkiOMqheICESXM1ne6/64rAlKXJXTgSy7p24UmkmQXsazWG9Mo4rtBWHVkSsmAs6UtWlOj0RR1naCuUPKMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/vESWxQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/vESWxQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e785dso610515e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789192459; x=1789797259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAaqUssbGV1ECiiHRed3l4YR1E4BZ9oxbo2ZGY4QlSw=;
        b=W/vESWxQNx5hADcM4VGKLrENxw9k5HRktsOqIjNSohpi40dKmAzWTygJon9jv6qgP3
         JqL2w896G7EVtQBQb+16NLv67uxVORXhHQEBC5aQqYajNzPoGfHPL1HJoftkstX34QqZ
         /qocpQ7nL+nJNYZM2eqww8dVQjEJ87HWhl8vKyd4LWJ8Q5V9EnL4Qaj0+P+6rNX2epmR
         AuQGodbfl3Meng16sESL454Ngov6MkjF5hDNjLz20tYhfnUMgCZblWb2DLIZjeFiNXWa
         c+ckz6DUZLTEBAY4B+pf1NG+SaHKalZGnZ+ED+JWLwkEqMpDePuT7kA4MskUDzCpVN2q
         3lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192459; x=1789797259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAaqUssbGV1ECiiHRed3l4YR1E4BZ9oxbo2ZGY4QlSw=;
        b=aPZf0l3PwLb9otcJzXFEqdhDKmgA5G+0NHHndgjmxN96M+LmMVPYw+EPiRoVunADkh
         tGu9546Oxa0ANR5nbswiRsZKa1uy4BV+llVTeLawAku46JG2Dre19QOjVmjRdwegrTDW
         T6KwpdTzFVfAgO2rvXdc6wqtUWxLRiAdOiHYNKyNO/Xh5HOILGWICtOG3k7rpTOP156+
         lCe+M6V1y9VIWRI/OQ/ZksVVoBDC2E7mDCq3/wa9E3FUA85E2LyOy37PZWPj1O7LQrhN
         EJ6w7xmXbwXcjVKXpbZE+I4JMYoC/EUjgHEXhWJJ1I5VVvcC0NRBtmvWMZ/PnkqWe6P2
         nqMw==
X-Forwarded-Encrypted: i=1; AKwUvBw7GAcSRGat5AOU8bQPxO5EeZJzr2CzVEue8GgHRC0oaQCwAzaLLVP3NEtSkxWMg1/jGlRF3GkoA3B71Yk=@vger.kernel.org
X-Gm-Message-State: AFuF++kOTbi00067VFomU29yu6Qjyt9NKEIiRKOQQcg87Ipm4vzVM1mJ
	ToPtLDqzurDdOGc8V5AQ84dsY7ZC9xvXZDn/k2o5de079+FBTyr77Gtq
X-Gm-Gg: AYBFou3dH7NA+CihwvBJlbpU3nFL5UqF4YKxS2mCIKHs22ptTay1uASisPCbs8ePzZR
	PwXb10ReLULSyJdpJQi0olWeep3oLBsEKNCXLXCHFcYLmmv/p9NNO2LxiQZSFIKfy4h7xICAkvB
	x7M3Q7RYL1f3ZhYaFTNSMHil26RWh0yXeIYJjkK2SZz5bt0K477W4n6gWs9iXUy6Xu04fNbAl9b
	/0b8JIh3VmQGvS8CX0fh53hkxTHNhJw54Qe8fbqW6A5LL61Msy0OutpBakgrufbDw/rpOtEEDYH
	D5goMsGQ70oLA6va8vgN1i0UntN7MHG4Zx3FtsEIb11B1kYkkm6p5uhHmeA3Dhmn/dMylXVTJWP
	Y97JrWQZxgwzb5R4So0yhvDiHc4x2mm0YNsHm8nucHnyeHPJT4Mbzp9BRPcjtFkgVfqzYiDbcEH
	BIkECt6zGOj1SKkAQtFcydFN91CvCMjpJeISbOTPeresw/GYfeUJ6ti9eTNZyClmebqzgPgF5du
	EcXvscq8m4A6ftYCcq6tb+ADnyEI8D4J6sTZJqWS7UoO3f+GLQNSZStocveCedlLw9QLptZRhw8
	E2w43aXuvxp7LQYXlWdkXVglDh3peutmTNbhaDb/R0+P5MAxQO67imJ/nMOLp39Pp2IXqtYp+Hh
	5hdiiIos=
X-Received: by 2002:a05:600c:4f87:b0:49c:fa20:cc04 with SMTP id 5b1f17b1804b1-49e6cc142c7mr11217395e9.27.1789192458728;
        Fri, 11 Sep 2026 22:54:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm359490515e9.6.2026.09.11.22.54.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 22:54:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panic: Fix the get_scanoutbuffer reference in kernel-doc
Date: Sat, 12 Sep 2026 07:54:14 +0200
Message-Id: <20260912055414.39664-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A kernel-doc comment refers to get_scanoutbuffer, which does not exist.
The name is get_scanout_buffer. Say get_scanout_buffer.

Fixes: c9ff2808790f ("drm/panic: Add support to scanout buffer as array of pages")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/drm/drm_panic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index ac0e46b73436e9907326de29c393da3024876dc2..2a849c07eb72f6deb0ca28fbfeffff64cacf1b3b 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -44,7 +44,7 @@ struct drm_scanout_buffer {
 	 * to the array of pages of the scanout buffer. The panic code will use
 	 * kmap_local_page_try_from_panic() to map one page at a time to write
 	 * all the pixels. This array shouldn't be allocated from the
-	 * get_scanoutbuffer() callback.
+	 * get_scanout_buffer() callback.
 	 * The scanout buffer should be in linear format.
 	 */
 	struct page **pages;
-- 
2.39.5 (Apple Git-154)

