Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173504;
	b=vXI1SHJjPw/Jw2ROLVYqfg9EOSmU8p/kgMB1Qi0LbpgR6oGZgQjAYgwuqFap+7Kb6BuT
	 reHl2zu7rvdDZmCyTVTEz5Wpk/8ZwA/LWdliT3dYA0fMY2xXs+q9vtI+nG52gpZ8es0TI
	 EJBRyP/SzV3mFdsR9Va8ihzNAgYqrSst55g27vsI/c1R2YHZ6tqrcLXW20NodIaVrSAWE
	 NVxgXi2/QzvaMWqveqtjRKxbhkJgViu6mELFym4ak32o6cWrMTwoezbxhOacpASfDWCCt
	 emP9AI/7iM7MQwy8HSh8IDYTx/7r7etFpZmbmCPMo95crgG0Zc0BImWbl86zjZFWZiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173504;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=JmmYOyP/5onEQ6R2GZPgiozUVff8AaN8iSHL7u+T4j8=;
	b=Ck+eAvvce57R7jhGyzEnsuF702RZm2CU36gialnuq9ms3KpwdFnnHMxY691nhHC85/e4
	 oAJT0wballkGcjTwo8T57OuRWkFD6FSAYvPvdAVmfrVGtWAT3bDNp95WIjoub5LoHsUd9
	 NtCKEjHZjyTjfK8mY7UV+txvi0m8x6vLQCmVQ8t4INVDbrhsAA4dQZiEwdMFht+4qC47J
	 T/SmPuvVRhvHDnoJ5H4Ch1Gc3OJ0rhtZnXKoou+ukDDYcYhzV3QyDP1HoMjt2HdkpBamD
	 +JKbt7JdskJfdkGtgdmu9ucTrZfkEmaZsBScIh8mOSTHY7EeqNt8ZiNuZUwBvF8Ucdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB19A606A31E;
	Wed, 28 Oct 2026 07:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB19A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Jm
	mYOyP/5onEQ6R2GZPgiozUVff8AaN8iSHL7u+T4j8=; b=eH+2ezBh3oonbw0vUz
	dAaZn11EutGZtAsICrnG7uAw0SvOm856Xt+DfGCAosAA2H94lJYrit5cDcUA2htz
	aQV8zPy6giliDQNoa5/tYUqmUdRHqmQ5Px+D3hZtcovvFPdEnmwaGsRSBzh06yiY
	CO4U97321oB9vu2IGtsXwVwFo=
Received: from flipped.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wC3F8Lop+FqKgc1DA--.60794S2;
	Wed, 28 Oct 2026 15:44:41 +0800 (CST)
From: Sicong Huang <congei42@163.com>
To: linux-media@vger.kernel.org
Cc: hugues.fruchet@foss.st.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Sicong Huang <congei42@163.com>
Subject: [PATCH] media: st-delta: fix decoder use-after-free on release
Date: Wed, 28 Oct 2026 15:44:39 +0800
Message-Id: <20261028074439.2515928-1-congei42@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3F8Lop+FqKgc1DA--.60794S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW7tFWUZrW7tFW7Aw1UZFb_yoW5XFyDpF
	Z5urW7KFWUJF4vkF9rAa18ZFyv9ayrtay5Jr4Fg34fAry5XrW7trWrt3WSvFsFkr929w1Y
	qw4jgry3XF40vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piiL8AUUUUU=
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/xtbC0wk3Kmrhp+lJ1QAA3e

The st-delta driver processes decoding jobs asynchronously. Its V4L2
mem2mem .device_run callback, delta_device_run(), queues ctx->run_work,
which executes delta_run_work() to decode an access unit. For MJPEG,
the worker accesses the decoder-private context stored in ctx->priv
and the IPC buffer shared with the firmware.

During release, delta_release() closes the decoder before calling
v4l2_m2m_ctx_release() to cancel outstanding jobs. For MJPEG,
delta_mjpeg_close() frees the decoder-private context and closes the
IPC channel, releasing its shared buffer if the channel was opened.
However, the V4L2 core does not stop streaming before invoking
delta_release(), so ctx->run_work may still be queued or running.
The delta->lock held by delta_release() does not synchronize with the
worker, which uses ctx->lock. As a result, the worker may access
freed decoder state, causing a use-after-free.

One possible interleaving is:

  CPU0 (release)                    CPU1 (worker)
                                    delta_run_work()
                                      delta_mjpeg_decode()
                                        ctx = to_ctx(pctx)
  delta_release()
    delta_mjpeg_close()
      kfree(ctx)
                                        if (!ctx->header) /* UAF */
    v4l2_m2m_ctx_release()
      /* Waits for the job too late. */

Here, ctx in the MJPEG functions refers to struct delta_mjpeg_ctx.

Move v4l2_m2m_ctx_release() before closing the decoder. It prevents
further scheduling for the instance, removes jobs waiting in the mem2mem
queue, and waits for an active job to finish. Since delta_run_work()
completes its decoder accesses before signalling job completion, the
decoder can be safely closed afterwards.

Found by code inspection.
Fixes: f386509e4959 ("[media] st-delta: STiH4xx multi-format video decoder v4l2 driver")

Signed-off-by: Sicong Huang <congei42@163.com>
---
 drivers/media/platform/st/sti/delta/delta-v4l2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/delta/delta-v4l2.c b/drivers/media/platform/st/sti/delta/delta-v4l2.c
index 7dd27de37b78..586dae169d35 100644
--- a/drivers/media/platform/st/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/st/sti/delta/delta-v4l2.c
@@ -1699,6 +1699,9 @@ static int delta_release(struct file *file)
 
 	mutex_lock(&delta->lock);
 
+	/* make sure no m2m job runs once the decoder is closed */
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+
 	/* close decoder */
 	call_dec_op(dec, close, ctx);
 
@@ -1708,8 +1711,6 @@ static int delta_release(struct file *file)
 	 */
 	delta_trace_summary(ctx);
 
-	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
-
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 

base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.34.1

