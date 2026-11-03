Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711873;
	b=p/LkMoNYEOv8sun3gAPAvWZwrqyAexiJ/i2rSoN7/Jn2gRLo4n5ANJc5dIhI/uEY1UNO
	 +vCvwT4Ai0okedHHoVKvDRUlABnY5CratDdbXDeghNxt+sOIXFWMD67TmhaprIyQrzbg9
	 9IiVecvhhTfzNuab2NckgfVon8uStoDFzFw3c52SGxPl3OKhnLOMKr4Ru7k1W9xLg0Rsd
	 YBWC1CrMfSiUXC0fpOCje0AS8e9S83tCBhS/km+Kou8NxaEBxH4NOotfB4yPgk1Ul3HGD
	 QBomYf3APoEksW7aWEYub2DzumvdhwlJoIf6zip+O4+T4R+5Zc4FLCmLq4B615pyeIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KU4fKkXE3NxiXKBZnhME2POdA32Dlo1doYD8VzWEGW4=;
	b=34l80tNlC4QW327NiKMDIK8ormFSTwhjbr1nzyt9HwHndnMBEErIEyFlQrO9VI8bW7Yx
	 5D/17pdXIOzHOeJi1HqhUZheayQTnfz7Ll2vuuNONBRpOUIxOxwIszeQkFCmyKkb765V0
	 QrKx75oo+Yv1fegtra9M5gdVfzfQjT6D3pIK9O0CLv5bQ4egyjHPoZKWPj/AunHvGrzA1
	 FrEa7xq35f4eG0VRbniSxRPqiEWv06zZfv5j2SBXofCm33Di9/yE1NGXhJK/ug33ZVvFu
	 xopzmMy7kq5iSW0qWPtf+fPMVKnm1q4uKCNfn9V8aQkc9JgrfBwnKQJKpVM7zNaP6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=my4fnSv1;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=49BA639B;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50931606EE90
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50931606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=my4fnSv1;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=49BA639B
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3BIJX43443811
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KU4f
	KkXE3NxiXKBZnhME2POdA32Dlo1doYD8VzWEGW4=; b=my4fnSv1UjToECS7widH
	FK8P7IJIby2mx3PjVQx7VAOPs6cSQmcpG8tc2s25MFfX4mUQeCv4FH6w8+OnRuEi
	nCfJrMBOChEIJiueAKYL+IDXMzrJUtQbU4wigVigMgZ+gaCOC3zQJj02BYxn8wgl
	FqSsINE/qOL/f2BrT29HyN8hNHZrS1jNjDwkncL9HdX6EACmYkY72q0fG+i2Drhp
	t9C1Gsul+e3ozohA6jrdbkScP1ZT/bSmNH7eIaQd3Y6T/icZUs+5IeHfAdBrExE4
	4CgNyrqb1FXJo2GVJJhrcPWdI17aFFx3akVms8gbvlRXwIFuqU3n6rpC+Q1VGyBz
	Tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqem8rrtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:52 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso912576685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711871; x=1794316671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU4fKkXE3NxiXKBZnhME2POdA32Dlo1doYD8VzWEGW4=;
        b=49BA639BcLSnEooSDMcfx3nfRFAF477M01do/BeSKjkrEIjrnRBXbr2XvmQTGkVRO5
         HoNXdXRG1s5Q2uhwT1Bd1K+uJllou4CaMMkpuS1Q0Jcgm2yhRpao0h+sDvQ2UofaX9Vb
         oFPCCArzTOOlQ3/0JV81iiPP8F6+VHTo+xWdrJV35SScOijKyRTwWdBmooYwVm+NhpRM
         k6scdbVhzfP1zUqcjkxddz4ia31OrtrR6/601PGeHJ2T620FJUQf6TVNh8XHHXKGd1DN
         1gGOtSZiSTC5TZX/SNUZGtOuQkBWp0yoh+CC9k9fyj6MU+5DShVp0b0K2T6WIhcars1W
         ptJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711871; x=1794316671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU4fKkXE3NxiXKBZnhME2POdA32Dlo1doYD8VzWEGW4=;
        b=jQ5jQ2ePQZIeGk60i9/WvMjK+TP84+veFA+Cn0v1ssvpyFGhkb9gzBSRPe/KzUjoZp
         1fCPT7bMXllwtXGEXpKaeBLq5Bp9FEjPtXC8B+1lr69QQ3cRTz+K8QjQq6QhAPpvU3uP
         8/ZCtupjVyn4/MJlMM+OHWjuXbmYBZb6rgHgVHYvwgdB19B/wOpEeugKErO+tDpHgiok
         TaEsfHYv9r9QBCrKfQuBe3cKHntcl3zaBSJK/fYDUfeDvkBiw2UUN2xedi5o6vxcabJN
         Nx0ukwom72tvKUUXFQwiXOQ3Xp2zVMVu0yfv4cB1nQJbE+LXNUGxjTYVjp02ozSaC3HT
         s2Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxlN1Y16VYRAXmtrbu3mnhSa0WiIBjsk/RB+pmOaufA2ukY+Ca7z2TmpftvRfhTl7vdsDpm14nMpoZLVW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ovo2IMkZTWSntFFqKC4/Jbyq1rIFJvXQO9FRmzOfVcGz1gLkp
	ctAQ28+WIkR0y86n78XyuVKBaMKewr0m20dNcHDIbiBxlEF1OvJB2dAqcVeROg4x3L9pVwp6R7b
	JpCjwh/Oq9As90X4K2eCLgRdPREXVakgjrwjbFVIJDII6Gs2DpatxHWMLIVnn0WOTa83wgw==
