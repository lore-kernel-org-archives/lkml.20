Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72014AA036
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365505; cv=none; b=M2b9lF6va4RR41220ZpArmlpLTnDfg6iAZS1VD9Hr9RZjqbPgZnJAjqSd72QZryhvhIFtmF+1Nuxpl/pb97wSew1mh8lvGV4EVmB5mN8t4gVAu8ZDC+wMzDu2nM8ZtqNLjiUWk6Cg62cQ52br6//Y9axEOELoUq1lQdCEo1IPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365505; c=relaxed/simple;
	bh=/ldrC0e6PknKOFmMc9BRmqENxGnXnBUTqXCF4n5xBxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SADMnZzzFTaNW+YzMRGV7xJz/dYEsPztWWh9V6PdRz/TVYUUoOEqN7DvaPjth69ebqLjyImK/K5AjyC2n7sFgJSFZIPwobPef0zzU59KRpQbyKIF7dFmI/j3s0hUDZ32oMk7n7PfBPUnVtqNSm1+ZyYUFWo3KqrypyTkqYxHWkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Y59TB2Oq; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=1B7gU2wQ; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Y59TB2Oq";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="1B7gU2wQ"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPcFA1571427
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iwv8
	qT5yhbctNPqdGs2vYRHtBWgOy3PUEMBHx4XKUy8=; b=Y59TB2OqLkyCBNfzv/9Y
	Frx/eW7hWNSwklJsQcWxk8FjIRs+LG+AMCBSuqdSytZzXT5G8nYDMyi99Pwa4Z+a
	s9K6NzET74QAWUoptFT3PYla8XvGyIOg4Cwg82zxpPrGgb7WO6MhvwcMdrnI4hOM
	TveTCvTfc0zsU7zTkguSbyQYFhmnWCbRof9EiNGBBNHxNinUi7zxgMiMGvlOlW1i
	ahKTjnh08ADkXsOwoZyvZP1X7zr+Xi1ps0jSYCcqTi662bnjh6zsoxWHGbOK0vis
	C/8jYdUU6FcheMBSK2O1VVllN8ccz7sDkTkcOZ8D0o0MJyD1rqBNtAD62/SM0eLK
	jw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gepdj0e82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:40 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb2a46cb5so33003141cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365500; x=1788970300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwv8qT5yhbctNPqdGs2vYRHtBWgOy3PUEMBHx4XKUy8=;
        b=1B7gU2wQLfb7i6ei0jz9g5k1XICzTx+VjqjiGrYs31gvjNPOKXOfY2QwRtSQEVpn98
         Y36o6d/EZrL4k2eoxGd2FvMlmcFK2mjWpUu7aPX/2nPvX93AWwwUwAs9BC6CDgPON5j0
         rPY7VXLWmWQkT3t68jeiJQMXUawrgd/jVUro8r2BQuCYBDSJ2Y3xe2N2VN7w6LIgdrbR
         8d5So756muuOwneNz1qNf+v8/V/FxuYP+RwOWI1h4uszcSE/GrRmWshzn5wu7dcS2koe
         hI5Hvtr5X34sj0DcwEazxeM5NeALdr/EY748E6WCOzVC4sVBzuCnAmPY9Zg58uM1Xkkg
         G15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365500; x=1788970300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwv8qT5yhbctNPqdGs2vYRHtBWgOy3PUEMBHx4XKUy8=;
        b=R/IOlQQcBUacHllZSASYQ4kHqtY6m2jdA9b1G68nbGLTE3S1fRS8RmgfKeYDNINhEP
         UFPbbjJBnyC8JjRwUZmq4QuAjru0RW3XJfhEGFH6ZPPJuZBjifq2hgDsF8gv9JCf5jkG
         B02lRCU2JFEASWR8XRE5/fNVi5TTGD+8/zl3QQzYACxRP43NftzPbD2/MFqbMGeQEJpd
         iUsv/sbH2YoTPVtSm+Cw+YMfoDTe3hjspZ99KLNN1kNNmL789/nV2gF5Ba18GBUnMSU7
         3MeIPDNn1fzqJK/h0UfHvdYUKc8InpQ3iIrRJjDubt5+mTkMjGn3S7dcqDu/oW0afXDM
         FXrA==
