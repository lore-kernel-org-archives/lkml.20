Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783765;
	b=Rw5HaMKMVn5TVHu9IWsOEROouwj389FdXh4LQ6WF6fgOCry1/NUnGm72tAgUaLNRoyE6
	 QMPBORr8CKR2ihE5nf9NJGMXBofdHuO32FI+9mv4gnR3ep51uupMW+YDOMpQYRsqEZ2pX
	 weSsEGk1NrLogYlX2YIxNoLF9A34uxue5ioAdIqKU9+lV67JQ9QpiTZb+OQb0SK1sb8SB
	 XGgHyt4MqvrUyg328C5Izllyt8qsV3eis81tigHBblR732+FBM0jrbKG9mctEBKZ7TBQM
	 xd9A4Hp2Y3GhrHwVIfP8vmBrjdwxIZrCL4xHFJ9OIANPLfbj0NJQn1cRjVaIsVjzBJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=ufI9lQZjERuESeipE2ezcTBUQEHZtIN68AOZp2N7TDk=;
	b=T0u1FYxi56jcybQvGoYcXMkzAAARTdVA9vpCnLUIrjCGE/RhPBTf3hukB7/9AtolsPhF
	 u0sjZWVPskd3RQXnB4zVK7ZhEp7szSIIJw+u7LrbfMo3hn1081lSzdMlZzGWarTT2OUaM
	 DVqR17hvvKo6NFmIny5fjXoUmfgknwSuNgV+BPXszncsK9VkqfU7b8tWBPy5gsJUqc4ZD
	 cV32HtjJupTcv4f8Q1/81kpnCvfXwMuD6nEgY1XAoC8xeTnVZMprlko/k61GCQgMs74r6
	 4/w2XrIHZPBxcQv2yYzYd1TV/9CXHzFSx4dvMaNY/fKOpiL9qaEgOyQ4zS3T55pDxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRHjMtGh;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67AF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67AF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRHjMtGh
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so947214eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783764; x=1794388564; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufI9lQZjERuESeipE2ezcTBUQEHZtIN68AOZp2N7TDk=;
        b=zRHjMtGha9qWxyVC8ezTCGFgVN+MscZDMVpIeJz6hmKx6VCWyDNFV8qkGJeatSr+y0
         zOGGs1VzpCJYIJdPvYOF0Ww4eg46lIaJsdYZYDU6zhx53RS/tAXIjfmtxA18Tcikcar6
         g0y6CnGCOFg6vLQK5IYh0NUqtNnWqKkDLUSun8zpcrXIs05pV0p32ZzP4rve2m8ifO2t
         HetQpK64MmFKRojSJl40NkswzlBC5qXBoBaUWZ7MyHj8AWjd5XtYmzdoi965lZfj2AlS
         1F64LvZxDlCQEiB463HZSTXCicUIza4pSQc4DshwbA5hWH70DVLzSKXti9e+VXmrDyBL
         l42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783764; x=1794388564;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufI9lQZjERuESeipE2ezcTBUQEHZtIN68AOZp2N7TDk=;
        b=jSAxpLKSUb4iQCCsp9PFZlel3I53ibMxfBTMD+LPUT4AvCbaXsd5AKROUZl18tAAow
         4MSaXTkU7xiuUnQdZSBAk7mZgPiaNuHxRkxWpxDP+wGjGF8lLtwyrvjEQMZ+eBjZ6Zvc
         6wJVSlpq3WnguRyGOZAT1DlMxaqDYL9TuxgKl4IKYKV1roFlrsrxGDZX56nUt+3aVk7z
         DZ+9xqo3Qvl5UMbeReYW1GWmO/Qmgdbkq73m2DXraXjkTCEsPC4l+mMFxNvCG+egnfnM
         ogFBFCwjy3Ec6ANSFfLcDYH7/UdyfOLUD+EatVvqo86B0qyTMFIPYtJKjvLBUvPs7ntM
         TmYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKXNsHK5YRzAGM8asUijDB70m9sN7eNEqVvRGxK5/W63RvD7cQjugJWrGaKqM1CzNy7KPlNmmJjjSAA4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t0JK5vJazEkcB1heq+UIhMp2zho2YXU0XOaSPtWpp0R7R4v8L
	tD064LOWh5Y01RXRrg9z6acL2EC8HBKf2SDhzOXn0JndrAFGD04dEVcHL7XJ7gw5USBja2K2
