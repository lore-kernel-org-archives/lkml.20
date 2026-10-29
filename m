Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282164;
	b=Yw9IPN7RjNu4340Adg+XsTb/SwuxgFgFvOu195mAAYGOKztgPBplOzFwEcLlBqDIuqhe
	 8MmPa0VER32cqFhpPZvlvKuAd3NSjByh5htD3LX7web8dgX9HC3aPQCAXTrtKZnKpbPTk
	 1yZlJxGQjnh1Pgwj8ZuWHcQtMyreJr6ZYqS7CM2HcUBIxOL3IxgSKjiJEfxLsQ5s5rKnB
	 rlIG9uQNH4dehW0ItiuuQjAybaRNBz4HFckYMJ7Ii2B7j0Di2L2xGGHmOYKd8yLrtVNvk
	 TvW1i9E6Wf1JlZxXaYuw0B6UG+fXHV4khipotYWzsGHT/R/JQxPOAhFXTsyqrNJyewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vxa8AmcTAnTqlMRaglXqO3kdP+AG+7ou/20D2qdOuTk=;
	b=0UQERtpfTGiup/nLnQmSYb3QI6Yh/iyQL4A+8C3BUT3s3UELmw4O44/tnD+Y0ySQpYRC
	 hE5v98hc/b/pZZbvO+akgHtwOxx9n7o/hqYrPUxULLU/3B1Cezhfac5v5RdUfu1T5Olba
	 QW79h+D/txojgJTcBljezozG8eiSGpY7qg39rmrhOpaHOW937h5ECzJVR1tdckrsUnaO2
	 Xq3XNtgjZqpY98kQBHS1VLJvj+9VkubZ2mlz4xTYUDuvh9nPd/HOF3D6QwtwXhbWr1O2J
	 A2Yw2nKxq36cNE+pTNuxGnSbxhip9sMoSTJcv70diQfjDf6VEQKAZbT/8xPAC9lWFBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EV0OS53g;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A92606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EV0OS53g
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1262957a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793282163; x=1793886963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vxa8AmcTAnTqlMRaglXqO3kdP+AG+7ou/20D2qdOuTk=;
        b=EV0OS53gHjs5gB/C5aFrhAt0b113Yuxwc8Wrs+m7XPF/OpFdDa1iAo+uTLj9OeHCk4
         BlKhWfThx65xwNHQAWxjSNlvIp6f1tIb6T+E5/PY5zQ9F+BJaMqm206Gmr5f1K5l6+mE
         kFFEJgt5pnKgupwgpjZlDEdpUKFk8AxAR74Nf+LzXLcDvPaWohlAm3XLWOO27N4XYRE3
         DduLrrHKG6l4zo0E2vQbqtBfQZyZCdiXyOyoaq2W1qj/T42r+K8yT/kBBLQu7JRkafPZ
         FDWu6JV6SL4pTiUKDSQC7yvsgnY/macpYCyehFZ1SGUyLp5RyTIxZSS+8c6G2IOdZo0X
         j8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282163; x=1793886963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vxa8AmcTAnTqlMRaglXqO3kdP+AG+7ou/20D2qdOuTk=;
        b=DlOnWpwDdxq8iPt5lnjpn3X+36LYOV7V45sNABBIIJUsOLP3wRpgrTgCTHMFzPtDKA
         dTYUKb1uR4tsM9bDzQc7sJbAhHghnZZN5c1B45xCCGXTZgOXcxyhqRxHWHO5+mPL5Xzl
         G6ElGFOxKeAdWeJHXGtRhCs32vpkwDxZsAJzgnLTraunjTXP1VVTKGi8KpiN6FQtfXLC
         MZBRvaCViAldSWOLJSVA0pYHy6qbPzADL+1lT+s/HGlDkolKOv1EYMTqqy3F3m5n/WUH
         xXczZiKuyHbRZrUvsVbMqVFdtt9Fk3bAZrh1lutw0RMvVBdqFQimXOjSTV9zK/ZHZWYk
         CUnw==
