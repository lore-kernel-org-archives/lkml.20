Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991711;
	b=pnbfvAE4gmiAqz7ruh0tKwmJxBHieR9bCt6q4Ar63jD1Z33uQBtl1J+FPQQB2E0tT9uG
	 98FYaE4GnVSdaLUbHh4r5c4SZlNfihNBrKjyv2hnzPggDeCXeVzFIMUDtF5wHUFSYPfi9
	 UNBf9t2OA7wgpk8rZGmUk3IyPGhEP/Xlf9snMTfj8oYjaGa6k9d+sSlNpjzLwVr2I5Nii
	 so3W3A5w//fS59fE+52YT8lsdq6SSukNTnFPhj/K0Z7iUJm4UHrS5vFEpB11KI/mR3QYv
	 yrw/Z8Tlm5xKM6Fe09eRSAPLF7VTM4C65OOpdR0mvvYX9cRWmtmRDfO3cWohkiM3tsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cD9XMWmu28du5sBucKcf/qLLpULli3evL1g2J4Y6yNg=;
	b=yIavfHCIwRMVt85dPb1QiylCc8x4guCDP7EAVDT97vSlqCnxaiiZc9Lh8hn0RzI/FsjQ
	 5fj/Q8u2BO2H9TVSgCACvhVvNPHjQUPeXl5cUNRScxwkj3q/cpJw/klyneWeek9Ov3eOq
	 UMbH/MIrplxw3F19BT9PGmGQE5gc+IfLCqZjjfCVvXi7bkzCvob3RJL1zM7YnWkiFgbFU
	 D0rXGM9uOw+WSzczYBmoGAx5ecQM22Ksc/Npjg7vrdZ4A41t1d6uzsheh7FVw5+AklMt5
	 aJrVxNs+HNEmZE7OitRPY1JsnMeZLyRF90h2nRAiHi71C9F9P8I4V/rLam6xDLup9Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=bhKeRa+6;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=AKD2Ndr4;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD541606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD541606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=bhKeRa+6;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=AKD2Ndr4
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6J09Do2715437
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=cD9X
	MWmu28du5sBucKcf/qLLpULli3evL1g2J4Y6yNg=; b=bhKeRa+6i7ewrN2EwYw6
	m6FjSXWRZR1FVu3pA3AQ1rdy67wwrxRFcYqUMnEo7gPanbSrkhOmEFTI2Q9c7/sN
	eIghty+Ms2oFa8755O4a9AeQByM8yXEsO2oyKLNqUlh4t+xPVYf9JMepthD2JGqG
	UEt2Obah715WVFB3Bauov1bYkl0gnhilPR9Dk1Q+IjIxacLTAvn5DFmzxZWzX5hg
	cWl2/JYodj8zW16deMUtNRvAJ05aAMBJDghVXgGLyxQLLPXsjHCW6m2bYgdsPYOf
	AU3au9sMhRhmYeYDs/MkHZB6M077b8H/Ld8hnCtt7inSSlyJ/JYowoNkW6I7p6GH
	Uw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hsmnw00td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:01:49 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea053ef90so18075956d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793991709; x=1794596509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD9XMWmu28du5sBucKcf/qLLpULli3evL1g2J4Y6yNg=;
        b=AKD2Ndr4QzG2kn6WShi+3fASgujy9HZil2lqIqUBwzeRWfCi1XcYLqH7BbIrE6kl8k
         XrZh37NJWNxVeQJizNJioflEiWM89U3ehTXrlGvrokKxDbY/PKLJ74zWJ9D9AkkWi/FK
         xh897fWEc5wAM7MCGyB6Xkx6iCJVG1OIoxwNaRTWAEfeThX6T240UmZMIiPlarjWtECB
         o9KohlSgL4ZQKh61COE8qMv8foRBGTtTIhO6mLrZuSl/XGcwx+v3PMoOyAZN+MO7Pjs9
         xgD7h2gsX+8aasULf4RSB4lECUFDwEcqhv5Vy7+Gn9SvkH06YXGYWV3d5VAMn+/g3I9R
         uZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991709; x=1794596509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD9XMWmu28du5sBucKcf/qLLpULli3evL1g2J4Y6yNg=;
        b=b4sDJqZEMuiW7b7O71j/WsdRLaasY3wYUUr4/gxGcMukR2lOWZX3ttwSjQZSUguv0U
         6eO5NEIkqGliTPmJuveJrn+paSn3FM/Fh4pM0cpOicFFCZfrv9WR3BRB4uUWkOlm73WR
         k2NxyOcGxGj37nh00xkW98blD1nqLINM54+7zy4b7VIJ8WQJYfAn6d/CYCmBp7DKkNe1
         IaqCRQbVoHwZO/0CO89W63er61l8pdQutMmqDgA58i2OYBHGrs2YGBC8P0wWUcQiKCM7
         i4BXK9dmFyhCzPdGotpQxJoXbpF+lPx51oErz5oyx/LaluLBa+EYBYQpR+GM4OuUxTyW
         FKzg==
