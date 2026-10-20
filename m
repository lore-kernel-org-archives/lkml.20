Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490642;
	b=xbPXQgeqT781mCo2gH47hLikU2sOzQSKRlZ3sVylH8EgGA7svjaS5yp5LXJivBW90V13
	 HNGwiWH/e/Sj/w0l6Xf/recRWUUTKsPKbO7T7ioWTgkLkDGIrTtLavvTNWpbXDNN6pZva
	 MJ3RKbi5fRqej+xtMGwS/9psH7va2aUor2o+MBypmkNoKYIBnAju/PK9qIBZQTqPYsFhi
	 oU5pXogPyMFEfnEeFjb23gm4ZMnZMcsBLCCNUutXXoNj3Q9kEiLxR8xXatipeLiQfLePF
	 TTYQ5tqc51AF5azgiDN4XSSFgc2J2fRJq/dz+eoUrCN0Vzd0+xD1MOlHo5cG+An2SGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2xqJ7ego2cIVHaasX6cs9qwWsOg7oxEQGC5sNjYglzs=;
	b=EvcIvqP+p4QGprWcJk/W9FYnCnMZSFeJgoAFTiDKWBtRMa2aKr7HcrfrF+l+9SZzeLzp
	 HTJ26uspNDKJpY+Yd1yW1mjB3VUi1q/KSHs7fiNRrzUIx7n2Vj0mKrXaO25lt6epdughs
	 rXAZWi+8hbbad43sqOMGH97NdPj+5q262WIWPzqu/EL8IibTqsrtJOXEWU7b1QIej1nuo
	 dbqZ8nAUzQ7MzgRj7aS71Subzs4sGu1WUH6OplnDg0V953r4VVJnllOxqICDdj3gns8hN
	 DBTatsAKFKxi7UDpZ9VcwkD/vp8QL/u3KUm0V4BP18jDIHlcDmQDdc68HRPIwJlWz5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KcqkG6m+;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F96606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F96606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KcqkG6m+
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so2598413a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792490640; x=1793095440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xqJ7ego2cIVHaasX6cs9qwWsOg7oxEQGC5sNjYglzs=;
        b=KcqkG6m+FddXShT5NFcDWmnYQ0y0/jNU3IWdqux8C9SWGppxNhdg7QA4Wy7YdGot1y
         zUgA+Rz+0JmMN/Uu3eSYc2j5zKpkW8Px/4Db5rl4225rLqyb5yt4IvbdupYzPZrhtms/
         nfeLUZO03blFdLiLVm9l6viLKLjWpuhKNKz2no1Aocv0kIdy5asxv7ZNb9qWfBmj3Gvr
         FLyDZ86MrWswryX4hGbktY/t5aBw0YZYZg9/SToU6N9a3xCGyHF7kcOxFw7OqEmjnfBf
         a4VStnOc5jrB4COpFBZd/4644x8xJ0DsFrqVru44apl0Hr831a7nhRy6b+YrFWcv+CWG
         cMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490640; x=1793095440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xqJ7ego2cIVHaasX6cs9qwWsOg7oxEQGC5sNjYglzs=;
        b=N3IS9Q5HHydc4aIV38/RX8Ta85+ChaOZ60UYJdtcxifMIvZdUds2sHbQ7jpyNW9OWm
         FWG0zbUs9DKiT80arQpcxXsIGHxTPzl04RnoPkOTMdeCUiXBOdGNBVKQ+hnpnQ+WvQJJ
         O6Og3NmK+zL0ghHlXRkt99xKIAjr9Wp5TpJKuZSB54aO1J6hEVJxSuovbIq9S2iweEfd
         pA9xU8c2jRRaTZlrUIPbx52gV3fxKEk1MUvLgEHK/QcC9PsECqUxTqpHunHUuVL2IcX7
         LqlKUpwDss1YnsLbP0LHQu+ezGRDduLhMRxMRd9eETfkK3XduRALJdbhAlPP0dOiAXNl
         Xb/g==
X-Forwarded-Encrypted: i=1; AKwUvBzJwsOrr+zeZEpUq65qAuo7lV7L9Ye1SU0EE5K1OqTOanEw1BF7jpSaW9B92Edla6ESnXayL6GXoee1AqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7GQ+9XRDE3W9M1YypNjesDn+CYelop4lFJNcXzWaktqet8NA8
	6yliHhxSNoroYDJkguMT3e+/bcSIEkcRKdPI9QsOt+0OFzK+hrxmN49u
X-Gm-Gg: AYBFou1bT6BfLe43ZikeLvcnhEJw5sw1XYn6Ey3mmBTDU64cEwV3CBYgeUHrfIeFLbG
	vt0QbD14EbmLiEFjZpq+9a8xH6GgIHIHgfz3VToLfIGr3BG3CUYudTca/b3VBfLjC20jgkC8j3v
	EMOJA9wpJS8C5X5nelkQNL7cCcqzh+4qyJnzubEvaSL9wZzq03qUgjR6qZmH5zkiosveQDFANzv
	dsKC8g0esQlucN398vaZKXW1Gl9QwjkhD66/OM2MBhtatEz1EepymVsey9/SwgV5b3gA7ndlVpz
	lmGfa+chKLGIV5qRuzyghxDImkgtvwzq+ulLChUIQEGaI9DPYNvd5Muy+ouJLudcERaS7U7Qe5b
	v001oZ7Gx+pITy945cE3+80PhIO3mpUR1Chvz6OJUXexhYzVNmlZA3jzN13mOU92RoqrBQK2j7m
	nzaVhfvMHvZkbrldmzlb+NTlLcOx6PJCL59KNpsIT27VigQrlSL01//Dyx3vU0oc7F4WIRV8x8C
	QJQY3+v4uk=
