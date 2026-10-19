Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429375;
	b=b1FS3Pb0c8hVEPkOnDMewC25KX+5kTqdOaoj0TPkaKh4+46jr8cPjTUEHEQsvhzzZ6m9
	 X/MOLfUL4N+1KX6NtGtt+GHr0kJiJTsqTFX9EvTryW4OSW3yxCxFbBPO2gWlagj32AhJK
	 CDd3Pyd00Ll24obb8M62YGTzY+/af7ZXqy9UgSaruSeqGzF2CBJLtBOawK3fUEOesLYjj
	 lvfoxZpMYCyA/TXxb7fpovQyGFBoSvQISOXWwqKViMS8b2X6FNpL+bFnuLjJ8UwOa15o2
	 FAB2xI8BfAaLrCW27yMJmqpkkIoyQON+9B2OpSzwDymRnmMHPJuRFirO46WeZlRfeMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BIfyqA5AbmeLJ89zRooXyOk4Vu38p10es+1yAcp1pZA=;
	b=nvULWxSoaTWM0tTvd1LJt46gUCxV30FTKjEP98JBw+w2rBwlGDONaik35WzO3jhUDrXZ
	 gnebl8mXWlbcQIQXQ7Cut3ZuUVle2L0z50Wg4rSzVswj5W5wOOg8gZSHI8zBjLCQAjSoS
	 hChpM6kdmIlsoCouIP3zltB3a9XDn22V7t+E82OM81Dpb/jMdW7C2fqcgYBLBWg8BrDLh
	 JuBN/xm7XwWiCyx6CaI+Vu2vKOFhNsjG4xesrqPB/8mG9rPKEXLLdzBmTmPdxtr3f1rYh
	 75SnWOkM34PQ92MuM3dLQbcA7PIzlbt9hIjjLeuMaYC8SaFIbRTsKrbMxSk+VLd4uBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKRvHBFp;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKRvHBFp
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3077971a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429374; x=1793034174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIfyqA5AbmeLJ89zRooXyOk4Vu38p10es+1yAcp1pZA=;
        b=gKRvHBFp53SqVVvz8uwI6Jz5jkiG9a6mLRDuJlp/poPdq2AfjPK4jPsrqlyEqajWCw
         TqRjuSUtLby4mmYtf3cyhS2HJgAyOuaqA1+y2ewJsncBg2p2NnrVlU3O487Y35ihWdOM
         Aft0kI0iOQ5DnVUVUlG15THQ6vge9boTyKUFYoKbVGfRWjDhmULmY5bXv74vsFAFlksK
         W44yxIkKBnur2fkDoCc3f5m3Spa8QQVMsOu7IW+uAvdEi8/lwOvNZBGrA9a1oKJtaJlN
         JBTCHfedY0GAuDs1HTVnkoWWs/CLTHF/tCRZSbBqiKKFFYBOIMSAQba3P7cA0zNf4pB8
         ZCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429374; x=1793034174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIfyqA5AbmeLJ89zRooXyOk4Vu38p10es+1yAcp1pZA=;
        b=rkNF1FRe2S8RuOmO62/J6uXkDyNIYxg4mECb/3EYB9D06Gd9VvozHPRqRcU6ABaxBS
         EkyeV2TR0AZEbQAkVXixUl05wcaCEVFEcoVX94nxkBiBHkJzvedBCcel4PfOkb062JK9
         1RsOE4oUMjRmOwj3E2oY64gjRziLeffzGDpCarkJwmUwk1wY0RIkudVLk7TiogHAVrAB
         qs0CWOxIr4E1bl5/iAwd8U7AUOfUQ4GSCwG2QfzqxstRh0HqdZxE5RVy3n2GzaWlHnhk
         1Mc71ip3GXT0uzvyyUMSi3ZPFgLhOijS0vemp1y8kg1y8pE9pToLT7cZy8N4ap6jMyRn
         UdZg==
X-Forwarded-Encrypted: i=1; AKwUvByDTQZBlqfLsIJvnHo6VdKDC+hQxTeJqDaNLIO/hsZx9v0FPr5t+XS1XXm3vGMemRxSgRCVCWxBHiJVXlQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlB0UE/EU0ia1fPPLaDEGxAqIKg/6RkSpNWi/rue4vvtqUQHbU
	CmZuF4j34Gv+WLI/ubY2deNbPH8+oe+znxuB5vfpbfC8j2GkbhyqChdk
