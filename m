Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863644A3EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049196; cv=none; b=PvB0SEFA5QzyMETdqAlqBZsZkFmbpiPX6mPd5xugeZ/i8gZHUmiZcMNiGXBdrxMiy5+f//xCpM+DrjCPbdKlslGT4UeK7GdzV/WxwhvYP4ttPkKEzOAWTSVcK+fJEyH/QxSytYC7I7eyPX5BSwLX8LxUJQA9WklLOojktYNkfDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049196; c=relaxed/simple;
	bh=hwdNJteCF2UYN9dA77ChB03VK9w7Fqhyx9KhxgEpbDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFg3WRDYUeVQ86EY+xrOd8xmXL9GYJEMI4FqZ6gmc+yTyyRnJMjSrVgNlMRAogFgt039DDnPxTiTVutKoXeAO/TMa4OBiy86lZwGeUbSMXzkXxDDJWTJPGIdxT6zgschtpZdMzDRK2h8inzJU1hkSSiA/DrvvX/B6HOrn2r70GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=oZMGJZOQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="oZMGJZOQ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd3310348d2so3293972a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792049184; x=1792653984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHVIvo7ImdizzbFTBs9Bb5lPLWEkfS0ZMEj3JexZwCI=;
        b=oZMGJZOQQ1CuzRocim424LX4Q3fvbc0PV1eEdWU16mdfeAT1jAr6Y6KjyWcMaRDj8k
         sMQqoZyTftqo022qMsUfi+YShrolBeqUQpR3dSV0UUw5ZkTdnev64JPxVgMJf/QIgw1C
         eFG+G2DhATn5AkbAUXzppRhQTJOcGx8SEGlN26ACUnr/q4vZEeC4QTS1/ts0OWsXWhIz
         tqq8LDvAeII+txAqscInuCSqcZQHZq/SRB3IYl9fo8qGQ9KHOp0Et6mZO3+XTyY5ZV6R
         GiUzFWkts2GNBdDgG5CKvxRPLeF2vcdN/x2pQsgK+isgmcp8DEDV1SekrCxJMgDNBmuo
         BzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049184; x=1792653984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHVIvo7ImdizzbFTBs9Bb5lPLWEkfS0ZMEj3JexZwCI=;
        b=YFKyjofFt7sJUCsArYGUx6bfo+MlP2sgIAMJUGgSSDfnkCAA1Fw2YSxxgRt9Pl4Nb9
         KXsUJbeDNsJQ5VwQ3mVLfSlgEBC4lRdItPPc7HOIIaJWH2uL1o4EelG5dNBwksXGZYzv
         Uf6x7pP4IXyTbq4TRsJQY2WzmRW2w1ofDSI/GGCiCICfx01rNo14EpFNm1rCvV09asRC
         5IIW9utaNodTiXrSbJxhmr/XCQrRkAcdg6JkMV5UZXLya6M8AEPV6+nfR468HEKaZxM6
         bcvDFypsH+LisQCLEkojogRAp2JBoYvguI7jFG80I6UtiDGbFe3FUq5AZn8E7CjXLT9m
         qS6w==
X-Forwarded-Encrypted: i=1; AKwUvBzeZdz++nhBDcqp5f4kIanZ7Ufctnv1eF9+eA2Ibi8M+uU8X0VAkpmdWgB4N67iJyZh5UBDBgUmcmxG3qE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgz3oQvgOMNyAyGCJXWqssV1taQBnXXFbHRakxfdjfyHfKi/hE
	jNgkBhaIkM8Q6f6aHoG1ZBGfSoN92zlx3m6rhXZ4LnUwr0P4j1BuoanIElbHshWXGEs=
X-Gm-Gg: AYBFou3FpzOXlDJjv65kiftj8hxxBbNXWmntmRfNTVgtOs6nFce8/NfsV/lSrr4gzr3
	3yTTPpNbVv6RKIQ2Fk6kn/aqc7ArcnQK6l3gE/JgQ3xU7qf+zQbJ71IJt3yO8lC6TnDOP6ESinI
	uwhC+wd+mmkQipTEtqktBsmCXI+cezx4NRX/XcS9UdzBbVfphwYKnVTJMk4sStPPtvcZxoQO6kB
	qwnzVATlOFeihhy4bs/KqmqiOWoyDDeeRC0tx7U+KyH3//IAd7KI8yr5D5P9cWygz8CsqDaYXCS
	ufKbUtaVN1dgj+8Eko5qlOUyYe9jN1u6g4yE7UOONiU3tU3yyg6jK6sduMuovaUDkXKi2mDMiq7
	62A7Jc0CQgse1oCw9C4Fn/TPXi/eqHER4OolcWC9F3jXI9z7zWmt+L4pGKF12D4+am70zN+uwBA
	/h8xR5+bDSZKyiIvdpRBS4lyj5pmPgYiMEKgaBGQTbtIDo5jwsNNNNOzi0z6klGeMfRFD5iFw6M
	mxUpeg=
