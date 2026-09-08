Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F2577E29;
	Tue,  8 Sep 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882867; cv=none; b=FFNuVSzDfuXhb7YNrlZUPN5DAJb1I+GZFgNPDMEST1fNr0t/ySqJGTX05xb/MjTqu6HbRVJ51suug2E1hZg8GsS8od7TPJ6s4tKqvAl5TzWLz3ZnLz403/IvMyYONrS4PXweSjpj7ZYH2ZtsYxLPhgw1yNOia8B5l+NrBjREt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882867; c=relaxed/simple;
	bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiTb5ax+zZ6Jws7nwzWCEkTXMoHYZ6YqzPWJep0AqL3PE75YIZRVxZg8Z8JAI6S2beDIdzc6Qd3zdLt6C3ZAVLeqYI8ylEXVkU0j4e/SRCXP8IKmErCvltfi5vQED5S5sTKUXjkgYDhA5hD1ThbURZJN4CEdkxKTt7/LexeBmFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=TlUjBp3E; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=TlUjBp3E; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="TlUjBp3E";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="TlUjBp3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882855; bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlUjBp3EW2d3PfhxSLTGM0NnsyRIS42WGhf831LD0dUXfzQDZ49BCNd5jxg1wZJjJ
	 CejR5IAG6BNODByza7khIaO2A7MgrY+Q/vV8ymZQ4u1tR1JZxlRjBVUChn6hz1DTzQ
	 trw0ziTC0M+iZD+ZuLAtJGqMukLbOKVj0sfxBdnU9m5BOcMFDtOvQktTPRVdpjI+DD
	 9tjvQBjaXTMuLtjJs8H76tm9XntC2FyA+3asQbV/p+VdLtT+zeivzIybVWU5G9LBoY
	 4p7JsLOU5c6yWsXRzIe/F3AHeDAqLYTg21+isfG/aCJHbdvMHgL6a7kYgBLAU6j5qK
	 OkaNhu3pCVILg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id D08F941469; Tue, 08 Sep 2026 16:54:15 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882855; bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlUjBp3EW2d3PfhxSLTGM0NnsyRIS42WGhf831LD0dUXfzQDZ49BCNd5jxg1wZJjJ
	 CejR5IAG6BNODByza7khIaO2A7MgrY+Q/vV8ymZQ4u1tR1JZxlRjBVUChn6hz1DTzQ
	 trw0ziTC0M+iZD+ZuLAtJGqMukLbOKVj0sfxBdnU9m5BOcMFDtOvQktTPRVdpjI+DD
	 9tjvQBjaXTMuLtjJs8H76tm9XntC2FyA+3asQbV/p+VdLtT+zeivzIybVWU5G9LBoY
	 4p7JsLOU5c6yWsXRzIe/F3AHeDAqLYTg21+isfG/aCJHbdvMHgL6a7kYgBLAU6j5qK
	 OkaNhu3pCVILg==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 27C194144E;
	Tue, 08 Sep 2026 16:54:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/19] media: fintek-cir: Remove unused fields
Date: Tue,  8 Sep 2026 16:52:01 +0100
Message-ID: <36a6bb0aea44119599603e2009a44bd62b3347ab.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of these fields are vestigal from transmit, which never worked.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/fintek-cir.c | 13 -------------
 drivers/media/rc/fintek-cir.h | 22 ----------------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index c196ee923ecd..d4368181fef6 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -140,17 +140,6 @@ static int fintek_hw_detect(struct fintek_dev *fintek)
 	ir_class = fintek_cir_reg_read(fintek, CIR_CR_CLASS);
 	fit_dbg("ir_class reg: 0x%02x", ir_class);
 
-	switch (ir_class) {
-	case CLASS_RX_2TX:
-	case CLASS_RX_1TX:
-		fintek->hw_tx_capable = true;
-		break;
-	case CLASS_RX_ONLY:
-	default:
-		fintek->hw_tx_capable = false;
-		break;
-	}
-
 	chip_major = fintek_cr_read(fintek, GCR_CHIP_ID_HI);
 	chip_minor = fintek_cr_read(fintek, GCR_CHIP_ID_LO);
 	chip  = chip_major << 8 | chip_minor;
@@ -169,7 +158,6 @@ static int fintek_hw_detect(struct fintek_dev *fintek)
 	spin_lock_irqsave(&fintek->fintek_lock, flags);
 	fintek->chip_major  = chip_major;
 	fintek->chip_minor  = chip_minor;
-	fintek->chip_vendor = vendor;
 
 	/*
 	 * Newer reviews of this chipset uses port 8 instead of 5
@@ -496,7 +484,6 @@ static int fintek_probe(struct pnp_dev *pdev, const struct pnp_device_id *dev_id
 	spin_lock_init(&fintek->fintek_lock);
 
 	pnp_set_drvdata(pdev, fintek);
-	fintek->pdev = pdev;
 
 	ret = fintek_hw_detect(fintek);
 	if (ret)
diff --git a/drivers/media/rc/fintek-cir.h b/drivers/media/rc/fintek-cir.h
index 20696359e9ba..9ade9d7e7bfb 100644
--- a/drivers/media/rc/fintek-cir.h
+++ b/drivers/media/rc/fintek-cir.h
@@ -40,11 +40,9 @@ static int debug;
 			KBUILD_MODNAME ": " text "\n" , ## __VA_ARGS__)
 
 
-#define TX_BUF_LEN 256
 #define RX_BUF_LEN 32
 
 struct fintek_dev {
-	struct pnp_dev *pdev;
 	struct rc_dev *rdev;
 
 	spinlock_t fintek_lock;
@@ -53,14 +51,6 @@ struct fintek_dev {
 	u8 buf[RX_BUF_LEN];
 	unsigned int pkts;
 
-	struct {
-		spinlock_t lock;
-		u8 buf[TX_BUF_LEN];
-		unsigned int buf_count;
-		unsigned int cur_buf_num;
-		wait_queue_head_t queue;
-	} tx;
-
 	/* Config register index/data port pair */
 	u32 cr_ip;
 	u32 cr_dp;
@@ -73,17 +63,8 @@ struct fintek_dev {
 	/* hardware id */
 	u8 chip_major;
 	u8 chip_minor;
-	u16 chip_vendor;
 	u8 logical_dev_cir;
 
-	/* hardware features */
-	bool hw_learning_capable;
-	bool hw_tx_capable;
-
-	/* rx settings */
-	bool learning_enabled;
-	bool carrier_detect_enabled;
-
 	enum {
 		CMD_HEADER = 0,
 		SUBCMD,
@@ -92,9 +73,6 @@ struct fintek_dev {
 	} parser_state;
 
 	u8 cmd, rem;
-
-	/* carrier period = 1 / frequency */
-	u32 carrier;
 };
 
 /* buffer packet constants, largely identical to mceusb.c */
-- 
2.55.0

