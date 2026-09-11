Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4FA48822A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141448; cv=none; b=FOwotdOykkz61r1l9s+s2cY4W7O9R612CArLnwCZdV/wVnv99ilKx4X1jGw0P8M3kK06EYoeHkNk661D1S41/t/wQv3pq5i0UjukU6iAAi3Rc5pPkysd/Z79r0hkQL9UVmTe2QxhaQr0cJ0+Y73xAYhRsky5eR9+aBwFzpdoSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141448; c=relaxed/simple;
	bh=fzCywOuXZapvgXbJisLxGUxjg7quDE8T1G+e+rrgfso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwuwHJSZzTwXzYEiQuiAbRs2ywlS3VyTN775s/Gqcl7me9Os3+7HI3DGIsEbgDFrSmQko9MysrSjgMgvdBANI2TAObLTx5hIbOabzNYc4+MMCbB7hpx1BVJ8ObulrhM5yKahRF0i5ISz9J/yPRB46yYA+nJuUA+GtjB6E6DbpQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ba7nfsLs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ba7nfsLs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B31A016A3;
	Fri, 11 Sep 2026 08:43:54 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 646C83F8C6;
	Fri, 11 Sep 2026 08:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789141438; bh=fzCywOuXZapvgXbJisLxGUxjg7quDE8T1G+e+rrgfso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ba7nfsLsf9udLyWLtwHYGQ6o5inXoYPEmZiGq3Y7vI54Ltv0gX3HMlOdPMEzuD4cx
	 TUEHErrtrSlGdpTamnqntfNT/dwieaDyKsuqksakJD7ymF1mqSTbAne8mopeJdMPwr
	 EAqDFJ3Cd4aLv9hMC0pJNR+mK6XZxIwLwPTYDi3I=
Message-ID: <d4308fc1-fc33-40ef-8fcd-fd4df1a171e1@arm.com>
Date: Fri, 11 Sep 2026 16:43:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com,
 james.morse@arm.com, babu.moger@amd.com, fenghuay@nvidia.com, bp@alien8.de,
 linux-kernel@vger.kernel.org
References: <20260710112322.25516-1-ben.horgan@arm.com>
 <1ac7c71e-1c27-4d71-bea5-0aaebb16bc18@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <1ac7c71e-1c27-4d71-bea5-0aaebb16bc18@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 21/08/2026 00:25, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/10/26 4:23 AM, Ben Horgan wrote:
>> On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
>> multiplied by the number of PMGs. The maximum possible number of PARTIDs is
>> 0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
>> of the MPAM specification this can be large enough to consistently fail the
>> kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.
>>
>> Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
>> fall back to vmalloc().
>>
>> Fixes: 7168ae330e81 ("x86,fs/resctrl: Move the resctrl filesystem code to live in /fs/resctrl")
> 
> This is not the patch that added the original allocation but it is the patch
> that made it possible for MPAM architecture code to be added. At this point there
> is no MPAM support though, could commit 264c285999fc ("arm_mpam: resctrl: Add monitor
> initialisation and domain boilerplate") perhaps be more accurate to present when
> this change may theoretically be needed?

Ok, I can go with that as it's just a potential problem on MPAM.

Thanks,

Ben

> 
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
> Reinette

