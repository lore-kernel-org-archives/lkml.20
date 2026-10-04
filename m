Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01487424679
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115576; cv=none; b=P9PGNMQSw7JMLko2it+yyXIZ9WLV9ku4rBMaoKBSvmCSC13MZ6gNI6rdFVVC3HPgENSK6DaxFXuJB3sTy8Fzk8R/A7P7BgLBpRe6Pb3IS574FRiZjSwucsIZHNFn3jRis9Hp2Dt3ftznevwxrCGjPUkq/CJLUoy2cGCK5jWlw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115576; c=relaxed/simple;
	bh=+Q5KrLa+RYUVXTCmo/Pl8dhHC3ruyrmu7q7LsWKI10k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nG/Oj8aD1FDBOJMclYvyOcmj6tr0NSkHp/Z9xujifU1EGGrgCZgww50mZ4xQp5RO7qHrtKJofQjFc0qqzfwWbgoLDT3b1h86uzl8Y73Em23GK/YW89OpUbTlPKAC5lpc1cDJKeYcgiInluIfrMU4w6LFUgKY50NPfVd6AtN9kiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCEJoVpo; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCEJoVpo"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso548215a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115573; x=1791720373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=;
        b=CCEJoVponTE+tgiGu/XbkZBHE2IncsNHA99ygPNqALXt9F5lm8URTuh///KZkIZKGG
         TWH20tnIgXhD13IzmnZ+2HtfDWkeqwqvQJo3kr6gUR2A373tI9uzymgFkNuT9ntn+m6w
         xieFBKZx5hB73HNRKpE/5mzlQ1Sitp5SNrxrvMnlDVzP+N7T6olvJWRRMceSdwNWG2fZ
         5L6usJxtJV/DYkpIdiUGNZIo6BPCZsa7QE7YBpp1RmR5cVueZsycKBzk5UMSsBvRcpVR
         MWaTz9V6hR4pe2kYgq9Ybqq7gPQCWE/Shi7BgWiHox5JJDYRfRnBXxckHCl9leJE5tNI
         TdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115573; x=1791720373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTEYOw9n/f+CuyLaWuC1D1eq7TsF3FBxSGnXYETmVL4=;
        b=sANY1JHwWdwZ4cjwm+IkjCOLigvmgCuKmH0/dcirHQLHHRob6SJ6Z5yE5b7/cFP/Os
         FR0mX5rYGmPB4zxWM+GjycqPE4eqcQx5/XP2RwFBr+PEtxkmR+8cGKM3u9YdAl/lz4RT
         CDkVpwakr30piEc/Yj1G6V08sEwxKr7IJFw4kEofIwDozlx94BFaARONiEBgrk3b03rj
         utfnmTYMogp6uxtJTdy82Y93WB+80xZA71Eui5ruVNDOuw3wlLs8ijAmlwns4uSCfXHp
         HvgucbAq4exjz14JY577CNWlF2jDc22JP1E+e35A7YnwLfkuGppoDtjB5+u3s4NjAOlh
         wKMA==
X-Forwarded-Encrypted: i=1; AKwUvBxPyQ81JQ6KQ0/+esWoqPkibiwhWpkon6pVXr8/O9AzNCx15qbjIXXNs7OP3eyntoOggqn3L2R1KHZZk7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiYLRO0705yzwoa61GLbmVPiWO8BiUeuZba0l7vfMLMApIVqEn
	oJ5O0k8PHJ6IjHNfGGI2dhxcs7CmAl+usNtZgacKOcD8ik2ioRiiRcCu
