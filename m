Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7223A5E64
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086033; cv=none; b=VbP7tvpajyYDy74K9Ms5g+x24UQc5Vzyio5iu7DJy1rT0yWWpJ8Tuktweu+YIuBL/MWiNXOCCR3yHieARWXR/Fdt5kaccw0saEKqQaRwT5FEx1AO6SorGYS0Vr59kl581bJzyKWE6bCX+Jsf/Cc8NAJl4+S/bNkChyU6PD7INTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086033; c=relaxed/simple;
	bh=JMnLiPjPeuQ8XHbUf4RdPN6u8wF8V4jepqQl+nANMew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/MJghw+5k4fnAwML+yTqtJhAfZnqHc9Fz3csdSlkfHwmRUdJG3wP1zoAj+g2NdWSIb6GVvxYjbRvPgodxgSbaJwyo4PYea8pjsMvN3cFy5bwQCdZEcgBShXj5wFJaePNwnXjcD7lzGOIT4kSRKyzGK2Rnge2WC53Vqz7h1NLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=cKmK2c99; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=5sickKXz; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="cKmK2c99";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="5sickKXz"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9XMhv3195417
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=d/ju
	GQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=; b=cKmK2c99kpyD+CJhbslW
	GMsg+zFJGL562rbCixAhuoRwdYIq03wDGvBbBM9J1p0jYDWKQ1g0PrjMtqhBjkFR
	33TsmiHjgLnr6pTYATMl/D7HZaJmezrPekZBWtvI59TQ2KlALpsBGmWzhfKUvCBS
	dMsyt6+FSNlsYqRCbKwHckJ2LcX1voJO6gtqeBmlP7InxyM02490+dqbsbAcg2zi
	jGVHdtSdlizrUDhXZ4A7FzNK7/3eCq8Trv+7ZSm5awSjCCjLMeAlPr3hhy+wi/+B
	8cbshrKJKSvDm8F9vlABeI9FbQZ9n/beZzBoiegg7MNaG/+ykkk0orXyyVpkfMXX
	5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbudj4n1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:50 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb6c7b680so32032671cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086030; x=1788690830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=5sickKXz32Ywm7oNVWz5Hj3AVbC6jy15RPzK7Q46Y+jwLRRACLlIOvzrg9NwOhLQax
         CaMEqBgIKAd/rF0pL96Ew/tOTz54Xpv6fZQJamYcfOh2EipvEOpyyc4po01H8vPMYl0o
         vaDywpAZtLn85Wbq6BWkRjHfmQstCKgDrOEJBF411GF6Qw+a0Xe+kPhRy8zu0o5K2BuU
         QPIpeNh4CpoahwHH5ggeRphPhRPm8p+VFvpleq6iQLNWgD9q+G7RQH+VjTDx3G/oByP/
         XJJbbPu859pZeZ5MW7AjrjkeIAbaEH7u2dWPsvsLBjHXMESmBUXSdrmPkGa6MccrAPv4
         OPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086030; x=1788690830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=hYHwSYHKq2bTNIgbdT10ppgzmPjngri5wlkOYyAp5uqIQWGi39YHmwOE5FkLa0W8Zp
         ek4LwnHaQ8lcBAB/Kh/RwC0h3E2tezvglgS7TMWFbj9dNTf/uCCHVX+r+6ebYn9xzzWO
         FlTXSzjaQ9hCCSW82+FTwpTd6VTiKklVaYmjc7p3YVevNM7yCJ3puXEY+TnbI1w3gT6i
         /GBfKJdawB8umgjhFGY30+AomRQnYIxD0loRqvqZSwJCyfj3E9tEftj6AJa6WikWDEQa
         owssF7HARk6ZGfIGrLhg6V5FKxz3ouB4ixey/RRHgyaSoZvJ/0hrmtwBHeJpPi1QFIcV
         an5A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3jPbCeXymHj5/vkynnID0QbL18PN7l7Fzxl2yxvXaX8hGylDwpzrdBSTv/yW3FUP9xoYPO1+8Fl06uFw=@vger.kernel.org
X-Gm-Message-State: AFuF++k/T3w+cLlvU/85aBZcOyZkg+dYnmew7wrtSwzfpCT58x0qBdw/
	s6vxCBEd73lNrnL0DVpd/f9JP6ElImU9kPIvzrPbycPmW8WZQ9jANN+N+e+i/tmjJ9T24dwSwO2
	wrhDVXgF/4CvufR0WpNQJ8cTFXusKvzNS1pkHpjixsBAPnDPGcQ5SzYw37Bzqsg==
X-Gm-Gg: AR+sD10dAsPVqIjrOSS+kk1rETXpcUzC+N1iYffzbJkfHtFfjz2xRW7pUN0NoopGaTv
	1QR+lt0cWRWN5t9n4q57TuaMsQOQVIiFevpJgDcLYs4COTlv9C0ao1uxe/HnT7kuOrCEB1Pv8Ch
	0wATAOCx3MPOU0QDZZdSHHdT2T/1cnPhDLknAoLuefPL6/QsPrJ2Qxa3mPEVrYWMGrDlwLxuE4j
	4WdLq69pDkzqlATWC0BBCPiIuRvJxI/JDrnEnoIruLN702nqf3V1m+phYJ+Fub2UkQRgSy6h7JC
	+Bxvbi564VSapsqMPZE7GdBNlp4aMerSjsiNOmCJeZmdNAabbp4Bs1jjOJFCsbgMp8G1bVQiC5j
	IPg6lGMDfxqzFP97RlvBgCoFSiIQHqPCFHGfUaepKjw==
