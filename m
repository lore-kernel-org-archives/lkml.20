Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8E3C3787
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880623; cv=none; b=RI8Sy/KD5yqWrrHusqwyuy5h/jfDDkbEQ12u4ZiDgDaR+4X/hoKoydvL1x5+CagBkBrht7d7FP/taimpQbeAsHeRQlAnWAdKkNkSDDJ6X4ZOYhwINfIdw6FfpMSVxAxf8yVC6LsZYO4Hsl/GsZ2wToL9OqpX56/Yj3FjGsZMfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880623; c=relaxed/simple;
	bh=JMnLiPjPeuQ8XHbUf4RdPN6u8wF8V4jepqQl+nANMew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=upgJf3n5PmcNudviCCrLB/PioaGjLf3CXS+BR0Gu88eojUuxIoBdGY8Pkt6ct9x+s0Kpg1mgaQdZlCEd+Q0whckPhebTBiTjLqCmrMgFUtpqMyQwOSvENDEgJrEZuzWbbkg4wjcY85j2bwtbI1ePdfch0n+8y3Z8CQ+Z31wykf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=PB+XrZxP; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=5eqr/QFB; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="PB+XrZxP";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="5eqr/QFB"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYpBO2420788
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=d/ju
	GQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=; b=PB+XrZxPTwrkXbTyYVYd
	lumHQ20EoJN0qSaX0iS4gdwRdgCm0ih1QdVMcHCfxMyxoeBesUAwedtVTF0Jn1Rf
	jwD8hGuisXzAiFVARxfvQKG+jr5u2hvkKdechYgQE4CBe6hCBfDkYf9Kq/g4WGEh
	sDjVp39yDqviUY9iyHs7d3HzHYME+KHUbElN87zOQwdhnAIgZmMCl0BLYovoJxrB
	AeZzl68wQ34cCgR+BxZdmJ3uIpXtogr9+A0ljJmO5mMqi0L4Qk4UxZnkD+0e4BsY
	3DS9Kc9SEDVtaj8C0R6dUKbMLGvVED40s4NWh91cEozh2jxEAyIZMffO1UBdh/x7
	yw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d5d7sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:51 -0400 (EDT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cbb3dcea7so6112553d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880610; x=1789485410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=5eqr/QFBLWCoWrHqAyzcx7ZtA6n64Bca7n9yM3MbIfUAxpTZU5IZq6prbWkGEz/XrE
         +Rzt6nGlAmwJB8RpOnWE3Yu/QU6lYMWVK2t48yIN8uIx8YxySpuWol962fSKJACOfyEV
         OZnXTvfjx9z8UzYMUH0eZvCpqSHEmWfo1fI9QffmH9WBDTpcqvZGJoT57JHhd5DX3FZp
         PRQ/33V0Lu7GvW4jjYFMlEURFSMcL9DzKjwVG+ADa0m493LATniMBUTzq5Y0b0OxIfDi
         iPv8PSibUgiD7fpVXI4PuYVpIYqu8ecMV92TbeX6HZLpUYYkXgryoalS4t/NUMwoCkNm
         g4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880610; x=1789485410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=hwLv+m++fa5kL9GIDFXGLhZwGLWDCVEqfkSdKOzafvvKjWh4ZnKm9zrKWexC8YFooP
         tJScHD61kHHl8TUpwJjO8yBGFQUTgOvzAwiz+fXzgMaBRgib70H5+3HSS2ha0/b7q3Kk
         JeXSngZ+KmuOqvh6P7SmdjJmP1anq+QM6yFMQm9xU7NVZce9FXJWBhZ+p917kx7eGxhv
         maqD2J70wgbfTs00KIg1cbfk/EbXQJmtZ4yCFekByHz+vRW/eptmy/+kxLJhMerc3h59
         xoLWqHV2/ttzZMiUldP6xfHcxKHZNI/nAAKbxXqUTZ3g4WZ4SCktFtLrieWwNiH7xCtN
         ASnQ==
X-Forwarded-Encrypted: i=1; AKwUvByVdd22l5ZvUDu+npI0jFeETK1edKiV3aWCL4OZlBMpocyrKHJv1O2a7rX7Scp8iRfYiid/OHZ6iw2kQt8=@vger.kernel.org
X-Gm-Message-State: AFuF++ll7452HApEyJWffWqIt9k6s0Rda8DSvC3YPPpF88o/qErBm6pk
	RGX78ElIlmg4Yzrm/VxCrM1IK5pp/Kiza+LPQo0TjIw7yAcXSw1qPnnJiYrbRjbT9lWkNS0IGJm
	/qkA5IbFKMSuhH38J6qzfwQ2r4dl9mlaIqK6BIzpOlWtlyu3bkPRh625ApuFZOg==
X-Gm-Gg: AYBFou3ys98FJUsFcuNYB/PEPZGWbCdgqIC+9rvP0SsCuPOJvGMtAIXwQPXzp5WRRl/
	0BFJ0N8QNRFHeqEwtyTNpVySyckIbkbkrK+U01Ub0ahVX7PV7r9STMGVqYFQBnWE5e6h4yrNpCA
	4zyXs60xTpOzKBR0OJzp+YLlMsaEuU+KiR874mb4lG9zcTnB+boT8zi4U9LqG5vWZdjjrlEei4H
	suAinhoWG+HO7LYayySICnyf++qnmZBe/CjN8yJmYlnA16/iYcfbzylXKb65p5V8To+E36MYN6Z
	sQfJRwaCv68ImOk7EN1ez+nliDikZtdpIMy5ITNFMJsvFKqhyPF4sKk9VTHqk4GS22OH5OTPH0D
	BWiQ4cFiT2I+PvPr7CJkb5Q41VG4gss6b5wc1sZrFGa+4o0Wg0XGUCg==
X-Received: by 2002:a05:690e:4513:20b0:66f:c8e4:f013 with SMTP id 956f58d0204a3-66fc8e4f18dmr4249090d50.50.1788880610232;
        Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
X-Received: by 2002:a05:690e:4513:20b0:66f:c8e4:f013 with SMTP id 956f58d0204a3-66fc8e4f18dmr4249033d50.50.1788880609732;
        Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:36 -0400
Subject: [PATCH v2 6/8] arm64: mte: make mte_save_tags() and
 mte_restore_tags() static
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-6-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=1787;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JMnLiPjPeuQ8XHbUf4RdPN6u8wF8V4jepqQl+nANMew=;
 b=gGrVpzINCdcX9e9UtB7ydxsckIe/46z/TwXW94oeS12x2L3iuyn2uigTEvuOZbHdpQe5OV2Um
 +P1oxTLmtU0CwWIE5zTT16WQtchDHj8G1SYst8releCqJFl2APeIPvs
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXxnM5BRmxtGbC
 UVJ6cicyeDMVsqmX6wX1FqP+qCSRf/ykklF+QJEEyqao+58M4FmcWEhmiOdOWN6lnKmNxy6SfI8
 Utfi3K1J3SG70hcgXEZ7vCsZpmngBjJIECznHXYCYUI4VSb1+kz35nGVnO0ks6PVrmGJGOjd5ey
 UkD95OEMN0pbQIpeAI3WX6uBUu6s5reAv/Y+GSX+HxSBY6Co9ZsGY8vAdQCHj4FqNbRxzOhLhPY
 wtnnX6fvjHJpZ/kUPt1WY6pXVLpRnz3b0zmTNmg06oC10fzr1UvmRsW4RR/GFjaErD2Bkdi763h
 KXzBH744Lb50ZoiCSt0vtPNLRdcM2C85Yj0wqq2H/Egv9+FwMT6Esd3zBxaUvMBwtlOQ9VV9kQJ
 6QjkwfhDnM4PUSM+TAcAhE+dwAaDBpI4fepQLQXT0gP6/645pZxQvr9QG03eRZoBKUozrwR62HA
 LmSuBDZtIXiv/anR1Rg==
X-Proofpoint-ORIG-GUID: LAbXbh8Ek9XWvrHjgc4SBkfZRfkBkoCP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX0c1jjlXTmPWy
 j6XKHQI64JusIGrb5qIesSBkP/APj4l/AHkAvFJHMIh+S989jDGJlIMWRszOETpIKSXPJwT1Dso
 oYxLK/EJU9CtMGXaNglZayTdsqGbN4GHZbRQvKsljx86JH39oH2/
X-Proofpoint-GUID: LAbXbh8Ek9XWvrHjgc4SBkfZRfkBkoCP
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6aa026e3 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=f-bboeSTcrnmky8UUdsA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

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

