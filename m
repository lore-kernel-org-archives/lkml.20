Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1043C3C2798
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890952; cv=none; b=sYvoVZaD+u2/mEMy5aUSnrF51kzXVjTRXnSy79ZpXrM1gTFUOopaACuaxcJWlhfh67DED31mwFdJ3llwMHWFoLzvrtjC/FaEn4Gda3sME77ejqL0q6Z9MuHzW7rkuVbkac7HWS1IIdQB483y9spOJzU6cm+3VQT8VeDpgEteezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890952; c=relaxed/simple;
	bh=Fxs65loBaQS2zVzidqe0drHOuX+q77A6m71fokX95P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mFLbxwHNyC7uRkC5l/8CCMUO4vVdPJxzKkjXo6/dzw5x0xS2ThiKRV0hdoASoOfpb+5onSEAYI/W28ZA9UsGJ7FpPkzrcVGgal1d/EnpTWnWPvPTmNlpfp/PNrbQZKBnAEDfFv4iCXGbpsymX4OnSWgg5HjBg7v8YsNDQ1lkZyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEUQP54E; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEUQP54E"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-154e9d2d979so1940691c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890950; x=1792495750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RTC8837Ay1vHzPauMz2Nn9szcxCcdh/p3wgAS9dtrx0=;
        b=ZEUQP54EftHQIlNMId3bDKyhOtkXPq7TcIN8mDJTxI706dgfrM2gwNUFl8o0lR6lYv
         xVetdrLTNPr46jcg9+6xPr69cFPnRb50L7jL8uB64ffZCC66JuWM8e8ojr3VBe+ozYsc
         T8PqM+ZwFOCBPXY3Fh88fl9flUMZ/8LyJVvS7xV76FTWVKUFFjml5cwR3Dy7qoFSD88r
         k0V5+ZNR/o2MCqyKdjUkeUzzBGUwuEYyFiO/o/KmT9gTldZiP41pB0bxsK/XX9XHZyRY
         O0aeX6D4twkJeB6cFK3SqDwMIc5xrfhhdxmIo3hjaIEILaRmhsfsN8/A0Ve6iHKWaCMk
         KWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890950; x=1792495750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTC8837Ay1vHzPauMz2Nn9szcxCcdh/p3wgAS9dtrx0=;
        b=rYGmiUCRpQmJeMjwAmykUn09ZlsNCqSCsnNsCJK3sizOJ96M1CS3488ui8mKagCbl0
         2A5aTBTmQUuC8TctAIcZJfN7gLvFO/PuanarIL/rq32kzaXhi9NZT0wtDPQBf6ut0ujN
         0axbJzkBcv8gZ8NJQZdLmj+JTZsHZgcaEtVJhKia4hCBGCNw3WRC1jJwolHrMXuIcPmA
         tdYnesbHCq9MNFxHG/0Q9tAii+hiokEqJxg+ahHq7q3b9BhY8bT2Z5HBMLNlikQz+Bv2
         wXhlHuBj2IV3LSi38g1KPykz1BKngdRpqjsBqYAYBkYKhU5UJ9pV8wUQ9xYSJYYRhTql
         XPUA==
X-Forwarded-Encrypted: i=1; AKwUvBxAkHd44NgIk3jr4A4WsXwyJH7UQnwfm+rN9km1IjOMIHIWMnghdeHBb20LHTHxvLUHmPxUr6+lpu6YZq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUVKUDxaK/XlRyQ9lkp/mSQnW22l5E6UM3p7CtL1xJBpeAhIUM
	z9k8hZhOBOUBYNulMzFWcAyQEqmDmzi8ZE1KcK6zFNpgybUlsBl0CX2O
