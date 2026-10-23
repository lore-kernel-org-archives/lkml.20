Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785780;
	b=Pw7bT2Yv2qLMZfhhBcZWaHMU596QJ/ygYblvRy4LCGHUnyS+n8NV4uDcB27wu+SMSB2J
	 gOz8djsguLBifbifgxSC1R/bEHv6rUpWx0NmrIevxLdkMq6hhuFY9CgZK2tlFERxtwDGa
	 jarycetJSzUjM09fBkKRkqf800te/Ra54v76OZhxAPsexA9Ij1aRCqt8LaodHJLzHmk5N
	 Z8eyQ6awRAc1sOptGy5oQs7iXU7jp172Qazq8q78NkI2Bd4hwTclUj0ASLtL+bsjKGlw4
	 z/3YukKbeIUEBupDJcrC41jr6p8AWoVRsFL7q0xLJjVCoa26jinWgskGMEESiRHkazQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Unsent:Content-Transfer-Encoding;
	bh=+P6I8duspVIkphkurSdUiF8nhaxikLYjgPI/qnOpQ90=;
	b=Fx++r1YM6wVNNDEjec7rZR865qYcdUTr+TBPSUndANQe4K93nTat+Qe0U7g1Ex+0hIvO
	 WiouXZsp/0bEilLaM59J00aLHdOx4g+SYTc9tg0QGYi/RxaRWoZy5BQ94mXlzPBYVABs3
	 cwPnxzscM8yGxn/Ub5PAoWJYrhcT6+T/laF09cAc0N7ol+yPf+5ZWX/yfL+R4DKjfaEo0
	 mBvIFvpI4uIQDKyF0oL4pAQxa/lTjCodswGYhpJmmjSqPt7qryUHXoRXiq3YIC7zZV5Z5
	 bUQxqtV9Or6xTwSGZkDD2rlJpuvF5xQKZxhejwOeS9E5/H1hywGCbBGC0rx/3MFLboA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=TmAJ8pR8;
	arc=none smtp.remote-ip=74.125.230.201
Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E8606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=TmAJ8pR8
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-934956d1044so115899385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792785778; x=1793390578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+P6I8duspVIkphkurSdUiF8nhaxikLYjgPI/qnOpQ90=;
        b=TmAJ8pR8TcAnppZdDpMb6ouB4qgQBqJNWeQiamMrAcvfqW2akgRerpYovKNNnDP4lT
         On9QZjdzxznvO5K7okBJa3EIy+0dQT2GfXngT4Qnswc+amzxrKq+I5elTm4ClIa9pAZX
         aI7Fpin4aBft/DyyZ+G/zXDPPyZUYCVt2w/VIxDczlpHDn97M+Nz9Ui9uEYz98ArctQg
         ggFd0/230bB5kJ9zM76FEx8ql1O0Csv+w0C/dAGK5KfqhVqyMba6AtR/d582JgdmpZOH
         pKhD9hesP2t0/rL1e+zP2kyOKsz8s7PYeWNu6xB796ehbATkbBMPljRGNhdngYNLHwoY
         268w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785778; x=1793390578;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+P6I8duspVIkphkurSdUiF8nhaxikLYjgPI/qnOpQ90=;
        b=sT8SNYjdQKLJAcBmeyQvaZ+LmaOU4dLUb6myTsYYrGU1cUlTnRK2IWOzt8H4HoHFyT
         R2bC870mASHt1/gGw1XNegZeamjkQ0mQzoEzKSWIop5EwOkD3+tUdC4P1yeeQiEMT31D
         1SSe31AdhNmuT1Ri98+8clt/n9rxRoi2Hsp/uT6hHhzyX5u1HwiTlQnMLxwLWtHJ1Ywe
         v4O95KnHZPtUtQOQsfrcc/gkXW3+h7NniniQKpleR5ZVduTbbtZ4YyyBEdRpQzYFBLNO
         /E1+dtU/UDmSfsKtICrauoZYmLBibq56KlWcmAWkabRUMp7MzMjGg1W8ejTkzdEkcqz6
         CoIg==
X-Forwarded-Encrypted: i=1; AKwUvByPnCBCCa0vqt/We57T0ZAmBB+neYQu7WIZ1CQAy9Y6tti6Nz3C3MJ3e7jXvK8OYw+E6yCvO2g4MhLcddU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJDmBD8WI0UMRv1YORMzHmcbqITC+QjpurGyR/ZKCC1kK+H5+H
	dTXD5C0lDhgwfhyk/DWJuWrGq6YF+s37J4JLsIlihOU8so8zmIPCpL7daAuAhr0MOEY=
