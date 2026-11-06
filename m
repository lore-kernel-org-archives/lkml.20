Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958640;
	b=gt3SdAzbLmnWLqgwdhYCrqk8JKJ+CufZ4PaWyI3zqztHSscop2dADMNtXGNNtiOfNrFQ
	 PnilOgSDpCWg6ISeI6kAxj8MUtK/JTYdpwqobrisV9tcP2m1iGImkHMoPPYLJl7V1GEgf
	 /uQ87oGo2SFoplqpLloIPQuWqSJlzbnbz9gAQXEwwcwLmtCtW/UMVbKdQFkYuERm7QuuA
	 wPQsJhtJ1MlcBWI0piIvrB1KAQBtlMozpzlo4Wphws58MbFkxUcoPW5Xi6Z1A1k4GTOiC
	 x5bLRlc1fBeWn5pMmarH7T1dkJXeY3BeluOr2btWJ8wgUOCGSjzpDcbCpVT7P76+Pog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RupwrtSRCRknDTCP4U8+mHVorluG3D1aDqrqCuXGL/o=;
	b=H5+8YVA17QG8OSHJ2jsyKTpDvNMsMJ0X1lO9auZVmS6ug4+QNVta7bzFL/h2MnQmc3V5
	 KKuMcVGBPEF3FY6Z/ooeSp8TsiddnroFTKrhrtl0eCma8iTWP3IhJRW5wIqKLWj5PRqIR
	 nCNyXMJwNQlza7jeX2IHilF+TNiiEpu3WwJdM80fvdV3Xf3sfTqOCNhcaRaYtx2NTq7T6
	 ToQpdNLsf1RcbaDWooPta/FH7abN/y2dknleaIUFtQlNahugabyP85Yso/iWGezVP/ZDK
	 fqOgoxdOrzYC5lHYlUWKN4QwdFYXrHt4UX4EK3uaCw3STMAdlIffjGum+WNfSCRdeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t1D9H5iu;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC206606EEAF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC206606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t1D9H5iu
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so447401f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958638; x=1794563438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RupwrtSRCRknDTCP4U8+mHVorluG3D1aDqrqCuXGL/o=;
        b=t1D9H5iuTUmjdPhOVJmZIub2cA7iiSUr41ZQ3yS+raxwi2K9JW5USUNO1Ej8W7ktyy
         jDlpr6IYaICDt5N3782Vm+vT8R7N+VD6e282WCZUIr3qHs3ymqVae8nOek4p5Qr6O/oS
         dqZpOzvc4Swchkzri6wDXvUOBTWJM5lyg5UOT7Y/iAiO/bDMWNay73N2vmeXoqlrNWa3
         CWfy2PPZ8DtSbf0uhLB61kRz/tBH8yhEbP0mgAap9N/KETVXb+EF1zhC7HOG5tW8CGpR
         ZOvm0YUZZDiDTRNjJd5C/6nVAnSAYqMrPeB1m3dSCFZzIl8NAmnARF5bgl9O49QSbyKD
         /grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958638; x=1794563438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RupwrtSRCRknDTCP4U8+mHVorluG3D1aDqrqCuXGL/o=;
        b=TbpDJwgpyYztBgx+uCWzSv5LqVqBUxcbL5Z60/rxYiW38YwPLt8Qjc0TLzta6dc5ER
         1lHH31lXF96czDylrQBqkg7vap8K8rvN150JrH9dXQ4XeI4+I6qYPy5K330yHUhvVEr4
         +QeHrdDQF/HVopRW6Hy1u6HOAlQmWd7iKbEUEPCrPvvBJn5TuTtASiapzA9d3OLBTYkz
         2i9v9osRimXXYg/Byl9ryKTdQgw/z5wa8ldIQ/wLLk7rXW38JjYfRbJFqbqAt2t/M/s1
         2USXxHHGeEdBsyBzG6nNuh8kAzZcJ7uj5FuQxMk3skhXQ/P4aLU7acbTp1DCBG1CEq0y
         +shQ==
X-Forwarded-Encrypted: i=1; AL+hErEsYmWzFamjYBaICxVJQ/TiGtU1C/eZOKZabvXXXtQfO+Dx2mQ/Pj3I+taKytxBzNg7eHP6+7oNh1yy8JE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hxnx0tUmjfo3UPg+1XE5bXPEImkZ6xppJkbjgUtUaiPgunNDs
	H/HS1Dcsuh9y9M4B1i7fU2Ww1w5UKAva1hCvGFXmXc6AUp0SCyyI0G4n
X-Gm-Gg: AYBFou0Pms+u5+5b96V2vLhFqL3Cr+rDFndj8MTG33GV13dvOyQXsyyB14CEmo2bB0H
	9ppBUexb5i2BLxtU8wTY3e7QiLL4iu2UvumgoMIXB9MeJC4qkofkEsne50NnGDlMq3lpd3nP0rp
	Df8SaUSHh2m5n7vtIRgttnM5kGgNk7bXK+RQYmvvhiflgOfEfwFlN0s4cpONqgJV2Z2g6/hxE0z
	ZoyKzkraSItb5G0OV0oSXnYuQqFLimwbU0XwXyHOe7mnYRtct/0MVRAlfymQftvSPnLto2E3568
	6HtqAmVc0LzLctnDuc7eW7cVsGDqfaYiFpBPIGP2pA6oBasrqFh7+I635DneDBe+Dq/WfuIOzl4
	dkORA4tL4TfkPaHcHRAsbGSOZVsdgnlHmDi70Anijrt31qnY/yNAjwuTV+IRe8Ffs+UQQ/ZcU4u
	gC6Hry9XGreHXQmekesFQQq7FpR/7zU5oMyOJvdky7MjqBmYWC1oQMYAz2TkeKFRB4WilwitRnB
	kLKM8Bc3yUa0GJHGPIPlucIImqH1NKSIwWggcqL670tmdXm/Y5xJfuyXUN4mG7oLN95ofLbdxi3
	RHoBp2JrXYv+zzuDQvfLGrI=
X-Received: by 2002:a5d:5d82:0:b0:491:83e7:32bd with SMTP id ffacd0b85a97d-49277f88313mr3982559f8f.50.1793958637679;
        Fri, 06 Nov 2026 01:50:37 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d60e78sm2755152f8f.1.2026.11.06.01.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:50:37 -0800 (PST)
Message-ID: <6662ae76-c8dc-4bc5-9730-bf9f537ca9cb@gmail.com>
Date: Fri, 6 Nov 2026 10:50:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm: limit pagecache folio refcount when splicing into
 pipes
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard <jhubbard@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
 <20261105-refcount_overflow_stable-v1-2-70b9c655da3e@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-refcount_overflow_stable-v1-2-70b9c655da3e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 2:10 PM, David Hildenbrand (Arm) wrote:
> Similar to mapping pagecache folios into page tables, let's reject splicing
> folios into a pipe if the refcount is at it's limit, similar to how we
> handle it during GUP.
> 
> This will prevent more cases of possible folio refcount overflows with
> large pagecache folios.
> 
> Let's keep it simple and check in the two callers of
> splice_folio_into_pipe().
> 
> Also check in try_get_page() to cover pipe-buffer duplication by tee()
> and partial pipe-to-pipe splicing.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
