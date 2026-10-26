Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022903;
	b=rVDuAoVd9VLBjGvbwHBVPBt5XF+AQV2GuD+42Li7q6ciF0vJo4R7IIon2Ui6HUp4pITO
	 ESnUSSblHOOsQfvhUETAlX/quJvxMj6QkNI6Sl+1mf7vaPDuCJFEgdcRXP0f06o7tKNMn
	 aVYLV5y3P0MvxhvdezxUeaFp+UjbPwFkzOv+liRkCFv1hgkFLmBiyobQqoJY99R78Q0i/
	 pSXto44XranIjMWDSIBC8i8VhgpS6hE1r7kyGTXbn+Ctrkkmr358NccaQXn0f3cUnDzPi
	 IJnOPqBL1Ihkrn0Aa8R2aBcUQcoqlP2brYy97alQXxT6nPMzGq3GsR+sOQF8O1qpWHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022903;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=O+2hVlI/1nVF71Vt48KcKAd7sx36HdfOX4c46Tcd29Y=;
	b=iwluLLLxoNw0SsVgVBeRshPlYJQJ8ZzQ1fyxgWB30TEHFQHIaIYkD+X3QOoZD2FaTqR1
	 TSrpEtUmuUQzaHtROQzMF6MxmLMgaEnnFibddhFfvBkUk/bD3QKRsjZrnbLl23kkEo6/d
	 zq7Q8hLQZt9DSBtQj0jytozXm7OylLmReKw0p9UqPzwkRmZ+eztOI06ZGbFjPyrjX0FP+
	 GORN7uOhBocOiT4we0heOATXGWAxy2bx8NJ9S3dQZmlQeDYz7hqPyQMMTqAULoasnzDPE
	 EP/btQWYXEGt81VBLnRi9qDUhub+Y4mZomjWNdQfp5m3fNOvpEzZzH5oUwj+ygt+euQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NiBcvVfT;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6859606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6859606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NiBcvVfT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=O+
	2hVlI/1nVF71Vt48KcKAd7sx36HdfOX4c46Tcd29Y=; b=NiBcvVfTYd/F1h8/ji
	6yE4jUWB6A8C+96og1OvnhVJ4YOGDmqWrddRxoK8MIITd1sBhJr6ev6mdgLwBcQ0
	aMcKh9A59rt0rJLnhyzdBnWuE+1wleu1naQ0dDxxh7qUvsS+rhjS5GdJXHo52T9r
	3ZW0ATAPvrVgxIVouvxvkE+98=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHaYhwW99qBxDSCA--.13806S2;
	Mon, 26 Oct 2026 21:53:53 +0800 (CST)
From: albin_yang@163.com
To: kayracizmeci@gmail.com
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	chen.yu@linux.dev,
	dietmar.eggemann@arm.com,
	jstultz@google.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated blocked donors
Date: Mon, 26 Oct 2026 21:53:51 +0800
Message-ID: <20261026135352.4120064-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <at5JrmlnEXPQftDe@scheduler.schedules>
References: <at5JrmlnEXPQftDe@scheduler.schedules>
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
X-CM-TRANSID:PygvCgDHaYhwW99qBxDSCA--.13806S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1xtFWDWrW5tFyfur4fGrg_yoW8CFyDpF
	ZYgrWjkF4ktr4rZ3sF9r4xXFWFvw4rKF43Xan8Gry8Aay5Xry2vryqgr45Wr4a9rZ7tFy0
	vF40ga9xCasrZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUNIDwUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzRGFKGrfW3Ei8QAA39

Hi Kayra,

Thanks for your review.

> ... sched_info_dequeue() ... Or Am I missing something?

No, you're right: the fake enqueue starts the counter at migration time, and
the bill is settled later in sched_info_dequeue() on the proxy_needs_return()
path (dequeue_block_task() with TASK_WAKING). The ~167 ms I measured is that
delta. I had written sched_info_arrive() charging it directly, which is wrong -
I'll fix the description.

> This should be a series instead of separate patches if this goes above.

Agreed - I'll resend as [PATCH v5 1/2] (DELAY_DEQUEUE fix) + [PATCH v5 2/2]
(this one).

> ... when B gets a kill signal B need to enqueue separately from A, so it
> starts to wait. But blocked_on is set, so B's counter never starts.

A case I hadn't considered, and my sanity check does not cover it: I only
verified that a donor waking normally and then contending for the CPU still
accumulates run_delay. A waiter enqueuing separately from its owner does
genuinely start waiting for a CPU.

So let me ask first: in that path, is blocked_on really still set when B is
enqueued separately? If yes, !task_is_blocked() would under-count B, and the
options as I see them are:

  a) a predicate that is also cleared on that path,
  b) clear blocked_on there (proxy-exec territory - for you/John/Peter),
  c) hold this patch until John's series lands and re-evaluate then,
  d) fix it at the source instead: give proxy_migrate_task() DEQUEUE_SAVE /
     ENQUEUE_RESTORE so the migration never touches sched_info at all. That
     sidesteps the blocked_on question entirely, but it also affects psi, rt,
     dl and sched_ext, so I'd want your/John's input first.

Do you know whether blocked_on is still set there? If it is, I'd still prefer
to take this now, since the under-count only shows up once John's series is in,
and revisit (or adjust) then - unless you'd rather wait.

Adding John to CC.

Thanks,
Wei Yang

