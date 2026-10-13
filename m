Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBA52268E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915812; cv=none; b=cyVejeiAjWwfl+QnwWjPEb3Vsz5R76Zbcn1qSZMzqnqyloYRTtxxgmC/oJJXeHSgJXR3puNUrUxY1ozB65fu741RCHrI+NJ4VAa009+GDiCyJkpaHv9xg/dWolVk+rhED77ie0JuPhegd0hr8ITB2PjJ1tfYVAtW2/lamOUNPO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915812; c=relaxed/simple;
	bh=2TgUliju4qP+ZpeSuGqYhN6V4ypK/czY3LZ0g0gY4Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TxfiIpJlUAfSfRwBa1H4YyhcsxJSCrpY2E1Tec74aMmUG8eWvqtmzqdGptTw35EoYxjpOCcq9vJ4LsRRmoFunvBy38VXLlOMe1tyV0QDTmddJyDoesHEWiPV5R/gj+l0SC+VCLTBPX+FeNgoyzyDRTD8u295Y+NxweKJcEBFk0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJQUECYB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJQUECYB"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3080890f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915809; x=1792520609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ef/GgzaBPwT+7MEbAYGfEkP5fMoOfAQBNaVdanheznU=;
        b=DJQUECYBLUDg/I3GuTK9+G+zaxy0ta4hb727zmRK9xpAF+/hnt5hy3srdkAEneDPqX
         d+16hq+oU7yh/A9YaBtGgHKVSVVZ/F5ooTlWIJXYB5/BlaPq2WlKwJQ6RO++Ay8pUVbW
         Y5nRNCTkEnDvrj97SIbdzxffTWPvKzkzInMNz385YwGCcW2CYoBfc64InOS8IxHTOGkr
         AHM/H+TqfaluLs2S4kmF17YyhmzHh972a63R+kJwaCN1nXsvvVXyEA1nhBLJ2tQ/4AOz
         nKAXlMFDItBc8AohyP4yCMDnmWntpoOl5m6oj5N+xqK7lU+ifLxmS2d4J2MXIwXiLAFL
         KZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915809; x=1792520609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef/GgzaBPwT+7MEbAYGfEkP5fMoOfAQBNaVdanheznU=;
        b=eQSVVKKXrt2HmyI1kmFn+WrXTTk0gdL0/Rg+S8loykpZFY3AnBaFid8QCVNuUgc/fS
         M+DoIvFolpu6bMEGVnBIqsAmip2UDD8J7LmHu7iro6BaIngAvgPA82mWPoPJATZjLUqg
         AW73vi/vcdfBliYfvG72rLXn6KnjX4FSARYBEwdn16XB74ea/esyf2TM+YyuG+eHkjE9
         cIih3K48iu5mF+9DhdAZIw5FfBymg4rc44ymi1yLkfNMA/v/Zs+KcLV6Lg1DVBkiOvYg
         w8m6LQS00QDLaf9rE8lq+bQXNKKgEwXo0sUdU5XXLWwUQ1aHvHE8HsjmBHOF/iV65ln5
         D0wA==
X-Forwarded-Encrypted: i=1; AKwUvBy3N+2+iVxJsMleZYdyWpMtFccsfWt0hZihngdEOYG+6XwECWUNh/LL2ZU9D7dG4iwLSmaJ4+CHy6iCmOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOTztfvMjVnIgM8edR+ad0Kh487lNuoImVcF0N7DsLrXvZfAeA
	v/mlAU+FInCABZCIv0rgH7kNa1V7HaKFLGM4ouK8nOGn0QOQI3FrDxDY
X-Gm-Gg: AYBFou2sXmgpeFwIVIN7x7O1H3dMIJEaMVLWYS7KunaapRD6heEimI1jv1bdwOFlAVd
	rLz1L9N4YVpIbRPbdzUlmnYqxdwNKkFMN/aQx6ysgy2KAajdi0NwdYoHSNBcWTZUC5j77qajYTl
	GwICdAgmIzrCh3QjzI5MPo/yuiseummC46rexWB4gpG2+qZo2XjSY9HbCM3nqYprFTn8fe9FlVL
	EiCIbX1QS4Xm4da0mjzvmiwFYh6JeEKyMo5Ah7d/eTDNlrxANvQJh+rT8Gnn5DuqeSeLqngjj9r
	DI25ZZCLz33Nr0YFhW6ZANMMsn0WQxbV3KB+XUlCubaRN27gTpWxrMcQiCtG7uElcuLT7rh8TVu
	LPxi2MsYQzGVNOKbkJXgHzi1RouFnzDguxfr1Is0V8TQNu8fLI0pihaPJTtZpZIjJh6osTj7JTw
	YpeA+vTk7iZl9o2d4wQZZ2I5Pp//L0/U/imbXTmwcxaDZ/kOshYtMd6UKUS6Zi1Y7lyZZxLFUod
	UrEufbnqVklEZAYxGqZVGqXntlo8/kKCuAGjOFqByDeurC4qP2Id9MjtJMprZ+Ar5d59QoEaA1i
	C5T0CMXcDwy02/z6tdIGZi5Scf0=
X-Received: by 2002:a05:6000:60b:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48dbace40damr26380297f8f.47.1791915808804;
        Tue, 13 Oct 2026 11:23:28 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6925590f8f.14.2026.10.13.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:23:28 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Tue, 13 Oct 2026 18:23:27 +0000
Message-ID: <20261013182327.549640-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: rebased onto mtd/next (2f7fa8d90694); no other change. It applies
    cleanly to that tip here, alone and together with the point()
    series, so if it still fails for you please tell me which tree
    you are applying it to.
v1: https://lore.kernel.org/all/20261006052435.319751-1-orgads@gmail.com/

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
