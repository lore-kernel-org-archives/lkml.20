Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91595568FCE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905095; cv=none; b=Um542fNvqphLhPNnEl9JjTrcKP2Hy8/YjFgASMOEfVdH8/2ClO/vQFaMMXtZwBPdGOlDtnqKnRo+CbTQEpbK/+UZ1q/STeoeW+9ZtWiHQj4ntCK3eKOV6crQn8e+fyg9Q+yuBCCYIxIaGOW3qQBtO75cX2FbFTm3yqf9t/xRHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905095; c=relaxed/simple;
	bh=f9n4aPiCpynxGQAg8kyfMGDEBPvJBrLNnhdyFudXwpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9J6gf3gadoInUCxsY8rvl/0tPWTVNLJuxBvi9zQSYojCWSxic7fgrbEPiHcGltDUhAg75hYbF0ktRo/mUmHJErtWNcn10G7KOGYGX6S7XkRqYnSQvP6oOR2ZqhOP5JqdqCLgpQ/e4flaZN6Hnoq6eYnmOH2p2gLXC6z7ujKKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OakRzItU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OakRzItU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F6A1F00A3A;
	Tue,  8 Sep 2026 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905094;
	bh=B++ChOOJS0KMKO8mbkmrvvELnBJLVRMq96OfPvDS7js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OakRzItUAnfI0vHAjR7TSUDbPjtXFsvWGVvzZirbPOPe1PzIwuzQPsKI3ubMlmxvK
	 P6JarMzvZfttSVZadEPJAlKfspsLD0YuDqJbMKuTIVqGur0uETM3VTRh4jnPQDSVB5
	 KCik+MQNzuAvyxpBmQ6a1PIJxUdPZwlhoHbGjJchNEuaZ3utluA15HGHOw0a+vu/n+
	 eeEx5az6JEMQCy5Y7Tw/hrd1UaibxAsZkCc5/DO4DOxLK9IEGYq6/ieCEASfl8u70U
	 sDrccrRqfX1+nXnn0DzeaYV270Lh9lPzcAREPnqn9aR28tTwRdSYgG5RDITEajYLsm
	 WnIj5uYZq6EQA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:39 -0500
Subject: [PATCH v3 02/22] accel: ethosu: Ensure suspended on removal
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-2-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev

If device removal occurs before an auto-suspend timeout occurs, the
suspend is cancelled and the device will be left with clocks running.
Make the remove() callback check this and force a suspend if the device
is currently active.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - New patch
---
 drivers/accel/ethosu/ethosu_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index df76253d01a6..1f6fb5d18cf2 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -387,6 +387,10 @@ static void ethosu_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(&ethosudev->base);
 	ethosu_job_fini(ethosudev);
+
+	if (pm_runtime_get_if_active(&pdev->dev))
+		pm_runtime_put_sync_suspend(&pdev->dev);
+
 	if (ethosudev->sram)
 		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
 			      ethosudev->npu_info.sram_size);

-- 
2.53.0

