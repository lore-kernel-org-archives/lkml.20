Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660066;
	b=Q+WHXgeeVUR43DdR9C55Wxn0Rhj2IlWHCXeinm+yW/hdXeCtAQhp/sb2PsaiPrNJGQP+
	 3Ayi9ENRd5NJzm8CWeTrbiC0KPMWCfEKa3kYiLxzREqxzz4FodyJ52Oy0owGOKPaghTBw
	 7sUQarkZJvOEtks3keGo/c4rQKX5l3wh/lpNqu2ApxttnsywVfCrSx2LIxm6OgjxMVqHb
	 CSMUWkNC0ZzmXfMusKv8k1c3PqP36j2tBFfP35nBJwArxQBChSKiW9FdTZEHiwF7QjN4V
	 1o8OXB9ZX1g5pvFpsJ+qLS97pvf5gmiiWLw83nyYA4hUR9vgNbIRYMTANAF2dtELXrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5sbOCMDhjH6xs6PfuYcn/1F/Vkftc0vzSyYkPk5CQWc=;
	b=g3qwdY7GEQ09CCvHO3PEuajOppC4d9ScaGF2Rneo1GFBL02wOv8jWmlSnuIr6WXb9JKR
	 VQKBKXANSAdpuduYJghdvle8liv72FbpsuT3dRSlWqbosSQ/gP7PzsuanherIr8bCyIP1
	 o2zvxTEce3E0g/z0wSLAhyDr70lT8/yqEAA5rxtbzGfiylw4UcQpEyb++BEPglSQyxzqc
	 KCIY4pdCpo4Gn4Fu+COt8zWIJsG2zuK1JlGaN4u+h+0iZLGHpkK1UTGnwCM9W/sHlTIeQ
	 fmeBbuivzL7vvymvFc4hUV7QK+1dKH0w++bETaEyQkuQXW62+zA14XWAmLsmgP99Ypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=JQJRUwEP;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SXQ7NMwg;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AA606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95AA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=JQJRUwEP;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SXQ7NMwg
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LY9Vr3120393
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=5sbOCMDhjH6xs6PfuYcn/1F/Vk
	ftc0vzSyYkPk5CQWc=; b=JQJRUwEPyQiLxEVGHM4Ratl59KiwFIpdw1D0lRKm7s
	zbX10Ts48hSZk1T/N4anutoMyZK468rvcgAFo6PfRUz74NCmdAdpr+BHUW+2YEIi
	7C9THXlVGe1Mg+jNAEmg7ndNFP3+MsCHBykeqyG7yu0JPRfF3DuEZ8Cxrt1aYoy2
	TfTRYX+frhAO1tQBpNJr5VNdonZXZ5frZ8uSgFEOh8Fq1WRxOlV4yK9Hs4hguTKE
	W3enCqdryBK4aB4kW1Et4ed5jxVggsW2cwSuK1BhhbHwOuHZyI5NOCuAWHnYGT49
	zqVCVIKKNOiYpt3Q2oNIIn9M1gPYnXqXHbvGTocGWNvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq1ufh7k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:54:18 -0500 (EST)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53639e47be2so69693781cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793660058; x=1794264858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5sbOCMDhjH6xs6PfuYcn/1F/Vkftc0vzSyYkPk5CQWc=;
        b=SXQ7NMwgq4qeM9Lc9Ltx6WMo1+Me9HIyRcI9XmC6y63DMTOi3I1799TScRKhi67z6/
         L6tuV3DgYAbRioYqh36c+OhQ1eZXm68XqGMcLFvgkSnXfTpp3LCrULywBATz7LYnjM1Q
         8+Uvw1gpdVR79QRzr03+13DGTsjb3r3r608T8bRNF0TdIUQPzH+FWhH/CEF2XUncpNT9
         J4a6GayFqT3o50cjcTu/NDPtPlqJJfgKvmCzCAhUp+cbSTIJqAqgDjq/YBc4ANx4t2z6
         MHpZBPm7U3jQgbHgv++G+lEJOfC/7zey7hlMjXpvtKlRJaXHboXZ7ERFQwZHSWT7VIZ7
         hYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660058; x=1794264858;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sbOCMDhjH6xs6PfuYcn/1F/Vkftc0vzSyYkPk5CQWc=;
        b=rGSl66x1Z5O1KatJhyu/8Y3UUPpy38Pn3mE/HV2unb6c8f7D3LegnmcC7rkYfx1Rz1
         hxdlRxfY0Jtd5e2YMobHe+0OWDHUVgt3fWH5QfhuKDu2BsSyOerhA/mAgrZeIQDZb2NF
         Q5Loz1WY54LFFVJL9hC4amicEVHCQlmPABoNmj8HcK/ZcqsyP1Mp7GjopIKBVeyyji1A
         GxAQIYKaqlqICq9WYirxbjs4aNinGU9E8vLp51DteZffPCOZaC2x5KZFOgfVQqt4NkTI
         b7VI0UQSQR7SurTgtS3imvF3/BqIBPnIbKAHe+j2PBpDhQ3oy7v5zCFzQ21FRyaFKIDH
         yPzA==
