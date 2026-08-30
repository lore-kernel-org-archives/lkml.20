Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAF3ABD91
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086012; cv=none; b=kj9FQHPCIyVKL7psclfTDUnuZT5WK+OhZOzfziJsfp60GNcMEpja3WCof+cBQIzZKq6y/posfSb/fR/1Ji4d0ROWzCKqqTPhVbwlrldcEGsjQgShHZcyP/8JVfrYQATXUN26BnGBEHXXZqd3zmylsO4G5Qi4O9tidZbXn2VEKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086012; c=relaxed/simple;
	bh=il7UMsRwFpzsLvluAxhowLr70Y3ODPga+2MhlPhEB3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7h01Dv2HCgmfJH3Gusn/SPMJHf3GEl3sYzEcJt+Q1uhY/353UCs3Vf3GxNJYEs71pKx/JOi4KCbgN+HkyLwY6Kw9Om78mNHw2623xchMUGSHE4w+V5wJ2nfbgA4AB4wNm1x0YnMtWo366EopYGwKwhUBYKP4Q9K6Q/pom6gCOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JfFX8hjA; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F+kvF2y6; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JfFX8hjA";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F+kvF2y6"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9u7WM3237905
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DIf6
	mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=; b=JfFX8hjA6sQeEQXVtvti
	qnAfnWQsEs219hHrOd1/v7ObcfRTKu71Um7EpMgtShSNfWiTyXtudW0PGmRmAuK4
	UuF22g+V0C1TnGy6dLpcIyZ5n9gsqlCagIz3B3vHfg7uq+Yz1e6d7c4kRRgR12mq
	Req+NB22JNLGSsTVp4+l/CeOR1InYFXxWSrcqezZrSLdK5M5dxtCgdV6q01LHIOO
	7+pjZmjffLiZWwTnig2OryPwCjYCSJpPYvOyN1yySfVaZV1ScK840Ubrn1nLm7xH
	hEUF5kf8ls6QDE7bLcSwjVbkJHIO/N1Ykfbejnln7XfsB8dyMBu1udurkTxB8y9e
	0Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbudj4myr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:29 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ff59f2c47so32498701cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086008; x=1788690808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIf6mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=;
        b=F+kvF2y6SbGHaZ3GlZekg+DWLlsmbMJK9LipML5JxiWx+FyfwjjeGgpwjNPR7X7dWC
         RdbqA+eI4oF4xVQDPLcVSSpN7G12MCnEyFe29XpprTrO+u8ynmuxYCOiKWZrG/Nrqcbt
         QbLXwzpOj2nwjoGJHGff7y/BgQunqkF6DMyDmH6EeKeXJ25P3wfmomtvV352e46U+FlL
         ASnD9jZ/Qeue2FycLEeow/RwX4QKlWtW2H1MNdAYJV5v0VQMMTYJkPLrV429TcoFr5bB
         hqqz8zJviz/ZThQ/d7826E3cGb7DxC1mxfy28Nc5oRnY4XBmsfVH33aLAno8edhkN9y9
         lrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086008; x=1788690808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIf6mQ5jieSfsR95OPMrcqML+UpgXiaHxu+WpaiXhhc=;
        b=UJO/mekBLSl4WBjKeN7RKHuTVg/SFgCQG/5s21717fEiCswFLxqvsDUIn+G3b5zeK3
         1IHna9QCnyVE7c5Oi6YLYiNSDNDj27tqzMMwyy9LJJYHzSWivozANDcWiwxhdNoIpUzB
         zVdhAfvwG8UsS/3tOeW0osgMOgTW0DxUAlngmAvISlDr9T/ZfnIMVHUx1n+tueF4MApu
         tFnh6H+7prGHDNO3WLLsNijgrnfNsfcbQ0GwzrFTkAp4mV1oAnUHqptQBZqY83mN8IbS
         ppS2btriggOVnBNnMc+Gg5d5xtUxoDl71BYWUOomwz0ZUQ3EzyQmwr28d7l1zAYV4xUm
         gD7g==
X-Forwarded-Encrypted: i=1; AHgh+RqDjtGJu8l57uVwllMS6Ad8O9cqDrOLl8S3a469TYby7BlyW5/9U/riBOTC7qsVi+995d2IQQZ4x/k4Pf8=@vger.kernel.org
X-Gm-Message-State: AFuF++k/zyKrCJJSZYfFZtRLA2fzl2chMLFRE8zztw6d/rC6KGh1MDDK
	hUAHzVWkRM5ai0EALquQegpRS89IUov5rssouuFw+OLCh4yugTaMXFZWAXU5GUe6KVVhBBRhckR
	lw38+C0PfNm8h1RdibMLgxgOrCxLNrbFfNJ6sLYVWO2xn0PhPxXtKSDhzBP6uTA==
