Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523008;
	b=P+MFQYuu0NNx0tyf8u8UFhdm6y4NnfbgN64WZu1P6a1LbrX4XGw1cENm3GoDci+qNSAx
	 woO3QzHPPRMaYdj/RKa1Ch/+Kswu8lINuyCfS95N4p18VSmZ6n/JQrn4iCvu84wf3U6ba
	 FCXgCAecoXaeGCEea+oj0DeMslyYztuI14Pqz4QLtEXxZKaGyzt2Q7vAoAiK/Mowedar+
	 /33PkMAWOpc51iHX5/vLn5xgXe220Lh4wRCO4jNtpY/KaD5UL4ZG0VuR0S/to2JqD057j
	 zOxf0GZge6EnaEs8qKCVpN9q4JQD89E21yTiaYI5KEj/hVRh8Ks2jwziuYRWCACjDHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523008;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yDyp6R6XHxt49rPY0V1CwuTyDv1VXxyGmnKmgJVZ160=;
	b=hcToO1QXjCybw06D9Y7EWgCPH+89sZfI4n9Iv2NoJOZzu9L8T6E91L84D9MX2axlkxVj
	 B9bVcpYjDTVMm99Tnk9psqX9pm2qoJKxMdDybS2ycbA8supWzWKiAmCl6FU2HCrexkA2/
	 TlC4UV06LSKM+c5hAyYnqg3KhhWQrlHqRy0bsk7/S/uWaYzK1grfGk/tsGkH0nuQxAzti
	 VOQFu4xmATMs5vT+29HLgdh57Cr1Ai3k1GgrmMXEyknXStBW4BaDs2BOBh4iD1qBXZBXo
	 Hj/ucWENqYIovg0YlRst4H4aciQ79AlIVbMq+43ELxlnngd//F4+Eik5S2HWZCR/VrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF639606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF639606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso889270f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523006; x=1793127806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDyp6R6XHxt49rPY0V1CwuTyDv1VXxyGmnKmgJVZ160=;
        b=hkRYMUm/IG8D5j8nsCtWzohPFUkcOwxFxT7lvIJzPjX7OPKt0/14nIq6DoV1ON0kET
         6diA7ICDqmJvMND/It7BIkhWRu4tfShnKEohwGvgoW+iJj+0fvQ5TZe2IOEtzS2NtyKB
         Du1X+1pQTbrfrjsN6SPnmfYK3Y0Of6eR+dcPQmwBdtgNDcxHUO3ciUMzwU9Kn7H4O0ck
         h6dkfHy2T7Y96/3aMm+onWfWQgBWgHT+dhYv6LO7Jm0GrhmLpMfFLf9RfmAeU7UNPVyK
         ji7rNBHho9mnfYU5BouYCWrkEtukbj6L3nM52OVY5wZ4T8J4XZTinRdkMRiHC/TkqHaY
         IUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFqddRDz4fum4HtI5RAZq62k0yODui9VhoOxNaL5X7xDGb8101nyQbJpYPeSDkqjSWAR5avxYuYtx3awo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD/qKRjmCITDKG+FWJfcdJt7vC+LYlDOK4SyW7zj3NUdcSeOjf
	1VTQMengHzS/M+XVnYUXYKheCgHM5inkJOSsGxKDCe68PCyyE7PZwkOrt3LycuRQ5+w=
X-Gm-Gg: AYBFou1GD3QORzW7ujhD1Gw982Z8bGS1Nwk4X54rC5po094bzQoLlOVJzOSzgnmtl5b
	5Z7aLr+aHEIMVE+KCinbb/12bqrNfRNXNchQOLLiFvVLODz4HMETypZ95kBiaV7MZeQbkKq4f82
	eq3nDdWvfYWVfUWq9OszlenyX50JBtLg1g+JzOvSsf+NFZYaFkRa5+RbDcAXQ2iM1hbm/3GAHMI
	Q6luJHaA8UB/iU9yigtSZRJxt4weMF2XiPF9ObJLKOfq1CdFBs2x9QBKv9Guni9IqI8jdTJ4KXo
	X5ZPmVgP/NFIaal5A7xWXQAv/RwTSV0XvMCfeXyEW1rwOVXTl3MgvmU3nMQFXZmzKj9/RZhK0V3
	/458ORXLZmNr6P76IEt6jf1CY9veons3761S7bPaLr3ELHhsYodwec2sncH4OZzlVpi5quMICnb
	MeRggz3MNOGgBqQSlK1g99iQB6m6AwaNqLfjhWOg/K0UbTTxF2cW9wLI511BZSDqY0ga4=
X-Received: by 2002:a05:6000:1865:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e07bb2cc8mr29021791f8f.9.1792523006337;
        Tue, 20 Oct 2026 12:03:26 -0700 (PDT)
Received: from lake ([2a02:810d:d09:1b65:a3ee:29e0:454d:c31e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm279157f8f.23.2026.10.20.12.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:03:25 -0700 (PDT)
From: Grische <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Grische <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Tue, 20 Oct 2026 21:03:17 +0200
Message-ID: <20261020190319.884375-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020190319.884375-1-opensource@grische.xyz>
References: <20261020190319.884375-1-opensource@grische.xyz>
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

On dwmac1000 with enhanced descriptors, the hardware sets the Error
Summary (ES) bit of the Rx descriptor not only for L2 errors but also
for an L3/L4 checksum error. enh_desc_get_rx_status() returns
discard_frame whenever ES is set, and since commit 1b746ce8b397 ("net:
stmmac: don't overwrite discard_frame status") the checksum status is
only evaluated for good frames.

Return discard_frame only for L2 errors. A frame with only a checksum
error is then reported as csum_none and reaches the stack as
CHECKSUM_NONE, so the stack verifies the checksum itself. This matches
dwmac4, whose Error Summary check does not include the checksum bits.

Also drop the per-frame pr_err in enh_desc_get_rx_status(). Once the MAC
delivers checksum-error frames, it can be triggered from the wire.

This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
checksum-error frames instead of dropping them in its Rx FIFO.

Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Grische <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 051253601225..5c43d32a2f22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -195,9 +195,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
 			x->rx_gmac_overflow++;
 
-		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
-			pr_err("\tIPC Csum Error/Giant frame\n");
-
 		if (unlikely(rdes0 & RDES0_COLLISION))
 			x->rx_collision++;
 		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
@@ -209,7 +206,11 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
 			x->rx_crc_errors++;
 		}
-		ret = discard_frame;
+		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
+			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
+			     RDES0_MII_ERROR | RDES0_CRC_ERROR |
+			     RDES0_LENGTH_ERROR))
+			ret = discard_frame;
 	}
 
 	/* After a payload csum error, the ES bit is set.
-- 
2.54.0

