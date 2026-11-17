Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904944;
	b=stGJOxEvRZKLAMplHOUimR8GyZy1AVS5c7p1BxOGBAnv10wn1vLeNmzOYqL7lBKYguI+
	 RdauNsFIvxtZoBsU1Mgqv6wMBfCk4TyCa/PH3+4UKgbNoaiuMsgFtV7CI2uHFUnl0BkfS
	 7zGh0227Dgvd3ak4Tdm5TS1S4wQFFKW7OcnxUYed8cW8rE8J6a01/gn/g8nihpOEmtXUn
	 ZbFDrrIqfKVS+KPkK+a01L++AtaEMqdxAFocM779BGvnaqp7dqSbu31JeqIkHRsbAkMVS
	 tn4e+4FOqS53D17ry59vRv7EKo0QX5e34x7aa85ooNdTq3Z0TOxd7z/RKl/zuS7URAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=beHv4RWKzAGXqCj9AQIheRdqq9/SqD5ToQS6bWhTNyw=;
	b=FY/+urvCmFB58a/OEiXydWy6LOZ/ADqXt78k7v/mzo/3ek1hB85JmdedM6INCyyrrO0e
	 Kk4butzljOdB9ARkSE+vE6oPTtYGJoFHz9sggSb57DRXaenSnqZ/3M4Hfg4ChB4kSzXIM
	 KodKmEL0X/aQ6CJa8F67zxq19YLEL+pZP0W4ZZPb/0UEVC9Lzfc65Yd9wQ2SJadB2K2V6
	 uZvfzWtvzo309i7CipMkhng+83dRAFlotOpiCHmyGc7U/YKDQJjlxejiv6cxCDfHwVTuU
	 iG5U8tN6W9L+7zOHHPTno1NpXM9BpUBL2VwnsgcXoe9RfYYUS3Aye0oCckXO4185A5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=iz47Vl8v;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE64D606A88B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE64D606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=iz47Vl8v
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5365f9a04c5so71790651cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794904943; x=1795509743; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=beHv4RWKzAGXqCj9AQIheRdqq9/SqD5ToQS6bWhTNyw=;
        b=iz47Vl8v6JkIKZg9UYfyENByJGkp8YiAPJZj5aT+ZIWJtz26JLkljfdgVeOeTUHKpi
         fD+WdtGKspa4q2AxzmQeXoGQQk32iqFWo6zZZR3yDrVQ1vK/HbB3xBejTJBvr/T16oNW
         P1H614T3EMYfwy+o6FHrygopJOeOGa1XEaxFCJNqvbCTcx8I1gaWn0iBhdTWEqp6pW7I
         k8fPNOjH1RutKyHx2SDDsKfQoQn9h0StyHhNNC2VqNR0bEmdsDQA7kQxJTrh/gxuZqR+
         kfMtR0Yh9a2YiCZc6WHAGleSyiuHDgem22R+ssBXM/t8XJBZxYGh+Byyuv/RtLwZWCxo
         W/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904943; x=1795509743;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beHv4RWKzAGXqCj9AQIheRdqq9/SqD5ToQS6bWhTNyw=;
        b=N2isUvZdxyo3GuMjXV5RSlMT0fhv6bLlWuoFXbnuwK++9kg8WdfC/VMeGxjR9UbKCt
         WDLOPeqp6nuU4LO5tGcsl0x9pp3XotCaPoVbhGK/j89ect7wisAwCXz3A39K0sEGl+IA
         FwaTbZLob3QyoeKMDSTd1fkTE/4tWluU6PKP66Whs0Y1goNpd91rLohntEJo3kYtcI4A
         XU9Bw9zBlrDTz4V47WlKldXl9jdeAExo49J0xvBaRJ7nTmzI/SHiTfDxqzJ+DWx0nWbt
         iNwU1f+RZvUy279VL5FJ2jdwULiAAyIWZ4A/6gvb+975RfGYEROo3CSmNExo2g0LzsAT
         Xa4Q==
