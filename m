Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.218.115.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906136;
	b=tNhPT23fNa6h8v3fcdGPFqs+muu/7pxkdjYmd3dF2DZmWtGgxHnnfBsK3hJRWqlU/jNj
	 SJLySRuhSnsfTldXB7qS8hssBAJ9HnPHBd016xJhuPV3Gp5k18lTcxGhDTwM51CGGQ69g
	 IkQM4MfEBJFDc4XC1Yvw2SXx4tc7ADMKT71fR4m8Om/nmBaOlEea6bKOkWmrFvwA+3dnh
	 8UZzve7KdMpXbcX0Vb9RhjhjzdgOACiGExFi3eAUq1h4ovAA467VHusiXFWaHgdfENcBl
	 gX+uXP58aRJP7hz38djntrzeuGZn+Us9qm2EfS0OBFMqjlhjKmnVyT5jExGk35VMa1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=SmXGLtwdL6+xdqj7AXF13PSOAqPEIyOh4wlNcIxilCA=;
	b=e3FbWOdaQJUTxmd4n4l9Z8DMke0x8fIDse8a75lI+sJrnDMNuv4OZrxiNGpPajY8YlRv
	 M+I7pjweiZ7GgVusx/dWBwXZLG//ngUIHr7YQ4BWqKzFJGpPZwZUbgCK1kbTxIgnDiO3b
	 DSfO+LrxogGK8rW5bXFuUlNr/gGORdQa5itf+l8wF92c2PWK8LsrRkn+t1PrTa8FpUr4R
	 J2xwan0CV8uxOmHx7uA8vBmwm+awqnhGoDaE8q7aDKQfIzsbsUqJ04Om0W0ZDNY4jxYE0
	 ku2wRAmHb4L34AwwUzNywsUuA2RjDH+veYmllwknAAgNq1uU258yYLvtERNtWFkVskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=aanBaxMn;
	arc=none smtp.remote-ip=34.218.115.239
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D0606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E09D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=aanBaxMn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793906135; x=1825442135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SmXGLtwdL6+xdqj7AXF13PSOAqPEIyOh4wlNcIxilCA=;
  b=aanBaxMn4ZG5Styl9Lef5uDoz1WOvx/erg9B+cr7WwW9oOGDV53lYfqb
   4m2gjL+wFr7bET9h2BgRRHUR48uHgC9kSnnAOpafojnJRgftU/ItvrLyq
   /HYtfDDdcAJMdaMJg5wQurUX3L/cEgRxSQGMrpC7ETyeijFZFdnpItZ57
   39Ii5pcU/nx8fAIo3c6nK2PtsygCmkdKn98ZKKcg3S8+kvxQ1K9RZQyj3
   VDj7orYfnnDr58ilkOecC7MiRq8OK73AJh8H3nfz+jJQI/vyoxSC+M52R
   pQ338gA+Lmn/f0GTk+htnK7c0qPinFEVpUiFVgOfjlpoxPHPfHPzC6IYU
   g==;
X-CSE-ConnectionGUID: A9nJ3FyTRwKTVLb6rXkvPQ==
X-CSE-MsgGUID: iG9TnQSaTA610vgUlcmtWw==
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="33012070"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:15:35 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:19730]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.238:2525] with esmtp (Farcaster)
 id 40b2d56e-bfa4-4cd9-86df-f52e0a0d2fa6; Thu, 5 Nov 2026 19:15:35 +0000 (UTC)
X-Farcaster-Flow-ID: 40b2d56e-bfa4-4cd9-86df-f52e0a0d2fa6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 5 Nov 2026 19:15:35 +0000
Received: from dev-dsk-mkbund-2b-9ea2efba.us-west-2.amazon.com (10.2.100.138)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 5 Nov 2026 19:15:34 +0000
From: Mark Bundschuh <mkbund@amazon.com>
To: <akpm@linux-foundation.org>, <muchun.song@linux.dev>, <osalvador@suse.de>
CC: <david@kernel.org>, <jiaqiyan@google.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, Mark Bundschuh <mkbund@amazon.com>
Subject: [PATCH v2] mm/hugetlb: add htlb_dissolve vmstat event
Date: Thu, 5 Nov 2026 19:15:08 +0000
Message-ID: <20261105191508.1021974-1-mkbund@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Memory offline and memory failure handling dissolve free hugetlb folios
and lower nr_hugepages. Nothing records this, so when the pool shrinks
it is hard to tell whether that or a write to nr_hugepages caused it.

Add an htlb_dissolve event, counted for each free folio that
dissolve_free_hugetlb_folio() takes out of the pool.

Signed-off-by: Mark Bundschuh <mkbund@amazon.com>
---
v2: say "takes out of the pool" instead of "frees" (Jiaqi)

v1: https://lore.kernel.org/all/20261105020324.2011790-1-mkbund@amazon.com/

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

