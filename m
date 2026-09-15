Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185A3812F0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458635; cv=none; b=EOwbVShKvbR+5GzlsT8ITWc8boOA0iWwH1XvnMpfx9OyIi63Y1ZCVFUBjfFUP8mHcR/+UASJvvx5S+hN1lowy0wyQVkqYpk8OTPdZQ02P7C+7mvsCXj/Hh4lA4DWHfx/0EhNHyrJ7Dy63j2qMRJb5Bm2QnS4GUrf6pH5vc5h52A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458635; c=relaxed/simple;
	bh=NaaBUlaZxUHYV/sta9bMc3Cha7Do+uBNhPwb01okJ4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrkoWolzzWaWwKqsxBJZ1CcLhwd5vp5iyxXVAIuBYeBEe05Z/j/6vJVXb0tXi9py41bCI4bi972HgdM6OV1+Fu9pVx3jUiwdEJbKtHLnIIqzpz/5cgTyyY4IFWWglVpfr5mm6XxL2ICKLs1iQdXaMWMlCDCVSvG+07TZm4ICm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtUKer/E; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtUKer/E"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so15361665e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458631; x=1790063431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSuOuej5g477D9OeKfutLbsPFz58l20HxXCWVB4U9S4=;
        b=CtUKer/EJXrYT1sEP7OxSiwKpnABASS19oMEttbXSJ0dZM0P7PJOXiEY0a03+NDy+n
         HMuqTx3bWGkoBD+9WGQdQadD2aJAoAJeh46Vd1TR9B1VaF+iDlK+JPpWR49x1H62fnSY
         GxDWhyxH798kcXBHvljicU8HQ2my1k7kOb4Sict1wWIVTgstFCKqHSCjd6WTypp5SKDc
         0LRVD0zFqalMt6BuxyIo30eMs80NE317lKM/V4PhIXwsqSbS+k75IttQhnZWbZSRBw1N
         pb1tRWltQUjjuQ8VKW5ThupYC5zgqz/tiinYnyBYqkxZwzTmVc4GLJafZSEnHOEB1K5I
         ZGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458631; x=1790063431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSuOuej5g477D9OeKfutLbsPFz58l20HxXCWVB4U9S4=;
        b=QCSpyawt2m3gc8QY/jiwUywjBg/cGGJWxq+FlPySVQ44RJN5fvcx1LSRuF0nQG2YqS
         kFPFeum9FZLHecLwlqxXFIGCMN81/bnyThSiYZAD0LABtolPceeKB3EbLlKzkiekgMzi
         YNbPSauYu/IP93ifqEJDOYHny9QvX9aHp/A+KwJvN7vKJxi/syASKLBlS6UJvaTFVHr+
         ouJLPGiKiA55MVzeP3qmrqBwwQKpuiChjqUe/AdYJR05FkMvVhA2LILmtp/qptNTUldE
         SZU2GwYw0m8xRR4eCM+KCR3dnkTFd4ZW+SFaVz7gc4CIxQqEhIpBoqjwEuYb5gGjYKpp
         +W6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuUUVAEGI48ahD+QILjBRrs0K0+C1OrDm80PqUxXlq+c7i5UEv9+mFZskBPltpj2kXkG52IfHp4q6a5Gk=@vger.kernel.org
X-Gm-Message-State: AFuF++kAal3II6zQmbX7/C1bLROES2Tn4j0CPqChS/uUvKjeBVNiEDDT
	XCK0rtNr5fVem5VlSQ/OjIJW8N/kMp+61VvGiF3uxG/n3shGJQaULf/J+O1CvO3CeAE=
X-Gm-Gg: AYBFou1+8U+ItsmVoS3g/+cHJE7FitPRrsluIfkK45Q6+ygfM7uZoCgBSQn/1I5ITAr
	bq0TpewDxWjyE8TTJsQIBEXF1CKQZI/qGxdMFujtSFqmiyN+5NJCcij90JkFxJ82dx2HcECzosz
	1zTCZ3noGqsM8O6nknHTyF7C06+xQAr9oXGCWjSYFPwlYTszP3Ckl4rM7MmvyxeMLxLOTDZpxnM
	ebO+irpFl2qlFQMLoyekDWT8t/n/9m1QkcsLMlcjmOfWaidyBs8w3ksQ/SsXxAvUa3QKbyrrgle
	eI2VKdizdWFAuoEvsFhPGfONQiLVxg8KG1+aXRESPYHkKhqNkqFnizNjrOt/Vh1Fh+eKUORmUcL
	VzvidrAZf5r/g6UU9PySOlNGiP0MyzM0fdJhMyAz7JNIxt1HB6pqhz2434onyACTDHdS/32zX8L
	rxoAn3UqQPzqBrTzMeViZaEk8Cr0TiOLdgl18ch1Wt+IK7JssPBtRFr2SiJzFSfTXHRjLTAzFR8
	fvSvPAIelKA9J/0uwvdqzEBP3ctGD+I1VvQawIN5XQ9eKwtbT0nmIqDN03aPl8/4DyFHy+AZ+GY
	gC8wq7FG+BYyYjTq
X-Received: by 2002:a05:600d:8649:10b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49e8191e921mr3226255e9.5.1789458630987;
        Tue, 15 Sep 2026 00:50:30 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef74a5dsm39657655e9.7.2026.09.15.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:50:30 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
Date: Tue, 15 Sep 2026 07:50:03 +0000
Message-ID: <20260915075028.21658-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071339.15172-1-orgads@gmail.com>
References: <20260915071339.15172-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The word count of the Write to Buffer command is a single bus word per
device, so an x8 device can be told to program at most 256 bytes
regardless of the buffer size it advertises.

A Micron M29EW (an x16 part wired in x8 mode) advertises a 512-byte
write buffer. cfi_amdstd_write_buffers() used the full 512, CMD(511)
truncated the count to 0xff on the way out, and the chip aborted the
program on the 257th data byte. Every full-size chunk failed while the
partial ones at the start of a write went through:

  MTD do_write_buffer_wait(): software timeout, address:0x03278bff.
  jffs2: Write of 4164 bytes at 0x02c789b4 failed. returned -5, retlen 68
  jffs2: No space for garbage collection. Aborting GC thread

Clamp MaxBufWriteSize in the write-buffer fixup for x8 devices, and keep
mtd->writebufsize (computed before the fixups run) consistent with it.

The bug predates the git history, so there is no Fixes: tag.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

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
