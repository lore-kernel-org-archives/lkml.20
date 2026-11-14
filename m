Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663409;
	b=MpbvrQi944rszKQF27CPLrGxRS2yNMEJXcQ44Rds5ZzEYJNwpMUKFGklXjkslhgHEnJf
	 unTH7PPL0s9L5FDd5XIgBj+8T/u1LZIjIWYLGt3UNB2NY++6gAoS9wap9UEkbLo0UOMD0
	 Pw+4mHk7Oh7iLR3TiiqcWmxIvM5/Sbss32v8y9tYH5tFtGf0SM8wIEEj/KmG18QL6Umo9
	 KhUjtzc7PnZsXProlecDIEAtQcMpoKC6by11RiMMPUoNW1ZoV7S0wSON5qh7/DPFkDGeN
	 8kxpjPT1d2OM3gvmUPfb3j1Kim5oLoOKibTAJQrEHSxKWSJRd7F2AJSIwvBOsDsbhrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
	b=J05iCfTz+A0vn/Pvqnlyn1am1QA6gjbt95j/bKikRcLrggWPsC3ekkd2/+qMQ1OUtxhM
	 1/QwOSoLO12cOpHzvLjqazW5MJ2IUZGAG+MmPmNJ09dkOhFZvFJSf9jRslG9rpMnGEtlr
	 4amRufmxqdORx0vUzb4oI0eURmgvnbhnQDTECwFxhJRjyIxtq8GzthZO/vKhzDov+tyyP
	 ERyvjqWpID2MtP7c1/tB4DqlzcUZ6e2OoENMJWKYbSQ398jlRKBp4S0YjFBKF1lgi39rK
	 ywDGr5BOyXkdWWAihknmCGKknf2UEGg3GV4PfYZefopvgpS4yh0ddLjBaESHKTu1zpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MkOH2p7S;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4299606A8A9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4299606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MkOH2p7S
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso2136320f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663407; x=1795268207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
        b=MkOH2p7SuwAXsiBq4F55QCEzAIz0+ZP/EFEvsb8IrMkKeZQzocxAzYRj6AE5tUbRi9
         cPaNBaLSJu49yc6AZ9LQSqsDGCJh2XkmMWBonuz2UcF4sWovTmScDqzMTUz/vcorBCM7
         vTTP6IAybe8Wfp0/upllpHC9ycYA+AeL5bVTfkW+vZw0uYO5Ycvzupt1YyzKmhoULi+L
         Bl0Rjq+xfyD+L7awyp3v1oo+EiRPKgeGbHV1TWE5574ikJnN5t86Ks2wkSnz6J7Reysk
         BQlQmiH60b8nOoyZNpkyS3xSI8yOn3CdWUxGw5y+BJeykHjKLqm7UULdot7aCuuK19JP
         ARNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663407; x=1795268207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiwQ9+40yAXFn07zwAJTDOokEVNTIlZDDkhdTgBrFpo=;
        b=o5hwPqXAROyly+AX19Ik0ldYpA7+qzMF9wPfHvghjwTcOnC1365NYKA0Z3sVa238jL
         geqA/yrLUw0N+AKl38QuFYelbV6myA22sEb18ut1x5kAsdPcJsXsqbOYDlEesPdwDUQ8
         +mQRZH36GpdRJPympF14L8K59LOgeFbA5W/7uTs2h4cX3JIrsfdxiE7EnquOLllxdKgX
         vxA8i5WJAWjq02wlw1qzFKOiGyCfHj3O1NLqr99U6B4IICQL7PUYCrWa3SIdFOF5/YQm
         tKyZO+3fNynXuT2DorPg+xQaB7Q9UblmyFryx78GOL8NWbp+2k63AyF9rlk/RUmIfOFH
         LlnA==
X-Forwarded-Encrypted: i=1; AL+hErGezs9wmqtm36mZv/nGXPogMudb1pTXjZ54XDLBqiZcRX2bVabKAy0ndqmTaJ24WoIhyNqEQq8CXuYEMvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L1mQK4caRRtbQcXXS6fL1HGrgkvipPYAg6ocAQuSJPRhNp6f6
	MpgFTYpwMyj7LxD/vVzgmgKzVOHNyN1ZGn1d+R6/i6uT6h2psjZU2j14P99r9f2NS4k=
