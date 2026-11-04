Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835036;
	b=WwMCzSV86fmn5Yyl3p8mpnPSIdQdEWO1peW22MlV1cI++RFldOzKRlmnvUGFl4rnBwrC
	 mZn1+N4k3TGC2HuT2f6EcGeu3e1dmLhb4TIi39tMlE8Xo03O3XAE/pDKh52EHzI9vHi4b
	 YrZNedutDyAyNIAeSB4fylmCKdIwCJXKfNh9gliFMyET7+0NWJOzc99wnFF+6pVSEFNXQ
	 wyTUBujie+z6V9X2qsfdtKPFlvq5FREabNqR+CITvwQ7AX4PYujs4i71d0k8YDR+OTyCI
	 iLvNwbsiP3gFDCrXc/m2pGWsuOgsoqHPjmRouhMNUvbbYNwKMC+EyEHmuOVtpl9WEtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HXyL3iz4X1JZRSqfChrbLBr2JBJDe4gGCHENjeInkiY=;
	b=Zqdt0hAPEI75xMjE0L7clMDu4B37qzBCJ8fHQXgOIBVVbzINXJB5HTwzRe6zelQofB1C
	 kg6xnZD43R4naKs2lqhFYITF4svXGet3Qo8HSQD3hbLBFVcDOzuyuK6P+VXtX4Im0F7nm
	 Q8uRQQbbJtoT6jOgybkWOjW9/FCTmLHSfON7QIdP2pvjSPCE0/RJ+hLz0OXfmZAeQ0pJs
	 xwQ4fmmENqkluK+YB9e+WFcnUhWYBQ8CzWb63HT+5mga/TYAwHMdiTjaCbC0rA8MhOJis
	 YU3EaBwSMf7MlZGIIctMr9+pOWo4UKk1VcdXMpj5iFMDpukr0oHEyHD5vRo1kXxbB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAydySsK;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C3606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895C3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAydySsK
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b305312e4fso11155887b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835035; x=1794439835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXyL3iz4X1JZRSqfChrbLBr2JBJDe4gGCHENjeInkiY=;
        b=BAydySsKnmSB6IvUnKPQLkN2GZUIFNq9zc5g+hcvSn3YrDvExO3qQQJmXAP/rnN1Nt
         aG+EZYvRt6+oNE9EpvY3xMBc3U60wJSbxSeubT6Ehf2QSBvwVN2dSXa9zaieGu42vRdb
         7OBf25eqaHfkcjZp/GzXIz6/4YRE4NlAFbYKQOX4yeKh5ShcsCNwy8QM3O/9iiVbToH8
         8Q21NSi1SbY06ByPgk411knlnOZDY/bRfPo5t9JomY1ueT6LecgKdvV4eqpFJGsFQBon
         9wHfkjX7t8m6guWnfr+E6whyJXTNpdj0D3e+9FltM7LJpJ7rzZckOxeOroaYucJOp9Wc
         wedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835035; x=1794439835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXyL3iz4X1JZRSqfChrbLBr2JBJDe4gGCHENjeInkiY=;
        b=C7dOqfdNGequCUVOJZ3411giYTcYNHtKqxo58O2l7QPmDvdYwNLLoGTv3yuvyPfDw5
         LbeJybyRJ1D88Hl1m+jwzP0rsXb5eG5tRTEoGIQ4u1SedSk3iLzolJ9JCB0ozJ9P995b
         caGc7MRpxvNlAvwkdvSNgseb2Pb5cg5kZWQey7zJdrG43dMNVgxYioQ9YsmU0DxAV6Jt
         HzfJBu+ivj3ILmVVJVMQcSg8uozrjIziAeXTmwD1mRD1QKIggsxepLRTdln8+vJKRGtr
         Axhk6Y7YA438DNR2CK1bZ15008JBv4iSQMeddbTThcjhYawGcdc4GBKqebjQESNK0lIq
         9lSw==
X-Forwarded-Encrypted: i=1; AKwUvBynvFpZVaRpXD3WBs/0nONU3nlrAIism9Ydrki/w9Gcir2n6OetE49Zji2oGbfGSyZL8Fs2VQ2p4ybp4oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DXJCDcLJ09TVRrnub4CLhjHpMzTpW16m9HzMJiYxRQUFZcO6w
	OAb/WiwCPx0KW2mzT/zfzDdUSzY98Q5E8n+wONBSvfjnRMnHXvLXDGOA
