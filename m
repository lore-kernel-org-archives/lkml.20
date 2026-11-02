Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660069;
	b=q9gMpW0weC0Ae8RYIp7xYw/F1C4xREP/nfSw+AZzx+7GFwh1v+n2wT/DVRFn2h+OvBHT
	 qcMuS14a4AzLR5St4RbL9hXyEAGyIedTMlHTN9vfmiBAIlJy/Lhg6bv0mGcRJA+cmjIS2
	 /Y2PTuYFiqEcWe/V3Dixmm2dqglw761JI654AqxrPDI8sjktYBnqwjzOO1wEjpFqg1/1U
	 XVIlXPReC6SifgfXGj5nKS+/ia+hhZ/OAFZ+tkhtEoVMBo3qMgE64NqA3r+Ur9xuhCYQx
	 ZjIHqOh9+raaapFIRBxoPJ1HggFE/WjxB9VslZ+DhPxbOkiVJ4XtkeHDYaWHlnjhfuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QB+Kodww0YjbqkDlDn8auNZEe9KRZmhyQt/bq3VTDUw=;
	b=oDUfKOFXxyLrVMYJniW4F6V+D48HPsMXletXWioMCAMPImva1nXA+JjFlVEiNFJJrfiF
	 81B7+mU4UmM7MVJQgJpUxj8m7RLepMlzs/ljaaCB70s+CW/QreFzKzUFYEvswt9xNku3T
	 2dR/DT5lYxiU9dLbeBKjHVLx0NIbY8/ntFvze1ZlnHzzZi9Mo3nOt6CbRDOj6wki4OY7u
	 4EBOVWS0TV9tiY+tlzExTvVriPy3Ek83IKyQz4kEIARCZJGT7S1KAswWXz845oDgFks9i
	 DLfRYr81xhhRtHMlEC+h8yNegMrAC2EBUjuPIBgNJVUoLuJADD6hg/PJWMFg23qJgUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=UP8T8JT4;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ffMKOr8a;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3FA606D809
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3FA606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=UP8T8JT4;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ffMKOr8a
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LYFWp3299853
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QB+K
	odww0YjbqkDlDn8auNZEe9KRZmhyQt/bq3VTDUw=; b=UP8T8JT4XhH3B3sSFq+4
	S4d33LXKxSWafg7fr9TJab9HY4RmGgw05xsWTPtVL0/Oj/7IPg1vPUzPNT1AxWTG
	gowuNIsMzJ++Bc/463BsrIQAU9Yiy8fjJyAxclZot6aKWaBilVnZcFqFKUsCsUrk
	Cg3Bdr109dijpn1mAOjZ64MgjnPJ+YteMoyAdlXDa9bSUG3dbRQ0pS8W4RfxDsyL
	7/SpTEkKJnrhtY18YtsN9hTYdsrJSqjXnGUBSJY5Un5Zx8oLcB1Au/HEd3XqsTCa
	Nq3QH05Qh1dWsWPyWVDLih82j9abAz/iXHzQKJw0snjkaZO0qchigu5Nu7GGZ9+B
	Yg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hpwa6v7g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:27 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso24179585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660067; x=1794264867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QB+Kodww0YjbqkDlDn8auNZEe9KRZmhyQt/bq3VTDUw=;
        b=ffMKOr8apdOhCvEkTqGjlt0/fT8HrVe2kFegT+v7GumPt7vHAbSDXbLUKzE09ThsWQ
         df9q7OnE1W3wWIl2sd3w1NS+9r2BPrVSH1OVw7x08SLC3VAfm0QiOGUnGXJ9kwhSFVcJ
         Nr1Zb0LEfkgIxKzi0N0Wv2myYf70c8ZMtw2GbjXWXQiB537Y7rmKYoaKSURKX+DE8tki
         G4ffxworc++BbLh8aytM4dFrL3UYlxgWChVfjOb9SK/7IuOOyreC752W4qmf8kdX7dan
         bryyzEUZmoPeDK6iKWm6wwh6wid1F5QOv/56pWxoJG5Fc5mGzgjJ8EGEFp1tWW5SLQ2i
         GVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660067; x=1794264867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QB+Kodww0YjbqkDlDn8auNZEe9KRZmhyQt/bq3VTDUw=;
        b=DpdQvnNYi6u92AlvG9emZf5QjlGt9l+6B91W94dQEMjcp9xB03kMLJs3ppfG8avTMV
         3KX+6vat6PY4rbihxPKzijZsvr/cwTO+uWobT0ltCppbyYoJ2xPrK4e+9KBy9fJ/LPnO
         nnod4hs0W1ApG5obDCxH+GYJ9TvaJnMriieQ68Kfccns18G7bzTpxXemFzYHBn+H21qn
         nSu/Gt2yG1s56yf81NZk1T6VDb8qOsZqXGoYrtb/66ZAK6xs5YG9d8w/X9Z7uAzsmpDo
         y6KakFoBHXZ7kYtm06H09E8e32LeWRkUIRt2XWqfBXb2mt8ivq0eauSlch/aDgE+ZQy7
         RfsA==
