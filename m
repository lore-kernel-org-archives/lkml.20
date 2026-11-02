Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606952;
	b=4ikWWN4EDW4dEU0lfqvp16f5T2MZWTgAEUORnLk9TDWa8/paBieJUAIKoksGzfxPRt/0
	 FUKOX+FqZTmRRhHLlHsY/s0vzZr3EQcRMnr3oGIEnafbFC9pACQwxuNU5zRntUCX/yizX
	 qhVhlJupArz0lWO6PhE9KyO7w+ctPsyWxW1Cou46t7TAjN7udsbOqd5o3i8+R1AImBxgv
	 ZI43bcgsUowrgT9624IAm8Fo35LjaqfnRVPCqVxGFCl6EMtVwC094PkVUI0SvGYt3dJcg
	 5KuBSqEdz7sSSiTYepw8eLJ/WL+ICj6lemmHyYjpoJEQXeaReJgGfTJnqr57FVmdnzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606952;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Ua9j3chuGLeYY0btIyoz40p0xgL7yj+uIcM50lwlwKs=;
	b=FTfDQudSddGar/2m+heVdGKQMc2gjGwV9DDJtczkaM1ICjHmMGf3u+nkiCGFDOnO+hGp
	 3UU1fMHENKVWUIBXT2z3TF68zzhtQR/GXbbefY5SUBBKVo1Zwp8AikMF505DbLS7VGlBp
	 CfVipyDK037SNOJQX7cMxE1fSqOoOH4Kypqi1145hhht6l2AsXpjv17GMs214Rh6/rw5p
	 Lk+xVOG50djoGBOWixTmv90UIJb9NgBhUY6oKMnrSNx/JsSzgdXaZDbqiSNIAShyGg2AQ
	 2LBxaOPhQIzpaBHS/NtvjT0XSisflGnYYWcEqaqeK6Ukf79ROVh2d/2kNjycouKvzXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxJ8HCof;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D76606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D76606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxJ8HCof
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AJzTmqiEw66QyrrtTwvf2v4Wxl2wkr7mScJNfEWS5L4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793606949; v=1; x=1794211749;
 b=qxJ8HCofo4rfUF1gSK/co9lCPJ9MFuCXHgOd98rdkqmIUsARH9XzuI7qtTqUG7ftdjuPzgGL
 mbt2I/nICtNl8FYp0d98GdB5efQorqTfwGF/wOCWskxBI7uubraROUrtHI460R8K3W6nvL5cQJQ
 3+kR+7R3oUUa0soLBB4XPKDE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 54617e5f3eb6591b;
	Mon, 02 Nov 2026 08:09:09 +0000
X-Mizu-Trace-ID: 54617e5f3eb6591b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 12/15] mm/hugetlb: keep surplus folios that are reserved
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028-fixes_hugetlb-v1-12-a0a033db180f@kernel.org>
Date: Mon, 2 Nov 2026 16:08:46 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@suse.de>,
 Andy Whitcroft <apw@canonical.com>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Peter Xu <peterx@redhat.com>,
 Breno Leitao <leitao@debian.org>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org,
 Chris Mason <mason@kernel.org>,
 stable@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4D9D9B7-F875-4A05-B3A4-DBD0BD496EA5@linux.dev>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-12-a0a033db180f@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 29, 2026, at 04:13, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> From: Chris Mason <mason@kernel.org>
>=20
> free_huge_folio() may restore a reservation, but still returns the =
folio
> to the page allocator if its node has surplus huge pages.
>=20
> For example, start with no hugetlb folios and allow one surplus 2 MiB
> folio:
>=20
>  1. Mount hugetlbfs with pagesize=3D2M,min_size=3D2M. This allocates =
and
>     reserves one surplus folio: free=3D1, reserved=3D1.
>  2. Create a 2 MiB file and write to a shared mapping of it. The fault
>     consumes the folio and its reservation: free=3D0, reserved=3D0.
>  3. Unmap the file and truncate it to zero. The mount's reservation is
>     restored, but the surplus folio is freed: free=3D0, reserved=3D1.
>=20
> Besides losing a hugetlb folio that is required for a reservation, =
this
> can also make available_huge_pages() underflow and cause other issues.
>=20
> Keep the folio in the pool if it is needed to cover reservations,
> including any reservation we just restored.
>=20
> Fix generated by an LLM and sent by Chris Mason in private.
>=20
> Fixes: 07443a85ad90 ("mm, hugetlb: return a reserved page to a =
reserved pool if failed")
> Cc: stable@kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify comment and description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

