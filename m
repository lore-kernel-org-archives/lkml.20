Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D23D16E5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546411; cv=none; b=CEF4tp1EA5S5WH3aFyimBUWCIS4CelmnIJztIDJJTwn7PNucciUfg+pJBPYpkP0G275tt0MzW8fZsQJExB+teTFRxBAkx2hOb1MrKUPrXrxI+EI2e1CQO3JUo+kazEM1qiWYWwbZZK0zIKORpdnh7CQk5cuw1pyAiKHd7UhCc6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546411; c=relaxed/simple;
	bh=ImE3LeMZi6jb1ehbIwW/hRWIs81dALJUXYuo9JFc7ZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fW7eE8GXvup16a9lYOVWpRDNJw5FbNVLVu2ljsoZ54lZucpR2ghildWPeycUn8ou0TK65Qp3Vu+b+hKc53pVt5RyE/M7mPji/ZWALOfxcr9+O1X5vVdclKagIF9sO3DwwDADHcjfLnWuM4o+jqNwRPhox9cBs8twSKplsPcTUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GP0KZsSz; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GP0KZsSz"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81adacb0f81so648955a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546404; x=1791151204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwlcVdI1cXMFVKb3FI+BS9PDibQQ4NTPpLw8ywCjJBc=;
        b=GP0KZsSz74pY8BnPxArKCOZmYQAAZ67TXljwCB/GjUXdGjD6bFVoa91XzGLxZEwUTT
         ck+JpiJDRwSqScRBb8L7Yi41s746+VJ2CkuJSzgJFxah8xb5nP+OI3p5NXavwHqalPEX
         5nKLJCtdFTGZH7BSH02yyAdLKuEank2ReB4QYX0rJnB89X5lcmMvv5Xe1FwxGUj71O9+
         Wfdb6CN3XjyEiLz4d04cnB+elm04nyWWWOEcdug4Ma4fMxqv/Ve6deq5tUZwI47UyLwV
         HxVa1FKLqEh/DWxFqwt06TiaCbKkAWZ9TGC1P08Gqe5NvqeI4ypVJnmWJh0eW3GG9Qe9
         do7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546404; x=1791151204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwlcVdI1cXMFVKb3FI+BS9PDibQQ4NTPpLw8ywCjJBc=;
        b=Onieo/rIaUtUoVWU5Hqg10UkEQTvsFv/hP/q2+UwGgnDrObvCdC7Ngwiwl91qOotV/
         ctWGxUUU6XfZX3rVl93+Qo4mt79IExrFDKtCwCuU9cG3YtZUYyhPIP/EuSyfQivoXWfx
         6eG5XCvr+ZNCIXy1XaAsThdFjy0+p5eDpVIeBAZmG7m4aNB9g/04hgZBBbbzYfgOg2WG
         ekhG06wGI051q5R4RkiWRG3M2rJCjPNHWajFE0qzhfqMUF2RrRn7NnbQ6f4FfgRjVTni
         snL8oJRbzjHF8xrmTwwaCFskyoV2I131G/3lw5Vhxs4v8bbNM55lnEHyPN5ybN4DhlcA
         wlZQ==
X-Forwarded-Encrypted: i=1; AKwUvByEoaNLDXoPVTSdT+mir5RCP3Mcdqyf89A/6hx68T5lM0kVNdn+kGJyp2Y+wp2Cyyk8PLGwVv59QkoycTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kbcf7dQp+mYEE8c6mfOi3dLoXdc+VnL+3rJROjsPBKRmsH6C1u
	mQ5sMWZr6UQSHfuzW4tkVCDRYMa5Qrk2JyoJY/un6XyYwS5++8/5Llw0
X-Gm-Gg: AYBFou1So0+Un0lei23tJ9+bvvtNK1yPx9GXMa/TpXMPbmUfiTRXI/Kq4Ms1XzdH/r3
	7ubHEQO8FzEw3ovoq3qeu7HOd/oLoi4tkk/KA9mgO8KBI6KjJ94+1iRf6cs20NZLZq1lVYwXbCx
	OPQI8GSZ/YTbuuXplOSpQKdqFzvME/9iHNOJkV7Wvv26syCMFTfJ0fSiCQU18+Hsqn4lZOAwQfl
	ZR0GBaJXLJ13PDW4Ao1E15yoM7FAfp9HuSRWpNJW3O/ErmfTYSuDzEOBvXHh7X5p8Qa31Oo0K3U
	PxsbpLWURA4rHhWX0MF1iLWF/jiWHNfTugwdrLfErsVOvRQQuS3ELC+2D9iBqCGG8IJkW4veaMa
	ZC+BkB1jxcAUjzDjYvXc/jrytdMQUoPBl4HliPJbTHCHIFGWn/qaegxOCpE//0hWnqdUlnaF2IG
	KGLRkZYFp3wX8Kc0r0pMN9wYYKNXW1bsDRMUg7hCM6n+HEqJNQj9iFQX7msbD5A7Dl63zvSnbms
	gM9dbudIgD1+7FJU1dqIi57WlkrJut/0v4SKfw+6tnUf1ZKgBLaFDdCixhl5G7WhNrnWe5KPfpi
	etDNKaL4r4ulnty3+xJ6El9OjzyNmYoNynZ9TatCcb+AtALeHBMv+Eos+BXg9+2IcTk10aM5Mkj
	RecNZqva8jaWvHG7TL5/W
