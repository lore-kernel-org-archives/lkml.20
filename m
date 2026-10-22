Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663196;
	b=IXqBnnCteO61ipzqu6+tVqd1XAogv9UZDMECdRlF1ZmO4gl3cv9lQtMOx/YIhiFalJUM
	 p7n2oQlLe7uD+VRIEzBJJ7phfFY+f4TwCUv2JWBvMDANzt6Y3Bd8hsrvkfj38NNclfAeW
	 GJ6xn9ut9gE5xaUwr783jplYXW/pM8Af143NqQq3q6hYXQ+qHiPWfYlGqQqZ+iOtFrpVh
	 NARZk8qJfqLJAH9C6fjX0/qoDnlC6bEBQwac6pc38bHv/CKg0BlBkOhrNcbA0Ic3W3zRH
	 FobXGlCcywjrqy+/EGy+PVpl2vK2oHVPjS4P9zxNEO47BJ3KQwDP+AVii43Fsyo0aaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663196;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=hv6E3isSN5uuykNiknQE/xC/PGsr4qd+KpdT1+FvHPg=;
	b=t+sWpE6uCKR2hDdCUoB1bWatirGiO7+VECEacWjrgv/2/LKrbR4xXfe9NEaQInkVP1gJ
	 NTdgT2rE8B9A9y0ac4/CpwHit5gTCZg3SSYpgpKRcvP6a+8f0PwaxHTBgIbZMGbjcXZ6Z
	 YQK6+2E1bwU4lxM2GeaN37+6DqKINCskW6Rzzj6PjM6nIvbf+0gmsk44xb8N0/iWPnVQl
	 mAAW8D53/788mPChXRcM5sTA7UPitC0nBVGQCZXc1vHNERp6z4x04j4p8lJr2WmnnouRW
	 p9ilXjWjG5tVSZz1jee7pQ7aFk64gKH2H3/2ljxFFEe8t5Dmi40oaA540GAq3YngSJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TwDUOkBJ;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5168F606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5168F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TwDUOkBJ
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261022095948euoutp012badbda681e7b5c79e00f3fb5343d018~g0awNFGEK1729417294euoutp01S
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:59:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261022095948euoutp012badbda681e7b5c79e00f3fb5343d018~g0awNFGEK1729417294euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792663188;
	bh=hv6E3isSN5uuykNiknQE/xC/PGsr4qd+KpdT1+FvHPg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TwDUOkBJDEyu7SeYdo6P6WD0zhjGiXjfOrJTo34Fa163vrYSJ9lozjO3hC44i6CR1
	 B1b5btqypZjIC7sZEuwdnSsDWQalzNLVPmZolO2HvHc5Fhecl9sGyxHiSN8qPNtePd
	 08DumbO2pnoVotKs8EA6rVvh4tW+cDFGH2SvGvrg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022095948eucas1p2590f8e436e6813105bd59ef602218dd1~g0av4_ICu0496304963eucas1p2w;
	Thu, 22 Oct 2026 09:59:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022095947eusmtip22aefc6b2d2d828b6789400add0d11953~g0avJsDCr1485414854eusmtip2i;
	Thu, 22 Oct 2026 09:59:47 +0000 (GMT)
Message-ID: <e42637d0-c800-48fe-b943-4ec6ac540d82@samsung.com>
Date: Thu, 22 Oct 2026 11:59:47 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/2] of: reserved_mem: use dynamically allocated
 reserved_mem array
To: Rob Herring <robh@kernel.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, Saravana
	Kannan <saravanak@kernel.org>, Oreoluwa Babatunde
	<oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261021134138.GC3667411-robh@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261022095948eucas1p2590f8e436e6813105bd59ef602218dd1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
X-EPHeader: CA
X-CMS-RootMailID: 20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c
References: <CGME20261015082333eucas1p28bad74cde14ee0afac2eea11bbe6696c@eucas1p2.samsung.com>
	<20261015082315.56876-1-m.szyprowski@samsung.com>
	<20261021134138.GC3667411-robh@kernel.org>

On 21.10.2026 15:41, Rob Herring wrote:
> On Thu, Oct 15, 2026 at 10:23:10AM +0200, Marek Szyprowski wrote:
>> Mike Rapoport suggested [1] how to properly use dynamically allocated
>> arrays during early boot.
>>
>> Use this approach for reserved_mem array during early scan of the
>> reserved regions. Having all the reserved regions in a single array
>> removes the need of the two pass initialization introduced by commit
>> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
>> regions are processed"), so implement it to make the code simpler,
>> easier to understand and ready for adding proper error checking.
>>
>> Tested on ARM32, ARM64 and RiscV64 based boards. Arch specific issues
>> with early mappings were discovered by LLM.
>>
>> [1] https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>>
>>
>> Best regards
>> Marek Szyprowski, PhD
>> Samsung R&D Institute Poland
>>
>>
>> Changelog:
>>
>> v3:
>> - allocate the reserved_mem array only after all static regions are
>>   reserved or marked as no-map, so it cannot be placed inside any of
>>   them
>> - record failures of the early static reservations and print a single
>>   message asking to fix the device-tree
>> - restore conditional compilation of the early mapping code, because
>>   some architectures lack support for it (C-SKY & Sparc64 as reported
>>   by kbuild robot)
>> - allocate the array bottom-up, to avoid allocating from highmem, what
>>   might be an issue on Xtensa, C-SKY and MIPS32
>> - don't use the early mapping on PPC64, where the scan is done before
>>   early_ioremap_setup()
>>
>> v2: https://lore.kernel.org/all/20261008152403.766439-1-m.szyprowski@samsung.com/
>> - removed superfluous ifdefs
>>
>> v1: https://lore.kernel.org/all/20261008094125.3197971-1-m.szyprowski@samsung.com/
>> - initial version
>>
>>
>> Patch summary:
>>
>> Marek Szyprowski (2):
>>   of: reserved_mem: group allocation helpers together
>>   of: reserved_mem: allocate and map the reserved_mem array early
> Can you confirm the sashiko issues are not issues?


I've replied sashiko review. That are again the preexisting issues initially
targeted by Wandun's patchset:

https://lore.kernel.org/all/20260920092852.614973-1-chenwandun1@gmail.com/


> I'll apply this after rc1. Are you willing to be added as reviewer or 
> maintainer for this code? I'd prefer not to have another entry just for 
> the reserved mem code, so you'd have to filter out the rest of the DT 
> code (not the bindings and dts firehose) which isn't too much.

Okay, I can try to take a look at the drivers/of related code as reviewer.
I will filter it out to reserved_mem related changes locally.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

