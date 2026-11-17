Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903252;
	b=Ikl38JwakNFzL/eDeAGIBNKp9nftS4cR14BhxQ2h0FiKHl9b1g/mcVl8qKKLtS7Tu9wx
	 Oy4S5PJT2INdNKykBo2dlHa8HR8ovzdbCLKRL28E4o9Mfr0hIdNsNywP0Q+WsNh4z21G2
	 JAym/zPwSHFCbMYGkmTz0FVm34whfXcvQDXLeNZe5T56brkv4LphEcRMTlGFWcoDmTNwe
	 M14RVLBkdfSLwoj5v45xOQQCn6/XuTbuzagQOvUsRxBA3hwFtbQZynasywQtnOU3ohOON
	 TclfeIwW4F5xtAJ6dRiNHDEF0yLyCN53oCf9yOTKYv/2A7XOKOtWX8m9DC1jX+lC9YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=fpQH2XklQvxbA0SCPjoqZpnVJxorf9+kCLsX6Cm+jf4=;
	b=SMiBVnfyKih6KlCAFzHFNCsJRMxOMmRmsUp4h+Hotxrcv48dQCIcvAmlToZuzD0/rn68
	 Mn65G4fjfGBDoDh4TQU4/jxeYoA/fuJfXIoS61e+864ms15KtKmlmY3fieIfPsZt8dcmw
	 yANegNd/94OLIsbtLN0H3dsWpPoChkZrmvtXvrvFsM8V0BjFWwKDpw4TdsuNICZazkTmE
	 OGf+QQklFLQ2cIUYw38V/xFMdU6v9GmA4oxWYXwxlvgECy37oMJcD/NnXqtzF9HTYiBGj
	 Jf8ANTHViAOpM8uHdj/SztpYiLHdsTu4puKJidolNfin/hZyWmiHOr9vPRcDv38KWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NdrTQgDT;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB21606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB21606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NdrTQgDT
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-949680e6d82so250011985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794903251; x=1795508051; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fpQH2XklQvxbA0SCPjoqZpnVJxorf9+kCLsX6Cm+jf4=;
        b=NdrTQgDTSZJRgv4GdN3+kP3VmEnoZSusnjp5ffZS9k9eyYQpSxQhoC3GfRfguClSnz
         0DVzDtsZInrKl12qDzqg13nTFAtzGBsQjqzQTHhzLLUP1zZAeaLKa/iqfCN2DJQ37GbC
         C7e+IfQpzoHT3blg7XCXnJsRlkrpgUM9DfhBZR3MXAtnQmJeIF8p28Zj2cex5YMxMiMF
         ZGrAkcgzIRkz5rO+sVH4bC1LRPebD9bsrU2VEwa27s6mbJZS1rij47J38S64RFyGJsih
         NHmJZohuIqjDAFZVaJB4CRi2d/EjsvhHAdQCXJexjiVzPbPoT2s+IPYmZPyTNQb4Xw2J
         mvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903251; x=1795508051;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpQH2XklQvxbA0SCPjoqZpnVJxorf9+kCLsX6Cm+jf4=;
        b=bRQmcyPUClvANMmDnz1HY/xKOE7gHNAr/XuOvsFnqpLmD3D688jN3jgC+12HDERT1n
         KxFKV2v938S0yIqr0S87Q6HCBp1gS/AcXviSC5DiLJ7UvuSi5RPTERcAFvMBbcq/j6ZU
         ourtYePzyco9H6DKNqA/plWudJAdXK3sxafLxti8yGrNcmkfnx6dydBPOKLJmRuNp3zw
         e+0wgFJAjHvVR0AVgKldy7Va7aprdlraUQXm3MJsAmtp+mc3YW0SnTitVZOJ+wQPuobS
         dZfdUMNoI5ZJbdXShgkHC/0MJF5fezDh0egtzQf16GV3dSa68f5PwQyFGV/EJ4k/jJ+O
         sIhA==
X-Forwarded-Encrypted: i=1; AL+hErGnv6D4vFfBqjbyhY9tWz8sUUblt0sakLseUHMuAGP3Ifus+f76EjAjdoKnMMK6sbWLqau/egN386QlMeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OQ3wIQVpntpvA1Fjv0vxIXr0Swjs7Xu86QKvKxDVqVkVRvDpd
	ZaJSNZEt27hiEYaMbObHYICTbQrlTCy5Thd2SIC0bWLxrjRkzNHeFVgJx0ZsRDH8m44=
