Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9121CC5C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086016; cv=none; b=dLwSKDM1LwMUuViP530ZBwUu2jw+f9z/gNdOuDTNfleV3a/E66+yYc4qYtsLMnZEhTvq8H/ooQgqt3zHjRM0PO7+c/MxC20KuXlFtbfpAImL510tHgHYVwWdJad5HkXbiz5rHX60jpTES8FVs6NqKGDL31I4ApYyG+dioM+VIX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086016; c=relaxed/simple;
	bh=yJpb5yXsQPyDh9y91Xv6B3Jj3WvQOE9ZIIlAoBgKruQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dyx1jcU9QqY4GE0dq91zDjCrVnw7wNFCWHqvX15gycjUtQsZRePMJrw8qHr13FnqT2Cqh5jp1Dr+8zM4EwSyVyLHgI2Oe3iiVrndvAkbIO/GNvbuQ0sSkeSYdsdocUo2/VMLGf+GzDjvWgrkXlnvsoXLCMFH7ACmqBgLb7IZruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=od3n6sZL; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BQ1IsALc; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="od3n6sZL";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BQ1IsALc"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9tXYp3696900
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=R68i
	MyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=; b=od3n6sZLRUPnU+YnQR7e
	OuLdyhPo8cy2+fXS17e1+5Blxw2+fKiZFkCarwG3rxk8l4Myi+THxnUBr2c3hrT8
	6Nnuur/owIf/VBQv1PXqxEo+w2B4ivKxiAxN7/zertyChKR03we0Q9O+/FED70xp
	zw/iy+WrbaW3EjgWNqq0VpVjtbOQi3vMoamXq3kk+kW/B5LVz2Qj6QL1aWTigz/I
	A/MfPVPMghtFnsdTJbOiDVsnhDOTwFwNjEO6eW0xo7XzKivFEvMSCxJwjiCDurLx
	k9wQjO+FrsFhkTCNEC99EIZLapNuGfqhNvFPvm0SF6ffSLb0Un+UsfEjh7G0mKCp
	LA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gcgdtg97r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:33 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fb8f67601so31886071cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086013; x=1788690813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R68iMyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=;
        b=BQ1IsALcsMyhNuuY1hKcngszkXILdWpgDvZhQ45Q6BU5cZNabOKbc7+dix8J3+wbfP
         zVI7NVnEJ1P4Y8lWXRsTOCgx9QA08FTZQh/8O0tEWlm0aAS4khYyaJX3RQlOxBAJuCXw
         KUdMjq+bsru6Mn0QHYEMKrjnf63GhlVEVrZv2M49RMSaK/9lxz/YAoCyKEzfv+amV3qn
         LiWvj5UjZiACF96n78wKFG+R72JqU8qpQcX2+w8UmERIR2bbVOsfqskkxZbt6dxXbm0i
         Z+gqf7BqSq+q5kwYwNIogACyXmUOEK6KI3DhMMZACKJSUuyKU6Zw4C+dS6egAtVxtnJf
         Tx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086013; x=1788690813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R68iMyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=;
        b=GPTtpJEqlg6/T/oWnIY5NyNl5yDYCYOtlYHn0fAOd8xnGGPgU15yASGAjwW4OGq++U
         i4OQm/6qpWbcm59DytrDex797YG4JTEAlD5Ei2+p56qhB5mhkt8GLcHbrYbP4E0611iu
         lMfwgHaxiTTcMJRNNSWym5m418Rz4IPFPin591SvcQflK9cDO59XGMTja3LZ+OvdX2iK
         6Izg64dkFRLUEJmKolbtiwGz0QcQiHgRSzr4upLuZlPx+D0PK7lpE1VXZY2A9geqY2zS
         dIX5FZn8Kct3CRl+8DM71rAted9Rcrf8M98PvRq512kPyIruHoTL5U6gl4+BZmELwY33
         +lvw==
X-Forwarded-Encrypted: i=1; AHgh+RqJrDwUpKS+QDbodYzo6qujFjOfp1eLKkENx1t/dkkkETdVM/ST7yOyiU/UU59lQXE3P6U5Bhji1/3U+3U=@vger.kernel.org
X-Gm-Message-State: AFuF++lIhjmUGOD8FF4lDsc+cdbF2oGrweWeVHieq0MntL1XUDuEVbUQ
	iZ+8I0B5YTbZLV3y7s57ExHoz9mxlT7RGtTs3MJ1I1yQk0Puf7NThcKxOeqQVV2T+5QCthw6jH9
	mJIVksgE6WpLuT65Y9mfwgN0aXM3cZ2XFSBcjXqQ8qKNLWUhjGQOtjTS6O5VSMg==
