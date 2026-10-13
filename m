Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A74547071
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849910; cv=none; b=JjQ9pxowgRtmOpjNU4HHlhR7zbwTuZjuj+4YJz06aPR+ipEeMdLwCQTfCQLXzHfue+1CQokRnj0ZVsCvA9oPO/D5nbGnhsXNpgRg3ILuQVPelTrOIPew+vV3sTGLHN/CpX9eKkBj7Swove5b24PqBqk1kAKklhSLdbiKtyy3Ba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849910; c=relaxed/simple;
	bh=1nSaf5dHCcGlxOthOkB8dzKLJJzBElMAEOg2aRavAvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgjFqpRirS8XW2bNOse0QnXAhc07qCOP98Ztv0kLLi5oc+SzVCAGPNNOD8AHccD1HXOfRCQcKTN9zm1DoErLk58IzH05x6ZVjeBOAeKss/0UmhIXJc/rgtJUiWP49dfrWOkH2yFQ7DNVtr+6mNgn2EgrFgIUsqb5KdxkKSrYZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpfmxXuV; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpfmxXuV"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab62a8250aso1253070a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849909; x=1792454709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3odENUgpUUPxeWU8R1t2yGTiKBLazzJrhjqN4tmFyU=;
        b=IpfmxXuV+zbZnQG3Ol+p2KXGaOEjSrv/U5wOMaFE9Z+vy8+kpMVXsfLKvSbSIsF2BN
         Dz26U+nMUeWZTdQ4+wEwRtDNl8eHtjiKP9Gf2MzOYzGuhLFR6WLJlit++bps4M9ZysZv
         I5B6zw2EDqw8NQgX2Tb42Nqu5cjOosM0HAcP7Rubv7Ash5j8FJJnA/0qgKxxVFQ8idsy
         ADLEQRPo3PcpzpvkcqUmyFIm9h4zJ1prq9J8Vbqp1kfhFCoa2e1EvzacaToZCKdbSgaO
         E91tP47JgxZPNwJoEW6Zr5y7V22OqL0euWHhBEKXumGp0PpjxjeX6mEJtx/OFoylcBMo
         Qzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849909; x=1792454709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3odENUgpUUPxeWU8R1t2yGTiKBLazzJrhjqN4tmFyU=;
        b=ECOlCXXbvvPhZgY15ck3jdQmR9tz89DSiJOmyv8+5V+HJJJywFrKEuRVS3QzsfVpi9
         Kf4Lc3ObfNaqKj+uwT2yK8AHyl9SUU1UUlfNQBexw+1A3S92rNoVw9j1RDlu7GpmynGe
         fmBtH8pbAofTXx8P/bGXAy0+lIyhXIwtINlhZf3MB9sq4UPXsvdJwtxuH4HPqrzbAGq0
         hAw/KCh1fEiu3Jy6ql8jmEkZdybxroBKmHTVeD83w4hTcqfLhivzdPrNtAKPiNr7YrA9
         YQFYg5iXz5FXgP23mW7Z/O/4BD4pHtfov9LbEnrMrWeJR5x3i8C8ny9XTr+mBa+Tyb/X
         gqjQ==
X-Gm-Message-State: AFq9FYJMk82J7B215qmGmPqSp1yDkvTjWPUNUF6F6kHzpu4rE/FeTBM0
	vLCyz3Kkz5gx7oCpZpKgbdgdzhLADL54UAWTugeb2Pk4GFgxBTqEqCtbIO23RQ==
