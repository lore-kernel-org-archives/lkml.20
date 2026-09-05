Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3464A091F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620700; cv=none; b=bko2GunYGUEpKbpY1JeQ+sGE2jzz3f2u/EMrp0frsCSWzbCamVNJWYKVTXYB1fZpQ1ztMCbpGpWHKK+TZEfc86f3Jt1YC3NHn2adIWYb5vciak+av6bFEbnEq4i0O+V0+mYKQr11GAiU+scE1c2bkXlpZlPxJgwKzMfu9ijbwH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620700; c=relaxed/simple;
	bh=vzCLdzwVDkmEvFXFSjIK/EbVy4grvzU5TVEOTYzHBhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kOhUhknhySnNwA2aT7Qd4rW5K1yQZ43iQfWCsQIuWQ+g5BLFY8WLEXh+eCtdgO/9ShmJwiuaDbN8krpt37Ne+n89S0oPXiQzLxdgwQPT20NktbiS3j1HfRg7fIg4qSB1SBrkuxg6IqEUb9HyqpN1kvBUqY4XT8feUSt6jLMvxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx3prEEm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx3prEEm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740e4so792195e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788620695; x=1789225495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM2S1Q42b15aXVJKX75peJvXAR4lZmt0uA+gclfAVgo=;
        b=Nx3prEEmtQthmIBi+auFHNpckXeTadJWYe8WSnsqKCWW/9I0EBPAuSyrubiVlB8usH
         5v0bAudEkP+secRmqSc4YbxGuExKHIWzvQtozYCldRj7fkqPlF9pcNi27ciqghA+87DV
         55iU+G36xvvP0y/Hr7L8kn5L/ZKxBdKZfpgUAwKub00nzivEaI/2n7sCjNfNpofB9dvA
         L9s4+8jTAXf3btmnvGRx5eYObj2rm7VFh3FEUP+2e2SR7jo41b9R3ghAlyMJ4Tx21ECB
         FxSFF+nPPGr5+aBNze4dwpnGex2N+93g7nzCiR4XOb2iU/OkS78MyTg9h45A0HQDM224
         zNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788620695; x=1789225495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM2S1Q42b15aXVJKX75peJvXAR4lZmt0uA+gclfAVgo=;
        b=FmENpBKCOueWz3KuCOWE17yOGvqy0Z0Hix4cSg6nBCZTsEirdg4eEX8wxiWzhtLUXO
         hZ+XQubGHg0JWJvK9roPALiNZPnEafpsmvma9Z7WOHqkhjg1CVaqdeuZLWmBLTT/MzzF
         buc9rUZTu0r5bt//SwEwpZKnHOE/pX/woxUJ4hGqSXtwYsy6hIQkv17yCPDWpgZBwSjC
         GDxFzb3KPF45Bj98xNKmxcRRskSR4mVV3oNhRZAl4u1ZsXzt50ed8RDL6ohlXnAXxj78
         IQct1qtksKgQ2omszwESPFczIwdCeQZWeTW38yMgIMVHem4oltg7ab4szb0ET44b1EqV
         9iUQ==
X-Forwarded-Encrypted: i=1; AKwUvByNyRq9VRlQhcFPGvaYGwKjCJAjkkgrYC0ZAieZV95sGWKvig+NEnKqiCEzZY5DMy9DOq5EwKdUOiBtjp0=@vger.kernel.org
X-Gm-Message-State: AFuF++lyfFTvexaErl9Wrazcs/CvHlj2M2LcI2kGJU8122BRwnH6YTNZ
	tqcbvF9VMnYemCCMpYM6U93Vu9zqdyE3LIPaWJHRGvLOBQfptpib2NsL
