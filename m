Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711867;
	b=5HldNYEiSmjjwHmqqfPz+jVjbzq6O5VnIkK4q46wYOS+gz9GxsXioyr1b5gqLPy9K4f7
	 kUPyGO0H4EKxBG1WHrjemiKbkXPBgQRpOkzbWlZ3KC8YcacL8rxcNJ8CYT9bASZ+xaqTN
	 eVXarhCuFeeuwsArCHZFZlL/X0xxaE0WH0t9OTytbzHNRjI9UXHUOc48OMQlyLohwn+j0
	 h7dnrDCITg+1G0cBDeha48NtZHLNvDUUfWN3AdQgEaFd2+ssg4Pn+2pdPQ5idjaO1Xxnx
	 QoUT0xFq5XQqYaC+J2QvGUKvSFOTjOZqS7/2dXgJJ6XNtT7c2/gDgFGlaslC7XpGMCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zb7f9/XcDtj1wxbpECuZfkzStRwfhMzR+kgnYWRKlKs=;
	b=B9xC2FreL1GqGIDf5c9OsoLGIbEsBxz2pCTPxv6gVrr/zId3zkZO092iwz7BCBI4r7hb
	 wCIYrze9dXy1SZ/5aqyvVtPHbXnZbHO2QuaHO03/hw+Mv42FLkx6TouxlcsuIbxzYtmGg
	 An5ppyy1WDg/Ke1tV2yQQWzJqsBCczuSgGNMdB9cZCZYQcCMm+z8/+46fZPC5Qn9oVY5o
	 CkQOf7Uo39qI4KZzun9WY2fnr7u0b+dnInJNi0w/xr/EM13UJtwauPRdzU0oxs1jaIV/3
	 sGDMMhb7YCyD2Qb0ooG2pDK70VGAHgfbOBDdlGA+9eFrZt+5TH9pxq/uYyTH0mGQkrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=vN+2wytO;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="KsV/jAvk";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5005606D826
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5005606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=vN+2wytO;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=KsV/jAvk
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39MuBv625324
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Zb7f
	9/XcDtj1wxbpECuZfkzStRwfhMzR+kgnYWRKlKs=; b=vN+2wytOVXtOCWN6oZbf
	65xCkmf6K5i0ks9ukYf9AAPsiLYe7V9KkPEFm0LtiHGaQLTvdcbJPzipEwvpVgIY
	2Zuk6+uy7SCOrKLpjxfRh3fQthMoCHT22pc15rgPuhxbXzA6R9OJIbwXOzYSsomn
	IRYj0Uml9jTkANtsS4tIMQ6u0IELOY+kFXP1N7oGr4E/tGZDA0wzbqe1FN2b1lUv
	wyzyKTu/Fhoe2sRRR1tk40zRwXeFq4dm3zDdqIUA18KNHlGJy5aDqJGQ41MIDp9+
	gPwRWdbvVh7yFz2OPmU/geQ1xQzGYSSJLRiGarkuyG15QosKgpQco0RS3CmHCM97
	Zw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hqcr912mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:45 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-537548d4bc0so63193341cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711865; x=1794316665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zb7f9/XcDtj1wxbpECuZfkzStRwfhMzR+kgnYWRKlKs=;
        b=KsV/jAvkHuZKHAh4Sv1xEWmiz9lRzyCaAUesvoBjkDiEAlwAnuTpID/YOSl4I0ArZw
         hL0Jyf/NtKlPeLOAkJz7u1+X+biEz/sx4smjaPMkfSEgUTzdzNP3tzmZvj97aYhLHmW2
         t4Y2eBE24H0yctYcpD/Nt/ovw8hUFvl92TuCd9PIrs3pnFB5qyoTCh70p7BJMtoX34YG
         D+imUwFO2jYHO4bmH0T9sGowX0o1BHvUvltjyA3NDZeE1Uhoimw82XVHPVdvRQTCvQEl
         dUrwKxris7YdeUgdoSqoRSq/xm1SdgroQ070jtTu0+7glh+RxNH50dPkMZiMO8tMzmyk
         5l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711865; x=1794316665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zb7f9/XcDtj1wxbpECuZfkzStRwfhMzR+kgnYWRKlKs=;
        b=tkB4JPTA2ZZ2h/Ehk6knn66oPtI5eRxOHWirBlDBT7aILvsnSSrMfISeod50I5UnR+
         haNbFwAZQFUpJXe1ktA9KJlwluMIXfYsulq3EtDtRbGcgFeRUlmXclXyB4ffVbzEDGsE
         AhLE4CKOn9qJqoMHRpZHWoaewe0u9Hkfh5MFNSttctUUHB6NMHsnHCAr596AZvl3LMjb
         KHZYuL9DZ/SecIZy11iGa7fV7NDaDcDM990B5YI4kzVcoLjYWLjy1iLBblrtWHdOqWle
         nUfWXv050rUyu+l378BpcurQzmaxp2gSUbg9QkymE0EucvroHWGfi90qS4UB0VEQAMbO
         MuYg==
