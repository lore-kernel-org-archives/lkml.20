Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA4476683
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196156; cv=none; b=p3KoYW70aEA4W3NsPx18D7JXPtw1AslI+43ziKjKmWk1yC7NSiL9WZyWv1++k7XRTIMze9XT9JjWklfBg0hlOhuK377DXwidaLJPFREMupf5U78qaKPdsNR6SaVJ1psDukBW8TCN9z+MaRmZNiFOc3QRKYHD4frE5Je2UkoAZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196156; c=relaxed/simple;
	bh=ZqrknraJrh16BFHTcAGNuZS9Sw54k4nkDA1XB6fk0zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I98uMwiZSAzOQ1Nmf4RD19o5VPgQpUg0nyHxHvwn3aizONTjwzh99P+wISTsgZMmNhv+/vv4m30ZIYyU4rcEnDMkdIcTQvj1tSDds60o+ENhKL86Un2jPgJSefTNqedChuOtkGSfrODndqRDRGKoM6PPNZLPgW7SKrmNOVwj4ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nes35Bnb; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nes35Bnb"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-142dd04be84so1457705c88.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196153; x=1791800953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oukphk47V539pkBOqAi5PYDeCD+s84orlhv2/lpFlbo=;
        b=nes35Bnb9Vw4H6qvAeMjmbQ1jWqGEbILqR16OCzepHPkralqmIIXsUgdcSqVUWytle
         6R5u09tPSMs4sm6f0LGDOY+J1xa1BE6Hnu6U2NYEFMPB6i5PWRYUY3FGyo8UoL0+PAcl
         c80ateXjKgf3WiSOh+/Rv/5M7NVCNd/k3bXmHA4XCgto8+GNwFeEOK97jcjrH9+tGLpw
         2d5K2emj4q3yj0BDoFYAewg9wa3y956o+oZkKLi9uzFMQPO8UMEXYccTk2VCQfyeaYkU
         sDjTeIS2R9toTl236NHSkUDNllFAvzoXatn0Iy88ZQGKpqOlp3okuhVdAoDTN+zamebB
         2ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196153; x=1791800953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oukphk47V539pkBOqAi5PYDeCD+s84orlhv2/lpFlbo=;
        b=GUMUZR0u1MkKf1OSYpLUEcPSZIMW9ObrXO+otmzJVhq3+qdaCbTIXHjmnsWkSDWkUo
         TIlICFMQe/vEKwDyWG+abckri5zkQyaCiAcANoKlx03eq15WC10GEYTEUDgYOVzErjXY
         H7udfrhsxHen1SSQoU+d5EAbLR9t3vwC8Ej1yc2M3K+qdSJzdUaMzudGGRglgYChgEIs
         eeDiwyErUAWCoUNpNzGhRdDCLal5yQ8efz/yCAHFc9lC8grZndrCAkXOXBxQtu0FUI01
         V4uLg17YQc0jeEzZdTwdIr07OielYt2NyJltsHVXkLXtGpB4Qpbsq/hZnLM7YE10WmaL
         51Lg==
X-Forwarded-Encrypted: i=1; AKwUvBy9BrS2k8gu1IgPugMmDuQdqf2OGba9DNANJewHnAxK/yGUTn5I/hFapn6fjjnHFQEpzrmsEm+kX1hyeeU=@vger.kernel.org
X-Gm-Message-State: AFuF++lj3/uGfTT/WJdtNiNNeJ/1C0SUZZ5BtZZM+nTICp54OUEGrbXH
	dD3M//4MklQfDUyFkAYycHXfup14IXsDXQxUMA8lrgRatT/6WdEY0DUi
