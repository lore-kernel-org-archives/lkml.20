Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD862EEE65
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791689867; cv=none; b=fxstfbG0vR4Ns4U0bN+9eQLXe8FP0lbVNYmujVyuyKuN7qLYBfqyWkqpfyUt2E6bTQeN3lQz5UCv2eP7W3WiGyKkS1qnxE3d1dS/pIIp/aYG9ar5mv0rInOY509WougeOrA6sngkBBjGbXVaPujNEQqNui6roLJFFT0R5yYWxas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791689867; c=relaxed/simple;
	bh=WL9TgnhpQEvY90Ll4HmdAvQl1G42rWomuaVXMzpGasQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FjRQaHx7Sgx6v9ZwV2hqIeUE9onSNuroYFlOMcB4/Xuo2LCjK4KddhWRXDymANZdt4lEO6Xl8QiSd05D2cIlS9DNJw68t1/ixiL2vWO3Ap4vos6tegm8ctJXWJPODJIzKHS2d6fCKbXxs43QUx99dHPdIEX/Z48QQ3KMX9MmoEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4sCo/T1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4sCo/T1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5378b281aso4241445ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791689865; x=1792294665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGdZTphdielncpBx9OT9jLr3XakXHovVsOh5FWf782Y=;
        b=V4sCo/T1VkB/KTGub0UnuGW0idPk33oHGfCqezdBRlh24BIV3GFwoUaJrKMvyG8JW2
         cNmID4vEEzWL9SoqHAZOjZLiGZ3An9NCm7Ph/PU/Kok0D7/7LO+EgR4otNaiNnOxbUrG
         +/lIwCVZvketkeP3u5PoJjBFOudLNr+1N/kqE3Qdr2jafflNP5u2w4UQtxHsKWMLYLch
         V8OpIckmA6+2rMb/dJIW6k+5mM4Uo6qW2swttNoPlB2ep1PQ+U2kUmuBgpuuAWX0zGsx
         YDqyMgfG9Jk5FfogA/YHi4Qqd4NCUWhTs7SAAzSILyAFQkIOwgApCiCccFfYQyaIRsEb
         vZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791689865; x=1792294665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGdZTphdielncpBx9OT9jLr3XakXHovVsOh5FWf782Y=;
        b=hzjXzWZf57UXtoRkjXtxgordguYgu+bssbxenV5jOGdY0+6wYLjRM4EitiZKnCVAEP
         qIK/RTfoE4fMfVCdjm6kz/5u2Lcb51RztuTAnTBWGxFYeT9TRDGvpjHyP6ng7fR/GNU8
         fPVpcKgznN0F4Tdf3v3ztzwFXsUBGbntD+T4ooRrl/gTKnEPeWfIdGZ3T9oXLgz8eC/I
         GjbOL1ab5aDDo/Id4gscIwtWiSUHL6HD/P7jFBGzdVK8g8tOQP2okQIWIlxUflddBZGU
         E5aDiz1J6ug41SUgYlqkZZhjBw12h2xeakIOXrLuaJjYGbCfOn1uf2Yylr0np/RK18mf
         +Izw==
X-Forwarded-Encrypted: i=1; AKwUvBxQHCr37aFlZV1gsBTMuHRzd4D9vbJycQDJwpjQxcx+OSMGlnsMPDYcli/y/XUOrvwUy38fV+UIMaIJDo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6TuybW5Uc6g7pwrM1McPCGiIec8zx7ZRt/C+6n8tpiI8ZYU0B
	UnWynFOKq7vgiKufKCr8AEc8HW/O/5NHdHz9loV4wvNFyZyj8BLTH1dD
X-Gm-Gg: AYBFou2uY47MiZAFljwfnbIq9sBMWg5uhqv01PrIzI9+ExkUQfPQxqQ2hwobonVuYVw
	C0gCYxS7ZSf+R+HoyA86QFQF6yQQauh8UlmymiHPaqf4G/e1SSxvWQlMQmRgLL3TjwJ1QYG5wHC
	h6BSGZps9XH1JB2+nOKlWi4j9B4PG5j1UnNkgk1WMgUW/b4Cf42nuIirYiEuwPQ5ossCbWPQZmP
	j95Ztxa2zNcXbLvMxIPoyTueENC7PtrKMhB6ZsCdof8tACBBtPAdPOu8n6DrUqGForqwd+Asix6
	4kq3gGokdbaALDh7Cdm2YwHjXkrTxUoddhUQeVCs2PJs21Cky4y5UTo+jbVR1/wngM5vo4bKnPT
	2my07WDLZdeSLjElWTDP7d3NTuhjFce4/UauBypYOldJS1XOam/Wq+EYtxl0xxGfRWRvghn7b6P
	Bd8CuAStc4EA8y1jej8/DaEEDknptfevozPUkBFdpG01pFY1E5oh/yh4Wh+h+6G5tNVdo0mqWyj
	Q==
X-Received: by 2002:a17:902:cf4b:b0:2df:a803:efaf with SMTP id d9443c01a7336-2e842bbf513mr52153315ad.23.1791689865185;
        Sat, 10 Oct 2026 20:37:45 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16c8::245:79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8c6esm27212895ad.61.2026.10.10.20.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:37:44 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+90895f5bfaa7243c2d20@syzkaller.appspotmail.com
Subject: [PATCH] nbd: fail requests stuck on a dead socket when timeout is 0
Date: Sun, 11 Oct 2026 10:37:39 +0700
Message-ID: <20261011033739.18434-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a zero command timeout, nbd_xmit_timeout() only logs a "possible
stuck request" message and resets the timer. A request already sent on
a socket that has since died is never completed this way, because
nothing will ever answer it.

That blocks nbd_set_size(), which freezes the queue while holding
nbd->config_lock and genl_mutex. The freeze waits for the stuck request
forever, and reconnecting a socket (which would change the cookie and
get the request requeued) can't happen as it is handled later by the
same reconfigure call. Everything touching the device then hangs,
including partition scanning in udev:

  INFO: task udevd blocked for more than 143 seconds.
   __bio_queue_enter+0x369/0x7f0 block/blk-core.c:396
   blk_mq_submit_bio+0x776/0x2a70 block/blk-mq.c:3127
   ...
  INFO: task syz.0.17 blocked for more than 143 seconds.
   blk_mq_freeze_queue_wait+0x101/0x180 block/blk-mq.c:191
   queue_limits_commit_update_frozen+0x55/0xd0 block/blk-settings.c:590
   nbd_set_size+0x4c5/0x7d0 drivers/block/nbd.c:383
   nbd_genl_reconfigure+0x7e1/0x1040 drivers/block/nbd.c:2444

Requeue the request when its socket is dead, as is already done when
the socket was replaced. The submit path then waits for a reconnect up
to dead_conn_timeout and otherwise fails the request with an I/O error.

Reported-by: syzbot+90895f5bfaa7243c2d20@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=90895f5bfaa7243c2d20
Fixes: 2da22da57348 ("nbd: fix zero cmd timeout handling v2")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/block/nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ffce519bf008..218b99f9e1ef 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -532,7 +532,8 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 			blk_rq_bytes(req), (req->timeout / HZ) * cmd->retries);
 
 		mutex_lock(&nsock->tx_lock);
-		if (cmd->cookie != nsock->cookie) {
+		/* A dead socket will never complete this request. */
+		if (cmd->cookie != nsock->cookie || nsock->dead) {
 			nbd_requeue_cmd(cmd);
 			mutex_unlock(&nsock->tx_lock);
 			mutex_unlock(&cmd->lock);
-- 
2.43.0

