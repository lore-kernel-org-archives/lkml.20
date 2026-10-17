Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6D1891A9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792251544; cv=none; b=VzUPiiIh2FvjxjPwyF5qKzrCr2npTX8cExZdFLon9JrH+6GpGb0gaqBAYFy1EJWCN0OSgJ/PJoRP6YXptlRPCC1lI/utVSsOkcyU4YrhH3Sz9AICFVfizPfqG6mVob4RM488rDuVOj78DOmsLWl3eoV1mZHrWDxp14lEVFaqmZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792251544; c=relaxed/simple;
	bh=bNO8wGejfT0WyWIU1CaXfQLPO8Grl09rZ8ggiMDYvdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZ7sFFZuWwzXHRU2NJXFgJ833lWJNRgpEYZb0366JmrNx00pmyu9sDmmHtEQGNj2v/VdpM/hJilLfYHMruFP2NPlqirF5w2wxJ41h5Nh6F2vTL7BWJaeortfAACJOJv2ViO0Lonw6WvEVZZxX2daSoIRni4isKzXze3nwDaTreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=dqcCr0+m; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="dqcCr0+m"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058f74a54so76002b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792251541; x=1792856341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EE+MiTt74CK7KkF/IZaKJAB/iw+nwq5cMCvHfUJcFlg=;
        b=dqcCr0+mSDOfWzwIuvtDJHiOU/HgEJMsxPxy4OLy0x6sSM7/D9VqvMx0ugkkMgtcBg
         keLd7RF7nPq+Yny0LzMXfgzTfyz/5xOHaun6QTt64vKUv+PMcNoE0BpwZm4U3jBQQoYc
         IHBFO6UklEXMTZFsoFEHoHR1YFoyef66YgnVq+xK9hUzCNSX5w+e7mypwBQYd8FuTaM9
         TSh3uEFQoF0j72ETb5aQni/SYIYZZW0rtBoqAixnNCoe83h/BdwqZBCbSUV6uc97I/tT
         zf9n4lyyc9haZb9lnEEvKsv2+4njm7dlU4gF1d+qGYFIPlyY3CLhJ2HGhxfyJZKcwwi1
         ekRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792251541; x=1792856341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EE+MiTt74CK7KkF/IZaKJAB/iw+nwq5cMCvHfUJcFlg=;
        b=0uxYH2VagcDY3x9W1Saa1xdne3BAO9vV9pXYSxyFL/al/dauoyqqZhjnAGc8WUjWKF
         8CtdbPyOyqo/obQthp+OFrZpzIFTF+o05d5/q03usAKS19E054OvlR6FBSZQQ4PuOWQZ
         CRojYIetac4MqTeKsTtyk+O8q3+Rx+F2FOWFyfkGL3U+sK/N2ev09J7u7zWbbdIlLkUV
         W43qaohSAuJAP+0XrsNkXlXy6RMfEys6iAV++XMEj/J002gC7Cipv0qM4K46pJXpf5//
         1o9WkThUlfPEBazehb2T2e093RLCQTTrXN3DRrpzE/V2Nplq8LepsvPovTpl6QroGYYL
         y+vA==
X-Forwarded-Encrypted: i=1; AKwUvBzAS0hvBa5WlVeg2uaeE9RDB/doozWDUf8jHcCso4SpHS+MaFXb1EaNjvFr/++NT+PO0BI+2WgoxBCIsRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEVZuG5jqD0xNpxLsGgB54tM1+9NBvsMzWvW39jaD9oa1wytwB
	I1hu59mfk/DpZk53dyQvmQrKsxfkh28rHzAWKvHwXt0wqBJQQaP08K4bS+B0U8G4bRQ=
X-Gm-Gg: AYBFou14K8B6I9eiPQmIeFZr01322Pe8D6oWUBA6ehDM89MJ9e217zxfvgzT7rxQR4T
	rfCI63G57cuiBHQBz361JRFRQ3UBQLiyp0PcKOl8VxMY4ncZPa6ebqA3cQmL2cKaxf1F2U4y2bi
	zX7+jLX5IEfGE/1wHV9ox/XpGDbwNWOjDkyooi79o1seIvKugIz2wQrxJXCEpDDvfFbxH77e+rj
	v/s3YkQRR8Stk+FXxPUlOAn1DdHo7EdjnX4AiAUyZI1sroeadIsU5r70274hVmJRy5WFgloN073
	oM9WKiI3IMA+u03lZ5JXqOqK74ZP6eVRHFFnYUHblTWDA7olnLtgd9eumwHZAV97q88dYfsgIX2
	DzPbHNcElkBxKQmeSHeUze+5tJo4G3lMm6STTM3tVY7yHO6s8e5Vl3IpbmPaeyNQvoRwomOTtzH
	0DUkTJqHlwvCxKxxXQtNwvdqHXFlmMeErKVrM/xaEikbnxO6NVUTxw3pMnl/vbSh0j0C+RNBWnr
	7MP/peay+6ZR2bAi8GppcChWeQOi7x4
