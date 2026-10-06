Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98327199947
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264280; cv=none; b=g6X1DUJNc8rzz2Mkm8XG9R7QJ1j0Zz5c3SKQc20w7GRHlw2z/YIKfGjc8HaJCAWU9IuAX42RVPNYN81tumoI2mNv8NUSRdvWgPVpdgVWONVeeFS+AQ01ForQdQvR29BFEb3JgZuNzApFuBA2I3/r4S3z/YmsWgI8ziR2ykainug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264280; c=relaxed/simple;
	bh=6nCQGEsj64aWvh9p7XW/W1wxJwkiiOsIfmFLjBKD5tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1fuXdVB6t6oli/bLhPQ/y8ZwMKYpTtDQ/IMK+c1CIitnhSezpxfpmaKlgpfHkYiuQVtf7uxf6EmrQLZWmwCNTezvPoJYDGo1D+KYJov41IRTVTq+mi4oQ9KUX4NVy1bV0xBTVed/UoYCnaYemHrckzw2+WuxJkGtVMvFClBaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ruh89yc1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ruh89yc1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so7586125e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791264277; x=1791869077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfYZkc6ArC987rS4AttSeO7Kv6gfqCbmHLs230dlHBs=;
        b=Ruh89yc1cPRGPSt9+yYJwo4IcvB7ki//4zkEJ8LMA/eGBllzx5DNOk34bIOfVIxHIm
         wUbLYIwhmU2dwcNeNu06OOLgUfQ/nxt57L+dbW1JJ9meFJGQkHFKCxo9q1HM/rdQXaz8
         lZ6YupKBf4Fz0Mam/XYafdCFjm20VTHxf9wLL34/4XeG8kF1z6M+q3eI2EMP0wioUwnW
         VdZWFI0ennmrlWH9OwLiAKio00qVFoT0t/nb8d2SvicnX/ZdQJvIp6PhtxtW9zSFEBaj
         A8nLq6Cyp3NPio0Dn6h0s9mI7qPGTeQWWB9IRwZtU0ZrcMhnkSBtRdMk1FImiAvc0sGK
         opzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264277; x=1791869077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfYZkc6ArC987rS4AttSeO7Kv6gfqCbmHLs230dlHBs=;
        b=07D7VH8yYmpV5k9Ryq6hi3bpFHVXh5m1sczukRDP0xy5bgprcMT+yOnem5r2+kAoIZ
         xBnVUfJOGlZ65D8KOnJqCfuGLC9J1yJ0ym6OJQVaW6bEoi8ETSnNun/bAXaaafpGrTd/
         0SJtgu8oHahziDdiiOCjj7I2Xr6s1hMnD4tobzknjIqpwzX0VNqNcffkMbiX43HzYzLA
         Lq6K9bdclZiTmgEVVQ6ceM9f3ZjyPfF7yr/Bc9rsJAa3RozHqG19RBFEECnIjQb8klcz
         H23KzvJg40sDtOcaMPReExNb9doFi2fbrq8ui0hsgxT9jafRaBWDc9w4oAlCSf58fWhQ
         nOvA==
X-Forwarded-Encrypted: i=1; AKwUvBzeVJQRsnPumcsM4Yhf1HxRMXZ6kFL52pQzgear8mdaBfOjyl59dNuJOiIahcXVBPsFueu4tW0nKcedHpA=@vger.kernel.org
X-Gm-Message-State: AFuF++kXkjVBDy919yFcyC+u0Jakd2kKy5gDhO97a/LpMJW5ZZqKZNpK
	oFkZy1/CYGedZVfuqL1hjWQtDo+dn6YUFU2bDEpSEgLyO+xjBLngwvYM
