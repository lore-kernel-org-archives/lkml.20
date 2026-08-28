Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D19B3E2ABA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907224; cv=none; b=d5mpKbIuDxIwgd7swytYPqNNwDKdax3AnYK24EFMnIJDOyNZ1I15GlvV3JcrPUsKDEhNnyRyGbT/ll9i3KDNGravneVF2fpt8C4P9U5Ff3C5+/JtdKAxf4BTnR4tzdhgu+eNpABiSNy/JLdK6lxAF9AiJ/JZPW4VyU77Tk2DuB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907224; c=relaxed/simple;
	bh=IGekMTDy9VMlHtod4MIQaoaSQTo3dM+riSIKWGnLTJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROShzp81p96c7RqZbzaFVXUYePdSlcPUuoGTk+dRLg6v0Bc3MyuSiBor8ujckeuMmv4hDNxqg9FlyFeWzRnZqM0xKZqZX4k6txrTzcMy/WQ2+WBVga8oVarnZxOhuxM8eRQAZ5/tN1OLQo0ogzbML982aH9ftw7jD/fhtxHUPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvTaCOxs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvTaCOxs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f633e6058so399026f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907220; x=1788512020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFbwIJ1I5+0GqyyrWqwabMNqn7eX9NbIKOOypBYOimE=;
        b=pvTaCOxsS0Ichi/Rd21WKnMH5A+6ZscyJ7W7jhPwo5HGWnWSNHOcXHX68hHDE7fJBc
         Ak0BpcpUOVRp/SRqhkm3oCUfPb/hZxAkjyveCy7fIR+ilQg9lVfcYGzICEs54LwP5YXk
         bMT/GWZscTMhZrYekXpVimHMGZh6dri/bZ7raeMrY8r+sb4TzxDWmSxLelv+UhH1p7zT
         UHzyfDfYoGmgDC/qOYcR5Ou1FK1yRER21seYFCKaBcrO+SkYPUUAIVx2tDbSPfUSjx2y
         +nxwG3ixp69VNC4K+7gw0a0EweQMPZSacYhqMZQ+OQuUvbIe96ow9uycQgxRUMeJG4v3
         rncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907220; x=1788512020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFbwIJ1I5+0GqyyrWqwabMNqn7eX9NbIKOOypBYOimE=;
        b=n80vUJY2qz1Z/0yodkZ7zZu4VLHL7FYbVuJlGWgHttihYY3Oh4QNx7m8BjZmArufmx
         NVu5vp3yuUjT7PpYbRyxJJzYvWbS0/tVdrLg7eJa9lvq0Mp8cbGMN/SeiF+9Cf9dZCw1
         WoRxs2HP//qwyggQS/Bi4UWE9Yr9mV6hApMXyaVH6k6tDG0u06Ukgoo4CChnapNNsy3e
         MMoJVx43uYdonut6+QNRVSZMjs61dE+772quA07oR4EjOnOi7KtgMeQoFPz5uQNPrptI
         TVh8T3XjF8euWsXV/koskHNm9H3lsfOQA120AQbRmzpHCOPs4ysyZCmPxcu8Jn9UwEJr
         4fYA==
X-Forwarded-Encrypted: i=1; AHgh+RpJxp8h5rmqQReJxbi3jjIHelQzNmvpnYLJHl1NyXKEeUECwNz9I+wqR9yZ3PLNiOYI49WpWZSFah0JPxo=@vger.kernel.org
X-Gm-Message-State: AFuF++k6AkTSW3PYD7xjzTNTbuc0AU7uYuv2tIWY37CQ4vIzsKJy1ugM
	zPqFV4O1fwCW9aW6TjT/oY+3tzghqAHn3D5owCRYlDtRuOCIQ1IL7lTN
