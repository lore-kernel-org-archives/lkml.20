Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD084CEE7C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576059; cv=none; b=WIk+bOiAYMitpR9qSKUmcENanu4Jebo9gbusjU7HSlrOW3PGQ8CtjClJYX5tbWYbntGOodcKcrIZsNZkDktMG5EwGIE/qdornw9izzsNJdwClczytbm6nozPotnwmydZA/xRog3A9AOnrhT66029SYDwTEWDr38R1V008C+YYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576059; c=relaxed/simple;
	bh=+GC+NRBfG9u+sUvPxunyVELI6qKPkDEpvjERcQpRxDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imkDskkafZqqfj+A8NgGCRPxHNtJUcI7kazztZx7um06P4oqGBzniszp21dODWojMA9SVejRi0Bw9uno9BqmElx2lKJLx2q7CB7JZyyBRcRR7XO9+ewHQYKF1Ae9rLVFfPdZlSiePNY8GzQwgkBlw+r6SeL3Q+ffNYLWiJuVs5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzVzqpv0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzVzqpv0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so12431355e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789576053; x=1790180853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQJbelWBBQ8IcOB6iLsaKQN+w2bMgRzdfuJznAc9A94=;
        b=qzVzqpv0i/prjs+Yu3aPXK0Ivds6tw8wIAdYm4abuiFQeU77fMau5+34c8bX9/SGFO
         w7BwG0RQNfs/LoOuW1lzDMk5iuQlPnZP1AO4U3wUZoWECMeHmv5cIz/eV+KKF0Biwhc9
         JZpT9fsvWeIfXhsc8Okowtkmp9MB8LHH1Bg3XmyakNpCIq6g1TG/MC9LfDQAbq8SmFHW
         rvdGeOm96pPBuduH/T9ruc8hUe9TY8x/HBW+NWeCUPd/owwGiiPIHVs1PIKkZIBJ1J+J
         GyXAodHUISzNOra2hg1rPCCoa8ZyMxBEyA1uP1PdFbZPBI9h0lYdvF5pKq9pO8Wi9E7M
         lnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576053; x=1790180853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQJbelWBBQ8IcOB6iLsaKQN+w2bMgRzdfuJznAc9A94=;
        b=O4MeU92Jbng3OSW3gqHulUI3llhPWOoFyrVsNYwCyVY8tUEMSAKA74dIb+Hq8Y189R
         8OklC9mpIZ1J3mXFIOrfJYQ7iDf/Gt+pJ5RyUso2bQuWKIGlD7XLc2ff2f7VLIToD7ID
         NlKjH5lV0i9lZsTDdG+VXtAW1EGgIghQeNhDBVJe0o7sieIks4EGStmRL0gGL+RbfGSn
         4b2ITHglHzAlk1nTi7j1SBIODoQ0fs3ac6ytToNxKrUNOSXJxvP9Gi6bDTm5TofA4vBI
         +CktXVtO8oVtmhe3+0vKHW2+iN/fqJEF8zlp5H/VNhRbjMzoeJ9TQNYuJSm/Ai4f5Fe4
         +hig==
X-Forwarded-Encrypted: i=1; AKwUvBzeGmI1MeNZvNN3zprMKXXpO0NP0Dxl8VyRgnWaLcj1al+NKlTjSCvxTvtChQUQxbmMGI9CMidD2wG2F2c=@vger.kernel.org
X-Gm-Message-State: AFuF++nmlmPHTEXFNe42Ip46BVFm9OK4cBKn5RvQa8a8yQDxdxhzYyVv
	9RLgPYE7pZMX2g1CeefSYrIPqdBFfIwTp1VGAh3mCE9iw+FT+DSaOxn0cU66bw==
X-Gm-Gg: AYBFou3hC2GHxXA3geVX+V1PolRxhY4adaphgDVwMyxzBUMklhzD5m81qS66ZuQh1Jt
	UJq3nhJEK2jVFyUdlRL7u+FisQpIKkOi4qwgTammz6nVAdtQtgFYnKXMCPjaUeBm/Fb97ux1ExQ
	3R8C9vxfzuaeIyvJ2W/Mdj/fK67x3j6JsSlusECDyOiONDKz15gH7MMAGgjKZNIcG3OmANE8D3W
	cEBfmHfia7CiiYewBpA2xnfrRO7KBPXO3v/XSDzFGQo3YwMmWH1vsdvdLx5UfJxgNRnAdlwRu13
	EJ1bycdCkvnK4k+u9CbrFvaO+4aAsPOQMHPYeQ5kMeM6Esav915OfNCBbHNKz1ZhjONTfKa8Bte
	qqAEFm/MWWzGmpKaw1ZZQO/jJKZDEa5+8zR1NNUunZyBPtXlSSzq1K8yDuCVx/NEaMGzXWgiMcC
	7osAf6R53w0pbTNknTTQjFGW0zFdx1Sw+WH+jkoZ8DpFmE+OeYuBW05lDne0/B/jRgWGkGX3RVb
	fSuMen8EFZDJQWLtxrBTlANZ/as65+iilGKNqXYZ6RkWFX7Vhwepr9QYV0GJUaNUXL5nOhOFLBG
	dwwAV7oR3cw14q69