X-Forwarded-Encrypted: i=1; AKwUvBxzle14FXISdwp8Bbs0pCv+tfJbfceUEmW9qUc2OxDEJuyKRZytO2EgW++iuYTFn2i/5dvGqUnzVZaAMVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoajcqBp3BEhXzLqBM8XnbzuB9HV3ZREoVBhocRvioZDHcY8MN
	MTzBUpB7XuTC61slsAMmyfhb3Q/UD8TayF61phWXQOvI8GRrnYt0lgwitIYA2M/yw0AwNN3sCH4
	cC5NSFw==
X-Gm-Gg: AYBFou2S6+z2bw9WcygHv+YiO0IVf0Vuzne4EnI0Q/+Nr1uFXKCzb4LgND22MK5j7r+
	EWL3pSVFAZCpZi4zuXSFTmNlAathqyMp4rzuZppWI/YZYcnGO6TonWrvXHEekjFNPsleD/45pIQ
	DJyeVPxZ3rY06kTkzMedV+sknMfXRDH/WAJHD8M4BnMBgF3xdcOWbS8ujmTJh6Gc2d1ddjSnJht
	v/PMpwyJf+PdBQ+nVMjTdXPsg3HKVIFGn+8n6e6uzPITOt46w33pqwX/GGG3gti/nG7NFfgZ9Vt
	mAsgWw5T98ejl1aendTv90ZejDMCmXssN57e3/28/pXvQ7dfvrOZZNQLxOl2vk0CICU+REPAg7d
	QWu+/+Qvj3OspvmhmSnKVR4zO6GzdkrizaziW+WJ3Qtgnp0wRj48aE+iGlL31+cn1uWxbzdUFm3
	LEYspK6b6/zKfAO4K7pVdkcspHSSLwggpWTC2poju/Em7/M+qLoW5vCqxEpUphmF6KHF+LD88mK
	2iMw4GvK5RZjstOZ1X8bV3R4XsNK3oZD0u0g0n/F2pKiYSSzNCB6hAeWKwVV9Y/a/Z3Oy5FXf/r
	0Js097AV6JB3rlaxHI99hZSc73FQWoWi/MF4gUg0UTqm+dVmD2ylecIc8Ey7yfuPR+ckWhVKX9h
	6v023vKlT86F4P0aE
X-Received: by 2002:a17:90b:4b0e:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3ae57f9b30cmr4349658a91.17.1793282162808;
        Thu, 29 Oct 2026 06:56:02 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm4418845a91.1.2026.10.29.06.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:56:02 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Aksh Garg <a-garg7@ti.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ethernet: ti: am65-cpts: adjust perout genf following ptp changes
Date: Thu, 29 Oct 2026 20:55:56 +0700
Message-ID: <20261029135556.2508688-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

A periodic output requested by PTP_PEROUT_REQUEST2 drifts away from
the PHC as soon as the PHC frequency is adjusted, for example by ptp4l
or ts2phc: at +10 ppm each edge is 10 us later than the one before.

The GenF that generates the output counts its period in ref_clk
cycles, which the PPM correction of the CPTS clock does not reach;
each GenF has its own PPM registers. am65_cpts_ptp_adjfine() programs
them only for the GenF used for PPS, and am65_cpts_perout_enable_hw()
starts every GenF with them cleared, so a GenF used for a periodic
output is never corrected.

