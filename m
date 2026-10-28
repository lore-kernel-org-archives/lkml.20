Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195220;
	b=XbfUX7anNJYYbnic5c8ewWz49OTxx+pB79MnEXsFQwzvF/zktZRBHvJlRc4voSwZkb7C
	 sB+9Dbh+0ct6j2QNodl0WDfa0afgeckHO+BcjMslIXEN0qaxzGt3V4xY/De1+gmFdt40s
	 qNuihsKQ3QyTUgbxDrjyt+jiu5Rz5CcLbAcXoIgeRePFlX8TVrRrZV3mvEDelOkCqbxcP
	 jZcCRGxUtAxf/E7CytqbA+IvGgN8L3DuNWLD4PNBy0ovgXvzz7iF0eSIVTwpmbqVkE2DU
	 wwq7wabCPgO+Wt3xVhNlo3vFubLHA2xXR2+IzsMINXvAsVoKPMPcrqSXZQRj49hiVyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyFRVqblmLXE8qjlBr7bz/X+uC/PuqAiTQQAhFFS2yY=;
	b=zrSnmTymXaUR+jaPi54sEQjk/8tXV06C98g0Eolf85jVWC8Gy2ytwB0WMpnr1p8vAouY
	 njeECVzropWSrGcmKCzTOM3CHqBuk5Df+vcDqtdEnvFhS0krJQgeMeucCR6toXtWEGlZu
	 VXoMp+f/CRHX3js/2wt9sco5mDYBSQ1Gz8WgsblTU5c3mTYDmzS9dhooleZxA6iejRno5
	 E36qtCJfZPBLHU23DCAo3wotm23qM4trhTLB0Q/l5TZwU5B/tPcK9G80ysiWzNuXVsR4y
	 bfGr8325n9SqWPfDFOXcOKMCcHP340wtJGK4oVbbuogQic17nUaS60mNOxm9ybLr5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4jhljGj;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED0B606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED0B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4jhljGj
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e96502e447so8554215ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195219; x=1793800019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyFRVqblmLXE8qjlBr7bz/X+uC/PuqAiTQQAhFFS2yY=;
        b=a4jhljGjGqD002ZO0lyzkQzZnIKwkHH6WfRExDEerDrtJQB+nHAaXAwii5m9MUcbS+
         iWYcRyreRd6SAzQbiAzjKNxLyR9IZtxcguhjgNNUj2dpYHUF2MZpL783e65D0c3Hcn6Y
         m/649M54fzbmRETfUYO5tq+n5zCSzVJyWLNbBwbLQvjEgUa7dB/oYoPqQhPGi2WmXavP
         Z6mbH4lbUj9ScWJQBDxy9KzYIdde9FxuWHE8O7ono+gJ7zbK4Aj/9Ms6ZMUdu/vmmyr7
         gnpW29bn7ep9rAacbDLvbiT90lhXOU4nWTU37mpdCzGV3FV6paNrTCEMI/LDuRGz7IkM
         H4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195219; x=1793800019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyFRVqblmLXE8qjlBr7bz/X+uC/PuqAiTQQAhFFS2yY=;
        b=lkguTA5Wwa4A8WJr9yt2/l4ehiiXvgmJgb/3EeXYdA1UnLo4ZDDxt/bBcOGIMsMfdl
         XsqHYxNpBPx2k3Eg5GCZTbtvgtPCYpWG8ca3nKcgIKB11cVZZCgagxUD0LIbOutMnP4G
         Gq5t5fEpQixDfLpBkX5FkDOsYIRqgOgcCxTeiISTuJWL3/IBUBNe1rR7nutZog2xBLAP
         kfAKomTcGDs5HqUNRbfp6Os1xv4m/DjyTKFgV8bnYeVSXLO39CTP2BjmKa2zHxH/lziu
         SryXB4gynEcXtfuRDuvAqS0NJqQZBXySboLxd7isSvxLAsd2t97FwFl9ocb8/NMtDLXB
         48mw==
