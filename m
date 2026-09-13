Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D11E5018
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263300; cv=none; b=kSRdxARTWHTqJ4YV63cpx2oFX4RlDLT6CVC4AdWxStQY8zG7tGmpRY9xg6tce9zI1GIM3mF8oDAdloRP4D3BpJ9fCeqkduzWEhdQ/x6W+WiVYaYG6gTkFfrYX+yquip6GfBVoFyTycS7+XkVQPaCxb74iLo1wBw0mLxNowq14Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263300; c=relaxed/simple;
	bh=CtfAQLPmc/aaMApEpdADxsh5TlenudW5VoarEPfh7ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+F1C098P0nqMSVsJBnla+sqFri6mRP2ZBD1wEJb4r5RTP4V0nj6amlS+VUNdjR+gCajWhQw0xWnFuyI7X3IeiEEIN3s0509zygPQm3rQWFe7Ttl7UrHi32Kl6vq4NOGe3btRu2gCEGs71QaiYf9zb5gp61sEL+BO/SY6ojAJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtWKKhZI; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtWKKhZI"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso12828106d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263298; x=1789868098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=;
        b=BtWKKhZIfCYjYoSEQVQNX1/aiLr1QQauE6TREGOw0o+8G8wE5KBrAZ+4ZwP6gx1e+L
         ANOPOHoSlqeYUprgZ/mbjKf8KOyCJSr+CQW4OcSFx5++dpxS7SpoyS+/FMdF/K3S/GKB
         F/D1fDjmKRiwYrdZYhJVwd5ZhTlm5HxPULA9GcyvMKeBR1vzYYnAjzuadYU+SU2BmBHc
         a8T8rGTCHYk4IkJfPV5IsGeyzdfsjjPT02DZK4Q6pwNtL43Xvwu+vcYvfir9ryQJ76Ru
         wC4IqgZcVEEcGFlTh93Qs7DbaDkBm1q0Vzn1WclNN8jbWrl3xnBqE7NJmr0WsttG1WYt
         J80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263298; x=1789868098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=;
        b=cOmtQHhE701RxwSCSeO7/482aND6yqchsNxfAohZ7TmJRX3Si2e2/rzxO2O4GvVbX9
         hYFwyh2k6HtGnQhSuIuni2ca6A39GJrGPuHpkwNP1FkoTExtL5U9YN+6Zhl6G3CByWCX
         DlXXPMDU6wCxa8vDWAc2K2UpSZxVavb/0H1zUu3Qw+7t9ZG0bpwXm++/Kp2xgjlnAqLN
         uxCs0I3E5d17iXJgqU1GF00dI4qNubJpGaDSCOoDEECCKmyAva2VgeOjaf9+TGkGUbtx
         0rITcTBphVFuFcg66O0+oVUNWVAKcLCr8w/4mF8ATi9/djSXN8IWQiuj2TDRA1Z7LZV0
         QAnA==
X-Forwarded-Encrypted: i=1; AKwUvBytMUczi3YlFXJPXToROX0mJiNqjNtJzbF67v+OQ5Q2z6pOdu01ookTMWPbX3anbBdqcysQ60/CehG1Um0=@vger.kernel.org
X-Gm-Message-State: AFuF++ndDoxe+dwP3uwCQUpCY9BNaXMxoM9ojN+7R2ObkpSAI5S/iq+a
	7hIy5i0EjveKQfssGGBMloCrRBVo/QK64d2cB32ZdP9gxNWowEzLLao=
X-Gm-Gg: AYBFou2u0Ekkk04XOga8oQlWtaJImaYUe5xBmxv/wzckkC4qc3aaVLa/fLmBe6idNpY
	gBerLmsU+P5PBNjIXon7MyPAjj7VkYf1uct1gFXcxyIIBHxrykrjSuQrez0eafhRC2JWVSXIBFq
	6aL0yd/LxE0H4gCh3EuBU1qb3ZgzLoMQ8s/48rai73JnXH0phnAK2uX6BOkDBEbkAXcAcit+vVw
	64ceLERht1YjpfndU0cg4hPuhBLC9sYrW7vm1EI+5o+FiHCHqntMrTecj5qtPq9XmgRcN45z6q1
	eVIy0Kdz7viZs9l8GyOkNhg6FgF6F0EanuUw46IvBFXEicDt+dXfTRcN74xGnz+RPxDGCnzx5Mr
	JKJcG3rRBt12V1OQ1/5kM+EkJ2vY2GlhZO5cPUMHCBLWmZ1Xnc7qiV9eAS8WIODN0cMmvYF+TAQ
	Eucaz+IYLpgHoIFZyXGNJ2aKWOxmhc8lNr6C1VzsahClsq58dzT3PqTj46AVpt5wp18spYMpYr4
	uFEzAEkc/0TGlx62vdddsPJpQhQCk97Ob05TONgKSpny16mptkqtJ9XK4cyeBeeHT+hypqMit3Z
	D8i17CRxi8AMEFd72nhrPSMjbofimZvIEw==
X-Received: by 2002:a05:6214:1315:b0:90e:9a7c:e5a0 with SMTP id 6a1803df08f44-912120f0444mr161688246d6.17.1789263297899;
        Sat, 12 Sep 2026 18:34:57 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4920c5sm58866936d6.32.2026.09.12.18.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:34:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/exynos: fimc: disable LCLK during cleanup
Date: Sat, 12 Sep 2026 21:34:50 -0400
Message-ID: <20260913013450.20786-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fimc_setup_clocks() prepares and enables FIMC_CLK_LCLK after acquiring
the clocks.  The later component_add() failure path and normal remove path
only put the clock references, leaving LCLK prepared and enabled.

The runtime PM callbacks manage only FIMC_CLK_GATE, and component bind and
unbind do not change LCLK ownership.  Disable LCLK at the cleanup sites
that are reached only after fimc_setup_clocks() succeeds.  Keep the setup
failure path unchanged because it can put the clocks before LCLK has been
enabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: e5f8683923af ("drm/exynos: rework fimc clocks handling")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 09e33a26c..58214abb5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1362,6 +1362,7 @@ static int fimc_probe(struct platform_device *pdev)
 err_pm_dis:
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_LCLK]);
 	fimc_put_clocks(ctx);
 
 	return ret;
@@ -1376,6 +1377,7 @@ static void fimc_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_LCLK]);
 	fimc_put_clocks(ctx);
 }
 
-- 
2.47.1

