Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05637E5F7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394262; cv=none; b=NBDM2ti/noEqMOgFtZEVrHDY2SD8iCuP2rUCnrTV/deScCX9Gh2XI7k03Jg6KycEHf2co0ZVciuUZos3FngNQ/2aRdmoXHnxU7TbDcEFHYuTk8OYEXAhE9jIUHNSkz+DcYfnRp8VBDvx6fJWbzUZSpJG2xERdPNyI6ndOSGI65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394262; c=relaxed/simple;
	bh=DOoxILEDtwIsFJn81TFSxT2jz8jgyG/F7CRV/1CU+y4=;
	h=In-Reply-To:Mime-Version:Cc:Message-Id:References:To:From:
	 Content-Type:Subject:Date; b=ihZWQB8JlFxYxGwYlk37FO2PgBdGmVE9IgfEeiwXgnOY8Ol77DeB/2GarG3CgkkCHw5pmPqjNN3CEyskFmQ/aqFdwrPI2OWkiYAnzavuFwWvn9qDQ/Mr1ClEXjo/v/fO8hqLyY/JallmwtmIzelT1ojrXQPDUv508/rd4ySBr7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KV3YTZP5; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KV3YTZP5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792394253; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=6wMu227B4xd1nmenvmIGVICqaK2mH0QFftyQxpbMflg=;
 b=KV3YTZP5BhPdSkH5AA+7IFwmQmLo2zAoDCGpqBwo0w05cMwsolYrqh8UcrLIYWz5AfKCVe
 L9JGU+9U6MSH5sAOfKf2sabmfOv/toDBWjT++oq2LmIQs+vX12MvLUPOkOP+NC0vOCP8RP
 /kFL+hUh6ZqZ91zyt89z811gpZqy05BW7hzx+MFjcJ2G+ErkGDDfM4p5dCxrAvrX/qfuIk
 DdmxBiWkihx0azz5dKUckfnZUdIMgjFveW9e95XiJHg6dfCZWkBkUrsSOLpKlf8uh4VvcC
 QObNnd6/nokgC1jcrMhuRSkiY7xnoEXUgrt113jQTh/oUqW/YCtEFPDfb9IB6A==
In-Reply-To: <fe58f891-7752-4691-9e67-b5a4a5c125a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad5c40b+7f478a+vger.kernel.org+zhengqi.arch@bytedance.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
X-Original-From: Qi Zheng <zhengqi.arch@bytedance.com>
Message-Id: <5dd986d1-b2f8-4f9a-b8f8-d70759603564@bytedance.com>
Content-Transfer-Encoding: 7bit
References: <cover.1792136742.git.zhengqi.arch@bytedance.com> <d145aeb815b318ddd4dd9058d20038acfe5dc1bb.1792136742.git.zhengqi.arch@bytedance.com> <fe58f891-7752-4691-9e67-b5a4a5c125a7@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	"Qi Zheng" <qi.zheng@linux.dev>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>
From: "Qi Zheng" <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm: hugetlb: avoid recursive CMA allocation during migration
Date: Mon, 19 Oct 2026 15:17:16 +0800

On 10/18/26 2:54 AM, Jose A. Perez de Azpillaga wrote:
> On 10/16/26 12:07 PM, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Contiguous allocation can migrate allocated HugeTLB folios or replace free
>> HugeTLB folios while holding a CMA allocation mutex. Allocating a
>> replacement through CMA would recurse into that allocation path once
>> non-gigantic HugeTLB pages can use CMA.
>>
>> Add a fresh allocation helper that bypasses CMA, and use it for free folio
>> replacement. Pass an explicit allow_cma argument through the migration
>> allocation API and disable it for MR_CONTIG_RANGE. Honor hugetlb_cma_only
>> by failing fresh allocation when the corresponding size requires CMA.
>>
>> The existing gigantic migration restriction is unchanged.
>>
>> Assisted-by: LLM
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> [snip]
> 
>>   /*
>> - * Common helper to allocate a fresh hugetlb folio. All specific allocators
>> - * should use this function to get new hugetlb folio
>> + * Common helper to allocate a fresh hugetlb folio.
> 
> couldn't allow_cma be passed down to alloc_fresh_hugetlb_folio() instead
> of adding a second copy of it, so this line can stay?

make sense, will do.

Thanks,
Qi

