Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880695;
	b=DSuYkGEqEvASUe5LCyzRRRnKMVmSEbI6HHGT8HXDqHUuFv8Q8mBz3a9Yso970Vf26qRH
	 Aqc36zX4MrdBoYkrp5g6rmOcajQhijFlbaZlcTFQNgly/1OIjuCmNCJwfw+3jgQQxNJRx
	 6wo/os3p74dazJ187KUJdclH9Unl2g+fiUb6Q7oN5vJJkZ/YRR6tHaOhJbVmjHImRH9PD
	 Aa+r8vKZxCEZemFMfoHp36mVuWJiS9/4Az8qzh7WMXjPPYg+nEwshiet/kT0ebFSaGeVx
	 /448ReBDFlSLn0VTdmDCObd9eMyQamX0+/fTuze9KZjV3Jq1Ssx3C3Ts6wMoBFvRtKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880695;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=MJaijdCSbGvAI2XUFUPLj4Bepyf0Mp+otbYEfC/h5uU=;
	b=s/IcTHNMgiQkc331F8P2HJSgdibRnLMOHRrXiqLWRp9SShIKJd5Rp5Vpl7EDB9pjV3FL
	 e+hNptZEcDszujhbyG7jr5j2CT10o/qRx1CSL0yhZ5kEhB1hr2mz1VshY5DW1EN6At8Ec
	 HUaOmua3BeuO5X+t/69borSFQrj6bOw8p19u5hiduw8SLoWZzsl9qYTmw1D5ZCTv7fiqe
	 RnODPLJquhB3qkP52uyYBWjEeq3BMOVbK7ACPMLgIWAdsCAQPIlCW/bWE8WGzqphsqyct
	 QUiz3s5ATDRJqLMf7yJIIlmf7bLkOlWf8G79CtVIhzzrsNaIEOt1yv1F8U+KNB4lkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=twXPUU79;
	arc=none smtp.remote-ip=91.218.175.172
Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F73606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=twXPUU79
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3eqXtP2dV1n2wti1WI86PMgmoafgSRMDKa8er/AFqsA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794880692; v=1; x=1795485492;
 b=twXPUU79LsIubbO/MX8DOZUuHOAzG8R4zI0ANp03ggukcEHXnZfyXIDwfkzqaUg0kgaaKTcJ
 SOryyyv8UYPGh8dMVlu3yMasOd96r3W8861X2b1qQ01xvfi/wzKZrQXhEpCYPLDMtQsfWped/xi
 p8xOYrGkB0JVytdsbqa6ugIw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 663db3f24a33422a;
	Tue, 17 Nov 2026 01:58:12 +0000
X-Mizu-Trace-ID: 663db3f24a33422a
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
Subject: Re: [PATCH] hugetlb: Don't restore vmemmap of non-HVOed folios on
 bulk restore error
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261116221557.3128331-1-jthoughton@google.com>
Date: Tue, 17 Nov 2026 09:57:57 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1041A207-7114-479F-AB70-8EA33AB361A5@linux.dev>
References: <20261116221557.3128331-1-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 17, 2026, at 06:15, James Houghton <jthoughton@google.com> =
wrote:
>=20
> When hugetlb_vmemmap_restore_folios() fails, it stops processing the
> list, so folio_list may still contain folios that were never vmemmap
> optimized, e.g. because HVO failed when they were allocated. Their
> hugetlb flag has already been cleared by remove_hugetlb_folio().
>=20
> If no folios could be restored, bulk_vmemmap_restore_error() then =
calls
> hugetlb_vmemmap_restore_folio() on every folio left on folio_list,
> including those, which trips the !folio_test_hugetlb() check in
> __hugetlb_vmemmap_restore_folio():
>=20
>  page dumped because: =
VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio))
>  WARNING: mm/hugetlb_vmemmap.c:503 at =
__hugetlb_vmemmap_restore_folio+0x270/0x300
>  ...
>   __hugetlb_vmemmap_restore_folio+0x270/0x300 (P)
>   hugetlb_vmemmap_restore_folio+0x1c/0x30
>   update_and_free_pages_bulk+0x2c0/0x368
>   __nr_hugepages_store_common+0x2e8/0x3f0
>=20
> Otherwise this is benign: the restore is a no-op returning success for
> non-optimized folios, which are then freed as intended.
>=20
> Skip the restore for folios that are not vmemmap optimized; they can =
be
> freed right away.
>=20
> This is very unlikely to happen without fault injection, as it =
requires
> both HVO and a subsequent vmemmap restore to fail.
>=20
> Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list =
of pages")
> Signed-off-by: James Houghton <jthoughton@google.com>

Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.

