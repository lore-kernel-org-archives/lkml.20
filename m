Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407023;
	b=QIrzcnKBoNCjp/MgmuxBwBYeawgyFVnFNFz9L+7JcUn6ZE1W6A9vpd65lRA9epX6kC8l
	 x5pr8VW+9u45VyMVXAFnlpWq2kvm1n8EJGwQ2Pun5+WSYu/boiTe1qADpBpXuYcYL0yIj
	 IGtsYzzgMCQNUvspww3wtTR6nXWcknWRBYQqJ0TNbN4BUYrOfecDr5+H35dzFP1+KmzTd
	 OhkgdH9Zf2Su3x63i5y491CH5J4XdijjNef2Wn0R4PbOoVfF2sfDTaLUZTPaSda1Yr4bU
	 hlLU7vpnM1egmhv3xCJSLpe+3BPYA46PSQaXSkh6B2nPKLE2TpBDHez6IcX4un3z87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sp4dKr742azZCnJ8RuBlUtN4JNyRRBPpgnCwCd6hxvQ=;
	b=AMTiQHnqql62RsSytWYgImLgEVJmiaPeHJn0FGKL8vfEX6gPBmsy3F1kQcCCGoYbR6O7
	 ZH+9KniIr/96cB1qpa0IINnjLLe8W+JN5UuTbms585qhEcTGhd3HCO7Wj5kJsZfbphWTs
	 zJANqsZwrHEiWYFgmlzWFJykaDjZf3XOAsReetFQ8r/dor2g9KmoYaYeND14HSpXefxd7
	 BKXAaVo2+v06qt68z5NOJ/OOx01ZAJ1rPxhuYw5ybiN5yzy/d0O/C8UoaIZ8mq9ZO1nGx
	 udLZnAp447zn/mrwxpEj2+1NYcgehVI5PKHQ8bSiHBwKL8HfBhi1gtD7myWrR+msldw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgG4UBwu;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA37606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bgG4UBwu
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1283790a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794407022; x=1795011822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sp4dKr742azZCnJ8RuBlUtN4JNyRRBPpgnCwCd6hxvQ=;
        b=bgG4UBwumuE6BJdVZbJhYOC+ySdXNUQI0Ceo1NqDQ1SxHD6AaIYFbdB1nNvLt8UuAu
         KTa2qrjTYE6bh4PJXnL/CLiGlpSlaq0l+Ajz1C1PolEI3TCKsO/O8zIvC7IN6r+hN3mM
         5pbaSj79Udwfrnvxe07KrDzhl8V+AgIIKUsovSQbHjYG0GJjyqRgJyIzIuXD4eqCLDIK
         +t+7r02ibgou9RecjhKMb4BDATikvFTNQD1W8iH63sli2ydLic/7krvMz+7SJUrqK6WA
         njLnADSLomyb5GHGzTol92qlhsYgPC6MxQ/lw1oonhMQMpvYdam8PKz3TBZseUlEJExZ
         v/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407022; x=1795011822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sp4dKr742azZCnJ8RuBlUtN4JNyRRBPpgnCwCd6hxvQ=;
        b=u0d2gt/ZPP/WOa1V7tps/bGmXgAPMYEUHLHDeIlERjtetq+W3WhrLFOJ+uekwRASsJ
         oLh+Z5iX0eLEzdWD1Fierm9JONnq45lMBNIIcKu2yYaRDVwgarM2qd1oL0B9SYMn81vE
         HSBtx12DeYMCPvJi72nA7kIIWAy2h+aU+9SVwKCMVTHuiSX/q6s4Mi6ie4Z38aAIqPtU
         UqPePuRA2/g22kP16jXXhx6MbIlole15OpUHjRy2Pi9egVMKbci4p6C/LmHLDxXVCljz
         4DoRTDvcrPIbGjXj6+k/sQAsL1BpNBf8owSkDQcsLXUI+yt7xUqcnjjT0Gburwxtrxam
         8wfg==
X-Forwarded-Encrypted: i=1; AL+hErF2iHJCc+TQ1KGTcuT7J0W/npgEyMB9DsZF5ojrOz/4LODVYHQ7oWHMEXyx0+pHHklFg/2y2VibC2SQisM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VpDWJYp/NgpEKO+JNon0tRlijwF0ja2B2ScUTA/XxAOgAu+dX
	FD8zyNlcWJV6weO2bvo+Vq8tkgynBQOMmWxyYSO+HTdovO4WyxZU/QYE
