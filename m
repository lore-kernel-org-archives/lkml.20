Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407392;
	b=bYbp2C8QdNt4k66ekORBMvnqunCEhe3ITpPm4WBzACxo0LLCA1LaLBnSihKtpLE9MxR0
	 8DbYPfz5gEIhBAma+g4tVC/LEeDrLHVk05ofXRis6lw1V6Fa0Sv4Qi/IYiQawqTM7zEqo
	 tBQNwQBOl38IKT+pJl9+D8zY/auSk3fx+4iJeqIPcYvMJKnfXQcU8YYRFEZ6wM8cxW21H
	 mDPEV09Z2MOIbkChD70RDQtkr2tEs1zj65S5VBTGXL/bkpgaiXquYt59ft4JYPEvDexxU
	 j44RQyKk/mdPWfmUG2eaB8XX3/wFbX8xbrMfAapLtDO7nHv+j3EZx+UmFZPbjusXyNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407392;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Hs9ww9OWyyWTWd7XYZJCVayYLvTIQuyzD0QuSnMbhZg=;
	b=EferADk67E1rMiPAHHNmREm/uriEf4W+ZaSX83FyB875bCLosc2an28Gx+VEbnjaUt0B
	 H8+KPP+HG0dIFRKlfxAz6MM9PYe+ztB73fGW606d82KY+rWT1000rgMI2jHFo8X/rtBPs
	 xnBlPL+v899Ihoq8+VVll7XfDZ2yP8xOsQUD67Ij9Qe9+WAhf6fP+LkmPvyqOG5+1eacj
	 fpQYik2Ngx6lojKqQHe+0MmwGkqEc/XA5V2sgjuGW1RWzovEOm8p2O3HP/psO2KadT3mB
	 lhWqJ/SoCaLlJd/pYQ1G1WXDHoORhj97lbotE2wDTN8fD1w+jlt8duUJO4+l4aaijzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Sf4dsc/8";
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB66606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Sf4dsc/8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kWjkjHMuIQ/mRw2cul8HJjHFpbEMvDl4j7cCQ9zauHA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793407389; v=1; x=1794012189;
 b=Sf4dsc/8F4076h8jMVHI7rNf+3W1b/61uDUgqP8E5HHTLPa8nU5oc/o8ISUg13IlHCWcGKQA
 UB+ZLth8Vkc0MHA/p9oE12VEqzKr9FC9ymTBDF+Ig1ksRMNz0jQewv0eDvmcSLdmB5OR8+ivAAv
 q8ZwWLwKtsEl0knW1TygDsEw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 86d28ed59939afc0;
	Sat, 31 Oct 2026 00:43:09 +0000
X-Mizu-Trace-ID: 86d28ed59939afc0
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 5/7] MAINTAINERS: add missing files to MM component
 sections
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261030-maintainers-v1-5-97278f8a5f54@kernel.org>
Date: Sat, 31 Oct 2026 08:42:39 +0800
Cc: Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Byungchul Park <byungchul@sk.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chris Li <chrisl@kernel.org>,
 Christoph Lameter <cl@gentwo.org>,
 Dave Chinner <david@fromorbit.com>,
 David Rientjes <rientjes@google.com>,
 Dennis Zhou <dennis@kernel.org>,
 Dev Jain <dev.jain@arm.com>,
 Gregory Price <gourry@gourry.net>,
 Hao Li <hao.li@linux.dev>,
 Harry Yoo <harry@kernel.org>,
 Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 Kiryl Shutsemau <kas@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Miaohe Lin <linmiaohe@huawei.com>,
 Michal Hocko <mhocko@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Nick Piggin <npiggin@gmail.com>,
 Nico Pache <nico.pache@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 Pedro Falcato <pfalcato@suse.de>,
 Peter Xu <peterx@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Rakie Kim <rakie.kim@sk.com>,
 Rik van Riel <riel@surriel.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>,
 Xu Xin <xu.xin@linux.dev>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Youngjun Park <youngjun.park@lge.com>,
 Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <815030A5-DBF5-48C8-A585-CAD27089E599@linux.dev>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-5-97278f8a5f54@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 05:34, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> We want to make sure that MM components cover all relevant MM files. =
The
> generic "MEMORY MANAGEMENT" sections will probably go away at some
> point.
>=20
> We have a bunch of files that are not explicitly tracked under MM
> components. Let's add these missing files.
>=20
> Split up tools/mm to the appropriate components, but still add it also
> under MISC, similar to what we did with selftests.
>=20
> Don't split up selftests for now. They are covered by MISC and some
> sections name them separately.
>=20
> Some files like
>=20
> - include/linux/numa.h
> - include/trace/events/kmem.h
> - Documentation/admin-guide/numastat.rst
>=20
> are a bit fuzzy. Add them to the best fit for now.
>=20
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> MAINTAINERS | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc82ef545e0aa..98948d159173b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6841,8 +6841,10 @@ R:	Muchun Song <muchun.song@linux.dev>
> L:	cgroups@vger.kernel.org
> L:	linux-mm@kvack.org
> S:	Maintained
> +F:	Documentation/admin-guide/cgroup-v1/memory.rst
> F:	include/linux/memcontrol.h
> F:	include/linux/page_counter.h
> +F:	include/trace/events/memcg.h
> F:	mm/memcontrol-v1.c
> F:	mm/memcontrol-v1.h
> F:	mm/memcontrol.c
> @@ -12349,6 +12351,7 @@ R:	David Hildenbrand <david@kernel.org>
> L:	linux-mm@kvack.org
> S:	Maintained
> F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
> +F:	Documentation/admin-guide/cgroup-v1/hugetlb.rst
> F:	Documentation/admin-guide/mm/hugetlbpage.rst
> F:	Documentation/mm/hugetlbfs_reserv.rst
> F:	Documentation/mm/vmemmap_dedup.rst
> @@ -12360,6 +12363,7 @@ F:	mm/hugetlb.c
> F:	mm/hugetlb_cgroup.c
> F:	mm/hugetlb_cma.c
> F:	mm/hugetlb_cma.h
> +F:	mm/hugetlb_internal.h

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

