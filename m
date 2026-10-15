Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914D3B42D1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081358; cv=none; b=nvW7eN245Ab4taAFYG3spO1KwnsbTIYSVe6TG0L9qiYjqORc46bsiMVrkQAtzGIecG0nmXMd/iBMm8g6XyjR2BqVAGaCDrxLEZ7Us3owox8N4wFvEKQ4RYEtMivIlE8KBxn6qj4JSmZ1jjtv6yHvJ7sMEgvl9czeFYU739HcMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081358; c=relaxed/simple;
	bh=pBy1f4VSb3pvW4clcyc1Qy/2nViC1kPB548ufIhq5H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZEPlaRmqTmC0aqSCbDVb1Pp2s77V1Sidf1beJJeLXY4YKLVx2XU2Z6kCqi3IJ/OswJg5rg6sXAvdvcxEyI1Z/MYhnM74qhu2vUTF8EFUVOIy/frW2a1bJd52kmFYjoKsbKpvdladdqxnnhekdavMBFRHNRMY4Ty0kI/l91zPK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai; spf=pass smtp.mailfrom=nuro.ai; dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b=QGgQamKW; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b="QGgQamKW"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35829219da8so189308eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1792081345; x=1792686145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VxoANqrdqE06En2I4F3G1u8hzDyBoOsiup8bgRwGeec=;
        b=QGgQamKWwwM/ZiXBSkgkpkjaTBlTzkAq+SB1NpFz93iMzrlxEv2rPtXdZTJdoytSiz
         DjykKW2YRVd9iQhoGXpGyMCq1IvaTpysuRlkYd4/o43C0NvkQmcsYgmeZIOxMfB1nhbO
         9cdmbekh8oikZetA7Muzhsf0RXBC616gTIzaqpqdcXESFrFxfH5bkTmx8okK2YYOBp15
         AL5y2ORia4p5iu8U6Re8XgAnPm19fJMBCjSnf9N5a/pkdB5I7S9Y8B/RE2fdSRGk6DUg
         46AWuAD7QKyZUgapN/J2fbIM2ibmDRwMsBvUA1S6UmdwWWzSPlxUTwjdkAccFlUvyMCU
         3wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081345; x=1792686145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxoANqrdqE06En2I4F3G1u8hzDyBoOsiup8bgRwGeec=;
        b=AqnhnByp82F+WQWoglRTYmvitTko3GoArNnvxCksbFeb/4nWI0H18NrAq/vmt4gXEe
         gVtBTOSugHQa/6nhBjZyDhLBTorD/JWertVztENtTO0iwe4fej54N2ygmAyC0SffB0w/
         mA/SlMy77TV026nu4fd6mc119X+CEU8JBNrZZrBlFPaQe5oWi2E247E9KuxarBCUXTcg
         ShNaAd57BEViojcCtVsVhN0zcFPv4NXcG42ykdtOfL6/LRN2AUhwlmpGcmO0uR1xUJgj
         6fq3LzwU0WneIO8NrZHMr8SQ7U/KK/bsqfF/abnoGKl0Sne5sjd94YDPPEM9yJ1bY8MF
         PBWg==
X-Forwarded-Encrypted: i=1; AKwUvBzA/x1n6udqV06nt6sz/LKg9twW0gc+qA+8uh5WKLZp+Sov2Uzbkjo6yEbzFLOAJlYxFTUTL1xzgFPxxZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9tfmqcKtm+SIBGZONe31pKtIF3tRSfrx4ugiD4O1vnEJC45VA
	ZqsJOg4nmE2ma2RKne621b+rs9d4HYwPYdY7kcaxS9IhhG3ijt42B4rovMUAz+q+UvM=
