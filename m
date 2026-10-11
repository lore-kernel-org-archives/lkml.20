Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CA4395AD3
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691398; cv=none; b=SuRd9Nm6eJ8BXBtiWzhdzAtF8eGv+b+Dy1Ck7evRWO8fgxv7lunJm0HWzBZF/tsp6nt6Fi/a6f2eOkNzT1PS2dGLxX0ItswPij8AQeHoKrU8TNWJYeL4AVYa2thT7uzLzfG24b1wWlgbP4SE7wbauFXKH7m+86SkBsmBTZa1aIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691398; c=relaxed/simple;
	bh=AVILD4NIFiaHIKZF3dObJ7wQt2O+e8whBy0FyrWCgMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRAZAkxTUR7jzVcUkcsSla0/WWsROqo6FQEVZ0LpGlBCr1JDppGQdlwmjQ9+3N2KM/Zd0nopaNGrZhD6PVUBUmtmowZoXKcnXnXPMpSsy1uzQnmi+IgRqgucwUbl4oAQqZQmKgrpcUhqlj58k9IBYD1cSYWFQwVihkwBk20sCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=vffFsQBk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="vffFsQBk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab62a8250aso474055a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791691396; x=1792296196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uexou8z/rPlM4ERJgzJ952D7p4Fry0pcqVESxFyRPsw=;
        b=vffFsQBkJtUEqrNvbfhoKtWoRTqeYYMBTIpSLDgrSZVAkGt1QHgR51nlzXoYbOxVSc
         YSIwjMY2E6Vgod40cTE8RoIHoiP0idMWyaS9MZCw+P3dP+hsxGIkxJ445vsTOYq0euEB
         g6UbGhbSmEMpdpvX1dzYnEqlUMikQaZVD8OwlOxoq6OjXGZm+h1VEyirEP2D2TevlWn1
         Cd/LPQWuxxPDktUGroQOkU7uDDLQaKDlKlu/3mWOUCfqLxQstkQAx+c8onLc/JpM72BN
         PFK5QaY7GfD4y90/SIf7J1ergzWY7TAB0LbU7seCbesa9nEUFwg77XRuI1FaeBfnxnVI
         +Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791691396; x=1792296196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uexou8z/rPlM4ERJgzJ952D7p4Fry0pcqVESxFyRPsw=;
        b=Yqpun3efMhQJtM/cNtex6aPKlxGvvF/ZlliFV8JznEhzml1uFIMvnrqRU3S/XeegE9
         rvNCy8HI22BekrIuhh5xATBMug+wSgz6PI1LS4SVdYF6DEJszeEkRdR63B6/0iP9B569
         pJIajMjVnEDjGxwlMt8XZAD8OURIBVNBhigUF6iyHpeIjgqd5KMh2zXXphQvWT9D+ZaI
         iusWCj2gIcZmaw1oEmpZH3qPHlYZDBkhFsfvPUj92LZcYvOTnfpCjlntPUlwnONJGz+s
         sit7Dw2bhwItkp6EWO0CCQsVZ9mb7U1i9sKBsUEuDz3qN9Nw5QKxNHmT3lwhFliGD93b
         ONfg==
X-Forwarded-Encrypted: i=1; AKwUvByuD4K5NAXUf2NiwZ0mfJwXudwahAI2rUYAKKU5OxJnB4+YIWaAPP+HrYubVJKBgq7S+yx5paku/NQ5qIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfm/eL5ynijwgEZkl19U1sMSPziKh1/l4RHPAehwrXLvTVKDJk
	J/F6StP4DVjxI0jojnKv9tF1wpaSXe65CL/E5w8u8mO8raPGh/yc7AB28temAV2ztpA=
X-Gm-Gg: AYBFou18VnwLP7g3RcEOSt91jwpqBQS0e9K8Sn+1R3oaGVEJVUCbcz2dBJgEOAWvZGt
	gDs6OZHsx7iZbb9/9lzIG6/+f0g38PUEgahMQtt2fmXJ7ss3wrblqgqixSV2D4aONNrtDgBINTu
	DxviWOAJNoOPrT8YDYwmzG1W4eYrs3nfSw33Jm4zw6D1VgiLyPIh+NDxMTUykruNrik4iPKU68I
	+ZfcAww/87mZscIDqf+VJnb0ObntnIleSHjVEuGvE8tXuky8oO+UzL9dEUHrCN1xVsz6bHORyUG
	Ly02i876FBFB4EVnxV2KseGHlThGUB2X2L4OgAmTUBk9WnlJ/UvlQjEoM9/0Zpd+eX3fEpT0t4L
	XmNWF7HmEeeYXEtpoekvo4wN7EyDvCGJYfiqAyF0xkmXLz3c42Lq9Uc3z+DwmyM1PwJNde5PLxy
	ejInMhd/PzDTUHEXasXRLRRqqRiAOuVjVooR5T9aGgBhu9xDKmml9bOthZK0yDKpWjD3qi1Te+I
	hK0NHPKgaWPMFSwqh/pRw==
X-Received: by 2002:a17:90b:2e4b:b0:3a8:195f:186 with SMTP id 98e67ed59e1d1-3ab3a9fc457mr4519518a91.42.1791691395711;
        Sat, 10 Oct 2026 21:03:15 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:9657:9541:a576:7d2f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm10519758a91.5.2026.10.10.21.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:03:15 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org
Cc: Mike Christie <michael.christie@oracle.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v2 2/2] scsi: qla4xxx: advance the reset-sequence array cursor in poll_read_list
Date: Sun, 11 Oct 2026 13:02:57 +0900
Message-ID: <20261011040257.2017421-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
References: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qla4_83xx_poll_read_list() stashes each value it reads into
ha->reset_tmplt.array[] and is meant to advance the cursor so the next
read lands in the next slot, which a later read-modify-write entry then
picks up by index:

	index = ha->reset_tmplt.array_index;
	qla4_83xx_rd_reg_indirect(ha, p_entry->dr_addr, &value);
	ha->reset_tmplt.array[index++] = value;
	if (index == QLA83XX_MAX_RESET_SEQ_ENTRIES)
		ha->reset_tmplt.array_index = 1;

index is a local copy and is only written back to array_index when it
reaches the end of the array. Every other read reloads the same cursor
and overwrites the same slot, so the array is never filled past its
first entry and a read-modify-write entry referring to a later index
gets a stale or zero value and programs the wrong word into the
hardware during reset recovery.

Write the cursor back on every read so the slots fill in order.

Fixes: 6e7b429259fc0 ("[SCSI] qla4xxx: Added support for ISP83XX")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/qla4xxx/ql4_83xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/qla4xxx/ql4_83xx.c b/drivers/scsi/qla4xxx/ql4_83xx.c
index 44d285af22727..2ac833c5b1400 100644
--- a/drivers/scsi/qla4xxx/ql4_83xx.c
+++ b/drivers/scsi/qla4xxx/ql4_83xx.c
@@ -1117,7 +1117,8 @@ static void qla4_83xx_poll_read_list(struct scsi_qla_host *ha,
 				ha->reset_tmplt.array[index++] = value;
 
 				if (index == QLA83XX_MAX_RESET_SEQ_ENTRIES)
-					ha->reset_tmplt.array_index = 1;
+					index = 1;
+				ha->reset_tmplt.array_index = index;
 			}
 		}
 	}
-- 
2.43.0