X-Gm-Gg: AYBFou20YzAB8o8NUadRG6nP3C+orTmrs+hMOadc/P96mddy1rBfiIiebCJTxaxhiJx
	vyC2V2DIEA//NBUY8t9vDq++o30nTzpCu0qaWeUqZ0aRVEMW1sQqSKB+NliyPgNAJOu3KTXzUW+
	Cw1Z5C6LT/A42jkMsVSrzi3A5uk0FOnAkn5oKY8xyA7Y9uodsqDbT3iZxt6nbLy0T1nsrPFiIx+
	WB40JBkZKP2xTn9qMHVioR+yOP/ky5NEUekyV8YVHPjCSMzsFQnxiKueBIgL18t9tIYoW3NlspQ
	JMEE4VHmoEQXEJUI3dK2gETjQzV9+PSGn6C6IZXZIia7vD+7Y/W4lk69NCwcM/gNtNRwhGV3r6i
	aOZHLKKHIjojfKto1sh2DLK9GDf5vJZxV5Oi0pLl4vKTyiIyrPq0VxOBh259HgYTG5+0vzbsxfi
	eHvDXNaWop7I1K73wkA6+eYyf3S1BhnH4/JarUkO7O/+BbifK9EATLwFJBmdT89KnR0Bea/w/GI
	WJW2Qw/CvNvFjepAv43+lWSJdltISphni0puT5ZSawIsROK/gWJ0Fz85UFBjqDXVw15rm+l38to
	U5kalDsEf0lUlN628gU2X1g=
X-Received: by 2002:a17:90b:1c02:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b182eabbd9mr2705481a91.22.1794407022263;
        Wed, 11 Nov 2026 06:23:42 -0800 (PST)
Received: from omen-arch ([147.46.174.207])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db5cc73sm4768976a91.10.2026.11.11.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:23:41 -0800 (PST)
From: Junseo Lim <zirajs7@gmail.com>
To: vbabka@kernel.org,
	harry@kernel.org,
	akpm@linux-foundation.org
Cc: hao.li@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] mm/slub: barn sheaf counts can exceed their limit
Date: Wed, 11 Nov 2026 23:23:37 +0900
Message-ID: <20261111142337.748120-1-zirajs7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hello,

Following the suggestion to discuss this publicly, I would like to
report a repeatable overshoot of the SLUB barn limits. Although
MAX_FULL_SHEAVES and MAX_EMPTY_SHEAVES are both 10, a userspace workload
can repeatedly trigger the refill recovery path. In one run, I observed
states like nr_full=91.

I would appreciate feedback on the appropriate way to enforce these
limits.

Description
-----------

While the sheaf layer provides a simple array structure for
amortization, the edge cases that involve refills and allocating
structures are inherently complex when combined with multiple threads.
One problematic case occurs in the allocation path. Consider a state
where every object is drained and TH1 on CPU1 is running:

  CPU1
  =======================================================================
  TH1                    TH2                    TH3
  ---------------------  ---------------------  --------------------- ...
  pcs->main->size=0      not entered            not entered
  pcs->spare->size=0
  nr_full=0 nr_empty=10

    <observed states>      <observed states>      <observed states>

If an allocation request hits this state, __pcs_replace_empty_main is
called to retrieve a full sheaf and swap it with main. However, no full
sheaf is available in the barn, so TH1 removes pcs->spare, sets it to
NULL, and refills the removed sheaf through the slow path. Here, the
per-CPU sheaf lock is released during refill and reacquired afterward.
If preemption occurs during this period, a subsequent thread (TH2) sees
pcs->spare=NULL and tries to get a remaining sheaf from the barn's empty
list and refill it. Likewise, this part is not protected by the lock.
Chaining this results in a state where new threads keep draining the
sheaf and ultimately consume all the empty sheaves in the barn and start
to allocate new sheaves.

  CPU1
  =======================================================================
  TH1 (preempted)        TH2 (preempted)        TH3
  ---------------------  ---------------------  --------------------- ...
  pcs->main->size=0      pcs->main->size=0      pcs->main->size=0
  pcs->spare->size=0     pcs->spare=NULL        pcs->spare=NULL
  nr_full=0 nr_empty=10  nr_full=0 nr_empty=10  nr_full=0 nr_empty=9

    <observed states>      <observed states>      <observed states>