X-Gm-Gg: AYBFou0Aq8x4QvVZtOFt3yzwHFLIJ+7bNj6r98BQgAoIyvy3T5oq7ZPLtcZMUiQ2wrL
	B9HvBep1G5R5MzDfOFtDo4wSr0x7+BZauDy1PuTc3eAh9K0hpPth9Wg6dIbosdPVyCm5Gd+CTXx
	A10zENPn5cE77o0B63TWblMiKfGx8tUWeoRp1cWmx2pzr0hn1WBOpsl9d2G8xmSMIiRqerJkqkW
	cimTfbdbI5VO9SVSVxGMGRBbHgSnAlqiDfQ8HU+tbIRsHfRSvwFtApTjmsrMWglxe12GaEqG6vz
	4k2Zmx//sfEeJKUaXFmtsnpMs2XCWUk/s6vORjQFf3yt3TDAFKKntLYKQN4/kaUKN9Vk8LJA50x
	26G2m1vI+PhIglyKq3vochESosPoC6dFS61RyOjbECo7AOfoGAohe1Hp7GzxTYCs/1nMHN34TLc
	Zw/DqDQk2WN6P048suT740eng4Y4r69l4q8GJFeBJOnizfn0dVNenOax/9VGjy04tze6LJ33/AK
	nysF6OC2HH2E6KIMu7M0IvE40BUfjOmfxQSDnyoYncnX2TgWcA/u/ixDMqaPR+OamiWd4Ek9HFL
	E2F3U3BDgs4pFVnia3bJAsGBUgoYQJLYa3YVXlV/pB7pPU4G
X-Received: by 2002:a17:90b:2644:b0:3ab:d45c:59e2 with SMTP id 98e67ed59e1d1-3abd45c5b56mr3662383a91.55.1791849908644;
        Mon, 12 Oct 2026 17:05:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f5509fsm18603057a91.12.2026.10.12.17.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:05:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] extcon/rtk-type-c: Use flexible array member for config storage
Date: Mon, 12 Oct 2026 17:05:04 -0700
Message-ID: <20261013000504.802833-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert type_c_cfg from a pointer to a flexible array member embedded
in the type_c_data structure. This improves memory layout by combining
two separate allocations into one, reducing pointer indirection and
aligning with modern kernel FAM patterns.

Move device tree config retrieval earlier in probe to validate before
allocation. Allocate both type_c and type_c_cfg in a single devm_kzalloc
call using struct_size().

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/extcon/extcon-rtk-type-c.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/extcon/extcon-rtk-type-c.c b/drivers/extcon/extcon-rtk-type-c.c
index da0b3fd3676e..ae1a4726fb63 100644
--- a/drivers/extcon/extcon-rtk-type-c.c
+++ b/drivers/extcon/extcon-rtk-type-c.c
@@ -63,7 +63,6 @@ struct type_c_data {
 	struct gpio_desc *rd_ctrl_gpio_desc;
 
 	/* Parameters */
-	struct type_c_cfg *type_c_cfg;
 	u32 dfp_mode_rp_en;
 	u32 ufp_mode_rd_en;
 	u32 cc1_code;
@@ -99,6 +98,8 @@ struct type_c_data {
 	struct dentry *debug_dir;
 
 	struct typec_port *port;
+
+	struct type_c_cfg type_c_cfg[];
 };
 
 /* Type C register offset */
@@ -1321,10 +1322,18 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
 	const struct type_c_cfg *type_c_cfg;
 	int ret = 0;
 
-	type_c = devm_kzalloc(dev, sizeof(*type_c), GFP_KERNEL);
+	type_c_cfg = of_device_get_match_data(dev);
+	if (!type_c_cfg) {
+		dev_err(dev, "type_c config are not assigned!\n");
+		return -EINVAL;
+	}
+
+	type_c = devm_kzalloc(dev, struct_size(type_c, type_c_cfg, 1), GFP_KERNEL);
 	if (!type_c)
 		return -ENOMEM;
 
+	memcpy(type_c->type_c_cfg, type_c_cfg, sizeof(*type_c_cfg));
+
 	type_c->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(type_c->reg_base))
 		return PTR_ERR(type_c->reg_base);
@@ -1361,20 +1370,6 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
 		}
 	}
 
-	type_c_cfg = of_device_get_match_data(dev);
-	if (!type_c_cfg) {
-		dev_err(dev, "type_c config are not assigned!\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	type_c->type_c_cfg = devm_kzalloc(dev, sizeof(*type_c->type_c_cfg),
-					  GFP_KERNEL);
-	if (!type_c->type_c_cfg)
-		return -ENOMEM;
-
-	memcpy(type_c->type_c_cfg, type_c_cfg, sizeof(*type_c_cfg));
-
 	if (setup_type_c_parameter(type_c)) {
 		dev_err(dev, "ERROR: %s to setup type c parameter!!", __func__);
 		ret = -EINVAL;
-- 
2.56.0

