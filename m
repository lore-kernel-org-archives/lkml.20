Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194444;
	b=SyNTlRJWx1cEu9Mov19PtvYUlWUYpDbXBpV8jqFB9rLFCvdg/x8/da3/0c+vrtcm6ZuB
	 vgUIln91Qst/QcI0t0NvqhSW0L6UJkZzOmFf8IxwCDAKCAZFIC5lbaB09HEK3fdcd9KyH
	 6OBelp2P13fO6e35F9NuY7HSVcxhHOPHNrDRiASs6tx/B3J63GHjewMDQKErZ+8+kpC8n
	 4VU5h6hDG/bfi/pYp1Ilbd0tDtORip+m5hVugkqUY6xUtPxuGb/ah2sCDlP4PsJhUxW88
	 2p0nRR4FSZ30aMoL0KKJgi1txaZ1rq18WNt3sBb6LE1tjJjmrYu41+KjoH4XHs5yYYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194444;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=+i89gbLbnk0eWNWQfGRGjKqDrE0gEnhRAgw++rXrpR4=;
	b=f1aFVeJAKMWZi87e6U0UfLpT9jR9P4ixUzKd+vRr06ur4MxC+WhZGvlBHwR6IZ94QsfO
	 1cSsG0dsBZWVWDKLPdUhILwjBpgRXWnox7sIKdmPACclwioHyQiAwk+RU9APB/w8omdib
	 otZ30OJxQeWs2EhDTf68o3/o5vK/X43CujPha5Y3DZyC3U/zHVbonHcAUyCz1RPwEhl1d
	 nLlAokNzNrCA3IU28eTOPqHMWBYXygg15CNGSPq8/RjDBPicRg0OL1JFPRPWLqshE+dr3
	 2b35d/31PePyiWq+v0VoLVZ7GFsenP76SGmw3DzlnTCdFEwiDLGSnH+2us4X5ESSFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="WKNMsN+/";
	arc=none smtp.remote-ip=91.218.175.146
Received: from mta0.migadu.com (out-146.mta0.migadu.com [91.218.175.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF7606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECF7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WKNMsN+/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZGabnbBPQOG1vD10Hk045MNH8SrJwcOoFj1T632b9xc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793194440; v=1; x=1793799240;
 b=WKNMsN+/7QQJ0nkJCxFdL6jIECD96U8E8w7ib/hk7NVugdFM4/sf31Fm7dzVpmjnTbBX/Q1m
 bklXMChdXq/GnVjzr+hEUwKRvazZvgtXPlRL7Xf1LQqCzwdzgtNJ0223jk7AD64gIWdIl/t6gTl
 mA4kYVS5itSBPG1qtU8eHgXs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 87b8adf5ccd19833;
	Wed, 28 Oct 2026 13:34:00 +0000
X-Mizu-Trace-ID: 87b8adf5ccd19833
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
Subject: Re: [PATCH] mm/hugetlb_vmemmap: map the shared tail page writable
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028132623.2560146-1-kirill@shutemov.name>
Date: Wed, 28 Oct 2026 21:33:33 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Frank van der Linden <fvdl@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C23A63A-43C8-4434-BEB8-8E5ED3471C25@linux.dev>
References: <20261028132623.2560146-1-kirill@shutemov.name>
To: Kiryl Shutsemau <kirill@shutemov.name>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 28, 2026, at 21:26, Kiryl Shutsemau <kirill@shutemov.name> =
wrote:
>=20
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>=20
> page_ref_add_unless_zero() reads the refcount and then updates it with
> a cmpxchg.  A lockless get, such as a page cache lookup or a PFN
> scanner, can read a non-zero refcount from a page that is then freed
> and reused as a hugetlb tail page.  If HVO remaps its struct page to
> the shared tail page in between, the cmpxchg writes to read-only
> vmemmap:
>=20
>    CPU0 (lockless get)               CPU1
>    c =3D atomic_read(&page->_refcount)
>                                      page freed
>                                      page allocated as a hugetlb tail
>                                      HVO remaps the struct page RO
>    try_cmpxchg(&page->_refcount, &c, c + 1)
>      -> write fault on read-only vmemmap
>=20
> The refcount is zero by then and the compare fails, but a
> compare-and-swap instruction needs write access whether or not it
> succeeds.  The kernel oopses when hugetlb pages are allocated at
> runtime with HVO enabled while a lockless get races with it.
>=20
> Commit bd225530a4c7 ("mm/hugetlb_vmemmap: fix race with speculative =
PFN
> walkers") closed the window with RCU on both sides.  The RCU was =
removed
> together with fake heads, on the wrong belief that it was only needed
> for them.
>=20
> Map the shared tail page writable instead of restoring the RCU.  Every
> struct page on it is a tail with a zero refcount, so a late cmpxchg
> fails and leaves the page unchanged.  RCU would put rcu_read_lock()
> back around every get and synchronize_rcu() back into hugetlb
> allocation and freeing.
>=20
> The cost is the protection against stray writes to tail struct pages.
> The shared page is shared by all hugetlb folios of the same order in
> the zone, so such a write now corrupts all of them instead of oopsing.
>=20
> Bootmem folios optimized when the memmap is set up keep their tails
> read-only.  Nothing does a lockless get on them before hugetlb takes
> them over.
>=20
> Fixes: 32c440d67e6c ("mm: drop fake head checks")
> Fixes: 01b1d0ffb6f7 ("hugetlb: remove VMEMMAP_SYNCHRONIZE_RCU")
> Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> Closes: =
https://lore.kernel.org/r/ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

LGTM.

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

