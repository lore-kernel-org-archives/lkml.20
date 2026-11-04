Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805575;
	b=M/M1c0fTRrqFWlEzDkjqSZmsG2JZ3mMq6vIFcmk/le60t99QDgOPb5Jql7VYF77KTaQZ
	 if8bx8yRxcYYZzT8XNAio6c8y60yTab3CWRdu61m62OT3L6yhBbthWXI3hMROm5Oc5/zT
	 ZWCAfarXSdiNO5/gOxs2InvYPub7v2BlXAhKu/AujWZInY/vP1hiSUNS/oGlJTEI9FUwi
	 jgyYJpMBBvoBi4uEZjyCPGhgc/aSg3SUh+GYNF51eDNMWyD+ksJwpG9YJZiszMWdugwXV
	 bNaz5lm16+PvcUSLkAwDyDj+RH1uAXXbV/m/u8Ym6HkFilkcCAxw1Ujaq666QFuUeRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805575;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bLOJZaXgrljjby6d2ZZG7h7GGo4k7OpcvIB3L0adEqA=;
	b=PkskEMw7+etjJjiOR2yqssppaGxdQ9ntP+Dg9rn2qIMQ0kDUAvdM2ipi5E1cxfRKuhMl
	 hEZ5AdbYucrsjtTFTYUhq6IgLuudJCw5QaaXIq0WLNVpfKYwjZIwgSk8yxpZKCrF4wt/h
	 mL+nQXADwca2uEgh8BphhVwqmqqXyj3eFVFFJgZjnQtzzIrqBK4heSsmg7ciQxrTDnQlh
	 GoE+VcvKey7a9C34GqGEEfL1MOqopVvMxlUgymD3WMGLAYmVoACRX5VIubarzTjF0Xads
	 7e1ZNqsMskPrJKqARoq2hVsuyp81VYvIuiwyRu9mldVerHgFZ/3ZBruLr7dh+VIjjvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46046074756
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46046074756
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5358fc28so752708f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805573; x=1794410373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLOJZaXgrljjby6d2ZZG7h7GGo4k7OpcvIB3L0adEqA=;
        b=WLSRzF9sT7AMnnL6gNe6e58tNvfigMJf0LuCNgVj2oKxkBeVegiNRubI3G18fHPrWX
         eQX0z/jcFaNTs7tc7fEQP+XeVKJucUcDMXy+/cG8yNChVyH2LkGOYoil9GvEE+LS5wLT
         xBFH32o65Uv94vATtZAI3/YegcozYP/KWtMGpXkK5TV88SP8E8xw62b374TpKFgEAYme
         scUGtUU/V8XJjL9lVPopwRhRxipozRqddn4f2SZA2RGh0Rll6bfsa9+xpVyXd9tvKOuU
         CBal/9u3PfuiselEgZQZPHU4V1ZTilya/vzBn3dCRpclIAoVQrPKIdUT7xeyfIgAd/Tt
         tSBg==
X-Forwarded-Encrypted: i=1; AKwUvBzgO2q++kFFRqm6mzqSkdoSZdg6Kk/dMrUyv3ScOaw/4TRemVt2T1q5mo2sx2EKPe2IDLxCF3rG+OOJgP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OXypy0GUbG7h8Ze9E//E/h5A1cIObjEI8eENdo8TFNJoR+63p
	WSu6cKCd2C55lzviAfAmnMESGhVgTq45JgFtosOMjtF9/9IooigavyhcHpNrVox1TT4=
X-Gm-Gg: AYBFou0CUpcCjmEbtnorLPJIxTH3pNKXFk/GkuPC4feEwco4q6sc9tKRJ8+4bngQgtU
	gfJRFUfqX2WVG7KmBvTSe3cgVUlwe0/d7RAJUnXbz3klrnDCZzI7gzzaAI2AU3l3kyGHW5TqTCs
	kgUc/vRN7QyCrBUXPNrBzmQu0egDJTYIy5k77x38HdbDW36eQfmj2XhjrHjs2lXIy2DCFZ5rZ3b
	qfVXdv4tAkx567pcE1JNJ4A79lGW8ar3VuZCijIsPDZaPCqvsfLySDPPDrABPBplgK+vhzVOR/e
	FsaQBJ5X9RnXObsSWbDYo0h3SYX+UmzTeBjV5/XGCsyiu6tQ1cQ3d9pmoyFrB+Q5KktBYPBdxBV
	ZMyjZQVLUZdMch5BVMt6afpK7O4WoCdF/jfn2AXbXJ7fYrrsnNtG63AC/mFuUx/XIOVW0qW+udX
	mVl9ryXBD6AicYdTL0f7bbVMLI752nxC4bVn8qQiyXSWD1IfdDvnUqYs1VE0WnmAzGli1vzpG1t
	SgHxdIZ9iSA0XgDqJTyQxcXkC0BBeX8fxBMxh2rLdkJLKOO/BBpwLLa/J/tES76KbpzjfoJhD/h
	OWMX1eZUGFgug4j5PrY1LC4Y7h5vo9g0O0icyJA/FSx4I4E=
X-Received: by 2002:a5d:6950:0:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-48e6e2fab84mr28602707f8f.33.1793805573103;
        Wed, 04 Nov 2026 07:19:33 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm4639812f8f.19.2026.11.04.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:19:31 -0800 (PST)
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
Subject: [PATCH net v2 3/3] net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets
Date: Wed,  4 Nov 2026 16:19:13 +0100
Message-ID: <20261104151914.2651241-4-opensource@grische.xyz>
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

v2:
- Set DMA_CONTROL_DT only with enhanced descriptors. The normal
  descriptor parser does not report a checksum-only error, so cores
  with normal descriptors and Type 2 CoE keep the hardware drop.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 1de1f929d61c..004e6e30a68b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -163,6 +163,7 @@ enum rx_tx_priority_ratio {
 
 /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
 /* Disable Drop TCP/IP csum error */
+#define DMA_CONTROL_DT		0x04000000
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

