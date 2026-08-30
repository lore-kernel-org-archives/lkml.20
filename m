Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256221CC5C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086008; cv=none; b=JkkFm8NNltTROIVycvcS9vb+i0e+eTA2hQ2yDw+iyH8CXtrDXKpk+PLfJZz6Uqm+3rOgOpQcANkP0+uEgjnu/ZaOYpbjfOk7ejU7Uv2Mfgw94z8aFqb8wPmy+7EqPsjSz/VvZVSfjg13Ebn5Rss5caXGMRFliqz59EpGY/vQAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086008; c=relaxed/simple;
	bh=URqsD108Ktb7Q1ul6tJPwzbY4nIKxLZRUx0agGsKnfc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uwTMOM2fe2x0ATwvoVk4aTFR2iWH/iKbeY5HGORePDwJk6HlojE04EYtbcQFHUBS/jqghQCKScECu2H9XOeD3FWg750hJhCyH13Pay9OMY81VK8OnmfqOSzpJrmzy17ox+BLL8kU96FhAqK/Tu0Ec5gDNSxCHsf6ytAiYwLF9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UrN5Y7Al; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=rGUVvTCC; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UrN5Y7Al";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="rGUVvTCC"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U8qK2v3113779
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q
	75Cerw60dFrdsb/pM=; b=UrN5Y7AlAfBbY4Fy/u2SJtnyl48+/thxogZMawq5vx
	GWDobDYzCPueT5SwmQqcFvh62bwzdLbPA0voxbttGPICDfjCp64zUixpqjHKv5M1
	60fDqXYLjHpqE4RUq/8b4UwHFwB8u+06Nm46g/H4mqnh8+duSlzN4blTnsZG1puW
	1cS5jLJWugFVEOIgAC/bcsaqQw5tqU373L1NN2rn4hsTy5BoFe0bQgt20RPpSYtn
	x/qBuhiaxKDwIdoDnZp+iwOV7pWzdAEXUfgXn5q7wxef/9rpinE0x+SOAwds3jM+
	gbL/t3e0nkJZwlwf2aJsn3xRZfPIV/wgtzdPB9V6UkzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbs0pvvq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:33:25 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so51031781cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086004; x=1788690804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q75Cerw60dFrdsb/pM=;
        b=rGUVvTCCPAcV7uRvxNg5xCpOVTWrxKqoIfEhK245/63bBWYIazRIkguUjKn6TfAIlq
         kGix/pT14XbyBldsSz0rfDfBKN/TnJ6Q6ps02AIsXjyRDp7DEW59uI49mpy3guieZdLE
         ALufLXkEM0urzG0PktPd+bjXf9uXJmd4jBIF9++xFLFdIv3Uk1eJpnPWQZca01q1gnQo
         X3pL4ctOCZDfs45MUSEPfvTU18dtW1UwoNltvt1+U5VNwVZ8LW+C+Rb+3esXd17h8frm
         6bk4pIniaHgv28Qe8KLdfWy34xNHDVofumY9bt9X1Q1Gj1rbwkRkvaKUQh0pgwN7pPzx
         c8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086004; x=1788690804;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q75Cerw60dFrdsb/pM=;
        b=SOVPjbURGQmA+5UG2WfM2B6CbBbx7Ety8RGvN462rvJpbXq7F1cbvxvghQUSQ299zb
         /1xq2ZrPX72x4Bi4QdmrZTTcjdG+YXwYGfQk9yUxC7PyYWSO1722q2oR3PoBShrPMYc5
         V1JCYyZ07jTta5oqiPvxdTo5W0ru3ACkcJjxRqPa3Ff67t3Nu00e9pQpLfkufYfD1y67
         tT+hQqUZVDa4PYm8SneF2YMuWtgKWLs+cn9liTvOHLKkW6YzJFb+3F1oCCAfVV78p0lk
         LDd5K+48WftHcYTAtDTstnR1di/O3nl292SHY6qSwsmV2rmwomfblMFJTyr0VkKlXI+Y
         vLbw==
X-Forwarded-Encrypted: i=1; AHgh+RpmhKNsDKGuSoC2aMaK6Flk8mPq5hUA77QjYloO2t6o2iLjRo7HSD+Ph78PnRMUBITyeRLHnK7QpHvC3Og=@vger.kernel.org
X-Gm-Message-State: AFuF++m575t8WzyJD6yRykYGHiSNVwkfWAnz1onG8slH0+2XV9NZEjzZ
	aXV4IKmn1HghFLbGnPxq3OS51AXnuuTM5aPwlqYTjczwsqobF7ryXF1fRdkm1N89i+avTwNnU2u
	v86kuaG0oS/iLwfl1Sga55yBVlajZ2EslJSV2zUyv5iaHIdq39xe5d97cTQwHAg==
X-Gm-Gg: AR+sD10/+FhfcrPILAmXkTcfMN6sttGsJN5GArSkgEwNQWxXKyj2UgCQwA2CFMxBZSD
	bGa2aSdDl0H+JntdPRvwv049UKr+CUvSmWvArVBmZeOJRGBAlTG4jSdG7o+7gk0pM11gaP4nooA
	CV42esugAhPi+cSgJvd01vI4Urdi31Npnhp0WTsi8j0FGw7a+PVqurhFiOofFEdc75OzA/NzfKA
	A9+4pyzbStaRqMBo+kh6w0wbDJFejxPChoVS2sLTfilH44r8UeqROYTqwEcZ9JXqNS82LhdS0ll
	WR6YCDTBt8anQsy0ZZMtXxX9eSD9AFmF7ExxeWVUVFOXPs1bGAiZj0IyUzpAVO/pDTD73KfbP4n
	GDBL6yu5uFzgL58fQy5kt95TsDm/exo2TMIR9e1p0Yg==
