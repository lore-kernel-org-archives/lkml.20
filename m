Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E830C179
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762683; cv=none; b=NpeadlabmF+8jBG27YTNZeHdtEwfWq71s5/xW9sOkHxci91eHmXFTCKAp3j7O4Focs3bcRdqVRfkHQ6RqVLf0qQdIAldFYTOcJzDA5uJFYuCfI9gbzaSxkjmy0Ezs9l1f7GapHDbn1+x0r8ZxygU+B5KMOtRb0E0FfeUSFkyed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762683; c=relaxed/simple;
	bh=nbqcYtO9Lklo7s3PrhiXadrEIwtOhmem+2QzHg3gK/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgDQN4n+vr04o2wr7VZTGWZaREErerWOxOKS/CMyiZEJsMqZ7LvTPVBBQPR8+Tzd057y0w5Pdodldum62gy1dyt7QfdTbyHpbsEORMDESzsJGxZMXmov/odxOhz11+cQzkA2HJshiV6cMUbKaEIPQ+7FPjI71DJzyiUU+Auc9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq+RHQu7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq+RHQu7"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2250104a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762676; x=1789367476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dq0SpKsLNqUdhZGKulcWkvLVKywODwI8oaC6/cTsqsk=;
        b=Hq+RHQu7B6/Xpwf/2cTdUvKf5f3p8dM5e1vJxdpYzeUsaYX6oTGO5vR40QqgkZB4dC
         2CrBhv7ryAli0mzAIDrZQtelzvzIijlVjxf4t00uDBiDUrNSUgAmCOCQw2RXmotX9T0F
         Wp9dG2BZAD6X0dItEpJ8RdbxuxKxtUwnA1S8AVucrJNX58x5gY8f233A0lOdkHTZXeLO
         TB4E/wETsw7CpN6aWGdrFCo7dXu8UhOBgV6vBjaNOWnFZWXSnVMdJYP8VL/WXZBz6cRa
         ExGBG5WONPjRxlqSIWbfBPjprdMG781yDgkPm8ztKVluTKV4mXv5+rIQPdnitZncbK84
         qlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762676; x=1789367476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq0SpKsLNqUdhZGKulcWkvLVKywODwI8oaC6/cTsqsk=;
        b=P9Kg5WGWJ84fmr6qhijQBtfzWiSoGehNYGcZ2qf12Ca867ak3SSUpKxrANgCUTOuMQ
         FXtTSVt9BbKeGD7gBbB8sQY50vUcrs/T6V+dQQK4vsD11HvUGwkRC89gMgEB4CqyCfjF
         LF0tt1aKQJOfEwZbwf0kCNOpQPsRZep63AwtORhfpGWmATY6HhEoGtIl81AMW/SjGfKr
         W8D1wREHjH+DlwnSpOQGPETB4vvF098RopWi3HJIAldjdV4amkqaumUtl0G+P80hdEpc
         EwWlqlv3D+/QX2J3Sp8wpKMqftZZYPPA3dxc5Nx+aE5fBKYLGODSc6xqG8ZYRzH+q5GM
         6YSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZLyW8waDeG94asghuk1W/1lJHADOwD+qcXwNOiFN13+PEJmfHwQsJkzt8bprjlyJeZPJfDJ0fo0gb8N4=@vger.kernel.org
X-Gm-Message-State: AFuF++mvvtnfzRbLgIhE+thks4vUseohE1KrVerX3qQ7bKGXEQHly4QP
	/rhCDQ7MYNXMALTDx1eA5K4EsmgivdfhvLxxg7kO+3QFh3Q27AraiYC1
X-Gm-Gg: AYBFou0x8WrAhWgtKmLjObtlGiE0AdZ89/ZMmUG9UhoMBmyQr+RVY1pn6dQdsy4S3nn
	doi/G40NIkIsxNeiiqxLdUFLsgiaLg4JuHRfztJS+/JcKKAdnSIhSMBrO8+G9gdaNWP+ofEwA3Q
	hzes+qgFplAmdLHIVFvs/2c7PGi1QJE15dHTdoeaeiFytrqw0GCMyocSEaB4PhtFF9np7gT8QWZ
	eP8hYq3FZFrsqhV79gS+TFi6gl28l3tR859wac121X+AQ6E8ED9PnLLXjKgYsag1VGVwsu9Pyb5
	UiziMgeIhGWCuSnZSHLXLDEOm91PBZEOMDjc85KI74wFsVHed3JpKEPz31Y90Kw7pF+NAmi6JrV
	6MQv7QoxaRGadfM2pfXkaWk+tNepVuLShu1EE8K2yKdmScX4VwVGJ3u5xVukGXwedmfszqg01ev
	ymCDYMB0Ewi5h/BSgMgCsj4vJg0Fn4Uf048b8/AmYuhO37UTm/ZT7qvpbsHzq5yK311YLzHjKTW
	1MXtzUEJk5OAImCWHX/BtDI
X-Received: by 2002:a17:90b:2552:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39b262728cdmr32640824a91.15.1788762676486;
        Sun, 06 Sep 2026 23:31:16 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm28325245eec.1.2026.09.06.23.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:31:16 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: fix typo "occured" in comment
Date: Mon,  7 Sep 2026 12:01:11 +0530
Message-ID: <20260907063111.19769-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "occured" to "occurred", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5a0db928a90e..44237de52250 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1486,7 +1486,7 @@ static bool scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *e)
  * @pnum: the physical eraseblock to schedule
  * @force: don't read the block, assume bitflips happened and take action.
  *
- * This function reads the given eraseblock and checks if bitflips occured.
+ * This function reads the given eraseblock and checks if bitflips occurred.
  * In case of bitflips, the eraseblock is scheduled for scrubbing.
  * If scrubbing is forced with @force, the eraseblock is not read,
  * but scheduled for scrubbing right away.
-- 
2.48.1