X-Received: by 2002:a05:600c:8b8a:b0:49e:799a:8951 with SMTP id 5b1f17b1804b1-49eb72fc61emr48484825e9.11.1789576052365;
        Wed, 16 Sep 2026 09:27:32 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm28816925e9.3.2026.09.16.09.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:27:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
Date: Wed, 16 Sep 2026 16:27:31 +0000
Message-ID: <20260916162731.307959-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915075028.21658-1-orgads@gmail.com>
References: <20260915075028.21658-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Write to Buffer command takes the number of words to program minus
one, and do_write_buffer() sends that count as a single bus word:

	map_write(map, CMD(words - 1), cmd_adr);

CMD() replicates the value into every device lane, so each device reads
the count off its own data lines - eight of them on an x8 part. A count
that does not fit in eight bits is truncated there, which limits one
Write to Buffer to 256 words on an x8 device, however large a buffer the
chip advertises in its CFI query.

The M29EW on a Cavium Octeon CN6335 board (an x16 part strapped to x8)
advertises MaxBufWriteSize = 512 bytes, so cfi_amdstd_write_buffers()
split the data into 512-byte chunks and do_write_buffer() sent a count of
511. The chip saw 511 & 0xff = 255, expected 256 bytes, and aborted the
program when the 257th arrived. Chunks below 256 bytes - the leading
partial chunk of a write - completed normally, so only the full-size ones
failed:

  MTD do_write_buffer_wait(): software timeout, address:0x03278bff.
  jffs2: Write of 4164 bytes at 0x02c789b4 failed. returned -5, retlen 68
  jffs2: No space for garbage collection. Aborting GC thread

Clamp MaxBufWriteSize for x8 devices in the write-buffer fixup, and
recompute mtd->writebufsize, which cfi_cmdset_0002_setup() derives from
MaxBufWriteSize before the fixups run.

The clamp deliberately keys off the device width rather than the part,
even though the driver already recognises this one in is_m29ew(): the
ceiling comes from the width of a device's data bus, not from the chip,
so any x8 device advertising a larger buffer is told a count it cannot
receive. The M29EW is only where it was found.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v3: rewrite the description - the v2 wording of the failure was not
    comprehensible (Miquel). Name the board it was found on: the failure
    is not theoretical, the log above is from that board and the clamp
    fixes it. Add the Fixes: tag - do_write_buffer() already sent
    CMD(words - 1) in 1da177e4c3f4, so the first git commit is where the
    backport has to reach.

v2: test the device width (cfi->device_type) instead of the aggregate bus
    width. map_bankwidth_is_1() is false for x8 devices interleaved on a
    wider bus, which have the same 256-byte ceiling: do_write_buffer()
    sends CMD(words - 1), and CMD() replicates that count into each
    device's lane, where it is truncated to 8 bits - so two x8 chips with
    a 512-byte buffer are told 255 words and are still sent 512 bytes
    each. device_type is also immune to map_bankwidth_is_1() compiling to
    a constant 0 when CONFIG_MTD_MAP_BANK_WIDTH_1 is off. Caught by the
    Sashiko review bot.

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -283,6 +283,21 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		pr_debug("Using buffer write method\n");
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
+
+	/*
+	 * The word count of the Write to Buffer command is a single bus
+	 * word per device, so an x8 device can be told to program at most
+	 * 256 bytes however large a buffer it advertises - including when
+	 * several of them are interleaved on a wider bus, where CMD()
+	 * replicates the count into each device's lane and it is truncated
+	 * there.
+	 */
+	if (cfi->device_type == CFI_DEVICETYPE_X8 &&
+	    cfi->cfiq->MaxBufWriteSize > 8) {
+		cfi->cfiq->MaxBufWriteSize = 8;
+		mtd->writebufsize = cfi_interleave(cfi) <<
+				    cfi->cfiq->MaxBufWriteSize;
+	}
 }
 #endif /* !FORCE_WORD_WRITE */
 
-- 
2.47.0
