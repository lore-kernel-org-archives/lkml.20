Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7948E0C1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942675; cv=none; b=gpwg7RWQdsEkTJXd66rPi0YkthsxAxJDq4wt0hOYXwvNfMK8cZ7A6lFH+FI5WkCRw66SZP1Obem/OHvZMaJtV2A85sdDFNWAUhufmkTvvsvBpmmMZaxgOeG1cIfl80bhQO87AfEOdy/9CxpmNwHE9H1ddFPnUVx1j/oIrrpHhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942675; c=relaxed/simple;
	bh=cGpmPCWk/z4rj5JVkICnW7HVGVcxN3tvIGoYKX6sOJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzozkW47qTClNM4PcZw0WZ535lDqdBHRIjnwontQf5eygDz4t9oX82NGZ4Nss1/oC9x7M447/QdqLLhzL6BsfJPNnngk/A6U1GTF5Nb3yCVNmvIXf+jzzbGK1vwxGL9MveGSPSuNiZ1fy3eDSlc5Umj9cMy7ZmbTcdPzQeOYPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTA6phgM; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTA6phgM"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f3ece23165so4442416a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942670; x=1789547470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=RTA6phgMngIkyVMYgb7uN2ni0DhpmXkTUwd0WO1NEddw+7776kl5/NrPuhDjn+6kvy
         Q8c4lhOs54ASDgAo7v3e717NCtQCi5dWfFJDPoXyTPBoWNNrdzusykRd4/dS5fr04BFs
         ARdL0b2Ta5UcTLFZHWAxToCeSW8kxkn2kXXBBTv2YR7om7vuqhQW8lPl/XHRaf3RaykZ
         ujJAmWPqnxWaNsn/10z+Tf1RzNc+vYhVewsNJpW7pJKkoZkCq9FmSWhW/14ebn+loW39
         5a6ywABAL6jhCqtWFDgCk/hviVJragfID1caf7YVL7jXvZ48/CZ890oY6hNlzOGD1p3E
         iSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942670; x=1789547470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CID5bvCPjR59lMZ6K1AMRWDV5Xq0pdMdX69zJBV2wqs=;
        b=ebthUb3fAQtijFalIWDTAGvj8ndFHCF2e4+t0tcuOwOL8dK3/kTTWUFQlVQ6D18vOU
         GR5ufPQBJs0RDHPCkyalf/CjXkvxc+hTs0D4yMTtzJkqDW8fNTGojZ89wy0yelNYnQjv
         ehFvpVVpofQDYo7GqTxK48S8H4SyU/Q6qEsbxETZv8ECzDIEhaR8dE+x5ZRambOkNqTV
         KRpSO8dkgieP2B/oGH6RrkOoC8VSgTKWbmRqr/a2Q1LdvjLASQ3D87MQq+6CW6BJycAJ
         syvyXO6ZEoUopRepFJiCl6rKN5OJxAbxsFgUSXIGp5m80E+wZhxGsxDXpul/GdJlQNWQ
         Pltw==
X-Forwarded-Encrypted: i=1; AKwUvBwnGfGFvAfS1J1qHaTAeFdju155X7rpaLRkdf5UUi8gzcE3O/EhqFpeMahp0GXND1O//6bfLDU1qQVVSHo=@vger.kernel.org
X-Gm-Message-State: AFuF++lfRW2GvD37P9DDk7hrtt0OyXhMSFx/PWZEE6C2LgPBhX4leJDU
	gg0auW/0Ge5Fa8OBkexkkyIrbk0OKVIoFpTS42qwMOJ49vEnUvg5caKT
X-Gm-Gg: AYBFou2ax5sERcggozhn//37paCAeAxeQJIW/Rw9cgqJgAX7Eyhu3y7vSAOQd6ltHtC
	lfBA7ml4yMz8tBzRQaFH6kbDrP37sdbHlpLdX+Ud59v1fZRh0+DuxQKKveVKvsyT7ZacfmMkspl
	DihTBA8cRSnRtM3zy4Uv8Q8YCsx3UXswjYzmLxZd6wPTPREPpLayWsbbyvHIpxw4UIx4pwS8SFA
	W1ocJf/bK/pi5wKko1LJj1ybLRYkxlS9Ek/uU4PONyVXWCW8GQFrcwYL2UTVhjCqBoEowX8bbhd
	pjF8VgQR16o/tWKE4IvDl5pI7AdpvRH1xCvphCukZg9vFkInaQ85lqb9jxitv6So0qb3wvTomic
	0mIsPPC6hXyI63J18RJKVgngIZA93DKWo619M7xJeI7TduidWl5kNl5XQOfQcoIMaLDO1T/X2vC
	XEzh6dXNJgyQ+EzdcflxGrwiw0zUAB6ypjT3kMuO7lFzI4cFfJk6/7vu/xf/97Fcgg9/0+hI4GF
	4+m1/2Fg6C2qWzBW62duZ7zlVFaMzxgBbMsytTVZEHtPFupBvasgf/oNq6qxy9oIGqIncjKoGkg
	YHrrqa0mOvY3dnTFlh+HT4xAnXUU9/5TjAImW05gqBiMx7XwZq4pirpEY8mcwYOqUqGwo4CS6am
	MPV812E11BnJ93uoGfu+p2dzm3uATYg==
X-Received: by 2002:a05:6820:1891:b0:6be:731b:5544 with SMTP id 006d021491bc7-6be731b5b5amr683141eaf.37.1788942670338;
        Wed, 09 Sep 2026 01:31:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:45 -0600
Subject: [PATCH v3 12/15] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-12-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6e54d3a92219..bbfed22640c8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1412,15 +1412,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off,
-						 ecc->bytes, false);
+						 nand->oob_poi + off, len, false);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1431,10 +1444,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + off,
-						 nand->oob_poi + off, len, false);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

