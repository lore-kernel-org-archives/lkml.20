Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660090;
	b=J6qhiIYg2XJlmQAVw3xnSV/SE7SgpboXTugQdXX4S/i/3Z97ya4ztv9UhGOUlLAcrTG4
	 hcR99M8K3CVJAwUcvWMq6IUFsy4HaR2cYpgcvgAYqIEnbQTHJ1MPd5FUxV7OQW2kovpPE
	 lKqHxUFivLrBxIANxdOAoXzWz0TzkhC2XFapjgBer9yQPDdqI0+cuXSiQZ48gjtmwaFyM
	 9Agf1leXGgyh2kMJaeZY1rfSamIp8+xq6pylDhdYfECpXSj8NW9buzpHkhHWfHlmHk0Dv
	 fDCGaIK4TKLkTSuX+WTW5NyoYqaHyDPsr3MkEnO5aQA1Kw4o4oFEFft/PujnqituRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660090;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+n+C22ug44tZi/zSDo7h3XNZ0RC6s+0z26GFL25p54M=;
	b=yOB3MRzwlx+pZexLDy5ttyfuATr48e3xsucQ2l966V9s0A6m+BbPxqB3fxxHemy3DJnZ
	 fCGBDRsEG+uLCti9wE24bfULvOh/DS2ovplBKqCF8fZL/30yrCPlfOs62A3tUyAGDeZKx
	 xQzZBqLmII1O/sPluG2igGXqU7DTPeOIYnGEKONL+qY0LdRiil5IDpgUPT28SYNDn7PuZ
	 kArF4KV/mDsgnxDc3oQbEnjqoTW84Mz+GeqJece2eoYZfS8dT7o4W8Z67JwWrtcvUlCsR
	 JBqG95vCLeXtsI6W1gVsh2tM4WyFujCrOVGER4vvM/TUkILNUSjAuFmCkleCh/RDSeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=f794UEnE;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=oBHPXs0D;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D707606D801
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D707606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=f794UEnE;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=oBHPXs0D
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LYAdX3941448
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=+n+C
	22ug44tZi/zSDo7h3XNZ0RC6s+0z26GFL25p54M=; b=f794UEnE20qN0MjZa2Lf
	8yLMS6g4sqhWKbjKw0V/PgJVyJKk8CgRzJp9sXwvI2mu8gFdkx/F+mItbkOF/I5N
	DcjVNqBeAsWdHLb91ZbL+i/rDDbWOY8EYclHvOl5xhp3b+knIHTsq1F7cXrfMguK
	0HkwMAGOdlvN/Slp44+ZjjJMr51FEFsRzoxitSx6A6p9CqRvDr/6FxCHcoGf+0K1
	T0tgkJdtOXz2A3a4HFkha3mzJswtDa9Eq3AIBLKhLXqp5rWuwaqhd98yJxUPvm3w
	r2nyCdGsPickemPnQOU6uH/S/dws/Y/qvsaVaZqxZlOiX8GYuOjGpRrha9Wmtkzl
	Ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hptgqds23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:49 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944101e6367so24188085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660088; x=1794264888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+n+C22ug44tZi/zSDo7h3XNZ0RC6s+0z26GFL25p54M=;
        b=oBHPXs0DaZ8I+W1oWDQM8qk4RD2XgGjPGTg7RNY3SVL8cHSWrqUT3OO8sF3D9VRpcI
         ku/CvCrUPFoX/Xlpwqd++TmpKSEIsb3/Scddh8GiZjV4TwQXmZ/mraKTCKakOgBmJevx
         Dm+Ixx5TClZU8CSpZNwuKHAM4ICAg+7i3zDipArTNbUPwxnH2VeTOBCRasYrq/YNWYuk
         Kr6NbKF2aGz8qyuLegu4Q+uQj3zPgrDtrYQCyqwfar5Tnbt7HRLrZA+6QfyyeaohJ/pL
         +8GgjjmKo+EWyv6m2Wo2jM+9+RGeM3mk8am6p1jHiGgcUL/1V1Yi9Ioww8PqM+Q7fUP7
         +BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660088; x=1794264888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+n+C22ug44tZi/zSDo7h3XNZ0RC6s+0z26GFL25p54M=;
        b=AKGyh2kjDx+KwMoQFk1Vk8TGSbbo0zCvQdKzdsqL3/c1SsIuV3Kep2FxKqQj1pHgje
         yT0Bnq0FMRdZmrt1P+csQAIQzhuef76tDhn0l8rn/Y4x2mek7R6F0yXPEVuckwcUwiY6
         kJ5a774cQVBgQVFSKrlTp/psQXYrJaPPul0p0vzGJhKNvaJDpL/bAsZihL7j4a4wLoPr
         u5kfNu3fWLwqjVDuwKN9bt5+iCYGzWKNn1u1V2IE7x5KI+WCkoP/+umCy+bFRS3qe3O/
         8wafYbEJ1plXrmBV85CbLWrsw0fQBTwf+mL+pIqi1pLWAFlwiOngnYuUv06/Od/2R+7J
         dBlw==
