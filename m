Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635733;
	b=XZyZjBzExW4lJzs25cJU52R8PSvPU1E9qJgDeZQigI/J2WYazkjepW4NTWI4YY1ltHws
	 MjOZfnbPAaDZFeB+GyyL5qOVLCSM+SDWET12m7s95f9PXBIRUdNLWYx7RqivWH98+1mhl
	 oQWO7Lgzq7Y/HoXAuLT9r/FlwU+CAsOyF1uSmqpyW0hOau0qqulTuqwyoYTc7FXorgcP+
	 JGceCNw4tSQWLjUas3J7Py9KVhMOjF2R+qQXPFFrCYSY/oyZE0QnKmHCTMOxTara6YvWg
	 fQq8rK6ehAjxjHwWCApctsoWizj4IXmQX/WLU/c0/T071mMEo8CN244kzt2C4Nq3wUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/vcgmKyU3N8wJBKLGR6NXqrqBGbIingVRqEmBp0Pmd0=;
	b=bOthBz/ab1qfU0sEAK+kqlfYX0MEdxd1pLqrE2x9Lfd3+QxcYcec9euMA62mgNDrXoxy
	 z4Br8Lucs2c9SlWiyv4VFTYMbKFpTg+//Dl1JBdnKXQk8HQymOo0KRcctYwa2QqggqxQr
	 dPMJTR60VXS0cPcQID8Su6+oeuzjthot04AEkWNK6Iu40CxO8WwZSI2vkZj3wwRQNn2Q4
	 SNmE+Qngsk9SznVCpQQgSjYTSPYxfJ8p7qJq+Mbi115BMv8dpIv9Va4FWBLa/9gXJlkNK
	 0lMZdbLH6OROZVHDYaYU5a8+LtH37jv6kRdTpJfMLFfh6T+gkCY83T97m8fkGUW+MOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8PycOzu;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9301606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9301606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8PycOzu
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35943f55c06so583475eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792635732; x=1793240532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vcgmKyU3N8wJBKLGR6NXqrqBGbIingVRqEmBp0Pmd0=;
        b=f8PycOzuoHqsHt9XMwudJkKP7dilV/zrdLicO6TZrc6NettYJkf0P+LgTLjjzakNmO
         Pcr5N+Xv3s33kB425p5aLKJqDwB7qfm3wxfc8M7POF4R8wGFLmNNMQ/DQqGRCay6eW5e
         F9gC1ZJq6q5ICA260meKms8x1E6l7ARthBc8tKTIgeFIP9sJW7ilqrS8l6Bmjcq5+6FI
         qjluXcwq0kL/dtysM6fEAwFNsRigfd2f1WJQ1XI2vemss7q4SHmGP9nZLkE9udwnhekr
         BLrw2rg+OQku1v5lLMiELNcTdFKpQb7HYOKW1JDYWfSGA+V7Fiu23M7In5707INDjYeQ
         5leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635732; x=1793240532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vcgmKyU3N8wJBKLGR6NXqrqBGbIingVRqEmBp0Pmd0=;
        b=i+buJY1PkTDcltR3RkxW1I/3tzCT3XouQAUKkyBFhtV+bPm/RusYDj3ZS7LHvreRtn
         J8TDgFflU7YB0toPeclxQtXfVU4kB9f1Pxuny2mwx6rCPDFWBIy4XxmKd0BWa3xNnOv4
         RZKPhUjM4dft4tnlSibpH4R3I5bWHQTRGwPLcPv8tOdSA/toBUII9z0WwCrtIaajAT4k
         6UaRKVJGRwXVaVRXs8nSTxltJlraFK+Difh/IzbH6VuHyr8RJpaXVjCBQqCJ2UUDPteO
         wS9Ca3UBxt6DUApAUU3rsEi0EZc0Wjnk+25P4TdXcMdF3lNyXXHtEtH0Kp9D3QnN9xGo
         jmWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU+OIAqt27788XoKqjyUho8aXKNaS857W26aqdJ8AQLc3ofgllzYjbXqys6Jg3E0liZPqCpl9VLdYYHLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgMP5O1EcOHe83G3mTgQTGcl0uTCINjp2mJ2icrshD/TTJeeM6
	v+y7IdKdhyFq1B8R/m0+Ppj+7sfZXTAtVmcl0QSO4YuWuGVj4Cb/L+ZY
