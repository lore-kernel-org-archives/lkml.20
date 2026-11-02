Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660078;
	b=IysPOEvdQcKda9U4dWwrcLBbPj0nXLD+TKb7YQ1/ARxXxSAzxs6hZEAV734rcqkdTpUB
	 kgYq2OK74VsdqcSyk4oVNZrVqUcN1DAps09WSX8TIiFhvzF2xLagW07EPIuB73m9cqyfJ
	 RkAJNtW12iva5bUZSm9qCKlVY+KIgSBoAE1C0PaVUCdqt4yMM2yUSvuUJWfr+XeloGwCz
	 Tg5fEE4h6TxT6EOFX9Z22uEUmFEcjzZtryDgh2q1Kz96ZLNRUWZEu4gzeiCjtbVtPOQH+
	 H+dbR/V9/dfkVrwFkTQgI81zLjCV3EtQRAoebplcvA6DX1VMebWudi/+OlH463HsPoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JvhSK4+erTYH8YIOH2eSd/nyRcOBtvC7PXAApDZRJSQ=;
	b=MvXPznOjhTgCdvy4PxVgpoH2UxV9n9gUhxJIml/fPNJJPHSAfaRUsH/97/NaiUQkzFsu
	 rsh+tBTsJy25tGHYs5igUQdWwFXUbMhFj2mXiY4hoGt9gvMGRpx8ECOW05vEFkqDjWT0B
	 d+A4XmeSDx8gprhIVucQOF9LLMFOfijVSt5VlpcVPJGCXuQYfSXhkCpsSpaWMBATxKff1
	 47V1Bht3MjJuqkPSYifwaiiAb/ePpcZ/0fyp7+kQEajbwfwRtlqdbu4W9yRN4U9AKqkj7
	 nQRwgKvgTmWBm6WtCuRWptiobjFCjlUAimRGHvbsRE1QwA6JK1NWjtOxCngt9i1pSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=tZFtirQu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=CeCPiNda;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6E6606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6E6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=tZFtirQu;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=CeCPiNda
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LYFfQ3313868
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=JvhS
	K4+erTYH8YIOH2eSd/nyRcOBtvC7PXAApDZRJSQ=; b=tZFtirQuExq31bYlA6vL
	pcvRyF8+kFc7DPxZsbDjjVFgCknrsQOJ/YCBOg+i7kcmQ4pSW9ycDbX4aOgqRPoK
	TOpazxssr4ws8ECg2S7X5BcJ7dpEhbBe3dvvzcpylWIXTAkGgDJzLD3R0R3Gr13I
	v11zHaRvIy1hTqr1fuQi/zEqsp8tYbR+X0xVKWWcVDJ0W4pdrwDwQ0y5SscjjGBx
	P2ynUjNatgKSyne0N8PGs7LQrUfCinK336Bpq0UKtl9zWm0JoT6ESwOb4RLv+Pnx
	RtCjB+ybb3yOr2V3vsMkR4zzlAiM7box6zZFrI0IdKtvjsiOZlqjQpigynDbKrKj
	5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hpx3v38nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:36 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so490647185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660076; x=1794264876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvhSK4+erTYH8YIOH2eSd/nyRcOBtvC7PXAApDZRJSQ=;
        b=CeCPiNdaBbuGo1KN4AwNkILJu8t9ksjkeXiKJ6HuTHtTEiWAK6OLxk+J5I+t+q15/a
         W68y4l5YiY7J4UjlzTIFfWnHqqGh9sKrP0T7+KeXpqkdCUkL2jrI9w/acKRFQhWf1FwH
         2FeKR9mu8558OMW7LnUjqRdSUYD/AEUAU7jo/J7UG0H/rqOfHIyZlDkqgLJLeybMH2KM
         ZJSIPOckagq+mZ9L0KhnDC1Lu9jyebevTSHsO3beq/wM8Q2kyYIMPV1bOyWBJ81wWGs4
         jzjngJjerBvYpAqT626Z+FyUIMXw4/WVa8e3g+FEIo6mzBq7JI0lNk88ezqSsFlnk+TL
         Sv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660076; x=1794264876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvhSK4+erTYH8YIOH2eSd/nyRcOBtvC7PXAApDZRJSQ=;
        b=xT+7+4Ny7ll2a8t+BIJGEkaW7pLK8iOrZet7VY+lUdlpv+aTIVfQMsLPGg6P2A0W1+
         kBLrkiNZIfDSBOnjb2HYAYJTe/deIX3F4cT2DwKv9XO1H54IEd5CdbieEkz1Zj81O3wo
         l/pstrE3FDwhGVIWH1jv0v0JRojzbTbBKnSVXow2IpxQiPt0FdqJ4CQigBmTPPgVNQDj
         2pYwqeUE59+XqZfpCp2F1hca4jStM0G9elQjxThBOTnmtCXFGXxB0DsRAsnkOgCAip7h
         htClPhi0lCfYdIfNcLak+YyzwcNjHZv6YVXDltCQqK1efkY1bG2YiuDSRGNubpJyhwMy
         wvZg==
