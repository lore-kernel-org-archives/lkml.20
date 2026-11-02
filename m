Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660074;
	b=onupHYu6f5vLntRXTOMHnc0xM5avpt6l1DvkFOU0bgv68EIWl6MtckGRC/E4IMMpQsXE
	 AIcLKD4WkJ1WOe0l0faC+TopCKaI3TYU3B1LRDXiT5VDHTRF8mLZOerW8bRj/wNUj2I8R
	 rR7q7BkDIWWnd0moBIaMRPjJeBkVDCciPm1QFXWHqMsxi/C4iv5mnHoWRVFFDoYp4PEZb
	 mnVXCspdoOQDOcWcSH3UM36gjEFQ9m7HwT3j5RTh3lD2B359XxnDu3FekNaeE1t3MmXjJ
	 Q0YaBDpv3t2Sjns38zmJkhxKMyaAZUbWAw1L5ZWm+hRiDKiuzmvhMpgMD5Xc+JL9Y8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+yGLnfP8ZKDdE9WWfyrLXQUXzQI6BTmOLGN0Hnn6wDw=;
	b=4FmdzhY9tVMEmIpQsMu69BrifLj3UzNEcapes/FKYckQgALtE+WO8TZfG3RJ4JGA0KO+
	 MFIilNyjV6Exx8698i2pxH7foS16G0h3262yhv6wYSUpiU+kFe8oWX3lJPcR8C1ylSjIy
	 tfRgx51GDDGkXOBAMetN++iXIlak3mgUiqCM08jZnJ7uuaKlE74ER6swh5BDKAYY4B/21
	 zEEdDz3nmncFh614ehhCd8na/GAif5/xwmwuAAnM1+rf14l/Z4Vygcto2ailG1izEn3gx
	 injj3ds6lgj7GVXrw813ONnmMhVJx564bfIadtDMvHuOCK/CJgYcu4pQN3i8Nw6utng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=dkn7kv9i;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ZOr33Br1;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781DA606D824
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781DA606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=dkn7kv9i;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ZOr33Br1
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LY6Rd3120293
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=+yGL
	nfP8ZKDdE9WWfyrLXQUXzQI6BTmOLGN0Hnn6wDw=; b=dkn7kv9ifrFDyQg7gzi0
	9n825IO8HEtxOakVAmA4Y3ft4TQZt9UwpNzOl20VePZcy1dTDxcOKVwnIe0BUAno
	XW2e5yDLVpUqfw9m6yFh/GKJUy6JfD4+zzjkV3zOv/BsKR3HAE0GM8XCtvU+3TFf
	1utmVN+swcQQkREYm4Eg0AeXx7/XMw0HAudCJokrUdbmOOhbOF4MLNqLV3q5aPc4
	AoUWaO9h1NKKz5uGuhOmmVD+TUFkjB1yZH1lpg7mK778W6kiFnGxoYK8353X8aNR
	Vl3R2Ra4y4pBAoJnFLc/VwmuXkk/2OhHdwECKL6X/ZJqYuHrSSZuke7rEfhIb1rJ
	jQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq1ufh7n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:32 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso595340885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660072; x=1794264872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yGLnfP8ZKDdE9WWfyrLXQUXzQI6BTmOLGN0Hnn6wDw=;
        b=ZOr33Br1ohHrFgEntEFLEIme8YxquiY1MW8Q6r04E/JseGPyNzkAAf7QvG6SddPi9Y
         rvwCfMskmzPotaPAwTH85c8nDXa+I4+4tjNZlXZYXmIvodfAswOksNtyciCNb7jHE97P
         KGUTazkyTGf4B3mxfoS/J+W7sCscA4E0W+7XpiKEZbWbTdvA3j35Z9a6lB1lMzEOvVcn
         3/A4yd3utY75N+cw2ygwIUpwxZBIl7vWUSoO5ViuetbLUursvX+BksRd2BHy6ZUtNSHp
         06oXZxRUWnlXFolfyNZgxz8pgURclfM7vtgrVKsYkple1ju+RiIvwm/ih7fmob3l0/4l
         u48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660072; x=1794264872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yGLnfP8ZKDdE9WWfyrLXQUXzQI6BTmOLGN0Hnn6wDw=;
        b=EaNCyzDqpVEXKT58geeXbtEBcH5ocAr1MNeywVSb4r5rALukdeFHUOBSCIeWv+LshU
         rmofcjSbwYVOxkccAU34VXRpEW/eNPtV6UI+U9GBPYKgwjePzQST05roRmDOwaSCAtHi
         ZuIg8dRv5Hv8UhsERbFTZ5N3QM6O9sz3aCpQQSgOCDdKd0jQzm45VZo4bdEFi/pZpwNz
         j/iBXNaNfTgCirxx+HJt6+H9eB3OObLYMeaSTagHxXcj2NcoUYqUsXbf1wyIfilU4u1S
         hGBqN3tD/7Zj6jQ4F+CiNCWy1Ab+EaDK5YnmCuaOewOsMyg90/VMdYkIsulzoUNiSK+J
         8YmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/5sYjaHuUz6idG093G7K3EBz3gLzj5vvVMBz32YmhJvYh/EiHxbI6oSKIAHT/8u6Gc6q7G8cx38cWtvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVjv3ZjwCMdWsR/F3le7rkf2n8kEW4G620BKfqGaj5sgEFUw8t
	9p0z6VkN1LGQuKx+9gXOjoIcx/yofQT5P1VWNFXMOVOUGcG+WjzIfAdz9h9RDMXDNItU8HcR6pR
	sYlP6lWMDQ44l8v2mugcsNMnbzmlexymkAm+zGGuzilAtuc3jlqZuxUYYMrEF5w==
