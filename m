Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B81738B7BD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484573; cv=none; b=Q10jEV8XsX9IYH/84bikINB945CsLEWi2ITa0j+NyhE5TGsGCrO2+aQKT8vsWlk4f01hTHgiUkPKpsGJ4SVj2GRPwu/eFJx7EVGmbmaL77GdUE5BYbZrSIKDy+eboITtR1ipsPi/8fVJmEE4scooKOtG+VAVpk4bwW2kpmhxF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484573; c=relaxed/simple;
	bh=IY7cDnO69OtYnZW04lWR1dQ8LLjgm2QwLYvtAfHOBd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qLcZMZnBWYCy6WR9J/ByBJkT8BJQKYd348jsKINzl6z4MRsBJ0qz14oKQEv/j4YDUb8U/8Ox8e7iN5hMQyb/Tj6BcxdBd3sLFsYDQSEfWUEA5EoqA0DqufgppFKL+aXUPSJtpOkL8N7gA+FODigftwofnyPDNSdKHs0VSGDYdvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX/TByLr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX/TByLr"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso356411a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484571; x=1790089371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3JklDRddVOrv6t9Jg4pPMm1sF73441Ty902Oz+e5bQ=;
        b=fX/TByLrkmy/FXF3Jl+d3TEK4V+qSZI8zRUK39gPecPPvPzebT3u+fVAs2HBxh5Oqh
         fs6WRrA62kVtw6C98oocZbNeAw95zKsWYgAOz8VJrt50dNrFTn2sdztLZGo2QI8BDd2Q
         VD8x73FzVrPG30F+Au4KmnxK9BsDVRy//usVlPwMQv3Yi80MXkoXMNFiCownrY1IBJRX
         0mCL5XuYF/NS8npGSfkpriNscXrjQVRZkiJm6xxymp+LPkdV2h0IeU2RZ+5BA5uT3Ggy
         RMSBSOk8hr5bd/sKx4IPKhgSZA5lJBA92YYcDGohvI9D1YYPMyf0JXcJUaqZRR/rSItp
         JmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484571; x=1790089371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3JklDRddVOrv6t9Jg4pPMm1sF73441Ty902Oz+e5bQ=;
        b=Z0kYQmEB1CbNAjrGF0o7EyeX6UbjP9BnAD74f+SsgoJ5vgtZoJ1WLBvo5nJpk56c5M
         SoddDPl9GX9cQycLmaDw8N3SdwtwVboB3xyFSu8lCKsHrk6/9nvH4Yx/UVTgQdWzWkEE
         ysGuQU9PK4BQeBoA6xjD+k3y/j7AmiKpBcWVobImXwl49bavI+rTlEEDN0USH1LzuxQn
         v5sLZxlaXY2GwTqYQrdXq35/106IA6r9kTe5tYR5lruhz+pvJ0eIDqznfFg9ClD0kOCE
         27bqpf2+yciGncASRVAELBRreQ8/mB8t3Pjso+q83el7DcACg6A/XsoDyksVJtGG15kX
         2VNg==
X-Forwarded-Encrypted: i=1; AKwUvBwOpg3SQd8TnyvJYLqVor6LIQ7biSLWPjvs7zJRK4O7mftULGtrTqFJ69hrssdpVMs2vZ3UEj2btG6Qbcc=@vger.kernel.org
X-Gm-Message-State: AFuF++n1mG9V0l3Ul16s55DbXqgWdHAlSGY7EXWviLVIXIUn9oxJ3n2g
	fZof7GrDmuYuZT8vMhaRdg6i9oZm57YjZ5fnfOIDbbAZ65w7h3xbUN4F
X-Gm-Gg: AYBFou22xBCk9TRYzDNzvHViEA+XjJ88Hzv2hqeO57jlj8Djd+l/yNn62+mvQ0uMJBJ
	7/cuFeolrXCCGQmUKerhZZKl1RiqtE9S6LH1bUpRHW7SOyCII8yvw6HxV2xjwgULgXNSCF4U2TZ
	Pr4u20OpZdozMmpjtsD+Els8rwYswRK3qnfRzFnq6/Sg7C3V29sPt4vDBZfe1wuUgs1+ToYWmpX
	GYJkjfs6bg0+wjF3oPF32bL+vsL3vbikl1SEWqJ4OWQdSGBPC+C9iEjr68ynfT558dQKSm93BN7
	ydgT3kvEUWb9kv7T+CVlRgCpx4c4SMbcPiwa7fXKSDwLej94wZARlPUDL4XwYDvjc14kbzKnrtv
	zu941B1sHMmYmEU6ytGqS8qMsjq7w0O869Cs+TtJ6bo7h3TLRIhzUjBepYxY1Pmso7vHC43kdLt
	b1Myq7QmMBeHte9VyfwzshN/PvdSTeYO0aELDdL+nOl2pwekoyqVSYGU/BwB7En8JC7A==
X-Received: by 2002:a17:90b:3f4e:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39e10ce07c7mr2810824a91.2.1789484571006;
        Tue, 15 Sep 2026 08:02:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6cd982sm6137618a91.0.2026.09.15.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:02:50 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] printk: use memblock_alloc_raw() in setup_log_buf()
Date: Wed, 16 Sep 2026 00:02:37 +0900
Message-ID: <20260915150240.390967-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_log_buf() allocates the prb_desc and printk_info arrays with
memblock_alloc(), which returns zero-initialized memory. prb_init() then
zeroes both arrays, and nothing uses them in between.

So allocate both arrays with memblock_alloc_raw() instead.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 kernel/printk/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3fcdf4b4e2e5..fe98d6a86e4a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1197,7 +1197,7 @@ void __init setup_log_buf(int early)
 	}
 
 	new_descs_size = new_descs_count * sizeof(struct prb_desc);
-	new_descs = memblock_alloc(new_descs_size, LOG_ALIGN);
+	new_descs = memblock_alloc_raw(new_descs_size, LOG_ALIGN);
 	if (unlikely(!new_descs)) {
 		pr_err("log_buf_len: %zu desc bytes not available\n",
 		       new_descs_size);
@@ -1205,7 +1205,7 @@ void __init setup_log_buf(int early)
 	}
 
 	new_infos_size = new_descs_count * sizeof(struct printk_info);
-	new_infos = memblock_alloc(new_infos_size, LOG_ALIGN);
+	new_infos = memblock_alloc_raw(new_infos_size, LOG_ALIGN);
 	if (unlikely(!new_infos)) {
 		pr_err("log_buf_len: %zu info bytes not available\n",
 		       new_infos_size);
-- 
2.43.0

