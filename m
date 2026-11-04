Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791668;
	b=aWSzcnkER/jn561ksiYtnBS1dQz3WQ4g5YS2ZBXI6gU2k+5Yz5QMXQRoxsIICgP8IoUT
	 gy+vIRhfkKjYfTinvrvVxx3Q2aYsAYdILoi4SL3Fb/TXUvVXWeL8Rvx58h27G8ZJ92Zh7
	 3YJi2IuxwQDnbyzIJpN4okkO2yumM4j/AUm5R+f0fqKZKrUresDFPw7XXSLPwBOS8ebiS
	 U0X9v9FOMVhP+8P+f7mutYpMx09ov5LUBlB0zUGwl6hGI5KXgK0mCF9aWUmhpl8Y8ePRy
	 DbFRRx0tA4l4OVS/6lh4d+ZXauh4L7b4n5QmoNMhtVeS0wNWQr5wjB3yJgpYTf+4EFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pyY2wj3cJVqfa/dTdmvd0ISos1ijTzTPDWm7P9keHwc=;
	b=rkSPbduyeBbd/VtdVun14CFCV+MqwciA+T7rXziKqg8YIqxxidKtXFeTu/747havsEZm
	 LIitNEyRoWorSIq2Ebzr2KywIli2h9IIvrgGdvshNpciBUNhb0PbN98oNv3UPwo6tz1L0
	 0vv9CcQDaJBGIr3uDxhcMRCmqARiy+y3P8MbofGTIE1+9I7wvqhXo4HD42WQoUE/FhJPX
	 C+cqhOqmUC6XEqx9tPrJV8PC64452iVQRgHV+OK7Zu731gEA+9vJNUeenIKmmlogBSU/S
	 k/H2Xt2est2SGdCkwGGUZJOKSJXBKjQI2fOsG95LZ3qNaRyiYxYKTIyxL/DZICe72yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fXk1BHcc;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46A606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC46A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fXk1BHcc
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso173580eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793791667; x=1794396467; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pyY2wj3cJVqfa/dTdmvd0ISos1ijTzTPDWm7P9keHwc=;
        b=fXk1BHccVFgFL2XcIFK6TH7HehutMBNeWYP7scpQtF10DBbnkfjU9vEeP2Lyeb3JVf
         aWgvXyVKWpfgm8PcYjhDbp/pWFpgUqmg0N64KdFw3ujsvWyKJgkd1aVc97gU/36coh6F
         dO04GJ1Am/hsPTFUGv3yxntdeN/g+pASqWYCBkuclbq/rLyll8ckuhZuIIgsNWmFXTx7
         30VPsrGWE95BTqmWa/vsSvEG+yhcpiQZOPzL0nWx6dK67jQ0aXbWZ4StHt0jIV87/RIN
         45M7NgACwqrJfKeN2Eez6hvyh7s4zBqAW1jGlEfkLh69N9WTJEsrA+og0e5iGPAr2Au/
         yxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791667; x=1794396467;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyY2wj3cJVqfa/dTdmvd0ISos1ijTzTPDWm7P9keHwc=;
        b=j97dRNj8tiY2gf08eMCExLRo/OiP6RebQS+n8HIWk/IAy/HRWWUdLyR2NSSE8E0fT2
         xvIHRHCgKrP3o0n2xQ7q7FuRNwMfD0ILSoDiF0pTa5P0sLsqNVnxncwxGj1+mRfhkJZn
         3UjbO6BSDpCl04kzWPkxzn7CjdUenOeAqyW2y7jT19rI7xjT0A9QY1/oeonohalOH5Tt
         Fi3691NGDParpR8Hb2/yjJBp2n6/WZQNy4hihlnWR1ORW1b+qCX5iBDZHSP6K5I89YMR
         T+8Ml7AWZ0395RYpDJk/3dHzyYqX9afbUcx9h7+VN3/k5ZvzrGi1iMY94cCwgWc6z9C/
         oDow==
