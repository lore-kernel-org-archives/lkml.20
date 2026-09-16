Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F03385D82
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571677; cv=none; b=P0F40Bo9rMo/hFUCH4noXYK8MXLJCrphNTy20aVJE03ighoPke7oGppvxFMpEyaRyqaGqNR7YE14W+yJHwIOEg0HcE9pWjkM2GS+5tOGIr+AeVdkrHjE6ccnoM+fl+cSCbnvqJgEhr0rzNtf4SmvUZrFbnh2uZ8THfC8lERjyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571677; c=relaxed/simple;
	bh=nUUjUdGUUsvuhn5umNHySVisJnl1SGUPMpuXtSuKcQk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=suqKsQDG9uwx/ans1dLW89SbBQQsoWC9u11Rr3fesHhTPS7p7z2zfs+rq2ZnrcfDjP7k/3Bm6SCuVGgqkGH1P37Cc8SMKH01Y5zhhpU57VKTZZESPhCa2rfDi74Gw4p+os8ESpH6aVKS1DXra0FAFGJuDJHvCZnaDjNHedWbliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6vZuKaR; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6vZuKaR"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so767023a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571674; x=1790176474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzZFS+07LYNgqUw5Sz0SzmYR+BhjGsAYsE5pVTdZzpk=;
        b=d6vZuKaRGfaGzsu5xd2pdIb8o+xYemmEHkK5dwuD023FOC4zaCuDKFbd1+7wfSmi9L
         ELbuCNJQAbZa8qtP7UaCkUCpu+eY06yHUBwp5+AeccYD4tnDZ4dP/Opd5uimwftBAZ1+
         Ll/yweav3Fz/rRjYUzTa8ZH+u9hQOIes/Ki8HttLq2BOieMe/n6gd1ywZJbkP2APy5Iw
         dLsoXEjbSyoUkKv879P0qFeP3Ils/0sI/H6EzpOr3ZFrdrO9seqUw9Ia2RYszgwGyJG5
         l1r5SaebPivUYv5Vo0N4A0pB9c8Z+Zo5uPc2chTIn4Z7G9Eu40F+asAnEmZ5YwQM1FSi
         622g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571674; x=1790176474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzZFS+07LYNgqUw5Sz0SzmYR+BhjGsAYsE5pVTdZzpk=;
        b=hHbgeCyHtpRwrvvDi8G2ilhpaTVYwyS0sN2qGWOFAcAz0Rvgejf/xEovBsnSXoKDr6
         KZoSpBNZryEUOUWgIX1iBqFaf+iIzxYn0QVbUjuflOl8hEXdd+zT17BgUSKCR9vzEIwE
         NbtHGfCKBN3ehBJBma7jRRTcBCTDiRNaumQg0LV5t+b4efCFeJ3LH7cZr6GMAwN63xug
         YDsykW03zwUg+VRpm6icY5OqMY7J+qows+xVJlPO83nPE7KZ0eAJjbGwygFmrb5/WPwx
         xovtoYXp+LppQTJCTzkoe4anS9FzM1XnXGY9YHaUIh1x9+RMOzSAs6dwc9VHh8+YmCQI
         tALg==
X-Forwarded-Encrypted: i=1; AKwUvByYq5dR1ceLScnQNtvvGFqQYe5baJhTjALwkBNsqRT0hbOTJvCYr5t9PgBQ3t/UHrtWIYM5mc4Cx/AUKIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++liVNMGQpaCpQAa/3bW8qF+uaLn2XeKXoHZ7l/ULD47WTQj6Ai1
	jdls2WOL5jGqxxBYd/hh8W58tI5akrA2c+PlaCMNkaF6MY17GSkkXHE9