X-Received: by 2002:a17:90b:2644:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ac860e1b6emr1889099a91.41.1792049183653;
        Thu, 15 Oct 2026 00:26:23 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac937c4e7asm1754279a91.3.2026.10.15.00.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:26:23 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 0/3] scsi: aic94xx: validate the sequencer-supplied EDB index
Date: Thu, 15 Oct 2026 16:26:09 +0900
Message-ID: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aic94xx derives an index into seq->edb_arr[] from a byte the sequencer
wrote, in three places, and subtracts one from it:

  aic94xx_scb.c  escb_tasklet_complete()
                   (dl->opcode & DL_PHY_MASK) - 1
  aic94xx_task.c asd_get_response_tasklet()
                   ((resp_sb->flags & 0x70) >> 4) - 1
  aic94xx_tmf.c  asd_get_tmf_resp_tasklet()      same

The field is three bits in each case, so the result runs from -1 to 6 while
the designed range is [0, ASD_EDBS_PER_SCB). escb_tasklet_complete()
already notices -- it has a check that prints "edb is 0x%x!" -- but the
block falls through, and the other two do not look at all.
asd_assign_edbs2escbs() gives the first ESCB edb_index 0, so for that one
an index of -1 reads seq->edb_arr[-1]; for the others it reads the last
buffer of the previous ESCB.

 1  add the missing return to the check escb_tasklet_complete() has.
    This also covers asd_invalidate_edb() at that function's out:
    label, which indexes escb->eb[] and seq->edb_arr[] alike.
 2  the same check in asd_get_response_tasklet(), which has none.
 3  the same check in asd_get_tmf_resp_tasklet(), which has none.

What I cannot tell you is whether the sequencer ever writes the value that
makes this -1. The sequencer is firmware loaded with request_firmware();
status_block[] is an opaque u8[4] in aic94xx_sas.h whose layout appears
only as a struct declared locally in aic94xx_task.c and copied into
aic94xx_tmf.c; there is no Documentation/ file and no MAINTAINERS entry for
this driver to ask. So these are not fixes for a demonstrated out-of-bounds
access, and I have not written them up as such. What they do is stop the
driver indexing an array with a value it either has already decided is
invalid, or never looked at. The driver clamps a device-supplied length in
asd_bytes_dmaed_tasklet() a few lines after indexing seq->edb_arr[] with
a device-supplied index and no bound, which is the inconsistency these
close.

Patch 1 carries Cc: stable, because completing a check the author wrote
stands on its own. Patches 2 and 3 add checks that were never there; I have
left stable off those and would rather a maintainer decide.

Worth naming: a response dropped by any of these leaves its ESCB
uninvalidated and so not reposted to the sequencer, because the repost
happens inside asd_invalidate_edb(). That costs one empty buffer per
malformed index. Recovering the ESCB instead would mean picking some other
buffer to invalidate, which the index does not tell us, so I did not invent
that.

I have not reproduced this on a controller; injecting edb_id = -1 through a
KUnit test on a KASAN kernel does reach seq->edb_arr[-1], which shows the
index arithmetic is wrong but not that the sequencer emits that value.

Yehyeong Lee (3):
  scsi: aic94xx: bail out of escb_tasklet_complete() on a bad EDB index
  scsi: aic94xx: validate the EDB index in asd_get_response_tasklet()
  scsi: aic94xx: validate the EDB index in asd_get_tmf_resp_tasklet()

 drivers/scsi/aic94xx/aic94xx_scb.c  | 1 +
 drivers/scsi/aic94xx/aic94xx_task.c | 6 ++++++
 drivers/scsi/aic94xx/aic94xx_tmf.c  | 6 ++++++
 3 files changed, 13 insertions(+)


base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.43.0