X-Gm-Gg: AYBFou1TBWuBPERaW6KQwWvneTVE0RLUOYobr/BUmnFYNSpJNmL2/Wl8x8zWmyZXyBF
	Rh9FPWgEd4SIU8ZQQNFcuKw4bWPCKfHFXxGBCmEdX7ForgX5crwZyRnKJTrgfoXrfdkI1Em4BIi
	AQ0mW93ToUy8aSQEDPEnzAbDWjE4I5cqgGE9KfimqP60rDpBIjCP2HWReNI2a0g5T23t3GlCZO0
	w19grXk7IAjajDT93UABoUoXmSI4BOtEjhOkFQYulumjzUlzRKInnMW0qZMR9G4nzbQgPzWvJji
	M2f+UIKHtRAUznLmlgsyL6uL3hE6SEznOH8DiZB7APH97qfB57Rg9KZ/XdT8YZnEG7o8jpR+TyA
	HbQHX81s6Jc+mNchfEUIT9CVoeQFPTEt2RisYuvSm5KZ99ED3lvDcpR3IlM0=
X-Received: by 2002:a05:620a:2987:b0:93e:623d:99ec with SMTP id af79cd13be357-94421744cc9mr1890409685a.13.1793660071862;
        Mon, 02 Nov 2026 14:54:31 -0800 (PST)
X-Received: by 2002:a05:620a:2987:b0:93e:623d:99ec with SMTP id af79cd13be357-94421744cc9mr1890405585a.13.1793660071252;
        Mon, 02 Nov 2026 14:54:31 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:29 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:08 -0500
Subject: [PATCH 3/8] mm: remove clear_page_dirty_for_io()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-page-wrappers-v1-3-e7280bdb31f6@columbia.edu>
References: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
In-Reply-To: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=3173;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7BGChjOxIQhOtitHhW0SVkXy4VnfQVCDC4XS3O7FajE=;
 b=/NiIZEdK4/vHMgmcvSib7+5sqV1U6WoM4/lSQ6/4yiaD9YZKgG+9hO/ypL1c7u1BU+O3PANod
 aXNNjbTDdmlA8KC3CrSFBF/POjFrulEuLLnMes3oZpw5/0KLTpm8dSw
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX8AD4w5lGYOOD
 mpw1UjzI/c/840kGJ27AOoOCfbaf04KnHrdoVELtLUweGCvjJ/juB+QUob4ouXoIGTHK9Ig8Zmo
 VIC5Et+BBHUFgvXspR/cStli9YaYWlNFkVblwixfcpt2TMv855xvD2DTLoPX7ZlzlfJq+ZMaY3a
 FF6rHIgng2OS7i8WWtVrDekVZGI1HXhSCHLeZd0s94znyslSgQvb8GEJ+VHdHhiGXJeRp6AQL/G
 9tOMcCde8WRw9lYqimZvRhNENo0vZ8Mv5uYq4LVC3LSBiHzZBhNA0HMh6DX/HmwU/7FBAmvLide
 FlHBqGdcNRblNDwmSEErhWMSUVI+V7CKD/8zGyM1tXuTWrD2NpzlJJFelYy9M0e8L9d+QcLFHiN
 GEs+hj85aYUgABYCEiv+AfBaOJKnkGX8jdWAIxrFlOZ2EVKfI44yHB8ruCecol+oDckJd1/dg0z
 +U/r/vsz9JaDXqzNEbw==
