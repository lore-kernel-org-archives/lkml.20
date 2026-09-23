Received: from mail-dy2-f1.google.com (mail-dy2-f1.google.com [74.125.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615D43803E9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146898; cv=none; b=H5dAvd6+NaLK/20t/SB2gtnNVx/EKn9HIQipjXTaa1uX6LASPGkzgt+J8OwjZvFIuNcvYBjIkxV83HwBMgPYWDb94xJkS7nc6V9HaaqAD39mbvcHiN9OdNSF8oZi0mXnljcUVzIu1DphotUxIwp1JRtC7Bs+RvhAzKtMYH+fx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146898; c=relaxed/simple;
	bh=obsTMBLuGpMSfaLfy22gbz4UlV890qwEszUgqrLdmyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fp4BgKP7nuNvJt62pyBFib1w5BqPtQ0UMHXL4h2qQdo6seg/+2+ia1VcxhASCGDnnG/CH2OQ9F8LUSmR65CBTg3gbL9smG1NVzEHnpL6ouJfbld1AF+aoeuEYaVqTNJ81Tw2fq7ec+Bh84+TW+dA5z9t7DpekwEeYzROvR0nhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fp3w9MGM; arc=none smtp.client-ip=74.125.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp3w9MGM"
Received: by mail-dy2-f1.google.com with SMTP id 5a478bee46e88-313be8d47d4so298593eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790146896; x=1790751696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH4BSQ01Tb47RkHnHR9gmpoXGNiJC9eaCsuZ6hGII7E=;
        b=Fp3w9MGMiMr36MKkzALjriukef3X9UoXTSE4AOFv05DH4ABVla7syeYYpbtqoNkPnv
         veDWDvg1V74K+ytx6Q8vihBMSpaeg1PCrF92sPd3h2Msh9PtmUpJW7Wq2cA67zd2mk0z
         pFxpZkCqO9hq/DXZC4BsxLJVvLMOjD/VuUzjLAXIP+hH0O4kT7tUzk7lPfx3cqLJ+Wyh
         ciAqkyvrhYyBpbJU6fE7kjGglPR1YoZIv85mhJ8wvqMtud3HHXJ+M5ROJuj3aCYpTLPJ
         BSKArpED0IDkwzXHrM2Un9S2YvtprSq6I/Cr+rk37nv8kYP0wtoGGfUQViAjawo2QP4f
         mb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146896; x=1790751696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH4BSQ01Tb47RkHnHR9gmpoXGNiJC9eaCsuZ6hGII7E=;
        b=ymZtzW1XjK5xsFYvulZEF1LGVrv2E1qrNGmQWUQ3iWFKsjL1RAqn9EP8gkxf8WrClH
         tYRKpTy3TWeOp45BEiKaKOtw5nW2D1fTLN6f8GIhrolYVUGo9D5FYvB6cka8z6cf4k7N
         MvZIK8ChFeQS9CM/+RcVIGVdXTP4c/muPOSskNRJPEwtwt4UmfqIzU9UCcr3U6hIwoya
         m1hpaPQBuhXsUtVZBQjZddMMTDRu0FTZiHQ2tliTAN48XSl8Wfya4pufjna7y5B6LfRD
         fcIYfcMs8O2A4O3ce3KTEqSJh8+7qh2tBVoE989/HActjiLQ0dfrCGfQbLFvBx9YtUXG
         1lIg==
X-Forwarded-Encrypted: i=1; AKwUvBz8vzGOldGOCcWW/1z9KrLBW0fC0KnowDoQjVwqdmPwSfHHjWb3iC/Pq8cEIHbiakc1cUGDeYuIVZF04zA=@vger.kernel.org
X-Gm-Message-State: AFuF++n9Rm5x0vvZYDzJ1vWh6QHMRqam9nJbpGVkOg+cbbiZznvoQGhk
	WmWklawPs65xYkhXCn2tCl8rXsyDMnMWMwz1dbiTb06euhb4oeULtNpTXl8knCoonDHQMg==
X-Gm-Gg: AYBFou2x/lilTRe2QgfPVofJIhliGRlGSOq8FfGodVVnH+JokjF+Xz5hJe6auNVjpBT
	Sbt4KFmX5vP2m+D2whs0lsyZxn52IPQmMc4d3d6/7SduNcFinzwFYiFN2qGLVYCmuvg1bcgPWL4
	cV5Ur9/jSDZkAaAhcOu82gu4Mk07lMqnJQFX311ZNHHQZGCwS4pcIabm+67krPOV5fBXqWrez78
	I+05e8FGFe9jfifBgXx9so9LZNrPWFGi1mrwTfXPyGrMjhoEWmWCr3/NRok4yScPJvJl+y8H0rk
	n3ErTPzVcdtS81L13C6Tobot4rjb0U0YZdI8tjpDN0WvFErIj1f+lf3pxmn5834mYPBZzO9sAV7
	ySBWO4Yi89+UjBKu+ZkXgfX2DYnlzmi57gCF9rpikFujso0Ax/3rxhuF5eWFs5Dh56ElTTyXtdp
	n1Puqzt0w2TcMoS/syyAa2ZlmZgppenLxOF8WOCCdX+CSXx3ON12hsfg14bET8fsTGkYI1a3PLX
	UNtTCcf9bSh7Rh6LmRsRTBya7mefCzu2BpyaaI+wwtHnM5eDDxe
X-Received: by 2002:a05:7300:fb0a:b0:33b:dd20:f799 with SMTP id 5a478bee46e88-33e8d9cd5bcmr1542183eec.22.1790146896217;
        Wed, 23 Sep 2026 00:01:36 -0700 (PDT)
Received: from Raccoon ([113.30.177.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96848e18sm3690800eec.17.2026.09.23.00.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:01:35 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com
Cc: Rohinthan P <rokinthanp03@gmail.com>
Subject: [PATCH] null_blk: reject blocking/memory-backed devices sharing non-blocking tag set
Date: Wed, 23 Sep 2026 12:31:26 +0530
Message-ID: <20260923070126.21936-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a null_blk device is configured via configfs with shared_tags=1
and memory_backed=1 (or blocking=1), null_validate_conf() sets
dev->blocking = true because memory-backed devices allocate memory
during request handling.

However, when dev->shared_tags is enabled, the device uses the global
tag_set. The global tag_set is initialized by null_init_global_tag_set()
according to the module parameter g_blocking. If the module was loaded
without blocking=1 (g_blocking == false, the default), the global
tag_set does not have BLK_MQ_F_BLOCKING set in tag_set.flags.

Consequently, blk_mq_run_dispatch_ops() dispatches requests holding an
RCU read lock (rcu_read_lock()) rather than SRCU. During I/O execution,
null_queue_rq() -> null_handle_memory_backed() -> null_insert_page()
calls null_alloc_page(), which invokes kmalloc(..., GFP_NOIO),
alloc_pages(GFP_NOIO, 0), and radix_tree_preload(GFP_NOIO). Because
GFP_NOIO can sleep, this triggers a sleeping-in-invalid-context bug:

    BUG: sleeping function called from invalid context at include/linux/sched/mm.h:322
    in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 6031
    RCU nest depth: 1, expected: 0
    1 lock held by syz-executor:
     #0: rcu_read_lock at blk_mq_dispatch_queue_requests
    Call Trace:
     dump_stack_lvl
     __might_resched
     might_alloc
     null_alloc_page drivers/block/null_blk/main.c:878
     null_insert_page drivers/block/null_blk/main.c:1027
     copy_to_nullb drivers/block/null_blk/main.c:1165
     null_handle_memory_backed drivers/block/null_blk/main.c:1388
     null_queue_rq drivers/block/null_blk/main.c:1711
     blk_mq_dispatch_queue_requests block/blk-mq.c:2872

Reject configurations in null_validate_conf() where a blocking or
memory-backed device attempts to share a non-blocking global tag set
(dev->shared_tags && dev->blocking && !g_blocking).

Fixes: 14509b748ff5 ("null_blk: add configfs variable shared_tags")
Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95fdab36405e5ffdb680
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 drivers/block/null_blk/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 4a9beec..64b8bee 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1940,6 +1940,11 @@ static int null_validate_conf(struct nullb_device *dev)
 		return -EINVAL;
 	}
 
+	if (dev->shared_tags && dev->blocking && !g_blocking) {
+		pr_err("blocking/memory-backed devices cannot share non-blocking tag set\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