X-Gm-Gg: AYBFou3gCcoFbhxAnG/qtQo+NgKCC5w78rtUAiAz7E8ArH8la3Cwxn1om7Gak3znX+K
	DKlB8+isxE5jNhx87RSHfGV1MPhdg4EpzNHKTwboIAEwuxCm7hJP9Ouy/kej+UKo3XzWIdFdWz3
	c9bQZyAJTseYjVI0Y+n1Kovjdr5ebpcTbhcb1tclPWB1bbjw4YJCzLXPZ+q7Wxis3y/QIfxAPRQ
	0+8S339EzzRkEzSxmoS6894F6DVJAcaQ1IX8r7ULmjw0mgotLrvvBDc2nyUPpiOWRGLipBmehyi
	JBu5xmM9nOGHPPt39fqv/ED2HzkEeJmOxwW1CqiI9IEs0qwiVDHqU7slczFFi6MA6GpbMahFVWY
	WuRk7J10rPD5LU4Bm9XWFOOV9Ln12vhBtrjmtyrcG3rQSMyO6I6NXFcYYBchlXY1JSwH5dpsAJ9
	tpp2dEM4yh/r+Q1MpAYc7B1D7xmrn+I/ka+FJzvjXh0D2/5wAeiBYo8CXcqxZl6exTZ1OllkguJ
	a1cqgLqjg/EXOzIKSutra4zQVQ/2IHUGzwlSEC+Fol6DInKRZ+2Anb1kqbii24Mggv6tlKBkqFU
	UAsMyNw0BKoK+xikoKcKeVYdTnqDw0GEwJXBEYc/P9mhSmhuM7PX4X/f5AA=
X-Received: by 2002:a05:690e:13cb:b0:67b:f91c:109c with SMTP id 956f58d0204a3-67bf91c2553mr1172619d50.46.1793835035335;
        Wed, 04 Nov 2026 15:30:35 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee27bfddsm2429362d50.15.2026.11.04.15.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:30:35 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v8 4/7] mm/memcontrol: check PF_MEMALLOC after trying the limits
Date: Wed,  4 Nov 2026 15:30:25 -0800
Message-ID: <20261104233029.3282438-5-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
References: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
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

PF_MEMALLOC charges are currently forced right after consume_stock(),
before trying the limits, so that they skip memory.high and the
high_work worker can't queue itself from its own reclaim.

A later patch in this series moves the memory stock into the page
counter, so that the stock is consumed inside page_counter_try_charge().
That leaves no place between consuming the stock and trying the limits
for the PF_MEMALLOC check.

Prepare for this by checking PF_MEMALLOC on both outcomes of the page
counter charge instead: skip memory.high on success, and force the
charge on failure. These charges still do not batch, so the resulting
usage is the same. The differences are that a PF_MEMALLOC charge that
hits a limit is counted in the cgroup-v1 failcnt again, and its
MEMCG_MAX event goes to the cgroup whose counter failed, as for any
other charge.

Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 311bc2fa644a3..75b915febb06b 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2791,23 +2791,8 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	if (consume_stock(memcg, nr_pages))
 		return ret;
 
-	/*
-	 * Reclaim may need memory to free memory. Let it go over the
-	 * limits for a while rather than fail or OOM kill. Doing this
-	 * before trying the limits also skips memory.high, so the
-	 * high_work worker can't queue itself from its own reclaim.
-	 */
-	if (unlikely(current->flags & PF_MEMALLOC)) {
-		/* Find the cgroup this charge puts over its limit, if any. */
-		for (mem_over_limit = memcg; mem_over_limit;
-		     mem_over_limit = parent_mem_cgroup(mem_over_limit))
-			if (mem_cgroup_margin(mem_over_limit) < nr_pages)
-				break;
-		goto force;
-	}
-
-	if (!allow_spinning)
-		/* Avoid the refill and flush of the older stock */
+	/* Charges from reclaim or non-spinning contexts don't batch. */
+	if (!allow_spinning || (current->flags & PF_MEMALLOC))
 		batch = nr_pages;
 
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
@@ -2832,6 +2817,13 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 		goto retry;
 	}
 
+	/*
+	 * Reclaim may need memory to free memory. Let it go over the
+	 * limits for a while rather than fail or OOM kill.
+	 */
+	if (unlikely(current->flags & PF_MEMALLOC))
+		goto force;
+
 	if (unlikely(task_in_memcg_oom(current)))
 		goto nomem;
 
@@ -2927,9 +2919,9 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 out:
 	/*
 	 * Don't forget to raise a MEMCG_MAX event for forced or rejected
-	 * requests. mem_over_limit is NULL if a PF_MEMALLOC charge fits.
+	 * requests.
 	 */
-	if (!raised_max_event && mem_over_limit)
+	if (!raised_max_event)
 		__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
 
 	return ret;
@@ -2938,6 +2930,13 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	if (batch > nr_pages)
 		refill_stock(memcg, batch - nr_pages);
 
+	/*
+	 * Skip memory.high for charges from reclaim, so the high_work
+	 * worker can't queue itself from its own reclaim.
+	 */
+	if (unlikely(current->flags & PF_MEMALLOC))
+		return ret;
+
 	memcg_enforce_high(memcg, batch, gfp_mask);
 	return ret;
 }
-- 
2.53.0-Meta

