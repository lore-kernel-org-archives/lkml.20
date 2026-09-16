Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2764A5C5B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551142; cv=none; b=ZNVeMtcwt+RBILzKOjl9sxZ7RzeaqRbQLaKhusTuq9E7UoO5oSZcW4ZQYFkrmSZEZ/MeF4aTugMs06AqCf0Je+kOP713H6hmwPfLT8bpflL+CZWbBMjxTWv6YoYHaHMyUUOKLHBcz1v4zb++4DQuN+D99ooeRDh6nPbYybdhmAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551142; c=relaxed/simple;
	bh=rm3iqrDU3ML5D5v309pWzhdg4yXMwkstkKS+oIbSZeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HX7xi7NRpzCPWMLAA06zvBEDFoegcsOitDEGH9loilYOppfp7WANpS/pIZqKeTlZjgIMFthLTRw/ZfCOmAOqfkU6QsLg5zUOfqevBU37Th+XeVH/++Qato37RrDdRs2LyEMQFlaChk/BzoWrRx4XJmretELN2KnHhTBHzLHkXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=lYA4tGDu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M/lfS48w; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="lYA4tGDu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M/lfS48w"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 9AE901D000C0;
	Wed, 16 Sep 2026 05:32:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 16 Sep 2026 05:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789551126; x=
	1789637526; bh=062VynHgCC8xVPC31q5/ECQim7w7ZN4PLXxFdT/y61M=; b=l
	YA4tGDuaEUXdSshUOBQpg3ITJw+gJfPUgJKndiA5HJok4wVPE0j1y8jR29V1A7xI
	mTCDuV3oWwpk4mX4BSPv0Pn59ZIb+lnbWWvM981rrrH75Z7PHdBN+c1+3Y0+LWi8
	hwqPghOZ0mrukMSgaq6+sKvY6NVtaJfCk4sDUNt52vsKiFdnBq/WhlG2vs8Cp6Zj
	qAiKbgW5RXlpTgsJbZhV85h+btXre8hOYJimVooZATFVQ3LCH2X1W5uBX9bxCS1R
	AEN1oRzp0Zb9Xsfs2cmmxWd9ksStBmYf0FyOnLZIAOfVFKNpsAITHtwU9urVL5TT
	cUxfwG/td7y1LX8MmeRsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789551126; x=1789637526; bh=0
	62VynHgCC8xVPC31q5/ECQim7w7ZN4PLXxFdT/y61M=; b=M/lfS48w1vBKqGkGG
	Xy0GzfOd7uHnXGTWI1kYRTko4zSYLmvTQ/8JEv1Pdci7dC3U6XZG+tROk8MXxszJ
	RS/lYFft4QOzek1cPY7Ge7tZmji4DMS6oc0isresHnIVVsNA4Bmn8gQEDAareaDw
	3s1jIh1685Zn18D68dhYe8MiqdGrgDHtSyCDuD6/uU1iWkaCZeqLLu+92LhjMaTc
	QF6nmr9YNxVYZuPKh3qk4Pb+RfKJzOXL4zGu85o5wUr3VqNDLfTeR2RWF2Xjtgie
	BjeL2QCubnKsImz83eMv+rzY6IssvZGh+1RHxwLmRdQACdK4a+yvoE2mfHj3Rn52
	VNWzg==
X-ME-Sender: <xms:FmKqavZ7iUGHwKf7t4fLZ3eeNFY3tQlAkKmn5KF5DUt4iDRkpN8w8w>
    <xme:FmKqaqWK9VDNINYNAGEgYeAjPjlVccxyQJ-vN1G5Hax6YMRYg2f5OjXgvhFAvyftS
    Yty5mCH9g3QapQEjkg2SXb46LU4WKd1b0YaSdQyGQXtoH1kCoip7LE>
X-ME-Received: <xmr:FmKqaoHiGbyvTv85w2ax3Az9V_0WLiBBAmYYpm6SFOPiDOiJihEW_TsPntU>
X-ME-Proxy-Cause: dmFkZTEOpyDQEfQMjLyldXBPAs1OiAaYjuycA/zprc2XA0sZE/gLY53LzRl6wisjmJsNcj
    shXh7L3amtO3W7Dj4gJ1brhV8efHSvbbvvisq8qNCVrU/hVVqWW2fJ8EDoeL9EfJt8J4fa
    r63UA+S0A+UN3c16swmwWrTj5sK0gOy7RYH1CN+xe4D6TTQ1ncSXBFkweWqSBfk0S52Say
    Dntsl8DI3TlZwS0igZd1iO+ltDo9n3qHIbwcYcvcbVUlu6Rxag/XK6s48+7ZTTYlI2aJe4
    hkL/jN/KxntOAh39VLdXeraBW39brB+PkStvfnz0wMlwqVlAhF3nsCCzTv21LQWeSF/iJl
    lc3V5TABAj6mTg4ACFiNaYBUz8Ii5DwjGy2GmhXthAfksiDj7e70MT3WpdoHVOuJI1O8Qm
    E8NFcOwg77uMOoboAwIwRFbkhNYYpy+NvnBA+GtXFqiw+RNCVT+uCpatG2VsXQn1Z/liYj
    9GiuycSPw1uxc/sFOEUyq/kTFTl8tSgLdCzpbE+8A002Mwn9A00DlApggnDWYU1+5Kcjig
    XVgS45Kf2ceX/eI2JYS6H55MiSAxmF5DMAvd8iiKw0nLeBBVSMANNUgq6MlCA+tk1Iptix
    DikWe8ZMtvSRRy+crQHb1ebR7xk7I68EDh/Npni1h6aiblqQL5dW1nfQ5F9w
X-ME-Proxy: <xmx:FmKqasAvFygUsChjTJgYRs9cPBqkVEB1OZ9-NwlnxUIEE0QRYrHYeg>
    <xmx:FmKqaoyHhXjlVPfPlkFxVOX3qaQc2qt4a0METJQfuaxZOQ8KViKd_g>
    <xmx:FmKqalAa20JpAxodoELlkKOxprtGwfnGq9JR9A6ZqNKGEYay_sXX7A>
    <xmx:FmKqapAzTT2qfNRrTtdFYUftEcAeSCTau4IVw2_9xK6jvoCiyUNn_A>
    <xmx:FmKqanbs2YAgfp3NtGJyCaIqutSIoejsNtD20YkaJtWtFk3FocEBpXKB>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 05:32:05 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v3 07/12] mm/collapse: name the per-table scan reset for what it resets
Date: Wed, 16 Sep 2026 10:31:34 +0100
Message-ID: <20260916093145.4022188-8-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916093145.4022188-1-kirill@shutemov.name>
References: <20260916093145.4022188-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_control_init_scan() resets what one scan accumulates: the node
load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
every PTE table a scan is given, not once per control, so its name points
at the wrong thing.

Call it collapse_scan_reset().

Preparation for giving a control a real init and release, run once each
for a whole series of scans.  Two names a word apart would then stand for
two different jobs.

No functional change.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 62bafe509bb7..ff1756c1255d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -550,7 +550,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 	}
 }
 
-static void collapse_control_init_scan(struct collapse_control *cc)
+static void collapse_scan_reset(struct collapse_control *cc)
 {
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
@@ -1579,7 +1579,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		goto out;
 	}
 
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
 
@@ -2657,7 +2657,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 	present = 0;
 	swap = 0;
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
-- 
2.54.0

