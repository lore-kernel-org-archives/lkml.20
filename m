Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB536196C;
	Tue,  1 Sep 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262617; cv=none; b=qIEhRP8u7SdQh+bBXm6jVHRdX3ah9BoZ6E458Rwh3nCNHXajDkzf8O5HtTETLuX9e+Ahx/UQKuN6Iwf7n3iEa5bS5cxuZNAi/rRUrfZ6G7fZ8pngLNI1ZSLRRWJi2m2SQWQ1Axj5AaNB4nrLHbqM5PgNqep6JlNM48RA/kVz/kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262617; c=relaxed/simple;
	bh=xOl9+Kul4dBwt8rxRnAINY0vnOHwaByTCuM9DbK+p3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dihZLShqZJ0mVRYerGczu8cGMJz7O2UYYrkvPcwG3vWDuF+1NdGdL6jXVQ2JOsg82MspYW0c7CXfZKJ8rOmgZgMiXNUnCROBYX0bvgRuGcgBtUTERE4sbBcoTuun9gOx+njVloYOtHojG/KS4pQpqaljEpSiPDX7Zrjdf1hj53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Sep
 2026 19:35:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 1 Sep 2026 19:35:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 1 Sep 2026 19:35:33 +0800
Subject: [PATCH 6/8] i3c: mipi-i3c-hci: Program AST2700 IBI termination
 threshold
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-b4-i3c-hci-ast2700-v1-6-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788262538; l=4578;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=xOl9+Kul4dBwt8rxRnAINY0vnOHwaByTCuM9DbK+p3I=;
 b=qWtlv5VOUEegPE0YGyLI/BFbXn5JqLuelcacCgbJoGHuQrR+O8yF30Ewl63FfhKPpWughtyAl
 CyKmYJFamIQD4ibRMn+c7kGx+ZNZ05JfxmCg1tulc3aHN/RrVyURlUY
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
read-modify-write is serialized under the controller lock. Controllers
without the vendor capability block keep the existing behavior.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Assisted-by: Claude:claude-fable-5
---
 drivers/i3c/master/mipi-i3c-hci/core.c          | 14 ++++++++++----
 drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c | 20 ++++++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h |  5 +++++
 3 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e0ee8148aa2f..3d52d8f277ad 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -690,15 +690,21 @@ static void i3c_hci_detach_i2c_dev(struct i2c_dev_desc *dev)
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
+		if (is_aspeed(hci))
+			aspeed_i3c_ibi_grow_threshold(hci, ibi_max_len);
+	} else {
 		mipi_i3c_hci_dat_v1.clear_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
+	}
+
 	return hci->io->request_ibi(hci, dev, req);
 }
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
index b521fce4c084..e32dea0d5fc3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
+++ b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
@@ -25,6 +25,26 @@ void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val)
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
diff --git a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h
index 8760384d1c6f..84afb2bec956 100644
--- a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h
+++ b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h
@@ -51,6 +51,7 @@ static inline struct aspeed_i3c_vendor_data *to_aspeed_vendor_data(struct i3c_hc
 u32 aspeed_i3c_read(struct i3c_hci *hci, u32 reg);
 void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val);
 int aspeed_i3c_phy_init(struct i3c_hci *hci);
+void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len);
 
 #define ASPEED_I3C_CTRL				0x00
 #define ASPEED_I3C_CTRL_CLOCK_STALL_EN		BIT(14)
@@ -58,6 +59,10 @@ int aspeed_i3c_phy_init(struct i3c_hci *hci);
 #define ASPEED_I3C_CTRL_INIT_MODE		GENMASK(1, 0)
 #define   ASPEED_I3C_INIT_MST_MODE		0
 
+#define ASPEED_I3C_MST_MRL			0x08
+#define ASPEED_I3C_IBI_TERMINATE_EN		BIT(16)
+#define ASPEED_I3C_IBI_TERMINATE_LEN		GENMASK(15, 0)
+
 #define ASPEED_I3C_DAA_INDEX0			0x10
 #define ASPEED_I3C_DAA_INDEX1			0x14
 #define ASPEED_I3C_DAA_INDEX2			0x18

-- 
2.34.1

