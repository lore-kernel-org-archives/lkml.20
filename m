Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09C329E44
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599314; cv=none; b=Cl0sy3Is+GiICBvMFRuFcYonr7Unwp4OOjQLoBarMC6gAOKqIJcw3qOCPldSQjHVd2OYAgjXHBFMZ2NRs7CQM/68QrJ0KRDTCoHYObjIIx29BphFaS+3YyoveBxTw7IFuSWzth2vpFuzuYdmQBJS4sjnSXeSJaEPxf2kHOR2NhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599314; c=relaxed/simple;
	bh=928ftpQdBwt+cq+MctmlsoRyqL5DINpZLnaKzBho3a0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FP6+Cid1sCjdmIA6Q5fVGpdr6U0s34MHlkEjmf/jDSj98gJrR2aikT3GnUV1r2tyGEIBdWoColbSLxDAWTfFbetyh2IoGXFNdCYVwXiWf+AGuRZWhccA0QsTl/LnPZEYfSe0qycGSWWy6346eKkiq6jOdulLTNPBU2yE8QTI964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M/3gHvGu; arc=none smtp.client-ip=95.215.58.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M/3gHvGu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=928ftpQdBwt+cq+MctmlsoRyqL5DINpZLnaKzBho3a0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788599311; v=1; x=1789204111;
 b=M/3gHvGuKQyseerPBMWaIjrR9HHkxe5vMov/rwP54TOMft2DvArQHmeOJW8Ae+u0Y3Iiacvc
 iBNr1wkYBkLXlHElqXC4KyebKuUxmI/t+D/phJhRSMxQJcOrfRXA88FmD7JxUdjZ6tifxt6PdOR
 xvaUARySrGnmETV689CwX1Kc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6189846893d99aae;
	Sat, 05 Sep 2026 09:08:31 +0000
X-Mizu-Trace-ID: 6189846893d99aae
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 06/11] mm/sparse-vmemmap: switch device DAX to shared tail
 vmemmap pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <e3d0eaf8-a85f-48ff-96c2-dced4945b085@linux.dev>
Date: Sat, 5 Sep 2026 17:08:12 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <861645FA-43D5-4619-82B6-7A0C889F95B8@linux.dev>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-7-songmuchun@bytedance.com>
 <e3d0eaf8-a85f-48ff-96c2-dced4945b085@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 5, 2026, at 16:35, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 8/31/26 3:53 PM, Muchun Song wrote:
>> HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap =
pages.
>> Device DAX has not been switched to that mechanism yet.
>> Switch device DAX to vmemmap_shared_tail_page() as well. This aligns =
DAX
>> with HugeTLB by using the common per-zone shared tail vmemmap page.
>> Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
>=20
> Could you explain this in more detail?
>=20
> As sashiko pointed out [1], it looks like this assumption is
> problematic: dax_folio_reset_order() may end up modifying all shared
> tail pages?

I believe Sashiko's report is a false positive, because the issue =
Sashiko
raised is based on assumptions from code analysis for FS-DAX. =
Unfortunately,
the current implementation that supports HVO is DEV-DAX, and DEV-DAX =
does
not modify tail struct pages. Moreover, this patch itself is intended to
migrate DEV-DAX to section-based vmemmap optimization, so there is no =
issue
at all.

BTW, the current logic for determining whether DEV-DAX applies HVO is =
based
on pgmap->vmemmap_shift, and pgmap->vmemmap_shift is only assigned =
during the
initialization of DEV-DAX devices.

Muchun,
Thanks.

>=20
> [1]. =
https://sashiko.dev/#/patchset/20260831075342.57563-1-songmuchun%40bytedan=
ce.com
>=20
>> initialize its entries with PG_reserved for device zones. Also skip
>> poisoning vmemmap-optimizable sections while their struct pages may =
be
>> shared.

