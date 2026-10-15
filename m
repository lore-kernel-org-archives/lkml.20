Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817A933509B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035318; cv=none; b=YRcX0gUbSS2WoaQ23UDlJOYnoqZ9Qqbwhkn7JUqYpJEbHtvWeEjALV/Hiuc7dI5P5HSVLhH22f7utASBNYFDOQmaTF21L78f5iLOuG+Nlwwsx3Gtfkx8wEzmyil8ZpT2wCB4LQDre7yYKIO17nPU9YIGL0xxlsikBgazevbZAiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035318; c=relaxed/simple;
	bh=DiiQmcgm8+2rIcgAwan8SD0nMITDpbYudFJb4YmNAEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nieM3Ye2yVla4tDpkyLfcG2igb7MnquB+fKLeoKsTTFzYbGmOLEZrjbDaOVJKl0x8Zg1nLrMwm1qTzdqOjTQnewsbDZvPP6wM5x/MW76Y3WXp73F8XJmldUCQMqLREidCjuW5dUtFaXpkBzAEYpmTlxbtOI55Brr+uu1BIBZB0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=rzBu2tya; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Tc4xa66Q; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="rzBu2tya";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Tc4xa66Q"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2Z9OM595174
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QDDK
	e1lonQXdInY4QbmrZnCj9TeuoM6MCfPwTMajkDE=; b=rzBu2tyakaYFV0dGO5wX
	5EpGfL0R4i0ClHCoKi8dZAWErdHt4O1+Vqtx2h0+iCEZKi6U9NRv0NKAsek3aLri
	jbPz4Wa1pW9Nqb5nIcYswDVuKwqXCZu2yo59+Cp9TTlXXxD6TK6LLnGcqNYwuzoY
	XSwfRe6rvYknYg//nsm0DKp965CcwzKUcBw9HpzjohJ5kHRplOMlIF8N98HlKJzz
	uJcNDQxFsJEsLV14p/mXayBR1mpURcoSdqMZsoqLgrCa7VE663NJnxxzXqdfEB7v
	4AErKhLTm10nRvfrmAHs+lkDspCWpTtWBW5p7Z96jaU1aHUsyr0AYGMlyWreg7zG
	fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hagy3a1wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:15 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535252004e9so114452061cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035314; x=1792640114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDDKe1lonQXdInY4QbmrZnCj9TeuoM6MCfPwTMajkDE=;
        b=Tc4xa66QiM9TR06CjiAkDZZNNWuxmEp3SFBCSCws+ZOLvfLkN+ZLRP6Tw8+31zVqJf
         BxeFgV300w5iIIyiPYkGE3Ie6tUfP5KnuDV2dS1Hx8ZK7HY+b/lRtjHMOFF78/FMJnR1
         9LKAGpBd2wZGj8aJD+7PVr2Lpdix6NBEtUy+J6O3D36rYvN02AudBTnj6LXjgXUjM3ET
         nfE7v8x/HtKqZhIc5W18XoEpChx5XiVi01mIMSqO6DySZ9CBsrOarhxDHFJL+GYFQ62m
         Uqc2+ZSXmqP+LqOXRvm10+Rxem+ZsRiYMm5atN/uluKC01MGxC2GkCgvNlp9zYbld7dp
         JLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035314; x=1792640114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDDKe1lonQXdInY4QbmrZnCj9TeuoM6MCfPwTMajkDE=;
        b=nz033kr3rT68Q1cO0DEhT6+nf5KfZ58WXwg7g/jwYmxNrOjFphO/QvX7HzCmttIkN5
         UKPovdH2J3thzMYoLu0Z8PgCVs+Pb4ErOjb14+jcCk0CnVNNVvgFButlzVx2RvlS5X6p
         c+/1V4s4dU4eqKudvn5vAK7XfDUsaowgyy4mXYXKhRCXHyCjJNotblkxJjZ+fZtGiPHY
         vTxuVrikqdBcYHrqoboSMOhRAHSGZ5ho8Q4iWzeyMmZOWTjZEdke26jcTSXBEfoTG9fM
         kwN3gtHHIwivApDtMJmOgdz3dvvSzp0jncQKI/6Nxn2Jydnkrv3K9/XDjNEMTV99XvIV
         Zy2w==
X-Forwarded-Encrypted: i=1; AKwUvBwOzLsMXNDDpaEL13DfbYInsJihoKSbvxm4Rl/oAPppN+R5+POG30cXOhRcp/D0BCZJIfdVpYxWC1UN608=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoHegZ7ry/Lni2eaLvE4uG/i9obp9Dg7T18ZWyxTFO1KJ3+zE1
	DI64C52qEVsHgTI+MgQNJJLGmWr+kjjoFh+Cj67bk+zg+0r6kIgMcA6e1LKbghzi7cf7Wa6443S
	nRqY3irtDmHF2U6yeRI2hQuq0glyiTmrigsS/+AvU28QbW8kjApr71as/SRj7ig==