X-Gm-Gg: AR+sD10/lYOrEyAq329ca79d6U/XWdsn+zqG8JwSKjzzRDblW+RpBJvnCklvHP60qCt
	102+w92A2SE1zrH8rEQELHFWPDFmtvKDIW/6AsonjEqaig+Jk5eT1DX+F2pNHKN1UavkGftaEeV
	gUW6rEestdTtTz21btOxF+cJaC4U7mGJ+rkHlQSboPM0H+m2dYz9KHGcBxXYAydgn+X/L18WW8k
	kgt3RcVSLkgYriQVAZT1YsMDeelMgTxzQn/fP9YSND9BxYeAn4pIJkfq7+85hcwmyNgfCXFaZeY
	gDINH+k4r1lkV0M1LRpkwquOCz/inIRVmieCfua6ebPSUkFR4PjSkz3lywGWJDhn01M5nioZXi0
	nofldUUMEkMc3iw7ktd6nf6XfDIMLc6lM0k0OJSnfOQ==
X-Received: by 2002:ac8:58ca:0:b0:517:c582:9161 with SMTP id d75a77b69052e-5300b777e98mr17169001cf.7.1788086008596;
        Sun, 30 Aug 2026 03:33:28 -0700 (PDT)
X-Received: by 2002:ac8:58ca:0:b0:517:c582:9161 with SMTP id d75a77b69052e-5300b777e98mr17168361cf.7.1788086008153;
        Sun, 30 Aug 2026 03:33:28 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:23 -0400
Subject: [PATCH 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-1-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=il7UMsRwFpzsLvluAxhowLr70Y3ODPga+2MhlPhEB3w=;
 b=740giHW+JUpfeL6BrdRfZ53BORRJ9DwBndjIt8Y9Znr21EeDOFcOZuhC9z/byBObIyBHeFQGI
 IjGTGV0AMNCDMktbmt2wy/syZZ5NwzV/2uTptcpt9hVzAKxCLlfl40u
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX3MTPJpxWMiOa
 N56FmWh9t1FgV7dOWZz4V5zl5zBbsbu7cp+yUTnhH+qA6eHl0VqWeXckyTFkiyoeMKFE3Fw+9Ho
 QvCPkwEJsdPlvp/Btz752+EWYBygwSnwZ/J40sWdlcsra+nzPJC0
X-Authority-Analysis: v=2.4 cv=Gr5yPE1C c=1 sm=1 tr=0 ts=6a9406f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=wCX1QjJdxvQAooojgaYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: y7JhFPP21BjN1IOeIp2CS3cga-IO5ftE
X-Proofpoint-ORIG-GUID: y7JhFPP21BjN1IOeIp2CS3cga-IO5ftE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX0AiPRh83yCOl
 JuoBHkT2xjYbGwuBnho2rvL8o8byCJS5mGbRbtGpZ5A1W4UMyfMPKW+N0YCjo4jfc+qtbvazC1N
 6ZuAyqE75X1LlK2G0yW6NG15c4PiX2l6//dmVx3aZnVW2XX6syzgeDjO66M1jeRa69YRAC6yGyf
 wbo5kvURzY/FQ9CMeOn/B6VH5UxRrZ53j5ei0kQOGADPxx+9Ktto1PNLu+kwSsrHvb8yWiaFvoP
 SDUmlofg8djQlotyl4ad0yloUOS8RVBkri/NTLSRxA+VdtOJGLRMudVqjNz3CHlXnZsb5OuX4Kf
 AE+AnrjYaMcJznEgc+REZ0vqA7l2k/DBmKMjLL9aO6gkEsNaLBrZApQC9RA6+bMm06XpJj76AR3
 /14ji9N0OsoyTsQ/uqQEw7GjdNjTOBP4CAddZLcZnMLAW1td3XNn9qXgl2XZMuk0R0xGaRDEATe
 0qK0tVSxpyeCJPbD6oA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10 adultscore=0
 impostorscore=10 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

A folio in the swap cache occupies folio_nr_pages() contiguous swap
entries starting at folio->swap, so a page's swap entry is just
folio->swap plus the page's index in the folio. page_swap_entry() hides
this behind a compound_head() call, and callers that already have the
folio sometimes open-code the arithmetic instead.

Add folio_swap_entry(), which takes a folio and a page index, and
folio_page_swap_entry() for callers that have the page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 0f953ed9c863..48632aacbc2a 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -278,6 +278,39 @@ struct swap_info_struct {
 	const struct swap_ops *ops;
 };
 
+/**
+ * folio_swap_entry - Return the swap entry for a page within a folio.
+ * @folio: The folio.
+ * @idx: The index of the page within the folio.
+ *
+ * A folio in the swap cache occupies folio_nr_pages() contiguous swap
+ * entries starting at folio->swap. The caller must ensure the folio is
+ * in the swap cache and that @idx is within the folio.
+ */
+static inline
+swp_entry_t folio_swap_entry(const struct folio *folio, unsigned long idx)
+{
+	swp_entry_t entry = folio->swap;
+
+	VM_WARN_ON_ONCE_FOLIO(idx >= folio_nr_pages(folio), folio);
+	entry.val += idx;
+	return entry;
+}
+
+/**
+ * folio_page_swap_entry - Return the swap entry of a page in a folio.
+ * @folio: The folio containing @page.
+ * @page: A page within @folio.
+ *
+ * The caller must ensure the folio is in the swap cache and that @page
+ * is part of @folio.
+ */
+static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
+		const struct page *page)
+{
+	return folio_swap_entry(folio, folio_page_idx(folio, page));
+}
+
 static inline swp_entry_t page_swap_entry(struct page *page)
 {
 	struct folio *folio = page_folio(page);

-- 
2.39.5