X-Forwarded-Encrypted: i=1; AKwUvBzhwHqisphQcMS7P7zkvY9+xYPd/CrrGi5Eg6mxOfmnANviYbeoZhoLiWarv5VK5nW52UAVqiM7lax/ddI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HeVcnYwCDaGu70xN486UCicMOPyMZZiM4K33rdQezA+XFZ5Da
	7FCWHn8a4sXkLga0WEkMeDtnLxpZTcgXij9svjZh19RozVk2JeWoQlQBWghPO40HXy1tW0PFSvn
	nNzMfj+Ni60Rr+oTu9IAXGiNaT78Ec+n5wKNShYDMwLHmYnisIUQu+qdxZiJjdQ==
X-Gm-Gg: AYBFou1W/aZlY+2dzklH/NHJvwZ56gAWyN2vW+/HG+rUjYDcDRJOPZSOPIiPKyfGC/X
	8tB8pWfrq9EU2fLKaz5gbULlDGi2TYO96rf8qMvWyKCIDfilNHVT8JVUvk4d+JWdsrcov000YmS
	wSQwZevKVO6MtDNyv2NuIzLakNMVnayQalEpTxbW75fncB1d6HBGNxWzSefuqprGpjkuKRLPQxc
	UlUTgIsI3RtFuzqH6tt6lL9EVevofq6LtZOhPwJPPSrC+AUDiIXaxhkTAEqc7cZ/piam1830/4f
	k/Tc2I3YaTL49yDY3uR6Qzv2sNQ83KJmJRkQP2UMp0uGp5vze2Kd29XLha0SLAQ8Jr07ZtL8HYB
	A2uGXbUfKX30E5rNY6GOleNSFz9QyD7P2Q4lCCRh+MWyS
X-Received: by 2002:a05:620a:8004:b0:93e:53fd:4139 with SMTP id af79cd13be357-944214dc4demr1972031585a.9.1793711865045;
        Tue, 03 Nov 2026 05:17:45 -0800 (PST)
X-Received: by 2002:a05:620a:8004:b0:93e:53fd:4139 with SMTP id af79cd13be357-944214dc4demr1972026285a.9.1793711864356;
        Tue, 03 Nov 2026 05:17:44 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:43 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:03 -0500
Subject: [PATCH 05/16] squashfs: add a folio based page actor
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
Message-Id: <20261103-squashfs-folio-v1-5-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=4768;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=o2Tizo07Eab/4Y4ayN3gpdfnMlmlLy+KbnolzkCsoms=;
 b=Xo5kOjuv+a2VjKW6PrFAaLZ/pW5WPVLGlPpsYPjbjG1Rzqgxiorg23S4qtw91BtBzpXJQHWgr
 dNdDBMaGzntB/bYeE1wcNWJskFQi/ec0jKGCnbuSAMAjk2inN0rPoRU
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX/h3YP6gzbGTE
 x6FNp3iZD7aLmZXOGRyxTbss8/hgS6/xTZDogXYTebDzEg6iC4LFwGcp+UkEhB9QzbRqQ9Jo30P
 phz8YpjaDbJ0dOJAO5XnMQzCyEZUoYQLvg8NPaU96i5eSE3YPnl5
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ae9def9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=kTpTTbHfegdTIErnXYwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX+G/pa7EhEAdY
 tx06Qp37V1T1KNVQSB1aEcCS9wslLdi7noYkFM1kH8dhDeIiHLMMzRZuq5YF2MYzkge5GajUy5c
 RdXQhg1533mjPyKTNEnJdRwLuL7riesgONFJ4lz5iunblJlU98X6ev6YlwiKf5KbQhw1qkgilq3
 vONUoakcqceqB6NMKaUtKa95LUWdBGOyooF76+m5EWO0fQWFOt/erTkFK/UkJRnnUhIYu8CL2wo
 NKe+sWfa0ZNyMdL4Jc5ruyuY7lobxZs3DlL/Aw0DzW53tM6BbfEA7jdH4fnta4CQqau2h+E4qZz
 cQPPk92i+eVD5k8gXRf/ghYFf70armWw8hzNQPQ4Mjf6NbQzkxEvHGWBnBzNPyTOiOs2NiGrPqI
 gSpSI02gyEWMDAkUSpwmy+bP2O4aNAl/6fSZLSUgwJIoMdD/0v5qpL8cfIpyAStFSxaFpf0qXW2
 8oPWwl2xxFIyb3K7BRw==
X-Proofpoint-ORIG-GUID: MKlu3949gu1HizFjkKeULPlws5ahfT7h
X-Proofpoint-GUID: MKlu3949gu1HizFjkKeULPlws5ahfT7h
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=10 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Add squashfs_page_actor_init_folios() and
squashfs_page_actor_free_folios(), folio versions of the page actor
init and free. The page implementation stays until its users are
converted.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/page_actor.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/page_actor.h | 16 ++++++++++
 2 files changed, 98 insertions(+)