X-Proofpoint-ORIG-GUID: qDuRL7UNvSjQB4K_P1GO-IKzctQ1muie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX/m7fzouCTiZQ
 /vLaMi3EZXJESbQHuZ9ewQ1O7eYd0OiZbCX3FdQtLXoF+4foCU5SPKbs10W8R/mSVLVADWMGB1Z
 FDRI4ReIRNrkOlGP1tkyPafcfGC/jDRLisxFm6W5OTKR+hVV8wSJ
X-Proofpoint-GUID: qDuRL7UNvSjQB4K_P1GO-IKzctQ1muie
X-Authority-Analysis: v=2.4 cv=SKfXx+vH c=1 sm=1 tr=0 ts=6ae914a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=Ut7rPBlKFqStPCCC4O8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=10 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

There are no callers left. Point the comments that named it at
folio_clear_dirty_for_io() instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h | 1 -
 mm/folio-compat.c       | 6 ------
 mm/gup.c                | 6 +++---
 mm/page-writeback.c     | 2 +-
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 692ce3867a1d..9adfeae2153c 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1315,7 +1315,6 @@ static inline void folio_cancel_dirty(struct folio *folio)
 		__folio_cancel_dirty(folio);
 }
 bool folio_clear_dirty_for_io(struct folio *folio);
-bool clear_page_dirty_for_io(struct page *page);
 void folio_invalidate(struct folio *folio, size_t offset, size_t length);
 bool noop_dirty_folio(struct address_space *mapping, struct folio *folio);
 
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 9f2cd0ebfbbd..13d4d39e1896 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -42,12 +42,6 @@ int set_page_dirty_lock(struct page *page)
 }
 EXPORT_SYMBOL(set_page_dirty_lock);
 
-bool clear_page_dirty_for_io(struct page *page)
-{
-	return folio_clear_dirty_for_io(page_folio(page));
-}
-EXPORT_SYMBOL(clear_page_dirty_for_io);
-
 bool redirty_page_for_writepage(struct writeback_control *wbc,
 		struct page *page)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 7d43ce717b24..335dcb3a5c17 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -298,16 +298,16 @@ void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
 		folio = gup_folio_next(pages, npages, i, &nr);
 		/*
 		 * Checking PageDirty at this point may race with
-		 * clear_page_dirty_for_io(), but that's OK. Two key
+		 * folio_clear_dirty_for_io(), but that's OK. Two key
 		 * cases:
 		 *
 		 * 1) This code sees the page as already dirty, so it
 		 * skips the call to set_page_dirty(). That could happen
-		 * because clear_page_dirty_for_io() called
+		 * because folio_clear_dirty_for_io() called
 		 * folio_mkclean(), followed by set_page_dirty().
 		 * However, now the page is going to get written back,
 		 * which meets the original intention of setting it
-		 * dirty, so all is well: clear_page_dirty_for_io() goes
+		 * dirty, so all is well: folio_clear_dirty_for_io() goes
 		 * on to call TestClearPageDirty(), and write the page
 		 * back.
 		 *
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 0694ec4098f6..b56f2c91b0f2 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2821,7 +2821,7 @@ EXPORT_SYMBOL(folio_mark_dirty_lock);
  * This cancels just the dirty bit on the kernel page itself, it does NOT
  * actually remove dirty bits on any mmap's that may be around. It also
  * leaves the page tagged dirty, so any sync activity will still find it on
- * the dirty lists, and in particular, clear_page_dirty_for_io() will still
+ * the dirty lists, and in particular, folio_clear_dirty_for_io() will still
  * look at the dirty bits in the VM.
  *
  * Doing this should *normally* only ever be done when a page is truncated,

-- 
2.39.5

