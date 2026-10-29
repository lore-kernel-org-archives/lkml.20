Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313055;
	b=Xd+AuM5a2rVC8ZZvvaURE8ykH7ApbDZRuQKePSnNnsNiuf76ok3NWOuKxL6Vtu0c1uHL
	 0BzrvlgeDenw5XSvPbbVum20GdHJwzYE2xbSz3t7rY4r4Rmbw5lB2tmQLEzeSyD3Uw+SA
	 bINhhi+QBeMbwMRRnfVxkauXzqWBdpoqS3ScRyb7fHFUtA9UNymJqoYBe/Chl/d6L+ult
	 Hr2uwYY2mDRhEw05Vrxm03fdYZVcW9pGa32PQza7KK+tSVBK/AuyzvyqSappN32iiE6m/
	 U1cw5ynKbxqQR0qxvfreU0r1tfTnRX5BcAnOt4Uiinzk1xhgA1Ko379vwwfSB/nKqtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=UPY3X5uvq0LQlVSKfRxAerWA4F2Yg0A//1vEESl9I+c=;
	b=eWJAf2rArUa+OoY+i9DbP/+kV77i6kSj2B4t599q3h/Kh7ZCEhQFsuDeaRnoPll89+Ax
	 /937O4hvsshoM/xRfHd7ifXYQJVIQoPgSjPefKn7g4NF6UTuSaskam6GjGa7IQZ6KWwcY
	 9HEtsDO2FXkEy4Ue5XE7T52rVlJXEwu1DhRxRhUhcbGgTWmIx8XEZWhnxOHAvdTKAW54q
	 Tgtj3OMoYYXdPqClzlw4uZnc/LjDXfVSQmdMWvHe1FZPk42/qrTqidKQdZzF8Aqsav6A5
	 Z7kP0A+ju/0S806Zfbz+5OgqW1cWtEPR105AoIzUPtVeQWIbImHuXGa/JHGyL8uvJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="li2/iDHT";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2272606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2272606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=li2/iDHT
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c75267b0fso1034976d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793313054; x=1793917854; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UPY3X5uvq0LQlVSKfRxAerWA4F2Yg0A//1vEESl9I+c=;
        b=li2/iDHTndsPW/jTUIRPCMC0AtsG7uAq5Em6i8TIhx0sfWb5pxO+KHLniudFNFj1EX
         6DbTy38S34iavjP55z2c/xrU4dMqs5pjhwy4Z9u15rfa9GArDA7wKw8vSwfanVG3z6lu
         48bd8HwLAwj99nb/774W7mgjZ3g9OigHrNPEOUe1c1OoXdo/mHSgqT+fWU989yVa+tTL
         5joVrdvR0cfMuzH5ZndHQyidJ0I1vlDls2DuEOmKU/KFIZMwLNeH6zqxj7QGIFtB7IsW
         niSgVf209mOppGzAFo3tCU9Yui82sJwXWTDczkdlORk94LAlKkO9i85AvGt4Twflhrsm
         KIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313054; x=1793917854;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPY3X5uvq0LQlVSKfRxAerWA4F2Yg0A//1vEESl9I+c=;
        b=thZSBa7ovWSw2lVDp6Y4JZ2hqpLT5jHuyd4QpfMKUnywIZhw7QYltKba7Vj/Lc2LGB
         NJJ+NRzqmuXajk1lEcd61K09QHTnHurISTKzxhqCH8E5A+M+TPphG/t9gjfxgp9s1Kp5
         A4xrgEc+VdfpkaVX3578e0Ap4mBZwPvJogAYDf3On2CTaYmgTu9STyXzvAZoPi9MrtEu
         9BIem+bXktfZT/Sk6azXakvg8JbwUxqQDd7YMJqeCkZ4jmCXZX6Y/5FMahKIa8/EkGyL
         2KrRw18RNZ2E2ejJBs2RYLquqqWp0BcEBhESRQ0iJVxayERIsZesWajJ4DrcbhByyaNT
         cLzA==
