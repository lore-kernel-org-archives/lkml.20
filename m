Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69433416843
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030565; cv=none; b=vCwUZKjHKQXyanVN8u7qfNhBCHVl54VCPJoax7vA64VO4odJK8wqZQVzaWQzyB7/2wV9I12pTrWSkugpiZzo0/UWVXIZyNYvPg0uNCLvanykqe2PARv5wfEikXxTlr8KL+rNF4kzZ/03BV8/Fw2mKs/LTq5TRFTkbvqhQVUfBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030565; c=relaxed/simple;
	bh=bu2FKT6Zpidj2DaPOQ18Cz+j6n00zUJsobxVdi/Srlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OP/oWN/zK4rZo9KvI2dvEWLCfB2pCQdQHBsry2I7sA2Op5PHGwmo+LAYPbb3Nndk3SO7S+/hBEuS6NTWgI9YG+5BwLbucuLsGsSXrlhRGvQvrflKg5pn6qg6G3FPyxXVWr3894pkIQiBytL0ufBcSCjLKER55BF6uUhkTCPiimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BrcJ8rPS; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=W0uFR0ju; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BrcJ8rPS";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="W0uFR0ju"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZ2kE1792602
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2plo
	sek4FqZnkL3UCaYJ0f9rmIWELlqNc8zdmdPP/o8=; b=BrcJ8rPS5yZmX+HHDhs+
	5Gt5klBGYmqbGrMkzQHlrd8OTj6qYw3dPhlgw/SlrAjuu5tfyXjD7ISVKjRiUCTu
	esDWg36CP3Z0xhCPcDM0A7WR5E+DdBkyYOHgvEgvHYQl83SnRzslEtHlmwjhiBGV
	3zS1Bg3U/hToW2iEYslWceXO6rk4tvS28yhxxL6YX0ugg+JmIqPhvcu7Z6QJixf6
	l6uBt1bKj5652rsEIUTnEc11jbmaL78zkd3PydGTe2h1kObc8aCv9Mo3t5+0v+bJ
	f+R0dqvzKdKAUhXbmU2Q34ikXvZoD+vENeni+1AdsMysmEd4DWiYi0J+0cBIHx/e
	Yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbsppb0pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:22 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso28320211cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030561; x=1788635361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2plosek4FqZnkL3UCaYJ0f9rmIWELlqNc8zdmdPP/o8=;
        b=W0uFR0juBAvjEDLX4powYmLyM0v6CVj0pI1s9qRlKpXyiUcBLn6/CdCMl9jEEOgWfo
         5H9ajZn+jWM86TDXUEr9UFzoQ0ROw9HaoR26ppVzCCZNPuz8hT77ngfeLwnTy36u4yfN
         8kj4kAE2iTPNJZ8RMdzpoqVHXGSVfTC2M9Wp6id/OfE3vsda8bgInCvBvDNOvPtKOv9h
         hyRCYjBWj884V+nPbh37NO+UHppmHsD3D8NiL4S9J0gEcJS7zkjsJ2bz3Se1eT+eF/bL
         USeiWBo095RTdByQtIYvSt+Ajfn+kA8FlQBRgWMe5ijTVFc1LnLpiF/i94lFkSr78DZY
         c51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030561; x=1788635361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2plosek4FqZnkL3UCaYJ0f9rmIWELlqNc8zdmdPP/o8=;
        b=Cr8NM92z6icY7LAcDKbvy4fDhHqDzUFuVPcZQbT8ERaoZduk9rWI/PmNnxP5jB1Pwu
         +x4XdKNSpDWU5R3Bxn9GtZm+HYtaBx5DS8Luxd8jDPmKbR4hZxJJiBalMyTbqJ9By7h9
         ein49C6Mbt4xGVulb8qx5ffU4DrT/gAMzsmSQLAtLgXffx29D0q5JQwQm5R11KziTVbA
         Wnm93VQTZOJKW5yYqDQ8YEVwj+eVIK9y65MvVmdqIMueeV6WgvGUdQuM3FgQ8r7U3rRr
         YiKGkGTRMaKYQnM9meDJ8YuOQSA/B6JAHsEIQgHibTm2zbxvfzw3L0T7C3Des68AwcdB
         +MQw==
X-Forwarded-Encrypted: i=1; AHgh+RpPv9SHUk0EhXEzptcxd6Ag3GgCv10rLnOYXNhAUpHlwKmFj7gSchPthS3pe9Uhrty7fqzn3AZ3eC0yZps=@vger.kernel.org
X-Gm-Message-State: AFuF++lFkS0Xdnnd718i63ScskOFF1eZpymwZlH4Z6/wEuh+GVrweO9j
	5bSqHlgxwndebkH+gugDKozTx5IILZZuu33pP4vDGUsAeR26NAr6R456GZAZ+KfXe8NEnstGnin
	mc9okF2vZZCKI4PE2jayLS1Rd+fsQ5deXSzmzdtLyD0FVrQEA5xLHHhnB5g4aSQ==
