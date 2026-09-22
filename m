Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6173BB106
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107685; cv=none; b=ApYklQyM0kBrX+WrZ33OrM2yE5F2pZLKjKikcDQwVGtxwDxb2TUVvhkv9M6IUbO2t43Odvrxgz14navot2QhWKvoheuC4Tgeh58f4wQhaHNUtJGh2ZmYIloRPp/A+zJ5jnuM6kyoDU+7nwrnJ4KJ1un4kT3I89PTvLHx/IFnp+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107685; c=relaxed/simple;
	bh=S5tH3o/ryAK221jHcWeohlICbzsgPEfU3j52DB5bczk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIjgk9+Kln7rvW6O92BFWFxEAWuMJ/DqNeLF8zphrI0rcVlzVVMGzVd7pmxrrmzLg0d1cUfDjvzUscfzndf2Z3/hiPEhpIWame0d2Zyn48XgR71tbXjD8QWHVttnEBTxeJHvJdha2wqqHJgF1pdgXSaTpYmc3kIQmJpscSMazJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MnYjHVee; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MnYjHVee"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so191916a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1790107662; x=1790712462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DHOT2PMGUFhuByMTJSr3B57dIXKaBHqTAzfX9zwMX8=;
        b=MnYjHVee/8Oo+rVXn3p7IMyjr39rOfOdfb+aw1RsQcNFobEzi0y2gevQq1PcVTW9/j
         SUht/+rlv7Ue/WxBt19GI33CLv2Fbfr602ih8aNEdpA/GjiO2hMCZ7JfDNPC7wbk2sxo
         Ecvs+NW81dRdJXKe/i+qom7J2WyJKMgtvFXZtbZpS/8vPajUORRGruFseroVheA+I1Bp
         Fop5Wc+nBd/b1JxuY7GE2u3KuUo8y5fMSrOpA1tFWxKGXu/r6qGxu37Wrv+TZJsrqN0Y
         20kscBfAy53JPss5TuEJ4xIlG5Ww5HiqHIh/dQwECBIgSOKm8+dPZvn0w7YMBeVbkPab
         ZzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107662; x=1790712462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DHOT2PMGUFhuByMTJSr3B57dIXKaBHqTAzfX9zwMX8=;
        b=M3rE7/jsP+snuSii3BpRwJGm2W++UfZe4JTyk3kqiso2lb4HPM9TDMU2UjI76N0Uqz
         lRC1GSluMLZcmUoXC40uSuRB/MY4MW0k1ZVGQm+2dEoo3fFPMEOJ59cYhDaOi56jtyET
         O0FAu5eNUq03qFkwQ+ds75x+/I4Nk5qjpkCSgm4Sogw0iE85+WcHlIlujI4DbU/Pw+cq
         BEG9FCgHF+MdDOI/rTPlvYY1+5Hi2FjOi4bTXxEBAem1BDb6ipGCZvSxnIBLEEg2K+Il
         +edOILWPCPSP+RAis0AhPeDov2DT83UnW+Y9afpLnhNr6X6W5FWHgEBKmqKQ/TkRn8Z5
         XfxA==
X-Forwarded-Encrypted: i=1; AKwUvBzMrtXZX+OoEM4jyY7NH2NcgfkroNIDOhNACchR+oSI0EPE8LCrqb9r/hbPgsaay2DraeveHjhYpOV4loE=@vger.kernel.org
X-Gm-Message-State: AFuF++l+dS7DLD+5f6305kDCyjqcOZy0YNqezFQsavgYsNTcff+c2nUf
	g8vTXDBnafrCQi64/30oYPx/MxFlLES59SNMVMAXID5bqrzp/IGbE9Oqnhs3hT0HpxC7W+4EaYG
	C919JuivdVTo39eGV4Aeexl0jYO7bmY61wATAq/I1L5CvcfMVuaNm