X-Received: by 2002:a05:6830:61c4:b0:814:e9ca:81e2 with SMTP id 46e09a7af769-81780797639mr9740369a34.3.1790546403564;
        Sun, 27 Sep 2026 15:00:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:00:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:42 -0600
Subject: [PATCH net-next v5 07/19] net: stmmac: re-apply taprio offload in
 __stmmac_open() and stmmac_resume()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-7-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Rayagond Kokatanur <rayagond@vayavyalabs.com>
X-Mailer: b4 0.15.2

From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

The core soft reset issued in stmmac_init_dma_engine() clears the
MTL_EST registers, but nothing re-applies the taprio offload after it:
priv->est.enable stays true while the hardware EST block is left
disabled. The TX/XDP paths then keep dropping frames larger than
priv->est.max_sdu[] and taprio is reported as offloaded, although the
EST block is not programmed.

Re-apply the taprio offload in __stmmac_open() and stmmac_resume()
after PTP is up. The base time is recomputed from the reserved base
time and the current PTP time, since the timestamp counter has been
re-initialized and the previously programmed base time is stale.
Introduce the stmmac_setup_est utility routine.

While at it, make the EST enable state transition atomic with the
hardware programming: pass the desired enable state explicitly to
est_configure() and hold est_lock across the whole configure sequence
in tc_taprio_configure(), so that the software enable flag and the
hardware state transition atomically. Moreover, priv->est.enable is
only set once the hardware has been programmed successfully, and any
failure path disables EST before returning. This also fixes the stale
HW schedule left behind when a REPLACE fails validation, since priv->est
is no longer wiped before the new schedule is known to be valid.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  30 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  35 +------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 107 ++++++++++++----------
 5 files changed, 120 insertions(+), 78 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
index f15d4d046aa7..49edfebbc39e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
@@ -80,6 +80,36 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
 	return 0;
 }
 
+int __stmmac_setup_est(struct stmmac_priv *priv)
+{
+	struct timespec64 current_time, time;
+	ktime_t current_time_ns, basetime;
+	u64 cycle_time;
+	int err;
+
+	lockdep_assert_held(&priv->est_lock);
+
+	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+	current_time_ns = timespec64_to_ktime(current_time);
+
+	time.tv_nsec = priv->est.btr_reserve[0];
+	time.tv_sec = priv->est.btr_reserve[1];
+	basetime = timespec64_to_ktime(time);
+
+	cycle_time = (u64)priv->est.ctr[1] * NSEC_PER_SEC + priv->est.ctr[0];
+
+	time = stmmac_calc_tas_basetime(basetime, current_time_ns, cycle_time);
+	priv->est.btr[0] = (u32)time.tv_nsec;
+	priv->est.btr[1] = (u32)time.tv_sec;
+
+	err = stmmac_est_configure(priv, priv, &priv->est,
+				   priv->plat->clk_ptp_rate, true);
+	if (err)
+		netdev_err(priv->dev, "failed to re-configure EST\n");
+
+	return err;
+}
+
 static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
 			   struct stmmac_extra_stats *x, u32 txqcnt)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index f70221c9c84a..b4d1a1f04f10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -65,3 +65,16 @@
 #define EST_GCL_DATA			0x00000034
 
 extern const struct stmmac_est_ops dwmac510_est_ops;
+
+int __stmmac_setup_est(struct stmmac_priv *priv);
+static inline int stmmac_setup_est(struct stmmac_priv *priv)
+{
+	int ret = 0;
+
+	mutex_lock(&priv->est_lock);
+	if (priv->est.enable)
+		ret = __stmmac_setup_est(priv);
+	mutex_unlock(&priv->est_lock);
+
+	return ret;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b233105cb449..4e80548ecfe9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -48,6 +48,7 @@
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_pcs.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
@@ -4200,6 +4201,13 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret)
 		goto ptp_error;
 
