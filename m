Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831448;
	b=Jy1tmaHrkXOh8+0T0ixoDAPKC3hVa0+k0bVKtEaVkJ87FrcEEgLRaVZsgTllTgVhs4o4
	 SZgGR08W73kKcYUXhbrPXXgL1AtwwfIKS/4/Atk+dMjBUaFKSbV5nIrvw2bp8N34KWV/V
	 LawVUkyjE/zb3CqFFMAn9plcPA2n1Pg1pCV2t6KCpii3Mnq0nZ1OFpbhy1Zos7gKXoeaR
	 BjSSy8GxlUWwqlt4polzc/Dg+zZeJ0lZFDdMHLVgby0cqQZjdobEuFX5EcJclQMgQ9/xN
	 xKVpr9lMI9gZy74PutXGSBF8s8gZxL8t4Si96g1G4SWicsrpYM04O53EyLey0ElstPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2DvzYjKrOUzMqNS33zIkMu1E1h8ZRESapVtIQDWP32I=;
	b=z2tOS/xP6Km1eBfxZUPnFTc6Bj2hJbxG88ltX5P5r0RRArLes+5KXaVLLHa6NS8snq7d
	 VCSEbSgETntmpgBIjnGfjOG8DftqfjpgMKCKCq674xeCLQjbbrfHSQPDbWqPnm2t0v3nE
	 /tjqd7hWR89XcpuUapINy/91PcNGfVVjzamwOgIi/Rcau7SBlhlM+TiPKIW8lQVYK2n8o
	 bGeZjH35ZflNwTfWXYEzzaRRGHcEttVyCbNYDAooSOK9V500rr37d94Oxnq7mM2cBOF/5
	 wuMBXae0w6YwP/9EVBGPDYZAKN2BGR4cHNOjLjBd8Yee5kbXp04/Pm4q5PNQLhNZFwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ07fxG0;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65558606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65558606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ07fxG0
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2902939a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831447; x=1795436247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DvzYjKrOUzMqNS33zIkMu1E1h8ZRESapVtIQDWP32I=;
        b=gZ07fxG0GDEsvNe+/QJVmTRxfgb2FWsXZ/lBK6luvLHmnXXJsoClsVy6w6cibCo/BZ
         W6JW7C0AxGumMIZd02DNEil/vj16J07rdtxwwSjrTwKB/GrZcIm/Tntka4IaN6tT/aGh
         aIaBvHPQy95jiSO4GnAZThpF8PiOOuEB0WjhTrFwFFLkju0t+UcLwBrL6K0wpvAN+ZRn
         Mn0xPUprvk8WahWgRYdJi1YfEezaUBJ8JGdu3CI3sEgJEkKM0XwKTBw/aZF1uR8jW5qT
         U68GFHJCLL7wAS0Knrie+BXLYzRukpXZtlvKbJ273YihjETl9ikeoUiGO0Q3ZL9VLFDX
         LxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831447; x=1795436247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DvzYjKrOUzMqNS33zIkMu1E1h8ZRESapVtIQDWP32I=;
        b=b0VTd9P1sdIe7FFhYOR+sZI7tXhsEdIGoanmwmft9zG9pJ/98rvXohu6bKMiHO/pZd
         WdzmWUOy0GFI7Wl2+rF2rDUvphrmXipYILj2UAPdmZr4+jNCz+iw3EVavfgQ18RuyPrD
         z7w/vHEsB2jD5ML45yYoO3FRZli4fM/zO0cCkfdzHciIREDhs9nncBeuNHjb6c520s2e
         7fm9hhVa+pklVyfiYd0g/OMGDM8VkWFLGRrpB755mv8FFIaZ30FCLw/b0fJ15MRqSJcu
         HY0tBzUfuutCz93PxjPznGQaKj6JNGMKlWLq+OhKVnr7MgOupcc2EwL4tHYdPGw9SO4i
         w2+w==
X-Forwarded-Encrypted: i=1; AL+hErFzlarTi+c+zfOey8c4kjr0vOnRNkuNTYbXkVQeSuNpuL2BQPF6zpPFiv7fZhXtQr+cmwUtef0FU2kIHs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z109VPxFvA+jP4L/hHgcsODwNwfkv+BctdEVw+OQQgDj4li25
	+7dUmrKGcuk1BUh3t1Xpymg61Aflp3ihM8CR38sYU28i1ySp4Ds2E0fo