X-Gm-Gg: AYBFou0r4tY7ojgY+cP/2nwoJGiIs6+oQC3CqhZ90mvUvMPexagXboqSfTXH/jRfhAL
	bnXmzZfIVIV2rY9yzWbB6b7h6PVwVAfO1TTB+jyEbO+CTwPU4nmi0hQhPx6qopNmmVmNLESw+FP
	w+/wIWDTI1Jfn6s2DZ2EJSpHE1n9bOG73UZK7+HA9KA2M4Ky44z+6QLGvzDU56tBSzf00da/e41
	PLWO71Ms3jD599RmwGho9bFQ27jtiJeqeBvzrpuUZtBD8xEV7MnX25uK6UtbC6CKF8aHyT2H9ch
	Heit2geqkYsR8iU3NhnP3Shtm0fb0QX35L2OgjCeDU0fQtn2UAsHwyNEK6aXJi8kQ1tyjAVC4QX
	eCUVzWLEro++GdW8rBOpFZ7bA5tnR+K6R1jJKjMKp8pu43wLRUQQsALILkbsjdOo+lI7fgMz3BC
	fS0V9K/bnYM0i1oDJ1vxGhC26ffXvqqT0h9xF4Vi9ziSuvgeaZlIUMC1YORPtpR8awQNcbzc05y
	uxhvE31EtwcFp9GaNeCNziq1OwZHvU5GuqTjrhPQucVFJegynzpxOODhibY+9wIo7VEv7jrK4nZ
	h5+kOVp3ZKcvWLe5wWwvAIr0e04DCxB+x2fUHJP4l7nj5rv/
X-Received: by 2002:a05:6000:480e:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-49c7044c40dmr10978358f8f.23.1794663407155;
        Sat, 14 Nov 2026 05:36:47 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:46 -0800 (PST)
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
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Sat, 14 Nov 2026 14:36:39 +0100
Message-ID: <20261114133640.3285413-4-opensource@grische.xyz>
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

When the checksum offload engine (CoE) is enabled, the dwmac1000 MAC
silently drops any frame for which the engine detects a checksum error,
before the driver sees it.

This breaks VXLAN over IPv6 with zero UDP checksums, which RFC 6935 and
RFC 6936 allow for tunnels.

Set DMA_CONTROL_DT so that such frames are delivered instead of dropped,
as commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") did for dwmac4. CoE remains enabled,
so the driver still sees the error status and marks the skb
CHECKSUM_NONE for the stack to verify.

Set the bit only with enhanced descriptors. The normal descriptor parser
does not report a checksum-only error to the stack, so cores that use
it keep dropping such frames in hardware anyway.

Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
on.

Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
Link: https://github.com/freifunk-gluon/gluon/issues/3783
Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
Depends on patches 1 and 2 of this series.

v3:
- Move code comment of DMA_CONTROL_DT on the line of the define, similar
  to the original version in commit 47dd7a540b8a ("net: add support for
  STMicroelectronics Ethernet controllers.").
v2:
- Set DMA_CONTROL_DT only with enhanced descriptors. The normal
  descriptor parser does not report a checksum-only error, so cores
  with normal descriptors and Type 2 CoE keep the hardware drop.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 1de1f929d61c..55d9c39287f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -162,7 +162,7 @@ enum rx_tx_priority_ratio {
 /* DMA CRS Control and Status Register Mapping */
 
 /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
-/* Disable Drop TCP/IP csum error */
+#define DMA_CONTROL_DT		0x04000000	/* Disable Drop of TCP/IP csum errors */
 #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
 #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
 /* Threshold for Activating the FC */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 3ac7a7949529..31d5f79ef560 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include "dwmac1000.h"
 #include "dwmac_dma.h"
+#include "stmmac.h"
 
 static void dwmac1000_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -129,6 +130,13 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 {
 	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
 
+	/* Deliver checksum-error frames only with enhanced
+	 * descriptors, because the normal descriptor parser does not
+	 * report a checksum-only error.
+	 */
+	if (priv->plat->enh_desc)
+		csr6 |= DMA_CONTROL_DT;
+
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
 		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
-- 
2.54.0

