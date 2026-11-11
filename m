Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367006;
	b=TL9tobchqafBNSOT48GK5Tulfoyn0OGP6eDlPl3J77VkyM1weIFx4EhRAT1sxzVFO8nD
	 KDK/lFgwVv+QedR/3vUEPul2Av7oGetLhSS2VwBATp7R6JPKusyHfgkjMqNI5TsOGvUmY
	 XlswIAGW2Ml9EUeX/y2K36vkBtqWQyXH4HV1I1YF3g5B6D0qijv66se+xflJkNVv5VL1c
	 DR/HZLxyQm7BmLFkTdJFVZ/VZGNZYsRRP7ZdVTqJEYdIBnrmlzNUC1GyH6tOeKxYI4WVp
	 ESCZM1j7oQwf/XOLV+mHkQoDroxCCyFnJn4CsM49Jnzo1amM4aWON+jKWm6yi3yzWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367006;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JpoTuD9slN4knwQ3B5aH6Bk7MUVjciQ4dVsK6hZf09s=;
	b=J5umikdKJ1azx7uhRNYKG65ZTLBDcjD3I46mJ3IGxWBqErMVDfNqjlq/yyJyYOlI13J5
	 pI3czrJAsKdnzCjIgS50oXxHWhzOl73YWvBk4M2ofsqOeJXWxK55fDRC28N/1T8iGFw1h
	 zVTlc0jmRDAkLMGlldgE4v/ZVYAxMeuMTJLQSda5bL3fH50xwE3tdW1JhsRcfBjkRYVRl
	 mNrRXoXq0UndxL+EJVn43oS2+sT21m4ogUbmbq9zdPToSroOiFe0Y2qeWjK70yupIYJZp
	 rcyfWU9ahd3/syeQCAX2YPiSyx+T9ker+RVMhNYxtaeI+XAoAV4apmn6/keejI0lc4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D9F60A263C;
	Wed, 11 Nov 2026 03:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D9F60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 11 Nov
 2026 11:16:32 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 11 Nov 2026 11:16:32 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 11 Nov 2026 11:16:35 +0800
Subject: [PATCH v2 7/9] i3c: mipi-i3c-hci: Program AST2700 IBI termination
 threshold
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
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
CC: <tbevis@amazon.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794366991; l=4898;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=pPxEjJDKY9UUeUMVDPYkVs0krD2yIc7+oPxxwqwNNxA=;
 b=vdLBF5rPeSpXA5dKqbXGGRy6pYXx61vm/2MpqIGvSOuYWZCJ4uI47bXz0FwqM19wSkejE263F
 8Aekuj3icsuCQqR0qRCbOpsNFuEjbg6CQCdM3cwNqKdzQ+aZO96zWH3
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

For an IBI with payload, it's normally the device that decides when to
stop sending payload bytes. A misbehaving device that never terminates
can leave the controller stuck waiting on the transfer. AST2700 has an
in-house IBI payload length threshold that, once enabled, forces
termination once the received payload reaches it.

When payload IBIs are requested, grow the AST2700 termination
threshold to at least the requested payload length and enable
termination on that value. The register is controller-wide while IBI
requests for different devices can run in parallel, so the
read-modify-write is serialized under the controller lock. Gate this
behind HCI_QUIRK_IBI_PAYLOAD_THLD; controllers without the quirk keep
the existing behavior.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/aspeed.c | 20 ++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/aspeed.h |  5 +++++
 drivers/i3c/master/mipi-i3c-hci/core.c   | 17 ++++++++++++-----
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.c b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
index 3aa910e786f8..4a73e0180a10 100644
--- a/drivers/i3c/master/mipi-i3c-hci/aspeed.c
+++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.c
@@ -136,6 +136,26 @@ void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val)
 	writel(val, to_aspeed_vendor_data(hci)->inhouse_regs + reg);
 }
 
