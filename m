Received: from mta0.migadu.com (out-90.mta0.migadu.com [91.218.175.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6852989B5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621483; cv=none; b=DtVlybmxZyY3bPspIeEYQyp6ImIdC4bfHtX0pAB/114HAdLKYC88L6eR7F9u1Cf2dIRlv5yoQyNqt+ebW/vDKbXW6nXy7PvyYZrRUi/acHF7mC7FujSQyg9Ia6ERdkpRbQGiwv1e8OmUgJbuOZfJ696Uzm0afuN0zzEup2tMT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621483; c=relaxed/simple;
	bh=+PRO4n3F+OyGen9J5HY+faBhF6ZEkZwsHa88ihF2mE0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NXCIVccCe1Ct1anW0dcnXO7WWEIxd30DW7KCJ0QMw3psPtwx7UenUMjr5epC6X7yvag308gTlBj4pZ6qXskTMNqU7jwTjouIk3aICQXyXPkwfrp5xEd4qPkLBTpeKXw7PXOJeYXa7Oc3vcJWlRCspHB7zz0tVWdK1m3nCSUz1wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QBA7G/g8; arc=none smtp.client-ip=91.218.175.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QBA7G/g8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+PRO4n3F+OyGen9J5HY+faBhF6ZEkZwsHa88ihF2mE0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791621472; v=1; x=1792226272;
 b=QBA7G/g8sj2aYCkQ/RrD4TBG3enwlM+9wuP8ceggjgLRHL+yuZGvT8v9XkQ09Vou5kbLFuPe
 eb7prH1fGSWih6UfTArfuOJevMeCkymOpNIFhdYM/D22cAkgVDsG1mr+XZJM5OVPmiPGxFvWHoj
 1zfdabbJKhtVYlFfGxS7mzpM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15e719b1ad28d653;
	Sat, 10 Oct 2026 08:37:51 +0000
X-Mizu-Trace-ID: 15e719b1ad28d653
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v4 3/6] mm/sparse-vmemmap: drop Device DAX-specific
 population path
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261010075755.83339-4-songmuchun@bytedance.com>
Date: Sat, 10 Oct 2026 16:37:35 +0800
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <42099448-FB7B-4885-9DE3-DBB6C96B88FF@linux.dev>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
 <20261010075755.83339-4-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 10, 2026, at 15:57, Muchun Song <songmuchun@bytedance.com> =
wrote:
>=20
> The common vmemmap path selects the shared page for optimized mappings
> itself, so Device DAX no longer needs =
vmemmap_populate_compound_pages()
> to find a shared tail page and pass its backing PFN through the =
generic
> population helpers.
>=20
> Remove the Device DAX-specific population path and let section memmap
> population always use vmemmap_populate(). The powerpc retains an
> architecture-specific compound-page implementation, so select it =
directly
> from radix__vmemmap_populate() for optimizable sections.

Regarding the issue mentioned by Sashiko [1], it does exist, but it
was not introduced by this series. I have already fixed it in another
series [2], but it has not been merged yet.

[1] =
https://sashiko.dev/#/patchset/20261010075755.83339-1-songmuchun%40bytedan=
ce.com?part=3D3
[2] =
https://lore.kernel.org/all/20260924025035.1265035-1-songmuchun@bytedance.=
com/

Thanks.=