X-Gm-Gg: AR+sD13ZNMNYSpz5jK9CC3FuvX5/MtAkhWxBVcHJ0+HPHTvjOANWdTBHubOvPcABpND
	Yw8/KWwCt6GhmNwniZuKNvwjdqiW/Z3ZKirsK/tYo3kgeRxFw2zsgUinpWuY8gZlDldF4AgDWgU
	VwcEKRpXpfJC3NGM36KGSjUn6USVzWdXKOp49jEBIrnNFFcbWhNoZZU0xVyioXWiAz+ff0f1Aa3
	99RGXFb0ZDkY238dRqdGQa0eRylQXhNnK1G3IaUhMeKRM2AnFaDO4n9gueWAwHAdUxksyOpXl4g
	gw/wHDrSn+m1795RlY0aVzB7c9p1Lb0BlhkzNs9ZMuanBW728nBPdLfT/mvBsx+qXjE8oXzmHcK
	QVumeXqJ/3T8cjKpmdKywwYfm71eOu/MQ4ksV2Ipiq9DDIxGG/5HEPwxbHzyUP30+BlHUpST5Kk
	TDtYpiTQVVMWVexWjyn7jrYzasUBQay+8A5IEEyEaYurxIiGNO7TT/ZsWTne8I456qqA==
X-Received: by 2002:a05:6000:4708:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-482f79f3be1mr8467992f8f.18.1787907220324;
        Fri, 28 Aug 2026 01:53:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm2921103f8f.26.2026.08.28.01.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:39 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Fri, 28 Aug 2026 10:53:37 +0200
Message-ID: <20260828085337.3916199-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085337.3916199-1-mehmet.fide@gmail.com>
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When the ECC engine fails to decode a page, the driver re-reads the OOB
area with the engine bypassed, but runs the erased-page check for the
data area on the buffer left in the controller SRAM by the failed
transfer.

That buffer does not hold what is on the flash: the failing engine
writes a bogus single-bit "correction" into it. In the 60-byte ECC mode
the all-0xff content of an erased page always decodes to the same error
location, so every erased page shows one stale zero bit at data offset
0x5FD, which the erased-page check then reports as a corrected bitflip.

Edward Karpicz discovered this behaviour and identified the offset on a
Colibri VF61; the analysis and the fix build on his finding. Measured
with an instrumented driver on a Colibri VF50 (MX30LF1G18AC, 32-bit
ECC): reading a 126 MiB partition with nanddump increased the corrected
counter by 18035, exactly one per erased page, while raw reads of the
same pages return clean 0xff. A v4.4 kernel on the VF61 (MX30LF4G28AC)
accumulates the same false counts, so the behaviour follows the
controller rather than the chip or the driver generation. Neither the
Vybrid reference manual nor the published mask set errata (VFXXX_2N02G)
document it. The 45-byte ECC mode is not affected.

Restoring the known byte is not enough: on pages that fail to decode
with content other than all-0xff the engine writes its correction
wherever the syndrome points (measured at a different offset on such a
page), so the check has to run on what the flash holds. Re-read the data
area with the ECC engine bypassed, exactly as already done for the OOB
area. The corrected counter then stays at zero on both boards.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - the no-ECC re-read and the erased-page check use the clamped spare
   size instead of mtd->oobsize
 - condense the re-read comment to one line
 - Reported-by/Link trailer order fixed (checkpatch)

 drivers/mtd/nand/raw/vf610_nfc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9104db19dd29..ffcf66f96c7f 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -520,6 +520,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	u8 ecc_status;
 	u8 ecc_count;
 	int flips_threshold = nfc->chip.ecc.strength / 2;
+	int ret;
 
 	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
 	ecc_count = ecc_status & ECC_STATUS_ERR_COUNT;
@@ -527,9 +528,15 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	if (!(ecc_status & ECC_STATUS_MASK))
 		return ecc_count;
 
+	/* The failed decode leaves a bogus correction in SRAM; re-read without ECC */
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
+	ret = nand_read_page_op(&nfc->chip, page, 0, dat, nfc->chip.ecc.size);
+	if (!ret)
+		ret = nand_read_oob_op(&nfc->chip, page, 0, oob,
+				       vf610_nfc_spare_size(mtd));
 	nfc->data_access = false;
+	if (ret)
+		return ret;
 
 	/*
 	 * On an erased page, bit count (including OOB) should be zero or
-- 
2.54.0

