Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC4F223DEA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177891; cv=none; b=LlDkBug4fdHkaF2KuA0AW3jaanveyDtCr+Rc+7dVZPDdzE3NIoS3ECcN3ZYMDvrJSbIWga28Mgvrlq+rhAUeQZEWqFIURvGpWhp7L/Nx/5pQspEb05OooaZS+0mZdeSBW2fntin77fEy0HygessmE2FiWAmuIaUAOcayskbYb9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177891; c=relaxed/simple;
	bh=1bz7r15jgAaWx4NqhBrgfqo1Nt2utTZw9ImBRfqga+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdOLJ4c0YgNxPEthbsSpHNQY6KF0x4JXFtmycVQTvQPOIQrLZCFnhphCA+w/pVZ4B3ki7KHDZ9+/jV4oF+XaEi7+6mWVb2Q9EnhRFIQ3swWINkia85b5MwYhbFOzqxqptJYVJsFpTppO9VmeKVey4qzFjoTHW3nYnJ1ZalqSj+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fXto6E4T; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=N3wFEXe9; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fXto6E4T";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="N3wFEXe9"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIbvTg872422
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=/fCp
	J59+YgngC9F1OcKtiJqkIBPYAyjcjbtV+EnY0Qk=; b=fXto6E4TgNj8SNhOrr6R
	uA0yn2fdpEzd7byl+9tpKBZ/wZWdJAYBT0mk8q1bC6yOka0J6Lg0YfIP3yhdFxv/
	tHg8tpEh4nxzhAPgN9sIMvRCsNpFPBzgzwx8W0cOkHT3MMcVftoyKEIa5DSxgrCl
	wqLg9UlyUANuIzgeva0KCxnzixQt+P4t4RKcZ6ian2GB88QsBxQ2+0oxzK7OO2S7
	qf6zKwojpz7A7NI70DXsF1dvfzqUg/I2zstT84ZQPKwO5XlO5dFf/D42NoXHdpj9
	kOEbWuCBJm1ov/o+vipZygwAqojDclTOjlAMT981bN4jfDH663gTk0eqpWoKH8xX
	jw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbhuavcqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:28 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9196b477c4cso8049466d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177888; x=1792782688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fCpJ59+YgngC9F1OcKtiJqkIBPYAyjcjbtV+EnY0Qk=;
        b=N3wFEXe9fFgt21qcMwyQnqoN+Lriruh0aXVr4QxZRArj8S/UAkCh34H7PSg3ALMLK7
         Wy920NJ/kmG1pCpovJ6FScTsVVcsv+o4BO9iBLDiHLxTHZulm0xTPhCioVDVT7p5W6Bm
         vUsq0gL15jm8DnxeGKh/DPKekuh3+6LzTf2HXyNvX6STUnQsVvXEn4fOpg1uH0JJQKBR
         rptm85dQ+5P5GWLmaCd2frDmBlOkeNpN7jJJXG9bmwIKXNI9Ce+FvPzudNF/iKyZfcmG
         Bf1MH+5WomkeGir1vIRo5s1jT5UyiAylXrzusdBCZ/v+J6Id4coy9zRqKCgMwfSB9/Zs
         akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177888; x=1792782688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fCpJ59+YgngC9F1OcKtiJqkIBPYAyjcjbtV+EnY0Qk=;
        b=wnzleByJ5TlT9SClraFXpu/qBKKaxGIvcbWlssjr14bDvpWSWbqcf0ve04B4js64cJ
         dGUPRRCB7LzlNYYcudrnhX1RddNgNNOY9PHt0KnYO0M5/0mOwbJge6l1wFsOidT1YNRX
         P+6XrJaXBRoiaFsrmn6jUzeo3F+RG8kQQJCdHxPOaW6PQ7NfSiTQzIT7vPJNdWnmfzOc
         2oPh57SEM3hxpJgcE2IyTZd3fx72TTA7uBIKxB31s0JwBSLpF3AvAdzj2FCG3Esuaemm
         rk2pdy9VtM2OSIxsB4/g0haACiQyu/z9ju3WJFzRPNk7C/DM3XZ7RxrZImE6Hto+UZ8C
         ufsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWHkjGrPepC455tUzQ6oEO/LjONuxtsl3D/B1FCr0D6XoGNnHy+D1VFLdNO4Lp63aguZ75MoYOY+fG6Po=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3oyKv8wEOkT4BPy3MoRYfkPKfhkx5zPwvqzyc4s9wSl3UEhIq
	LGGZSYZHsl+T+y0DvoCZB1/Liz7sRCbWk//YIDarhfqeTlukMrIOPrAcslbMSPhtOVkZF8Idsbx
	17p7QrImffjHkqeKdb1W36sLTg55mv3O/xiRVwXjQ5ABPyVuZTTglzTKcE+YKtg==
