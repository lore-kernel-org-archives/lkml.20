Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D7306744
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107669; cv=none; b=ElESCDROTcehR8yNehbl5iPFz3a/Ryf9JsismJ2mF2gxne2dBIpR/SQBr8cFPSpHJbwQi3ipOi+f28Xp+ztp3pXYOmGcdvc9wv+D4oytBRg8+puc0Z2GIhptjvIJVkFXDBIXII0FKiSs8ALp/Qfj+LhenURf5MPPs0JOnO3vduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107669; c=relaxed/simple;
	bh=fEN9QWh/H5XLgpzfFOmsp4HYU1gPeFsp9O/y7gJ7pIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQhDHBugyCNEUGngWNMAa04AnBdIosYYAPd5orrVBH5+VArj42GTFW7OWFtm8LirDiGovahek7u4mILTUf8NU+7ZBvaek6QT8aQxlOt9EAqwar6CSSUKT2Med10ZgwWKhqYNy//qJ9PWI8HX3yhDwGq0R3OuOfvDeVWcAG8neS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RiFAOPSW; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RiFAOPSW"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7f84a55cc06so62595a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790107659; x=1790712459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnqNTO+qf2rQpgu0xRZfaRVcdc87gpRUdjQ7jZicuFk=;
        b=RiFAOPSWFSuH/6SnCln7P4PaXQB/WFTB2FVH4eMoqUA15fpfvdtMHk0AF0cD1A70ii
         SZh8GO5JYicywjYWhHXLgS6/00JB11cHQVAnolap8E5z9taJ6kVX8o8hJF7RC+pFSnar
         LCzlFtXSHBb0KflcpULB1L/4IbmZeht5ngXB0BL11RDtGD7KovokcZNkacRAig0juVCg
         23X2YYvHIPRroY8FIjDnjumEBwDLJ5baiOnXyXa9C7Wo87z5M313WgTY2y3neUHgZD5S
         tVv2AVc3UhbdR/tHut+8N9ZoUgvgyBbLekyUw2N+dsrzx9DT6Hk0Dhpymg4kry6JoVNM
         a82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107659; x=1790712459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnqNTO+qf2rQpgu0xRZfaRVcdc87gpRUdjQ7jZicuFk=;
        b=FZh49p4S1M9vzxIh5EOPnFhpsldYGjiz8bVt5jdGdKEQIHYJoyNYAovK2JD/F0/2Cr
         Uf97th961wJvW4ywRtRAptR9RL12D1cAJMnNN3Ujs30Qq6Ak5mBUPohjC922b+wfcbIo
         AG3KYNOiacIB5CE6zpQ+ukO++BJuwoOoZIJpbN2KjyXm0xzYj7iA6F+2cZrwTCDhdWqy
         NRfBR3SsEhARWuVXzJ3uBuJcKXA89eqpbjWcIC4DinQUISqkilMFTHpG4Cbi+AQw1wDh
         6U1S7QJhLECw4TYCdNIrZf/8EAcONwwxgiSikpGLkyGbqaxNwX7fCbkNnGbX694FP6op
         jK+w==
X-Forwarded-Encrypted: i=1; AKwUvBzcCPy42boYzR+IDhNLVjshSCYWvRkJtDpPPM+2E42Jx5dvOHWQKzkjyGHFtcyGfeKbwd9pkDBxcqgQOe8=@vger.kernel.org
X-Gm-Message-State: AFuF++lkm1eE19CFHfTx5ZcaPgIqgQDVbjnZFgZvtymqeySfBgQjRQw0
	kEa2SGVV3ORSEy//Q0vRovboqO4y2Kt1o05na3lAY3mtm8lw7F8Flq+JMiQ2ZC7t1XtUXKQAnI+
	jbEDrYnKe6LVIpqpn9RDWQv+kAFPee4aHcqnf
