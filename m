Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775B3B8BDB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122353; cv=none; b=i4/jL4V2Wv54Qn7sKEr5xK3P2TiZ+rOIndcIGahfa/iTSULUn8F9i+jpks7hGWkJNv/OEYpb5GzmRhKogc5VoCaINe8HtEZFPDYeczIgNYt2vW+euIQnCJ0isRq/e2QoQAp9C0n2aolxsrAyiPeZC/Sbru9ilkx2IvwqFtBSB1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122353; c=relaxed/simple;
	bh=8gBZUPMs/8ybH7J2DLSL0LxVyDkr8YFuS4UrXkubECQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2FvvcOh1l5/45eGPiiXa/BDBaFkvR+yU3rf2g/QaL5huBriJgRZHhCIRqEwmb6wAARp4zW8qkUPYk9pVRu8wW3fdKI3F1HjZMqeBFfOD2SBe08HexRyCfsv2k574GvCGarRqQYfP85DXkorpxRZ2YOR/0WjPPg/a2bO9k26Hwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIIj4rOj; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIIj4rOj"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82478760557so2035373a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122350; x=1792727150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=mIIj4rOjM4CJMqUqlR0aRqbv8BoGRpGNm0LkkjC4+J42sxkazljg2vM9Fng3HqVoyC
         /lzF+zz39ODz7R4rnVgEeqvmL3L0Vb3qPauIegsUok5s/yuDVnULb9V50KnZz9KcPTw+
         DgLC7s5G6kHTrS1iQWbXgCcLELtrt1bGp9NAYZPUbKwAzZL7yeSVT+V2xYe0/vBQS6Qp
         1TQYj7W+DyluqX6pF3lrqocW74t+tXeSQQDMKL9rLPvt6gV5Z8NS2Fh8AqbIa8AyeMZ5
         rcZUey31ixbo3n9EdqR6K1duCL0hGf2BKJMiIWV2oTjYLmOk5MtID0kpJvvBNoXwN7i/
         5w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122350; x=1792727150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=ln5tK3rSQhYfRd/1y08WUVR2FM4NsrXoOf+NTUhRWVdb4pQH1E5W7m8AhyxNXKkvLr
         bAWMm3DanlwukklN3Al7omC4JpDUJWqOkHaTzIPLqSYSK/8xnkpu1I1lIfBBZFDlFEWS
         MNkOLTUq2ldT+IXj+G+3ZYk5PDdotvGyOT3B+KXWNuK5Ls+uT1bCuwAJy0m8HZMhcSIc
         OTm6fPLOBGIW/GEvOdT2wVHFVWmS+yE+zqUNX+lFITbGbXmO4lFpLKsAXu3Jps4JVb0F
         aSKedQb39b64s08Kzuda1K/p6jqstmCMHemxwK9JKSjGQdlpqlu0ddt0zp9jv0C3dGDL
         pggw==
X-Forwarded-Encrypted: i=1; AKwUvByFCZu9LsoQmqK6kDiBcArTJh8d514dXP4bWtZQYuyUFGn7isoNYTNXA4+i0EjhHgw3O8fKO3g7zisQJ2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpd8GKvpWRVzEUrBGZG3gEb9cHn/NoJHCnvn4a6hd83awYcNr2
	5yCYJNC2b7JeyISPSYlqrlPbZKbNFrBeZVebr3jKIkv2NKwbbRNrqqQV
X-Gm-Gg: AYBFou00/GYx1MNs88OZSn/3uR0fob6rSbAUr3Kf8xmW974eZz0ZlwTavSNqefyT1gf
	yKEvf1YCbq7t1R/Rll2KiLpIZsAEAuMJrp5LjWrlsHb5PK0s/3n9LnKfz8wxnpUrsyT0DDCklvo
	5E3q9UWCVlzC9oKLyHzQ38i/v3pxSpVsGdVQm2eU+tMIEV0478pze14flGXbQpNfKeaMG2K4cNM
	Vw0KplkZiq8wI5NozrJnewpYOmM2Oq/7PowIuUhrP5GK6mTptzLJZUIaOunYqdP66qqb8kz0LDW
	x1h0qUHdB+bw19aHG2sZUqWkla2Dw0DWbR6VlysBrY8a5GmcP2myU7MBJ9hTunLHoAoMCVdTVOx
	jnqqUk5oSZrfv0CJ4051fD/csX6tV2sroIZdDLAxWBG5LWpfaYQugGgCHYhHJynsGrfz+UO+hw7
	w9UrI9dAvdqUu2d3r1n291FEEZfU/Lh+mFfHFfep41K/h+sRLW+i5ezHJ3qz5Rt7BtNhj+5bj8b
	9tnZnR5kT1BomxeRVDUGWQAwyueCAFDoTIlCyHKioBYUOxJ2/njOvTImq7V15PPIFmTtez8M0Vn
	DO3o1KMMVACQJwoiP5RnjTkdLulG4lchV5b5zy+eHi9q7XTYOl1lGgMgYY9tvLM2wWBwmbWs5GH
	1AZ5sIMJiWRi+nK3q4L72Sw==
X-Received: by 2002:a05:6830:640d:b0:804:ca33:4aff with SMTP id 46e09a7af769-83094e783f6mr19887903a34.9.1792122350229;
        Thu, 15 Oct 2026 20:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:28 -0600
Subject: [PATCH v8 13/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-13-8ba4881fbee8@gmail.com>
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 105374e93b37..dfb2a64c6b50 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1620,7 +1620,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

