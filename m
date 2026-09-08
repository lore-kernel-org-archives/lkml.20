Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98D2D9ECB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880629; cv=none; b=VTlG7njLxbOUReG3gIZuRt911x71Mkoe6sh/eWWFlodlGZwPN0rWtj7VhYjgT6xMYpVMATY7wfWU3tDpzukC1Z8OMTI9SN3CMg3yjilMuOjxHufTRLHwRG6AxbMPDTPKxwgAB2N3kYg373W0JM4Ho/fiRAOhT9bRbTOZwf0j8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880629; c=relaxed/simple;
	bh=yvkP2mDf2z80hosg9Pmvfjl+tEpO2wMDimHyUBJdJvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRYUhTAkV/xHN6jzo8QwZTGd1wxYgc1XbjYPDXdu+RWrMAkNhfRCw5i0Hk/vTUtr5AANMzOl+GGtxJkTJIZS0oUEMr316DabiyrZY5xtk31nmowM7LeksSSjSxiBQeiJc8m1x+d822dol//F6rItgLiw4QpgqGQaMAaAX0mjEJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=EhIGSTan; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=TvuYdDQv; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="EhIGSTan";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="TvuYdDQv"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYoF8900158
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0W1L
	z/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=; b=EhIGSTan304r/fde464/
	/uPwl9N/ujQitXaTUybYajUJSVwBUeh7Dvfl3s/Lxxsyz79+AqWxNHzOtJEJozOZ
	DzcidU8D3aVkVnIEDxjSOIlv/W2MLB5yAvskFAbvqNaBQq7ytqx+vcBpIMQH1kRs
	i9UpcJfeqTwWEeUHaceEw5SG2C8v8c4JpdpKY+xg6v9lEHoQpZvJnz3y+JZw+Y04
	do1YsxzqLKRoGEUy4Tqtm1JkiuzlAZNIjSuVANTpTqy9+4yJc9jSyAU0u1cbj4SC
	tG0VxCY7W8CsO7SvuekZNMj+DA/qjm7X+gIT8i5/ajNDVe3GMzVecaso317KvYMo
	7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4ykw1hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:47 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104215fbdbso113144946d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880606; x=1789485406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W1Lz/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=;
        b=TvuYdDQv7Y8TQJ3rXu06uO8orhusFAd5ldyiOH9qbx0jy0HkcDJmhPWLcvJ1iJMy5J
         WsYGypPrX++EzVaZ3IQwHRPpdgmo29PVdI9MxSDh0oneaKz/XPvNWCc7w320PXDZBLmj
         8ghxZtwT80mA4W9/k6+TrBUno678HPdmswX/oXd0Mmi0cwRWJssaFO2/f1Uld4eX7QWf
         s9dQVtQovX5y/tjYQM0WYuXfYptyPonnHKcvl9lSMjVTBTdfVRV7ZOE1BL+b1xHPzoC0
         aA+QdhXo1shJWw4x8+jljJMMQWYjkznVTUV/uKk7VWTSV6sX0iNOXA2WeS2V2zeQmsJf
         xA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880606; x=1789485406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0W1Lz/54tGMWp2hamaCENav3d3oGjbDnHiZEdOsJjcE=;
        b=W25MNduPzTqCFQpJ5kOPtUnClxe+i7LrJq+Q6HlnxvEjGPOEGY1AjTjm2NIy5Afb4X
         5dwHGU9y7/dlmJuEwhDE0G0TaY2klWQrFFQm0EUhCz1DzArw37336wqDwUPH4MDYv+dZ
         U39k6VeCk99nVQKjxrjg9E67hZavuVyu0pOjwH4EV/oKb3db9gWbcRmCOOIJ+mrU/v1a
         ORKvwLmOPSMoFfRuV1RCZNsDNtmkQw3XS378yJagYJMZPaq+a7aRKOk92drDdOv6rM0h
         EgddnKmnSK8Q2aWhbP21Ke9AL5hnrGfwB1SCr2LJKExHsesv9nsyUxW1G2EPWPtrx+wP
         QW9w==
X-Forwarded-Encrypted: i=1; AKwUvBzVOVHO7LBq7JNA8bMT2Pk2qHjYXANZR5XCvAZ1f+FNbdck5Tyz6moqYTc9E0z132vXWd9ywGvhQOnEmeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mvUbg4fcuv7Z1umYH7M+CwevkhSNt/eE0HgmE7t9AlX8MUk5H5
	2Nf8vJ3IAyP7smgjVNiZRT5aQROBfLGfUvA45urjXMUY0xZVaHU7RmMFVP7XhRpZLSkx91Z9r2P
	9i2vlBNobbOebDFnuaThx4iOr3DHdrSqysECYJbETlA3rJaHwAFL1sH/sIzrNOA==
