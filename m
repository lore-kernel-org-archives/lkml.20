Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3723CF02D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438812; cv=none; b=Cuath7NdaWJ6QBD2vYRYbWMcyggI0yjLcn+8IaVd+N6KnXZihV/iE4+QgAkMf5rqEMpPVStsytTdhsl4ksoa6rPgr/CJbfBHGp/paFNizZnZ/c3LZI+qzqOgo2cKoQ2Mv5GnilIwdoX2Q9O6m14ddPnts5nicemzXbRLYMxLA4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438812; c=relaxed/simple;
	bh=gX4hQSouN8s+CbczY594VMsd3DRCg/8bnFAtJzDsdNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0sONhVbQobwGNaHb46YJUFtD0lWUicD+kEkez3PtRUsdlOt8Oqzd1Cl5xnjkDu/CN8Ed9HaCj6FRzapswrIXl/wKUTlwELHQjgdL/FJquyErhg8gklPM8KSJbRIxHjctcnnBmWkHK240Qa0B+sjdlzTMS+vge+ilKfdw7TQOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSR+WsUz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSR+WsUz"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so24491825ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438809; x=1790043609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2LCKAIdrSOn2UAx95wNV3vc+hcH1jPg+F2kzPFyeMw=;
        b=nSR+WsUzwX6sPl5jq9HT2x3PqbqmfH27Yk+s8Kwg+YMDf+r0fb1RCsNi1w7uMUwLrO
         i8hZgOyLhhSeBe4LusPzm2nVg8ch7JxAbGO/BM2tsTgFWqoGJrE6cALIdHX47KAqBtW8
         eo2p8kwe60DQnza9njXz1vy43Mwd0CoQJWAiYxkt8U17c9yfA0CYlgaHuEMZy4w8dssO
         fYIdvJxkHuUsxLTYX3dMs81y1o8ovobTyLVLzJtUXK+zJlcMzxm57VqUBo/UnRmqv1f/
         k0kKcCsCWlSHF5fxs76klVRFRTEThNCtbLAMTLaA5zuMSu9S4+RnGuTrAFLn8iEWyoQJ
         rCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438809; x=1790043609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2LCKAIdrSOn2UAx95wNV3vc+hcH1jPg+F2kzPFyeMw=;
        b=DseUdwLHJckXXU9wUy0+jNc76+7bBc8yoe/NWBeWSyRSfsMRPia4XKloXfL4+pP0cn
         LIpEGmboQhek21NNmzy8gvRZdY/NO8YrZUwNvsdeEfagK31ylxNL/mhqKDCnTCnmbjj/
         ku6NLcWiDTT8Ir8umcZgbvJC8t3BD/V+mDD7B91zktxUfrYIgA6UsqTehxrT3yqY98Nt
         ojb6PHCQCSRtMSRDazV/A/UQ6+pt+c4ud4+Hroc1V10iTkJI/g1AjYaLPPhNYSuuMiKK
         lFCMAt1LosP589SyKooXoaMaD8jit65ikfcwXgQJBhdvnjGZVzJIP5eM1ZRLzli2Sorf
         pHOw==
X-Forwarded-Encrypted: i=1; AKwUvBxvfnBvLvhhMc6poRzItjv5oC6pAvdvrxx0xEJ9+c/n8nWJRE3aHvdU6lQ+4YES4XgYhOJUYm1Y6VqrNtU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBPfU+ryKIkbIgSUiOCjqf8mbn5lZUhw+rYq/3ge82Qp3HRbH/
	SIdBJhMao4QsoYuaiqgKkyKoR9vhZ6wwUolw45QOnTdXdNpYN4OS2UL/
