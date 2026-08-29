Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48413630BF
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030562; cv=none; b=C1Ak/rXztwfV9OF9U/c4vtObIDWhqlyD/uDPqrEftI4DCPUdksQ8XpeKSPwB+LLLmh4cnySGt9AJjcFnG+ztkTM9CAWsuMe9vfNq873u6qilH6BDAZljWBOvSjr6/Wte0l+aoO/w0CPl/DGl1zz/56rGD7AFEieuNmMzKnREtts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030562; c=relaxed/simple;
	bh=KIOBXzna4+qDQlzLsK6sgmn3CS6qBfm3FAav2JwyAnA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XuZTtSQ+RgUjRDbexGqm/cS57E7L0Xzl4AESpXgtI+RWaXrz9c49NX4/FIGqyrHgxR4tjPlfEdiKdErQLFwJP2g3jZ7YUxPUgp8s+Kxq1ZwaNZH3EOnmHfV2L0kGvRqN+R8cS6Pj/OteyqtyfOqniG6sQivzLMXOpRdMiBV+wQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=vRzWGp3P; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HkXU3HF0; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="vRzWGp3P";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HkXU3HF0"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZRFK1211373
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=ToKXA2E5BfEmvaAKFfDpLFEMj5
	+An4ZLCsEMWKzYkac=; b=vRzWGp3PShzsYmdleClg96dg/KzOFT8uR7VQb2CVTV
	iBzjoXDFXpecYoiM3f4Kn+5eRut2LAGp4akbqeekHylrwTPn8FAPPiVpds/s35nn
	ffjwKZ8RxYfDRsIWcZMIg+dTr0KGUzoYUaTUQzG7e02P+YDpbPZhSJ9EPjUMOG+p
	B8/eQCYOF8k0qF7JVkx6IXJf82fBX/Ygy+5E2MxfrGSjDXv6kXDVcahlCjk7ZqX1
	uWzpHDTxjuVCN+O7v6h2V23up3RNdSqfn2AqJwyyAZ2bLQA2ZOk43Myp4eUFoqgl
	4tDdj7ZH23y+bsEgjHOAjNNlwm53TLxbiUfF/synkw0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbufx2rm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:19 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso48569261cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030558; x=1788635358; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ToKXA2E5BfEmvaAKFfDpLFEMj5+An4ZLCsEMWKzYkac=;
        b=HkXU3HF0WXl9HTuB090+fK+0M0V5FJFa90wzzdj8w2+fyxVh3y02bDtfhA3nkygjAa
         +TWHDE4ZB5kgZWjPELMQB0bafoRXCsIX7Fei5jS5KXsRPbGo9mdzijCLjSxwrwmonCAu
         64od0EA/HqxTAcLSDPZynIcutsw4N7uWfuspYLX0W4pcXpWwg8bRT7JIH5k3qDqKFpYy
         28ch4c5w2CPI2qr0soYYxhRID79v8D55E+yOq+hK7oISs/Xot5d6Wp0tK1a+7PbwDNbh
         51F2UPcl+k+mXDOECixfryaqUr5aXUfF4tT+JFqHVMzWJykR0euLrGkS/80oKj/i+Vzk
         DvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030558; x=1788635358;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ToKXA2E5BfEmvaAKFfDpLFEMj5+An4ZLCsEMWKzYkac=;
        b=Xe3pLDSX0vLv8LxQdTg+7Pufxc7hsrKK32hb/+Ih/RVY2SNXdov7dr6tUBu4MJiYpU
         4jjggv/GtHZLTz3A9dwMBGzSQBD6/DuSHEhRGtGKCWAr9gsxk6F6D38cun0P0OnVo2Qj
         XcoKglW2yRCJs3Euk8rfQbDEb7K2+dyJXCZmdOn1ectFVtlz5RH8fAGnDCmJZh7SdOg8
         zUUubwpFyd4cWY3y83JZEd+d29sm0YFCUXuik62ro1NQZSOu8gkGm6hwA9VDMrESwShk
         K9KI6swNBiAshzSf3Q6inwzcmclM6WKA00e5+2S6GkOyeDxTEvHdulncfPqtuR1wO2Wv
         J3Tw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0JnTB3GfKBRUey3TBFYWShPH405TbROZKbICTFQP8qot/Y69lGUPtvLV2efgcmqpaPXB15jQj4Uwm5LY=@vger.kernel.org
X-Gm-Message-State: AFuF++kca8EQjOwg6TSVd6i5UFafnkEzkWArx7TULqePW++m9d+W84Rg
	LACxz09Bc+7lkBIAUKw5UkCVzr1usq81z/2uVv+ASCc2cZrjOHVV7fsAnG7WvTu/qGyAetL3lko
	HsCanMPEN+GzP/5Qj+cOE9iB5rJPaYD8swijbSB8poSUc5kxFdG5tky8+P3E6MA==
X-Gm-Gg: AR+sD13NFeULm31yGSyhCSZpD5rXCX115QnXC/ToNy3uQ6eUDqbc6B/4p3D1wTpCJF/
	DLgiGuCEYiW1LtGbVLCRSk+yDhi3jmN960mYt/AXlXWfGl+NFIuyRj05Pui/GB4d2SxSC7Jx7ls
	7Qvld90zSq7eL2wpj4hNzAkifwZTPw93xx4I3v5kaAfQWBjHYJh0B/N/lSWt1hPAR1fmD/2mzZK
	v1NS4qNsQrzFjQcLQYjdsxL5wbUnNVuXUihB+XZ1ulOTUt8Awh91O9niHDE4TumFtePCJD+iK2L
	0Vtw9sQqeyxClNbJCWnnJvX8gmQ3m2H20FhGKrWwlvtkr6j+Q58/bUtBn6aqauRuyxcE0CPfNkZ
	xhNjc1oPwIcYyvGZMMSTWf8x6H/kFFAQY5N96Fvn0Cg==
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr184800501cf.12.1788030558506;
        Sat, 29 Aug 2026 12:09:18 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr184799641cf.12.1788030557913;
        Sat, 29 Aug 2026 12:09:17 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:17 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/6] mm/page_io: folio conversion cleanups
Date: Sat, 29 Aug 2026 15:08:59 -0400
Message-Id: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsuk2oC/32NQQ6CMBBFr0JmbU0pgsWV9zDEdMoAY4CSFoiGc
 HcB9y5f8v77CwTyTAFu0QKeZg7s+g3UKQLbmL4mweXGoKTKpJaZwIsYTE1PdqJyLbsg0lzLJL6
 ixDKFbTd4qvh9NB/Fj8OEL7LjHtqNhsPo/Oc4nePd+9efYyGF1HmOxiaoVXa3rp06ZHOmcoJiX
 dcvWp/rUccAAAA=
X-Change-ID: 20260806-b4-page_io-folios-5980317b0bd5
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=1480;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=KIOBXzna4+qDQlzLsK6sgmn3CS6qBfm3FAav2JwyAnA=;
 b=v8QyEUdRlmmCcy2MaM7s5g5E0Cmmylq1uEuKjwpDA4FNHnw6IYH+wJNyL9wP+pTozzqmHjw/b
 Tf+ne970NPDBxMFoi2rAgD64fsy37AAC4BzCEqHlf1Ro9a3rrgqYv7T
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX+SKfD+wx2nNN
 sQ654pRBY2msZnunep53pOGmKyXVlZAR7FIdEJ61gX73kp2MdnWwqzQycSjLRssSNLDjGvgfDo+
 EVwOuivFl3AXHCn+G2qhj/MfrHms5mghS04g54iSQW6oZ0jYdXYB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXxchCBarvUMrt
 VbQ4ZjtyFW9Sc+PSIEUdEgmsa094FCXZ2yhFFORK//Fli2QpJ6AiLh93n7ObDORLcTtTleCrf5D
 mfEH9f3hF+H+Eb+AwtbCkx7+U0h5E/cfkGI5Z5fS23oKRrkW0pR7nXncS8fJQbqReugQ1j6jUmC
 GZiv6mGk+4k36+MdKw6T55AYwU8GlhGsY0s4tlHuZ2WOdET5dnx9tUN7uA14OklmlIvywbtjcVk
 f858zzVnK6KLYfVK/AZYxYips/EJKt7Xt1waHpFkZ4YlXAJ4tDQooDGiChXcFUmVA8y/hvAYZCK
 lmMhgsqZGVTW6H4Nx3ZkiY0uLFFP+37ybOi70whHHTeoDK9YxYwg9VdZo0NV44aCPn7fi3822CS
 OFZON2C1oYfsWiMUEBSzKRj/73Xo9YzlJakCmIq9b0gSsFIyjU5EPquB0Ik5PPWmr65c5z6PYuS
 m/GTbhvDbytoLtkkv0Q==
X-Proofpoint-ORIG-GUID: s3cshwA5jFoEwZdyt9t-ujY-vIyM4VM_
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=6a932e5f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=d2TyfQZRb0Dxy7BKGjAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: s3cshwA5jFoEwZdyt9t-ujY-vIyM4VM_
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

Convert the remaining struct page usage in mm/page_io.c to folios. This
removes one of the last callers of end_page_writeback(), along with the
last caller of ClearPageReclaim(). This allows us to remove the
PG_reclaim page accessors entirely. Clean up a few other stale
references to pages throughout while at it.

The rename of mm/page_io.c to mm/swap_io.c is deferred to a separate
series.

---
Changes in v2:
- Rebased onto latest mm-new
- Add tags (thanks Johannes, Matthew, David, Lorenzo!)
- Remove FOLIO_TEST_CLEAR_FLAG() for reclaim, per Matthew
- Link to v1: https://lore.kernel.org/r/20260806-b4-page_io-folios-v1-0-0899bac3b826@columbia.edu

---
Tal Zussman (6):
      mm/page_io: convert write completion handlers to folios
      mm: remove PageReclaim
      mm/page_io: use swap entries directly in zeromap helpers
      mm/page_io: rename bio_associate_blkg_from_page()
      mm/page_io: refer to folios in swap_writeout() comments
      mm/swap: rename __swap_writepage() to __swap_writeout()

 include/linux/page-flags.h |  3 +--
 mm/page_io.c               | 38 ++++++++++++++++++++------------------
 mm/swap.h                  |  2 +-
 mm/swapfile.c              |  2 +-
 mm/zswap.c                 |  2 +-
 5 files changed, 24 insertions(+), 23 deletions(-)
---
base-commit: d2aad7fdcda7ae8a726926f2d6de7fe9e8ee7563
change-id: 20260806-b4-page_io-folios-5980317b0bd5

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

