Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE23B14A1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122343; cv=none; b=d6iltMfz3o2OGlgCP5r9uHYC6WIgMwWeddrLTz/00RI2gIGT4Dgh2Tb3HJzVcPVrqtfnCinpYUC/5Amj7x9JXcJGKveg3C2ZlZcKz6jvTQpKI/mebP2PfxrEWAI+mKv4PiUtNqrmi1vfC9x/ZHYs93yoYIr9TqAGFqrRAZt7k/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122343; c=relaxed/simple;
	bh=H5TfgRr2Bv5tbABipMunxtVTh9+p1lSGxQCm++Vk00I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXZTG8FvMbSdcOXFB4wPZbZ1PGaO313HgD67zaozUUVVWS0/BFGpEWI8K9D4ARY7bpHkCvzIyfLohKy6zs7X3/PyU5ZW8GxeXq05GqU/JyLCQoAXBnW5BrJKxmQq5x2ZeR/0ggsWvU2Ko2zg279TGWAc6AbQIdzLXcbNpikd1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3vFNfRG; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3vFNfRG"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-833e671ee9fso4328543a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122339; x=1792727139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=;
        b=q3vFNfRG7xTLmtktsnhlaQHEfIly95r4b7oB29/2d/iUFMQQqd+Ii+PIjT8FANNuOm
         mFbMoN4BSIohWWDZ97lS/Q6tgfoN0IEIaM/G6kafJed+ynpRo1vocHOPQe0aH7rv230H
         7JrXORnOlkXy8HpXCAdh3c3HTqnv3d/xHPshtVNKcUKNDZOxbpiownaqBRGNUPl+6TxV
         xcdP/bpz6wEbWqJtRrz+NYLiNavjbpPYewqa9GsQwI/ojaowehtgqve/6b1M1o9pZaUn
         1AIlRsckjaObROBni74LyItmaBvSVAiSfx2dpJYMLOeyOG//AFd6f/LAGF8BpMVWyZUX
         XkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122339; x=1792727139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=;
        b=SGMlewKwJ+i/3Ec1YDvB+SXncPg4Ep8aByGjHKU7AHLuOwhKbAtteKTXBfbj5jva99
         OMWOAx7kFg+IiCIVHbKal2lOmg7qkBodCsJOiV9GCx1/wd9ABo07av9XZF+3P8sThyy5
         RGUXDuL/kjjLSsFoMQVPr/DutgRvnZMAPm6eRLKfyJn43YgFAWk0XClSrEYE6D86L0xC
         GW7TXgyr8RFRLoLK1yFL+WvbUcMoQvYUIvK+kWfnLfW42RRa93PmPfNndDO/ZFA8nvI9
         wRqp5GnqBgx7H1DAjuH7dDPBtzsE6koLk/2aecBNmMSEvPmlqatvknpfOKcl+I0GY2rB
         LWFg==
X-Forwarded-Encrypted: i=1; AKwUvBwNGNoAs8OGnXnYCOt2l5w49a2M1K8h2grIAjABSpsiApEKXVYVlpd5iaKTyM0MFcB6qRQkkm5dlAzWO9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3HP1F2ezYiiVUtZD6gYqejTVk5qD2/NFU5dmcRmjEHfoe3Kx+
	HatXHWQAtE2Cyl3JncqF0d/Ibymn+S1aOJtrck/M7xq1sf9rr3Qh4XKN
X-Gm-Gg: AYBFou0HEmqlPpm84gFW7u84llZT5Cm3auBtk35vHpqx6P34gpFIfhFcTHLEesXa5tb
	zv5510wJm4pGX2OaN0wJZ35iR7L+dIpdIb57Lq6wzhrS/TtouT/G5poyim9MMXxNwM902LnWWIE
	6ZFF9aOagFR5g3bfdc6Cgducg0iX3nLWONBGBrVJw7yvFHDnh06+rEZHokJIPiBCKVcM1eRUAok
	mjemPN0p8tfCmXqMnchjN9PUNTBVK1pvYasXed808JqwMHoF3xLkfRvcOmkCvcmbXvrKRP1T85b
	2OYGGZDwNzj6gyplXgoCL3Sd6RIPAKaTfpmGSwwRepVBLLMZpbpWJVCBJGSaabW0VaZMorOGY1D
	RyzR64jSk1tpbBGvqb0C4wfwF1eVbJCybBOzEE88JR9nmQJwZ6f/gfe0bGVE7z8NqbnSXzKcWun
	cc7VjtFkvckzf/T2vSaf1M2Qw9vaWrtatyfFQvYOshaR0UPiTRahOTBHC8szAEhxuPWc2RWdmzg
	6VajpWFu9jjeM9AODAPDEv1teQQrJhEzMJ/INC6bPP/sbjWXIodgygd9PnrhgVJb+Yc4jltNJna
	5Ak/HieapcLbfL7PVM2lUJbmDOs42MsT2/ubYZFZP1+e+5yClc3DT3xRHQoCkbUev38BccT1SQ7
	GIz8g6Ou1gXcIzWACXXw/whQNcNZz68MZCA==
X-Received: by 2002:a05:6830:82b9:b0:822:27d6:c281 with SMTP id 46e09a7af769-83094f728ebmr20703536a34.8.1792122338629;
        Thu, 15 Oct 2026 20:45:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:22 -0600
Subject: [PATCH v8 07/17] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-7-8ba4881fbee8@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
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
index 661ced4e07de..a244d2158d76 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1219,8 +1219,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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