X-Gm-Gg: AYBFou00nbSeqv/0JjWl1p/GaP14BdswDHYRY9IUPPIMrZlcuqEulHUT3/g6B7lPSvv
	yrHb7IjXBFU7hKG0NtO/ikr1rah5i04kPyt1ZpL4jGBqh+begwcDtvjig4exCpX6lnNwvyWpTt8
	pzzbeJldAduzh+zUPf1PxwHXsGT0Ex6nr1ssOo9CzkQz8l0KNi1s7kqYwOfd0XpCW4fW/kyDecD
	gBwZcJdeaOtVb19RXamDhA/eIYXPAiWrXdot+V8IS2eJSUWkEJb5XkDf6PZB/42+v9MnCmQdHXp
	QIxvkCzLtHYWLAuPOgsZFeFjIgiYdR2y2tmaizm+Jl8MBHJAJGV/r2PRakA7zBY155PY7dEh7Tr
	gIbk1ODfo1S3Bokw4Z5H3sUpVoxmGA2dXGAU72i58/7WX7r8=
X-Received: by 2002:a05:6214:3906:b0:917:9703:48b5 with SMTP id 6a1803df08f44-91bc9694f62mr68163536d6.26.1792177888251;
        Fri, 16 Oct 2026 12:11:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3906:b0:917:9703:48b5 with SMTP id 6a1803df08f44-91bc9694f62mr68163036d6.26.1792177887689;
        Fri, 16 Oct 2026 12:11:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:25 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:08 -0400
Subject: [PATCH v2 2/4] mtd: block2mtd: convert block2mtd_read() to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-block2mtd-folio-v2-2-8280c99e55c0@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=1701;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=1bz7r15jgAaWx4NqhBrgfqo1Nt2utTZw9ImBRfqga+c=;
 b=kgsIJlXGhiCJQppSvK1s15+vrlEB05FEaSc6z/d24jbmQtrDbz07sPmP7hiUS0virMI81LXcv
 DC2RsPPZDNADFC7ORXdUh83voz+AWowXdp/wb9MnSQBYKiq7f8BYhHo
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: 1ylzS9OmrxtUDeG07ohI7iz7F8Fprx9a
X-Authority-Analysis: v=2.4 cv=LbSpeTfi c=1 sm=1 tr=0 ts=6ad276e0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=A657Os1j7QBKVqWzl58A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX2zTGQ1tGcMXy
 KMs4maVCIAwdK6dXPAB2nVlZUTd6O6UZegXNhjRgzkIr4aRvYfjzWPIO57oWWHsxyPqoLfus6EH
 xA9zKQQCrhQqMXKWg/rPYqh3TM+JWePrNfFnPHC1zX56HWUKOGa5
X-Proofpoint-GUID: 1ylzS9OmrxtUDeG07ohI7iz7F8Fprx9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX/X491m0TNRlx
 l1IuzJDznjVE1OSlmHBEK1QlMgokHdv52YhOnhTvF6nX3WTPqaxk/ichLMUqw5FoYmgcxACNs5F
 KciOgD4LH6BUpZq+SnyUdWdZpRLEhRMv+fQKQ5rOx2kmtAZW0Qcs5L5AStWXGKmhT2HQm0fajNe
 Oji1KUrCJrcvagxcuGBiuE1WEiQyedgEEk9zyYRIeXruQMKxVBta2JQs1Omw2CbEZHoOwnLmMyE
 giUMVBFSPp9W/LN+hdoVO7Vl7CyVrnpbDWFdsqWurKVKBcUGKeXZPyZ4nueU1+MdcBanCI6as0Z
 TAWh0HnUKork5dkLaW3lviC6LeISpC/Mqr20THztAG1fkL3wb4n3uAzafkZ6Hm6muIsbXPo+1B7
 IsPC10idXzi4JYs8kVdb/vsiEdG9JkEsLvHTBkKXwZb1Qe1wWCz9Ex3z9nOwqOnXeugkRgHOCKV
 /ehN/ei6GzMxvdFRW/Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 bulkscore=10 lowpriorityscore=10
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076

Look the folio up with read_mapping_folio() instead of
read_mapping_page() and copy from it directly. This removes a hidden
compound_head() call per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index ca72110b07d6..db5472c6b8c2 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -112,30 +112,24 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
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

