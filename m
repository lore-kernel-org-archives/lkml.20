Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382EF2E54B6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274730; cv=none; b=Wj42FPM/4boRLiHLGIhkYagTklkL0jptzH62goF+7gGPolcW8yKbXCIpFADnmN0MNZCZ/arTlyMiXlNvcM5YW6rwCof5iCGokjh9zfvirkm6XGW0qxfKO6h4KLtwsv9iElmjXZytQM8MAcY33ZxkEtZstOiPU/X5RIaDQwpbtNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274730; c=relaxed/simple;
	bh=8CFmkxKpRFqhw9jrde40c9rb1WJEJtIVozzjHWTho9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vpbq88KfgMRWsHpo+37Our5P9f6KidE7W0Fom2zsXRJcpc6UttbZjxBID7VUYm0fjlMshmH2Lrk597n9iWBQzXbWcMRPD/6oXAPsZLkGpIC12DaEC86f7LR1Q0Ae4/coegH052mzmkiW3+3zg1VRS3iUTbc6vs9wNjFcPIgU/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDfAU/1U; arc=none smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDfAU/1U"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-6af9dbee8edso226439a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791274727; x=1791879527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gZjlHRYt36AYHmrS72ppy1MygmeYzlOolTpnm0Towo=;
        b=mDfAU/1Ub2o2giIRLyH8vL2PvuQjauNAqwJIJW/gk2FCMuhyBp+/HxeqPmEcEnCI8Z
         Abp/+cv0Dx+PYMyG7gu2hywW47VHM7NqQayeYvXb8gpcmkjmIlFqLcCm952b8CVB7JI4
         wuZlz1cO62618FfTeosnAYsmJKHg3B3JPXmfiJ3IIrITnv8pQA2lppgoTbMFlPjgoZDq
         YAaqGlI5OdWBwK9dkB8q/WphBMtLZRNWldmy4sj1bA4an2XKVJ+hJyhiuIEVWNKri5gc
         Ie+wS10oB0KOT+rXz+uqTMR0hGkJ835rCt2R6jcPH6hv9PYkf5WTGsf9qbde3MpIjtP9
         VlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274727; x=1791879527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gZjlHRYt36AYHmrS72ppy1MygmeYzlOolTpnm0Towo=;
        b=EvfDp3FY6Qxcx/6Ik9Drp/qxijgzCJwBG6oUl9LoR1fFmcNmqSzxWz+IlVHsYbhl9H
         /cdrFMdgMGH2mr5SAWR5PIP53WlqMadXTwnXDPMf7G12BEBJbsVYRU+fXOwX00VCp6p8
         dWZUS/8UZ/nDaMw50Hwz8HgjmkEY+Psei3Uo5JQKGxw1BnH1XE5zU2+0mzz1kG1b6RiD
         WWK3ssx6jJb4o/FTLXyq6wIrhmjZKxuJFNWdzji2n61cegw56/yEKMnsa00yZ2UVw5tY
         lPoeOUEbHjN42W/f0wZmu+VSTBpR1B1rMYAUjLM6MubmzP7gB3M0/LNGjyVwAT2hMEuY
         mc3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrSgbXzwpqLB1/AueV/wZZsb6s2qRdTS/L42sBu1FkqB5qQXJW/AIiyl99N1cwAoa2TmV68Xka47Szd/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaYCacarMyHSodSCMVbocJOFYKyUOd8Cz0OgKdQyfN+FW0ceiD
	NE1MQG0XZrS5udv2qBz0b6mv2UE1BITsPJ8F0CXx59RmWkuT8Mj6b5Rh
