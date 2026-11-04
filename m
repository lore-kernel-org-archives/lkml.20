Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786167;
	b=agUdFJRqIJdkzDPeiNvWe3+NiSM+6VoXel87Nyn+L7JSOAlplex43skfASvUke1Y1QMY
	 vcG18JLlcfye+Vnsq8BoSlzKIm2n9BIYKOACgDhij32JBfpwCcHbpfoAZyCLCbLeiBRUi
	 I7F+BkVfofC42KnU4KeEl1oR+o01HWF3Xe5EmJ+7kOQJc6Gi8HGh57ojEDQEvCf+NlH+o
	 nDdHBYh235FEU7r3ieW0OqzdlRvmxWnsIiASwA5dgDqXN+Ll8Sag5Coe/i3q4RZdPvlmq
	 RMu3ypa/C9r95zoHxCbqp2NYfN6gRiaU0dRnEfU3WCuuU6Q+WoqPfpqs8p/sJ9fTtww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786167;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=pUBQPp4DgGesu/zc45i1HHgbshamqgArN5rt8GOl5tk=;
	b=2R1dt5Z28DdPGu+2Rj6mBKRcZFrih1pGhAYuM4fKiWEK4xuj6yjNwQy3dkEUYCvfLB3w
	 HBsQN34pD50pEK1KnKgGDloD9Chjbn6WHUFeZqgnMFx8KTy6yrlOCXQNVTT697sFjhv6s
	 BGXCahdkbWlGCTSKZ9wR/rRHTHxKFeOEPB2mK9Jzw0dke6ah2hD8dUrc2WJVM86WQXECw
	 k+AEvYcLnr5gZBVtGg1drMzE83GPNQT5cKQIvAFERhEdqz2IepX+SL8eVdkwFOmHlPH0N
	 0cTiKcgaC/EXZAk2Yxj+gB8mo+UUKdAmHYHx/3NGq0Cv0TZIQ+BWBltXT39QQHaWT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.146
Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91235606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91235606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pUBQPp4DgGesu/zc45i1HHgbshamqgArN5rt8GOl5tk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793786163; v=1; x=1794390963;
 b=uUMXzD5u9LbfomWLcrC2JIgPQCBBTO3LbzHp+2JUyWLJ6xQdE2ZY1BMAOjdbQnBuSYP1qFjF
 1kVjlex4v2hhEIm4aXGxezQoohio+Baq+fuznIdzLaWT6CPUvg34hb8PWHYCrHxsPlWU02MiA01
 gVFlQhnLVU61YtHNeRs2gfcA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c43ff3afd577f723;
	Wed, 04 Nov 2026 09:56:02 +0000
X-Mizu-Trace-ID: c43ff3afd577f723
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
Subject: Re: [PATCH 11/15] hugetlbfs: do not grow a sealed file in mmap()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028-fixes_hugetlb-v1-11-a0a033db180f@kernel.org>
Date: Wed, 4 Nov 2026 17:55:32 +0800
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
Message-Id: <140D6576-3DB1-464D-8934-6857B84EA784@linux.dev>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-11-a0a033db180f@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 29, 2026, at 04:13, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> From: Chris Mason <mason@kernel.org>
>=20
> hugetlbfs_file_mmap() grows a file when a writable mapping extends =
beyond
> EOF. We are missing seal checks similar to hugetlbfs_setattr() and
> hugetlbfs_fallocate(), allowing a user to grow a file that has =
F_SEAL_GROW
> set.
>=20
> To fix it, skip the resize when F_SEAL_GROW is set; mmap() still =
succeeds
> without growing the file.
>=20
> We currently also allow CoW mappings to grow a file. Disallowing this,
> maybe even only for read-only file descriptors, could break existing
> userspace, so we have to be more careful. QEMU's file backend is an
> example user that might rely on such things, and would suddenly start
> getting SIGBUS when faulting in memory outside EOF.
>=20
> So be careful and focus on F_SEAL_GROW for now.
>=20
> Fix generated by an LLM and sent by Chris Mason in private.
>=20
> Fixes: ff62a3421044 ("hugetlb: implement memfd sealing")
> Cc: stable@kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: drop comment; simplify+extend description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.


