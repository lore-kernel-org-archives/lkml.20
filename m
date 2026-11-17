Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904455;
	b=vmcCR780mK/l+Sq32FP6AAc0uJTPt+LNnRUGdoBG4gwUIQM4LbIWvy+xP6OkiScXrG/N
	 8dO20pFQAhQqX5Ch82nY8TafcLNW+CqgJAtjwlsPyfzi4pa2PvWMpoMmtKonqxkG7Ohhk
	 QDxY/0n1ZhGLNHO03Fb5foJksis4Js9OSbKC1K+mLerp/LwjCPij8iuLxuWwqI/QtXr3n
	 2cL0XZrPWe5C3IdF5mANH0LlMDl5k6cvMHBn7iWhAtosg2W9kuhuRnIFuMcOlGVBImBS5
	 wxYAevZ2WWS/52pFjUuycLCyLIky1mtBFF8wYBAIWmE7D+xbm9mAGE6Lx3CArN3uO0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=GlfPsRE+i3fF5U75sAmCvXCcdyZhOwjsZrTZwssWtpI=;
	b=ebS5W688i6LcvXE7H/KaZO+nHeqQYbx+WmqKRHFQu4dWq6CVIJ7PmiODfOx03Aku7kyF
	 tdlLacvt21giX6Q7JcgacZ5ELC1eK1GVwhcjaEpw++2sfXSV3/Vz41oansGrJ3UUFZNhJ
	 PZpRacGiQX1HdDmffoQqwviECumuXHCNfVqF1PXCIQt62dvQoiSXKtjfpC+pxLzOOrZc9
	 2VJWaCNz+Ehjc8fYdUbu+Csx87aDkdHvJC7U8KGYkVGxhN+PW7AbF88yvMt/G8kg1O9E8
	 7Tj9S3rm4atCHpP3RgFo4p/udU6p9pNlIaGNa7XG8+4bou0eqECJ0c2QEQ8iqneg7Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ajp9T7xx;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BCC606A8A8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BCC606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ajp9T7xx
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d2b4a99d4so23621261cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794904452; x=1795509252; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GlfPsRE+i3fF5U75sAmCvXCcdyZhOwjsZrTZwssWtpI=;
        b=Ajp9T7xxRJnckbguTgRPsP4gP7ggcnMM2Non8C+yfW5N1NAn2O0Q/Op51B10esi8KO
         cT1QYNfljSecakvsb1tR/hbp5ii+N2C1SQRO5eg/t2RsutoaVZEBO63zdqgbyDS5QRZm
         ilg7WysjeJtFO3ioc4r+QSX3DSDXEujufPRNTgaethlsDC0AKr9+o3fWAovz72E0sL8q
         Yx8yRjXW9Qm4H7uIShTpYdjiG8t/jzEAMZsJrxdGZ4Zf3udWcZX/D3Ul54fwpj6boYBy
         Fr7x5iY0EgzeW9DGxrXqMZIa3hxvoh5Ea3aHbyrHezwcgi997p7vTuXIwrmzmze6/thw
         GHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904452; x=1795509252;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlfPsRE+i3fF5U75sAmCvXCcdyZhOwjsZrTZwssWtpI=;
        b=Xy0VmOCTPJmny2Yhfp+ixuec/iayJcmlEb3FOOTSx7/xTKeYxIagDUpVWgOmN4YFLG
         iRWgHZqMuQ0PVobriCczUb84KJQwYRYni8XZi1tuHxPQdv7kRqbnCszmXQoowyB9bFKa
         n968qM3Wvz6UcCKU0ei+BrnKsih2hYHK6BBLzb+HHdTOarvQRH9LXvAN+wHf2Ih0AXSs
         E1SimLZTlKdc09IJolkq77ic0vjqwtGrwAOpeyRMgQpFfO9pXW+kn94wahOgz25ZupUi
         vtxbx1ZpOJVNoY+2h8541d3dBwrYxfIA3X45vt5/Lw04k/YX8oiJGgsn60yGHqK83h94
         No/A==
