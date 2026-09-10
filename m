Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC73B0AC7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072145; cv=none; b=MDtT5mmJgcKu4DhrCJ4wvLsT7Ni2i6uUA5sPwjGdlAKD3uR0+6nWsNk8uadT727I6+5nWquJVGLI4auOo1BajByD/JTVpxJMkxgyEvMk5wp5nNyct6yxXIBvAD+Nicf1YZXGKBf+MhBGPRMvBtdB4YbV8gxSLhZ3w1U0vT6pmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072145; c=relaxed/simple;
	bh=6C9oiDzf6tyX3YCqnKIrUShg+EaUa5nRAx/MHFChfKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTxgZxgYJQsAmbskFVIPF61qf6K7CRGPGpp2toYzWsmJ6OvFOBsNDsNHnK0I3bt02cuv+6LCGAVullzacMWBKCN0n32aMzpOWxtIfH9NvxGejqrRVC0D/aKk+MGNBh1Gl3V+dNlvd7zpf8mMDVtdKn5agVrZR6CxWpf+SFmMRzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bhiEOsGM; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bhiEOsGM"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8541875f596so119901b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789072144; x=1789676944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exD+q8RvsL8LlA1NdvdgIxXpMfooqJfEtsvkYfwTOw8=;
        b=bhiEOsGMb3NsHV3/jY9ynlH3NHILp7klEmAvivWkZB7aIFlMGAZvGVbv9+dXLM0OkX
         ovi2sJVV1rSZfFrzUO+l3GXaKSg8WX40tswsPCzTS0ErhY48mMs7wE48vStT0CU7y/aU
         B46pt1ABqqLJPoyz8Rwe1dcFswPWU/KrQ1mgiqjtoZf/1KacC0gJHbWSgpCAdyBMquPh
         7A+A+FxD5k6wKRnj3lw+I96YmJEMh758kaJ84zvJrEILecfvhBzMKfCKF3Vzzu9IUBA0
         fk/hHF2GmfdNmxbXe7ez54lqryrrG5dPdMv/naG//gKfNz+/IvN4mEJKa5oc5b+eKLxg
         9VUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072144; x=1789676944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=exD+q8RvsL8LlA1NdvdgIxXpMfooqJfEtsvkYfwTOw8=;
        b=N2Q3shWDp8DtFj1S6mbTSvxhXKUHawr1Oa7FN9hPl6diUKQPmrl79DI5whQ2nak8BY
         flqc3xdw3PV0Hri0i3S6GfsKvoUcW28nWRZgx9zD+O8yyL3cy+Gov90Swe/FAbHq2sJo
         ZNi166ETHqTuRY/l9mtreGcooEomhAzm5+7ACNu2m5FnD2AyTSAlqZjrNwaWqqzHNe77
         v3tN0CcDud1h0mO7+uNMiwETS6W2EyJenW2mBPPHt3TGgI2QMIBGuj5ytM4oRX4JIpxi
         NP+GjiU2ti8lg8Gxs48veGxoWvComy9b/ovUkMRhhp3NLVqNn0FuxxJYzQNAa+lkyrYW
         ysxw==
X-Forwarded-Encrypted: i=1; AKwUvBxoDqF0ygU206ZZN3UG6uGtyRrl8aheGSCYQeaaj8BfsU3bBHIHbQ7VZoAywkScKo4aR3r9PDdDwSwE7xE=@vger.kernel.org
X-Gm-Message-State: AFuF++nIa4NeKoqG62aW09ipiojJbH9m5ydqNCU4wnzqV5HmnINrCFxn
	QVHtWTOVozxRlVun7hBGtuXo6zPu6jJj6lVVJZFC/W9T5darI5T8+XTVJeG9ZrwGpZX3R+sPLDE
	ldWTXFeuAm5dGVEIqd+vwptsBOB1KhC3AEfEn
X-Gm-Gg: AYBFou24qQLjK96P+/hNVJc7PbbUvrMCtW+Q3tETWdNxxaVoagDHVo0vVsqx55Knq2z
	oxiBcUOOOOEcyGcHFyeKe0SGe75nmft8A3i0YfY5ncfsQCmaGg023tsQPVHuS9MiwJM4j8mSUW1
	weTo8t7/Xzro3xyUVWTfAQc3s7wAJHJvSjF0kG8hUVBsX6I/k7N7yVxuMtZNQfetUb+mHrVY/Al
	EpPoAybV5QrWJ6hYzYxWsc2YkQ0Z/KVAn0g7fuO8JQx6o4laU4HRS5ReigWucUlAQqcJUNZGnIn
	wiwxRhYO/nVT36R0FjU9V6llgJTAsru2Q8zx9687+aymHvxJMGalp3kS2jVkTHaF5TkJCkcN1ay
	8LXMQf1xkWtgmofOM+B6zWITZIvJMMlQ=
X-Received: by 2002:a05:6a00:39a8:b0:857:73e2:9107 with SMTP id d2e1a72fcca58-86b344f0d09mr814115b3a.23.1789072143746;
        Thu, 10 Sep 2026 13:29:03 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86b27dc0f73sm108946b3a.5.2026.09.10.13.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:29:03 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-sgogte.dev.purestorage.com (dev-sgogte.dev.purestorage.com [10.112.19.91])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 1044940320;
	Thu, 10 Sep 2026 14:29:03 -0600 (MDT)
Received: by dev-sgogte.dev.purestorage.com (Postfix, from userid 1557734945)
	id 0D37851EC2; Thu, 10 Sep 2026 14:29:03 -0600 (MDT)
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
Subject: [PATCH v3 2/3] nvme-tcp: refactor I/O queue setup path
Date: Thu, 10 Sep 2026 14:28:11 -0600
Message-ID: <20260910202812.1642832-3-sgogte@purestorage.com>
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
---
 drivers/nvme/host/tcp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 8e5e22febe2a..fe0e581608b4 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -2172,10 +2172,8 @@ static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
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
@@ -2197,6 +2195,13 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
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
@@ -2213,7 +2218,7 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
 	return ret;
 }
 
-static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
+static int nvme_tcp_set_io_queue_count(struct nvme_ctrl *ctrl)
 {
 	unsigned int nr_io_queues;
 	int ret;
@@ -2235,14 +2240,22 @@ static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
 
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

