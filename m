Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B992F7EE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086042; cv=none; b=OJntqtJa6DdTeulLRnw5wDujWrQy6HLlL+kefvRG94Pqu9Dildu8bNvgFfPvuxPQ/Do7/dQV/8XQAPJHj8R3AkKqsFeRBV0y6phHuWYFxP4sUL+o5LO14B2RkYrDam3d323JHilwdcSOVWbLtS4WkXnt0hXV9EosYXixk4awH0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086042; c=relaxed/simple;
	bh=I6pqPB1rjj1dnKeDegsZzTB+MKdm/VicYFt2MhO9II4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpLOoah9ZEsRhbBD3QJbxMERjx1/1VNaIzSCMVQxESvXm9NPSNXEKD9UEZMHwBgd3kqI6MKgEUPCfUf24tRR5oOvpueu+OSYp6IPPsncTd2qWVrbHZcZaSSi3wXhXQjwkIiGuUOHKMVLUwgOOHxJ/oRAHtjE15H0YwqJghJVBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=IXoUJkw9; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZlHTNcX+; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="IXoUJkw9";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZlHTNcX+"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9X3Hg3653484
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=4LuS
	1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=; b=IXoUJkw96fCN/XyjcqpD
	491pbwuYBSKoPTLPSK88jTx3wDc5f/avjj6UkJfc2RY+eAXpwwyQuVm/CNMHtJdt
	I3SGbEttZPJWlVAnQWpY8RBO1G/772+Ed/ktdidamMf2U2YuNV3v0kbAutlecFIu
	yV8AtPLAInDKxKKEMzKIOOeDNBNK7ebrtoPtSTWSYh4POq4ZQLtWI41ynENlkyQ7
	dMv3OQiPLdifw0uCkTh3pu3fjZHNkKI0nHzp+Nola8S3JI3V6OUphApb6lrpoNyu
	o6WA83hKxfObfo6DkAA0GfmTq6W87hHfksB9szLRudRNySij2TovNephxdQ9gyAc
	fQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gcgdtg994-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:59 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fb8f67601so31888351cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086039; x=1788690839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LuS1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=;
        b=ZlHTNcX+pc9HaSD5mKOJpBap0KQ+Y2zcb5fNTe1yoWsQjF3LX6JTU94RMRMZZzvRen
         TNEaCJOoMQqgAl2UNGTOuehxuDVpar7vve1yuA7IfRtCyTgCP3pVHlmjT4d0o5CYhQWz
         dDumBN/zXUisn9qXmrYJ8v0+rlxW9anaATCtyphVBv8NJXXaI/6+xt3uaJ9QbK0qSGWr
         pvZKSlia4eeJ5gNClDPdJWAjlUWs4VRc6Vy7tfUoBTOAzo1K7+xiY91AMVw8A7RXfivu
         8Ih0AClPs733zoAZVWhWmCuok3v1E3edwSUplYYu4ZM5sU4xsLGyaQPddjJB4R8VG58k
         Lczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086039; x=1788690839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LuS1cAhpHN/002NExYW8l/WUkJ7AVF4N4va/1EdeIs=;
        b=lHz67jQTeAPwXQXb/7BLkipExa81HabaT/8zzBqblrn771ltrL4/4U6kj1x4jB7e8I
         YaEJcivLA9Ji0o6tKnvBLn4bufCn7WiQ+JsiJbXkBZbqhGwQ+BEjEluMZf3Auun8DqY4
         COdkzX+o00rUMpvsc6COBC3euYlEio1yAsB7BHLFc4keHJ667U9HbXkrBYpb6NzAw5kJ
         gunPz7lzNO/rKtpTQa9w++bUu/1JowFvzqgR754vVZOOtVav0+LQ0LYi+2K8Iz1Grjqq
         0r3VSBoTqVTOsIr1ym4iYjl8U9OuGnN5jersSvXFvKfMme8KJtKA+BFmB5qt4k2QTzve
         puqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCdbZahD6aZKITkEFhkyopAdQBG2D4OU+lOFRVH6FijM+3MZdAnEvypnMzeYG330ylJu7LmqTAjE3mvYk=@vger.kernel.org
X-Gm-Message-State: AFuF++mZCT5DuJJ2LVlPnuZwo3k6f0ENko4JDKrWb9dIoP4+8oT7lae3
	DObFRz7TQy2hkXKk25KqJ2QyATRP2Sf+A5c+X/GIrmuwKmNYIC1ttiOF0sstcn5S3CvEJEWE5fi
	PEgmpS3mHJW+79BYUxCHGVHXP3GC6p23BYuQvCGmq9WVocvZ2LORujr1GDRiBWg==