X-Forwarded-Encrypted: i=1; AKwUvByuKhCud7D8JdsluhXnVXAys1wMxSw+NXtVXrKug+hg0J30jQRLBj1kiMj+0XXto0UPkwT5/9DM1igfEJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+64StC9RXiLC/Q9sN+LX4BnJiWfdZ52CeKzgKUnyzT2XKjeHr
	DYCaPr9sZ3rxr9TomMeJgog2mcJE6zDxRRfDKJriycIJZJp74KoH0Xd5+7oRGatcbnckfcC0KrU
	/8Ur+SWnMTGL/4zvFxvl5NhZH7Ua25yHM4q4OBgALO7WaAWNqZBYfBL72kIEp/A==
X-Gm-Gg: AYBFou1Wo5kUrLZJeMIICrZdDuFU0KWvjo+WGNO82sDSNFvDJBqbXBi8A7Rwi9izXl5
	x39tDX1jLH7cLL88RX+NZAzlZI+vPYbcMWi4yjzBRv8JMv3y/jxW4nnyo7GNi9J/wgHmvOiLsny
	UGCjasWmGoBSexlLxsn25vmUd5xOTPPeB5OMjie8MuygfFN6At33wWmc9K1oZei0/zSBiaZgjE8
	dUSxo9P0ybm3s4zD5fwpWL75WDTqAcQou3tWvUZLJ3v3E/BtigCFlXwaXEc813ux51iUv0fKvy3
	rtoj4gzHZGU2niaaxV3K/7OiRGsGdk48fJv4yeMS06pGacFCslTzwIdqs9HnKHQV2+tw5hRcU5S
	ZtocpqOAogV/Hgb8VA3/z6waGnWH8owG1E6JVpIA6C2GQHazChAAn+QLPRD0=
X-Received: by 2002:a05:620a:2696:b0:93c:65e3:df81 with SMTP id af79cd13be357-9441335ea19mr2262640185a.13.1793660066865;
        Mon, 02 Nov 2026 14:54:26 -0800 (PST)
X-Received: by 2002:a05:620a:2696:b0:93c:65e3:df81 with SMTP id af79cd13be357-9441335ea19mr2262636285a.13.1793660066393;
        Mon, 02 Nov 2026 14:54:26 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:24 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 02 Nov 2026 17:54:07 -0500
