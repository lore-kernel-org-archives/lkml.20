Received: from mta0.migadu.com (out-196.mta0.migadu.com [91.218.175.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E47496D3E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399463; cv=none; b=eafn+2iE8+ULjDe55VtBLWPWTw9QQ/VE+cBRiD7llH1HrUtKVj6vx6BoYA3se0oD8NR/O3kilELnRhTgMtfe+H31h54lcmTEfFocaZK0z7U4U0IAJUkQqZ70Ax9WnFFpKDfuLoJ4u9hnFX8UW/FK+YBBva+22AUk0YXS8G2zOnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399463; c=relaxed/simple;
	bh=VuUI5I5Plith8bOrcJuwZxksr2hAMP7W06KU56M8g1s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YGmKGYo0hj8frCNhZMKEJ2V+xz36mwzvB44gpacPCwfUz34JiBv+a8RYwiRBjmKmYK5NbIXZKKaO+dSL6zIE5Zq0OQCmgGo2RA7m9OsIearDKOyJhlWOjq6PrTQm82GHtCKfA94hNkUrhqAnQKSV2jiF0ZlWnuCHgXPh2SHBBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wQRzvpe9; arc=none smtp.client-ip=91.218.175.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wQRzvpe9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VuUI5I5Plith8bOrcJuwZxksr2hAMP7W06KU56M8g1s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792399457; v=1; x=1793004257;
 b=wQRzvpe9wUABp18JXIWXaXVbvfvnUOfTdmsOuSBjpYKXd5wlhb9iT4fwgO9lpA7M5zDgX5Bl
 M0U4ex92ZDSWd/8tP/RCIsUsO1JkZ7GvlJqddUi9SwvMNNEDr81IgP3W8CIT1hcMj/41GN1CPr7
 PP+I4loiiH1IegBshHkYaSzE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ef060ed4dbf3e91d;
	Mon, 19 Oct 2026 08:44:17 +0000
X-Mizu-Trace-ID: ef060ed4dbf3e91d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <988249c7-abf0-4f4f-9386-27e835a4d2de@gmail.com>
Date: Mon, 19 Oct 2026 16:43:58 +0800
Cc: Qi Zheng <zhengqi.arch@bytedance.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EE02C2AF-E4BD-4854-B235-928842456253@linux.dev>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>
 <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com>
 <BEADD50D-94AA-4B05-B9AD-136E37247FDD@linux.dev>
 <988249c7-abf0-4f4f-9386-27e835a4d2de@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 19, 2026, at 16:20, Jose A. Perez de Azpillaga =
<azpijr@gmail.com> wrote:
>=20
> On 10/19/26 9:50 AM, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 19, 2026, at 15:37, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>>>=20
>>> Hi Muchun,
>>>=20
>>> On 10/19/26 2:50 PM, Muchun Song wrote:
>>>>=20
>>>>=20
>>>>> On Oct 16, 2026, at 18:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>>>>=20
>>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>>=20
>>>>> Hi all,
>>>>>=20
>>>>> Allocating PMD-sized HugeTLB pages at runtime can become slow or =
fail
>>>>> as physical memory becomes fragmented. Reserving HugeTLB pages at =
boot
>>>>> avoids this problem, but keeps unused pages unavailable to =
ordinary
>>>>> allocations.
>>>>>=20
>>>>> Live upgrades are one example: they need additional HugeTLB pages =
only
>>>>> during the upgrade. HugeTLB already supports CMA for gigantic =
pages,
>>>>> but reserving a CMA pool for 1 GiB pages can fail when physical =
KASLR
>>>>> and other early reservations leave too few suitable 1 GiB-aligned
>>>>> ranges. At runtime, 1 GiB allocations can also fail when pages =
cannot
>>>>> be migrated out of a suitable contiguous range.
>>>>=20
>>>> Yes, that's our use case at ByteDance. Allocating a 1GB HugeTLB =
page from
>>>> the CMA pool is more prone to failure than allocating a 2MB one. To =
improve
>>>> the probability of successful allocation, we typically configure =
the CMA
>>>> size to be larger than our actual requirement, keeping a certain =
margin to
>>>> handle cases where temporary kernel operations (such as DMA) =
prevent successful
>>>> migration. For 1G HugeTLB pages, since the margin must be an =
integer multiple
>>>> of 1G, the extra memory configured as headroom is also relatively =
large,
>>>> making it less flexible than 2M pages.
>>>>=20
>>>>>=20
>>>>> Extend CMA support to PMD-sized pages so their backing memory can =
be
>>>>> reserved at boot while remaining usable for movable allocations =
until
>>>>> needed. This relaxes the reservation alignment requirement and =
reduces
>>>>> the contiguous range required per allocation.
>>>>>=20
>>>>> The series adds an optional @<page-size> suffix to hugetlb_cma and =
a
>>>>> separate PMD-sized pool. For example, on x86-64:
>>>>>=20
>>>>> hugetlb_cma=3D4G hugetlb_cma=3D1G@2M
>>>>=20
>>>> Different sizes of gigantic pages already share a single HugeTLB =
CMA pool.
>>>> Given that, why not let 2M pages also reuse this same pool? Would =
that make
>>>> the overall code implementation simpler? And if it does make things =
simpler,
>>>> should we go ahead and do it first?
>>>=20
>>> Sharing the pool would simplify the implementation. My concern is =
that
>>> small PMD allocations could fragment the default pool and prevent =
later
>>> gigantic allocations.
>>=20
>> Yes. However, the premise is that there has to be a mixed-use =
scenario.
>> I'm not sure if this kind of mixed usage is a common scenario.
>>=20
>> Of course, we don't have much experience to draw on, because on most
>> architectures there is generally only one kind of gigantic page, and
>> prior to this, mixed-use scenarios could not arise.
>>=20
>> Therefore, I think that before the need arises, a simpler design is
>> easier to maintain.
>=20
> wouldn't a shared pool still be sized and aligned for 1G? then the 2M
> headroom stays a multiple of 1G and the 1G-aligned reservation can =
still
> fail, which is what the series is trying to avoid.

If we decide to use a shared pool, I think the current alignment =
strategy
should be adapted as well, it should be changed to align with the =
minimal
acquirement, like 2M.

For example, if a user reserves 1G+2M through hugetlb_cma, then the =
memory
reserved by the pool is also 1G+2M, except that the starting address =
needs
to be aligned to the largest gigantic page (1G). Therefore, this pool is
suitable for both 1GB and 2MB allocation. The only problem I see with a
shared pool is that it may not support mixed-use scenarios very well.

What do you think?

Thanks,
Muchun

>=20
> --=20
> cheers,
> jose a. p-a


