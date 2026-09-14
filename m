Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28049F128
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420222; cv=none; b=Mo1hn+R2AWs8HBSLwN/PAGcyewFg/GWoTV+DRB5W5vHmFeIp/kmHH+petgQXmORCQ0KA2IJJCE5pMin5VQ5bKtamqfXrvhdS+7t6udQWslUpwI5qFbwmPohyR+7EUOaOYp9FNzBmxfGrjQ0Bzm4pYBi2xSsNvpxAO+dMwfcss/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420222; c=relaxed/simple;
	bh=RYMhZUroOg0vuK6FzRQ8q2eVSn0RelC+x7nX6I7sGZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fize7pYPv/DWpgyal+1auNuHuMUUtarxydon9bDPldCfHKBGng1prOw1Sl0vDeF6QtbB974nm/OH5xXHwpA3tUhx7neVUZXhWEG8B8gsAHsy2TXwMQwERIt/T2q4eeJrZrFedhHer3cBlH9my2C90/kTOwsIBDoH3H4c+n4EteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRzb40Mq; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRzb40Mq"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-451a49abd8aso3485321fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420214; x=1790025014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=;
        b=DRzb40MqaAk2Ua5hl3ymkEsKc1AzNoTRfd5iw7SLhfknWEe6gvFN6KFBwcGdMFNyw6
         D/aTgmTI/j6FuBXnWs3rOsh0Vmv4I3dbYuEj7ZdlPbIueVKN/LeRwGbEkT2Dc39Uc7Fn
         2QinkxrdOl5fhNUaRQSL6TtQHzotCX7byy1Ozb1g66o7TQ/s8x7fA9TJNlAIGf+aYGv4
         MLd3qUhPj0c84MzlkMls6PRl8Xtt4jeTtWVVLpLWlKQ1nxbcdnGtWvfXRsNEdeR59Oat
         ieXPtKfLqQmZ8K3hmhThGua0B7fSU0YTnUwSYApzdvz5feUQ5naAx/DGqdi1HqS+/zOO
         JA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420214; x=1790025014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=;
        b=UaE4WhVyD+iyjakxhvJPHslkQwsNGQHZARgpetUoFfSegN8+XzkG9HKJ6qBwvCq+ps
         BfxEzdScXF/pmGVsCButvpqtsW0eSsSfJ0DM61ARDsRMOnG6zAcxtqRnlQ4j7lAFuRSV
         7p0Cgt348iktJo9wEXj1LN4O/YFK3tbFPfxjTBPguDXuE9nKWDGAwDV6wPq3Unmlis8J
         a36phqofZsJInhB/gMOoBLPvdWGzkHh6SyvdRG5VK6pFqNGcvTRYoYoZtJubTTdsIAF5
         mPG9+/fEwG3mp+qjyVyuWRHN+lJX4IrtuEnwoJ7jSLkqfEf2j0SoxZfTaxZrrNhaO+e8
         RkPw==
X-Forwarded-Encrypted: i=1; AKwUvBzRHZH3mNVZDjnVyYSJIAIhB5gZE91honmHBXrcZRLxegHb0F+YibZUZxZbKBcT2o9Wie/ZkJpxPmizpsg=@vger.kernel.org
X-Gm-Message-State: AFuF++nW8s7ymhDbYwjdkkVysBCTJnMN4gCJvH+rN92JJvvVkkNjb6Ic
	ZKXn9+uGb5xbH6wT8Hdh8kTSxVnkrMTSsLWcvT1n3BgtJ9camkah9EEP
X-Gm-Gg: AYBFou0V4e6EWtr2Rzk9LxpUQim2dgMueqMqgFUPASURO7ILjjLdUccwZwo1/p3T1Dy
	v/yL9MIMCLbU+PJ9KLhv0d05vUQg/ZfSuqow2raebOTduo1VZlY/wPzkY5v9WV/6whQDMli60zv
	JliimN8VsRaHBb2EHu3GNLuiTVHe4LEmZEA9iIzQwdOrMJN3obZStJw9ALtahbShPtv/+f2JPeg
	NivFEWzGmMFmt25BHOa+Yx4KNN63Rcya23LcT9w/CNZDHNTINfPLf3VPbKkHbsW28JKwOIXYmNN
	Itcoi/mStmak/2KklROxcfF6RdelSbx0AfJ/F/5Zal06ueUsSRY0QLJiKdlflusOcuu/T7vtwRs
	ppwPinq5GcB0Ivo8UaJh+BxAj/jmphoByBA18PXz4WJw5QnuUs/d/tYjHD3Wwc+DioXWJ3cjEdX
	qMQYfSN9bOEqmH9dZmMgUk8FNx1V+6JbQ5OXlLl+UtPIwNwdWMmT4jV/lCDq+17zaecLJkhYezt
	uV4KezKv7s5gNaUrT83kdKcC8hnGAicaNmN+MwMnpHaZFSFVJeiIZ2NL5dCS8ckt0RYzexz3+3N
	ka37GE35Krxpf4RHlcMWqIMWa+yQ+aG2Pu7IEnR6B25LHvjj/2VKF8gWV8ms6ceEfRWbTuqvmhQ
	rYTPipf13sNNSPT/4XOPEmGtYlo3E/uT6HgSzE6c=
X-Received: by 2002:a05:6820:200c:b0:6b7:83c5:fdf7 with SMTP id 006d021491bc7-6c5451a9095mr2847169eaf.56.1789420214324;
        Mon, 14 Sep 2026 14:10:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:00 -0600
Subject: [PATCH v6 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-14-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 42c5f782db40..8b0d0620e1d9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -225,6 +225,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2431,8 +2434,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2448,6 +2457,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2508,6 +2523,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2578,12 +2597,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0