X-Gm-Gg: AZFdTZchG3ZH4J0k9px+1dfJTPs06jQKimZeR7ALaXnIiJnwOC/j10z2Om/0bmq1H5k
	OFm20YCO1a60ZDSNkuzWfY13PKPcqiwJL3oKHjYcXWIwPbBY2WASIKHtnEVT8jsZW2jU169U0zO
	ViFj1nWTGmw51mltX00iDBVuUNO5lM8+zFUtqtr5VLOyjfnBHadl/vuVPTc2Fmi+ItZI+XyQwd2
	sCrEfyM6kfyslH0a2o6IUC7MjQQijsF2LHVZQn2T3xYbFK06RE6xv+rTqtaleKO4t8iQXHxxRwn
	D/61xemZ/Mpo3GZkFTgle4q6O3DKvpN14umB0xBjoCHvvNZxwHKItn1sgAzkEpdrEl5arktB1qf
	X6jOF+Wp1pIAu08L0mEBZfQQGJFvirjeXeUG+9hb1MfLFhPL7ppCXYc6SAGpk9aq972aDJjyERL
	f4U1uxpgJ1y4ISJxP3QrEunJ0iAEkdCF5PJinOAWjEpB2iuOE84OFQ0q5vZuCV7FkENLUOPKMD5
	3fSnoSC2qmz+CLPqLGF2mCtL4OgLa46y+H8bzocktJH4tre4xdxpjgh8S1eCOZLH0ZoE6GycecN
	6hOgbX4blc1rmvDtKvc7Bk7ZMipUzaQTQU7/GTTccwkbfF2VWjOvs+qx28pOmnL1NvOjM7DHEg=
	=
X-Received: by 2002:a17:90b:134b:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3b1b0cae71dmr10511167a91.38.1794831447522;
        Mon, 16 Nov 2026 04:17:27 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4352sm4384178a12.24.2026.11.16.04.17.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 04:17:26 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	paolo.valente@unimore.it,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net] net/sched: sch_qfq: bound backward slot rotation
Date: Mon, 16 Nov 2026 20:17:07 +0800
Message-ID: <20261116121710.77403-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

QFQ+ keeps aggregates in timestamp-ordered slots and rotates the
occupied-slot bitmap when a group's start time decreases, avoiding the need
to move the aggregates themselves. Insertions are capped so that occupied
slots leave room for a later backward adjustment.

A stale aggregate can make the start-time decrease larger than the bitmap
can represent. Rotating then pushes existing members beyond full_slots,
and a later qfq_slot_remove() clears a bit in the following slot-list
pointers. KASAN reports the resulting corruption when the group is
selected:
  BUG: KASAN: slab-use-after-free in qfq_choose_next_agg+0xd04/0xd90
  Read of size 8 at addr ff11000102f73010 by task repro/92
  CPU: 0 UID: 1000 PID: 92 Comm: repro
  Call Trace:
   kasan_report+0xe4/0x1a0
   qfq_choose_next_agg+0xd04/0xd90
   qfq_dequeue+0x365/0x14b0
   qdisc_peek_dequeued+0x91/0x280
   tbf_dequeue+0x91/0xcd0
  Allocated by task 91:
   qfq_change_class+0xca5/0x1c50
   tc_ctl_tclass+0x4ee/0x1400
  Freed by task 37:
   kfree+0x1b3/0x550
   qfq_rm_from_agg+0x228/0x300
   qfq_destroy_qdisc+0x118/0x1e0
  The buggy address belongs to the object at ff11000102f73000,
  which belongs to the cache kmalloc-128 of size 128.
  The buggy address is located 16 bytes inside of
  freed 128-byte region [ff11000102f73000, ff11000102f73080)
The report is followed by a kernel panic.

Limit the backward adjustment according to BITS_PER_LONG and the
largest insertion slot. If it exceeds that limit, move the activating
aggregate's S/F and rounded start time forward by the same slot-aligned
delta before rotating. This preserves the timestamp and physical-slot
mapping, keeps every removal offset inside full_slots, and leaves
representable rotations unchanged.

Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service at DRR cost")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
 net/sched/sch_qfq.c | 13 +++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
index e900890e9c54..e83105ce9015 100644
--- a/net/sched/sch_qfq.c
+++ b/net/sched/sch_qfq.c
@@ -1300,7 +1300,7 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
 {
 	struct qfq_group *grp = agg->grp;
-	u64 roundedS;
+	u64 roundedS, slot;
 	int s;
 
 	roundedS = qfq_round_down(agg->S, grp->slot_shift);
@@ -1318,6 +1318,17 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		if (!qfq_gt(grp->S, agg->S))
 			goto skip_update;
 
+		slot = (grp->S - roundedS) >> grp->slot_shift;
+		if (unlikely(slot > BITS_PER_LONG - QFQ_MAX_SLOTS + 1)) {
+			u64 deltaS = grp->S - roundedS -
+				((u64)(BITS_PER_LONG - QFQ_MAX_SLOTS + 1) <<
+				 grp->slot_shift);
+
+			agg->S += deltaS;
+			agg->F += deltaS;
+			roundedS += deltaS;
+		}
+
 		/* create a slot for this agg->S */
 		qfq_slot_rotate(grp, roundedS);
 		/* group was surely ineligible, remove */
-- 
2.55.0