+void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len)
+{
+	u32 mrl, cur_len;
+
+	/*
+	 * The termination threshold is controller-wide while IBI requests
+	 * for different devices can run in parallel, so serialize the
+	 * read-modify-write.
+	 */
+	guard(spinlock_irqsave)(&hci->lock);
+
+	mrl = aspeed_i3c_read(hci, ASPEED_I3C_MST_MRL);
+	cur_len = FIELD_GET(ASPEED_I3C_IBI_TERMINATE_LEN, mrl);
+
+	ibi_max_len = max(ibi_max_len, cur_len);
+	aspeed_i3c_write(hci, ASPEED_I3C_MST_MRL,
+			 ASPEED_I3C_IBI_TERMINATE_EN |
+			 FIELD_PREP(ASPEED_I3C_IBI_TERMINATE_LEN, ibi_max_len));
+}
+
 static void aspeed_i3c_phy_write(struct i3c_hci *hci, u32 reg, u32 val)
 {
 	writel(val, to_aspeed_vendor_data(hci)->phy_regs + reg);
diff --git a/drivers/i3c/master/mipi-i3c-hci/aspeed.h b/drivers/i3c/master/mipi-i3c-hci/aspeed.h
index 7ff1f66b67cd..7aecce04bba7 100644
--- a/drivers/i3c/master/mipi-i3c-hci/aspeed.h
+++ b/drivers/i3c/master/mipi-i3c-hci/aspeed.h
@@ -37,6 +37,7 @@ void aspeed_i3c_set_daa_index(struct i3c_hci *hci, unsigned int dat_idx);
 u32 aspeed_i3c_read(struct i3c_hci *hci, u32 reg);
 void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val);
 int aspeed_i3c_phy_init(struct i3c_hci *hci);
+void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len);
 
 #define ASPEED_I3C_CTRL				0x00
 #define ASPEED_I3C_CTRL_CLOCK_STALL_EN		BIT(14)
@@ -44,6 +45,10 @@ int aspeed_i3c_phy_init(struct i3c_hci *hci);
 #define ASPEED_I3C_CTRL_INIT_MODE		GENMASK(1, 0)
 #define   ASPEED_I3C_INIT_MST_MODE		0
 
+#define ASPEED_I3C_MST_MRL			0x08
+#define ASPEED_I3C_IBI_TERMINATE_EN		BIT(16)
+#define ASPEED_I3C_IBI_TERMINATE_LEN		GENMASK(15, 0)
+
 #define ASPEED_I3C_DAA_INDEX0			0x10
 #define ASPEED_I3C_DAA_INDEX1			0x14
 #define ASPEED_I3C_DAA_INDEX2			0x18
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 759892a3785b..31fab1fe614c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -722,15 +722,21 @@ static void i3c_hci_detach_i2c_dev(struct i2c_dev_desc *dev)
 static int i3c_hci_request_ibi(struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req)
 {
-	struct i3c_master_controller *m = i3c_dev_get_master(dev);
-	struct i3c_hci *hci = to_i3c_hci(m);
 	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	unsigned int ibi_max_len = req->max_payload_len;
 	unsigned int dat_idx = dev_data->dat_idx;
+	struct i3c_hci *hci = to_i3c_hci(m);
 
-	if (req->max_payload_len != 0)
+	if (req->max_payload_len != 0) {
 		mipi_i3c_hci_dat_v1.set_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
-	else
+
+		if (hci->quirks & HCI_QUIRK_IBI_PAYLOAD_THLD)
+			aspeed_i3c_ibi_grow_threshold(hci, ibi_max_len);
+	} else {
 		mipi_i3c_hci_dat_v1.clear_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
+	}
+
 	return hci->io->request_ibi(hci, dev, req);
 }
 
@@ -1408,7 +1414,8 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 				  HCI_QUIRK_BOARD_PHY_TIMINGS |
 				  HCI_QUIRK_VENDOR_INTR_SUMMARY |
 				  HCI_QUIRK_VENDOR_RESOURCES |
-				  HCI_QUIRK_VENDOR_DAA_INDEX) },
+				  HCI_QUIRK_VENDOR_DAA_INDEX |
+				  HCI_QUIRK_IBI_PAYLOAD_THLD) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);

-- 
2.34.1

