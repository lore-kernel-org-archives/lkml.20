Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABAD3F871B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115580; cv=none; b=DmdFlhrshgb/py8vJH0kGYxBiMmZ1aJIXQtw8GVapLgnXuA4Y1lAIKKesmIxZCPIljGyXcfaX1I8i2ta5RGi27gGBLhh6Q9HBCNYdT+vs2ygsAuexmEZeYnfcFCK/evwdYUj93uUwTQlreLiG4CfBHfBPZd0sqWTT0b6pmBIfXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115580; c=relaxed/simple;
	bh=EXkfKCc9E5fuCQAQZZmlXL2AKxr+f04NqtE9A2Hapkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dOCGCj2/uP+tlkUQ0diu3dT+92FS5tgLPJmQ1dDiyOcTFn3kz/H5Vlyf6KPzGeywvVe/cPkwdmXNcgOJy9ZuMg3IrdnQWRVwA04s9bE4M07cxWlVjjRtk9MqJw2fPtNtroX0xKQrbDmsmYLrcf5Gy4Cf0n6M20KDbCEkao0Nb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDQZgkj+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDQZgkj+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a7d283e017so208522a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115577; x=1791720377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=;
        b=GDQZgkj+6AQIC6aZYBN8Fkl7y/Se0CnxciQLujOMZd4c5WC6YWA1iMu5gExDfJGn9Q
         NCCuC8zmZVfqzWUdIx80B2PjVlp6HSt7TJG72Hczrj+qcS28iig3+k2r27KSckCHdX9V
         4KKtNdMw3IhRsB42ZG8XGG1FkidMTqWLPLlJ95ULsP9jyiPcmDNKS85Am+mT2XCECR5/
         r0gL42Ud4rttBZ+9GKBlZ7MnxzvDPUTqBui1uoXw3EkR36ONQQmupE+euIMG/j1lrxS0
         q9r2P5e4H5ernNZasHytIJsgkX82QMDb3VXBS1reYJUa1ildUgikG6/qgimf1L/MOiQq
         1Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115577; x=1791720377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+CAZYh8v0QDN7ZotKXM0PQZtaFfuu3vpY61Ne2zKy0=;
        b=FYtxWM0gxHKvpx61IVjcT3Zeh5MHH45EgTajaXMNkkcOFcJCoySoZcbAsKhwKMcQjC
         Q7Tb5QYmtVO3x1wBovZS61azj4cjrBj8MsQZJdIyE3lv/AziE1c8OJpH5Pn0ciBYg9It
         rymY5GrLzgpe4OiIuQuA1GDSSVk15TYv/ZOimkwA3PO3qAxyhfXRB9fP/esluIAjpGpj
         xF232g6YkMfNN/PqTjwg7N9VtrxK0OKv551nU/GpGq4JSlgpszStOsQNJQ1rCZCV7f2V
         Wk9MnW+6SoLtyWmRiQFPbr1QOaioWcuDVKIXSDGqBx9LsI5SWVfYfkIkmI9X7xinPq2h
         20XA==
X-Forwarded-Encrypted: i=1; AKwUvBw/dgz5sw34kGni9DF+aQ8fLtOa1WeL+SQs0lL4Rqf+eOLHCsk4UG6clNsmm4ggzkW69ZEBAbauxNmdS1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNeThJabuBJTI7S/9FH0s3Jv25DgBH0BHoXEZKaiQ5UA4X0u8d
	QAcvS9LTw6BGVrx39guHNvfxsP6RIuWc9Q1ERFwv3QeHwYa5oHonLZ2F
X-Gm-Gg: AYBFou0TuMXwpcOQyiiYROm/ZHL97cC9q+XE7w42HyfWJLXTSxtQZICm+9ZZeCF26n9
	W1blclRX7b4ViYww0AFEemSCdOu9eX4gt9ctTg2QMZKV1+btjMYdii9OI8NujAwsuMbNGc/S4h0
	ZcT+kbMtZr52mxH7/v0fOkPqEEcO91UkbvxBWNgoIMDglxKR6+FffFn9BaXIuRHRMBcaRDAaxiy
	xOScUFg6kHNE2nbv6O7GwIuO229iewAhyrUvly7pgJ7m5nJufy8+yI15bGGQpohTQRVf6e9f/hJ
	Z/jDcT0+GvB2oRISprFdtblR+rWHMQr38XdsZCbmNUSELp2HDS0XRxMYYUFOWiPNA20Yj9Funjx
	82gKOtTTT1l8f+KgLF9W5XJd1nRvcqKvVzpUEFxdAUpDJwvAECntw1o/Rp535nljVcAflbYHxyK
	kDK83+zeLYACTrb15/Y8JiOFDWgxzWZY1QFqqFnmGGsEp60TCwiQYftMYphPssWaYpuWaOJA==
X-Received: by 2002:a17:90a:d60e:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3a7875265bemr3132986a91.52.1791115576910;
        Sun, 04 Oct 2026 05:06:16 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79e7c243csm2603661a91.0.2026.10.04.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:06:16 -0700 (PDT)
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
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v7 2/3] net: stmmac: guard against a zero channel in the aux snapshot handler
Date: Sun,  4 Oct 2026 20:05:25 +0800
Message-Id: <20261004120526.2728564-3-zxyan0222@gmail.com>
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

The generic timestamp_interrupt() handler derives the EXTTS channel
index with ilog2() applied directly to the PTP_ACR channel mask, with
no check for a zero mask.  ilog2(0) yields -1, which ends up in
event.index as 0xffffffff, and ptp_clock_event() uses that index in
test_bit() against a PTP_MAX_CHANNELS bitmap without range validation,
reading far past the allocation from hard IRQ context.

The zero-mask window is reachable: stmmac_enable() sets
STMMAC_FLAG_EXT_SNAPSHOT_EN before it programs PTP_ACR, so an EXTTS
interrupt arriving in between passes the flag check while the mask is
still clear (snapshots can also linger in the FIFO from a previous
enable, as only PTP_ACR_ATSFC clears them).

Check the mask before applying the ilog2().

Fixes: 8851346912a1 ("net: stmmac: Assign configured channel value to EXTTS event")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index b9a985fa772c..2a076e228e9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -242,7 +242,10 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 		       GMAC_TIMESTAMP_ATSNS_SHIFT;
 
 	acr_value = readl(priv->ptpaddr + PTP_ACR);
-	channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
+	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
+	if (!channel)
+		return;
+	channel = ilog2(channel);
 
 	for (i = 0; i < num_snapshot; i++) {
 		read_lock_irqsave(&priv->ptp_lock, flags);
-- 
2.34.1

