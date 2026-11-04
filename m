Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796644;
	b=iBLpiAMD4IY/Jrytb/7wpo6NIAEWZ28Ov9DMVV3SJVHSyUqJ+V/90X0N8IxtJfv+RAaE
	 Wt6YjNYZdDoH2xgjvF6v93bvIYwTgj6KPchfI4cjLIOsla9+jP1WIHg6sEiHEQU2vDWE6
	 KaQUfRmj7lQ+jB/Qi6xlAR0uk9p835tIzJ2vpqyThwXJLvemjTfQjigw2sfrSlc8isdXs
	 QWN3hKExu9acJAP6nMjslufNcbMFD/+FA/6up2bi/qu6QTCj5HjFDpZwTaAoriQU+CzQa
	 46XxLmcE/ryPG6cHuAYZE8IjzYd7FAlAeEYrn/B7dupbET9Ly3UP/81psJmKVLctrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7ROzI5pFKC1DlvyH7PwbH3PaOSQ+SHEt5iuezD/Lo1w=;
	b=VXfr7yMwk3wWHRmkNNRYl1MVhydmdYSiY+GVkSLjmyaSOcpBfLWwGI2iAvV3PuHAibsK
	 vwV46GFuXWP90Wa3LtPP5AAxu2ZXRXro5m36gCq6jxDEkCJA8fde8lzyyfA5IyDVqQ6Lb
	 4Q23mMzWdXfaMglTfC32xo8R/UHVMuiAPcP01CNPKnyAxmESpQ8QVrv0Lm2EgreLHZvq3
	 KE1KsZ45siSHJ86/0i2i5lk8uHhU68wyNpdCql4chdf1pADAm43Jy8vqM6jrE63fYkwOz
	 dmlpUzqYX221SykNTSgYmyWd+sEnX+XrYJQg7xK0Rlsu/oGr2bZmfl5/vvJ7pvFU6gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMFbhM2y;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96B606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E96B606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMFbhM2y
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so391262a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796643; x=1794401443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ROzI5pFKC1DlvyH7PwbH3PaOSQ+SHEt5iuezD/Lo1w=;
        b=sMFbhM2yZqNp1QsenblfNuflgzQqV1qIObFqoNvDmLTQFwizMshMoTwqd8c4j1nWgZ
         9Gp9IJfRt46fUxRXrTIak+2sUq4S47NY9nxJfxRMpK8imKTNijaiNhaw+2yJMJOEsZFd
         VUawj8RRrkmetGzGGDk0flaVR2vTq6H2HA78cfwxkFN1qycwxpZ2YFu7VgMZpiQKyaiD
         ILfLXOB9ZC92ffaonCtnpKqFmonnZonmbaFltOqJfl7BZKMCRQlkb0rXVLgbLWizU0K/
         Dv3V41nHfiKuMxTcoPr6OH3+53EAvEPhOwTuWXayNZRvm0Kca6vSCVav8JoPO+45nmhZ
         pw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796643; x=1794401443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ROzI5pFKC1DlvyH7PwbH3PaOSQ+SHEt5iuezD/Lo1w=;
        b=Id2ffo4bfp0ryiEZg2z5ru9xVnhtZhWgrNZF2ber60t26S/UqOC1U+AB2uRtLBYtKR
         9EMcOq3XXYAdSgKa0WElycuQQTtEDCe8Qe8rqgdXWDkpdQCyWgs0qPCis6svCnzVdc5o
         g2NNIRvlxQc2RlSGdvdxByO5buRWTDEy5RgW2C1tPbKdzFlBGBkjD6e0IwpPq2J50nhc
         /luNZ+Gy/do6/Rs4SXg+cMcQyxYTq/BX/fSZfKa6UgUhYAENaOn2bXgyZr6Ik139klJI
         NwwFcIegUNhrA7EB7VG8J3rGvB0nXXy6mt5+qNLYTZW5v90FrEPBAXvhOYyyVxLT1WIq
         09Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzKWRLu/Xu3r40WCI8XIxu8u6E7eKCidGIDfr/PTPbVvHVoPvTVfGUfBQPpkdeNJcCzlZQsceEvTqKh+2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gr1XrAC3md52sdT5IvA03lSpl9DKesMstByQ93ZV5J7qKytX+
	N3aPOa2OTW0TSItYt/cZtgGjCJ+r0oSvG2njhXmcaq9h9n2FZb+BGVbE
