Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F982F6577
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569024; cv=none; b=e5MwQ5cb8JUSosC5JCwxcIWJ+SsD8g0uHRDGZgmWY8fV9vFc3VcSRo88JhJ63iush6icCuuBYyr6uCE2Ag3lVMNhgUtm9/0C7IiWu+ssAzRqVBawV9I0q7wyTSh94Ax35y4LNe/7UyWMJ8928BvRAqBnqH5Xw08tOPMo0OXDGrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569024; c=relaxed/simple;
	bh=+J7RZfgL5AzajAk1mEDu7gK55yvVTLK8+CL9C+Luh6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMtJED6CBIh4Y/D4ldb4aA4jS9xEDV3fXcfBzT/Zkb37G0HQnXzBUx3dgo26bFEfnXtYgCMhJZPClrV5UNG5f0MzeiyzWgda/uX7ztSEZnfgzWrpVXTSzlWM26sC7/u9mFlNSeqyu+WhyCxluo0nRoVpP3IRNHvDxiMxDJHH3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmg3u+gO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmg3u+gO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894121F00A3E;
	Sat,  5 Sep 2026 00:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569022;
	bh=ai8d/z/jR8St5LaF9248MzOc4BaNMXKIfXmoxvaaQR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fmg3u+gO26cscy/kVF7NaHY5xew3/RlZBHW2BhVS2DMWWEueiFnddNpz7Qh8V4cMs
	 GcGS8muP8rHUoO/xK6vjnTAry0ab6FjGFY9l3HuHwGo6bOP0/9apsFdfol628O1I1L
	 p+UQ5ezM2YATHcdGPXPjQzyiIzyP/pCmJjWyaYfivgrfwWL5s9eVlatyclKUfTzV6v
	 XFxLH6BfvEOaQ5Yr/J4kwdBZ0joOTwi7o4Jg4w5KadjzvxUSEyEsLCnvQym1rCzrjz
	 +sREwZchTgq0/Rs1rZwkhLzIXDx0bvsETmlVLt+OtNHIInsZp8Sp2UdComS2qFqA2D
	 RSRX7rFkmbGSw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 04 Sep 2026 19:43:20 -0500
Subject: [PATCH v2 01/19] accel: ethosu: Suspend after initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ethosu-fixes-v2-1-3767738756a4@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
In-Reply-To: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The initial runtime-PM reference is held only while initializing the
NPU. Release it synchronously from ethosu_init() after the final
hardware access, before registering the DRM device.

This keeps the runtime-PM setup and initial reference handling together
and leaves the autosuspend configuration in place for subsequent jobs.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 8108622de258..df76253d01a6 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -338,6 +338,8 @@ static int ethosu_init(struct ethosu_device *ethosudev)
 		 ethosudev->npu_info.sram_size / 1024,
 		 ethosudev->npu_info.pmu_counters);
 
+	pm_runtime_put_sync_suspend(ethosudev->base.dev);
+
 	return 0;
 }
 
@@ -376,10 +378,6 @@ static int ethosu_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = drm_dev_register(&ethosudev->base, 0);
-	if (ret)
-		pm_runtime_dont_use_autosuspend(ethosudev->base.dev);
-
-	pm_runtime_put_autosuspend(ethosudev->base.dev);
 	return ret;
 }
 

-- 
2.53.0

