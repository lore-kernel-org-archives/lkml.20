Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660094;
	b=dZmUV0IFyILiTdC6CxYBpwpL6l6Hfp1IwSA3nhmE0bbhRRcfs4731uZguZq2PQ38oCq6
	 1bidGR5+uAY9hT1kbuwpITrHbg4FXFmc9nXg9xxzlhFKQ9KWydgDwOOuv2pvBvB8e2zKM
	 DMKJXvpxgOhYqm3kMNf+T7g1sD53imQuCwhHMWYreX693Gu8mEj7++0+5FRHp0oodo0pW
	 AonItjJfCjIpDK1ixVbbzvkb2R6gUYzAaP9nrFJ2k/tN0gcGkgHq+qsw74TJUMZXBt7wJ
	 dY/5j0JrjmGHBSb/Xj6aX/RPbPTImxN4cBv4KHVmOgulGKN+/lBeekUx/4NQG0+GSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CLnMk/B1cFQ3z0k0LPzM7qddECf0IZkSoR3rfDNv3Qo=;
	b=wPyoCANmWA4bTeLlbX4TGo2Y4OD+WQ93asyNc56DQSxprXlDNK94BM5UPzabC83cyEWj
	 F/l9KkmVIkWeLjIVZGzymReeqAfNrpTXDzodrMxROMlM8pzA4aJySIdmRIa9KL+HFXODI
	 kyzCu2uRbYwxyF06+EXXROcEISA3votWBsGgHqCpygbprq819eORYx+2yBEML+71/SC2l
	 oWpwQ1MrhssEKwAP2H11bC4ezBHIERyyAbyub+Oty8CFEg75WJuOoX3TWa3P4hiugMn/C
	 57c6QSbJ/O1fv66ONtzknRf2dpmcISmDws7IvMOJMsXjOfRkzPidDcr8tvWGG+wwfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=KcIyYlhH;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=r4C8V8xN;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC3606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCC3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=KcIyYlhH;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=r4C8V8xN
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LY6N23681410
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CLnM
	k/B1cFQ3z0k0LPzM7qddECf0IZkSoR3rfDNv3Qo=; b=KcIyYlhHka/aLzj1YcU/
	Ujww+HQttnvrap2DyOvBYAhHdsOau+joQmC06nexMZwElJ2nJfggfL4Btqp1z0re
	hW/kZlCLIlr4CR3v5D1GLztV3KjCKmynVi03ZsvBec1pDGh92gK0yR6LWJm4iuDM
	RsG7CezQlBr6yQx+eZHRoFxWsSybUVQNQmi/XqTghSFF75MD489mSTYsskDg5aYS
	R+NC+jkKACRpJmCzZ20AgHVkjsp0e8U7D55YSnuc8HfpwegKiwlhLLIsy+HDa6j8
	6U5TxIgd73F4SF8F0TpNi5AQoPRNGI1CuHxeluSm1+U21kfaNihiBYQJNUNE2Wcl
	Ow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq2bnrqhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:53 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c71966998so43576966d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660093; x=1794264893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLnMk/B1cFQ3z0k0LPzM7qddECf0IZkSoR3rfDNv3Qo=;
        b=r4C8V8xNTFoiWgKpySHXztyV0WNfSdRM/AO0ttaul06EmElTHq2SqRxqg1DDVPkA4q
         c7TDE9Ywel54hC4Mj1KwjAK/G106UkPSZUo/X0P/ovDkOtnF/I5D5/HhdzjvIzHqK/0I
         qqPTECI7/IxEMQGfC0ziu1iYWQi38eBoVdF6yYuN/geKFZvy58LnisebbNCO6J8c6q1t
         tLD39JBKSj/sXocq0ZJFBcbqeFXACdfa1K/zg4CgMhZp3R/+8AfDZDipsWO9d1yr7r26
         Br52mvyLUG2KzlcP3MLcFhd+oe3yEFPSxmlPU+isHiynes2DFp1CzqfU6X2SXwjn6qy7
         wp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660093; x=1794264893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLnMk/B1cFQ3z0k0LPzM7qddECf0IZkSoR3rfDNv3Qo=;
        b=SZR0UMguXM4XL+UqMbmPcxi/u5E3/nZufshWY5xQ5G1i+vpB50c1tD9xw9bwUTVcYA
         skgxVeptmW5T5rhY3NH07ptRHLua9WZeQnIzB9dStNG4HPr+WlB8t2UNOTKCnAyCR+CT
         DoYG5tWKU5FBUodRnfB90n77/v75WRJXk2InZ129dI/2UWS9A/INLNxdnoX7CFRaJz7L
         LN0pDANjG/q0EK2VmTFeOvA1cfj0A6mY4mlTbWA4LBexHSUIxEt0kiAwrGLwit58Hv3Y
         kP+R0ClOgUktHjBxGehT1RS7K7njoZ+w/7VZ10CruvmPMfTIJGz2ZhTz1Jh0RnUBjLER
         ov2Q==
X-Forwarded-Encrypted: i=1; AKwUvBylXfnL4rw348m2Qfb/ErXDPXeZN6vPkxcE7Ga5bkBk3wXHLITQdkmi2Vj/cB2E7c8Tm+KWSWqRZ6/gkdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJuuiU/STzF0sYfmFydsCAwlaoTwfoT0MFEZ07GF4Jk7PX5+eh
	KbzaQxJfkzKRf6BxBRZ+UIBuxXAP+OFVOWpMFsLJ084reM/Ur3+ydey61OA+640WZwxYle+lFuO
	+o8PC6D8UoLCwijTlc1GjTAqxrBgGEeOxEU7jEHKMCr72WVYByoyNcDthlRXHzQ==
