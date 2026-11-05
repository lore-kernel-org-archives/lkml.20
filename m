Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904960;
	b=46p41nEp8w+jXITtvXoKHX6CtX4LfwFOex5TuBzXbEvdJ0cuYXWGnTX57gwyKMc3Zfgc
	 cCj1BcFiMzGQJ84YtAVO8OQ6I+5tLtB8wXW6HqoAifQNZsy6680Gh79ZGYI/wk+8zo4D5
	 K3pKVG6PLjuqOqAHSgcKNMJVR4F6/CZQGKZYw5/jVqA3iQqGlGa2/d2/PDCTCw12+Qhow
	 1zt/AySa5hFeYIRvt86aXJ6L+dVbfGsrvtaHG67eWaZJoIFhdvXDi5AV3bisU9Deu+hK+
	 HA5YDbuhzm+C5FNdwkeWWp8ee8FvLI/W0MNy1nt70o8ZbIBqISxd5wfpHojI4sQKwVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
	b=0xSho0uUJ+p2NibFSRzXXAoE+NouefQPaFsvl/CSc29gnFa6t5ZOmDmtYBz2at1kZkgd
	 wIm82YhLg1dLm3uyoMuPGIM/iGozaJWfQzFmESQO46Eu+ymv6vSy1Ivt5Iv0URzU7jNVA
	 5RUZyqvOfGoM2JBp88jpb+4fpn8vCMDI6fC9D1tnweJFpNuzgPMu/38pB3V07Ot6lzoiB
	 gbH35tcKak2S5nCMbDU9oOYVb7QIUc6rmsVImcbLzA+DP6SPKDFIIrgB/2NFinQa4QmEk
	 b5IGiQhTa+LSQVpFMTEDDrrW7bh9zsOVsIbeBl4zU6x7vbyJ0LztGayPJkxmXC0CGgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DditZOAp;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091F6082BE9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D091F6082BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DditZOAp
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df0b02fe91so632050eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904959; x=1794509759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
        b=DditZOAp9Oa1DZD5AVzzsep4fe9OmK0Igum7b2A1uLgpHjJfBNf9R4+ShCkoao/aUZ
         QfQlSpsgJDt4qnyTPpXkCQEtJmRBqVzmSK4Uo3h+k/etVZhxu+F8jI3pYXZCgfPrARCq
         6b7v6kR1uZLWZ1oqM68eDBLyx5Qp5XDxooz9yO3mcTkl9RHWjvGieGyATssWmmvUahSm
         MPdaxy5diwBnU1mjolMpP3w5FDBDCvniFMxV+AhCfKvrdFt5ZpEMKt3opODkdmHL1Pke
         AdoFu0cclF+xbejhc/TuLWpeRh4Gf9viw9IiLfAbT84hKJfaQiO8LmyBX8DZGTQDmZzv
         a6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904959; x=1794509759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
        b=iRtyYbGy1e0LmVh7ijjDtx5Af7Msyo7MrGFb1oWQHjD2eR95LQaPfc6NViQxlGblsF
         qeZDyYOZ+wBB/0XrbNzdIz4BkQo1e5EKnuGZlM68Qmmsc3rBS9rMHIfkrk7Ae9iBeC5U
         mE8rPJmUsq/mJsGPbnRe+G5xrl0c9MwaN7Z2mADOBKZK1RAw3ZNXacEQlmW28hUExdqn
         a7iDVv6V/CxPuhDqSVSjHhGnB8o2vetYv/9TAKWe1ykW7anfKidXfUQl4P9t5N3DvDgD
         xjHeoxBPgMoHEF40CniBtZ2xhPQRnv0KD3Zu65WJ7hlnw28n6OwkLAN/bTL6SlA+53MN
         UiZA==
