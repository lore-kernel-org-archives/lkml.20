Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904950;
	b=blKsyTUFSqk0b+xL6A5F5EDznuf1p/ltX/gQd5SvLnpbiXZvn71JjZXr5HxVf/pucF9k
	 UQ1GvtoRvOHltAiKCUnj3QrAngEXc0FRel4M/HmNB7JSECPoQ1zbNlan2hfZIm8gvkYRe
	 sZPg6T8Ds2syHRi/H3YN5DrdTQFaPeUgpzl5jsihEXQ57EAES3L/ZLnZczTWSdxMpnUtD
	 w3JoMaAp6OcVohIP1IEfWagU21YwVvsl6vI5RQdXwzKMHcrKgK/sTVrgYfwRAxJo/scYl
	 9fjAxxZURciIoNTj3mLAp1o/6c0qUj8ZLK1JU83szgKXJolhSqGWBHzQiYFW4v//mLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
	b=Xzzy6V0hHuTojGdmy0j5eS5/SL1n4U4X9sBii1/vj2elZtmQfy3zhrUOI9W2jN9JROC8
	 vhB3g2R6wgThlH6P5F1LrUOaa9JTF2UAwZ4ek5pwOGDxwcRGrmiIn3++5DougPhQV4tIB
	 T+gEyQOrgxgwhG3UotfoYZnV2R2sn/k/bA+iP7eHqPMI+aab8FAvxhRQ7ON3bJ+bbqMrP
	 sr7z0/3uxLSnphLt3C/v7SaL2QaROIU9xgP1/dYbDcVPglmKJvUHIkLQDlBSli6p5FSgD
	 uCOdEtHGEYKQhQbA/YzFa6GaTTvU0evXi0PgRum/onILWOlM0Qe6R477WWzbwr5HSaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCZXEgPc;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBA606D806
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBBA606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCZXEgPc
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6e560e00a86so1474506eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904949; x=1794509749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=SCZXEgPc43pOgavVHXYM4opuzr6pdZWTBXpupakgkGrx7onatY35gYQrjXJVzXLugT
         Nm5Rakq6phVY3zxQiRWoR3x0Tbl4gAbee6KDcfesL66iTrQ8AEX6JxaEgEGQz0M4yqRZ
         J6jhEwnp0EmIPfHRKJ5MxOZzVPmarmxh2p6SuPCTfeR0/JFrf4jj2TWoUJxtmqI2Vyxc
         sKQsZQ00etF1rpek5hk6i98FMJ2HND5sO4V9KZLhR3s2ruXQWzTZQG8chwZxW2C1qSFG
         Tpd7vD/afWGbS9ujjdFzyVLmUityPY11dNA6PDD6Lcu/pb6GcFy7m/VjKtDb+p61LjbF
         +6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904949; x=1794509749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=Yzv4gBNCpWwW/KpLX8rYAnfGdTxLtGGK8PyDqLKK/qcHAMtxfaAHC2m2BQebNsZAqD
         FRHZpnGWsGtrCDgMl6ufkGBPP9wXVu6UmWa5NSOisaQOy4tG9tx9XTS3WCMj0OkGNnmd
         dqSIKkZkYj00DyoKj7vLjJluOJkXpkrcZ5lqvuoZnFlmKs9e+VyTvMZswL778/vY5Pxu
         cB1oNUREqF54vaYwWbLnK8+R2o2klslaw/nu7erJrUlAbcb2HW1cLsdEuIVSLzRpfFFE
         yRGUCmLexUVEh6OO2Jg1+8ubqybMrQGifi7EhdWjM7/J4unon6YqM4WkO3qB+RKHQuln
         DdRg==
X-Forwarded-Encrypted: i=1; AKwUvBx1e9lfEbUbOO8ul9ZYnnVPqqcU+lhwJ31V1/LZKzf4FDzxP0FYr5asnPuAjz6lb9k1KfpYp5lxDYq1VXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D+yP5dcbMDUro1dNXOzIkithDtNFWmf+ECNnYxZotWbEHR0XE
	QM5Rg/c1NSjV0FuXtbG0w9j9ge9Y1HjxEuCm2IL9t6gSGBUiZi7C91/y
X-Gm-Gg: AYBFou3osmIziCdlWRWg1xNh5yAE2+b8jbB4BXND5EA38W57wsYYO1X/erZ9XfeP24J
	sM8YyHe6Xkz4d2S1RKuTCWPeW4Zh3ahh+8EQOZTVtI38cxo2+KvTjMdhhHMMvO6QOgNwluKwkHS
	ZwUpzjNd4gHdWhbxiK8DJbvL5v3ED0xFvlh1BLzXbYsCdHdhNCEYVYG04HYKgDBB4+s1ZsdkVHk
	zZddZgZ1cRoVXiReeDL73f3aDQsXHK1QUK0grMwjYe08t4cVPqfK3bGt1LzeGJKrcY52nxvnCSW
	+2dcUvnbRYtguj1TstKjegBZ747jwJvZUjCJZCzEL/FrIaczl3q2vYauJzU3tcQozQugyTSvV3I
	S3Kgwmyef5hqkio0fo3hIYQXojV/3SY76xtaDn0G+bKZL74X1cgbiXF/rpWqlbyrEIpBZpxHfuV
	kptbsS39XyPQ/x3EtWx4HIeGfJjYQ4lgfETZOFi/E6nyS7i2KBjoqDh/ArFPkMywkEgBViZF3ts
	JliAP0ZXLo0oIQ+t7BY5KI/oxpKH3+iHjMV8F1cyD6Z2GBMMfFBejgsm9zX0Xxb9/l+duWgzBbO
	qBgwnRyW3Pp/Hy5qfQ7D/u7DhzdCo9xK71c5KXtNuNmYEML0HCPTpC4oZMHFuKjBbXiGGj0/Y0w
	X6yLNj3FWMhDhQgQuE/7kYoA1XE+5ewEZB7viGM0tly6a8ASLeq59lKVr0Pj/L+Xu0a5zEJhN6W
	ZnJLJ7Sse5D7lZ78ywtCFkSo1TqeSIBzUNTLjwEZF+6Dg2PFqYASng
X-Received: by 2002:a05:6820:824:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-716e744f8bfmr419274eaf.11.1793904948781;
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:26 -0700
Subject: [PATCH v10 10/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-10-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e952d7f6abef..e79fe46926d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1236,8 +1236,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0

