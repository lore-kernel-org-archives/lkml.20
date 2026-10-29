Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280975;
	b=dcfZBuvf1XNEBM7n5B+Rpdm16gS3vzeyCxBzGfcSzvTmmdZhlj/yBzjpiTi55GT3IaAY
	 fck6TSPr+1uyJXGuH24RvWTA47749mdFHltIvyhmzMCzmWkA8sSYwQ5x1XuAY8qHmwAXC
	 Ea0DWKcleJVLxMQeyMcyYX+WokFkId4EvFEAkwJEpZ2OOpTYAQ63TRjz3fiadoGZSOAOB
	 Y5kQDspCv071xNQvrm1IRexUh15Vbz2itCn+nRSljoJLrH1oVSSe/tcUBi6UmoxmVBif0
	 Kfxh76+grYtL99DPZulgKNhuZKMnsgiEPeBkrS2U3jNRGDQ02HEC0LCIhV5aZzu6FXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280975;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=fCJZ6PMAFqZi+fp54NLfaievJDlE3aNEkrfemsSw3m8=;
	b=MKnGHYwQYFzfh0ATdaXdgkEsO2BqoE7ZOwXON5uJf+Q1kKd0LhFHYnvIf+EY4tn1L1Sw
	 65DkguRsUywwMUBlprQtlcodBv8bKgy08pdACYHD0t6EvODbswfL1J+KY0aBZc/wPYPY2
	 vYzASDZjme3jPMPzWd5VEb55W/YHsFs5nNkZczkD5/7yJQQwKlyVaY+pLKYDssKlXgMrR
	 d+t3bin2yZg2sDqzySx1LuS65HIXT12+EhiyjlcLzoX275MzbhsQibSyixBTWuIIWo8mO
	 UVpZF9FSfRs52VgdY0HMb15SrZAuOZkzXB+qCmxsS3yIcBP3wuKu9ctWeqQpJvUBT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0SCucAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A889606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0SCucAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DC61F01825;
	Thu, 29 Oct 2026 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280974;
	bh=fCJZ6PMAFqZi+fp54NLfaievJDlE3aNEkrfemsSw3m8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=U0SCucAQByKC4B4g4SvGyajFjqipdbMfx8v6qGE4E4ZHmcv/X2X+ZCoqOIOyXAKaC
	 nwdmA/lZ2gyIFjZAd3qpzYEmhB02eyTv7apXJ0rmnT1TeiX80zpObfXoiAKR6hwQZC
	 sPXqV37j4e3S3PDxIGZW1jBTwkE7T/tMKwC8WwTGwTKdRFunYBaU6YB8uYPM3xKxvI
	 j8hF/0ffBeZAmT1WeFze8G1Y30Nqh/eiNyshDYvdu1LI4r5PnJ2QiQRq0rCd14B/Jv
	 ObHoTE5Uz2SsdnlLLZw25EPdXskgPFx15Ev4ljAC46Dhk2eyHy2rJtTDMo0ndVhx0A
	 6D38brXnPncEw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:48 -0500
Subject: [PATCH v4 01/31] accel: ethosu: Suspend after initialization
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
Message-Id: <20261029-ethosu-fixes-v4-1-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
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
index 4a24bbd2bb61..38af57807cee 100644
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

