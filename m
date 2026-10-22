Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689949;
	b=Agvb91QaDquqjPh4WcknMg63VEaf1Ed5sKg7UR1M+XbF8iMPb6u3qcCQK4nL5VWtN9C9
	 GIZsOIrjnIyM5IHOKDPRRCjnZ+SBzwWEo1aosmjUjBnUDpj8EBv9vxj59tNhjqwFbwV90
	 my5ZeokZiGwkXyQ0rstEFlybOAmvshfgI4+8ZPpOBCY/SNh96Xa3P//jXIvFdvk/Yfuh6
	 EmExLnIuL0NlEvkT84O/S6RZgpghL7zvmTtEHLQDSpwxPMO2P3/q38DQ/KxNKH1RiXsTr
	 k++seKTwTl/yw22O/X2AlggxKA7oiTqFiv0BW/+OnJMbNyKRC9d9+uz1MHtUd44J2CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kg0a1MLSOgMLwF809X6bOKhuG0mJlcOcCErhKY4WjvY=;
	b=Q4+WKjs1Q1OkRBb6o1vToHAn0qceDIpRoR2uGCI9TAm6yfc+cLYYgXfo77MpMpN14I2/
	 Oh/lwkjP+2USOekaEZo4jUBtOljdeM4Kt7DM5TAvU0AxJgmldrgPiOBpg5eH3+lMOT0gh
	 7hhUukU655+wizrVC/ZDD6OgHIGi+SY7yCTCs+xaEnOgmHarS9T+cDk0yfFPyXnccpqbZ
	 pJUQjCP8rfo199gO28F7gPwhT/p6VcwYO45dBtXY8CwVOUbErYzeuO4t/XKFFCHy/jJur
	 Xq+EC1tKgzeoA3YLTJ6F+HTaRzujmUHFcs3EWt6GabFySNqBYbx3swnUrqdgBKxFLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZftBS+UR;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C57606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C57606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZftBS+UR
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0dba37a7fso956797b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792689948; x=1793294748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kg0a1MLSOgMLwF809X6bOKhuG0mJlcOcCErhKY4WjvY=;
        b=ZftBS+UR319TZmKpo6rzDkF+aTGK5VuTr5o7mOXc0fuHAQc0gh0FnRtu6Yo99RrQmz
         juFC8lKmt3s/QTJIIV/xMpiOk7p/K1lpQicA8BbfNcUuvC7viyRi09WkvChraU73WMdE
         nh2ORvHL9qqoFj6ZvqSJHVJ3xFfH2+zFgtjMEuQsxcbfLWnfAvYfQ+lRxWKxSC/wnF1S
         5CjWrwUdPTfZpfdooFza/BM1unPwI200Hn5kc0/AcAtzJS+7guz3rlbzLHnqxqcbxy9p
         KqHh4DtP7BMLNLALpIpcACIQXYPgzja/8gn0WwZH7jJ7IykSKyTdX2pkIam8YAcMBZdJ
         XdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689948; x=1793294748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg0a1MLSOgMLwF809X6bOKhuG0mJlcOcCErhKY4WjvY=;
        b=Aj3WQXHX25RJWqgAidQCiiRVW8fx/YR7XAaUd15wE9QCHzItpRKIquEkFJ06O8Wb5Z
         wf3dLQeP6YJFARnNlZseZu4E+VEJU/YvE6Pc5i9n0ou+4zwGaPsw5lMpb6aAnd3Hc/vh
         mn7WA6+0VDOXWn3wU34Qb2etqPy0YBkePo/lm9NbCpRZiyH+qr8t/ha1SoaaARF39/ym
         +OS13Pve0NvFETTga+Eh7XtrwpulsyLWJg2Kd47M3wlaoKx61X57XMy/dLNiLdxxLjo4
         FB1L1LLnCzpeV5e8A5voMTyGuGobbq+9q5d8jWEZKVFEgabd55TqlsWmTmHLwjVwy9Mo
         1qxg==
X-Forwarded-Encrypted: i=1; AKwUvBxXzjCHop3BvqhU8j0RDrFYcZ83c7TwdXqkvECP3sOA6o/zR5uNHAWk988t6paT6Izy8twQt42QZbpNITI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8CsF5euTV2RS6sQ/HZmaAtflyJVBs7A4xn+rE8uGgBEprUG4f
	gudsktYrsOss/24tF7ZwRv7pAwscAASAQ/IYUDSwI3mEmv92FOPzr5s7