Subject: [PATCH 2/8] mm: remove end_page_writeback()
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
Message-Id: <20261102-page-wrappers-v1-2-e7280bdb31f6@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=2548;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=WI+DTq2D7/P9pyV6U4b9t4H3I0UxHbIun2IjS1qcWJ4=;
 b=+gkUHqILM6e53SAF7LH4ave7gB3KDeZbj+/L3ZVPpR7W3XY5YPpd8ejGvm6Y8Kug5izztbeU2
 Kx2Td9t8LjDBADg74xb1FJwpNiM6tOe5WEBZ8mTh85PLkgrh/HiAcjn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX++MKGLEyo/01
 SLMDpMnLvXU5velYb9hkhuqbIevMV8FvgDPQ5UM8scPUTgGFuTgUSv5sY9TAb/omQ5xfqr+9dlf
 zfYF9RSQS5IQQM+Gkb3SCrmPkn3O9Tb1clmQ2/3RxprkTpR17gm7M0vrH+1s/yrBTrRr5+C7WY1
 e7I/nav36l7XcmoxS7oVaWnuiH5MGhk8vqEkrexuJB7sVWGLOEZuphviqOHidLtYogQX6y1961Q
 xUcONvwlS74sHLTOZmJUccI7BiME3lw6Zh6MizTRnprTweCoGcC6nKX8u6sFw7wV30E0HPJM32w
 x8kx/2F/OfVOxoB3SrqNwtUfvvU046oBkXw/4F+zjVv4FAHVB0ruNi0RZO9VvoDgkkldt9sXxMi
 r/EG0LGiYI9pJFxz2/EGVUoM7WDNvpq/DpOYbTLPI5lCqeTbvX2p2SIG0Vh6gZF4dpKwgrVJ52V
 JtXo2enll4nkvsTZ7aA==
X-Proofpoint-ORIG-GUID: -cKluKOjgXm8DUHg6j7K_7WECzXPGlgf
X-Proofpoint-GUID: -cKluKOjgXm8DUHg6j7K_7WECzXPGlgf
X-Authority-Analysis: v=2.4 cv=JImuIMKb c=1 sm=1 tr=0 ts=6ae914a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=K3LvcDGZF8AM--xSYNkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX5tgeVEiIaWaz
 2ClVtDdNuLsby9Wwf4RM/GEvBf+tYWw6fYFLDxungDMxFo+aq/O4oHwvoODhtALanzPFQpJWoqB
 ge6qUzsifvccRi36uwLkTjHycjBFAXEZ48G7rnDCyXiUvvMbBglK
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=10 clxscore=1015 phishscore=0 lowpriorityscore=10
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

There are no callers left. Update the two comments that still named
it to refer to folio_end_writeback().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/pagemap.h   | 1 -
 include/linux/writeback.h | 2 +-
 mm/folio-compat.c         | 6 ------
 mm/migrate.c              | 2 +-
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c0f7c06dc6fd..692ce3867a1d 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1301,7 +1301,6 @@ static inline int folio_wait_locked_killable(struct folio *folio)
 void folio_end_read(struct folio *folio, bool success);
 void folio_wait_writeback(struct folio *folio);
 int folio_wait_writeback_killable(struct folio *folio);
-void end_page_writeback(struct page *page);
 void folio_end_writeback(struct folio *folio);
 void folio_end_writeback_no_dropbehind(struct folio *folio);
 void folio_end_dropbehind(struct folio *folio);
diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index b749a9a5a5ee..c50f404141b0 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -124,7 +124,7 @@ struct wb_domain {
 	 * writeout speed.
 	 *
 	 * We do this by keeping a floating proportion between BDIs, based
-	 * on page writeback completions [end_page_writeback()]. Those
+	 * on page writeback completions [folio_end_writeback()]. Those
 	 * devices that write out pages fastest will get the larger share,
 	 * while the slower will get a smaller share.
 	 *
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index f880110ac980..9f2cd0ebfbbd 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -17,12 +17,6 @@ void unlock_page(struct page *page)
 }
 EXPORT_SYMBOL(unlock_page);
 
-void end_page_writeback(struct page *page)
-{
-	return folio_end_writeback(page_folio(page));
-}
-EXPORT_SYMBOL(end_page_writeback);
-
 void mark_page_accessed(struct page *page)
 {
 	folio_mark_accessed(page_folio(page));
diff --git a/mm/migrate.c b/mm/migrate.c
index 94e8cd46c6db..953af633ec0d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -859,7 +859,7 @@ void folio_migrate_flags(struct folio *newfolio, struct folio *folio)
 
 	/*
 	 * PG_readahead shares the same bit with PG_reclaim.  The above
-	 * end_page_writeback() may clear PG_readahead mistakenly, so set the
+	 * folio_end_writeback() may clear PG_readahead mistakenly, so set the
 	 * bit after that.
 	 */
 	if (folio_test_readahead(folio))

-- 
2.39.5

