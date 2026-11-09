Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187772;
	b=omu62cl4mHhit6Js8ulpUDjKO3PGu1L8IIsnbcHC5eu+MpwOhqh7pt7QkqWT5pAB5l4j
	 QA3dF8tw6RSGT7jpr0bMs1K8jeEW80l58Xk9qTt0pCGnmCYevpjxItNlEE1nJTzcorzPC
	 5XCRsuLgCEUAUXnLJxNwgA/55EJxcvExUeqD9Nh8FaV5v4+5vxvDDSrOyn23jye2FaIyE
	 tSY1eghyqa0iDf1CU5OZU2wS6eDDpDZVSohGwWoBe4RBpiH+If4JGa8dShaUh/WQKqzFm
	 fXlJEZkc087vdLY2nP6n10oipn3bOcwj9d+O3YDnvpcfPWBNUKkO6XEKOoepJcBUu2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1LGO8kbqRjWmKCJdidhOgv7673/JPMkKyXcsVD0AoBg=;
	b=xsbCVIrkHBW8Su/G6mcCOOQeiJetBDPaRuwnZS7anaMmiwpbJRj0vdAtLL9aMUPRz0Ho
	 isefiDMn7WySeA52PRGhhRUpsESz+xSke5V5mwxahRlrr+260DIL6uCVsgKxtnkrRroUa
	 LMmqIg4bAbfj0hDbL6c7bUgAaUi/o1IVbbS4KQ4hSZPBb/9vGkm/Opvz7JL8iYbWU3BOH
	 U5GomqW5fGn00hUaqLQfxzE11ST61cuEaYf0Jdw3Og/BBiFpyNvoc9R8RdiRepcHvom4o
	 W9KDqRxia+prb3++bOuiIaikcd2LjvSyUdZPY8+M6jsd4y1yo88GzTsXZswgZGG+WCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AFbwDHi1;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C134606D475
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C134606D475
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AFbwDHi1
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b19e291cc6so326527eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187771; x=1794792571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LGO8kbqRjWmKCJdidhOgv7673/JPMkKyXcsVD0AoBg=;
        b=AFbwDHi1H24PUb/SvFwKhJqkhV1gmrS4q3qIyQBzWWfXdN/mNRHn2Osx3mZa+A35ty
         b7NXioFL9MohkRiqLOb69geSNH4u/QlClxnwXHWMLzOH07yqobQNV3slNXTpP64TJvY7
         ouwUI3FFzD2YhxgRxYiiQALgTdrgQcuhXNQYn+vuLtpTQHY6iPWpcGOX3EKo2vItC9W6
         7sUsHClT/9kpDrO0VMPMnLrA1RBhEVUzmXLeVM8Aw8oOuLrKCYn4blUn5nvYfTm66twf
         oIvVN/JuIgxZ/ybiSrgrHyO0TkRsHx3POEwtIlaQSolsrEWx16EQbEmR/13+RSJvaJWK
         SOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187771; x=1794792571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LGO8kbqRjWmKCJdidhOgv7673/JPMkKyXcsVD0AoBg=;
        b=NSSvK1SW0AWE+0O1i/it7xxbjqVTXga/Z1K312/o/RXIajnIFR3Hln9BQ7TO9ExL2V
         IcaGytC9KqL2eVQOvXqDgHDmONIxfuUghH/2XvUJINSoeb4L/VukEeQWDIcCC4Ov3Upw
         m9LkU74iTAHjup4n6CEufM1XF2hrhGGInVReAPL6AbPk1VB6/TE80RNymD16gtk7wZTf
         86fLtQDsTpyNhr3hUZxgPevaFjr4dODNRq7VojmmZu35S2EG/UmZ5FnLSukGFzvXBmSP
         fbIpYbq93W8Bgj0uxkv3oA5ARKGtx1QVDmxR3WC32+fSN0ZkR4RBmiVUC1rE12aWee/i
         AOvA==
X-Forwarded-Encrypted: i=1; AL+hErEurzxWJj/UC9LzIFEJC56ZZT3cJeSUGSdzG19H4zfnbEwJBc+LORMN17+AfbqLujhI5+RmbCHVgb9RjWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JmUxVF5sutjVrs+s4hsm16YYI6P6fI2RMcl5TI5vwb6a+iOJ1
	gfZKZr23RSwejCFZZN+S6c6pBTGW/8rFToVN+NBaBInrXoS3mghvcnEx
