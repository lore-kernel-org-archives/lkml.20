Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01755D864
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880617; cv=none; b=A5WlyrIVfc/RIoXvhr53wSYms3l1KASPFEO0+x0cAhTwdigEuyeLUCAjkaovZNzVtIZLctSmRQezXJmhC+DgrWso/dhV1pZdwWOXqnTABGjRo3eSPSd6Iu0LZ02XNZBJ0HxIuu0DuJM/oXMmo327tZZDiKQ0VF18lOKj5lPXIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880617; c=relaxed/simple;
	bh=BW1jUF2S5ycmeA+jFwvHzlz0Ys2b5JeYJvusxui8Gw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G9apdQ1eFGxCeqdNdPsGfTMf8hvBpytZ6U2E3ZoKEE/DcZZgZDRheLmEC3PMI7Jjddu0lLOeCkaJORfdAZsUOR/Ayil8m2lT1/kR3NrPsm8dkdXBgYjwJoEgmhZh7mt+t2a8pfgaZNCua+fYNhMQTkB71AHAPTJSfRcAsuXfKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=in/n1AU8; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=gLtIt6uF; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="in/n1AU8";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="gLtIt6uF"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYxuc2421324
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=7KTq1kvrsMit8SFzKcwQG7/KUy
	hDzvAvzAS7QNGVsPA=; b=in/n1AU8hwERwEDKE3bsHQzCHdN8PKao27b5V92xL5
	ZaiUEQGmekNAL3glvpAW1aqYF/G3hgj+A0bjx+L6cO5knmTAly//PFEF8phzWE8D
	DTpWJAVpetifMXlEZHakVuAL04Bk8G289rEVn/t9lyiABm4y2yS+DP0EPoenATiq
	xgcU5rh68dZtp+ZnZD/of3fd75s8DPIFsin/c3c8e+gGkZPLahmGKnWFbW77SADj
	K3r1NZUZr9QfDXtVQoIOfEvIaTzvJtT3GyZr+tqQgJ2q9He+LE7FAKGufgiuG1w+
	Eu4cUuJ0k/i7SuFaWcLvJxYWIsyc4fvfRkkQ0L+b9Ktg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d5d7qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:43 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104215fbdbso113143646d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880602; x=1789485402; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7KTq1kvrsMit8SFzKcwQG7/KUyhDzvAvzAS7QNGVsPA=;
        b=gLtIt6uFyOoiv3RVqqmPuXyGerIAmhBrkc0XVob3X1CaUngVKyEQXLIcbAN5CL24oz
         E5BUEew79dvVBi9U2XH+vCKIyWgPBLpDIy9rhyJUa48cNElFEXpr5CPF5QA1Y5Z2mN5/
         A/sveiXsDqa/mamtPhMWrIz1qdGsgk0vchJQOituqogubMzVJb764dqgEYwQXTOm92KK
         uAOXe4XMvmpXwmv4eb0Woe6nPVBRDdRPk5EKl0Hx5fzWDMkN9vPxp43TkurOWERVRUtY
         1vCmJBdknxth2tGiCYnoYHD0JTNq10oV2wt48l98WnOAyl7//cfGiPZ1pEU5v/fo3WUH
         E00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880602; x=1789485402;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7KTq1kvrsMit8SFzKcwQG7/KUyhDzvAvzAS7QNGVsPA=;
        b=e85GfZz9k5LwKv9Sb7rWG4kim47df3b5SjnR7omCkKYY8vtbiplEyH0iqJ82UmXX0D
         MSK5jLCtdN59wpYex7JshHTA34rAHpzs3GD+lLactqTKgdaPdv9wDI1gBIOHLnNfp26L
         iLgW85MYPO1UuoXfN2xWDOv/JREXtFeU19ztjmrG7l+6Q0SU69O5EUCIjpijkMg4Zcuu
         UjzJfGnewJawGyGGzZrZSTkWhiVFavYITr6Jvm6MymTooMc/Ajv2As08s4MCPy4Wg+qw
         +56ZhuRK0OIvkxLLviqhPga2bj382JhByu4QjU+WHzbIWuBILHUJ6FkdG7wBKDHn1vWc
         0KjA==
X-Forwarded-Encrypted: i=1; AKwUvByIoYJh4RRsoYjXpw/ESExlT3QF+hoRX1ulfLx2F5Ihon3SNFy75P8dt02fTpIQWjZFF+Fd4sj6fqwpsYA=@vger.kernel.org
X-Gm-Message-State: AFuF++kIzRxAFycyr/DpuijZbmDDlrlG6ggUNjuScVENeFKPhNfDpHNr
	rDxpAN33zCc7/Q0xfV7t499EDz6Uyr8YNNinrxtVgcuji58JD1wOcOdR1D3tPwDITa26PRLqw4U
	piC/epQqPGQpwmIqd2UexGzwuaPPutDH/mOUznXLtM4BCobJ0+wi3JhoGpAHjwQ==
X-Gm-Gg: AYBFou1ZsHuOwm0i84qxuuJ6g2dtAowGH8sVll4TGc3EAW6484k2FXcu/Juugc095Pr
	FElTlkgwBGsB1turr5wCh3BlSGGr6Dye3k1meSQ23TBBOrne3IG8khvrDJz59h/PvLqQyug1L5F
	lOkJTYKJCFfZmuMKXvl9JWitefbhoiI+biKWCSqcZWQ9hzRMN4a3fJzuLufe0kW3RLtBHtyulis
	gxR33BiW6WURb2tXleUMK38c2k3ozZyv4cgZtkkPdOfxZKJZhJoaTiMwl3EoDILaPhZneSH/SeE
	u6H/qJlbACKAQUlrkka1vkgQeWFVFj1O1kttzMiWH3JBtdctJGkLqXc/7y5LKkbiXqg31LZPAYQ
	VpWrYhjv8NxPrI8bdFa1b+1BGjI32zOUeS1c+L4fG3H4H1I96mAQQeQ==
X-Received: by 2002:a05:6214:3386:b0:910:3453:505f with SMTP id 6a1803df08f44-9103f06f122mr371615686d6.33.1788880602482;
        Tue, 08 Sep 2026 08:16:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3386:b0:910:3453:505f with SMTP id 6a1803df08f44-9103f06f122mr371615166d6.33.1788880601876;
        Tue, 08 Sep 2026 08:16:41 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:41 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/8] mm: remove page_swap_entry()
Date: Tue, 08 Sep 2026 11:16:30 -0400
Message-Id: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4moGoC/2WNyw6CMBBFf4V0bc1QQmlc+R+GkD4GGYOUtIASw
 r8L6M7lSc49d2ERA2Fkl2RhASeK5LsNxClhttHdHTm5jZkAIUFBwWvfkq/iS/cVdkOYOeaZk0q
 m4BDYNusD1vQ+krfyy3E0D7TD3tmNhuLgw3x8Tunu/fIZ/OenlAMvCiVNLrQ1Vl2tb8enIX1GN
 7JyXdcPRyQkHsUAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=1968;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=BW1jUF2S5ycmeA+jFwvHzlz0Ys2b5JeYJvusxui8Gw0=;
 b=pW4BwiQnZqvQ8s20P0IiCWnMFrvc6b6RE03aLWSNO+VqtkHPIJ6wzKMNqS6Ttm+TPdFUYKmf0
 zH+0YdBwZwODqfWWolQOWLlGw8f47azHMpmTmAO8ApancQrfdo8RefZ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX2PhRbkbT86aR
 8zOnZE7qrm7FT3Y+aycUzr9bl4Jic9hkDiroxEEoZIWnIG4y8AcJz1fAUsb2wKRqz5hxjiDkQoU
 32CKpvc8NfvjmpVcT6AFImi8HGKfAYKiQQKRKnEoRH1mMhQeb3tsYLb01xEDsuY4bLG11adl9f8
 BuI5wmzqqFuizWKygmM/7U5iINPXVNy2OOJ/RkZFXmKcBuAONjOMWNwJhv+9dxuRXdaUbgjoUZB
 l7wmsAldfgzunvUi59io7I37sTMsnQVdHBK6OyrBQxbSET7zfD3ToLiwLyhHZljnpiN+YSJLqJh
 y9DUnRg7JofhXlYhM8huulkFsTlzC4ZX4jj2FtJQdurY59NnhTLNmo/NVHBvnM1pGknp+hMp5FG
 r6/aFxc9gqJNIKDX3SpY4JCt5GsNsQOEqavO4OCJLUzKk9JEzCLLG3tFw2Lvz9wXvTY0fLX/nBO
 GrFC30qasAmEBw6GA/A==
X-Proofpoint-ORIG-GUID: cATN9YcocTeaCmYOmfmry1k1nAKylNXY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX39Fe2wVg1Ib8
 VrfgCZASsWuVz8to6DYazn8lpzPFQeXFe4mHQvhDp7ef3IpPYkS3DxPwM+6D7JE1WSej7q4VxUR
 YvBtV+DLPbZ1a3fwREvRegogSZKyW7DlPE8WZJFX91EcHBy40erJ
X-Proofpoint-GUID: cATN9YcocTeaCmYOmfmry1k1nAKylNXY
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6aa026db cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=bC-a23v3AAAA:8 a=YU6N8qweUkUyprsO3vAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

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
Changes in v2:
- Keep the swap entry computation in __split_folio_to_order() open-coded
  and add a comment, per Zi Yan.
- Reduce the zswap patch to using folio_swap_entry(), as the folio
  conversion landed separately.
- Link to v1: https://patch.msgid.link/20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu

---
Tal Zussman (8):
      mm/swap: add folio_swap_entry() and folio_page_swap_entry()
      mm/huge_memory: add a comment to the open-coded swap entry
      mm/rmap: use folio_page_swap_entry() in ttu_anon_swapbacked_folio()
      mm/zswap: use folio_swap_entry() in zswap_store_page()
      mm/swapfile: use folio_page_swap_entry()
      arm64: mte: make mte_save_tags() and mte_restore_tags() static
      arm64: mte: pass the swap entry to mte_save_tags()
      mm/swap: remove page_swap_entry()

 arch/arm64/include/asm/mte.h |  2 --
 arch/arm64/mm/mteswap.c      | 32 ++++++++++++++------------------
 include/linux/swap.h         | 30 +++++++++++++++++++++++++++---
 mm/huge_memory.c             |  4 ++++
 mm/rmap.c                    |  2 +-
 mm/swapfile.c                |  4 ++--
 mm/zswap.c                   |  3 +--
 7 files changed, 49 insertions(+), 28 deletions(-)
---
base-commit: 9d3243fc689fef444f87e0a703b4c99653137e1b
change-id: 20260807-folio_swap_entry-e53d68610de0

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

