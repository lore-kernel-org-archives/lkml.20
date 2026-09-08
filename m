Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B6155821D;
	Tue,  8 Sep 2026 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882299; cv=none; b=H6EpX9qk6w2dFH2/1V0WAxXGE1AxILbacXQYTXmX1ge+G9E6LqOI8BJB2BdSMjZf9m1fJNGQeoLNa4EiATXfCBI6x12/Pr4J0qLl+Dqln3AwioHwY3w1s9oRMMi2Zz63OhF1TosayDKn9pRwodJXSI750P5UVXtHTQj3M7VGxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882299; c=relaxed/simple;
	bh=GxMGnXYQeONzqdK6e7ly+Ryxj5+TnaiGzWadzF9ASqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GruLx8RQ6AI7L/IhKuDwFCz6m+oDHWzapY85vorL8E3zorXWdnDFs61QKcHNEwowYdH68FTqKxgIFtT6x7aeCQP7ht5zIEffOskufZdhrr4kWgKGzy5alWR32f6AH2Sz1DmBxynF4XcwNr+nk+US06u0UXdUwdpBMgiW/tcRbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LcW3d8Y9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LcW3d8Y9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FB551477;
	Tue,  8 Sep 2026 08:44:52 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C3123F7B4;
	Tue,  8 Sep 2026 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788882296; bh=GxMGnXYQeONzqdK6e7ly+Ryxj5+TnaiGzWadzF9ASqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LcW3d8Y9EnhgIb3Rlfc88EUwA1NZjt8vavC27AHR9l+iN18v85ITcyWSQsN/UPN4o
	 OLvqyDegHcjXhNJgmbuN3xh1uOIo2IZyl07gOyc3Vx/FuMblFAjLyZXrWSOGkxnxbI
	 JdSzw6d7rWBZnzC8KL9Vxzg9oHG/Ck26o9OgGRrM=
Message-ID: <a2a7d988-339c-45f6-b910-5d7dd893b45c@arm.com>
Date: Tue, 8 Sep 2026 16:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
 <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
 <649aef0d-f915-4288-b3b0-4092adb783b0@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <649aef0d-f915-4288-b3b0-4092adb783b0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 08/09/2026 16:35, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/7/26 3:44 AM, Ben Horgan wrote:
>> Hi Boris, Reinette,
>>
>> On 04/09/2026 18:36, Borislav Petkov wrote:
>>> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>>>> Lemme have a look.
>>>
>>> Sashiko has comments:
>>>
>>> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
>>>
>>> Please address them: if valid, fix them, if not, explain why they don't need
>>> to be fixed.
>>>
>>> Thx.
>>>
>>
>> Regarding the first Sashiko comment.
>>
>> The documentation change in patch 3 includes the sentence:
>>
>> "
>> The allocated bandwidth percentage is rounded up to the next control step available on the
>> hardware.
>> "
>>
>> Sashiko rightly objects to the "rounded up". For MPAM systems this can be up or down and we test in
>> test_mpam_resctrl.c:test_percent_to_max_rounding() that it isn't too biased to rounding one way or
>> the other.
>>
>> How about replacing "rounded up" with "rounded up or down" so that the sentence becomes:
>>
>> "
>> The allocated bandwidth percentage is rounded up or down to the next control step available on the
>> hardware.
>> "
>>
>> What do you think? Should I respin the series with this alteration?
> The change looks good to me since Intel always rounds up. By itself "rounded" may thus be deceiving.
> One concern is that "next" seems to accompany "round up" to reflect forward/upward movement.
> How about also replacing "next" with "nearest" or "closest"?

Ok, I'll go with "closest".

> 
> I think a respin would be most convenient to ensure the intended changes are made.

Will do.

Thanks,

Ben

> 
> Reinette

