Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37239416843
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030574; cv=none; b=iJNoDqhdcSoph2oXTMUArrmzen95pWvrcmcF9+CvjGX67QOe6q+lzl42LE20vy3SS3wTDPaxVIVPuQpOCmPgbmGf2H1O/F553o/Bxn9oozq8wXVwmueaGYJ8hGF9+nC3VNl7gE/RLDV++TFQQTHz7QqCxQXQNWRr/oPOb6x46Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030574; c=relaxed/simple;
	bh=Y3cEnXs1YeV/0iBoVNSFQ7BAMa/E6hl2fJ5PkOunTBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nXv4p3c1fRTGGpk4jDTLwxiknjnkyFswtlO6t4SgFWMe0PL7NLG1dpgqOA/ZZ7ynAUtaVxOo2TYVloFGuoLALc+CVO6JqlN6RWCdbuo17q95JGde0uGAfHJ3oPPgtInL+arceZk3Y1bTZ4acfAL85J1bnBLaHDE0ecxf6QT9NjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=QV1HRb7g; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lClknGH3; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="QV1HRb7g";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lClknGH3"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZ2kF1792602
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=E8sX
	UWWvgumxHaw6NteTp8vxgRbcmWk9fgTLWHiUUV8=; b=QV1HRb7gXk2P5EQTzx+V
	KNUFpZzKdMSgg6YR+o5qx5CaNnDiLV+godq5bY1Hf573Khmja8v7y/xNOQud5wLT
	X7Uh9vDnkWPqFvEZfNc2EF1g0PX59+ip4mSyI6mMJvNrwgCiuHXmGk0xWP/jpgPX
	LqA1zhCOncfDO/bbysqb8KXxgh3ur4SLA7joTgB/ZLTfXitsmT8E8y+OOGXpNauL
	IREnK3Cf3nWCg/vWzYcRDvqAfxDGCfVEf6MRFz2LXKOESWGxC2YSnc4FOYrxZXGU
	ELvaghMzfsjOEu6ZMf9gQnFaKtK0H3XtBWy6XNlBQXMR2cD1JkHzLiL+G2SLkx+8
	ug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbsppb0qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:32 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so42533271cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030571; x=1788635371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8sXUWWvgumxHaw6NteTp8vxgRbcmWk9fgTLWHiUUV8=;
        b=lClknGH3GHd7SgG6qOm6APvxcVNyxiGGB2y5T50JF70O/W5FgqGRt6+3ac7m7Dc8Iu
         LClHAAZX77Q17bNooY/MVd9EqY2ZJJD2ny2GRTLm5EidpR+1Yz1/vPX9tnkRFGj58h+q
         tIVIj3COD6rLG6uY2hIBCHbpLnahbsAA029vCrruncVDP30HPbzyTpz18H4zL8dSfXMe
         8RAB4FSoObmhsd0kerVmns5k0ccuuxElR0agMWCY+4eYPFNfmg9sSQJIeOx/8pWGQrn5
         O6RvNVxg5wVlspPYW2MPcyoBbUR9HxYjWuquMpmgm8J8HBe2Tcly5aVYKYBu1L9mcKis
         hLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030571; x=1788635371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8sXUWWvgumxHaw6NteTp8vxgRbcmWk9fgTLWHiUUV8=;
        b=jFrw8taXbLGv8+9Xnc4favYTEX+tsR1xaMy/+HEGW++6wHEUXLFyWuhwnyNwhuDvCr
         BkYpN3s7C6C2RGG2xf31MMR2XdhdozM1AjU6Kk/Vlh96tHj5QytOKL2uHbXI9vthdI2T
         EEmuHXW71LnjGcu9kqvybYD+noK2EbzxTbUiGYWKAZvqm/Doi29iTV9fw7/YjkIumgPY
         Bu6q4CX5mDZ14qzu2r03/hoE+z+sf+EjInamUHnj/YKfHLH3UKxJ7aH7JJPqcnBEcAXc
         EbbIlllRDpfP/xcxeoYSPgBgX3KEiAX9jqIQYcAy2WsU2hbal9756TUYpMiSdWGotcJS
         HYJA==
X-Forwarded-Encrypted: i=1; AHgh+RoVFd3k95IX5zx8wSnTt1EwZQwn1TfVgkyEZNjSo7OTCxQUIX+s3K4tqaZlMeX4xgU/aqA8edzuhJh/nxA=@vger.kernel.org
X-Gm-Message-State: AFuF++kp8/Zz2vX/sYwFV7jz+ewNJfe/gvQVPWX+Kk3BrdjRGfPFE2Fa
	D7qoJlpSl7RGqW/GdzJRUcHz4NJCkhY/8qoJ06AiYIuoRQjYt4zAnUtSHw8w/EkZgjPDmc2JRD+
	FHyJ/q5KX1UJwwoQo77/c2bFL6p8D7D9LNpLMVJGgkRZI55wTBna5ZQ3fFwr4zQ==
