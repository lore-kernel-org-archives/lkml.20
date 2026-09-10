Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8A4AB1C7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055648; cv=none; b=YarOFW3Bi0/cuflru5nZMk4+1fMkQx3SSfi5BKP69YGpAPpNZW/LrqPJvrVWcZCzF4N1Vl0b4SagQgrlVaznlDQnEyfsvWlF9ACRqdd68BAqyYailpN6ro6M0cqSdUuK5mQHKgVoTAZczvFZe8saIjxS5R/aM+gfB1EvTylhVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055648; c=relaxed/simple;
	bh=LRKiN4ojZlaZQ3H04aZ51aaPd4VSa01LJ2VcetTK6xY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbgPZO+x03JDIRYq/CjYw1E1mnRABofqKzu9KvX/HmIr7SDahn0B8Se/iSrqzoxqewH4v+41hgAZdToVu5lnTy5jlbpjG/9V/n/+9GNAVg33s3YL7B3dpz7UYGv0hESlffKHpiu6VFaw5ZC8nrbS51UcAZwjRGORG39WHs8cPXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIRuOqJL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIRuOqJL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db710396ffso9487835ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789055645; x=1789660445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jl7790YgbMBOjnlOoriMqH8m/WMLfDdz/gkAjzom5pk=;
        b=gIRuOqJLGcTP8Qv9fnTshUdlkngLjJ4QlVpP9PsSC8hbTN52hstiCgZCFk7LUOe9WW
         R3oZ/iBGCBP5dceHOG8Jfr88R9E5oOYWZ1J4DcBsFHyOGMHy7bb5nIxs00N0WFGr1tHN
         9j6hjGTxWa6GaVlTVJ07mdxCkpliT6JvlIS28qRR+v7ADVq8PhDTK9VfgFoHFcrDFE7Q
         ecFgPF2UbOq4WLLxARvmbpo5RXwBK/K5pl16Oay76uo9i/3UYvxiG7K9VALdDH684+o4
         wgqH1s1ip/TpBw0AFjfIO3/CRrqajApHOkMdvefm9rdRjZYFUejCWOSj3FvztVk0Q7hg
         WJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055645; x=1789660445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jl7790YgbMBOjnlOoriMqH8m/WMLfDdz/gkAjzom5pk=;
        b=hS/8KR2lEf+sW6x6XKWUj4rp6Th8su5M+ZJIoIFFG7fCzjGf+UMRNbysAZjE5Vj9nS
         syVHGrIdykPDg+NJgZJhCyLwoIs5BlHgnt5STbgvzdG50G1gpBroiN6hDXKWisk02kL6
         2nOVrnNPTjyftb53vmLvOvGbALO/FrEdkZIh9VJpZWWmSbRBjNoCSc1FrqFP/6vUqDmm
         ibOP6g+W6GMuctrKzkHiZJ7GJGkD9K2Rmqr6ClEPl3PTG2+J+9M8USm6s0S4OALOv3/8
         A52AnBX0E7KNI6o6PeInYjTrig1CWoZlPygcEuZvBGopvRwrYFyhWREpys6ynunb6pRa
         ++6w==
X-Forwarded-Encrypted: i=1; AKwUvBx3GG3i/7Vhfp7Q37/55DLoWqmIN465RjYC7J229Lzq4/APqjPSXJA8DBq61JDRhfVztZUQXj6aXc+nizU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfIFsmdj9ZZO6V1z8lZ7XxYfLPt9RGxEcxXy2oKgMt30nh7ZLU
	2yXN41Vhe7nCGQsm0ZmZsC2in6RZL3+NVmxUI1IrlIqELJ+llBFO3kuyqPY1AQ==
X-Gm-Gg: AYBFou3tfZjipuVIV3hJ5cbZtMZWfhusvOjehfY5LTDr79Fvb0d4lXmWA4Lvn/E3lhv
	h1Ah78hNxeIaARkL8YFxaAzICzISuXWd0YelH+T+Ln2+EG2ZAb5XVgXjtfLhOOF4DAjlz3p/UXe
	omYWigekzMiliSpcTbv3wxuLPo59DuC0r0MvzigMoibyA3Z9FPuq6aY5FHIEiCiXuDzTEBp4vcF
	+Nbs7jVerl08rcM+FT8BcwPAu3XskOTgx32NrPJFjrrjWLMM+39QyfKnos35TKVpm6oTHBS7hL+
	gbyrNMByWHBUu49l82UcSYo5diGRQFyVxyTlCADp+E6BJo2tClNdTsLrlDrDG8ed172cCaqyxVD
	fs3drRy8pSHzOonUNEEIssbRjWXOFrzenr5sL9eIzox6EZaJi8M2seB87wITmwvg+Z9GoZmAMEr
	vqsZGRAH1tJxiX3U7FcZMqwBkf+NhKajqhd/CWRqTRPfxtt+xLFmqsttOBP/iiwNjOuxa05de2r
	REOFTJk
X-Received: by 2002:a17:90b:3d81:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39d77d1752cmr6498826a91.30.1789055645401;
        Thu, 10 Sep 2026 08:54:05 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.196.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm64763657c88.5.2026.09.10.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:54:04 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH] mtd: spinand: Only touch the QE bit on chips that have one
Date: Thu, 10 Sep 2026 19:53:55 +0400
Message-Id: <20260910155355.3534491-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") spinand_init_quad_enable() is called
unconditionally and clears bit 0 of the configuration register even on
chips without SPINAND_HAS_QE_BIT. On such chips that bit can have another
meaning: on the Winbond W25N02KV it is H-DIS (Hold Disable, default 1),
and clearing it enables the /HOLD function, after which erase and program
operations silently stop taking effect on MT7986 boards.

Only program the QE bit when the chip declares SPINAND_HAS_QE_BIT, as
before.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 43bbe2629b85..9fc1512e4fe2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1781,7 +1781,7 @@ static int spinand_detect(struct spinand_device *spinand)
 static int spinand_configure_chip(struct spinand_device *spinand)
 {
 	bool odtr = false, quad_enable = false;
-	int ret;
+	int ret = 0;
 
 	if (spinand->odtr_op_templates.read_cache &&
 	    spinand->odtr_op_templates.write_cache &&
@@ -1808,16 +1808,21 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 	}
 
 try_ssdr:
+	/*
+	 * Only touch the QE bit on chips that actually have one. On other
+	 * chips bit 0 of the configuration register may have a different
+	 * meaning (e.g. H-DIS on the Winbond W25N02KV).
+	 */
 	if (spinand->flags & SPINAND_HAS_QE_BIT) {
 		if (spinand->ssdr_op_templates.read_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
 			quad_enable = true;
-	}
 
-	ret = spinand_init_quad_enable(spinand, quad_enable);
-	if (ret)
-		return ret;
+		ret = spinand_init_quad_enable(spinand, quad_enable);
+		if (ret)
+			return ret;
+	}
 
 	if (spinand->configure_chip) {
 		ret = spinand->configure_chip(spinand, SSDR);

base-commit: 21f027016b1290d13c30b198ae7a00e6b3d1d5a5
-- 
2.34.1

