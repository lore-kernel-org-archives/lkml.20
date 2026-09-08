Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190256510D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905095; cv=none; b=CMAfE5us20kL5JG462pKxfU0C5ASqPIg341xltIGWZPVc9wrmBdie3x/AN7zPWKWamLcDABXT+wk6JdcfDBMB5/ksUw9yVMDpzaBLQW+BPzg1c2ngWKxIbXfUSjh3zw8luR618TwBII5M/2WvP70Db7KHQkS2I3urbzlejpQEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905095; c=relaxed/simple;
	bh=+J7RZfgL5AzajAk1mEDu7gK55yvVTLK8+CL9C+Luh6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcN8YQk8Jyr/iBslPC2BuzmikLeUSM6SnzHuo8BqitGLgi1pqsVNO+49us2tOlgzPbeaalXjRBYSOpWH5SH83wbi7QsP8ka/OIM8vM4TjkMzuZI0l8YWv44e2kaCkI6bQBMUuFI9tI2/uEnYbbqJrtqYf1RfwDVFGRI4r3/N45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9Sbuyd5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9Sbuyd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C351F00A3D;
	Tue,  8 Sep 2026 22:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905093;
	bh=ai8d/z/jR8St5LaF9248MzOc4BaNMXKIfXmoxvaaQR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z9Sbuyd5soYPLUogOkXYWQxJ5DOum41oY9eGKtVprQupwojEkYtALmxRNx0Qi/U4g
	 6KgVZcsXAyM8EPITlGzTag0rMP+7QcI9J9Ox/0bgbpk+UH4fUjnTmTrmk28nfbnPf4
	 d9ui/wsKi9EMVvUq/CnFSgNqAehDCgXVlmUrUSwJMF1oB3oEtNT4aRgptqy5Xmp5J4
	 87NAxj5yh4nAhU6bwHFxU0YSIZY3294nBlLtJDwKMvL76SyPgg1TgB0Q8ZL1N5zkDy
	 F3w47xTgIMxM5YA1X+MAMpcUV2aZoTgKkR42c//kqdFt1GlIm0X6pCv+BzO8uYGh14
	 F22Rqa6O8PFgQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:38 -0500
Subject: [PATCH v3 01/22] accel: ethosu: Suspend after initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-1-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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

