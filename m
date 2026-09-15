Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198E485CE2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511173; cv=none; b=NuIKNP+caTkGo4Tz500DU/5c4VWbd/1jpfrKwzy4fzbdUH7ENLbTTJSi1M5roknOjOLNgoLmrIjHzZWQMoO5Utl+Lr4uMs8QOpsURyKG27+a+qdso3RNFmp8JJ+U+l4woCcUH96I4gDCgLLDUjTFi4mLmlftQZajY8RU32aTOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511173; c=relaxed/simple;
	bh=VQB79XU5ha3TH3L1StabFfXEj3XgXRoI6dRfp1doGPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqaMWja+i//oO+PzUxl43w0ngfDR/TjR4TAIs3fjArXHs0FihGgpZgOFT63UFXZZo5vteSsk6GgiVEigPUqCWItp/oqaQE0vWJt+rcPF+vMgJ4qXeKE/At4CbAc9ZKuxImCjJ6BGkwlgdf7OKMCBUXEN30INycTq58IFizf2zr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0nCYR9t; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0nCYR9t"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a33c9cso265991b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511172; x=1790115972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozbdljbJWhuPCjAs3/0Yc8dEEkoSWPAnbLbDIm9pqjk=;
        b=O0nCYR9t5CXA5OEGWgIFp9eKNYAegQnuAJRK0ALJHvnRQHK97dM8TbQd+0mBfHP1jt
         vi0X9ryJsQD8ZVUMdseNZRfkN8iI9HolVEkUU9+2uKQZu6Z87v+ril6dmEbBvLS0aSPf
         hu38Mkg1FLiodPunw5HwElKnOsSBSlXwuIGmTMBiImr89VUW/gpk9eq9VjwDJu3Ug0tw
         6BasFvVLlEDkHOX6kcWbnDDL6EZr2lB0Ndzj+sLu/X2GZ2PVy4ny3Zb16bnbl7rRRQwC
         te729oCQt3+ciu4LqYtlbCJtPXlAKGLyOHzWD8mj3iml7eM69G0pmlWSAyF6wfdqDe6c
         aWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511172; x=1790115972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozbdljbJWhuPCjAs3/0Yc8dEEkoSWPAnbLbDIm9pqjk=;
        b=slsc16YBMjEBY9pl/Z1hvJCzaz2pznuaLMAnk5OigDuPoMnF72sAWodJ5SUhU+Gtpz
         kS8RHlpbe4sbmGSC5hNmxR/w2klG85pogJ3HDS8DYT4tECHLW+Imk0s8aiQxmC8X06/D
         erUk9GZPsQA8pCN/NRGjCowMoU1EgMJETHSGXQJjhOYRkgmGbU2aDYtHhUtCeHirJt+X
         HN+g+aUaNysF/aJkMiDj9Abfs4GtallrxhNtoS/7t2pNnMsUcoJLh/TWf4JnDV0IntN3
         viidJocexK+4pRdKM6dh4hsH3768KgopPbOZCMK7lXNzdFluw34PIQe12XHP76ZsDTp3
         31kA==
X-Forwarded-Encrypted: i=1; AKwUvBwhibkYz0vJs6bo/opuNfglXb79cNn2KtBq2WCoCgkzSuw4rDgEZ515jEtKavFe9QTZbrbBJ6pPlpvplNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kKVTAWkqn8kepYdboKeQ6+vb99uF7x5+zsl4XumHlL2VwX2NWX
	20sDkFUKFIj4+jEI4yVvu8YjZpsW3OyHEOL4KAo0iJyPYWlOpKNAiKOm
X-Gm-Gg: AYBFou1D+afkxLsK0bfq4iVC6fy/jdq+VJmosQERw4QlIFLuHZsPSdC7mbIlfdNgKG/
	xyc0ivyrB7Xzfz4D9mSgkQTnGDYqkGYbrplhdssKHkh2hSPxoe83A5CMrf1sZt8gT88Znblhyv1
	tVTeGef+etKSkiPf9z3a5CBxcsnzXieCmxxhMSYLbDpxZZ+RFUuMD15FeMYMaJ2WmORl+yVMy5Q
	ICZlIIAjjV7QZ6vqTCOLk5cHFG2Tt49oziDXLqyw0/Qa+vxO91blQFxrZrRvdyv+Wx+FMr5k4IX
	lBmvpNDcGCFBBddA1Him2+D5doUZl4PWBMhyCms9ARZCBjiQOHhfQAki50sSFlMJPpnzhwGkRiL
	j2hMKb5prUwSdezIGZgnD2HulNTFfz75KvuAexu1cbCJAVb/T9rsiMh0jNd6/A9R9EjusdrqCfJ
	8fZjS8AfVxUK21ezWzGY5rHYhDfQ38FvF/2iTbwzWeIR6DFyPKSmO+HHvE/hzNSxdyd7RTbk5my
	0g5n2tZiGnFiDn15XV7UpJRbOi02fHxnk32o/in/dIlhiftszxRhLYF+hv9bDrb+bMCgxry15qG
	wm6Pz8VLjw3zhmrMku6wbz8x3rW2eNdVr7pqKIa6JpcMarEYnqcUTkV2ZFk=
X-Received: by 2002:a05:6a00:908d:b0:868:e11b:d859 with SMTP id d2e1a72fcca58-8723adb237bmr222206b3a.2.1789511171577;
        Tue, 15 Sep 2026 15:26:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febde2ecsm224189b3a.8.2026.09.15.15.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:26:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Subject: [PATCH] gpio: mvebu: use raw spinlock for MMIO regmaps
Date: Tue, 15 Sep 2026 15:26:09 -0700
Message-ID: <20260915222609.194216-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mask/unmask handlers run with the generic irqchip's raw spinlock
held and call regmap_read()/regmap_write() on the GPIO regmaps. By
default regmap protects itself with a plain spinlock, which becomes a
sleeping rt_mutex on CONFIG_PREEMPT_RT; taking it while holding the raw
irqchip lock trips might_sleep(), and PROVE_RAW_LOCK_NESTING flags the
same nesting on non-RT builds.

Configure both GPIO regmaps with .use_raw_spinlock = true so the MMIO
accesses stay atomic in hardirq and raw-locked context.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 03e977c2a629..674feeb31774 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -598,11 +598,18 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+/*
+ * These regmaps are accessed from the mask/unmask handlers while the
+ * irqchip's raw spinlock is held, so they must use a raw spinlock
+ * internally. A plain spinlock becomes a sleeping rt_mutex on
+ * CONFIG_PREEMPT_RT and would trip might_sleep() from that context.
+ */
 static const struct regmap_config mvebu_gpio_regmap_config = {
 	.name = "gpio",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
@@ -610,6 +617,7 @@ static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_pwm_regmap_config = {
-- 
2.55.0

