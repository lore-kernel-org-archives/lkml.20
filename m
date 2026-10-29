Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237244;
	b=ZZiQEy3khL1tX1Wjy7LdVdh7AV6avmkY7nvES3BQNl5dIcWyYhJe1sm2IJqF8j9y8rVA
	 SlMPgFBVcUk5MHIeakwKitoJMnqx4ycNBopspASAm/EBipn3+TxOlfl46CdCI+SDiWYer
	 t1DFwPyKNYJnoU48g9FCxC0SLiQ98tyOZ1YsJP5i67ub1/oK/RhKeYCd06CHccjPFvXKw
	 4sCA8xmWGFs5QUntqt7ZOCTJ6hvd3naJYAcVHDtIK5iCXugigAXGRrnkcAbtOXW+YeBvj
	 f6tZ0HpnVQEsafM8URG7qm6gSf3HGmwuazyoYz8D2J8x2PoH/62gCDOSmx0gKsksNtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=CDgUtS6BmV52eDuX4xnh+bC+kNpwLNlhCSGJQEIkHH8=;
	b=vtZNhKY1Eq+j8p/P/AP7imCrRvSd3h6I1rtliEwMK08Vr8bsqwhkuugeIW4pnOrtK5BL
	 IYSPwHL0gBWZkeebtteVTVVI8/MRJ2ibcYgTcfPrthkwW2NF+4a5eYyHGsqPc6emapN/g
	 aDJ8mQ6w1MZXwebAcs9fFvQj5Vz+ZSUPb+FT/BK92g0J70FL+Nh5CV5yLlKItbHwwq5Zz
	 2KUvkTGxd7KzcD5bxpWfSnxFOckeT6+HbgU2uIwuNKeBXznfwMZh7eLz9x4PmJw91bHJx
	 Gc85yeDW1W9+FwsI0bMdUazdXTguxmCfIgq/bQaUUUp11Htu8LyoE2zubBHzyd4+57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=FXWQ6ewc;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3802606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3802606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=FXWQ6ewc
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso216354066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793237242; x=1793842042; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CDgUtS6BmV52eDuX4xnh+bC+kNpwLNlhCSGJQEIkHH8=;
        b=FXWQ6ewcYH8Z/hLIkNQzCLuCWPzSaYfc+WvfTKDINHzz6s7rbVE9BJ2+9zIQLx9hcf
         5QhEQRLk1p/wOOpcVFwFqvrOTiRdB9drepMbsO+yfRcHtioZaMLr2crqKLoflECJwLsn
         V4wJZMikH6YAQ3/HUqqdUVWr1EG1fH1Kmpi5p+WwhySvjLryewMk16yp8r0+f+srRosG
         iBpd+vnvF1qQrgNM9OR2aoNMnGP5IPFEMd3OWprxewqYz+6WifZnH/aZyCKQzXvy2h0D
         Sd3hmGrbh9x78UvmNGcQlqVIooZQZrhPh2+RFCNKawphmZ9hpaptmMuogQz3pxM1Kgl6
         xqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237242; x=1793842042;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CDgUtS6BmV52eDuX4xnh+bC+kNpwLNlhCSGJQEIkHH8=;
        b=LboEZwpBjNvBPQZDvw2/0NLVxhVU5IMZgXMLy+DWuUI2fEfY05Fb1Q7Jq0+f+NKQr1
         4fdrx64NQI02lDbeWg7V8YamtfIo80nSuDjpNdoEtMhDt3WYQ1rG3zkiay95vDbCuK90
         aT130ace/FXifaBDly63ZWOFY2rP/rVkepTDVx3le6/pRm4YLM+xDzD+7x6g2qBijiWL
         UvWRk55DIwLqpVbQgL1C9xKMFVaKS9NNNX/NHxI1BevbX6bhYWvPJvcnXGo5F3GFx0ck
         KZ7xMWTV19xPE+vNgO4qOOh9QxUP2rIWGdyrcLpBEF5M33o0+NmLj4Ah3RMAUhQPwJT0
         Gchg==