X-Received: by 2002:a05:622a:4d44:b0:52d:7b6e:4986 with SMTP id d75a77b69052e-52fb94aca06mr249247291cf.23.1788086004554;
        Sun, 30 Aug 2026 03:33:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:52d:7b6e:4986 with SMTP id d75a77b69052e-52fb94aca06mr249246751cf.23.1788086004114;
        Sun, 30 Aug 2026 03:33:24 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/8] mm: remove page_swap_entry()
Date: Sun, 30 Aug 2026 06:32:22 -0400
Message-Id: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcGlGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNz3bT8nMz8+OLyxIL41LySokrdVFPjFDMLM0ODlFQDJaC2gqLUtMw
 KsJHRsRB+cWlSVmpyCcgcpdpaAN3xYOJ0AAAA
X-Change-ID: 20260807-folio_swap_entry-e53d68610de0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=1676;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=URqsD108Ktb7Q1ul6tJPwzbY4nIKxLZRUx0agGsKnfc=;
 b=Vbu1vdG/yynRHwQQgggtra/gysbc3tRr4M+3u9Jf693fE4TvPp8VylrcVsbN5b3J6pcxUbsgp
 qB3DhfuPzdhCqmnLZqz/XufM/PRKZAua1WrSRVFIPkcEVAXKk9HZwVG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX+RfyRuMq4/qQ
 JK0i6cTVRVgbrUhUTmRpg0u+h7jOlycNIdj4QGS+nKxJ3ASemCQbYO+cRao2POzkK1GPBhxpqMH
 zX1yRPWB70EQMKaVIJoo2eJpKQFOzLxanR8vL1+T/iQ3ZHg67DXW9qxPb+sPrqWg5QJjh4qj0zs
 xlhApm3XQ+yU3M6sPLAVtHXKZ9PMjYZ263Fk+7mfw+ExoCK9MXagPON/qi8YhHPttTcpaQ+Cjtt
 fAk09TDXoP7UKAv0x9HgAxp6v98c+rPEUEfeGzVkQ6MP4gFKmLqxO/MgbB1iC3XQz5OffTectYJ
 KsfVLPsfK778Cuz4i19l9HF5kQvHHXmez4aCyi5/F9VQnX+LF7WCS4bWADOZIkPfr0DKb/DhO77
 1SHugAiXQ440dyVmTBKjEvlvUp391378U58zd+7jM3ajESN/+NbLQ1ZGnC6FCXzcBIHWC7O4Swy
 knBAndFBEIP26VAFBbA==
X-Authority-Analysis: v=2.4 cv=EtbiaycA c=1 sm=1 tr=0 ts=6a9406f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=FVoBsLlWJ5wMsLtFyMMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfXz8Jtq3uuaLJe
 +sQfwP+Qq3S/1u8TEPkBAoMLUqJfPH/O/9uvp7EgHA7h/uuj53u/FOqIA9PUp6Mt9oP78xRExGi
 2Yl88YGcSX+waJ+apx0XnWwsJ3QzbpQgm0Ja4YqcdGQt578SeuTP
X-Proofpoint-ORIG-GUID: 03RbXcgGXqqGJ6_XUsk2GkH3-q3AJ2gx
X-Proofpoint-GUID: 03RbXcgGXqqGJ6_XUsk2GkH3-q3AJ2gx
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=10
 spamscore=0 clxscore=1015 impostorscore=10 phishscore=0 bulkscore=10
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300088

A folio in the swap cache occupies folio_nr_pages() contiguous swap
entries starting at folio->swap, so a page's swap entry is just
folio->swap plus the page's index in the folio. The swap entry is
folio state, but the only helper for it is page-based:
page_swap_entry() takes a page and recomputes the folio its callers
already hold. Several callers avoid it by open-coding the arithmetic
on folio->swap instead.

Add folio_swap_entry() and folio_page_swap_entry(), convert all users,
and remove page_swap_entry(), with a few other cleanups along the way.

---
Tal Zussman (8):
      mm/swap: add folio_swap_entry() and folio_page_swap_entry()
      mm/huge_memory: use folio_swap_entry() when splitting a swapcache folio
      mm/rmap: use folio_page_swap_entry() in ttu_anon_swapbacked_folio()
      mm/zswap: convert the store path to take a folio and index
      mm/swapfile: use folio_page_swap_entry()
      arm64: mte: make mte_save_tags() and mte_restore_tags() static
      arm64: mte: pass the swap entry to mte_save_tags()
      mm/swap: remove page_swap_entry()

 arch/arm64/include/asm/mte.h |  2 --
 arch/arm64/mm/mteswap.c      | 32 ++++++++++++++------------------
 include/linux/swap.h         | 30 +++++++++++++++++++++++++++---
 mm/huge_memory.c             |  2 +-
 mm/rmap.c                    |  2 +-
 mm/swapfile.c                |  4 ++--
 mm/zswap.c                   | 25 +++++++++++--------------
 7 files changed, 56 insertions(+), 41 deletions(-)
---
base-commit: da6c37ed8beb273e3308e42d4bca3ce11b4432fa
change-id: 20260807-folio_swap_entry-e53d68610de0

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

