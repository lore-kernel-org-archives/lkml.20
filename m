Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660066;
	b=oMF2d/o2A/8ds4w8eL0xDVtCAlIeXefDhRvTTTCZVM1oi9tkKuSK3gSOW05qsYXNq4eO
	 Af8zT4xANWN+yOKUuHbh9LQUVkzlvuAguPcspSd+FRjg+BdioSV+RQ710MAGvTCM1Afx1
	 gdgbyhl6NKqu+tv5YL3JjszSyrpeY864sbTS47j5qJEM5dpaHvRsKJ8gqvAzqKhuiiDJw
	 8AD+TWD+jvzvUbG1vb8n1safKKz+AiM21ZrBjk4q4n2oyutn7nXlzj9q0LjnIjgLBYQHr
	 8hFRZwOGSD3lw/gzarnI3qXP+y25aaxYejU+OdpCEaYI6e9M6neXRqILGNZjv/OklzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bU2XFm23aghLbqwHqLXCouxIYI+ao2+a5o4nlmtbCMg=;
	b=1UZPUUWReKIbbVatGgYUXCjmBpvw+xkXU4Ca0QmzAYJYFug5Hra2FvmNbB/vmmo6rO/q
	 awesehQLhVl9AE7tQRB/SQ7hiLx+l0DLiS07xrqkkS/ygLH4ZuvmMO4/H2WMiCHblqV3S
	 4RIDTo8/+RnLgnkMSe0OFXNh/F/SONC/pPyplGhx+nQe5hkxLiMpb9IuyhIWQjOfGuUeJ
	 6HygulB+w7lUTxBOLGjFiAe3z4yPi0LlOpKU4asqYVQw8vUqfyDOg+XhdxlBVBNzAaNg1
	 wPRU/66wQ0T4cZcNxZ45PmnHZTHSK5IgzQyoEtVDfj6heWoJYq8g9ByOwXDc5SnDdIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=sbg+U1tM;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OvxmAqms;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED677606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED677606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=sbg+U1tM;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OvxmAqms
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2MHFel2431090
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=bU2X
	Fm23aghLbqwHqLXCouxIYI+ao2+a5o4nlmtbCMg=; b=sbg+U1tMRGIzFD+PPuuM
	OGezq8RDKoBsN4FIxGeLbiBAeILuemr+cgQO9sbcuBgcOn/tx+xohj9X/ZEgODIW
	FF9Bkk6GjpnxmETgYMzmh38jU3YbA1tm62tuzxfaqRKaXHxjycSVdk45YdtEd47t
	Rt8MUkaxsFVn8YD68O+4HKyXy709qz4tWDmrNqgrwzYDwlu3NPE4DDW+NhLYtzCj
	RyGs40whGaNIM4k+4yttVVFgwa3K7qjPARlwvQfVrZ4MWR5wPeVe0PaJyJhefG+1
	0Eoe6EUvhIVe1PP9x4HUr3VRwKOCwJ/Ipzw9IyB3uvTZyJUEQ0XnNJJ1/XZAsrcs
	3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq36908tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:23 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so29342385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660063; x=1794264863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU2XFm23aghLbqwHqLXCouxIYI+ao2+a5o4nlmtbCMg=;
        b=OvxmAqms0HEsXWndA6dX419U69IDpGu4J9q/H8YRkvV9z6zLEaqQtbMTPyrc3w6dWc
         tcADNKjBXru1640WFFbkEdmk6pdtrflSdmdkWxul77z+8Cb+RRWIObLypJddzA5YkE+9
         5VeBzQ7P50KF4iwdNCaCPA6vqRhXMJ1EA4cF+5NXxEtRUw/J7skl2+IYFbfNCgBGixCj
         rRJxuPdqTE2LdTMeMOxVg4wmvdojXODIMia/ArY+h88V4TiBmj42aXx0R0rQP69AJxD+
         lLmbImtj+Wdt4xdRhbldOjirLOR3crPYKgQs1H4YOI3ZxZXFaqZj01a30mYAo4s0qYUL
         p0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660063; x=1794264863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bU2XFm23aghLbqwHqLXCouxIYI+ao2+a5o4nlmtbCMg=;
        b=0544OxrtdaK4hAZsyyIxhOutwm8IRZPZzPwzoihlJAS/l0QiyRioDRlMKdxjRJ44lo
         OPcBpfW9BmC5iInX7zGCmEZ+HxRMO8Ccd5COHc196rMjfR3w52pVeHRTkGNQHjB+xjiX
         KHWHb9PKnUllcmD3Gi69GIcoCm/Re5dnD36/QvJf4hfpUdDrbvYm+hJd2QP7nTzf0xQ2
         RXM2KWoj6fKk9v1pXhZg1Lb1nBq6nn/llllZqmYbOMq8mi+cGgnPKOzwCzFuJTYMfgVr
         G6Rh+l8pW1GQ8IGlSgKnpZT3igX+aro2V2gHGKDk+EC5Kl8rw/GstrO8ZLlEgY7HZnNq
         Ddyw==
X-Forwarded-Encrypted: i=1; AKwUvBxxF80YxVKCZjVx/2hvTvWISPaQps7sYh4keU8ID5HjaASm4dO6Cf2eMrB+w9l4hYxeJg+rPpnQpIRxNm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz8hoSWuQOG8AIEPHF09oSMVx9AB2agR/ajzzLDLkB3sgMZHje
	HbM/ppPnxf8XpJZy9c2YhZGqPeJcyHll4wLaeq4q0kRkaoYpAlebb5BIschbP3YqsWYp5wDRF79
	kRgJot/DEQ1cVsx+lxxBrpcBMQZAfQrSoPbY5QQjkIP6v/aa6i3omoljDLjJBrQ==
