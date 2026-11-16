Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840654;
	b=aYj5kXxIGz95DD9VE9xgNexFuu6bEVbvkynspWL/LRMnql5EPxkvHgqhyxRkV2ITtX02
	 nl4dsb2IvHZo8OezpnfQ2G/L3J4aytyxUcqxi2+ctEnKkOeJuUM2+YybMx67BB2dwbgor
	 V8leXqfGneETazThbODPKtHRW2NDr9lYiNmlhoC0JpycAtwnxD46NrisUJ9fhW77M9Zct
	 33Wwgfx+PyWIEXwX/VKVZtDoQuV7yYXOH3zQTCFbTZs8V5C/SZRDFYp90CbFTCnqi27BF
	 izAu4ohqLqENoXn8hAYzYoskYHEdJu+cOhagiqxWl0FNCjIEsyKHy+lOUQhBce6xsmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840654;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=JTMVtWze/aZUIET96d1mNBENLjX9W1c+9pupI+lJCls=;
	b=LAyvcmf+PoJ//bnhPor8uva52HhQxosbAyM4B3YeOSZGqypeEK3d5qnYyU6pKYO6aA6M
	 TZeOMGHDN8E+8u32CYQTDqJmgn0W4ZVUacf7ORJGL1zGnVZFOlmKjYcnOLjsMDf9Xn+Ki
	 6Oed0Fvr4YVNRXCmnB2DL1Oawn9TjkfM3cuLtlZnAxoiW0DaTyryod8f/6NTiVf1Qss3w
	 vOL2Z7QsMZE7Y9Z8VHkspfYaelmRDz0/6X5NNSwWLU+t+1pgkZtTOORX3AQ2ojpQfCA+R
	 joxPtXOq6SWidrAJMwEOcCs0DJOjRK4GUZrFSONFJWOQ9kbzap7ONG1noSGj+TXq4yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iuXyxEas;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51756606A31C;
	Mon, 16 Nov 2026 14:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51756606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iuXyxEas
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=JTMVtWze/aZUIET96d1mNBENLjX9W1c+9p
	upI+lJCls=; b=iuXyxEasNuJmC4hczZFXHuoIqGzDzYNi3V4MnqCyei/H2Rdytf
	Jcy+l0pFhEEYWGMytECCoh8lW2LuO0/MLRKtWUMJwVCgiu8R4Cby352gS64Kdl+0
	//pVeb6CgVZx5XU5It0x/wINAXaMtrjMSkx6WVK9c46tRHNYCMFKe8I6Q=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.186.145])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHEUYsGPtqfP7HAA--.2115S2;
	Mon, 16 Nov 2026 22:50:20 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the first PHY enable
Date: Mon, 16 Nov 2026 22:50:20 +0800
Message-ID: <20261116145020.54586-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e4ul4zxjta4oyo5fpjjzwkykb4gicztcn7yrgjw7aer6bqowkw@6nx2arhvmyca>
References: <e4ul4zxjta4oyo5fpjjzwkykb4gicztcn7yrgjw7aer6bqowkw@6nx2arhvmyca>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCHEUYsGPtqfP7HAA--.2115S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF45Cr1DAr1rXrWxZr47urg_yoW5uw1Upr
	W5K34Y9rWDtrWIqrs7Z3Wru34UCwsaqrWakFnrKas5Zan8Xa48XFyxKa1agFyUCr1fXw1Y
	vFn3CFyDZF1YyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOzuWDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2r6CFpmmwBHsi

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

dsi_7nm_phy_enable() pre-seeds pll_enable_cnt to 1 while de-asserting
DIGTOP_PWRDN_B and PLL_SHUTDOWNB, and dsi_pll_enable_pll_bias() returns
early whenever the counter is already non-zero.  On the first PHY
bring-up the bias helper therefore never reaches its
PLL_SYSTEM_MUXES = 0xc0 write, and nothing else programs that register
before the panel is powered up: PLL_SYSTEM_MUXES keeps 0x0, the locked
PLL outputs are not routed to the lanes, and a panel wired for bonded
DSI comes up with the backlight on and no image.

The combination is old.  commit cb55f39bf7b1 ("drm/msm/dsi/phy: Fix
reading zero as PLL rates when unprepared") introduced both the counter
and the pre-seed.  commit 93c97bc8d85d ("drm/msm: dsi: fix PLL init in
bonded mode") briefly dropped the pre-seed, which made the write
reachable again.  Its revert,

commit 44784327815b ("Revert "drm/msm: dsi: fix PLL init in bonded mode"")

restored both sides, so on current master the muxes are once more never
programmed during the first bring-up.

Program PLL_SYSTEM_MUXES in dsi_7nm_phy_enable() next to the CTRL_0
write that powers the PHY up, while the same lock is held.  This only
adds a register write to a path that already programs CTRL_0: no
existing write moves, and the counter, the locking and the order of the
rest of the PHY programming are untouched, so the byte-clock regression
that led to the revert cannot come back through this path.  The bias
helper keeps its own write for the paths that raise the counter from
zero.

Measured on a Lenovo Y700 Gen4 tablet (SM8750P, bonded dual-DSI CSOT
PP8807HB1-1 panel, "novatek,nt36536"): without this change
PLL_SYSTEM_MUXES reads 0x0 at panel bring-up and the panel stays dark;
with it the register reads back 0xc0, the panel initialises and the DSI
host starts receiving interrupts (41 in /proc/interrupts, 0 before).

Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---

Changes in v2: move the explanation out of the source comment and into the
commit message, as requested; the code delta is the same single writel().
Fixes: is re-pointed at cb55f39bf7b1, which introduced both the counter and
the pre-seed, instead of at the revert that restored them.

Link: https://lore.kernel.org/all/20261019130041.305805-1-xiaqinghuan@mail.ustc.edu.cn/
Link: https://lore.kernel.org/all/e4ul4zxjta4oyo5fpjjzwkykb4gicztcn7yrgjw7aer6bqowkw@6nx2arhvmyca/
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ce86dbf618..98df2d994a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1096,6 +1096,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
 	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* Assert PLL core reset */
-- 
2.53.0

