Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DE3F822F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792381767; cv=none; b=BOdIsX3SFn3EF6eef2gDRDJAwBPXIc+8Ggbz54hu7VX+WKMpmqAZJdOBJkuJYFge6BGQbUqgR0Y4MmU8vCh5Gl5uixZtgSLJoeyRWcxvPHDfJH4z0I2ypKO2Lrq5dnixoS5ZpCPCTTOKoeyd8YMU4vL3OLHQFC58eM2PqlF6sdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792381767; c=relaxed/simple;
	bh=z5cI/vAVg9O4X0V9P2gYaa7D294MzEfCwVjRHm+y9gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nL0xq+N5vcq9PgQ49kqsASYsI1wGI1xuvVNNfA9oR/vkWUghUz2jt6xNFlNxCxPx31aLfI3nwoz/FhGiDPOnk1lsNEhVhCNTZaVFMyELiBOLSydn7LQv3AcpAelhsgGGi79+eLViRrjU2sHUrcUpdUcJWbR4nbO6H0zksRgdSBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/jpVtPS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/jpVtPS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8265485e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792381764; x=1792986564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqF9Bl8qiczwJSI3x4ppM91PPkTQtiTR6DplOeX8g3I=;
        b=s/jpVtPSyus3Ioulu7I+DU+htNVuTnP+KxvIrtZZ1vZ4bHknN5+L9FHTwlIixQ3VwT
         zFwlQc0bdiPZUyEcmn5/mze3PxNx0jwDuMIfX5dprF8m04jLCCDxnwvTS+115HzJgSQx
         3LQwD/Znr5XRhHYeC514xgLs4ifXTBQmdt2hJ7ptGPeUByfdokK3nYljKY3Lz5gh21AW
         kNG0RX/t01PQ6nliEDVsIjozMUTpafXBXBnqMsUSGrcvRyVlygc5TW1heJX1d4hYVD/P
         oWQ10McFDBNzEMl++komx+04MKauwBMgBYt0Eht9CMQ8hWUZkz8m2BlrgL0Ba9dA+OQf
         CB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792381764; x=1792986564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqF9Bl8qiczwJSI3x4ppM91PPkTQtiTR6DplOeX8g3I=;
        b=QS1PUzUgQ3JApJSFC9ccRuQAJE0f1oefnMNkaF77bcj2Iounfe1J0fGILzD6dXhmho
         /MJAufsLf7ShlV0tdjeDgW6MxoU11oiezCNKurc+tCXS1d+38XrSs0JbOYuCJMNZu5PW
         iPsOBar9UrxWa7pNrMBB9LuzJ93G2M5KsXYuhqLyMEjxNoBf5tJ3vV2F48dQ5zuWYjFm
         6JkwuOXnOK/Lbp2OOhsuCHWjkGOg+m4eAgdE1gPBamK1iI11QAZX8z+t2P3LN+Q9MT58
         2GXYdfdPqj/ccfGd+WKDnJJ2bTugBqQGEqWTbAK+TSEzkLHQ2TpXRhitWvEBxkqulP2Q
         pg8A==
X-Forwarded-Encrypted: i=1; AKwUvByyQL1upurK1L8WtRZIzPVC5EKnvQ5mj+fsnCCigq03IjnRjDwco0NJxgSFFYEGUIO1v0Cj6OrPys4I2Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnQAcrDcMfZtppyXOAakCY78KWE07MNP7InzQ3qXmcHgA/8FWn
	gTBePX1NW66Ok9XUjiVOhsftY4s5/CrLb5b3TTHRubskLoyc6dW53RTA
X-Gm-Gg: AYBFou22Kqsu/EOq7UV0NP9Aww6lFGFbYcO44GvmG0SihRTmWIEDttku2TScrm/gU7K
	MGSem7XqZqBuou8y7+45NKD71FI1AEtK3jvyRbyjHIuFqmb6Dn2hbD2OL5fLZSB1F6LRjLmEeRR
	ZqYZ5ck5cjsCeZcxKH94NDJWljhMBVjVYd7IUvqstw0JHimjG3575x9BMK7gUOZ/ITMBdrBZ69e
	jC7MbfQfLazNcqxO/Xm21vYTgpg68yaGPFD0E3Quv1MGBGKZnq6cK4KzMy9f1/MNfml1sgSC+ii
	zeCDIuYoIXa5/f1ynq8RJFMzvyhWm9LHONrOHKON2SwTjNGiN03CZI9i22+WGMtUFJCrTHoUcGF
	wWrDkUMxGb0T/KinwZ89oEONc26S07mB28ayJ1sMT+ZTcTOzM7ZH5k75IdW5Cz5JQ1et2MwNhkC
	E//0NsnDXde9LF6sglVWoMRotwVqpXXlhNqjWlKfftnVng1AFWi9Ljdz/LbeKFIJNhJF4V3+q39
	MDBaWruMrZ8nyh1ruzkHUnv82QKINR8aL4Ye2fieaJ+AuHd/S8ObuXZbPOdGwLazi9OH+KnJ/IT
	zdyjnbq5Xr6Mqfz2
X-Received: by 2002:a05:600c:b86:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a1d7610722mr124043135e9.24.1792381763606;
        Sun, 18 Oct 2026 20:49:23 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm171762205e9.0.2026.10.18.20.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:49:23 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Mon, 19 Oct 2026 03:49:22 +0000
Message-ID: <20261019034922.3805782-1-orgads@gmail.com>
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
RESEND: unchanged v2, which got no reply in a week; it still applies
    to mtd/next (cfc5ebc9540e is its parent there).
    v2: https://lore.kernel.org/all/20261013182327.549640-1-orgads@gmail.com/
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
