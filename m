Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073784;
	b=Gj3sIWcIZtK8xyH5So8Yy/SXSMrs0o5eeGwhKfASiumPi73pmUBPyqvG8HFwoRUCMVzu
	 KQ8SEemIdiS16j3y06suwUICPEmymXfJttcTD+KayR4TPxW/W5YFf3H58mUUSXSLzRTbg
	 aHltbd1vaCG7Ymaz/ZRJ+g5i9t4h5VMliXH2euVOR7KqLb80pFX2qLZdV7Tnt7/MqDSBg
	 LwRp5pN2HWINLu08dc2lWbw2KXVss/GZiuX6W3EujtO/QMqWk1JO+ZmHL2pt/e3qqUTr1
	 7qcRmIfk7cuG/7kRgyh7+eC4QNQabgc5OIZXUIho/QfRZv3uNMMbbC/HNfNJ9b18pnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A7FTZHop0UxdHFyNyA7iFwCVt5lhdjwaOoKxUOdBWl0=;
	b=jsUnIGw5jzIS0I4wbZrGyH+sLAQFGTkTNa9gxZkiQuwbRTjrdE/KfsYRWqqThkjakSBH
	 UHTEjxLXJ4YLaVGLgvWtGv1vNweG8BlkTBzgmoFa8yzNAaxy8EK1PPn/dHy60nQ/kILRE
	 2MoNkT9IiLMMrcffUJh1BGJEaOGHcYwF2/wJABfvYFeyWFxtZFLSDR9JuSbzQx5ZTvhL9
	 pag2XrW7pQEa+WWDRErmePlYO+YdiaVDfXmELAhweE2QCdWJJBvTmMDkYfYVOdSdGKaG2
	 LdMZDXd5gPUzQGIEcyQD/LAPbDxRooZEWBQMBRWIpCikkcvgWiirvhx+lby+/G5H1Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6VcnnMl;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE2606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDE2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6VcnnMl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49134c8509fso1392384f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073782; x=1794678582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7FTZHop0UxdHFyNyA7iFwCVt5lhdjwaOoKxUOdBWl0=;
        b=K6VcnnMl1SRXr/L5qnFlvCFqHIrimSSli2ED/mHu9W1NN4T9hFU/8I2BvOYC+z8vFG
         rdm9dziWI3JfCgzGftUAz/e8VXut92fVn42cThbmXGQ+kwT9FAcTnVGst1IxPY1cYg0B
         hpNnexWKaDVHNH6JCwnWzprtVhJjwQHVJH/K9d9osDdxabNum3SInwRfgELqkyoTsZay
         du7sO2EImeroBC3zAdwqsr2kpVUIbDCjd5k7Du0mZaeA78DQpJnWncZYPOwGwTA8ldjV
         KaP/hEBxCFu5L7dw4r6YS0shE9rM+gk/He3epjJfOhnKppN5OKqJB1qIKYfTUoubDM2a
         ggXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073782; x=1794678582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7FTZHop0UxdHFyNyA7iFwCVt5lhdjwaOoKxUOdBWl0=;
        b=TC2m0feXHGp6GwaRKNMxx4kWyC9lpWcTHagwVxT94acn1GFJdzQfVaVktZFgpi5Me0
         uFuF1MXYo9gjzAGrxGzDlpMEUeTQrKUIbPwEUJJYahZwx/GI6gpUsSsuCpcNx9n1PMWK
         QSCYYi9+V9rqKDplQItqrYrH6RapxjP7Vb+oRcPkUlKB6eQVAGBpCOtc9/U4UOo2d1na
         YbbpPLN64e6CF3KHS1kQt0rJHLpSUZSQACRkcqWGxlvgef+gcZM+QVeCxSr45wJJrbTB
         J3epVbbxk3NdAuB6q8Lq5BRW0mQZ2jtz3MTIV2CWjNfGeK9Gz937jqaJV7jX6PH6tt+2
         74bA==
X-Forwarded-Encrypted: i=1; AL+hErFFveh0dxuY+myR/L9lH6VpF3+Q2VmtDTQHyEuCa6cwSuzvQbFb5pRDwQlBZSW+sLUPobKneKERvitZO/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+88EvO1+BWBOjdHvZkALqFSIF0V2K0kayssO/ahWpzBX/r0UEc
	FlxG+iGI8GtSmk6EpSyAbbedYvzgjdalPpqp//nkP/rq1GNxBdbjuJ2DtJZrXA==
X-Gm-Gg: AYBFou2BJqVElzgR2GD5jKCgcJaIjKOwFSSLuP+tkUrVitDjczOIj2lDhRn9gKtgYZ9
	Ccs5dbW7Nc2vMZ7+vRB5kDUXQr0yq00U1l0Fy7ikojCrmLt9eDa/j95GDtHD3HpQ/3Ks0lMbiJm
	vkqSMDjTltanVDDg/W90ukOLYRhv5DRVY4iD7DjR8LMwUlzCK08rRvXBXSoI5+joJx5YbgwFztY
	U2SJYmFaV2GeZ812W5aynYYOg9VwwVGKV6q3j5iJwDLgFLi5mU3bGOyU54BH0iblmb951AIgKHs
	1BEgYS9EQ2/g3g1CGJvQXa1G9jfQC5Bi6ZVwxs8tKVVze2tsJw1FEvh5Pu6OBE1NbA7YIHN9ssH
	3IAEmYRz+4D5pqgQkPl4p1o0z5phP2wmJCN5oR6jc6wJrumVi7bK9qkRlvDx/f0yQbYkSTA/plm
	riIFo4eO3wXB6RrMRQFXUMDkeHF7kOT40ycU4o/luIhsKRVBCYh7J2xva6pm/CnA91WXJ2Uh6nY
	RZmSYQ1769uGGaOnCEx2JB8KXY2m5ePaCt2RtIIXCcA7YYcJ5rAJmzo8zRlVZ5PHEwQahTM7mVa
	zwfVsN8pdhaOtIGyKF2/qpZkI2Zn4CWiE6Ohn7iqfiW93H+kKenYAefd+nj2mfi/nOEjU9xkCKf
	E1UCJkaSiTLjTHAXHQHYdYutDpMhvP4r/JlaGAeUldmORu9EYVo1BZzJQejTs+oVUTJms
X-Received: by 2002:a05:6000:480b:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-49275373a66mr11446578f8f.10.1794073781796;
        Sat, 07 Nov 2026 09:49:41 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d6085asm14961631f8f.3.2026.11.07.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:49:41 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Sat,  7 Nov 2026 17:49:39 +0000
Message-ID: <20261107174940.3323868-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
Cc: stable@vger.kernel.org
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v3: cfc5ebc9540e is now in v7.4-rc1 and queued for the 5.10-7.3 stable
    trees. Without this follow-up the backport still misses the x16
    part strapped to x8 it was written for, so maybe one for
    mtd/fixes? Added Cc: stable, rebased onto v7.4-rc1, dropped the
    Assisted-by tag (an LLM helped write this patch); no code change.
v2 RESEND: https://lore.kernel.org/all/20261019034922.3805782-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261013182327.549640-1-orgads@gmail.com/
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
