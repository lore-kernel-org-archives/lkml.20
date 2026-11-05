Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855032;
	b=p7U8lTZWIHgNkzL0Zb2gfT82pNZl0q27fRLhzgIWHMGgnMRSnCQAkP+YgvMqB/Juk6p3
	 qdkpSsaNE814H6EP+++xjMUUSjJ8Ve6TtnRko74PY/L9sBKMAzE2IGuJPCAWhXmBcB8hY
	 vm0z2vEeseqWcls9YTL0/2tuF++FEw+HXiCSmr5RRhqSqAZl8WLUZLL9klKFjRoEwUAyJ
	 obm+YMMmhvLivw1U6yZ5m4t1BP0hIDGh/d12wZBC15SNSsilxiP1knpJAQObu/nS/zfzG
	 UNZQbMpgPtRYlTOeTGXNiq9AMWxpf1rF1am4tsCA1D4GFPPY+BVC2kf/z2G+n+rzFAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9/MyriLLIFlAEHMufWPIWBvD7cPvXwMz6qb27EKImvY=;
	b=ISWd5YPwKh9/rx/j3/yKk6K+nX32emgc2bakhJkj4hkvHPhMEe7NwZM3q7VppQC6p509
	 VcWZHAr0CmuRNk6gzs6I9zXxvJ18eOV3LTxe/Sesi4Ipl0oRi4/PiFUi2+qG6kpY6nGvm
	 jTxvUpdccKCiTx+Q/EPPfupVvKF1/sZ6qP4AyOnoZ5uPL+v5qF5x7Z+C3TiEEu1N9qD1W
	 eckKnPySOwvtoUqGChjNO68Vj4U9ILuObI5xi1OUODWwDQShiQW+rcQrt0DlbR0nTijk0
	 0DJb7HZt/lJVTalzPkwPX4S28YgAUNemOkMuX2wKUBICurIJiMowUxg/Lbj6UyZRjJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eK4UPpiE;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC4606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AC4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eK4UPpiE
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8446af403b5so896877a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855031; x=1794459831; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9/MyriLLIFlAEHMufWPIWBvD7cPvXwMz6qb27EKImvY=;
        b=eK4UPpiErrl4l7SqxayZeQBSeqp3a0aHy162SBx8mFLn3ae6nYQqS0pc5V4jrsEc2r
         7HE0+xrI49crfF4O5Nq8OCOEs8/acn00YPGbekFh0OzhyCbdlKFy2FMWYdw/iw9pRy0o
         ODcHSOYabbt6Lmecs5rJwELO3wx/K3s4zvje7jEOWigRTM4OCDjZSpnNLBHJsOlMxhqM
         8cyebKBsIG6Gny7B8TQajdEPwFlM4Lyge36404Zq+eaLQKnX9Deiem+56DFTVPuJCKLf
         hgu6TnJQOGonG5TkncsLTn9THdEb2AQKidAfOlqo2ntcUrJy2ZVHcH91el5wdz8jwVcr
         fXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855031; x=1794459831;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9/MyriLLIFlAEHMufWPIWBvD7cPvXwMz6qb27EKImvY=;
        b=uhkzZcEU8M3WmYHTp4AhlhcBGUHM1SQoqDEqROK7w/ikgbvVHYMiO2+r99xFxg7MQU
         dvNvdpmm5YMc6f0VVIXiO7ZPF2iqRG/DDG3Qa8U869Mmtr2KkTnjkUctuO+rYBTGmCdw
         UmWOrP/y1L9a17BpQUc/Uew3krWoBsnLl6KsG4mEI7L5e5dUDaiGK2IGq7V/uPaBTH3f
         IOX9mTkB2g1I0iGzO9cWYZDigvvMmixqHGwtFGXLWPcPcC2pfr3QBPmKEOIFWg0PkY9M
         Xa+nOxyVw+0icVhdAjlkR545/XxNQO/ZKuKMHOpYSr7F3lrXt1CEBn2NZKV7ppy6Y+n/
         3Rsg==
X-Forwarded-Encrypted: i=1; AKwUvBzuR7ru3BfKipJhEgpKI/vmRRLK/Tdy9hkbwcyg1QBFn5WLojrOLMcZVLfbXfrt9isq+l9wENfvMfVt/rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++4TRdumeN1uh/TRwqfwWLmk408ZdCdPh53uQaSXg7rRAnemzG
	+dsMVwRczuWTR5M5Mk2Gq7A0+qhU6/huhBMxvd8bKJypVUogefnLIY91
