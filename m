Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261280;
	b=r3ac5cPnhaZjvQu1pmybm1cifETR7OKepBM1ZQCUKqkH56N1naQA7Kkpu86XOsHjKqXV
	 wO6CQzsBv+bphII3UlqY9Ceu5ZVTwP1spf9cCnmhbdion4RcYmv0CuIqfFPWlWhH2kB+D
	 +MSyZDaI5WMsYQhRPxJpEZq6qMY2Ot3081d5rsDIZsOOfe4LIKZKbXiKIbXnO5FSZoQbQ
	 3XSGHYrwV2lVAL695OLvEyxN8Uyen5IcQKImpwAlt2NsIUfD519jBpu67vPDnoAyaq7Nq
	 edW9B1CUGw7mU+NKVzg9C3qVERxx+Bm107mjCYrN3eSo0jilMDt2bDx1LqCzEUcoBQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261280;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=KbmqhuuVTr4I/rFjLF6bkUlnaFuOWYpE9EokGVjMu2Q=;
	b=JMcZh0OLupfM1u2G2FCf/PmA5MJiP0HawvgcvVvCrMLGEHkE6gXQi00g7eU8roMOjHKT
	 tx8TVJBP1wxrEcJJy08SNDkioC2rui0lMyyLKqoI1u70z5opVUw5jG2M7WzwfkGtXaSGU
	 dMAW1pVk8tRJRsmcOOzMw0+11I3eXxOctIIA1wrKk031UbwIgJq0eWZO4DMtM1rZuZ6cF
	 ow11bbaSZLDSaEEBrxG0Q3Dx6aFyHRq+Hr0lBoJ9uS509S0BedxCSl+BfJkpayTkSgbAV
	 BYOXERDqFBvlnLnJB9xOmkwNtGnSOOCF9pYXWePoeeOVWSphHlNjkoLTTl9ujoqaV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hI3fx5KS;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88384606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88384606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hI3fx5KS
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029080757euoutp02cf0dfb25b2d35c10865058f66c58a395~i8aGJC8LN0334803348euoutp02v
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:07:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029080757euoutp02cf0dfb25b2d35c10865058f66c58a395~i8aGJC8LN0334803348euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793261277;
	bh=KbmqhuuVTr4I/rFjLF6bkUlnaFuOWYpE9EokGVjMu2Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hI3fx5KSrynTlh9U5DWXqUPwTLV/Y+yLzp71MmdSMfHdk9h+tnVg+Upv4sQN9NqCs
	 F9YWv2AS1ZffdDxuR7RkWZzpkkP9yrG9aa6zJ/NmMPl7qHIALK8l92tn0Ivl69R9dV
	 oxybyR4rI/vRo+381YieXVCg4GYY2+cu0Km3UqlY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029080757eucas1p29a2b9c805d1f31981b4a106f9777c9bd~i8aF1C6Hv2581125811eucas1p2C;
	Thu, 29 Oct 2026 08:07:57 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029080756eusmtip1db621864afb35e4c85aa1c1abae870ea~i8aFWp-Wj2048420484eusmtip1A;
	Thu, 29 Oct 2026 08:07:56 +0000 (GMT)
Message-ID: <ef0683f4-b14e-430f-8b28-8e1851ad3cf2@samsung.com>
Date: Thu, 29 Oct 2026 09:07:56 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/imagination: Align rogue_fwif_hwrtdata to 64
 bytes
To: Alessio Belle <Alessio.Belle@imgtec.com>
Cc: "lkp@intel.com" <lkp@intel.com>, Luigi Santivetti
	<Luigi.Santivetti@imgtec.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Frank Binns <Frank.Binns@imgtec.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <29ed7e87285e39dfcb87c07d3c8a17361277f878.camel@imgtec.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261029080757eucas1p29a2b9c805d1f31981b4a106f9777c9bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260810102037eucas1p2f68492f185b4e411aafa83d5d15d0499
X-EPHeader: CA
X-CMS-RootMailID: 20260810102037eucas1p2f68492f185b4e411aafa83d5d15d0499
References: <CGME20260810102037eucas1p2f68492f185b4e411aafa83d5d15d0499@eucas1p2.samsung.com>
	<20260810-fix_imagination-v3-1-e512359722fc@samsung.com>
	<29ed7e87285e39dfcb87c07d3c8a17361277f878.camel@imgtec.com>



On 10/28/26 15:43, Alessio Belle wrote:
> Hi Michal,
> 
> On Mon, 2026-08-10 at 12:20 +0200, Michal Wilczynski wrote:
>> The build fails on RISC-V using GCC because `SIZE_CHECK(struct
>> rogue_fwif_hwrtdata, 384)` expects 384 bytes, but the compiler generates
>> a 336-byte structure.
>>
>> This is due to an alignment conflict: the inner member `cleanup_state`
>> requires 64-byte alignment, but the outer struct is explicitly marked
>> `__aligned(8)`.
>>
>> While GCC on ARM64 implicitly pads the size to a multiple of 64, GCC on
>> RISC-V strictly respects the 8-byte outer alignment, resulting in a size
>> mismatch.
>>
>> Fix this by aligning the entire structure to 64 bytes, which resolves
>> the contradiction and forces the correct 384 byte size on all
>> architectures.
>>
>> Fixes: a26f067feac1 ("drm/imagination: Add FWIF headers")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512131851.1WNXk3BC-lkp@intel.com/
>> Reviewed-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>> Changes in v3:
>> - Cleaned up the changelog section by removing the accidental b4
>>   "EDITME" template from v2.
>> - No changes to the code or commit message.
>> - Rebased patch on latest master.
>>
>> Changes in v2:
>> - Expanded the commit message to properly explain the root cause of the
>>   GCC alignment conflict on RISC-V vs ARM64, based on v1 feedback.
> 
> Sorry to bother again on this. All versions have the same commit message as the
> original. Do you still have the updated message that I think was meant to be
> sent in v2? Or are you fine with me making these changes to the commit message
> (+ rewrap) before applying this?
> 
> - "The build fails on RISC-V using GCC" -> "Sparse (W=1) builds fail"
> - "While GCC on ARM64" -> "While a non-sparse build"
> - "GCC on RISC-V strictly respects" -> "a sparse build strictly respects"
> - "on all architectures" -> "on all builds"
> 
> Thanks,
> Alessio
> 

Hmm I was sure the commit text was changed last time, anyway will fix
and resend thanks !


Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
