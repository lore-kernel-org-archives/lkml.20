Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859472;
	b=P0uZAVF+Yl/csp2ORwFSqkT9NvdfcZB46iuk25zUtnz2Bi8kx8bnSRCkFgTvTqZ1c7nf
	 Db+sbP+zJA+H3LgdZVJsIxWpMIJ0844aFUzXv8zioihqe0/MD8kZM/TeMn/1Sl1sQ8Z0t
	 bc4kEfAvOaIX+FKURo7mNJmMlCoky4Ar/2uYH0bw8sabSDDVgJRYqaJSnRTc/ZZ8jGVNP
	 iW+1qn7LjaDBfoesVNO6aVLp+EY9LjNxcoNEBtEMd5UGgXXaOXlhIBtdqFq/FXQOfieHz
	 NznxGVvsyeFfhImTmMX/z53NYflimWTODWZDWKUoiXd4vd0BL8nWYeIgTpSmiXGfZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2ioUD8QeW/Bl2QsONQm9YVJC6hK9MPeWajyNk7zYtP4=;
	b=ne4bx7Ry2WpIBNEyXvcr5TwE+6KEBfrU/J3qm0u880DE9Gw7f4NopRR3njMJfwdqY18A
	 EQSwCdXuMQMagSgtQ1lN1BNn8CjTUL3zfzwhbtiRId90d6/TD/nsoNWlXs4JsedgS9iF1
	 RsQjHx2y1l11T4ZH5whok7oQEP779aPmr21ukdP1niClZ0lt2Pcq+tDedGkHsw/bbNPr3
	 dL+Ql4Gf4F8jdFzFROu06yyNEiSE+8/TAR0ZLhERnCPKHD1S+sYt+tw8FXtWgGxLxAyYv
	 BUCNKq1bYCR6BP0FbVFBUjZy6xtALlvJU8Vg4L/T4gs/p7ECMQx6VkraDGcedY+SEkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=rzKcPpLP;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1tuiDLri;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A4606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703A4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=rzKcPpLP;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=1tuiDLri
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXciJ1468109
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2ioU
	D8QeW/Bl2QsONQm9YVJC6hK9MPeWajyNk7zYtP4=; b=rzKcPpLPPjOBbfptWMeY
	KHBzukkwaGB5Pv6nbCYgFY2Oh4WwqTg9VRMTGxWKpUEyaA6PBzLi0v8FFWNZZSOz
	zh4/jwq4U3HmxAs6MHf7veIkmGvFQpNRuI7fvivypEBG4JTsSb5QUS5ocd9d2nth
	F91XJTTFa6DPCOQtFYeE7aLYtyVQZAAXD1IsmWH2zezJ7V3L46Je15bu15deNoXu
	/ne4yXvHiYnwd0MNHqVU5niignlDu3cN8QfUyKv66dUUsEgqKm727DtTCuURhIUa
	slKFrd6eHVZdFDIDPbIzNhgdGX3wx/eRm1UVIZrHoc1bkUQdj4GzaWC85jMSaI7O
	8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059hj038-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:31 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ebc622dc8so57231166d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859470; x=1795464270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ioUD8QeW/Bl2QsONQm9YVJC6hK9MPeWajyNk7zYtP4=;
        b=1tuiDLriPnMeS3T59jlMWLiS08qkOvhN4lR43LsIdWaGfEMM7zND7Sru5qpWnkraEQ
         sukvsoAAhtpcB7BhD5pkm7CKII6/XjsNsajK17L3KAat/WcZtsCZ+xRtpm8ErNWsXWZD
         N3HAKlCgqW6vyrfNUWg1+P8Rr6d0IcGcjdCmzRVZhgyC+6hruDtt/ketiLm3CRxu1A7a
         rHEgl4QP/0z2Yrs1njXfO285OVajNuQJhPj7V1suFH1u/qX4rNAt/jZgHZ8Rx+MqUPIJ
         gl3kN09UkhgklEB8wZT0LwtAd2gNJCUfNF2ZPuSfrqnn14vNBOkLvoBOg6+/ZgvxN/PM
         vlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859470; x=1795464270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ioUD8QeW/Bl2QsONQm9YVJC6hK9MPeWajyNk7zYtP4=;
        b=Oixt/8y42t+Dtt/YiBKezP8jwNq/lYwk2sKrVKu2AKyZ9SQORXqzp/nWRHg74RW39y
         ExVATxxreU2/N03A5/T9eiM4YJUc94flO/F7PwlIsdcTIJn9NV0/bIsUIP6OOZM+Inpn
         t20E8FRy5b+AWY/Ae6U5GccQhhy7pCybXg60NNR5Bs9Sux9mHhlSUFFtgk4YtXGGUnQl
         2VGNNPCyw+X954rorEiCum3/HbY96YKYb3NI9jYT3gNlPBitggjQq+lQP+wMR/F/BkEO
         mEOIe4KeZFXFzDj1UlZkscsNtYEiLpram/s8oE09iQ+n/GsbRzu2D9N8CUvGB3v0SaYT
         jAJw==
X-Forwarded-Encrypted: i=1; AL+hErFHpk/lYX0zDADHrJX0g5yt18Zy9AoH8ha3Yot6Gd60vBuAN8mEnHgu+UnMv0ZjhmA3Z1rqw6FyYhAGzUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B9YzegrRjSDvV/7NRvRdYuZ05aSDYEP41BlxLajfTOsNilSpd
	TgdEUnsqousIi8FA0/UXbriz1kDhZuCuORM9RJeBFwi922hR1X+wdFer4x/ZhLKXU60Ou7uuz29
	ua2aIYfOYzOqj8xwFDhPDMpuM417M+2d9RRzGGva4AI8p0FEcuCrQfdUlOre20A==
