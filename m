Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711890;
	b=EkXYwbxxkSoWiM2BY2Ab+cx+t/5OvfZS/V3SoRn3yA5sGx3KtsIbpRZ+xEDZ8jmWmdXz
	 3LSA1vjvVeWlOOIunFYbjkmUtY+VMNPD1FF3z9ya9F2/PO4Jsm84y0rNnjJZvaFp1J/V2
	 mVYrsCJK9Pf7GJTDaOy5cDJVO88+pFEUl7/pVgezkJ1aepx1fh2pmxIbsnTU4LdP3pUsY
	 ikAOJ2wESKpyB7QlmLVvf/I2V21b6kLXCjghOgjGu70RPafocQFEJk7ivC1hs2PNPpiXF
	 RMvBjJKcyrZgxGh87guVbeSDE8UjtfGK+u/zGD/ejQ/27mxvClpLbhSh0QTPVl0v8Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bazxw8TNG/SV4lcWNVvVan/6QKrKNIu6fyHq2xhwcdY=;
	b=vucJmXpLxvm5z/Hw/uhGH1ZZADKlDqhrg5xBq4suM73+sJraTAJvNrzmZmbeUaRNgewL
	 lPlNSRtN8Fv3dB+TDB0x2LN7Z4dBWUu7O4MFvStPP0M2fskMMncpinAE/GeDOSzU5dpsx
	 eX1hkaatHm8H1ueCcF35QAsy/TmcL/cAYYo6Tb6qCH20uZ1KU5z6V2+o83euIldiuAaPm
	 ZYnf2HfgOVzFE3SXglA3+Uje6A+ARl+cGTFnq3j5KMKcRCI7wax0ou6kj/ePrcfWFuaVK
	 vYerWGQqtj8WuzgQOhsWPSXN+wCfs5pmZifiKEmEUoYbB1WDevPzGU/vNKlUx4xwJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Apq1qe3b;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="piAOY/bA";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2DB6083617
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2DB6083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Apq1qe3b;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=piAOY/bA
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A364EqF3252089
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Bazx
	w8TNG/SV4lcWNVvVan/6QKrKNIu6fyHq2xhwcdY=; b=Apq1qe3bo1nNcackD+Rw
	O2kzbFzAKlP6yBajghKv6wFFMmsm+zsVCio4uVTDIlzpy1PfbL4h/BCOL5JP9TKz
	bC0yqVAN9a99tfrtwqVgySaSmKlO+SL4KbbEpAD0DjHjGd9+okq06dhVc9ab3FAE
	LqottUNb1Ffxx5toEM8VCnrGU0C6LkvECUGXzQZV4rAlp0+aOhO1hsvt53xwPzFV
	FUklmNmi2Pl0Q3MiWzIqDsN656OpLuyplE64mxTrqn2QIL9mNvYu9BERrN3pgkGF
	9lwDcEaixnbHf7a86KBcebkS0nYEmlWnMg+fJJBwiS3OwubXFhU39ObpGWBJx6oi
	/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq34buj78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:18:04 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9441113670dso933993085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711884; x=1794316684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bazxw8TNG/SV4lcWNVvVan/6QKrKNIu6fyHq2xhwcdY=;
        b=piAOY/bA0rEoxE/4FUgpKS6jl+8j83yAXk8PQCeiBtjdJT3QB6KKBLG90vl5lON2qK
         sInzdPwHvtoVkVzdZaFGnx7hlbKd+FI4FCVNp46uUxRwil+q8+CCUbVTP6TrmgPs84Gp
         aaSwhPuuq/Vspzpj9zHcJL6uUEGiP6iAyVHpruufyDYAeXZYVfG1McPRuNUUrxV4Ezy1
         /hN79Q1LmNrEepg2ay7/TYKrnle/6qtaSJvazd0R55lT7P43rD1EiKQr0r4F5t5dxJRY
         ZdzaFHNU7CzijXzBIiUyM0do8UL/oXCEXNjOhmUZcHWuxBenOwKtlG8rzIQFmUh//50z
         OrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711884; x=1794316684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bazxw8TNG/SV4lcWNVvVan/6QKrKNIu6fyHq2xhwcdY=;
        b=vlPPWNeWXjcdd8j3pGAMV6wiJR1uSkemLIJumcvnDVc1u2jYBekexF6v1nvHLbqN2D
         bfKHsJ0IPvWjiWw2QCqjCVYkR57oCWkb2SjpMwScdWkn41uIFnjySLtnCr2nfcGaDkak
         ZuN5MZR8jh7rj3VCZRaN67V8+6gydOQvEt9xTS3bUfvAGhQ54hWCNjvNs+Y7zf8NRsTL
         1V5a6UD/GmUhGnnGBvEF+16RTdWfaZ8bHo5Z0H9qFuNFAPz4uHVmnsFw9uOZBR+xp9xa
         k5z2mRWSf+MnmmSN6p/euB5gca4A5cV/eYDp0MR5EquQHKonX76b8PwAUCVdtZVxFCON
         lYRg==