X-Forwarded-Encrypted: i=1; AKwUvBxZeEWAPWyp6y5bh3Sh23PmvKqH2fIM69lBbC6+D4ryV2O5jDhrBOdmrBCoIfvqYhIrK2FEvKmIpMkG9wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG0Q8VKRmBB7zroTlTBLtMrj/LpHu5VFZTXrbjYiZ/U7BcLgha
	xGBjwoWegiZa+PmJc3Hw57jq/ES7ID5jGiw0d+SUG3oH1r6bnxuSAzupugI76qq4ADo=
X-Gm-Gg: AYBFou2J9QpbG4J1VtuSZhA+bmF2F2dc7jt1dvfP3/59YPqbTFh9ottv7UMiqJRKZCM
	+jiOtWJO0ns+RCY8JGbgMNazRuECK0vdroQZGZeDCvkgkwDxTagQioTzpTcY29xT9ANFdmyMe/d
	p+C3GNGf0dZyK4DUbphKloyeKLzprB8cuZIlBoLdGuKtrzolV4Xp2mljD6mM4yJPGVO4GOWSS2U
	umbEMmhqMv724/gyy1NcC9GvwxQZFI8OkGMJkIuxYPe2Gsc2QpxXE3Ke0i/3/hCUgUvtrr4n4R5
	1SkD8ZINDunM/e6ALtqYwSWyVVRkZV+ZlKlxi1GpjMeH9oETZ7iMtzegCaLVkctLrjd/YyoOYN2
	n89ifVJGLELXHPiZBNA0I4jIx27abZSqcDf0/25DVFHKJnPLirRc3jyrVnCFcsSDswKp9UciWYz
	lm1op0B9zBEo6+TuWnEaqRz07wbksQm566oiD3rxiVtBi8TWOYPyq1vUXX+tGN5p7N1Ex+/h5lQ
	pcaobLRYOTV4wU6CJbgXuVRerqAxWymbjbZR3LE4K651Axpdh1QxogWf/aABclqo98KpUG5zUTI
	srBkavsixy+9ySEvsauJA3iPrT3vLuH0X/0fZC3dbUUpwEt8DC/FR5FyDkP0V3Rvf3P7PyS08pG
	F
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr5824286d6.15.1793313051262;
        Thu, 29 Oct 2026 15:30:51 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca68e5f47sm398016d6.42.2026.10.29.15.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:30:50 -0700 (PDT)
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
Subject: Re: [PATCH v2 14/47] mm/huge_memory: fix zapping migration entries
 for device-private THPs
From: "Gregory Price (Meta)" <gourry@gourry.net>
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
In-Reply-To: <20261029-fixes_core-v2-14-a64ce7f83abb@kernel.org>
References: <20261029-fixes_core-v2-0-a64ce7f83abb@kernel.org>
 <20261029-fixes_core-v2-14-a64ce7f83abb@kernel.org>
Date: Thu, 29 Oct 2026 18:30:48 -0400
Message-Id: <179331304801.2127828.6570375349219520262.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-29 21:33 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> A PMD migration entry can refer to a device-private folio.
> zap_huge_pmd_folio() checks the folio type instead of the entry type,
> so it treats such a migration entry as a device-private entry.
> 
> Installing the migration entry already removed the reverse mapping and
> dropped the mapping reference. Zapping it must not repeat those
> operations. Concurrent MADV_DONTNEED during migration back to system
> memory can trigger this.
> 
> Check the PMD entry type using pmd_is_device_private_entry().
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 368076f52ebe ("mm/huge_memory: add device-private THP support to PMD operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

One note below, but it's not a holdup.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> +	const bool is_device_private = !is_present && pmd_is_device_private_entry(pmdval);

pmd_is_device_private_entry() already returns false for a present
pmdval - so !is_present is redundant.  If there was a reason to open
code this, then keep it, but otherwise you could drop it.

-- 
~Gregory