X-Gm-Gg: AYBFou1aJinfvmcyMkweoSUQcCD0aKmxFsjb+R2E5QmMngkgjDSlkhpV9S/fqpRcLCg
	G5eRJliKm7jek+HVTjAcZyVfGdgXbzGj1nkiW1XJ4squ8SgQ8tFa4H/rELLPES5I6sAYZeP8rck
	REDhpAOBj9h3cf1ZdN9lx3vRBFefP0jPjqAIGB8ulWULD80oSCEfUW0/sAgCGN7WzrTHXgir1vw
	nre65dTa9PAzXSjzJPwpD1RgfX8i7bVaCR4QQsJL7mAzOnwUlunTaI4jsDOIflV5saFh49icGKy
	7zHwKbqim/JZX2364tEIIpZg2P+lvXotAWs7LMD3s5V15dvzleNtA3F3i8ZWJE0/VMx5KTw4X6L
	c4edoHI6XZ5xSZ8dsvmJd3OtjVHL9BKP37Z6IvrYDHQtGKQN85KxVMVOBPqnu8cpiliOwzpGErC
	trD8cPGqxrhN9hqnjLPhnVRmGZANrV7yqXuM4kKeikeQYZ2b8jpDKmIS8qahZu5doDgaui1W7B4
	GFGibIf0yih/7DBiEXqnkdlCGiP1y7An5euwWJVnHrcgbUMEA==
X-Received: by 2002:a17:90b:2744:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39e1e45bc52mr6388584a91.12.1789571673964;
        Wed, 16 Sep 2026 08:14:33 -0700 (PDT)
Received: from hyeonjun-ThinkPad-X13-Gen-1.tail710e10.ts.net ([124.197.199.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b69331esm5569848a91.4.2026.09.16.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:14:33 -0700 (PDT)
From: Hyeonjun Hong <hyeonjunhong330@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dorcas Anono Litunya <anonolitunya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyeonjun Hong <hyeonjunhong330@gmail.com>
Subject: [PATCH] media: vivid: initialize control update work items early
Date: Thu, 17 Sep 2026 00:14:01 +0900
Message-Id: <20260916151401.2536111-1-hyeonjunhong330@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vivid_create_instance() installs the v4l2_device release callback long
before it initializes the update_hdmi_ctrl_work and update_svid_ctrl_work
items. If any of the error paths in between is taken, dropping the last
v4l2_device reference calls vivid_dev_release(), which cancels both work
items while their work->func is still NULL. __flush_work() then trips
WARN_ON(!work->func) and taints the kernel.

Reproduced by asking for an HDMI input while disabling both the video
and the metadata capture nodes, which vivid_detect_feature_set() rejects
with -EINVAL:

  $ modprobe vivid node_types=0xc1d3c

  WARNING: kernel/workqueue.c:4400 at __flush_work+0x9a7/0xc20
  cancel_work_sync+0x90/0xc0
  vivid_dev_release+0x1e/0x170 [vivid]
  v4l2_device_put+0x80/0xb0
  vivid_probe+0x257c/0xa3e0 [vivid]

Two such warnings are printed, one per work item.

Initialize both work items right after the vivid_dev structure is
allocated, so that vivid_dev_release() can cancel them from any error
path.

Fixes: d7c969f37515 ("media: vivid: Add 'Is Connected To' menu controls")
Assisted-by: LLM
Signed-off-by: Hyeonjun Hong <hyeonjunhong330@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index c042d92db175..ea0b5ae6f437 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1820,6 +1820,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		return -ENOMEM;
 
 	dev->inst = inst;
+	INIT_WORK(&dev->update_hdmi_ctrl_work, update_hdmi_ctrls_work_handler);
+	INIT_WORK(&dev->update_svid_ctrl_work, update_svid_ctrls_work_handler);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	dev->v4l2_dev.mdev = &dev->mdev;
@@ -1913,8 +1915,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	dev->edid_max_blocks = dev->edid_blocks = 2;
 	memcpy(dev->edid, vivid_hdmi_edid, sizeof(vivid_hdmi_edid));
 	dev->radio_rds_init_time = ktime_get();
-	INIT_WORK(&dev->update_hdmi_ctrl_work, update_hdmi_ctrls_work_handler);
-	INIT_WORK(&dev->update_svid_ctrl_work, update_svid_ctrls_work_handler);
 	for (int j = 0, k = 0; j < dev->num_inputs; ++j)
 		if (dev->input_type[j] == HDMI)
 			dev->hdmi_index_to_input_index[k++] = j;
-- 
2.34.1