X-Gm-Gg: AYBFou0uOJ8/MjX8gbqP5HNvhLhdxEog8bmwGr67sLHCIib4cZag1vG6s3oVy+7rlDP
	xzq2tK2qz7ZShVJ00+FTP3lGBLn4VU+v4vCCj+ZL1yTJB4MiDTAsmHe4XK0gS/kBk4X3S4v059q
	/Ek/JPYttZCRrCjfxAl1L8/pC9amA5Z1/q8Zyu5CA9S5Uy6iJMzq3rqS2ufgVTE0NSj0yUk/fiW
	NtjJd7NQwRoenpqODoItOGjh6Z666wYMH6YkH+SFpwYax/ieuNYjH/qlueTwVkYujdwq1RZl47q
	XNtj871bCMDOuGRQJTAIXl3xeAnYag9iC4x/5eRQV8ki6rQyar5t/UwtEqvMbe7PFLk1s7/b0jE
	74VhqvfwfyJyoHjIVAqwaZvt5LUm4kcL5YxjhADpUb0+T
X-Received: by 2002:a05:622a:144a:b0:535:b21:c997 with SMTP id d75a77b69052e-5359f48769dmr280775871cf.8.1792035314709;
        Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
X-Received: by 2002:a05:622a:144a:b0:535:b21:c997 with SMTP id d75a77b69052e-5359f48769dmr280775601cf.8.1792035314190;
        Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:13 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:34:55 -0400
Subject: [PATCH 2/3] mtd: block2mtd: convert _block2mtd_write() to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-block2mtd-folio-v1-2-19d24ae676ee@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=2138;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DiiQmcgm8+2rIcgAwan8SD0nMITDpbYudFJb4YmNAEw=;
 b=H2e96qMpeNdffWSFZdIS01Tk9osP7A1HnlcLamAgaZtxALSlF6uIYbyHe13U8s29HiMJHDdbn
 pxg7VEL7NQjBS/i+B4Ecfl5iFWuQw42dHio+aO12UDdHoME68oGBWfO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: BZzv8eiYcD0YArQ9tfvScMZZuv1lNxzc
X-Proofpoint-GUID: BZzv8eiYcD0YArQ9tfvScMZZuv1lNxzc
X-Authority-Analysis: v=2.4 cv=A675rKWG c=1 sm=1 tr=0 ts=6ad049f3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=YexO6dktjN8EMJ2IXmIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfXyPaLA5iSHDTT
 oQv8jbcVFiiUPoT53y8t1FdrL+a0i0eh/f9Wos0HGGzV9dmw1LGBMEaqh5aRaJDnHD429kb0rPk
 8JvQ8YpGL5oxlujSqNDFLz5RQ2IZCn67yDc0PUHDGVD+jm44dSK+
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX3qTde+7TNW1o
 92jpChb3mtc8a2zZ58QRk35I/55LvTVrqYr0dqGSTy4O6StknY8oNy0hXPcWpiSzQNNjNCqAcmn
 sBeUXOgYDNx5Ea/hyd2JwlQDZi+n8D4QICC8VueaTG8WHnJ2KL2E5ZsbhOWO8yrPdZdIgED89eo
 WkVSbIniYtjqnuvzb6o2OpOqGL4uP/1HcmUhZA/19C/3TztQOicPZ5dnDry+NQBvyprFZaMz0qa
 u6/vgpadZx6rEymL+ZiCDGHdjN3ubiiaNabCcSk+eqFnlbA1/oCx31op9WL9EQkbUzEVb2BJd83
 lswb0oBSC881CV8pqfynykYaEz4Oc7qU9Wk7Ag5jHkU0f0XKQeMGVnFBrPtBXXAayYbT7z5Q2Lk
 bTCdeBbHHEq++vmw0bR50FT7jCZUZ5A+lQqVdGn8iMoJmPMxZ+FWxO24XgkJdP95Ig+z/mvXHvK
 1GmgysJuPncM3UrWiKg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=10 spamscore=0
 phishscore=0 bulkscore=10 lowpriorityscore=10 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150014

Write through a folio instead of a page, looking it up with
read_mapping_folio() instead of page_read(). This removes four hidden
compound_head() calls per page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index f28e49130197..910669d6bb94 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -133,38 +133,33 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
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
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		if (memcmp(page_address(page)+offset, buf, cpylen)) {
-			lock_page(page);
-			memcpy(page_address(page) + offset, buf, cpylen);
-			set_page_dirty(page);
-			unlock_page(page);
+		offset = offset_in_folio(folio, to);
+		cpylen = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memcmp(p, buf, cpylen)) {
+			folio_lock(folio);
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