X-Gm-Gg: AYBFou3/hZm1O2/kcqLy+b2YLTU7pAEt50T4GcccRPrVFgaHazBPaPnhaWBh6cZvwVL
	VVcGPqE7t3CkQRQlXDUMC3LVIGFSMe3CHT3xMv1CqWWu9Alv31cG8/UBtma5I5sfHa505GziDtP
	L/9rPTUIFBEONvhDcrP5rHc+ygwo7EucfR1YSinsSYYoE6IJ1r/Q37tSzCLEEunabWZwT9JSzq3
	uIHf5aBSgSESeeCcNbGy5D/3l2gXVTiNhJduBJsOcMyou1cn054w0XQB5mF1MGjtY/h1hG3BgFw
	G8XdmS6ctQKivhqtUkmR2slcGbQT+qTRPxqeW0qze64Z429ozUXVWOaDyVnl0AJtORjr4Rncj1X
	yUHdUoSIW0s42rIAOEqvOM1Clk5CMlxymu7yA3GU2od0fyXsNTKEM1PwKwZad67fNiXinTeuXdA
	WQv9PfMMP37OeGL1zwZjQhY2Wh2V96dr+gdHnv4NStNyoQcUYr3oazs5/C9ytqKthvpQ+9CHC5Y
	7a5ankDRbM=
X-Received: by 2002:a05:7022:b882:b0:13c:d071:f97c with SMTP id a92af1059eb24-18251e3f05bmr523257c88.11.1792081344438;
        Thu, 15 Oct 2026 09:22:24 -0700 (PDT)
