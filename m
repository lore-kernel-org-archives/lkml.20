Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887810;
	b=lWtNUoX++61pgcE9HfvtwAYtFjX4HKjqoZBUUXwXyyXUBUXQYRygEmsnCsv8As7KsZQA
	 ELS615LXi22OXW6LdTEyOw183EmSmC9uie03muRWT2xsVVsyCnuvoH94mDCHAc8HLWDm4
	 sa9qoIhLMR8E3sPcJwL7qHrnW5XkWCDySjI19HAAvS0ZfA4Kt6lf28k9/hJbCPUKSXhta
	 EcZlndL0rHq1HKylTk3d/teG+dK1yvcEVSoU1PX8WNjcWwC6GWmy2kwqo3PAA4sZlPFMb
	 qTLOIqw7oJdIcNXze2Y9quDhxx5ZfvetOou9jv8AhRPaYCafIkHHPp5bWJO0jSJg9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887810;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=rXYKCnFMOcWT/GHOYQM/Rfu/7o9VqnHXStFCMJH6+uU=;
	b=NsuWf/sUEfAcJKv4Hk/Ki5jQyhJPpwXOtGTrrAZ4qmoKUtQKMeznzNpolZ2j/EFKyIWX
	 Lav99X5cLO9ypSbt+To7F8eBre6Ls9URno9uKA9Nqiv+gJRLlmCL2q77nXf0yxTSv3oXs
	 1W1C0oZEJH7zXbpsq6qm/snmkyyipEmc2LxCusZanSwoX+8szjHzUdptyoniPaoPWRU0z
	 j5n7vjXajU9ATwh9xOSIVe0R4DS85yp8jw37vZNPRA3+vGSS7KeWvxyMa3IIbDqMPFpvq
	 ShspuAj2+S4LoIBhyIWO/Kz5ug9YR9cfl2MYT4ZWTmr7Yq6oBJiEfiTerYxbRDD4/Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bH4IT6Ql;
	arc=none smtp.remote-ip=95.215.58.196
Received: from mta1.migadu.com (out-196.mta1.migadu.com [95.215.58.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C77606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C77606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bH4IT6Ql
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rXYKCnFMOcWT/GHOYQM/Rfu/7o9VqnHXStFCMJH6+uU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793887807; v=1; x=1794492607;
 b=bH4IT6QlLloPI5/z3PFIsj33HFOP6499Pz6Da93pkoarR8FGaLcaGn55vGgw/M1lEVoMhSyl
 4ISSwYo2PX8xYPyjJ9ZyySMDjy97Z+yefRM8jJ9uyugfEqP3ztM8eiseohokaq7OqtdByu/Xk3n
 d2gd4DjyRnusDfmWJGU4ShaY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dd249d3f7c375ee6;
	Thu, 05 Nov 2026 14:10:05 +0000
X-Mizu-Trace-ID: dd249d3f7c375ee6
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 0/4] mm: Enforce read-only shared vmemmap tail mappings
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <0851db25-fef3-4f96-8d37-81ad5c51d6c8@kernel.org>
Date: Thu, 5 Nov 2026 22:09:33 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Lance Yang <lance.yang@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6492A4DD-B00E-40EA-85D6-93183E8D3ADC@linux.dev>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
 <0851db25-fef3-4f96-8d37-81ad5c51d6c8@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi David,

> On Nov 5, 2026, at 18:33, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/19/26 11:08, Muchun Song wrote:
>> This series is split out from the earlier, larger series "mm: =
Generalize
>> HVO for HugeTLB and device DAX" [1]. While the parent series =
generalizes
>> vmemmap optimization across HugeTLB and device DAX, this subset =
addresses
>> a single, self-contained step: mapping shared vmemmap tail pages =
read-only
>> at population time.
>>=20
>> After the previous HugeTLB and device DAX conversions, both can =
install
>> optimized shared-tail mappings during vmemmap population. These =
mappings
>> should be read-only because each shared tail vmemmap page backs =
metadata
>> for many tail pages. HugeTLB applies this protection in a later,
>> subsystem-specific pass, but device DAX currently lacks it.
>>=20
>> This series moves the protection into the generic sparse-vmemmap and
>> powerpc radix population paths. This protects device DAX mappings and
>> makes the HugeTLB-specific vmemmap_wrprotect_hvo() pass redundant. =
With
>> that pass gone, the bootmem-only optimization wrapper has no distinct
>> work and is removed as well.
>>=20
>> This is intended to be the fifth smaller step toward the broader HVO
>> generalization. The remaining HVO naming and enablement consolidation =
is
>> left for follow-up series.
>=20
> I assume this patch series is no longer applicable after we remove the =
RO
> protection for HVO.
>=20
> Or am I missing something? :)

Not quite :) The runtime RO part yes, but the vmemmap population path is
a different story =E2=80=94 struct page isn't initialized there, so =
there are no
concurrent accessors and setting RO is safe.

So we can keep it and enjoy the protection RO gives us: if something =
goes
wrong, we catch it right at the first scene. So I think this series is =
still
needed.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David


