Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98061431A50
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751574; cv=none; b=TxJfo6KXAzyLqj8pxE2dNReYp9dJ6qu7Kxf2J/hTaITPPhYiuzSRszwyvuGLJi1WpaAHiG9AALdEXNuFVL0uzxvDMEYUUDKCtt45vIN7zPQbDt42WFn4rDifWewrvWphkVYmRqA/i9Uqo62O0siWk6IMn2Lt1AsYf26YJHdVotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751574; c=relaxed/simple;
	bh=6BdjSvBTfW4KpzxkiX9ADLPmoRyL16y/wUOpfb5VEvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QERn91IPRyL2yRXh0fFMgCH7UBtj0Uz78JkkYdRjh7l3UnhqSA4LZGI3gpgK+7flem0Vg5uE9ONim2iwCCzm4WYLPlgN1bqXxn9yXUDgKeIsiW6aVhATa+IQwZIe6Sq3cCecVx9fqSoua5zR8EmS4UJ/HiolfKU/2Dk6rkgfcXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiX0HdV7; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiX0HdV7"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso829215a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751557; x=1791356357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mx0iaoPR7zXZchCwtDWxvwWQjv0it6r14y9G6mnX/DE=;
        b=NiX0HdV7dEnKt6KwlC8zoBxXmpRewPvK1Tp1FKaWfAD3b94iA3gVTb8QpZkToJZ7u0
         O0WCmSgOQvR2x+9m3TP1NPMqZco2paLoEFEBODbgDUGLZ3AE4y5oQjoxHHFuULfnXX7H
         wHyuGIdtMYsEDQNWLjOHoOR7VqP3Hb1qX+tZQbc9G7dv8Y85jc1PUxlrNeYgkXnKpXFO
         BcMdj/PaV4FfcDcI5TQ1P14TY/gCimX7R14j4rXzipCgiv33rZzEnCr9jZWpWes09oKo
         YsgvWC3U3HOYYHxg3U3IUUDgIjzyi6bVTBchcSgcvGTM9L7N/vd5SDzJlO0dV2CslS9h
         zGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751557; x=1791356357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mx0iaoPR7zXZchCwtDWxvwWQjv0it6r14y9G6mnX/DE=;
        b=I5RBp/V/JI+3ghO8VXYbBEZcQRuVAHa/3wdyqpkpsGuBrBWuxK6mhT4ogPYqozfSVl
         lneYJJI/YiQUkR+uAbIwDs+0cEmYSlayXMfTGdDqClkIh4iVAa2nrVWIlTCInb6b+QjP
         0xT2OhpVLMvTYqtmG1CMTPF/is1r+RVxpO3KX5Qps9D6Nqtww3R+k3YFckH44j3qFrWW
         yMHlunioyQLwZ/kuUKaqXrp1Qsr421pPyIkis3BRKlCEGTYBsbRebxN6gmVlwbsT/nut
         lnhQiR0mH7DGoVYqubkBIDz4CNM43c6WaUyczJkCUzX1RlFOpPW6s/0YSP57kMiwbZuO
         LqNw==
X-Forwarded-Encrypted: i=1; AKwUvBwB+bkanFRJTW9kCwQW7oWSJDZ8aq5bOnrYk22+erZOZ9uJWCVahrusvJYSgeeXgCqiQa+mwSAYlh9pbQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy5w1X/mbwJZW4cLRi4ym+Me2sJm1hwpAfHi0zKNSzUZOzI3nA
	UVuuVCijA78CI933/2I6ncQ38fuvUcVxe6OB5qc5jcsx2T1eDhnEIQBo
X-Gm-Gg: AYBFou1EPHwiuQIqO4bgo8gcqlC7RNverqmwuE6q2KFJ6Ff4LEMEy2YsOyBtZ8lk1+x
	OqBJCSNpKzjFvKVGxO8PAzaGTXDxyn6tWXqaSZ0r9rqeBwW46Oz+itIFK1GJY/Bzmn2CaYL3n19
	T5wsAYklfd8ct+TIjw0tkVl9B7mCtKImrbInsGo2QIg8rq2VrR/UR8c50o641qEF1yLsFldptJj
	lZ9xkhCEhOB91fe2dxXVQtDe6QY/66cxIZOgUWcuOchEnJoUVkX7LmB3ne1vk9uV3VXuoFrnKuh
	1eMELfhF9MugqlYZCjZJa6tqH5/yPDYAx3gbDDDAV2FB8eEoBQ+ltrc1mShD7uxLyVHB+gaz/La
	2qvT8CTSgRX2GAY/U+l/4rLnmEMJvzBcObWC3f/5Kc7OtiGF7KyyFeTRsCTQ0cwMPRvZmWInd20
	SFHxHVb/cITqKKyY35V5l3Bb/B2l64dvye97aYWitEulZ0bbByrCY4NSY36SjEwgSgzd56FP7ZW
	v+pEjispshtEXYNlOjOmt/7eP2I2OXP0EvDGfPlN2MKU7A/L5v95uB58u93wDZL+OFkNjUtIyou
	6AUqQwSQGA==
X-Received: by 2002:a17:90a:dfc8:b0:3a4:b3a4:e7a6 with SMTP id 98e67ed59e1d1-3a4d276b9bamr261177a91.11.1790751556720;
        Tue, 29 Sep 2026 23:59:16 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cae9ffaesm2010442a91.16.2026.09.29.23.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:16 -0700 (PDT)
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
Subject: [PATCH v2 0/5] drm/gud: fix probe validation, shadow_buf UAF, and bulk_len divide-by-zero
Date: Wed, 30 Sep 2026 06:59:09 +0000
Message-ID: <20260930065914.393939-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses multiple memory safety, concurrency, and
validation bugs in drivers/gpu/drm/gud/:

- Patch 1 moves display descriptor validation in gud_probe() to after
  drmm_mode_config_init() and field assignments, preventing unconditional
  probe failure (-EINVAL) on non-DMA USB display devices.
- Patch 2 aligns both x1 and x2 coordinates to block_width in
  gud_flush_damage(), keeping rectangle width aligned for compressed
  block display formats.
- Patch 3 flushes pending background work (flush_work(&gdrm->work)) prior
  to freeing gdrm->shadow_buf on framebuffer resize, eliminating the
  Use-After-Free (UAF) race between queue_damage and gud_flush_work().
- Patch 4 guards lines = gdrm->bulk_len / pitch against zero pitch or
  lines in gud_flush_damage(), preventing divide-by-zero in DIV_ROUND_UP().
- Patch 5 resets damage state on vcalloc() ENOMEM failure in
  gud_fb_queue_damage(), preventing damage height underflow in subsequent
  flushes.

All 5 patches have been dynamically verified in QEMU against Linux 7.3.0-rc3
with KASAN enabled; detailed test methods and outcomes are documented in
each commit body.

Changes in v2:
- Split single monolithic patch into 5 distinct, single-purpose patches
  as requested by maintainers and reviewers.
- Included QEMU test methods, expected vs unfixed behaviors, and KASAN trace
  details in commit bodies.

Hui Peng (5):
  drm/gud: Fix probe failure on non-DMA devices by moving descriptor check
  drm/gud: Align both x1 and x2 to block_width in gud_flush_damage()
  drm/gud: Prevent shadow_buf UAF by flushing work before reallocating
  drm/gud: Fix bulk_len divide-by-zero in gud_flush_damage()
  drm/gud: Reset damage state on vcalloc ENOMEM failure

 drivers/gpu/drm/gud/gud_drv.c  |  6 ++++++
 drivers/gpu/drm/gud/gud_pipe.c | 22 +++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.47.3
