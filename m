Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407177;
	b=WQmTZSTp64TUQUAGnTRnDlIczHDzSzUMQAOQm1nJxHnvuN/+mLDSNIf/weknEOTGGXTs
	 MIy3XSUlC8+boZyJ0EIDXPlLf1xgeU87JJkpmbnh2dEQMae2Tg9y/3g7sdWX+RkP3XtGy
	 FLlCN+hd78Mkb5dugwv0kDFv1K2QcGFeFCGBmezUVV6ZX5NPyK5sq+f+tdyq839cNBHYK
	 dV7IfyMNObWESxM5c8GWSLrX2smPc0iqm+TRL2CbjMlWGw1VV9mWN5KsRlTDkHGGZuiWt
	 Y+bhqIjf3UT2557j5eAe2DAmfX5jgiNGSpclIOUa8CHDB7+OJhvg3lKIKxmLOIA9Q6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407177;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=5BAPwHDIfEubAB0o/RcmdVXqwks4sfJbcqO9fW2tVD0=;
	b=1SwwoRLMu/6qM/1RH7nsBAX8E3q2yeEsPr1ADVbkdmueXN7yv+IUBdbxka7zkgZMP3OK
	 w0lFfZ51CgE7UPxiZFWK9cFI9Q2Mwncw3AE2pN3o4OANmXVSgjowjAH2jiRrKejE7k1Kg
	 C/8+QeUaLqJY6Hx3DyYxg6l8ry3fAGbI6pPQU2kHig6UnzX6djUXn1Zby42fqhultLfAZ
	 Oh8LRp+fnansDSGz2z1NcZOq7/umXM1E7mGVXyqWF+23+30j8NVGKOLV503hpSKNEPJ3M
	 BARYihJMOuoRW7uG6EkLvKiGtJeOFdi8tddJ04C+kp4kt2f5cU6r/FfsaAcTcilvpHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="K/XZ72zX";
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3168606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3168606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K/XZ72zX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ccTYSbFE6432gMlGOh0Xb0afH0jlRKw0VR85GRLF68M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793407173; v=1; x=1794011973;
 b=K/XZ72zXQFm34wy+kyRho7nbTp1xGwe8R8aOLAaBOmUN4M6mRdBqC5+776NMcE7yzFhgSfFK
 C5+qegnXG2tZY7LrVLBSewAAjqwBVhnweSKzl67O7B+gs1KeExdnd1GKKGQwHJavuofbmE9er5k
 OmsG6UAXJScLi+pCLcErbni0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5630e70bea526243;
	Sat, 31 Oct 2026 00:39:33 +0000
X-Mizu-Trace-ID: 5630e70bea526243
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 3/7] MAINTAINERS: add Zi Yan as co-maintainer for MEMORY
 MANAGEMENT - THP
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
Date: Sat, 31 Oct 2026 08:39:01 +0800
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
Message-Id: <47C979F1-F892-480D-A12E-CEAAF3A7C260@linux.dev>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
 <20261030-maintainers-v1-3-97278f8a5f54@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 31, 2026, at 05:34, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> Zi has been contributing to THP consistently and reliably over many
> years and is considered one of our most valuable THP experts. As THP =
is
> an especially active area lately, having a single dedicated THP =
maintainer
> is not sustainable.
>=20
> Fortunately, Zi volunteered to take on more responsibility by stepping
> up as a THP co-maintainer. So let's do exactly that.

I'd also like to say that this is well deserved =E2=80=94 I've seen how =
much effort
he's put into the review work in this area.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

>=20
> His placement in the MAINTAINERS entry is very convenient to perform
> this change :)
>=20
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0baeb37b0dcdc..02b5b542f81ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17817,7 +17817,7 @@ F:	mm/swapfile.c
> MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> M:	Andrew Morton <akpm@linux-foundation.org>
> M:	David Hildenbrand <david@kernel.org>
> -R:	Zi Yan <ziy@nvidia.com>
> +M:	Zi Yan <ziy@nvidia.com>
> R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> R:	Liam R. Howlett <liam@infradead.org>
> R:	Nico Pache <nico.pache@linux.dev>
>=20
> --=20
> 2.43.0
>=20