X-Gm-Gg: AYBFou2drhpC2yAQdV2PouXDvq2OnJDKZa2Ncq+fRubUaGaECuwqL+IZw4Md43QY8ve
	6Tx2zXfPUz/ucY4xnqs3Yxha9QyUEsGEHj6pXLKEhf9L/ui3m0ZT+WILHDZP/QelSenb62RRl2Q
	BjyBn+8I9mKwfNhlULChnf7jOBfcjUS5us/poqf5kfkgjh7hR8CGwFMgEc0rQ1SpNwdu4w7hams
	URHZvmXEba+TGU56c0kMTGl8xUwk3DmvH7GaAiZUo7/9xwHbc22vTF70m3i9iOeabvdp9gYIi/z
	gGH8KQr57STYI+F7sXPd/HxvrNsZQkv+eNSbcf1Afro4pi8YjaMETNWuzSDgAT/tfTlzFzL6aee
	lxq9HgWRsAWWBQyS1XLO8U6asSOleLbt7FOIa0B1MnDPhGX95LRsYqBR/f78T9bSK6qZEjE98MJ
	T2vuPV61er6gk6683jGenrzn2Ug8ml/HTCI/hkNrRxkpryKSqPtiMJXE1U6ozP9zOuidb948zxZ
	PbU5FQCF5vtj6pw1eRrazXXV7mHybJ5BptMSTdJN3ZghC7KEdabHTD5n+wPuREA3MC6x1HpX1P+
	7F7F9z+uAtGx7ezGueMHo1ZLNBtcwAjN/rmwnnefYK7KZzNEyD/sAps5TgCWJnz0csYf+pepNdu
	UobD+wGAQBygFjEBaH8/d5EWNIYaB30pqKWL9REJDkqD4DkcJHgTqLKUuTZD0b2mDAswqyNQg8b
	gjqsYSqUXwvBQqEppk3nhQnWcEzkdIrtWPw/JD3J1Z6NTqf396eTLv
X-Received: by 2002:a05:6820:83d8:20b0:715:2147:23a9 with SMTP id 006d021491bc7-7170f23a98cmr975721eaf.19.1794187771525;
        Sun, 08 Nov 2026 17:29:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:23 -0700
Subject: [PATCH 4/4] mtd: rawnand: r852: restore SmartMedia and ECC
 initialization
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
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-4-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

r852 uses its own NAND controller and attach_chip callback, but
sm_register_device() installs sm_attach_chip() on the unused legacy
dummy controller. nand_scan_with_ids() only calls the active controller's
callback, so the SmartMedia setup is skipped.

This leaves the generic OOB layout and bad-block criteria in place,
omits the SmartMedia bad-block marking callback, and skips rejection of
unsupported page sizes.

The same conversion removed the hardware-ECC default from probe. This
PCI driver does not set a NAND device-tree node, so rawnand_dt_init()
returns without selecting an ECC engine. The zero-initialized engine
type remains invalid and nand_scan_tail() fails with -EINVAL.

Restore the hardware-ECC default in probe. Export sm_attach_chip() and
call it from r852_attach_chip() before the ECC-engine check, so both
hardware and software ECC configurations get the media layout. Propagate
its error before scanning finishes or the MTD device is published.
Remove the unused dummy-controller setup; r852 is the only caller of
sm_register_device().

Fixes: 7ef969a04228 ("mtd: rawnand: r852: Move the ECC initialization to ->attach_chip()")
Closes: https://lore.kernel.org/r/sashiko-outbox-204208@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c      | 8 ++++++++
 drivers/mtd/nand/raw/sm_common.c | 8 ++------
 drivers/mtd/nand/raw/sm_common.h | 3 +++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index e78606b97b42..ce7def018099 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -820,6 +820,12 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 static int r852_attach_chip(struct nand_chip *chip)
 {
+	int ret;
+
+	ret = sm_attach_chip(chip);
+	if (ret)
+		return ret;
+
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
 		return 0;
 
@@ -883,6 +889,8 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	chip->legacy.read_buf = r852_read_buf;
 	chip->legacy.write_buf = r852_write_buf;
 
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+
 	/* init our device structure */
 	dev = kzalloc_obj(struct r852_device);
 
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index a6387111d271..291aa21dff4f 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -167,7 +167,7 @@ static struct nand_flash_dev nand_xd_flash_ids[] = {
 	{NULL}
 };
 
-static int sm_attach_chip(struct nand_chip *chip)
+int sm_attach_chip(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
@@ -186,10 +186,7 @@ static int sm_attach_chip(struct nand_chip *chip)
 
 	return 0;
 }
-
-static const struct nand_controller_ops sm_controller_ops = {
-	.attach_chip = sm_attach_chip,
-};
+EXPORT_SYMBOL_GPL(sm_attach_chip);
 
 int sm_register_device(struct mtd_info *mtd, int smartmedia)
 {
@@ -200,7 +197,6 @@ int sm_register_device(struct mtd_info *mtd, int smartmedia)
 	chip->options |= NAND_SKIP_BBTSCAN;
 
 	/* Scan for card properties */
-	chip->legacy.dummy_controller.ops = &sm_controller_ops;
 	flash_ids = smartmedia ? nand_smartmedia_flash_ids : nand_xd_flash_ids;
 	ret = nand_scan_with_ids(chip, 1, flash_ids);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/sm_common.h b/drivers/mtd/nand/raw/sm_common.h
index 57fc9f86f9ee..599fce778fb2 100644
--- a/drivers/mtd/nand/raw/sm_common.h
+++ b/drivers/mtd/nand/raw/sm_common.h
@@ -33,6 +33,9 @@ struct sm_oob {
 #define SM_SMALL_OOB_SIZE	8
 
 
+struct nand_chip;
+
+int sm_attach_chip(struct nand_chip *chip);
 int sm_register_device(struct mtd_info *mtd, int smartmedia);
 
 

-- 
2.53.0

