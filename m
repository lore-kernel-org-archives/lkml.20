Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F24B9218
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177899; cv=none; b=fLPCsywiUmfU/UAfHlyJ5IZQyTrW77ze2GoJjZWjxa84C0kVtpx6AIiUbihXx10lvDHcVv3bnJLmbAph8nHgU6Ou2A2A0ZrRXXA9EFuG2hECPVsA4St316q9HQAjlPkrO0/6m/YOwxoAZv+rg9/K1s3MVaf736+vO3bWpgzZ/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177899; c=relaxed/simple;
	bh=NeyQ+ewlJtdvAoeks5E0kfGa6FgvGUZnNq3sy9wiMbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KI6aClwQVbYzfpFNKMWJNJr1GPJcD348IKaucbyQeu8bX4TVtJc4KZlpzh803v4zYgMqba++S8p6mJjVdoSdp1cvuBvJRHQE+j9LPmJzxcMWGtuhd0uNGGWx4iL+zA34C7GDU+eXHvtNeNphcJWkv+IYOe+Gs1ZphQ83eRm9XmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=R3DfOq3K; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=elzpMepM; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="R3DfOq3K";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="elzpMepM"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIbwOs1185924
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=NRRJ
	qFw3o6qpCxgXNI1W4++LwOS2DHeB7BgVPz4LPFs=; b=R3DfOq3KNqQ2QGxySH/s
	2MOBoOdoJpBQXcHttOjCA2Rd1uRPIbBpUdkU2ejZpP+VbjURhZd7P8Toh0VzX9Kj
	h2babJXvFmE6Ka2QtJN8e6NuD7WKI5X9EoDUuXA7dB26Xqe+ygbnx26ETE3/osty
	VCD1KDnzMblr4PjMJFdM8hMels+RkWRnd5b4e/w3rsWphUgw56Gzb/bjqgrKrsOJ
	LeuwUwduLgAHm34RVxMkj5l8yqz65YmnP9qbu7Fa97oPCr28jGq5IAXfiLMxEQju
	XYsNzvk+mpBwojdyChFpNSngetIXpbOwFYETxnvaQQnB1QwXBxx83yrUrp/Jnja8
	/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbgxjcesn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:32 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91792488228so5778126d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177892; x=1792782692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRRJqFw3o6qpCxgXNI1W4++LwOS2DHeB7BgVPz4LPFs=;
        b=elzpMepMAz0TQA7HDkU+ZVO1+D9z43X5Vnh3Oytx9H+sQbtih5ibtJuAxwS/obzNmN
         VSAH1SOxP1DTAqCKNsWHNSPlYkUxWYe4hTfx7iYnamz8njllCMB58miIs4Gi45oOIyBu
         BKyXQcbJOFfBuTM3YDexlLV392O3Bqt3vtcC1nU/4XiBYT2NN8YC39hIsvwsbxKnO7wa
         0JuWN29DfvYzWFLbqSm0laqqNjhCcKEpjrPcbUheBP63UvbarLOnzokRoWsyq9QDm6Ls
         WcZ/F799GjF+qKlFn8EyvvXDBidDQrQXmZDSnI1EA73GzYfwrXwL7ihSVDKRQ0z8G1xv
         SkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177892; x=1792782692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRRJqFw3o6qpCxgXNI1W4++LwOS2DHeB7BgVPz4LPFs=;
        b=CBt9SF6KBsyfCMfSzyZuD0mTQPPVbumWhSofhyuXajWtkUmISdWERWQZKn6Vnljdch
         52grRHTof9zT6KPk0k9iq/XZyDf8tIYt0lHGE6Kk1V1/ojmIyMPnXJ1fSNj62e6uPN1+
         x1U4rT2oQgKOpb6pdXoRti3rCrt+KsnFMjJDXI9cdtkFrHvPbT24KQcdd+T25aBat6uO
         1M+Xn0ERs6bQXZfCpu5qMRhDWEAt0DCM+QWpolGYAuDyc1yuTEsA7FP6ouVmj5Q/s9tr
         0lfZgsHyPcFAK2rsIH0CTfcdH6hm0bQcB7dcIJcXl7RIFo2oP4cAi91oUyy79yD3rrBq
         U/Cg==
X-Forwarded-Encrypted: i=1; AKwUvByWE2tyGdQZdL4xY2HOVGkqOnGXreFRGT9947uylcegzaF02TL853jXPnBDtpZ6q7kJhGu5hCEFwtvNdTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy1eNlfvi1mtixl0TbPRWrgyCW0ELpX7/Lsx1Iw/fNDZO6Mw/m
	Q/dWNWRO730Z8w2amufjGFVL4Wn+1kmJVAzCb3QuuPhJ/YlFslzkRv8EPN+5CLe4Ye9GyvUYjxE
	AxzfTbQuQqxrPYYCtULPVNqYUauSc4h2fWmQzEXZkyQgAhEwYSlaVqn0CCq7Xyw==
X-Gm-Gg: AYBFou1+fE/tWFX/DKLgOZf3poujVDqeHBkjXJTsQpQCeUrgHLrAbsR5jCLTWCpAc2b
	rVvOhAwOIC8CCKMsClZ0RM3EsEbOKMkgFozCaRfLqwGtpr2LlJ7/LfezxXUC/dpmzlmbkBDeOUh
	HomrRsC2Z1b5IAWouVC4vPSRevEfSCASxOvXMx2A/iH0dPsT3rNLePPhpX8jGauHCL8S2Czw54K
	7lvMo9CJp27g/EjFwkrMBKrZkKR9OtZiOOkew5Mmr9rWWMxM5Ng1l6n2v4dB9mCOQD3uVmGeaN7
	NrFGRYa4FJnJZIVrPMOsHFz/HdH4jBxzDPrH4uyXxzBd1C0rsDerWAtZO1cc2rE7K6Mq7v6kEGM
	686q8odDFqplrb1QkL8NE/65dxwQlGtBtmQAahs4dE31ZM2A=
