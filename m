Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071655D866
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880620; cv=none; b=jxNWOY/Yxy7Hyqq/aqmckthQpE8giSxu2OklDwxFQL60kfORNbVyoEBIdK0+CsBA1DV/DMoaovuVPsqcub3ajsOuSMkV+cZJ0c/gEFJ5cQBOdUzKaG4/vV4c7GhbFq40uur21vhwgIc1YaNbaSJMVqDyQGpSBo7ZLSTpJN5ZRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880620; c=relaxed/simple;
	bh=1JS3V+JXyWaTrz9bNNi6UKDOHKnZIpXXTUnttstZ0Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnHiAcsFKO5mWZ4tjv3NPPsepbBVSKPAzupg/WC2YYNdlg3WxmLnFP2wg5Li5Ifqgdlwv7I1iAwgHxEBTxSYPWq+bNFcGtv43sxw9eiA2rzmc7b8KuHOjlsMWYIcUyiP8GaBaINgZwfSaQFyVtc9erm/BKAeU5fK2slbEloK0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pi2SEGTT; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=n/2W8q9L; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pi2SEGTT";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="n/2W8q9L"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYoTd2420732
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=jZDB
	ZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=; b=pi2SEGTTQ3BGzxs7ah1L
	v2Q4FGn8fd1y6BTX/hVySPBNMfu34Pyg5I6AczMna0PydZJ4KnwOJSdvqZFzekd6
	LR1vfVFEhSaCiJc6KFf59RB8DZnxJnp2yE8cxGnja/jLGmZGR82PEtLSZyvTL0og
	5lFxuBd1ByPKYHK6FuUe393kiyB7OUywBvAWrXvCdA4BVroFPPdubZLE0iaSr0cX
	dlw6PArfthab3j8BNdMqq5hChipn6lO821E5zA1Zs3h9gTXGv+hrurQtCoTRmtFa
	FGLYkf7t9pGA0/C4o/xGnblYVaoStnvEy3iQ3LpScPxzsOzwtbeeiLQzcFejHqx+
	Cw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d5d7r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:44 -0400 (EDT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-670ff598ac6so1050126d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880604; x=1789485404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZDBZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=;
        b=n/2W8q9LgoQLAtB0Wj3P8iToel6qaCZ15fzCqC5VSeSm7EmFX7q5ZoziigRLZqcl2Q
         xgsqOEe81MlZ+L163OnXUFq8ANa/sI+k+RfYRLwjFZtglA+A1eO0o2zIwMmeyhz5b0hh
         fdv/GSKP+sAggbbH5WpOU8LPpL7yspfCRGdicUeJUsn0JEeQvNJYaHyADzbDrpFdemDb
         1MzjsKlUOYjtZIj2G7/pHMC27lXQUh3PqFMprxFEaIOcxF0OC3MY3IJoAjkfwM4mEJnS
         c7FPwkOs6pEgj3x+JoMkfmVQHxlUJRFd4IPYAwkuTvAWQ7X1zN5JYV9ZmQodBLqntwBt
         cHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880604; x=1789485404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZDBZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=;
        b=R9BxzpnbIcvwBN2up/p3dMwcyl4UWrL07f9VZ2iQzMDnzBMZnwC+o6NgnSuEozptQU
         OG++Ffd59u62uyTxtGC4H6KVYueOmVhWLt50DA6/Ruqu4r7ZBcZY7TOMcL+F3dsayGcl
         J6h042GyQ+Ob/TaVSrphTS/WmuCMG5h3K3LZmCGJJrH1iZfLWD85yJFELK2IKXG0tJwo
         mB5GrQWo9knZz9j16WHGLFpn3DgJ4ju8HeKoH75pC6BGwzMDU7SUomnqkbAI/9ZDiiYH
         J/heiTen45vNtmZpnPzletebYkNTrEp0xs+XjVywEluKRwy3GlG5U1k5pAGZae6MOIlm
         DytA==
X-Forwarded-Encrypted: i=1; AKwUvBzic8MiFLvosWDv4+9C3PYklB9mNK1cBXxGHNQRBNEtZeHiZ1xGjOlOHVJf9BIKDh041aju/hyuKWG8CNI=@vger.kernel.org
X-Gm-Message-State: AFuF++n73aOzXCZbeZcuTQDbNcSekWDflZ13nEF+zdeOVyDhtTkxsM6R
	NhTrQmnJxCSr0aFB7Gmv+Uh/a5wZCh9DAM3cpJ3nArAcB/ONImXcgCX187SrryH8M+W6sbQMu6/
	1ev4yuGrEjXlo1cB8lqpikXaXAhrH4T4bFC53ZgbQxKmfRDM//6ScfxlP8fGhdw==
X-Gm-Gg: AYBFou0WXJZezZnbCWPtt6IdcnN7bjf4IDuVgI/2F6u7CvQ5qnE398WyVNr4pY5yv++
	jiWXBhKu2UDehBj9Gf1A9+Nc/GIycGEWXYAQV6TcohZoGUSR1LyzzGi4GdhfqgNh9WT8AWu9c8h
	O26uRK1kGg3eCOCiqbvXLdQpjNIjof8P9U+2/OlzCp0/7ReZ4jDtHlMjprLsLrMhxR8JMvzxdQd
	Y+4JOidiNNG7Zov6/xn5UYZ019JW1zAxN05emBT+FWGQgNv0fYtgHNOwThzIsrC5YpUZZupyo9h
	sHx56GLVg+8bXm7ezubOP01m5Vem/ZXyzPWqbnBxoUA43R3TqXZd7u740FSTipk5tMX8lmvgwc1
	VlNEwPDqpxp8MVoiQ1VKoS5TCToOnojDg8HJx46M/4MybUrDwrLDQvw==
X-Received: by 2002:a53:a0c7:0:b0:66f:c1bc:87ed with SMTP id 956f58d0204a3-66fc1bc8c18mr5315781d50.70.1788880603807;
        Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
X-Received: by 2002:a53:a0c7:0:b0:66f:c1bc:87ed with SMTP id 956f58d0204a3-66fc1bc8c18mr5315741d50.70.1788880603125;
        Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:42 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:31 -0400
Subject: [PATCH v2 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-1-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=1JS3V+JXyWaTrz9bNNi6UKDOHKnZIpXXTUnttstZ0Is=;
 b=w9CAxnD5RZ/nskXa7WUspsk5TqZ4u0clJSlm+62svGyMiXevHQW2C9NobE10fXR3pxRsqiJna
 uE3QKWw5vWDAR4klvdmTEM6ALzGzAN5N5NtTGukn08tXaIj2hcLErkj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXzWFcAfXlIyRu
 9ehCR24t1FcWvNCON9iXoICL62r+PHyGEzFWhMymfLuyfDBLOEckp74/lhEk5i34iDx/0P8S7C1
 trFfbaz+w7m0WaI/OrT2O88OoxxeJkfen/CL54Fx6+rG2aL5OsV5K76mS9qFnf3HvfM5O0tJG4A
 Q2a9kd0hQRCId1WtWiw1Du7GtstsgAwD0erqQyQo0mmq8l9SJZz6hhlD3Q88O7e1pqPr1R6uw3g
 s0OGgyjV7kVOWowDP7skZu6D4SWVTH8jH4lROdpQp3uuKoZ1GVzBU4VZoFBL9Jxd0aA0xb59sdj
 woClT8Mh/NhNq8tnys1u8AlaPE/8Zf4oVzSzXP2tvqgobvGS6Bkihbcz37rnHVLAZR+6SJRb/33
 tkY5QJ5j76/2qrBaefmrVfA1IOT2uTsmRi6pujenMXQiXsz/HyzvPxiG9/GEcZb4rp0hwWrq+f2
 O8vEf+gT1MP9thCDZGw==
X-Proofpoint-ORIG-GUID: yjjlI7xAq8nNMkZfgd41wQgxV8n_sd0G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX9VOHatqTCeno
 BxrzzSSul5pmRdmkWTkaMnhK4vAg2j/+lQRYtvzHDhQy8e38y3lkoDLQItU2QOUJa8dB1wgm9At
 gygkITFcbSt+DIQdXePWOOkmTF6OApXAHlYEFNXAR4Xm4zZ0O8Zr
X-Proofpoint-GUID: yjjlI7xAq8nNMkZfgd41wQgxV8n_sd0G
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6aa026dc cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=wCX1QjJdxvQAooojgaYA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

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
index fc290e29e4a9..1d979e76e78a 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -272,6 +272,39 @@ struct swap_info_struct {
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