X-Gm-Gg: AZFdTZerSUX+kxxZ3wskWa7pMa1qQ9AnX8vaGDO2CbTf0Z38I6rKIhoHYb2cCpR3kAU
	izDbEsxj6P+/C9WBhDNSYakot9x+31xINC6Vfd6OakiWkA7/hup3hWYZg3R+6WyhJi7A9YW9Ym6
	xST22Q1k0fvzM/9uBK/owynLU2F5yVqv9p+fCCEspnY/EdNb3wfE/gV1QGbGTuh0+Pyz9IIgiAP
	MOtPLyFmUdCxPApe9zuAORWLXmbrk/gLs2KKLTgJvLXcF4blVH32NXKH4m+MA7LL75FpuIsLQNy
	NQOYgPAKu1Qb5tdcy9nJ3E8NeksRSKWzRAtSzkXrVaYYnJBb3vrW4FfB68reyvTYlBhge8EyCZT
	UluCEiyeh6hRbkNyPZNcAA5tAVRP3wjae9amS8zFByWTdVOy2PyUOJNldxfXGV+/6lIf4KcZZly
	YNNC8VfLSZjd7eC62pOQ80
X-Received: by 2002:a05:6214:8093:b0:91f:26f7:281b with SMTP id 6a1803df08f44-91f26f72946mr159227016d6.43.1794859469749;
        Mon, 16 Nov 2026 12:04:29 -0800 (PST)
X-Received: by 2002:a05:6214:8093:b0:91f:26f7:281b with SMTP id 6a1803df08f44-91f26f72946mr159226286d6.43.1794859469056;
        Mon, 16 Nov 2026 12:04:29 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:28 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:46 -0500
Subject: [PATCH v2 4/9] mm/migrate: keep the uffd bit when restoring a
 writable migration entry
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
Message-Id: <20261116-uffd-state-fixes-v2-4-4397a0196479@columbia.edu>
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
In-Reply-To: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=2071;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Rpcxw98gNx7X8R3gnCRpd2IGCaZ7qUyuKdN6HwM4pEw=;
 b=yCtqcH1n96717qFSnug0DmtvKU2aDoSSvP8usjhBATY5U782p0hwGCGV9M5Y+cr8bHvHRBbSm
 HdPRffja1PiA8jPnHDgHJlTaf2jAJ3jlTESZwHdSAhyY+MGSmKh++wr
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: CY3fFp945RqTvmif1_pweoQ5tZeg2GUC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX9/5rW/oyZSIg
 hCFH9vQ7/2VldOPFwWHewZMu4PSvopVedKY2WNWvE2fdxjkMH6UCBdb7ndg8i8kOZhZldUDapKE
 SGAsrXcC88bchnc6Rz4eTYadCGNUHl24Gp9UfhL+W1r4ia6g4V7y
X-Proofpoint-GUID: CY3fFp945RqTvmif1_pweoQ5tZeg2GUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX9yhJ+OmiQlv5
 agrI1S4eojeYJVenZygN9voSQCDYEz2jYjDh4CMfSLDZjD8MFC4XPY0AHBTn5aqiaFESsFiC4Fi
 J5FcYNc8AWBwwMN/rljVU44L7YrK1t1klUoApKCZF/nldN2ZPc01JoPrfCpDlGWGHQ2vyUaSqaB
 Lv4FxiP3q2gfpNZYIvhgRl+OpY2E6QlFPRwuEGnxyVfVDsV2VS4uRU7qvPeN0ZZFkD5p5Y86b8U
 RQN0GryYI3fIKIHMpzBFNHXc0EZdaGxR9sCG0L/tBGhQ9037zYVSsSg+A5Iy8Q4gZXY6db3Yecp
 8yX1PQ0yoH0ekri8ij5WWriGycvxDHK5mlN+0wYKO4EQdi99B9JBbrQFe1S34xLmT/jUmTY+Lzz
 WSoC3uFsFGxfsd4DCeetlXLXbQpeiOAJ49krZonJ/2Mpb43G5mYegEr7q8ErI3nuXhLg3iiB32a
 aev4v52nV/8V+J1dfuw==
X-Authority-Analysis: v=2.4 cv=NLlAaE6g c=1 sm=1 tr=0 ts=6afb61cf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=Ikd4Dj_1AAAA:8 a=b4_iZGTmu4G-YPbO22QA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=10 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080

remove_migration_pte() makes the restored PTE writable for a writable
migration entry, and only looks at the uffd bit of the entry otherwise.
A writable migration entry that has the uffd bit set is therefore
restored as a writable PTE without the uffd bit, and the page is no
longer write-protected.

An entry with the uffd bit set must be restored write-protected, whether
the entry is writable or not. remove_migration_pmd() gets this right: it
makes the PMD writable and sets the uffd bit as two independent steps,
and pmd_mkuffd() write-protects the result. To fix it, do the same at
the PTE level, where pte_mkuffd() write-protects the PTE as well.

The only known path that created such entries is PAGEMAP_SCAN. With
PM_SCAN_WP_MATCHING, it write-protects the pages it scans, and it set
the uffd bit on a writable migration entry without downgrading it. Now
that PAGEMAP_SCAN downgrades them like change_protection() does, we
should no longer see them, so this change alone should not be visible to
userspace. If another path ever creates a writable migration entry with
the uffd bit set, the page now stays write-protected instead of losing
the uffd bit.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735..d200f64b5f98 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,7 +399,7 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (softleaf_is_migration_write(entry))
 			pte = pte_mkwrite(pte, vma);
-		else if (pte_swp_uffd(old_pte))
+		if (pte_swp_uffd(old_pte))
 			pte = pte_mkuffd(pte);
 
 		/* See do_swap_page(): restore PAGE_NONE for RWP */

-- 
2.39.5