X-Gm-Gg: AYBFou2mG058mJs+tx+O4/5BGWk3tum6PqUOAG8g8JZStTP0yTGEnrm4lexjeBYEiFQ
	ORGvI8tadnwL2MfDfgPNUJx85G24QEs0563deNVOEl/+Gh+akWkS2XE71zT34MZ5OE2sCCUlBrY
	Q2pdhsJkZOtI0C/m0XZbRUGFV3J7jlzXvekEz49jaIvx63XA6wHQOLq0OQZJ61BzpNclq07XE5T
	thAgrpj8EkfO3SZNKTrbceFIyKkBG7nhDLz73J5y+vP0pIRiaBcMdU0ikMu0pMYqKrRbhe03Os/
	U0BQdU/I/SHo6d2gCmR5p2aUSGHQXrQwXyzBXH9Wkq/UyJaCfKQDiYkFpyOKlBVDxAaDrhjQN6G
	mXElL8hQewj1G4O6a1AIWI8aILjZOMT+Yhu/wZeryG+3x87sRRGbUWmXQU00DeBWhXM0CS96lBr
	HdmGyd32MMdEM8+eDZ2sYMhzZx/gW96CMzrMdxKpj+tcICgRxnBlzX+lCYBx6fOrvIuUOycgMO6
	qD5CXZdEJpNM/q/chuqrTHwQRNuDt/cm/QyL7gzyEKw2dRGhSKpaMkWqPHJRgY6SRc=
X-Received: by 2002:a05:600c:34c5:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49cf823c012mr101940875e9.1.1788620695367;
        Sat, 05 Sep 2026 08:04:55 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B950E0061C002CD703C2CBB.dsl.pool.telekom.hu. [2001:4c4e:1b95:e00:61c0:2cd:703c:2cbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm142811705e9.2.2026.09.05.08.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:04:55 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] accel/rocket: search every core slot when looking up a scheduler
Date: Sat,  5 Sep 2026 17:04:32 +0200
Message-ID: <20260905150432.7477-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_to_core() walks rdev->cores[] up to rdev->num_cores, and
rocket_remove() decrements num_cores for every core it removes. Unbind a
core that is not the last one and the cores behind it fall outside the
search, so sched_to_core() returns NULL for a core that is still bound and
still running jobs. Neither caller checks the result:

  rocket_job_run():      rocket_fence_create(core), core->dev
  rocket_job_timedout(): dev_err(core->dev, "NPU job timed out")

Unbinding the middle core of the three on an RK3588 while three clients are
submitting to all of them faults twice, once from the surviving core's
job queue and once from its reset work:

  KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
  Workqueue: fdad0000.npu drm_sched_run_job_work [gpu_sched]
  pc : rocket_job_run+0x234/0x838 [rocket]
  Call trace:
   rocket_job_run+0x234/0x838 [rocket]
   drm_sched_run_job_work+0x2cc/0xad8 [gpu_sched]
   process_one_work+0x640/0x14f0

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Workqueue: rocket-reset-2 drm_sched_job_timedout [gpu_sched]
  pc : rocket_job_timedout+0xf0/0x1e0 [rocket]
  Call trace:
   rocket_job_timedout+0xf0/0x1e0 [rocket]
   drm_sched_job_timedout+0x188/0x6a0 [gpu_sched]

Both are the third core: the workqueue names are its device and its
core->index, and it was left at slot 2 while num_cores had dropped to 2.

Search all the slots that were allocated, the way find_core_for_dev() now
does. A core that is still bound is then found, and the two callers get
the pointer they already assume they have.

This does not make unbinding one core out of several safe. An open client
keeps an entity pointing at the scheduler of the core that went away:
drm_sched reports it as not ready for every job that lands on it, and the
client waits in dma_fence_default_wait for a fence that will never signal.
Stopping the NULL dereference is what belongs in a fix; the rest wants
more thought.

Reported-by: Sidong Yang <sidong.yang@furiosa.ai>
Closes: https://lore.kernel.org/dri-devel/apwUewaRnoTNXHCt@rock-5b-plus/
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM sparse checkpatch
---
 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 3141f210fcd1b..a6c24dfe0563a 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -283,7 +283,7 @@ static struct rocket_core *sched_to_core(struct rocket_device *rdev,
 {
 	unsigned int core;
 
-	for (core = 0; core < rdev->num_cores; core++) {
+	for (core = 0; core < rdev->max_cores; core++) {
 		if (&rdev->cores[core].sched == sched)
 			return &rdev->cores[core];
 	}

base-commit: a9f09b5ea0c3db1e2d4c0f8d3ebdd612d8aa0366
prerequisite-patch-id: 519bcdfdde80d902309c8346f749ebc4bb6b29c0
-- 
2.43.0