X-Forwarded-Encrypted: i=1; AKwUvBxnuGyqpUgQGYNZz4OW+JEPTMunJ8NBOK3TsSto1KiU/VOI16QQNKc/9iU7LGa1Qdnu8XTJdqTxg5vmjkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDi9GjanLkT85y9omS3VXZ/wQjKTkSpx5pqlB2t/7yOa4g/ySC
	T34mcHR85est0e0Zy0aZ3XxNZZxIL0VNZyjfWVTDKUUb5MmZuhshD7vk
X-Gm-Gg: AYBFou1DVsDONTeEuyQUNDdPeahyp6bC5NG4+S25M/qJr419M9Fydpaw6hFIxmWE72z
	9wl37i0ZRk5oAZrBR7GqFbjLKig5tpHRVUqcdU1fn9NSCthIC5RwvFj+b1YzyFFSkNMvHSD4P1o
	luI3NbRie28puvRwGI3Edl1DSAYznGu2ksI3fr+THfXyKjhtCOrLitwIkTihdlxtxbVgYf6xvqy
	wCiY/imxc/uQMe0VxNIv8dm+OH7QkhK848aMpE5MiIN59ktby9gV+4buJxW2M/wsP6DuNa53f7R
	qOQwegyk2uUg6HyB3Hr54jy4hHtQXpf2uJjz/5DqeedeonAVV3/HaURPBJT9CK7izyBV9PDx4xp
	w1yokuchk1mjaUbMrqDubADfAKBRXTN93sKPUW5QRBOuoDHY6MccypmZvtufKnaPtYCiNaBmpNK
	CuAhmiotOA3PN7R4mDuIZiQ3YbpSfTkYQ4tWFeE658J2Hm4mo59M84oJp2AMKzqDUFMI7tIJXjW
	VoppgD9j42TxOyweMiRAou73sfWnF7JwCtC3xvunqSm4sdpWGY9RmdrkbdZAYL+JD9u0dPkfqT3
	/Qzzrp/L8kTGt0N6xxwU5EfzbuenkQLsrlpOuzLeF3NGTQ==
X-Received: by 2002:a17:903:40c6:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2eb0012ec15mr23435175ad.5.1793195219458;
        Wed, 28 Oct 2026 06:46:59 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm22014585ad.68.2026.10.28.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:46:58 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: vbabka@kernel.org,
	harry@kernel.org
Cc: urezki@gmail.com,
	paulmck@kernel.org,
	qiang.zhang@linux.dev,
	akpm@linux-foundation.org,
	hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 2/2] mm/slab: don't queue the page cache work under krcp->lock
Date: Wed, 28 Oct 2026 21:46:47 +0800
Message-ID: <20261028134647.3176080-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
References: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

run_page_cache_worker() runs under krcp->lock, from kvfree_call_rcu()
callers that may hold more, such as set_cpus_allowed_force() under
pi_lock, so it kicks the refill work from an hrtimer.  Under memory
pressure it instead queues the work with a delay of
rcutree.rcu_delay_page_cache_fill_msec, which may be 0, and a zero delay
queues it at once, taking pool->lock under krcp->lock.

With the delay set to 0, calling kvfree_rcu() on vmalloc memory under
pi_lock after a drop_caches makes lockdep report:

  Chain exists of:
    &pool->lock --> &p->pi_lock --> krc.lock

Use the hrtimer when the delay is 0.

Fixes: d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory pressure")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 mm/slab_common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 3729aa7a6156..ef5ff0a20249 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1987,7 +1987,13 @@ run_page_cache_worker(struct kfree_rcu_cpu *krcp)
 
 	if (rcu_scheduler_active == RCU_SCHEDULER_RUNNING &&
 			!atomic_xchg(&krcp->work_in_progress, 1)) {
-		if (atomic_read(&krcp->backoff_page_cache_fill)) {
+		/*
+		 * A zero delay would queue the work right here, under
+		 * krcp->lock and possibly the caller's pi_lock, so let the
+		 * hrtimer do it.
+		 */
+		if (atomic_read(&krcp->backoff_page_cache_fill) &&
+		    rcu_delay_page_cache_fill_msec) {
 			queue_delayed_work(rcu_reclaim_wq,
 				&krcp->page_cache_work,
 					msecs_to_jiffies(rcu_delay_page_cache_fill_msec));
-- 
2.43.0