X-Gm-Gg: AYBFou2E8E4IT3M1GXr2EO1GNWwA5hEx8DjvlCjPLHE9aigEj7lqkSGyH53Jv0DSRCD
	9hOoctRtxEip/Xk2aNpCjc3D44HjtzkXtlLRAKwTe/sRIn+ohLmxqzXeePxCPZVUABT0ZpJpbKg
	XDXvxi9H7yYel9oZPdaW5gBogaKFNi6d3CV24N90LUkHHMODGjHbTYEykbbu0qIgxIHkVyGRb42
	eCzXOWS8Mzq4Z096jr5iCf/0vEbMABcnq9D34kLLkBtx+gx0u5s1TojgUigBuJ3jdZ0Rlcch7nI
	cgQBuxa62ffd/H462dTkYbqCJcxkc0HplkoUoFgS1g+T6tSM67i1CynpZchP9eRM5nZOCLW4u8y
	XnHl4kO92JNWkn49ZFL5tzREsoHD3s0YZDkpu6tB/j+V89bsgjmMOCCuBdZ9GN2l/K3aM7pZVK8
	KHe01iS9uVrR11952TKBUC7XU2W993tEfy7Zgt012WS+nsFUEoRRQLMQ0O3ky/2Tg9JAquaAWsz
	ZIP6+OiXjrjZpIZg0phDfq6BKFmPWWdJRfE+Ku/DRmi3TwHIAobts2Ka6/TXYWWsCdo/tJmhKKQ
	jA9EOfBldEdBNFGnVMnGozxC2q4TlQUmxczfJco7Hg==
X-Received: by 2002:a05:620a:4592:b0:93f:38c7:70f9 with SMTP id af79cd13be357-940ef901c2emr18967485a.14.1792785778344;
        Fri, 23 Oct 2026 13:02:58 -0700 (PDT)
Received: from localhost ([2600:4040:2047:3600:ecc7:9b1d:4307:d6a])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-9402ee285c0sm102122885a.1.2026.10.23.13.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 13:02:58 -0700 (PDT)
From: David Lee <david.lee@trailofbits.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: David Lee <david.lee@trailofbits.com>,
	Simon Horman <horms@kernel.org>,
	Kyle Zeng <kylebot@openai.com>,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] net: sched: prevent scheduling deactivated qdiscs
Date: Fri, 23 Oct 2026 16:02:56 -0400
Message-ID: <20261023194712.package1-20-v2-david.lee@trailofbits.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Unsent: 1
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

TAPRIO can schedule a deactivated qdisc after some_qdisc_is_busy() has
reported it idle.

Commit 47e8dbb6e763 ("net/sched: do not reset queues in graft operations")
made graft deactivation skip queue reset, leaving TAPRIO's timer armed.

A late callback schedules NET_TX softirq work, whose dequeue path can
race the unlocked child-queue reset in taprio_reset(). The same skb can
be queued for deferred freeing by RTNL and dequeued for transmission.
In the reproducer, the TAP reader frees it before __rtnl_unlock() reads
its next pointer. KASAN reports a slab-use-after-free in
__rtnl_unlock+0xa3/0xd0, with a read of size 8 from the freed skb.

Reject deactivated qdiscs in __netif_schedule(). Callers' RCU protection
lets the existing grace period join earlier scheduling calls before the
busy check. Restart nonempty transmit queues on reactivation so suppressed
scheduling does not strand packets.

Fixes: 47e8dbb6e763 ("net/sched: do not reset queues in graft operations")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/netdev/20260805102514.740834-1-david.lee@trailofbits.com/
Assisted-by: Codex:gpt-5.6-sol Codex:gpt-5.5-cyber
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Co-developed-by: David Lee <david.lee@trailofbits.com>
Signed-off-by: David Lee <david.lee@trailofbits.com>
---
Bug found and triaged by OpenAI Security Research and
validated by Trail of Bits.
Trail of Bits has a reproducer that triggers a KASAN use-after-free
and can share it if needed.


Changes in v2:
- Move the deactivation guard from TAPRIO into __netif_schedule().
- Correct Fixes to 47e8dbb6e763 and narrow the stable range to 7.1+.
- Retest with KASAN and check packet flow and temporary reactivation.

v1: https://lore.kernel.org/netdev/20260805102514.740834-1-david.lee@trailofbits.com/

 net/core/dev.c          | 3 +++
 net/sched/sch_generic.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index 1a09e7869..bcd2d5197 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3478,6 +3478,9 @@ static void __netif_reschedule(struct Qdisc *q)
 
 void __netif_schedule(struct Qdisc *q)
 {
+	if (unlikely(test_bit(__QDISC_STATE_DEACTIVATED, &q->state)))
+		return;
+
 	/* If q->defer_list is not empty, at least one thread is
 	 * in __dev_xmit_skb() before llist_del_all(&q->defer_list).
 	 * This thread will attempt to run the queue.
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index 6f6a6f0d5..bff425a14 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -1280,6 +1280,10 @@ static void transition_one_qdisc(struct net_device *dev,
 	if (need_watchdog_p) {
 		WRITE_ONCE(dev_queue->trans_start, jiffies);
 		*need_watchdog_p = 1;
+
+		/* Resume backlog left by a suppressed schedule while deactivated. */
+		if (!qdisc_is_empty(new_qdisc))
+			netif_schedule_queue(dev_queue);
 	}
 }
 