X-Forwarded-Encrypted: i=1; AHgh+RqzQPJ3fsz0MbkOWDC9RvmawXAbVfiakWZ6UX1Ql8LJ/XsQPKxsIll3iAwa1EBrt2TufSGmHdwOQfRNhEg=@vger.kernel.org
X-Gm-Message-State: AFuF++mpJv7lIUzbpdBdDHfIXyrPgrlw/XiiOPKUVeQileX3aHR8LCCy
	iYIg2yRT4PE6jkwobVQYqLVRqmi32SCGHj59x6WBSf/Rj/XrnrQzBNEGTTbmG/yoy3lfk9D2MoD
	sbrQcf4MYYfP1fq8E3iks3K0ilys0MVus2nGIitL/T7H/zN27ueLnXoXPem9p2A==
X-Gm-Gg: AR+sD132mAqYAq3diG2IDYNBffqr6vgOInBvGLlLq2wXjsRdQRKOInwmWA3vvkZ8SZU
	HVk7nuPs2+2fR3XWbPcmwau3z2Ll1D1jFEVe1UPt5wjvIf9khd7MlVKZ47CEZObJRGKSRURtdpc
	SYp3+4daBlS3gvbUTzAYf6Wt+k0liQJAMlqGITja3/XM02H+q7/yJDGCQRKDL4Z6UETlxNLBmHo
	5OYqEoyLOhUkisEYzRI1DoX5iqVePKpL4ZPHAYHxLaRj1s38x7OCNEWCtvg0p4ZSZ6o/AIz+NPx
	TQgxosytKQGFJ+i12sPZZ93ZakhlH+kpgt60O37mfli9+3Ga+K2Yk7CvBMxGC4lGZJ+DLaQ97VP
	bizRuOTA3TWqpU4MwWzoHUr72YU0hifOFryrt6Q2zELissNKhPvAyYg==
X-Received: by 2002:ac8:5949:0:b0:52f:b729:8b3e with SMTP id d75a77b69052e-53036d4f2a5mr64642631cf.36.1788365499756;
        Wed, 02 Sep 2026 09:11:39 -0700 (PDT)
X-Received: by 2002:ac8:5949:0:b0:52f:b729:8b3e with SMTP id d75a77b69052e-53036d4f2a5mr64641451cf.36.1788365499053;
        Wed, 02 Sep 2026 09:11:39 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:38 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:25 -0400
Subject: [PATCH v5 01/10] ceph: fix error handling when the OSD client is
 stopping in ceph_submit_write()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-1-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=3742;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/ldrC0e6PknKOFmMc9BRmqENxGnXnBUTqXCF4n5xBxk=;
 b=ZRRp+zYKSg5cZZ9WsqKtGmfMb7YlOIULJAO8lcGjJzzTMjEHMVfrDjA+BV0A3q6s8T8Wbdbxd
 euXimuC/ES/CTD1yrYIH5KPt0PPM5lDbqe02vBhJjGSwfOD28hPUO5X
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXznKjxQipP4C0
 yaaRiv/HEYwLmacrDWhxGJzHaVWCXs9rBhmgW1dvyz3xeG9ksCQUQ3qL1KzxlBYP+6st2kXJVm2
 RvxDjyWASbDIXWzdIRpMEMwUnY0vJ8KA40NxkqzZC1LDGNvmvE9R
X-Proofpoint-GUID: L90nkl0SNNwnWtLY8h1TaGd0qgt88W7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXwP09wP4Rf19c
 kHuZzIk7zlBTmk5/C6avJPAPvN+xUzEvnBpkzsDXMysNghtpPdjJKYDLzpzz/jJVIz4HcJ1s/13
 Ti4GmQGD1VAigWYJwI+kvYPzfsWrBHTqoBt/eTTOfPzl2GgFSsOg8yMvbHVdVlPd8pt66dNqV4O
 pqSnS4W+VFMsWV3GybkzUynL6wgBaUT0SY/ERqDlKBflEhtF6dYJu0h4Y9jPIbrj0ZTGSiO0tL9
 5QZkSOZqU1NAH7cbSkLa+q/EHQIcbVR4ZO/pzDdwaky88V+LXSqdHgnbI72onkYWqVNbiPDxwZX
 t0RwAlRqK+HGp7d5UX0Nzob4r8v9wDLYOFf7Rx9G4hU2ors3kcyx8Zhek9J84UZBTOqkhzl5UDP
 Q22D/t7RcFrhQvZMTybx0/mZbbsbcLwDUZcgOCzJm70E5H41pB+7/u7ceUYzQVEv+pbdE88aa1D
 SSrX67jl7Y8/OM+W0Gw==