X-Gm-Gg: AYBFou1Nte7WH3Xanraw7IzLPECvXJ42Tl4Uvp046x180XhqLDTAdkIcOz4G9dYJmoo
	TNjFuJRH6irMHpMwf9s/eRPjinwM2X96EABrVAzeVVyN1jLw5ljMQCrZRKQwPBCXEGHwFJIIvJc
	XRZjn3aGY8FJlF+K66CVJtkqm6zyrvUjj8KQSTeD/JhSpRq0oAZp2SsTDCmRonnmPk1TdtbVht1
	nRNBwLL6y6wUqyhO28WRVah6VgncKmZCi/5qZh5AOYx2soEzMFqTsB1eBkaL78UThvHkO8vpPFU
	7koukLKOhc3T6MM/Y7NjTyHQ+xsJca8W5W5D/psGidT2T/vGvNysBxzDag0607h8NIhJjqwTVOM
	y2aMlmY4GUpMNc8STbdQwisgTWHMq6BZVT7jb+yj/Pbkl6V6uBh6uR6c5Vq5BXZw0JlX8anUvwc
	BRnqysvwI+2YoJKEFWy6On2+ABxiQLAAahlC+YTkO2FAjNLMyeLAcymVoQRIC+QMtDJJ2yUFnOf
	Jlj48FjsLJf+YRpOBMGrZiA9d+LCCZ7VAPqgfN+xZWAh+jG309AgK8Bdc9k8SKpVu1AEzy9tJjo
	Y63YnWe1hh1lQBfA
X-Received: by 2002:a05:600c:4f54:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a17b548f39mr4656065e9.15.1791264276693;
        Mon, 05 Oct 2026 22:24:36 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c40a28sm45104075e9.7.2026.10.05.22.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:24:36 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Tue,  6 Oct 2026 05:24:35 +0000
Message-ID: <20261006052435.319751-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916162731.307959-1-orgads@gmail.com>
References: <20260916162731.307959-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk
at 256 bytes on an x8 device") limits a Write to Buffer to 256 bytes
when cfi->device_type is CFI_DEVICETYPE_X8, because do_write_buffer()
sends the word count as a single bus word and an 8-bit data lane
truncates it.

The M29EW that commit was written for is an x16 part strapped to x8.
The probe reports it as

  phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank.
  Manufacturer ID 0x000089 Chip ID 0x00007e

so its device_type is CFI_DEVICETYPE_X16, the clamp does not apply, and
every full 512-byte chunk still times out:

  MTD do_write_buffer_wait(): software timeout, address:0x002203ff.

What limits the count is the width of each device's data lane, not the
part's type. Test that instead: map_bankwidth(map) / cfi_interleave(cfi)
is 1 for an x8 part, for x8 parts interleaved on a wider bus, and for an
x16 part in an 8-bit bank.

On the board (Octeon CN6335, the same M29EW) writes of 1, 2, 32, 64 and
256 bytes to an erased partition read back correctly and 512, 1024,
2048 and 4096 failed with the timeout above; with this patch every size
up to 64 KiB reads back correctly and the u-boot environment can be
saved from Linux again.

Fixes: cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -286,13 +286,14 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 
 	/*
 	 * The word count of the Write to Buffer command is a single bus
-	 * word per device, so an x8 device can be told to program at most
-	 * 256 bytes however large a buffer it advertises - including when
-	 * several of them are interleaved on a wider bus, where CMD()
-	 * replicates the count into each device's lane and it is truncated
-	 * there.
+	 * word per device, so a device on an 8-bit data lane can be told
+	 * to program at most 256 bytes however large a buffer it
+	 * advertises: an x8 part, x8 parts interleaved on a wider bus
+	 * (CMD() replicates the count into each device's lane and it is
+	 * truncated there), and an x16 part strapped to x8, which the
+	 * probe reports as an x16 device in an 8-bit bank.
 	 */
-	if (cfi->device_type == CFI_DEVICETYPE_X8 &&
+	if (map_bankwidth(map) / cfi_interleave(cfi) == 1 &&
 	    cfi->cfiq->MaxBufWriteSize > 8) {
 		cfi->cfiq->MaxBufWriteSize = 8;
 		mtd->writebufsize = cfi_interleave(cfi) <<
-- 
2.47.0