X-Forwarded-Encrypted: i=1; AKwUvBx07owXPQVPUP/U16sZtpOj4Y7BGeA9k2JK/KCpl/fU+5dtpisXkiQN0sbA+V0E4b36ut8qi2KZSt8x2kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wuTrt33x6PlPBGQbAcwMI+j7q2XBwCLz1gznMbj9ZoVZ8sIYM
	Tb8UN6kumrEWnqmD1jcrwYksbKwD0kziCWuz86Ed+thU2BdUSX0c6x2p1noKWPUybECPQSPxs7k
	e8Rz4MglCiGFSiWc6Ou8F21SVmsYxgsBeEliyXgbZ227xh5s2ng4q0Jm6LjZuTw==
X-Gm-Gg: AYBFou2PcBilyYjkTIsCMfLR4FDAy5bzvmCDDXOwdHV1RYOTGf67LwtFeN6ynlNGR5F
	wO+AEmja1sr24bwpa4LuH4yYz51ykDywTHgzjzpwLjWRpStBaOpVbrqXDUEgbTOHElN53z35CKf
	ALEpRr0ns+rFm8iQZB0tyqeUF4huBmju0odw+PSyAbIX1/P1fYwa0BbhdEyCBbnEfmgf3agJyMD
	z+ZwO2GWumKQFWkAYvzgn1yr4LStY9YPdpgia4BQykL3gbCc6iXKzTc7NVRr4wkT6UuMewi+Zov
	Vfosa2KtEr6Eanf0YH689SzPr3IZgztolLutsh3Jcet/4PEd42wQ5BtDfXl9JCcn5fjTSLOCFbe
	3xXXnYaonITumWgKlfmJgkHcgMJq03W/gnme10qZzsiVnJPTq1RmNwbQl7XU=
X-Received: by 2002:a05:620a:1787:b0:93c:6507:a6e2 with SMTP id af79cd13be357-944217e5b32mr2040571185a.65.1793711881499;
        Tue, 03 Nov 2026 05:18:01 -0800 (PST)
X-Received: by 2002:a05:620a:1787:b0:93c:6507:a6e2 with SMTP id af79cd13be357-944217e5b32mr2040567685a.65.1793711881123;
        Tue, 03 Nov 2026 05:18:01 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:18:00 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:11 -0500
Subject: [PATCH 13/16] squashfs: copy cache entries by folio size
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
Message-Id: <20261103-squashfs-folio-v1-13-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=4020;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=6y9t2lUloJrBfBdNNVhw8eNmzPLTwcIy2kMArT+kK9U=;
 b=OJ8xurcRJzxho6jzNOdhfp85JNGnidA8MJkw1khiQrt/6doxuZQtMVQUHxZHN+h7YALls7eSw
 SoSUQhmYXW8C3nF13JgyYJny9iQU0NcWLfuCyyfDfpuNkWs7ZnSJkoK
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: JUf2UMUCM7zQ0JUuXnu0U6NAPTegou1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX7DknrpJ0bf4J
 ElV4u7yv5Oii0dtN0mH2ORHoaLIVy7khCBYoLHaJ6BfTNK924qbqKStaCxiSPnbvNTlPKL8aPrk
 iQIddT8HMsEBKxF+IHL2IZUwJT1NCXl8Mtzbsfo8i8qTPuH43pG7VNr5IUh+KEB1ThTE4vdttTx
 DoPDZ+N2FFbm55li5CkdXnhpZolBqHlyBqgrUD/NoyspNWCktK4BwKpugeZj4A9B7aMf89QWels
 ICr53oTiheQ7cj4XsYGnMxpzEso7JrDO/2HhRRvg4ERht06EDFkxA0EJB2g47kY1NeJoi0zIX51
 SDJJOPOAjDW+/xt66ss+/VxnNkVzK/TXzPqMA+JqVtdbqHSHwmWFrohcCEvigYesc4fwAhkeLNT
 Bh6ehUXJkMBup4RwO6f6uSDcPTFdYGg1zM5DqRYTnyNb2nPGMGMt83eD8/+FILxS/zkYWwB/L2C
 +6QrT//1JybwclalwUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXwvwIcc8X1Crv
 IrOikQnFyQGeFHq2DSskgOPq6nNIbgmgsaDN1laaJFriGeDDXkeVYPk8FCLWuAWF3X2fa1HYF2k
 hZHcIDug+FE1wuUFQtQEVu1e1VHvS4gSCVj5p4wPqtBjYAJ2ynrF