X-Received: by 2002:a05:6a00:4f91:b0:89f:9ea6:1de6 with SMTP id d2e1a72fcca58-8a04c80effcmr2316077b3a.24.1792251540821;
        Sat, 17 Oct 2026 08:39:00 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:6c71:58da:ec95:3c04])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f579479ebsm2350277b3a.40.2026.10.17.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:39:00 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Justin Tee <justin.tee@broadcom.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH] nvmet-fc: fix use-after-free in nvmet_fc_ls_create_connection()
Date: Sun, 18 Oct 2026 00:38:05 +0900
Message-ID: <20261017153805.2528275-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_fc_ls_create_connection() looks up the association with
nvmet_fc_find_target_assoc(), which returns it with a reference held, and
drops that reference as soon as the target queue has been allocated.
iod->assoc is then dereferenced again by nvmet_fc_makeconnid() while
building the connection id.

The queue only borrows the pointer and takes no reference of its own.
Once the lookup reference is dropped the association is kept alive solely
by the reference taken when it was created, so a disconnect LS or a remote
port unregister running concurrently can free it before
nvmet_fc_makeconnid() reads it:

BUG: KASAN: slab-use-after-free in nvmet_fc_handle_ls_rqst_work (drivers/nvme/target/fc.c:193 drivers/nvme/target/fc.c:1841 drivers/nvme/target/fc.c:1995 drivers/nvme/target/fc.c:2021)
Read of size 8 at addr ffff888179f1b000 by task kworker/u9:2/1167

Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: nvmet-wq nvmet_fc_handle_ls_rqst_work
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 kasan_report (mm/kasan/report.c:595)
 nvmet_fc_handle_ls_rqst_work (drivers/nvme/target/fc.c:193 drivers/nvme/target/fc.c:1841 drivers/nvme/target/fc.c:1995 drivers/nvme/target/fc.c:2021)
 process_scheduled_works (kernel/workqueue.c:3322 kernel/workqueue.c:3405)
 worker_thread (kernel/workqueue.c:3486)
 kthread (kernel/kthread.c:436)
 ret_from_fork (archkernel/process.c:158)
 ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
 </TASK>

Freed by task 1167 on cpu 0 at 405.998150s:
 kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
 kasan_save_free_info (mm/kasan/generic.c:584)
 __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
 kfree (include/linux/kasan.h:235 mm/slub.c:2705 mm/slub.c:6405 mm/slub.c:6720)
 nvmet_fc_handle_ls_rqst_work (drivers/nvme/target/fc.c:1808 drivers/nvme/target/fc.c:1995 drivers/nvme/target/fc.c:2021)
 process_scheduled_works (kernel/workqueue.c:3322 kernel/workqueue.c:3405)
 worker_thread (kernel/workqueue.c:3486)
 kthread (kernel/kthread.c:436)
 ret_from_fork (archkernel/process.c:158)
 ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

The buggy address belongs to the object at ffff888179f1b000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 0 bytes inside of
 freed 2048-byte region [ffff888179f1b000, ffff888179f1b800)

Hold the lookup reference until the response has been built, and drop it
on the error path as well.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/linux-nvme/20260731204504.2396434-1-shuangpeng.kernel@gmail.com
Fixes: c53432030d86 ("nvme-fabrics: Add target support for FC transport")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/nvme/target/fc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033a..f3e80095d7d16 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1796,9 +1796,6 @@ nvmet_fc_ls_create_connection(struct nvmet_fc_tgtport *tgtport,
 					be16_to_cpu(rqst->connect_cmd.sqsize));
 			if (!queue)
 				ret = VERR_QUEUE_ALLOC_FAIL;
-
-			/* release get taken in nvmet_fc_find_target_assoc */
-			nvmet_fc_tgt_a_put(iod->assoc);
 		}
 	}
 
@@ -1812,6 +1809,8 @@ nvmet_fc_ls_create_connection(struct nvmet_fc_tgtport *tgtport,
 					FCNVME_RJT_RC_INV_ASSOC :
 					FCNVME_RJT_RC_LOGIC,
 				FCNVME_RJT_EXP_NONE, 0);
+		if (iod->assoc)
+			nvmet_fc_tgt_a_put(iod->assoc);
 		return;
 	}
 
@@ -1833,6 +1832,9 @@ nvmet_fc_ls_create_connection(struct nvmet_fc_tgtport *tgtport,
 	acc->connectid.connection_id =
 			cpu_to_be64(nvmet_fc_makeconnid(iod->assoc,
 				be16_to_cpu(rqst->connect_cmd.qid)));
+
+	/* release get taken in nvmet_fc_find_target_assoc */
+	nvmet_fc_tgt_a_put(iod->assoc);
 }
 
 /*
-- 
2.43.0