X-Forwarded-Encrypted: i=1; AL+hErGOGHEC6b5hHdtF0bgiDwyLF6OplRPExwgGetuXKi/tVkughyXHUTu5YsIsKaWJjKC14Jk8Yx/WOltqLWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IIZVJ6sdeKyhUlXRUhR2P9rVUvVahYk+hv2w0VyIMgqShxJDa
	VX/i2Lk6Oyi3lbOh74omIRLXYekZvhHL53kbevKzcS/gWyfKfN82DQ8pE+bSL4g5IBc=
X-Gm-Gg: AYBFou3qR8QsKY65hfd6IhGalYuVoaRJ3Ncij8w6YinHrwrFZw2aTSPaR6W8iYsIf0v
	V2LmqtQVTxvhuv0vY1JRej/kActQlfMyW9bS5+bJWRcoiyOnezI3MNaPzrh6E5n/etYUi/eNC5U
	qgPSPHdoCLubj6Tz/HfP/Tj032ahi5fVstm2HB8MK03DztdoKC47LCJ7KgVTIR1dsXIqyIc3LkM
	2fp7XoMIUaxdbDjYfnz+Ch2Aov8npVnTUwTEmCto5RLtdOwMeGZRrNIjjWRrAhrvhprSP7yz/tf
	5/AMm4t9t7IwzrCt1N3SG2ZYG9UObq9Qf1TGFniQqynlHZ2v/6DLic/ybv5s0dShz12JOCfpQBP
	WUTOpU/4OyDU5Wrkg2J+HFXZ8wYH0nUKYIKzyHuLNmbskBIPNlQeV5mwPs1fq+aZ8RlxbtXaUzE
	Hi98QlUR01FUcqbl0rW/Do81aVOgi44wPioIqSZnkOmhLKj+FadEq74VPDaQZsfwe+XJYT77ZZa
	Oyq1NyfVT7E+HzymOJWvDnvMQeQsLHLggNfoXppewZjQBCZ2RkfahNINmLwd5V5kCEq6Bh3yDuj
	NG21hbZNBp79cV0mWYyhq2n1D6xu0Y95UAp0yCYYs/0d4ugMoUjOF6Y58gd4Eb6Cpldi3saS8ea
	TV0L2ul3SEAjs1/Ayb7pGRG5hYrY6
X-Received: by 2002:a05:622a:758e:b0:55c:5ebd:8823 with SMTP id d75a77b69052e-55c5ebd936dmr138487931cf.66.1794904942797;
        Tue, 17 Nov 2026 00:42:22 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d37daf422sm44268211cf.15.2026.11.17.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:42:22 -0800 (PST)
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
Subject: Re: [PATCH v2 06/15] mm/hugetlb: fix mremap() racing with page
 migration
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
 Chris Mason <mason@kernel.org>
In-Reply-To: <20261116-fixes_hugetlb-v2-6-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-6-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:42:20 -0500
Message-Id: <179490494079.482102.4618915344813254218.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> Migration of anon hugetlb folios walks the anon_vma, so the file's
> i_mmap_rwsem does not serialize it against move_hugetlb_page_tables().
> 
> There are various issues with that. Most importantly, move_huge_pte()
> releases both page table locks before the TLB is flushed. Migration can
> then find the destination entry and finish migration, reusing the old
> folio while the TLB still has entries cached.
> 
> Hold the anon_vma write lock across the move and the final TLB flush.
> This also prevents concurrent rmap walks from missing entries moved
> during rollback.
> 
> When we must allocate a destination page table, flush the TLB before
> dropping the anon_vma lock, then reacquire it after allocation.
> 
> Dropping the lock only works around lockdep: hugetlb folios are not
> reclaimed or migrated by allocation compaction, but their anon_vmas
> share the lock class used by ordinary anonymous memory. Having a
> separate lock class for hugetlb's anon_vma (like already done for
> i_mmap_rwsem via hugetlbfs_i_mmap_rwsem_key) requires more thought.
> 
> There is a concern that this can block page migration of anonymous
> folios quite a while ... which is not really different to what happens
> to page-cache folios today. If ever a problem, we can temporarily
> release the lock.
> 
> So let's keep it simple for now.
> 
> It is a shame that hugetlb has to implement everything core-mm implements
> in a different way that just screams for problems.
> 
> Fixes: 550a7d60bd5e ("mm, hugepages: add mremap() support for hugepage backed vma")
> Cc: stable@kernel.org
> Reported-by: Chris Mason <mason@kernel.org>
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

