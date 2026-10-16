Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653B49BB7A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177892; cv=none; b=dHSU5hnGNFm5DMCyZMvOW1SDyTUUwy3sgxgwwmLMTx3JqWzk1zxI4vj1dProBnqEzDEa1NJiKq491d8czOT7kcbMWC6xKCzh7vyIIN3udm98jspkoxYyVYLtRO3oKJHg06LiBomyoXzYpn0IGU9V7lX73jhHBP2jAmA63t341Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177892; c=relaxed/simple;
	bh=ba6wHdZ5jYtlG/mAQ6lUyzY39YTkKcDwucFfXseGkDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwtCVIIhpl+XKBgxGwMNRrRZVwSkCdGjQRkdu/Fbcn3LwLCUL41P2pXG3IhIuXkxr/zhba+teNGQnT9u1vs/RK7/YiylOBPuMFVKkAPF2YCjZFdlXfv0iQiOLgqG4Zazk0FywUI9AiF63w/IQZCzAUjJde5grlpWYQjYuISgrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=WjqVHEjD; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fTdZxFdT; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="WjqVHEjD";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fTdZxFdT"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIcmU41661807
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7reK
	9IL0rKrZfnHUnNNVAKzIpY5gnM5qXSoGxoG9+30=; b=WjqVHEjDkmJ1z0teN4Fy
	EqYaeVYeFzWBTxFYSGO9XJV1uUQ0Q/Ny7TpGhU83y3tyYpF7St8Esva1cDu3Oep+
	P0kAZReRm6p0ci0LkajWfFU3RMDa3B8z0u4goWagoBfasP4loqaYQVFS56hodDVH
	p1KpaN5PBAm3XiF1yoZlc9eCZrhjiiacnClC0uZhNb66RqPMVF0e7petx8B828c0
	axsC30iPKB+ojHb84jqupuGYcxN3/P/RJ3RT/U9yAa/Sh0SO/fpTmy4ptbPkLumw
	PJNtVb2b5AfdWR39xKIVOYktSsE/vzZW6BCwyaB9+VIAzlEQW5QZdrD6W16x/F6J
	HQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbpkq9w9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:30 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b92acedd9so8535526d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177889; x=1792782689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7reK9IL0rKrZfnHUnNNVAKzIpY5gnM5qXSoGxoG9+30=;
        b=fTdZxFdT+K9OeyEVdIgNp1UOQFOad67kh9bChfMAWLxLDL5o8oYXE1Lr0d2Ab2yohn
         uN4UXrslc6sqhD8iB+60vMfawJdQuDOmyYfBtRdOYGFiD6+yaUHJ4PzEeh0DyBaiJ80F
         rWKMV6GkJ6wg4T9BY0MlAL/RfcjKlE2yNdyEJgp87oXVxDclPgcc1o8AzNYyzTpbLs9Z
         5xnCLmiEDkoqS7NWaTJoy3yPyUy2t1VZ9dQnfCBhoOLXVTGtzy1YesnrMJrqmYW85/Id
         dD2H6a2+DxsaKbmZAzPagFYYUog6u59QU+3O0vXbUkWlCq3IlYp2aye2YtW1qwpuoZHn
         RgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177889; x=1792782689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7reK9IL0rKrZfnHUnNNVAKzIpY5gnM5qXSoGxoG9+30=;
        b=ZFe2JLby3X1XsVDBD+JDAR3ZrQjB1oM32D6O8d+stBK8B9ei8sHQIoJdwEi1rY1VY1
         fbzEp8mjpqljLFXIAWQ0F0hholgM6z6SbUeBo7IbEjqHAMXjTIzun+hNwa5JKBa5sCi8
         51aNNK8X5Kd25fN9y/kgKV5KcXwIWI4P+3JxfHhHxayF6VgLFlOSXEVKFZJc3w6UDYIG
         gGB5tFr/jjUPphRUxWh9echZ7w4/pS8vI9qXjPKes+rJMWSoOYjlVwIFJdT8MBXwK58M
         E0R4WcgM+OUBgeBgGNwdsIxDVVrT3XkDeROQrhdXF4pJ4ET9STgkb+9Ix5s3E3XASbi3
         q5GA==
X-Forwarded-Encrypted: i=1; AKwUvBy0LZLKQWsq0Mw+Nr3d8DXEM8hI/jDL0/VT1z3p7LhENEKJ+2HMvJ3COZmRBHDmTW9elRaJAWL0/dEZwEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzgcZ0ZTFVXftUioFXxUzc30pHvadXRM0ETyVjd8DRLHKVp1fT
	6Y2nVgLX9kTVD0Bux0xsTvjR6V5QYLNA/8dqtE8OBcHNFmMr6cs5sW4DonKqNcRJBoqj9VErU1S
	uDSH3Xt9X+nI4MvJzUo9E6OiZlqS7nOMiO/ZNIg+1i+kaZmm1jEaucUhAa1+4fQ==