X-Gm-Gg: AR+sD13GaxpYhwZvIhiBIIxwLvGOPnjaCMSRRXRNVL7uLMp6wNftDa+4Kv0ewfUNfTz
	mzLsQVcAT7uDy5FC4BMaSQqENwyuokWa3/yivu/QSJp9E+ZTl4PE2k1jUx2xRt/67dB9BtGRkeM
	hoAWdpV/YVsE/6Ei6fEcQ0lyUsK3+Nul2e6vzb3kNijdGv849OOJnPkFZvHdsUhClHYFpuclpRu
	7nYjDvvvNXvCJmvGLgFrqpWZPsav7Jh8K+YWZjvkrgpJXGMyvG85NhDdyFcUoSCnzXLbInG2N31
	TnlNPd5f99Hx2SVhEz6gv8gI2vTU0XCItV6bxMzPJ0XXBGWTDXZsd2kgeD6LMtPYAYNMmv8hqQm
	lU8/X+Z6z+Vr9vhekWSvekKpVBKCrk10DkW8vgvCEzQ==
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr248428311cf.34.1788086039174;
        Sun, 30 Aug 2026 03:33:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr248427871cf.34.1788086038722;
        Sun, 30 Aug 2026 03:33:58 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:57 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:30 -0400
Subject: [PATCH 8/8] mm/swap: remove page_swap_entry()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-8-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=860;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=I6pqPB1rjj1dnKeDegsZzTB+MKdm/VicYFt2MhO9II4=;
 b=c1jy1sFkrBpeZiQjHJklG3Cc9bw220ASIOw8htXuLhr6GFpKtinuTg02ps2C0CsMWWqMiNTgv
 qRxm8iGyx/jCCuJf20TtrXph9N7ANFUH4+EmKzwECevAXN+hQ/31BDF
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX6EZnl0UGlduK
 jqjNRjiKxFQhWOoFuFmgVv7ryMfOvTNFG6k83Z9txqyBgCjYfBL2y7gX+s/z29gfc9fTii8C9tp
 qvwQJj0Vh4I3jTcdLFC++/syQAF6Pn7k0oposbkG4YG0AAcdyOxVJdrEgaEIlDnu4Js6MA5a5G7
 YXxDGB8qmtWUoM+djH6lXKlfKecfVwqyjIMT0AlFGkZsmmTWFSOlm/29DFLDXaHLPrL8Ul26LED
 1RlY+OkGgmVV2kJQyj80Uc0ZYFDuXJUv0lcNEnFxmGKHn9jId87Kn31C/TZZhoocEr9K/gZ96yG
 wp/28g2T7TJ4DeD+lx6sJXb44+HCspJcaBWp0xN4T8UCWzXGU+0eSqdErowawYWX8R4Yj7eaFWr
 I/O8dxNc7oouHsHIMSW+WnYYzqZ4y0VIETnkoB2IZcRqh0YllrfBILR+OJhi10y1WntSmoM07f5
 DXoDCbxRQRbOwK7uhcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX9x++68l+48ll
 B2qohpBp8afRNVYSHUPRPGzabpd52ZzT1fU5PpkFZVCfi/5PJN/wPRJbigPxZ8f9sOdeHK7nCw+
 8npdipd8gAe0H4jitztqGthsQylOxST4X5fEqX23yjjWZQV2AOdJ
X-Proofpoint-GUID: TdS--UoIZScUpLPcQHqS6lr4FXIuk8DR
X-Authority-Analysis: v=2.4 cv=ZKXnX37b c=1 sm=1 tr=0 ts=6a940717 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=t2YXVXqu3yB8mPBWm3YA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TdS--UoIZScUpLPcQHqS6lr4FXIuk8DR
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=10 priorityscore=1501 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

All callers have been converted to folio_swap_entry() and
folio_page_swap_entry(), so remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 48632aacbc2a..2fa436958fdb 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -311,15 +311,6 @@ static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
 	return folio_swap_entry(folio, folio_page_idx(folio, page));
 }
 
-static inline swp_entry_t page_swap_entry(struct page *page)
-{
-	struct folio *folio = page_folio(page);
-	swp_entry_t entry = folio->swap;
-
-	entry.val += folio_page_idx(folio, page);
-	return entry;
-}
-
 /* linux/mm/page_alloc.c */
 extern unsigned long totalreserve_pages;
 

-- 
2.39.5

