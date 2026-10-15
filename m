Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D33002AB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035317; cv=none; b=Km9IZTaVjhr0tIGKiGXgbygBfY3JEsQsoPjTTnQhWX6bmtBiGEj1ndQj2Ugu0JfMoSLRNI9i9/eeR0J2AXH2pIK4dchsppdQuNOSdJraZ6ISQqHLTLvlkWPUkpEoglg4BdYoUktxS9lnAtdXFZyFLQGzC7dV9DSLUWcPMe3gGd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035317; c=relaxed/simple;
	bh=FVulE/ra//zysrVQig6l5nUTnPktA7Q7oao7GOs/r4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkUpPNtCbAv3ox/Rf5W4MUxqWTZj2FjUMFbiAOmpfiB8Kjs4cUL0ZoaLLaWobYBiDH24kI0gQembAqo8UqZfmTMQchusj4yNcAZHIEShijvCsYq/9wPlhnV50Cy26Va0gEAnbw1MBK4Qk/4r8UwgA2ha/gnn29H3MUpS7SDnBG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NWoeRuuB; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=E8n+Pxdi; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NWoeRuuB";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="E8n+Pxdi"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZwCb247688
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=pVfi
	pGKKVzpFMxI57nodkkDVd3xpjhD+2tMnUW2JpMQ=; b=NWoeRuuBajVqg7odmmh9
	3PP9MMYdVpy+i8jjb6PWvENcetTYvzgHhlZUCWSv/yevldEd26Xro8FtDEmRKHFv
	LzRJftXswGGy7YMloS6kLT0ONoAPWkhd9mE1V8jb/b44mg9/jfhJIvtiheONaN5L
	K2hoNsNoXRHDS0SwYyIvIBRGCBOgFH8/DnzMj0Pp9zBCZXVs3IuXQPErf81skdtd
	zOHd6puI6+qO+Q2dM0NMnMDPpKPQZ+o5nvxkfPQbEoA70wLrt2Smbbdl/vyUeRey
	s7PCDK5yCf4Mwd71LZHsZ8FwLLsKkI3QF7z3ObqzbxcWWsjEXP0e6iDRL4bytqgy
	Sg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah7j9wt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:14 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7fffbe0so110053926d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035313; x=1792640113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVfipGKKVzpFMxI57nodkkDVd3xpjhD+2tMnUW2JpMQ=;
        b=E8n+PxdiAyYY4K9UFKl7uCQBxc52/33H+j02ihBESBUsdJMhj+gSLff81ue/gEY9aS
         kwrndQmCF9XJnO5i3j6qQWXfzn2w6yBgi5TIyXOHENPpUOyiOMyjd8YpFgAyPhkzted9
         YzQ/fjkbvhEecJHMHuFyxZhJUgcaRKSEvpiuuRjmDgSFTXgt43eYvhvv6uSRGkkYxXqX
         CMXjOP/eQvDbsKtYLam58jacg6SAf2m/otWS0CvLBlRNaIFw0jrGy7BFtolO+ladoc36
         izv18efE3jVmHLDVwoLho/8VP2kaIcIpk3HApEBqS7fXh1QdMTzRsAmp4NRUqSXU5eng
         D7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035313; x=1792640113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVfipGKKVzpFMxI57nodkkDVd3xpjhD+2tMnUW2JpMQ=;
        b=s72EmRRqLGux5DngyL7ahBs3KNce6J4DHym1vlbf6hOPBXTfrfNlui1Iwy9WKiXEYW
         L88zKdtaqIKrT+ZNra0+sCj+YeLMJGwmzgilHAvOKeN0upxJ7162i7eVu0t4Gsehok3R
         K2aSn8Z1J9vg293/7vusYdJ2AXX//8Z2yMtQsguaGKX/AF/A2VXUcdGm4jrGzf+ocTUV
         mOCbqXfACjkh5J3Vmev8aDo+cGyfIKKBcBewYhLBvuEOcoCsEoj7XdFpsnO5PWSf/RZ4
         yrKjRpKUDTUyXEseJ//2FvHoteIe38Ck84gLM7BIP+tTFRChW+7iSlVJ4C+sEtohGufO
         2Olw==
X-Forwarded-Encrypted: i=1; AKwUvBxCAI7qk37JMYbKRkzOF3E6eXofVFHke/GgxupkqYmc5T6XOLWYUFpOT+DfvOslsm/qdTdiZh+AZFokqqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcUbdeMeEqksF2/uIbnzKywPTCr++0vBGG14ydrTZXVhtE0dUF
	4z0BFZbDnwEIX2HbDX8N5JhLgQhoyNa7x9NKpf9+NM7u9OYUg2V5ZSGASTlmCug+8XUaPQS1ujb
	sAYsNJYQ/sDBzT71v907DobGwnDZ8Uk8ahoxhSe4FncUTfXC1TQFr2UAQPNIgHA==