Commit eb9233ce6751 ("net: ethernet: ti: am65-cpts: adjust pps following
ptp changes") added the correction for the PPS GenF, and
commit 7849c42da2ca ("net: ethernet: ti: am65-cpts: adjust estf following
ptp changes") passed the same values to the ESTFs.

In am65_cpts_ptp_adjfine(), update every enabled GenF the way the PPS
GenF was updated: read its control register, set or clear the PPM
direction bit and write it back with the PPM value. The PPS GenF and the
ESTFs get exactly the values they got before. In
am65_cpts_perout_enable_hw(), start a GenF with the current correction
instead of none; this applies to the PPS GenF too.

Tested on a BeagleY-AI (J722S) with the GENF0 output looped back to
the HW1_TS_PUSH input (EXTTS 0). With the PHC frequency adjusted by
+10 ppm before the periodic output is started, the edges drift 10 us
per second against the PHC without this patch (290 us after 29 s);
with it, they stay 20 to 23 ns after the PHC second. This also works
if the frequency is adjusted after the periodic output has started.

Fixes: f6bd59526ca5 ("net: ethernet: ti: introduce am654 common platform time sync driver")
Signed-off-by: James Clark <jjc@jclark.com>
---
Test details: testptp from tools/testing/selftests/ptp. Before is the
stock BeagleBoard 7.2.9 kernel; after is this patch on net/main.

  testptp -d /dev/ptp0 -f 10000
  testptp -d /dev/ptp0 -i 0 -p 1000000000
  testptp -d /dev/ptp0 -i 0 -e 30

Before:
  event index 0 at 32.000000023
  event index 0 at 33.000010023
  event index 0 at 34.000020023
  ...
  event index 0 at 61.000290023

After:
  event index 0 at 33.000000023
  event index 0 at 34.000000021
  event index 0 at 35.000000020
  ...
  event index 0 at 62.000000022

 drivers/net/ethernet/ti/am65-cpts.c | 67 +++++++++++++++++++----------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpts.c b/drivers/net/ethernet/ti/am65-cpts.c
index df5659ead72f..0d71147f3c29 100644
--- a/drivers/net/ethernet/ti/am65-cpts.c
+++ b/drivers/net/ethernet/ti/am65-cpts.c
@@ -176,6 +176,9 @@ struct am65_cpts {
 	struct mutex ptp_clk_lock; /* PHC access sync */
 	u64 timestamp;
 	u32 genf_enable;
+	bool genf_neg_adj;
+	u32 genf_ppm_hi;
+	u32 genf_ppm_low;
 	u32 hw_ts_enable;
 	u32 estf_enable;
 	struct sk_buff_head txq;
@@ -436,9 +439,11 @@ static int am65_cpts_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 {
 	struct am65_cpts *cpts = container_of(ptp, struct am65_cpts, ptp_info);
 	u32 estf_ctrl_val = 0, estf_ppm_hi = 0, estf_ppm_low = 0;
+	u32 genf_ctrl_val[AM65_CPTS_GENF_MAX_NUM];
+	u32 genf_ppm_hi, genf_ppm_low;
 	s32 ppb = scaled_ppm_to_ppb(scaled_ppm);
 	int pps_index = cpts->pps_genf_idx;
-	u64 adj_period, pps_adj_period;
+	u64 adj_period, genf_adj_period;
 	u32 ctrl_val, ppm_hi, ppm_low;
 	unsigned long flags;
 	int neg_adj = 0, i;
@@ -470,20 +475,33 @@ static int am65_cpts_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	ppm_hi = upper_32_bits(adj_period) & 0x3FF;
 	ppm_low = lower_32_bits(adj_period);
 
+	/* GenF PPM will do correction using cpts refclk tick which is
+	 * (cpts->ts_add_val + 1) ns, so GenF length PPM adj period
+	 * need to be corrected.
+	 */
+	genf_adj_period = adj_period * (cpts->ts_add_val + 1);
+	genf_ppm_hi = upper_32_bits(genf_adj_period) & 0x3FF;
+	genf_ppm_low = lower_32_bits(genf_adj_period);
+	cpts->genf_neg_adj = neg_adj;
+	cpts->genf_ppm_hi = genf_ppm_hi;
+	cpts->genf_ppm_low = genf_ppm_low;
+
+	for (i = 0; i < AM65_CPTS_GENF_MAX_NUM; i++) {
+		if (cpts->genf_enable & BIT(i)) {
+			genf_ctrl_val[i] = am65_cpts_read32(cpts,
+							    genf[i].control);
+			if (neg_adj)
+				genf_ctrl_val[i] &= ~BIT(1);
+			else
+				genf_ctrl_val[i] |= BIT(1);
+		}
+	}
+
 	if (cpts->pps_enabled) {
-		estf_ctrl_val = am65_cpts_read32(cpts, genf[pps_index].control);
-		if (neg_adj)
-			estf_ctrl_val &= ~BIT(1);
-		else
-			estf_ctrl_val |= BIT(1);
-
-		/* GenF PPM will do correction using cpts refclk tick which is
-		 * (cpts->ts_add_val + 1) ns, so GenF length PPM adj period
-		 * need to be corrected.
-		 */
-		pps_adj_period = adj_period * (cpts->ts_add_val + 1);
-		estf_ppm_hi = upper_32_bits(pps_adj_period) & 0x3FF;
-		estf_ppm_low = lower_32_bits(pps_adj_period);
+		/* am65_cpts_perout_enable_hw() sets pps_index in genf_enable */
+		estf_ctrl_val = genf_ctrl_val[pps_index];
+		estf_ppm_hi = genf_ppm_hi;
+		estf_ppm_low = genf_ppm_low;
 	}
 
 	spin_lock_irqsave(&cpts->lock, flags);
@@ -500,10 +518,13 @@ static int am65_cpts_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 	am65_cpts_write32(cpts, ppm_hi, ts_ppm_hi);
 	am65_cpts_write32(cpts, ppm_low, ts_ppm_low);
 
-	if (cpts->pps_enabled) {
-		am65_cpts_write32(cpts, estf_ctrl_val, genf[pps_index].control);
-		am65_cpts_write32(cpts, estf_ppm_hi, genf[pps_index].ppm_hi);
-		am65_cpts_write32(cpts, estf_ppm_low, genf[pps_index].ppm_low);
+	for (i = 0; i < AM65_CPTS_GENF_MAX_NUM; i++) {
+		if (cpts->genf_enable & BIT(i)) {
+			am65_cpts_write32(cpts, genf_ctrl_val[i],
+					  genf[i].control);
+			am65_cpts_write32(cpts, genf_ppm_hi, genf[i].ppm_hi);
+			am65_cpts_write32(cpts, genf_ppm_low, genf[i].ppm_low);
+		}
 	}
 
 	for (i = 0; i < AM65_CPTS_ESTF_MAX_NUM; i++) {
@@ -513,7 +534,6 @@ static int am65_cpts_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 			am65_cpts_write32(cpts, estf_ppm_low, estf[i].ppm_low);
 		}
 	}
-	/* All GenF/EstF can be updated here the same way */
 	spin_unlock_irqrestore(&cpts->lock, flags);
 
 	mutex_unlock(&cpts->ptp_clk_lock);
@@ -679,9 +699,12 @@ static void am65_cpts_perout_enable_hw(struct am65_cpts *cpts,
 		val = lower_32_bits(cycles);
 		am65_cpts_write32(cpts, val, genf[req->index].length);
 
-		am65_cpts_write32(cpts, 0, genf[req->index].control);
-		am65_cpts_write32(cpts, 0, genf[req->index].ppm_hi);
-		am65_cpts_write32(cpts, 0, genf[req->index].ppm_low);
+		am65_cpts_write32(cpts, cpts->genf_neg_adj ? 0 : BIT(1),
+				  genf[req->index].control);
+		am65_cpts_write32(cpts, cpts->genf_ppm_hi,
+				  genf[req->index].ppm_hi);
+		am65_cpts_write32(cpts, cpts->genf_ppm_low,
+				  genf[req->index].ppm_low);
 
 		cpts->genf_enable |= BIT(req->index);
 	} else {
-- 
2.56.0

