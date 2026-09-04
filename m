Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004DE34D38B;
	Fri,  4 Sep 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527297; cv=none; b=TV3LYRE0T13N2Qt5YUABkDdu/m0AppaTHpTKZlQXvlQ5hjDy8K/AmWRzhz1sEYRxeqqovT8N6Xe2whHIutWPLC4nyCsTy2goyyK2Tq3wolEgRgm5IapuFvVyhwAe/MC1DJYe+5Ik6VTG979p/GJ9aVUmspBt/w5EoP0MkK+uCII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527297; c=relaxed/simple;
	bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhZ91upaJAgfPuFNFv0XWaud/I3Fmwk1Q4Jl7Ql3m2WtGCdHyoUiqnirW2wd3fxmAcynQVvaBE8Y3QFaSq4uwXjUYTqzrElIECUT2N9Quud3RjYW/JybA/NlfvClHtg/p4zcCD+khJrD5tJVQkeZ3531gK/2oQ+4TKM/NcfPN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Xn/tN73W; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=WqOYTSrv; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Xn/tN73W";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="WqOYTSrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527286; bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xn/tN73WI7whIrW1fJYxvk+RgafqtZuHSsMIJYuQWqEllfzdyt+gjSYy1RAuMmqTd
	 Djr5UQZQB8nrqXMI69JWZqrAQd5/Z9v+MXYa7XUH7xDq1ey3XOEiUTufsOBgMzPUKk
	 r9IvMsocJeY/072mawP3tj/v6hboDY/N66t+2KXlUKxGN6+juFwj5hNAJIaiN7Ia78
	 CKZeYMu9ziSGjA5kItEdHrwfSJ0PiIv61CiQfR0L/2bLbmy5FnlDkhgzCjXyJmpbZw
	 IPwf1YrJSvn/wEFtyBy/1UyXTfjiEHuvjXOb9vxt5XtlDQza4TkkJmb4Uk5JchaU8L
	 p6VjpvZNHcc2Q==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 32F5641466; Fri, 04 Sep 2026 14:08:06 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788527283; bh=1BuBMNzn04NGSUx2t/Fo772LrGa7E/DJva/4BtoNsWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WqOYTSrvB1ePrUscp+ks3gZRwZTlNBzXoow6F9DkAhAG/wvQYQFYgBnxhZvnswxH7
	 iTWdMBfBTyENJmaZFwBNak+BGPuCH50bnpF5XG1QU//3koPrqj1/LfRk8ct66Z404p
	 wHNl9QnFI0kOymlUPvg8B1kcM7STsKy0nIECcf1ECeVR9Yxg5JpxIL8H9waH7uC9xP
	 eSJk2pKFbWkLTvWxNP2az0WHEb1YfZYob2Ir1HuBXY/cRlrjR/nDTXLpKnLMuhz2gV
	 FbaIYAJ7MD1jQxVxACdTSO0FJ7YDuwGoSqjpzlvkNtmbg6mk6zkvQ72dZPCkSk84T9
	 BGu/eo5z5Jflw==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id CD3E441448;
	Fri, 04 Sep 2026 14:08:03 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/17] media: fintek-cir: Remove unused fields
Date: Fri,  4 Sep 2026 14:07:41 +0100
Message-ID: <cfe909385de16aa32fc5918764ead06af83fe65e.1788526920.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788526920.git.sean@mess.org>
References: <cover.1788526920.git.sean@mess.org>
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