X-Gm-Gg: AYBFou1gRAOTwdT6PEU2MIPkuLres99HDycOsAn7UxhWdHJKLYqeZkyYTYn4vxycmV8
	AzC8qSPfZZI5E7prZiOMLwvPO6vZy6939WHrTiTj+y3YXEswRqILJ/88OXBrp4hG8WLBxxDUpO2
	qMt+zOXGi4jEknUO/3zaWV5IcRgQicRmpvBpZ1RrQoNndOyMk9T6rMGN0T3WW0YJlTTp2r6tb+u
	RwW8IEjRkKK8Kn7bny/atKkPyjE9F74R10bpj9b6wBFkAHUkvRp+8u9Zr1Bekp3nHlmalrT/XqF
	o9Y7bhQIZ0PPFxvKPC5twCWariUltwCxK8PENW6ZBk5wV08XA8eHuvKhdvHl0q3+tTpgksh95dj
	p2O28aS2a4YE8xMyc/yFnlAEdMgbQGl6dsIbW9j/0KiwN4KN3GmtmqcHuL/Tp6cT2n2hfLRfypb
	8mKwqIeuewPvIjqCDCvZ23JTyoXXLaqSJPwOWtsrb6DWwLCQc/6A8AxiFroFU1VkucwDrtEQ==
X-Received: by 2002:a17:90b:518d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a6cec143d7mr6861879a91.14.1791115572650;
        Sun, 04 Oct 2026 05:06:12 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm2603661a91.0.2026.10.04.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:06:12 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	maxime.chevallier@bootlin.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v7 1/3] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Sun,  4 Oct 2026 20:05:24 +0800
Message-Id: <20261004120526.2728564-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004120526.2728564-1-zxyan0222@gmail.com>
References: <20261004120526.2728564-1-zxyan0222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex5 smtg_crosststamp() handler arms an internal auxiliary
snapshot, toggles GPO0 and then polls XGMAC_INT_STATUS for TSIS to
learn that the snapshot is ready.  TSIS is a transient, read-to-clear
status bit: it is set by any MAC timestamp event and cleared the moment
XGMAC_TIMESTAMP_STATUS is read.

That makes the TSIS poll racy in two ways.  A stale TSIS latched by an
unrelated event satisfies the poll immediately, before the auxiliary
snapshot is latched, so the FIFO comes back empty and *device is never
written even though the call returns 0.  Conversely a concurrent reader
of XGMAC_TIMESTAMP_STATUS, such as the TX timestamp completion path, can
clear TSIS while the poll is waiting and make it time out with "Wait for
time sync operation timeout".

The auxiliary snapshot FIFO level is also reported by the ATSNS count
in XGMAC_TIMESTAMP_STATUS.  Reading XGMAC_TIMESTAMP_STATUS does not
affect ATSNS, so the destructive reads above cannot disturb it.  Poll
ATSNS instead of TSIS, and wait for the PTP_ACR_ATSFC FIFO clear to
complete first so a stale ATSNS from a previous snapshot cannot satisfy
the poll before the new snapshot is latched.

Hold aux_ts_lock across the whole sequence instead of dropping it
right after arming, so a concurrent PTP_CLK_REQ_EXTTS request cannot
set PTP_ACR_ATSFC and flush the FIFO between the poll and the drain
loop, which would leave *device filled from an empty FIFO.

Fixes: fd8c4f645496 ("net: stmmac: socfpga: Add hardware supported cross-timestamp")
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d288..c5f71bfc7cf4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -337,8 +337,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	acr_value = readl(ptpaddr + PTP_ACR);
 	acr_value |= PTP_ACR_ATSFC;
 	writel(acr_value, ptpaddr + PTP_ACR);
-	/* Release the mutex */
-	mutex_unlock(&priv->aux_ts_lock);
+
+	/* Wait for the FIFO clear to complete, so the poll below only
+	 * observes snapshots latched by this trigger.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
 
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
@@ -349,10 +359,16 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Wait for the auxiliary snapshot to be latched: the ATSNS count
+	 * is the FIFO level and is not affected by reading
+	 * XGMAC_TIMESTAMP_STATUS, so concurrent readers cannot disturb
+	 * the poll.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
+		mutex_unlock(&priv->aux_ts_lock);
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
 		return ret;
@@ -364,8 +380,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
@@ -375,6 +390,8 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		read_unlock_irqrestore(&priv->ptp_lock, flags);
 	}
 
+	mutex_unlock(&priv->aux_ts_lock);
+
 	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
 	system->cycles = smtg_time;
 
-- 
2.34.1