X-Gm-Gg: AYBFou3Z/op8xccNIM4FpoL9lCklRGe5th3eD4Jvx/Sxw2c7aG7BI2llFlj8UEi/u9w
	osFbIvADHQ1rjTjQo9+IAzoDOH9VhEVuutdMqyTv17ntFcXpvwCrM+7NWueSYgyF9Lnu1bp5OVI
	kZN4k1FFRDsT0WhZZiuX+5/Gw25iPucfY8BdC2d9O7oRrP3bv7S9Zy6uMuMscmJXvgNpN4RRlXr
	lo2BviZDTX4NOsvwLFWjhcS5V3YJ636bgdRHKf4wLtm3mzDRtPGtFMUZ9ZfH+XhviUrThYa5A/Y
	dyWvYQ1MIUDJ6x4WhPK026cygDEbi3hOjJfW3wLr+rZ8T+4as268WC9zb/BBvgZ1+pWpzOhZBmj
	5kLgW96PIE5NOXzKnuJy3RNH4YxsYmEd2cbMx9bUHcD+G64KmcIxl6sw3Ywhgnh8MPGqFTD0VBf
	Uiwjx3ZJR2a9ZaF7Xla+JwUznwv4F/6q037Gxf2gEkacXvFDqcC559uG392J/cHZI/1q74oQ==
X-Received: by 2002:a05:7022:7e8c:b0:143:1bb1:b3c3 with SMTP id a92af1059eb24-16a5ce94210mr18091905c88.14.1791890949866;
        Tue, 13 Oct 2026 04:29:09 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:50::247:c9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm38478114c88.2.2026.10.13.04.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:29:09 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org,
	syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v2] workqueue: annotate the lockless nr_running increment racing with need_more_worker()
Date: Tue, 13 Oct 2026 18:29:05 +0700
Message-ID: <20261013112905.9673-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wq_worker_running() increments pool->nr_running with only preemption
disabled, while kick_pool_pick() reads it via need_more_worker() under
pool->lock, so the two can run concurrently on different CPUs. KCSAN
reports:

  BUG: KCSAN: data-race in kick_pool_pick / wq_worker_running

  write to 0xffff888059c2af24 of 4 bytes by task 3007 on cpu 0:
   wq_worker_running+0x114/0x130
   schedule_timeout+0x16e/0x180
   io_schedule_timeout+0x4c/0x70
   submit_bio_wait+0xd7/0x110
   blkdev_issue_flush+0x4c/0x70
   ext4_sync_file+0x60d/0x6c0
   aio_fsync_work+0x7f/0x270
   process_one_work+0x4ae/0xa00

  read to 0xffff888059c2af24 of 4 bytes by task 3001 on cpu 1:
   kick_pool_pick+0x7a/0x3a0
   __queue_work+0x72d/0xcf0
   queue_work_on+0x9d/0xb0
   schedule_on_each_cpu+0x11a/0x2d0
   vmstat_refresh+0x23/0x140
   proc_sys_call_handler+0x2b9/0x4f0

The race is benign. The increment in wq_worker_running() is the only
lockless write to nr_running; decrements and the reset are done under
pool->lock, so a reader holding the lock sees either the old or the new
count. A stale 0 costs at most a spurious wakeup of an idle worker. A
nonzero count is correct because the incrementing worker is running and
re-checks the worklist under pool->lock before it stops counting. The
increment can also go 1 -> 2, e.g. when a worker sleeping in a work item
wakes up after kick_pool() woke another worker.

Annotate the read in need_more_worker() with data_race().

Reported-by: syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8922e6b8343f70be92e8
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2:
 - Fix subject: the read is under pool->lock, the lockless side is the
   increment (Tejun).
 - Rewrite the "why benign" paragraph accordingly (Tejun).
 - Replace the duplicated comment with a pointer to @nr_running (Tejun).
 - Code unchanged.
v1: https://lore.kernel.org/all/20261012143605.281358-1-ngocthang2710.1999@gmail.com/

 kernel/workqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..102e1ab2bb7b 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -951,7 +951,8 @@ static unsigned long work_offqd_pack_flags(struct work_offq_data *offqd)
  */
 static bool need_more_worker(struct worker_pool *pool)
 {
-	return !list_empty(&pool->worklist) && !pool->nr_running;
+	/* Racy against the lockless increment, see @nr_running. */
+	return !list_empty(&pool->worklist) && !data_race(pool->nr_running);
 }
 
 /* Can I start working?  Called from busy but !running workers. */
-- 
2.43.0

