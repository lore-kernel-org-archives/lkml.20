Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585580;
	b=u9ujdGBU6tIXR12dO7weTkEwKE5kKnC7sYAX+toWOzEBHxEhzBY5zZ014pa1HA0ApdrD
	 MVyQP06DHf6Ngm6pc8J0FLOAejd3hhrEhf/vdXDdAoxm0h2RyLiSENK1vsUqmiU4/OJKu
	 HijHfaNR/K/enBUCwOcAxvpiLmrqOetkLe2Eu93d3qX0GuHc6iNseiiHnedXT+wHzFVjG
	 +RUeUQpmCJ6fs4+gnsoNAzjgalHHiTXlT7Zb0f50EhAcHSukwI6sV7LOCDg62Fa6RKtTg
	 MtSUCy23sVNbiylp6yNTEyhbC6CWQ72Y2khtxpKf92+8uT5Xlrpn9d61irVq+viLbyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585580;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=joI/KrFSE1B92Swk6mDa0OAqDeCtz3SaQuMCvQjux2Q=;
	b=xL0YQQDwHNYUiZhhuz7Ku+wLWbN37Gs033IuQUJTtdZTmOygLBoa8PlGk+bdt4YDyK9Q
	 VQsnjS4fW6fhP5EZGsgpBCWHX4aPcqCEFP92v2oEqkmqLkLgdPZFEnf4DUWEzKqejUvm7
	 5HI4759eyLT1/Rz9CaGeC20g2evXKocgYOEtofZ4lHbiIc72DziC7QIFS+OYcvC5zYVMW
	 81a1PX+wEjH+kJ4ontn2AmILKbDwDmVipYaU62wX40CPG9uXXX3Bvf8aP8e2Bwq7ysoIG
	 GSl02x6yMl9ApRX8QPExQ9zdxRC9fvny+iYqrB1QcUgmZqFC0jgdiwvrK80mk8PDmQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qnX7tIZO;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C63606EA91
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C63606EA91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qnX7tIZO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E9741A1651;
	Fri, 13 Nov 2026 15:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 747CF60015;
	Fri, 13 Nov 2026 15:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D793411BC0C42;
	Fri, 13 Nov 2026 16:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794585577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=joI/KrFSE1B92Swk6mDa0OAqDeCtz3SaQuMCvQjux2Q=;
	b=qnX7tIZOfaHS0EapCBUgMi2AwgtPVMWw62OO8nRWSNl0Na/ezd7+GWRCPu6x0FnC93Gdnm
	cQPg7OACOkOaGxa6OL4Mn6CodUKa5/O8nfv3DlG+3PWklC358+CIC4ANjOcLwZ2q0uFuRg
	YsYPoMBYgxOxX9AglpldxXk/uK7FIEm5BjGO6Lo6AeECuodMtsesuQBhPyAz5gVaqrIrjK
	U7qoCA8lCJhWKgfJqQPM50ipAd20r927bFC2lwN8etPaa092PCzvP6qx0zw2pS+jxIHzOC
	qI5yhSugf1D5j/l5AjBkEf5vNvaWsx7T1j5z/pfv4Yw2cdOKNzKBpwDyLnVSFQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 13 Nov 2026 16:59:29 +0100
Subject: [PATCH net-next 2/2] net: macb: add QBV capability to 4
 compatibles
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-macb-caps-v1-2-42e0984b2f09@bootlin.com>
References: <20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com>
In-Reply-To: <20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Add MACB_CAPS_QBV to four compatibles. Tested on EyeQ5 hardware.
The other ones are not tested. Datasheets indicate support.

   Compatible             | Datasheet
   -----------------------+------------------------
   mobileye,eyeq5-gem     | Not public
   microchip,mpfs-macb    | Public header files [0]
   microchip,sam9x7-gem   | DS60001813 [1]
   microchip,sama7d65-gem | DS60001851 [2]

For the latter two, upstream devicetrees and bindings know about the
compatible but the driver only used their "parent" compatible
microchip,sama7g5-gem. Therefore add match data for those two. Instead
of duplicating the long caps list, store it in a define which gets
called three times.

[0]:
https://github.com/polarfire-soc/hart-software-services/blob/445664ca8ac5/baremetal/polarfire-soc-bare-metal-library/src/platform/drivers/mss/mss_ethernet_mac/mss_ethernet_registers.h#L264-L278

[1]:
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

[2]:
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 25d098a46965..9f6111661b40 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -6135,7 +6135,7 @@ static const struct macb_config mpfs_config = {
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE |
-		MACB_CAPS_QUEUE_DISABLE,
+		MACB_CAPS_QUEUE_DISABLE | MACB_CAPS_QBV,
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
 	.usrio = &mpfs_usrio,
@@ -6143,12 +6143,15 @@ static const struct macb_config mpfs_config = {
 	.jumbo_max_len = 4040,
 };
 
+#define MACB_SAMA7G5_CAPS ( \
+	MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG | \
+	MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | \
+	MACB_CAPS_USRIO_HAS_REFCLK_SOURCE | \
+	MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP | \
+	MACB_CAPS_USRIO_HAS_MII | MACB_CAPS_QUEUE_DISABLE)
+
 static const struct macb_config sama7g5_gem_config = {
-	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
-		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
-		MACB_CAPS_USRIO_HAS_REFCLK_SOURCE |
-		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP |
-		MACB_CAPS_USRIO_HAS_MII | MACB_CAPS_QUEUE_DISABLE,
+	.caps = MACB_SAMA7G5_CAPS,
 	.dma_burst_length = 16,
 	.usrio = &sama7g5_gem_usrio,
 };
@@ -6163,6 +6166,18 @@ static const struct macb_config sama7g5_emac_config = {
 	.usrio = &sama7g5_emac_usrio,
 };
 
+static const struct macb_config sam9x7_config = {
+	.caps = MACB_SAMA7G5_CAPS | MACB_CAPS_QBV,
+	.dma_burst_length = 16,
+	.usrio = &sama7g5_gem_usrio,
+};
+
+static const struct macb_config sama7d65_config = {
+	.caps = MACB_SAMA7G5_CAPS | MACB_CAPS_QBV,
+	.dma_burst_length = 16,
+	.usrio = &sama7g5_gem_usrio,
+};
+
 static const struct macb_config versal_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
@@ -6178,7 +6193,7 @@ static const struct macb_config versal_config = {
 static const struct macb_config eyeq5_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_QUEUE_DISABLE |
-		MACB_CAPS_NO_LSO | MACB_CAPS_EEE,
+		MACB_CAPS_NO_LSO | MACB_CAPS_EEE | MACB_CAPS_QBV,
 	.dma_burst_length = 16,
 	.init = eyeq5_init,
 	.jumbo_max_len = 10240,
@@ -6224,6 +6239,8 @@ static const struct of_device_id macb_dt_ids[] = {
 	{ .compatible = "microchip,pic64hpsc-gem", .data = &pic64hpsc_config},
 	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
 	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
+	{ .compatible = "microchip,sam9x7-gem", .data = &sam9x7_config },
+	{ .compatible = "microchip,sama7d65-gem", .data = &sama7d65_config },
 	{ .compatible = "mobileye,eyeq5-gem", .data = &eyeq5_config },
 	{ .compatible = "raspberrypi,rp1-gem", .data = &raspberrypi_rp1_config },
 	{ .compatible = "xlnx,zynqmp-gem", .data = &zynqmp_config},

-- 
2.56.0

