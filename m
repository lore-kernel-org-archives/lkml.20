Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA564AA1EC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365510; cv=none; b=CfMMpjnjb3mnYLahHwMIhla4GrCMB72baD5Jz80bwMThaeB3kD0p6mlrdfa5d9Cn276/xm6gDYDBoYIsO4YXU4inoAV02SvLsLPgif6pt7FZFqJgTckEdkkCycjsgNFStjCm19m0zB8hC78Ct/yMoRKh1DdHwWk9rS27nWsxal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365510; c=relaxed/simple;
	bh=s4aQr7hLLoPlSzWcET7qS2e8T5DJ7nFQ9HlOxIKnBJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBoe/WTa0sWYHLYVTnd/ByKX0qHQ2epTPX9w0fvuRaMbjMvVd3BRhOlikfvnYY5LqDE7bllrAu5e/Y2c3ZL6uC/hPBEe5U8eQpG2ykqxo3NB+wdDSXB2ANfFRn6XPn0uCJPxVRTdOAQb+j3tgHHkq7iXLBQhKyQJ8YlbT3Rt2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=i5Yf6md5; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BraDFHpo; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="i5Yf6md5";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BraDFHpo"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPgCN303734
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=upg4
	sAfRj9dU4KqMgi0idkP7WjgB7CavxCy4wH5wtWI=; b=i5Yf6md5vc6Io5Xqzn14
	99UX3j6Nfj8enrb5t0a7KlGACV3paz2npbUjEjA2aU+SoVIkbfddFH7ktsjEHcFl
	Ef7K0N5oFAZBQfIagHg2FyAkah9OGztQht/LwKf/p5mk5Y53mquFX37TqkyVqWAt
	kdoT206CFsbt/UiEweQ7pwjF9VQogepN9Vpps/sn8cXzZfIZaXDW+TE6vG4kdUao
	Jq0PQ41FOiju5/uW6imHsIRXjYfeI2yp1tmL4ZHDeXzOK+3Upf5hnqblWM9XQdX0
	p2r1LScU0D32rWLW0rxiVfyVTHc9+3efYk8KDdpDPgb6YZVc7Ay6Z4z77BqrlObT
	sA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ge8gcms73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:45 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so262489985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365505; x=1788970305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upg4sAfRj9dU4KqMgi0idkP7WjgB7CavxCy4wH5wtWI=;
        b=BraDFHpoXp+ddH1TmJuJPlqLwnRuynJb+4yPRJa/VxwoNOWNElQexlZBsNOpWFR3fU
         /bzpAzr031xAhWkzq71bxlBcCUOE1jRxjAfOXz4dPdbw9EqebY1KSxqScl82d6mBIRS6
         /j3ZkG5Pv3+vwHPq3JrDcJVPues9NIKmgIDzmNkLWEaPFiqTkkLZV1alLdlg7SCmeO92
         wUiRbOCvtY7cSStSFP9iM0TAhkbGtbrpFiXJwIZbT8ifCSUc2l+P9oWdoHiJJ3o8n6Hw
         iEZpPaPcC8FLvYQdEsV7aN035ZI9MhZUFF2cNJJ7rnfVmrFRhiGk3ftGwHgloHLiTnhg
         FA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365505; x=1788970305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upg4sAfRj9dU4KqMgi0idkP7WjgB7CavxCy4wH5wtWI=;
        b=kiFFzGo1Y6i3x4ghOAP0Aqj/bzN4/kmq+jTcyza10NCYWZMcvOFVA3OPHNjJ7D+UmW
         zoNN2VWAkOBxgWH4vJfKxQr24ya6dX3IHP0JDksF9pdgM4BG5SetVv3nz4Anj/LqAFjz
         kyrYLPfWbp8nUlt2B7O2hqtdcl7zdJxWTiO1RnbIOLzBCFUJ9mwiYOufRSQyNz+6KCUG
         gnK3foImAQqDSVM7O6o6RuzqKm4xxSIyCCC9mscznDRJ8kQemwWmsqiRAraDeGe+HD7O
         h2uOdConH1hJX++n+QrOk2eMta5MJ2LvopdlFmrnF/EAjSYDyjqpHQlU+nW2QPNrzyCn
         9U/w==
X-Forwarded-Encrypted: i=1; AKwUvBwXDvJHLKubQI5Go87JoUfo1pk3xLf0XrmqAgmcBkmjom8N00czhMYttZFb348ysCEp6O6vJgasw2Lhlak=@vger.kernel.org
X-Gm-Message-State: AFuF++lVRXNhW7Xa3GE+24RhbftiHVxzXR//sIQLmaQx/0YA7XWEl87W
	JiJHIndKJy47V55iBEEFJ6BVuw7EKXnzUIQhIrwKpmemIpLtgT2UTcxbIcHWQzwY3G3G2F+LNwe
	sWUrqWdTuE14FH4C5FucelBHvRZ4pBJFvc7ErRMlWVeEz8hnFrgJzRJ+WOdzAhA==