X-Forwarded-Encrypted: i=1; AL+hErHqZRvYIi6y4FHhSM/TLrBAI/5nuIF0OQwyEKdRNSK1xid7A3sl59nkDWpkWh3AoYy6hrJQqDwi/t/SBws=@vger.kernel.org
X-Gm-Message-State: APuU4Z88La/S3nF1CZ5Y/+nFon7P+tn/vwOYgTe67Hx1YdMNEzkuEmHW
	ZGsPX62FSdZlCXVqyHFx6KAhzE/Ho8HaZ56PGQTJ/wOeCJh6EZHLaagWPcEI6g5p1IeQeXzmPDW
	9FZb7uAd5FlXmkg3gslIejCvvardaZFl8V4tgw/t4TIMj+xqX/AJ4nMhAOZr2SQ==
X-Gm-Gg: AYBFou1qbl/rdGIzT4lbLqfnxQGkzbpLWhMPzV7gD8HxfVi7Lukfv5/WKISeOCKg3sq
	rNZDWPKW/EfDprceXLKMDWfpLS/pZnJmm2+ShSz9RUv/AAwLVUbLiKxd4wniJRiyqb7Be6sUg76
	wXpZfUAhr3nWr/l4+NWPZZieqt3IO9sXMco+xbCyItlHm236B+tc64OziDHEwx41Lu6/t0QtxhX
	CVQzEmCis70a4qxFlgFe/rAKYHU8UoUuw/kx/aYCn64eFJ0WN5ckweqUATGx2+E3h9ZIDwu4XrZ
	yrflyvpmjzsG1tjRd0Dpnt7vlRvr/mgNx7b15hdqMxiSQuXE8WpxVcJS9b/buQEejsWo20Q4aW3
	35b6UbXJoBH1ODSggEZTHF1JxzJDBsw+aBj627A46LAHO/HHkMzDTbFADP4eOqwytRn5zCPuGq5
	q1JxRpFblX9bcX6I/u1lUx
X-Received: by 2002:a05:6214:601c:b0:91e:b360:1b11 with SMTP id 6a1803df08f44-91eb3601b31mr25814406d6.13.1793991708839;
        Fri, 06 Nov 2026 11:01:48 -0800 (PST)
X-Received: by 2002:a05:6214:601c:b0:91e:b360:1b11 with SMTP id 6a1803df08f44-91eb3601b31mr25813896d6.13.1793991708178;
        Fri, 06 Nov 2026 11:01:48 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-224.net.columbia.edu. [128.59.176.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a71bfesm27276376d6.25.2026.11.06.11.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:01:46 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 06 Nov 2026 14:01:20 -0500
Subject: [PATCH v2 2/2] iommufd: copy to and from folios in batch_rw()
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
Message-Id: <20261106-iommufd-folio-dirty-v2-2-3f0b0be58c4b@columbia.edu>
References: <20261106-iommufd-folio-dirty-v2-0-3f0b0be58c4b@columbia.edu>
In-Reply-To: <20261106-iommufd-folio-dirty-v2-0-3f0b0be58c4b@columbia.edu>
To: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Philippe Brucker <jpb@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793991701; l=3624;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=qbvxJiYzVqagil7h9OhUxgENwgVjM7SJdugGohzXnoo=;
 b=SBKMHMaKAf5mPu7DoUiRlKc+BykU8uhp95eLQlmBJPM20Y9evsgRnhfvmuXp0JlJhfFInNa9D
 jNjbRtV4xZJDchCg54KqTBX8an8XJnAY25mARlJb/ypiOP79AyuWfSm
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX13ioMjfuULN2
 s2ZNpHTBOVQKZWF1/OOHCrWuuFStyMinbzkfCaCBUEWACNeYRocFIc4AcmTIU6/4plb87iXs0Ok
 51iUjSanbJgPiIBqi2QFBbiZMKmbdjq/Qq2vr67pR4XBGkwXsgmw
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6aee241d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=bIa82ERlpw6mw/X9g1H6cQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=Ikd4Dj_1AAAA:8 a=RNgnFTfOqsg4LCEnESsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: UCXieK8r5C4Kc9u1l6Qsg7GgPCvvJ-3Y
X-Proofpoint-GUID: UCXieK8r5C4Kc9u1l6Qsg7GgPCvvJ-3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX3rqBmCrjY4/X
 Hh3Cr8dwQ4BZZzns8ugyX/R8suG5TkUZ8axur6tOfkeTQk9ttb39rEdkoM2gK6HkwSumdhUfzXq
 DhUZMcmzEAXDs826O8KAEEDUiOB/+JRDWoqPEzrJrejchugSV9Y/5ZWmgr7JCNrFRuOQbq878cS
 35neJgj+2xv4stjLK3stpF2a+CEYAzLLsTzuCXWmOBlJqCj2lT3B3QkJMvTBZpIUs9+BhQwtbhd
 uaisrFgzo8GwBM9k9y9cPc7ctSgeMOWSMBhNrcqPC1qTw5vMhOty1uNiLYotNBZa9d/Dc12NQhk
 pQ2cWTfM9l0/dLkc3LNpSIw12UG8FKV+wQlqYXO+U2Qnx0BVPH/fCqdjeitL3Q5HHYqhpmt8YiF
 bWOOQMqkV6Wup8yb7B76gOOKc/yt8ePBL1WgxNTy7khxXMA0m+jnMY7icN75MgkuyrRR+psT6Fb
 jsqSmVByBagTPPVaW7w==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11958
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060075

batch_rw() copies one page at a time and, for writes, dirties each page
with set_page_dirty_lock(). Walk the pfn batch a folio at a time
instead, copying with memcpy_to_folio() and memcpy_from_folio() and
marking each folio dirty once. Convert the single-page copy in
iopt_pages_rw_page() to the same helper.

iopt_pages_rw_access() rejects dmabuf pages, so only pinned user memory
and memfd pages can reach batch_rw(), and those are always folios.

memcpy_to_folio() also flushes the dcache after the write, which the
open-coded memcpy() didn't.

This removes the last use of set_page_dirty_lock() in iommufd.

With ftrace timing iopt_pages_rw_slow() through the mock driver on a
non-debug kernel, slow-path writes to THP-backed pages drop from ~1310 to
~930 ns/page (now the same cost as a read), and writes to 4K folios drop
~9%.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/iommu/iommufd/pages.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 2f6153108add..133fed4495dd 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -721,19 +721,15 @@ static void batch_unpin(struct pfn_batch *batch, struct iopt_pages *pages,
 	}
 }
 
