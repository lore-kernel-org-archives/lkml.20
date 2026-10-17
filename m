Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3542048E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266376; cv=none; b=TxoKiazK/fjxfoafYLoTJ9BZuE76DA2amxHOfA5KjwF1Vj80pRbG0hbTgyTMQfDHPNqrWMb2uaN7MJGSOqgLlA8ZxdIycW+8oaVCJ3nFSh/C3wC65it5BsdHKxxvCsRPYraZvr1oB5+nzqnFYe3GN//Vaqy8vrsau5gFBu9+Z2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266376; c=relaxed/simple;
	bh=mN53hNOFiAzhWVgJjfpGtTS1jmZz/HpF/K3uG0lAfxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elIKozl5wS+3Z4l3CfsxxTh8eLXqnr1v3NYb4Q2O9XsgaW/U4uqm3e1l2AHUTUjqZcP3/4rxJR9raZJiv3+uxMwX8fNYikD5UT/z7quTTImL3FM8M9mH27sK790KHfILX8KUEzrc0r6YmKaQhSievAg8ukqvFz/bJrwQY+UOEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed7NX3ij; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed7NX3ij"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4d7034a99a9so619877b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266374; x=1792871174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=Ed7NX3ijYnk6YNBTLc97CquhQS7Uh2Em+4XiRnvER5C3XSAiKdV3OCpZaTjaKxq6dX
         GI5ABajnXlmy83/RTJtRQN1ocIxKxE7MkndpXx2j8y/kBLOo9KT2vkmbXk/m7pLEmciX
         /mWtPivQ4n9ZPA/4buV5lCpf5fmKC4uOJokxAltdDZo2BLT16keCLcg3ha25MI5bY2+1
         sexGlgiKArIbGIOTwXPehQq8+tITuiSrloTHSQHlFuxjnVXZRhdr9aHfow992fHSkF5e
         AzXG3JHx3EzZ1Y+uHv6nXx9Et3+yLoohzaTYX6b8JnPtDU85sisZJVZXpgylaQkiRy5n
         9Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266374; x=1792871174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=ciMnbuIPuUjbNpbIHDdN7devXfnD8sDkaATgkB50hxZrpGGltEYQkAve+vLnFVErLX
         YbaEkKQMP0hGsnppEloRXZekZXjHIGL787HLNshCnVn5qv7AOKp6V8R/Ycm2r81RXU3m
         UavR9Wd0KKmLyiw8Mm0JfrXL8KdhlhDDR2o4n/4Bl8eRgNaLJMIlv1XWlEt4ijwTaHzg
         bd41t0gY+V041kBnDoLNfSaF8cc/x4kqwM0TH6StFKWa3Nlw6CWlrua4QZw9YZBkckDt
         zY3uqnTV5BfCFgpKSlIFRs3G6BkxC9/Yw+G/YGKW6NXdZFv+l5kUz5H/xPG/vTW9HkJC
         NvAA==
X-Forwarded-Encrypted: i=1; AKwUvBwZnPMRB4XKFKNiuEUVeYTJeiuzBF8nlIiMqDfXtNGMjNqn4lcrbJveWkyno5LuLVC4oQ1DUZ81V3HPa0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMG53o6DVLOE/Ocgq75CS7izpHi444R+Kb/PS2zoM9vzTJTCb2
	aPFSRf/Yqyb0u62sXnkt8Lk3SmXgunEPTB6k4W6KRYKj6rPqB1gm8kVJ
X-Gm-Gg: AYBFou2WjpxicBbVeC0TDxmTv+QN5V04bm8JkoM2QoHM5mw2qQioiCKZiC9AcspnRFp
	oerwOtG+QcWFtdJzg3+N0e/oLCPKPQkBaFHlAb6++Naipi9TpPMNYFucLWeUp+41zFFphgTRcYV
	RUhK6Uw4byDyCy53r6Un7drbVvfcJTHDrrqyZB/f9UgQauTxV9iogJDO2D2DEfJr6qnAPiX4xfD
	WXlPQDLSQQqL3oGJW4a02jO0YFexeff2977MKHMXf5P9CR7B7hJCQI7Od/LqqlXr5ELNDjkX7nT
	7cEfSiziG4iw7PFW4Qc4tbjesAMHSel5L7C9CqXasjhio0zPJzJ0bTiUVXoQr9pnQIIYrxx/dIh
	7DgPUVJkoitn8oMI2bRZhVNhN1FMDA3UhiEyMaZE8HWaYRbIu38JS3IomU/IPAUYBFSX/XfMSd7
	cqczHhVzSqSlEH8Axo1a/qtbr+hKDOSgGoqhRcNRX0lFuB+E63u1ti50h5Gd/i7EaoPskO9lTKg
	oBw7of7L9BBPLk6Wp+POPG6Jc94HG9F9vCg7GTAiYBfrQ0gIKTHNO/8/m+872mwSKqGla68+2i+
	reg3PHH5+TglUK+CSdvCZ1yCJtnVx6B1ZobAKPuSbbtB5AbnXY+q9vXqYhnSNv2CEzKdRP0q2T+
	cYWIWtp3mRhqWVeNtrjDG
X-Received: by 2002:a05:6808:30a1:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-53ccaf1dc47mr3423128b6e.18.1792266373854;
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:57 -0600
Subject: [PATCH v9 02/18] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-2-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..bd2193d7259d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2230,6 +2230,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0