X-Gm-Gg: AYBFou3moTxPlnAR0TxyRnpMAZnIea6l+dnzkpPWpOfBUKAXyl6vBmd0m3qPODrMp7A
	8PWjnHMNRVmZ9MToLk7aM166bpwfUBPg6WISUH/r6yxc22x9aJv3wogOyDsV9OJXlKMqoMf0VM0
	ThY1h3YMkS5pSnLzGFgSkTX1xX/rfDOxNSYftKtSH6Ugk8rQHbuaVn2w05k2B2P77cS7AcsW1gc
	W3goZkSDydGaIM6XwRDzAGJi4NY/fbD3LoaOIRcwHNa0rrNCY7jlwZ+X0/n7AETcvLW7rJd73Yc
	v0KZdcSJLqz45jV9RGNgE9Tbq2DGyJ8aDfqFIhFBodBq0e5jv72KBCfnN109GI92IjByg9XI2Ly
	p/2biMJnm0jNUGMlixxHCwcEEhPhVSkdcb1HtJVUayg9y3nTfcDJ5ew==
X-Received: by 2002:a05:6214:d64:b0:90e:8356:9bd8 with SMTP id 6a1803df08f44-90e9f238884mr82314716d6.11.1788365504437;
        Wed, 02 Sep 2026 09:11:44 -0700 (PDT)
X-Received: by 2002:a05:6214:d64:b0:90e:8356:9bd8 with SMTP id 6a1803df08f44-90e9f238884mr82313856d6.11.1788365503812;
        Wed, 02 Sep 2026 09:11:43 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:30 -0400
Subject: [PATCH v5 06/10] ceph: convert ceph_submit_write() to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-6-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=5038;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=s4aQr7hLLoPlSzWcET7qS2e8T5DJ7nFQ9HlOxIKnBJw=;
 b=AFrZBahtMjgmqG9lVd7/Tv8Z3B9eVyzMxdg0iDwqVokx0dHe8n/F0oGPBclpyyMb/MtxC4b2x
 3e9knfiCSjYBxejaJWbZ2BoofoAMIPpleibPyjPP3Z75opqcgbn1lQv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX81jBPLXEIETq
 IDoEOuX332X84BxULyLpKvg/WJgDpiPZrAtAeGzfok7/Xej3Kv1p83mIv+NA0sxYspNjQNGRRbS
 dMwYiKN5ZWXURKfEGrg4kXyeRzKNOKN5lK8A7lI7bCP3xRG+XPM7Na+T7tFN8B7z+w2ROR22TBB
 Il/JLNt1+26XzksSpjN7UdkLSQaqeyS0V6aHoW4IdFkkb++pVHQYODwrTdYDuj1ohp4cftJH1DV
 9KW5x4o/VJPaB6+kRPef2Ww/hdZRwSHLxWB/j/CK5YKy30oS6k1mqWJ4X4Xf5rHC2XAvXZthgLn
 fEballtneizjP4lDF0nG7EAKhcNsXLFmnWMOjBPbtcL0wfmTJKRxHLKFKYfLSwa7M3pWhVO/sFt
 u2MwmL6QYQo18kxv9y49uRb4mF1oUq66fyXR4nPIfhi6hLmfPSPkIuzWRKVC22gP88pl4En0RNh
 iT+A+rBF+mclBo3OCMw==
X-Proofpoint-ORIG-GUID: 3ZZUFTtjOB2XT12aB94qo2NzLQWfK_dd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX9otdYOVLP3fj
 sTaumklkVJli2hICJnD0DcL+mv4/BX/fLpzrri0M+Ujd2VsbT/WvSUkp/g8vjefh7Z4zHnKDyPp
 zuTz4zJ77CjwtaZ8W4tOVH+6guWx2WOjMb1EtEsxfAu2j2UAchB2
X-Authority-Analysis: v=2.4 cv=HNbz0Itv c=1 sm=1 tr=0 ts=6a984ac1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=RfODlEta0-z8xtihUo8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 3ZZUFTtjOB2XT12aB94qo2NzLQWfK_dd
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 suspectscore=0 bulkscore=10 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=10 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020143

Convert the request assembly loop and error path in ceph_submit_write()
to folios. This drops ceph's uses of the set_page_writeback(),
redirty_page_for_writepage(), and unlock_page() compatibility wrappers
in the writeback submission path.

Add ceph_folio_start_fscache(), a folio counterpart of
ceph_set_page_fscache(). The remaining caller of the latter in
write_folio_nounlock() will be converted separately.

In total, this removes eight calls to compound_head() hidden in the
page-based APIs and one explicit page_folio() call in
ceph_undo_wrbuffer_claim()'s caller, while adding four explicit
page_folio() calls.