X-Gm-Gg: AYBFou3O4m094UlQSIch8d6oz2IVw1IvJzOWTtruevlcLPujh/30DD8iHrGrdufRoDc
	PFN8PhLNqfdyi179vNQPsTw8ZXbN9+3Y9uHnyNDRDDFdPSFAAm2ecSkfJH2eE8sXHoP37UKjkxd
	NYVOYIbpviU28WkpehOn9m48lh0ZZU9JdJuIGj/UfRIbK3sIzK9a7KudikwjNUJEJ3kGgsyT1DV
	xTaT+zFlIq5cLNkX4unulAI1ByuCkcU4O0kF1GZrBOtDy/a9PFIFT0/KyWXmxm6hYptPITQwMEe
	ijJXuROWmmVxFb8d0yw56AEdehnPnI/mvp3Bo/dAmPkWsFy3Qeyb64PsxdGPV3nTf4KnJSpJnQw
	yhtsjmoOe21L3LVsXUKXsunM97D+wV7CR7OJze4GpCacgesRGK4DMGXwzwtiHHyy8Ed0KBwRWDO
	MyzZUPLG+6bgl0hilmJ/mgjt6/dSDK2JHxtELPUtHFcA9XgpdB38uzln05fEoUK9BK
X-Received: by 2002:a05:6402:450a:b0:6b1:b97b:745 with SMTP id 4fb4d7f45d1cf-6b3a8186737mr5328588a12.29.1792429373535;
        Mon, 19 Oct 2026 10:02:53 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:47::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm4084132a12.10.2026.10.19.10.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:51 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: netdev@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 2/2] net/sched: Don't wait for RCU when unregistering the qdisc lockdep key
Date: Mon, 19 Oct 2026 10:02:25 -0700
Message-ID: <20261019170225.729789-3-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019170225.729789-1-vlad.wing@gmail.com>
References: <20261019170225.729789-1-vlad.wing@gmail.com>
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

Since commit af0cb3fa3f9e ("net/sched: fix false lockdep warning on
qdisc root lock") every qdisc except ingress, clsact and noqueue
registers a dynamic lockdep key, and destroying it calls
lockdep_unregister_key(), which waits for an expedited RCU grace period.
Replacing an mq root destroys one qdisc per TX queue under RTNL, so a
single "tc qdisc replace dev eth0 root mq" waits for that many grace
periods, each of which IPIs every CPU that is not idle.

The wait is not needed here: __qdisc_destroy() and qdisc_create() free
the qdisc with qdisc_free_rcu() after unregistering, which already
keeps the key's memory valid for a grace period. Use
lockdep_unregister_key_nosync(), and free with kfree_rcu() in the one
qdisc_alloc() error path that used kfree().

On an x86_64 KASAN + PROVE_LOCKING kernel (64 vCPU KVM guest, 64-queue
netdevsim device, 214K lock chains) this removes 5.3 ms of grace-period
wait from each of the 65 qdisc destroys in "tc qdisc replace dev eth0
root handle 1: mq".

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89iLvu_ijSV+FnrZ6qei_Ty2c9V-RjwLMk24+oOS91bNjaQ@mail.gmail.com/
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
 include/net/pkt_sched.h | 3 ++-
 net/sched/sch_generic.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/net/pkt_sched.h b/include/net/pkt_sched.h
index 90d3e7943b19a..1f4195dabaa57 100644
--- a/include/net/pkt_sched.h
+++ b/include/net/pkt_sched.h
@@ -323,6 +323,7 @@ static inline void qdisc_lock_init(struct Qdisc *sch,
 	lockdep_set_class(&sch->q.lock, &sch->root_lock_key);
 }
 
+/* Free @sch only after an RCU grace period, e.g. with qdisc_free_rcu(). */
 static inline void qdisc_lock_uninit(struct Qdisc *sch,
 				     const struct Qdisc_ops *ops)
 {
@@ -330,7 +331,7 @@ static inline void qdisc_lock_uninit(struct Qdisc *sch,
 	    ops == &noqueue_qdisc_ops)
 		return;
 
-	lockdep_unregister_key(&sch->root_lock_key);
+	lockdep_unregister_key_nosync(&sch->root_lock_key);
 }
 
 #endif
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 6f6a6f0d5eb0d..28791d4fe35b1 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -1033,7 +1033,7 @@ struct Qdisc *qdisc_alloc(struct netdev_queue *dev_queue,
 	return sch;
 errout1:
 	qdisc_lock_uninit(sch, ops);
-	kfree(sch);
+	kfree_rcu(sch, rcu);
 errout:
 	return ERR_PTR(err);
 }
-- 
2.53.0-Meta