X-Gm-Gg: AR+sD11teuLBz0G4DJzFIhOaE9VAQUsDSnQPJ2tc7/RCvS2XY+h8x8+xVEPAU+L+g0N
	W/Ru/tEMDdyQ1HW+7Rfy5B2tCz1h/xDuf/XDNB0HqFJKaVSzuZZr7tLMyaD6FeMNORjCzjWlRa5
	c4W9fIJmfc7k3jmzc9ZyU9yNwmb4vDl9reNtTINuS+6Ga2fzxRowUqnnSlp8kJErSyxzjvEgI+h
	GNpHyW+muQR0LRX0eqSi/FJj0r2rMQu4HCtlEBlHS9MZYM1Sxhl3wyKmGNM4V2AV31YOr4R825E
	w2BZk8SqKjTl0qEGo2sRmO0ntFH9hbWgKKeifm3nt0HJ2xdN9f2q/OggDSUmp+k3TwmtKdqDH7Z
	Xnq3I0d8cigpEjfRWLieef0ZMCBR3dwRyURcIHZiwjw==
X-Received: by 2002:a05:622a:258d:b0:52f:b495:e9a5 with SMTP id d75a77b69052e-52fb96fee36mr249069451cf.37.1788086012731;
        Sun, 30 Aug 2026 03:33:32 -0700 (PDT)
X-Received: by 2002:a05:622a:258d:b0:52f:b495:e9a5 with SMTP id d75a77b69052e-52fb96fee36mr249069061cf.37.1788086012274;
        Sun, 30 Aug 2026 03:33:32 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:31 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:24 -0400
Subject: [PATCH 2/8] mm/huge_memory: use folio_swap_entry() when splitting
 a swapcache folio
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-2-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=817;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yJpb5yXsQPyDh9y91Xv6B3Jj3WvQOE9ZIIlAoBgKruQ=;
 b=+ysgi6e+YYzjba7Kbk8hy7m2fCoWccIAS+tbJjxQB2LPO2V7RurTdl/SokK8TRW1vJuuYPC8N
 qxEfHy6xQmWDblwBJG6de6eaGjYBHD+8C3L2bA+kHiwPqHj1nUSnpgI
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX4c9v8MvIT7CY
 Q0wKrk+kd6ZnCLA7j+uO3SNOpo5V9j0QxDrIJlzqPUoTYs+uOcOYHIVm+l9stGUhNS79PnR3QuJ
 Bcn3oC7tsLq1h88s0kqpEeepycLNyZ3RFcrkwp//7wUiGEReHjpmsXa5bmQUtz+aYHEeIh2uP13
 sILlxBCmAYjGt5wLuPeD5hJBNovMq852LuMTPSmfG4iQxVTIIraEvaDvS2ABHhUZ3tX/NOgO2nz
 iJTKIz5VxMKC01sfjETJ+6H+qyizSMeuaQHG79wNF+jasuJwbNLFIShGl+tfaMYWPVChdmLD/oJ
 mVsrLt25c/EeyJsd58IxonMdr5anBhQwSKet2KF6mkOTC8jtU563sPlJMF1192LNMqSR4dMfFB8
 7uTybdh2ixCzZ89IHdlGD/7qKr+i3uuMi/D1n8/TaGjvHWbNdez4+5gYxNA6K70s+Vr+B3j4wEf
 M5U2wLe7FW9aX4Gabng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX6rSrI0obVW3n
 stOwBt0HcRO57t8xJBzihmmoEgWto0Ig0oDjzbbZralC45vPhlGq40YDzJOFroyHa2dNyLdycl7
 lRj4Fgl09VpqwmXQ0qIsuF6TaaYF1+5XD+/HvXaKjneCVhFWWxMf
X-Proofpoint-GUID: 4osnR_tM5Xe50VSA869S3Jh9AXXMXw8F
X-Authority-Analysis: v=2.4 cv=ZKXnX37b c=1 sm=1 tr=0 ts=6a9406fd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=AaP-W-LBM3jM8pgIlokA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4osnR_tM5Xe50VSA869S3Jh9AXXMXw8F
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=10 priorityscore=1501 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

__split_folio_to_order() open-codes the swap entry computation for the
split-out folios. Use folio_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 54494c3fa983..03287f995d92 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3760,7 +3760,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
 
 		if (folio_test_swapcache(folio))
-			new_folio->swap.val = folio->swap.val + i;
+			new_folio->swap = folio_swap_entry(folio, i);
 
 		/* Page flags must be visible before we make the page non-compound. */
 		smp_wmb();

-- 
2.39.5

