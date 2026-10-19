Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AB24F3EC3;
	Mon, 19 Oct 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414871; cv=none; b=RajFm43zRzyumbvgyUq6v4379eErTrqDHhA1mpwO8zvdGBVhuicxgQaSuUYDvoUMVIcfhvAEkauiVGFapH2UdCHEDezQ/FsCTJPs64UY1o4DaHlqK3AphtdjHUqzy75PNnK591EEyCOkUcnoPn2kPQ2zU1LZwhK6gOBmBn+fSYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414871; c=relaxed/simple;
	bh=O+9eheaozFJ2m16+ao20wGbH7TUqgRimVoU3HjavFnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hejjfTIjZ+Oe53zshhZJHafteoDYm+mnEn0ftm4xiQYdtsXvINUzx5M0tmOPeyzrczgbDfG7pgMsv6INlCj9sgaDq/xXuiUkehMW2lqz2o/ZCZTE9BZqhkw2tvBwZrse9Ep2eM/VlCYv1Z6cOnDpB/JgI0badrEkaTkTm4qOVg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=Y6coNM1c; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="Y6coNM1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=u2IjnYIDDi
	u7hQFqJnH/vzZi0teIPxpv85YUHU1FWF4=; b=Y6coNM1c6ii0PC9lsqoZPghE00
	fqn3Uf682TMpYk7GmFWgoFUolPGG/cBGJ/GEGdv9OBHSc8jhQtrRCOJuhs0Eq8oZ
	mOgtrmNUSpNDVzhC/UWX6C2Ayg+puWFymqTN8IXDzUelzo4dnaHw9fDC43BAcEPo
	VcNcP15HM04Xq9qNE=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.183.93])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBHzUF5FNZqAAITAA--.1067S2;
	Mon, 19 Oct 2026 21:00:41 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the first PHY enable
Date: Mon, 19 Oct 2026 21:00:41 +0800
Message-ID: <20261019130041.305805-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgBHzUF5FNZqAAITAA--.1067S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyftF1rGw4UCFWrAFWxtFb_yoW8Cry5pr
	45ta40kryUAFZ7GwsrZ3W5Cw15Ca1Sgr93tFnrKas8u3Z0y348WF9YkF40gFyj9FnrJFWY
	qrn7KFyUWr1FyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6ry8MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjQJ57UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREFB2rVHlSR7AA2ss

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

dsi_7nm_phy_enable() pre-seeds pll_enable_cnt = 1 before calling
dsi_pll_enable_pll_bias().  That makes the bias helper take its
early-return path, so its PLL_SYSTEM_MUXES = 0xc0 write is skipped on the
first (bonded) bring-up and the register is left at 0x0.  Panels wired
for bonded DSI then come up with a blank display.

Write PLL_SYSTEM_MUXES in dsi_7nm_phy_enable() as well.  The write in
dsi_pll_enable_pll_bias() is kept for the warm re-enable path where
pll_enable_cnt is 0.

Fixes: 44784327815b ("drm/msm/dsi: phy: rework PLL bias enable/disable")
Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 1fc3b4f0c..5dd4830a1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1144,6 +1144,15 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
 	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	/*
+	 * Program the PLL output muxes here as well.  The pll_enable_cnt
+	 * pre-seed above makes dsi_pll_enable_pll_bias() take its early-return
+	 * path, so on the first (bonded) bring-up PLL_SYSTEM_MUXES would
+	 * otherwise never be written and the panel would stay dark.  The bias
+	 * function keeps its own write for the warm re-enable path
+	 * (pll_enable_cnt == 0).
+	 */
+	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* Assert PLL core reset */
-- 
2.53.0

