Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877944;
	b=4k4nmBTDd+HI30VzNx+ys41LobkxKOZUIomWXbZ5T3DPKKVOuzBhLv1aZUTVDNrprT4v
	 JrKcwxNKdnR6Lnnp5w1GMjweKsQ/2HRiVeKB4rn9H727bI/QxuaiFRQjf4ZoeqtG4Q6Vb
	 LDiKTPnnbLHBFyOU8RMLYDlHtKGcXh5y1CRMJA9q66zbMwlRu+NiI3Xvduxuoyjx6olwP
	 4J0so3jW6SJn4ZtQdQPD5nxVWTvMpCHYMcwmEi+MHDwYxx1TAchvX+zZXHY+9HsXQKrdC
	 GhkgAJy0JBFpj+iAO7aVgDrSEdogdIGbqL6PBGCCl6ewjF9ArM5jmHschdgYD0QsAxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MWhF1KWrf55vCpf16EXuustcrkVB/1ZS8QurJvWheCo=;
	b=gH3EWa+2694ApQnr21Pc3W8BwvrQ/QyYp0HMFym4d35hmIz6HNkV3sR/E8Aqr36MAOSb
	 Igxw+6HBmwLoAXinbuH3ajYYRUgSWMkU6h+dEZCJMRshhGzpPE3oIZqzqkHCKSbKnJepm
	 QoNKGKmMpF4/47XlkFcVmfASFEr3eWCqe86+l4ASzM8EzHqkttJ+qmvMDnzu4nhSQoLjL
	 BxIw9KEooYHu4xe0+Rw3vx3atO1zR8lcFWHDznxCdW0mEnDMQ8yPhn5fWIUiVuYvb64S1
	 8xXSALGrsbDZcmnAQwAE9rS8N8aCLXfSN+Xr9epaktpwHBiJAtbNURjp5dPI8YSP03w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gS6r+YXC;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B556D606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B556D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gS6r+YXC
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98c5876f2b0so1217879241.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792877942; x=1793482742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWhF1KWrf55vCpf16EXuustcrkVB/1ZS8QurJvWheCo=;
        b=gS6r+YXCZjw4fHLITryR3Gklt2m0L6X8j1EbqX+DvixHBTUurcoh7fSmTx017YUFJd
         PBvFHiRiauhfDG8NqGSKOgbo+Bb5UfzP5VLNkDjgWLRLbxX/ChtlSUgDzJh4pW0XrHGN
         MiNUV3RXEsqkNSrcrDmV2uMUM3xyPTw12XI4vwYS2LXxOaWzzEkdxjNSB1asqxe17sN3
         KGPQLGHU4naPIDlZk+K3P9SilETLT11fPQu4ZyI71qTioMhyWOM2XnnwlLJUFbRd1HSX
         08OSUyMLN0BpDVnMqzen5AhyPgvgf9yfuMDs6Pji6tdUnp2yuOUOcNGGVVGDcbZ9EKTg
         JBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877942; x=1793482742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWhF1KWrf55vCpf16EXuustcrkVB/1ZS8QurJvWheCo=;
        b=d6GxwfBZG4oE2w8huVKNfsL1UpgJ/g0MgutaXYHrDaTreUv8bV/jLxFPzo5P1EgCyg
         DKNYYMhkXPktAyO4HsajQ8uW+x9oBTVdjM36T3HFwTZy2uNyTL6DqaHjEeMzCcxrasNV
         CTrBvtugzujBN2RrdXx6cbMIvY4iCwdzVxeeSZE1Vvvh7ng33tmyCICUwbiydhhYA0Zu
         9ItLaCYpQW5UmigME3MczpjQ7fbDmT51qgvuC8p3Lpk0sCQqrxhCDS+ECgu2Ez5VYuca
         a4DmiTMBFPg12uwr3gydMKQqdi0tq0tdpZ0CrRyPmPu0x4USIECWV27IQijDFRLIhObM
         jJVg==
X-Forwarded-Encrypted: i=1; AKwUvBy/OZNEm84YlJFJXiWGlO0mep6RlP8v4Go8NW8d1xfF8DKNX/QselB9Ct2uqYIk+qd5m7fKDFbfKPTzj7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDdkrzgM/Gbkw4PcvNknxoPghKSqENtjAbSLbeadrvCEvB1bpN
	JQ66MnK9i7Ro2Wvqb8FsluAgW31IfMneSMcwaBX7LOpE4bN854Xl/BVF
