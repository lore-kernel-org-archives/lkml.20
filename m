Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69142E40E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838518; cv=none; b=AmtlZUDam5eViGfiuByd0s6Tn6+ts7OI+9gvJUbLTFGNo8LmbPUD0W62426yebSVFf/VEfhkFBup/VMCOVymyS6xPwxAjyav5ZmtUOaTqSzgtK4IcMmsDvuQhhSTRvDyzyQH4044VaPisBMBRVJzhwDrAyrluO59g4FfXtYnluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838518; c=relaxed/simple;
	bh=FqN2Oq8OSwYSRwvXe8D/xIiMKP0E983eVJRjmt3gZoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N90iCqPzS9DH/jfPVznfDg5ZInk5cnCm7DFHiSHWaYTxP9vQ8sEHz5VV5eXU/fzxtDMCFhE7UOsTVh2YDsMnY3UTfQegJIzWl7neXXB4JXcODt+V+F6zXh+a2qIuS++hN/CbBYCa9gkA0S4F3cGoSe8/ZVCb2XIqaemZzaaA460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Y6vdWMxy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Y6vdWMxy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso20158605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791838512; x=1792443312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+9SFNU2toYET7V9kae+GOxpqVvlHel3XOqT/2H6Lgo=;
        b=Y6vdWMxyzMa91z635rX9qqkyo6p5RIbEdqTtnwCpAcyviCUns/6dVoeZX75vsHTA4H
         olA6AvNVdUTpfGZA5+NYeQHzM0HWKaAGxNWKQj+rAOgQwS2/yPpBnG6yETGmviL9VWB8
         T4Q6apipkn82riAjHxJw7omCkqEidorQWcQ/9EfFlp5qrkid39dPhluDJrzMzFft6BEg
         dzgY8rDIMGQR8s/AL47xSk8gMoNsmymQrkMZ2t64ywgNsS/6sz5LbF27b85cDinFtWW3
         EqyeCaEt7wvEP6SdjZZvfKETFnmgmCRuJhKDYIwH+6PArxMjZfNMZYP1vBiThrNEbJEN
         bqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838512; x=1792443312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+9SFNU2toYET7V9kae+GOxpqVvlHel3XOqT/2H6Lgo=;
        b=D/YqSYdMdmIxt3sTuaxqlktPTc1rvNLS/y79dz9Vtl0KPw8gdJHHzOuTqsnrsNWi53
         2UNAG567f6JcMsIvLOsCDhXKAlme2EIUcCE1YDWjb6Fq8Cfv5egZr3id7DSHahh8BKkA
         LSI9Vz7qaq6vSjDa8u9BiPsYpRDqq9XEOFMvyDD5XmXPpcISUCspLOye2RnZydu6yGXm
         5UgQU+VyGcTWYJ8r+rY098L0u1W+FGCOI3D/1Q0+gM6wVnhYPxCpPIHEwfqfZGMXfthp
         87BC8MHAzQmt2qHrMOXQF8bypE+0TpIfbVWyFIOAwUN/X9GsuzymSnHe5epgWNoo+OUE
         pKvg==
X-Forwarded-Encrypted: i=1; AKwUvBx9ImC7Is5WRRRcnYm4YdBEqFaTx36WikKPaxfEfL0p67COP92KMJ4smLw1H+b6Itxv10NHl6rkFUVOgWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv1l7Qdzexh5bdVHf2Xqgw/UH2dqSuy+NVRQHw0FFFAQyX6N/p
	1dmFg9w0IgOp7kseZ0zxHd+N9+V6R/kTCxM05cZHDgsLpQGDdA1FeZfsj+NnVBPCTwU=
X-Gm-Gg: AYBFou29hc742amS3If0LUkGMs1uAz8L6BluQqJnKjkPHRW++N91MxWAhnVmaumMDrw
	7uwgO4RJcAbeL8EBjVxuLd0nsDfsapYN+nIgSpZ/WadvHC53reDm7i0pCxJdGmvyvya/E7qLNYa
	gQzrYbHl9P/G3xBRXP0hkp3EUhxPPKqbZDu4xtvbdsaJkCkRWbVsoK3s7geZ7GTCxqnQFEk782S
	IVV5AK/tfFWXGrbM6POsgFUhneOdfMsOOzKnpQ3ZeOqqTsrWJlO42GiSJsnForZOy+fiGC8MBYY
	jwjiy2wrkVWBcrfMZBhGTq1cU66WOz9N7Tf9fy/KV9a51mA1xB8EJ5srxTfqH16S8fDi9wmKdkv
	nVDVD/H3B7ULqbZPISEHJNubfOy4w3/xe4pu9NVkAttdVgeY0PkcEUp1BEewX1OzV7zsd0Pc4cB
	qbvvtczyfgPG1IYerXesqWjqN3zStWXPiPeId24upkbKrvXQRrgBkW0FJHgsdeegNGFNuYqdusF
	MKwMDDbXjpYc1T1m73MsTrUIydCIVUQ4wcTh9zFhiS9gLg2PFigULuEU+ZKOA1O0szJ8u5YdIA=
X-Received: by 2002:a05:600c:3488:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a18e4b8028mr210808095e9.17.1791838512348;
        Mon, 12 Oct 2026 13:55:12 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm1895744f8f.0.2026.10.12.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:55:11 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 5/5] mm/mglru: reschedule between memcg reclaim attempts
Date: Mon, 12 Oct 2026 22:54:47 +0200
Message-ID: <20261012205447.2717801-6-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012205447.2717801-1-max.kellermann@ionos.com>
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shrink_one() can return immediately for empty or protected memcgs, and
try_to_shrink_lruvec() can break out before reaching its
cond_resched().  A scan through many memcgs can repeatedly rotate
entries without giving other runnable tasks a scheduling opportunity.

Call cond_resched_tasks_rcu_qs() (as the existing shrink_lruvec() loop
does) after shrink_one(), while the memcg reference still pins the
cursor and before reacquiring the RCU read lock.  Also call it between
bins and nulls-marker retries, covering scans that skip every entry.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 mm/vmscan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 922c59eb9629..c9d53546dc10 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5194,6 +5194,9 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
 	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
 restart:
+	/* Yield between bins/retries that contain only skipped entries. */
+	cond_resched_tasks_rcu_qs();
+
 	op = 0;
 	memcg = NULL;
 
@@ -5224,6 +5227,14 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 
 		op = shrink_one(lruvec, sc);
 
+		/*
+		 * Empty or protected memcgs can bypass the
+		 * rescheduling points in page reclaim.  The memcg
+		 * reference pins our cursor while we yield outside
+		 * the RCU read-side critical section.
+		 */
+		cond_resched_tasks_rcu_qs();
+
 		rcu_read_lock();
 
 		if (should_abort_scan(lruvec, sc))
-- 
2.47.3