X-Gm-Gg: AYBFou3rnUaM2wD7mJq9IHmTw4vsKBP43w423/VmaL4a14IFaf+eLHQ7datlfxdwnNB
	9+Nos+BYMK/0ztGe19ibdH+gO2LHC4uRDHG62rZg4Y6X81FT9FfhJLn1hhz3ZXOLhNVCipgHObV
	RGSNbnJfHsZRL4ajmJOWA408njOUoWNlWiWZQweNuFN6Ezjbg5OVvPsvox+u3SbqpvOdfjAEL1N
	q0hdfgAo+h3CuS82/BaMKj1wqnMfRwecwG77uv/M9lC+nA0cShkK9GBXNvSh3tpArzYTn10ZJ6D
	JdckTwFYB0t1NYCjNxTxNJlEhbj3lqFX2fCSSXpo8wIOYwlTSLgrfguom+c0hoCsUTgTEK5UM4w
	OLPHVeKT83muTb47HVzG+xwCwk8BA2LSaooTy71U03GOaMLtcW98Zyaqa1P0=
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr2131221085a.14.1793711871213;
        Tue, 03 Nov 2026 05:17:51 -0800 (PST)
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr2131216285a.14.1793711870735;
        Tue, 03 Nov 2026 05:17:50 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:49 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:06 -0500
Subject: [PATCH 08/16] squashfs: remove the page based page actor
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
Message-Id: <20261103-squashfs-folio-v1-8-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=4801;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=1K0OAHBkBDCVKTb84Sl+hNfJRYni+Uup3Can9fgPDto=;
 b=mgj41fUohwx9E7JAtT9/gBP2E1dGva3NV3ICqOrA6n5feAoWmypgHQKSE7wGfKgffEVmzzrWR
 RfWw0JCtzCsAPwaUb7JUw9CH1WpCxqzvZRkSTOtuOiG+0YI7kep81Ll
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX8mCO2CMOlHOz
 HhixXdx7GLhDlKGr7faZQ0mq2Os4ltD8XZ63X9v719FX1/Ba9urAmqERqSEp0bD7E+B8p2rLKw2
 v40FDtoKe0X4rt+4Xcf9DDOWCocS7/nyH4FuVdbY8yTspH0hgYIn
X-Authority-Analysis: v=2.4 cv=VYdir1p9 c=1 sm=1 tr=0 ts=6ae9df00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=nVDmxmJsYLUII2Mza1wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Zs7TQTkWQZF_UcIWMiMH9Ut9dpjc8stb
X-Proofpoint-GUID: Zs7TQTkWQZF_UcIWMiMH9Ut9dpjc8stb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXzyQeLVEPlcLl
 8b35b02ho45P38k5Tu3YlSF5S1L7MW1DKnhsY0uRn9n68As59B5ypXfi4xDsoBKD1wNfYP14b19
 ftBmWfQbWo94alTF0ajPfCzoJqeTgfsH+ZqiZlSKVOVPgRvgLZncTAyrnYCAh0bm11ECk4X28Is
 ol3d1BdLM8gSNKg1tDo57lp2DuJpjxgIFbcWUDbv/Q2m3BSmXdK3X6vIPBJPR7U7gY7squ40OVE
 erFaVW2pKzF9JIPg0SiRs5PamGig7EonAdvXWz1+WGGwslrSgvPMmr4ZL9GnGvBeE2zm9+UzW8n
 SZ4WU+DqSMWl8d51W4eFRT3WTaXrbsnfvu7K3kaI8sotRfPDiq731KDXsbz+VRVzC1cam6qXy2w
 T34GL2+S7oQ/KjeHze2b+dqB4AYiR1PrnQxZYfu1XNCCiGhGLD7okUJVqVFaHqXFkI4hNUHQ34t
 aZcF0gTn8yAzWPL4+1g==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 lowpriorityscore=10 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

All users have moved to the folio actor. Remove the page one.

This removes the last struct page usage in the page actor, file.c, and
file_direct.c.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/page_actor.c | 81 ------------------------------------------------
 fs/squashfs/page_actor.h | 15 ---------
 2 files changed, 96 deletions(-)

