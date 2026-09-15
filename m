Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE23353A69
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456425; cv=none; b=dLP60029pZwv7/RvbICOp/kjnn1wPwU2C81c0aiVVb+y8JeyWIBFGwUNGrYX63nxSi9ghfAbBytLKoymnrW7/fXK5gGhr5SANEACRjgAkJ3wE2qaEL/dGjLNat/u5Cwe1HRt2y6bIoVdWCxrwGiHB3DCy43YIweaG0zPrJbnFbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456425; c=relaxed/simple;
	bh=p+iCQyGWiwdNhc8Zk8JYmMuYIZNVJjaJvY9S9XcQQ6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YO+masWtw6Vgn71I6BSWx9/ujhKSvoiPO6KwyAjaO1nBQ2OkgnZ5eh6XJyRKvae4mYKP/7I8uZP44kVUUpiblknyB/xJVv62xgJpMr/2cy1+3EmVCLFIbwNKKQ5QJG7NnKWBY3r4W0ds+b1ZAcKJ+gq05cUmYpFjZK9+S8SMMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCfYnG5I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCfYnG5I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e717c9841so16715445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456422; x=1790061222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7qaufosLZLxweL4OTJOiBy2CZI8aGJ/EJYf86wkdYM=;
        b=CCfYnG5IMNtosyxj2oZYbZJRmW5u/trbzNnd2RzoQbMLK1suliraA3hiv7pc+is4le
         KGVY9YUIEzSf/aWhUknkN/oO4PlPEB/M7Mhvl2Inx5aqjwEvAhtzDZeLphU45dVL6Y9z
         a8/YgHDjOcrwbcF9xiBRfyPxWDkfzXKy2WgRGai64wr0WYDaJvFfrzVzreFjOcuivCKW
         1oNS4YWgW5tzIQ4LBKEaoTundLUzppzKNIDZMxL1ubjQ8Wby2w9ufCMlWYQoFjugn8nk
         c4fqcmeWwc+Dng3gFoW19b4Qa6a2O8A347U4i84sYmgKzRugmmyM63aJLbE6AFKw7rJ9
         X49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456422; x=1790061222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7qaufosLZLxweL4OTJOiBy2CZI8aGJ/EJYf86wkdYM=;
        b=OLRO++eDGRDdCqrUqwQB3MN+ECx3HLX/dX4tVOfdxc/Fo2HOckpfEQpAvSTwJrESDE
         h1Plb1Au87alycx2DM6G4NyGugKlnrVYuG1IVyFKWG/wfSDSUsRjOFkKNG4Q/xyAnuEX
         qC+6i44RzisXn7hduw/DJes1jTDeXXA3paPvz8RadI3ttmIrgH+sfvZ7lng4LKcdcA4V
         OktMKYmUK6RPyGeERVhjjlhHnOP/eo8P/P4d0En15fuNVUODni1TbdhT6z3TxVw428es
         P45mcIFV21gZ/aRc6uOSUuw0qzj3AAAem8ZGgahWNNOV8wL+vT7QdA0bIbLWJEo2VDNo
         bbiA==
X-Forwarded-Encrypted: i=1; AKwUvBzBXuMzOcUr3zwnRlRxw1y2OWC5Rooe6XnJReeeqDkgV6FRq9N8Bcz/Uu7KxfuCZZ+PWW1MjFZHcz/qOtU=@vger.kernel.org
X-Gm-Message-State: AFuF++nCjihCJJgee0jk7bEvaKk07fJx2x7xf8yImN9v7AL8oThBw6lH
	gCqSn9kyptfEen8HWeebXAMcHC/UwngpZl5N/0m8xCGnxqhM5fgOwN3w
X-Gm-Gg: AYBFou2fqqAJ5F/WGNuo2YZJNi0eqSLKKbMBGZMHpzVZXm/aXd6P21QK2HCUkEGEbpy
	3IWIn1SHCt4b4vdgy4+JbAxcYPHxoW9i7eeQWYy4ouoKEdpPdr8RraTuB3OP/7w3NegmQhhf/R7
	7t1HKkDKFb7cO3+Tnl9kFKZ2mkv1u+yrWplAMt0UmdTu8PQpRO7FrBz3lf8pHBc1oWl55Vk360D
	gZnitkpeYLulGvMrBaXoxUgmcES0h08vnPrqhUEEBccRFQWsR09LXca7riwVS/9AWF3ueRw7F6P
	m4dTSDQ/pRdMSVL73QmSKMMbX+nKp2Q6bbJCvFhl+50YAUDRlTa5k2u7aF0Cy7v+O5fM60ZxaqQ
	2B4oaAcY+OUU4mnzRRdbe9YWULiRl+ov4LcDqsBkq5A/zR7tg6UtotaQezgF3gRzRK7mrziEAm0
	jF899yv+nnxGE+jjFi7S4BEXEjzrdL0Mb+rGVVofJJK4pr9d5XYCNB1G+9DeBZjzXQsIsiIBosB
	QsHoZ6S4e6Sv2HbPGHwBM0Ht47wgTDvWw1DBi7dvDo98rpwfR5ua+zkI1i4OY8IWVU1wRVHVyyV
	LgH3/BLsruxXFHSE
X-Received: by 2002:a05:600c:37c4:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49e7a656db2mr84113715e9.14.1789456421649;
        Tue, 15 Sep 2026 00:13:41 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d1f85desm38601675e9.0.2026.09.15.00.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:41 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an 8-bit bus
Date: Tue, 15 Sep 2026 07:13:37 +0000
Message-ID: <20260915071339.15172-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The word count of the Write to Buffer command is a single bus word, so
on an 8-bit bus a chunk can hold at most 256 bytes regardless of the
buffer size the chip advertises.

A Micron M29EW (an x16 part wired in x8 mode) advertises a 512-byte
write buffer. cfi_amdstd_write_buffers() used the full 512, CMD(511)
truncated the count to 0xff on the way out, and the chip aborted the
program on the 257th data byte. Every full-size chunk failed while the
partial ones at the start of a write went through:

  MTD do_write_buffer_wait(): software timeout, address:0x03278bff.
  jffs2: Write of 4164 bytes at 0x02c789b4 failed. returned -5, retlen 68
  jffs2: No space for garbage collection. Aborting GC thread

Clamp MaxBufWriteSize in the write-buffer fixup when the bank is one
byte wide, and keep mtd->writebufsize (computed before the fixups run)
consistent with it.

The bug predates the git history, so there is no Fixes: tag.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -283,6 +283,17 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		pr_debug("Using buffer write method\n");
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
+
+	/*
+	 * The word count of the Write to Buffer command is a single bus
+	 * word, so on an 8-bit bus a chunk holds at most 256 bytes no
+	 * matter how large a buffer the chip advertises.
+	 */
+	if (map_bankwidth_is_1(map) && cfi->cfiq->MaxBufWriteSize > 8) {
+		cfi->cfiq->MaxBufWriteSize = 8;
+		mtd->writebufsize = cfi_interleave(cfi) <<
+				    cfi->cfiq->MaxBufWriteSize;
+	}
 }
 #endif /* !FORCE_WORD_WRITE */
 
-- 
2.47.0
