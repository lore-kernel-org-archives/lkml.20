Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C622E888A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086038; cv=none; b=L9D8rD2itJFfly2vxlWOifqMkrSBuFTFSN0HuhKhNC14rZWNjA9zRM3MFpaJpzs8TU/xiC8qno+BOuTrBcT1Alh7/tpMmk0PEU7YQtJpa/tg4yimXVS232sCnfPdFp/HE1MCf9swuGw8bt8OuYfsdaEQcL8pZunaWgkX1wpNmJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086038; c=relaxed/simple;
	bh=8STOz0RYKi+7v+knfY76tg8bbf4f7uqOVYm5Jf2KOls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HoS4BSs85HKfJJR3BpGQ8zDFue2qlVrbyjrYC9Hrzlk1q36z+rUzVxUWDHrwo07Kca51uTkt6SmGZjiIWhlcYgl2f1uIOJvRRaOtpqDjarmTtEwvWAa0XEXy2NGjSipaO2aqBQL7EQdeajUxgUSduJvgrraxvx5bBqBQ/tHzAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hVKwFx0h; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XfFqcqXR; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hVKwFx0h";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XfFqcqXR"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA0C7v3243259
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TUGg
	y+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=hVKwFx0hCSsZz5LmdePQ
	m0MIIXxBNMqk2TTE1r4loNFqwx04Lk+KyP0ANLw8p2b3pFEWesqV/I4u6L8EkBHc
	Ki+S48u1n8GvEGat8Rtjc3TUUqIdJhvCqYNrD9R/rIqqks3p3mk5CBvMuIVs8Oz7
	B//B9LqyRpbCSDnmdkjITeC47HXFSy+g/O5Z3/6qXde+vRLmNkS+cXQS3ZHR11ge
	pDD3LBJu+sx4wHBK7dQD+kY1QY1FQQgf+h+y0Woje8ozX0gMNvzrXuXCewHk+KO5
	0vROpyniv4JLtNCGRncW9+rPI79l/FNM6rRKlvDVfa7axqIxq4ZKLGZ0FZb3mDDH
	QA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbs0pvvrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:54 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc3bff8bdso36262601cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086034; x=1788690834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=XfFqcqXRa+Z1gKAqU2rB1dCSX+nQJT/PurPluKzvaZRi2TyUU6vJYtLrIHPiycXwYv
         tGBjMT5aJKxovyTUm/3SAhM7WjSS9DUI4eituaXDrONBrGZ3nnYtCXOC/zb2e1u9Yjqg
         MIq/IrBSoUJyFFrXzA4zQ4N7IFG+JxDAkJKX8t/FHLlhbMlzw0z8WNwhyzdyego4PzsP
         njbTjFKV+eOB3+B27sxAgVPEDpJ1Vh6zhaPM3YtwzLZQL8rU8KSZmf1Zur2VTdoyN2uk
         mpsUs2oOqflVH0hMmH6PkDidoS10KSx+UI1/2BVwdYbXmkv5PHfeq2UuEtbv7syMZxHC
         +NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086034; x=1788690834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=lMEKLbW/QrfOqONLn0HzPaw1nnOgr8Qc+seiV7qkMkAeOVOyfGVf6rQRmYtot73D3n
         NpUiA9wmysbMVo0vcBd0L9vRN3VsB+5YpTel2IWr9rCFusNzUZfG8EWZF4se3ABndbi4
         4g9fU9AQau+Oux/PMSl7JG5sE49jwxUpKQb2jBaUbXJ8/e5Xlhhgy2Pd6GC+FJzgJlj0
         R+RLRO1NxLppVcFOeGeu3aIMd8rNqwT7pHRo9kRniyRadv0L54XcR6SxUAbyUh2KpiAs
         DU/TmZEEbDhtKu64nJukA8qzYPRDqvnBPg2H9+fXXYdAwKjV6xxvum7/BRvKTj3qrqLn
         qrPw==
