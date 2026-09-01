Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18253B27E1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291510; cv=none; b=Jhh64ORwZbpcjHFSRUlK+dgXo8shXT7g8b5vyIv/7gua10f1Xgfq1ctJ43xrUYnb+mODRVmDS3ocJQkVRhy5AdcQT1prpimnsFjkrp5fjmyp8i8XGzLmBqNpFGddinVUg/DD5/vw1rihHcDA59R13yosKlsnNF7DmLxthvB/3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291510; c=relaxed/simple;
	bh=nMKup8aAHqde2/HRWYyidhf/taH83kuQ10G5lwoQHJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQT3AAab5YB7S8IgDpUe4cHAoDoI38dpBAhd0PEyHPQFHYgu6FmAZzp0PniY+/tJnYPHH2NsW+bppYRjSdVmgeJih4DL0LnPuyvGatJ5ZsQzGIJ8XhSgytYL2WLAMSfNzFp8TZRG+tdICocs8xvqrN8vyIZsCgsJ64VMvP6JBbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=II7G0btz; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F9qN5zP0; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="II7G0btz";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F9qN5zP0"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681Igerf1652557
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=inu9
	Y2OY7s1kFVSsMrfPa+VL6lXN/UgSbvSwwsaLivc=; b=II7G0btztj+CpLnk77+n
	ioxS4+EDLgHCmVHwD+hsnxy8aqgBZoBcYxfNxglHYy8Q2ShqKfX2RanfDr3Iuoom
	FFdyVrAnaee4EwRMSElDKdhRTNrzZui/0OZsSY9Ef2Y5l7vb+6N+uwgx9OOzwNmy
	/Qb+lVDPA7dQDevYq1LTfv+SPx49T7aCvhv8cQk+i4nvXXmDci2eXABybcrghWvx
	ervSlgeLglP8QGUhmbOToRHAMKRBJxGEDKDTcZ42Vlgv7073EITgKM/x2QbSYl5r
	lFuxnlZyDv/niFScvSSnGinA23XgcOOqc+A2/qDgfmIigWQ86beUOBy3cRTxF+tV
	gQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gdyc6kkhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:38:21 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8013741eso3008936d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788291500; x=1788896300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inu9Y2OY7s1kFVSsMrfPa+VL6lXN/UgSbvSwwsaLivc=;
        b=F9qN5zP0DYveOEAQJShfMaR3yz8L6RKi2nbCWw+10viiEYhUBBIGW5iw4+qHcygReQ
         78wyPp+aTzmYm7v8wv4ZeJ1pzE/W78lv3SX1kjbOkaRtz7Zs85WsIvsXv7vy6tcZf92L
         mcas35+JQ7wgYHb15hayyuunOVld+Nbo0YO3rc2oolin9ydvVLW6v0Kl//aZVOcV4KTD
         SQevsYvwObDK0oU1IWkY3Cf/eWagkRAyTnlrzatzOAdzp9ovPNZ3JaeV8yXTn5yv7sJQ
         jNUsz+a5CqVckmqEeqPWOniJkmdGo/Ud3KpU7/3+KUwC6XPdq0dwWyqjiF2QVlm6Qgr/
         FLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291500; x=1788896300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inu9Y2OY7s1kFVSsMrfPa+VL6lXN/UgSbvSwwsaLivc=;
        b=VjpB38TQdO0WNKWUZ5PxMDPL9O3izhL/Gvzd2J6a0Heu/5Bxmxw/LJD6OdxkE8OTZ8
         7hAnmhkw7ZEx56G/8TdN9Jr7t69hlh+WeITchw5XyblTiMjW2mVJRqTBcTJ0M41eCRoR
         juQzEECC8q8iqmaD1gPc5i1luWxAGBV4KrUeP3Df/mAtLzZZhovgRQVmjf00jGTgOLl5
         XXIWQyGLa7pTMib2bMwYCbRU/5Fl+jI888NYiD5unW6hCIGv3TPagmXWxzNyOx+nOwMe
         EHtCaxDIZ8O6UaTgTZG2QNUgi9PAbKeNzxlsVpD4hNF64tU+EXZSMfjKCRHpPC1y1RQZ
         VTsg==
X-Forwarded-Encrypted: i=1; AKwUvBxXa5mZFX4vH7JX2rlGs9l6Oqf6NU3B2NVCFIE3E0mD0nIsu9Z2A7I9bFnhMG1H8k2oD2/SYDpbT6be/y8=@vger.kernel.org
X-Gm-Message-State: AFuF++llH6s50BYxK5svYDNz43PoKzHjlpGU/M5OFn1MulpMGLag9Gqn
	gigvUF2zGV/fiyhjwJ7wKix+3T6w7YeglhCmgeZ/9imy2dbe8B8tY7u6W1mF8n1+dyFs8ZpiwUb
	TEZsfl2BWQz3T8xWy/jMM3+Afk1gvMTco6D1Hw5mHnSG3+h1d7Beod4JQjLbp8g==