X-Received: by 2002:a05:6214:2f87:b0:91b:5d3a:4fc7 with SMTP id 6a1803df08f44-91bdf40e9femr16000616d6.52.1792177892018;
        Fri, 16 Oct 2026 12:11:32 -0700 (PDT)
X-Received: by 2002:a05:6214:2f87:b0:91b:5d3a:4fc7 with SMTP id 6a1803df08f44-91bdf40e9femr16000266d6.52.1792177891493;
        Fri, 16 Oct 2026 12:11:31 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:29 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:10 -0400
Subject: [PATCH v2 4/4] mtd: block2mtd: convert _block2mtd_erase() to
 folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-block2mtd-folio-v2-4-8280c99e55c0@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=2531;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=NeyQ+ewlJtdvAoeks5E0kfGa6FgvGUZnNq3sy9wiMbo=;
 b=2lBGZsCI+vbNK5aRyz38BTiEcNSSiB1u28z6ltnzhfmFfW3s0tIA0iuFRpCNaJf19Zqd+pQnB
 bhSFQC8+xwyD1HvBIURF/hQ014i6jTpmYZmaj4Uxxefe7DMU8thfCXx
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX3HZeSrDZ+moD
 zM2JpLcx1A5sdQLl3zxa1DIjsP4+cxFMTYQBuNgK3EfI9R6djKepkxFjKfwAqBkXDi1znlyY23A
 4KOuhZ4fUopkYC+qOXdGE8PR81a//gdAebbRMdEnFgnOdDrqYi31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfXzYIjTrvXSofv
 3ZhxsTUdEXxPkt3DpwMRQKuviBj4hEmWgFheaCnrKN4gt4f+t0PZR/2rhr2esneXSs6X2/RaCK2
 Q7vN6t5paX63AYNx5U7376gpkH+tgyFbz2dgh+kGryg5OXc3MhqNDKz+jYOs4JAUoLVgYeXlRah
 x3/glfTvQ9F8eRvjdZjcFwlLUT2EUE8X0PsUDz7mm7NIGyq30nn8NL0IrXvTDruqph8mqSCnyUK
 OlleytiFyXUS9uQOgOBb1PfyPwr9Svff0Bx0Ov5//jt2NAzQ/DlaloKcDE5r/rnPgeQRS2oDNaK
 mEN8bvWR2jTFLNiYgh2Sz4I869c3FDTocQUAKrmZZalzougWa4whN+DzjIGBrlC6nSG8adZFJ/g
 zP3ZDEU9UvHQpt/9nwzROdQX/ldd3Cd1ZLw6i+bqnc9KgxscRd4AJEtD8djZ+Ih81S9RmyASKwU
 zJmkF66T7tPJy9LWibA==
X-Proofpoint-GUID: 9yLcC1JEem-h_50OTcYn4uSyJZsnn9TG
X-Proofpoint-ORIG-GUID: 9yLcC1JEem-h_50OTcYn4uSyJZsnn9TG
X-Authority-Analysis: v=2.4 cv=HJhWhYtv c=1 sm=1 tr=0 ts=6ad276e4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=1GrdX2YOhsIbM6oth-cA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=10
 impostorscore=10 phishscore=0 adultscore=0 bulkscore=10 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076

Erase through a folio instead of a page, and use memchr_inv() to check
whether a range still needs erasing instead of the open-coded scan.
This removes four hidden compound_head() calls per page, and the last
user of page_read(), so remove that too.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 60 ++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index acfd3754c2b3..e95c4c81adad 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -47,46 +47,38 @@ struct block2mtd_dev {
 static LIST_HEAD(blkmtd_device_list);
 
 
-static struct page *page_read(struct address_space *mapping, pgoff_t index)
-{
-	return read_mapping_page(mapping, index, NULL);
-}
-
 /* erase a specified part of the device */
 static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 {
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	struct page *page;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int pages = len >> PAGE_SHIFT;
-	u_long *p;
-	u_long *max;
-
-	while (pages) {
-retry:
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		max = page_address(page) + PAGE_SIZE;
-		for (p=page_address(page); p<max; p++)
-			if (*p != -1UL) {
-				lock_page(page);
-				if (page_folio(page)->mapping != mapping) {
-					unlock_page(page);
-					put_page(page);
-					goto retry;
-				}
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-				balance_dirty_pages_ratelimited(mapping);
-				break;
+	struct folio *folio;
+	size_t offset, chunk;
+	void *p;
+
+	while (len) {
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+
+		offset = offset_in_folio(folio, to);
+		chunk = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memchr_inv(p, 0xff, chunk)) {
+			folio_lock(folio);
+			if (folio->mapping != mapping) {
+				folio_unlock(folio);
+				folio_put(folio);
+				continue;
 			}
+			memset(p, 0xff, chunk);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
+			balance_dirty_pages_ratelimited(mapping);
+		}
+		folio_put(folio);
 
-		put_page(page);
-		pages--;
-		index++;
+		to += chunk;
+		len -= chunk;
 	}
 	return 0;
 }

-- 
2.39.5