X-Gm-Gg: AYBFou36vespmTFzmwbuh2/fIkYZjrpPe7RuyWY5IhxmA8TGouCtj/hnPty80rRffLR
	CP4JzSW9d8V9holjpwBLY56v4KxdQfxFWUITCOhYXafxqfoNW9Q84Msu9Iz9cn0zUfEhqTlcMH1
	AQznJ+dV+Ul2ueThiqIzHjZNjRvyUZ7M5OMtdbMRM+6JP4dngx+kjtenxs7QMYQV6+Su8XBHryU
	Tek/TNl2KdNFVubXIR53ifOs4fZPS6LNuDpTz5uJiKQsIXtPLsVPxPdjBon59QwH9D9HJPeEXj+
	55W5HsNmPCoeoucVR7iBSSY+LlXu+9Z9Z2TEvzgesWBrjqB0YCzCEyrmalTA3D9R1o8CVtT2nXl
	ba3aqAT8KCB0v5iXOmmONyFffhlD/kpSwhtGYq/kHQXdgwwEAeg9I1PPJ6ZU=
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id af79cd13be357-944133ab8aemr2271861085a.26.1793660062902;
        Mon, 02 Nov 2026 14:54:22 -0800 (PST)
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id af79cd13be357-944133ab8aemr2271857885a.26.1793660062282;
        Mon, 02 Nov 2026 14:54:22 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:20 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:06 -0500
Subject: [PATCH 1/8] mm: remove wait_on_page_writeback()
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
Message-Id: <20261102-page-wrappers-v1-1-e7280bdb31f6@columbia.edu>
References: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
In-Reply-To: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=1451;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=gOLWNH447008iOY03NZfVDOyDl5wENU6OW/hcTn46/0=;
 b=ubR53IdS4LeN2JRHf1bqY+gdeUIINZD96UWzXfpEu/YVk0R3s0D/8/roJ94WX5WGhqQg6/wf7
 mgpO8imxEYFDsxHSpicb09cc+tN1HuSSr2enwKNVHbZQSEIEpgUcfAv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfXx9//9j8yubYv
 JXLvC2iEb1L/atviYwEFaYtLjatD/guNYukc7JSd9rHW1LNrIrDB9EitmtAapCqCQHLO5cDN+Uu
 vTq+N29qqHCreRr5e25f0akKex2FmPvWMqPWglJD2ZpPehnuJG1pBVfIyuFeGatRtmjor08aAtk
 EK/jRL4JjKjXv2tn8URbOGvcQT84U8rx+PIjUpVjabn8e/fXYSlTtnLd9DCWohko7dosNYqM+zk
 oupn7w6toFthlBAJveBJWm/vOsi5Rc9i8U5euFBsYQ53LrY/9pwJiNRP+EjZoB0tMQy6pXox/dy
 P8NVfTTBHImSIi22vNXfyu3c8TrPL8Q2p0hV2tnmHCmNZ2hjlN/zPuSPFumQYLDqTnxPdphxDGw
 +OfraAKOa8cm3TBKB9FLUqKZVf0nUi1KVZzgmvpdGs+uLyijQpafjJcndVaDupebpnK9r0TlrNz
 rHaKWGUDczm33J6ohkA==
X-Proofpoint-GUID: JGw8qJ4y5y1xr-kVhJPQYJtQkPDKNDz_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX5VE1mEcXyxgY
 wNfrweVW+OC+5Rf/j+cDZiKjKmZzQWeupqTnVQ4WGKnZ7reHxGcODLovEGmQDaQRx1SRBHPXEbh
 GyiB7556Xv7RD0SXU80S56a60B53PTeWFmxkh/oDjWZzKJ3Gf4EQ
X-Proofpoint-ORIG-GUID: JGw8qJ4y5y1xr-kVhJPQYJtQkPDKNDz_
X-Authority-Analysis: v=2.4 cv=RKEmjIi+ c=1 sm=1 tr=0 ts=6ae9149f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=qBqFc3eaEPVjc8k8qNUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=10
 impostorscore=10 suspectscore=0 bulkscore=10 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020090

The last caller was converted to folio_wait_writeback(), so drop the
wait_on_page_writeback() compatibility wrapper and its declaration.

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h | 1 -
 mm/folio-compat.c       | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 73af18a37367..c0f7c06dc6fd 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1299,7 +1299,6 @@ static inline int folio_wait_locked_killable(struct folio *folio)
 }
 
 void folio_end_read(struct folio *folio, bool success);
-void wait_on_page_writeback(struct page *page);
 void folio_wait_writeback(struct folio *folio);
 int folio_wait_writeback_killable(struct folio *folio);
 void end_page_writeback(struct page *page);
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 6212fdd6761a..f880110ac980 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -23,12 +23,6 @@ void end_page_writeback(struct page *page)
 }
 EXPORT_SYMBOL(end_page_writeback);
 
-void wait_on_page_writeback(struct page *page)
-{
-	return folio_wait_writeback(page_folio(page));
-}
-EXPORT_SYMBOL_GPL(wait_on_page_writeback);
-
 void mark_page_accessed(struct page *page)
 {
 	folio_mark_accessed(page_folio(page));

-- 
2.39.5

