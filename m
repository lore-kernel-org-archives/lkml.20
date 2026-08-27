Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A186341
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842955; cv=none; b=WMEmpSYoRT9MLBcLg4aYf7pTzEkGESM6An7cLSiUOstn+WcODy0b6dYtYLbQPmywinrIla6x4bOestcIsBS+N9eL1xOxdE/XXWo6i0WVBaQXmSWuSi1eQ/8Cs4yghM1ByGEiuHzC/bVUqkuyOH/3ISG/QopUMkCL7m4f7YlQeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842955; c=relaxed/simple;
	bh=mHSuH/RxndBuBlW/ii8l5hypvjBHDV5xR6hyahIPH0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyHkglwTqcxKKzNFjVzImHS7rkTKnHUjOgjgtuQ5SzQHkNjdeuwwgjTNLL0P2KwrGz9vunpAcGra/bglUmNDD0z7KnBwkzHdBv0RnAxDScuNdMEUnyXRD6jeDKowReoJ2eoo7fAJ9RAWN67W8xw/PudbXFB/T1aljCRErZvSRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os7GNH6R; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os7GNH6R"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so94718a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842953; x=1788447753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8SXyjur19MqUQGaIin+lz6Eqqg1k7QeX6LUDFfcSjs=;
        b=Os7GNH6RF3mGgsrRIcRW1ER5N5/kOh0U1MFnknJNzSQWIirihStpPXtGyHdtMLprYq
         ZB429/tFvaltSdYK0GkJpDIOOfeyJluabL6R3mRE+hN3r132bmRNENzphYQd4lGfCRoP
         lHQSFaLrQM7RqKrdENJvNjw7o1S2kY6mRoXzfCabE83OWiKkxrp0v/KD7eIqghjNhe20
         iZLhy+ydJhx6KH5wP3/YzjS+Cbn1EOz08Xg2hkpqJ5sRi8xYgzGk3YsWeAf92IRCRHig
         Uu5xn7wsuYWNUgxvqGNkeRMctkkbFHQoJf82JnWfO4YjZQhb5ika8UhW3cnBjdG55peh
         +CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842953; x=1788447753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8SXyjur19MqUQGaIin+lz6Eqqg1k7QeX6LUDFfcSjs=;
        b=SYvmHTS+TYCAJlo2ew8OeUJFaIIr2SMaSOYC3ZpkvCOyFJk1dOkvh0boNQooAtAk58
         auoGPau7w++pmZMgt+b37JkKNnWLZghNhmXiKgc23FKg3XDk2xV1srWVgEsTsF2G/YfK
         eOJ0FzUtyedlzFyLQ7HLjjNLtpTYXyty/qnPzxUKvqJymK7uuj38oZYUeQwNUnX3rfu0
         Ez/1+UbuZdRu4cxUzAObvhXeghfvDS1tfB2OHkj3szJ3oiRXVru+Ud9YAR++ZAqrf24g
         kXNj7TX54XvGz265g0YE8SPSYVXByT8zW+D0W1rWiwHvKLpOFKOB36wmFH6Bc9biPtuM
         3nAg==
X-Forwarded-Encrypted: i=1; AHgh+RraSEnXWXXJBlMIpsnPK1w+VKGyR5HOYpe8J/Y0NpxF58oyEv/gTtvtQBeqqLNcsT2GYE7Abj+eBGgHdUc=@vger.kernel.org
X-Gm-Message-State: AFuF++ne88ABDNvEAIVksSl6CGLxv4a09Qxsdw9voykmEVLSfxOM/rbM
	nCbX7AwHPKRoAqkKFF3JNC1suQRJRdG5UK9LCHJZvngpq7ZjjZfs1Ly4