X-Gm-Gg: AYBFou2Q3KXwv1XeUZtke1VWyg/4J1W0LKRQFA1rUhRno4vfaUOsKSZRLDwmlEPg9Z8
	zsmJxe+7PaP6Dxh4h5tH7Eg6AkRe/wpjjZ+QW90g3S4p0tXCWWybZGMMa1BvF2bb1CZ5SwtQlK+
	++0wmPw7rGRq0j5g5MKU1GU0lNBdr6qwdjClfrvCRDUkhn4I6WSV6mZ5eWD+zwg3LOjm6cZST0Z
	mKPV3nN700Z3KZ4d81r/PurBru15XsUKJC0cQp4rtf2eEftilRiXWQcEvyq5+CMV7MpatMgn9SJ
	aBKx2c+j2JqsPgpMca6+z3p+bfEw9r1NcqPcEn7HKjqgUOpT3vtB15/GrCyPDDSvmLhc65bCqu6
	TlDmqYoDnet+sTRrAJCgi8DyLL2kdxlQ=
X-Received: by 2002:a05:6830:310c:b0:7fa:5c49:524f with SMTP id 46e09a7af769-815f37ecd7emr730236a34.22.1790107659525;
        Tue, 22 Sep 2026 13:07:39 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-81603fc9137sm164400a34.6.2026.09.22.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:07:39 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (dev-sgogte.dev.purestorage.com [10.112.19.91])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id EACE04014B;
	Tue, 22 Sep 2026 14:07:38 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id E7CA23F9F5; Tue, 22 Sep 2026 14:07:38 -0600 (MDT)
From: Surabhi Gogte <sgogte@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mkhalfella@purestorage.com,
	randyj@purestorage.com,
	adailey@purestorage.com,
	Surabhi Gogte <sgogte@purestorage.com>,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v4 1/3] nvme-tcp: store and use the caller's network namespace
Date: Tue, 22 Sep 2026 14:07:16 -0600
Message-ID: <20260922200718.3941465-2-sgogte@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922200718.3941465-1-sgogte@purestorage.com>
References: <20260922200718.3941465-1-sgogte@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_tcp_alloc_queue() creates each socket using
current->nsproxy->net_ns, which is correct for the initial connect that
runs in userspace context. However, the reconnect and error recovery
paths run from a workqueue where current netns is a kernel thread in
init_net, so sockets created during reconnect end up in a different
namespace than the one the controller was originally connected from.

Fix this by capturing the caller's network namespace at controller
allocation time. Use ctrl->net for all socket creation so that every
queue, on initial connect, reset, or reconnect, is created in the same
namespace.

Fixes: 3f2304f8c6d6 ("nvme-tcp: add NVMe over TCP host driver")
Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 921934028e0b..f916bcca304f 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -171,6 +171,7 @@ struct nvme_tcp_ctrl {
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
 	u32			io_queues[HCTX_MAX_TYPES];
+	struct net		*net;
 };
 
 static struct workqueue_struct *nvme_tcp_wq;
@@ -1858,7 +1859,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
 						NVME_TCP_ADMIN_CCSZ;
 
-	ret = sock_create_kern(current->nsproxy->net_ns,
+	ret = sock_create_kern(ctrl->net,
 			ctrl->addr.ss_family, SOCK_STREAM,
 			IPPROTO_TCP, &queue->sock);
 	if (ret) {
@@ -2650,6 +2651,7 @@ static void nvme_tcp_free_ctrl(struct nvme_ctrl *nctrl)
 
 	nvmf_free_options(nctrl->opts);
 free_ctrl:
+	put_net(ctrl->net);
 	kfree(ctrl->queues);
 	kfree(ctrl);
 }
@@ -3048,12 +3050,15 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 		goto out_free_ctrl;
 	}
 
+	ctrl->net = get_net(current->nsproxy->net_ns);
+
 	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_tcp_ctrl_ops, 0);
 	if (ret)
 		goto out_kfree_queues;
 
 	return ctrl;
 out_kfree_queues:
+	put_net(ctrl->net);
 	kfree(ctrl->queues);
 out_free_ctrl:
 	kfree(ctrl);
-- 
2.55.0