X-Gm-Gg: AYBFou1RieZhrS/19A3MDYrY/+0Qp50PmxNkqufSQ4vwZxm6ZDArR+fhV5MUQ/gZG1G
	6VA5cur4CNCgFEqXyKGP6I4J0pAon6bVJABck3G5yJCbW4oZXDhgCR/lnRPb5XICqRyTyFxxr2s
	snNdtlhmSgnO/hfyKGbsu3td5yMLRcrI13d8abPXnwcZiu5tz8gRd3TblWN7FPlJk4HcrJJAdoN
	gjGQvqL8S8WuTRJVnWzPuGEwkCMoEh3Pxb7esbL20DNzc5VMETdBLq/hPaUlUC0nsgp8GhD0JIB
	q6g8WGif5Hpbv0PgBlzf0bOre/zgh79SLveruW77usc4MoWEA9Enmu5nqsgiZ0jnVr5wDysYGWY
	41cn0GzIcgTw6XfrseIIFc5ajY4OTY9nQKfIBuXM7qFfB
X-Received: by 2002:a05:6214:3106:b0:919:53ed:d228 with SMTP id 6a1803df08f44-91b55798932mr305162916d6.36.1792035313604;
        Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
X-Received: by 2002:a05:6214:3106:b0:919:53ed:d228 with SMTP id 6a1803df08f44-91b55798932mr305162676d6.36.1792035313134;
        Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:12 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:34:54 -0400
Subject: [PATCH 1/3] mtd: block2mtd: convert block2mtd_read() to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-block2mtd-folio-v1-1-19d24ae676ee@columbia.edu>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
In-Reply-To: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=1701;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=FVulE/ra//zysrVQig6l5nUTnPktA7Q7oao7GOs/r4I=;
 b=1ZdUUrxZgJ42utIJaQd10KL8pt72aAvnFXxXqGAV1uWLkrSynZnZVLytYxinK6DPApm3Sxumx
 1arWGCjdb57BLqst49n0g8kvBaUSe7BDrrx6/ts21iiqpiOCG30LT6h
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX2RwKqKZrO5lR
 ZgAlfy797Nlcc5aeRMtC1ANmn8FgloAvUTx14V7gbGtfHc1b7AMBI+XS9NsbpheTf5na31hQi3x
 BuyN+xuDrIio9rplYM5UMapEL7QxB3T57EryVz4FyOAkdz56iBUL
X-Proofpoint-GUID: tRIjsqYJbHFHdHs7ZpOkSpNn5MxORhgI
X-Authority-Analysis: v=2.4 cv=Q7RHcI2a c=1 sm=1 tr=0 ts=6ad049f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=A657Os1j7QBKVqWzl58A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: tRIjsqYJbHFHdHs7ZpOkSpNn5MxORhgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfXzPhdzhcPva0s
 H5NiopAA1jHqRkauXBVem4CQAS1t7bqg4BpgRY766Iua48vzaRSjnKVyeN8lKhIpb+ctA8MhOYU
 rYWwondrkbHQHQjputn0aefFuDCzjFS9ybG/mk6la40CBsTWnDb0ONBtNzGWqV853QHTUhPBYC+
 AvQf/24FzZOHEH2fIK6GcvUqkRGxVsMH8gJbNl42ewOQYNQCIn4a2tJpmkQk6YQ2X/ixsklZtJT
 5ninO07T6UwAopSxjcoZowmuSDE/xrHdfs3in3JSk8LQUKx4G7sXMlHzR0hNabIVYGTzJgavj75
 GAA3ee++48ylKti66Sdk+7EJ/enbB44nCr1ws6mzRcnVP5EkSrqysiABxhDYbwC9cYJKsvUNKWD
 1SXDjTClpmPWD9yJ4zEVz6zPp1iZ12EO3Wdftuj3xyytP4Xmydq3fhZx618snpZ04tZBjzOjmKi
 j0c2/vgc8fsET1UwFlA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 spamscore=0 phishscore=0 impostorscore=10 adultscore=0
 lowpriorityscore=10 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150014

Look the folio up with read_mapping_folio() instead of
read_mapping_page() and copy from it directly. This removes a hidden
compound_head() call per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2c4f5a..f28e49130197 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -106,30 +106,24 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	struct block2mtd_dev *dev = mtd->priv;
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	struct page *page;
-	pgoff_t index = from >> PAGE_SHIFT;
-	int offset = from & (PAGE_SIZE-1);
-	int cpylen;
+	struct folio *folio;
+	size_t offset, cpylen;
 
 	while (len) {
-		if ((offset + len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;	// this page
-		len = len - cpylen;
-
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = read_mapping_folio(mapping, from >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		memcpy(buf, page_address(page) + offset, cpylen);
-		put_page(page);
+		offset = offset_in_folio(folio, from);
+		cpylen = min(len, folio_size(folio) - offset);
+		memcpy(buf, folio_address(folio) + offset, cpylen);
+		folio_put(folio);
 
 		if (retlen)
 			*retlen += cpylen;
 		buf += cpylen;
-		offset = 0;
-		index++;
+		from += cpylen;
+		len -= cpylen;
 	}
 	return 0;
 }

-- 
2.39.5