X-Forwarded-Encrypted: i=1; AKwUvBylgLRwqVzv5B7bLiRS69e/T0+olsrs9EDTlJ3c/1E1pZwmT/rawXIXNVpiC/hUlM9HdSB5nqP1fQWbxmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YWAGpJEKjld8n1ylOlMKL8sPzBYujQyEcVZWEAp1pNGcZ+6Jp
	Ox7fSw/523FtMb4vjAIxX+CH7ivrb8hAsIxby9mjMwWCLCVrOMs6ZgXb
X-Gm-Gg: AYBFou0/Sew/hhpimiDZsRVO8FBQM0NUVBsrK59YGJYtJp54yoJ1p9PKFwZTmmKxACS
	fLd+2VTJLSLOqHkrGNuaeqxXF5KFGV6MQ7U3iOJi4wPayMzMTmWfuZzeBzFTUs5GJuYXlg2BPqb
	VyK183dKpI5hJ/I3wR29BrQLXnOuXE9xDfBKh4dGMDST2+TZorjAvK7sLQpv38dnNUaLcHBQOfJ
	AGLD9I6T1mXYbIAKVSYCiwamWqx2ghFnhP/y6zx1CPbfAs2T9gXmdjvMqQIWO4vMHSXp3cHk2P/
	0DdjCmfcPAeaKWy3AbIq3b3/Ln2YNhUgSNNNAiK1ZAOtTq/eSi/ZnLWfRoc5SMX8nxvdvsDaTX3
	C/JySmSeoFTTNKdI+hPE7dXmf4pbS/wJGfldXK1rAGOeYPdbzgQeX6zaqS+dnDx95KOffGGN8bA
	GmqkR5p9DrqZUrN1gGvGqFE/BkIdPfCwiav8Nv0jpNfFhTLoiSUMGbOWwk1WYvLeU1eRdW2qOhE
	0+EGYdoru5cA72tywf+su47fqqV09Z7j7TSyiPvmLkjsam2wPHNB2FIfH/9KQogA4hTp6yprfq9
	5EK+vKhr+2uaQ1QMz87qLZiKmXQDMVELgdaa1nHgu2+5k9qcyh9OiMyqqn/CA6WZERte+X6LVty
	eutxnv8fWTloXkmmepmRCTaWTR2e+y/4so7sNnbJIfXPScJJN8w+RRYbL6Oup/6nT0t+5rZVFyD
	MwM1yjJHIUXCvACciDgG9LadrjMdVVZheRiO6Vtc86x2hKl375wDja
X-Received: by 2002:a05:6820:609:b0:70d:53f5:e5fb with SMTP id 006d021491bc7-716e7374b3cmr330726eaf.2.1793904958904;
        Thu, 05 Nov 2026 10:55:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:33 -0700
Subject: [PATCH v10 17/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-17-dca1f6ed29a8@gmail.com>
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

The H616 capabilities advertise an 8 KiB SRAM size, but the normal-command
byte counter still holds only ten bits, with zero encoding 1024 bytes.
sunxi_nfc_read_buf() and sunxi_nfc_write_buf() use the SRAM size as their
chunk limit and advance the buffer offset by the requested count. A count
above 1024 therefore transfers fewer bytes than the helpers account for.

The operation parser already splits data transfers at 1024 bytes, but the
extra-OOB helpers call the buffer helpers directly. A sufficiently large
unprotected OOB tail can thus be read or written incompletely while the
page operation returns success.

Limit each buffer transfer to both the SRAM size and the command byte
count. Share that limit with the operation parser. Existing 1 KiB SRAM
controllers retain their chunking, and larger buffers are transferred
using successive commands.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7c80f52c517d..636a04f49418 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -89,6 +89,9 @@
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
+/* Maximum byte count for a normal data-transfer command. */
+#define NFC_MAX_BYTE_COUNT	1024
+
 /* define bit use in NFC_CTL */
 #define NFC_EN			BIT(0)
 #define NFC_RESET		BIT(1)
@@ -690,7 +693,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2606,11 +2609,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 );
@@ -2620,11 +2623,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),

-- 
2.53.0

