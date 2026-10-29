Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280979;
	b=P3+qJ+XAYZNfJHQNLzmOH9IpLNvBWjAL8N2dPkGIgiFOrSE5f4m6BKsigwo0kt+zTGLz
	 rGGySvNV7NVmUezQZ9qXOjXdehdoNsBoqwTyST+p3KOFbqp1bUyE12vp7FhbHSNTe25Es
	 UOtTZtpTNsU4/PA+wRKhOcv6XCpBFpEAWlkGWaMVTuAwfXg1ma+lNkXjIM99k4uk1N3SQ
	 pqHjGNlNKiqBivP1xwLYKS/PZr0IlYm54p2EkuAZFOLC2tGe7qs98IHrqeYTrSX12ahnz
	 P6d+LLeJyfoFvVMyhXk4+OpXaKkCH4xH5hwlHec9BH8x/milrxXnCIxo0f8C6IfznAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280979;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=D4t+OAVjG6M5tU4SmWhkJ+1SJJ6e1CicZrtdCcJOq9c=;
	b=5WSo0mEUSrC2cREfs+K40NFxwe8Dl+o4m4XF1ikSgtexKLvRLNiCg2SwOfaoj85ZiXXQ
	 hHd1Gzg6thSuUrTOhg3houIcqVNPDLV4uapIjLLXB+4LhnKQwa/Nf4TVvxPLOedpSjrNG
	 CxkVV5ycLkPSfKF+b6oOdptab40pIB8lUWtN0nCcE6n2pcIt21zywtQ02iEQ9KVhmAeBs
	 chGcLCGwlYQvR9ytI9hFawP9Sdpxk4cxCrhEncpvn9s2EwR07Y6TEEube+p9nlBgUTCEH
	 VBTXmOvDtd9geIipSD6P/V57H5OknqOmyXka/sY7PaJoTmkNgoMGIdwTIjx/cDVVwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HFEOnoUd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B5160A2621
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HFEOnoUd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061091F031E3;
	Thu, 29 Oct 2026 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280979;
	bh=D4t+OAVjG6M5tU4SmWhkJ+1SJJ6e1CicZrtdCcJOq9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HFEOnoUdBn6n6m+w0Rm5qLVQDSPjYXX7tfzRKEeI57PdJPcpbWe9Fysn78C9V/fPi
	 J2qF9XPxXuEWbdTtzCbpynBOgy+5HMczW/fjpxhOp6TN5PcF1PFOBuYTRadR4alyqQ
	 8awUmPd/bpEGuhRKPW+Y4bs+DQyye1kqwRv294xmVSuSgQ2wAjcQIeDXy/9Em20qiA
	 MKMBxAUVW9zkMudxzr8xFKIfqHNov8RJ7W+Ij6/qqGJC17/zRCha1DgPabs/gMWIM+
	 oV1Glpe3utLQFNtdQf+Db1IpGPApnGRTrZxuH3GDxhWsXsFsdSDMyCAk3K+NHNijvc
	 qLYtYfPN+a0Dw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:51 -0500
Subject: [PATCH v4 04/31] accel: ethosu: Disable clocks on PM setup failure
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
Message-Id: <20261029-ethosu-fixes-v4-4-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

ethosu_init() enables the clocks directly to reset and query the NPU
before runtime PM takes over. If runtime-PM setup fails, the error path
returns while those clocks remain enabled.

Disable the clocks before returning the setup error to balance the
initial direct resume.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 9ee144c41550..1a65e9eef562 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -311,8 +311,10 @@ static int ethosu_init(struct ethosu_device *ethosudev)
 	pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
 	pm_runtime_use_autosuspend(ethosudev->base.dev);
 	ret = devm_pm_runtime_set_active_enabled(ethosudev->base.dev);
-	if (ret)
+	if (ret) {
+		ethosu_device_suspend(ethosudev->base.dev);
 		return ret;
+	}
 	pm_runtime_get_noresume(ethosudev->base.dev);
 
 	ethosudev->npu_info.id = id = readl_relaxed(ethosudev->regs + NPU_REG_ID);

-- 
2.53.0

