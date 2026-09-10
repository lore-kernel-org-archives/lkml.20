Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80C9EECB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022914; cv=none; b=S547WB6Uy+av4doVKFLIrUpPASZZUqJTaasYedJZhG3sTYQD2D8r9B0l1VyxQ8DV/c+rp2s0B41APufv4yfxb4n6LYfbP93Gnd468VBK+nTPoS1BOGLX08PHu/HbMT1uwaiA3ZqDrJgbL3Xhxk1y92myypO2mYFvJwO6+isrZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022914; c=relaxed/simple;
	bh=YHacq/CRvcLogvUw1Z/iF5AmWhyhaW1ODj1zgiJ2k7E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MUYVPXr1P1L4YgF7d5pHpTLqTfTGHc5VzdKnF386VmL1YaVG29MpmrRAsn8mBQGCAXIFY8Rp8b+PKicYgjYMYMy0hsl9RCekRYToQhzUUCO+pKG2redmZzBkc9nXtmmIylRI2v6wiOOauxo03MmMxsuU8f9cPPrjmg4CaHrzaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W8/NzpWV; arc=none smtp.client-ip=95.215.58.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W8/NzpWV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YHacq/CRvcLogvUw1Z/iF5AmWhyhaW1ODj1zgiJ2k7E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789022910; v=1; x=1789627710;
 b=W8/NzpWVVXERmI5NSrKpWItFXtN/X+flt4m4J/PVB1v3gCT24ku4gX7V4pAviM6gktup4Y5c
 h6ByV4vdw5PdjhRRk6RCOp2jvp6LInuYR9h2YyTBk0iAP+jL4tGwNZ8HLT3qjE34u5DtZAUzaIe
 7s0QQUbnrI9i+o046EGpK6sg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e82ef4c2d92f9736;
	Thu, 10 Sep 2026 06:48:30 +0000
X-Mizu-Trace-ID: e82ef4c2d92f9736
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v2 00/11] mm: Switch device DAX to section-based vmemmap
 optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260908184516.c026438445ff3db78ee120fa@linux-foundation.org>
Date: Thu, 10 Sep 2026 14:48:15 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D743D6A9-2D4A-4708-9099-AE29613CC3BF@linux.dev>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908184516.c026438445ff3db78ee120fa@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 09:45, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Tue,  8 Sep 2026 11:03:24 +0800 Muchun Song =
<songmuchun@bytedance.com> wrote:
>=20
>> This series is split out from the earlier, larger series "mm: =
Generalize
>> HVO for HugeTLB and device DAX" [1]. While the parent series =
generalizes
>> vmemmap optimization across HugeTLB and device DAX, this subset =
addresses
>> a single, self-contained step: switching device DAX to the =
section-based
>> sparse-vmemmap optimization infrastructure introduced for HugeTLB.
>>=20
>> ...
>>=20
>> This is intended to be the third smaller step toward the broader HVO
>> generalization. The wider HVO consolidation between HugeTLB and =
device
>> DAX is left for follow-up series.
>=20
> Thanks both, I'll add it to mm.git's mm-new branch.

Hi Andrew,

I've updated series [1] to v6 to address David's review comments from
yesterday. Since the current series depends on this v6 version, I =
suggest
dropping these two series from mm-new. Once the v6 version of the =
dependent
series is merged in, I will re-update the current series to v3 based on =
the
new mm-new branch, and also fix the compilation error under !CONFIG_NUMA =
[2]
in that version.

[1] =
https://lore.kernel.org/all/20260910063256.64386-1-songmuchun@bytedance.co=
m/
[2] https://lore.kernel.org/all/202609100517.0DrzxrW4-lkp@intel.com/

Thanks,
Muchun

