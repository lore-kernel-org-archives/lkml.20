Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904957;
	b=0Ad3/+4gU7DPIHV6z5oXXiRbYz/DhaVPdVdFhXIsutK74VEaSDWc9h0dXwBBuWEHKoW+
	 3QRGCGHWvK/c9paM98uL6Ga89cE6u/+XUHYY8TQihIbsAGzqkYQgQbYjNnHhGntxse8LM
	 KE4OZoz7okzNqahBKaDfrbRr6fdUZ6xUr3JRHeG0s8+yvjNx89gZxpl0btu2b1hx36onr
	 QsiN4seBglGfvmfq3OJr4uYca3KAYsUTdL5vE5l//Z4LH5QnbIO884htmoe4ZJr/afNx0
	 /VT1or1Hn6dLFywfDxbAQLR2epi999zFLtj2KJh8QE2TOLiCyUsJXUefvrIxcfNV/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
	b=0FnPZyArZADYLtrZJE8K5Pjd9yGTnL7jj5J76CrZSgIst3xkIHUMi9BT2DJAADlEkznR
	 gDqC4MyacE6yihjpDHLcD3FKL+caDOmdjELWua2P6fiG5n6q8Ij3TY6yTQhBo6qWWCvwE
	 UxoyrDCC8v8CBGHU/GaaveKe2BZzJYeYdYsHBT376i/sSgA908IOH5pDTwj7IwZzVcf6l
	 yXc/r0tw8gl1mh8oaRbG40ux9Hv5IRQ4gzbw6JVuRnBwzhXiDU0BySKL6Lk6VkXoDIwSF
	 9w4+Glx+dIIrptAmH2PAzdfGoULkA4r0fKb6XnZtFEzNSsKOKUv9wTzHd2O7QD5LP/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrjVBdin;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE95606EE87
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE95606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrjVBdin
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6f8a519e215so1084374eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904956; x=1794509756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=OrjVBdin07U0hmKvCMZ9PMclAx9H4+yb9/A04IwZlo6oZFG5NB6iWco4v6CHg/IClY
         pIaoXTlQypSazq/H1ULpg60jyWy+B7KRZxz1QbtIHyaen7/OL/0T/r1S95pK6Y82E18N
         yL7kOJN4qP8JZp2qbHBNRM45dxXROLyqKRUJTTROMXNH8Bnb5pPW5IwnpVQmZz/77bQQ
         WKsQJ2njmA09y41Ri/qD/jjzZ3FJPfnLKnbvffsAd8d3Sdt5B8LG3PknEfGep/7HKDGH
         vp/plFStZGbyIgWPdBsakRnDF2Gj75N0yHUcdMst/7zmvTo12G5aUBrwA76Mw54noigq
         VmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904956; x=1794509756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=p7HrcnjsFWx5tJ4F8KooSj16AmRFeFZibxvx4/WuG3dF/fcq3KMlW/JE91O8RYICaw
         +V80u4T8vgA+3x3YysmYfC060PyvzUXmcFp/BNMYsodVYlLnFVTLRPCt7bJKFMcMFHWV
         AZH7p634CNcWgL6vt4pYFoaMbVKugBANeux73HshP2W94C8VvtDyviP9rztxAAyHMTmb
         mQnlW2fV/aAdW1bkLiFZwqSaGAhabPEbB7RhIjcQWNf/4JdKc37oK1ZscSF4a2oITDfU
         xReEG5Cn15+44dVC1dY1Gcz7dtPaRPZ4udILX+oeJPNINUf4gN7tq2RwU8knK4LVunFN
         vigw==
X-Forwarded-Encrypted: i=1; AKwUvBzeZUwiUsa5M4p4SyMhcJ+7xCkZfG6cscbX1zCNCrXPNs3MUlr0VBElCcpKS2smvaaL/w+WfTKWyrKPmNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XjGKOtlbUQjoRDcrK9Kngyhgt/9glJlJGx8eoBWFevmCSEC0H
	cHgo4k2zQ+z1Prc6b26EOmKzb8yijRgmhrg9euehbJyf7htsXh3ayzGX
X-Gm-Gg: AYBFou0KtFdFy+USXn1xGQcjF77fpx6SPkpDDHx95yvP725wRiHUpaCNunB09Z7tN8b
	v53QgI8MLaREBKjkGhtrmzcss8ciI9hUGjQygWlLFBT74wO75XY0Qc0mKuzL8QkYTe+tbslXgFP
	XwNq/gBteKoDEQM6v3dRrBtT0nSMkms+WP834Iqk7CM5MzJuSFzRwpKt9oNYONEEHktH5ion4sX
	GE9xSMUmW70lkhqa6dN/TqffTBHu7Bl69ImB78czR+RtsT7cxkQe2xh0bF6a+Yq1Ho4rmurxJy7
	nG0jY6JGbEdxJRGPHJ97R8PakanX56ZMuRLNlMGEfo8pBogYxmI9TQPwjoQ1if3vtAdYR9nwdVw
	3Ovf6K7L2Mv+bja2NHzK9FVc9nyVsnI2KS9gpddAoWGixKf92rwp4Fywvb7RA2BdCaswD1sQBrk
	4bH9G+fzrd+2aTfTg3et+9FfmmJnjQoX1N4jGli4bq06c4115GvYZhNfq7NImnYBjvj/1hZHyj4
	TDDbPcHvJfmkHZtx/Tx5qrQdEKOuS9eKyepejiuz6tWNkGfZjBDb6XhzKGmsCwC1vlAKAhcogFZ
	Wo7R+dTCOhUOpD9hllp/huVUtvfGQfDvRS59RtPtCmheCyPExX43R9BMyzwhyQseS8nR1T/8vvr
	oaVMKa2ghJGZqEALjil5URsTeqQim4RjPfs0Tnl85Kt/G5hF5HAfW2chFdkSZeTxhGSmrHz2CEC
	N4Sz/tJapyTb3DKtbj6NxNBzt+nZOVqm9DwWsd3Uw1OUs4DrH/Yh/Z0w==
X-Received: by 2002:a05:6820:a03:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-716e79e8336mr261121eaf.42.1793904956099;
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:31 -0700
Subject: [PATCH v10 15/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-15-dca1f6ed29a8@gmail.com>
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

nand_subop_get_num_addr_cyc() returns the number of cycles in the current
suboperation, not the end offset in the original address instruction.
Comparing that count with the start offset plus the loop index drops
cycles when the parser splits an address instruction.

For example, an instruction with ten address cycles is accepted by the
parser and split into eight cycles followed by two. The second
suboperation starts at offset eight, so the old loop sends no address
at all while reporting success.

Use the returned count as the loop bound and retain the start offset only
when indexing the original address buffer. The parser limits each
suboperation to the eight cycles supported by the address registers.

Fixes: df5057999f8c ("mtd: rawnand: sunxi: Migrate to ->exec_op()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 54377f1789a3..0b92bbe19c0a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2518,7 +2518,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0