X-Forwarded-Encrypted: i=1; AHgh+Rrl8xTsTdxPJ8TVVdEVykRXcMKvYSOlJpaKk1OSd9uHvq1QnTKz7tsCsC5uPlcfYx5bmThDM+VBdnxTxm4=@vger.kernel.org
X-Gm-Message-State: AFuF++nOfKPmkSzM2pFiqIkEIfkHbR3FPXkK6ALXvxFdPSENrJdUkqND
	+ZbMR+l3ckdIokEOol3EjP/ut01TlBRExe08iCti8MxuSigh2nAqPakIui8P0FRRKesiKvzkOQ0
	6hq12C2TtgnE9AOJOhzBO0GFND8fVuNj/2k6fbSgl7JNHAZcbt4ZKQkoN286sKw==
X-Gm-Gg: AR+sD13wHtrcLm/ec7RmKcuR/Nx3JW1FPPL4NG+j3cl6G/VWVkoX0lQdZylEJCMCocI
	bWa4atIqMihjJ32FrjXWNnNGdEYK3sY2cdguctfnawquccPB8tpnWR0wAOdneeMr4KVhLdSzNTp
	AidL5EOgXq6gPET7SwvQlm5C3T8FsIr3ZmhB4XmJkT19mUHzCnaofBar70LYZEGReHxBVGRxqD6
	E/ExtbddvmfcZ5vYDw8u+TxGsRYNNEAQD1AcwW2dmMY1OFk0L+/bkX6RzNLthwbJsnPaBW1N7NW
	1+vXqQUFVgiuHVFxlCQiyNeNZiR/5ta5xo4jYS97Wi1Df70IRa4tYjqidU90lECjfvZz20+ybNi
	cf5Ny6ZB9u3ZhTvKKRMB7T/wiRqxtxKmr7Ai3Ab9dAw==
X-Received: by 2002:a05:622a:48a:b0:530:4ed:c251 with SMTP id d75a77b69052e-53004edc327mr39475631cf.12.1788086034222;
        Sun, 30 Aug 2026 03:33:54 -0700 (PDT)
X-Received: by 2002:a05:622a:48a:b0:530:4ed:c251 with SMTP id d75a77b69052e-53004edc327mr39475241cf.12.1788086033785;
        Sun, 30 Aug 2026 03:33:53 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:29 -0400
Subject: [PATCH 7/8] arm64: mte: pass the swap entry to mte_save_tags()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-7-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=2617;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8STOz0RYKi+7v+knfY76tg8bbf4f7uqOVYm5Jf2KOls=;
 b=DZ1RAcNFd2t3tiLlyqIoCis24ccxkX5i8IRMFWWWvBGYd/Bq0q/3TDIYxtAmdd4DXmVWWJweQ
 rUY0XsF3guHDHQMeLSpYerreROURlWUbDCXQd6WCqK9O6SjIYu4z8Jv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfXz1oKYof4XNNB
 TJcGsXpX7zFEUCvNSPb7+TvypxOg5e4JlhBORppod3MAGXOoFhcG3/gFZkS0/l0cTdbDXVBDQSg
 Mf6H9kI1jyGHNbswnX61IPCy67mKwDohFs/bYiPCqO9MK76JvoD8b24SZdNNAbPzp8QyvHf0Yt0
 IeAqjVJc8+gqdJlTgZm/WgjDp0kXoyR5YlNOiID0CyzefahU31vedxiiudotudicpiVlXh77YgQ
 U0TlKH/RlVB35wKeHIUBusgURZXXhJhIYcs51K+sDHtn5VodbYaA+NYISEJRjlORXQYO+nCH8E3
 pxP5yViVOECLP+S9OqVCClSbz6PgrD+QciSpp8PgJ5ynhwWT1u4sprSEjIOcSOSeTab56Jcye1v
 cInjqU0lpi6FoniYZHSwp2ufRtulFr6IIRqFneBVrjcIOpj1rqrn9YMKNFKprMDyCppnkkC2SL/
 bGsB/8ncaeXh2fwOtfg==