+	/* The core soft reset in stmmac_hw_setup() clears the MTL_EST
+	 * registers, so re-apply the taprio offload after PTP is up.
+	 */
+	ret = stmmac_setup_est(priv);
+	if (ret < 0)
+		goto est_error;
+
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
@@ -4224,6 +4232,7 @@ static int __stmmac_open(struct net_device *dev,
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
+est_error:
 	stmmac_release_ptp(priv);
 ptp_error:
 	stmmac_stop_all_dma(priv);
@@ -8420,6 +8429,10 @@ int stmmac_resume(struct device *dev)
 	}
 
 init_coalesce:
+	ret = stmmac_setup_est(priv);
+	if (ret < 0)
+		goto error_stop_dma;
+
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 64d890664421..db5610f0fbab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -8,6 +8,7 @@
   Author: Rayagond Kokatanur <rayagond@vayavyalabs.com>
 *******************************************************************************/
 #include "stmmac.h"
+#include "stmmac_est.h"
 #include "stmmac_ptp.h"
 
 #define PTP_SAFE_TIME_OFFSET_NS	500000
@@ -55,7 +56,6 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	u32 quotient, reminder;
 	int neg_adj = 0;
 	bool xmac, est_rst = false;
-	int ret;
 
 	xmac = dwmac_is_xmac(priv->plat->core_type);
 
@@ -69,46 +69,21 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	nsec = reminder;
 
 	/* If EST is enabled, disabled it before adjust ptp time. */
+	mutex_lock(&priv->est_lock);
 	if (priv->est.enable) {
 		est_rst = true;
-		mutex_lock(&priv->est_lock);
-		priv->est.enable = false;
 		stmmac_est_configure(priv, priv, &priv->est,
 				     priv->plat->clk_ptp_rate, false);
-		mutex_unlock(&priv->est_lock);
 	}
+	mutex_unlock(&priv->est_lock);
 
 	write_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
 	write_unlock_irqrestore(&priv->ptp_lock, flags);
 
 	/* Calculate new basetime and re-configured EST after PTP time adjust. */
-	if (est_rst) {
-		struct timespec64 current_time, time;
-		ktime_t current_time_ns, basetime;
-		u64 cycle_time;
-
-		mutex_lock(&priv->est_lock);
-		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
-		current_time_ns = timespec64_to_ktime(current_time);
-		time.tv_nsec = priv->est.btr_reserve[0];
-		time.tv_sec = priv->est.btr_reserve[1];
-		basetime = timespec64_to_ktime(time);
-		cycle_time = (u64)priv->est.ctr[1] * NSEC_PER_SEC +
-			     priv->est.ctr[0];
-		time = stmmac_calc_tas_basetime(basetime,
-						current_time_ns,
-						cycle_time);
-
-		priv->est.btr[0] = (u32)time.tv_nsec;
-		priv->est.btr[1] = (u32)time.tv_sec;
-		priv->est.enable = true;
-		ret = stmmac_est_configure(priv, priv, &priv->est,
-					   priv->plat->clk_ptp_rate, true);
-		mutex_unlock(&priv->est_lock);
-		if (ret)
-			netdev_err(priv->dev, "failed to configure EST\n");
-	}
+	if (est_rst)
+		stmmac_setup_est(priv);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 67c6fc32d0ea..70d623f7083b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -10,6 +10,7 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 #include "stmmac.h"
+#include "stmmac_est.h"
 
 static void tc_fill_all_pass_entry(struct stmmac_tc_entry *entry)
 {
@@ -968,10 +969,10 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct netlink_ext_ack *extack = qopt->mqprio.extack;
-	struct timespec64 time, current_time, qopt_time;
-	ktime_t current_time_ns;
-	int err, i, ret = 0;
-	u64 ctr;
+	u64 ctr = qopt->cycle_time;
+	struct timespec64 time;
+	u32 *gcl = NULL;
+	int i, ret = 0;
 
 	if (qopt->base_time < 0)
 		return -ERANGE;
@@ -979,6 +980,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (!priv->dma_cap.estsel)
 		return -EOPNOTSUPP;
 
+	if (ctr > (u64)U32_MAX * NSEC_PER_SEC)
+		return -ERANGE;
+
 	switch (wid) {
 	case 0x1:
 		wid = 16;
@@ -1013,35 +1017,45 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		return -EOPNOTSUPP;
 	}
 
+	mutex_lock(&priv->est_lock);
+
 	if (qopt->cmd == TAPRIO_CMD_DESTROY)
 		goto disable;
 
-	if (qopt->num_entries > dep)
-		return -EINVAL;
-	if (!qopt->cycle_time)
-		return -ERANGE;
-	if (qopt->cycle_time_extension >= BIT(wid + 7))
-		return -ERANGE;
+	if (qopt->num_entries > dep) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
-	mutex_lock(&priv->est_lock);
-	memset(&priv->est, 0, sizeof(priv->est));
-	mutex_unlock(&priv->est_lock);
+	if (!qopt->cycle_time) {
+		ret = -ERANGE;
+		goto unlock;
+	}
 
-	size = qopt->num_entries;
+	if (qopt->cycle_time_extension >= BIT(wid + 7)) {
+		ret = -ERANGE;
+		goto unlock;
+	}
 
-	mutex_lock(&priv->est_lock);
-	priv->est.gcl_size = size;
-	priv->est.enable = qopt->cmd == TAPRIO_CMD_REPLACE;
-	mutex_unlock(&priv->est_lock);
+	gcl = kzalloc(sizeof(*gcl) * EST_GCL, GFP_KERNEL);
+	if (!gcl) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
 
+	size = qopt->num_entries;
 	for (i = 0; i < size; i++) {
 		s64 delta_ns = qopt->entries[i].interval;
 		u32 gates = qopt->entries[i].gate_mask;
 
-		if (delta_ns > GENMASK(wid - 1, 0))
-			return -ERANGE;
-		if (gates > GENMASK(31 - wid, 0))
-			return -ERANGE;
+		if (delta_ns > GENMASK(wid - 1, 0)) {
+			ret = -ERANGE;
+			goto free_gcl;
+		}
+		if (gates > GENMASK(31 - wid, 0)) {
+			ret = -ERANGE;
+			goto free_gcl;
+		}
 
 		switch (qopt->entries[i].command) {
 		case TC_TAPRIO_CMD_SET_GATES:
@@ -1053,51 +1067,44 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			gates &= ~BIT(0);
 			break;
 		default:
-			return -EOPNOTSUPP;
+			ret = -EOPNOTSUPP;
+			goto free_gcl;
 		}
 
-		priv->est.gcl[i] = delta_ns | (gates << wid);
+		gcl[i] = delta_ns | (gates << wid);
 	}
 
-	mutex_lock(&priv->est_lock);
-	/* Adjust for real system time */
-	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
-	current_time_ns = timespec64_to_ktime(current_time);
-	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
-					qopt->cycle_time);
-
-	priv->est.btr[0] = (u32)time.tv_nsec;
-	priv->est.btr[1] = (u32)time.tv_sec;
+	memset(&priv->est, 0, sizeof(priv->est));
+	memcpy(priv->est.gcl, gcl, sizeof(priv->est.gcl));
+	priv->est.gcl_size = size;
 