X-Gm-Gg: AYBFou1eagzIlnhEUgz+/WzF1eYdENaNY8+lhJM5vvDk3xk9SaQO8XlZ/LqMUfVd2Kx
	Ca7HScAm5H5YGYWsdtVkw57gREinXpE/7l/huGyDTGuKsKyJEdcmGCtV95o0+pDT4s10R2CdLcp
	Ez8E6OFmP6pUrGnZTGw4GTlbhWivJGUvxi0wswTCy380CIdtB+1/d/lX+TD8FoiKUTXTpW2kQkS
	wBW+YqpbZxbKAnPBIFiCF+Q9OKD61PM2XsUUNZvzf3i5aVkcmz9b6Z5OjiJpfjGOvyYvDRAHki9
	Hb0qwKU+iU3YUAKhEB0uIi4Cm7QkyltD3XuEkHVtKNMHkgUdpTnktNbm6Q1wp0ECFCYwTfNCZ00
	v0BAsZ0/fGE0vAK0=
X-Received: by 2002:a17:90b:5648:b0:3a0:78b6:588e with SMTP id 98e67ed59e1d1-3a07e5957dbmr300750a91.23.1790107661882;
        Tue, 22 Sep 2026 13:07:41 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a07dcc1b89sm311270a91.3.2026.09.22.13.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:07:41 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (dev-sgogte.dev.purestorage.com [10.112.19.91])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 45CC94014B;
	Tue, 22 Sep 2026 14:07:41 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id 4334D3F9F5; Tue, 22 Sep 2026 14:07:41 -0600 (MDT)
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
Subject: [PATCH v4 2/3] nvme-tcp: refactor I/O queue setup path
Date: Tue, 22 Sep 2026 14:07:17 -0600
Message-ID: <20260922200718.3941465-3-sgogte@purestorage.com>
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

Split the I/O queue setup helpers apart so that the individual steps can
be called directly from nvme_tcp_configure_io_queues():

- Queue count negotiation moves out of nvme_tcp_alloc_io_queues() into a
  new nvme_tcp_set_io_queue_count(), leaving the allocator with just the
  per-queue allocation loop.
- TLS PSK validation moves out of __nvme_tcp_alloc_io_queues() into a
  new nvme_tcp_tls_check_psk().
- nvme_tcp_configure_io_queues() now calls the three steps directly in
  the same order as before.

Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index f916bcca304f..9308feba8a74 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2184,10 +2184,8 @@ static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
 	return ret;
 }
 
-static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
+static int nvme_tcp_tls_check_psk(struct nvme_ctrl *ctrl)
 {
-	int i, ret;
-
 	if (nvme_tcp_tls_configured(ctrl)) {
 		if (ctrl->opts->concat) {
 			/*
@@ -2209,6 +2207,13 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
 		}
 	}
 
+	return 0;
+}
+
+static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
+{
+	int i, ret;
+
 	for (i = 1; i < ctrl->queue_count; i++) {
 		ret = nvme_tcp_alloc_queue(ctrl, i,
 				ctrl->tls_pskid);
@@ -2225,7 +2230,7 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
 	return ret;
 }
 
-static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
+static int nvme_tcp_set_io_queue_count(struct nvme_ctrl *ctrl)
 {
 	unsigned int nr_io_queues;
 	int ret;
@@ -2247,14 +2252,22 @@ static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
 
 	nvmf_set_io_queues(ctrl->opts, nr_io_queues,
 			   to_tcp_ctrl(ctrl)->io_queues);
-	return __nvme_tcp_alloc_io_queues(ctrl);
+	return 0;
 }
 
 static int nvme_tcp_configure_io_queues(struct nvme_ctrl *ctrl, bool new)
 {
 	int ret, nr_queues;
 
-	ret = nvme_tcp_alloc_io_queues(ctrl);
+	ret = nvme_tcp_set_io_queue_count(ctrl);
+	if (ret)
+		return ret;
+
+	ret = nvme_tcp_tls_check_psk(ctrl);
+	if (ret)
+		return ret;
+
+	ret = __nvme_tcp_alloc_io_queues(ctrl);
 	if (ret)
 		return ret;
 
-- 
2.55.0