X-Forwarded-Encrypted: i=1; AKwUvBxZE03qwmAQFK8QrIhJ08sN0Wt0pnYIiXCBA8UDaq0EvfE+xuCxhKvZOdM8aOZhbhdUJJMgpxwYGwcPwnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXL79LDtI1X9OQbO5w9xLBJ/O/yOiepOQZ2fGesYJdc5FO4RE3
	h2MinYtg901ccpWpVoYat6G+YjaVZ8ck+Jdxg+StCuxf7pAkwovjaWm/1ZaKCsFseSygeoErWeN
	B6lwjO+DDh5Hj1g+uUA/yR5Lp1hmJff9TCFwkzlV4UP+QJzMBHgj/tmFgcEuyhA==
X-Gm-Gg: AYBFou0frzdkLKtAsMbncjWlWaM/WPF5kX2abyCLWNTupbF/UsToyYzldhJgYwQ3lIJ
	ks/BkiSdovUpE9t/0hvwu9wqxrtmFOEjvVthdvcteGg2T1rEM548/Fjr3PsdTNvCHLZbTcE7vtD
	1u6x5dhKmreEuWNtddxG3Ga/F826jLz9LkPhjZsGs1Jm3UPEddUpvGTfmTIVynuod0GuxuKokWz
	p1+fy95BowEaYoiCuBt5OwScU6wiDUvg5tz8fpdOOJliMhOJXBjuWJyIqRNW8oHDFoAe0Jz3mNR
	VRAPBGXK0DfrldvWbJwCRAM4F4RetBNT6UCcEK/WfF1LB+7fH/otxx4zM6DmAAuPAwsgGCnPQYt
	fJxo6J68g4lU/+ffZR1sLJhETnmUlCu6+1McvJvNQWPeHM3J3h4hKRYhDL/Y=
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-944133d6c9bmr2247288485a.36.1793660088366;
        Mon, 02 Nov 2026 14:54:48 -0800 (PST)
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id af79cd13be357-944133d6c9bmr2247286085a.36.1793660087877;
        Mon, 02 Nov 2026 14:54:47 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:46 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:12 -0500
Subject: [PATCH 7/8] mm: remove read_cache_page_gfp()
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
Message-Id: <20261102-page-wrappers-v1-7-e7280bdb31f6@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=2961;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=iXAYsdJV62i38j1emwbwdbC78bf2OkaieSqqfLylJrA=;
 b=aqMzWy5ivbfIJq4ptqsBqYqbQ9FaALulqGhIwOJg0pfOaZx8bycf0yHvDarD2bQnGKi6NfBo/
 XuHlZoR6BZNBqRi3CZOGQTS0xEDszTh9YrJyBvZyxG5CK1s/55Hp4pg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: ge6Ry_yjezofSV813D7CPPHad5YendEe
X-Authority-Analysis: v=2.4 cv=B+osQ+tM c=1 sm=1 tr=0 ts=6ae914b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=NLUVrwrjVKh-CqleozEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfXy3rjqE4huvDc
 5S+GTe763bCKnBc01uv9b1ITlupT+yF9onqBvcOUuQ7l7bq2QGkkV8nVKjnftFFZBtnXJRPARTM
 NUxn39vPvght46K9flgT+iQ4n/ggliOjdOuO5d8Qyv3vOARYYjtF