The construction of the sheaf layer allows such racy scenarios, as
mentioned in the comments. Nevertheless, this overshoot is much larger
than what we would expect, and the fact that this state can be recreated
with moderate effort implies that a fix would be appropriate.

Impact
------

This itself does not pose a direct threat or system failure. But, in a
security sense, this behavior can be leveraged for heap grooming that
targets the underlying slab_sheaf.

Design considerations and Question
----------------------------------

One way to limit barn overshoot is to constrain the racy allocations.
Simply using the current nr_full and nr_empty values does not help in
detecting excessive allocation. What I came up with is adding an
nr_alloc counter that keeps track of allocations during the unlocked
path. From what I've tested, this restricted the targeted workload that
induces the excessive allocation. Before this patch, nr_full reached 60
to 90. After the patch, it remained at 22 under the adversarial
workload.

I haven't checked every possible interleaving yet, but I would like to
know whether you think this is the right direction. The possible
regressions are that it requires an additional field just to track the
adversarial input and that, in a highly contended scenario, every
allocation after hitting the nr_alloc limit will go to the slow path
until the preempted task returns and continues the allocation.

Is tracking in-flight sheaf allocations per barn, and falling back when
too many are in progress, the right way to limit this refill race?

Note: This is only an implementation on the allocation side and is still
a prototype.

---
 mm/slub.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 45e077c7526c..472fcae4ac91 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -456,6 +456,7 @@ struct node_barn {
 	struct slab_sheaf *sheaf_partial;
 	unsigned int nr_full;
 	unsigned int nr_empty;
+	unsigned int nr_alloc;
 };
 
 struct slab_sheaf {
@@ -3333,6 +3334,7 @@ static void barn_init(struct node_barn *barn)
 	barn->sheaf_partial = NULL;
 	barn->nr_full = 0;
 	barn->nr_empty = 0;
+	barn->nr_alloc = 0;
 }
 
 static void barn_shrink(struct kmem_cache *s, struct node_barn *barn)
@@ -4754,7 +4756,9 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 	struct slab_sheaf *empty = NULL;
 	struct slab_sheaf *full;
 	struct node_barn *barn;
+	unsigned long flags;
 	bool allow_spin;
+	bool alloc_new = false;
 
 	slab_lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
 
@@ -4796,6 +4800,19 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 		}
 	}
 
+	if (allow_spin && !empty) {
+		/* The limit is advisory; concurrent reservations may exceed it. */
+		if (data_race(barn->nr_alloc) > MAX_EMPTY_SHEAVES) {
+			local_unlock(&s->cpu_sheaves->lock);
+			return NULL;
+		}
+
+		spin_lock_irqsave(&barn->lock, flags);
+		barn->nr_alloc++;
+		spin_unlock_irqrestore(&barn->lock, flags);
+		alloc_new = true;
+	}
+
 	local_unlock(&s->cpu_sheaves->lock);
 	pcs = NULL;
 
@@ -4805,7 +4822,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 	if (!empty) {
 		empty = alloc_empty_sheaf(s, gfp, alloc_flags);
 		if (!empty)
-			return NULL;
+			goto out;
 	}
 
 	if (refill_sheaf(s, empty, gfp | __GFP_NOMEMALLOC | __GFP_NOWARN)) {
@@ -4816,7 +4833,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 		sheaf_flush_unused(s, empty);
 		free_empty_sheaf(s, empty);
 
-		return NULL;
+		goto out;
 	}
 
 	full = empty;
@@ -4839,24 +4856,31 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 		else
 			barn_put_empty_sheaf(barn, pcs->main);
 		pcs->main = full;
-		return pcs;
+		goto out;
 	}
 
 	if (!pcs->spare) {
 		pcs->spare = full;
-		return pcs;
+		goto out;
 	}
 
 	if (pcs->spare->size == 0) {
 		barn_put_empty_sheaf(barn, pcs->spare);
 		pcs->spare = full;
-		return pcs;
+		goto out;
 	}
 
 barn_put:
 	barn_put_full_sheaf(barn, full);
 	stat(s, BARN_PUT);
 
+out:
+	if (alloc_new) {
+		spin_lock_irqsave(&barn->lock, flags);
+		barn->nr_alloc--;
+		spin_unlock_irqrestore(&barn->lock, flags);
+	}
+
 	return pcs;
 }
 
-- 
2.56.0