X-Gm-Gg: AR+sD101lVzG6xOMo0h6bg/olVt0YRUUS9D0ZjbZnp4n7AouT9kH0aXTcpd+v9MyEXB
	FIOIcHRmOegkWQDyYlWtwpDmI2AVpXzATlFu3m0kqNRHA0iVyUVThEnH0m/prXEPpJFVR9K3VME
	J9EMElFrB9a/ievRH82AyKc4JW1YhZkt4BYX93/6uFUB1CTQKfPKD0ybkCf0G97GVvohsSMlTgY
	JbxJlEfkwB8xqFyHqdAZ0g4FJ0R0XOq15DblIPHulI1/Dw5FlwKP7Vi7nJ1MrgJfRqgR9osV7/N
	s9lg0e8BF3axrxvGkTLU+h3MFY6QrDr/cp+LnzdfSLKdAAUq3S5NP4tOJbLFDGBTsMJ83y6rsbY
	lPWzbgjtPEkt73qgFrutsY6Q36+M06kIuo6APpDaCICJMtajbR+fpW/VKHlroZ79A+4krCEvHBN
	t4TBHoE8lqsbTAEP2G8w8ZnelRI3ho+3mzNpCt/9PeGOg7JeMVvfDCqBBTrKtXPo7DLN7ouysaY
	dIQcZItaBwL29oO
X-Received: by 2002:a17:90b:1809:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3966d199247mr31244328a91.5.1787842952926;
        Thu, 27 Aug 2026 08:02:32 -0700 (PDT)
Received: from shpark-MS-7E27.tailee9dcb.ts.net ([218.49.81.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fa7a3fsm3026999a91.10.2026.08.27.08.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:02:32 -0700 (PDT)
From: Sunho Park <shpark061104@gmail.com>
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	frederic@kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunho Park <shpark061104@gmail.com>,
	syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
Subject: [PATCH] srcu: Fix WARN_ON() for rcu_segcblist_n_cbs() in  cleanup_srcu_struct()
Date: Fri, 28 Aug 2026 00:02:08 +0900
Message-ID: <20260827150208.2166775-1-shpark061104@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WARN_ON() added by commit 78a38cbf6f20 ("srcu: Queue sdp->work
when the delay timer is successfully deleted") uses rcu_segcblist_n_cbs()
to detect callbacks that srcu_barrier() failed to wait for. However, the
->len counter is decremented only at the end of srcu_invoke_callbacks(),
after the invoking loop has finished. Since srcu_barrier() can return
right after the barrier callback is invoked, cleanup_srcu_struct() can see
a non-zero n_cbs even though the cblist is already physically empty,
falsely triggering the WARN_ON() together with a still-pending delay_work
timer.

Use rcu_segcblist_empty(), which checks the actual head of the cblist.
Callbacks that have genuinely not been invoked yet still leave the list
non-empty, so the WARN_ON() still catches callers that skip srcu_barrier()
or queue callbacks after it.

Link: https://lore.kernel.org/rcu/e6350377085ddd85d6ef00d8e9a67bd50c762d3c@linux.dev/T/#t
Reported-by: syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d4faf7db59e11f6fd1ab
Fixes: 78a38cbf6f20 ("srcu: Queue sdp->work when the delay timer is successfully deleted")
Signed-off-by: Sunho Park <shpark061104@gmail.com>
---
 kernel/rcu/srcutree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index ed204b3f4b84..ad27880dd690 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -704,7 +704,7 @@ void cleanup_srcu_struct(struct srcu_struct *ssp)
 		// Call srcu_barrier() before this cleanup_srcu_struct()
 		// to avoid triggering this WARN_ON().
 		if (WARN_ON(timer_delete_sync(&sdp->delay_work) &&
-			    rcu_segcblist_n_cbs(&sdp->srcu_cblist)) &&
+			    !rcu_segcblist_empty(&sdp->srcu_cblist)) &&
 		    rcu_cpu_beenfullyonline(sdp->cpu))
 			queue_work_on(sdp->cpu, rcu_gp_wq, &sdp->work);
 		flush_work(&sdp->work);
-- 
2.43.0

