Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6435957ED9C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905098; cv=none; b=jEOVNB96pL9ReMIl7mxahdTo9yrgBbN0eKByQoeluV+QRkYsuMh9C8CXPtLqgbZo/ISmqp/GAaRtLlVUm8iheEsM0YCaG3tEyJd1MuUeu2BCQK+G8WqUXMv5ynTYBdQS3+v81B0dXb2+KCS1/w903idesqWCUT4WpNs7kEWIDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905098; c=relaxed/simple;
	bh=p5UYbpdKw37Jh9rs8f/88LT8YHJj93VvAxwxLrha4Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GipmwnSCqNSNn9Amzv4/m4G5Y10Mh7nlQq2vMpobYKowunCfukiIZSfRDyVOCAPje5XLNfLVZEktHB1yKNmurulQL+QReTJvaRm+kYhvbNFapxPDHvh5tIr2X9DlTnJKz43Iug3euzYbJlLmAPzF3nUP8op+ueZY87nAkuDNi1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caULk3RE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caULk3RE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D072D1F00A3A;
	Tue,  8 Sep 2026 22:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905097;
	bh=pMwdKDpEcWsTGjIiaUuqOVn+pPdk1SNCMZVTViM1TFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=caULk3REutEieb20hePXT+BBppeQHgxSaquW6i8m0kent+gWkj2fk1cG6x82iMZfy
	 LgUbSlO2x0WomwE0CGXy2nO/9GMNcSVUOkkJ8/gp5dWQ5UP750WJMiZYvK66xI93q8
	 uCo7RlC1ZH2SUw5twkRM24ZTjIcUvwa0IPqDW0BRb0FtjD2kWOXImKyHsaCYkUbpUV
	 nu60jvCNSeGXjHiWMAw8vAWGbAMOGRWcwQGIATXyhAEs9psH045S7RiLuEOqGfOWFC
	 FJnX9D/RZCu+tMfg5VmIxl1BZepCCoqQYfzIi8rxwLjuzG9+37gd/y+DVynNRolaH+
	 CmbhLp7hlIj8Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:41 -0500
Subject: [PATCH v3 04/22] accel: ethosu: Disable clocks on PM setup failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-4-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index 2c8d735767b2..9d063daa1aa7 100644
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