X-Gm-Gg: AYBFou1P0pubWts7bk305ZEa4hp5GZRthJahnz/05FQQzAdbkXtF/2f43al3uNmGi7R
	d7IcuvWf7R/lDPGrFdyoNDrdScFwpLhgM/W/aJYdkYPDmZDwB5Vq5xhOQFA8//Vnj+ODC552dDR
	NCfZg3qvYDTsNcy0IJE2tBcTk4nnpIwa9j6zrYyaZ+XOER1T7V/28W/nDfIxzUfAsX/zhuUmnr0
	3knlfZS6wWjdFg/Q9DoFvANQFbCJ3JP+KleKdQVJaxGRbimu8qZCyY65/qUQuRCIhCPx+XZ3TWk
	VeLTY1oP1rHV4J+aQ1RjQbSDTHBsKXCp5CXEV2rmVPjZz9jCkkttliVMQtK3ir7AS+D/juA14dW
	LkOEC7IKmsvPs+aEjg1JF6F/6+zPZr++Ut36n1MM0b7BMbKEJHTgoUzmPb+Z+P5RR+Yi9FIBFzD
	FJk2yD3H0olR3kf7b3fbbpTwNfmUoBkkDd9VlLaF8y96w6ZwcirHjVdYY2+Hwu27Sdy6MU+N6OP
	f+cVPT0it71y1iLKs2QadMNcpMnPrVG79w7nHyzsBofPd8jjjGpKRtooGSc6PJ3
X-Received: by 2002:a05:6102:b10:b0:7cc:2712:cb0b with SMTP id ada2fe7eead31-7ce5cd41502mr969522137.17.1792877942564;
        Sat, 24 Oct 2026 14:39:02 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:de12:7640:de42:74c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e23b13csm3128627137.8.2026.10.24.14.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:39:01 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	sgogte@purestorage.com,
	mgurtovoy@nvidia.com,
	israelr@nvidia.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nvme-rdma: fix NULL metadata_sgl dereference with T10-PI
Date: Sat, 24 Oct 2026 18:37:37 -0300
Message-ID: <20261024213737.506824-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Since commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue allocation
and startup") the I/O tag set is allocated before the I/O queues.
nvme_rdma_init_request() only sets req->metadata_sgl if
queue->pi_support is set, but pi_support is only set later by
nvme_rdma_alloc_queue(), so every I/O request is left with a NULL
metadata_sgl.

With an RDMA device that supports integrity and a namespace formatted
with protection information, nvme_rdma_dma_map_req() then dereferences
the NULL pointer on the first integrity I/O, already during the
namespace scan when there is more than one I/O queue.

Queues that a later reconnect adds for the first time have the same
problem.

Check queue_idx and the controller's max_integrity_segments instead,
which is what nvme_rdma_alloc_queue() derives pi_support from.

Fixes: 2a8513091d2f ("nvme-rdma: parallelize I/O queue allocation and startup")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Based on nvme-7.4 (aaedcff90148); also applies to mainline and v7.3.

Found by code reading while looking at the same reorder in nvme-tcp.
Without PI-capable hardware (only mlx5 supports it) I could not
reproduce the oops. On rxe in QEMU, a debug print showed every I/O
request initialized before its queue was allocated, and with the patch
connect, I/O and a reconnect growing the queues from 2 to 4 still work.
A Tested-by from someone with ConnectX and a PI namespace is welcome.

 drivers/nvme/host/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 5b9b540693b5..07216890f75c 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -313,7 +313,7 @@ static int nvme_rdma_init_request(struct blk_mq_tag_set *set,
 		return -ENOMEM;
 
 	/* metadata nvme_rdma_sgl struct is located after command's data SGL */
-	if (queue->pi_support)
+	if (queue_idx && ctrl->ctrl.max_integrity_segments)
 		req->metadata_sgl = (void *)nvme_req(rq) +
 			sizeof(struct nvme_rdma_request) +
 			NVME_RDMA_DATA_SGL_SIZE;
-- 
2.43.0

