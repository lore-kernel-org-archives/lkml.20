Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430A46EF93
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005174; cv=none; b=DJJD7lkLo5vZrRsCMRrDn1bB1EnMVlqDyuBCfzb43+E7EKr5tFK1pufg1mKeGE9vrzBKYD/QHNvn2Lx6TTf2HWhrql8pWQUPR1X26FdtPH9Wpa3E2p6lLGrXXfLLG/VVbhQ8hVxMrcjeWPFLdb8QZYldG/vc6R2XEFsqPW9/vhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005174; c=relaxed/simple;
	bh=8pbY2yocUMe4CVY4XHb7arbhkzDzJmAQEtZu7ABBWI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVp7Fe6mo3NJ/JKJYZIQaRVtXuI0133wkJrUQGENxYp+UQCa//qOxNKJTc5t8/X3ADJUpkuHTP5Kf9UISRlW5dUfYCxhHsmnlfVGI1XCVlT9qaFSD39bASjqLt7YfwiYuznB08AgjykKfnf798FEMo9oYQ2IJ+THGNB+0WkdzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=WSiw9eg2; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="WSiw9eg2"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so5790249eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005166; x=1792609966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIwvec8ywWVSJmGxLO9s3tCy/XMVy8O1ZUKsdE77wh8=;
        b=WSiw9eg2etBwWCWMN00GON7MAHDDfG8EBX9b/WrkoPvCpi3T5qvwfNivKnLvlgAKdd
         cPCJSwZgM3U7gOJXukcRi0EEc9kakRS7hkmxkDmsqXPSf+xrLMbrQjZRDw2DMtHz3Fhe
         eWRNFLyPR1D8ParnuFnW5iXQ1j8U9GMZEkxHyDAyc9hG4ekn+EEEankcHCYSmOE9ALhv
         +6THwxMrawDk/Lms3NOXixemm29BPFyPMwDac0TvM5GxkG4FqxkIhj+gAOjqSsh2PmDs
         5WYsjDT906AbmpijcKUMHQFOxMysUSJVapIGwmbb6r8FnxWzzOEt6fwN7RT2CvXh+a9Z
         epXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005166; x=1792609966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIwvec8ywWVSJmGxLO9s3tCy/XMVy8O1ZUKsdE77wh8=;
        b=jzcGbeHjWtFXZQbM7ViZeIn0p4F57TFxA8aoCG4HcaXfexI/JB/8BAEcDiFtLLkVw+
         Vjp0euCReGJ0QmcPjwWyyGBbbmAYC/GPg+USZJBf4HVmvMwGygtcKW+Ns52EW33JZFS3
         KKVvWqVc/sBB5gH+bN6LiPRsa5xXqTckwtguuqqYFNGbXHiZoxxBKxO8cCqRywgOhOEy
         QRN9E464wIMVWsBIgKc/T/tfUMQsGWTVxo7FAp9DydAlNgT0V4JyugQ5IjUlBQWi00cc
         V9eKHxz/HYNA2um17blGfE3QKbuFEyou4tedsfkNix7szUxt70QXXYjVb0SFzazYCApq
         7k4g==
X-Forwarded-Encrypted: i=1; AKwUvBwX0xiJo+rT3yCuAP8SEGvu/fX6Zze5n9+7XHK0JZ8jg+KyU6tUv49harqc9OS7jOug5VesxUKg5joyesU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcQt6oHnr+A1sBwWLJMEmA6EChgcC3YXVrjFAdqauNEGPED7FV
	sSZNMyJBfueYnxJgNae1IXfO98zQJAC8G4Zl6aYxq7I05+uuTOofPyVo8zKilv2uHqI=
