Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5991388879;
	Sat,  3 Oct 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015044; cv=none; b=WN1cyrkdjCc/1pq7zEKyF4QPE0PIv92LW2GaanLIUFMdSg1d18Ei/qx8mq6w9UU1BUeoBzXHHzrs8xCa2EK68HY7lu8EunxvT9kn1ceEjw1d1RVbuUxF6sBhG7RUALwXmJBtAON4TiorglZlNF5jC/1WiJ0NJpQvzgAlgww7TA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015044; c=relaxed/simple;
	bh=bHYsIw/dFMZd67xDXednIJJk/jJrG1YKUdKOH+xHTrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dNNOqdTUmIPwYZDShMRCaXjznIe7yFwTaypWM/XYU6xGQ/PDJdmyBaeLDuR08mn4dCC5JxNFjOeHv1miR45NSKyIfwSSPa2GKYzz+ztMmKwH4O9m8qloiTNiMzhnLpPiD9pft8wBYAsj+ohwPby3I1a7sw20qImsM/HOMm8L+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e3zwIBPd; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e3zwIBPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Fz
	qlwKVaG5F2Cl/Blfh3aivHLdgARdebIfadlDcrE98=; b=e3zwIBPd9Z/fHXL28y
	RQCsxrifvMrkOOeSKsZ52Okx7FIKv6yzDUlQ48I6OHD83emduTJG6O+fbJDRt7Cx
	CnZ0wiOMhn/5KZM0ralQnMawbWNDsiqlaU+FT+lNN4opT6FZV68QdFiv1WM5AiHn
	uxVOw4rWFBYnx3NBfxJSi6800=
Received: from pc.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3qHRLuMBqTxqBCg--.60808S2;
	Sat, 03 Oct 2026 16:09:48 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] drm/msm/a6xx: handle runtime resume failures
Date: Sat,  3 Oct 2026 16:09:45 +0800
Message-Id: <20261003080945.431091-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD3qHRLuMBqTxqBCg--.60808S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF15KFW3Ww43Gw4DGw45ZFb_yoW8ZF1Upr
	Z5Xa1ftr48Cw1agws5AF48ZFy3C3yrWay7Z3sFg3s5ZF15AF1UtF1FyryaqF95ZFZ7AF13
	tF4UJ3y7Cr1Ykw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi3fQiUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wwMRmrAuExQFAAA3z

a6xx_pm_resume() ignores failures while resuming the GMU device and GX
power domain, then continues enabling clocks and initializing hardware.
The common error path also drops both runtime PM references even when
either acquisition failed.

Check each resume operation and unwind only the references acquired
before the failure.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 081e79ea4652..aa785f197aa0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2188,8 +2188,13 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	/* Set the core clock and bus bw, having VDD scaling in mind */
 	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 
-	pm_runtime_resume_and_get(gmu->dev);
-	pm_runtime_resume_and_get(gmu->gxpd);
+	ret = pm_runtime_resume_and_get(gmu->dev);
+	if (ret < 0)
+		goto err_clear_opp;
+
+	ret = pm_runtime_resume_and_get(gmu->gxpd);
+	if (ret < 0)
+		goto err_put_gmu;
 
 	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
 	if (ret)
@@ -2204,14 +2209,16 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_enable(gmu);
 
-	/* If anything goes south, tear the GPU down piece by piece.. */
-	if (ret) {
+	goto out_unlock;
+
 err_bulk_clk:
-		pm_runtime_put(gmu->gxpd);
-		pm_runtime_put(gmu->dev);
-		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
-	}
+	pm_runtime_put(gmu->gxpd);
+err_put_gmu:
+	pm_runtime_put(gmu->dev);
+err_clear_opp:
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
 err_set_opp:
+out_unlock:
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 
 	if (!ret) {
-- 
2.34.1

