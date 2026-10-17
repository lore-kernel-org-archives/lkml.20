Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28406493633
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266389; cv=none; b=rCvPpjNXEw8qH+2Jf/krger7vZU/9nL7lGYFFjvxNzH55wDQHbZpvWNj59t7m9YNVvS27JRaB8ThByKUH1PWrT/oy5j4cbUHNqN5U1z4+h+tMZI1XMOUkywo87W8eYber9dontIMztxvbWJI/8W44jQqZ8gxnkzEOjtc/KdadZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266389; c=relaxed/simple;
	bh=dbYKQMzyNYaKHf5LoY3DE8dfg/ieSUwcZADEtitOIW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRiSpAjWr7s2UEz1Hq3eI1OKgOVptb1IhLb2iQcHxX4jdx4SPx9EZuHhgWWg5dfVu9lo57dcJFsyyIc2EXF5fWI/aP3ndA9/POplHCkdHSpOvX38ufZRguzokRQX/0qB3INaMnVjWNcAYF4lxOuVfYSRQPXZCeIiMfUTpH3P2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPj/qA73; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPj/qA73"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8479f46ecd8so67494a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266384; x=1792871184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=HPj/qA73T+1uSp6oI8lX1ISlM66YZOlJrPwggR9OljbQ3U/Vrj5a1CS+bbyPc35MMh
         AcrG+j5Av6wpUcRF+wR7k3ZsA9whqR/6IOhcoW/gkUNHfFpHfDuP9dnLlHCiwQqZqkWl
         oNPxpoXaLakU0swWjqzeITeQ8qJBu2kwDrKgNxPQPOwgveSXQI4leOwtPKBnlOSVTSVI
         hrqe6daLfTnLTBdy4LuvbIziYgNyxHqhce8eCv+zBl0HXgFXT/EbP228alJRMYsCsMxR
         8IvW4FKUnPRNTgDL3hoGOfCnxgL6gEYdY7C4z/KYjgCLt7uxfeiCibpagfPmTw8C/rtY
         NFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266384; x=1792871184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=CBD5KKJX8VnbgqN2IoLXAA9TrxAIXJiBvpP8SzzzcCIPQtylguz5MeCPFgNZkjLQrZ
         pr9N/oYL1zSpdR3eW+r2WGEDIInnUwGrnuDzRmgT965CXoDYc3dnKP2I4tPL9RmkIg6w
         xeZtMu9a+Gj2g7g95KHtGw+yEz5WrrPgDy9tgpRLOZ2ExSy33pXuS/H4d1L0SXmbYtaC
         MdBJNQQaMVnHounA5hpdB8vago2EAGAEx5bzUOL5ldeonI0RgDGv+6HLWceRIoKt84AZ
         zx2aOUiJMqHwUg7/JUFL7oCKSsEPwtenp3q37ZflnGqQQNyAyxOyNXMBI85aNPcfl0em
         9rdQ==
X-Forwarded-Encrypted: i=1; AKwUvBytKg1M7Ci2/MynD/vzH3J0V5Nm/g2RzZwLQ1xOjYaWI6I4EQ5BcQ1dp4Uj4AbrLyuC5ayX5vudTtO9Uj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGd5MNSCKvYMsQuDVg3ioPEdkdk/4lfVUihvA18SfH29OyEV8C
	uja5W12bnb3EDStOjg49wZwVNa+Ey1dCJ1F6YRQ/PeTJ54+bpkMQQbTTgn4wEufI
X-Gm-Gg: AYBFou2D6P93xH14/ONziww6r2Gwvr8QjAEktPZG6RxJ/hXzKsfbYoawqza423IrHwW
	kmxfwUPnxYl7R4RSppeZv9kQCN1VzD2FMSCOKiE5tplnlj4wjnxRhBNaN6km5WLcvWoCQCqp1HA
	y+WdcjePtUPdDd9lUONOElX/ayRlabRPG+HeCQb+tyITrqrrAYzmV8RCv9I7JENYZbS35m6v6XW
	bvjZVzv7TDNVYkzFhCHWcTs75/rnagr0OvWmEnGNB4oe5UqqpaMHh7sqk1wVDgJHzi32qjSddZX
	AhR69wDb+tDMQq7ALfjQQcn/oEtjSeXoDM06tT2z1YhpT2oPwFLPp2jZwrKFrZ11GW6kZCYIyZ+
	8LKm1ldfNJHMkbrTk8snRmZ4he7rE5LiYwQpKgTGCihTC0XVQO2vRyK8k58HZUFPumjA8V9MPWj
	VrOkPqKXTGGZjdDf9CzqAASqk8bjqofAGWlGnrMGeGvPMiUvfMHzzWwCx/A6qalOBzjsML6VTys
	o1fHQ+xtd5E5SX/DqVZFrr4cNLbldgEgGJ3feV9f8jtkNta6DTC+VO8kGgyn7h7CC6D1i9ByCBb
	JOgkunjlfwRfJ5ZI/onEeLyVVUEZsoQb8rHAYMWIkeQpDimwBiSPlepHlU7CLFx7XOw/G50T0d9
	Wki1qYuLW1uODQQXknUONRMDtpBMALPg=
X-Received: by 2002:a05:6808:ec2:b0:503:aaf8:ef12 with SMTP id 5614622812f47-53ccfbb22ecmr2554952b6e.34.1792266383632;
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:02 -0600
Subject: [PATCH v9 07/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-7-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1db6ee18594a..22cc8998d49c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,7 +1120,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