X-Gm-Gg: AYBFou33MTUpa6KrVMwYWBoSNe3jz4mKxmIQ15hl3VOJUKcDDdgYo8n8BsLTehOafdl
	bNXuId/+LFlsFla9g2lFImbB1iI1Kzkstjg4/ECVysMIlCdYlzN6zOQeXHgDk+6ZBTomxr5Ce5e
	Qg6OqpIxQcOjX4bdQgpWLFTJhy5vtlE8tbGthBWWxr43rFK2wWNbRZiQ7SOHqo7bGVi0c4zaZ/R
	XYVNsTU0FDsIWukdpE+8xbibZkRpo7EqadmybwUZ91Je0/VVOaB1pHvIy4fIzFWaToGAm1tjEHr
	P8bXiQVLPHG36fYbXluT/rwuMCmQGbyUxZGLAdK0CQL/eBXs8al0yHemcazEnmHt/bv2+S6Ew+o
	MLJmeTL3Z+C1DH7A84u47m+5VmXraXOxvd54xMRRVLifA+zk9Akk5wg4RJ7QvYalnF/fL15d5cD
	Xo4p05xxpFhQ61hOBbWFS+IwJNNgMrsR6bMoZODayLB4EA68wpz5CuvToMVtlq2tgJ1ZyDKlyYo
	VWP0X6mdO1+cnp4Ub17dI6le8eNcfgQiSFnzJT5hq5Ggxc2YpDLUs5ihipyIotyStJgKflKdpxH
	BSegU32eYT0=
X-Received: by 2002:a05:690c:c673:10b0:8a8:8dd2:f5b3 with SMTP id 00721157ae682-8b13403fd8fmr31788207b3.43.1792689948009;
        Thu, 22 Oct 2026 10:25:48 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:19::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1560cba07sm1495917b3.13.2026.10.22.10.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:25:47 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] mm/migrate: wake kcompactd when huge folio migration fails in numa balancing
Date: Thu, 22 Oct 2026 10:25:46 -0700
Message-ID: <20261022172547.1181530-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
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

NUMA balancing migrates a misplaced folio if migrate_balanced_pgdat()
finds enough headroom on the destination node. For large folios, it then
allocates a folio from the destination with GFP_TRANSHUGE_LIGHT, which
wakes up neither kswapd nor kcompactd. This means a hot large folio
trying to promote to a fragmented destination may never succeed in
promotion even after repeated retries.

Wake kcompactd on the target node when the destination allocation fails
for a large folio. Don't wake kswapd, since this path can only be
reached if there is enough free memory to service the allocation, but it
is too fragmented to serve the large folio allocation.

This patch has been A/B tested on tiered Meta systems (DRAM + CXL)
running identical cacheing workloads. Without this patch, we accumulate
around 4.5k failed THP migrations over the span of a day, while the host
with this patch accumulates only about 80.

Those migration differences leads to about 25% reduced CXL bandwidth
usage after applying this patch.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/migrate.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7bdcdb57652f8..67364fe0851c0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2671,6 +2671,7 @@ static struct folio *alloc_misplaced_dst_folio(struct folio *src,
 	int nid = (int) data;
 	int order = folio_order(src);
 	gfp_t gfp = __GFP_THISNODE;
+	struct folio *dst;
 
 	if (order > 0)
 		gfp |= GFP_TRANSHUGE_LIGHT;
@@ -2679,7 +2680,17 @@ static struct folio *alloc_misplaced_dst_folio(struct folio *src,
 			__GFP_NOWARN;
 		gfp &= ~__GFP_RECLAIM;
 	}
-	return __folio_alloc_node(gfp, order, nid);
+
+	dst = __folio_alloc_node(gfp, order, nid);
+
+	/*
+	 * A node with enough free memory might still be too fragmented to serve
+	 * a large folio. Wake kcompactd to help the next huge folio migration.
+	 */
+	if (!dst && order > 0)
+		wakeup_kcompactd(NODE_DATA(nid), order, gfp_zone(gfp));
+
+	return dst;
 }
 
 /*
-- 
2.53.0-Meta