X-Gm-Gg: AR+sD11HX0ARUaorytO7xavU5+vz1wEP7h7twTVvSN/l4n6ZdylBRZOqNExSah9nw6C
	BtmNkHkdisU7YvgVyD4tJP3SRk+eRstTfLPKljTXaQeFUaSJj6DWGnb73ILOUnQJq0OordEqO9i
	Al40Y8lfGzBwlOgAjqggnlD98jNxswNS0Kvx+nEcbSSTex/MEzjVbEeLM8uptzRuEfO2u+l4Qzt
	Ezplftr06g/g+BpbwSIn6ARSUZnkFGZz6mlzhcSa0oI5hZmlNUdqx7sG2QIfGKfAoHVPRX5Xkc0
	zt1ddx6V76D9iWYLxiFIP+RXEb9IEXblMZhQy/GROhj/dVXukuru85eHYFlsCKzvFk+2ItYs1Vf
	7re3HDFE90IyPzL/DVCHPzB6uqeSIMVNMt35J6V1brg==
X-Received: by 2002:ac8:7f11:0:b0:51e:47a4:4851 with SMTP id d75a77b69052e-52fb9374e5bmr185528821cf.8.1788030571446;
        Sat, 29 Aug 2026 12:09:31 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:51e:47a4:4851 with SMTP id d75a77b69052e-52fb9374e5bmr185528281cf.8.1788030571080;
        Sat, 29 Aug 2026 12:09:31 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:30 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 29 Aug 2026 15:09:03 -0400
Subject: [PATCH v2 4/6] mm/page_io: rename bio_associate_blkg_from_page()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-b4-page_io-folios-v2-4-649728091117@columbia.edu>
References: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
In-Reply-To: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=1747;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Y3cEnXs1YeV/0iBoVNSFQ7BAMa/E6hl2fJ5PkOunTBU=;
 b=L1JMeqhEXa1QnFULub28wOv3IoMKc0N4ikuTVAvdru7NNNjwsvKIFrD145lrYhmih84D/rE9Q
 AmolEdBg1uFAlDb+cnyt03B1zl0tirPNUPIqaSWPTeEHIHCEsEq+81o
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: Qijd-aY_LDZP5XWkwlResDX6h9RieZey
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6a932e6c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=ufHFDILaAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=d-08HifAjaWcUkSzOnUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ZmIg1sZ3JBWsdXgziEIF:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX4VrW44RFuavR
 WjIREt1G9bhR3eEuIwRiI47ln558P9cRNuoLLDbWK2t8de5IOOz1wCjA52iLSM7hRbysFMxaYQH
 9OpWj1dFDYEnOvvQRJPz86tN+9Otga2egNJISMauruOJS00BKC6bQcwKLFSlveOhxA0r5y3fkE5
 5vuVybrMeHp9vVUEkHO0zYuaoyJdMtpYdM2T7Eo9ebF98M0/xR/4Woqgk55tDUtw8GrDXfzSdZo
 brB6A1HZgbT6mfyGA+UmgJ/7mZ4ii3CbsGhz+XvlrIZ+80ptWDEAe5mCP58NFMg32mhLSOjliXY
 E2lYlRyOwhT1X9TpMTQj+pjbhFZT6dCBaNeYCypWgdBc4aIE9DiAFJhfT3oJs4SIBNffmGL0Sj7
 5udK4HEToJ4bC1M1iPDOiTK3lPc1gmQCFM/0ILQNp2i7s2qCh5IFyo85/NsCgCqLHZanCNKNlXB
 TgvadaS3guVl2QYm79A==
X-Proofpoint-GUID: Qijd-aY_LDZP5XWkwlResDX6h9RieZey
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX0fsvBMCp3LW2
 R7gtkvwzGQpxkrVd8KiQzpdEyfaIUpG2R64Wd1w1AlQAr3+PsLQ62P5k9OM/jrc66KYpDdmZh26
 tS3bn/LCrfwDoAhOu3Ptrg43Y0kffMzYofGMHDtvt39GmuC5o2Uu
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=10 clxscore=1015
 phishscore=0 bulkscore=10 priorityscore=1501 lowpriorityscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

This function takes a folio. Rename it to
bio_associate_blkg_from_folio() accordingly. While at it, convert the
macro in the !CONFIG_MEMCG || !CONFIG_BLK_CGROUP case to a function.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/page_io.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index dd95cdb0cd7a..295cc6ac6244 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -277,7 +277,7 @@ static bool folio_blkg_can_merge(struct folio *folio, struct folio *prev_folio)
 	return can_merge;
 }
 
-static void bio_associate_blkg_from_page(struct bio *bio, struct folio *folio)
+static void bio_associate_blkg_from_folio(struct bio *bio, struct folio *folio)
 {
 	struct cgroup_subsys_state *css;
 
@@ -298,7 +298,9 @@ static bool folio_blkg_can_merge(struct folio *folio, struct folio *prev_folio)
 {
 	return true;
 }
-#define bio_associate_blkg_from_page(bio, folio)		do { } while (0)
+static void bio_associate_blkg_from_folio(struct bio *bio, struct folio *folio)
+{
+}
 #endif /* CONFIG_MEMCG && CONFIG_BLK_CGROUP */
 
 static mempool_t *sio_pool;
@@ -596,7 +598,7 @@ static void swap_bdev_submit_write(struct swap_io_ctx *ctx)
 			REQ_OP_WRITE | REQ_SWAP);
 	bio->bi_iter.bi_size = sio->len;
 	bio->bi_iter.bi_sector = swap_folio_sector(bio_first_folio_all(bio));
-	bio_associate_blkg_from_page(bio, bio_first_folio_all(bio));
+	bio_associate_blkg_from_folio(bio, bio_first_folio_all(bio));
 
 	if (ctx->sis->flags & SWP_SYNCHRONOUS_IO) {
 		submit_bio_wait(bio);

-- 
2.39.5

