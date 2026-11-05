Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904967;
	b=fFhciBL8uiMM1ShLH5MVRGiqCRgmNLpnv/PPjnLZdFlPKefxAALIlPwx88aHne3I9Q+t
	 C5jsBbCNeYSKBpjkM0ykvs3GEbX5qH98n0/cJMaBCLLJVXwNHwmRMkNLRlXh9AyzPOtUh
	 WJ6U1hlaCCnhFauYp9Dlydjb7JZgHfbLqv67Pi0/ETWFOzdKUkm6L5MdTWC0Gag3MwS2r
	 Cv+PP/2B+80ekP0Ldq4XD5ut74tDFHkoDCnO9LpfOgyomyX8Bu8IdXvTDcwD6QVPnNChr
	 Dq+fEFoN/DMMSdKAH5sdsHBmVowSp+jrmCdtONKIuYAfV9ggP8UTE4DAwM9Um4Ya3uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
	b=pqgMzbgsYjGLaQWZtrwZOm8BhhaWdqfe/sKUyqadNaLAlIVFVLPvdz8mcvJrnR0tK0o1
	 Yd9yXaRFmu8t4XJ4dQZqHIA5pzCbdW1xDcEW6Kri1yzpReFnasFFv41B73rRuXvSXmLVp
	 KduXc7FiW6HHakQnQtu+o8lhW5YP8FS/cyZKKJyYF/F3c5Sk+yWYbcxxObFNrZENp7Su1
	 Vm/nQN+IafE+ForcbUH8HGld6WO3cuqXf2SqsM4PTWJ8joQl+AvPg6sHDYlaIKhkbzlJl
	 27fxNoXT+NJ8dtDCz24JLBIC0kN4QqGyxtgHcu+73D0NxSPlTTWP2N33gEqXnAe5UxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCRNsc1h;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EAB606EE90
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EAB606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCRNsc1h
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6de1fd5f572so1017667eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904961; x=1794509761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=xCRNsc1hSh34m0V7Tj2Sc5YaZYirBL4qHwjjdWic9uEtYq9BBcF8LNtxPYwbQYfjq5
         e/D7h9vwzw+H2yDB5SMJOKzCR0AIz+VdDkgYK5/6HHArGnmqGa3y4aCAnDfGlI1m0Ubh
         gYyLdyRawEwCghTLmXyTxTc7ltiO1cUVb7JadlvyddkkRB8DKiY8yNHs/6XO+Aq28XIU
         MFTd62hbQ2z/F0un6nwU2HZ6av8ljo48WXabCYA3run0iXFQyXYN7UVSxCG/KQTOqN9d
         656yVR+Lg0IG+zWT4KWADFFPMBPzYrGYMAnunfiUNEFFo3CN3V9TUIcSKgplALh8zx/L
         3jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904961; x=1794509761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=2MLRbeRS6i5o/lrOvpQbw36hEVKvxMN/dXH5Mwr0cVfwxq49xxpyOL+s7PHo86QHpv
         jqsPDzzfCZ8E11QYppNgqzDbyEzAe7+maxBhDv/C3MU+jwX/o/a5bu4FfVf8XiRFr9VH
         bCmSbPqu+kFKnzaU7K60JP1rDWtnc1TCoz6SUPGZMcQmwJbQzjY9oBAtkR3d1gtFOv1J
         889fwHpJfpG/Zbs5tafb9wcQq+n21WDWo4hmIalDccczBER0gbZ/0hERFXAzZvd2hrpi
         Wfgrg2/wsR7ETFRmdkPHFHAJQMu9S9EcRQBpCZyDJqG8rN4wS924Fkd5As6D1kiAL3SY
         XPSw==
X-Forwarded-Encrypted: i=1; AKwUvBwyg6Vd5vEg6pWavM2Z0bPF/ibEMnktH0QdWGPJFP3J5Uv60t2hvvufXuukepFxCmHeYUdgeTgTNeyw4ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IZwMITaNCZrChzqHZsnec60pS4trUm/H69mEvlWaH+giNlYAb
	teDfvjMY5iOqsog5Y9hRKorpYPnXISm1b1GmOs0m7Jsmys+Te5t1IYOQ
X-Gm-Gg: AYBFou1SoMMqSMLP+gfynvFtFsbaXIrjGVkykVt+gFoa1bLoiv2Ota+T0pHOz82XY1B
	4jGWxjf5X5kRM8V8gm9XwkE9nc57x3ifmwRLpd4bgvKbSpHi1j9KBL4THstnb7vwIKLAYX6WPPw
	2pcaoBEyfG8EXP67dVdmMz3Q2bqZYX0GC+zYeW2nXKeRt+oIDH0KGBp8ByIHiG3htg9V3PrIgZa
	YhBM2M6SuNV+8TjEsnLzO+x+w0TgtwkRXqExCrC4ys6RstljlSPHlAagZHSXFYnL4WoiFfeIBLj
	AocYunuEi7CloLknC/S/NTMioMhSX93gT3Fj2lf/VHx2Kh1Et1f5McINaGx3K24Cn/iPpqz7xKl
	87kqklGmh6EzHMlvXcQU3T1yod3kTWrj5qwo+kz3Fjnqk1UkEQMWv6Yp1QHZ8w/8rqaGmT5qQIV
	4gUoPG0zzleILg1AWKJtSQAL0Ht9mCdniSWeqrX1HBo6ZL7ziYAib/Lrvh5ATB630seqN6c9/Qt
	X/7awKGPrCNEmbLQlMXwQHZbxC8gQo+T9dfxh8rdvucKhURbDfYFJqlSePrV1vMa7F1AmlVRhmc
	6LledGkij9qMHUfLvLEoGFoC/KgJwtFeVkz9vGBnrf2uKVAUa3qWUpi4qxWMQAhueJIk6WViF4A
	Ao7LBZmlvrSayjhRHf/XSUw1WMEFdNd31glPTpEG5Cax/GXY3GO8tt6+GS+6nZSh9LClRUyHh3d
	sGhYZzKX6ye9KAOAZR2BN6IXajjUnz5uYhM1woy2WRoG6sB2/DOmDB
X-Received: by 2002:a05:6820:4812:b0:713:da3b:901e with SMTP id 006d021491bc7-716e794cfa5mr279031eaf.48.1793904961203;
        Thu, 05 Nov 2026 10:56:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:35 -0700
Subject: [PATCH v10 19/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-19-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nand_chips_init() scans and registers each NAND child before
starting the next one. Registering the first MTD device allows users to
access it while the next child is being identified on the same NFC.

Normal NAND I/O holds the controller mutex, but nand_scan_ident() does
not take it. Its RESET and READ ID operations can therefore change the
shared chip select and timing while an operation on an already
registered chip is in progress. The normal I/O can likewise interfere
with identification.

Scan all chips before registering any MTD devices. Add each successfully
scanned chip to the controller's list and track whether its MTD has been
registered, so a scan or registration failure cleans up every scanned
chip and unregisters only the devices that were successfully registered.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3de9ed6795fe..e1306d14ab3a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -298,6 +298,7 @@ struct sunxi_nfc_oob_ops {
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -308,6 +309,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2672,8 +2674,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2754,13 +2758,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2768,6 +2765,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2779,6 +2777,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0

