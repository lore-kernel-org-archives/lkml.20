Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57853A3830
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286581; cv=none; b=L99T4cJwDp5WeQYBxjHY1byY3OotthV/wNwn/YXncEG4FVI5cLoYsFj26D23ULMf3EFrfToLSA2dwUZvztD3b77X6JCu5wqPwOJ1pu2hdcj8D2W0/FFQgBw/EbsGN+C+3t7zA3cbnp5fckek4NMzTBEpyK8u+Js8Vcq6X2YLUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286581; c=relaxed/simple;
	bh=Uyl8fsKqF2hZuM9YDMoKvgjEFiqVl+i1dh3r2f/VXKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vi2XKSZZGKmubnHw04mnt2OBEo/bXn0iE7jZBeb5eznUJLKjyb1sHaYq06seuLFxY8V69Bv9cZbpd2p/F5WDLf8MH0F1Cg8cd2IJI8op45jEx7Ec2fB49EI3mIoc49a9nDEr/GL3AbY5r6gMfTIfyHUDyvl4bREzhoN8AyUuqss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so4902375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286578; x=1791891378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndzzUuEtcbTKrn4r7tACpiIJyXYLhlhQwb4ACs5k4Lo=;
        b=FpY1wQwIdLs4+QmsO5Dbl2IredWrAN+2yeiXEdqrzO9c9FPbypiqHiQ+swFeRJzodn
         z+ifzxwoW8R05fysBqW/wyOjh8PQP0IgbUY25HHdMBAPevCyUbd2Cub/0ChME206FiaV
         +RZmz0iKaVmKVFQQlNT3SczyuH/eXuZQI4aIFOpmAhgF2UAeFq6F1nRCwadc0FuihHLL
         DsQcw3cndbDuk6SV/hKNJeCFyhOHQ14BH1rmpQCCYKQ/knq2LamyMzrmZZA9fsRiivCE
         5A2nbc5u6Z577ix4AHWlUK5oHAbgx3htz5Ri27QmF4H8wwJIiuMHHTt/9NWXtwE8IJ+a
         bC4A==
X-Gm-Message-State: AFuF++lPQsx2rypFugt7KXnuq33EMBNUOM+znK4DUuOHoIqycc3e1nI3
	NiYzIEz+p5d0UB46cuC3p3NJKhNEX1kP2jBZhEiJLGLoLHCWpeHhLs0p
X-Gm-Gg: AYBFou1RKTZAgEU216H2OTs1uhmveA0rEzSyluHah4DzPGpq9f5jV4aPTdD1+80ITIs
	4hdNa+5uY/sEqiF1bsuxiSNOxatSWcQ9jkzgtbLddJQKEr+UfG43K+Ueznd2PUEKXFVhhGnpfbs
	Nw1X+Xk0KFk15lOvHu3CIqKsbrDrI5cH2qTaaZAb3Lm3urfd2I7eVnciGMopLcKbtvErrnPYNet
	V5VYnQEGJkZxrudANyCDZETKevxkQHR5SkGp+63p2APwCa6A766zsjcUjNNehAcy2Q9USLIou4z
	pZmw0mfe7pjWz9vr0XNCM9O8fCllRZyJ6HTlp6uX3sy+0MylaSvAlwb2BAEM7dtwndhqZ7xjFpj
	2d9WLM7QZq/0M/3VrM2c3gEuZAVj9Yl8b4YsYKTNc64VkNbGnBhOGLOU+9Y5K5z+p2EwN00hX0B
	iUm1Ci/LtFnliVDnWhD+hxSLYhQG6zhA9CCnXDiemOK6t8YpwXNTw8tTaqsjF6V+9IYyh+q3Tr6
	nZTvFgOSh2Ut+N0jh53S2KLqPs=
X-Received: by 2002:a05:600c:1c16:b0:4a0:258a:8de4 with SMTP id 5b1f17b1804b1-4a17b4f410emr22540365e9.4.1791286577693;
        Tue, 06 Oct 2026 04:36:17 -0700 (PDT)
Received: from white (bba-217-165-185-173.alshamil.net.ae. [217.165.185.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c5d8dfsm70158865e9.14.2026.10.06.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:36:17 -0700 (PDT)
From: "Denis Efremov (Oracle)" <efremov@linux.com>
To: linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Denis Efremov (Oracle)" <efremov@linux.com>,
	stable@vger.kernel.org
Subject: [PATCH] floppy: take floppy_lock when rescheduling the timeout in queue_rq
Date: Tue,  6 Oct 2026 15:35:47 +0400
Message-ID: <20261006113547.2099599-1-efremov@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__reschedule_timeout() expects floppy_lock to be held. floppy_queue_rq()
still calls it without the lock, which was fine when the request function
ran under the queue lock, i.e. floppy_lock, but not since the conversion
to blk-mq. With lockdep_assert_held(&floppy_lock) added to
__reschedule_timeout(), the first read from the drive triggers:

  WARNING: drivers/block/floppy.c:671 at __reschedule_timeout+0x180/0x1e0, CPU#0: dd/561
  Call Trace:
   <TASK>
   floppy_queue_rq+0x17e/0x300
   blk_mq_dispatch_rq_list+0x3e9/0x1f30
   __blk_mq_sched_dispatch_requests+0xcfa/0x16e0
   blk_mq_sched_dispatch_requests+0xd5/0x1c0
   blk_mq_run_hw_queue+0x341/0x670
   blk_mq_dispatch_list+0x50c/0x16f0
   blk_mq_flush_plug_list+0x131/0x600
   ...
   blkdev_read_iter+0x2b5/0x4e0
   vfs_read+0x7fd/0xaf0
   ksys_read+0x12a/0x250
   do_syscall_64+0x106/0x5f0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

Use reschedule_timeout(), which takes the lock.

Cc: stable@vger.kernel.org
Fixes: a9f38e1dec10 ("floppy: convert to blk-mq")
Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
---
There is a small ordering conflict with "floppy: select FDC before arming
timeout work" [1], which moves the same call below set_fdc(0). I will
resolve it when applying the patches, so that the timeout is armed with
reschedule_timeout() after set_fdc(0).

That is also why this patch switches to reschedule_timeout() instead of
moving __reschedule_timeout() into the floppy_lock section a couple of
lines above: there it would be armed before set_fdc(0) again.

[1] https://lore.kernel.org/linux-block/20260504032853.316099-1-zzzccc427@gmail.com/

 drivers/block/floppy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index f04397b8e381..5bbd385f837c 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -2872,7 +2872,7 @@ static blk_status_t floppy_queue_rq(struct blk_mq_hw_ctx *hctx,
 	spin_unlock_irq(&floppy_lock);
 
 	command_status = FD_COMMAND_NONE;
-	__reschedule_timeout(MAXTIMEOUT, "fd_request");
+	reschedule_timeout(MAXTIMEOUT, "fd_request");
 	set_fdc(0);
 	process_fd_request();
 	is_alive(__func__, "");

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.55.0