X-Gm-Gg: AYBFou1dOJQyebHYpAXkA6T99/jl4L6Icv/q2PudymNiOZFPPONNt4FsXPER9AAwKtc
	onsqiTbewVaJFVWpse31/UJ9uqXgtNLOQiXqnPn7W4EbiJptuDVMAcAH9s8/c6PWXiJB+tF3R+a
	nnD8TyH963TK6gQ7vlCgkYT5dpNFHst1wLIV87dOQNEtZAHsMEqQYtb9YkCBFWnJ89JERsZJhDJ
	DGwR95VTPu2vBdIFhKthf09xklRFlP0eNWlCVZUDpQZqyF8dFFDcsxNfGWfr1JilJuxTNqu9uhc
	FQbJIytS0Je8dRybU5tNOxyvPT+1AO/5yU97rfj4raVWi8zApBFqtOaMhhNIPLa7lvrt3D9fhU+
	75G3vRPuKeLDIurK05uEJI937QcjuaIvTpL6vRNXW0x328U0=
X-Received: by 2002:a05:6214:23c5:b0:91b:5d39:e13c with SMTP id 6a1803df08f44-91bdf40b4b9mr16382436d6.49.1792177889428;
        Fri, 16 Oct 2026 12:11:29 -0700 (PDT)
X-Received: by 2002:a05:6214:23c5:b0:91b:5d39:e13c with SMTP id 6a1803df08f44-91bdf40b4b9mr16381966d6.49.1792177888882;
        Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:09 -0400
Subject: [PATCH v2 3/4] mtd: block2mtd: convert _block2mtd_write() to
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-block2mtd-folio-v2-3-8280c99e55c0@columbia.edu>
References: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
In-Reply-To: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=2375;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ba6wHdZ5jYtlG/mAQ6lUyzY39YTkKcDwucFfXseGkDA=;
 b=otjLd6vj5+MsD2V71nWTN0O8k7Hhigk7YWwxYtShsgly8SVD8WEOLC5AuUcgUEWZRn9OanRQq
 /fpsEWofJeTDX6VhUYnJjj4cbRwPKhJMyuiHbhzMKRgJRv0Axtxv2kG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfXy4YJB/zzh1yd
 Dv9gvulGQoZwGidl7G9lNANuGUBzNa2Z8V0UdyzWkIEyC0FtstEfUtA4VSIbYinoCLCNfcBywsy
 Z8O5n9ctloeRxlBORDFD/IF1UN59R8QsRfz4+xVdhoYeINv1xVnG
X-Authority-Analysis: v=2.4 cv=bv7Zl0ai c=1 sm=1 tr=0 ts=6ad276e2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=qqL285nydZm1SHY3jKwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: jfbH_YXVy_7zxaIRvQI-Kfb75CA4PQt4
X-Proofpoint-ORIG-GUID: jfbH_YXVy_7zxaIRvQI-Kfb75CA4PQt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX2d2KeXlnfaQP
 GkxvqBbUKNnsWLzRYtiW/OOI4GuEOyCKhJdfwwVWl/tbr37fvGJgbQKPRysQ0utVX0O/Ov5kE91
 X2u6WJphvDqkP1X2+WBMcOKadu6RcexyRFGmNuPtKnuYNkRRXQoJu8TJlXgFFaA9MbDhYxVYca7
 vpuOmF1wBawf8dMygqYSeCuBsh30aWFq1kIcxC152z7kzWpgbonkLA4Ec/X2b+WovVJHjc28Z6T
 Y6UAKoT8WkzVcABOsw0e7IeL2S8I0hK6ADQQns1PwXWi+cOlNXh0AecqK1woTdufb76qfbxRZxu
 wcIei4A6RMqOQq0k4o53itACNd107glVIkeRLVrKs92BYAGy4R3jOut1k0SbzxvL+lSL3BV3C1B
 fOUbRk6oXDgOpq8opkigqkgToWYKCyOjtYD8ZrHfcWWVCECA63hVA4qHsbqit7LheGyQZ3Wesai
 hNpnBu2ZCQl2kuVXFag==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=10
 impostorscore=10 phishscore=0 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160076

Write through a folio instead of a page, looking it up with
read_mapping_folio() instead of page_read(). This removes four hidden
compound_head() calls per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 48 ++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index db5472c6b8c2..acfd3754c2b3 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -139,44 +139,38 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 		loff_t to, size_t len, size_t *retlen)
 {
-	struct page *page;
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int offset = to & ~PAGE_MASK;	// page offset
-	int cpylen;
+	struct folio *folio;
+	size_t offset, cpylen;
+	void *p;
 
 	while (len) {
-		if ((offset+len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;			// this page
-		len = len - cpylen;
-
-retry:
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		if (memcmp(page_address(page)+offset, buf, cpylen)) {
-			lock_page(page);
-			if (page_folio(page)->mapping != mapping) {
-				unlock_page(page);
-				put_page(page);
-				goto retry;
+		offset = offset_in_folio(folio, to);
+		cpylen = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memcmp(p, buf, cpylen)) {
+			folio_lock(folio);
+			if (folio->mapping != mapping) {
+				folio_unlock(folio);
+				folio_put(folio);
+				continue;
 			}
-			memcpy(page_address(page) + offset, buf, cpylen);
-			set_page_dirty(page);
-			unlock_page(page);
+			memcpy(p, buf, cpylen);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
 			balance_dirty_pages_ratelimited(mapping);
 		}
-		put_page(page);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
-
 		buf += cpylen;
-		offset = 0;
-		index++;
+		to += cpylen;
+		len -= cpylen;
 	}
 	return 0;
 }

-- 
2.39.5

