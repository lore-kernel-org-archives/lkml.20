Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69FA28505E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072143; cv=none; b=ienjaTbYEQ2JwRNixFRUuL4afY06i6XQD6u8xe4KKjhqRQkJl4vJ3mtgCtQKRSwYXe50PucBONIQIAzrnFbVipCcDn3btyxqD/PHbF1sAwcUraHOTD5kqwto6r61IAPpBslslWg4jJ0tXeJ3ZEwkvCNSyGl9QdMewfkZW/O4y8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072143; c=relaxed/simple;
	bh=w5qIasXbZ8QltJ+wv9iGuUVg8HATw1SkxO3Xz/8hbis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AREEx9X9hiCyQ/Q0snzsvnfuHYci5mKLrvhRvChJiElCKAoqTO8ShM/siXMy8PlNuh15fElgipJqxfleWbJh83TRJItu3uO97hYve/5GzfPtZpEpwfj/2/eOUjHsbOpVRULhZ1zbt+uhHiJWDSQ6SKQ3UzqftZDKzDZrsvgCYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=axBWX4mT; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="axBWX4mT"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c65093556aso264649e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789072141; x=1789676941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jY8D98dI3BJh9bGxWJLTam08cqOXeCPFw0Ktg9MgRA=;
        b=axBWX4mTxY1D5R11miYohkuZeaDPCeLjVMeQ9Zp0k+ok/R3MuX1w4SH62l1WpEVy6+
         B+BXFqxTmq9HhkOnaOK+935GtN9KniqBckpn2vR1YxwRSmJa9m9jFI8uG8NrCOx5HpA6
         MSfL4EkQlTASjP6umGu5v7/xB1ndT5ARYkZG3vL2aq9nO56d5YsBCpC2QK4Wibax/8yR
         1iRh2qvjCyksfxu77L6clyB5lKXFyzx5DFgUWSTYxigvL3A33NHeWedYNAPAduNsRC3q
         TLmBEkHOnww2zl9HIEeBwSlnnf9Yd3nZ6l3nZP+m6WwgUR2DtHNklFYaYOz9VBIqG+BT
         vFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072141; x=1789676941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jY8D98dI3BJh9bGxWJLTam08cqOXeCPFw0Ktg9MgRA=;
        b=JvixKWCPZBYMm57lgJaTKCwz0FKntZl7AxcUP5YBx/KjRfWQQSeWqTjYiVWjzqV4uD
         3ObDcXxqYq/y1tTUGI1MSA/hN1ukOBGBhdfY4r+i8UiwkX6UmmAAbYTuh/lAFBo2HI/Y
         zwCFDAykBQJc0z7ks3C0wldMrnPAxjaJWB5F+5komj/106lHhbeWNSjy6+993Y1KFGPO
         gObmZ4/3FfJDI0K+Y5BHbDlSTy9UJJOWgH1sdpKX+OObIEIfd1Q5lOIj5T3PqF9T4r9A
         gaTLeM3QDYGlyO7+lcYE/FQOJYLiBu/PzP6/8Vti8iQw6zgQHpaqyB/P+Nh0//OJvm/H
         M/ew==
X-Forwarded-Encrypted: i=1; AKwUvByIOqNT2qDBukFnk3f4gKY5gk49wTJFGbNWx5u+WojZsCG4FTV9l2KSvIgjmIhwizNPkgUDeBho1DcXpPE=@vger.kernel.org
X-Gm-Message-State: AFuF++maKVGuO8bnD3O/PrlFkF+1M35zkVC3+p2r3GQNXWFLXCIJRjVe
	Inm+LgCeIoWRwhPfn2VdaLjX0bTV1A+rkoH0c4NFd40JTiQeuJl2abpLAfBj4UEeFnFYC9Zi7ft
	nV3dl2D3SG9ATxhoCiDN8CGS6RobPNzja3972
X-Gm-Gg: AYBFou2SAf9/OLmjDOJdX8Xsw64J47pi+knN/a7CDWRuqWknKyXnI2jFX7JbCx+EiuB
	I/BCnzcjpNOP6sEIVk4BPOPHjmnm8rIc3ZHqA4bz2lIUzIkpeZvxvHSAezJM3i89ERbC7z62ctr
	vtcvyv1MNUX0FxSyxht+ltiGNA/d/8cEHm2gQsY4IHlv33z+oB8a2SGulpR0PSctZq7MRBoQrUL
	qBiTv3v7pgkbI+kiySzWOXcmtkIuUZyxnbcTX87hSpKDtbiFo0pKUHINxrH4qGduHL1060DL5Sz
	NWNqJXLKxUJ8T5fS4wzZ0iaE1bmkFy0zJfH3N3IJHkg9V8fKNfqehmCEH0JkhHcwv4IEbvm2N2Y
	luKIwVNZdSzZIQh25aWoHWnwnwXxUUqY=
X-Received: by 2002:a05:6122:4894:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c8462f5c71mr2417289e0c.8.1789072140729;
        Thu, 10 Sep 2026 13:29:00 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c846f624f2sm163189e0c.2.2026.09.10.13.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:29:00 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (dev-sgogte.dev.purestorage.com [10.112.19.91])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 24849400F1;
	Thu, 10 Sep 2026 14:29:00 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id 20E1551EC2; Thu, 10 Sep 2026 14:29:00 -0600 (MDT)
From: Surabhi Gogte <sgogte@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
	Roy Shterman <roys@lightbitslabs.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mkhalfella@purestorage.com,
	randyj@purestorage.com,
	adailey@purestorage.com,
	Surabhi Gogte <sgogte@purestorage.com>
Subject: [PATCH v3 1/3] nvme-tcp: store and use the caller's network namespace
Date: Thu, 10 Sep 2026 14:28:10 -0600
Message-ID: <20260910202812.1642832-2-sgogte@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910202812.1642832-1-sgogte@purestorage.com>
References: <20260910202812.1642832-1-sgogte@purestorage.com>
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
---
 drivers/nvme/host/tcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 5fda9661bdb7..8e5e22febe2a 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -171,6 +171,7 @@ struct nvme_tcp_ctrl {
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
 	u32			io_queues[HCTX_MAX_TYPES];
+	struct net		*net;
 };
 
 static struct workqueue_struct *nvme_tcp_wq;
@@ -1846,7 +1847,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 		queue->cmnd_capsule_len = sizeof(struct nvme_command) +
 						NVME_TCP_ADMIN_CCSZ;
 
-	ret = sock_create_kern(current->nsproxy->net_ns,
+	ret = sock_create_kern(ctrl->net,
 			ctrl->addr.ss_family, SOCK_STREAM,
 			IPPROTO_TCP, &queue->sock);
 	if (ret) {
@@ -2638,6 +2639,7 @@ static void nvme_tcp_free_ctrl(struct nvme_ctrl *nctrl)
 
 	nvmf_free_options(nctrl->opts);
 free_ctrl:
+	put_net(ctrl->net);
 	kfree(ctrl->queues);
 	kfree(ctrl);
 }
@@ -3036,12 +3038,15 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
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

