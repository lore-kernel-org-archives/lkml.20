Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280977;
	b=yEmWKQXwbBWyuLPINx93uMyKB2q9jzDvZiPPS3NzSXKRn1dMuRGk9oTc8hEFIYf1GQvA
	 3NmssrNF1MvwwQdXLRe+GNQWaNO3y40GxrYdGHbf+5Wr3FWd5FtgXA8dLDVKbhsRfPEKa
	 qEY9rLzdEyvqoQc2mbZrMm0MdNbO7W0my/Q4tUDZ9RQYqJxWlRVjNPVAJReERJfRBnIIy
	 XKaJbbGL91eqRQSuHsT6y9AyCYy4tAEbbxVI6y9qFl+d8bjW309K7Q7sqbxF4zxJvWDiM
	 19IY+PlrrMjUfDOYUlNWhVFzj5xkwjw/EVkK2GJ93tu2B75+NUK2BI7CNSyvthyZ82g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280977;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=bS0iSQJp3OkLpA0zXSDW5fylr9WknYcp8VwPrIX4pYg=;
	b=HdGCXiDb0QdIyvt1tFdV5qVwETk62kD90MGz5mCN4xPENxtwQ5ek1yuhO/tcKvR1YiG5
	 djuktldoHjiBxM/Gfi+uEpyo/nHVszxcwNLA3Lu49iiWp0u+TsbHs9w+z3anqNX3Ri6W6
	 ximVrv0R6cbTxjPys6sz2Nf+SdKFqTIrp7Tvnj+BQCyHetytTrXcxVjYY0HtUfqzYnfLs
	 QIIxg8Ypnx4GrzEW2w5BncKkyZoWAk59M7UXZsbcuF8MQ6XJFPVNsIpk6QNttn84uA5Zl
	 lemqcG5KOQh1ddJbD/TXwZENzG7UG+x672vxVYZciBqGVpNeK/RZyXx0yZKTrg9yl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkme2BFu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC060A2612
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkme2BFu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9CF1F01828;
	Thu, 29 Oct 2026 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280976;
	bh=bS0iSQJp3OkLpA0zXSDW5fylr9WknYcp8VwPrIX4pYg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lkme2BFuNhl2thv5wsWX5SRz6Lb06ZGBZu24M3tCwnOQjIJrLlvPR7RxJt26HKNUH
	 ymC3dBitBj3U8WL8T9xhCuB4wnksPDIxrJ5IVMgQiWlo/tjx+TR/j2vQZhX6vaHkJC
	 pNsu+KjlWOytlmng2Vx0OQZO8/RKmdO10jwiX4bt7s1yg66GRS7hjBeNuB2QA4+op8
	 Wp2LEEDEwh3S46Qb56x3NE8SXDIPB2rD51VMOIY2dMnpLuZw8HFac4GZQLM5MsSgtE
	 TxQ2R+NPbnLAzt5cjFvQ4lIoCHvcL9LN+6X3UYNLVhVRLeY3LyxlvLKyJdSvE2d7XA
	 m0EGEssgESdkw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:49 -0500
Subject: [PATCH v4 02/31] accel: ethosu: Ensure suspended on removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-2-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
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
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Use pm_runtime_barrier() and call ethosu_device_suspend() directly.
   This works in the case of !CONFIG_PM or power/control=on whereas
   pm_runtime_get_if_active() did not.

v3:
 - New patch
---
 drivers/accel/ethosu/ethosu_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 38af57807cee..ae7ebf29cb2f 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -387,6 +387,11 @@ static void ethosu_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(&ethosudev->base);
 	ethosu_job_fini(ethosudev);
+
+	pm_runtime_barrier(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		ethosu_device_suspend(&pdev->dev);
+
 	if (ethosudev->sram)
 		gen_pool_free(ethosudev->srampool, (unsigned long)ethosudev->sram,
 			      ethosudev->npu_info.sram_size);

-- 
2.53.0

