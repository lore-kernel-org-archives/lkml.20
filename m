Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0EF41B354
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027836; cv=none; b=Ofk4NL5uWh9Xh5UoNxVhrwM6xBJOT8jbZrAO85pG4Gzx+ICkFNGYbEDQy+/e1rlU/M81lstGTcbMpYtgRs7bKnpGpshdsKQXmpvqO5ekRGywKUkVAcFFmQnYq6/VoPHioRd8htgJcgYKr6lcJMJ5s3aXubk2+mpzzYmwndXdl/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027836; c=relaxed/simple;
	bh=7A+U+74WGkXsYGVAmxIitnef1L1YpX9QdK0dK/NlEMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hc1sy7i/w6HivMjHKRetPi92pLt5Q5qe/G/ScWSp/5eY8j7B5+fArw4vQVSezImxCKBpjUx+62FkgKWG3KBKYq31KFXT87g85TCiCv1TwfVw4pxl8cFxMA7o74N9IgLPAZMjkIsy6kNImXQfcGajvo4iBoWqgmP0exbWK9Gma+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kosq5C2r; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kosq5C2r"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so7414757a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027834; x=1789632634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31zePXVLBWNEdCU+Xr18Au8ugINcScI/iDLGt4y6SQ0=;
        b=Kosq5C2rlL8LfUgyjd9vm3IYVSY7Iq4dygWi4aGgKoQLmoPmYqkZEasKLH5w+uF1Ui
         EEs4ofaSNYqS/QlKDpUPXJxJRhhCDzb4zS8qjzA5g3D3+7Gwm6i+NDveSxtOueHSTbMK
         t/pP5q2vMP9tMWSAHu8xLGXFiesPAL1AxCvk0CZ49IH2MKTnx+g2nXTkigGOSUBon9Ss
         /fiEb5t5bvraftAb+/TldzUgBjwpATgEGa+maCRJ5PcUZlBQFHvhnH1e9v+tzNcqGKvd
         xvVK5veRu1HlKbYLO49F+S06e/0RR39Zvoz2tkGz9jJNzVm6pqhHyFUeLgaQ9y4qXoh6
         ugbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027834; x=1789632634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=31zePXVLBWNEdCU+Xr18Au8ugINcScI/iDLGt4y6SQ0=;
        b=oI9kQclVwMmrrjnWAvjh9Llj28oaitNR38YhQTWzhExl9/KG/9U9StoDGDBiNZKtGz
         7PdrIJL6ZwgCgMpJZB99e9TPHO0qTIL343yv04gu4O5r9FBoWxe4+CQ2RsUa2L9VIQLQ
         7WS7fNveWGMo6whCHttiILZJGCd/0VR2qoXFeCYVOaUSVWCyE3mVyN33XQEzRePjNTWj
         aaufrDExOut53E+lOEAK10tLSMj9cczacsd77jOY9uCOLleMGhwet81EI0TFUM+T4+nD
         XdgIST0yK8v3ou1HljyVMx6Uqs7yoOiPGCCfTrU6OaAd7oGP2SiK0IsBQ0LYY7S3H4yW
         vnhw==
X-Forwarded-Encrypted: i=1; AKwUvBx0QTDHpwDxbV5U5eH2joZiuRTIEUF39N6cwKYUWuIh4I1AFCgy/WO67yWfZ2iz8XZx8610O1sSVleNDSg=@vger.kernel.org
X-Gm-Message-State: AFuF++m6vODKw4yaWM3L7h93r50Z4fXVORrPCC6iFPEvUOMU/VV5yVW6
	Y74N4aZA9CZ4sW2d/Be66DlJGITMaw/v5+o4VRw7zna1YFSQ3VVaQqT2
