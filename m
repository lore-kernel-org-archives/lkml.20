Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E5433938D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487073; cv=none; b=mUjFJvbs0wM/Bsnp3/1xpoKqbgFFmM06lIE5iZtjjmrbN2A+4DS4bhhf0uYjFbH/RgG+srToeJjWmALaIbThvLCzt+f76nTsD1Pt0/RAZ05gDUrFAUP4HC3kBxt/fjlHu/Lw3RXjbki/L2nO5NCqZCBn3vP8BNQo7qFqgkVxNZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487073; c=relaxed/simple;
	bh=mAw6b/EDPrP6AHr8R5sM2yIsHLKuKDwNOLvNherILjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fRvUEeXkjVL7bS4wKmRXxOoLiaxltH4/CjrDKsUEGlYULKQz8U19OuhLfh3LiO05PWtRLKE8liZ9tabzhUtOfHPitBJ0nqCgW6fgsKhmHwsi6rH7UpeNLh6h/yXX8+/ZUpQvQK0YvrGobDHRruxPu5676VBAKeZAFVE15L5mVEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADHzz1W7MdqTWwRCg--.14045S2;
	Fri, 09 Oct 2026 03:17:43 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omap: hdmi: fix runtime PM leak in hdmi_pll_enable()
Date: Fri,  9 Oct 2026 03:17:45 +0800
Message-Id: <20261008191745.2809272-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHzz1W7MdqTWwRCg--.14045S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWDXw17Ww1kCw4ktr4UCFg_yoW8Wr4Upr
	WSqa4jvrykJr47trsrAFnxZFya93yakrWfGr97Cas3ua1rAa4rtr4rAryF9F4v9rykAa13
	Krn7Gay3CryYyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU59o2UUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwQOA2rHpl2cVQAAsR

hdmi_pll_enable() acquires a runtime PM reference with
pm_runtime_get_sync() and then returns the -ETIMEDOUT error from
hdmi_wp_set_pll_pwr() without releasing it.  The callers of
dss_pll_enable() (hdmi4.c, hdmi5.c, dpi.c and dsi.c) do not call
dss_pll_disable() when enabling fails, so the reference is never
dropped and the HDMI device can no longer be runtime suspended.

Release the runtime PM reference and undo the dss_ctrl_pll_enable()
call on that error path.  Also drop the reference with
pm_runtime_put_noidle() when pm_runtime_get_sync() itself fails.

Fixes: 86c9305c864c ("drm/omap: HDMI PLL: use runtime pm")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/omapdrm/dss/hdmi_pll.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
index eea719243eaf..9b900fc88f5f 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
@@ -43,13 +43,19 @@ static int hdmi_pll_enable(struct dss_pll *dsspll)
 	int r;
 
 	r = pm_runtime_get_sync(&pll->pdev->dev);
-	WARN_ON(r < 0);
+	if (WARN_ON(r < 0)) {
+		pm_runtime_put_noidle(&pll->pdev->dev);
+		return r;
+	}
 
 	dss_ctrl_pll_enable(dsspll, true);
 
 	r = hdmi_wp_set_pll_pwr(wp, HDMI_PLLPWRCMD_BOTHON_ALLCLKS);
-	if (r)
+	if (r) {
+		dss_ctrl_pll_enable(dsspll, false);
+		pm_runtime_put_sync(&pll->pdev->dev);
 		return r;
+	}
 
 	return 0;
 }
-- 
2.25.1

