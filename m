Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805572;
	b=1SQZS4sRGYGKEL/JvU5s/rBZ7fdRI7b2zO5hMN/wTWHG5BVEtxs4hfotSIkrGFBGZYsO
	 4GKifAAa7xU5HNvLyRKdNqOVeE4FHRKWgEVqLlgqhOnBvuq1teQsNlxbeAE7mNxgMuSVF
	 ZjoyD7ZpDpAl4qAFgm4R3be7PzSMoL1YdjdM3GRQRU3NlfI6hC0ocZEhFkHvX6W+r5NIJ
	 g9kZ0lxVpKmQPIqNf/pSFfWoweuy/nv08JWGfrQk77ZMLkHLm6WZI3r4eIFoqQnQFmgj0
	 PiJZPTXIJy1Tn3HcAZhAIBX954UtDC/xzRgIvizUPDbKMmR5YIIxKCOcDG6pAumxezw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805572;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
	b=Fnh2CFxkb8X0+6DgJs1CXhQSLV8CgPGhdPvidGdFiYkIfa6SzXPcX+/R3tOKXOFykxud
	 av5HCf74mm+xKLAe6DUq9cip7jYsEPHki3LgOZ1DVxYyQhT+KIbmNUZ5e49OuGHFRowdD
	 7TX6YvC4oVGC6v2c7nExx3FzLvI8qCF5dvlJ86P2H+w6OtbJnHFD6tBeZP0zdN/i8EtJb
	 CTWPzeA114auAVcU3kGcr4HbFsNnoWp5+xFKR5RHZLyJkdscPDlf6ed3lX6aGuX03SYe2
	 0U0jwwF3q9UR2SCNK0lREUzl1tKeN3AlDHoDm8YRo4r8UQxnd6U/k7bRyaX/87ENDyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDD4606EEBE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDD4606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8574535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805570; x=1794410370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=a1qrhhUlqNhcCd5VWRRn5y7wFEZFcW2DnIBWUUC0SxyzUoXUTGfFegggGdw+5TMhgm
         iXaAtM7D4htEv+OEdgR0+5BTpY7GfPj9+agSbrcQbEcm+/wq/4r045usbu1o0s1gFJWy
         +DgnSGfsQ7X/QFlInBBkPxfcFKUBwXhcoQV/D0KLKmcvLqk8CBe9p2xnXyB5pMG6hswU
         DkbhamGCLQPIiLou5rhND3VMAIzmxCIXQDtYvkJE0POu7PKtjzMjBJKpaq1LU8DGiYdS
         heN2xtTi2iIIT+fQpiLx8w422ckAJ3CSFxLKAn1TK5Prnc4Xxe4k0bNe6Ogb1T4jZ6ye
         IUrw==
X-Forwarded-Encrypted: i=1; AKwUvBxksymElp/ENfaJBqs5ya5iSzOTaZp7kLqR0iCMKRyGn6GId2TN1J4rqUSyF61hlep4Shl/vfw34d9pep8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y4V5pYRKYI50HQQ0zvybtNcUf8RbttRfUBGiVFnLvQE5ApWlh
	b5jiSdVvdRA79zLvu/xZoIsHHho19XweRFsgOOq342MqGwcBaIFon26DuUkaybMrm6c=
X-Gm-Gg: AYBFou2KNBrJKF08cwuHtjkEVX4kmx9bh8HvXGJnmAXwBjYL7nazHOuSCcuQCmQG5g3
	FrK8EtC10jg3AjKwLoRZ9DibvHwh74eR52OBUyXEWD/wd0zZl3Y31s2PfCiR2jWpiJLTPKH/sTQ
	FsLsVYWzVswqsmSy0QX1lWmy7xLAxcBgAzTGsm70CObAGzOOQXSauAxHLFKcEjW9SP6fm5WF2ZH
	rjgibQlnQnAcXZGjDcVBfGzBWIAZaNCGYr4jXsBBIkuK1a8VQMEfb1gUk+ISeRWAYoth1Pc/7HC
	SR+o/tmUUrhsTpj5XIbrf3yeBovDel2uniC4kkttZw9Q0yYLzb1tmgAtDO4fGxyElgJy0fzoLcJ
	3AbsTZKb036pYJVPaT0ZVlpoHYryQupyIiB9RRB4imWKnkyB+bmN8nRLjLIaPo6zybHXMdwYcaK
	UIPcMmqlLuoOhmfmKSOANHT6leZPfklkTQHEGDcMTvPAFu1MlwieD1Ond570f8V/iFi/UATKTDU
	4I6Ng0CICmP+acetEHEXOaFo428ad0i5o7x9OsIkvgxM7/VjYyv4manoMyzIatiBBnPU/YfVrAb
	Csh1N+Zlgc3vq/FG1s0WXtyJnA==
X-Received: by 2002:a05:600c:1f93:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ac17ffb002mr392967005e9.6.1793805570362;
        Wed, 04 Nov 2026 07:19:30 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm4639812f8f.19.2026.11.04.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:29 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Wed,  4 Nov 2026 16:19:12 +0100
Message-ID: <20261104151914.2651241-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151914.2651241-1-opensource@grische.xyz>
References: <20261104151914.2651241-1-opensource@grische.xyz>
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

Return discard_frame only when ES comes with one of the L2 error bits.
A frame with only a checksum error is then reported as csum_none and
reaches the stack as CHECKSUM_NONE, so the stack verifies the checksum
itself. This matches dwmac4, whose Error Summary bit does not cover
checksum errors.

RDES0 bit 7 is not in the mask, because depending on the core and on
Rx checksum offload it reports a timestamp, an IP header checksum error
or a giant frame, and enh_desc_get_rx_status() cannot tell which. In
threshold Rx mode, a giant frame that fits one buffer therefore reaches
the stack with a verified FCS.

Also remove the pr_err that enh_desc_get_rx_status() prints when bit 7
is set. Once the MAC stops dropping checksum-error frames, any host on
the link can flood the kernel log by sending frames with a bad IPv4
header checksum.

This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
checksum-error frames instead of dropping them in its Rx FIFO.

Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
v2:
- Drop RDES0_LENGTH_ERROR from the mask of Error Summary bits. The
  length check further down already discards such a frame.
- Explain in the commit message why RDES0 bit 7 is not treated as an
  L2 error.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 7ece8d4157a8..d0622f2605aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -216,9 +216,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
 			x->rx_gmac_overflow++;
 
-		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
-			pr_err("\tIPC Csum Error/Giant frame\n");
-
 		if (unlikely(rdes0 & RDES0_COLLISION))
 			x->rx_collision++;
 		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
@@ -230,7 +227,10 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
 			x->rx_crc_errors++;
 		}
-		ret = discard_frame;
+		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
+			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
+			     RDES0_MII_ERROR | RDES0_CRC_ERROR))
+			ret = discard_frame;
 	}
 
 	/* After a payload csum error, the ES bit is set.
-- 
2.54.0