X-Gm-Gg: AYBFou3pfPx4QZupyzfgz12dkGyGrWMWaTMqHirbN/LBHwakB9mhhEPBwBpIvquC73S
	UFkvWacP2foDjOki6BKD6JL6IVvLNXPhQI5CmY4RaTBpSRy3ztmrfLr8SIbzHix+ioyl8KxIMYe
	2CMfJMf9+N9/o9KfK0zK0sv+q/Mp5XNqFhjdc3Q2/cyuCxtJOXUGYLyZITUs4gxovHOsrtNrizn
	slNYi8JrXfx/flYmCRo+4s+QjGdF/M/FNFJnnUouDSyYPN8jEFH0DILucL6nnAPOwqyZ8n3Cezp
	oogjEIAkK/VNFbEP1tuRJlOJmljW5k/6fbHXvQ1MaXlMH0I8WcSNNCSlUtRfuvGEDA9NNoxCCAS
	X6hXlzuhvpEx05Vi4KfQcwqvBMO+5oqimMyaMHnanvefftWTn6t+LBWNtoN08XXnXbgR9MSqyjA
	dSJkdbUUr29TMqLr6uR8nlO+PWMmqtibgLJL8NdFIaaAsVeg4LtDkRXOXjbS8yilkIEaN9kOELa
	no4MZs6
X-Received: by 2002:a17:90b:1d52:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39b26242a20mr59997599a91.19.1789027834038;
        Thu, 10 Sep 2026 01:10:34 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4442434a91.2.2026.09.10.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:10:32 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/2] net: stmmac: dwmac-socfpga: complete cross-timestamp on ATSNS
Date: Thu, 10 Sep 2026 16:10:19 +0800
Message-Id: <20260910081020.86227-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910081020.86227-1-zxyan0222@gmail.com>
References: <20260910081020.86227-1-zxyan0222@gmail.com>
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

The auxiliary snapshot FIFO is also reported by the persistent ATSNS
count in XGMAC_TIMESTAMP_STATUS.  ATSNS is cleared only when the FIFO
clear bit (PTP_ACR_ATSFC) is set, so it is immune to the destructive
reads above.  Poll ATSNS instead of TSIS, wait for the ATSFC clear to
complete first so a stale ATSNS cannot be observed, and derive the
count for the FIFO pop loop from the value the poll read back so it is
guaranteed non-zero on the success path.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d288..ee6f28637878 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -340,6 +340,18 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	/* Release the mutex */
 	mutex_unlock(&priv->aux_ts_lock);
 
+	/* Wait for the FIFO clear to complete so a stale ATSNS count from
+	 * a previous snapshot cannot satisfy the poll below before the new
+	 * snapshot is latched.
+	 */
+	ret = readl_poll_timeout(ptpaddr + PTP_ACR, acr_value,
+				 !(acr_value & PTP_ACR_ATSFC), 10, 10000);
+	if (ret) {
+		netdev_err(priv->dev, "%s: Failed to clear snapshot FIFO\n",
+			   __func__);
+		return ret;
+	}
+
 	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
 	 * the GPO0 to low and back to high.
 	 */
@@ -349,9 +361,17 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 	gpio_value |= XGMAC_GPIO_GPO0;
 	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
 
-	/* Poll for time sync operation done */
-	ret = readl_poll_timeout(priv->ioaddr + XGMAC_INT_STATUS, v,
-				 (v & XGMAC_INT_TSIS), 100, 10000);
+	/* Wait for the auxiliary snapshot to be latched.  TSIS is a
+	 * transient status bit that is set by any MAC timestamp event and
+	 * cleared by reading XGMAC_TIMESTAMP_STATUS, so it is not a
+	 * reliable completion condition.  Poll the persistent ATSNS count
+	 * instead: it is cleared only by setting PTP_ACR_ATSFC, so
+	 * nothing can clear it while we wait, and it reflects exactly the
+	 * snapshot latched by this trigger.
+	 */
+	ret = readl_poll_timeout(ioaddr + XGMAC_TIMESTAMP_STATUS, v,
+				 FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v),
+				 100, 10000);
 	if (ret) {
 		netdev_err(priv->dev, "%s: Wait for time sync operation timeout\n",
 			   __func__);
@@ -364,8 +384,7 @@ static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
 		.use_nsecs = false,
 	};
 
-	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK,
-				 readl(ioaddr + XGMAC_TIMESTAMP_STATUS));
+	num_snapshot = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, v);
 
 	/* Repeat until the timestamps are from the FIFO last segment */
 	for (i = 0; i < num_snapshot; i++) {
-- 
2.34.1