X-Gm-Gg: AYBFou1v2ylRnlvKgRPJwlGbkVe1N0W9kVy2AywShJwSdE0dACKrGHz6181ZdImZFTQ
	Iqu70CQU3jD69g9cdt5zOcn51HQcgfeffcbenG+eznajXcqDl5sUMSROoDxZVfo/Mn8oaRNrYMb
	dSfEeGyU5UpCjgJiAYIGObw/yVkde+1t4ctq7/6nWkkkUI92R3whjhrDmo30tTCo+6S3w+Yi4Gc
	Xt1JZsEW4JzoX2GSQzFwjIlTKKYAfYsDJnSiev/p36o9fWBViqs3cTksj6LkDPFzA31pBbOrMrY
	nf+Ox8x2FuzBic7SxsuOggyyVfsxlZM2rtttccq6xQQEY9aW2RudrHDOspfWxgDpOz9Bc2Z90L7
	ZDvFsfXuPp1Km2xGYeBPYI6x/rWFtcWZQcLsF+hWuVzDHc/MJ+9X1OSTL5V/Kesybf7UOGJUvmI
	pxVWNzSLIC2OnrSgq08Gqnpd9arcOYKsYGrbmH4LEWG7uvo+3e2VDi5plXNNemleAGfgHST4+Mt
	5cK32CyBMXCvv5QhY9P2HckFQEA0uthu3xI7EEY05uTIJZXr+0c9MO7Qu5mz4xlWPaKZRp49KXS
	UUBofrlwxG8Yw2IRP3MVqBkVRieo+7EuStlRM0XBVBHtMCwJ0Q+vD8ojxMhoyjZ/B0Hxd/RfNKD
	HIuezDpZFNpX4AH3ZzwBjx6jSKEh0Ke92MJ0lTnHBHtCCuvhjajW+Nwufz8B6D4DhSKGMq/QZaO
	9etqB1qJM5TwwgTQRdjKbxsx7E+K/g9vU3hNSt8dc6EbngY9GFt+U=
X-Received: by 2002:a05:6808:191f:b0:556:82f5:5aaf with SMTP id 5614622812f47-5640ddca454mr13902714b6e.49.1793855031069;
        Wed, 04 Nov 2026 21:03:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdfa53sm3256982b6e.15.2026.11.04.21.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:03:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 22:03:38 -0700
Subject: [PATCH] mtd: core: skip empty read and write requests
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5FMBBA0V+RWZukgzTyfkUs0MFIirQlRPy7P
 pZnce8Fnp2wh19ygeNdvCxzBKUJdGMzD4xioiFTmSZSBfqttRLQBoNs13CiLLgT6kZp05a6oJw
 gxqvjXo53XNWfYzlxF/43uO8HzgQKvnoAAAA=
X-Change-ID: 20261104-submit-mtd-empty-io-v1-6a06db864131
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Converting mtd_read() and mtd_write() to wrappers around the OOB helpers
removed their zero-length checks. Neither mtd_read_oob() nor
mtd_write_oob() stops an empty request from reaching the driver.

For example, the raw NAND read paths select a target and can read a page
or its OOB area before checking the remaining length. An empty request
at the end of the device can therefore select a target past the last
available one.

Return success from the common helpers when both lengths are zero,
after mtd_check_oob_ops() has normalized lengths for absent buffers.
Keep the existing range, write-protection and operation-support checks,
and clear the per-request read statistics before returning. Both return
lengths have already been initialized to zero.

Fixes: 2431c4f5b46c ("mtd: Implement mtd_{read,write}() as wrappers around mtd_{read,write}_oob()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-198544@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..93e7ff3ba8a0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1805,6 +1805,9 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	if (ops->stats)
 		memset(ops->stats, 0, sizeof(*ops->stats));
 
+	if (!ops->len && !ops->ooblen)
+		return 0;
+
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		ret_code = mtd_io_emulated_slc(mtd, from, true, ops);
 	else
@@ -1849,6 +1852,9 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	if (!master->_write_oob && (!master->_write || ops->oobbuf))
 		return -EOPNOTSUPP;
 
+	if (!ops->len && !ops->ooblen)
+		return 0;
+
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		return mtd_io_emulated_slc(mtd, to, false, ops);
 

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-empty-io-v1-6a06db864131

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