X-Gm-Gg: AR+sD12WgeNcmwGptDfPiBdxmUIDTNa4d1w+IUvZdBGwNr3SKh/MKBpLvYzNyTXJmvO
	U3eyahR/23rb61BrRn6fwhnEeevys+ZnGoDzm7yEU0Ash/HorSyPkevPXOfvwMHX3iXMv7ei9Eg
	/oLLe6J37PkDP9sJPJE4eLXMfs7xmdJeynjyOFscufsMrNnHYBEmoeZOULmxqoUpsKKwHuy5rw3
	JlFYwSmG17KzMQSzxrQe1gWNifPewMlzFC3JdDTCPLqYBAhcNG1r/dT7cf3baiWWQDRI1szs/b+
	uc5jEZN6M0QBQNmfZVdzpn2VKFVqggaSseOQkcJomUYPxotUB75qYsVcJdRxHwhi6eEkO/ngGsu
	9NrIe9RyEVliSqsRFjb1mweapY0zciiDV1VWY26zUMxzPg6abUmdNTg==
X-Received: by 2002:a05:6214:2269:b0:90e:9bc4:b5ef with SMTP id 6a1803df08f44-90e9f204053mr2918536d6.2.1788291500145;
        Tue, 01 Sep 2026 12:38:20 -0700 (PDT)
X-Received: by 2002:a05:6214:2269:b0:90e:9bc4:b5ef with SMTP id 6a1803df08f44-90e9f204053mr2917856d6.2.1788291499545;
        Tue, 01 Sep 2026 12:38:19 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-192.net.columbia.edu. [128.59.177.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eee72f8sm1201866d6.36.2026.09.01.12.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:38:19 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 01 Sep 2026 15:38:04 -0400
Subject: [PATCH v2 1/2] mm: remove unused mark_page_reserved()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mm-remove-unused-helpers-v2-1-f6474e169c23@columbia.edu>
References: <20260901-mm-remove-unused-helpers-v2-0-f6474e169c23@columbia.edu>
In-Reply-To: <20260901-mm-remove-unused-helpers-v2-0-f6474e169c23@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788291497; l=880;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=nMKup8aAHqde2/HRWYyidhf/taH83kuQ10G5lwoQHJc=;
 b=l0C/rfJ2tL6vp/XnScWPBe+E55WdXYIZZtur0v7sUT8j79A2O0ZPKk9YSmL0B0vuTGM8WxIDe
 SL1m4UoW3LpD/GtGHDUgs9vGQHxSk2vrti0OnLzrV+fFAJUxTv4pT9t
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE3MiBTYWx0ZWRfX0LyBSbR6h8Jj
 afj9WJ72dLT+HEGQMgcRsD6ucDA9cCnZZrx44Ip+dSUBo7JHMwdnxxO5iv1NG36VP6lv7dZJhza
 QdQjyxGOoXmK34c7NI1RlOyqsB+0NiYUh5yJjADf1yWyagvUUiwPyqT6NhE2oy6yEGeZMq+NGqH
 vjt+kEZh05TMRGPZM3JJhCsZmIcFLvXU242B6DFA0UJu13TE7URWcbdyEP15RqFSWyzm7UghBSu
 kar0y7DPbXKL2meVvrIlt7KwjvsFj40Ay/P3QHfytJbbUd77Y1dOBwa64uqChe91IxtDbrCBPw/
 /y31xsSvY/GYyEdjQ+clLJgbuUJMyyqcTsn6pPADwQxDq7g+pUif+8f2rGwC6Rn14svMYcG++U0
 95vVlP2tatPelPFT4xIQIxv7IjFlltNRRpphoiYdNa8g78UrXcQPt36Tv/caz3PfyXFwlNaySze
 x117YnuK5NLVNvbYCJg==
X-Proofpoint-GUID: hRYT-LErdwNnbkIz9IEzrucAJGBQJ43E
X-Authority-Analysis: v=2.4 cv=DOK/JSNb c=1 sm=1 tr=0 ts=6a9729ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=l2kTeM/jHJEfm+IcnTWp2g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=Lf-Zv48p-cCuowO2M18A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: hRYT-LErdwNnbkIz9IEzrucAJGBQJ43E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE3MiBTYWx0ZWRfX2YL0M1YbTLFQ
 ohJkcI3SToCHkWbsptb5xxra3jVPza2U3L3aYH7i05eTAwcq/thyibXgE0Sq+UQlRZGKsjlvD+R
 oqAK0yFbVZ23eify6ld8PqOhOJceGE2DJCC6CxZi34yjWaV+sMyi
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11893
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=10 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=10 spamscore=0 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010172

mark_page_reserved() lost its last caller in commit 6215d9f4470f ("arch,
mm: consolidate empty_zero_page"). Remove it.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/mm.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1b28e6fc8d5d..e3736c42c4db 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4080,12 +4080,6 @@ static inline void free_reserved_page(struct page *page)
 	free_reserved_pages(page, 0);
 }
 
-static inline void mark_page_reserved(struct page *page)
-{
-	SetPageReserved(page);
-	adjust_managed_page_count(page, -1);
-}
-
 static inline void free_reserved_ptdesc(struct ptdesc *pt)
 {
 	free_reserved_page(ptdesc_page(pt));

-- 
2.39.5

