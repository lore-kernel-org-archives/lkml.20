Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257702;
	b=ubd6xbbS9xH1RPo6Q10390TgLsTuV0LoJtWjeY6x0vgaWPC1YB5cy6V9j0YiNB72Rxvb
	 T2/rFl+D4wRVHipjfYOICnqWyHOvG1Petax7hzVHWvyipBJVbnAywO/8WKhELz/xMTtbO
	 eUomFEk+7g69mooIAXu2qBPuFMdzdEJZrjCdn1tYY7Tli+2VTQyieWP9DoLt98afbUoUC
	 Pj0YE+OxAgAf6Zlc2F9GDRina+ePzTZFq4rGUaDaIe+x/wCMD8XYy2nfyvaMUxkrmj3fG
	 mMkrFmnS/J88xxSgvL/wy8zHLoYQXaUB8qDPC6pBR7JNprdWW4XpN7uMG+Km6hL3+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ke87La0xWSgmTiEL3IFuQIhdbuC7AYi2feZJeeO6Kt4=;
	b=TOOVOxnwGE5hxb5fi47nJXXrMmqJXO3s9ptqFfaB081aPlZtaLFVbw3P7ouUJE/bhyJz
	 kjYsfGAyILrczjFXlJAeVX6uvG63qySLBFyUkkDYd+qZAMQh/FqLI89x9m8fUtrNAm9Bj
	 JyzmuKdv4rBZzI0KLEiT3NIwXUOhdxbaGGn91hM21YtcQcOGffxZErBqujhxmscU31FzN
	 FiB8ILRAtJpVSIAyrxCcRdrXiA9PW/8LLXl1XJuYxlohn4qL7Ngze1epU2DWzMArjwwwU
	 3CM1jNURVPXHwwslPMvcSz144o+cOqpKfO/XZnF73rhmU3p3RVMGWIBtL3GqC4KLUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M20GFEY0;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AECE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AECE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M20GFEY0
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso2467804b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793257701; x=1793862501; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ke87La0xWSgmTiEL3IFuQIhdbuC7AYi2feZJeeO6Kt4=;
        b=M20GFEY02HFSlOhygrjlm7JH+ts5qe+9RbS8DxnrFLxry8ev9Lw11ID2dfeTYsjyBY
         qVSyuWqH7hAygkevW54cuMwSIRjF7pe1C0jZKZDcPKzyfLYnXKZAJtiL4vg1+VFey012
         j9Hpe/FqeqKAnoq7Grxue+mDvoCWyUns7Fg3gJAHodzyVDay3ahfl63+/h4mUoZuYo7b
         QeKf3mv7FFNFn8ZpTi3F+19xC7Fe+q5wn773h7jQb5HE9PI2Im8fJNHd5QmtR5STJbxT
         iSex4RNsKfYxh1RZf05woqvVdj+XfC3Xo7F5DJyMHONeX+Jk2DkfGvqp6B7DHe/EeC2h
         gbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257701; x=1793862501;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke87La0xWSgmTiEL3IFuQIhdbuC7AYi2feZJeeO6Kt4=;
        b=Hp3i3Pdc7frc58RdWJPmuEqJi3Gt7YrYfRoYjsrMXBsmZjnm53pqeYRPpaoAUG86qX
         4SlELl9D3VmabBawy6Zq9NdnBsbUP68DWI5Ybz1QAJ12MM3Zn+iqOywpdWZdOjzTBI4O
         zQ9M8qyfJ33+V5GBOaHIBBi5ZO4KBnXVvrVbM1tH5ZY8jlY14Zuv36DJE0Z9Q0u6levX
         rpFgDhqLPdiCKL1Sj0SxeQQsFEJ8j54sMTf3jLnYUFgc6ubGrRBK3b1PXDH4myoPcKy5
         r+KQErHubT0ionVTNZb3pS93Rvq37sfVq9t0ZcqABqEpGLfSaI1wtRLVFkLXk/kqGMrE
         8R0g==
X-Forwarded-Encrypted: i=1; AKwUvBwn2Gw+jBUwoy3izKOtuEuvrWa/Eixh8ba6wNywslJbdnpGFJo9+lBE4oURckgkvTj8DSjAkc9i09gtbzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFeyfVaf+H6r8m8lpfTpHnGbqjbKwHAg8AmkeYnAMwNnQydmbr
	qt84guK7iVvFpr9KPrCuLZO1mAEP8gc7K090nZiRppNkUk2uWVpqDCrbwG3suiH7K2kdwc2DIb/
	7918B5VaH4ZhsP6sf1pu8BA==
X-Received: from pfblo10.prod.google.com ([2002:a05:6a00:3d0a:b0:88a:f8c3:9c75])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1c84:b0:8a0:1435:fda0 with SMTP id d2e1a72fcca58-8a6e7dc9390mr4068412b3a.51.1793257700500;
 Thu, 29 Oct 2026 00:08:20 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:08:18 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029040001.2100001-1-stanleyjhu@google.com>
Subject: [PATCH] block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when
 already active
From: Stanley Jhu <stanleyjhu@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Bart Van Assche <bvanassche@acm.org>, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
suspend callback failures"), a failed runtime resume leaves
dev->power.runtime_error at 0 with runtime_status set to RPM_SUSPENDED,
so later runtime resume requests run sdev_runtime_resume() again:

1. A runtime suspend increments q->pm_only from 0 to 1 and sets
   q->rpm_status to RPM_SUSPENDED.
2. The first runtime resume fails in the driver callback, and
   blk_post_runtime_resume() sets q->rpm_status to RPM_ACTIVE and calls
   blk_clear_pm_only(), decrementing q->pm_only from 1 to 0 so recovery
   commands can enter the queue (intended since
   commit 6e1fcab00a23 ("scsi: block: pm: Always set request queue
   runtime active in blk_post_runtime_resume()")).
3. A retried runtime resume calls blk_pre_runtime_resume(), which
   overwrites q->rpm_status from RPM_ACTIVE to RPM_RESUMING, so
   blk_post_runtime_resume() sees old_status != RPM_ACTIVE and calls
   blk_clear_pm_only() a second time without a matching
   blk_set_pm_only().
4. q->pm_only underflows from 0 to -1 (triggering WARN_ON_ONCE in
   blk_clear_pm_only()), blocking non-PM requests in blk_queue_enter()
   and __bio_queue_enter() while the device is RPM_ACTIVE, and the next
   runtime suspend increments q->pm_only from -1 to 0, letting non-PM
   requests dispatch while RPM_SUSPENDED. This hits the UFS device
   well-known LUN by default and SCSI disks with
   manage_runtime_start_stop enabled (ATA and FireWire sbp2 defaults).

Set q->rpm_status to RPM_RESUMING in blk_pre_runtime_resume() only when
q->rpm_status is not already RPM_ACTIVE, so blk_post_runtime_resume()
skips blk_clear_pm_only() on retries.

Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 block/blk-pm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/blk-pm.c b/block/blk-pm.c
index 8d3e052f91da..31598dd03a3f 100644
--- a/block/blk-pm.c
+++ b/block/blk-pm.c
@@ -142,7 +142,8 @@ EXPORT_SYMBOL(blk_post_runtime_suspend);
  *
  * Description:
  *    Update the queue's runtime status to RESUMING in preparation for the
- *    runtime resume of the device.
+ *    runtime resume of the device, or keep RPM_ACTIVE if a previous failed
+ *    runtime resume already reactivated the queue.
  *
  *    This function should be called near the start of the device's
  *    runtime_resume callback.
@@ -153,7 +154,9 @@ void blk_pre_runtime_resume(struct request_queue *q)
 		return;
 
 	spin_lock_irq(&q->queue_lock);
-	q->rpm_status = RPM_RESUMING;
+	/* Keep RPM_ACTIVE if a prior failed resume reactivated the queue. */
+	if (q->rpm_status != RPM_ACTIVE)
+		q->rpm_status = RPM_RESUMING;
 	spin_unlock_irq(&q->queue_lock);
 }
 EXPORT_SYMBOL(blk_pre_runtime_resume);
-- 
2.56.0.313.g2479322e68-goog

