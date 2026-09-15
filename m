Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700934A5C2B;
	Tue, 15 Sep 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461201; cv=none; b=hdURK4HhDjSl1Hfv2wYfS3nFpPAwG6jMxDDh5125JSm95qF7dNEMXC6UyqrJLFKMaGnoQIcjo3qPqs92m3nM0HcHfuXyyQrzUqAiqUZH1iv1El4QnWukVOtZPsenAGkrMXrmBMGj/l09LWIMjhY1SOFI35Vn+QsI0mB/lQqO72s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461201; c=relaxed/simple;
	bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3eCls6bUsTQ2VjdMhUkQAzM0yP1kzMDsctU+G8DRRiiWwVRqzNONyrWh2cZqFrb6ikJcNpzXHqb55iIh+qdltziQ0dSozlHLcU2zCrYWeuAgVlx+y2Ud9x0H1vofpAkurR6D6lgljPj7ZlonLIsl6nEAPsUwQ03E6ZZFkJLPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=WjFFfeae; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Ji+EUKjY; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="WjFFfeae";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Ji+EUKjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461197; bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WjFFfeaeadIHEcLFr9/CQDhD1gFcZDNEFBmdICaCfwoeGD4PQ/VVl1+javIhc/dse
	 QFwoLEq90HzzK7NjeLD3uElIHiGDjHw2PaN+Er9vpSsJkvf4N7egyJ+7QZtRfB40aF
	 im1PQ2Y+gY7YKIz+PRzimqwfrdeOZmcfu9/AzkBpRKCEPlbgLPs1rsMVTddLCvFhIQ
	 PUObcvPv/BN0qeWjg7lZ/a9uCH9j8QTRKP2/mVKDGMc5hhSLo5rTeLlKpC8qkY2o6d
	 ZE4Qj1ceuy3wnvIaTBkkwVEzVXihs9VLQplWQWrc7Tieod+5g3bodQ+SmH/FYXSa7Y
	 JO9al6W+gjOfA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 84DF740B87; Tue, 15 Sep 2026 09:33:17 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461196; bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ji+EUKjY/A/ociGGqP6JWGDyJby+HeROtuYoc/KyjMmVbNy/lAOdxexfmhrcHd0cH
	 7Mpuqh0bSRqNHjFlknqPTnIYyN1TtzoTiUHvczoo6gDZvuFDr+4LIxPaqa4D7I8vvy
	 Am0ghoB2YsX+xahsbxpEq+MHh3vwsGbE6CgDvcVNV/OV4VhV6chTOdcvbBW6DW5I4F
	 bHJw1FhUIvWoTOEmpgn1CQEfYcDZrSv9d9BzBOZ+PyoEqtdMusDpA6uQHpfJ6GtUqX
	 OeksJEYZeMLMzzraKWOfb/XvI774WSOR+RTByubor1lL1UV1cQjtprTSKeMmsn4Phw
	 6N8AXth2k+ARg==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id C88EB40155;
	Tue, 15 Sep 2026 09:33:16 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/20] media: fintek-cir: Remove unused fields
Date: Tue, 15 Sep 2026 09:32:24 +0100
Message-ID: <dee79bba1584aef4b02dde90626bc128d52122be.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
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