X-Gm-Gg: AYBFou23/FL1XMIwd3aXLHc0vszq0Ayy9tPjeoDcF3MZ/Ma1FUW+qj6BNsaVMs8BFM7
	9pdUn8uV+oCs5UDMTjQ/eTw/jvkCPPrLtk23K8xZ/GlrL7r2h9N8GX7Jp1qaVBPQdpQBwB2/urA
	1xZpGD1PeCZQhwjAocv9P1XTF6XmgtkBBmz60sf1c03iNydSOx0aR7ZM10qAZjh4oTCD7q0AfYD
	bV+jX5lBf8uLwRBevald3leZblFB70uYco5zo97NXVOZOyONyuWHbBNX8Aa/rD/qm38/lcmUyTR
	gJjxzD3BPUXt1IksyVNa2u1fRn6ZerU53+3Fylei12aAwq7G1wgT0IfQVWctrSmlC2pL0rLpa1y
	B4e5mXLorwArrHHrw8VLn9GeLHPQZc2g04b5FkJBE9oMEtiCRg8KlCQ==
X-Received: by 2002:a05:6214:398c:b0:910:3453:5060 with SMTP id 6a1803df08f44-9103f06ffb0mr368498686d6.34.1788880606289;
        Tue, 08 Sep 2026 08:16:46 -0700 (PDT)
X-Received: by 2002:a05:6214:398c:b0:910:3453:5060 with SMTP id 6a1803df08f44-9103f06ffb0mr368498146d6.34.1788880605812;
        Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:45 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:33 -0400
Subject: [PATCH v2 3/8] mm/rmap: use folio_page_swap_entry() in
 ttu_anon_swapbacked_folio()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-3-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=796;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yvkP2mDf2z80hosg9Pmvfjl+tEpO2wMDimHyUBJdJvM=;
 b=9NTCtRV8ef8tsMDWIW6LGrns0RiqDw6081+w5XUEOPyzRj7uB4Tjy2rWtBHQT/fE7wnw8kXJf
 Ba8d8kUblc6D13/0BuFkZZ/M0zXTyH+jrCL1a8+dKG8i3uQOKN4EQVo
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=bJQm5v+Z c=1 sm=1 tr=0 ts=6aa026df cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=gAJobatAmFEwf0K8sXEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXy8xWDaJzXVI5
 LitdUKfMbdtvgcOI5EgqKg/AT35XQ6Hfbl4znYFwqtzAY7Kc4y3Q+/eIb7xPUjxNbEmPF/5qk9e
 WCyMpHxZ4WEjZBDU8KBxVn/E/VxQIj/z5qM4XSxHuGtPi1HENMdQ
X-Proofpoint-ORIG-GUID: yo23EiYzRgr94dIoAb7EVwJw81iUOWlZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXwD3clzeU3jVq
 hV5g8eyGFEIoo0IJMnVC2NcCX+G/+pQgIIaU2jB6lXJmLb1G7LGCk1PWzUZZKAhpjNvEJC09Tyb
 ho1I9dkqt4XOIQ/d6AaA6SoUMVpQCCn9CSYYCkqSbdzqn66LYM/Gxn/4sg0IMDmlExwcaj7qk1/
 5DcDxhFZ3tW0iS4JZUS7MNKbS/YtBHIwpO++3isOfeTRFeiICc4EhRomoWjSwVOFEmaw/5CdCk6
 MVf2H0kP4xMT5cqEaPolEGx3aPIdsdLLjdDriOjGyE4nVpgdpMmGwwcHrsp/fpCZ4LZ0wvIpzcV
 VWikQojPUsCebIlZk8/8pFirrRFgy+8cVjf/5l4x03cFbGQWNUE1U3xc95ytMnEqJlvsM7jmu30
 RK7+vBWYghP5wIrPZEXDbBR5v49fNeccMDjVWfEdHAsWDe4OvVYl+pRf8k/RtRhMcjxQYdszh7t
 uB7pqngJ/5mdSkgCwKg==
X-Proofpoint-GUID: yo23EiYzRgr94dIoAb7EVwJw81iUOWlZ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 impostorscore=10 bulkscore=10 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

We already have the folio here, so use folio_page_swap_entry() instead
of going through page_swap_entry(). This saves a call to
compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 5fefe5b060b1..193e1264b631 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2147,7 +2147,7 @@ static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
 {
 	const bool anon_exclusive = folio_test_anon(folio) &&
 				    PageAnonExclusive(page);
-	swp_entry_t entry = page_swap_entry(page);
+	swp_entry_t entry = folio_page_swap_entry(folio, page);
 	struct mm_struct *mm = vma->vm_mm;
 
 	if (folio_dup_swap(folio, page) < 0)

-- 
2.39.5