Received: from jkain-desktop.corp.nuro.team ([64.124.43.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a6d6969asm23010c88.12.2026.10.15.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:22:23 -0700 (PDT)
From: Joseph Kain <jkain@nuro.ai>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	kerneljasonxing@gmail.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Kain <jkain@nuro.ai>
Subject: [PATCH net v4] net: do not let defer_count outlive an empty defer_list
Date: Thu, 15 Oct 2026 09:22:09 -0700
Message-ID: <20261015162209.485940-1-jkain@nuro.ai>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__skb_defer_free_flush() can leave defer_count at or above skb_defer_max
with an empty defer_list. That state is absorbing: every producer then
takes the nodefer path without queueing, so the list never refills.
Deferred freeing stays off for that (cpu, node) until reboot, and
cross-CPU frees fall back to the page allocator, which is the contention
deferral exists to avoid.

skb_attempt_defer_free() increments before testing the limit and does not
undo the increment when it rejects, so a rejected free leaves the counter
raised with nothing queued.

Nothing brings it back down. The reject path returns before
kick_defer_list_purge(), so once the counter is stuck no producer
schedules a flush on the owner CPU. A CPU that never raises NET_RX itself
-- an application CPU doing TX while NIC IRQs are pinned elsewhere and
RPS is off -- then never runs the flush at all, so clearing the counter
inside the flush cannot help it either. proc_do_skb_defer_max() neither
resets the counters nor schedules a flush when the limit changes.

It is reachable with no race at all:

  sysctl -w net.core.skb_defer_max=1    # frees increment, then reject
  sysctl -w net.core.skb_defer_max=128  # does not recover

skb_defer_max has .extra1 = SYSCTL_ZERO and no .extra2, so 1 is settable.
From v7.1 on, 0 is safe because proc_do_skb_defer_max() flips
skb_defer_disable_key and the producer returns before incrementing. On
6.18 through 7.0, which carry the llist conversion but not commit
08dc30de1a40 ("net: add skb_defer_disable_key static key"), setting 0 and
restoring the previous value strands the counter the same way -- and 0 is
the documented way to turn the feature off.

Test the limit before incrementing, so the counter is only ever raised by
a producer that goes on to queue. It then cannot outlive the skbs it
counts, and the absorbing state is unreachable without depending on a
flush ever running on the owner CPU.

This makes the limit advisory. The test no longer reserves the slot it
checks, and the recvmsg callers run in preemptible context, so the
overshoot is bounded by the number of producers in flight rather than by
skb_defer_max; the post-increment test reserved the slot and bounded the
queue exactly. The counter is already approximate -- the flush zeroes it
without regard for producers in flight -- and the next flush erases the
overshoot, where the latch it replaces never recovered at all.

Undoing the increment on the reject path instead would be wrong: a flush
that zeroes the counter between a producer's increment and its undo
leaves the counter negative, and the producer's local is an unsigned
long, so every later test reads it as enormous and rejects. That is the
same dead end, reached more easily.

While here, drain before clearing in the flush. A producer that queues
between the clear and the drain currently has its skb drained but its
increment kept, which over-counts and costs deferral until the next
flush. Draining first matches the ordering __dev_xmit_skb() already uses
for the qdisc defer_list.

Found by manual code inspection, LLM-assisted, while backporting the
llist conversion to 6.1 after hitting the sd->defer_lock contention it
removes. The latch itself was not hit in production; it was reproduced by
lowering net.core.skb_defer_max.

Fixes: 844c9db7f7f5 ("net: use llist for sd->defer_list")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Joseph Kain <jkain@nuro.ai>
---
v4:
 - v3's "undo the increment on reject" was wrong: a flush that zeroes the
   counter between a producer's increment and its undo leaves the counter
   negative, and the producer's local is an unsigned long, so every later
   test reads it as enormous and rejects forever. Test the limit before
   incrementing instead, so there is no decrement to underflow
   (netdev-bot sashiko).

Note this changes the effective limit from skb_defer_max - 1 to
skb_defer_max, because the test now runs before the increment rather than
after it. That matches what Documentation/admin-guide/sysctl/net.rst
describes. It also means the half-capacity kick can now fire at
skb_defer_max = 1, which commit c09b0cd2cc6c ("net: avoid strange
behavior with skb_defer_max == 1") set out to make possible.

Built for x86_64 and arm64, with and without CONFIG_PREEMPT_RT. On
v7.3-rc6 with skb_defer_max=1 and a cross-CPU TCP load, defer_count
reached 1918118 unpatched and did not recover when the default was
restored; with this patch it stays within the limit.

v3: https://lore.kernel.org/all/20261013205416.3417296-1-jkain@nuro.ai/
v2: https://lore.kernel.org/all/20261008220256.1844072-1-jkain@nuro.ai/
v1: https://lore.kernel.org/all/20261007180056.1394868-1-jkain@nuro.ai/
 net/core/dev.c    | 5 ++++-
 net/core/skbuff.c | 9 ++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 18dc88990510..60d86bc21632 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6940,8 +6940,11 @@ static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 
 	if (llist_empty(&sdn->defer_list))
 		return;
-	atomic_long_set(&sdn->defer_count, 0);
 	free_list = llist_del_all(&sdn->defer_list);
+	/* Racy on purpose, as in __dev_xmit_skb(): a producer landing between
+	 * the del_all and this store stays queued but uncounted.
+	 */
+	atomic_long_set(&sdn->defer_count, 0);
 
 	llist_for_each_entry_safe(skb, next, free_list, ll_node) {
 		prefetch(next);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 4aea06d5167d..25f82b7dcf01 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7386,11 +7386,14 @@ nodefer:	kfree_skb_napi_cache(skb);
 	sdn = per_cpu_ptr(net_hotdata.skb_defer_nodes, cpu) + cpu_to_node(my_cpu);
 
 	defer_max = READ_ONCE(net_hotdata.sysctl_skb_defer_max);
-	defer_count = atomic_long_inc_return(&sdn->defer_count);
-
-	if (defer_count >= defer_max)
+	/* Test before incrementing: the reject path returns below without
+	 * reaching kick_defer_list_purge(), so a kept increment never flushes.
+	 */
+	if (atomic_long_read(&sdn->defer_count) >= defer_max)
 		goto nodefer;
 
+	defer_count = atomic_long_inc_return(&sdn->defer_count);
+
 	llist_add(&skb->ll_node, &sdn->defer_list);
 
 	if (unlikely(!cpu_online(cpu) || my_cpu != raw_smp_processor_id())) {
-- 
2.55.0

