Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679202;
	b=Zj4uXMEyiaPotNBPTzSko8YG4buJT5CQxleHfztzRqFz0pcZ1md0AohtIgEHl5i7gL55
	 +W8RP1C4+K+bG6kGagnJmm9zVKMuMJBwefXPhogqKbeeAPJ91nYpQJlub/cwZqAE7BQoh
	 8pmutQhda0FUmOQCpdl2dSRF9v9YTy3U21180Qo1hbRlv+Sy3HNioGInyqnt8PCeF4FHt
	 63FkgTmXuUHAc1KoctjDdkH6yu34UXudNrL2rBJBBfq4lE/FCkypvdcpAoKRercNDMa27
	 KYICxaDrd5cneKkMIhrLJUUPKqrUX640ntURTYDtZPgQ+OS9MfIkOUg2V3GC6E43Rzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=/31rYS+RTknGml0ZJpQj3HlEE/4E8Z8X4z83aN0X9Bw=;
	b=DWv2pAWRncvYimwccAl5MW4dOf4PQCbq6xygR4vqmfVIPuf5YJ0O8aqN2c2KD/FGXRFf
	 ZmJhe25OZFrCDwGbhzRG9grqZlauyceIUotP3d8hgDeNVdFiTsvSzuRRVQHP5Uwh4gxgt
	 WNlDRd6BTMikyr04d2EnAaG2waW7UYqI919/wcWdDB2P4WMJ5znJKyf2RpsfUsWdhDiSq
	 /KXbR7IzXMK0jCylTz6KSPzO8d+S6dXtqoXo3azaWdeA0XLYBb4fsITx80en0O57Y/MQi
	 R/jteERK8614BWqa6YhrZcxxK5dEKf6TYELKnXs5LRm7wfz1tE94vv4sZc+OsHVnH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=eFKbHIse;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F43606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F43606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=eFKbHIse
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-537548b811aso13658101cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794679201; x=1795284001; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/31rYS+RTknGml0ZJpQj3HlEE/4E8Z8X4z83aN0X9Bw=;
        b=eFKbHIse9b3So+Vb3z6hrfoJA1N2APapW8mJ7i2EFoMQRcCmR+NEEgUdKI9HHlj6g6
         Lva+HFJGVODnzNDRNQ+kDEtaU7zXTePFpo7lP+deuTueXmIt+iXaC6tkikE3WZqSyD4/
         s39ceJW0dwEtp3SE2Cf69EpD8SYIs20fFyDyUgK80HH1ohgJY9z7DyatSQKVEei4Xx/d
         X+tZ1YmB2pwLKGkFEIsQFc1hTkqCMc+47X3aKK7sXdz8cOg8BO+SGJspPb4MLlbIxd88
         tXYXZsOosNho23tqr7Cnv55MLiM4vDx5E/RqMitrGguCOVxxzjwXmoyF2uzTPb2VmuTv
         KQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679201; x=1795284001;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/31rYS+RTknGml0ZJpQj3HlEE/4E8Z8X4z83aN0X9Bw=;
        b=N+0x3+6UQNWCX0XhSvrxbHmRxxGV5Qd3qix2gH3yWz/J9XKShO/yz4iCbdprOexioY
         JaNS4JCoVNP1SRjJLib+ErkY+4RlPGrMoZY1LMav5MtjdKi1/5j/2Z1UlEP1j98/5VgH
         A6pHa3IiH1EZs1dsHzZPiU5Ea7Pa0YyTSSwdATENaMxsV0LRd0ZSq1VSvLbSWoSSCAaY
         xSTV7hQno6cjU/Do4o1iLvL3Xg+bHPBqwCr887NpphilIKHhvcHL4MEDoUx+Zr5wK563
         4E7noZKS6FjwhZ66vIMr4VL4YjbvMdARt40X7Kt7EGPckNdNjuXywnm1G5AnjAHOGHTL
         Rhqw==
X-Forwarded-Encrypted: i=1; AL+hErG1JZ5hg/rJQvwtbS9X1f1iA1gnyKC8kBrBo4Ixuz4qzkuyRWTJf6oZjw5yZ09d+y/OAIJDcuPC8A9SyQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bz39v7JEk80C8NJgyV+QwcWUjaVo+aAAyRExhMJ89vmYT57SJ
	R7y3rUrMjNfCVg93QwbIhKMe+aX2R8pvzSvpyY5JtgBwJHK+vOgETYQHWK/Z1Hiq1EU=