X-Forwarded-Encrypted: i=1; AL+hErEL6h8tS7gulvnvjnMHDqHGVb3y22HxlKxAPh0me2hIA7OxuZjhUxPTeRfPb0Bovfce2Y68t/IQ2leSD04=@vger.kernel.org
X-Gm-Message-State: APuU4Z89YpKo9dpDbmSL74Xgajy/dbot5i7oaOYDKmZ0iKHRTFt3seMZ
	RfRHkw4xKxQqimXzX/M9a5lG7xL3Mo1Sp+nd/a9XtgUPN4+CtLHPWURN80SqASXT2A0=
X-Gm-Gg: AYBFou0EGzTdaw2Js2tRQAba4tqOINpD/4lka6Z0Eb1lFKNDrHNFQAPQA9dYdid8zNv
	NjJ5kgJZwRKs/0RQsWK+L0NVTapflwTNBkcKde2dC+HMt1CPZcTs2NuPXB9uIEWbmjZCWxpx7LR
	cDMcGNMVhkkunyZ382iZ1UVybJkf1VkHWsS6ZHT5ulHTUzXDQGC/G5XM6+7PCBbkO5qmGGWLktS
	dTCyS9v6GM8Iw8gtvw/2qlO+mJceWOwmxprS4OlURQGU+c48GRx6uGsJF205+E51rpfGHXWfYZT
	3yXnETGwN+26F8SVDmsSRZHVoGjGFj3O6HOxVkBQ51Ki4JxQxEIPsiM7FSIDWYKmKAEeAzvvAbs
	Y20JYMNLwn14VjAJk2udBjjpFY1mAQlnz9H+90GLeu9vdHdSTuJyDruqLfasGgOB/9SATsU0Bs3
	R6PW2sbt5trf2TYjY9SUZYKtsLTEgtl7u1vo9foaVzqkZ2hNGD6dCvVWFjDGkJz0Pe+0bIIBcd3
	5MZPCDYPXNWRwbEjqkRGuYIPFptCEqJJwMebIc3s6KfD409JcTmzmAPadYkk4FmEIbaLB2oAunr
	7SBQ2WPKQPp4njcjgRYEzUQGYXvOH4AAMokrXGVkWnjeVdH0n94nbjYnba90iVjBn1f8pXq086+
	jLgoOpcs=
X-Received: by 2002:a05:622a:654:b0:55c:b6e8:bb92 with SMTP id d75a77b69052e-55cb6e8c1e8mr144922231cf.61.1794904451796;
        Tue, 17 Nov 2026 00:34:11 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ace15ce7csm100171991cf.1.2026.11.17.00.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:34:11 -0800 (PST)
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
Subject: Re: [PATCH v2 09/15] mm/memfd: recheck the page cache before
 allocating a hugetlb folio
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
 Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261116-fixes_hugetlb-v2-9-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-9-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:34:09 -0500
Message-Id: <179490444979.482102.6690559604747930966.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> A concurrent fault or PIN request can populate the page cache
> after memfd_pin_folios() misses it in the page cache but before
> memfd_alloc_folio() takes the fault mutex. The latter still tries to
> allocate another folio and can return -ENOMEM even though the requested
> folio is already cached.
> 
> In particular, hugetlb_reserve_pages() finds the existing reservation-map
> entry and reserves nothing. If no global reservations remain,
> alloc_hugetlb_folio_reserve() fails even when the pool has free pages,
> effectively failing memfd_pin_folios().
> 
> Recheck the page cache before reserving or allocating. If the folio is
> present, drop the lookup reference and return -EEXIST so
> memfd_pin_folios() retries its lookup.
> 
> This is probably not worth backporting to stable.
> 
> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning memfd folios")
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced using udmabuf to race and generated very consistent failures.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