X-Gm-Gg: AYBFou3rLnCqEyr5Kc5SwDdXsT+T9VPgzTvNSlPMfLLpNb328PyPbzK2SHVeLPnz5SS
	XIQXjwfOx6Nkqd4wfWLcDjnVLgEMPXJLkEvzMQ+3LLxS/4s/iUiqOkzbeWihCgD+WsOPpdoCs3v
	kpXHombXrYB1aYOsz9MYS3xCPBbEg/C1/SjIOMuUc3N8InhaKDCInUH9v01pcKwXYde0K96yloV
	fnNSDf3rr0j+UntLQ/MjwjF7ngIknC7b8ylHAxqybo0TavUtvfOL2jcVlszFW0Q9P9WZt0v9oAE
	3+1P+w/0LgYvthfTKxYG0HdbCmDmAFcr7NWtfqKvhLMDoqtZCk+xEhBPovR18qGNQFI+IViuQVQ
	2/RijggOCOQSIndrinutsUA1mxCg82Bl9H3aiZHFOuovh3s3+BYuSDc+IgKwC3j6dhYUSf2XA8O
	XmHGDT7o6T9VzWmCmgfbcHA0/5xXAShYltKMWWHwE1EEV+HcbyL3wbDlIruKVl3UoEzr5/cJ98o
	DPxdvx65hz3BjHK0F9XNKQ=
X-Received: by 2002:a05:701b:21c5:b0:151:2068:e81f with SMTP id a92af1059eb24-1512068e899mr11215456c88.27.1791196153405;
        Mon, 05 Oct 2026 03:29:13 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272a45a8sm13399093eec.22.2026.10.05.03.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:29:11 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Ian Ray <ian.ray@gehealthcare.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+ebbbf06f152da8ea4716@syzkaller.appspotmail.com
Subject: [PATCH] nfc: nci: drain rx_wq before cmd_wq on unregister
Date: Mon,  5 Oct 2026 15:58:48 +0530
Message-ID: <20261005102849.486-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_unregister_device() destroys cmd_wq first and rx_wq second. Any
rx_work still running at that point can handle a response and queue
cmd_work from nci_rsp_packet(), which is refused because cmd_wq is
already draining:

  workqueue: cannot queue nci_cmd_work on wq nfc2_nci_cmd_wq
  WARNING: kernel/workqueue.c:2352 at __queue_work+0xdb7/0x1370 kernel/workqueue.c:2351, CPU#3: kworker/u32:0/12
  Workqueue: nfc2_nci_rx_wq nci_rx_work
  Call Trace:
   queue_work_on+0x180/0x1e0 kernel/workqueue.c:2501
   queue_work include/linux/workqueue.h:700 [inline]
   nci_rsp_packet+0x297/0x3420 net/nfc/nci/rsp.c:463
   nci_rx_work+0x29c/0x430 net/nfc/nci/core.c:1579
   process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396

nci_close_device() does not stop rx_work from running again
afterwards: when the device was never brought up it does not flush
rx_wq at all, and the driver can still deliver frames through
nci_recv_frame() until it has stopped calling it.

Destroy the queues in dependency order instead. rx_work queues
cmd_work and tx_work, so rx_wq goes first. The cmd and data timers
queue cmd_work and rx_work, and cmd_work and tx_work re-arm them, so
shut both timers down before any of the queues go away; after
timer_shutdown_sync() the re-arming is a no-op.

Fixes: 6a2968aaf50c ("NFC: basic NCI protocol implementation")
Reported-by: syzbot+ebbbf06f152da8ea4716@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only. syzbot has no reproducer for this report, so the
fix has not been runtime-tested

 net/nfc/nci/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a96470ac..aa417f863f96 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1329,8 +1329,13 @@ void nci_unregister_device(struct nci_dev *ndev)
 
 	nci_close_device(ndev);
 
-	destroy_workqueue(ndev->cmd_wq);
+	/* cmd_work and tx_work re-arm these, and they queue cmd/rx work */
+	timer_shutdown_sync(&ndev->cmd_timer);
+	timer_shutdown_sync(&ndev->data_timer);
+
+	/* rx_work queues cmd_work and tx_work, so drain rx_wq first */
 	destroy_workqueue(ndev->rx_wq);
+	destroy_workqueue(ndev->cmd_wq);
 	destroy_workqueue(ndev->tx_wq);
 
 	list_for_each_entry_safe(conn_info, n, &ndev->conn_info_list, list) {
-- 
2.55.0.windows.5

