Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106872;
	b=M2405PLEfkWMsGB5vXOKCxkEovBdkgGNdMyNTklBKUhsJBN3k+g97+R9TQOOZFRQb4Wh
	 T3ZMXUDQwyuZv6LbhL9cS9+Os72XakWispOw6aYfQGVLDaRtsxFCNRNSHC0o0Ja7Ta822
	 OrVH4YvoxiQY6xGXGIAl5xZW+ruVZKBxYH6wSUBKLq/Dpc7axNWBV81vRDCO8WFJoDfV9
	 b1yJrmEz77ejKc5YgHgEFirRrPvG0NDqWSAbFRh1sbwGtqGo16DCLqyoVFwTeGKphqxhT
	 /7fE2HH7jarGn8M+huezszOTCxLtjRyogFafYkwPhOiV+DXhKEmibyxr6uIG91e96CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106872;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=TcOL6ipNcctSomEyqgwFYm+J+StqaPe/l3cry1c9MJ0=;
	b=XmkCveUDhT1Mce3L5QjyhDSt+y5DRXx7ErBvXavV0VYKc9G+WvnrFskYOM9zRVUJG4lQ
	 jARig5szUQfi0lOjomPREUJclqJVzOPjoEdUNKELIb0gz3DGrcNHw4wFfZgfNzq6xz9qT
	 HUjPIMA4BcJl8gXHvXiHpwl75y/lRwVAKN6oBl1Q9D3IyJAIAXy6cTRpcSKWfLzFQvq6P
	 BXhCGZ8XU6ePRmD6mg1rdtNE++C6lnm9MccWF0/DZvNmNgIaKlspDThia3S/FGtK6s31D
	 lBLbJeKeCdqHVGyKbD+KaFOM/v819nybX7BoH9vTQcyrsIXeOLp0cq3SaYrjBiSPJrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33062606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33062606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m3gTecYYwq2jZUjUle1w7O+ULuPN4Q/r80sxuGVnYTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793106864; v=1; x=1793711664;
 b=ajjRSYjHFYuNa/S1FAovfJgvU9eBuzz0cefMPjG3K5sLx+1eCR6qnER3QIEnWCDqS1CKx99k
 reeKOqTgSWJDgBMTs9yAQu1VwaENazBo9/Te9qKh6T8ezL3THGkbiwnTOa8owwaqTKpduTvZ3kO
 xmKoEt6jNwmhfg0YcmtOCC/Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1793c71c60f3bc72;
	Tue, 27 Oct 2026 13:14:23 +0000
X-Mizu-Trace-ID: 1793c71c60f3bc72
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
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <auCZFckDfBMrlfxV@thinkstation>
Date: Tue, 27 Oct 2026 21:13:58 +0800
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 27, 2026, at 20:31, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) =
wrote:
>>> Writing this, I just realized that we have another option -- map the
>>> shared tail page writable. A failing LOCK CMPXCHG writes back the =
value
>>> it read, and the get never changes a zero refcount, so the race =
becomes
>>> harmless. The cost is the protection: the page is shared by every
>>> hugetlb folio of that order in the zone, so a stray write to any =
tail
>>> silently corrupts all of them instead of oopsing.
>>=20
>> Right. Without HVO we would just corrupt pages in the single folio =
(which is
>> also not nice).
>>=20
>> I'm also questioning whether we need this RO protection all the time =
active.
>=20
> What do you have in mind? RO only under a debug option, or switching =
the
> tail page to RO some time after the remap?

I don't think enabling RO only on debug kernels is a good choice.

Within ByteDance, we once successfully caught memory failures using RO =
(because
we backported HVO, but some missing commits in memory failure caused =
write
operations on tail pages to persist). These operations triggered invalid =
writes
to shared tail pages.

Under the old HVO schema, this invalid write only corrupted one folio, =
but under
the new schema, it corrupts all HVOed folios. Therefore, I personally =
believe
that for the new schema, the value of RO is even greater.

Thanks,
Muchun

>=20
> If it is the delay, a grace period alone does not close the race. We
> would need rcu_read_lock() back around the get, and then it is the old
> scheme with the wait taken off the allocation path.
>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov

