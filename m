Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E4755C32C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880621; cv=none; b=jyP6vl6D/N1jKJViCPtrhSA+TAA+AzRJfOTuNHHDarbS1HHTQqfEPgZP6vD1Lj11AqBbVef9It/XkTwYMDG7FUYk5grdatxYNAjClLBEUxkwtbqqn/mgp7m23MJcjecEBkigRUWSK0Q3/fuN5RGSZS/2K0AGeM7TjLjDNd0eBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880621; c=relaxed/simple;
	bh=LABp5i3bhJrVd0Am+oCrRIeAA5xV3hfOSmtufFDiLIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1FWIms2oY39AhOjBZBncFhcS+mPJ5ScYtfIZVSP2XZYzX2PgI0coS7NGpQzdUBULbOc3vP1MqT9ACC5wlJhzLYENqb46IDerlZkd+qEEEweqjhyAtc5AHQHm8bjCJ10ps2Do3TtPSMq9zx36LcgGYVJJPMB31mhlyefwWnppJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lLElZI4W; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dj+Cb9Mj; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lLElZI4W";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dj+Cb9Mj"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYpVu2420866
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3JCg
	FZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=; b=lLElZI4WDBND/j21exF5
	0Oo0dMdO9bK6mmbakjQG25BaF/L7tpeXTa4lsAbU7J6DLIODHXbFkgUc9Qy4VWNZ
	miOS3hktYN8nFsIztOvv6fGpQQzbmdwdNukcw4N+lvUoFni+Azb+HOgUKlu62og/
	kdkOhzVz9gsY5SNf4nJs7wS/lUGsLtw+tnCSrSp12tZlGKEmuObDblJd83vCj7+i
	BsDGyaQDazVWO5dGobi6JIHwuLEjeSep3sgqQzPpHDu18ysVvCoaZLp55N4PSfIn
	ac52oMyDBnOLyIb5Az9YtV+NV97ocITLWBqkMqR4xmloXiNhGmx5GR2lW6pao+so
	CQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d5d7sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:50 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9102f07f2fdso96611326d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880609; x=1789485409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JCgFZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=;
        b=dj+Cb9Mjq96lLVpVzwVABNM1n6z4zYp/W1pNx7avDHoXqd29hMA+gooHMcnacEteUo
         gHy73cXrFcAEyukMMfI5kxXJLjLomRDsGs9kzlFuqbXxQPl1HLOlKgupX80NNjsue5el
         l1TJOZBEjVuVE/tiAViviy9KgwbFs27JXMMROiif/f87w0PYi9F3sJ+87qS9MrS+EtGm
         j8rIas+ldMYC51nCLfiPgrZEE5DVNvNuXYSnPZIWSO4FFtjrmRbID8a5nhnffnSZ/oqZ
         hGARdfdOjQTp97g+Q1kR1zgMRYmZq0f+CXPIBjrXzxo+GjkTie78rw7OjmPhGv3uhiKk
         Iteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880609; x=1789485409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JCgFZ/UvwntchAgFQ3Xf4ZwQOPcJC/BRoTP7E39rY0=;
        b=gomjdFXax1236Yvsl2HIx5zYDDKYlTJ5iCLW3/uB5Ra18HmlIYYkVpOV5nQ45UwCZG
         pMjwW/HJjrY0/8CvNmN0aZ8WOpct7MuSMuVIIvjgdsZL4VkCWUdvQpCbdlDjCiV6ugT7
         UUnWwE5mNGHL3Yv5eYyWL1g3IqPuEiU2AWnV/zLNiuDujz/Tzv9oFY0lKRp0C8wrZUSO
         9W+s3CKQhW6jUE0oBRDI/zZIXuLqTUUX979cmpY8nqONcs38JzRd/iibodyh2QpqhXsN
         3tnNfaAsdyLS2m8KCVxplhztTYclLb/pc2emotfulOFvEMtIs7QS3EYYe4byihdbR+KV
         roHA==
X-Forwarded-Encrypted: i=1; AKwUvBzt/a7qELidqYQCboMm7BnrL9H7zfi2gRU9ZpX0JhoaSrpzMjl4dFTL9vQhfdYP/OQCJL/1c8Bpp4JljSA=@vger.kernel.org
X-Gm-Message-State: AFuF++m03/iC9Gr4qcpD+tI43gZbDqWCGLpi40jMdpOUEcPsOJjojajI
	sKdko+46emu7yakIKaYgVpp4FC+C7jbvVaq6c8tUCZHJCYLk5aXAuzb7dc6rc8kaqE9og/Ag5vb
	83DDe9uXLlMS8BzLyuyEH3mRb8dctaVfHKYTuJ0zyN5XYXsZF7f/iAdFILocjSA==
