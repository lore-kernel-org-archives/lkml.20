Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7D4C7555
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602384; cv=none; b=dKIn9vijOXiTxvK4XMsBihxtGIWnAiMK/B30hUmeGtgWQbkBmp7d1sN4gVuvzZcH3OZ6kWJNDonSxuEa34zN7NYLJvaZwINNv3WIx6Jtf/F51RvdyXmO0PVn4jiiwzqopDdDjSxLmThJZGpG8NWgqGQXlubSulUAejJoLkCqd4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602384; c=relaxed/simple;
	bh=wiOPOVzZkfrXRxbFz1UgU3+Xbr5CbqnKoLrDHMr2xo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osvPoayjQc61yX8ZQ5gS0dQxv/l2yHAoTud8I5op+PQP5FUBz2BxEjc2Yz/gfpEHEZsjmea+hRuHYWn8z1gEpwP62Ft0CxI8uw4QwxmdlEFMkMarcglX9oL1nZ1t00YRzcdlL0t8WVuf6Tu++IBJdC4BfRqUlxFum6Z+yoXIe3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A103FaSb; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A103FaSb"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso1298250f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602375; x=1791207175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z28dlsJTIpkqTAOZ5w69VF46XysVuY21MZeRZQmbEno=;
        b=A103FaSb31zfTZFdiyeg1rlVNhV/Y0mSzi1pmQMEVhQ8h5MmC+LzF6Loh5BR9R33Nu
         cJa0QpNtbiOq+814q1zyA2vrH/3JT8bXxDuJ0liEcR6uz3vAIPvzV3lKF6t+z+kRYepk
         AxFsfktwN0mRy1zjKsAIsUdKrBraHkOnIdqEokmBv4DzlbM6ctZiGT0tLs8xUp2jcIRq
         Tw4fTzJA9EB6nlXzd80bMpQk44iyuYjdQ2HrqXOQUH3yz85QDVbgMgwL7Z7waULl7lwz
         SFB7QL4L0BB0On9OuWfhYBapzspB5/8MCoMzobna0Wf3GetL1lEtETI5ccEXEybzOjE0
         9ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602375; x=1791207175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z28dlsJTIpkqTAOZ5w69VF46XysVuY21MZeRZQmbEno=;
        b=QLKbxllmUKvZifdXbzTveHvfsmnBg2ftG+/SOxOsqSMrylw5r4NdOsHikRrxYlYnZH
         IqVP5LDjQxWpdr6wuquCoS+UAIZPa5beuzXZwJUv9vBoEIOu1v0xWytWd6ZaOuu4zc9H
         wFdwspvhCugjV94jVN8VZx/U1Sbe2aHQmoBJKwDjxYLII7x3nEs2VyHVueCMxiItF1s0
         9rR/l25SkjzbfhO62SaYo4kSVs2g6ysIWYpI3I+Ru30Dr3oD6U8+K7DYstHifWLllHwK
         nTTLYXQZ7JOvHTurnq3La0gbUvkvboHhhMguacc7WSA/WaUUwzIcpPXB09Js9IcnFUcY
         7syA==
X-Forwarded-Encrypted: i=1; AKwUvBzZViZs1ORCILu90CGjGBuB5734zJ5MHTWf3RByqp6wGl9SHZ7dAvLua+xsIYxmIfyaWSDC25jcSkKfqyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJyVt3fEAaOB8LjRm6CZ2c8Q1iXmqGJFoG0eScMF/zwJRSnTJQ
	XAPHxW7AJ5s18RTHRmYNb9g7COH03aqdDAJ2Vi5Iidgl0YC35T2V7RCq
X-Gm-Gg: AYBFou2Txw0q150tKlEF9xRG6shk903cip9nKoJquhYzRfWjAplp26uTU7/d1e5jrnV
	O8/68HlhoqflNRhKsUK+4N+mUXyGQieR9cKDGV2RTmqtsrwDSCbNE2cqOma6IStfldpnVYAlFC9
	DlyIWFmDeXaq+Ec6U9Ou1wxQBQ0G4vPQFH/X8HNXbOhUwuTlrBJtBJw1NXKL//+tjkWGmZoopoi
	aTA9Is7UEO5lwSC/yyfstrwxnmX4QP9e/CCK9VqRAExTw4ny43CIb9Y/ZRWnYJzDUGk0Po1ca6e
	E3UYAOMmmcekCM6pMI8F/cEVwoaVK7iiOMxQwh1Gepeqakz6pvlIFFSHyaO0AmHhxerUK2eyK0i
	ed7y8chNA72XY/vC7m4FPTA/Y5zkOjKHZ0tLITBlY8dbGLmFOItOMy6IUTWl0tnKqIMMbzsDqi1
	gJAlegnnu/q2dYjhtCimMhO7kMjXYvIl8Eej6d2d7fiLveH+iTdsfCcLTyTjPCstLLQclnXF7Ff
	HmypInp8bURl0dpvN4IypqjetS032ToWGQkV1HiXqNPuoPjjOv9LR0HmZRVsmRUc2qmhcj7EJUE
X-Received: by 2002:a5d:5d87:0:b0:487:342:d147 with SMTP id ffacd0b85a97d-4887db39b7fmr20252053f8f.39.1790602374884;
        Mon, 28 Sep 2026 06:32:54 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:32:54 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v7 07/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
Date: Mon, 28 Sep 2026 14:32:23 +0100
Message-ID: <f950827b5805d13f08f0060df0eebc4ed56814fc.1790602223.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790602223.git.asml.silence@gmail.com>
References: <cover.1790602223.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

Rename the blk_dma_iter based nvme_pci_sgl_set_data() to
nvme_pci_dma_iter_set_sgl().

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index e58bdd9a4098..bb8051c62926 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1277,7 +1277,7 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
-static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
 	sge->addr = cpu_to_le64(iter->addr);
@@ -1307,7 +1307,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
 
 	if (entries == 1 || blk_rq_dma_map_coalesce(&iod->dma_state)) {
-		nvme_pci_sgl_set_data(&iod->cmd.common.dptr.sgl, iter);
+		nvme_pci_dma_iter_set_sgl(&iod->cmd.common.dptr.sgl, iter);
 		iod->total_len += iter->len;
 		return BLK_STS_OK;
 	}
@@ -1329,7 +1329,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 			iter->status = BLK_STS_IOERR;
 			break;
 		}
-		nvme_pci_sgl_set_data(&sg_list[mapped++], iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[mapped++], iter);
 		iod->total_len += iter->len;
 	} while (blk_rq_dma_map_iter_next(req, nvmeq->dev->dev, iter));
 
@@ -1492,13 +1492,13 @@ static blk_status_t nvme_pci_setup_meta_iter(struct request *req)
 	iod->cmd.common.metadata = cpu_to_le64(sgl_dma);
 	if (entries == 1) {
 		iod->meta_total_len = iter.len;
-		nvme_pci_sgl_set_data(sg_list, &iter);
+		nvme_pci_dma_iter_set_sgl(sg_list, &iter);
 		return BLK_STS_OK;
 	}
 
 	sgl_dma += sizeof(*sg_list);
 	do {
-		nvme_pci_sgl_set_data(&sg_list[++i], &iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[++i], &iter);
 		iod->meta_total_len += iter.len;
 	} while (blk_rq_integrity_dma_map_iter_next(req, dev->dev, &iter));
 
-- 
2.54.0