diff --git a/fs/squashfs/page_actor.c b/fs/squashfs/page_actor.c
index 79b73e98abab..8471f69e5cbe 100644
--- a/fs/squashfs/page_actor.c
+++ b/fs/squashfs/page_actor.c
@@ -139,3 +139,85 @@ struct squashfs_page_actor *squashfs_page_actor_init_special(struct squashfs_sb_
 	actor->squashfs_finish_page = direct_finish_page;
 	return actor;
 }
+
+/* Implementation of page_actor for decompressing directly into folios. */
+static void *handle_next_folio(struct squashfs_page_actor *actor)
+{
+	int max_pages = (actor->length + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	struct folio *folio;
+
+	if (actor->returned_pages == max_pages)
+		return NULL;
+
+	actor->next_index++;
+	actor->returned_pages++;
+
+	if (actor->next_page == actor->pages)
+		goto missing;
+
+	folio = actor->folio[actor->next_page];
+	if (actor->next_index - 1 != folio->index)
+		goto missing;
+
+	actor->next_page++;
+	actor->last_folio = folio;
+	return actor->pageaddr = kmap_local_folio(folio, 0);
+
+missing:
+	actor->last_folio = NULL;
+	return actor->alloc_buffer ? actor->tmp_buffer : ERR_PTR(-ENOMEM);
+}
+
+static void *direct_folio_first_page(struct squashfs_page_actor *actor)
+{
+	return handle_next_folio(actor);
+}
+
+static void *direct_folio_next_page(struct squashfs_page_actor *actor)
+{
+	if (actor->pageaddr) {
+		kunmap_local(actor->pageaddr);
+		actor->pageaddr = NULL;
+	}
+
+	return handle_next_folio(actor);
+}
+
+static void direct_folio_finish_page(struct squashfs_page_actor *actor)
+{
+	if (actor->pageaddr)
+		kunmap_local(actor->pageaddr);
+}
+
+struct squashfs_page_actor *squashfs_page_actor_init_folios(struct squashfs_sb_info *msblk,
+	struct folio **folio, int nr_folios, int length, loff_t start)
+{
+	struct squashfs_page_actor *actor = kmalloc_obj(*actor);
+
+	if (actor == NULL)
+		return NULL;
+
+	if (msblk->decompressor->alloc_buffer) {
+		actor->tmp_buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+		if (actor->tmp_buffer == NULL) {
+			kfree(actor);
+			return NULL;
+		}
+	} else
+		actor->tmp_buffer = NULL;
+
+	actor->length = length ? : nr_folios * PAGE_SIZE;
+	actor->folio = folio;
+	actor->pages = nr_folios;
+	actor->next_page = 0;
+	actor->returned_pages = 0;
+	actor->next_index = start >> PAGE_SHIFT;
+	actor->pageaddr = NULL;
+	actor->last_folio = NULL;
+	actor->alloc_buffer = msblk->decompressor->alloc_buffer;
+	actor->squashfs_first_page = direct_folio_first_page;
+	actor->squashfs_next_page = direct_folio_next_page;
+	actor->squashfs_finish_page = direct_folio_finish_page;
+	return actor;
+}
diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
index ffe25eb77c32..bab0a19be266 100644
--- a/fs/squashfs/page_actor.h
+++ b/fs/squashfs/page_actor.h
@@ -10,6 +10,7 @@ struct squashfs_page_actor {
 	union {
 		void		**buffer;
 		struct page	**page;
+		struct folio	**folio;
 	};
 	void	*pageaddr;
 	void	*tmp_buffer;
@@ -17,6 +18,7 @@ struct squashfs_page_actor {
 	void    *(*squashfs_next_page)(struct squashfs_page_actor *);
 	void    (*squashfs_finish_page)(struct squashfs_page_actor *);
 	struct page *last_page;
+	struct folio *last_folio;
 	int	pages;
 	int	length;
 	int	next_page;
@@ -31,6 +33,10 @@ extern struct squashfs_page_actor *squashfs_page_actor_init_special(
 				struct squashfs_sb_info *msblk,
 				struct page **page, int pages, int length,
 				loff_t start_index);
+struct squashfs_page_actor *squashfs_page_actor_init_folios(
+				struct squashfs_sb_info *msblk,
+				struct folio **folio, int nr_folios, int length,
+				loff_t start);
 static inline struct page *squashfs_page_actor_free(struct squashfs_page_actor *actor)
 {
 	struct page *last_page = actor->next_page == actor->pages ? actor->last_page : ERR_PTR(-EIO);
@@ -40,6 +46,16 @@ static inline struct page *squashfs_page_actor_free(struct squashfs_page_actor *
 
 	return last_page;
 }
+static inline struct folio *squashfs_page_actor_free_folios(struct squashfs_page_actor *actor)
+{
+	struct folio *last_folio = actor->next_page == actor->pages ?
+				   actor->last_folio : ERR_PTR(-EIO);
+
+	kfree(actor->tmp_buffer);
+	kfree(actor);
+
+	return last_folio;
+}
 static inline void *squashfs_first_page(struct squashfs_page_actor *actor)
 {
 	return actor->squashfs_first_page(actor);

-- 
2.39.5

