Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5482D9EE7
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263384; cv=none; b=Ms5M51rjoBn29iGkAtFPkVP8XPlaK56/R20qm+2Zz3z2+djUZEaukIawpcf0p42ginS0FHUqPE0nFguf8/CEX4ohKh7Mv34ElBw7UchFVQiHKvBuJtkDt/xLT+gTbZyCpisa1x7ZqM2DtNqzd64yB0NqMQXjk2jbh0AfLiICGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263384; c=relaxed/simple;
	bh=CLG4pIWs+GXLzx1JxRiZwDT88JUUqtuw+0n8R3rJCVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajG6MyZQCNdTW1Fu4l7nVwTqvRs3yiBmfihx2yxppKD2JPXLYckYJjQkJWZmbZj/bu0cXf0DOmyWCAW6sHXioH4JlrAsjCq6WMfd4Y7mC5jmKa3XnzQcF/LBfkLXtYF+qE0ugTJMrDbFLLYkmXDLvA+7CSWtq9iYcODRv9wqRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8RrLswU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8RrLswU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-530de0bab75so14290331cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263382; x=1789868182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eeDB9+yiOFXebPXFTGKBEDrl8/FEvZCQ3DggE9oyvos=;
        b=r8RrLswUdAfVYBWqabZj7cvDxBO7eOVbjVoMU7ZRACs79b11dCNIz6C7WYYi7vJ0q+
         /V605V8wncvWt1FBFJxSzv8nYc00hJ4Las7XyHLxiNdOm0rD9xt6AXA/J25yJJrt3C6A
         6dr6PKZqVSlxp/CGpU0agG2OBA2aDF4ff4OnFeNwaysQPodFkL+xy6en0yAGL3QtIhbp
         +hh9HNust9YNMBNDUY6wpqbsdZzc1WmU/y+g+5S4aGJ14kmMuKqThU2hyw02LSyvrzcV
         BSWgSsHKUr2pnQJKQ6hDaRSaDdzVYn1N9kTNgsZAoTyk21VEwW/VIZ9aF20ispZexOUj
         yyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263382; x=1789868182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeDB9+yiOFXebPXFTGKBEDrl8/FEvZCQ3DggE9oyvos=;
        b=JNjpnrmVrem8M47OBCjOdc5x9leyY7PyOf361I0ZCOduGkbx6T+Yq3ELedX4lL0kn1
         GSjFqdQs/ZJWfRB5I0XsRM5f2rnK0dm4urHQfbaEz+0RNk97xTjOXe8ygS0Qr+MBJ3XL
         2BEJF1rhxMdBnRm4E3vh9XEmZX7SvpGUEtWLFGXcoIrFQF3BAZUv6YiiB58ueQv+08kT
         rbiQ+2k9OAr2cbS5kfTNfI04ECYexPTUSdAef6CsAjuNrPFjXOrVPQhF5+4t7ntswFIv
         opFD0NJf7ULOv70Wkz+xIpCJszt0TR9xxQYIZNbAtTSMPR0Pig4k/PQbka/KnQYuk0Iy
         X+Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzOdL2daiSao3yCrQg4cvvBfxbWxRg71E/dwByP8HsnuDu1C0pRtnjoL5VyzM+46iYu4nVho6ag1oFbqZk=@vger.kernel.org
X-Gm-Message-State: AFuF++l2iBgSUHzSbIznmVEmKORLMSa5LB5F/KvAy2X9yqn+KjT3iWyO
	Lj8L/zf7BNxWuO04tH8yhUSnx390WB+/aKEuyE2mmcgOtyZgVQ1o6h8=
X-Gm-Gg: AYBFou3krRCr6X7ixDbHpGxThh73dY5AfpF6LXPrn8yqCB3kBnsNEC/rLO/31Zx2weK
	UxKHzCYlkjp4zyA/ZEEQa92Z4HV5dh2Di7h/UEZSfpULq21dFWZNiEIbsf2gD4cblwInr5wmAmx
	+P46f8dq5ngv8WLIIWIsrDrClsLASwi5OQ+CLD8r0f0yzaqxjTTRswcSNZ3+qDHrwpScPg8f+LQ
	xtYxEigNjF6KH01QY116BppIKDxP056m/HW18zhPvAkn/wvEGqOuJsuE18qmj8N+arTHCFj1ICc
	Wq12zXMD9tDpIkbOjjnkDW475m/QFnRfEh6wZsHKAN0qPUPMs6j9uY65RvJKKlyuYfU1ClwOtNX
	eHzYbJfBvldbDwGC5OgyLqH0SXnQPWs3J09dQMXwyfjZG89t/e80ye9aUv/P8HTs/15zCGxOM/K
	u77VlZvJnhPKmQGAJ4D9UV4y9ewql7BLhn+/nZjIGQ8rnvW04wwQrk/bWLHyf3VE7mcmug4ykwR
	K8VVT7W4x4xbeHvDPbLNIqUAvKvITT0k+vrTXNK+r8uH4Ezf5IPO/q4sz5L/IYEmC/Gv1M/yKDl
	oa+fggDMyKCP0efHuNIAOsS+idp9/G2nSg==
X-Received: by 2002:ac8:7f4b:0:b0:530:e89b:519a with SMTP id d75a77b69052e-530e89b5841mr73249931cf.22.1789263382215;
        Sat, 12 Sep 2026 18:36:22 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530f6823ba5sm13156941cf.28.2026.09.12.18.36.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:36:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: intel_soc_pmic_crc: balance IRQ wake enable
Date: Sat, 12 Sep 2026 21:36:15 -0400
Message-ID: <20260913013615.22615-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
after registering its regmap IRQ chip.  When that succeeds, a later
mfd_add_devices() failure or driver removal leaves the wake enable
unbalanced.

Register a managed action only after enable_irq_wake() succeeds.  Since
the action is registered after the managed regmap IRQ chip, reverse devres
order disables IRQ wake before tearing down the IRQ chip.  Keep warning and
continuing when enable_irq_wake() itself fails.

This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
variants using the INT33FD ACPI ID.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 516523846006 ("mfd: intel_soc_pmic: Core driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/intel_soc_pmic_crc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334..963dde430 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -164,6 +164,13 @@ static const struct crystal_cove_config crystal_cove_config_cht_crc = {
 	.irq_chip = &crystal_cove_irq_chip,
 };
 
+static void crystal_cove_disable_irq_wake(void *data)
+{
+	struct intel_soc_pmic *pmic = data;
+
+	disable_irq_wake(pmic->irq);
+}
+
 static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 {
 	const struct crystal_cove_config *config;
@@ -195,8 +202,14 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 		return ret;
 
 	ret = enable_irq_wake(pmic->irq);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev,
+					       crystal_cove_disable_irq_wake, pmic);
+		if (ret)
+			return ret;
+	}
 
 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
-- 
2.47.1