X-Forwarded-Encrypted: i=1; AKwUvBxL627nQFyCvTQIEbvIf+jBkVh/xNsuTiTAPx1mZrCuLQlHB2kaZsls3CnCxuID0Q5lKl9g5KiVcWsg8/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw9CxNMIskOjTiS4LdMAXLmMR98P4Hu+XAZ6ilqwOnp6N+UozH
	vN8p0HD/gPiT6OFA5oQcUo36F9TFiP7qwMd8DJl22RJS4GzMM47UC2WXoVnqSEgP3DSvLHrCkSa
	mujK2BuNyuRTySraU6KcXKtuMCy5HZiCl7kvDxoclIOu2ZnUxI6xp7xwX/KUT1w==
X-Gm-Gg: AYBFou1WhMM5d5Y/vquejb+tS9p9L/RE9ub/6FlSN21R22p6nWqDWKGsmTB1uUddEZR
	hinogrjdyS1sauMsN0kNBHqj9NE1VSTbTDyQEKOdoiet/96MsfEt/bmz2+GzJo7XzLsumpHfunT
	Rhbz183mYYjMaVNpFhOSIRnukuIB7ORJhCL8GNv217Kro803C6H4bU3xVfQRMBfs7YldoFbOo9x
	wvbxOuzIkdgJS1N2qjGOENO+kjPLfvinY4uUhpWVJqXHSUXWX5OQAK3A8ltczrtQjjf2CntTBwy
	+08Aaqbtga9DamXGwCFs01Ji8SERtKWGDrIe1WDMXp3HtdSoaIkuYEdar739H6FVM1GKOC1UhjE
	5iK98ZqKD3tNpJq/b6Z5mvuY7uVTbqELtIPMTGhO2EN9AzFFmD4osnt/GstA=
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-944216bc9f1mr1945417085a.36.1793660075998;
        Mon, 02 Nov 2026 14:54:35 -0800 (PST)
X-Received: by 2002:a05:620a:4686:b0:939:feaa:949c with SMTP id af79cd13be357-944216bc9f1mr1945412485a.36.1793660075493;
        Mon, 02 Nov 2026 14:54:35 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:34 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:09 -0500
Subject: [PATCH 4/8] mm: remove attach_page_private() and
 detach_page_private()
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
Message-Id: <20261102-page-wrappers-v1-4-e7280bdb31f6@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=863;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Bq8LYY+n/Ay+89r1G5Eo/k9gxFa6AOfJWAM1sU3Jypo=;
 b=hGYmgc8vvXeTe54e3g23M49eW7JIDcFpSj7RhwWomEDSjn+AGWW8KxWJXr1BemK/D3QZZh6pI
 hS1h5YT70HrBFbsaj1666ot45sEpLJeSQSECMF3m1N/8eaO5Uud1KEC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: Skm65wcK_H2YzNpAXjFDDWW-QlqFG4c9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX8g2eq3m/eLnm
 hTnq+4ieczd0+1kiqpRW4l+3zduS9jX9DX/6Efr0QozXuWAWgW4UR2kQjjTXKgLCOcG5mJMpls4
 QHoyDMBt/dRxrmDwUwUnB+2xIxuOAdTRZ3BXPzU2jPGG9BcaD9vS9DhzX3sFvmWEPbIAfqpm1tS
 M9DpeN31DmMI+wa06zMcedrmOSiv28KOVibOa4SHnhofeFuUgcL7arEurN5VhBR/mFVe2SVlV02
 QyGllVQJ0kP5DShVah9OttvEWwrKoG/a4zrNHOo17Ahsav9BmnNXwXLguG6812mfP0tjuYWIjFz
 bDpfWt/s/eJCocbcKoiiZ6Fuvp1zsOBUUF1o+SPpaOYnpigDkJkcnf4PlwW1h+CbcaPM4xJzTal
 NtDMfZvd4Tgvj4tW/26o5NOSs8TlrVLHawl8X0QFRt7rKfdeYLiQkuXQ7PmO5hKzslTy7KDcfW6
 1dR+awrUS+J9hI2VevQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6ae914ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=utpKXwlFHvWpKPHLcNIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX1sV7f7RJFv4W
 DOV+r+cIbnpnW/CYenXGwvSGGh7dMvY9DVuSoqT+RsUVLX4rABX1C9VhPUIRSEqj0cTniuFEu72
 yXDhC7EZyFqC7r7D1YkQaYYpImXhms4JPLWOsPmNOEMZNtnDYegO
X-Proofpoint-ORIG-GUID: Skm65wcK_H2YzNpAXjFDDWW-QlqFG4c9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=10
 suspectscore=0 clxscore=1015 impostorscore=10 malwarescore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

There are no callers left of either wrapper. Remove them.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 9adfeae2153c..37b7786350c5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -635,16 +635,6 @@ static inline void *folio_detach_private(struct folio *folio)
 	return data;
 }
 
-static inline void attach_page_private(struct page *page, void *data)
-{
-	folio_attach_private(page_folio(page), data);
-}
-
-static inline void *detach_page_private(struct page *page)
-{
-	return folio_detach_private(page_folio(page));
-}
-
 #ifdef CONFIG_NUMA
 struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order,
 		struct mempolicy *policy);

-- 
2.39.5

