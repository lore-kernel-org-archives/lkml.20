Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5FE3B27F4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122345; cv=none; b=ZaLhI+V10m6xR7RHH6okymEMPUnQp5AbqxXULW33X7JtXgQhkBVMpcs30VcUz7b5XMp/aqUzK2GKadvE3oEPdF7P3pIOaFThqfgdhLaltSZVCCqInBHKTLYBi4afy0MHEigHyhS8JeSgOVAlmrMgIfKQ0aBCGrqgI4izJd7rr6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122345; c=relaxed/simple;
	bh=L/2f/9mfvoIW49CSofbEAEVCbPChwciqXDpasHFoGaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrBKaWFlPvH+hzeeOgve7CYpjXbR5bFCqF87jbdamHfbNWMpY2yrSHSyNmT0wQQscJ+YEuBPP/I/iPfUTRBiXFE+TaifESBbZ/GRrOylWZ2LCfOaMijVx3VGuBR4YX7COAyi9ruqziLvVsmuPT9193qts+LAsEXYQX5ftYTyeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnonnDY+; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnonnDY+"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6deb848ddd7so2076833eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122342; x=1792727142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=;
        b=VnonnDY+4WaAiVR/aQPvZBxb2oHC9w/PTEIl/JGRpxfHEkKa5H2xFWbNCuX3rhUbPO
         7AOuTIW74HOO0px0xnDhGsA7f+KUo+0WrVRZS94nJFLAUVOPk5Ar9zs4mCpsJP7Addiu
         Rbh1bgm07LndDgH4edOMINQdi/qgd+cFCIKtD5eToai6Z8qDa+4t41DRi8XKMgfkvOp3
         hkphOrtunKXTJ5Heqv7J3VVAof9lHLFGB0KNXbwjGkqrcTFYLmrYxdXIhH6M1vo3zdzR
         K4oayiqPnkhNkOkMupV4c//o2AfHDE2szI8AUHL2TVNpcx2dljwGmbk7Wb6ksTvF5pwY
         yanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122342; x=1792727142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=;
        b=Mc8N+KSjXociGW62/COBhmp05gqK8wBwUL5JEUvKo74pdPR1zGWdT2tLvwHlmcdpz9
         vTHQsSVIVk9j8IGpJRMq17UKrmmHmXPqo5rLkZlMCNcuDkD9+VJX3LRM+CCtdGj/eRg+
         43f+NAC3BIn8fmkI4eCJWDqPWRuGIwyEVdKNRPES3IvUzSVzYs5oq1bcuAWtRXaLhlRd
         chozQPHi+5Csh3VOFG9hmV9sIDZXBXk3lNLVi3Y/c9hwQe5mxjNXbjurHapsqas9uA20
         gLC5cGqEy7greyrI+eHVjJnxrGv7UEdtOUhkgDX/7T2KTYFEfhEE1h4nl5Cj3pHpOR3z
         20PA==
X-Forwarded-Encrypted: i=1; AKwUvBxD4Q3TwDVooZju2GvI+qJZVi9AcMhWuvkkwCiBGVMg1HQNg/X7Iejwlt05KlUZhy6zbxkr9T42RS8Gb9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1OWoY2MlSlU8r9zFhtcfpO4i+4lkey2BaXiw4Lf8MeLi7kjXq
	wkcg0YoTsF7ZhQWLQA9rFj6G0+SkOI6WWb8cEm5kvJPBIfVQ+R1pz5Mz
X-Gm-Gg: AYBFou2cG08WCkC8wEU2YfoSRKX2RAH4LZHgOj7VOE1kHzVuqPB++qLxhuY0OUrh3e2
	kgBszbXsTFwp0hYKnee84eAvwPdqZGxS+NLvMpo+Wcb+zdlNyM6ztGOVMV1B8MzXeCCXvtcj5ft
	ew6FiJY3kfyeZQB1oO/JWwop4tv7AUB+X5lfm7KNGv4ZDXLykzQVMTwcM3M8bhDcCoXHckzrQ/4
	Bbjxfhw6KVQNGDAsUcPoq3oX8hbt4bKpiICYT5U4/BdT718V6F3VyceWt2V8u216LSN09ciWhJ5
	71yfIYYS+bq/5QL5aZ2cS+IoXpAROCIiw2vHmB4Bp+ik8UpaxfKRkPNCY2rMGVvwqc1dAhsZGlJ
	ztojfZ692T2jcjDNaFuH93bPu9JyyRzX8eqJA/q0XT2KB39xrqKT2hAjzNSQNdYZB9mtsgzrMO7
	KnnpvZ3Z293z0nMq0vrgZQc+EBh/158VHRflMt7RiZUv1+20mUQDh5U5axIlk8XyfePXSYsJmDj
	MffMwuoB9ZY1vysN42hLZNkhXs1eFMJBy4F/ql8An/4sVzbXZwcJoLwvikThtg/QTpOfYzxkIG5
	ymYboUTkE3mdCK2GFCf+WJp2Zzhmi4S/dnb53paRmlOE0prypvTViOsoYlZ/loz85CMOMIS4rlf
	nUjGdW24kep5hJEbJ8ctlqn8uWkgnAzbZ
X-Received: by 2002:a05:6820:4c14:b0:6c8:fb02:527e with SMTP id 006d021491bc7-6ef102aa365mr15532787eaf.39.1792122342481;
        Thu, 15 Oct 2026 20:45:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:24 -0600
Subject: [PATCH v8 09/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-9-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index fcb017f048db..9f03ba22b4b7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1832,15 +1832,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

