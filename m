Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7C3C3BFA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495133; cv=none; b=g9r1GtHpVzN00+lC3MbYf+Ucvo7kJcoWNO15d1yl+EZ56yjQYy3WEN/oSVtDTtolOdcfn8RcibC3c6dt4KRBxB86yAqtEFuoFq5CTuXYOVhEfc3tDYTRNZjbO/sUaccYK4EodPBUYdvlAmbIu4naQaGEnvG8lZXyop7SeGRXt90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495133; c=relaxed/simple;
	bh=175TMyjXYbKvQv+2xfNx1pjOaF88OH/j/aBTVdwcliw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCj2AXIvSGKq4ZcVEhLvY1DkNBcDbU8MCmjNnqcL1JkGBDmMQ0s3OWqMNs46/MVNROkYaBqIx6+XSaVW9AlYbPDpUCo9NE4Pu3El+S30VR8W9I4LBp+Yq+TiFBmUQyEZF+Ddgrp1HqjOX1AdY4xxfE1m+GuOd4QYP+TUjyktXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJjKi2hc; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJjKi2hc"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-343241d5d34so48828eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790495130; x=1791099930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hTRes37Q2KgbwIZUkJQo8Y6gN/vVSdb39+kLswqOgc=;
        b=KJjKi2hcUjp+HPt/aMlZyADyc5W8ychzP9wLrTPZDUXJyAaIi0dHqMc2rMoK5Ohj3f
         bH2/SeIx93AwLowcMlf2v5a5Md54DclHHHgI0uNI64snrgjoTFSkDsFak9Gk26+Jm///
         cKWj5FTuXSEsu1+CjksL4+7R/UwP5Vi5S0ZHVyWg0pnNZEkFpeg2hO/qghcTOS2wy5ZZ
         AEPqN9aCwsRmPwl3azusCSu7+wI7PW6NOiuiq8JFXEwQr/kWX5jq01Xbd9WSb8V37Zwx
         0r6L95cSHKhGRwIs87gaZ+FuQ8GvfqobKV9uoBHvbHpuipIzzZfh7OsnVdp06Nck0SB5
         stnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495130; x=1791099930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hTRes37Q2KgbwIZUkJQo8Y6gN/vVSdb39+kLswqOgc=;
        b=Q17TTJUiuK6Jo0mTBYUW8MxYAv8uWxA0fSvvw1P9HPz96swibWOgyg8U7m3P1VK6Rh
         pSqvcHgAGJp0gd6yG/jZe4l8zYA4gGLcxNNL5BmVdLJFMqq2IrsyCzB7dUkEcho2RI6t
         QGiqDxmovGg27s4FQXySYUotqgJqo5+ePh4oqEKkfDRnTXwGbfo+v4sTM3z7c1R+8P70
         HPXcG+QNbMIWuvt0IP69kn9o5oAoiSYEurPVAPrTuo9ogQUzMLOBjktopUz4oez6CkE6
         qJorFq9q9grOKKCI3ZU+6AOSmXl3eeuhpuYgEX9qJ8Gt3OFLvc3MstYldJ6MMF3YRkqI
         JLCg==
X-Forwarded-Encrypted: i=1; AKwUvBwvU/vATYpKnzkGzzQeeZpVGUuq6dCMfaoiT9+jxOnNj9G2v8HYbQvwXgyuoi93p8KjIaXpQ5I6xULlnYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfE3hn5E0g36oCquCsIYARO1NPNJEZOsrHL/xLyZCbo7q6nJ3H
	+u4lU4Zjq/NPXJQy/XRJilsnwJOOyT/WEsEOGcnrQsPHeo07LCeVFkYH