X-Gm-Gg: AYBFou1ushzFAQdf4++vKrvV5r0pB1KEhCXN0XjMosTHJTgTjsS0zRDYRBcJOmdhmtQ
	nlGjC9VwreXHIaJ0l1vx1DlDukRG2zyx5kb/uOk2RzbXp5d7mvQZuANfuTPEc+hxmOPyVVKN28I
	N89MYPOQKf8YvTikPp9L5FkM9RxRWoDGh5AiUWESAUMi99yg+L2kLa6OA/2epxoQnGF0SpRY7Tt
	rlUeLTi1OVWrPsEU+kquzHzyU6I4pq/jrKIb+8VUgls99Hf4K96yzA5a1BvkgC5eXad23VvM6bE
	oGcu0O9KG2ChmSksVWS+KIalYgkBIUxPdnP0ny+K6PbnSkRhcsG/Dvef5b8/4fsF07PGXyjOvQJ
	7G3pDPMKkC7G0i9ZBHkNuf/SreABC1SyP97u9zukkICn2X7RQ8tbkzTHY2i4=
X-Received: by 2002:a05:620a:4402:b0:93f:34c9:9252 with SMTP id af79cd13be357-9442174e1femr1926259885a.55.1793660092569;
        Mon, 02 Nov 2026 14:54:52 -0800 (PST)
X-Received: by 2002:a05:620a:4402:b0:93f:34c9:9252 with SMTP id af79cd13be357-9442174e1femr1926257385a.55.1793660091921;
        Mon, 02 Nov 2026 14:54:51 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:51 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:13 -0500
Subject: [PATCH 8/8] mm: remove thp_size() and thp_order()
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
Message-Id: <20261102-page-wrappers-v1-8-e7280bdb31f6@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=1262;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=6t8b0yasyYH7uaOC/pe0116nR8/5Kr1ZC3jHg5DjY98=;
 b=hJRS3l3lsCEY2qgn9hYW0rOfYfRH53Y+MmXfkNNwQXYDnRHQLgVIFrENlde5pR/kqnnVhHGZw
 aqdn0TcBaRyCRMSDUYUqRTd1SjdjkQj3EkIbJxIwZJVaFBlnU0eMKkb
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=BLcmP1QG c=1 sm=1 tr=0 ts=6ae914bd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=5wpFShScvf9Uq2YMFBAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX49dKTnmA/Kob
 f5JflUyOZ23NKJ424jtINyw7C7J/TXA5B0IN+UrWNz3khQGXxvpGEhSv3RS9Fa3JSBh7cYp8rOP
 nq9UBlVFNNvyKT122mNTuo59XTcMOa+psdb6D54QVTIlESja4baA
X-Proofpoint-ORIG-GUID: MaWCxf9Ie7jkrxqIJsD5jB_yJZCb318f
X-Proofpoint-GUID: MaWCxf9Ie7jkrxqIJsD5jB_yJZCb318f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX+RZaQtExW325
 nHXbLcoWFkA3/xzVVyo9+FR+HMlI56ASQN9sdsX30rr+XMmpu68Eb3CvbqMjzYAGs2DzjblmqL0
 x5+voOJHSfMpM5hW8vEJ4vhsc4KrhjgWQsHC5Gx6Pf2Sfu27zvzDV2Utdp5bMl6M44dI0uZLOx4
 gGHw3fw0ZLHJmb/R3l6vtp3PtBBBYgn1VOUUjDZa7McMuveNT6egc3791o7F+IjddEhzbpibuoT
 1d9jZLg9R/BTVv/aSnY7Dkoukq0wPfWjz5a7mVdT2wF69B7kX0LDZKamCkOKMFqfomj1lyFU3Xg
 8Nte1EZndtyFUrZGTsPQSIzim/IR0Xc+9iWLE8tyTKRFxg37nIVn4gQR2TpMazDTSraSJtQ3eZ8
 dXfklfcKdcLhBszlrULgY5DwEi33EyAiInClHT2HE1nic8PWGWl7YEuDYcimyxYBSZb3fzvo6wO
 8/bspqKgD9HNS2OBKNg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=10 bulkscore=10
 suspectscore=0 priorityscore=1501 impostorscore=10 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

The last callers of thp_size() have been converted to folio_size(), and
thp_order()'s only remaining user was thp_size() itself, so remove
both.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mm.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8b5883878538..143865580169 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2146,27 +2146,6 @@ static inline unsigned int page_shift(struct page *page)
 	return PAGE_SHIFT + compound_order(page);
 }
 
-/**
- * thp_order - Order of a transparent huge page.
- * @page: Head page of a transparent huge page.
- */
-static inline unsigned int thp_order(struct page *page)
-{
-	VM_BUG_ON_PGFLAGS(PageTail(page), page);
-	return compound_order(page);
-}
-
-/**
- * thp_size - Size of a transparent huge page.
- * @page: Head page of a transparent huge page.
- *
- * Return: Number of bytes in this page.
- */
-static inline unsigned long thp_size(struct page *page)
-{
-	return PAGE_SIZE << thp_order(page);
-}
-
 #ifdef CONFIG_MMU
 /*
  * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when

-- 
2.39.5

