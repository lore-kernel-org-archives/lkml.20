Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775345;
	b=4bhAXEMiV1nolfF7kNKI2w8cDZTLtTCu2V/oGpbnlSkejrQ5QLR4v1IGjrijxvGcvqdD
	 iDH9Cvr/+x4i8pNA9dz5s9uzEKBc9jvUIk8cPv19ZgoBdoGp9Py0ZXVy8IkMtPwrXOY9U
	 f6rE2BlAEo6rTaTxj5w5USkiv7u2JKJHN0eiew6rN97GCXJDujWzZ5DGLsC1D5WA+aFug
	 bC7mkM2dWSIuT4e5WbUujpaJcRRr7rhME86PSeMl40uPhkuYCyrStLIQYOSwvF5dcFKRE
	 9AldFL0rn+Hmwq41jwMZByUIFVINH4bos9H/HGm9KvXLlpCpGo/7D67gCPEUgAdazcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775345;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=3LHrHKnVlKPTmz+tK/rlTG3Ul+MFMIEMsJZjre2ndI4=;
	b=vA2Rl99JyS8UmrM1ELB2lgNSr2pJ05TnOvoF3A1ldbh//5hSiZtAEfsJ2ac4dhkzcHDS
	 Wph61SxQC4IJ9C3UJEZ5ZkaF28JCpQyPnmTix1shfpHq3PqYkGJnYXwZqMDKT3lSHZT9g
	 cbPcQ49ozqC5VxYPfZeixr1vVcpX253Wnkt4jgPyXguz9tIg7BiFJESY5TjDom4Dt8jr3
	 ubXjIj/+dRFpvzGXChI2H1dxeTYZQsuzyRtLGVwPLyoPNFJLm4XFO3vTDo+/9yxJ15TXf
	 Jk9ikTyFPh761KeJWiHkYk9Q23Qqs8Afqaz3w+uFn+joMJeMs3V+ma3OZKBo+3wW5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VhDzF2tx;
	arc=none smtp.remote-ip=91.218.175.190
Received: from mta0.migadu.com (out-190.mta0.migadu.com [91.218.175.190])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9D606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D9D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VhDzF2tx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CIBZ6swiNtC8Tf94i/4oegXgVh55H6AYv54uJEyrGDw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775343; v=1; x=1794380143;
 b=VhDzF2txmtaDN87fTQ3DgA/GYwVVb9/JkN2zy6qxnNSFw/+i904MfEkliJ4p97N4liQihbFo
 Q4Vxc0eGPYL/zvzTqDgnCprz6Gc6cLf0X/tYQfNDS34Wdcb6+gr05CyYVQRXyB1o2LBUZ463jLX
 tu/vrgMsBqoWPcB1MCgaU8d0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 355c044cea9cc491;
	Wed, 04 Nov 2026 06:55:42 +0000
X-Mizu-Trace-ID: 355c044cea9cc491
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
Subject: Re: [PATCH v3 00/12] mm: Decouple folio-based vmemmap optimization
 from HugeTLB
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261103224659.2865b9ff27d09994949edd78@linux-foundation.org>
Date: Wed, 4 Nov 2026 14:55:14 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <77ECD6F3-6A6B-4743-B47E-7C97335FAA79@linux.dev>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261103224659.2865b9ff27d09994949edd78@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 4, 2026, at 14:46, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Wed,  4 Nov 2026 10:34:58 +0800 Muchun Song =
<songmuchun@bytedance.com> wrote:
>=20
>> Hi,
>>=20
>> Section-based vmemmap optimization is implemented in =
sparse-vmemmap.c,
>> while folio-based optimization currently lives in hugetlb_vmemmap.c.
>> The latter is tightly coupled to HugeTLB-specific state even though =
the
>> underlying page-table remapping operates on one folio at a time.
>>=20
>> To make these interfaces easier to maintain, the folio-based =
remapping
>> mechanics first need a boundary that is independent of =
HugeTLB-specific
>> state and raw address ranges. This will allow the mechanics to be =
moved
>> into a common vmemmap optimization layer alongside the section-based
>> interface.
>>=20
>> This series establishes that boundary through three folio-oriented
>> operations, each with a distinct role:
>>=20
>>  - vmemmap_optimize_folio() optimizes the vmemmap backing of a folio;
>>  - vmemmap_restore_folio() restores the vmemmap backing of a folio; =
and
>>  - vmemmap_pteify_folio() converts the vmemmap backing of a folio to
>>    PTE mappings.
>>=20
>> Together, these operations encapsulate the address-range calculation =
and
>> remapping mechanics for a folio. HugeTLB wrappers retain policy =
decisions
>> such as eligibility, optimized state, batching and TLB flush =
handling.
>>=20
>> Patches 1-8 generalize the underlying vmemmap remapping =
infrastructure by
>> removing HugeTLB-specific assumptions and simplifying remap control =
and
>> resource handling. Patches 9-12 then establish folio-oriented =
operations
>> for optimization, restoration and PTE conversion.
>>=20
>> The implementation remains in hugetlb_vmemmap.c for now. A follow-up =
can
>> move the folio-based operations into the common vmemmap optimization =
layer
>> once the interface boundary is in place.
>>=20
>=20
> Thanks.  I fed this into my evolving LLM-controlled testing setup and =
it
> said
>=20
> : I tested all twelve patches together in an x86-64 Debian VM under
> : QEMU/KVM, with 4 KiB base pages and KASAN enabled.
> :
> : I grew the pool by 64 two-MiB huge pages and drained it again. With
> : vmemmap optimization enabled, the kernel released 448 vmemmap pages
> : on growth and restored all 448 on shrink, in each of three cycles.
> : With optimization disabled, the vmemmap count stayed constant. I =
also
> : faulted in a single surplus huge page. It released seven vmemmap =
pages
> : and restored all seven when I unmapped it.
> :
> : I tested both boot-reserved and runtime-allocated 1 GiB huge pages.
> : For the runtime case, I grew the pool from zero to one, drained it,
> : and allocated again. I mapped the page and wrote and verified a byte
> : in every 4 KiB base page. After unmapping it, I demoted it to 512
> : two-MiB huge pages and drained the resulting pool.
> :
> : All twelve programs in the HugeTLB selftest group passed, including
> : the cgroup reservation, fault-charge and reparenting tests. Both
> : soft-offline cases passed, as did all twelve poisoned-page read test
> : cases. I saw no HugeTLB warnings or KASAN reports.
> :
> : On a diagnostic build, I failed the head-page allocation and, in a
> : separate run, interrupted optimization after three PTEs had changed.
> : The trace showed rollback restoring the two tail entries to distinct
> : backing pages. The folio remained usable in both runs. I also failed
> : restoration after three of seven replacement pages had been =
allocated.
> : All three were freed, the retry succeeded, and the metadata count
> : returned to its starting value.
> :
> : I configured QEMU with two virtual NUMA nodes, each with two vCPUs
> : and 4 GiB of RAM. On each node, I forced the batched pre-split to
> : fail. The trace showed the remap splitting the same PMD and =
completing
> : a range flush before replacing its first PTE. Folios on each node
> : shared a tail backing page distinct from the other node's. I drained
> : each node's pool in turn and verified data in a live folio on the =
other.
> :
> : Finally, on the kernel without diagnostic hooks, I grew and drained
> : both pools during active page-cache reclaim. Over 40 cycles all 640
> : folios optimized and restored, and the OOM-kill count stayed flat.

Really a thorough set of tests.

> :
> : Tested-by: Andrew Morton <akpm@linux-foundation.org>

Thanks for testing.

Muchun