X-Gm-Gg: AYBFou2SJHky7Y3gfZkb39ydi7xoNLspNmpQYGJTRXJUpMomlISkTfqiFU1x10USu4t
	u20QqH/y/g+jcDMYvkZtgjcgiyaCFnQiE/gYZvpgI0ScDCNplwjVa3NYTAYLUW+rGnayhE6KtSS
	+zMoxfgJlkMPMcZa/5McYd4WG7vXkE7TvGwScJiy8M5bqtd/dKqQDRtB652dWKFu+ICP3VNnYWX
	02CUpmUqQOAAVF2bQE8s9bQCsZ5i3ayttDiRg/xUZYwhiDguITDWf0VZolKdtrDVWIAr/agcyZp
	2ZRj2zDDfXUUDU4ZsWlx17JR+fB7LDo7VTy87XuXPgo+yby6X2qExwmfBnvsyh2mSSJEI26muTP
	UjztekxZ1xYNqD9DOSTLwNktWU4kn+Fz2vw0376EI9XhiuEFuuwg1smQystPdPq6uYxf3gWiA3I
	AaV/BVeKgBB/wfgHkgNGxwIzcK2yOKrVMjJT7VXdaBgdFLb6dGo5LBvTgcvv4JOgjnjBaXmZrU2
	S2DlPMpAHS6YRRqZcMWPYMIgIjjHZfQFmVtl1oZiccXCPmxtcA0L+j47mvP1BK+peBR3MnvC+Gw
	dJHPWI4rHnbNk9kXyqcxLu+eqjUxoPQ5IEfD1I9dTWJbtB9dWthWFNPK1vTFCN4Q7uYRoAUXj4B
	7PGZ0H5I=
X-Received: by 2002:a05:620a:2a06:b0:93e:b0c3:388d with SMTP id af79cd13be357-9494b9432demr2192163085a.11.1794903250936;
        Tue, 17 Nov 2026 00:14:10 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c5fd154sm1021436485a.2.2026.11.17.00.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:14:10 -0800 (PST)
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
Subject: Re: [PATCH v2 04/15] mm/hugetlb: account temporary folios
 separately
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
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, stable@kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261116-fixes_hugetlb-v2-4-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-4-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:14:09 -0500
Message-Id: <179490324902.482102.8381563244741940633.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> Hugetlb migration might have to allocate a temporary folio through
> alloc_migrate_hugetlb_folio(). Such folios are currently accounted in
> "nr_huge_pages" but not in "surplus_huge_pages". persistent_huge_pages()
> can mistake them as persistent huge pages, as it merely calculates the
> difference.
> 
> If set_max_huge_pages() shrinks the pool at the wrong time, it will turn
> hugetlb folios into surplus folios until persistent_huge_pages() returns
> the desired number.
> 
> After the migration (successful or unsuccessful) either the new (temporary)
> folio or the old folio gets freed: this will reduce "nr_huge_pages" but
> not "surplus_huge_pages", to undo what was done when allocating a
> temporary folio.
> 
> This can result in having more surplus folios than actually allocated
> folios:
> 
>   HugePages_Total:       0
>   HugePages_Surp:        1
> 
> From then on persistent_huge_pages() returns garbage.
> 
> To fix it, add internal temporary counters and subtract them when
> calculating persistent pool sizes. Update persistent_huge_pages() and add
> persistent_huge_pages_node() to make the code easier to read.
> 
> Count migration targets and rejected surplus allocations as temporary.
> Transfer the per-node temporary count along with the temporary flag on
> migration, such that folio freeing will always do the right thing.
> 
> Take care of calling account_new_hugetlb_folio() only after setting the
> folios to be temporary.
> 
> For now, keep temporary folios in nr_huge_pages, so HugePages_Total and
> Hugetlb continue to include them and overcommit accounting remains
> unchanged. The new temporary counters are internal for now and are not
> exported to userspace.
> 
> Fixes: ab5ac90aecf5 ("mm, hugetlb: do not rely on overcommit limit during migration")
> Cc: stable@kernel.org
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

My only commentary on this set is that "Surplus" is a horribly confusing
name :|

I was able to replicate Patch 4 and 5 bugs together pretty trivially
with migrations, leaving the surplus counters out of sync.

Nice to see these accounting bugs finally fixed, we've seen them in
production for far too long without an obvious resolution.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

