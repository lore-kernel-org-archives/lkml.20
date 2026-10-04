Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88FF4192FC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791113179; cv=none; b=t06EcyIPdusV+IgDMYRQiQOPK8zV5oMW8XIbDXnlxK5WEtLQ6kMWeGy9X3EYUb5UoxvTPiEKR2YJOyRYwINC+Co2D46HZt8XE9ldPBkwvSOCF2WMRR4izPgsDOuLUsiayLXVlDqszU+wYA0+/m1EMyIotkO0h5ECMK2ki4OYL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791113179; c=relaxed/simple;
	bh=VTbymmEjpOCQuBqxJS7p1ucb7WAhHa+umEskl+i05JU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZ9F1GRLOyCxulzWY2RsDe56QijS552ftoB9TLIkaQtcF9hRFWtWi+8ZfhpMv5D1Zc6vJE2mn3wMYQQFlQFzK2wuEahMtx0YmSZ7QxJ03XHTOFvWoE3qF5PSejjq5mgANigmbrBxMZeY/0smKBz1UCIkpQjwYZPelZcbut+Huyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJVMzVpR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJVMzVpR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so5662015e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791113176; x=1791717976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaP/Sg1mAHupYqT3+SwRzFofHSCYAQCOIKhJz2Ezv8E=;
        b=VJVMzVpRwXXAydRzCaPR3IQaFx1+bIPOEMi/C8mcicmT6M0YIA2Pw6DKBNAs/xGRNZ
         mmKcJv8Wc8GDYyvg4/cBPWKZyC7YwzJviFzE9TlcuuMi42UDLPQ5EsXhHRLpTcRs0Tj0
         uda4pklF1KV0YB1s8xKm6aAaJP7iv3ZfAMrBNhTRdzhu2sO6FVluonTkgHxvCaghvAj4
         Lp/A55gIz1YFHOpbzgVgF/9p41Iy97EQ/Sp3cg9gjv505RmEu3zD9zTi6UT4r/q2D7gQ
         ZEALESHyz4ZBp2t/Ad9YECLcg/IOXx82JtTJ7ivIdcCRinyAbREgXBV529SX29eDDC8t
         VRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791113176; x=1791717976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaP/Sg1mAHupYqT3+SwRzFofHSCYAQCOIKhJz2Ezv8E=;
        b=pe/cH5ervGsMhlC8eD0WqX37pgl9NFs1w5siMM4a7qpD0e2m9kL/CDTuPxG6CLLVkd
         eiRbEhXp6KSkyhxXALK5Lof0udOIKy+uZmFvbk8+SLBwuY8okExMUAKgkdGYuuXP9OH/
         z9sQTNg418MRT+vibVkh+9XVgsTzCY8ja2PKipctlUIhZtagFTqNVnp4TPNFPRFhwxzm
         RxhhdHNOM7haPMrzEZ1LFXihHDLHY73bGjoYktpHyt93pasohzRmUuMq8L05PJcALuBP
         vT65tJTE1dgiiN6WSZM9C46Y9BR0nyKtCViUaihWcHqbPgdGY4yp09VXJi6/zFuQMEts
         +cBw==
X-Forwarded-Encrypted: i=1; AKwUvBy0j5TTM2H2nr31NoVWsep4McEwYfejxAuVuVxo8EZLFkMOFoTJSHvkmPgeDFosqY0wBvsHcv8OYCi+BiM=@vger.kernel.org
X-Gm-Message-State: AFuF++nEM8eO1lAs6Ln4/8twXTYbLzuwJihLu8gaeCOv3drculcfTaLh
	Yq8CUOMv5DTgVRhxnxA+ERP4/K0eX9j1OQmugrunh/Bri4rAkuEqp+ql
X-Gm-Gg: AYBFou2LdlQ541cIN/uxnILnBh2w9b1jMaxrQOV/5dy4huufF6oW8jaPS9zKUiALywd
	aQk9p/8hU/rjmJ1OYO3+gFxRMoQRjqEcZDlLcxdRep8A+tZCB4wNIjzic7Azm2NTfeHkuT9VGiD
	dndduCqeogvZg/i7BG+V2SeLl91zqMkVU2o+fcHOdGsH+DjHlcHL8a6SitNNspiw1U4SrCb8d0X
	fgId3m7d6Y422OL1rJ/LzMGxa7I5xfcwMzGe70dVRgo/mGoluhfutNbhB7pzPOD9Uqktmo2fsx+
	H0rqNvHv5wInvu2dDkbQiAkR1MI63oDGBMeZ0s6sBtE9boKGm44lFwGxQTZZiMmXP3oc2UAtJZl
	HlKheMUCfVQu/i0SIpzoWJEm+i0Dpz60bVCogYHZHi/t+alVxfv9XCyDkW1qVoZN/gBi/r3RjZJ
	FSIU/R3R/MMQ2n9QhxlHnUDQd2oeUXJWTsoVz7Uo1OmCSHLfe8lxgjTi11Qs30coK175gjXq9jB
	e7X0njhal/SYzFiPuXbSBA8oMGPcu1k7Y0FKRPEI51VOi69e6GF48OvH9cP7y4c1Xg=