X-Authority-Analysis: v=2.4 cv=XLUAjwhE c=1 sm=1 tr=0 ts=6a984abc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=W980AcPXFMIW1GselFUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: L90nkl0SNNwnWtLY8h1TaGd0qgt88W7H
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=10 suspectscore=0
 lowpriorityscore=10 adultscore=0 bulkscore=10 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020143

When ceph_inc_osd_stopping_blocker() fails, ceph_submit_write()
redirties and unlocks the folios remaining in ceph_wbc->fbatch.
However, none of those folios are locked at this point: locked folios
were moved to ceph_wbc->pages[] and removed from the fbatch by
ceph_process_folio_batch(). Unlocking them triggers
VM_BUG_ON_FOLIO(!folio_test_locked(folio)) in folio_unlock(), or
unlocks a folio locked by another task.

This error path also returns -EIO without fully cleaning up the folios in
ceph_wbc->pages[]: their references are never dropped, fscrypt bounce
pages are never freed, the writeback congestion count is never
decremented, and the pages array is leaked. ceph_wbc->locked_pages is
also left non-zero, so ceph_writepages_start() loops back around and
hits BUG_ON(ceph_wbc.locked_pages).

Leave the fbatch folios alone, as ceph_writepages_start() drops their
references when releasing the batch, and unwind ceph_wbc->pages[] the
same way writepages_finish() would have. Abort writeback in
ceph_writepages_start() instead of continuing, matching the handling
of ceph_inc_osd_stopping_blocker() failure on entry, as the OSD
client is being torn down and further writeback cannot make progress.

An LLM was used to verify that the cleanup was comprehensive, and
suggested aborting the writeback instead of continuing.

Fixes: 1551ec61dc55 ("ceph: introduce ceph_submit_write() method")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804-remove-wait-on-page-writeback-v2-0-81f0ab065284%40columbia.edu?part=5
Assisted-by: Claude:fable-5
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f8844390f88d..28fb76ded32c 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1491,28 +1491,32 @@ int ceph_submit_write(struct address_space *mapping,
 	BUG_ON(len < ceph_fscrypt_page_offset(page) + thp_size(page) - offset);
 
 	if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
-		for (i = 0; i < folio_batch_count(&ceph_wbc->fbatch); i++) {
-			struct folio *folio = ceph_wbc->fbatch.folios[i];
-
-			if (!folio)
-				continue;
-
-			page = &folio->page;
-			redirty_page_for_writepage(wbc, page);
-			unlock_page(page);
-		}
-
 		for (i = 0; i < ceph_wbc->locked_pages; i++) {
-			page = ceph_fscrypt_pagecache_page(ceph_wbc->pages[i]);
+			page = ceph_wbc->pages[i];
+			if (fscrypt_is_bounce_page(page)) {
+				page = fscrypt_pagecache_page(page);
+				fscrypt_free_bounce_page(ceph_wbc->pages[i]);
+			}
 
-			if (!page)
-				continue;
+			if (atomic_long_dec_return(&fsc->writeback_count) <
+			    CONGESTION_OFF_THRESH(fsc->mount_options->congestion_kb))
+				fsc->write_congested = false;
 
 			ceph_undo_wrbuffer_claim(inode, page_folio(page));
 			redirty_page_for_writepage(wbc, page);
 			unlock_page(page);
+			put_page(page);
 		}
 
+		if (ceph_wbc->from_pool) {
+			mempool_free(ceph_wbc->pages, ceph_wb_pagevec_pool);
+			ceph_wbc->from_pool = false;
+		} else {
+			kfree(ceph_wbc->pages);
+		}
+		ceph_wbc->pages = NULL;
+		ceph_wbc->locked_pages = 0;
+
 		ceph_osdc_put_request(req);
 		return -EIO;
 	}
@@ -1745,8 +1749,11 @@ static int ceph_writepages_start(struct address_space *mapping,
 		}
 
 		rc = ceph_submit_write(mapping, wbc, &ceph_wbc);
-		if (rc)
-			goto release_folios;
+		if (rc) {
+			/* the OSD client is being torn down, don't retry */
+			folio_batch_release(&ceph_wbc.fbatch);
+			goto dec_osd_stopping_blocker;
+		}
 
 		ceph_wbc.locked_pages = 0;
 		ceph_wbc.strip_unit_end = 0;

-- 
2.39.5