X-Authority-Analysis: v=2.4 cv=EtbiaycA c=1 sm=1 tr=0 ts=6a940712 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=p1CcqGZxNqfKctaSDs4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX/Tha3y3AqBRZ
 NZjITlzZ5e2hlPJj6r4SrYGPMzIWj5uzdVzqELAyT94olFnNqNWjWmRbH/xygW/g7YVY//LNxHb
 ho74sSfq/eXS9ffHkzCUoJcAZAtYNGDgmpNUH8iLOEe5PVg6hNeu
X-Proofpoint-ORIG-GUID: 60Gyz8AJnsKi_faEuW7ZWpsqeRTFRjJ0
X-Proofpoint-GUID: 60Gyz8AJnsKi_faEuW7ZWpsqeRTFRjJ0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=10
 spamscore=0 clxscore=1015 impostorscore=10 phishscore=0 bulkscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

arch_prepare_to_swap() derives a page from the folio only for
mte_save_tags() to recompute the folio's swap entry from that page.
Pass the entry in directly with folio_swap_entry(), matching
mte_restore_tags(), and move the page_mte_tagged() check into the
caller so we only compute the entry for tagged pages.

__mte_invalidate_tags() loses its only user, so remove it and call
mte_invalidate_tags() directly in the error path. This removes two
calls to compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/mm/mteswap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/mm/mteswap.c b/arch/arm64/mm/mteswap.c
index 3c54afc8b758..f64202b69309 100644
--- a/arch/arm64/mm/mteswap.c
+++ b/arch/arm64/mm/mteswap.c
@@ -20,22 +20,17 @@ void mte_free_tag_storage(char *storage)
 	kfree(storage);
 }
 
-static int mte_save_tags(struct page *page)
+static int mte_save_tags(swp_entry_t entry, struct page *page)
 {
 	void *tag_storage, *ret;
 
-	if (!page_mte_tagged(page))
-		return 0;
-
 	tag_storage = mte_allocate_tag_storage();
 	if (!tag_storage)
 		return -ENOMEM;
 
 	mte_save_page_tags(page_address(page), tag_storage);
 
-	/* lookup the swap entry.val from the page */
-	ret = xa_store(&mte_pages, page_swap_entry(page).val, tag_storage,
-		       GFP_KERNEL);
+	ret = xa_store(&mte_pages, entry.val, tag_storage, GFP_KERNEL);
 	if (WARN(xa_is_err(ret), "Failed to store MTE tags")) {
 		mte_free_tag_storage(tag_storage);
 		return xa_err(ret);
@@ -68,13 +63,6 @@ void mte_invalidate_tags(int type, pgoff_t offset)
 	mte_free_tag_storage(tags);
 }
 
-static inline void __mte_invalidate_tags(struct page *page)
-{
-	swp_entry_t entry = page_swap_entry(page);
-
-	mte_invalidate_tags(swp_type(entry), swp_offset(entry));
-}
-
 void mte_invalidate_tags_area(int type)
 {
 	swp_entry_t entry = swp_entry(type, 0);
@@ -102,15 +90,23 @@ int arch_prepare_to_swap(struct folio *folio)
 	nr = folio_nr_pages(folio);
 
 	for (i = 0; i < nr; i++) {
-		err = mte_save_tags(folio_page(folio, i));
+		struct page *page = folio_page(folio, i);
+
+		if (!page_mte_tagged(page))
+			continue;
+
+		err = mte_save_tags(folio_swap_entry(folio, i), page);
 		if (err)
 			goto out;
 	}
 	return 0;
 
 out:
-	while (i--)
-		__mte_invalidate_tags(folio_page(folio, i));
+	while (i--) {
+		swp_entry_t swap = folio_swap_entry(folio, i);
+
+		mte_invalidate_tags(swp_type(swap), swp_offset(swap));
+	}
 	return err;
 }
 

-- 
2.39.5