X-Received: by 2002:ac8:59c1:0:b0:52f:ab8f:43d9 with SMTP id d75a77b69052e-52fb95e7d48mr208988311cf.22.1788086029998;
        Sun, 30 Aug 2026 03:33:49 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:52f:ab8f:43d9 with SMTP id d75a77b69052e-52fb95e7d48mr208987841cf.22.1788086029567;
        Sun, 30 Aug 2026 03:33:49 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:48 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:28 -0400
Subject: [PATCH 6/8] arm64: mte: make mte_save_tags() and
 mte_restore_tags() static
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-6-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=1787;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JMnLiPjPeuQ8XHbUf4RdPN6u8wF8V4jepqQl+nANMew=;
 b=684WpVyyjKGNjL08aBqlBsLxRU6keghtlyIRd3w2GLSP2VrXOpyQi8zFCsDv7pRQmdsJ7w7hX
 cAobQWSyjSRD38U65oQjH5X6lhPqAu4kzOdCs2baVilseYiezKm4jlG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX+g6y0EC8L/AF
 vqWa8wWPl0U6Jl5cOC4xDeiCk9vPCq2HxlM95f6aFgUFqVud1U8e5MqalQhTfdnH9u280vRPMRG
 Oirg+ekeDemUmIJLIVC5QObfi6o3cgB5jn3Ae/D393fE119Z3cGS
X-Authority-Analysis: v=2.4 cv=Gr5yPE1C c=1 sm=1 tr=0 ts=6a94070e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=f-bboeSTcrnmky8UUdsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xxmJNvRukoBbaQ_zOYciql2K5-WJso0n
X-Proofpoint-ORIG-GUID: xxmJNvRukoBbaQ_zOYciql2K5-WJso0n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX2Xp6m7uZzhjH
 XGLlVr9Jr8fXRVP+vfC8jthqHomDtKtjfYp/iigjF+L3BPcBo17nFDF5gL/iEgdrs1Bn/Sox8Qp
 kkfoGcXhuXQfLJfVBMr+9VHWp425DeeNxAodhJXYkKUVaQtAKpVnIRSi0V0iHAygNGLfnXJehHS
 tm3cNFpoSey225mz/HUmCgyqPwAmdVq/IikloCINmZidV0cPY/LX3lfVt051iuho/Secx6Ikn16
 XGm6sBw10g3ACq/gabXj/dzeYad3/Zu3vpehUeRRVxL40r4YyY2pWdKikI8kG/kwmh4uUC8E5qJ
 yc49KNVYTTqnE7dBcxaNg+78jtakrk6z1+3TP5rbuH7EIlJYmTZERuBkPpk06FOpHtcBHyJJkXD
 A8r1NNvtMuXGi2RT1emyCNfnZQ3CU7zFLzGuLZbvzU1VeNW8GCTXvPHAeLMc7cbAxyXttOl5nzS
 vAW6qd101hW2CsKhaOQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=10 bulkscore=10 adultscore=0
 impostorscore=10 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

mte_save_tags() and mte_restore_tags() are only used by
arch_prepare_to_swap() and arch_swap_restore() in mteswap.c. Make them
static and remove their declarations from mte.h.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/include/asm/mte.h | 2 --
 arch/arm64/mm/mteswap.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 7f7b97e09996..83f3b05fc784 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -23,9 +23,7 @@ unsigned long mte_copy_tags_from_user(void *to, const void __user *from,
 				      unsigned long n);
 unsigned long mte_copy_tags_to_user(void __user *to, void *from,
 				    unsigned long n);
-int mte_save_tags(struct page *page);
 void mte_save_page_tags(const void *page_addr, void *tag_storage);
-void mte_restore_tags(swp_entry_t entry, struct page *page);
 void mte_restore_page_tags(void *page_addr, const void *tag_storage);
 void mte_invalidate_tags(int type, pgoff_t offset);
 void mte_invalidate_tags_area(int type);
diff --git a/arch/arm64/mm/mteswap.c b/arch/arm64/mm/mteswap.c
index 63e8d72f202a..3c54afc8b758 100644
--- a/arch/arm64/mm/mteswap.c
+++ b/arch/arm64/mm/mteswap.c
@@ -20,7 +20,7 @@ void mte_free_tag_storage(char *storage)
 	kfree(storage);
 }
 
-int mte_save_tags(struct page *page)
+static int mte_save_tags(struct page *page)
 {
 	void *tag_storage, *ret;
 
@@ -47,7 +47,7 @@ int mte_save_tags(struct page *page)
 	return 0;
 }
 
-void mte_restore_tags(swp_entry_t entry, struct page *page)
+static void mte_restore_tags(swp_entry_t entry, struct page *page)
 {
 	void *tags = xa_load(&mte_pages, entry.val);
 

-- 
2.39.5