X-Gm-Gg: AYBFou2+pPtIh+G+CYUC+JO+bBN8TbtXxkVYtuXIYH0VWA1gv8KMAjFSU4+5BP8a4Iq
	IZB+z897ZR2oAve1tPvz9lUMXYGmNDe46dT38s5OAhw3TGQQGPgf37vt9B2YMgfUi82UfpQoX/K
	ZBPJYCvtqmOO/X7Z4350nnnQVJFgTUUPd9eY3aavIr7lln6fFi5nP5iwK6nd/xXTjXo/9JRcne8
	xyly9ue5rfb0WTcddthFsBf5OecOpjzEZW+ZOJwsYXjy1X8DkMAuDDr0g7nOJpVUQlIGTR8wzXO
	pnpofEJ5fY12+vXwpqvMcPVNktTnZrmfTzwgIq7DGqvgtPSvjMx+3UejgSeVfuypE6dad35HLme
	MHxWqYSBXAa4dz7PA1SlCuerGZtdv4ZzZCrrhA1bf9is6sJzbHullbFxa4xw+TLhe8H4jnGhnRS
	2ovaUvr2HgkSpdv1ZEQLUhU74BtCexTXSOVc6NeycGdfb37nwMinBrGBy1yakR7atayIOLTjkiy
	QnXGx/IONsuBF9uniqgnjCf5aOaVwYK40l3dsYRl1PN8KuVZr/yH/UqyZ6OFzFq7Rjds7fUkwoy
	2uugloT86o4p5g==
X-Received: by 2002:a05:7300:d407:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-368b15180d8mr1246173eec.27.1792635731887;
        Wed, 21 Oct 2026 19:22:11 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd27dsm12328555eec.17.2026.10.21.19.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:22:11 -0700 (PDT)
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
Subject: [PATCH v2] mm/hugetlb_cgroup: prevent use-after-free during cgroup offlining
Date: Thu, 22 Oct 2026 11:21:46 +0900
Message-ID: <20261022022146.506005-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020103057.8066217f6f6fc5b3ed84c90b@linux-foundation.org>
References: <20261020103057.8066217f6f6fc5b3ed84c90b@linux-foundation.org>
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
with over 1 million successful faults and 2,000 controller-disable rounds
with over 1.6 million successful faults completed without KASAN, LOCKDEP,
page-counter, or refcount reports.

AI-assisted source review was used to identify the race and to help draft
the reproducer and fix.  The interleaving and the resulting allocation,
free, and use-after-free stacks were verified with tracefs and KASAN.

Fixes: da1def55919f ("hugetlb/cgroup: add support for cgroup removal")
Cc: stable@vger.kernel.org
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
V1 -> V2:
- Remove the redundant disabled-controller check from uncharge, as requested
  by Andrew Morton.

v1: https://lore.kernel.org/r/20261020100345.1677643-1-4ncienth@gmail.com

 mm/hugetlb_cgroup.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index 3fb41311e4c7dc..6921b185726662 100644
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
@@ -419,15 +438,14 @@ static void __hugetlb_cgroup_uncharge_cgroup(int idx, unsigned long nr_pages,
 					     struct hugetlb_cgroup *h_cg,
 					     bool rsvd)
 {
-	if (hugetlb_cgroup_disabled() || !h_cg)
+	if (!h_cg)
 		return;
 
 	page_counter_uncharge(__hugetlb_cgroup_counter_from_cgroup(h_cg, idx,
 								   rsvd),
 			      nr_pages);
 
-	if (rsvd)
-		css_put(&h_cg->css);
+	css_put(&h_cg->css);
 }
 
 void hugetlb_cgroup_uncharge_cgroup(int idx, unsigned long nr_pages,