X-Gm-Gg: AYBFou0AYw7J6qSob5Acw8ioSjAnpkHP7T5tHneEyIgVwAlOsVKpdcks84gxePLbtvo
	+6TikaXXp2nEQ0AHtWwz5Bf4NIQ827jUFCRr5/5quBf09BdKdAe31P0C4AhKkW6+bRebaJ1zZS4
	wDPD3pFyMhkju3rYRpyztDB/m52Txi/2VL8mx6OZo4xgbhAw60C7M9ChGdy48uXXsrCb8CtrR+O
	u0CJPFJab+RR8QK+cEP9ysZYAe/PtXqOSSZwy2H5RnrTZu+HOls4M+AhplEjbp4YHdAb2P6as/l
	TkKAV68nPVXjtykDQ7whkt1E77K76+YKb8U/rdXi9Q6j4ol0Z2kTKoeyWGinWaxtZmu93WenajT
	NQ8yXv0pUHdloQpYuww/4q2fVtt0pfOf/NoEotZ0mJmTU9VSO+ADh33Arj/OGM1AtV1swOl6Wr4
	MDwbo9Nr0ameSBtn1ptbQ4DoCnTp3lrNQ96n2FVAXj+khe1vmsLYDphWfW8OdrRXmKvYF2X7wfi
	YNjBAzGvxwo/MtLIf4nqw==
X-Received: by 2002:a17:903:f86:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd6c5cc385mr103906155ad.2.1789438808551;
        Mon, 14 Sep 2026 19:20:08 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce9ce0asm59236715ad.27.2026.09.14.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:20:07 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme-multipath: fix underflow in ANA log bounds checks
Date: Tue, 15 Sep 2026 11:19:56 +0900
Message-ID: <20260915021956.3142320-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of ANA groups advertised through Identify Controller sizes the
ANA log buffer. The ANA log header and group descriptors independently
supply the number of groups and namespace IDs to parse.

Both bounds checks subtract an untrusted object size from ana_log_size
before comparing the current offset. If the object is larger than the
buffer, the size_t subtraction underflows and lets the parser read beyond
ana_log_buf.

Check the current offset before the first subtraction and compare each
object size with the remaining buffer instead. This rejects inconsistent
ANA data before dereferencing a truncated group descriptor or walking an
oversized namespace ID array.

Fixes: 0d0b660f214d ("nvme: add ANA support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Affected versions: v4.19-rc1 through current mainline 587858367581.

Triggering conditions:
- CONFIG_NVME_MULTIPATH=y and the controller advertises ANA support.
- Identify Controller sizes a 52-byte ANA log with MNAN=1 and
  NANAGRPID=1.
- The returned ANA log has NGRPS=1 and NNSIDS=16.

An nvme-loop target returning the values above reproduced the host-side
KASAN read on 3/3 fresh v7.2 boots.  The first report was:

  BUG: KASAN: slab-out-of-bounds in nvme_update_ana_state+0x2eb/0x360
  Read of size 4
  Workqueue: nvme-wq nvme_ana_work
  nvme_update_ana_state
  nvme_parse_ana_log
  nvme_read_ana_log
  nvme_ana_work

KASAN identified the access as zero bytes beyond the allocated 52-byte
region and traced the allocation to nvme_mpath_init_identify().  With this
fix, the same target response produced no KASAN report on 3/3 fresh boots
and was rejected with -EINVAL at the corrected check.  The changed object
also builds warning-free with W=1 and an x86_64 allmodconfig.  Reproducer
source is available privately on request and is intentionally not included
in this public mail.

 drivers/nvme/host/multipath.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 75dbb58286a3..29d447a5d0de 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -845,7 +845,8 @@ static int nvme_parse_ana_log(struct nvme_ctrl *ctrl, void *data,
 		u32 nr_nsids;
 		size_t nsid_buf_size;
 
-		if (WARN_ON_ONCE(offset > ctrl->ana_log_size - sizeof(*desc)))
+		if (WARN_ON_ONCE(offset > ctrl->ana_log_size ||
+				 sizeof(*desc) > ctrl->ana_log_size - offset))
 			return -EINVAL;
 
 		nr_nsids = le32_to_cpu(desc->nnsids);
@@ -861,7 +862,7 @@ static int nvme_parse_ana_log(struct nvme_ctrl *ctrl, void *data,
 			return -EINVAL;
 
 		offset += sizeof(*desc);
-		if (WARN_ON_ONCE(offset > ctrl->ana_log_size - nsid_buf_size))
+		if (WARN_ON_ONCE(nsid_buf_size > ctrl->ana_log_size - offset))
 			return -EINVAL;
 
 		error = cb(ctrl, desc, data);

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
