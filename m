Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C0A37FF60
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974017; cv=none; b=ujPpERNys19It/ze1PxXsSmoX64CQOQfSW7Lk4fMZSYUI+kOKZ5NiTXL4PbgN0lBU3BGLpiOiT8aHQJ893bZBPAlTP+CNIQIqZkHYBSDw/tUHA5OFDUyfWOR23z2XS1SUVM77yDT9vRFgC081gdR3KT58ZhUSrVN5t4X3vLudrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974017; c=relaxed/simple;
	bh=b6L8pOpoUYnSO1ee7ph6hu8yoybFfnNKeIpOYsMzaPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uSKiVdQNLD4evWNmBk9MJ+vEwXHstpVOzXmXviHFaqrqCQDKqSbaXQQFuQuEKdADAgKhgBUl1uQy0Lpd8kYhjGspDHzdf+UMC/C6ZwLd7Zh+Mw9sLYMkW6qs1UdZhVdiu9qm2CYC+YJ5Y5uAQdzN2M9yGJvVYeZAZrGbKSZkPBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Y1SZWDLA; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Y1SZWDLA"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c0b552ccfso3405eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790974011; x=1791578811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQAG52tLeZ0GNDhAmphKWmCU33aC81o6qoj3pL6Jx8Y=;
        b=Y1SZWDLA6fSik8wn/yJr32tOoT0P83mciGg17Vy5s2tbiXlVqT1zYBUyS44WLe1JYM
         4ntvJwjVsn9YtWeUbkwuY3KMHuWjBr5jKQbFyc/7ryh1UD1kQX62dbaApbZY2OdEXbjX
         gqKf+J00pAPMEDU2bg5HuwHqkbUHZr6+PN7rSmpFWtXeSGaj1y1SVl/WzPuE8R0GD18H
         /o2lj6x9Op/ZSbIDYSsdDiCWKj/Ek4G3if5cPOPQHZ9OgUaR9X8fUxVw5xoz4KwnKUH9
         28ElmtD5rWnfPzgHhTM0x01ttiXBp/NG5Fuss1I+f9O6B8pCmAnxNGK4FssOVuFCl3JL
         7uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974011; x=1791578811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQAG52tLeZ0GNDhAmphKWmCU33aC81o6qoj3pL6Jx8Y=;
        b=kY1eYLTr/hX9EXh3a4tdszkrj2/5exz8og9+v2Oh4ygxRJsZQrzGVTs1RDPW4HWoRI
         S/BUieo1Ugm8LK7cQw093uMMEBnqDw465RVmCfvh7I8sfVePkTPcQCho5pBALRmfpQVO
         YB0WvaR/b+jg46WYRyvnbD0pL5n6i4lFPdXyRPAtLxZFU3NAIMTtTe1/rhxKwj/hpOiX
         M3YseW9sKPwj0QJykfvENxihcsiWrJdzNM9wpcHqE4pcVzorzy4OQ4jtCgBZZ/Qyi2oX
         u7eaEvHgZ3ByARdf9yXnj3cTJKxF20yCKp8O6nOWUpwzB2vUBKSqejUC27r0XuCrwH2Q
         La3A==
X-Forwarded-Encrypted: i=1; AKwUvBxx36Gkk1S2yxGfAcdeoHiRuMgnhfbNSPcdyP1SiXP0SBdNvmBIMrmu3xiuhrT8uxdR7kxGiKCSxHJ1fk4=@vger.kernel.org
X-Gm-Message-State: AFuF++mP/lrw0OoUbbDk4il+SPBWSeHdwVfqrtjSq+SRwDEAUoREt/fM
	/6a40GP4ZkPcedDRcCZ2FxQwJRH2dCLXdJX4FurPI7kYRomDzLmsbyLRL/2tkr0VQNA=
