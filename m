Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BE490C0B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266391; cv=none; b=uC4en6tcYt2ZiqBF97z1a0lHNM6M4nid+f/R9XAh6XkefAlLTCLGtvRsL/jf0w83iGBb0QJ0chaMZzC/OUXDtHdX6epFGk3Gg6jINnfpxCTU1yZhuiK+a/zZIvoeyIVCMKHV82YNWJfOdg0+MoenBYyJgQtXexqYm++81FOviA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266391; c=relaxed/simple;
	bh=Gr8R6NeJ/RQhMXjnXQ9SPScO5ueGFcDbXLJ+snnHayc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0LHUWuQiQ8vIqytv1UgRo9DPRO1aP1kxe2hUgO65w6sKnbXtNyWSrw+3pNd21WcLUqLn48QH699laiSIF1sRF3TaCCUfxhuZr8rABPibN5nlkDFYbSmyF7+GhRj3mrsuV2rYnxBw7+FKh0u1HUnAPsqYQIkx6xJobnESepwwgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIYFjPty; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIYFjPty"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-451a49abd8aso1246935fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266386; x=1792871186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=mIYFjPty38OYk1rlO9OZKZ+e4xPY+/ARO6ZPcRFlPI9BdZ1lEsMyaB+TrRs25MvejC
         NI3Sjj1VzB5cZjB3QuEpUr6SGnCstTa2sjevXMYOd7ls9/kv1MEGSTOycZOffXkS0Etm
         p9a/r++LED766d8KgB4o3Ve4ywxGGmv50rCGJ6ZYgGVp2+CfQINkY97XlN06XCs6XHg4
         X/XcoPYzbapz36o9+cbkLcdzkUqxqF7K2s9f0CLWQzR/GBrHsSgjT55jOFcmPKJ0Qc7O
         ythVjq+NgQmxG5aut1jNkn795KjMcNJ93pNEVQL8we08JChW168eI63cd91OUeVHafBE
         YSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266386; x=1792871186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=elRE8ZTLEcaqT/CKuDtYVArphbNziQqWtPLSM/v69AaJlaKX2hcPPyZptk8tYNIe/5
         wqu58BoVzMj8deF/e4lacxmhijRQEZ1qL57yDeH7kLFy5A4EhsdffAyQ7+WZq9Y5o+Mu
         fEiuncRIHWBaq7hwv5CHvqH5369ZEG6+WD+5iSnKueKFTWCbnu06Wy8/DSx8sP8Qt0aK
         GdKUT+rTxBvLvZEOcYxc81/s3s/cssERxi6LZaG4FY3kdcl1tyTEyop2ZpzJpgeTpPLU
         WbIUCblRGnj0V2EC5XwY+EZcMzFdopgQpvK08SFT/MgG8289dWgYp0hV4KXT2zD+azFw
         tKng==
X-Forwarded-Encrypted: i=1; AKwUvBxLZyJS31WfCs/GYFlTjiMNwu5HuQQzSnNKsrPCY0PGgqQkHHd+93eChYqp2ZCJUqVDtQYKR1EufDD5qZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiWpBEEpB9AIi4o6S7Kksh1RLLQwnDryMKRQEQ19iDIec4nmEQ
	jmHudZ2UQpOA4j1xHwUo+QGfkOE02YKC7qqIRrdqgMPEp/y8blJBoFES
X-Gm-Gg: AYBFou0MhaXUPnWMrTg+1UXU/6U5BGpfes9ttoFqSYGcJPyfNp842/PV+/e+qh1oK4O
	oT1FpAoXBhtFU7e3nPbpZ3cOLJL0StshwfdRupe5H4szTwbbazUzcb+pdTeW2YzEidozpCKe0kj
	NJhkT8MRtKckXuIIfIY199YHLSby2WHlEQGcxAIbThB43PN+6KkYfZKe4qGoh+v+0zP3XgglEtO
	7BwsgN8FKFFzV6dFFOYbpy5iZPAz4hEddnbn2Zv2TOZmfq0BDsTEcXaIoziP8zqFbNsP+qKAqNh
	M1DiDIUmIsJuxSy2B/Lcb8DoOc/OByhj3oP1ie/sDwEd4aHYt213o1hr6OIt1Bmp36QEC88mHBV
	uc68kOdSM6rumtn0SGdmFS90sY00vxOX7veJi/wEvvsdgC88oV0euwK4ldXac2x9J9nit9aOcW1
	YJ+aCNtUEQzr4zjZxpvoQjTYuhzaOi68lIcLc9jJ4mYLyyQDpDcHQB4L64w5YsKQT8RFxg3fwmn
	Jjl76A7isJQd186leB0bBgJqU3MFm0y999EcnoH5GPNKERyYFXa2RGxHraj6Mx8AosB8z5iwPpE
	idz0kd6Ad1tXltXSyHrmpOGwbJARRLj1Ry/fsUldLl3M+dwGh9Tuf79JdmTJWWo8ozNUKP862+r
	Vvjn+7gVUN2/IViUB0e5PgqCWU5mk7HCY
X-Received: by 2002:a05:6808:5392:b0:4c0:12f3:6007 with SMTP id 5614622812f47-53cc22e2b13mr2397740b6e.4.1792266385605;
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:03 -0600
Subject: [PATCH v9 08/18] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-8-b624c09e3ee5@gmail.com>
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
index 22cc8998d49c..82af3ccad885 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1231,8 +1231,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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