X-Received: by 2002:a05:600c:3510:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a02758653cmr126337265e9.16.1791113175399;
        Sun, 04 Oct 2026 04:26:15 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm257088855e9.9.2026.10.04.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:26:14 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+ae549381b4daac2895b1@syzkaller.appspotmail.com
Subject: [PATCH] RDMA/cma: wait for addr_handler() to finish in rdma_destroy_id()
Date: Sun,  4 Oct 2026 12:26:13 +0100
Message-Id: <20261004112613.18171-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot hit a use-after-free of id_priv in addr_handler(). The bad read
is in debug_mutex_unlock(), from the last mutex_unlock() of
handler_mutex, and the memory was freed by ucma_close() ->
rdma_destroy_id().

addr_handler() moves the state from RDMA_CM_ADDR_QUERY to
RDMA_CM_ADDR_RESOLVED (or RDMA_CM_ADDR_BOUND on error) under
handler_mutex. If rdma_destroy_id() runs at that point, it waits on
handler_mutex. When addr_handler() unlocks, the destroying task can take
the mutex before mutex_unlock() has returned. It then sees a state other
than RDMA_CM_ADDR_QUERY, so cma_cancel_operation() skips
rdma_addr_cancel(), and _destroy_id() frees id_priv. mutex_unlock() in
the work then touches the freed lock:

  ib_addr work                         close()
  addr_handler()
    mutex_lock(handler_mutex)
    ADDR_QUERY -> ADDR_RESOLVED
    ...                                rdma_destroy_id()
                                         mutex_lock(handler_mutex)
    mutex_unlock(handler_mutex)
      owner cleared                      gets the mutex
                                         state != ADDR_QUERY, no cancel
                                         kfree(id_priv)
      debug_mutex_unlock(lock)  <- use-after-free

Documentation/locking/mutex-design.rst says mutex_unlock() may still
touch the mutex after another task has acquired it, so handler_mutex
can't be what keeps id_priv alive here. The comment in
cma_cancel_operation() assumes it can. Before commit 722c7b2bfead
("RDMA/{cma, core}: Avoid callback on rdma_addr_cancel()"),
addr_handler() held a reference on id_priv until after mutex_unlock(),
which covered this.

So in rdma_destroy_id(), call rdma_addr_cancel() before taking
handler_mutex if a resolve was ever started on this id. The req stays on
req_list until the callback returns, so rdma_addr_cancel() finds it and
cancel_delayed_work_sync() waits until addr_handler() is really done.
This doesn't deadlock with the work itself. When addr_handler() destroys
the id because the event handler returned non-zero, it uses
destroy_id_handler_unlock(), not rdma_destroy_id(). Event handlers also
run with handler_mutex held, so they can't call rdma_destroy_id() on
their own id anyway.

There's no reproducer from syzbot, so I made the window bigger with a
debug-only mdelay(1000) after the mutex_unlock() in addr_handler(),
followed by a read of handler_mutex.magic. A small test program creates
an id, resolves an address on an rxe device and closes the fd while the
work sits in that delay. Without this patch KASAN reports the same
slab-use-after-free as syzbot (1048 bytes into a kmalloc-2k object,
freed by ucma_close()). With it the test runs clean, and close() just
waits for the work to finish.

Fixes: 722c7b2bfead ("RDMA/{cma, core}: Avoid callback on rdma_addr_cancel()")
Reported-by: syzbot+ae549381b4daac2895b1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae549381b4daac2895b1
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/infiniband/core/cma.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 337a49d1acf7..24235eb0c49b 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -1968,10 +1968,10 @@ static void cma_cancel_operation(struct rdma_id_private *id_priv,
 		/*
 		 * We can avoid doing the rdma_addr_cancel() based on state,
 		 * only RDMA_CM_ADDR_QUERY has a work that could still execute.
-		 * Notice that the addr_handler work could still be exiting
-		 * outside this state, however due to the interaction with the
-		 * handler_mutex the work is guaranteed not to touch id_priv
-		 * during exit.
+		 * The addr_handler work can still be finishing its
+		 * mutex_unlock() after it has left this state.
+		 * rdma_destroy_id() waits for that before it takes
+		 * handler_mutex.
 		 */
 		rdma_addr_cancel(&id_priv->id.route.addr.dev_addr);
 		break;
@@ -2121,6 +2121,17 @@ void rdma_destroy_id(struct rdma_cm_id *id)
 	struct rdma_id_private *id_priv =
 		container_of(id, struct rdma_id_private, id);
 
+	/*
+	 * addr_handler() can still be in mutex_unlock(&handler_mutex) after
+	 * it has moved the state on from RDMA_CM_ADDR_QUERY, and
+	 * mutex_unlock() may touch the mutex even after we have taken it.
+	 * Wait for the work to finish before we free id_priv. The req stays
+	 * on req_list until the callback returns, so rdma_addr_cancel() will
+	 * find it.
+	 */
+	if (id_priv->used_resolve_ip)
+		rdma_addr_cancel(&id->route.addr.dev_addr);
+
 	mutex_lock(&id_priv->handler_mutex);
 	destroy_id_handler_unlock(id_priv);
 }
-- 
2.34.1