X-Gm-Gg: AYBFou0QDVBcUI1k1x6i6zQ2/VRCZPzTnXiMB9+o/ibYsvRxpW+MStMy0zZpL5srhGe
	4sCZzlsBrIsFvPLckMb2jei+/cubtMFNN/FfbpVIFSyWL5+vno6uuZ2Q/7N8bvJ8MNWlDXFfQRx
	qM4FtrEzOEAVbHJySOvkRmPTCz/GNgz8XG9lFP1M0AoL0gbNi1J+Z2B918wprvSbKRqwnyujcqo
	C1ZTNvdmBNIUX4JKsZZnrZk/56q2MTSKEoZonke2Wa7DLo9Ef+zH3xpWSMs4jFCZcQssWg9E+Pv
	cU8d1odO2ua1AtKbT301qaRChKDvRg1BU6ohfqRDIjSTNXYiZMYR/TNRey7NcwAdpyvK6MVOYtk
	Hon6QcSd4SSjPFQkG5J0L3I/Pi1VFlBMiZop87nsjIssckJTtOIzME47QbzaSaH8RUatb5GqYgh
	0pSUrNhO0oD+2kLx2//HzT25wPVSl0vRmBL1A/PTBtBWZ2YYQ61B6FBV+qDeaflTbCWPLG05afk
	ZZ1r32WQZSsg3Er4v3/AlXeOY+NaG9u/hrxd1NhJk8wDVbeB12FdGVTA6uSjIXVVdLgJQnQ/Ace
	d0TFdiw2VvW5eG9KWqGmuv0IAmLS8Fv8mzfKI/wc+OslIW2NiXzau/M4G/cgWU27wg==
X-Received: by 2002:a05:693c:88cf:10b0:368:2548:c08b with SMTP id 5a478bee46e88-36a4239bcd6mr26660209eec.21.1793783763666;
        Wed, 04 Nov 2026 01:16:03 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm6731967eec.21.2026.11.04.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:16:03 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:15:42 +0800
Subject: [PATCH] dm: avoid double-dropping the zone reset submission reference
Message-ID: <179378374219.68809.15920762511563622507@gmail.com>
To:
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, bmarzins@redhat.com
Cc: johannes.thumshirn@wdc.com, mkp@kernel.org, dlemoal@kernel.org,
 axboe@kernel.dk, dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

On an error in __send_zone_reset_all(), the submission reference
held by the dm_io can be decremented there and again by the caller's
error path. If another clone is still outstanding, the second drop
can release the dm_io before that clone completes.

Only drop the submission reference in __send_zone_reset_all() on
success. On failure, leave the reference for the caller's existing
error handling to release once.

The error path was reproduced under KASAN with an injected GFP_NOIO
allocation failure while another zone-reset clone remained in
flight. With the change, the same failure was reported normally,
without the observed use-after-free, and ordinary zone resets
continued to work.

Fixes: 81e7706345f06 ("dm: handle REQ_OP_ZONE_RESET_ALL")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/md/dm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1881d86111fb2..c373cd3f635fc 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1929,8 +1929,13 @@ static blk_status_t __send_zone_reset_all(struct clone_info *ci)
 			break;
 	}
 
-	/* Release the reference that alloc_io() took for submission. */
-	atomic_sub(1, &ci->io->io_count);
+	/*
+	 * Release the reference that alloc_io() took for submission. On error,
+	 * that reference was not consumed: dm_split_and_process_bio() releases
+	 * it on the error path, so do not release it here a second time.
+	 */
+	if (sts == BLK_STS_OK)
+		atomic_sub(1, &ci->io->io_count);
 
 	return sts;
 }
-- 
2.34.1

