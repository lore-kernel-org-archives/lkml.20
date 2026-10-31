Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407414;
	b=n2MWiQG4rtG/J5NVHEx6T9xChhIImqal2t2LAji4aQDOx4sI0UwBNSlqUdBW/Ma+8zzm
	 D6rue/A42/O9sbt1yYQkS4YIIzfJaO8WbJlhMmR6AXo4gDwCi4pZ0tevSLjfn759FFMA6
	 /9GHhtSRx70ncDde47AZkfmanXO1sPi43bmYYP53OM9JJRCivZir6FwhTir05XAuB/5fh
	 d8lztFoCe5hsDW3wb+LHQmJlc1Yc45Eu1Jd8JE3nDKENe9Z2jLintVonrKTOho7Nnqe05
	 IW6YWw6OuiEiYPwJRegKK407H+oFi4LJGMm34ev5jYzK1Og1gWkTw/tPtbTf5LTiGiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407414;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=GcsvWI0Wp94jtSX1XbU0q9DSWkp9MXum6AodoX2HZek=;
	b=25oA/Dmsmgr89Pra+jF5QmWwXk+2WU694sWwGA7IlGlzUfrxKrK38DxWbgdy1awPWwW8
	 T+XK8eqNDjRut4nZuskrObQcJHht5C+8n8jHCzH/Nwx7Ctwa3pDWmtY3V7u345UMfO8G2
	 njQTctey33CBGH8M7zTjshBUQguCPiS2vsjiPfaJsacKUU3q6pzn1QCI39cdx9hro2qtG
	 J1K7rWjZVsDq7VSC9eSzcdh9m94hj7g5K6Nf58IIDCwo5IjEDdE72S/YsjOHtO3t8XSwh
	 Dv7iqDUCVXax5B02zy0Wc21+LlP5zPIF858l+6DhdIc6DwU8jIZ6rcpOMix73sn+i1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=msdHDOcK;
	arc=none smtp.remote-ip=91.218.175.106
Received: from mta0.migadu.com (out-106.mta0.migadu.com [91.218.175.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=msdHDOcK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GcsvWI0Wp94jtSX1XbU0q9DSWkp9MXum6AodoX2HZek=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793407411; v=1; x=1794012211;
 b=msdHDOcKXUZXeMgjI2ScsWQZ64pO42RvFaX5gOMfg3YmamTmcuMFDjfhKMpF6FMVa1Bz+USZ
 czeUjKOe2gPfVXn+8WHmcVsI+mt+tRQfUiXBMGodxYFz14KowcbJmwXkREhOAiIhVgkPsC/mizT
 f645KIKLDDezBeqGXT1aDwpk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 72c000753756bb73;
	Sat, 31 Oct 2026 00:43:31 +0000
X-Mizu-Trace-ID: 72c000753756bb73
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
Subject: Re: [PATCH 6/7] MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261030-maintainers-v1-6-97278f8a5f54@kernel.org>
Date: Sat, 31 Oct 2026 08:43:03 +0800
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
Message-Id: <755C6FD5-84CB-4091-9AA7-929CA04B065F@linux.dev>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-6-97278f8a5f54@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 05:34, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> Prefix "MEMORY HOT(UN)PLUG" with "MEMORY MANAGEMENT" and put it into =
the
> right spot in the MM component section list.
>=20
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>\

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

