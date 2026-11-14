Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663407;
	b=alEhiLgBqmBpmH7Ym1ppRfNVmZms28CxrOtDfSOepam6mdRFRsMdmDwRSmDPXtzYJI8n
	 2Y9sNr3yFOga/l9g2PDbCsRqzh5TrM1foaVZbZIA9Rr0ZAweGLLRIurQAtRa/+joD+p7Z
	 EZpxpa+jszV2Zz332DTqHFSR8b4Xuk2lZpQlUQj2QN6g4Aj1pT4IcU+JGFJB9IzA9kgOe
	 lOTH4+pncHDyLnDjdoVdQbgfHLHkTcQmCp/zbqDCMF/EQoSo6YXARfb+IzmynNiRLycpF
	 ItkwdF6lekzKxDQulVOiaOc1AFaOmmQTgp4066h0ptTEFqXChCF7nKQsBd5LCI4zwkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
	b=BTuLmm7q7BiK3rkXSJyfDbx39fiqQ7qLLfs5iClUKAfVjJamVtPueQw+fqsu8fKNK9Gl
	 JAfZy3NVFl5s9NiNsgf/kxRYCDXrASCn8S4mVvLvAjJOQlubnbx4J2olK6UOur7wJj+W5
	 zlAMSDTp6z07lul3ThdSKup/s7f2O3OYn22VWV7rKAmimOqeT+6pQphDZkqvzNDldN6RI
	 fPOu6HHVjn857WxVAKE45eBIF+emEKbiA5DBCD751b5dgpC+80goJsMwn33CZk2ElbZ+X
	 ABIJPRK6qcoO8cdZnivh4ZT7wHhztMSsFF8oOhM+2AfRqvyWpPLqrTTIu6H2jZ4VrvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MNy13gTL;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BA9606A88E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BA9606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MNy13gTL
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so965819f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663406; x=1795268206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=MNy13gTLmC76O2NwWxzMLq2bD2NcAS2Lmb+Fa3QAE5m3tgPQDQl/dmDgGSBdSkVSXM
         jo7SSTHv6JwLuKfNswjxK4G+NRrtPwxEFluwI1dZ1LCBs2oAjApsc2mI1Apv+ilRrROY
         K46icOMtrBYmvhpyDkK38wTxSxfIeRGUbx6Fr8v8CmvbnTTlM8I4Ou+0sEivLrrzS/8N
         R9OKZ31N8fOJ5RtReTqWfpVyjMlpwrkDQiCLrzuE1wjnedpYqztGKEPtAV62PUFHoTIB
         PPDQur2xPCsj+0uWGKSMxDXEpQRrgpdiiQMlO2m0nzR6hC9dpNppZyzFw9myK7+h01q5
         soAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663406; x=1795268206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=sh8t2Zl63/EXPs6Xw6YRiCMPWgi1e6xlqKkxr0lpOf3bPA/L6thCZb7E5cYD2pQDz+
         o2daXkRcwyIk1ivWG7BBOs0npeIslu2GAKAfV9pEv9LxtYXgN13w6gKPqgjVPq0G8Gg2
         s1cfyqG4wD8XXAk6u3N04goW3UjOb8d529PFehH2DzhxxvQb5QFXdcdDdCgi1eFTY6QL
         drSEKbW/chXtsABte0Ohww28em1anxJi9v0RDE3NGMsrTdNgTRgEgai2KSbdENoVzRzF
         0GWZZ8chL0ARVzuy+la9JlQ6uMpczMgBMY4PjZfm++cj3LfTpFr2YTuuwnSqCdnjYRnj
         x4Cg==
X-Forwarded-Encrypted: i=1; AL+hErF3NykgBHZtYwbseOVRxsqaxXBwYqSvZTG7QCONkXXDHPi3aW7GGsYhMjhIpHgb/ZyyaES6P76dQAw2kc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+im4+3fS6ENCKY9vk5uWQnC48sPcf2Ify8vONMJkL7xfsUCTHy
	vx+iJS5YRTOJ6SFuTNON/FQVanqKZ9CaOzYpTNHnlCZG3rbdXj4fYHJpTWdWyo8+CQE=
X-Gm-Gg: AYBFou0ac8hxSl9xda11RzDs33h5h6zNGI8CFeTXlcaE2uUQBsgETN8K8/J/u2pzfrs
	EBr6PrPkhrcr31QpkZPEnrSZxWHCdo0hvvOkQjv5I3/nPszj739zF8zUBJJs1/Np4vVFJVN3pyz
	9/MVcdEMOEwMrtwYaon2RWtRZAxlMHnbM0kFNtnYXQlC9/AHim4XnYFTfTW4Jl5/izSX3nGGg5Y
	vwXZVaLx4ZCgi3jzaOihHlxpCzLU2D0oYcpIu58ycqpxrqKZgY6C3UGi0TTevMrtersUuz9iKUR
	fE8ImUWDmvJRoDhsB9ksbZGTcCyBHV3Te3UZaQkfpYsJYAuKG3Jud9ISzJ/8we4JCgXJd4JtRGY
	+lTVTJVgiLezQHl9MwQ4Ux2tn/ZUIt2EZPr0rMUSNBDbxsHkE4BDIcnIVFSxWaFGzbomTpB8YOr
	tmsYycA/anOXP1gjYCTYJ5IFk+MAMakMlZeFQ7NR7S+q1UlCDMtc6p/Hgr0puYNT/ISpVBYHXuy
	bkw/dP/Qx8Xn3EUZQ+lol290YPuzQiN6M2TKK8vSIdMcrsCYVCQezxPyia+s8B6DdHxZ2q8lIiI
	YpQBagVxULjW8D8miRRLZgXHLw==
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr10850377f8f.42.1794663405564;
        Sat, 14 Nov 2026 05:36:45 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:45 -0800 (PST)
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
Subject: [PATCH net v3 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Sat, 14 Nov 2026 14:36:38 +0100
Message-ID: <20261114133640.3285413-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
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