X-Gm-Gg: AYBFou1SZG9RnbYEXm3zUnWI8aLP0Lj8LUfcXnGLg8iJ9YX9k1FPctCOdBrry644TTC
	ZnO6ucxtQvaj3WybAROxf2JpTyboBTlWlLPv052XEfcUB1F/qraiIuJ/Ak9fuKhirkObgHvVGsr
	Vuim81gZt10Oom//V5ek59dqmyd64UcQ7MDtO8LJoSCUI9EEYdXg6DHM6lNfNnD2TrJfTevq+i0
	jp2Qg2UNIyCl71hJkAfJZuW00lgxERTbvSMJcJgB4w3r9TUw2jvsuBalW0cpxdiX00sx2C/J1W3
	s5T/8XsaFkqrSxpVPzGvJyZYHCcqLRv3zgFwfpC0LRhU4wWZhU42bfMpokjp6vvVRHsCCuX0qjY
	f86cK3JXRs9wQ1R4hFaeubpM/K3S1vk+0lCIzl4wN+OHtHcZHxOv+TG1G8cj4E+r5W4k4ChT7Su
	6//mtId9TV4hmmJ/lE2bXeBOAian3avL7rlyANmMyyqfNVHbIuzAeienxjZKvOeV5/jwu7zGF0I
	c08p8+pd9Yqiimfwoc2Ge7qOUNB8Kpw841Z4/boOWorZj6H8Q5ADERuTFRD2eEP67AId4M=
X-Received: by 2002:a05:7022:f503:b0:14e:9cd7:92f5 with SMTP id a92af1059eb24-14f5bbfa0fcmr4281433c88.16.1790974010316;
        Fri, 02 Oct 2026 13:46:50 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:a1e3:ffe2:b35a:69a4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f4766f92fsm8317213c88.16.2026.10.02.13.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 13:46:49 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Chunguang Xu <chunguang.xu@shopee.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y] nvme-fabrics: use reserved tag for reg read/write command
Date: Fri,  2 Oct 2026 16:46:45 -0400
Message-ID: <20261002204646.26451-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chunguang Xu <chunguang.xu@shopee.com>

[ Upstream commit 7dc3bfcb4c9cc58970fff6aaa48172cb224d85aa ]

In some scenarios, if too many commands are issued by nvme command in
the same time by user tasks, this may exhaust all tags of admin_q. If
a reset (nvme reset or IO timeout) occurs before these commands finish,
reconnect routine may fail to update nvme regs due to insufficient tags,
which will cause kernel hang forever. In order to workaround this issue,
maybe we can let reg_read32()/reg_read64()/reg_write32() use reserved
tags. This maybe safe for nvmf:

1. For the disable ctrl path,  we will not issue connect command
2. For the enable ctrl / fw activate path, since connect and reg_xx()
   are called serially.

So the reserved tags may still be enough while reg_xx() use reserved tags.

[ Backport to 6.1.y: used the older BLK_MQ_REQ_RESERVED request flag. ]

Signed-off-by: Chunguang Xu <chunguang.xu@shopee.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and nvme maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-41082. It reserves a request tag for
controller-register I/O during reconnect and reset.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-41082
Upstream: 7dc3bfcb4c9cc58970fff6aaa48172cb224d85aa

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/nvme/host/fabrics.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index ffe433c4708941..2d0dace26d8f78 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -153,7 +153,7 @@ int nvmf_reg_read32(struct nvme_ctrl *ctrl, u32 off, u32 *val)
 	cmd.prop_get.offset = cpu_to_le32(off);
 
 	ret = __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, &res, NULL, 0,
-			NVME_QID_ANY, 0, 0);
+			NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
 
 	if (ret >= 0)
 		*val = le64_to_cpu(res.u64);
@@ -199,7 +199,7 @@ int nvmf_reg_read64(struct nvme_ctrl *ctrl, u32 off, u64 *val)
 	cmd.prop_get.offset = cpu_to_le32(off);
 
 	ret = __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, &res, NULL, 0,
-			NVME_QID_ANY, 0, 0);
+			NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
 
 	if (ret >= 0)
 		*val = le64_to_cpu(res.u64);
@@ -244,7 +244,7 @@ int nvmf_reg_write32(struct nvme_ctrl *ctrl, u32 off, u32 val)
 	cmd.prop_set.value = cpu_to_le64(val);
 
 	ret = __nvme_submit_sync_cmd(ctrl->fabrics_q, &cmd, NULL, NULL, 0,
-			NVME_QID_ANY, 0, 0);
+			NVME_QID_ANY, 0, BLK_MQ_REQ_RESERVED);
 	if (unlikely(ret))
 		dev_err(ctrl->device,
 			"Property Set error: %d, offset %#x\n",
-- 
2.39.5