X-Gm-Gg: AYBFou1xzTnqIMqbxugiqreXNOMiw/SiePhcsHXHB0yl2QIucZjyr1t26vG33cYYpFx
	jcbWLZkM42BYoPuUQJM/txYtWy4DyXNcv6psmkyvS+T5t4+a8q0pn68CYQzrfTJO50wzkVma6Ur
	7E80rW1YLPwrWhwiFMaidrvBmU5Y7IZ4bDg1dWi6uxw7sF7XMS8AWs5S180+PY7uMNrmudRVkDU
	6KreDfEM+690D5zAh6Ef6VD6daQFohtI3akx/FcqPkMdN5Cp9ix+537XDj90eS9SHmoo2YHbUVN
	xAoY2SBM8qUhunlUpVLRI2rE9ALTg5sKBiuUZ7iLu0vnseoBDxW5Ds6SIjg4MgStOQVK176mI+X
	5AJTngjkjwAff28iUo/sBtbWePYkODcfW9v3HW7E7u0Ygx28YhMg0wedfQ963SVB/Gp8Md6vSq/
	rXaaCDnY/SxG86Mb7ZQTEzVwBYvrJQN66xiARhsYkFM/bh481BitBL7hIoAFKeK46B5H5wKwNfF
	pQYGI7qVoP5hYn89v6vhiJhTYdJMYwE25qp/F+hl93GEJLwumh6ohNtXf+In6yM+BdfZE1u2Cny
	k1K/eIYHjznNgOhoRyymwcHCZCgf+AISx46mTxzYTZ9cKFFTFkNRrVSKcXbBKv55z9Vs+dk5CQI
	RiQXsMeI=
X-Received: by 2002:a05:622a:349:b0:55c:abad:a72c with SMTP id d75a77b69052e-55cc6d16ad3mr26820281cf.56.1794679201165;
        Sat, 14 Nov 2026 10:00:01 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d614b4sm47945926d6.18.2026.11.14.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:00:00 -0800 (PST)
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
Subject: Re: [PATCH 13/15] mm/hugetlb: fix reservation leak on min_size=
 mounts
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
 Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Peter Xu <peterx@redhat.com>, 
 Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 Chris Mason <mason@kernel.org>, stable@vger.kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-13-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-13-a0a033db180f@kernel.org>
Date: Sat, 14 Nov 2026 12:59:59 -0500
Message-Id: <179467919954.482102.5381456550239958011.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> Failed allocations for CoW mappings can leak reservations on hugetlbfs
> mounts with min_size= and no size=. The leaked reservations survive
> unmount.
> 
> HPG_restore_reserve makes free_huge_folio() restore the global
> reservation without returning it to the subpool. This assumes the
> reserve map holds the reservation. However, a CoW mapping may have no
> reserve map, or the map may already account for another folio at the
> same index.
> 
> Commit 58db7c5fbe7d ("mm/hugetlb: fix avoid_reserve to allow taking
> folio from subpool") allowed owner CoW allocations to consume subpool
> reservations. Commit 51e1de00acdb ("mm/hugetlb: simplify
> vma_has_reserves()") later extended this to CoW mappings without a
> reserve map.
> 
> For example, with a subpool minimum of one page and a
> MAP_PRIVATE|MAP_NORESERVE mapping:
> 
>                                       subpool       global
>                                       rsv_hpages    resv_huge_pages
>   1. Mount                             1             1
>   2. Allocate using subpool reserve    0             0
>   3. Free on error with flag set       0             1
>   4. Allocate without a reservation    0             1
>   5. Free and return to subpool        1             2
> 
> Call folio_clear_hugetlb_restore_reserve() for CoW mappings when
> map_chg != MAP_CHG_REUSE, meaning no reserve-map reservation was consumed.
> This lets free_huge_folio() return subpool reservations to the subpool
> on error.
> 
> Do not set the flag again if region-cache allocation fails during
> rollback: that would undo the flag clearing and skip returning the
> reservation to the subpool. This also fixes the older case where setting
> the flag invents a reservation for an unreserved allocation for a CoW
> mapping.
> 
> The doc still mentions PagePrivate at various places: future work should
> clean that up.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 846be08578ed ("mm/hugetlb: expand restore_reserve_on_error functionality")
> Fixes: 58db7c5fbe7d ("mm/hugetlb: fix avoid_reserve to allow taking folio from subpool")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify comments and improve description; updated Fixes ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Commit message is still hard to read :| (or maybe HugeTLB is just awful
and no amount of massaging the message will ever help this).

Maybe note - this is an accounting error only, the pages do not leak.

Was able to reproduce the issue with a UFFDIO_COPY the provides an invalid
invalid source address (src=0).

1. Create the pool and mapping (hugetlbfs w/ pagesize=2M,min_size=2M)
2. invalid UFFDIO_COPY  (kernel allocates, fails the, rolls back)
3. Close uffd, cause a normal fault
4. Unmap and truncate the file
5. Remove the file and unmount

                  Base                    Patch
step 2:  total=2 free=2 rsvd=1     total=2 free=2 rsvd=1
step 3:	 total=2 free=2 rsvd=2     total=2 free=2 rsvd=1*
step 5:  total=2 free=2 rsvd=1     total=2 free=2 rsvd=0*

Result looks correct to me.
The code hurts my brain but looks reasonable.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