X-Gm-Gg: AR+sD12UTdKIouhQkBpNsuJkmyq7LUTxtKlhz/8Mj+3Tnnb2BmEPLX1flqy6UDHl4PW
	b5EYt0B/utRbQ4CB/JWNidBTeY9lTrFMFOSdba9g+xJpSmcSVJHR5GDl9Sk7po4z+FtxtMRjzK7
	lAwrVZqMRBkMTXFARst7CCyPzmcO3jDHiObrBOot7Txcu+7TYjwMchiu5KsGP7qvTncAQCYwAfG
	I/Bme6YLlvUQ4Auk/sXn5I7qG8BXh2YZHMZM4zpS1298x1BYant31JfsqEIDtBYTDChf2tGtNHX
	TZcrx9Xt+jL5B7VUaO3HVRH9l8sd2kWGja0PZq4u4t3/59U8Rv5b+oZp5nh29K7wkuTec+gzgC9
	LgM9mXCN6wXDuq6VX9QdC4pOZ3X7cqWLvZsDxSRmVrQ==
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr189376651cf.16.1788030561684;
        Sat, 29 Aug 2026 12:09:21 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr189375951cf.16.1788030561276;
        Sat, 29 Aug 2026 12:09:21 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:20 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 29 Aug 2026 15:09:00 -0400
Subject: [PATCH v2 1/6] mm/page_io: convert write completion handlers to
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-b4-page_io-folios-v2-1-649728091117@columbia.edu>
References: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
In-Reply-To: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=2005;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=bu2FKT6Zpidj2DaPOQ18Cz+j6n00zUJsobxVdi/Srlg=;
 b=SPYQA88a1LAIj2ZZnebxGr/3d/I52y8G1s/0Lon6h/WCJaTMjUdonRWdeaHSGfbAeW7dGmWcG
 c4+4WEPqIaHDWVvjeRp5+0FHnBusNxXIl3AcpeV6qrFoa3+y46ooI4L
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: U3S8Cc-DpBSY-HW-3p8nkt9QDfAea-CM
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6a932e62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=ufHFDILaAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=rmnECYv2iy4ui3MlnykA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ZmIg1sZ3JBWsdXgziEIF:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX7VTYv9swMU0P
 BGRmBG1snmG5gR1MiXtg1pSrebT7U3usIgJIekqBc6PlYyRjTWY3hVwEBrCo3UYcPj+GzWgTk/B
 h+s5rBUsGWTVGqJSrhi1W+ddUX6QU2PaDQ5A0NNnplR9fcKrqFjk00AS02ypO4o4bol8zeX5U3y
 KH5AvvZYKHWRF4ImawJrqqEVxmjqGqID3lNI/T3PeMy600W5QeWUPnSfTjQgPxbLuO3+PWJ0KhR
 Vssdkz3NGzmpPRSBKwxEiwAH5xlYEeaZ7SoDdgnd2gbBNLXrtUvYsDR3Sq/AxgX1J3VpfnM0H6G
 TI7eJLgrApk10+nmpmFmSMpuCnrFQTl7MJNFe5/3sP2xEUs74mmnTAoh+t0EYgdSelr3RkWFENB
 ozBiEImC6X3wghAOGKCvqZpD5PPgcyskm9vrhZsbIQFirv2BPiN4rtwSnnRQhY6YWQnzOy+ieXB
 k5slK4E9jgbiERpoTMA==
X-Proofpoint-GUID: U3S8Cc-DpBSY-HW-3p8nkt9QDfAea-CM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXzsSVy0/mf3dQ
 SbQTcijt5HD2p54t32gSqc09P704Q9OGpMmswNm0yAonW+s2pRtrkVrFb+6iz4wU67pS5uMZ2I6
 1h7y3gZU8TY/f9Mm9hhI7Ewxc2usktmIa+nyS5C8z2GiqweYSrrt
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=10 clxscore=1015
 phishscore=0 bulkscore=10 priorityscore=1501 lowpriorityscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

Convert swap_write_end() and swap_fs_write_complete() to operate on
folios directly instead of going through the folio-compat page APIs.
This removes calls to end_page_writeback() and set_page_dirty(), and the
last caller of ClearPageReclaim(), saving two calls to compound_head()
per folio on the write error path.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/page_io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 88962571cb93..fbcf58ff292d 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -497,13 +497,13 @@ static void swap_write_end(struct swap_iocb *sio, bool failed)
 	int p;
 
 	for (p = 0; p < sio->nr_bvecs; p++) {
-		struct page *page = sio->bvecs[p].bv_page;
+		struct folio *folio = bvec_folio(&sio->bvecs[p]);
 
 		if (failed) {
-			set_page_dirty(page);
-			ClearPageReclaim(page);
+			folio_mark_dirty(folio);
+			folio_clear_reclaim(folio);
 		}
-		end_page_writeback(page);
+		folio_end_writeback(folio);
 	}
 	mempool_free(sio, sio_pool);
 }
@@ -514,16 +514,16 @@ static void swap_fs_write_complete(struct kiocb *iocb, long ret)
 	bool failed = ret != sio->len;
 
 	if (failed) {
-		struct page *page = sio->bvecs[0].bv_page;
+		struct folio *folio = bvec_folio(&sio->bvecs[0]);
 
 		/*
 		 * In the case of swap-over-nfs, this can be a temporary failure
 		 * if the system has limited memory for allocating transmit
-		 * buffers.  Mark the page dirty and avoid
+		 * buffers.  Mark the folio dirty and avoid
 		 * folio_rotate_reclaimable but rate-limit the messages.
 		 */
 		pr_err_ratelimited("Write error %ld on dio swapfile (%llu)\n",
-				   ret, swap_dev_pos(page_swap_entry(page)));
+				   ret, swap_dev_pos(folio->swap));
 	}
 
 	swap_write_end(sio, failed);

-- 
2.39.5