-static void copy_data_page(struct page *page, void *data, unsigned long offset,
-			   size_t length, unsigned int flags)
+static void copy_data_folio(struct folio *folio, size_t offset, void *data,
+			    size_t length, unsigned int flags)
 {
-	void *mem;
-
-	mem = kmap_local_page(page);
 	if (flags & IOMMUFD_ACCESS_RW_WRITE) {
-		memcpy(mem + offset, data, length);
-		set_page_dirty_lock(page);
+		memcpy_to_folio(folio, offset, data, length);
+		folio_mark_dirty_lock(folio);
 	} else {
-		memcpy(data, mem + offset, length);
+		memcpy_from_folio(data, folio, offset, length);
 	}
-	kunmap_local(mem);
 }
 
 static unsigned long batch_rw(struct pfn_batch *batch, void *data,
@@ -745,15 +741,21 @@ static unsigned long batch_rw(struct pfn_batch *batch, void *data,
 	unsigned int cur = 0;
 
 	while (cur < batch->end) {
-		unsigned long bytes = min(length, PAGE_SIZE - offset);
-
-		copy_data_page(pfn_to_page(batch->pfns[cur] + npage), data,
-			       offset, bytes, flags);
+		unsigned long pfn = batch->pfns[cur] + npage;
+		struct folio *folio = pfn_folio(pfn);
+		unsigned long idx = pfn - folio_pfn(folio);
+		unsigned long nr = min_t(unsigned long,
+					 folio_nr_pages(folio) - idx,
+					 batch->npfns[cur] - npage);
+		unsigned long bytes = min(length, nr * PAGE_SIZE - offset);
+
+		copy_data_folio(folio, idx * PAGE_SIZE + offset, data, bytes,
+				flags);
 		offset = 0;
 		length -= bytes;
 		data += bytes;
 		copied += bytes;
-		npage++;
+		npage += nr;
 		if (npage == batch->npfns[cur]) {
 			npage = 0;
 			cur++;
@@ -2306,6 +2308,7 @@ static int iopt_pages_rw_page(struct iopt_pages *pages, unsigned long index,
 			      unsigned long length, unsigned int flags)
 {
 	struct page *page = NULL;
+	struct folio *folio;
 	int rc;
 
 	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
@@ -2332,7 +2335,9 @@ static int iopt_pages_rw_page(struct iopt_pages *pages, unsigned long index,
 			rc = -EINVAL;
 		goto out_mmput;
 	}
-	copy_data_page(page, data, offset, length, flags);
+	folio = page_folio(page);
+	copy_data_folio(folio, folio_page_idx(folio, page) * PAGE_SIZE + offset,
+			data, length, flags);
 	unpin_user_page(page);
 	rc = 0;
 

-- 
2.39.5