X-Forwarded-Encrypted: i=1; AKwUvBzJSXa10Tpn7lVXTczW5cUrch4gfda2EZuqLEUqHPQsMFXlBELXUIqP4wqnrl+Qe86AQO6dcC+NHYrJ9pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfuiZ/XwkyLwcLEutE/3Qv3cIDU4yxgw5MKa3z0KYXvxCA2t9/
	aL7r1CRK2WDzkZgms7VDQIIFEH14yonEEazBsZYtDwyRVpc7gw4w0ZOyvuxn6CsEkBe6oTVNpuq
	KkCdHMQFiE9IoVgFRJ7RN9ZRLJcbwEKXtdgJvEr9mp/yKk1GbTXdLoQIVZW2Daw==
X-Gm-Gg: AYBFou0ckX+jqyKd5n4QX5WRYDeVKoiYPPca7gsqnlIj/xOAmmJtLo+1rl43QkMnkyB
	B+FRyc0fu/YbazWLms2bO/D4KrX5nEFqFcCBN4ncB2+oYlJyUqJQsuxlQS9BZAUXHnF53Hohzck
	6SOvoyQv/xYGr0yaflD8p0k/fcgO2IE2GKwcaoaIdAbXTwCDSFhTcDJ6po5EEG151vfqrGQDXpa
	KJFbJzzSgclfxDj20NaKoIzhTdxlP2BjsVJ/LJO5G4rOAoOT1AeVITDUdBG/X/CffTge9SmZ+B9
	015JUWZ0ewTr+/VKfOzkHs86dNTCzK3t+N6fjaucESlgUatrKqumNzS5CAK111/jatQpLAlGIh1
	ZI3y1q9o9dhhxmwffXVyvhh7suHPoqh6Kbtx9V/5l5YKbudywB2iCXYr2s50=
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr2002811585a.59.1793660057774;
        Mon, 02 Nov 2026 14:54:17 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr2002808785a.59.1793660057322;
        Mon, 02 Nov 2026 14:54:17 -0800 (PST)