X-Forwarded-Encrypted: i=1; AKwUvBzObr6i4TdMRV3NrtGAjn79u3B5uf8h7wxL59KTE5U3hNbmHVMj9ObR+WbzKfRLTYZSFpuVEt4V58MHrJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAo7ABP6Q56H9Zei3WzaV4FmJcy2GTji6xWRDmB/qa118CeYqw
	T01HfHh2QdDj2jeifl5rtQJWq0p6dRjvPlkGmlqUMqnK+bsFhXYT6pojMIAXFYj3wPU=
X-Gm-Gg: AYBFou0J5zmsqZAUVyPLR5bLDysYjSGM3y+aclrAzttI+9TPfXb0jyatcXZKtVDBTR2
	adTs6EyNduZCiSEKL1IODlpdvyG8UU80r03RWS0AT6/jTntxE8LnxjRdco+B88WCN6htZcs4O82
	F+1mAVfuGISdwqho0V3g9trBA1S+FMKWq9BoHTL78GZsfz81lJhDf9fWAK7DFg6/TVoTag7U8mF
	QBdeearTS8gzR/nR0wYkAFdIn+e7nJWr0mYr2KEk3LQ6K7K6kKphDdHNuiRg7gdkh90ow10oU9x
	kc1M935guyev4VyHhZ5KvrJwrXBrCY7dDz5XG02U4ZvVZRqpw4VhJnaK8ohcgT7sC3DlFAUmubN
	IUlojYITPgAcPdKvZMixhYvXZYECFqgs5gwSBCU4OGST+OqMtja7HtklbwxOgBJ0+HMXYxmMZU8
	XM/bmnc3GdWdzFGb0hqk5BuVD5YJhh+pW90tx4dzH8+kJsK99ECHy0dwCvKIJxLcWuS/1FT0abU
	ecBxu2jPINS0fLaVeMn/l+fTbWPm6nGUDnjboMRZO6+sCnBz2fQ7VqiU9itcygMwNZYW/001+o2
	ivwIwwIFrcSYOU18fzPZ
X-Received: by 2002:a17:907:97d5:b0:c29:c079:676d with SMTP id a640c23a62f3a-c49bdd744a5mr330020866b.3.1793237242153;
        Wed, 28 Oct 2026 18:27:22 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:70::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964488e8sm2081290a12.31.2026.10.28.18.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:27:20 -0700 (PDT)
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
Subject: Re: [PATCH 17/46] mm/khugepaged: preserve dirty bits when
 collapsing PTE-mapped THPs
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
 linux-cxl@vger.kernel.org, Chris Mason <mason@kernel.org>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-fixes_core-v1-17-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-17-6f74bec9a5bb@kernel.org>
Date: Wed, 28 Oct 2026 18:27:18 -0700
Message-Id: <179323723859.453251.1630776487784216917.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> try_collapse_pte_mapped_thp() clears PTEs without transferring their dirty
> bits to the folio. A shmem read fault can map a clean folio writable, so
> a later store only dirties the PTE. Losing that dirty bit allows reclaim
> to discard modified data.
> 
> The assumption that regular files are read-only is also obsolete since
> commit 1b6444331bebb ("mm/khugepaged: enable clean pagecache folio collapse
> for writable files"). In any case, transferring PTE dirty bits to the folio
> when removing mappings (and while the folio is still mapped) is the right
> thing to do.
> 
> Use get_and_clear_ptes() to collect the dirty bits and mark the folio
> dirty before unmapping it. Update the comment.
> 
> This was reproduced with shmem using MADV_COLLAPSE followed by
> MADV_PAGEOUT.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 27e1f8273113 ("khugepaged: enable collapse pmd for pte-mapped THP")
> Fixes: 1b6444331bebb ("mm/khugepaged: enable clean pagecache folio collapse for writable files")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: adjust comment; simplify description; cover file-thp as well ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