X-Gm-Gg: AYBFou0zFT8nbQOCZG1tnB/kyfx6L/jX87EHkXOVyV7/4fecKDJ7RKCKYl3z0MXhTjY
	cwSYOw93mMrFH7y+PSinK4kDPVNj3/MTkPFB37O1bA1cHFjQav9IJRpqOxtTdWQ1qtLy3nQ6Yko
	8wcojH74nH4ApoOFow5zSCclHooBZYWE22422RbY4K231ZieRAohNpwFt2wq1eP1z0zar/QMIVk
	FC0HkfNMJhZG7zixB1UjHYYTnFjXOesTWa1ChqDbaNOqlcOk6DV7XcPaDlkzFQXGSDX7/XWmtxs
	a12namcTciVQLts9EsF7XFVq2+20p3tgUU+VjjuG87HcsXivvCWk4S2QMIBtwzvWhBjJo+wDTjg
	CNgELooigDN0qkQNwqyX1b5XRNRKIFOe+5TiCuoV8HzVeF//08kIstfwQ55VAcoN21jpFl9DYhi
	tQyUFxVgaAxjzh7QVrn3twOshf0ZMzvJ62qyF4a0O2STDTbGxQ8uAF0zTjYjpLAcZD/pKe5oHtM
	aBvQPyjD1+CfYfjA8Gbek8i/cT+1pLbIx6BPOpE+1qnAfESHujx5S/Yy42tKWdLjtoHLA==
X-Received: by 2002:a05:693c:2589:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34273249209mr8814184eec.2.1790495129005;
        Sun, 27 Sep 2026 00:45:29 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm19752996eec.23.2026.09.27.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:45:28 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Karsten Graul <kgraul@linux.ibm.com>,
	Ursula Braun <ubraun@linux.ibm.com>
Cc: linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net/smc: serialize link group free work scheduling
Date: Sun, 27 Sep 2026 15:45:20 +0800
Message-ID: <20260927074520.3694663-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smc_lgr_schedule_free_work() checks lgr->freeing without the link group
list lock held by the teardown paths. A concurrent smc_lgr_free_work()
can set freeing and cancel the delayed work between that check and
mod_delayed_work(), leaving a timer pending on a freed link group:

  CPU 0 (smc_conn_free)            CPU 1 (smc_lgr_free_work)
  observe lgr->freeing == 0
                                  set lgr->freeing under lgr_lock
                                  cancel_delayed_work()
                                  smc_lgr_free(): drop lgr reference
  mod_delayed_work()
  smc_lgr_put(): drop last reference and free lgr

When the timer expires, the timer core accesses the freed memory.
KASAN reported:

  BUG: KASAN: use-after-free in __run_timers+0x86d/0x8d0
  Write of size 8 at addr ffff8881186902a8 by task swapper/2/0
  Call Trace:
   <IRQ>
   __run_timers+0x86d/0x8d0
   timer_expire_remote+0xd3/0x120
   tmigr_handle_remote_up+0x4f4/0xab0
   __walk_groups_from+0x40/0x150
   tmigr_handle_remote+0x229/0x2c0
   run_timer_softirq+0x1f5/0x250
   handle_softirqs+0x18d/0x5b0
   </IRQ>

Hold the existing link group list lock across the freeing check and
mod_delayed_work(). Rearming then either precedes the freeing transition
and is caught by the subsequent cancellation, or sees freeing set and
is skipped. smc_conn_free() retains its link group reference until after
scheduling, keeping the group alive while acquiring the lock.

Fixes: 8e316b9e7260 ("net/smc: improve link group freeing")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/smc/smc_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index 9974149659c2..8feb486ada56 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -80,6 +80,10 @@ static void smc_ibdev_cnt_dec(struct smc_link *lnk)
 
 static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
 {
+	spinlock_t *lgr_lock; /* protects lgr->freeing */
+
+	smc_lgr_list_head(lgr, &lgr_lock);
+	spin_lock_bh(lgr_lock);
 	/* client link group creation always follows the server link group
 	 * creation. For client use a somewhat higher removal delay time,
 	 * otherwise there is a risk of out-of-sync link groups.
@@ -90,6 +94,7 @@ static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
 						SMC_LGR_FREE_DELAY_CLNT :
 						SMC_LGR_FREE_DELAY_SERV);
 	}
+	spin_unlock_bh(lgr_lock);
 }
 
 /* Register connection's alert token in our lookup structure.
-- 
2.43.0

