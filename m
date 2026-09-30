Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89F1A6811
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731593; cv=none; b=JUf2ODbE8TdyuZnWXTFWKn977X9we75IMm/rgTD3o/kqKkpsi21Vf9p+OgGi1wcm01F0MPHujZyZyUyDSkPPKMcKcas943gyFh7VNhxTQ5kMSsdw3f4oH17oAMGbrD+CBSROaEub8aDpae0H0PyxPMMNK/JFa8jeBap3zS4iqwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731593; c=relaxed/simple;
	bh=IQRBqTSVWWALaW1mPWAac9TGAVH6p8Unuj/FQbT1y4Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Wgn7JvexUlghwWRtKWE7p50UmVb0+uiBn3VoblM14sZaotyKPhQpANQAOJu+nK1zaBE1/G0FsLMhqnJithMx7GTN9KfTQM2MSwIUDG1GzltULBJAVRaef2T9CVFa4r+pv2PiPOcR04YfCrwnJ3PsG/XIsbp8qs0WME8PpRtOuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WDOIv36O; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WDOIv36O"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IQRBqTSVWWALaW1mPWAac9TGAVH6p8Unuj/FQbT1y4Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790731588; v=1; x=1791336388;
 b=WDOIv36OO9lrltIsdKn1p/Dl5TCsZQOqtzhZ8Dh1WEGBKT/HjfCUvVmpfOfIXp1XoKlaFc5q
 Z3PVdE5TDYrfp7jP531Qv+J/ZtxbQfGTyP0S81oSGM/0+/SL5QyDC3zfxAlgMxdGtO07+QVXXD2
 I9GSrh5b69ZqKxDrURbeoZXg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c8969253a912e5f2;
	Wed, 30 Sep 2026 01:26:28 +0000
X-Mizu-Trace-ID: c8969253a912e5f2
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v3 0/6] mm: Unify device DAX and HugeTLB vmemmap
 population paths
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260929143214.9061bcf284369163192968d1@linux-foundation.org>
Date: Wed, 30 Sep 2026 09:26:09 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
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
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1333E60-93C8-4459-9CC0-48D6F10D3EC0@linux.dev>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929143214.9061bcf284369163192968d1@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 30, 2026, at 05:32, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Tue, 29 Sep 2026 13:32:25 +0800 Muchun Song =
<songmuchun@bytedance.com> wrote:
>=20
>> This v3 is based on mm-new commit 2ddb90ee544a, which contains v5 of
>> "mm: Switch device DAX to section-based vmemmap optimization" [1].
>>=20
>> This series is split out from the earlier, larger series "mm: =
Generalize
>> HVO for HugeTLB and device DAX" [2]. While the parent series =
generalizes
>> vmemmap optimization across HugeTLB and device DAX, this subset =
addresses
>> a single, self-contained step: unifying their vmemmap population =
paths.
>>=20
>> After the preceding Device DAX conversion, both HugeTLB and Device =
DAX
>> describe optimized vmemmap mappings through memory-section metadata =
and
>> use per-zone shared tail vmemmap pages. The generic code, however, =
still
>> carries a Device DAX-specific population flag and compound-page =
population
>> path, along with arguments and helpers needed only by that path.
>>=20
>> This series first removes VMEMMAP_POPULATE_DAX and moves selection =
and
>> reference handling for the shared tail page into the common vmemmap
>> population path. It then removes the generic Device DAX-specific
>> compound-page population path and routes section vmemmap population
>> through vmemmap_populate(). The powerpc radix path continues to use =
its
>> architecture-specific compound-page population implementation for
>> optimizable sections.
>>=20
>> The remaining patches remove the unused ptpfn argument, open-code
>> vmemmap_populate_address() now that no caller needs its returned PTE, =
and
>> add a warning for inconsistent zone initialization of shared tail =
vmemmap
>> pages.
>>=20
>> This is the fourth smaller step toward the broader HVO =
generalization.
>> After this series, HugeTLB and Device DAX use the same population =
model
>> instead of parallel generic paths, while powerpc keeps its
>> architecture-specific implementation.
>=20
> afaict the whole series is "no functional changes intended".  Apart
> from [6/6]'s new WARN_ON.

Yes.

>=20
> And [3/6] is the one which could cause unintended fuctional changes!

Understood. However, the resulting vmemmap layout is intended to remain
unchanged.

>=20
> Thanks.  I'll queue it.  Reluctantly.  We're up to 688 MM patches this
> cycle and it's time to stop.

Thanks for taking it despite the load.

Muchun,
Thanks.

