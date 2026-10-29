Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237119;
	b=MIGKS471BdMabciLqNaix+JuAXAKYV3uUALSF0O0Q879tKQLWE7JjdKVEDMcmrU8br9a
	 n2XcxJg6N0HFQWGVhstEkU/Rwk5RjWGzjtS/DOxb28jlvbGTAHuKwz3kO7lLkP4oesSxP
	 U19CfshcfOtgBEabg7fGQgv8nVDUqwNHmS2KTV5y8OMUzhZE0O04AUUvlXolBQEDUOxCy
	 f9vA6bd5aXCQ1O5Jo7YpUwQBcQeWAQ0HxlAj2M4BcS3T/tecGL4d5G7Yf4KebcLu14Pvf
	 KHTkLFAJ3dtSdUNuHNrvCIafOHNhQmL6pXz0y3K2Hoj9ETCPegCjoGigseV/FnyhKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=M/AMFbjA9JAsBdCFWz1LANgAn0knNna+7jo0zCTOlPs=;
	b=3BGmsB2FUjbLglbViEtfr8sjWaEOC0RojpepyjxgS6TamIBPUjH/QnLbnCRnov31+6aS
	 E4ItR7vgxk8gI+axTEsky/Gb7n46aOe8zel9SPRUYvy6aDl2wAd6QEpuCeX9JjSgz4n4B
	 yJGADothINySQX/ZGVtyVZM+EjHgg6lITmzAm4KlVi2tcXLZmgY9XcVm8TRh6rzsK6ERA
	 vUevXu07BLzO0klRuPE1NXyrWTkIrTDpXMV7VRX6XcsiEmVxz/quUqcGxA4WmPotJ/7s9
	 1clUGvA/ErPwovVUA7tfyZ84L7u34AeHCOfDCzfKyiHWzMno2U5GIPD0+OUdw1cEjjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="dKbXebD/";
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=dKbXebD/
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3452a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793237116; x=1793841916; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M/AMFbjA9JAsBdCFWz1LANgAn0knNna+7jo0zCTOlPs=;
        b=dKbXebD/Kz5RrzY9zIOX2TAzQyje12YXIX6BEU97N+70d743t4+zz64N2BY5+vNE13
         OXwYaxTZ8oKtLdTdYLTPLMEE9F2vNcrT6kyP1tf7Dmn7p57PYo4L9nBNQi/FudpFnR5b
         +XsB6boiBflVvOvMlOCFZPeFRZ3pFDdtuteDN4sen0mZmPK04Ov/NfQLal5Uyd6StLF8
         cEfUIMmY6v7kY0hK+enA+FF2fuBz2L0KEZLz2nWtzyW1/w7YOEkUsRVd5gRiHIE9jeJ1
         qP9Ufy5IhnamVXBXfMLGbEV+GTT/Rs1ck7iCVEv930CoSEkO80891Tu1LkvjM4F9UygK
         4/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237116; x=1793841916;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/AMFbjA9JAsBdCFWz1LANgAn0knNna+7jo0zCTOlPs=;
        b=AdOqdIxbgq9jJtIj0nAX4rqlHOTTJamSuZe06KD57TJX/pweIzgv3zkAHQZw+87d/5
         N+o00bATnrXv3qqV8Xiq4wjO3sGeWWApLPM/JvqLPHNhBOEpUoywLipZWGW/g0E2++9W
         4qId+qBtHCtC8vlPa29rjya9OW2d2Jpy//aXRf6Dm8nZar6qCfLIzBZJuBflEA1iwdQv
         NzvqFUkw8pxzFY+PbYsIFAS1q/sonT7Cw6u3rjUzszrV+uMNBQXcG0SIcL6wa/Sx6ztf
         MyuvXLytD7iGwDus9QaCpx20C6eX7MUNnTWuhUwJMYBZpvTWXNybmC1BWANR4OQFOgJy
         B/SA==
X-Forwarded-Encrypted: i=1; AKwUvBw74jEcgexU60dMFnZNoaYefk51Z08qMgrfqnjFQKhPNJa3fWHSq874kqX1708yQ+roa77cQFMy4v538Sc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYj7AkPbpj/aYKDjtvbbYiYq1Lu4NnPty1wPhEhThhA1Moql/K
	dO36Ian+0lufcOD36O8lsBYnbYNovDr25GmU9VaShnEXd6zDHZpR3sMBIjRRMpjkm+c=
X-Gm-Gg: AYBFou2T593WPNmcjaGcAJRDth9PWIcBKqmtYE3T/76I901nMaIMTyx2iOupLhO+8/q
	PLaaCIL1WTfFx24Ba92krWThxZHeiOIL83uxUU7QbuDZ9ng2DTQG5KbnkCjIrvh6QzgLISiZv3z
	Zv8VxIfAuYm7NrHikNCnP91/NA2YJ282sBxmZ2o84GDLKx7hl0KZKqctWwieLaYaxAYAdw0+SoM
	9FKJNwttKVRmz6OMqb6knRQMDWHHhWVTRN0UTl6KmvZAhbztwqSat7dziPHy2kK7QHElxHh4SPQ
	yXzYmgbtHjnjOUvuKQqzzsmEx7f8TeaC/HXLLeUujnLhMdx83mfx/ER3v6dEalsXb3QI44WThve
	6ZijSF65htBRCB04E5qeYUV5XDRviwJAt10PGhnQ+svcvhnhmYMk1E7c78sp6fzVHQycqU3xDWt
	ItchCgeJeu5ky2Bjkt80pah4CIp9ABQguPT9PCUler+PcJF0Yp9HegsL96Slxs9fb+Y4gas7zAT
	HJ8+KQ0zRQIRWrJwQTt+/JzaVDCKQNBEWLBQyrKa6uVxIiAqg9/avopniJySSVqdjlY9VwnlZUO
	37nSf2ZeglOInFjjfWfrIW1o18hp8lqI+2l0ONb69g==
X-Received: by 2002:a05:6402:234a:b0:6b4:7b28:8588 with SMTP id 4fb4d7f45d1cf-6b49cb5a33dmr2836967a12.2.1793237116591;
        Wed, 28 Oct 2026 18:25:16 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:7d::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49644bcd7sm2122970a12.33.2026.10.28.18.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:25:15 -0700 (PDT)
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
Subject: Re: [PATCH 16/46] mm/khugepaged: fix PMD table lock leak in
 try_collapse_pte_mapped_thp()
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Gregory Price <gourry@gourry.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-cxl@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-fixes_core-v1-16-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-16-6f74bec9a5bb@kernel.org>
Date: Wed, 28 Oct 2026 18:25:13 -0700
Message-Id: <179323711320.453251.11778195785979033843.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> For a private mapping with userfaultfd, try_collapse_pte_mapped_thp()
> takes the PMD table lock before it maps the page table for the second time.
> If that (pte_offset_map_rw_nolock) fails, because the page table vanished
> in the meantime due to concurrent page table reclaim, it leaves through
> the abort label, where the PMD table lock is unlocked if it differs from
> PTE table lock.
> 
> In case the PMD table lock and the PTE table lock match, which is the
> case without CONFIG_SPLIT_PTE_PTLOCKS after pte_offset_map_rw_nolock()
> failed, we miss to unlock the PMD table.
> 
> To fix it, forget the PTE table lock when we unmap+unlock the PTE table.
> 
> Fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: move the ptl = NULL handling; rewrite description, drop wrong comments ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