-	qopt_time = ktime_to_timespec64(qopt->base_time);
-	priv->est.btr_reserve[0] = (u32)qopt_time.tv_nsec;
-	priv->est.btr_reserve[1] = (u32)qopt_time.tv_sec;
+	time = ktime_to_timespec64(qopt->base_time);
+	priv->est.btr_reserve[0] = (u32)time.tv_nsec;
+	priv->est.btr_reserve[1] = (u32)time.tv_sec;
 
-	ctr = qopt->cycle_time;
 	priv->est.ctr[0] = do_div(ctr, NSEC_PER_SEC);
 	priv->est.ctr[1] = (u32)ctr;
 
 	priv->est.ter = qopt->cycle_time_extension;
-
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	ret = stmmac_est_configure(priv, priv, &priv->est,
-				   priv->plat->clk_ptp_rate, true);
-	mutex_unlock(&priv->est_lock);
-	if (ret) {
-		netdev_err(priv->dev, "failed to configure EST\n");
+	ret = __stmmac_setup_est(priv);
+	if (ret)
 		goto disable;
-	}
 
 	ret = stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
 					      qopt->mqprio.preemptible_tcs);
 	if (ret)
 		goto disable;
 
+	priv->est.enable = true;
+	kfree(gcl);
+
+	mutex_unlock(&priv->est_lock);
+
 	return 0;
 
 disable:
-	mutex_lock(&priv->est_lock);
 	priv->est.enable = false;
 	stmmac_est_configure(priv, priv, &priv->est,
 			     priv->plat->clk_ptp_rate, false);
@@ -1107,11 +1114,15 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		priv->xstats.mtl_est_txq_hlbf[i] = 0;
 		priv->xstats.mtl_est_txq_hlbs[i] = 0;
 	}
+	i = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+	if (qopt->cmd == TAPRIO_CMD_DESTROY)
+		ret = i;
+free_gcl:
+	kfree(gcl);
+unlock:
 	mutex_unlock(&priv->est_lock);
 
-	err = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
-
-	return qopt->cmd == TAPRIO_CMD_DESTROY ? err : ret;
+	return ret;
 }
 
 static void tc_taprio_stats(struct stmmac_priv *priv,

-- 
2.53.0