X-Gm-Gg: AYBFou3E+JM0ma11EbF3Mc/yaRo1LC2JFpCx7LCWAv6VxOSLAnU5JMKRI3gMS1diZbw
	li5bnoR5fLoFuS/Mzy/TdbtstqNPoJhI8dO4mhlAIUMLIDqtcm2FYg8vH1ilP2Q8k4Zn7yJFRbW
	yyeOxRg1xO0vIAYpMWzS1FGVRxDQkuYmWmGuLYxuD3/CgEqizwY2XRnWFKYTY/bs7+SZ+VrRqkw
	1X5yev9DVSxCZDVUfQpnNmJ3gsISnfHrBQ/iy93TJcfKcWeNbx+BDL+YCITVYS51OxvKIGDDKxY
	fdq10JH8JcwZKYs/zRqlleJSt2Lbd1U+cTScXtnJgviIjmYQ4c6bjA77yLX5B+NyrbkfD09UTKd
	406g/TZcQD/Jhu4h/7VubRdMz44nalTqMuRqzxHfIA74/+Nh5rMS1rA==
X-Received: by 2002:ad4:5f8c:0:b0:910:3923:cc74 with SMTP id 6a1803df08f44-9103923d1b8mr310712196d6.29.1788880609122;
        Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
X-Received: by 2002:ad4:5f8c:0:b0:910:3923:cc74 with SMTP id 6a1803df08f44-9103923d1b8mr310711206d6.29.1788880608454;
        Tue, 08 Sep 2026 08:16:48 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:35 -0400
Subject: [PATCH v2 5/8] mm/swapfile: use folio_page_swap_entry()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-5-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=1012;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=LABp5i3bhJrVd0Am+oCrRIeAA5xV3hfOSmtufFDiLIY=;
 b=6+jR6HpZ06c4dXTH61RnGlMCd2W093XLytaX4GORE5cv8EMZGRyemEpyApxc9zi+TVZItLfVO
 XlmbNtQmc6vBOGaiS1COlSt98pZlWdcycp/k1+8VHxNkEwfvnIXk1gR
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX24jhZAa7GZN3
 aMWgogBva6POFpA6eMjIueaHnczeiafFb813u8pCR+XMitMRXI2GthvjiS5D3ResMlcbTdKu0YM
 p+WJ8+tSAs5ZTzxFsmBi6NZppw41iWT6i35j7Xl2wX3fQ6XKVSYploDYrfBqR2902iX2VGS86rg
 6kKK2/Tq3cq3SWrteSONhTaqdrXP3CGPtgN5OCEeh+zG3JA1kKkn/PDc8WO3rYuobF7fROJfNBC
 0zjJ3ACu+TPeNgUPyBippUMFZIg0ZKrYO+PbYqjzqs9AgnBmtSxPnMjf/R/Nf4Lbt2b1ofXxCPf
 hB6U5a1HwlaxZmTv3T5hQkwbPEvzxyAJkUp3zIxQZn8DxORz6GfEBiI6qDhJ+Izwx3Eps/MyetN
 TYwfQBVOs5UtCkna8petSo4LWeRLVZBeKo70E661C9/MWErf7xgl4wtTWaQuOCBRQBVj0hI+zsN
 XRaegXDrJRZNM9IwNuQ==
X-Proofpoint-ORIG-GUID: 137mpE4ec-iLp7Ce2DyujKHZX-e4giGY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXzZFQ92veFX4p
 BmGnSw3kyZaFAk7D/lWWMlkzxsS+SqLgpgmCMZBzRpuHaaBVdHcNbEUr9Gva5GwIQq+Am+a3S72
 M/KUxhL8kPxbuSpscMOtJ3ryw4CCC6ALu1jUrYqrbMwYvoz/4qqU
X-Proofpoint-GUID: 137mpE4ec-iLp7Ce2DyujKHZX-e4giGY
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6aa026e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=xqDBoplpeononJk8d44A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

folio_dup_swap() and folio_put_swap() open-code the swap entry
computation from folio->swap and folio_page_idx(). Use
folio_page_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/swapfile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 869a918b18e8..0a3a3b2218c7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1822,7 +1822,7 @@ int folio_dup_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 
@@ -1849,7 +1849,7 @@ void folio_put_swap(struct folio *folio, struct page *page)
 	VM_WARN_ON_FOLIO(!folio_test_swapcache(folio), folio);
 
 	if (page) {
-		entry.val += folio_page_idx(folio, page);
+		entry = folio_page_swap_entry(folio, page);
 		nr_pages = 1;
 	}
 

-- 
2.39.5