Note that get_writepages_data_length() must still be passed the
possibly-bounce folio, not the unwrapped pagecache folio, as it checks
fscrypt_is_bounce_folio() to round encrypted lengths up to the fscrypt
block size.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index a72efe96e1f8..b0deff481d95 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -558,6 +558,11 @@ const struct netfs_request_ops ceph_netfs_ops = {
 };
 
 #ifdef CONFIG_CEPH_FSCACHE
+static void ceph_folio_start_fscache(struct folio *folio)
+{
+	folio_start_private_2(folio); /* [DEPRECATED] */
+}
+
 static void ceph_set_page_fscache(struct page *page)
 {
 	folio_start_private_2(page_folio(page)); /* [DEPRECATED] */
@@ -585,6 +590,10 @@ static void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, b
 			       ceph_fscache_write_terminated, inode, true, caching);
 }
 #else
+static inline void ceph_folio_start_fscache(struct folio *folio)
+{
+}
+
 static inline void ceph_set_page_fscache(struct page *page)
 {
 }
@@ -1467,14 +1476,14 @@ int ceph_submit_write(struct address_space *mapping,
 	struct ceph_client *cl = fsc->client;
 	struct ceph_vino vino = ceph_vino(inode);
 	struct ceph_osd_request *req = NULL;
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	bool caching = ceph_is_cache_enabled(inode);
 	u64 offset;
 	u64 len;
 	unsigned i;
 
 new_request:
-	offset = ceph_fscrypt_page_offset(ceph_wbc->pages[0]);
+	offset = ceph_fscrypt_folio_offset(page_folio(ceph_wbc->pages[0]));
 	len = ceph_wbc->wsize;
 
 	req = ceph_osdc_new_request(&fsc->client->osdc,
@@ -1498,14 +1507,14 @@ int ceph_submit_write(struct address_space *mapping,
 		BUG_ON(IS_ERR(req));
 	}
 
-	page = ceph_wbc->pages[ceph_wbc->locked_pages - 1];
-	BUG_ON(len < ceph_fscrypt_page_offset(page) + thp_size(page) - offset);
+	folio = page_folio(ceph_wbc->pages[ceph_wbc->locked_pages - 1]);
+	BUG_ON(len < ceph_fscrypt_folio_offset(folio) + folio_size(folio) - offset);
 
 	if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
 		for (i = 0; i < ceph_wbc->locked_pages; i++) {
-			page = ceph_wbc->pages[i];
-			if (fscrypt_is_bounce_page(page)) {
-				page = fscrypt_pagecache_page(page);
+			folio = page_folio(ceph_wbc->pages[i]);
+			if (fscrypt_is_bounce_folio(folio)) {
+				folio = fscrypt_pagecache_folio(folio);
 				fscrypt_free_bounce_page(ceph_wbc->pages[i]);
 			}
 
@@ -1513,10 +1522,10 @@ int ceph_submit_write(struct address_space *mapping,
 			    CONGESTION_OFF_THRESH(fsc->mount_options->congestion_kb))
 				fsc->write_congested = false;
 
-			ceph_undo_wrbuffer_claim(inode, page_folio(page));
-			redirty_page_for_writepage(wbc, page);
-			unlock_page(page);
-			put_page(page);
+			ceph_undo_wrbuffer_claim(inode, folio);
+			folio_redirty_for_writepage(wbc, folio);
+			folio_unlock(folio);
+			folio_put(folio);
 		}
 
 		if (ceph_wbc->from_pool) {
@@ -1542,8 +1551,8 @@ int ceph_submit_write(struct address_space *mapping,
 	for (i = 0; i < ceph_wbc->locked_pages; i++) {
 		u64 cur_offset;
 
-		page = ceph_fscrypt_pagecache_page(ceph_wbc->pages[i]);
-		cur_offset = page_offset(page);
+		folio = ceph_fscrypt_pagecache_folio(page_folio(ceph_wbc->pages[i]));
+		cur_offset = folio_pos(folio);
 
 		/*
 		 * Discontinuity in page range? Ceph can handle that by just passing
@@ -1576,12 +1585,12 @@ int ceph_submit_write(struct address_space *mapping,
 			ceph_wbc->op_idx++;
 		}
 
-		set_page_writeback(page);
+		folio_start_writeback(folio);
 
 		if (caching)
-			ceph_set_page_fscache(page);
+			ceph_folio_start_fscache(folio);
 
-		len += thp_size(page);
+		len += folio_size(folio);
 	}
 
 	ceph_fscache_write_to_cache(inode, offset, len, caching);
@@ -1592,7 +1601,7 @@ int ceph_submit_write(struct address_space *mapping,
 		/* writepages_finish() clears writeback pages
 		 * according to the data length, so make sure
 		 * data length covers all locked pages */
-		u64 min_len = len + 1 - thp_size(page);
+		u64 min_len = len + 1 - folio_size(folio);
 		len = get_writepages_data_length(inode,
 						 page_folio(ceph_wbc->pages[i - 1]),
 						 offset);

-- 
2.39.5