X-Proofpoint-GUID: ge6Ry_yjezofSV813D7CPPHad5YendEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX9UgZp6YH6gvg
 RqNMRnTvlbEwY3orw21QGdh0pGsUsyzEum0lH9e00OD503FOkdjzjfk5uXTpgVB1d5ukBRU/Dcl
 b8lpV/wlUQNy4iRCZEmw/ynubCOlVgy1Q/zO9n3z4ao3jpV2B3v7kt2romrs1TrUsCuAHOpkvQ+
 ppvx7V2oRpJodRxrYKx5ZLs8L0EusYLIUSsRFDqK8XL8gGg4NwShU02PLADKHml1pUF6PY18dnZ
 c7svo2jY39BZwL//fdAqIhaEIwgeSGfKtYhIyFm5SoNI8fc4iDxrJWXxIx72bntJ5Xepu1iZibs
 lbXSqBueIB51i9xZzMNZrwbjWavzhUwxEiS8uGj6WOKqYNhoE1pxFUU9U8XvoN/WDDdQ2Py8JkT
 uB6JF+fC4q780dExPB6qmn4bGjKoyeiet37mBZjJmJ00i2wP379JodK6Rpo47ivtoTBc6TFlOhx
 3fXndrk/6Mwv5TNQUyw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 clxscore=1015 adultscore=0 lowpriorityscore=10 impostorscore=10
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

There are no callers left. Point the comment on shmem_read_folio_gfp()
at mapping_read_folio_gfp() instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h |  2 --
 mm/filemap.c            | 23 -----------------------
 mm/shmem.c              |  4 ++--
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a92329805acd..305c99bad689 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -962,8 +962,6 @@ struct folio *mapping_read_folio_gfp(struct address_space *, pgoff_t index,
 		gfp_t flags);
 struct page *read_cache_page(struct address_space *, pgoff_t index,
 		filler_t *filler, struct file *file);
-extern struct page * read_cache_page_gfp(struct address_space *mapping,
-				pgoff_t index, gfp_t gfp_mask);
 
 static inline struct page *read_mapping_page(struct address_space *mapping,
 				pgoff_t index, struct file *file)
diff --git a/mm/filemap.c b/mm/filemap.c
index 1df776907140..2b724d9be94b 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4258,29 +4258,6 @@ struct page *read_cache_page(struct address_space *mapping,
 }
 EXPORT_SYMBOL(read_cache_page);
 
-/**
- * read_cache_page_gfp - read into page cache, using specified page allocation flags.
- * @mapping:	the page's address_space
- * @index:	the page index
- * @gfp:	the page allocator flags to use if allocating
- *
- * This is the same as "read_mapping_page(mapping, index, NULL)", but with
- * any new page allocations done using the specified allocation flags.
- *
- * If the page does not get brought uptodate, return -EIO.
- *
- * The function expects mapping->invalidate_lock to be already held.
- *
- * Return: up to date page on success, ERR_PTR() on failure.
- */
-struct page *read_cache_page_gfp(struct address_space *mapping,
-				pgoff_t index,
-				gfp_t gfp)
-{
-	return do_read_cache_page(mapping, index, NULL, NULL, gfp);
-}
-EXPORT_SYMBOL(read_cache_page_gfp);
-
 /*
  * Warn about a page cache invalidation failure during a direct I/O write.
  */
diff --git a/mm/shmem.c b/mm/shmem.c
index de838dbb4df8..16b1cc3d8ac5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -6190,9 +6190,9 @@ int shmem_zero_setup_desc(struct vm_area_desc *desc)
  * @index:	the folio index
  * @gfp:	the page allocator flags to use if allocating
  *
- * This behaves as a tmpfs "read_cache_page_gfp(mapping, index, gfp)",
+ * This behaves as a tmpfs "mapping_read_folio_gfp(mapping, index, gfp)",
  * with any new page allocations done using the specified allocation flags.
- * But read_cache_page_gfp() uses the ->read_folio() method: which does not
+ * But mapping_read_folio_gfp() uses the ->read_folio() method: which does not
  * suit tmpfs, since it may have pages in swapcache, and needs to find those
  * for itself; although drivers/gpu/drm i915 and ttm rely upon this support.
  *

-- 
2.39.5

