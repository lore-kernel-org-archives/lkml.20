Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844218;
	b=XHmCqVFUbUiWqXyVgpdnsbiI0baNt3qFzebtVI7FT86/V8kEtM2rbogD/d4scdkBoYmA
	 OLZfGPDHW6Jl9V1xNx/k8OUnT1uj9N8ZBbDcUtUfoSSUT9xrWM8x6c2S4xPr2JfE7rZsa
	 FWi3adMmUCNtKhbqqPjzWUkW9iBb4OustII9LnEoSRQDCdcSka5w5zlVpK8hEAl7RPa2F
	 RUZGvWZSu9lVnIFW/Mo61T+0+4vV8cE4MGJ5KWpFAINRcydxOEy0OR2wSH04L1wYshoYL
	 5IcWuIupyHLjqXCXCpoZAZL7LWZzIpZQNi18J8B7rmiQo49KRDCKoyvARloFPYgsXZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=eflx9XqhEV3/ZTNgjoPHerK4VPtqVw/r97L+i6RFMns=;
	b=46/3I5oNbK18YD3gR2zA/xsFrPcyQLi3GyTIKK02IYzTCf3pd8OzLZPNmSrPFmcSyTjL
	 jZuzQscwKEcsqJxw1Hl/6WGPXR62dYZ6qU9W29qkYLf142KdM5IkS/7CqfGdvDcKtemlK
	 cgZOcMc6zvLj4WVWsWpbb2Q8XaS+NpytYp9rXBxELVbUQfhz90MMGWM0S54IvwdKf7dE5
	 HgadDksDGAAgThQ6IMCtxxKoagzNf5T0WchL6nvBDx4ail7cY45KUYvG/b5DciHO90nw3
	 NTASPUizp8iLsjPhcw6Wi9dF2eIKGb69jPSuX6HWiWWlcooxp6yhePvshs9y75dQdcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=J0ZGIAjR;
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20079606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20079606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=J0ZGIAjR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793844218; x=1825380218;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eflx9XqhEV3/ZTNgjoPHerK4VPtqVw/r97L+i6RFMns=;
  b=J0ZGIAjRHh/4jCnY5z30xzqloSu5s1fjs/4HVvaI9SMB6/qjYXchT5yV
   mRBh1AQkFx8ideS9HhVEXMhiYjAakpd/8ovK645cnhhGq5QpHbxUBLwsw
   BT+UfO+7/ct7fE56KSK2v41hs7ExQQ6QYWYWFM83DNuotXeBk6IJOdUVb
   3owzpW21CCuUDFHDvjf80Q8nOH57LOKhoo3Hl1CcCh8YwsIR9o3kVAlmP
   jZL+i7wV5z9MOtw9cy8vleLJE0BcL3Dui1Uq/sZgHRFxxqQa4JEqdipRY
   zt1GNi5O9d80Vk1DE9q5BleCCzta9IOzaMDiQ+yldAO4MhyJG8eOAfugt
   g==;
X-CSE-ConnectionGUID: S6rO9Zl3Sbm5H5aI4IU+0A==
X-CSE-MsgGUID: tRYFQKC+TSqbxuzvWRnbuQ==
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="33148998"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:03:37 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:29615]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.44.23:2525] with esmtp (Farcaster)
 id 14ed1291-e131-4989-ac80-723dbe224752; Thu, 5 Nov 2026 02:03:37 +0000 (UTC)
X-Farcaster-Flow-ID: 14ed1291-e131-4989-ac80-723dbe224752
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 5 Nov 2026 02:03:37 +0000
Received: from dev-dsk-mkbund-2b-9ea2efba.us-west-2.amazon.com (10.2.100.138)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 5 Nov 2026 02:03:37 +0000
From: Mark Bundschuh <mkbund@amazon.com>
To: <akpm@linux-foundation.org>, <muchun.song@linux.dev>, <osalvador@suse.de>
CC: <david@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	Mark Bundschuh <mkbund@amazon.com>
Subject: [PATCH] mm/hugetlb: add htlb_dissolve vmstat event
Date: Thu, 5 Nov 2026 02:03:24 +0000
Message-ID: <20261105020324.2011790-1-mkbund@amazon.com>
X-Mailer: git-send-email 2.50.1
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Memory offline and memory failure handling dissolve free hugetlb folios
and lower nr_hugepages. Nothing records this, so when the pool shrinks
it is hard to tell whether that or a write to nr_hugepages caused it.

Add an htlb_dissolve event, counted for each folio that
dissolve_free_hugetlb_folio() frees.

Signed-off-by: Mark Bundschuh <mkbund@amazon.com>
---
 include/linux/vm_event_item.h | 1 +
 mm/hugetlb.c                  | 1 +
 mm/vmstat.c                   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 2628ccda076a..822fe862e5b3 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -71,6 +71,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 #endif
 #ifdef CONFIG_HUGETLB_PAGE
 		HTLB_BUDDY_PGALLOC, HTLB_BUDDY_PGALLOC_FAIL,
+		HTLB_DISSOLVE,
 #endif
 #ifdef CONFIG_CMA
 		CMA_ALLOC_SUCCESS,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index da5d04edf7c1..7c79523b2a3c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2047,6 +2047,7 @@ int dissolve_free_hugetlb_folio(struct folio *folio)
 		}
 
 		update_and_free_hugetlb_folio(h, folio, false);
+		count_vm_event(HTLB_DISSOLVE);
 		return rc;
 	}
 out:
diff --git a/mm/vmstat.c b/mm/vmstat.c
index a3e809c57f29..6282eef7074a 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1397,6 +1397,7 @@ const char * const vmstat_text[] = {
 #ifdef CONFIG_HUGETLB_PAGE
 	[I(HTLB_BUDDY_PGALLOC)]			= "htlb_buddy_alloc_success",
 	[I(HTLB_BUDDY_PGALLOC_FAIL)]		= "htlb_buddy_alloc_fail",
+	[I(HTLB_DISSOLVE)]			= "htlb_dissolve",
 #endif
 #ifdef CONFIG_CMA
 	[I(CMA_ALLOC_SUCCESS)]			= "cma_alloc_success",

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.50.1

