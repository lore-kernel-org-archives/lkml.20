Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FB3101D4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170739; cv=none; b=WX05RxsK+s6+9wRmzSRBEPtcdQkmQB/6omkv0gF7zn4l9lfwtyZIpUf41Zk9xBKuXahHjkWjDfJtLKS+p945/v9ujY2cWLg6tczvmOm5BTiJZEuDDDol04HvQFORiaO80md3xnkXeA0vyCAA4AqpWkeIww1qQBEJCNjvJVFYTuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170739; c=relaxed/simple;
	bh=NLfkjv9faIkTJMq2TGBRHXTLsZ/UKSDRRr3QY8/uJBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rOw+z+m3ytVZB2gozIo+1e9/+S411La37xEZo4c49oR/PVVm1PIILIqGo4DC3hXyst18jTZCEUYJOUC6HImRIqmwiIUMVFdt/QTZ7I4l3ck6Rn2bCv/iDbyb9BcSmidwYb3Tu7HtUwYKY+Cr4cAi9etjGPZSlTuzTQmcx6z7dso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFEI2BNi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFEI2BNi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so5039595e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789170732; x=1789775532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gzBA68e/UQ9eClJUYWDu7lTd9NTGyQgxOmDDFm10T4=;
        b=tFEI2BNiAeCXZo5pLjm3eCevpSXVIJX/JyvQ9WY77s5FNtUP9502N/Fv+gyEDn+BH3
         cyxX0ezJoB5EGawHLsYYZzLvMqlgDkfCLWOl4FbUtGyUerYgvEzJhV+U+F4tD3BUzC/V
         0hC4xMs6HMdKJu6p+8LPlgeUOhVpLrpglu2jZxhA4mAxemwfEqMHmiOOv9JPh6K6wO/m
         WZDMmU7XbmP3KdjUqDxE5pzrokOjer6NalGmqnHAzCvojm2XtLdVHKCAjUtX7LNK71Yy
         Q4WiLLA2DYvKJX3YUG7vDzA8bX+BQZ7IBX/dCkcS4ikEa3fa1KP3ACSNDul3RbEvWRpN
         4UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170732; x=1789775532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gzBA68e/UQ9eClJUYWDu7lTd9NTGyQgxOmDDFm10T4=;
        b=TLnSqe/3pcy7zy+vt37lcm/FRZ4lcKeFltet7QIw4TIjZHuDdcR3zaysi+je3w6fCo
         lzsGc1766GLIkSphb3MvvkZObuXFTD8AIpBqxdbDXJxL0CKypcUVGUZGt7MyEin/bSc8
         WhOkDs30bKeJCcFM8kTuyaQddetAB8Vj1hrCjKVqaNFFAJbqlPFCwxFpAwYpLjhSlZ8m
         8gEapNKqjA9QqPns5dS3bbdgzPQQyRqwIYSgKQexNk5XruEPOiNoHDkk8bd4FlKmh1JA
         jDoQv5CUDESBCnmPFz6P9JPpbBJmkRQ8fUik9yqm4n12B3xmAdIW06foqz9Hsi/KNKFe
         5Ysg==
X-Forwarded-Encrypted: i=1; AKwUvBySzaflNXX0VolENjSZyudFo8SwtqBr/wrGX0uCSoO7bRDRLl6R3uKvjGfh+F9nM3Y6HuDigwXgGJnylHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mCOKHmye3JKwxi8/qMiZduW+SBe4j3++LsrDNXgvKqdozT3bqp
	VkhXxrnTS88vjpU88EU0naM596TRqtjU4zeaQSG/ztB4YA3gtYP1ckCadTY2CZWJ
X-Gm-Gg: AYBFou2U5TX5VEUn6tg+vOqtcHEtZDQXt/tE3CbduqbOFpjFZaHYIYZgocEzR5ugasW
	8+faGiBfPfZFhguo/LFoCWzljty5h/zhU79lObCNjkZeC2VJy3N3ya/B80A54yuQsTw+J7MygXP
	vnUtNhZgMjptJZL39aPCdRbQOY3wboEpzHUOBtTXXWqDdtROXfLjUfxSRXB9+VER19PdvunFeWP
	Z3cYe5arijGEBNJHebPZe+vzrm3Fdjabz4fWCSVyaEHWI0KNJVUwKgj1bGMCowIykmYYj9mCD60
	GU8MLgMpC4c0ORlL1zp133gL/Mrl9Z8zx00dedBM5+K+rNnOD2IKTkUMMp4Ts/PDaafMNKI59hZ
	waONlGHxwvzxVNnCQGeRAMVlOIdW4oRY8oJH6orbpfhgWYZkDfyogJwDjgMz4YvDgtHc4fBBnCP
	fLT5NH4tmZQJUeNUOoDF52bVbMkRE7jx4jAw/yur/eOy5jUqwXyWcF46pBt3aDjBfvBvZKESccU
	DFGnsg1AOhB7FaN8DeldPF/sR7Ozt1aai+/UH8uDH9+iPloFZ7eosyscSVGnZrljDQM2M8ySACG
	vD7O3ptpEcN5N1D4QQv8IAMgZJKPiRi0Rkdk
X-Received: by 2002:a05:600c:a107:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e663cc929mr93902905e9.15.1789170732019;
        Fri, 11 Sep 2026 16:52:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm107308135e9.8.2026.09.11.16.52.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:52:11 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Tejun Heo <tj@kernel.org>,
	Andreas Herrmann <aherrmann@suse.de>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] block: Fix the blkcg_exit_queue reference in blk_sync_queue() kernel-doc
Date: Sat, 12 Sep 2026 01:50:51 +0200
Message-Id: <20260911235051.34004-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blk_sync_queue() documentation still refers to the former
blkcg_exit_queue() name. The helper now takes a gendisk and is named
blkcg_exit_disk(). Update the reference.

Fixes: 9823538fb7ef ("blk-cgroup: pass a gendisk to blkcg_init_queue and blkcg_exit_queue")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 block/blk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 196bccf27f58dc270ad080470d70f846b864d4d3..867e7205c11e74f3ec6356a247bd8a8daa4964de 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -257,7 +257,7 @@ blk_status_t tag_to_blk_status(const char *tag)
  *
  *     This function does not cancel any asynchronous activity arising
  *     out of elevator or throttling code. That would require elevator_exit()
- *     and blkcg_exit_queue() to be called with queue lock initialized.
+ *     and blkcg_exit_disk() to be called with queue lock initialized.
  *
  */
 void blk_sync_queue(struct request_queue *q)
-- 
2.39.5 (Apple Git-154)

