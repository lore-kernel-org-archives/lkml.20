Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E3473C8D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942665; cv=none; b=f11uoIiqIcljYo2jdwjtYoiK176tZ1ZPGwOzUloFpgZE2QnqUTPd3hZQncicJUaCFkzAd9rPAhMTNncty/qlC9yy1GScqWLU0gT01s2oK3a9dZeCPoHdiRZ4uYNs4Ln99qDqFz7wvYD/Q9KcPYwYq3TvfE5DwjMXfTp3XUvqc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942665; c=relaxed/simple;
	bh=Tmcas4j0s3Gf2d4qRloLyZr+HYYU6fTALfwrcrP6U1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBksb010gqn1kcPqpma2HVwjG603moHG45roLX9CE8PNv/B8Z2ufQTDeJVYUOMjsgCmittm9HjJqyuMWi0gKefcLO8uISCE1DonBdt1UTmk8LvY7o7/HJZ6qn7jTOKcC8pzHCvI+GgqR4VlI6O5mS6Swzt5RWURmGZllF5vr88U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csggK5j6; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csggK5j6"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43b7e186a0cso2946415fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942661; x=1789547461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=csggK5j6a1Hpp6vJPgctXds4Hzg921R8zHgTNUqrOD5zC8DVA0LVKo/gJsTEQVPCK9
         pDpmxjiy8OCZzG4/nsqRjzsSoFw2vUciZBnGE/OWDhxfgYcSpYTdus+xTXTI2/pkbujA
         8Nm+mrsa3THA1TtaT0LwIW1dam4y7FzhT206SyRr5w9vEzNWMWh6oGDpKWMCUCFXx9ml
         Kkrnlai5vvGtZbcyDazrkckVLnsk+nAqiKUMQ6FyFZJRtUDjt1l4DEYDweK5H/s+m+Ny
         bHDjAR+4FrSx9V9Epz2SWzc5dhCmAd/SnRN6xWJTzlxwLuBzJhTUWLqRZRFMX96/OaEV
         uF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942661; x=1789547461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=QGFfx+/Z0Z7YYFgWSGwNvWjF6jIwt79s+XSeHecopxIX+ZlhOMDH2TWpoI69GuYpOe
         xDV0eTQL5TnuBVy/RFn0riuq52PJ2bRwtfkbpuUkvNYL7ye8oSqxZRvL1WEltWUrhOgN
         Dup8XKhp6vtjQSJQcq6/U2rsNExruMdkTebTwSxH7m7iE6D01Fpmvb96tUX0Lm53pnih
         c8PUc2ts+udAkznrVSJdXHtfJ4W9ysJIT+iAZE9hQL0WWzi//kQxJlq9d5jDI8e1n1mQ
         0k/X9ztF5iHpBh1u7R4OOwg7sntotzmExhDi0raWVuQ5BJbDOkn0uOMrzdBaN7CrSfKb
         cIvg==
X-Forwarded-Encrypted: i=1; AKwUvBx5u7Rm2qcM9AzD253VMSVHjIDeyaAbSehDkQdlLOcuYG3Hk0EJHu3ptpxeaHOyXc8fgADHcPKtY1iwV/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kbFdRhqCFSDIphYX5Kkb5kAhhuFuV/waLqjfqp/jNWZHSZjHjA
	hY1NA/QXnKVgmfO4XsRbS3q8ph4ZgkiDi1HNGG/7SFWjhly4O9aJe7p4
X-Gm-Gg: AYBFou1I6sS3I9dMdXji2KLiTVsTb8P4sHK7Tln9d8gpbYGwy4jaK+TGnH2o9S8Hpl8
	QDc/ehqM0ggG3AZyOj4w3Vyx9JLwVF+GCnvnrfJPHxXU97ZuID6q00ExWSJb4Amfil9BUG7FJbU
	t0MQBzBpzoMdSD5t5MsTsHToA9FAVcLR5VHM0UW18BGy5iaVP3Aq+sof7oWYjehyyM8bNDExcsZ
	aWJJ4uMaahKe+cn+7oNXRQnIPXEodOAC+g+/Ft+RhXb8KstClzSxWaM1Is8c5K7fyy3JciR3rjs
	d0bb9GhcYBvCLZ5G5FfjIvZCh5sQiK79fDwsP6jvXhVw+GnzMaAYdB6S+g9lEz6NnytXZHAT/5C
	c2Q/Bk+Ou908sbS3wSxvC2PnOb9C2R8dnd4ez7jM/1ecJ/jae7jGF6GXApDTwDR/OMbfewZ6NQe
	dXAZd7/TZXM9yu42GyRQSsHqp3kFkGCLz8kq7DDcDHMQQzzcJOC5hnVFIJtWvdQNrFl4R0MQhmg
	ScNDGBy0EyoAf3sdZSELrLhIq2reMzWiNtQ26CImA1NLU7dCvfbb3hikaAZaBlzHuEEOTuOb32B
	oSYDA2f28Mg28TubInZWuqNuj3geXVQKSNWRa/ogT0A8SF9vL1xhPkNb2q24KWRdF2xtC7sj5PP
	NKG0t/bCTqEnE1gANlEVIn80P+LuD
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id 006d021491bc7-6b6fa7e183amr19522399eaf.3.1788942660818;
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:39 -0600
Subject: [PATCH v3 06/15] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-6-838cb0ba1547@gmail.com>
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7081df77f63e..545da54b8908 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1831,15 +1831,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