X-Gm-Gg: AYBFou0msNHJjRNRgKi5R29eaEC+iApOpbp066utur56iFeGPneakFSCyA387rDbHBs
	j+0g2NHFzVjeIjKVUOqp0aMk/fQrkS3Wn9KtYrZ/+EgvHSnCSx29oLxsMvZCfcvTquF/SW2N+zW
	HQVIyPXGVjh9Hed0TyNlXCeHrsc178iKf/2n4KltoIbo8O3/tLX4EsfVng8FvFPAyhuFKHcPTOz
	GCijfrLLK4YyL5hpnW9dbPQfn+VxrkcfLNwE7qNjZpCOXnqi9JEzcComK4oQ9Zv9mkhbhCiSkoq
	ZkdPBHxbfxyYu4jMs7XG5cVqzx1V+PTwOvDUmbh6RaTVA9cons4DjduTDJBTuWXTokwCiq62S2Q
	jTzSo4M8uUhYK4rxxyYeqaJQSUNJ+k496y2GhON70AcJdlHWQNEU/mip+dbHU9joZnDqshGEeKn
	b/BfM+VMi48C4lBd3UO9MORoytrU57wnBTiUAJfVW2oigHMtGpu5ss4KB3Yk9y1jGnSjMW+VjbM
	ELt4SshMkl+7DRp
X-Received: by 2002:a05:6512:3baa:b0:5b6:4ae:8c02 with SMTP id 2adb3069b0e04-5bccc6f92efmr311171e87.29.1791274726992;
        Tue, 06 Oct 2026 01:18:46 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm3903389e87.11.2026.10.06.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:18:46 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Chengchang Tang <tangchengchang@huawei.com>,
	Junxian Huang <huangjunxian6@hisilicon.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Yixian Liu <liuyixian@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] RDMA/hns: Fix WQ_MEM_RECLAIM warning
Date: Tue,  6 Oct 2026 11:18:39 +0300
Message-ID: <20261006081840.125567-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengchang Tang <tangchengchang@huawei.com>

commit c0a26bbd3f99b7b03f072e3409aff4e6ec8af6f6 upstream.

When sunrpc is used, if a reset triggered, our wq may lead the
following trace:

workqueue: WQ_MEM_RECLAIM xprtiod:xprt_rdma_connect_worker [rpcrdma]
is flushing !WQ_MEM_RECLAIM hns_roce_irq_workq:flush_work_handle
[hns_roce_hw_v2]
WARNING: CPU: 0 PID: 8250 at kernel/workqueue.c:2644 check_flush_dependency+0xe0/0x144
Call trace:
  check_flush_dependency+0xe0/0x144
  start_flush_work.constprop.0+0x1d0/0x2f0
  __flush_work.isra.0+0x40/0xb0
  flush_work+0x14/0x30
  hns_roce_v2_destroy_qp+0xac/0x1e0 [hns_roce_hw_v2]
  ib_destroy_qp_user+0x9c/0x2b4
  rdma_destroy_qp+0x34/0xb0
  rpcrdma_ep_destroy+0x28/0xcc [rpcrdma]
  rpcrdma_ep_put+0x74/0xb4 [rpcrdma]
  rpcrdma_xprt_disconnect+0x1d8/0x260 [rpcrdma]
  xprt_rdma_connect_worker+0xc0/0x120 [rpcrdma]
  process_one_work+0x1cc/0x4d0
  worker_thread+0x154/0x414
  kthread+0x104/0x144
  ret_from_fork+0x10/0x18

Since QP destruction frees memory, this wq should have the WQ_MEM_RECLAIM.

Fixes: ffd541d45726 ("RDMA/hns: Add the workqueue framework for flush cqe handler")
Signed-off-by: Chengchang Tang <tangchengchang@huawei.com>
Signed-off-by: Junxian Huang <huangjunxian6@hisilicon.com>
Link: https://patch.msgid.link/20260104064057.1582216-2-huangjunxian6@hisilicon.com
Signed-off-by: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-46265

 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index bb744ba155e2..56c7af1c3b24 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -6087,7 +6087,8 @@ static int hns_roce_v2_init_eq_table(struct hns_roce_dev *hr_dev)
 		goto err_request_irq_fail;
 	}
 
-	hr_dev->irq_workq = alloc_ordered_workqueue("hns_roce_irq_workq", 0);
+	hr_dev->irq_workq = alloc_ordered_workqueue("hns_roce_irq_workq",
+						    WQ_MEM_RECLAIM);
 	if (!hr_dev->irq_workq) {
 		dev_err(dev, "Create irq workqueue failed!\n");
 		ret = -ENOMEM;
-- 
2.53.0