X-Gm-Gg: AYBFou0AMZ6WMqJwCIF+AEuN8baorpHmIk/7Qj1qC5yhs6aJ1tbrir7AW5Y/P8RGbOo
	weQwKVDVcmK6zbutXiyXbI98PUKKHLratPk5mDLD4MXAGJq92DwGYe1hX3ry/LXvGnIoXCRPHWy
	DC+/EHIeIRmfYnnaAeASZrQ/CdQ9s/3gRT8nj2L9GCbugDNdlcUH8rdTPa7zPz43DipXlvMTAeG
	gAN4eGR50Rm73BDtX91FqDkL1hEwCRk8crLZt2bsQ5b9gtSlVGmjDw0czJ1P/LXD2iYQrEs13PU
	orW7Qtoeiqn5W5haQPoerir/y4mSgN2/V/1kJU800Phms1smvY4FuTKbHmU7mofLyUIuHGA5yvl
	cI/tWMR4yZ5Hyeid0lU66VRCnZmg37K6J5cOnKdPO/cFp+dt7bayBYTwSaKOFesWlSxK+y134V7
	uxDj77VfFyswitGzc+T6uFw0H/z4h8D8JSGZyvEtOq1APs9B/vKHuSngqFxD2tS5kMBUISoVKbP
	IMtauLS4LsKzNzyqzmOoTSA2ZeqNh8gV+zfZ6lg2UktCP/Ih6VtknpRoBaVqzv5+eutvRoHxQpS
	g7TSf77VBXjUpbQyksHPAMla6P1N
X-Received: by 2002:a17:90b:17cd:b0:3ac:9e5e:d195 with SMTP id 98e67ed59e1d1-3ae89851212mr12650512a91.61.1793796642926;
        Wed, 04 Nov 2026 04:50:42 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09449bff2sm3920799a91.9.2026.11.04.04.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:50:42 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v9 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Wed,  4 Nov 2026 20:50:28 +0800
Message-Id: <20261104125030.1183146-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104125030.1183146-1-zxyan0222@gmail.com>
References: <20261104125030.1183146-1-zxyan0222@gmail.com>
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

The Agilex5 smtg_crosststamp() handler polls XGMAC_INT_STATUS for TSIS
to learn that the auxiliary snapshot is latched.  TSIS is a transient,
read-to-clear status bit, so the poll is racy in two ways: a stale TSIS
from an unrelated event satisfies it before the snapshot is latched,
leaving *device unwritten while the call reports success, and a
concurrent reader of XGMAC_TIMESTAMP_STATUS can clear it and make the
poll time out.

The FIFO level is also reported by the ATSNS count in
XGMAC_TIMESTAMP_STATUS, which reading the register does not disturb.
Poll ATSNS instead of TSIS, after waiting for the PTP_ACR_ATSFC FIFO
clear, so a stale ATSNS cannot satisfy the poll before the new snapshot
is latched.

Hold aux_ts_lock across the whole sequence, and refuse the request
with -EBUSY while a channel is enabled, so the PTP_ACR mask
programming cannot disarm it and a concurrent request cannot flush the
FIFO between the poll and the drain loop.  The lock is held across the
SMTG register reads as well, so a concurrent PTP_SYS_OFFSET_PRECISE
cannot retrigger GPO0 while they run.  The internal snapshot trigger
is disarmed on the way out, including the error paths, so it does not
stay armed in PTP_ACR after the cross-timestamp.

Fixes: fd8c4f645496 ("net: stmmac: socfpga: Add hardware supported cross-timestamp")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 52 +++++++++++++++----
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6d4bc1fe8f75..2d3c6702e203 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -304,13 +304,15 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	int i, ret;
 	u32 v;
 
+	mutex_lock(&priv->aux_ts_lock);
 	/* Both internal crosstimestamping and external triggered event
-	 * timestamping cannot be run concurrently.
+	 * timestamping cannot be run concurrently: the PTP_ACR mask
+	 * programming below would disarm an external channel.
 	 */
-	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN) {
+		mutex_unlock(&priv->aux_ts_lock);
 		return -EBUSY;
-
-	mutex_lock(&priv->aux_ts_lock);
+	}
 	/* Enable Internal snapshot trigger */
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value &= ~PTP_ACR_MASK;
@@ -337,8 +339,21 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value |= PTP_ACR_ATSFC;
 	writel(acr_value, ptpaddr + PTP_ACR);
-	/* Release the mutex */
-	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Wait for the FIFO clear, so the poll only sees snapshots from
+	 * this trigger.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		acr_value = readl(ptpaddr + PTP_ACR);
+		acr_value &= ~PTP_ACR_MASK;
+		writel(acr_value, ptpaddr + PTP_ACR);
+		mutex_unlock(&priv->aux_ts_lock);
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
 
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
@@ -349,10 +364,17 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Poll ATSNS instead of the transient TSIS: the ATSNS count is
+	 * the FIFO level and is not cleared by reading the register.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
+		acr_value = readl(ptpaddr + PTP_ACR);
+		acr_value &= ~PTP_ACR_MASK;
+		writel(acr_value, ptpaddr + PTP_ACR);
+		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -364,8 +386,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
@@ -375,9 +396,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	/* Disarm the internal snapshot trigger, so the PTP_ACR mask does
+	 * not stay armed behind the software state.
+	 */
+	acr_value = readl(ptpaddr + PTP_ACR);
+	acr_value &= ~PTP_ACR_MASK;
+	writel(acr_value, ptpaddr + PTP_ACR);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
+	mutex_unlock(&priv->aux_ts_lock);
+
 	return 0;
 }
 
-- 
2.34.1

