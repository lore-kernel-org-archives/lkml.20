Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924744E038
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577792; cv=none; b=XKdo2190CjGL/wumqF3kXa22M+dSA1zmgj+RyvOPTlDs1UpO4t6GXJYMH11bOWgCEXBGHQZK6xaMKoFzAdfQHN3OoDuOCCPAJ+03Uvnjy47WfferPfl2WXxwLC9jtnsDvoN7L1osn2oy5336VpsdFcYWDHRVqrmqpda5I2aHnUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577792; c=relaxed/simple;
	bh=y/c3vuZT9JK4EGUVD5FlxfoGZhyoXAmopRCdzFOZeII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UQSM+LvLnEmlNDWd4GA9PLndEnoKXh/1uhuFBuBpeSCHco5lIxsnW5lK9rOCKM0cG91ftqhiQJOIxuQrdeQ8gcyIzoKM4NwUXPQJXsLb3W0e2neghf6eaTsqZ33A/AI9OeZGkEkm0gF9Ct2X7QRCyEWDGtbTj2hSE3hpiyRWmPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SseIMWDQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SseIMWDQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1485140f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790577779; x=1791182579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EleACgwDvShW2Hh8e1MDeVc2Sd39pZcCSkJXUD9MqEw=;
        b=SseIMWDQCk4kbVZrH/rV6/+CGE5BhaLjdwGVG+9R1HAqLdyJ6V03zEbK/S6i9QSM50
         ZvE+wCWkUbleTzjlW8exzYCPUhyJba0aXfODulFcCUdNIy11aqbMCV9GE0H336wP1F5d
         yP60YRUZ+nIM8+JBfHuJXQ4xj9EoJiwwDMxcwyZHIQ581Nzpi30XLWHGb+v5mWfDx572
         VwbsKI11Vm1KydrdmvWJvNXMhRhwYcpCLjpfuZatGkITvEC4GiJswp7IeZFVR464MLqB
         TZH3Q41rV8XO1obfUJDpNNiNDrvCUDD5SZWmoizO+Q2kz736lvyOyT1X0XqWz5h4kwkT
         9Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577779; x=1791182579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EleACgwDvShW2Hh8e1MDeVc2Sd39pZcCSkJXUD9MqEw=;
        b=SlAJX5v9nBI3VyRxA/uGkxog7K5AqknHfOUT1F3AvyzWxvUjFfgci+wn4GEJvlKZmk
         kgbgMp8zs+nEu97Enea02n1SCeAWM3IibOwNrFU/QngEl2bvMTyiVNGoJDL2NYREEWwa
         iKMK2+7hzy2bHScaJpOdUUwGLCwa3guW0196SLaV/tMpLxA0ETRzik/xrpb+8sykfamZ
         S3axpEMq5dzxc8jSZ2FXd2olGIa6e43/ya0jrD0S19A6ENY9ECfy/8zwdHn3UPoaiOoT
         c4h50b1BnsNDPc9DEIYPc7q2yHIgEvdl3G6E+sXLgzU/YypIeHXEU3RmWsZIYctO4xit
         IFnA==
X-Forwarded-Encrypted: i=1; AKwUvBx58Ojsh4Cn48BF2aKcaplYXiQFOjzpaopaCkT2fmttBuUBu/7VxBdx3tQleK0JeOOmj/hsA7OP2CORB5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRwa8KS3+U2ZFMKcbabrSI0GpwUYhgCCy6BxfhRx8U6VjgWhGw
	Z3TD8MqM+z8z15TS5JD222+9FbuyaD8PuOlxuWaSfpfATnQHryY4Sn1P
X-Gm-Gg: AYBFou3okpf1T2ZBL5uijwgEuFxKZA2FPW+wJMRYZwVuL4rqM9OLUZElQDTVt0XyCcr
	IQTtGNtup6DV7p37njmQJusrFtTdYH6olMdCi6piXL91B6Ku1Jv2Rq0o6HsuPX8H6T5rSz62GYr
	RoNtVV1cJHsR6niXW+pqo5XqVG2EuZa7vXmiIYUH/M8lw4QXkf9QK3WBsIfs0Dzvlr4CxR/sASp
	z6ugA4qYyZ1YUIFTCQ8Cbwqw6py5anrlSRNFYGNn92iGYGBFFmgHo5dSHgIJ5/pEj/f3uiIjTzz
	thsrSr1L//1kbljFjTaoTK55wugwskC+jiFULsalyxAKYoq8ES2ONEl/NuD6YITkv9TmRuijcuw
	Qx1z//0pd6ZIzHQOORiz5J+JT1o0GgWM0QNHhZHKr1kkzWmFnXpREOJw7DKtSBzZ9Dpg5LxQDvT
	Qg0gXzSN7UArco8d/MlblZ7YCUCsZIh1ltKbcPmnRr45ot8ZpwFCGERwzjJZ/jfjTepeNdujnBG
	jrhds5R/SCDWzhcJHzi+Z0Xy1kCV23y5mh7VsuBaLMsB4//PYczt0psWSQ/7vW71wvZnDU+u3RX
	fBlVOQwJRrq5p3OvKOqBK96kLbhX3Wk83seYzQG4/AteBEOiwQY/1m15XBjlwRQD/hmalO+Lg0G
	mrQ7k2w==
X-Received: by 2002:a5d:6f1d:0:b0:487:1102:d697 with SMTP id ffacd0b85a97d-4887d9f99d4mr17976537f8f.8.1790577779202;
        Sun, 27 Sep 2026 23:42:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm26283196f8f.4.2026.09.27.23.42.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 23:42:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] netpoll: avoid blocking on the transmit lock in queue_process
Date: Mon, 28 Sep 2026 08:42:39 +0200
Message-Id: <20260928064239.32456-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928064239.32456-1-kmehltretter@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

queue_process() disables interrupts before taking the device transmit
lock with HARD_TX_LOCK(). The lock may sleep on PREEMPT_RT:

  BUG: sleeping function called from invalid context
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0
  Workqueue: events queue_process
  rt_spin_lock
  queue_process
  process_one_work

Use HARD_TX_TRYLOCK() instead. If another CPU owns the lock, put the skb
back at the head of the deferred queue, restore interrupts and retry
after the existing HZ / 10 delay.

Fixes: 3640543df26f ("[PATCH] netpoll: fix netpoll lockup")
Cc: stable@vger.kernel.org # 6.12+
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 net/core/netpoll.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index e0cfcb05468e2..a3c94f0b3f764 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -166,7 +166,13 @@ static void queue_process(struct work_struct *work)
 			skb_set_queue_mapping(skb, q_index);
 		}
 		txq = netdev_get_tx_queue(dev, q_index);
-		HARD_TX_LOCK(dev, txq, smp_processor_id());
+		if (!HARD_TX_TRYLOCK(dev, txq)) {
+			netpoll_txq_queue_head(npinfo, skb);
+			local_irq_restore(flags);
+
+			schedule_delayed_work(&npinfo->tx_work, HZ / 10);
+			return;
+		}
 		if (netif_xmit_frozen_or_stopped(txq) ||
 		    !dev_xmit_complete(netpoll_start_xmit(skb, dev, txq))) {
 			netpoll_txq_queue_head(npinfo, skb);
-- 
2.53.0