X-Proofpoint-GUID: JUf2UMUCM7zQ0JUuXnu0U6NAPTegou1h
X-Authority-Analysis: v=2.4 cv=Sadi5fRu c=1 sm=1 tr=0 ts=6ae9df0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=4Q277pmGbkvQkL2knyQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 suspectscore=0 adultscore=0 lowpriorityscore=10 bulkscore=10
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

squashfs_copy_cache() walks the block a page at a time and copies
PAGE_SIZE into each folio. Walk it a folio at a time instead, and copy
and zero up to the folio's size. Use the block helpers for the block's
first and last index.

squashfs only uses order-0 folios, so no functional change. This is a
step towards enabling large folios.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c | 60 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index b34f2ac75e16..abefe9c3cbaa 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -371,17 +371,24 @@ static inline int read_blocklist(struct inode *inode, int index, u64 *block)
 	return read_blocklist_ptrs(inode, index, &start, &offset, block);
 }
 
-static bool squashfs_fill_page(struct folio *folio,
+static bool squashfs_fill_folio(struct folio *folio,
 		struct squashfs_cache_entry *buffer, size_t offset,
 		size_t avail)
 {
-	size_t copied;
-	void *pageaddr;
+	size_t copied = 0;
 
-	pageaddr = kmap_local_folio(folio, 0);
-	copied = squashfs_copy_data(pageaddr, buffer, offset, avail);
-	memset(pageaddr + copied, 0, PAGE_SIZE - copied);
-	kunmap_local(pageaddr);
+	while (copied < avail) {
+		size_t len = min(avail - copied, PAGE_SIZE - offset_in_page(copied));
+		void *addr = kmap_local_folio(folio, copied);
+		size_t n = squashfs_copy_data(addr, buffer, offset + copied, len);
+
+		kunmap_local(addr);
+		copied += n;
+		if (n < len)
+			break;
+	}
+	if (copied < folio_size(folio))
+		folio_zero_segment(folio, copied, folio_size(folio));
 
 	flush_dcache_folio(folio);
 
@@ -396,40 +403,45 @@ void squashfs_copy_cache(struct folio *folio,
 	struct address_space *mapping = folio->mapping;
 	struct inode *inode = mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	int mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
-	pgoff_t i, start_index = folio->index & ~mask;
-	pgoff_t end_index = start_index | mask;
+	unsigned int nr = squashfs_pages_per_block(msblk);
+	pgoff_t i, start_index = squashfs_block_first_index(msblk, folio->index);
+	pgoff_t end_index = start_index + nr - 1;
 
 	/*
-	 * Loop copying datablock into pages.  As the datablock likely covers
-	 * many PAGE_SIZE pages (default block size is 128 KiB) explicitly
-	 * grab the pages from the page cache, except for the page that we've
-	 * been called to fill.
+	 * Loop copying datablock into folios.  As the datablock likely covers
+	 * many folios (default block size is 128 KiB) explicitly grab the
+	 * folios from the page cache, except for the folio that we've been
+	 * called to fill.
 	 */
-	for (i = start_index; i <= end_index && bytes > 0; i++,
-			bytes -= PAGE_SIZE, offset += PAGE_SIZE) {
+	for (i = start_index; i <= end_index && bytes > 0;) {
 		struct folio *push_folio;
-		size_t avail = buffer ? min(bytes, PAGE_SIZE) : 0;
+		size_t size = PAGE_SIZE, avail = 0;
 		bool updated = false;
 
-		TRACE("bytes %zu, i %lu, available_bytes %zu\n", bytes, i, avail);
-
 		push_folio = (i == folio->index) ? folio :
 			__filemap_get_folio(mapping, i,
 					FGP_LOCK|FGP_CREAT|FGP_NOFS|FGP_NOWAIT,
 					mapping_gfp_mask(mapping));
 
 		if (IS_ERR(push_folio))
-			continue;
+			goto next;
 
-		if (folio_test_uptodate(push_folio))
-			goto skip_folio;
+		size = folio_size(push_folio);
+		if (buffer)
+			avail = min(bytes, size);
+
+		TRACE("bytes %zu, i %lu, available_bytes %zu\n", bytes, i, avail);
 
-		updated = squashfs_fill_page(push_folio, buffer, offset, avail);
-skip_folio:
+		if (!folio_test_uptodate(push_folio))
+			updated = squashfs_fill_folio(push_folio, buffer, offset,
+						      avail);
 		folio_end_read(push_folio, updated);
 		if (i != folio->index)
 			folio_put(push_folio);
+next:
+		i += size / PAGE_SIZE;
+		bytes -= size;
+		offset += size;
 	}
 }
 

-- 
2.39.5

