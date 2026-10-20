Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482434;
	b=G5jog4A8MtigEHtrcxpRJiiwK12CjuGQoQlostreUcUKVNH/AB1tHAVqbzukArjYOway
	 Fcx+9TJiTXk3g65Oe59ZhxFGDruO1yMPtXAf3DKC56Xsr7S08wR+pXcKQYLEmhw+DWc/S
	 MHmQhl9McBkW5qCftV2SrZlB0yuUEwcVzWT/QHjeXzZf2zyfCLAsosgkDVFMIQ/HJqqga
	 DGnOLujNp3N/L7wJm7VpQ+ocP/jYWrecI38Fh8PVyZrttdS8Y2CAU0KJN20TU4T1AdJ3/
	 S6Pp9PcHmOBbkXGw9JtSAjNGydANDePmQJIi5Bj2FPQeunCw+vvv/S2YcLAsf5yc72A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482434;
	h=DMARC-Filter:DKIM-Signature:Subject:X-Original-From:
	 X-Lms-Return-Path:Cc:Message-Id:References:User-Agent:Content-Type:
	 From:Mime-Version:Content-Transfer-Encoding:To:Date:In-Reply-To;
	bh=trYzjDokCMDLNCP43C8CigBtVifE7/eaaedTzK6la4E=;
	b=RwhNFz/ljAkQ+Lh1CxO62LSnhsFNle6mcB209xPsxnrbYLdgZIBSq6hyp4u/AplQc08p
	 IMKjhspPmRADCS52+l4ebrSGnOZrX4/L1fttNsVVYcEEjdbpdC8/0bYsLG7/OYw6Cm+It
	 b0yFQ0h5JT2V3TmKjioR+a4AmIYlJHgsiZspccbAx+QBzUKrIAjZKcBXPaaVcYeh3lyEl
	 XG33LDctF3foKMFluTiVB9TZVD4uT3C4MyhjFOuxlIYAvf8wP2MIWV/EwJxAxDRO34fmW
	 A9bLBrjKF700H4pp7Xtzrn9NL4JKm3cB1+1KZBa63Rm9qcNpFcWl0CQXdetn1n3fg/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=UzAQvEPd;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A73606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=UzAQvEPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792482427; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=trYzjDokCMDLNCP43C8CigBtVifE7/eaaedTzK6la4E=;
 b=UzAQvEPdmprn9wiIThQysJ+U2L8X6BQjh1X+Xo46G/Ph2PF/5bD0a32HLZSiSqgWLTS8Ci
 BOJuGKSD9YLR+kBUY4CaBkpI6JTMZWkFABJAJw1QaIVz4n6JuzTzY5fZbAlj0clGBGKI9X
 pQIiW2/k3N/hD3fsJdodqlba9armVhhcTrMVtl9jXpeqcVKYdCa+iIxZUAESKqMJSekwZE
 RrxqzF/Vpq0pf8C6agbWtFQFJlY9n6l0Zkqr+1J0s+EBJJSlpYLUrCErEgpOC2RV2DIWw0
 lyLhhYv6DM0L4F5jxPed6FwKLQtui9Q+H2nrvZ3Oy8/mSp4QbY7ylxmeS9Pn1w==
Subject: Re: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
X-Lms-Return-Path: <lba+26ad71c79+38b993+vger.kernel.org+zhengqi.arch@bytedance.com>
Cc: "Qi Zheng" <qi.zheng@linux.dev>, <osalvador@suse.de>, 
	<akpm@linux-foundation.org>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Message-Id: <76a568ec-a23f-4a8b-ba14-e5a40083e1e4@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com> <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev> <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com> <BEADD50D-94AA-4B05-B9AD-136E37247FDD@linux.dev> <988249c7-abf0-4f4f-9386-27e835a4d2de@gmail.com> <EE02C2AF-E4BD-4854-B235-928842456253@linux.dev> <1385f5a1-b842-45e6-8986-fec4123037f1@gmail.com> <1eff2f1a-b7bc-4541-82f0-9836d0a5db5c@kernel.org>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	"Muchun Song" <muchun.song@linux.dev>
Date: Tue, 20 Oct 2026 15:46:49 +0800
In-Reply-To: <1eff2f1a-b7bc-4541-82f0-9836d0a5db5c@kernel.org>

On 10/19/26 8:18 PM, David Hildenbrand (Arm) wrote:
> On 10/19/26 11:17, Jose A. Perez de Azpillaga wrote:
>> On 10/19/26 10:43 AM, Muchun Song wrote:
>>>
>>>
>>>>
>>>>
>>>> wouldn't a shared pool still be sized and aligned for 1G? then the 2M
>>>> headroom stays a multiple of 1G and the 1G-aligned reservation can still
>>>> fail, which is what the series is trying to avoid.
>>>
>>> If we decide to use a shared pool, I think the current alignment strategy
>>> should be adapted as well, it should be changed to align with the minimal
>>> acquirement, like 2M.
>>>
>>> For example, if a user reserves 1G+2M through hugetlb_cma, then the memory
>>> reserved by the pool is also 1G+2M, except that the starting address needs
>>> to be aligned to the largest gigantic page (1G). Therefore, this pool is
>>> suitable for both 1GB and 2MB allocation. The only problem I see with a
>>> shared pool is that it may not support mixed-use scenarios very well.
>>>
>>> What do you think?
>>
>> makes sense to me. existing hugetlb_cma= users with WM pages would get
>> mixed use without asking for it though.
> 
> Yeah, my intuition tells me that having 1 allocation size per CMA area might be
> cleaner.

Agree.

> 
> Assume you allocate 512 2 MiB hugetlb folios. You'd think that you would then be
> able to allocate 1 GiB hugetlb folio less. But that's not guaranteed, as CMA
> might just fallback to other areas fairly easily.
> 
> If someone wants to convert from 1 GiB to 512 x 2MiB, I think the demotion
> interface allows for that.

For this series, I'd like to use a separate CMA pool for the newly
supported PMD-sized pages, while keeping the existing sharing among
gigantic sizes unchanged.

If there are no objections, I'll update v2.

Thanks,
Qi