X-Forwarded-Encrypted: i=1; AKwUvBzHeULuoXMWO4XbnFfeL06DPgS7FpHjSbk1FIEuATbe92BmfSJU6UMSmEP9BP/V4LKV0yYK/jC3k35DbyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kiJ3Dv2c3Cz9w1RYfMMGk8X06vnpfIjqvyODenJbDhRNn4JDE
	aIRNUB5qwcwkJ9R+4CULki2AfY42+JDatHujDKNUKoUmbU+cjdveAdEozxfTyswhlGAt+V1cMPd
	qFH49IRuOlymgtnSzy3voZQ==
X-Received: from dybpl4.prod.google.com ([2002:a05:7301:4304:b0:369:dd6b:ac5c])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr21671592eec.26.1793791666553;
 Wed, 04 Nov 2026 03:27:46 -0800 (PST)
Date: Wed,  4 Nov 2026 19:27:44 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104112744.1630864-1-stanleyjhu@google.com>
Subject: [PATCH v2] block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when
 already active
From: Stanley Jhu <stanleyjhu@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Bart Van Assche <bvanassche@acm.org>, Brian Norris <briannorris@chromium.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-block@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
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

Transition q->rpm_status to RPM_RESUMING in blk_pre_runtime_resume()
only when it is RPM_SUSPENDED, and call blk_clear_pm_only() in
blk_post_runtime_resume() only when old_status is RPM_RESUMING, pairing
each clear with a completed runtime suspend.

Tested on QEMU ARM64 UFS in SDB and MCQ modes by injecting
runtime-resume START STOP UNIT failures on the UFS device well-known
LUN, confirming zero pm_only underflows and balanced runtime PM cycles.

Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
Cc: stable@vger.kernel.org # v7.3+
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
Differences from v1:
- Move SUSPENDED -> RESUMING explicitly in blk_pre_runtime_resume() and
  clear pm_only only for RPM_RESUMING in blk_post_runtime_resume()
- Describe the QEMU UFS test coverage in the commit message
- Link to v1: https://lore.kernel.org/r/20261029040001.2100001-1-stanleyjhu@google.com

 block/blk-pm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/block/blk-pm.c b/block/blk-pm.c
index 8d3e052f91da..34cc7c5ca04e 100644
--- a/block/blk-pm.c
+++ b/block/blk-pm.c
@@ -142,7 +142,8 @@ EXPORT_SYMBOL(blk_post_runtime_suspend);
  *
  * Description:
  *    Update the queue's runtime status to RESUMING in preparation for the
- *    runtime resume of the device.
+ *    runtime resume of the device if the queue is runtime suspended, or keep
+ *    RPM_ACTIVE if a previous failed runtime resume already reactivated it.
  *
  *    This function should be called near the start of the device's
  *    runtime_resume callback.
@@ -153,7 +154,9 @@ void blk_pre_runtime_resume(struct request_queue *q)
 		return;
 
 	spin_lock_irq(&q->queue_lock);
-	q->rpm_status = RPM_RESUMING;
+	/* Keep RPM_ACTIVE if a prior failed resume reactivated the queue. */
+	if (q->rpm_status == RPM_SUSPENDED)
+		q->rpm_status = RPM_RESUMING;
 	spin_unlock_irq(&q->queue_lock);
 }
 EXPORT_SYMBOL(blk_pre_runtime_resume);
@@ -168,8 +171,8 @@ EXPORT_SYMBOL(blk_pre_runtime_resume);
  *    driver or error handler will need to communicate with the device.
  *
  *    This function should be called near the end of the device's
- *    runtime_resume callback to correct queue runtime PM status and re-enable
- *    peeking requests from the queue.
+ *    runtime_resume callback to mark the queue runtime active and clear
+ *    pm_only if the queue was resuming.
  */
 void blk_post_runtime_resume(struct request_queue *q)
 {
@@ -185,7 +188,7 @@ void blk_post_runtime_resume(struct request_queue *q)
 	pm_request_autosuspend(q->dev);
 	spin_unlock_irq(&q->queue_lock);
 
-	if (old_status != RPM_ACTIVE)
+	if (old_status == RPM_RESUMING)
 		blk_clear_pm_only(q);
 }
 EXPORT_SYMBOL(blk_post_runtime_resume);
-- 
2.56.0.385.gac671c819a-goog