Received: from [127.0.1.1] ([37.142.157.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm24710529f8f.31.2026.11.02.14.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:54:15 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/8] mm: remove newly-unused page wrapper APIs
Date: Mon, 02 Nov 2026 17:54:05 -0500
Message-Id: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAI0U6WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3YJEoFh5UWJBQWpRsa6xcbK5hblZoqFBooESUE9BUWpaZgXYvOh
 YCL+4NCkrNbkEZIhSbS0AkhQ/lnEAAAA=
X-Change-ID: 20261030-page-wrappers-33c7876a10a0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793660051; l=1410;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=xHmePMIFwKfnW6rP/IxD2rFrXi5dM4an870KORSbnuU=;
 b=lG6joMyHvVMs3XovIiL7A9A/jTYzjW8jix0W6c/VcH0NsKuUnCsyuQiQ0VA4GdCMpBG15G0Te
 VA2TieMfdb6Cn5Mgy/khnHItW7rGq42QwrVCPc95P/HiD8C3OfrIONw
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX5Xd1ltsJUptO
 t9EFVLnXzByOcssTT3oaXIfLUuPh00/TGH3SCmomJD4BCUJW/dk/71JHYhdLh3lYAY+Hg8V03mc
 qCKayH3lC1Fk+GZyv33fcY3IDhFZFervMBUDx7LsrCV6F+7X7F3YbnAlOrWQnpii/+m0C990TfI
 9C/1xzIud7qjl/PcyK9qDtxB+DeVJnRcEMc3UdxMYTgJ5X8vD/NHXP2xhD3meIPBr9aIdngsf2j
 MbBrTs9EBA+xDgLQ9Fd4KcKWW9meC9SpBjeSP316okb1YSQQD/+AfKajZCg7TE3iTUqWDHxLyhf
 NtV6C9XrblOBD1KckYKeAwZnIwvWS4CamlXFDGIOP6xPob3Vb+KU8HLyE9pUI69AHgskThpNS3E
 uJXisRBDkQ6k7Y4bEnQl4I88geQrlAOtZplcRvGr3T4eUUBJ+AW+99tY6iCmcXLNCHicmxMcVxA
 lqkAnAM+dGUPsB7jnvg==
X-Proofpoint-ORIG-GUID: 1FqyGGVtTxsbOQ2g3N14VzMWc07VBKqB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MCBTYWx0ZWRfX7SbNkR+wGs3+
 7dTQqUUjhYYI8vOojr9KCjoQYY6jLkEgHZTROldo6VKMIJGKgVDPoC9ORu5dUzaky05Ms5hxdWX
 9/nxqIPU7Udo9EdmUJnj6+1RZWBuQluBjHEVPr5Fu4ZPjK28BaHl
X-Proofpoint-GUID: 1FqyGGVtTxsbOQ2g3N14VzMWc07VBKqB
X-Authority-Analysis: v=2.4 cv=SKfXx+vH c=1 sm=1 tr=0 ts=6ae9149a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Qz3frfIdACK70Hl/8c7MJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=e6GcmG5u4wsWJsvmOGMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=10 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020090

After some folio conversions done last cycle (namely ceph, f2fs, btrfs,
fuse, and page_io.c), there are a number of newly-unused page APIs.
Let's remove them and update comments as necessary.

Patches 1 and 8 are taken from the ceph writeback folio series [1],
along with tags.

[1] https://lore.kernel.org/r/20260810-remove-wait-on-page-writeback-v3-0-dd7531704f26@columbia.edu/

---
Tal Zussman (8):
      mm: remove wait_on_page_writeback()
      mm: remove end_page_writeback()
      mm: remove clear_page_dirty_for_io()
      mm: remove attach_page_private() and detach_page_private()
      mm: remove find_get_page_flags()
      mm: remove find_lock_page()
      mm: remove read_cache_page_gfp()
      mm: remove thp_size() and thp_order()

 include/linux/mm.h        | 21 ---------------------
 include/linux/pagemap.h   | 40 ----------------------------------------
 include/linux/writeback.h |  2 +-
 mm/filemap.c              | 23 -----------------------
 mm/folio-compat.c         | 18 ------------------
 mm/gup.c                  |  6 +++---
 mm/migrate.c              |  2 +-
 mm/page-writeback.c       |  2 +-
 mm/shmem.c                |  4 ++--
 9 files changed, 8 insertions(+), 110 deletions(-)
---
base-commit: 0e02eb17f263e4a3ae6bf1fe45122c23361f0cf7
change-id: 20261030-page-wrappers-33c7876a10a0

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