X-Gm-Gg: AYBFou34ngVtq4fWUlFce1BXbpGrp21Nh3wMJ2OgvnzLeJ84A9Vu874UKI198b5I66V
	vN8hCXINGcoS2fOKLnPXcDcSDmXfF1p6Zhyj0b+9aWQrrVV2kdMKU3t/cvaIViFNy7BtLEnf3FW
	lw9e5HQJyMg7Bjfnd663vTfMw8Q2gYxaZGbmQkSB1wtam98tdi/F16MSX37FMqOBV1K2n9DbyUi
	sdOS5LOmHogt5pT0b/tcKfFAxrSYidhAh/lADm1CwmTdEhgaro5+PmNYTQ5MMjtWPZ2sAAz4ptp
	2Gf+El9ldARjkhiK57LzQtPnhQlnjcrh504ycRR37i3xkwxlwy5R+FxLk9XmC2852B3pMRFSBCh
	VbsaeXw4nfPBBMZebHMW2ksuuts87UzUQbbD8nBsuk+Ji8PbI7Ua2o7NHjda+mWrjeP/qxgF1Ei
	ZsBYxkjX2CHx+NI2Amo32cVI5fEoKh17WK4oyFXL1E+52DsvMECJBgCG0jkv5k6698LJx0h5EKs
	0ek/+EwZ+lhaCd0Zloae6RHxaO/9rAA97cCnEvVbrt4kYb8b0kdgow3/0zyOHH9ipYiWPg=
X-Received: by 2002:a05:693c:8642:20b0:358:d3d6:207e with SMTP id 5a478bee46e88-358d3d625b3mr19902741eec.11.1792005166088;
        Wed, 14 Oct 2026 12:12:46 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm54329888eec.28.2026.10.14.12.12.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:12:44 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: axboe@kernel.dk,
	hare@kernel.org,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH 6.6.y 2/2] nvme-tcp: sanitize request list handling
Date: Wed, 14 Oct 2026 15:12:36 -0400
Message-ID: <20261014191236.23696-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014191236.23696-1-artem@trailofbits.com>
References: <20261014191236.23696-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hannes Reinecke <hare@kernel.org>

[ Upstream commit 0bf04c874fcb1ae46a863034296e4b33d8fbd66c ]

Validate the request in nvme_tcp_handle_r2t() to ensure it's not part of
any list, otherwise a malicious R2T PDU might inject a loop in request
list processing.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2025-38264 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 drivers/nvme/host/tcp.c |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 88489a787e677b142c3ce89db0ea06603c021bbd..e270024fe549096b8d8588e73b67cc2aed28d910 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -385,7 +385,8 @@ nvme_tcp_fetch_request(struct nvme_tcp_queue *queue)
 			return NULL;
 	}
 
-	list_del(&req->entry);
+	list_del_init(&req->entry);
+	init_llist_node(&req->lentry);
 	return req;
 }
 
@@ -493,6 +494,8 @@ static int nvme_tcp_init_request(struct blk_mq_tag_set *set,
 	req->queue = queue;
 	nvme_req(rq)->ctrl = &ctrl->ctrl;
 	nvme_req(rq)->cmd = &pdu->cmd;
+	init_llist_node(&req->lentry);
+	INIT_LIST_HEAD(&req->entry);
 
 	return 0;
 }
@@ -739,6 +742,14 @@ static int nvme_tcp_handle_r2t(struct nvme_tcp_queue *queue,
 		return -EPROTO;
 	}
 
+	if (llist_on_list(&req->lentry) ||
+	    !list_empty(&req->entry)) {
+		dev_err(queue->ctrl->ctrl.device,
+			"req %d unexpected r2t while processing request\n",
+			rq->tag);
+		return -EPROTO;
+	}
+
 	req->pdu_len = 0;
 	req->h2cdata_left = r2t_length;
 	req->h2cdata_offset = r2t_offset;
@@ -2374,6 +2385,8 @@ static void nvme_tcp_submit_async_event(struct nvme_ctrl *arg)
 	ctrl->async_req.offset = 0;
 	ctrl->async_req.curr_bio = NULL;
 	ctrl->async_req.data_len = 0;
+	init_llist_node(&ctrl->async_req.lentry);
+	INIT_LIST_HEAD(&ctrl->async_req.entry);
 
 	nvme_tcp_queue_request(&ctrl->async_req, true, true);
 }