diff --git a/fs/squashfs/page_actor.c b/fs/squashfs/page_actor.c
index 8471f69e5cbe..8cf6c956d802 100644
--- a/fs/squashfs/page_actor.c
+++ b/fs/squashfs/page_actor.c
@@ -60,87 +60,6 @@ struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
 }
 
 /* Implementation of page_actor for decompressing directly into page cache. */
-static loff_t page_next_index(struct squashfs_page_actor *actor)
-{
-	return page_folio(actor->page[actor->next_page])->index;
-}
-
-static void *handle_next_page(struct squashfs_page_actor *actor)
-{
-	int max_pages = (actor->length + PAGE_SIZE - 1) >> PAGE_SHIFT;
-
-	if (actor->returned_pages == max_pages)
-		return NULL;
-
-	if ((actor->next_page == actor->pages) ||
-			(actor->next_index != page_next_index(actor))) {
-		actor->next_index++;
-		actor->returned_pages++;
-		actor->last_page = NULL;
-		return actor->alloc_buffer ? actor->tmp_buffer : ERR_PTR(-ENOMEM);
-	}
-
-	actor->next_index++;
-	actor->returned_pages++;
-	actor->last_page = actor->page[actor->next_page];
-	return actor->pageaddr = kmap_local_page(actor->page[actor->next_page++]);
-}
-
-static void *direct_first_page(struct squashfs_page_actor *actor)
-{
-	return handle_next_page(actor);
-}
-
-static void *direct_next_page(struct squashfs_page_actor *actor)
-{
-	if (actor->pageaddr) {
-		kunmap_local(actor->pageaddr);
-		actor->pageaddr = NULL;
-	}
-
-	return handle_next_page(actor);
-}
-
-static void direct_finish_page(struct squashfs_page_actor *actor)
-{
-	if (actor->pageaddr)
-		kunmap_local(actor->pageaddr);
-}
-
-struct squashfs_page_actor *squashfs_page_actor_init_special(struct squashfs_sb_info *msblk,
-	struct page **page, int pages, int length, loff_t start_index)
-{
-	struct squashfs_page_actor *actor = kmalloc_obj(*actor);
-
-	if (actor == NULL)
-		return NULL;
-
-	if (msblk->decompressor->alloc_buffer) {
-		actor->tmp_buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
-
-		if (actor->tmp_buffer == NULL) {
-			kfree(actor);
-			return NULL;
-		}
-	} else
-		actor->tmp_buffer = NULL;
-
-	actor->length = length ? : pages * PAGE_SIZE;
-	actor->page = page;
-	actor->pages = pages;
-	actor->next_page = 0;
-	actor->returned_pages = 0;
-	actor->next_index = start_index >> PAGE_SHIFT;
-	actor->pageaddr = NULL;
-	actor->last_page = NULL;
-	actor->alloc_buffer = msblk->decompressor->alloc_buffer;
-	actor->squashfs_first_page = direct_first_page;
-	actor->squashfs_next_page = direct_next_page;
-	actor->squashfs_finish_page = direct_finish_page;
-	return actor;
-}
-
-/* Implementation of page_actor for decompressing directly into folios. */
 static void *handle_next_folio(struct squashfs_page_actor *actor)
 {
 	int max_pages = (actor->length + PAGE_SIZE - 1) >> PAGE_SHIFT;
diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
index bab0a19be266..3a98bf691ba3 100644
--- a/fs/squashfs/page_actor.h
+++ b/fs/squashfs/page_actor.h
@@ -9,7 +9,6 @@
 struct squashfs_page_actor {
 	union {
 		void		**buffer;
-		struct page	**page;
 		struct folio	**folio;
 	};
 	void	*pageaddr;
@@ -17,7 +16,6 @@ struct squashfs_page_actor {
 	void    *(*squashfs_first_page)(struct squashfs_page_actor *);
 	void    *(*squashfs_next_page)(struct squashfs_page_actor *);
 	void    (*squashfs_finish_page)(struct squashfs_page_actor *);
-	struct page *last_page;
 	struct folio *last_folio;
 	int	pages;
 	int	length;
@@ -29,23 +27,10 @@ struct squashfs_page_actor {
 
 extern struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
 				int pages, int length);
-extern struct squashfs_page_actor *squashfs_page_actor_init_special(
-				struct squashfs_sb_info *msblk,
-				struct page **page, int pages, int length,
-				loff_t start_index);
 struct squashfs_page_actor *squashfs_page_actor_init_folios(
 				struct squashfs_sb_info *msblk,
 				struct folio **folio, int nr_folios, int length,
 				loff_t start);
-static inline struct page *squashfs_page_actor_free(struct squashfs_page_actor *actor)
-{
-	struct page *last_page = actor->next_page == actor->pages ? actor->last_page : ERR_PTR(-EIO);
-
-	kfree(actor->tmp_buffer);
-	kfree(actor);
-
-	return last_page;
-}
 static inline struct folio *squashfs_page_actor_free_folios(struct squashfs_page_actor *actor)
 {
 	struct folio *last_folio = actor->next_page == actor->pages ?

-- 
2.39.5