X-Received: by 2002:a17:90b:582d:b0:3ab:c674:cad9 with SMTP id 98e67ed59e1d1-3acef519dddmr9226879a91.54.1792490640339;
        Tue, 20 Oct 2026 03:04:00 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5c72df56sm3203446a91.0.2026.10.20.03.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:03:59 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	tj@kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/hugetlb_cgroup: prevent use-after-free during cgroup offlining
Date: Tue, 20 Oct 2026 19:03:45 +0900
Message-ID: <20261020100345.1677643-1-4ncienth@gmail.com>
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

A normal hugetlb charge obtains the current task's hugetlb cgroup with
css_tryget(), charges its page counter, and drops the CSS reference before
the folio is committed under hugetlb_lock.

The task can be migrated while the allocation is in progress.  If the old
CSS is then offlined, its final active-folio scan can finish before the
charge becomes visible.  The allocation can subsequently charge that dying
CSS and commit its pointer to the folio.  Once the CSS is freed, uncharging
the folio accesses the freed hugetlb_cgroup, including its page counter and
per-node usage.

Keep the reference acquired by the charge until commit or cancellation.  At
commit time, while holding hugetlb_lock, move an uncommitted charge out of
each dying CSS to the first live ancestor.  The hierarchical charge already
includes every ancestor, so moving it only requires canceling each dying
CSS's local count.

This orders commit against the offline active-folio scan: either the scan
runs after commit and reparents the folio, or commit observes the dying CSS
after the scan and selects a live ancestor.  The retained reference also
keeps the originally selected hugetlb_cgroup alive through this decision.
Reservation charges retain their existing CSS lifetime and are not
reparented.

On an unmodified v7.3 kernel with a 128-page 2 MiB pool, a
capability-free uid 1000 allocator racing administrator rmdir reproduced
KASAN writes to a freed hugetlb_cgroup in three of three boots.  Controller
disable reproduced the same fault.  With this change, 5,000 rmdir rounds
with 1,075,055 successful faults and 2,000 controller-disable rounds with
1,707,348 successful faults completed without KASAN, LOCKDEP, page-counter,
or refcount reports.

AI-assisted source review was used to identify the race and to help draft
the reproducer and fix.  The interleaving and the resulting allocation,
free, and use-after-free stacks were verified with tracefs and KASAN.

Fixes: da1def55919f ("hugetlb/cgroup: add support for cgroup removal")
Cc: stable@vger.kernel.org
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 mm/hugetlb_cgroup.c | 43 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index 3fb41311e4c7d..1e0dec070b05f 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -310,11 +310,10 @@ static int __hugetlb_cgroup_charge_cgroup(int idx, unsigned long nr_pages,
 		css_put(&h_cg->css);
 		goto done;
 	}
-	/* Reservations take a reference to the css because they do not get
-	 * reparented.
+	/*
+	 * Hold the CSS reference until commit. Reservations keep it longer
+	 * because they are not reparented.
 	 */
-	if (!rsvd)
-		css_put(&h_cg->css);
 done:
 	*ptr = h_cg;
 	return ret;
@@ -337,9 +336,26 @@ static void __hugetlb_cgroup_commit_charge(int idx, unsigned long nr_pages,
 					   struct hugetlb_cgroup *h_cg,
 					   struct folio *folio, bool rsvd)
 {
+	struct hugetlb_cgroup *charged_h_cg = h_cg;
+
 	if (hugetlb_cgroup_disabled() || !h_cg)
-		return;
+		goto out;
 	lockdep_assert_held(&hugetlb_lock);
+
+	/*
+	 * A task can be migrated after selecting h_cg. Once offlining starts,
+	 * redirect the uncommitted charge to a live ancestor. hugetlb_lock
+	 * serializes this decision with the offline scan, which reparents
+	 * earlier commits.
+	 */
+	if (!rsvd) {
+		while (css_is_dying(&h_cg->css)) {
+			page_counter_cancel(&h_cg->hugepage[idx], nr_pages);
+			/* The root CSS never dies. */
+			h_cg = parent_hugetlb_cgroup(h_cg);
+		}
+	}
+
 	__set_hugetlb_cgroup(folio, h_cg, rsvd);
 	if (!rsvd) {
 		unsigned long usage =
@@ -352,6 +368,9 @@ static void __hugetlb_cgroup_commit_charge(int idx, unsigned long nr_pages,
 		WRITE_ONCE(h_cg->nodeinfo[folio_nid(folio)]->usage[idx],
 			   usage + nr_pages);
 	}
+out:
+	if (!rsvd && charged_h_cg)
+		css_put(&charged_h_cg->css);
 }
 
 void hugetlb_cgroup_commit_charge(int idx, unsigned long nr_pages,
@@ -419,15 +438,17 @@ static void __hugetlb_cgroup_uncharge_cgroup(int idx, unsigned long nr_pages,
 					     struct hugetlb_cgroup *h_cg,
 					     bool rsvd)
 {
-	if (hugetlb_cgroup_disabled() || !h_cg)
+	if (!h_cg)
 		return;
 
-	page_counter_uncharge(__hugetlb_cgroup_counter_from_cgroup(h_cg, idx,
-								   rsvd),
-			      nr_pages);
+	if (!hugetlb_cgroup_disabled()) {
+		struct page_counter *counter;
 
-	if (rsvd)
-		css_put(&h_cg->css);
+		counter = __hugetlb_cgroup_counter_from_cgroup(h_cg, idx, rsvd);
+		page_counter_uncharge(counter, nr_pages);
+	}
+
+	css_put(&h_cg->css);
 }
 
 void hugetlb_cgroup_uncharge_cgroup(int idx, unsigned long nr_pages,
